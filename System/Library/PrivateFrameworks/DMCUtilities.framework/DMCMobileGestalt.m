@implementation DMCMobileGestalt

+ (id)_overridableGestaltForKey:(__CFString *)a3 expectedClass:(Class)a4
{
  void *v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MGCopyAnswer();
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = *DMCLogObjects();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v8 = v7;
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v10;
        v21 = 2114;
        v22 = v11;
        _os_log_impl(&dword_1A4951000, v8, OS_LOG_TYPE_FAULT, "MobileGestalt returned unexpected class %{public}@, expected %{public}@", (uint8_t *)&v19, 0x16u);

      }
    }
  }
  +[DMCFeatureOverrides gestaltOverrideForKey:withDefaultValue:](DMCFeatureOverrides, "gestaltOverrideForKey:withDefaultValue:", a3, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = *DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v16;
      v21 = 2114;
      v22 = v17;
      _os_log_impl(&dword_1A4951000, v14, OS_LOG_TYPE_ERROR, "MobileGestalt override returned unexpected class %{public}@, expected %{public}@", (uint8_t *)&v19, 0x16u);

    }
    v12 = 0;
  }

  return v12;
}

+ (id)deviceClass
{
  __CFString *v2;

  objc_msgSend(a1, "_overridableGestaltForKey:expectedClass:", CFSTR("DeviceClass"), objc_opt_class());
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = CFSTR("iPhone");
  return v2;
}

+ (BOOL)isPad
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__DMCMobileGestalt_isPad__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isPad_onceToken != -1)
    dispatch_once(&isPad_onceToken, block);
  return isPad_isiPad;
}

void __25__DMCMobileGestalt_isPad__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "deviceClass");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isPad_isiPad = objc_msgSend(v1, "isEqualToString:", CFSTR("iPad"));

}

+ (BOOL)isAppleTV
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__DMCMobileGestalt_isAppleTV__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isAppleTV_onceToken != -1)
    dispatch_once(&isAppleTV_onceToken, block);
  return isAppleTV_isAppleTV;
}

void __29__DMCMobileGestalt_isAppleTV__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "deviceClass");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isAppleTV_isAppleTV = objc_msgSend(v1, "isEqualToString:", CFSTR("AppleTV"));

}

+ (BOOL)isWatch
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__DMCMobileGestalt_isWatch__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isWatch_onceToken != -1)
    dispatch_once(&isWatch_onceToken, block);
  return isWatch_isWatch;
}

void __27__DMCMobileGestalt_isWatch__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "deviceClass");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isWatch_isWatch = objc_msgSend(v1, "isEqualToString:", CFSTR("Watch"));

}

+ (BOOL)isHomePod
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__DMCMobileGestalt_isHomePod__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isHomePod_onceToken != -1)
    dispatch_once(&isHomePod_onceToken, block);
  return isHomePod_isHomePod;
}

void __29__DMCMobileGestalt_isHomePod__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "deviceClass");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isHomePod_isHomePod = objc_msgSend(v1, "isEqualToString:", CFSTR("AudioAccessory"));

}

+ (BOOL)isPhone
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__DMCMobileGestalt_isPhone__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isPhone_onceToken != -1)
    dispatch_once(&isPhone_onceToken, block);
  return isPhone_isPhone;
}

void __27__DMCMobileGestalt_isPhone__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "deviceClass");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isPhone_isPhone = objc_msgSend(v1, "isEqualToString:", CFSTR("iPhone"));

}

+ (BOOL)isVisionDevice
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__DMCMobileGestalt_isVisionDevice__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isVisionDevice_onceToken != -1)
    dispatch_once(&isVisionDevice_onceToken, block);
  return isVisionDevice_isVisionDevice;
}

void __34__DMCMobileGestalt_isVisionDevice__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "deviceClass");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isVisionDevice_isVisionDevice = objc_msgSend(v1, "isEqualToString:", CFSTR("RealityDevice"));

}

+ (BOOL)isAppleSiliconMac
{
  return 0;
}

+ (id)deviceUDID
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a1, "_overridableGestaltForKey:expectedClass:", CFSTR("UniqueDeviceID"), objc_opt_class());
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E4D38200;
  v4 = v2;

  return v4;
}

+ (id)serialNumber
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a1, "_overridableGestaltForKey:expectedClass:", CFSTR("SerialNumber"), objc_opt_class());
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E4D38200;
  v4 = v2;

  return v4;
}

+ (id)productName
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a1, "_overridableGestaltForKey:expectedClass:", CFSTR("ProductName"), objc_opt_class());
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E4D38200;
  v4 = v2;

  return v4;
}

