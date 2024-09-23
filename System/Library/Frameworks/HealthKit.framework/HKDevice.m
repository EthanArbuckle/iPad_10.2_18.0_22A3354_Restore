@implementation HKDevice

+ (HKDevice)localDevice
{
  if (localDevice_onceToken != -1)
    dispatch_once(&localDevice_onceToken, &__block_literal_global_19);
  return (HKDevice *)(id)localDevice__localDevice;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)hardwareVersion
{
  return self->_hardwareVersion;
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (NSString)softwareVersion
{
  return self->_softwareVersion;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (NSString)UDIDeviceIdentifier
{
  return self->_UDIDeviceIdentifier;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = v3 ^ (2 * -[NSString hash](self->_manufacturer, "hash"));
  v5 = v4 ^ (4 * -[NSString hash](self->_model, "hash"));
  v6 = v5 ^ (8 * -[NSString hash](self->_hardwareVersion, "hash"));
  v7 = v6 ^ (16 * -[NSString hash](self->_firmwareVersion, "hash"));
  v8 = v7 ^ (32 * -[NSString hash](self->_softwareVersion, "hash"));
  v9 = v8 ^ (-[NSString hash](self->_localIdentifier, "hash") << 6);
  return v9 ^ (-[NSString hash](self->_UDIDeviceIdentifier, "hash") << 7);
}

- (HKDevice)initWithName:(NSString *)name manufacturer:(NSString *)manufacturer model:(NSString *)model hardwareVersion:(NSString *)hardwareVersion firmwareVersion:(NSString *)firmwareVersion softwareVersion:(NSString *)softwareVersion localIdentifier:(NSString *)localIdentifier UDIDeviceIdentifier:(NSString *)UDIDeviceIdentifier
{
  NSString *v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  HKDevice *v24;
  void (**v25)(void *, uint64_t, NSString *);
  uint64_t v26;
  _QWORD aBlock[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  objc_super v33;

  v16 = name;
  v17 = manufacturer;
  v18 = model;
  v19 = hardwareVersion;
  v20 = firmwareVersion;
  v21 = softwareVersion;
  v22 = localIdentifier;
  v23 = UDIDeviceIdentifier;
  v33.receiver = self;
  v33.super_class = (Class)HKDevice;
  v24 = -[HKDevice init](&v33, sel_init);
  if (v24)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __128__HKDevice_initWithName_manufacturer_model_hardwareVersion_firmwareVersion_softwareVersion_localIdentifier_UDIDeviceIdentifier___block_invoke;
    aBlock[3] = &unk_1E37EAE60;
    aBlock[4] = &v29;
    v25 = (void (**)(void *, uint64_t, NSString *))_Block_copy(aBlock);
    v25[2](v25, (uint64_t)&v24->_name, v16);
    v25[2](v25, (uint64_t)&v24->_manufacturer, v17);
    v25[2](v25, (uint64_t)&v24->_model, v18);
    v25[2](v25, (uint64_t)&v24->_hardwareVersion, v19);
    v25[2](v25, (uint64_t)&v24->_firmwareVersion, v20);
    v25[2](v25, (uint64_t)&v24->_softwareVersion, v21);
    v25[2](v25, (uint64_t)&v24->_localIdentifier, v22);
    v25[2](v25, (uint64_t)&v24->_UDIDeviceIdentifier, v23);
    if (HKProgramSDKAtLeast(0x7E00901FFFFFFFFLL, v26) && !*((_BYTE *)v30 + 24))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("At least one field of the device must be non-nil."));

    _Block_object_dispose(&v29, 8);
  }

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *name;
  NSString *v6;
  NSString *manufacturer;
  NSString *v8;
  NSString *model;
  NSString *v10;
  NSString *hardwareVersion;
  NSString *v12;
  NSString *firmwareVersion;
  NSString *v14;
  NSString *softwareVersion;
  NSString *v16;
  NSString *localIdentifier;
  NSString *v18;
  NSString *UDIDeviceIdentifier;
  NSString *v20;
  char v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_26;
  name = self->_name;
  v6 = (NSString *)v4[1];
  if (name != v6 && (!v6 || !-[NSString isEqualToString:](name, "isEqualToString:")))
    goto LABEL_26;
  manufacturer = self->_manufacturer;
  v8 = (NSString *)v4[2];
  if (manufacturer != v8 && (!v8 || !-[NSString isEqualToString:](manufacturer, "isEqualToString:")))
    goto LABEL_26;
  model = self->_model;
  v10 = (NSString *)v4[3];
  if (model != v10 && (!v10 || !-[NSString isEqualToString:](model, "isEqualToString:")))
    goto LABEL_26;
  hardwareVersion = self->_hardwareVersion;
  v12 = (NSString *)v4[4];
  if (hardwareVersion != v12 && (!v12 || !-[NSString isEqualToString:](hardwareVersion, "isEqualToString:")))
    goto LABEL_26;
  firmwareVersion = self->_firmwareVersion;
  v14 = (NSString *)v4[5];
  if (firmwareVersion != v14 && (!v14 || !-[NSString isEqualToString:](firmwareVersion, "isEqualToString:")))
    goto LABEL_26;
  softwareVersion = self->_softwareVersion;
  v16 = (NSString *)v4[6];
  if (softwareVersion != v16 && (!v16 || !-[NSString isEqualToString:](softwareVersion, "isEqualToString:")))
    goto LABEL_26;
  localIdentifier = self->_localIdentifier;
  v18 = (NSString *)v4[7];
  if (localIdentifier != v18 && (!v18 || !-[NSString isEqualToString:](localIdentifier, "isEqualToString:")))
    goto LABEL_26;
  UDIDeviceIdentifier = self->_UDIDeviceIdentifier;
  v20 = (NSString *)v4[8];
  if (UDIDeviceIdentifier == v20)
  {
    v21 = 1;
    goto LABEL_27;
  }
  if (v20)
    v21 = -[NSString isEqualToString:](UDIDeviceIdentifier, "isEqualToString:");
  else
LABEL_26:
    v21 = 0;
LABEL_27:

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_UDIDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_hardwareVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_manufacturer, CFSTR("manufacturer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_model, CFSTR("model"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hardwareVersion, CFSTR("hardVers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firmwareVersion, CFSTR("firmVers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_softwareVersion, CFSTR("softVers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localIdentifier, CFSTR("localID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_UDIDeviceIdentifier, CFSTR("FDAUDI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("date"));

}

void __23__HKDevice_localDevice__block_invoke()
{
  HKDevice *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v0 = [HKDevice alloc];
  +[_HKBehavior currentDeviceName](_HKBehavior, "currentDeviceName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKBehavior currentDeviceManufacturer](_HKBehavior, "currentDeviceManufacturer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKBehavior currentDeviceClass](_HKBehavior, "currentDeviceClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKBehavior currentDeviceProductType](_HKBehavior, "currentDeviceProductType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKBehavior currentOSVersion](_HKBehavior, "currentOSVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKDevice initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:](v0, "initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:", v1, v2, v3, v4, 0, v5, 0, 0);
  v7 = (void *)localDevice__localDevice;
  localDevice__localDevice = v6;

  _HKInitializeLogging();
  v8 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = localDevice__localDevice;
    _os_log_impl(&dword_19A0E6000, v8, OS_LOG_TYPE_DEFAULT, "Created localDevice: %@", buf, 0xCu);
  }
}

- (HKDevice)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKDevice;
  return -[HKDevice init](&v3, sel_init);
}

void __128__HKDevice_initWithName_manufacturer_model_hardwareVersion_firmwareVersion_softwareVersion_localIdentifier_UDIDeviceIdentifier___block_invoke(uint64_t a1, void **a2, void *a3)
{
  uint64_t v5;
  void *v6;

  objc_msgSend(a3, "hk_copyNonEmptyString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *a2;
  *a2 = (void *)v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= *a2 != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v7.receiver = self;
  v7.super_class = (Class)HKDevice;
  -[HKDevice description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@"), v4);

  if (self->_name)
    objc_msgSend(v5, "appendFormat:", CFSTR(", name:%@"), self->_name);
  if (self->_manufacturer)
    objc_msgSend(v5, "appendFormat:", CFSTR(", manufacturer:%@"), self->_manufacturer);
  if (self->_model)
    objc_msgSend(v5, "appendFormat:", CFSTR(", model:%@"), self->_model);
  if (self->_hardwareVersion)
    objc_msgSend(v5, "appendFormat:", CFSTR(", hardware:%@"), self->_hardwareVersion);
  if (self->_firmwareVersion)
    objc_msgSend(v5, "appendFormat:", CFSTR(", firmware:%@"), self->_firmwareVersion);
  if (self->_softwareVersion)
    objc_msgSend(v5, "appendFormat:", CFSTR(", software:%@"), self->_softwareVersion);
  if (self->_localIdentifier)
    objc_msgSend(v5, "appendFormat:", CFSTR(", localIdentifier:%@"), self->_localIdentifier);
  if (self->_UDIDeviceIdentifier)
    objc_msgSend(v5, "appendFormat:", CFSTR(", UDIDeviceIdentifier:%@"), self->_UDIDeviceIdentifier);
  if (self->_creationDate)
    objc_msgSend(v5, "appendFormat:", CFSTR(", creation date:%@"), self->_creationDate);
  objc_msgSend(v5, "appendString:", CFSTR(">"));
  return v5;
}

- (BOOL)_isAppleManufacturer
{
  void *v2;
  void *v3;
  char v4;

  -[HKDevice manufacturer](self, "manufacturer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKBehavior currentDeviceManufacturer](_HKBehavior, "currentDeviceManufacturer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (BOOL)_isAppleModel
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[HKDevice model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPhone")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[HKDevice model](self, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "hasPrefix:", CFSTR("iPad")) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[HKDevice model](self, "model");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "hasPrefix:", CFSTR("Watch")) & 1) != 0)
      {
        v4 = 1;
      }
      else
      {
        -[HKDevice model](self, "model");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v7, "hasPrefix:", CFSTR("RealityDevice"));

      }
    }

  }
  return v4;
}

- (BOOL)_isAppleHardwareVersion
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[HKDevice hardwareVersion](self, "hardwareVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPhone")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[HKDevice hardwareVersion](self, "hardwareVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "hasPrefix:", CFSTR("iPad")) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[HKDevice hardwareVersion](self, "hardwareVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "hasPrefix:", CFSTR("Watch")) & 1) != 0)
      {
        v4 = 1;
      }
      else
      {
        -[HKDevice hardwareVersion](self, "hardwareVersion");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v7, "hasPrefix:", CFSTR("RealityDevice"));

      }
    }

  }
  return v4;
}

