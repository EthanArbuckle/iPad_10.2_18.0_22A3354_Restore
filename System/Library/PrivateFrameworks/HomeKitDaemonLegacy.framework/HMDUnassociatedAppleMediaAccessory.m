@implementation HMDUnassociatedAppleMediaAccessory

- (id)modelForChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5
{
  return +[HMDAppleMediaAccessoryModel appleMediaAccessoryModelWithChangeType:uuid:parentUUID:](HMDAppleMediaAccessoryModel, "appleMediaAccessoryModelWithChangeType:uuid:parentUUID:", a3, a4, a5);
}

- (HMDUnassociatedAppleMediaAccessory)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 productColor:(int64_t)a6 idsIdentifierString:(id)a7 rawAccessoryCapabilities:(id)a8 rawResidentCapabilities:(id)a9 messageDispatcher:(id)a10
{
  return -[HMDUnassociatedAppleMediaAccessory initWithIdentifier:name:category:requiredPairingCapabilities:minimumPairingSoftware:productColor:idsIdentifierString:rawAccessoryCapabilities:rawResidentCapabilities:messageDispatcher:](self, "initWithIdentifier:name:category:requiredPairingCapabilities:minimumPairingSoftware:productColor:idsIdentifierString:rawAccessoryCapabilities:rawResidentCapabilities:messageDispatcher:", a3, a4, a5, 1, 0, a6, a7, a8, a9, a10);
}

- (HMDUnassociatedAppleMediaAccessory)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 requiredPairingCapabilities:(unint64_t)a6 minimumPairingSoftware:(id)a7 productColor:(int64_t)a8 idsIdentifierString:(id)a9 rawAccessoryCapabilities:(id)a10 rawResidentCapabilities:(id)a11 messageDispatcher:(id)a12
{
  id v16;
  id v17;
  HMDUnassociatedAppleMediaAccessory *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSUUID *uuid;
  HMDCapabilityFlags *v24;
  HMDCapabilityFlags *requiredPairingCapabilities;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v16 = a3;
  v31 = a7;
  v30 = a9;
  v29 = a10;
  v17 = a11;
  v32.receiver = self;
  v32.super_class = (Class)HMDUnassociatedAppleMediaAccessory;
  v18 = -[HMDUnassociatedMediaAccessory initWithIdentifier:name:category:messageDispatcher:](&v32, sel_initWithIdentifier_name_category_messageDispatcher_, v16, a4, a5, a12);
  if (v18)
  {
    v19 = objc_alloc(MEMORY[0x1E0CB3A28]);
    +[HMDUnassociatedAppleMediaAccessory namespace](HMDUnassociatedAppleMediaAccessory, "namespace");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dataUsingEncoding:", 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "initWithNamespace:data:", v20, v21);
    uuid = v18->super.super._uuid;
    v18->super.super._uuid = (NSUUID *)v22;

    v24 = -[HMDCapabilityFlags initWithCapabilityOptions:]([HMDCapabilityFlags alloc], "initWithCapabilityOptions:", a6);
    requiredPairingCapabilities = v18->_requiredPairingCapabilities;
    v18->_requiredPairingCapabilities = v24;

    objc_storeStrong((id *)&v18->_minimumRequiredPairingSoftwareVersion, a7);
    v18->_productColor = a8;
    objc_storeStrong((id *)&v18->_idsIdentifierString, a9);
    objc_storeStrong((id *)&v18->_rawResidentCapabilities, a11);
    objc_storeStrong((id *)&v18->_rawAccessoryCapabilities, a10);
  }

  return v18;
}

