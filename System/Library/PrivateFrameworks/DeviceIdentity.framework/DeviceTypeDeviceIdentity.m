@implementation DeviceTypeDeviceIdentity

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_0);
  return (id)sharedInstance_device_type;
}

void __42__DeviceTypeDeviceIdentity_sharedInstance__block_invoke()
{
  DeviceTypeDeviceIdentity *v0;
  void *v1;

  v0 = objc_alloc_init(DeviceTypeDeviceIdentity);
  v1 = (void *)sharedInstance_device_type;
  sharedInstance_device_type = (uint64_t)v0;

}

- (DeviceTypeDeviceIdentity)init
{
  DeviceTypeDeviceIdentity *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSString *product_type;
  void *v7;
  uint64_t v8;
  NSString *hardware_model;
  void *v10;
  uint64_t v11;
  NSString *device_class;
  void *v13;
  id v14;
  uint64_t v15;
  NSString *soc_generation;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  int v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  objc_super v60;

  v60.receiver = self;
  v60.super_class = (Class)DeviceTypeDeviceIdentity;
  v2 = -[DeviceTypeDeviceIdentity init](&v60, sel_init);
  if (v2)
  {
    objc_msgSend(CFSTR("com.apple.mobileactivationd"), "UTF8String");
    v2->_is_internal_build = os_variant_allows_internal_security_policies();
    objc_msgSend(CFSTR("com.apple.mobileactivationd"), "UTF8String");
    v2->_has_internal_diagnostics = os_variant_has_internal_diagnostics();
    +[GestaltHlprDeviceIdentity getSharedInstance](GestaltHlprDeviceIdentity, "getSharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copyAnswer:", CFSTR("ProductType"));
    isNSString(v4);
    v5 = objc_claimAutoreleasedReturnValue();
    product_type = v2->_product_type;
    v2->_product_type = (NSString *)v5;

    v7 = (void *)objc_msgSend(v3, "copyAnswer:", CFSTR("HWModelStr"));
    isNSString(v7);
    v8 = objc_claimAutoreleasedReturnValue();
    hardware_model = v2->_hardware_model;
    v2->_hardware_model = (NSString *)v8;

    v2->_is_ipod = -[NSString hasPrefix:](v2->_product_type, "hasPrefix:", CFSTR("iPod"));
    v2->_is_ipad = -[NSString hasPrefix:](v2->_product_type, "hasPrefix:", CFSTR("iPad"));
    v2->_is_iphone = -[NSString hasPrefix:](v2->_product_type, "hasPrefix:", CFSTR("iPhone"));
    v2->_is_audio_accessory = -[NSString hasPrefix:](v2->_product_type, "hasPrefix:", CFSTR("AudioAccessory"));
    v2->_is_dev_board = -[NSString hasSuffix:](v2->_hardware_model, "hasSuffix:", CFSTR("DEV"));
    v10 = (void *)objc_msgSend(v3, "copyAnswer:", CFSTR("DeviceClass"));
    isNSString(v10);
    v11 = objc_claimAutoreleasedReturnValue();
    device_class = v2->_device_class;
    v2->_device_class = (NSString *)v11;

    v2->_has_baseband = objc_msgSend(v3, "getBoolAnswer:", CFSTR("HasBaseband"));
    objc_msgSend(CFSTR("IODeviceTree"), "stringByAppendingString:", CFSTR(":/arm-io"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[DeviceTypeDeviceIdentity copyDeviceTreeString:key:defaultValue:](v2, "copyDeviceTreeString:key:defaultValue:", v13, CFSTR("soc-generation"), 0);
    objc_msgSend(v14, "uppercaseString");
    v15 = objc_claimAutoreleasedReturnValue();
    soc_generation = v2->_soc_generation;
    v2->_soc_generation = (NSString *)v15;

    +[GestaltHlprDeviceIdentity getSharedInstance](GestaltHlprDeviceIdentity, "getSharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copyAnswer:", CFSTR("ChipID"));
    isNSNumber(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v19, "isEqualToNumber:", &unk_1E98CE728) & 1) != 0
      || (objc_msgSend(v19, "isEqualToNumber:", &unk_1E98CE740) & 1) != 0
      || (objc_msgSend(v19, "isEqualToNumber:", &unk_1E98CE758) & 1) != 0)
    {
      LOBYTE(v20) = 0;
    }
    else
    {
      v20 = objc_msgSend(v19, "isEqualToNumber:", &unk_1E98CE770) ^ 1;
    }
    v2->_device_supports_mfi_certificates = v20;
    if ((objc_msgSend(v19, "isEqualToNumber:", &unk_1E98CE770) & 1) != 0
      || (objc_msgSend(v19, "isEqualToNumber:", &unk_1E98CE740) & 1) != 0)
    {
      LOBYTE(v21) = 0;
    }
    else
    {
      v21 = objc_msgSend(v19, "isEqualToNumber:", &unk_1E98CE758) ^ 1;
    }
    v2->_device_supports_eda_certificates = v21;
    v2->_device_supports_dcrt_oob = objc_msgSend(v3, "getBoolAnswer:", CFSTR("DeviceSupportsFairPlaySecureVideoPath"));
    objc_msgSend(CFSTR("IODeviceTree"), "stringByAppendingString:", CFSTR(":/product"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[DeviceTypeDeviceIdentity copyDeviceTreeInt:key:defaultValue:](v2, "copyDeviceTreeInt:key:defaultValue:", v22, CFSTR("allow-hactivation"), 0);

    v24 = (void *)objc_msgSend(v3, "copyAnswer:", CFSTR("CertificateProductionStatus"));
    isNSNumber(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)objc_msgSend(v3, "copyAnswer:", CFSTR("EffectiveProductionStatusAp"));
    isNSNumber(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)objc_msgSend(v3, "copyAnswer:", CFSTR("CertificateSecurityMode"));
    isNSNumber(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)objc_msgSend(v3, "copyAnswer:", CFSTR("EffectiveSecurityModeSEP"));
    isNSNumber(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25 && v27 && v31 && v29)
    {
      if (objc_msgSend(v25, "isEqualToNumber:", &unk_1E98CE788)
        && objc_msgSend(v27, "isEqualToNumber:", &unk_1E98CE7A0)
        && objc_msgSend(v29, "isEqualToNumber:", &unk_1E98CE788)
        && objc_msgSend(v31, "isEqualToNumber:", &unk_1E98CE788))
      {
        v2->_should_hactivate = 1;
        v2->_is_prodfused_demoted = 1;
      }
      if (objc_msgSend(v25, "isEqualToNumber:", &unk_1E98CE7A0)
        && objc_msgSend(v27, "isEqualToNumber:", &unk_1E98CE7A0)
        && objc_msgSend(v29, "isEqualToNumber:", &unk_1E98CE788)
        && objc_msgSend(v31, "isEqualToNumber:", &unk_1E98CE788))
      {
        v2->_should_hactivate = 1;
        v2->_is_devfused_undemoted = 1;
      }
    }
    if (!v2->_is_internal_build)
      goto LABEL_50;
    if (!v2->_should_hactivate)
      v2->_should_hactivate = objc_msgSend(v3, "getBoolAnswer:", CFSTR("ShouldHactivate"));
    v32 = -[DeviceTypeDeviceIdentity copyBootArgs](v2, "copyBootArgs");
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v32;
    objc_msgSend(v32, "componentsSeparatedByCharactersInSet:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NSString containsString:](v2->_product_type, "containsString:", CFSTR("iFPGA")))
    {
      v2->_should_hactivate = 1;
      v2->_is_fpga = 1;
    }
    v56 = v29;
    if (v2->_is_dev_board)
      v2->_should_hactivate = 1;
    isNSNumber(v23);
    v35 = objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v36 = (void *)v35;
      v37 = objc_msgSend(v23, "BOOLValue");

      if (v37)
        v2->_should_hactivate = 1;
    }
    if (objc_msgSend(v34, "containsObject:", CFSTR("disable-hactivation-ma=1")))
      v2->_should_hactivate = 0;
    v58 = v27;
    v59 = v34;
    v57 = v23;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "fileExistsAtPath:", CFSTR("/AppleInternal/Lockdown/.hactivateoff"));

    if (v39)
      v2->_should_hactivate = 0;
    v40 = v31;
    v41 = objc_alloc(MEMORY[0x1E0C99EA0]);
    objc_msgSend(v41, "persistentDomainForName:", CFSTR("com.apple.mobileactivationd"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("DisableHactivation"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    isNSNumber(v43);
    v44 = objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      v45 = (void *)v44;
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("DisableHactivation"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "BOOLValue");

      if (v47)
        v2->_should_hactivate = 0;
    }
    else
    {

    }
    v48 = v59;
    if (is_virtual_machine())
    {
      objc_msgSend(CFSTR("IODeviceTree"), "stringByAppendingString:", CFSTR(":/chosen"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = -[DeviceTypeDeviceIdentity copyDeviceTreeInt:key:defaultValue:](v2, "copyDeviceTreeInt:key:defaultValue:", v49, CFSTR("enable-avp-fairplay"), 0);

      isNSNumber(v50);
      v51 = objc_claimAutoreleasedReturnValue();
      v31 = v40;
      if (v51)
      {
        v52 = (void *)v51;
        v53 = objc_msgSend(v50, "BOOLValue");

        v27 = v58;
        if (v53)
          v2->_should_hactivate = 0;
        v23 = v57;
        v48 = v59;
        goto LABEL_49;
      }
    }
    else
    {
      v50 = 0;
      v31 = v40;
    }
    v23 = v57;
    v27 = v58;
LABEL_49:

    v29 = v56;
LABEL_50:

  }
  return v2;
}

- (id)copyDeviceTreeProperty:(id)a3 key:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  CFTypeRef CFProperty;
  io_registry_entry_t v8;
  io_object_t v9;

  v5 = (__CFString *)a4;
  v6 = v5;
  CFProperty = 0;
  if (a3 && v5)
  {
    v8 = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAB8], (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation"));
    if (v8)
    {
      v9 = v8;
      CFProperty = IORegistryEntryCreateCFProperty(v8, v6, 0, 0);
      IOObjectRelease(v9);
    }
    else
    {
      CFProperty = 0;
    }
  }

  return (id)CFProperty;
}

- (id)copyBootSessionUUID
{
  void *v2;
  void *v3;
  void *v4;
  size_t size;

  size = 0;
  v2 = 0;
  if (!sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0))
  {
    v3 = malloc_type_malloc(size, 0x14BD9A43uLL);
    if (v3)
    {
      v4 = v3;
      v2 = 0;
      if (!sysctlbyname("kern.bootsessionuuid", v3, &size, 0, 0))
        v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v4);
      free(v4);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

- (id)copyBootArgs
{
  int v2;
  id result;
  size_t v4;
  _BYTE v5[1024];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  bzero(v5, 0x400uLL);
  v4 = 1024;
  v2 = sysctlbyname("kern.bootargs", v5, &v4, 0, 0);
  result = 0;
  if (!v2)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v5);
  return result;
}

- (id)copyDeviceTreeInt:(id)a3 key:(id)a4 defaultValue:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unsigned int v17;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v17 = v5;
  if (v8 && v9)
  {
    v11 = -[DeviceTypeDeviceIdentity copyDeviceTreeProperty:key:](self, "copyDeviceTreeProperty:key:", v8, v9);
    isNSData(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {

    }
    else
    {
      isNSNumber(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_10;
    }
    isNSData(v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (objc_msgSend(v11, "length") == 4)
      {
        objc_msgSend(v11, "getBytes:length:", &v17, 4);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
        v15 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v15;
      }
    }
    else
    {
      v11 = v11;

      v10 = v11;
    }
  }
LABEL_10:

  return v10;
}

- (id)copyDeviceTreeString:(id)a3 key:(id)a4 defaultValue:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;

  v8 = a5;
  v9 = v8;
  v10 = 0;
  if (!a3)
    goto LABEL_6;
  v11 = v8;
  if (a4)
  {
    v10 = -[DeviceTypeDeviceIdentity copyDeviceTreeProperty:key:](self, "copyDeviceTreeProperty:key:", a3, a4);
    isNSData(v10);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      v14 = objc_msgSend(v10, "length");

      if (v14)
      {
        v15 = objc_alloc(MEMORY[0x1E0CB3940]);
        v10 = objc_retainAutorelease(v10);
        v11 = (void *)objc_msgSend(v15, "initWithUTF8String:", objc_msgSend(v10, "bytes"));

        goto LABEL_7;
      }
    }
LABEL_6:
    v11 = v9;
  }
LABEL_7:

  return v11;
}

- (BOOL)runningInRAMDisk
{
  id v2;
  void *v3;
  void *v4;
  char v5;

  v2 = -[DeviceTypeDeviceIdentity copyBootArgs](self, "copyBootArgs");
  if (v2
    && (objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "componentsSeparatedByCharactersInSet:", v3),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v4))
  {
    v5 = objc_msgSend(v4, "containsObject:", CFSTR("-restore"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)product_type
{
  return self->_product_type;
}

- (NSString)device_class
{
  return self->_device_class;
}

- (NSString)hardware_model
{
  return self->_hardware_model;
}

- (NSString)soc_generation
{
  return self->_soc_generation;
}

- (BOOL)device_supports_dcrt_oob
{
  return self->_device_supports_dcrt_oob;
}

- (BOOL)device_supports_mfi_certificates
{
  return self->_device_supports_mfi_certificates;
}

- (BOOL)device_supports_eda_certificates
{
  return self->_device_supports_eda_certificates;
}

- (BOOL)is_prodfused_demoted
{
  return self->_is_prodfused_demoted;
}

- (BOOL)is_devfused_undemoted
{
  return self->_is_devfused_undemoted;
}

- (BOOL)is_dev_board
{
  return self->_is_dev_board;
}

- (BOOL)is_fpga
{
  return self->_is_fpga;
}

- (BOOL)is_ipod
{
  return self->_is_ipod;
}

- (BOOL)is_ipad
{
  return self->_is_ipad;
}

- (BOOL)is_iphone
{
  return self->_is_iphone;
}

- (BOOL)is_audio_accessory
{
  return self->_is_audio_accessory;
}

- (BOOL)has_baseband
{
  return self->_has_baseband;
}

- (BOOL)should_hactivate
{
  return self->_should_hactivate;
}

- (BOOL)is_internal_build
{
  return self->_is_internal_build;
}

- (BOOL)has_internal_diagnostics
{
  return self->_has_internal_diagnostics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soc_generation, 0);
  objc_storeStrong((id *)&self->_hardware_model, 0);
  objc_storeStrong((id *)&self->_device_class, 0);
  objc_storeStrong((id *)&self->_product_type, 0);
}

@end
