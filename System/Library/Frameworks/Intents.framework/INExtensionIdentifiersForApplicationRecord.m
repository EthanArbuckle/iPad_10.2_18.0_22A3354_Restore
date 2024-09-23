@implementation INExtensionIdentifiersForApplicationRecord

id __INExtensionIdentifiersForApplicationRecord_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "extensionPointRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.intents-service"));

  if (v5)
  {
    objc_msgSend(v2, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
