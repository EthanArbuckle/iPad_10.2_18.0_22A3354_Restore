@implementation CPSClipMetadata

- (NSString)localizedTitleForClipSuggestion
{
  void *v3;
  id v4;
  void *v5;

  -[CPSClipMetadata clipName](self, "clipName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    -[CPSClipMetadata fullAppName](self, "fullAppName");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSString *)v5;
}

- (NSString)localizedSubtitleForClipSuggestion
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;

  if (-[CPSClipMetadata isPoweredByThirdParty](self, "isPoweredByThirdParty"))
  {
    -[CPSClipMetadata fullAppName](self, "fullAppName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPSUtilities poweredByCaptionForAppName:](CPSUtilities, "poweredByCaptionForAppName:", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = v4;
    goto LABEL_9;
  }
  -[CPSClipMetadata clipCaption](self, "clipCaption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
    v3 = v4;
    goto LABEL_5;
  }
  -[CPSClipMetadata fullAppCaption](self, "fullAppCaption");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_24C3BB3D8;
  if (v6)
    v8 = (__CFString *)v6;
  v5 = v8;

LABEL_9:
  return (NSString *)v5;
}

- (CPSClipMetadata)initWithDemoBundleURL:(id)a3
{
  id v4;
  CPSClipMetadata *v5;
  CPSClipMetadata *v6;
  void *v7;
  void *v8;
  void *v9;
  CPSClipMetadata *v10;
  uint64_t v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPSClipMetadata;
  v5 = -[CPSClipMetadata init](&v13, sel_init);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("Info.json"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      v12 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, &v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v10 = 0;
      }
      else
      {
        v6 = -[CPSClipMetadata initWithDictionary:bundleURL:](v6, "initWithDictionary:bundleURL:", v9, v4);
        v10 = v6;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CPSClipMetadata)initWithDictionary:(id)a3 bundleURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CPSClipMetadata *v15;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v7, "safari_stringForKey:", CFSTR("abrClipHeroImage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("abrClipHeroImage"));

  objc_msgSend(v7, "safari_stringForKey:", CFSTR("storeClipHeroImage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("storeClipHeroImage"));

  objc_msgSend(v7, "safari_stringForKey:", CFSTR("fullAppIconURL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "URLByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("fullAppIconURL"));
  v15 = -[CPSClipMetadata initWithUncheckedDictionary:](self, "initWithUncheckedDictionary:", v8);

  return v15;
}

- (CPSClipMetadata)initWithUncheckedDictionary:(id)a3
{
  id v4;
  CPSClipMetadata *v5;
  uint64_t v6;
  NSString *abrClipName;
  uint64_t v8;
  NSString *abrClipCaption;
  uint64_t v10;
  NSURL *abrClipHeroImageURL;
  void *v12;
  uint64_t v13;
  NSString *storeClipName;
  uint64_t v15;
  NSString *storeClipCaption;
  uint64_t v17;
  NSURL *storeClipHeroImageURL;
  uint64_t v19;
  NSString *clipBundleID;
  uint64_t v21;
  NSURL *clipBusinessIconURL;
  uint64_t v23;
  NSDictionary *clipBusinessIconStyleAttributes;
  uint64_t v25;
  NSNumber *clipMapItemMUID;
  void *v27;
  void *v28;
  uint64_t v29;
  NSURL *clipIpaURL;
  uint64_t v31;
  NSURL *clipURL;
  uint64_t v33;
  NSURL *clipRequestURL;
  uint64_t v35;
  NSURL *clipTargetURL;
  uint64_t v37;
  NSString *fullAppName;
  uint64_t v39;
  NSString *fullAppShortName;
  uint64_t v41;
  NSString *fullAppCaption;
  uint64_t v43;
  NSString *fullAppContentRating;
  uint64_t v45;
  NSString *fullAppBundleID;
  void *v47;
  void *v48;
  uint64_t v49;
  NSURL *fullAppStoreURL;
  uint64_t v51;
  NSURL *fullAppIconURL;
  uint64_t v53;
  NSNumber *itemID;
  uint64_t v55;
  NSString *webClipID;
  uint64_t v57;
  NSString *provider;
  uint64_t v59;
  NSArray *clipVerifiedAssociatedDomains;
  uint64_t v61;
  NSNumber *clipSize;
  CPSClipMetadata *v63;
  objc_super v65;

  v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)CPSClipMetadata;
  v5 = -[CPSClipMetadata init](&v65, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "safari_stringForKey:", CFSTR("abrClipName"));
    v6 = objc_claimAutoreleasedReturnValue();
    abrClipName = v5->_abrClipName;
    v5->_abrClipName = (NSString *)v6;

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("abrClipCaption"));
    v8 = objc_claimAutoreleasedReturnValue();
    abrClipCaption = v5->_abrClipCaption;
    v5->_abrClipCaption = (NSString *)v8;

    objc_msgSend(v4, "safari_URLForKey:", CFSTR("abrClipHeroImage"));
    v10 = objc_claimAutoreleasedReturnValue();
    abrClipHeroImageURL = v5->_abrClipHeroImageURL;
    v5->_abrClipHeroImageURL = (NSURL *)v10;

    objc_msgSend(v4, "safari_numberForKey:", CFSTR("abrClipAction"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_clipAction = objc_msgSend(v12, "integerValue");

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("storeClipName"));
    v13 = objc_claimAutoreleasedReturnValue();
    storeClipName = v5->_storeClipName;
    v5->_storeClipName = (NSString *)v13;

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("storeClipCaption"));
    v15 = objc_claimAutoreleasedReturnValue();
    storeClipCaption = v5->_storeClipCaption;
    v5->_storeClipCaption = (NSString *)v15;

    objc_msgSend(v4, "safari_URLForKey:", CFSTR("storeClipHeroImage"));
    v17 = objc_claimAutoreleasedReturnValue();
    storeClipHeroImageURL = v5->_storeClipHeroImageURL;
    v5->_storeClipHeroImageURL = (NSURL *)v17;

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("clipBundleID"));
    v19 = objc_claimAutoreleasedReturnValue();
    clipBundleID = v5->_clipBundleID;
    v5->_clipBundleID = (NSString *)v19;

    v5->_clipIncompatibleWithCurrentDevice = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("clipIncompatibleWithCurrentDevice"));
    objc_msgSend(v4, "safari_URLForKey:", CFSTR("clipBusinessIconURL"));
    v21 = objc_claimAutoreleasedReturnValue();
    clipBusinessIconURL = v5->_clipBusinessIconURL;
    v5->_clipBusinessIconURL = (NSURL *)v21;

    objc_msgSend(v4, "safari_dictionaryForKey:", CFSTR("clipBusinessIconStyleAttributes"));
    v23 = objc_claimAutoreleasedReturnValue();
    clipBusinessIconStyleAttributes = v5->_clipBusinessIconStyleAttributes;
    v5->_clipBusinessIconStyleAttributes = (NSDictionary *)v23;

    objc_msgSend(v4, "safari_numberForKey:", CFSTR("clipMapItemMUID"));
    v25 = objc_claimAutoreleasedReturnValue();
    clipMapItemMUID = v5->_clipMapItemMUID;
    v5->_clipMapItemMUID = (NSNumber *)v25;

    v27 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v4, "safari_stringForKey:", CFSTR("clipIpaURL"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "URLWithString:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    clipIpaURL = v5->_clipIpaURL;
    v5->_clipIpaURL = (NSURL *)v29;

    v5->_clipRequestsNotificationPermission = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("clipRequestsNotificationPermission"));
    v5->_clipRequestsLocationConfirmationPermission = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("clipRequestsLocationConfirmationPermission"));
    objc_msgSend(v4, "safari_URLForKey:", CFSTR("clipURL"));
    v31 = objc_claimAutoreleasedReturnValue();
    clipURL = v5->_clipURL;
    v5->_clipURL = (NSURL *)v31;

    objc_msgSend(v4, "safari_URLForKey:", CFSTR("clipRequestURL"));
    v33 = objc_claimAutoreleasedReturnValue();
    clipRequestURL = v5->_clipRequestURL;
    v5->_clipRequestURL = (NSURL *)v33;

    objc_msgSend(v4, "safari_URLForKey:", CFSTR("clipTargetURL"));
    v35 = objc_claimAutoreleasedReturnValue();
    clipTargetURL = v5->_clipTargetURL;
    v5->_clipTargetURL = (NSURL *)v35;

    v5->_hasBusinessItemMetadata = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("hasBusinessItemMetadata"));
    v5->_hasAppMetadata = 1;
    v5->_poweredByThirdParty = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("poweredByThirdParty"));
    objc_msgSend(v4, "safari_stringForKey:", CFSTR("fullAppName"));
    v37 = objc_claimAutoreleasedReturnValue();
    fullAppName = v5->_fullAppName;
    v5->_fullAppName = (NSString *)v37;

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("fullAppShortName"));
    v39 = objc_claimAutoreleasedReturnValue();
    fullAppShortName = v5->_fullAppShortName;
    v5->_fullAppShortName = (NSString *)v39;

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("fullAppCaption"));
    v41 = objc_claimAutoreleasedReturnValue();
    fullAppCaption = v5->_fullAppCaption;
    v5->_fullAppCaption = (NSString *)v41;

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("fullAppContentRating"));
    v43 = objc_claimAutoreleasedReturnValue();
    fullAppContentRating = v5->_fullAppContentRating;
    v5->_fullAppContentRating = (NSString *)v43;

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("fullAppBundleID"));
    v45 = objc_claimAutoreleasedReturnValue();
    fullAppBundleID = v5->_fullAppBundleID;
    v5->_fullAppBundleID = (NSString *)v45;

    v47 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v4, "safari_stringForKey:", CFSTR("fullAppStoreURL"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "URLWithString:", v48);
    v49 = objc_claimAutoreleasedReturnValue();
    fullAppStoreURL = v5->_fullAppStoreURL;
    v5->_fullAppStoreURL = (NSURL *)v49;

    objc_msgSend(v4, "safari_URLForKey:", CFSTR("fullAppIconURL"));
    v51 = objc_claimAutoreleasedReturnValue();
    fullAppIconURL = v5->_fullAppIconURL;
    v5->_fullAppIconURL = (NSURL *)v51;

    objc_msgSend(v4, "safari_numberForKey:", CFSTR("itemID"));
    v53 = objc_claimAutoreleasedReturnValue();
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v53;

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("webClipID"));
    v55 = objc_claimAutoreleasedReturnValue();
    webClipID = v5->_webClipID;
    v5->_webClipID = (NSString *)v55;

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("provider"));
    v57 = objc_claimAutoreleasedReturnValue();
    provider = v5->_provider;
    v5->_provider = (NSString *)v57;

    objc_msgSend(v4, "safari_arrayForKey:", CFSTR("clipVerifiedAssociatedDomains"));
    v59 = objc_claimAutoreleasedReturnValue();
    clipVerifiedAssociatedDomains = v5->_clipVerifiedAssociatedDomains;
    v5->_clipVerifiedAssociatedDomains = (NSArray *)v59;

    v5->_deviceCapabilitiesDontMatch = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("deviceCapabilitiesDontMatch"));
    v5->_isDeveloperOverride = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("isDeveloperOverride"));
    objc_msgSend(v4, "safari_numberForKey:", CFSTR("thinnedSize"));
    v61 = objc_claimAutoreleasedReturnValue();
    clipSize = v5->_clipSize;
    v5->_clipSize = (NSNumber *)v61;

    v63 = v5;
  }

  return v5;
}