- (void)_setFitnessMachineType:(unint64_t)a3
{
  __CFString *v3;

  if (a3 - 1 > 5)
    v3 = 0;
  else
    v3 = off_1E37EAE80[a3 - 1];
  -[HKDevice _setModel:](self, "_setModel:", v3);
}

- (unint64_t)_fitnessMachineType
{
  void *v2;
  unint64_t v3;

  -[HKDevice model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.health.fitnessmachinemodel.treadmill")) & 1) != 0)
  {
    v3 = 1;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.health.fitnessmachinemodel.crosstrainer")) & 1) != 0)
  {
    v3 = 2;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.health.fitnessmachinemodel.stepclimber")) & 1) != 0)
  {
    v3 = 3;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.health.fitnessmachinemodel.stairclimber")) & 1) != 0)
  {
    v3 = 4;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.health.fitnessmachinemodel.indoorbike")) & 1) != 0)
  {
    v3 = 6;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.health.fitnessmachinemodel.rower")))
  {
    v3 = 5;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_isConnectedGymDevice
{
  void *v2;
  char v3;

  -[HKDevice localIdentifier](self, "localIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.healthd.fitnessmachine"));

  return v3;
}

- (NSString)_connectedGymDeviceTypeName
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (-[HKDevice _isConnectedGymDevice](self, "_isConnectedGymDevice"))
  {
    switch(-[HKDevice _fitnessMachineType](self, "_fitnessMachineType"))
    {
      case 1uLL:
        HKHealthKitFrameworkBundle();
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v3;
        v5 = CFSTR("CONNECTED_GYM_TREADMILL");
        break;
      case 2uLL:
        HKHealthKitFrameworkBundle();
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v3;
        v5 = CFSTR("CONNECTED_GYM_CROSSTRAINER");
        break;
      case 3uLL:
      case 4uLL:
        HKHealthKitFrameworkBundle();
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v3;
        v5 = CFSTR("CONNECTED_GYM_STAIRSTEPPER");
        break;
      case 5uLL:
        HKHealthKitFrameworkBundle();
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v3;
        v5 = CFSTR("CONNECTED_GYM_ROWER");
        break;
      case 6uLL:
        HKHealthKitFrameworkBundle();
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v3;
        v5 = CFSTR("CONNECTED_GYM_INDOORBIKE");
        break;
      default:
        goto LABEL_4;
    }
    objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E37FD4C0, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    v6 = 0;
  }
  return (NSString *)v6;
}

- (NSString)_connectedGymDeviceFullName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[HKDevice _isConnectedGymDevice](self, "_isConnectedGymDevice")
    && (-[HKDevice manufacturer](self, "manufacturer"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[HKDevice _connectedGymDeviceTypeName](self, "_connectedGymDeviceTypeName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      HKHealthKitFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CONNECTED_GYM_DEVICE_FORMAT"), &stru_1E37FD4C0, CFSTR("Localizable"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDevice manufacturer](self, "manufacturer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", v7, v8, v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[HKDevice manufacturer](self, "manufacturer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v9 = 0;
  }
  return (NSString *)v9;
}

- (NSString)_displayName
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  if (!-[HKDevice _isConnectedGymDevice](self, "_isConnectedGymDevice")
    || (-[HKDevice manufacturer](self, "manufacturer"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    -[HKDevice name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      -[HKDevice name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return (NSString *)v6;
    }
    -[HKDevice model](self, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      -[HKDevice model](self, "model");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return (NSString *)v6;
    }
LABEL_9:
    -[HKDevice manufacturer](self, "manufacturer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSString *)v6;
  }
  -[HKDevice _connectedGymDeviceFullName](self, "_connectedGymDeviceFullName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
    goto LABEL_9;
  -[HKDevice _connectedGymDeviceFullName](self, "_connectedGymDeviceFullName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSString *)v6;
}

- (void)_setName:(id)a3
{
  NSString *v4;
  NSString *name;

  objc_msgSend(a3, "hk_copyNonEmptyString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v4;

}

- (void)_setManufacturer:(id)a3
{
  NSString *v4;
  NSString *manufacturer;

  objc_msgSend(a3, "hk_copyNonEmptyString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  manufacturer = self->_manufacturer;
  self->_manufacturer = v4;

}

- (void)_setModel:(id)a3
{
  NSString *v4;
  NSString *model;

  objc_msgSend(a3, "hk_copyNonEmptyString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  model = self->_model;
  self->_model = v4;

}

- (void)_setHardwareVersion:(id)a3
{
  NSString *v4;
  NSString *hardwareVersion;

  objc_msgSend(a3, "hk_copyNonEmptyString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  hardwareVersion = self->_hardwareVersion;
  self->_hardwareVersion = v4;

}

- (void)_setFirmwareVersion:(id)a3
{
  NSString *v4;
  NSString *firmwareVersion;

  objc_msgSend(a3, "hk_copyNonEmptyString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  firmwareVersion = self->_firmwareVersion;
  self->_firmwareVersion = v4;

}

- (void)_setSoftwareVersion:(id)a3
{
  NSString *v4;
  NSString *softwareVersion;

  objc_msgSend(a3, "hk_copyNonEmptyString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  softwareVersion = self->_softwareVersion;
  self->_softwareVersion = v4;

}

- (void)_setLocalIdentifier:(id)a3
{
  NSString *v4;
  NSString *localIdentifier;

  objc_msgSend(a3, "hk_copyNonEmptyString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  localIdentifier = self->_localIdentifier;
  self->_localIdentifier = v4;

}

- (void)_setUDIDeviceIdentifier:(id)a3
{
  NSString *v4;
  NSString *UDIDeviceIdentifier;

  objc_msgSend(a3, "hk_copyNonEmptyString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  UDIDeviceIdentifier = self->_UDIDeviceIdentifier;
  self->_UDIDeviceIdentifier = v4;

}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)_setCreationDate:(id)a3
{
  NSDate *v4;
  NSDate *creationDate;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  creationDate = self->_creationDate;
  self->_creationDate = v4;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKDevice)initWithCoder:(id)a3
{
  id v4;
  HKDevice *v5;
  void *v6;
  uint64_t v7;
  NSString *name;
  void *v9;
  uint64_t v10;
  NSString *manufacturer;
  void *v12;
  uint64_t v13;
  NSString *model;
  void *v15;
  uint64_t v16;
  NSString *hardwareVersion;
  void *v18;
  uint64_t v19;
  NSString *firmwareVersion;
  void *v21;
  uint64_t v22;
  NSString *softwareVersion;
  void *v24;
  uint64_t v25;
  NSString *localIdentifier;
  void *v27;
  uint64_t v28;
  NSString *UDIDeviceIdentifier;
  uint64_t v30;
  NSDate *creationDate;

  v4 = a3;
  v5 = -[HKDevice _init](self, "_init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hk_copyNonEmptyString");
    v7 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manufacturer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_copyNonEmptyString");
    v10 = objc_claimAutoreleasedReturnValue();
    manufacturer = v5->_manufacturer;
    v5->_manufacturer = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("model"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hk_copyNonEmptyString");
    v13 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hardVers"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hk_copyNonEmptyString");
    v16 = objc_claimAutoreleasedReturnValue();
    hardwareVersion = v5->_hardwareVersion;
    v5->_hardwareVersion = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firmVers"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hk_copyNonEmptyString");
    v19 = objc_claimAutoreleasedReturnValue();
    firmwareVersion = v5->_firmwareVersion;
    v5->_firmwareVersion = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("softVers"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hk_copyNonEmptyString");
    v22 = objc_claimAutoreleasedReturnValue();
    softwareVersion = v5->_softwareVersion;
    v5->_softwareVersion = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "hk_copyNonEmptyString");
    v25 = objc_claimAutoreleasedReturnValue();
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FDAUDI"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "hk_copyNonEmptyString");
    v28 = objc_claimAutoreleasedReturnValue();
    UDIDeviceIdentifier = v5->_UDIDeviceIdentifier;
    v5->_UDIDeviceIdentifier = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v30 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v30;

  }
  return v5;
}

@end
