@implementation NSDictionary(CKUtilities)

- (id)__ck_localizedAppNameForTranscriptAttribution
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0D37F20]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0D37F30]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(":"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CA5860], "bundleProxyForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D37600]);
  v9 = v2;
  if ((v8 & 1) == 0)
  {
    if (IMStringIsEmpty())
      v9 = v2;
    else
      v9 = v7;
  }
  v10 = v9;

  return v10;
}

- (id)__ck_bundleIdentifier
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0D37F30]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR(":"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