- (CPSClipMetadata)initWithBusinessItem:(id)a3
{
  id v4;
  CPSClipMetadata *v5;
  CPSClipMetadata *v6;
  uint64_t v7;
  NSString *abrClipName;
  uint64_t v9;
  NSString *abrClipCaption;
  double v11;
  uint64_t v12;
  NSURL *abrClipHeroImageURL;
  uint64_t v14;
  NSURL *v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  NSString *clipBundleID;
  uint64_t v21;
  NSURL *clipURL;
  uint64_t v23;
  NSURL *clipBusinessIconURL;
  uint64_t v25;
  NSURL *clipTargetURL;
  uint64_t v27;
  NSString *clipURLHash;
  uint64_t v29;
  NSDictionary *clipBusinessIconStyleAttributes;
  uint64_t v31;
  NSNumber *clipMapItemMUID;
  CPSClipMetadata *v33;
  _QWORD v35[4];
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CPSClipMetadata;
  v5 = -[CPSClipMetadata init](&v36, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_hasBusinessItemMetadata = 1;
    objc_msgSend(v4, "title");
    v7 = objc_claimAutoreleasedReturnValue();
    abrClipName = v6->_abrClipName;
    v6->_abrClipName = (NSString *)v7;

    objc_msgSend(v4, "subtitle");
    v9 = objc_claimAutoreleasedReturnValue();
    abrClipCaption = v6->_abrClipCaption;
    v6->_abrClipCaption = (NSString *)v9;

    v35[0] = (unint64_t)_CPSHeroImagePreferredSize();
    v35[1] = (unint64_t)v11;
    v35[2] = "bb";
    v35[3] = "heic";
    objc_msgSend(v4, "heroImageURLForSpecifier:", v35);
    v12 = objc_claimAutoreleasedReturnValue();
    abrClipHeroImageURL = v6->_abrClipHeroImageURL;
    v6->_abrClipHeroImageURL = (NSURL *)v12;

    if (!v6->_abrClipHeroImageURL)
    {
      objc_msgSend(v4, "heroImageURL");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v6->_abrClipHeroImageURL;
      v6->_abrClipHeroImageURL = (NSURL *)v14;

    }
    v16 = objc_msgSend(v4, "action");
    v17 = v16 == 2;
    if (v16 == 3)
      v17 = 2;
    if ((unint64_t)(v16 - 4) >= 0xFFFFFFFFFFFFFFFDLL)
      v18 = v17;
    else
      v18 = 0;
    v6->_clipAction = v18;
    objc_msgSend(v4, "bundleID");
    v19 = objc_claimAutoreleasedReturnValue();
    clipBundleID = v6->_clipBundleID;
    v6->_clipBundleID = (NSString *)v19;

    objc_msgSend(v4, "linkURL");
    v21 = objc_claimAutoreleasedReturnValue();
    clipURL = v6->_clipURL;
    v6->_clipURL = (NSURL *)v21;

    objc_msgSend(v4, "iconImageURL");
    v23 = objc_claimAutoreleasedReturnValue();
    clipBusinessIconURL = v6->_clipBusinessIconURL;
    v6->_clipBusinessIconURL = (NSURL *)v23;

    objc_msgSend(v4, "redirectURL");
    v25 = objc_claimAutoreleasedReturnValue();
    clipTargetURL = v6->_clipTargetURL;
    v6->_clipTargetURL = (NSURL *)v25;

    objc_msgSend(v4, "fullHash");
    v27 = objc_claimAutoreleasedReturnValue();
    clipURLHash = v6->_clipURLHash;
    v6->_clipURLHash = (NSString *)v27;

    v6->_poweredByThirdParty = objc_msgSend(v4, "isPoweredBy");
    objc_msgSend(v4, "mapIconStyleAttributes");
    v29 = objc_claimAutoreleasedReturnValue();
    clipBusinessIconStyleAttributes = v6->_clipBusinessIconStyleAttributes;
    v6->_clipBusinessIconStyleAttributes = (NSDictionary *)v29;

    objc_msgSend(v4, "mapItemMUID");
    v31 = objc_claimAutoreleasedReturnValue();
    clipMapItemMUID = v6->_clipMapItemMUID;
    v6->_clipMapItemMUID = (NSNumber *)v31;

    v33 = v6;
  }

  return v6;
}

- (CPSClipMetadata)initWithDeveloperOverride:(id)a3 invocationURL:(id)a4
{
  id v6;
  id v7;
  CPSClipMetadata *v8;
  CPSClipMetadata *v9;
  uint64_t v10;
  NSString *clipBundleID;
  uint64_t v12;
  NSString *abrClipName;
  uint64_t v14;
  NSString *abrClipCaption;
  uint64_t v16;
  NSURL *abrClipHeroImageURL;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSURL *fullAppIconURL;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSString *fullAppName;
  void *v28;
  void *v29;
  CPSClipMetadata *v30;
  objc_super v32;

  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)CPSClipMetadata;
  v8 = -[CPSClipMetadata init](&v32, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_clipURL, a4);
    objc_storeStrong((id *)&v9->_clipRequestURL, a4);
    objc_msgSend(v6, "clipBundleID");
    v10 = objc_claimAutoreleasedReturnValue();
    clipBundleID = v9->_clipBundleID;
    v9->_clipBundleID = (NSString *)v10;

    objc_msgSend(v6, "title");
    v12 = objc_claimAutoreleasedReturnValue();
    abrClipName = v9->_abrClipName;
    v9->_abrClipName = (NSString *)v12;

    objc_msgSend(v6, "subtitle");
    v14 = objc_claimAutoreleasedReturnValue();
    abrClipCaption = v9->_abrClipCaption;
    v9->_abrClipCaption = (NSString *)v14;

    v9->_clipAction = objc_msgSend(v6, "action");
    v9->_isDeveloperOverride = 1;
    objc_msgSend(v6, "heroImageURL");
    v16 = objc_claimAutoreleasedReturnValue();
    abrClipHeroImageURL = v9->_abrClipHeroImageURL;
    v9->_abrClipHeroImageURL = (NSURL *)v16;

    v18 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v6, "invocationURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByAppendingPathComponent:", CFSTR("/AppIcon.png"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLWithString:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    fullAppIconURL = v9->_fullAppIconURL;
    v9->_fullAppIconURL = (NSURL *)v21;

    v23 = objc_alloc(MEMORY[0x24BDC1540]);
    objc_msgSend(v6, "clipBundleID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithBundleIdentifier:allowPlaceholder:error:", v24, 0, 0);

    objc_msgSend(v25, "localizedName");
    v26 = objc_claimAutoreleasedReturnValue();
    fullAppName = v9->_fullAppName;
    v9->_fullAppName = (NSString *)v26;

    objc_msgSend(v25, "appClipMetadata");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_clipRequestsNotificationPermission = objc_msgSend(v28, "wantsEphemeralNotifications");

    objc_msgSend(v25, "appClipMetadata");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_clipRequestsLocationConfirmationPermission = objc_msgSend(v29, "wantsLocationConfirmation");

    v9->_hasAppMetadata = 1;
    v30 = v9;

  }
  return v9;
}

