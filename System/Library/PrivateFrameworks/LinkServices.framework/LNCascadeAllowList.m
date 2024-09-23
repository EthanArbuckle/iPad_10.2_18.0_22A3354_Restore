@implementation LNCascadeAllowList

+ (BOOL)isAllowedItem:(id)a3 clientBundleID:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isEqual:", CFSTR("com.apple.mail")) & 1) != 0
    || (objc_msgSend(v6, "isEqual:", CFSTR("com.apple.mobilemail")) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "attributeSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributeForKey:", CFSTR("_kMDItemAppEntityTypeIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (objc_msgSend(v6, "isEqual:", CFSTR("com.apple.mobileslideshow")) & 1) == 0
      && !objc_msgSend(v6, "isEqual:", CFSTR("com.apple.Photos"))
      || (objc_msgSend(v9, "isEqual:", CFSTR("AssetEntity")) & 1) == 0;

  }
  return v7;
}

@end
