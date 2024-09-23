@implementation NSBundle(IC)

- (uint64_t)ic_isAppExtension
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("NSExtension"));

  return v3;
}

- (uint64_t)ic_canEditNotes
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICNotesAppBundleIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqual:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICEditorExtensionBundleIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqual:", v6);

  }
  return v4;
}

@end