- (CPSClipMetadata)initWithCoder:(id)a3
{
  id v4;
  CPSClipMetadata *v5;
  uint64_t v6;
  NSString *abrClipName;
  uint64_t v8;
  NSString *abrClipCaption;
  uint64_t v10;
  NSURL *abrClipHeroImageURL;
  void *v12;
  uint64_t v13;
  NSString *storeClipName;
  uint64_t v15;
  NSString *storeClipCaption;
  uint64_t v17;
  NSURL *storeClipHeroImageURL;
  uint64_t v19;
  NSURL *fullAppIconURL;
  uint64_t v21;
  NSString *fullAppCachedIconFilePath;
  uint64_t v23;
  NSURL *fullAppStoreURL;
  uint64_t v25;
  NSString *clipBundleID;
  uint64_t v27;
  NSString *clipMinimumOSVersion;
  uint64_t v29;
  NSURL *clipIpaURL;
  uint64_t v31;
  NSString *fullAppBundleID;
  uint64_t v33;
  NSString *fullAppName;
  uint64_t v35;
  NSString *fullAppShortName;
  uint64_t v37;
  NSString *fullAppCaption;
  uint64_t v39;
  NSString *fullAppContentRating;
  uint64_t v41;
  NSNumber *itemID;
  uint64_t v43;
  NSString *webClipID;
  uint64_t v45;
  NSString *buyParams;
  uint64_t v47;
  NSString *provider;
  uint64_t v49;
  NSURL *clipURL;
  uint64_t v51;
  NSURL *clipRequestURL;
  uint64_t v53;
  NSURL *clipTargetURL;
  uint64_t v55;
  NSString *clipURLHash;
  uint64_t v57;
  NSURL *clipBusinessIconURL;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  NSDictionary *clipBusinessIconStyleAttributes;
  uint64_t v64;
  NSNumber *clipMapItemMUID;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  NSArray *clipVerifiedAssociatedDomains;
  uint64_t v71;
  CPSClipInvocationPolicy *invocationPolicy;
  uint64_t v73;
  NSDate *expirationDate;
  uint64_t v75;
  NSNumber *clipSize;
  CPSClipMetadata *v77;
  objc_super v79;
  _QWORD v80[2];
  _QWORD v81[5];

  v81[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v79.receiver = self;
  v79.super_class = (Class)CPSClipMetadata;
  v5 = -[CPSClipMetadata init](&v79, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("abrClipName"));
    v6 = objc_claimAutoreleasedReturnValue();
    abrClipName = v5->_abrClipName;
    v5->_abrClipName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("abrClipCaption"));
    v8 = objc_claimAutoreleasedReturnValue();
    abrClipCaption = v5->_abrClipCaption;
    v5->_abrClipCaption = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("abrClipHeroImage"));
    v10 = objc_claimAutoreleasedReturnValue();
    abrClipHeroImageURL = v5->_abrClipHeroImageURL;
    v5->_abrClipHeroImageURL = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("abrClipAction"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_clipAction = objc_msgSend(v12, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeClipName"));
    v13 = objc_claimAutoreleasedReturnValue();
    storeClipName = v5->_storeClipName;
    v5->_storeClipName = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeClipCaption"));
    v15 = objc_claimAutoreleasedReturnValue();
    storeClipCaption = v5->_storeClipCaption;
    v5->_storeClipCaption = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeClipHeroImage"));
    v17 = objc_claimAutoreleasedReturnValue();
    storeClipHeroImageURL = v5->_storeClipHeroImageURL;
    v5->_storeClipHeroImageURL = (NSURL *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullAppIconURL"));
    v19 = objc_claimAutoreleasedReturnValue();
    fullAppIconURL = v5->_fullAppIconURL;
    v5->_fullAppIconURL = (NSURL *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullAppIconFilePath"));
    v21 = objc_claimAutoreleasedReturnValue();
    fullAppCachedIconFilePath = v5->_fullAppCachedIconFilePath;
    v5->_fullAppCachedIconFilePath = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullAppStoreURL"));
    v23 = objc_claimAutoreleasedReturnValue();
    fullAppStoreURL = v5->_fullAppStoreURL;
    v5->_fullAppStoreURL = (NSURL *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clipBundleID"));
    v25 = objc_claimAutoreleasedReturnValue();
    clipBundleID = v5->_clipBundleID;
    v5->_clipBundleID = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clipMinimumOSVersion"));
    v27 = objc_claimAutoreleasedReturnValue();
    clipMinimumOSVersion = v5->_clipMinimumOSVersion;
    v5->_clipMinimumOSVersion = (NSString *)v27;

    v5->_clipIncompatibleWithCurrentDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("clipIncompatibleWithCurrentDevice"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clipIpaURL"));
    v29 = objc_claimAutoreleasedReturnValue();
    clipIpaURL = v5->_clipIpaURL;
    v5->_clipIpaURL = (NSURL *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullAppBundleID"));
    v31 = objc_claimAutoreleasedReturnValue();
    fullAppBundleID = v5->_fullAppBundleID;
    v5->_fullAppBundleID = (NSString *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullAppName"));
    v33 = objc_claimAutoreleasedReturnValue();
    fullAppName = v5->_fullAppName;
    v5->_fullAppName = (NSString *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullAppShortName"));
    v35 = objc_claimAutoreleasedReturnValue();
    fullAppShortName = v5->_fullAppShortName;
    v5->_fullAppShortName = (NSString *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullAppCaption"));
    v37 = objc_claimAutoreleasedReturnValue();
    fullAppCaption = v5->_fullAppCaption;
    v5->_fullAppCaption = (NSString *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullAppContentRating"));
    v39 = objc_claimAutoreleasedReturnValue();
    fullAppContentRating = v5->_fullAppContentRating;
    v5->_fullAppContentRating = (NSString *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemID"));
    v41 = objc_claimAutoreleasedReturnValue();
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("webClipID"));
    v43 = objc_claimAutoreleasedReturnValue();
    webClipID = v5->_webClipID;
    v5->_webClipID = (NSString *)v43;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clipBuyParams"));
    v45 = objc_claimAutoreleasedReturnValue();
    buyParams = v5->_buyParams;
    v5->_buyParams = (NSString *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provider"));
    v47 = objc_claimAutoreleasedReturnValue();
    provider = v5->_provider;
    v5->_provider = (NSString *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clipURL"));
    v49 = objc_claimAutoreleasedReturnValue();
    clipURL = v5->_clipURL;
    v5->_clipURL = (NSURL *)v49;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clipRequestURL"));
    v51 = objc_claimAutoreleasedReturnValue();
    clipRequestURL = v5->_clipRequestURL;
    v5->_clipRequestURL = (NSURL *)v51;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clipTargetURL"));
    v53 = objc_claimAutoreleasedReturnValue();
    clipTargetURL = v5->_clipTargetURL;
    v5->_clipTargetURL = (NSURL *)v53;

    v5->_clipRequestsNotificationPermission = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("clipRequestsNotificationPermission"));
    v5->_clipRequestsLocationConfirmationPermission = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("clipRequestsLocationConfirmationPermission"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clipURLHash"));
    v55 = objc_claimAutoreleasedReturnValue();
    clipURLHash = v5->_clipURLHash;
    v5->_clipURLHash = (NSString *)v55;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clipBusinessIconURL"));
    v57 = objc_claimAutoreleasedReturnValue();
    clipBusinessIconURL = v5->_clipBusinessIconURL;
    v5->_clipBusinessIconURL = (NSURL *)v57;

    v59 = (void *)MEMORY[0x24BDBCF20];
    v81[0] = objc_opt_class();
    v81[1] = objc_opt_class();
    v81[2] = objc_opt_class();
    v81[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v81, 4);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setWithArray:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v61, CFSTR("clipBusinessIconStyleAttributes"));
    v62 = objc_claimAutoreleasedReturnValue();
    clipBusinessIconStyleAttributes = v5->_clipBusinessIconStyleAttributes;
    v5->_clipBusinessIconStyleAttributes = (NSDictionary *)v62;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clipMapItemMUID"));
    v64 = objc_claimAutoreleasedReturnValue();
    clipMapItemMUID = v5->_clipMapItemMUID;
    v5->_clipMapItemMUID = (NSNumber *)v64;

    v66 = (void *)MEMORY[0x24BDBCF20];
    v80[0] = objc_opt_class();
    v80[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v80, 2);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setWithArray:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v68, CFSTR("clipVerifiedAssociatedDomains"));
    v69 = objc_claimAutoreleasedReturnValue();
    clipVerifiedAssociatedDomains = v5->_clipVerifiedAssociatedDomains;
    v5->_clipVerifiedAssociatedDomains = (NSArray *)v69;

    v5->_hasBusinessItemMetadata = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasBusinessItemMetadata"));
    v5->_hasAppMetadata = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAppMetadata"));
    v5->_poweredByThirdParty = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("poweredByThirdParty"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invocationPolicy"));
    v71 = objc_claimAutoreleasedReturnValue();
    invocationPolicy = v5->_invocationPolicy;
    v5->_invocationPolicy = (CPSClipInvocationPolicy *)v71;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v73 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v73;

    v5->_deviceCapabilitiesDontMatch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deviceCapabilitiesDontMatch"));
    v5->_isDeveloperOverride = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDeveloperOverride"));
    v5->_fullAppOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fullAppOnly"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thinnedSize"));
    v75 = objc_claimAutoreleasedReturnValue();
    clipSize = v5->_clipSize;
    v5->_clipSize = (NSNumber *)v75;

    v77 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *abrClipName;
  void *v5;
  id v6;

  abrClipName = self->_abrClipName;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", abrClipName, CFSTR("abrClipName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_abrClipCaption, CFSTR("abrClipCaption"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_abrClipHeroImageURL, CFSTR("abrClipHeroImage"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_clipAction);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("abrClipAction"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_storeClipName, CFSTR("storeClipName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_storeClipCaption, CFSTR("storeClipCaption"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_storeClipHeroImageURL, CFSTR("storeClipHeroImage"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_fullAppIconURL, CFSTR("fullAppIconURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_fullAppCachedIconFilePath, CFSTR("fullAppIconFilePath"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_fullAppStoreURL, CFSTR("fullAppStoreURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_clipBundleID, CFSTR("clipBundleID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_clipMinimumOSVersion, CFSTR("clipMinimumOSVersion"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_clipIncompatibleWithCurrentDevice, CFSTR("clipIncompatibleWithCurrentDevice"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_clipIpaURL, CFSTR("clipIpaURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_fullAppBundleID, CFSTR("fullAppBundleID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_fullAppName, CFSTR("fullAppName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_fullAppShortName, CFSTR("fullAppShortName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_fullAppCaption, CFSTR("fullAppCaption"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_fullAppContentRating, CFSTR("fullAppContentRating"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_itemID, CFSTR("itemID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_webClipID, CFSTR("webClipID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_buyParams, CFSTR("clipBuyParams"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_provider, CFSTR("provider"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_clipURL, CFSTR("clipURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_clipRequestURL, CFSTR("clipRequestURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_clipTargetURL, CFSTR("clipTargetURL"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_clipRequestsNotificationPermission, CFSTR("clipRequestsNotificationPermission"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_clipRequestsLocationConfirmationPermission, CFSTR("clipRequestsLocationConfirmationPermission"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_clipURLHash, CFSTR("clipURLHash"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_clipBusinessIconURL, CFSTR("clipBusinessIconURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_clipBusinessIconStyleAttributes, CFSTR("clipBusinessIconStyleAttributes"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_clipMapItemMUID, CFSTR("clipMapItemMUID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_clipVerifiedAssociatedDomains, CFSTR("clipVerifiedAssociatedDomains"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_hasBusinessItemMetadata, CFSTR("hasBusinessItemMetadata"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_hasAppMetadata, CFSTR("hasAppMetadata"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_poweredByThirdParty, CFSTR("poweredByThirdParty"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_invocationPolicy, CFSTR("invocationPolicy"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_deviceCapabilitiesDontMatch, CFSTR("deviceCapabilitiesDontMatch"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isDeveloperOverride, CFSTR("isDeveloperOverride"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_fullAppOnly, CFSTR("fullAppOnly"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_clipSize, CFSTR("thinnedSize"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)fullAppOnlyClipBundleIDs
{
  if (fullAppOnlyClipBundleIDs_onceToken != -1)
    dispatch_once(&fullAppOnlyClipBundleIDs_onceToken, &__block_literal_global_9);
  return (id)fullAppOnlyClipBundleIDs_fullAppOnlyClipBundleIDs;
}

void __43__CPSClipMetadata_fullAppOnlyClipBundleIDs__block_invoke()
{
  void *v0;

  v0 = (void *)fullAppOnlyClipBundleIDs_fullAppOnlyClipBundleIDs;
  fullAppOnlyClipBundleIDs_fullAppOnlyClipBundleIDs = (uint64_t)&unk_24C3C6238;

}

- (void)updateWithStoreParentAppMetadata:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "safari_stringForKey:", CFSTR("bundleId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata setFullAppBundleID:](self, "setFullAppBundleID:", v4);

  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v20, "safari_stringForKey:", CFSTR("id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v6, "longLongValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata setItemID:](self, "setItemID:", v7);

  objc_msgSend(v20, "safari_stringForKey:", CFSTR("name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
    -[CPSClipMetadata setFullAppName:](self, "setFullAppName:", v8);
  objc_msgSend(v20, "safari_stringForKey:", CFSTR("artistName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata setProvider:](self, "setProvider:", v9);

  objc_msgSend(v20, "safari_dictionaryForKey:", CFSTR("artwork"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v10, "safari_stringForKey:", CFSTR("url"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cps_resolvedURLWithStoreIconURLString:iconSize:", v13, 180);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata setFullAppIconURL:](self, "setFullAppIconURL:", v14);

  }
  if (!self->_clipBundleID)
    -[CPSClipMetadata setClipBundleID:](self, "setClipBundleID:", self->_fullAppBundleID);
  objc_msgSend(v20, "safari_arrayForKey:", CFSTR("offers"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v16, "safari_dictionaryForKey:", CFSTR("version"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "safari_numberForKey:", CFSTR("externalId"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      -[CPSClipMetadata setClipVersionIdentifier:](self, "setClipVersionIdentifier:", objc_msgSend(v18, "unsignedLongLongValue"));

  }
}

- (void)updateWithStoreClipMetadata:(id)a3
{
  NSDictionary *v4;
  NSDictionary *amsDictionary;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *fullAppName;
  void *v10;
  void *v11;
  void *v12;
  NSURL *v13;
  NSURL *clipTargetURL;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSString *v40;
  NSString *fullAppCaption;
  id v42;
  int64_t v43;
  NSString *v44;
  NSString *clipMinimumOSVersion;
  void *v46;
  void *v47;
  void *v48;
  NSURL *v49;
  NSURL *storeClipHeroImageURL;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSURL *v76;
  NSURL *clipIpaURL;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;

  v104 = a3;
  v4 = (NSDictionary *)objc_msgSend(v104, "copy");
  amsDictionary = self->_amsDictionary;
  self->_amsDictionary = v4;

  self->_hasAppMetadata = self->_amsDictionary != 0;
  objc_msgSend(v104, "safari_dictionaryForKey:", CFSTR("attributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_stringForKey:", CFSTR("appName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata setFullAppName:](self, "setFullAppName:", v7);

  objc_msgSend(v6, "safari_stringForKey:", CFSTR("name"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  fullAppName = v8;
  if (!v8)
    fullAppName = self->_fullAppName;
  objc_storeStrong((id *)&self->_storeClipName, fullAppName);

  objc_msgSend(v6, "safari_stringForKey:", CFSTR("appShortName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata setFullAppShortName:](self, "setFullAppShortName:", v10);

  objc_msgSend(v6, "safari_stringForKey:", CFSTR("artistName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata setProvider:](self, "setProvider:", v11);

  objc_msgSend(v6, "safari_stringForKey:", CFSTR("targetURL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12);
    v13 = (NSURL *)objc_claimAutoreleasedReturnValue();
    clipTargetURL = self->_clipTargetURL;
    self->_clipTargetURL = v13;

  }
  objc_msgSend(v6, "safari_arrayForKey:", CFSTR("deviceFamilies"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPSUtilities lowercasedDeviceFamilyName](CPSUtilities, "lowercasedDeviceFamilyName");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v98 = (void *)v16;
  if (v16 && v15)
  {
    if (+[CPSUtilities deviceIsPad](CPSUtilities, "deviceIsPad", 0))
      v17 = 0;
    else
      v17 = objc_msgSend(v15, "containsObject:", v98) ^ 1;
  }
  -[CPSClipMetadata setClipIncompatibleWithCurrentDevice:](self, "setClipIncompatibleWithCurrentDevice:", v17);
  objc_msgSend(v6, "safari_dictionaryForKey:", CFSTR("appContentRatingsBySystem"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "safari_dictionaryForKey:", CFSTR("appsBrazil"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v18, "safari_numberForKey:", CFSTR("rank"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("rank%@-Brazil"), v21);
  }
  else
  {
    objc_msgSend(v99, "safari_dictionaryForKey:", CFSTR("appsApple"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "safari_stringForKey:", CFSTR("name"));
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata setFullAppContentRating:](self, "setFullAppContentRating:", v22);

  objc_msgSend(v6, "safari_dictionaryForKey:", CFSTR("platformAttributes"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "safari_dictionaryForKey:", CFSTR("ios"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "safari_stringForKey:", CFSTR("appSubtitle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[CPSClipMetadata setFullAppCaption:](self, "setFullAppCaption:", v24);
  }
  else
  {
    v100 = v15;
    v102 = v12;
    v95 = v6;
    objc_msgSend(v104, "safari_dictionaryForKey:", CFSTR("relationships"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "safari_dictionaryForKey:", CFSTR("app-genres"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "safari_arrayForKey:", CFSTR("data"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "objectEnumerator");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "nextObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = v29;
      objc_msgSend(v29, "safari_stringForKey:", CFSTR("id"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "safari_dictionaryForKey:", CFSTR("attributes"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "safari_stringForKey:", CFSTR("name"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31 && objc_msgSend(v31, "isEqualToString:", CFSTR("6014")))
      {
        objc_msgSend(v28, "nextObject");
        v34 = objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          v93 = v27;
          v87 = v19;
          v30 = (void *)v34;
          while (1)
          {
            objc_msgSend(v30, "safari_dictionaryForKey:", CFSTR("attributes"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "safari_stringForKey:", CFSTR("parentId"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36)
            {
              if (objc_msgSend(v36, "isEqualToString:", CFSTR("6014")))
                break;
            }

            objc_msgSend(v28, "nextObject");
            v37 = objc_claimAutoreleasedReturnValue();

            v30 = (void *)v37;
            if (!v37)
              goto LABEL_27;
          }
          objc_msgSend(v30, "safari_dictionaryForKey:", CFSTR("attributes"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "safari_stringForKey:", CFSTR("name"));
          v39 = objc_claimAutoreleasedReturnValue();

          v33 = (void *)v39;
LABEL_27:
          v19 = v87;
          v27 = v93;
        }
        else
        {
          v30 = 0;
        }
      }

    }
    else
    {
      v33 = 0;
    }

    -[CPSClipMetadata setFullAppCaption:](self, "setFullAppCaption:", v33);
    v6 = v95;
    v15 = v100;
    v12 = v102;
  }

  objc_msgSend(v23, "safari_stringForKey:", CFSTR("subtitle"));
  v40 = (NSString *)objc_claimAutoreleasedReturnValue();
  fullAppCaption = v40;
  if (!v40)
    fullAppCaption = self->_fullAppCaption;
  objc_storeStrong((id *)&self->_storeClipCaption, fullAppCaption);

  if (!self->_hasBusinessItemMetadata)
  {
    objc_msgSend(v23, "safari_stringForKey:", CFSTR("action"));
    v42 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v42, "isEqualToString:", CFSTR("OPEN")) & 1) != 0)
    {
      v43 = 0;
    }
    else if ((objc_msgSend(v42, "isEqualToString:", CFSTR("VIEW")) & 1) != 0)
    {
      v43 = 1;
    }
    else if (objc_msgSend(v42, "isEqualToString:", CFSTR("PLAY")))
    {
      v43 = 2;
    }
    else
    {
      v43 = 0;
    }

    self->_clipAction = v43;
  }
  objc_msgSend(v23, "safari_stringForKey:", CFSTR("minimumOSVersion"));
  v44 = (NSString *)objc_claimAutoreleasedReturnValue();
  clipMinimumOSVersion = self->_clipMinimumOSVersion;
  self->_clipMinimumOSVersion = v44;

  objc_msgSend(v23, "safari_dictionaryForKey:", CFSTR("heroArtwork"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (v46)
  {
    objc_msgSend(v46, "safari_stringForKey:", CFSTR("url"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v48, "length"))
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "cps_resolvedURLWithStoreIconURLString:iconSize:", v48, 1024);
      v49 = (NSURL *)objc_claimAutoreleasedReturnValue();
      storeClipHeroImageURL = self->_storeClipHeroImageURL;
      self->_storeClipHeroImageURL = v49;

    }
  }
  v96 = v47;
  v103 = v23;
  objc_msgSend(v23, "safari_dictionaryForKey:", CFSTR("appArtwork"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51;
  if (v51)
  {
    v53 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v51, "safari_stringForKey:", CFSTR("url"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "cps_resolvedURLWithStoreIconURLString:iconSize:", v54, 180);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata setFullAppIconURL:](self, "setFullAppIconURL:", v55);

  }
  v94 = v52;
  objc_msgSend(v103, "safari_stringForKey:", CFSTR("bundleId"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata setClipBundleID:](self, "setClipBundleID:", v56);

  objc_msgSend(v103, "safari_stringForKey:", CFSTR("appBundleId"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata setFullAppBundleID:](self, "setFullAppBundleID:", v57);

  objc_msgSend(v103, "safari_arrayForKey:", CFSTR("verifiedAssociatedDomains"));
  v58 = objc_claimAutoreleasedReturnValue();
  v59 = (void *)v58;
  if (v58)
    v60 = (void *)v58;
  else
    v60 = (void *)MEMORY[0x24BDBD1A8];
  objc_storeStrong((id *)&self->_clipVerifiedAssociatedDomains, v60);

  objc_msgSend(v103, "safari_numberForKey:", CFSTR("externalVersionId"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v61;
  if (v61)
    -[CPSClipMetadata setClipVersionIdentifier:](self, "setClipVersionIdentifier:", objc_msgSend(v61, "unsignedLongLongValue"));
  v92 = v62;
  objc_msgSend(v103, "safari_arrayForKey:", CFSTR("variantsInfo"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata _thinnedSizeWithVariantsInfo:](self, "_thinnedSizeWithVariantsInfo:");
  v63 = objc_claimAutoreleasedReturnValue();
  v90 = (void *)v63;
  if (v63)
    v64 = (void *)v63;
  else
    v64 = &unk_24C3C6268;
  -[CPSClipMetadata setClipSize:](self, "setClipSize:", v64);
  objc_msgSend(v104, "safari_dictionaryForKey:", CFSTR("relationships"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "safari_dictionaryForKey:", CFSTR("app"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "safari_arrayForKey:", CFSTR("data"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "firstObject");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v101 = v67;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v68 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v67, "safari_stringForKey:", CFSTR("id"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "numberWithLongLong:", objc_msgSend(v69, "longLongValue"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata setItemID:](self, "setItemID:", v70);

  }
  objc_msgSend(v6, "safari_stringForKey:", CFSTR("appUrl"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata setFullAppStoreURL:](self, "setFullAppStoreURL:", v72);

  if (!self->_itemID)
  {
    -[CPSClipMetadata _itemIDFromAppURLString:](self, "_itemIDFromAppURLString:", v71);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata setItemID:](self, "setItemID:", v73);

  }
  if (+[CPSClipURL usesDemoMetadata](CPSClipURL, "usesDemoMetadata"))
  {
    v74 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v104, "safari_stringForKey:", CFSTR("clipIpaURL"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "URLWithString:", v75);
    v76 = (NSURL *)objc_claimAutoreleasedReturnValue();
    clipIpaURL = self->_clipIpaURL;
    self->_clipIpaURL = v76;

  }
  v78 = v103;
  objc_msgSend(v103, "safari_arrayForKey:", CFSTR("permissions"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  self->_clipRequestsLocationConfirmationPermission = objc_msgSend(v79, "containsObject:", CFSTR("locationConfirmation"));
  self->_clipRequestsNotificationPermission = objc_msgSend(v79, "containsObject:", CFSTR("ephemeralUserNotifications"));
  objc_msgSend(v103, "safari_arrayForKey:", CFSTR("requiredCapabilities"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  self->_deviceCapabilitiesDontMatch = !+[CPSUtilities deviceHasCapabilities:](CPSUtilities, "deviceHasCapabilities:", v80);
  if (objc_msgSend(v6, "safari_BOOLForKey:", CFSTR("fullAppOnly")))
  {
    self->_fullAppOnly = 1;
    v81 = v98;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "fullAppOnlyClipBundleIDs");
    v88 = v19;
    v82 = v15;
    v83 = v6;
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata clipBundleID](self, "clipBundleID");
    v85 = v12;
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    self->_fullAppOnly = objc_msgSend(v84, "containsObject:", v86);

    v12 = v85;
    v6 = v83;
    v15 = v82;
    v81 = v98;
    v78 = v103;
    v19 = v88;
  }

}

- (id)_thinnedSizeWithVariantsInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[CPSClipMetadata test_mocProductVariants](self, "test_mocProductVariants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    +[CPSUtilities productVariants](CPSUtilities, "productVariants");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  -[CPSClipMetadata test_mocProductVersion](self, "test_mocProductVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    +[CPSUtilities osVersion](CPSUtilities, "osVersion");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  -[CPSClipMetadata _thinnedSizeWithVariantsInfo:productVariants:productVersion:](self, "_thinnedSizeWithVariantsInfo:productVariants:productVersion:", v4, v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_thinnedSizeWithVariantsInfo:(id)a3 productVariants:(id)a4 productVersion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  id obj;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v36 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v52;
    v12 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v52 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v14, "safari_arrayForKey:", CFSTR("targets"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "safari_numberForKey:", CFSTR("size"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = v12;
        v46[1] = 3221225472;
        v46[2] = __79__CPSClipMetadata__thinnedSizeWithVariantsInfo_productVariants_productVersion___block_invoke;
        v46[3] = &unk_24C3BA4E8;
        v47 = v36;
        v48 = v8;
        v49 = v16;
        v50 = v37;
        v17 = v16;
        objc_msgSend(v15, "enumerateObjectsUsingBlock:", v46);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v10);
  }

  v18 = (id)objc_msgSend(v37, "sortedArrayUsingComparator:", &__block_literal_global_197);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v19 = v8;
  v34 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
  if (v34)
  {
    v20 = *(_QWORD *)v43;
    v33 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v43 != v20)
          objc_enumerationMutation(v19);
        v22 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        objc_msgSend(v37, "reverseObjectEnumerator");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v55, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v39;
          while (2)
          {
            for (k = 0; k != v25; ++k)
            {
              if (*(_QWORD *)v39 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * k);
              objc_msgSend(v28, "device");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "isEqualToString:", v22);

              if ((v30 & 1) != 0)
              {
                objc_msgSend(v28, "size");
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_26;
              }
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v55, 16);
            if (v25)
              continue;
            break;
          }
        }

        v20 = v33;
      }
      v31 = &unk_24C3C6268;
      v34 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
    }
    while (v34);
  }
  else
  {
    v31 = &unk_24C3C6268;
  }
LABEL_26:

  return v31;
}

void __79__CPSClipMetadata__thinnedSizeWithVariantsInfo_productVariants_productVersion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  CPSDeviceVariant *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "safari_stringForKey:", CFSTR("osVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "compare:", *(_QWORD *)(a1 + 32)) != 1)
  {
    objc_msgSend(v3, "safari_arrayForKey:", CFSTR("devices"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v10))
          {
            v11 = objc_alloc_init(CPSDeviceVariant);
            -[CPSDeviceVariant setOsVersion:](v11, "setOsVersion:", v4);
            -[CPSDeviceVariant setSize:](v11, "setSize:", *(_QWORD *)(a1 + 48));
            -[CPSDeviceVariant setDevice:](v11, "setDevice:", v10);
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

uint64_t __79__CPSClipMetadata__thinnedSizeWithVariantsInfo_productVariants_productVersion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "osVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "osVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (BOOL)hasUpToDateVersionInstalledOnSystemIsPlaceholder:(BOOL *)a3
{
  void *v5;
  void *v6;
  BOOL v7;

  -[CPSClipMetadata clipBundleID](self, "clipBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPSUtilities versionIdentifierForAppWithBundleIdentifier:isPlaceholder:](CPSUtilities, "versionIdentifierForAppWithBundleIdentifier:isPlaceholder:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = self->_isDeveloperOverride || objc_msgSend(v6, "unsignedLongLongValue") >= self->_clipVersionIdentifier;
  else
    v7 = 0;

  return v7;
}

- (BOOL)isPhysicalInvocationAllowed
{
  BOOL v3;
  void *v4;
  void *v5;
  BOOL v6;
  char v8;

  if (-[CPSClipMetadata canUpdateOnPhysicalInvocation](self, "canUpdateOnPhysicalInvocation"))
    return 1;
  v8 = 0;
  -[CPSClipMetadata clipBundleID](self, "clipBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPSUtilities versionIdentifierForAppWithBundleIdentifier:isPlaceholder:](CPSUtilities, "versionIdentifierForAppWithBundleIdentifier:isPlaceholder:", v4, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v8 == 0;
  else
    v6 = 0;
  v3 = v6 || -[CPSClipMetadata hasFullAppInstalledOnSystem](self, "hasFullAppInstalledOnSystem");

  return v3;
}

- (BOOL)canUpdateOnPhysicalInvocation
{
  return (CPSSimulateLargeSizeAppClipForTesting() & 1) == 0
      && -[NSNumber unsignedLongLongValue](self->_clipSize, "unsignedLongLongValue") <= 0xF00000;
}

- (BOOL)hasFullAppInstalledOnSystem
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  char v9;

  -[CPSClipMetadata fullAppBundleID](self, "fullAppBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v9 = 0;
  -[CPSClipMetadata fullAppBundleID](self, "fullAppBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPSUtilities versionIdentifierForAppWithBundleIdentifier:isPlaceholder:](CPSUtilities, "versionIdentifierForAppWithBundleIdentifier:isPlaceholder:", v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v9 == 0;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (id)_itemIDFromAppURLString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("id")))
  {
    objc_msgSend(v3, "substringFromIndex:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invertedSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "rangeOfCharacterFromSet:", v6) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v4, "longLongValue"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_updateWithAMSMetadata:(id)a3
{
  id *v4;
  NSDictionary *v5;
  NSDictionary *amsDictionary;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *clipVerifiedAssociatedDomains;
  NSString *v17;
  NSString *storeClipName;
  NSString *v19;
  NSString *storeClipCaption;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSString *v28;
  NSString *clipMinimumOSVersion;
  NSDate *v30;
  NSDate *expirationDate;
  NSNumber *v32;
  NSNumber *clipSize;
  NSURL *v34;
  NSURL *clipTargetURL;
  void *v36;
  id *v37;

  v4 = (id *)a3;
  if (v4)
  {
    v37 = v4;
    objc_msgSend(v4, "amsDictionary");
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    amsDictionary = self->_amsDictionary;
    self->_amsDictionary = v5;

    self->_hasAppMetadata = self->_amsDictionary != 0;
    objc_msgSend(v37, "fullAppBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata setFullAppBundleID:](self, "setFullAppBundleID:", v7);

    objc_msgSend(v37, "fullAppName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata setFullAppName:](self, "setFullAppName:", v8);

    objc_msgSend(v37, "fullAppShortName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata setFullAppShortName:](self, "setFullAppShortName:", v9);

    objc_msgSend(v37, "fullAppIconURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata setFullAppIconURL:](self, "setFullAppIconURL:", v10);

    objc_msgSend(v37, "fullAppStoreURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata setFullAppStoreURL:](self, "setFullAppStoreURL:", v11);

    objc_msgSend(v37, "fullAppCaption");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata setFullAppCaption:](self, "setFullAppCaption:", v12);

    objc_msgSend(v37, "fullAppCachedIconFilePath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata setFullAppCachedIconFilePath:](self, "setFullAppCachedIconFilePath:", v13);

    objc_msgSend(v37, "clipVerifiedAssociatedDomains");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (NSArray *)objc_msgSend(v14, "copy");
    clipVerifiedAssociatedDomains = self->_clipVerifiedAssociatedDomains;
    self->_clipVerifiedAssociatedDomains = v15;

    v17 = (NSString *)objc_msgSend(v37[1], "copy");
    storeClipName = self->_storeClipName;
    self->_storeClipName = v17;

    v19 = (NSString *)objc_msgSend(v37[2], "copy");
    storeClipCaption = self->_storeClipCaption;
    self->_storeClipCaption = v19;

    if (!self->_hasBusinessItemMetadata)
      self->_clipAction = objc_msgSend(v37, "clipAction");
    objc_storeStrong((id *)&self->_storeClipHeroImageURL, v37[3]);
    self->_clipVersionIdentifier = objc_msgSend(v37, "clipVersionIdentifier");
    objc_msgSend(v37, "itemID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      -[CPSClipMetadata setItemID:](self, "setItemID:", v21);
    objc_msgSend(v37, "fullAppContentRating");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      -[CPSClipMetadata setFullAppContentRating:](self, "setFullAppContentRating:", v22);
    objc_msgSend(v37, "provider");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata setProvider:](self, "setProvider:", v23);

    objc_msgSend(v37, "buyParams");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata setBuyParams:](self, "setBuyParams:", v24);

    -[CPSClipMetadata setClipIncompatibleWithCurrentDevice:](self, "setClipIncompatibleWithCurrentDevice:", objc_msgSend(v37, "clipIncompatibleWithCurrentDevice"));
    if (+[CPSClipURL usesDemoMetadata](CPSClipURL, "usesDemoMetadata"))
    {
      objc_msgSend(v37, "clipIpaURL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPSClipMetadata setClipIpaURL:](self, "setClipIpaURL:", v25);

      objc_msgSend(v37, "clipBundleID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v37, "clipBundleID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPSClipMetadata setClipBundleID:](self, "setClipBundleID:", v27);

      }
    }
    self->_clipRequestsNotificationPermission = objc_msgSend(v37, "clipRequestsNotificationPermission");
    self->_clipRequestsLocationConfirmationPermission = objc_msgSend(v37, "clipRequestsLocationConfirmationPermission");
    self->_deviceCapabilitiesDontMatch = objc_msgSend(v37, "deviceCapabilitiesDontMatch");
    objc_msgSend(v37, "clipMinimumOSVersion");
    v28 = (NSString *)objc_claimAutoreleasedReturnValue();
    clipMinimumOSVersion = self->_clipMinimumOSVersion;
    self->_clipMinimumOSVersion = v28;

    objc_msgSend(v37, "expirationDate");
    v30 = (NSDate *)objc_claimAutoreleasedReturnValue();
    expirationDate = self->_expirationDate;
    self->_expirationDate = v30;

    self->_fullAppOnly = objc_msgSend(v37, "fullAppOnly");
    objc_msgSend(v37, "clipSize");
    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    clipSize = self->_clipSize;
    self->_clipSize = v32;

    if (!self->_clipTargetURL)
    {
      objc_msgSend(v37, "clipTargetURL");
      v34 = (NSURL *)objc_claimAutoreleasedReturnValue();
      clipTargetURL = self->_clipTargetURL;
      self->_clipTargetURL = v34;

    }
    objc_msgSend(v37, "invocationPolicy");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata _updateInvocationPolicy:](self, "_updateInvocationPolicy:", v36);

    v4 = v37;
  }

}

- (void)_updateInvocationPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  char v11;

  v4 = a3;
  -[CPSClipMetadata invocationPolicy](self, "invocationPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEligible"))
  {

  }
  else
  {
    -[CPSClipMetadata invocationPolicy](self, "invocationPolicy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isRecoverable");
    if (!v4 || !v7 || objc_msgSend(v4, "isEligible"))
    {

      goto LABEL_8;
    }
    v11 = objc_msgSend(v4, "isRecoverable");

    if ((v11 & 1) != 0)
      goto LABEL_8;
  }
  -[CPSClipMetadata setInvocationPolicy:](self, "setInvocationPolicy:", v4);
LABEL_8:
  -[CPSClipMetadata invocationPolicy](self, "invocationPolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEligible") || !CPSShouldValidateAssociatedDomains())
  {
LABEL_14:

    goto LABEL_15;
  }
  v9 = -[CPSClipMetadata hasValidAssociatedDomainsToLaunchAppClip](self, "hasValidAssociatedDomainsToLaunchAppClip");

  if (!v9)
  {
    v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CPSClipMetadata _updateInvocationPolicy:].cold.1(v10, self);
    +[CPSClipInvocationPolicy ineligiblePolicyWithReason:](CPSClipInvocationPolicy, "ineligiblePolicyWithReason:", 13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata setInvocationPolicy:](self, "setInvocationPolicy:", v8);
    goto LABEL_14;
  }
LABEL_15:

}

- (BOOL)_preferAMPDefaultNameAndCaptionForCurrentLocale
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("zh_TW"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("zh_HK"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("zh_MO"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "containsObject:", v9))
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.Bridge.AppClip"), CFSTR("com.apple.supportapp.Clip"), CFSTR("com.shazam.Shazam.Clip"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata clipBundleID](self, "clipBundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "containsObject:", v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)clipName
{
  NSString **p_storeClipName;
  NSString **p_abrClipName;
  NSString *abrClipName;
  uint64_t v6;

  if (-[CPSClipMetadata _preferAMPDefaultNameAndCaptionForCurrentLocale](self, "_preferAMPDefaultNameAndCaptionForCurrentLocale"))
  {
    p_storeClipName = &self->_storeClipName;
  }
  else
  {
    abrClipName = self->_abrClipName;
    p_abrClipName = &self->_abrClipName;
    v6 = -[NSString length](abrClipName, "length");
    p_storeClipName = p_abrClipName - 3;
    if (v6)
      p_storeClipName = p_abrClipName;
  }
  return *p_storeClipName;
}

- (NSString)clipCaption
{
  NSString **p_storeClipCaption;
  NSString **p_abrClipCaption;
  NSString *abrClipCaption;
  uint64_t v6;

  if (-[CPSClipMetadata _preferAMPDefaultNameAndCaptionForCurrentLocale](self, "_preferAMPDefaultNameAndCaptionForCurrentLocale"))
  {
    p_storeClipCaption = &self->_storeClipCaption;
  }
  else
  {
    abrClipCaption = self->_abrClipCaption;
    p_abrClipCaption = &self->_abrClipCaption;
    v6 = -[NSString length](abrClipCaption, "length");
    p_storeClipCaption = p_abrClipCaption - 3;
    if (v6)
      p_storeClipCaption = p_abrClipCaption;
  }
  return *p_storeClipCaption;
}

- (NSString)clipOpenButtonTitle
{
  unint64_t clipAction;

  clipAction = self->_clipAction;
  if (clipAction <= 2)
  {
    _CPSLocalizedString(off_24C3BA548[clipAction], &_CPSLocalizableStringsBundleOnceToken, &_CPSLocalizableStringsBundle);
    self = (CPSClipMetadata *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)self;
}

- (NSURL)clipHeroImageURL
{
  NSURL *abrClipHeroImageURL;

  abrClipHeroImageURL = self->_abrClipHeroImageURL;
  if (!abrClipHeroImageURL)
    abrClipHeroImageURL = self->_storeClipHeroImageURL;
  return abrClipHeroImageURL;
}

- (NSURL)clipLaunchURL
{
  NSURL *clipTargetURL;

  clipTargetURL = self->_clipTargetURL;
  if (!clipTargetURL)
  {
    clipTargetURL = self->_clipRequestURL;
    if (!clipTargetURL)
      clipTargetURL = self->_clipURL;
  }
  return clipTargetURL;
}

- (BOOL)hasValidAssociatedDomainsToLaunchAppClip
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v21;
  void *v22;
  void *v23;
  NSArray *obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[4];
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[CPSClipMetadata clipLaunchURL](self, "clipLaunchURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "cps_fallbackBundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPSClipMetadata clipBundleID](self, "clipBundleID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if ((v8 & 1) != 0)
      {
        v9 = 1;
      }
      else
      {
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        obj = self->_clipVerifiedAssociatedDomains;
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
        if (v10)
        {
          v11 = v10;
          v21 = v6;
          v22 = v4;
          v12 = *(_QWORD *)v27;
          v23 = v3;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v27 != v12)
                objc_enumerationMutation(obj);
              v14 = (void *)MEMORY[0x24BE8F730];
              v32 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1, v21, v22, v23);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = 0;
              objc_msgSend(v14, "serviceSpecifiersWithEntitlementValue:error:", v15, &v25);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = v25;
              objc_msgSend(v16, "firstObject");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
              {
                if ((objc_msgSend(v18, "domainEncompassesDomain:", v5) & 1) != 0)
                {

                  v9 = 1;
                  goto LABEL_20;
                }
              }
              else
              {
                v19 = CPS_LOG_CHANNEL_PREFIXClipServices();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                  -[CPSClipMetadata hasValidAssociatedDomainsToLaunchAppClip].cold.1(v30, v19, v17, &v31);
              }

            }
            v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
          }
          while (v11);
          v9 = 0;
LABEL_20:
          v4 = v22;
          v3 = v23;
          v6 = v21;
        }
        else
        {
          v9 = 0;
        }

      }
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

- (NSArray)test_clipVerifiedAssociatedDomains
{
  return self->_clipVerifiedAssociatedDomains;
}

- (void)setTest_clipVerifiedAssociatedDomains:(id)a3
{
  objc_storeStrong((id *)&self->_clipVerifiedAssociatedDomains, a3);
}

- (BOOL)isExpired
{
  void *v3;
  BOOL v4;

  if (!self->_expirationDate)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compare:", self->_expirationDate) != -1;

  return v4;
}

- (NSString)bundleDisplayName
{
  NSString *v3;
  void *v4;

  if (-[NSString length](self->_fullAppShortName, "length"))
  {
    v3 = self->_fullAppShortName;
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", self->_clipBundleID, 0, 0);
    objc_msgSend(v4, "localizedName");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSString *storeClipCaption;
  NSString *abrClipCaption;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v24 = (void *)MEMORY[0x24BDD17C8];
  -[CPSClipMetadata clipName](self, "clipName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  storeClipCaption = self->_storeClipCaption;
  abrClipCaption = self->_abrClipCaption;
  -[CPSClipMetadata clipCaption](self, "clipCaption");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata clipBundleID](self, "clipBundleID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata clipHeroImageURL](self, "clipHeroImageURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata clipOpenButtonTitle](self, "clipOpenButtonTitle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata clipURL](self, "clipURL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata clipIpaURL](self, "clipIpaURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata clipRequestURL](self, "clipRequestURL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata clipMinimumOSVersion](self, "clipMinimumOSVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata fullAppName](self, "fullAppName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata fullAppShortName](self, "fullAppShortName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata fullAppCaption](self, "fullAppCaption");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata fullAppContentRating](self, "fullAppContentRating");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata fullAppBundleID](self, "fullAppBundleID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata fullAppStoreURL](self, "fullAppStoreURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata fullAppIconURL](self, "fullAppIconURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CPSClipMetadata isPoweredByThirdParty](self, "isPoweredByThirdParty"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v15 = v4;
  -[CPSClipMetadata provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata webClipID](self, "webClipID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata clipURLHash](self, "clipURLHash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CPSClipMetadata clipVersionIdentifier](self, "clipVersionIdentifier");
  if (-[CPSClipMetadata clipRequestsLocationConfirmationPermission](self, "clipRequestsLocationConfirmationPermission"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (-[CPSClipMetadata clipRequestsNotificationPermission](self, "clipRequestsNotificationPermission"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  -[CPSClipMetadata expirationDate](self, "expirationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata bundleDisplayName](self, "bundleDisplayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata clipSize](self, "clipSize");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("\n  clipName = %@,\n  abrClipCaption = %@,\n  storeClipCaption = %@, \n  clipCaption = %@,\n  clipBundleID = %@,\n  clipHeroImageURL = %@,\n  clipOpenButtonTitle = %@,\n  clipURL = %@,\n  clipIpaURL = %@,\n  clipRequestURL = %@,\n  clipMinimumOSVersion = %@,\n  fullAppName = %@,\n  fullAppShortName = %@,\n  fullAppCaption = %@,\n  fullAppContentRating = %@,\n  fullAppBundleID = %@,\n  fullAppStoreURL = %@,\n  fullAppIconURL = %@, \n  isPoweredBy = %@, \n  provider = %@, \n  webClipID = %@, \n  clipURLHash = %@, \n  clipVersionIdentifier = %llu \n  clipRequestsLocationConfirmationPermission = %@ \n  clipRequestsNotificationPermission = %@ \n  expirationDate = %@ \n  bundleDisplayName = %@ \n  thinnedSize = %@ \n"), v33, abrClipCaption, storeClipCaption, v34, v32, v31, v30, v29, v21, v28, v20, v19, v18, v17, v16, v27,
    v26,
    v3,
    v15,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
    v12,
    v13);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (NSString)clipBundleID
{
  return self->_clipBundleID;
}

- (void)setClipBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)clipAction
{
  return self->_clipAction;
}

- (NSString)clipMinimumOSVersion
{
  return self->_clipMinimumOSVersion;
}

- (BOOL)clipIncompatibleWithCurrentDevice
{
  return self->_clipIncompatibleWithCurrentDevice;
}

- (void)setClipIncompatibleWithCurrentDevice:(BOOL)a3
{
  self->_clipIncompatibleWithCurrentDevice = a3;
}

- (NSURL)clipIpaURL
{
  return self->_clipIpaURL;
}

- (void)setClipIpaURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSURL)clipRequestURL
{
  return self->_clipRequestURL;
}

- (void)setClipRequestURL:(id)a3
{
  objc_storeStrong((id *)&self->_clipRequestURL, a3);
}

- (NSURL)clipURL
{
  return self->_clipURL;
}

- (void)setClipURL:(id)a3
{
  objc_storeStrong((id *)&self->_clipURL, a3);
}

- (NSURL)clipTargetURL
{
  return self->_clipTargetURL;
}

- (NSURL)clipBusinessIconURL
{
  return self->_clipBusinessIconURL;
}

- (NSDictionary)clipBusinessIconStyleAttributes
{
  return self->_clipBusinessIconStyleAttributes;
}

- (NSNumber)clipMapItemMUID
{
  return self->_clipMapItemMUID;
}

- (BOOL)clipRequestsNotificationPermission
{
  return self->_clipRequestsNotificationPermission;
}

- (BOOL)clipRequestsLocationConfirmationPermission
{
  return self->_clipRequestsLocationConfirmationPermission;
}

- (NSString)clipURLHash
{
  return self->_clipURLHash;
}

- (void)setClipURLHash:(id)a3
{
  objc_storeStrong((id *)&self->_clipURLHash, a3);
}

- (NSArray)clipVerifiedAssociatedDomains
{
  return self->_clipVerifiedAssociatedDomains;
}

- (BOOL)hasBusinessItemMetadata
{
  return self->_hasBusinessItemMetadata;
}

- (BOOL)hasAppMetadata
{
  return self->_hasAppMetadata;
}

- (BOOL)isPoweredByThirdParty
{
  return self->_poweredByThirdParty;
}

- (CPSClipInvocationPolicy)invocationPolicy
{
  return self->_invocationPolicy;
}

- (void)setInvocationPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_invocationPolicy, a3);
}

- (BOOL)deviceCapabilitiesDontMatch
{
  return self->_deviceCapabilitiesDontMatch;
}

- (void)setDeviceCapabilitiesDontMatch:(BOOL)a3
{
  self->_deviceCapabilitiesDontMatch = a3;
}

- (NSString)fullAppName
{
  return self->_fullAppName;
}

- (void)setFullAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)fullAppShortName
{
  return self->_fullAppShortName;
}

- (void)setFullAppShortName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)fullAppCaption
{
  return self->_fullAppCaption;
}

- (void)setFullAppCaption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)fullAppContentRating
{
  return self->_fullAppContentRating;
}

- (void)setFullAppContentRating:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)fullAppBundleID
{
  return self->_fullAppBundleID;
}

- (void)setFullAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSURL)fullAppStoreURL
{
  return self->_fullAppStoreURL;
}

- (void)setFullAppStoreURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSURL)fullAppIconURL
{
  return self->_fullAppIconURL;
}

- (void)setFullAppIconURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)fullAppCachedIconFilePath
{
  return self->_fullAppCachedIconFilePath;
}

- (void)setFullAppCachedIconFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSString)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)webClipID
{
  return self->_webClipID;
}

- (void)setWebClipID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSNumber)clipSize
{
  return self->_clipSize;
}

- (void)setClipSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSString)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (BOOL)isDeveloperOverride
{
  return self->_isDeveloperOverride;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (BOOL)fullAppOnly
{
  return self->_fullAppOnly;
}

- (void)setFullAppOnly:(BOOL)a3
{
  self->_fullAppOnly = a3;
}

- (NSDictionary)amsDictionary
{
  return self->_amsDictionary;
}

- (void)setAmsDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (unint64_t)clipVersionIdentifier
{
  return self->_clipVersionIdentifier;
}

- (void)setClipVersionIdentifier:(unint64_t)a3
{
  self->_clipVersionIdentifier = a3;
}

- (BOOL)canUpdateOnPhysicalInovcation
{
  return self->_canUpdateOnPhysicalInovcation;
}

- (NSString)test_mocProductVersion
{
  return self->_test_mocProductVersion;
}

- (void)setTest_mocProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_test_mocProductVersion, a3);
}

- (NSArray)test_mocProductVariants
{
  return self->_test_mocProductVariants;
}

- (void)setTest_mocProductVariants:(id)a3
{
  objc_storeStrong((id *)&self->_test_mocProductVariants, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_test_mocProductVariants, 0);
  objc_storeStrong((id *)&self->_test_mocProductVersion, 0);
  objc_storeStrong((id *)&self->_amsDictionary, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_clipSize, 0);
  objc_storeStrong((id *)&self->_webClipID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_fullAppCachedIconFilePath, 0);
  objc_storeStrong((id *)&self->_fullAppIconURL, 0);
  objc_storeStrong((id *)&self->_fullAppStoreURL, 0);
  objc_storeStrong((id *)&self->_fullAppBundleID, 0);
  objc_storeStrong((id *)&self->_fullAppContentRating, 0);
  objc_storeStrong((id *)&self->_fullAppCaption, 0);
  objc_storeStrong((id *)&self->_fullAppShortName, 0);
  objc_storeStrong((id *)&self->_fullAppName, 0);
  objc_storeStrong((id *)&self->_invocationPolicy, 0);
  objc_storeStrong((id *)&self->_clipVerifiedAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_clipURLHash, 0);
  objc_storeStrong((id *)&self->_clipMapItemMUID, 0);
  objc_storeStrong((id *)&self->_clipBusinessIconStyleAttributes, 0);
  objc_storeStrong((id *)&self->_clipBusinessIconURL, 0);
  objc_storeStrong((id *)&self->_clipTargetURL, 0);
  objc_storeStrong((id *)&self->_clipURL, 0);
  objc_storeStrong((id *)&self->_clipRequestURL, 0);
  objc_storeStrong((id *)&self->_clipIpaURL, 0);
  objc_storeStrong((id *)&self->_clipMinimumOSVersion, 0);
  objc_storeStrong((id *)&self->_clipBundleID, 0);
  objc_storeStrong((id *)&self->_abrClipHeroImageURL, 0);
  objc_storeStrong((id *)&self->_abrClipCaption, 0);
  objc_storeStrong((id *)&self->_abrClipName, 0);
  objc_storeStrong((id *)&self->_storeClipHeroImageURL, 0);
  objc_storeStrong((id *)&self->_storeClipCaption, 0);
  objc_storeStrong((id *)&self->_storeClipName, 0);
}

- (void)_updateInvocationPolicy:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "clipRequestURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "clipBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138740227;
  v7 = v4;
  v8 = 2117;
  v9 = v5;
  _os_log_error_impl(&dword_20AD44000, v3, OS_LOG_TYPE_ERROR, "Clip failed associated domain check. url = %{sensitive}@ bundleID = %{sensitive}@", (uint8_t *)&v6, 0x16u);

}

- (void)hasValidAssociatedDomainsToLaunchAppClip
{
  NSObject *v7;
  void *v8;

  v7 = a2;
  objc_msgSend(a3, "cps_privacyPreservingDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_error_impl(&dword_20AD44000, v7, OS_LOG_TYPE_ERROR, "Cannot parse associatd domain. Error: %{public}@", a1, 0xCu);

}

@end