- (id)descriptionWithPointer:(BOOL)a3 additionalDescription:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[HMDUnassociatedAppleMediaAccessory softwareVersion](self, "softwareVersion", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAppleMediaAccessory minimumRequiredPairingSoftwareVersion](self, "minimumRequiredPairingSoftwareVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAppleMediaAccessory requiredPairingCapabilities](self, "requiredPairingCapabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAppleMediaAccessory idsIdentifierString](self, "idsIdentifierString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAppleMediaAccessory device](self, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUnassociatedAppleMediaAccessory supportedStereoPairVersions](self, "supportedStereoPairVersions"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("softwareVersion = %@, pairingRequiredSoftwareVersion = %@, requiredPairingCapabilities = %@, idsIdentifier = %@, Device = %@, supportedStereoPairVersions = %@"), v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)HMDUnassociatedAppleMediaAccessory;
  -[HMDUnassociatedAccessory descriptionWithPointer:additionalDescription:](&v16, sel_descriptionWithPointer_additionalDescription_, v4, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)model
{
  NSString *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_model;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setModel:(id)a3
{
  id v4;
  NSString *v5;
  NSString *model;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    os_unfair_recursive_lock_lock_with_options();
    v5 = (NSString *)objc_msgSend(v7, "copy");
    model = self->_model;
    self->_model = v5;

    os_unfair_recursive_lock_unlock();
    v4 = v7;
  }

}

- (NSString)serialNumber
{
  NSString *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_serialNumber;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setSerialNumber:(id)a3
{
  id v4;
  NSString *v5;
  NSString *serialNumber;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    os_unfair_recursive_lock_lock_with_options();
    if ((HMFEqualObjects() & 1) == 0)
    {
      v5 = (NSString *)objc_msgSend(v7, "copy");
      serialNumber = self->_serialNumber;
      self->_serialNumber = v5;

    }
    os_unfair_recursive_lock_unlock();
    v4 = v7;
  }

}

- (HMFSoftwareVersion)softwareVersion
{
  HMFSoftwareVersion *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_softwareVersion;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setSoftwareVersion:(id)a3
{
  id v5;
  HMFSoftwareVersion **p_softwareVersion;
  id v7;

  v5 = a3;
  if (v5)
  {
    v7 = v5;
    os_unfair_recursive_lock_lock_with_options();
    p_softwareVersion = &self->_softwareVersion;
    if ((HMFEqualObjects() & 1) == 0)
      objc_storeStrong((id *)p_softwareVersion, a3);
    os_unfair_recursive_lock_unlock();
    v5 = v7;
  }

}

- (HMDDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_storeStrong((id *)&self->_device, a3);
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAccessory setName:](self, "setName:", v6);

  v7 = (void *)MEMORY[0x1E0CBA1D8];
  objc_msgSend(v5, "productInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "categoryForProductInfo:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDUnassociatedAccessory setCategory:](self, "setCategory:", v8);
}

- (id)addTransactionForHome:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)HMDUnassociatedAppleMediaAccessory;
  -[HMDUnassociatedMediaAccessory addTransactionForHome:](&v27, sel_addTransactionForHome_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDUnassociatedAppleMediaAccessory device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDeviceUUID:", v10);

      objc_msgSend(v6, "setDevice:", v8);
    }
    -[HMDUnassociatedAccessory category](self, "category");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "categoryType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB7A58]);

    v14 = (void *)MEMORY[0x1E0CBA1D8];
    -[HMDUnassociatedAccessory category](self, "category");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "categoryIdentifierForCategory:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInitialCategoryIdentifier:", v16);

    -[HMDUnassociatedAppleMediaAccessory model](self, "model");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setModel:", v17);

    -[HMDUnassociatedAppleMediaAccessory model](self, "model");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInitialModel:", v18);

    -[HMDUnassociatedAppleMediaAccessory serialNumber](self, "serialNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSerialNumber:", v19);

    -[HMDUnassociatedAppleMediaAccessory softwareVersion](self, "softwareVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSoftwareVersion:", v20);

    if (v13)
    {
      if (-[HMDUnassociatedAppleMediaAccessory supportedStereoPairVersions](self, "supportedStereoPairVersions"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUnassociatedAppleMediaAccessory supportedStereoPairVersions](self, "supportedStereoPairVersions"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setSupportedStereoPairVersions:", v21);

      }
      else
      {
        objc_msgSend(v6, "setSupportedStereoPairVersions:", &unk_1E8B32CB8);
      }
    }
    objc_msgSend(v6, "setManufacturer:", CFSTR("Apple Inc."));
    objc_msgSend(v6, "setInitialManufacturer:", CFSTR("Apple Inc."));
    v22 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[HMDUnassociatedAppleMediaAccessory idsIdentifierString](self, "idsIdentifierString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithUUIDString:", v23);

    if (v24)
      objc_msgSend(v6, "setIdsIdentifier:", v24);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDUnassociatedAppleMediaAccessory productColor](self, "productColor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProductColor:", v25);

  }
  return v4;
}

