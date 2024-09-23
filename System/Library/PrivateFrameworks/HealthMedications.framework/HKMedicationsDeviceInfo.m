@implementation HKMedicationsDeviceInfo

- (HKMedicationsDeviceInfo)initWithHardwareIdentifier:(id)a3 name:(id)a4 model:(id)a5 operatingSystemVersion:(id *)a6 scheduleCompatibilityVersion:(int64_t)a7 localDevice:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  HKMedicationsDeviceInfo *v18;
  HKMedicationsDeviceInfo *v19;
  __int128 v20;
  void *v22;
  objc_super v24;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationsDeviceInfo.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("hardwareIdentifier != nil"));

  }
  v24.receiver = self;
  v24.super_class = (Class)HKMedicationsDeviceInfo;
  v18 = -[HKMedicationsDeviceInfo init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_hardwareIdentifier, a3);
    objc_storeStrong((id *)&v19->_name, a4);
    objc_storeStrong((id *)&v19->_model, a5);
    v20 = *(_OWORD *)&a6->var0;
    v19->_operatingSystemVersion.patchVersion = a6->var2;
    *(_OWORD *)&v19->_operatingSystemVersion.majorVersion = v20;
    v19->_scheduleCompatibilityVersion = a7;
    v19->_localDevice = a8;
  }

  return v19;
}

- (id)_initLocalDeviceWithName:(id)a3 model:(id)a4 operatingSystemVersion:(id *)a5 scheduleCompatibilityVersion:(int64_t)a6
{
  id v11;
  id v12;
  HKMedicationsDeviceInfo *v13;
  HKMedicationsDeviceInfo *v14;
  __int128 v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HKMedicationsDeviceInfo;
  v13 = -[HKMedicationsDeviceInfo init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a3);
    objc_storeStrong((id *)&v14->_model, a4);
    v15 = *(_OWORD *)&a5->var0;
    v14->_operatingSystemVersion.patchVersion = a5->var2;
    *(_OWORD *)&v14->_operatingSystemVersion.majorVersion = v15;
    v14->_scheduleCompatibilityVersion = a6;
    v14->_localDevice = 1;
  }

  return v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *name;
  NSString *model;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  name = self->_name;
  model = self->_model;
  HKNSOperatingSystemVersionString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_scheduleCompatibilityVersion);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKStringFromBool();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_hardwareIdentifier, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ name:%@, model:%@, operating system:%@, compatibility version: %@, localDevice: %@, hardware identifier: %@"), v4, name, model, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isCompatibleWithSchedule:(id)a3
{
  int64_t scheduleCompatibilityVersion;

  scheduleCompatibilityVersion = self->_scheduleCompatibilityVersion;
  return scheduleCompatibilityVersion >= objc_msgSend(a3, "compatibilityRange");
}

- (id)filterOutCompatibleSchedules:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__HKMedicationsDeviceInfo_filterOutCompatibleSchedules___block_invoke;
  v4[3] = &unk_1E6CD5C18;
  v4[4] = self;
  objc_msgSend(a3, "hk_filter:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __56__HKMedicationsDeviceInfo_filterOutCompatibleSchedules___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isCompatibleWithSchedule:", a2) ^ 1;
}

- (void)_setHardwareIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareIdentifier, a3);
}

- (BOOL)isEqual:(id)a3
{
  HKMedicationsDeviceInfo *v4;
  HKMedicationsDeviceInfo *v5;
  NSUUID *hardwareIdentifier;
  NSUUID *v7;
  NSString *name;
  NSString *v9;
  NSString *model;
  NSString *v11;
  BOOL v12;

  v4 = (HKMedicationsDeviceInfo *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      hardwareIdentifier = self->_hardwareIdentifier;
      v7 = v5->_hardwareIdentifier;
      v12 = (hardwareIdentifier == v7 || v7 && -[NSUUID isEqual:](hardwareIdentifier, "isEqual:"))
         && ((name = self->_name, v9 = v5->_name, name == v9)
          || v9 && -[NSString isEqual:](name, "isEqual:"))
         && ((model = self->_model, v11 = v5->_model, model == v11)
          || v11 && -[NSString isEqual:](model, "isEqual:"))
         && HKNSOperatingSystemVersionsEqual()
         && self->_scheduleCompatibilityVersion == v5->_scheduleCompatibilityVersion
         && self->_localDevice == v5->_localDevice;

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  v3 = -[NSUUID hash](self->_hardwareIdentifier, "hash");
  v4 = -[NSString hash](self->_name, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_model, "hash") ^ self->_operatingSystemVersion.majorVersion ^ self->_operatingSystemVersion.minorVersion ^ self->_operatingSystemVersion.patchVersion ^ self->_localDevice ^ (100 * self->_scheduleCompatibilityVersion);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *hardwareIdentifier;
  id v5;
  void *v6;
  $A44FF20282FB96BA82CF1B0FF6945C38 operatingSystemVersion;

  hardwareIdentifier = self->_hardwareIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", hardwareIdentifier, CFSTR("HardwareIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("Name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_model, CFSTR("Model"));
  operatingSystemVersion = self->_operatingSystemVersion;
  HKNSOperatingSystemVersionString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("OperatingSystemVersion"), *(_OWORD *)&operatingSystemVersion.majorVersion, operatingSystemVersion.patchVersion);

  objc_msgSend(v5, "encodeInteger:forKey:", self->_scheduleCompatibilityVersion, CFSTR("ScheduleCompatibilityVersion"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_localDevice, CFSTR("LocalDevice"));

}

- (HKMedicationsDeviceInfo)initWithCoder:(id)a3
{
  id v5;
  HKMedicationsDeviceInfo *v6;
  uint64_t v7;
  NSUUID *hardwareIdentifier;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSString *model;
  void *v13;
  void *v15;
  __int128 v16;
  int64_t v17;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKMedicationsDeviceInfo;
  v6 = -[HKMedicationsDeviceInfo init](&v18, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HardwareIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    hardwareIdentifier = v6->_hardwareIdentifier;
    v6->_hardwareIdentifier = (NSUUID *)v7;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Name"));
    v9 = objc_claimAutoreleasedReturnValue();
    name = v6->_name;
    v6->_name = (NSString *)v9;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Model"));
    v11 = objc_claimAutoreleasedReturnValue();
    model = v6->_model;
    v6->_model = (NSString *)v11;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OperatingSystemVersion"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("HKMedicationsDeviceInfo.m"), 144, CFSTR("Operating system version should not be nil"));

    }
    HKNSOperatingSystemVersionFromString();
    *(_OWORD *)&v6->_operatingSystemVersion.majorVersion = v16;
    v6->_operatingSystemVersion.patchVersion = v17;
    v6->_scheduleCompatibilityVersion = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("ScheduleCompatibilityVersion"));
    v6->_localDevice = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("LocalDevice"));

  }
  return v6;
}

- (NSUUID)hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)model
{
  return self->_model;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[2];
  return self;
}

- (int64_t)scheduleCompatibilityVersion
{
  return self->_scheduleCompatibilityVersion;
}

- (BOOL)isLocalDevice
{
  return self->_localDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
}

@end
