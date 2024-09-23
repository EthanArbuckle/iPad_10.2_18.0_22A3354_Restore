@implementation BSPlatform

+ (id)sharedInstance
{
  if (qword_1ECD39738 != -1)
    dispatch_once(&qword_1ECD39738, &__block_literal_global_3);
  return (id)qword_1ECD39730;
}

- (int)deviceClass
{
  if (qword_1ECD397A0 != -1)
    dispatch_once(&qword_1ECD397A0, &__block_literal_global_18);
  return dword_1ECD3972C;
}

- (int64_t)homeButtonType
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__BSPlatform_homeButtonType__block_invoke;
  block[3] = &unk_1E1EBE890;
  block[4] = self;
  if (qword_1ECD397B0 != -1)
    dispatch_once(&qword_1ECD397B0, block);
  return qword_1ECD397A8;
}

void __25__BSPlatform_deviceClass__block_invoke()
{
  void *v0;
  int v1;
  int v2;

  v0 = (void *)MGCopyAnswer();
  v1 = objc_msgSend(v0, "intValue");
  if (v0)
    CFRelease(v0);
  if ((v1 - 1) > 5)
    v2 = -1;
  else
    v2 = dword_18A21D278[v1 - 1];
  dword_1ECD3972C = v2;
}

void __28__BSPlatform_homeButtonType__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;

  v2 = MGGetSInt32Answer();
  v3 = 2 * (v2 == 2);
  if (v2 == 1)
    v3 = 1;
  qword_1ECD397A8 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = (const __CFDictionary *)MGCopyAnswer();
    if (v4)
    {
      v5 = v4;
      CFDictionaryGetValue(v4, CFSTR("ArtworkDeviceSubType"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
        v8 = objc_msgSend(v6, "intValue") == 2436;
      else
        v8 = 0;
      CFRelease(v5);

      if (v8)
        qword_1ECD397A8 = 2;
    }
  }
}

- (BOOL)hasGasGauge
{
  if (qword_1ECD397F8 != -1)
    dispatch_once(&qword_1ECD397F8, &__block_literal_global_46);
  return byte_1ECD3972A;
}

void __28__BSPlatform_sharedInstance__block_invoke()
{
  BSPlatform *v0;
  void *v1;

  v0 = objc_alloc_init(BSPlatform);
  v1 = (void *)qword_1ECD39730;
  qword_1ECD39730 = (uint64_t)v0;

}

- (NSString)productVersion
{
  if (qword_1ECD39748 != -1)
    dispatch_once(&qword_1ECD39748, &__block_literal_global_1);
  return (NSString *)(id)objc_msgSend((id)qword_1ECD39740, "copy");
}

void __28__BSPlatform_productVersion__block_invoke()
{
  uint64_t v0;
  void *v1;

  MGCopyAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD39740;
  qword_1ECD39740 = v0;

}

- (NSString)productBuildVersion
{
  if (qword_1ECD39758 != -1)
    dispatch_once(&qword_1ECD39758, &__block_literal_global_3_0);
  return (NSString *)(id)objc_msgSend((id)qword_1ECD39750, "copy");
}

void __33__BSPlatform_productBuildVersion__block_invoke()
{
  uint64_t v0;
  void *v1;

  MGCopyAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD39750;
  qword_1ECD39750 = v0;

}

- (NSString)productType
{
  if (qword_1ECD39768 != -1)
    dispatch_once(&qword_1ECD39768, &__block_literal_global_6);
  return (NSString *)(id)objc_msgSend((id)qword_1ECD39760, "copy");
}

void __25__BSPlatform_productType__block_invoke()
{
  uint64_t v0;
  void *v1;

  MGCopyAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD39760;
  qword_1ECD39760 = v0;

}

- (NSString)productHardwareModel
{
  if (qword_1ECD39778 != -1)
    dispatch_once(&qword_1ECD39778, &__block_literal_global_9);
  return (NSString *)(id)objc_msgSend((id)qword_1ECD39770, "copy");
}

