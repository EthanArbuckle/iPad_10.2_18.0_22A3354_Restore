@implementation NSBundle(IconServicesAdditions)

+ (id)__IS__frameworkBundle
{
  if (__IS__frameworkBundle_onceToken != -1)
    dispatch_once(&__IS__frameworkBundle_onceToken, &__block_literal_global_30);
  return (id)__IS__frameworkBundle_frameworkBundle;
}

+ (id)__IS__iconsetResourceBundle
{
  if (__IS__iconsetResourceBundle_onceToken != -1)
    dispatch_once(&__IS__iconsetResourceBundle_onceToken, &__block_literal_global_2);
  return (id)__IS__iconsetResourceBundle_resourceBundle;
}

+ (id)__IS__iconsetResourceAssetsCatalogURL
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "__IS__iconsetResourceBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("Assets"), CFSTR("car"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)__IS__frameworkLocalizedString:()IconServicesAdditions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "__IS__frameworkBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_1E5801B98, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
