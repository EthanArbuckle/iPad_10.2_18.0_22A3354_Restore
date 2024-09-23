@implementation VSLSApplicationRecord

+ (BOOL)isAppStoreVendableForBundleIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CA5870];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);

  LOBYTE(v4) = objc_msgSend(v5, "isAppStoreVendable");
  return (char)v4;
}

+ (BOOL)isDeletableForBundleIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CA5870];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);

  LOBYTE(v4) = objc_msgSend(v5, "isDeletable");
  return (char)v4;
}

@end