void __34__BSPlatform_productHardwareModel__block_invoke()
{
  uint64_t v0;
  void *v1;

  MGCopyAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD39770;
  qword_1ECD39770 = v0;

}

- (NSString)productHardwareModelName
{
  if (qword_1ECD39788 != -1)
    dispatch_once(&qword_1ECD39788, &__block_literal_global_12);
  return (NSString *)(id)objc_msgSend((id)qword_1ECD39780, "copy");
}

void __38__BSPlatform_productHardwareModelName__block_invoke()
{
  uint64_t v0;
  void *v1;

  MGCopyAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD39780;
  qword_1ECD39780 = v0;

}

- (NSString)productClass
{
  if (qword_1ECD39798 != -1)
    dispatch_once(&qword_1ECD39798, &__block_literal_global_15);
  return (NSString *)(id)objc_msgSend((id)qword_1ECD39790, "copy");
}

void __26__BSPlatform_productClass__block_invoke()
{
  uint64_t v0;
  void *v1;

  MGCopyAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD39790;
  qword_1ECD39790 = v0;

}

- (NSString)localizedProductName
{
  if (qword_1ECD397C0 != -1)
    dispatch_once(&qword_1ECD397C0, &__block_literal_global_27);
  return (NSString *)(id)objc_msgSend((id)qword_1ECD397B8, "copy");
}

void __34__BSPlatform_localizedProductName__block_invoke()
{
  uint64_t v0;
  void *v1;

  MGCopyAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD397B8;
  qword_1ECD397B8 = v0;

}

- (NSString)operatingSystemName
{
  if (qword_1ECD397D0 != -1)
    dispatch_once(&qword_1ECD397D0, &__block_literal_global_30);
  return (NSString *)(id)objc_msgSend((id)qword_1ECD397C8, "copy");
}

void __33__BSPlatform_operatingSystemName__block_invoke()
{
  uint64_t v0;
  void *v1;

  MGCopyAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD397C8;
  qword_1ECD397C8 = v0;

}

- (NSString)uniqueDeviceIdentifier
{
  if (qword_1ECD397E0 != -1)
    dispatch_once(&qword_1ECD397E0, &__block_literal_global_33);
  return (NSString *)(id)objc_msgSend((id)qword_1ECD397D8, "copy");
}

void __36__BSPlatform_uniqueDeviceIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;

  MGCopyAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD397D8;
  qword_1ECD397D8 = v0;

}

- (BOOL)isInternalInstall
{
  return os_variant_has_internal_content();
}

- (BOOL)isDeveloperInstall
{
  if (qword_1ECD397E8 != -1)
    dispatch_once(&qword_1ECD397E8, &__block_literal_global_37);
  return _MergedGlobals_6;
}

void __32__BSPlatform_isDeveloperInstall__block_invoke()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    _MergedGlobals_6 = CFEqual(v0, CFSTR("Beta")) != 0;
    CFRelease(v1);
  }
}

- (BOOL)isCarrierInstall
{
  if (qword_1ECD397F0 != -1)
    dispatch_once(&qword_1ECD397F0, &__block_literal_global_42);
  return byte_1ECD39729;
}

void __30__BSPlatform_isCarrierInstall__block_invoke()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    byte_1ECD39729 = CFEqual(v0, CFSTR("Carrier")) != 0;
    CFRelease(v1);
  }
}

- (BOOL)isMultiCore
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "processorCount") > 1;

  return v3;
}

uint64_t __25__BSPlatform_hasGasGauge__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  byte_1ECD3972A = result;
  return result;
}

- (BOOL)hasOrbCapability
{
  if (qword_1ECD39800 != -1)
    dispatch_once(&qword_1ECD39800, &__block_literal_global_49);
  return byte_1ECD3972B;
}

uint64_t __30__BSPlatform_hasOrbCapability__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  byte_1ECD3972B = result;
  return result;
}

@end
