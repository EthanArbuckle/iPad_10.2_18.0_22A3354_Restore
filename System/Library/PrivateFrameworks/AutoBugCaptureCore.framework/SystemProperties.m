@implementation SystemProperties

- (BOOL)carrierSeedBuild
{
  if (self->_carrierSeedBuildOverride)
    return -[NSNumber BOOLValue](self->_carrierSeedBuildOverride, "BOOLValue");
  if (self->_carrierBuild)
    return -[SystemProperties seedBuild](self, "seedBuild");
  return 0;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SystemProperties_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_instancePred != -1)
    dispatch_once(&sharedInstance_instancePred, block);
  return (id)sharedInstance;
}

void __34__SystemProperties_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance;
  sharedInstance = (uint64_t)v1;

}

+ (int)systemPropertiesDeviceClassFromMGQDeviceClass:(int)a3
{
  if ((a3 - 1) > 0xB)
    return -1;
  else
    return dword_1DBB60510[a3 - 1];
}

- (id)description
{
  id v3;
  NSString *productName;
  uint64_t v5;
  NSString *productType;
  NSString *productVersion;
  uint64_t v8;
  const char *v9;
  const char *v10;
  const char *v11;
  id v12;
  NSString *basebandChipset;
  id v14;
  const __CFString *basebandFirmwareVersion;
  __CFString *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const __CFString *serialNumber;
  void *v25;
  void *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  NSUInteger v31;
  NSString *buildPlatform;
  NSString *buildVersion;
  NSString *v34;
  NSString *v35;
  NSString *v36;
  void *v37;
  void *v38;
  void *v39;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  productName = self->_productName;
  -[SystemProperties deviceClassString](self, "deviceClassString");
  v5 = objc_claimAutoreleasedReturnValue();
  productType = self->_productType;
  productVersion = self->_productVersion;
  buildPlatform = self->_buildPlatform;
  buildVersion = self->_buildVersion;
  -[SystemProperties buildVariant](self, "buildVariant");
  v8 = objc_claimAutoreleasedReturnValue();
  if (self->_basebandCapability)
    v9 = "yes";
  else
    v9 = "no";
  v30 = v9;
  if (self->_dualSIMCapable)
    v10 = "yes";
  else
    v10 = "no";
  if (self->_dualSIMEnabled)
    v11 = "yes";
  else
    v11 = "no";
  v28 = v11;
  v29 = v10;
  v38 = (void *)v8;
  v39 = (void *)v5;
  v36 = productName;
  v37 = v3;
  v34 = productVersion;
  v35 = productType;
  v31 = -[NSString length](self->_basebandChipset, "length");
  if (v31)
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    basebandChipset = self->_basebandChipset;
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (-[NSString length](self->_basebandFirmwareVersion, "length"))
      basebandFirmwareVersion = (const __CFString *)self->_basebandFirmwareVersion;
    else
      basebandFirmwareVersion = CFSTR("Unknown FW Version");
    v27 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("(%@)"), basebandFirmwareVersion);
    v16 = (__CFString *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@ %@"), basebandChipset, v27);
  }
  else
  {
    v16 = CFSTR("No baseband");
  }
  if (-[SystemProperties internalBuild](self, "internalBuild"))
    v17 = "yes";
  else
    v17 = "no";
  if (self->_factoryBuild)
    v18 = "yes";
  else
    v18 = "no";
  if (-[SystemProperties vendorBuild](self, "vendorBuild"))
    v19 = "yes";
  else
    v19 = "no";
  if (-[SystemProperties carrierBuild](self, "carrierBuild"))
    v20 = "yes";
  else
    v20 = "no";
  if (-[SystemProperties seedBuild](self, "seedBuild"))
    v21 = "yes";
  else
    v21 = "no";
  if (-[SystemProperties carrierSeedBuild](self, "carrierSeedBuild"))
    v22 = "yes";
  else
    v22 = "no";
  if (-[SystemProperties customerSeedBuild](self, "customerSeedBuild"))
    v23 = "yes";
  else
    v23 = "no";
  serialNumber = (const __CFString *)self->_serialNumber;
  if (!serialNumber)
    serialNumber = CFSTR("redacted");
  v25 = (void *)objc_msgSend(v37, "initWithFormat:", CFSTR("ProductName = %@, ProductClass = %@, ProductType = %@, ProductVersion = %@, BuildVersion = %@, BuildPlatform = %@, BuildVariant = %@, basebandCapability = %s, dualSIMCapable = %s, dualSIMEnabled = %s, Baseband Chipset = %@, InternalBuild = %s, FactoryBuild = %s, VendorBuild = %s, CarrierBuild = %s, SeedBuild = %s, CarrierSeedBuild = %s, CustomerSeedBuild = %s, DeviceSerialNumber = %@"), v36, v39, v35, v34, buildVersion, buildPlatform, v38, v30, v29, v28, v16, v17, v18, v19, v20, v21,
                  v22,
                  v23,
                  serialNumber);
  if (v31)
  {

  }
  return v25;
}

