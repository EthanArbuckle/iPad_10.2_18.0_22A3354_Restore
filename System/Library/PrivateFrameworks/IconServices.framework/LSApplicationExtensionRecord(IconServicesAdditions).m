@implementation LSApplicationExtensionRecord(IconServicesAdditions)

- (uint64_t)_is_canProvideIconResources
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "extensionPointRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_IS_extensionsCanProvideIcon");

  if (v3)
  {
    objc_msgSend(a1, "iconDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
      return 1;
  }
  objc_msgSend(a1, "containingBundleRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1, "extensionPointRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "_IS_extensionsShouldFallbackToContainerIcon") ^ 1;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (uint64_t)_IS_isMessagesExtension
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "extensionPointRecord");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple.message-payload-provider"));

  return v3;
}

@end
