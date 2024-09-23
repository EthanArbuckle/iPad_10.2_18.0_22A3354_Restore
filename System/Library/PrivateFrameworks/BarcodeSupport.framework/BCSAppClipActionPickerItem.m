@implementation BCSAppClipActionPickerItem

- (id)icon
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  float v9;
  uint64_t v10;

  -[BCSActionPickerItem action](self, "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clipMetadataRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getDownloadedIconURLSynchronously");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)appclipIconCache;
  if (!appclipIconCache)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCE40]);
    v7 = (void *)appclipIconCache;
    appclipIconCache = (uint64_t)v6;

    objc_msgSend((id)appclipIconCache, "setCountLimit:", 8);
    v5 = (void *)appclipIconCache;
  }
  objc_msgSend(v5, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (v4 && (MGGetFloat32Answer(), (v10 = _bcs_iconWithAppclipTreatment(v4, v9)) != 0))
    {
      v8 = (void *)objc_msgSend(objc_alloc((Class)getUIImageClass()), "initWithCGImage:", v10);
      objc_msgSend((id)appclipIconCache, "setObject:forKey:", v8, v4);
    }
    else
    {
      objc_msgSend(getUIImageClass(), "systemImageNamed:", CFSTR("appclip"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

- (id)label
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[BCSActionPickerItem action](self, "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clipMetadataRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getClipMetadataSynchronously");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    _BCSLocalizedString(CFSTR("%@ %@"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clipOpenButtonTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clipName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _BCSLocalizedString(CFSTR("Open App Clip"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)useInlineMenu
{
  return 1;
}

@end