- (SystemProperties)init
{
  id v2;
  const __CFDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *Value;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  objc_super v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)SystemProperties;
  v2 = -[SystemProperties init](&v30, sel_init);
  if (!v2)
    return (SystemProperties *)v2;
  v3 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  *((_DWORD *)v2 + 5) = -1;
  v4 = (void *)*((_QWORD *)v2 + 6);
  *((_QWORD *)v2 + 6) = CFSTR("Unknown Product Type");

  v5 = (void *)*((_QWORD *)v2 + 7);
  *((_QWORD *)v2 + 7) = CFSTR("Unknown Product Name");

  v6 = (void *)*((_QWORD *)v2 + 8);
  *((_QWORD *)v2 + 8) = CFSTR("Unknown Product Version");

  v7 = (void *)*((_QWORD *)v2 + 9);
  *((_QWORD *)v2 + 9) = CFSTR("Unknown Build Version");

  v8 = (void *)*((_QWORD *)v2 + 12);
  *((_QWORD *)v2 + 12) = &stru_1EA3B8F58;

  v9 = (void *)*((_QWORD *)v2 + 5);
  *((_QWORD *)v2 + 5) = &stru_1EA3B8F58;

  v10 = (void *)*((_QWORD *)v2 + 11);
  *((_QWORD *)v2 + 11) = CFSTR("iOS");

  if (v3)
  {
    Value = (void *)CFDictionaryGetValue(v3, (const void *)*MEMORY[0x1E0C9AB98]);
    if (Value)
      objc_storeStrong((id *)v2 + 7, Value);
    v12 = (void *)CFDictionaryGetValue(v3, (const void *)*MEMORY[0x1E0C9ABB0]);
    if (v12)
      objc_storeStrong((id *)v2 + 8, v12);
    v13 = (void *)CFDictionaryGetValue(v3, (const void *)*MEMORY[0x1E0C9AB90]);
    if (v13)
      objc_storeStrong((id *)v2 + 9, v13);
    CFRelease(v3);
  }
  *((_BYTE *)v2 + 9) = 0;
  *((_BYTE *)v2 + 8) = os_variant_has_internal_diagnostics();
  *((_BYTE *)v2 + 16) = os_variant_has_factory_content();
  *((_BYTE *)v2 + 10) = 0;
  *((_BYTE *)v2 + 14) = 0;
  v14 = MGGetStringAnswer();
  v15 = (void *)*((_QWORD *)v2 + 6);
  *((_QWORD *)v2 + 6) = v14;

  v16 = (const __CFString *)MGGetStringAnswer();
  if (v16)
    *((_BYTE *)v2 + 11) = CFStringCompare(v16, CFSTR("Vendor"), 0) == kCFCompareEqualTo;
  if (*((_BYTE *)v2 + 8) || *((_BYTE *)v2 + 11))
  {
    v17 = MGGetStringAnswer();
    if (v17)
    {
      v18 = (void *)*((_QWORD *)v2 + 4);
      *((_QWORD *)v2 + 4) = v17;

    }
  }
  *((_DWORD *)v2 + 5) = +[SystemProperties systemPropertiesDeviceClassFromMGQDeviceClass:](SystemProperties, "systemPropertiesDeviceClassFromMGQDeviceClass:", MGGetSInt32Answer());
  if (MGGetBoolAnswer())
    v19 = *((_BYTE *)v2 + 8) == 0;
  else
    v19 = 0;
  *((_BYTE *)v2 + 10) = v19;
  *((_BYTE *)v2 + 15) = MGGetBoolAnswer();
  *((_WORD *)v2 + 6) = 0;
  v20 = MGGetStringAnswer();
  if (v20)
  {
    v21 = *((_QWORD *)v2 + 12);
    *((_QWORD *)v2 + 12) = v20;
  }
  else
  {
    symptomsLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_INFO, "No baseband chipset", buf, 2u);
    }
  }

  v22 = MGGetStringAnswer();
  if (v22)
  {
    v23 = *((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v22;
  }
  else
  {
    symptomsLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v23, OS_LOG_TYPE_INFO, "No baseband firmware version", buf, 2u);
    }
  }

  if (*((_BYTE *)v2 + 8))
  {
    objc_msgSend(*((id *)v2 + 6), "rangeOfString:options:", CFSTR("iPhone15"), 9);
    if (v24)
    {
      symptomsLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v26 = "Enabling NPI flag based on productType match";
LABEL_34:
        _os_log_impl(&dword_1DBAE1000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
        goto LABEL_35;
      }
      goto LABEL_35;
    }
    objc_msgSend(*((id *)v2 + 12), "rangeOfString:options:", CFSTR("mav22"), 9);
    if (v27)
    {
      symptomsLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v26 = "Enabling NPI flag based on baseband chipset match";
        goto LABEL_34;
      }
LABEL_35:

      *((_BYTE *)v2 + 14) = 1;
    }
  }
  symptomsLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v32 = v2;
    _os_log_impl(&dword_1DBAE1000, v28, OS_LOG_TYPE_DEFAULT, "System Properties: %{private}@", buf, 0xCu);
  }

  return (SystemProperties *)v2;
}

