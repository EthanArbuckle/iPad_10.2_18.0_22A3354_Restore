@implementation CPSWebClip

- (id)_init
{
  CPSWebClip *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSString *identifier;
  CPSWebClip *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPSWebClip;
  v2 = -[CPSWebClip init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_24C3BB3D8);
    v5 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v5;

    v2->_bundleVersion = 1;
    v2->_webClipType = 1;
    v7 = v2;
  }

  return v2;
}

- (id)_initWithIdentifier:(id)a3 webClipDictionary:(id)a4
{
  id v7;
  id v8;
  CPSWebClip *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *title;
  uint64_t v18;
  NSString *applicationBundleIdentifier;
  uint64_t v20;
  NSString *fullAppName;
  uint64_t v22;
  NSString *fullAppCaption;
  void *v24;
  void *v25;
  uint64_t v26;
  NSURL *fullAppStoreURL;
  uint64_t v28;
  NSDate *lastActivatedTime;
  uint64_t v30;
  CPSWebClip *v31;
  objc_super v33;

  v7 = a3;
  v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)CPSWebClip;
  v9 = -[CPSWebClip init](&v33, sel_init);
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v8, "safari_stringForKey:", CFSTR("URL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLWithString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSWebClip setPageURL:](v9, "setPageURL:", v12);

    v13 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v8, "safari_stringForKey:", CFSTR("RegisteredURL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLWithString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSWebClip setRegisteredURL:](v9, "setRegisteredURL:", v15);

    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_msgSend(v8, "safari_stringForKey:", CFSTR("Title"));
    v16 = objc_claimAutoreleasedReturnValue();
    title = v9->_title;
    v9->_title = (NSString *)v16;

    objc_msgSend(v8, "safari_stringForKey:", CFSTR("ApplicationBundleIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifier = v9->_applicationBundleIdentifier;
    v9->_applicationBundleIdentifier = (NSString *)v18;

    v9->_bundleVersion = (int)objc_msgSend(v8, "_web_intForKey:", CFSTR("ApplicationBundleVersion"));
    v9->_scenelessBackgroundLaunch = objc_msgSend(v8, "safari_BOOLForKey:", CFSTR("ScenelessBackgroundLaunch"));
    v9->_poweredBy = objc_msgSend(v8, "safari_BOOLForKey:", CFSTR("PoweredBy"));
    objc_msgSend(v8, "safari_stringForKey:", CFSTR("FullAppName"));
    v20 = objc_claimAutoreleasedReturnValue();
    fullAppName = v9->_fullAppName;
    v9->_fullAppName = (NSString *)v20;

    objc_msgSend(v8, "safari_stringForKey:", CFSTR("FullAppCaption"));
    v22 = objc_claimAutoreleasedReturnValue();
    fullAppCaption = v9->_fullAppCaption;
    v9->_fullAppCaption = (NSString *)v22;

    v24 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v8, "safari_stringForKey:", CFSTR("FullAppStoreURL"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "URLWithString:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    fullAppStoreURL = v9->_fullAppStoreURL;
    v9->_fullAppStoreURL = (NSURL *)v26;

    objc_msgSend(v8, "safari_dateForKey:", CFSTR("LastActivatedTime"));
    v28 = objc_claimAutoreleasedReturnValue();
    lastActivatedTime = v9->_lastActivatedTime;
    v9->_lastActivatedTime = (NSDate *)v28;

    if (objc_msgSend(v8, "safari_BOOLForKey:", CFSTR("IsAppClip")))
    {
      v30 = 1;
    }
    else if (-[NSString isEqualToString:](v9->_applicationBundleIdentifier, "isEqualToString:", CFSTR("com.apple.shortcuts")))
    {
      v30 = 4;
    }
    else if (objc_msgSend(v8, "safari_BOOLForKey:", CFSTR("FullScreen")))
    {
      v30 = 3;
    }
    else
    {
      if (v9->_applicationBundleIdentifier)
      {
        v9->_webClipType = 0;
LABEL_12:
        v31 = v9;
        goto LABEL_13;
      }
      v30 = 2;
    }
    v9->_webClipType = v30;
    goto LABEL_12;
  }
LABEL_13:

  return v9;
}

- (void)_updateWithClipMetadata:(id)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  NSString *title;
  NSString *v8;
  NSString *applicationBundleIdentifier;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  NSString *temporaryIconPath;
  NSString *v14;
  NSString *fullAppName;
  NSString *v16;
  NSString *fullAppCaption;
  NSURL *v18;
  NSURL *fullAppStoreURL;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  self->_poweredBy = objc_msgSend(v22, "isPoweredByThirdParty");
  objc_msgSend(v22, "bundleDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_poweredBy || !objc_msgSend(v4, "length"))
  {
    objc_msgSend(v22, "clipName");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v22, "bundleDisplayName");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  title = self->_title;
  self->_title = v6;

  objc_msgSend(v22, "clipBundleID");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  self->_applicationBundleIdentifier = v8;

  if (objc_msgSend(v22, "hasFullAppInstalledOnSystem"))
  {
    objc_msgSend(v22, "fullAppBundleID");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = self->_applicationBundleIdentifier;
    self->_applicationBundleIdentifier = v10;

  }
  objc_msgSend(v22, "fullAppCachedIconFilePath");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  temporaryIconPath = self->_temporaryIconPath;
  self->_temporaryIconPath = v12;

  objc_msgSend(v22, "fullAppName");
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  fullAppName = self->_fullAppName;
  self->_fullAppName = v14;

  objc_msgSend(v22, "fullAppCaption");
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  fullAppCaption = self->_fullAppCaption;
  self->_fullAppCaption = v16;

  objc_msgSend(v22, "fullAppStoreURL");
  v18 = (NSURL *)objc_claimAutoreleasedReturnValue();
  fullAppStoreURL = self->_fullAppStoreURL;
  self->_fullAppStoreURL = v18;

  objc_msgSend(v22, "clipLaunchURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSWebClip setPageURL:](self, "setPageURL:", v20);

  objc_msgSend(v22, "clipURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSWebClip setRegisteredURL:](self, "setRegisteredURL:", v21);

}

- (NSDictionary)_dictionaryRepresentation
{
  id v3;
  NSURL *pageURL;
  void *v5;
  NSURL *registeredURL;
  void *v7;
  NSString *title;
  NSString *applicationBundleIdentifier;
  void *v10;
  NSString *fullAppName;
  NSString *fullAppCaption;
  NSURL *fullAppStoreURL;
  void *v14;
  void *v15;
  void *v16;
  NSDate *lastActivatedTime;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  pageURL = self->_pageURL;
  if (pageURL)
  {
    -[NSURL absoluteString](pageURL, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("URL"));

  }
  registeredURL = self->_registeredURL;
  if (registeredURL)
  {
    -[NSURL absoluteString](registeredURL, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("RegisteredURL"));

  }
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", title, CFSTR("Title"));
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  if (applicationBundleIdentifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", applicationBundleIdentifier, CFSTR("ApplicationBundleIdentifier"));
  if (self->_bundleVersion)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("ApplicationBundleVersion"));

  }
  fullAppName = self->_fullAppName;
  if (fullAppName)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", fullAppName, CFSTR("FullAppName"));
  fullAppCaption = self->_fullAppCaption;
  if (fullAppCaption)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", fullAppCaption, CFSTR("FullAppCaption"));
  fullAppStoreURL = self->_fullAppStoreURL;
  if (fullAppStoreURL)
  {
    -[NSURL absoluteString](fullAppStoreURL, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("FullAppStoreURL"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_scenelessBackgroundLaunch);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("ScenelessBackgroundLaunch"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("IsAppClip"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_poweredBy);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("PoweredBy"));

  lastActivatedTime = self->_lastActivatedTime;
  if (lastActivatedTime)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", lastActivatedTime, CFSTR("LastActivatedTime"));
  return (NSDictionary *)v3;
}

- (id)_bundleResourceWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  +[CPSWebClipStore _urlForWebClipWithIdentifier:](CPSWebClipStore, "_urlForWebClipWithIdentifier:", self->_identifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLForResource:withExtension:subdirectory:", v4, CFSTR("png"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)title
{
  if (self->_title)
    return self->_title;
  else
    return (NSString *)CFSTR("Untitled");
}

- (NSString)bundleIdentifier
{
  int64_t webClipType;
  NSString *identifier;
  __CFString *v4;
  NSString *v5;

  webClipType = self->_webClipType;
  if (webClipType == 3)
  {
    identifier = self->_identifier;
    v4 = CFSTR("com.apple.webapp-");
  }
  else
  {
    if (webClipType != 1)
    {
      v5 = self->_identifier;
      return v5;
    }
    identifier = self->_identifier;
    v4 = CFSTR("com.apple.appclip-");
  }
  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", identifier);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (NSUserActivity)appClipUserActivity
{
  id v3;
  void *v4;

  v3 = objc_alloc(MEMORY[0x24BDC1598]);
  v4 = (void *)objc_msgSend(v3, "initWithActivityType:", *MEMORY[0x24BDD13E8]);
  objc_msgSend(v4, "setWebpageURL:", self->_pageURL);
  return (NSUserActivity *)v4;
}

- (void)setPageURL:(id)a3
{
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "cps_isHTTPFamilyURL"))
    objc_storeStrong((id *)&self->_pageURL, a3);

}

- (void)setRegisteredURL:(id)a3
{
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "cps_isHTTPFamilyURL"))
    objc_storeStrong((id *)&self->_registeredURL, a3);

}

- (NSString)iconImagePath
{
  void *v2;
  void *v3;
  void *v4;
  NSString *v5;

  -[CPSWebClip _bundleResourceWithName:](self, "_bundleResourceWithName:", CFSTR("icon"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "fileExistsAtPath:", v2))
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (CGImage)iconImage
{
  CGImage *result;
  void *v4;
  void *v5;

  result = self->_iconImage;
  if (!result)
  {
    -[CPSWebClip _bundleResourceWithName:](self, "_bundleResourceWithName:", CFSTR("icon"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      self->_iconImage = CPSCreateImageWithContentsOfFile(v4);

    return self->_iconImage;
  }
  return result;
}

+ (NSArray)appClips
{
  void *v2;
  void *v3;

  +[CPSWebClipStore sharedStore](CPSWebClipStore, "sharedStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_fetchInstalledAppClips");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)localizedSubtitle
{
  NSObject *v3;
  void *v4;
  NSString *applicationBundleIdentifier;
  NSObject *v6;
  dispatch_time_t v7;
  id v8;
  id v10;
  NSString *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  NSObject *v18;
  CPSWebClip *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  if (self->_webClipType != 1)
    return (NSString *)0;
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__4;
  v25 = __Block_byref_object_dispose__4;
  v26 = 0;
  +[CPSClipDataSQLiteStore defaultStore](CPSClipDataSQLiteStore, "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __31__CPSWebClip_localizedSubtitle__block_invoke;
  v17[3] = &unk_24C3B9BF8;
  v6 = v3;
  v19 = self;
  v20 = &v21;
  v18 = v6;
  objc_msgSend(v4, "getAppClipRecordWithBundleID:completion:", applicationBundleIdentifier, v17);

  v7 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v6, v7);
  if (objc_msgSend((id)v22[5], "length"))
  {
    v8 = (id)v22[5];
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x24BDC1540]);
    v11 = self->_applicationBundleIdentifier;
    v16 = 0;
    v12 = (void *)objc_msgSend(v10, "initWithBundleIdentifier:allowPlaceholder:error:", v11, 1, &v16);
    v13 = v16;
    objc_msgSend(v12, "localizedName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13 || !objc_msgSend(v14, "length"))
    {
      v8 = 0;
    }
    else
    {
      +[CPSUtilities poweredByCaptionForAppName:](CPSUtilities, "poweredByCaptionForAppName:", v15);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  _Block_object_dispose(&v21, 8);

  return (NSString *)v8;
}

void __31__CPSWebClip_localizedSubtitle__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  int v5;
  void *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(unsigned __int8 *)(v4 + 25);
    if (*(_BYTE *)(v4 + 25))
    {
      objc_msgSend(v7, "fullApplicationName");
      v2 = objc_claimAutoreleasedReturnValue();
      +[CPSUtilities poweredByCaptionForAppName:](CPSUtilities, "poweredByCaptionForAppName:", v2);
    }
    else
    {
      objc_msgSend(v7, "fullApplicationCaption");
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v6);
    if (v5)
    {

      v6 = (void *)v2;
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  unint64_t v18;
  void *v19;
  int64_t v20;
  void *v21;
  NSString *identifier;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  identifier = self->_identifier;
  v23 = (void *)MEMORY[0x24BDD17C8];
  v20 = -[CPSWebClip webClipType](self, "webClipType");
  -[CPSWebClip title](self, "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CPSWebClip bundleVersion](self, "bundleVersion");
  -[CPSWebClip bundleIdentifier](self, "bundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CPSWebClip scenelessBackgroundLaunch](self, "scenelessBackgroundLaunch");
  -[CPSWebClip applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSWebClip pageURL](self, "pageURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSWebClip registeredURL](self, "registeredURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSWebClip registeredURL](self, "registeredURL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "absoluteString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "cps_sha256String");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSWebClip appClipUserActivity](self, "appClipUserActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPSWebClipStore _urlForWebClipWithIdentifier:](CPSWebClipStore, "_urlForWebClipWithIdentifier:", self->_identifier);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSWebClip iconImagePath](self, "iconImagePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSWebClip localizedSubtitle](self, "localizedSubtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSWebClip fullAppName](self, "fullAppName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSWebClip fullAppCaption](self, "fullAppCaption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSWebClip fullAppStoreURL](self, "fullAppStoreURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CPSWebClip isApplicationInstalled](self, "isApplicationInstalled");
  -[CPSWebClip _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: \n  webClipType = %ld,\n  title = %@,\n  bundleVersion = %lu,\n  bundleIdentifier = %@,\n  scenelessBackgroundLaunch = %d,\n  applicationBundleIdentifier = %@,\n  pageURL = %@,\n  registeredURL = %@,\n  registeredURLHash = %@,\n  appClipUserActivity = %@,\n  path = %@,\n  iconImagePath = %@,\n  localizedSubtitle = %@,\n  fullAppName = %@,\n  fullAppCaption = %@,\n  fullAppStoreURL = %@,\n  applicationInstalled = %d,\n  dictionaryRepresentation = %@"), identifier, v20, v19, v18, v17, v16, v27, v14, v26, v13, v3, v12, v4, v5, v6, v7,
    v8,
    v9,
    v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (BOOL)isApplicationInstalled
{
  void *v2;
  BOOL v3;
  BOOL v4;
  char v6;

  v6 = 0;
  +[CPSUtilities versionIdentifierForAppWithBundleIdentifier:isPlaceholder:](CPSUtilities, "versionIdentifierForAppWithBundleIdentifier:isPlaceholder:", self->_applicationBundleIdentifier, &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v6 == 0;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)_temporaryIconPath
{
  return self->_temporaryIconPath;
}

- (void)set_temporaryIconPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (NSURL)registeredURL
{
  return self->_registeredURL;
}

- (int64_t)webClipType
{
  return self->_webClipType;
}

- (BOOL)scenelessBackgroundLaunch
{
  return self->_scenelessBackgroundLaunch;
}

- (void)setScenelessBackgroundLaunch:(BOOL)a3
{
  self->_scenelessBackgroundLaunch = a3;
}

- (BOOL)isPoweredBy
{
  return self->_poweredBy;
}

- (void)setPoweredBy:(BOOL)a3
{
  self->_poweredBy = a3;
}

- (NSString)fullAppName
{
  return self->_fullAppName;
}

- (void)setFullAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)fullAppCaption
{
  return self->_fullAppCaption;
}

- (void)setFullAppCaption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSURL)fullAppStoreURL
{
  return self->_fullAppStoreURL;
}

- (void)setFullAppStoreURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDate)lastActivatedTime
{
  return self->_lastActivatedTime;
}

- (void)setLastActivatedTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActivatedTime, 0);
  objc_storeStrong((id *)&self->_fullAppStoreURL, 0);
  objc_storeStrong((id *)&self->_fullAppCaption, 0);
  objc_storeStrong((id *)&self->_fullAppName, 0);
  objc_storeStrong((id *)&self->_registeredURL, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_temporaryIconPath, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
}

@end