- (BOOL)canPairGivenCapabilities:(unint64_t)a3
{
  void *v5;
  HMDCapabilityFlags *v6;
  void *v7;
  BOOL v8;
  void *v10;
  HMDUnassociatedAppleMediaAccessory *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMDUnassociatedAppleMediaAccessory requiredPairingCapabilities](self, "requiredPairingCapabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[HMDCapabilityFlags initWithCapabilityOptions:]([HMDCapabilityFlags alloc], "initWithCapabilityOptions:", a3);
    -[HMDUnassociatedAppleMediaAccessory requiredPairingCapabilities](self, "requiredPairingCapabilities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMDCapabilityFlags hasCapabilities:](v6, "hasCapabilities:", v7);

    return v8;
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@No required capabilities found.", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    return 1;
  }
}

- (id)dumpDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3940];
  -[HMDUnassociatedAccessory name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAccessory uuid](self, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAccessory category](self, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAccessory identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAppleMediaAccessory device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAppleMediaAccessory minimumRequiredPairingSoftwareVersion](self, "minimumRequiredPairingSoftwareVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAppleMediaAccessory requiredPairingCapabilities](self, "requiredPairingCapabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAppleMediaAccessory productColor](self, "productColor");
  HMFProductColorToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAppleMediaAccessory idsIdentifierString](self, "idsIdentifierString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("WHA Accessory '%@': uuid %@  category %@ identifier %@  device: %@, requiredSoftwareVersion:%@, requiredPairingCapabilities: %@, productColor: %@, idsIdentifier: %@"), v3, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setObject:forKey:", v12, *MEMORY[0x1E0D27F80]);
  return v16;
}