- (NSString)deviceClassString
{
  uint64_t deviceClass;

  deviceClass = self->_deviceClass;
  if (deviceClass > 9)
    return (NSString *)CFSTR("Unknown");
  else
    return &off_1EA3B5580[deviceClass]->isa;
}

- (BOOL)internalBuild
{
  return self->_internalBuild && !self->_internalBuildDisabledByOverride;
}

- (BOOL)seedBuild
{
  NSNumber *seedBuildOverride;
  _BOOL8 v4;

  seedBuildOverride = self->_seedBuildOverride;
  if (seedBuildOverride)
    LOBYTE(v4) = -[NSNumber BOOLValue](seedBuildOverride, "BOOLValue");
  else
    return self->_seedBuild;
  return v4;
}

- (BOOL)customerSeedBuild
{
  _BOOL4 v3;

  v3 = -[SystemProperties seedBuild](self, "seedBuild");
  if (v3)
    LOBYTE(v3) = -[SystemProperties customerBuild](self, "customerBuild");
  return v3;
}

- (BOOL)carrierBuild
{
  NSNumber *carrierSeedBuildOverride;
  _BOOL8 v4;

  carrierSeedBuildOverride = self->_carrierSeedBuildOverride;
  if (carrierSeedBuildOverride)
    LOBYTE(v4) = -[NSNumber BOOLValue](carrierSeedBuildOverride, "BOOLValue");
  else
    return self->_carrierBuild;
  return v4;
}

- (BOOL)vendorBuild
{
  NSNumber *vendorBuildOverride;
  _BOOL8 v4;

  vendorBuildOverride = self->_vendorBuildOverride;
  if (vendorBuildOverride)
    LOBYTE(v4) = -[NSNumber BOOLValue](vendorBuildOverride, "BOOLValue");
  else
    return self->_vendorBuild;
  return v4;
}

