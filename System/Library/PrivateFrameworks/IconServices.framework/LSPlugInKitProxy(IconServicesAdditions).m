@implementation LSPlugInKitProxy(IconServicesAdditions)

- (id)__IS_iconDataForVariant:()IconServicesAdditions withOptions:
{
  void *v7;
  void *v8;
  objc_super v10;

  if ((objc_msgSend(a1, "__IS_canProvideIcon") & 1) != 0
    || (objc_msgSend(a1, "containingBundle"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "__IS_iconDataForVariant:withOptions:", a3, a4),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    v10.receiver = a1;
    v10.super_class = (Class)&off_1EEB9B348;
    objc_msgSendSuper2(&v10, sel___IS_iconDataForVariant_withOptions_, a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (uint64_t)__IS_canProvideIcon
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  _BOOL8 v7;
  void *v8;

  if (__IS_canProvideIcon_onceToken != -1)
    dispatch_once(&__IS_canProvideIcon_onceToken, &__block_literal_global_27);
  v2 = __IS_canProvideIcon_extensionPointsWithIcons;
  objc_msgSend(a1, "protocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend((id)v2, "containsObject:", v3);

  if ((v2 & 1) != 0)
    return 1;
  objc_msgSend(a1, "containingBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.share"));

  if ((v6 & 1) != 0)
    return 1;
  objc_msgSend(a1, "containingBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8 == 0;

  return v7;
}

- (uint64_t)__IS_isWatchApp
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (__IS_isWatchApp_onceToken != -1)
    dispatch_once(&__IS_isWatchApp_onceToken, &__block_literal_global_11_0);
  v2 = (void *)__IS_isWatchApp_extensionPointsWithIcons;
  objc_msgSend(a1, "protocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (uint64_t)__IS_isMessagesApp
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (__IS_isMessagesApp_onceToken != -1)
    dispatch_once(&__IS_isMessagesApp_onceToken, &__block_literal_global_12);
  v2 = (void *)__IS_isMessagesApp_extensionPointsWithIcons;
  objc_msgSend(a1, "protocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

@end
