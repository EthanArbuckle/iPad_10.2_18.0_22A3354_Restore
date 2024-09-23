@implementation NSBundle(AppStoreComponents)

+ (uint64_t)asc_realMainBundle
{
  return objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
}

+ (id)asc_frameworkBundle
{
  if (asc_frameworkBundle_onceToken[0] != -1)
    dispatch_once(asc_frameworkBundle_onceToken, &__block_literal_global_33);
  return (id)asc_frameworkBundle_appStoreComponents;
}

+ (const)asc_localizedStringKeyPlatformSuffix
{
  return CFSTR("_IOS");
}

@end