- (BOOL)customerBuild
{
  if (-[SystemProperties internalBuild](self, "internalBuild")
    || -[SystemProperties carrierBuild](self, "carrierBuild"))
  {
    return 0;
  }
  else
  {
    return !-[SystemProperties vendorBuild](self, "vendorBuild");
  }
}

- (BOOL)npiDevice
{
  NSNumber *npiDeviceOverride;
  _BOOL8 v4;

  npiDeviceOverride = self->_npiDeviceOverride;
  if (npiDeviceOverride)
    LOBYTE(v4) = -[NSNumber BOOLValue](npiDeviceOverride, "BOOLValue");
  else
    return self->_npiDevice;
  return v4;
}

- (void)setInternalBuildDisabledByOverride:(BOOL)a3
{
  NSString *buildVariant;

  if (self->_internalBuildDisabledByOverride != a3)
  {
    self->_internalBuildDisabledByOverride = a3;
    buildVariant = self->_buildVariant;
    self->_buildVariant = 0;

  }
}

- (void)setCarrierSeedBuildOverride:(id)a3
{
  NSNumber *v5;
  NSString *buildVariant;
  NSNumber *v7;

  v5 = (NSNumber *)a3;
  if (self->_carrierSeedBuildOverride != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_carrierSeedBuildOverride, a3);
    self->_internalBuildDisabledByOverride = -[NSNumber BOOLValue](self->_carrierSeedBuildOverride, "BOOLValue");
    buildVariant = self->_buildVariant;
    self->_buildVariant = 0;

    v5 = v7;
  }

}

- (void)setSeedBuildOverride:(id)a3
{
  NSNumber *v5;
  NSString *buildVariant;
  NSNumber *v7;

  v5 = (NSNumber *)a3;
  if (self->_seedBuildOverride != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_seedBuildOverride, a3);
    buildVariant = self->_buildVariant;
    self->_buildVariant = 0;

    v5 = v7;
  }

}

- (void)setNpiDeviceOverride:(id)a3
{
  NSNumber *v5;
  NSNumber **p_npiDeviceOverride;
  NSNumber *npiDeviceOverride;
  NSNumber *v8;

  v5 = (NSNumber *)a3;
  npiDeviceOverride = self->_npiDeviceOverride;
  p_npiDeviceOverride = &self->_npiDeviceOverride;
  if (npiDeviceOverride != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_npiDeviceOverride, a3);
    v5 = v8;
  }

}

- (NSString)basebandFirmwareVersion
{
  NSObject *v3;
  NSString *v4;
  NSObject *basebandFirmwareVersion;
  uint8_t v7[16];
  uint8_t buf[16];

  if (!-[NSString length](self->_basebandFirmwareVersion, "length") && self->_basebandChipset)
  {
    symptomsLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEBUG, "Updating missing baseband firmware version", buf, 2u);
    }

    v4 = (NSString *)MGGetStringAnswer();
    if (v4)
    {
      basebandFirmwareVersion = self->_basebandFirmwareVersion;
      self->_basebandFirmwareVersion = v4;
    }
    else
    {
      symptomsLogHandle();
      basebandFirmwareVersion = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(basebandFirmwareVersion, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1DBAE1000, basebandFirmwareVersion, OS_LOG_TYPE_INFO, "No baseband firmware version", v7, 2u);
      }
    }

  }
  return self->_basebandFirmwareVersion;
}