- (HMDUnassociatedAppleMediaAccessory)initWithCoder:(id)a3
{
  id v4;
  HMDUnassociatedAppleMediaAccessory *v5;
  uint64_t v6;
  NSString *model;
  uint64_t v8;
  NSString *serialNumber;
  uint64_t v10;
  HMFSoftwareVersion *softwareVersion;
  uint64_t v12;
  HMDDevice *device;
  void *v14;
  uint64_t v15;
  HMDHomeKitVersion *minimumRequiredPairingSoftwareVersion;
  uint64_t v17;
  HMDCapabilityFlags *requiredPairingCapabilities;
  uint64_t v19;
  NSString *idsIdentifierString;
  uint64_t v21;
  NSData *rawResidentCapabilities;
  uint64_t v23;
  NSData *rawAccessoryCapabilities;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HMDUnassociatedAppleMediaAccessory;
  v5 = -[HMDUnassociatedAccessory initWithCoder:](&v26, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.model"));
    v6 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.serialNumber"));
    v8 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB8030]);
    v10 = objc_claimAutoreleasedReturnValue();
    softwareVersion = v5->_softwareVersion;
    v5->_softwareVersion = (HMFSoftwareVersion *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.device"));
    v12 = objc_claimAutoreleasedReturnValue();
    device = v5->_device;
    v5->_device = (HMDDevice *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB9DE0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportedStereoPairVersions = objc_msgSend(v14, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMD.un.psv"));
    v15 = objc_claimAutoreleasedReturnValue();
    minimumRequiredPairingSoftwareVersion = v5->_minimumRequiredPairingSoftwareVersion;
    v5->_minimumRequiredPairingSoftwareVersion = (HMDHomeKitVersion *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMD.un.pcap"));
    v17 = objc_claimAutoreleasedReturnValue();
    requiredPairingCapabilities = v5->_requiredPairingCapabilities;
    v5->_requiredPairingCapabilities = (HMDCapabilityFlags *)v17;

    v5->_variant = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMD.un.var"));
    v5->_productColor = objc_msgSend(v4, "decodeIntegerForKey:", *MEMORY[0x1E0CB98C8]);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMD.un.idsId"));
    v19 = objc_claimAutoreleasedReturnValue();
    idsIdentifierString = v5->_idsIdentifierString;
    v5->_idsIdentifierString = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMD.un.recap"));
    v21 = objc_claimAutoreleasedReturnValue();
    rawResidentCapabilities = v5->_rawResidentCapabilities;
    v5->_rawResidentCapabilities = (NSData *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMD.un.accap"));
    v23 = objc_claimAutoreleasedReturnValue();
    rawAccessoryCapabilities = v5->_rawAccessoryCapabilities;
    v5->_rawAccessoryCapabilities = (NSData *)v23;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HMDUnassociatedAppleMediaAccessory;
  -[HMDUnassociatedAccessory encodeWithCoder:](&v18, sel_encodeWithCoder_, v4);
  -[HMDUnassociatedAppleMediaAccessory model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.model"));

  -[HMDUnassociatedAppleMediaAccessory serialNumber](self, "serialNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HM.serialNumber"));

  -[HMDUnassociatedAppleMediaAccessory softwareVersion](self, "softwareVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, *MEMORY[0x1E0CB8030]);

  -[HMDUnassociatedAppleMediaAccessory device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HM.device"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDUnassociatedAppleMediaAccessory supportedStereoPairVersions](self, "supportedStereoPairVersions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, *MEMORY[0x1E0CB9DE0]);

  -[HMDUnassociatedAppleMediaAccessory minimumRequiredPairingSoftwareVersion](self, "minimumRequiredPairingSoftwareVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDUnassociatedAppleMediaAccessory minimumRequiredPairingSoftwareVersion](self, "minimumRequiredPairingSoftwareVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("HMD.un.psv"));

  }
  -[HMDUnassociatedAppleMediaAccessory requiredPairingCapabilities](self, "requiredPairingCapabilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("HMD.un.pcap"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDUnassociatedAppleMediaAccessory variant](self, "variant"), CFSTR("HMD.un.var"));
  v13 = -[HMDUnassociatedAppleMediaAccessory productColor](self, "productColor");
  objc_msgSend(v4, "encodeInteger:forKey:", v13, *MEMORY[0x1E0CB98C8]);
  -[HMDUnassociatedAppleMediaAccessory idsIdentifierString](self, "idsIdentifierString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("HMD.un.idsId"));

  -[HMDUnassociatedAppleMediaAccessory rawResidentCapabilities](self, "rawResidentCapabilities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("HMD.un.recap"));

  -[HMDUnassociatedAppleMediaAccessory rawAccessoryCapabilities](self, "rawAccessoryCapabilities");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("HMD.un.accap"));

  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    v17 = -[HMDUnassociatedAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory");
    objc_msgSend(v4, "encodeBool:forKey:", v17, *MEMORY[0x1E0CB7B98]);
  }

}

- (int64_t)productColor
{
  return self->_productColor;
}

- (BOOL)isCurrentAccessory
{
  return self->_currentAccessory;
}

- (void)setCurrentAccessory:(BOOL)a3
{
  self->_currentAccessory = a3;
}

- (unint64_t)supportedStereoPairVersions
{
  return self->_supportedStereoPairVersions;
}

- (void)setSupportedStereoPairVersions:(unint64_t)a3
{
  self->_supportedStereoPairVersions = a3;
}

- (HMDHomeKitVersion)minimumRequiredPairingSoftwareVersion
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 184, 1);
}

- (NSString)idsIdentifierString
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (NSData)rawAccessoryCapabilities
{
  return (NSData *)objc_getProperty(self, a2, 200, 1);
}

- (NSData)rawResidentCapabilities
{
  return (NSData *)objc_getProperty(self, a2, 208, 1);
}

- (HMDCapabilityFlags)requiredPairingCapabilities
{
  return (HMDCapabilityFlags *)objc_getProperty(self, a2, 216, 1);
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredPairingCapabilities, 0);
  objc_storeStrong((id *)&self->_rawResidentCapabilities, 0);
  objc_storeStrong((id *)&self->_rawAccessoryCapabilities, 0);
  objc_storeStrong((id *)&self->_idsIdentifierString, 0);
  objc_storeStrong((id *)&self->_minimumRequiredPairingSoftwareVersion, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

+ (id)namespace
{
  if (namespace_onceToken_33480 != -1)
    dispatch_once(&namespace_onceToken_33480, &__block_literal_global_33481);
  return (id)namespace_namespace_33482;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_33475 != -1)
    dispatch_once(&logCategory__hmf_once_t8_33475, &__block_literal_global_16_33476);
  return (id)logCategory__hmf_once_v9_33477;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __49__HMDUnassociatedAppleMediaAccessory_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v9_33477;
  logCategory__hmf_once_v9_33477 = v0;

}

void __47__HMDUnassociatedAppleMediaAccessory_namespace__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)namespace_namespace_33482;
  namespace_namespace_33482 = v0;

}

@end
