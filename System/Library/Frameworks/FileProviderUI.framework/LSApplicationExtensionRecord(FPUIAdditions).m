@implementation LSApplicationExtensionRecord(FPUIAdditions)

+ (id)fpui_extensionRecordForIdentifier:()FPUIAdditions useCase:isUIExtension:
{
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (objc_class *)MEMORY[0x24BDC1528];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithBundleIdentifier:error:", v9, 0);

  objc_msgSend(a1, "fpui_extensionRecordByFiltering:useCase:isUIExtension:", v10, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)fpui_extensionRecordForURL:()FPUIAdditions useCase:isUIExtension:
{
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (objc_class *)MEMORY[0x24BDC1528];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithURL:error:", v9, 0);

  objc_msgSend(a1, "fpui_extensionRecordByFiltering:useCase:isUIExtension:", v10, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)fpui_extensionRecordByFiltering:()FPUIAdditions useCase:isUIExtension:
{
  id v8;
  int v9;
  id v10;

  v8 = a3;
  if (v8
    && ((v9 = objc_msgSend(a1, "_fpui_exactPlatformRequiredExtensionUseCase:isUIExtension:", a4, a5)) == 0
     || objc_msgSend(v8, "platform") == v9))
  {
    v10 = v8;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (uint64_t)_fpui_exactPlatformRequiredExtensionUseCase:()FPUIAdditions isUIExtension:
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (!a4)
    return 0;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordForCurrentProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    return 0;
  v5 = v4;
  v6 = objc_msgSend(v4, "platform");

  if ((v6 - 13) <= 0xFFFFFFFD)
    return 0;
  return v6;
}

- (id)fpui_extensionInfoForKey:()FPUIAdditions ofClass:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(a1, "infoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:ofClass:", CFSTR("NSExtension"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (id)fpui_entitlementValueForKey:()FPUIAdditions ofClass:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "entitlements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:ofClass:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
