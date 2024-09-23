@implementation EMFSearchEngineBundleLoader

+ (BOOL)isLocaleSupported:(id)a3
{
  if (a3)
    return CEMEMFSearchEngineIsLocaleSupported();
  else
    return 0;
}

+ (id)assetBundleForLocale:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFBundle *BundleForLocaleIdentifier;
  CFURLRef v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "localeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    BundleForLocaleIdentifier = (__CFBundle *)CEMEMFSearchEngineCreateBundleForLocaleIdentifier();

    if (BundleForLocaleIdentifier)
    {
      v7 = CFBundleCopyBundleURL(BundleForLocaleIdentifier);
      CFRelease(BundleForLocaleIdentifier);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v7);
      BundleForLocaleIdentifier = (__CFBundle *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    BundleForLocaleIdentifier = 0;
  }

  return BundleForLocaleIdentifier;
}

@end