+ (id)modelNumber
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a1, "_overridableGestaltForKey:expectedClass:", CFSTR("ModelNumber"), objc_opt_class());
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E4D38200;
  v4 = v2;

  return v4;
}

+ (id)deviceColor
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a1, "_overridableGestaltForKey:expectedClass:", CFSTR("DeviceColor"), objc_opt_class());
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E4D38200;
  v4 = v2;

  return v4;
}

+ (id)regionCode
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a1, "_overridableGestaltForKey:expectedClass:", CFSTR("RegionCode"), objc_opt_class());
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E4D38200;
  v4 = v2;

  return v4;
}

+ (id)regionInfo
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a1, "_overridableGestaltForKey:expectedClass:", CFSTR("RegionInfo"), objc_opt_class());
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E4D38200;
  v4 = v2;

  return v4;
}

+ (id)productType
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a1, "_overridableGestaltForKey:expectedClass:", CFSTR("ProductType"), objc_opt_class());
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E4D38200;
  v4 = v2;

  return v4;
}

+ (id)chipID
{
  return (id)objc_msgSend(a1, "_overridableGestaltForKey:expectedClass:", CFSTR("ChipID"), objc_opt_class());
}

+ (BOOL)hasInternetTetheringCapability
{
  void *v2;
  char v3;

  objc_msgSend(a1, "_overridableGestaltForKey:expectedClass:", CFSTR("personal-hotspot"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (BOOL)hasTelephonyCapability
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__DMCMobileGestalt_hasTelephonyCapability__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (hasTelephonyCapability_onceToken != -1)
    dispatch_once(&hasTelephonyCapability_onceToken, block);
  return hasTelephonyCapability_hasTelephony;
}

void __42__DMCMobileGestalt_hasTelephonyCapability__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_overridableGestaltForKey:expectedClass:", CFSTR("telephony"), objc_opt_class());
  v1 = (id)objc_claimAutoreleasedReturnValue();
  hasTelephonyCapability_hasTelephony = objc_msgSend(v1, "BOOLValue");

}

+ (BOOL)hasCellularDataCapability
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__DMCMobileGestalt_hasCellularDataCapability__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (hasCellularDataCapability_onceToken != -1)
    dispatch_once(&hasCellularDataCapability_onceToken, block);
  return hasCellularDataCapability_hasCellularData;
}

void __45__DMCMobileGestalt_hasCellularDataCapability__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_overridableGestaltForKey:expectedClass:", CFSTR("cellular-data"), objc_opt_class());
  v1 = (id)objc_claimAutoreleasedReturnValue();
  hasCellularDataCapability_hasCellularData = objc_msgSend(v1, "BOOLValue");

}

+ (BOOL)hasBattery
{
  void *v2;
  char v3;

  objc_msgSend(a1, "_overridableGestaltForKey:expectedClass:", CFSTR("pX2TxZTxWKS7QSXZDC/Z6A"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (id)marketingVersion
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a1, "_overridableGestaltForKey:expectedClass:", CFSTR("ProductVersion"), objc_opt_class());
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E4D38200;
  v4 = v2;

  return v4;
}

+ (id)buildVersion
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a1, "_overridableGestaltForKey:expectedClass:", CFSTR("BuildVersion"), objc_opt_class());
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E4D38200;
  v4 = v2;

  return v4;
}

+ (id)supplementalMarketingVersionExtra
{
  return (id)objc_msgSend(a1, "_overridableGestaltForKey:expectedClass:", CFSTR("ProductVersionExtra"), objc_opt_class());
}

+ (id)supplementalBuildVersion
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a1, "_overridableGestaltForKey:expectedClass:", CFSTR("SupplementalBuildVersion"), objc_opt_class());
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E4D38200;
  v4 = v2;

  return v4;
}

+ (id)supplementalMarketingVersion
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a1, "marketingVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(a1, "supplementalMarketingVersionExtra");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    objc_msgSend(v4, "appendFormat:", CFSTR(" (%@)"), v5);

  return v4;
}

+ (id)diskUsage
{
  return (id)objc_msgSend(a1, "_overridableGestaltForKey:expectedClass:", CFSTR("DiskUsage"), objc_opt_class());
}

+ (id)deviceCapacity
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "diskUsage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0DE2CB8];
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0DE2CB8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)diskCapacity
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "diskUsage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0DE2CC0];
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0DE2CC0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)availableCapacity
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "diskUsage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0DE2CA0];
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0DE2CA0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
