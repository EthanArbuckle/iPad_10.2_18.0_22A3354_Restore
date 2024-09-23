@implementation HKACAccountDevice

- (HKACAccountDevice)initWithDevice:(id)a3
{
  id v4;
  HKACAccountDevice *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *swVersion;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKACAccountDevice;
  v5 = -[HKACAccountDevice init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    -[HKACAccountDevice setModel:](v5, "setModel:", v7);

    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    -[HKACAccountDevice setDeviceName:](v5, "setDeviceName:", v9);

    objc_msgSend(v4, "swVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(";"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = objc_claimAutoreleasedReturnValue();
    swVersion = v5->_swVersion;
    v5->_swVersion = (NSString *)v12;

  }
  return v5;
}

- (HKACAccountDevice)initWithPairedDevice:(id)a3
{
  id v4;
  HKACAccountDevice *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKACAccountDevice;
  v5 = -[HKACAccountDevice init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D51738]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKACAccountDevice setModel:](v5, "setModel:", v6);

    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D51688]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKACAccountDevice setDeviceName:](v5, "setDeviceName:", v7);

    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D51778]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKACAccountDevice setSwVersion:](v5, "setSwVersion:", v8);

  }
  return v5;
}

- (id)deviceType
{
  void *v3;
  char v4;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  int v11;

  -[HKACAccountDevice model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("iPhone"));

  if ((v4 & 1) != 0)
    return &unk_1E6CE0140;
  -[HKACAccountDevice model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("iPad"));

  if ((v7 & 1) != 0)
    return &unk_1E6CE0158;
  -[HKACAccountDevice model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("Watch"));

  if ((v9 & 1) != 0)
    return &unk_1E6CE0170;
  -[HKACAccountDevice model](self, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("RealityDevice"));

  if (v11)
    return &unk_1E6CE0188;
  else
    return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HKACAccountDevice deviceName](self, "deviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKACAccountDevice swVersion](self, "swVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKACAccountDevice model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Name: %@, OS: %@, Model: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HKACAccountDevice *v4;
  HKACAccountDevice *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;

  v4 = (HKACAccountDevice *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HKACAccountDevice model](v5, "model");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKACAccountDevice model](self, "model");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HKACAccountDevice model](self, "model");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_19;
        v10 = (void *)v9;
        -[HKACAccountDevice model](v5, "model");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKACAccountDevice model](self, "model");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if (!v13)
          goto LABEL_20;
      }
      -[HKACAccountDevice deviceName](v5, "deviceName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKACAccountDevice deviceName](self, "deviceName");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v15)
      {

      }
      else
      {
        v8 = (void *)v15;
        -[HKACAccountDevice deviceName](self, "deviceName");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_19;
        v17 = (void *)v16;
        -[HKACAccountDevice deviceName](v5, "deviceName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKACAccountDevice deviceName](self, "deviceName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqualToString:", v19);

        if (!v20)
          goto LABEL_20;
      }
      -[HKACAccountDevice swVersion](v5, "swVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKACAccountDevice swVersion](self, "swVersion");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v21)
      {

LABEL_24:
        v14 = 1;
        goto LABEL_21;
      }
      v8 = (void *)v21;
      -[HKACAccountDevice swVersion](self, "swVersion");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        -[HKACAccountDevice swVersion](v5, "swVersion");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKACAccountDevice swVersion](self, "swVersion");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "isEqualToString:", v25);

        if ((v26 & 1) != 0)
          goto LABEL_24;
LABEL_20:
        v14 = 0;
LABEL_21:

        goto LABEL_22;
      }
LABEL_19:

      goto LABEL_20;
    }
    v14 = 0;
  }
LABEL_22:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_model, "hash");
  v4 = -[NSString hash](self->_deviceName, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_swVersion, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *model;
  id v5;

  model = self->_model;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", model, CFSTR("Model"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceName, CFSTR("DeviceName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_swVersion, CFSTR("SWVersion"));

}

- (HKACAccountDevice)initWithCoder:(id)a3
{
  id v4;
  HKACAccountDevice *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKACAccountDevice;
  v5 = -[HKACAccountDevice init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Model"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKACAccountDevice setModel:](v5, "setModel:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKACAccountDevice setDeviceName:](v5, "setDeviceName:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SWVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKACAccountDevice setSwVersion:](v5, "setSwVersion:", v8);

  }
  return v5;
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)swVersion
{
  return self->_swVersion;
}

- (void)setSwVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swVersion, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (id)medicationScheduleCompatibilityVersion
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v11 = 0uLL;
  v12 = 0;
  -[HKACAccountDevice swVersion](self, "swVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKNSOperatingSystemVersionFromString();

  -[HKACAccountDevice deviceType](self, "deviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
    v9 = v11;
    v10 = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HKMedicationScheduleCompatibilityVersionForOSVersion((uint64_t *)&v9, v6));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isCompatibleWithSchedule:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  -[HKACAccountDevice medicationScheduleCompatibilityVersion](self, "medicationScheduleCompatibilityVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "integerValue");
    v8 = v7 >= objc_msgSend(v4, "compatibilityRange");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
