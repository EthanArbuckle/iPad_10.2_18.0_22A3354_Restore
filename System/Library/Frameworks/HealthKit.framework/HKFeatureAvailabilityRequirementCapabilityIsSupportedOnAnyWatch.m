@implementation HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch

- (HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch)initWithNanoRegistryCapability:(id)a3 supportedOnLocalDevice:(BOOL)a4
{
  id v6;
  HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch *v7;
  uint64_t v8;
  NSUUID *nanoRegistryCapability;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch;
  v7 = -[HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    nanoRegistryCapability = v7->_nanoRegistryCapability;
    v7->_nanoRegistryCapability = (NSUUID *)v8;

    v7->_supportedOnLocalDevice = a4;
  }

  return v7;
}

+ (NSString)requirementIdentifier
{
  return (NSString *)CFSTR("CapabilityIsSupportedOnAnyWatch");
}

- (NSString)requirementDescription
{
  void *v3;
  int v4;
  const __CFString *v5;

  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCompanionCapable");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("At least one watch must have the the capability %@"), self->_nanoRegistryCapability);
  }
  else
  {
    if (self->_supportedOnLocalDevice)
      v5 = CFSTR("Supported");
    else
      v5 = CFSTR("Not supported");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ on this device"), v5);
  }
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)_isSatisfiedWithDataSource:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "behavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isCompanionCapable");

    if (v6)
    {
      objc_msgSend(v4, "devicePairingAndSwitchingNotificationDataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pairedDeviceRegistry");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __94__HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch__isSatisfiedWithDataSource___block_invoke;
      v11[3] = &unk_1E37EDBA8;
      v11[4] = a1;
      objc_msgSend(v8, "getDevicesMatching:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = objc_msgSend(v9, "count") != 0;

    }
    else
    {
      a1 = *(_BYTE *)(a1 + 8) != 0;
    }
  }

  return a1;
}

uint64_t __94__HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch__isSatisfiedWithDataSource___block_invoke(uint64_t a1, void *a2)
{
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    return objc_msgSend(a2, "supportsCapability:");
  else
    return 1;
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch _isSatisfiedWithDataSource:]((uint64_t)self, a3));
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  _QWORD v10[5];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "behavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isCompanionCapable");

  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __98__HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch_registerObserver_forDataSource___block_invoke;
    v10[3] = &unk_1E37EDBD0;
    v10[4] = self;
    objc_msgSend(v7, "registerObserverForDeviceCharacteristicAndPairingChanges:block:", v6, v10);
  }

}

void __98__HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(v5, "featureAvailabilityRequirement:didUpdateSatisfaction:", v4, -[HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch _isSatisfiedWithDataSource:](v4, a2));

}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v8 = a3;
  v5 = a4;
  objc_msgSend(v5, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isCompanionCapable");

  if (v7)
    objc_msgSend(v5, "unregisterObserverForDeviceCharacteristicAndPairingChanges:", v8);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSUUID *nanoRegistryCapability;
  NSUUID *v7;
  BOOL v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    nanoRegistryCapability = self->_nanoRegistryCapability;
    v7 = (NSUUID *)v5[2];
    v8 = (nanoRegistryCapability == v7 || v7 && -[NSUUID isEqual:](nanoRegistryCapability, "isEqual:"))
      && self->_supportedOnLocalDevice == *((unsigned __int8 *)v5 + 8);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSUUID hash](self->_nanoRegistryCapability, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportedOnLocalDevice);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *nanoRegistryCapability;
  id v5;

  nanoRegistryCapability = self->_nanoRegistryCapability;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", nanoRegistryCapability, CFSTR("nanoRegistryCapability"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportedOnLocalDevice, CFSTR("supportedOnLocalDevice"));

}

- (HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nanoRegistryCapability"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportedOnLocalDevice"));

  v7 = -[HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch initWithNanoRegistryCapability:supportedOnLocalDevice:](self, "initWithNanoRegistryCapability:supportedOnLocalDevice:", v5, v6);
  return v7;
}

- (NSUUID)nanoRegistryCapability
{
  return self->_nanoRegistryCapability;
}

- (BOOL)isSupportedOnLocalDevice
{
  return self->_supportedOnLocalDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nanoRegistryCapability, 0);
}

@end
