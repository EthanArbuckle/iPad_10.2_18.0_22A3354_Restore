@implementation NAUIDeviceUtilities

+ (BOOL)naui_isPad
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1;

  return v3;
}

+ (BOOL)naui_shouldUseLargeiPadLayout
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;

  return objc_msgSend(a1, "naui_shouldUseLargeiPadLayoutForSize:", v6, v8);
}

+ (BOOL)naui_shouldUseLargeiPadLayoutForSize:(CGSize)a3
{
  double height;
  double width;
  BOOL result;
  double v6;

  height = a3.height;
  width = a3.width;
  result = objc_msgSend(a1, "naui_isPad");
  if (width >= height)
    v6 = height;
  else
    v6 = width;
  if (v6 <= 768.0)
    return 0;
  return result;
}

+ (BOOL)naui_isUsingLandscapeOrientation
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)(objc_msgSend(v2, "statusBarOrientation") - 3) < 2;

  return v3;
}

- (NAUIDeviceUtilities)init
{

  return 0;
}

+ (id)productVersion
{
  if (productVersion___once != -1)
    dispatch_once(&productVersion___once, &__block_literal_global_0);
  return (id)objc_msgSend((id)productVersion___value, "copy");
}

void __37__NAUIDeviceUtilities_productVersion__block_invoke()
{
  uint64_t v0;
  void *v1;

  MGCopyAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)productVersion___value;
  productVersion___value = v0;

}

+ (id)productBuildVersion
{
  if (productBuildVersion___once != -1)
    dispatch_once(&productBuildVersion___once, &__block_literal_global_3);
  return (id)objc_msgSend((id)productBuildVersion___value, "copy");
}

void __42__NAUIDeviceUtilities_productBuildVersion__block_invoke()
{
  uint64_t v0;
  void *v1;

  MGCopyAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)productBuildVersion___value;
  productBuildVersion___value = v0;

}

+ (NSString)productType
{
  if (productType___once != -1)
    dispatch_once(&productType___once, &__block_literal_global_6);
  return (NSString *)(id)objc_msgSend((id)productType___value, "copy");
}

void __34__NAUIDeviceUtilities_productType__block_invoke()
{
  uint64_t v0;
  void *v1;

  MGCopyAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)productType___value;
  productType___value = v0;

}

+ (NSString)productHardwareModel
{
  if (productHardwareModel___once != -1)
    dispatch_once(&productHardwareModel___once, &__block_literal_global_9);
  return (NSString *)(id)objc_msgSend((id)productHardwareModel___value, "copy");
}

void __43__NAUIDeviceUtilities_productHardwareModel__block_invoke()
{
  uint64_t v0;
  void *v1;

  MGCopyAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)productHardwareModel___value;
  productHardwareModel___value = v0;

}

+ (NSString)productHardwareModelName
{
  if (productHardwareModelName___once != -1)
    dispatch_once(&productHardwareModelName___once, &__block_literal_global_12);
  return (NSString *)(id)objc_msgSend((id)productHardwareModelName___value, "copy");
}

void __47__NAUIDeviceUtilities_productHardwareModelName__block_invoke()
{
  uint64_t v0;
  void *v1;

  MGCopyAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)productHardwareModelName___value;
  productHardwareModelName___value = v0;

}

+ (NSString)productClass
{
  if (productClass___once != -1)
    dispatch_once(&productClass___once, &__block_literal_global_15);
  return (NSString *)(id)objc_msgSend((id)productClass___value, "copy");
}

void __35__NAUIDeviceUtilities_productClass__block_invoke()
{
  uint64_t v0;
  void *v1;

  MGCopyAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)productClass___value;
  productClass___value = v0;

}

+ (int)deviceClass
{
  if (deviceClass___once != -1)
    dispatch_once(&deviceClass___once, &__block_literal_global_18);
  return deviceClass___value;
}

void __34__NAUIDeviceUtilities_deviceClass__block_invoke()
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
    v2 = dword_216CF61B0[v1 - 1];
  deviceClass___value = v2;
}

+ (NSString)localizedProductName
{
  if (localizedProductName___once != -1)
    dispatch_once(&localizedProductName___once, &__block_literal_global_21);
  return (NSString *)(id)objc_msgSend((id)localizedProductName___value, "copy");
}

void __43__NAUIDeviceUtilities_localizedProductName__block_invoke()
{
  uint64_t v0;
  void *v1;

  MGCopyAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)localizedProductName___value;
  localizedProductName___value = v0;

}

+ (NSString)operatingSystemName
{
  if (operatingSystemName___once != -1)
    dispatch_once(&operatingSystemName___once, &__block_literal_global_24);
  return (NSString *)(id)objc_msgSend((id)operatingSystemName___value, "copy");
}

void __42__NAUIDeviceUtilities_operatingSystemName__block_invoke()
{
  uint64_t v0;
  void *v1;

  MGCopyAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)operatingSystemName___value;
  operatingSystemName___value = v0;

}

+ (NSString)uniqueDeviceIdentifier
{
  if (uniqueDeviceIdentifier___once != -1)
    dispatch_once(&uniqueDeviceIdentifier___once, &__block_literal_global_27);
  return (NSString *)(id)objc_msgSend((id)uniqueDeviceIdentifier___value, "copy");
}

void __45__NAUIDeviceUtilities_uniqueDeviceIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;

  MGCopyAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)uniqueDeviceIdentifier___value;
  uniqueDeviceIdentifier___value = v0;

}

+ (BOOL)hasOrbCapability
{
  if (hasOrbCapability___once != -1)
    dispatch_once(&hasOrbCapability___once, &__block_literal_global_30);
  return hasOrbCapability___value;
}

uint64_t __39__NAUIDeviceUtilities_hasOrbCapability__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  hasOrbCapability___value = result;
  return result;
}

+ (double)mainScreenScale
{
  if (mainScreenScale___once != -1)
    dispatch_once(&mainScreenScale___once, &__block_literal_global_33);
  return *(double *)&mainScreenScale_mainScreenScale;
}

void __38__NAUIDeviceUtilities_mainScreenScale__block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  mainScreenScale_mainScreenScale = v0;

}

@end
