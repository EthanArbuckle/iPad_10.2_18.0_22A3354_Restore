@implementation NSLocale(NTKLocaleOverride)

+ (void)__loadSwizzledCurrentLocaleIfNeeded
{
  if (__loadSwizzledCurrentLocaleIfNeeded_onceToken != -1)
    dispatch_once(&__loadSwizzledCurrentLocaleIfNeeded_onceToken, &__block_literal_global_72_0);
}

+ (void)__setCurrentLocal:()NTKLocaleOverride
{
  id v4;
  id v5;

  objc_storeStrong((id *)&__currentLocaleOverride, obj);
  v4 = obj;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", *MEMORY[0x1E0C99720], __currentLocaleOverride);

}

+ (id)__userCurrentLocale
{
  return (id)__currentLocaleOverride;
}

@end