- (NSString)buildVariant
{
  NSString *buildVariant;
  NSString *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  const __CFString *v8;
  _BOOL4 v9;
  const __CFString *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  __CFString *v14;
  _BOOL4 v15;
  NSString *v16;
  NSString *v17;
  NSString *v18;

  buildVariant = self->_buildVariant;
  if (!buildVariant)
  {
    if (-[SystemProperties internalBuild](self, "internalBuild"))
    {
      v5 = self->_buildVariant;
      self->_buildVariant = (NSString *)CFSTR("Internal");

      v6 = -[SystemProperties carrierBuild](self, "carrierBuild");
      v7 = -[SystemProperties seedBuild](self, "seedBuild");
      if (v7)
        v8 = CFSTR("Seed");
      else
        v8 = 0;
      if (v6)
      {
        v9 = v7;
        v10 = v8;
        -[NSString stringByAppendingString:](self->_buildVariant, "stringByAppendingString:", CFSTR("Carrier"));
        v11 = (NSString *)objc_claimAutoreleasedReturnValue();
        v12 = self->_buildVariant;
        self->_buildVariant = v11;

        v7 = v9;
        v8 = v10;
      }
      if (!v7)
        goto LABEL_19;
      v13 = self->_buildVariant;
    }
    else
    {
      if (-[SystemProperties carrierBuild](self, "carrierBuild"))
      {
        v14 = CFSTR("Carrier");
      }
      else if (-[SystemProperties vendorBuild](self, "vendorBuild"))
      {
        v14 = CFSTR("Vendor");
      }
      else
      {
        v14 = CFSTR("Customer");
      }
      v15 = -[SystemProperties seedBuild](self, "seedBuild");
      v16 = self->_buildVariant;
      self->_buildVariant = &v14->isa;

      if (!v15)
        goto LABEL_19;
      v13 = self->_buildVariant;
      v8 = CFSTR("Seed");
    }
    -[NSString stringByAppendingString:](v13, "stringByAppendingString:", v8);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    v18 = self->_buildVariant;
    self->_buildVariant = v17;

LABEL_19:
    buildVariant = self->_buildVariant;
  }
  return buildVariant;
}

- (NSString)serialNumber
{
  __CFString *serialNumber;
  __CFString *v4;

  if (-[SystemProperties internalBuild](self, "internalBuild") || -[SystemProperties vendorBuild](self, "vendorBuild"))
  {
    serialNumber = (__CFString *)self->_serialNumber;
    if (!serialNumber)
      serialNumber = CFSTR("Unknown");
    v4 = serialNumber;
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (void)setVendorBuild:(BOOL)a3
{
  self->_vendorBuild = a3;
}

- (BOOL)dualSIMCapable
{
  return self->_dualSIMCapable;
}

- (BOOL)dualSIMEnabled
{
  return self->_dualSIMEnabled;
}

- (NSString)productType
{
  return self->_productType;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (BOOL)basebandCapability
{
  return self->_basebandCapability;
}

- (BOOL)factoryBuild
{
  return self->_factoryBuild;
}

- (NSString)productName
{
  return self->_productName;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSString)buildVersionPrefix
{
  return self->_buildVersionPrefix;
}

- (NSString)buildPlatform
{
  return self->_buildPlatform;
}

- (NSString)basebandChipset
{
  return self->_basebandChipset;
}

- (BOOL)internalBuildDisabledByOverride
{
  return self->_internalBuildDisabledByOverride;
}

- (NSNumber)carrierSeedBuildOverride
{
  return self->_carrierSeedBuildOverride;
}

- (NSNumber)seedBuildOverride
{
  return self->_seedBuildOverride;
}

- (NSNumber)vendorBuildOverride
{
  return self->_vendorBuildOverride;
}

- (void)setVendorBuildOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)npiDeviceOverride
{
  return self->_npiDeviceOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_npiDeviceOverride, 0);
  objc_storeStrong((id *)&self->_vendorBuildOverride, 0);
  objc_storeStrong((id *)&self->_seedBuildOverride, 0);
  objc_storeStrong((id *)&self->_carrierSeedBuildOverride, 0);
  objc_storeStrong((id *)&self->_basebandChipset, 0);
  objc_storeStrong((id *)&self->_buildPlatform, 0);
  objc_storeStrong((id *)&self->_buildVersionPrefix, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_basebandFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_buildVariant, 0);
}

@end
