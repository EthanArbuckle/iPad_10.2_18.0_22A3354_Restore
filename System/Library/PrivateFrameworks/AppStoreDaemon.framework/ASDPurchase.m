@implementation ASDPurchase

- (ASDPurchase)init
{
  ASDPurchase *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASDPurchase;
  result = -[ASDPurchase init](&v3, sel_init);
  if (result)
  {
    result->_createsJobs = 1;
    result->_softwarePlatform = 1;
  }
  return result;
}

- (NSString)buyParameters
{
  id v3;
  void *v4;

  if (self->_buyParameters)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v3, "setQueryItems:", self->_buyParameters);
    objc_msgSend(v3, "percentEncodedQuery");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (void)setBuyParameters:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *buyParameters;
  id v7;

  v7 = a3;
  if (v7)
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0CB3998]);
    -[NSArray setPercentEncodedQuery:](v4, "setPercentEncodedQuery:", v7);
    -[NSArray queryItems](v4, "queryItems");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    buyParameters = self->_buyParameters;
    self->_buyParameters = v5;

  }
  else
  {
    v4 = self->_buyParameters;
    self->_buyParameters = 0;
  }

}

- (void)appendValue:(id)a3 forBuyParameter:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  NSArray *buyParameters;
  NSArray *v10;
  NSArray *v11;
  id v12;

  v6 = (objc_class *)MEMORY[0x1E0CB39D8];
  v7 = a4;
  v8 = a3;
  v12 = (id)objc_msgSend([v6 alloc], "initWithName:value:", v7, v8);

  buyParameters = self->_buyParameters;
  if (buyParameters)
    -[NSArray arrayByAddingObject:](buyParameters, "arrayByAddingObject:", v12);
  else
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v12);
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v11 = self->_buyParameters;
  self->_buyParameters = v10;

}

- (id)firstValueForBuyParameter:(id)a3
{
  id v4;
  NSArray *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_buyParameters;
  v6 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "name", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          objc_msgSend(v9, "value");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDPurchase *v5;
  uint64_t v6;
  NSNumber *accountIdentifier;
  uint64_t v8;
  NSDictionary *additionalHeaders;
  uint64_t v10;
  NSString *affiliateIdentifier;
  uint64_t v12;
  NSArray *appCapabilities;
  uint64_t v14;
  NSString *bagKey;
  uint64_t v16;
  NSString *bundleID;
  uint64_t v18;
  NSArray *buyParameters;
  uint64_t v20;
  NSString *clientID;
  uint64_t v22;
  NSArray *gratisIdentifiers;
  uint64_t v24;
  NSNumber *itemID;
  uint64_t v26;
  NSString *itemName;
  uint64_t v28;
  NSDictionary *metricsOverlay;
  uint64_t v30;
  NSString *presentingSceneBundleIdentifier;
  uint64_t v32;
  NSString *presentingSceneIdentifier;
  uint64_t v34;
  NSString *referrerName;
  uint64_t v36;
  NSString *referrerURL;
  uint64_t v38;
  NSArray *requiredCapabilities;
  uint64_t v40;
  NSString *vendorName;
  uint64_t v42;
  NSString *preflightURLString;

  v5 = -[ASDPurchase init](+[ASDPurchase allocWithZone:](ASDPurchase, "allocWithZone:"), "init");
  v6 = -[NSNumber copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSNumber *)v6;

  v8 = -[NSDictionary copyWithZone:](self->_additionalHeaders, "copyWithZone:", a3);
  additionalHeaders = v5->_additionalHeaders;
  v5->_additionalHeaders = (NSDictionary *)v8;

  v10 = -[NSString copyWithZone:](self->_affiliateIdentifier, "copyWithZone:", a3);
  affiliateIdentifier = v5->_affiliateIdentifier;
  v5->_affiliateIdentifier = (NSString *)v10;

  v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "allocWithZone:", a3), "initWithArray:copyItems:", self->_appCapabilities, 1);
  appCapabilities = v5->_appCapabilities;
  v5->_appCapabilities = (NSArray *)v12;

  v14 = -[NSString copyWithZone:](self->_bagKey, "copyWithZone:", a3);
  bagKey = v5->_bagKey;
  v5->_bagKey = (NSString *)v14;

  v16 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v16;

  v18 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "allocWithZone:", a3), "initWithArray:copyItems:", self->_buyParameters, 1);
  buyParameters = v5->_buyParameters;
  v5->_buyParameters = (NSArray *)v18;

  v20 = -[NSString copyWithZone:](self->_clientID, "copyWithZone:", a3);
  clientID = v5->_clientID;
  v5->_clientID = (NSString *)v20;

  v5->_createsJobs = self->_createsJobs;
  v5->_isDefaultBrowser = self->_isDefaultBrowser;
  v5->_displaysOnLockScreen = self->_displaysOnLockScreen;
  v5->_extensionsToEnable = self->_extensionsToEnable;
  v5->_forceWatchInstall = self->_forceWatchInstall;
  v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "allocWithZone:", a3), "initWithArray:copyItems:", self->_gratisIdentifiers, 1);
  gratisIdentifiers = v5->_gratisIdentifiers;
  v5->_gratisIdentifiers = (NSArray *)v22;

  v5->_isBackgroundUpdate = self->_isBackgroundUpdate;
  v5->_isDSIDLess = self->_isDSIDLess;
  v5->_isRedownload = self->_isRedownload;
  v5->_isRefresh = self->_isRefresh;
  v5->_isUpdate = self->_isUpdate;
  v24 = -[NSNumber copyWithZone:](self->_itemID, "copyWithZone:", a3);
  itemID = v5->_itemID;
  v5->_itemID = (NSNumber *)v24;

  v26 = -[NSString copyWithZone:](self->_itemName, "copyWithZone:", a3);
  itemName = v5->_itemName;
  v5->_itemName = (NSString *)v26;

  v28 = -[NSDictionary copyWithZone:](self->_metricsOverlay, "copyWithZone:", a3);
  metricsOverlay = v5->_metricsOverlay;
  v5->_metricsOverlay = (NSDictionary *)v28;

  v5->_purchaseID = self->_purchaseID;
  v30 = -[NSString copyWithZone:](self->_presentingSceneBundleIdentifier, "copyWithZone:", a3);
  presentingSceneBundleIdentifier = v5->_presentingSceneBundleIdentifier;
  v5->_presentingSceneBundleIdentifier = (NSString *)v30;

  v32 = -[NSString copyWithZone:](self->_presentingSceneIdentifier, "copyWithZone:", a3);
  presentingSceneIdentifier = v5->_presentingSceneIdentifier;
  v5->_presentingSceneIdentifier = (NSString *)v32;

  v34 = -[NSString copyWithZone:](self->_referrerName, "copyWithZone:", a3);
  referrerName = v5->_referrerName;
  v5->_referrerName = (NSString *)v34;

  v36 = -[NSString copyWithZone:](self->_referrerURL, "copyWithZone:", a3);
  referrerURL = v5->_referrerURL;
  v5->_referrerURL = (NSString *)v36;

  v5->_sendGUID = self->_sendGUID;
  v5->_softwarePlatform = self->_softwarePlatform;
  v38 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "allocWithZone:", a3), "initWithArray:copyItems:", self->_requiredCapabilities, 1);
  requiredCapabilities = v5->_requiredCapabilities;
  v5->_requiredCapabilities = (NSArray *)v38;

  v5->_shouldCancelForInstalledBundleItems = self->_shouldCancelForInstalledBundleItems;
  v40 = -[NSString copyWithZone:](self->_vendorName, "copyWithZone:", a3);
  vendorName = v5->_vendorName;
  v5->_vendorName = (NSString *)v40;

  v42 = -[NSString copyWithZone:](self->_preflightURLString, "copyWithZone:", a3);
  preflightURLString = v5->_preflightURLString;
  v5->_preflightURLString = (NSString *)v42;

  v5->_installUniversalVariant = self->_installUniversalVariant;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDPurchase)initWithCoder:(id)a3
{
  id v4;
  ASDPurchase *v5;
  uint64_t v6;
  NSNumber *accountIdentifier;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *additionalHeaders;
  uint64_t v13;
  NSString *affiliateIdentifier;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *appCapabilities;
  uint64_t v20;
  NSString *bagKey;
  uint64_t v22;
  NSString *bundleID;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSArray *buyParameters;
  uint64_t v29;
  NSString *clientID;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSArray *gratisIdentifiers;
  uint64_t v36;
  NSNumber *itemID;
  uint64_t v38;
  NSString *itemName;
  uint64_t v40;
  NSDictionary *metricsOverlay;
  uint64_t v42;
  NSString *presentingSceneBundleIdentifier;
  uint64_t v44;
  NSString *presentingSceneIdentifier;
  uint64_t v46;
  NSString *referrerName;
  uint64_t v48;
  NSString *referrerURL;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSArray *requiredCapabilities;
  uint64_t v55;
  NSString *vendorName;
  uint64_t v57;
  NSString *preflightURLString;

  v4 = a3;
  v5 = -[ASDPurchase init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSNumber *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("additionalHeaders"));
    v11 = objc_claimAutoreleasedReturnValue();
    additionalHeaders = v5->_additionalHeaders;
    v5->_additionalHeaders = (NSDictionary *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("affiliateIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    affiliateIdentifier = v5->_affiliateIdentifier;
    v5->_affiliateIdentifier = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("appCapabilities"));
    v18 = objc_claimAutoreleasedReturnValue();
    appCapabilities = v5->_appCapabilities;
    v5->_appCapabilities = (NSArray *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bagKey"));
    v20 = objc_claimAutoreleasedReturnValue();
    bagKey = v5->_bagKey;
    v5->_bagKey = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v22 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v22;

    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("buyParameters"));
    v27 = objc_claimAutoreleasedReturnValue();
    buyParameters = v5->_buyParameters;
    v5->_buyParameters = (NSArray *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientID"));
    v29 = objc_claimAutoreleasedReturnValue();
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v29;

    v5->_createsJobs = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("createsJobs"));
    v5->_isDefaultBrowser = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDefaultBrowser"));
    v5->_displaysOnLockScreen = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("displaysOnLockScreen"));
    v5->_extensionsToEnable = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("extensionsToEnable"));
    v5->_forceWatchInstall = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forceWatchInstall"));
    v31 = (void *)MEMORY[0x1E0C99E60];
    v32 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("gratisIdentifiers"));
    v34 = objc_claimAutoreleasedReturnValue();
    gratisIdentifiers = v5->_gratisIdentifiers;
    v5->_gratisIdentifiers = (NSArray *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemID"));
    v36 = objc_claimAutoreleasedReturnValue();
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v36;

    v5->_isBackgroundUpdate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isBackgroundUpdate"));
    v5->_isDSIDLess = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDSIDless"));
    v5->_isRedownload = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRedownload"));
    v5->_isRefresh = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRefresh"));
    v5->_isUpdate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isUpdate"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemName"));
    v38 = objc_claimAutoreleasedReturnValue();
    itemName = v5->_itemName;
    v5->_itemName = (NSString *)v38;

    objc_msgSend(v4, "asd_decodeJSONDictionaryForKey:", CFSTR("metricsOverlay"));
    v40 = objc_claimAutoreleasedReturnValue();
    metricsOverlay = v5->_metricsOverlay;
    v5->_metricsOverlay = (NSDictionary *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("presentingSceneBundleIdentifier"));
    v42 = objc_claimAutoreleasedReturnValue();
    presentingSceneBundleIdentifier = v5->_presentingSceneBundleIdentifier;
    v5->_presentingSceneBundleIdentifier = (NSString *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("presentingSceneIdentifier"));
    v44 = objc_claimAutoreleasedReturnValue();
    presentingSceneIdentifier = v5->_presentingSceneIdentifier;
    v5->_presentingSceneIdentifier = (NSString *)v44;

    v5->_purchaseID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("purchaseID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referrerName"));
    v46 = objc_claimAutoreleasedReturnValue();
    referrerName = v5->_referrerName;
    v5->_referrerName = (NSString *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referrerURL"));
    v48 = objc_claimAutoreleasedReturnValue();
    referrerURL = v5->_referrerURL;
    v5->_referrerURL = (NSString *)v48;

    v50 = (void *)MEMORY[0x1E0C99E60];
    v51 = objc_opt_class();
    objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v52, CFSTR("requiredCapabilities"));
    v53 = objc_claimAutoreleasedReturnValue();
    requiredCapabilities = v5->_requiredCapabilities;
    v5->_requiredCapabilities = (NSArray *)v53;

    v5->_sendGUID = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sendGUID"));
    v5->_shouldCancelForInstalledBundleItems = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldCancelForInstalledBundleItems"));
    v5->_softwarePlatform = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("softwarePlatform"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vendorName"));
    v55 = objc_claimAutoreleasedReturnValue();
    vendorName = v5->_vendorName;
    v5->_vendorName = (NSString *)v55;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preflightURL"));
    v57 = objc_claimAutoreleasedReturnValue();
    preflightURLString = v5->_preflightURLString;
    v5->_preflightURLString = (NSString *)v57;

    v5->_installUniversalVariant = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("installUniversalVariant"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *metricsOverlay;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_additionalHeaders, CFSTR("additionalHeaders"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_affiliateIdentifier, CFSTR("affiliateIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appCapabilities, CFSTR("appCapabilities"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bagKey, CFSTR("bagKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_buyParameters, CFSTR("buyParameters"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientID, CFSTR("clientID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_createsJobs, CFSTR("createsJobs"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_displaysOnLockScreen, CFSTR("displaysOnLockScreen"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_extensionsToEnable, CFSTR("extensionsToEnable"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forceWatchInstall, CFSTR("forceWatchInstall"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_gratisIdentifiers, CFSTR("gratisIdentifiers"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isBackgroundUpdate, CFSTR("isBackgroundUpdate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDSIDLess, CFSTR("isDSIDless"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDefaultBrowser, CFSTR("isDefaultBrowser"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isRedownload, CFSTR("isRedownload"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isRefresh, CFSTR("isRefresh"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isUpdate, CFSTR("isUpdate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemID, CFSTR("itemID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemName, CFSTR("itemName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_presentingSceneBundleIdentifier, CFSTR("presentingSceneBundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_presentingSceneIdentifier, CFSTR("presentingSceneIdentifier"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_purchaseID, CFSTR("purchaseID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_referrerName, CFSTR("referrerName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_referrerURL, CFSTR("referrerURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requiredCapabilities, CFSTR("requiredCapabilities"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_sendGUID, CFSTR("sendGUID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldCancelForInstalledBundleItems, CFSTR("shouldCancelForInstalledBundleItems"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_softwarePlatform, CFSTR("softwarePlatform"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vendorName, CFSTR("vendorName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preflightURLString, CFSTR("preflightURL"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_installUniversalVariant, CFSTR("installUniversalVariant"));
  metricsOverlay = self->_metricsOverlay;
  if (metricsOverlay)
    objc_msgSend(v5, "asd_encodeJSONDictionary:forKey:", metricsOverlay, CFSTR("metricsOverlay"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]: bundleID: %@ accountID: %@ bagKey: %@ buyParams: %@ extensionsToEnable: %lu isBackgroundUpdate: %d isRedownload: %d isUpdate: %d itemID: %@ itemName: %@ purchaseID: %lld vendorName: %@ softwarePlatform: %ld]"), objc_opt_class(), self->_bundleID, self->_accountIdentifier, self->_bagKey, self->_buyParameters, self->_extensionsToEnable, self->_isBackgroundUpdate, self->_isRedownload, self->_isUpdate, self->_itemID, self->_itemName, self->_purchaseID, self->_vendorName, self->_softwarePlatform);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)itemName
{
  return self->_itemName;
}

- (void)setItemName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)presentingSceneBundleIdentifier
{
  return self->_presentingSceneBundleIdentifier;
}

- (void)setPresentingSceneBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)presentingSceneIdentifier
{
  return self->_presentingSceneIdentifier;
}

- (void)setPresentingSceneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (void)setVendorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (void)setAdditionalHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)affiliateIdentifier
{
  return self->_affiliateIdentifier;
}

- (void)setAffiliateIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)appCapabilities
{
  return self->_appCapabilities;
}

- (void)setAppCapabilities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)bagKey
{
  return self->_bagKey;
}

- (void)setBagKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)createsJobs
{
  return self->_createsJobs;
}

- (void)setCreatesJobs:(BOOL)a3
{
  self->_createsJobs = a3;
}

- (BOOL)isDefaultBrowser
{
  return self->_isDefaultBrowser;
}

- (void)setIsDefaultBrowser:(BOOL)a3
{
  self->_isDefaultBrowser = a3;
}

- (BOOL)displaysOnLockScreen
{
  return self->_displaysOnLockScreen;
}

- (void)setDisplaysOnLockScreen:(BOOL)a3
{
  self->_displaysOnLockScreen = a3;
}

- (NSString)downloadVolume
{
  return self->_downloadVolume;
}

- (void)setDownloadVolume:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (int64_t)extensionsToEnable
{
  return self->_extensionsToEnable;
}

- (void)setExtensionsToEnable:(int64_t)a3
{
  self->_extensionsToEnable = a3;
}

- (BOOL)forceWatchInstall
{
  return self->_forceWatchInstall;
}

- (void)setForceWatchInstall:(BOOL)a3
{
  self->_forceWatchInstall = a3;
}

- (NSArray)gratisIdentifiers
{
  return self->_gratisIdentifiers;
}

- (void)setGratisIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)installVolume
{
  return self->_installVolume;
}

- (void)setInstallVolume:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)isIOSBinaryMacOSCompatible
{
  return self->_iOSBinaryMacOSCompatible;
}

- (void)setIOSBinaryMacOSCompatible:(BOOL)a3
{
  self->_iOSBinaryMacOSCompatible = a3;
}

- (BOOL)isDSIDLess
{
  return self->_isDSIDLess;
}

- (void)setIsDSIDLess:(BOOL)a3
{
  self->_isDSIDLess = a3;
}

- (BOOL)isUpdate
{
  return self->_isUpdate;
}

- (void)setIsUpdate:(BOOL)a3
{
  self->_isUpdate = a3;
}

- (BOOL)isBackgroundUpdate
{
  return self->_isBackgroundUpdate;
}

- (void)setIsBackgroundUpdate:(BOOL)a3
{
  self->_isBackgroundUpdate = a3;
}

- (NSDictionary)metricsOverlay
{
  return self->_metricsOverlay;
}

- (void)setMetricsOverlay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSXPCListenerEndpoint)paymentViewServiceListener
{
  return self->_paymentViewServiceListener;
}

- (void)setPaymentViewServiceListener:(id)a3
{
  objc_storeStrong((id *)&self->_paymentViewServiceListener, a3);
}

- (NSString)referrerName
{
  return self->_referrerName;
}

- (void)setReferrerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)referrerURL
{
  return self->_referrerURL;
}

- (void)setReferrerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)isRedownload
{
  return self->_isRedownload;
}

- (void)setIsRedownload:(BOOL)a3
{
  self->_isRedownload = a3;
}

- (int64_t)softwarePlatform
{
  return self->_softwarePlatform;
}

- (void)setSoftwarePlatform:(int64_t)a3
{
  self->_softwarePlatform = a3;
}

- (int64_t)purchaseID
{
  return self->_purchaseID;
}

- (void)setPurchaseID:(int64_t)a3
{
  self->_purchaseID = a3;
}

- (NSArray)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (void)setRequiredCapabilities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (BOOL)shouldCancelForInstalledBundleItems
{
  return self->_shouldCancelForInstalledBundleItems;
}

- (void)setShouldCancelForInstalledBundleItems:(BOOL)a3
{
  self->_shouldCancelForInstalledBundleItems = a3;
}

- (NSString)preflightURLString
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setPreflightURLString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 208);
}

- (BOOL)installUniversalVariant
{
  return self->_installUniversalVariant;
}

- (void)setInstallUniversalVariant:(BOOL)a3
{
  self->_installUniversalVariant = a3;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (BOOL)isCompatibilityUpdate
{
  return self->_isCompatibilityUpdate;
}

- (void)setIsCompatibilityUpdate:(BOOL)a3
{
  self->_isCompatibilityUpdate = a3;
}

- (BOOL)isRefresh
{
  return self->_isRefresh;
}

- (void)setIsRefresh:(BOOL)a3
{
  self->_isRefresh = a3;
}

- (NSNumber)ownerDSID
{
  return self->_ownerDSID;
}

- (void)setOwnerDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSNumber)purchaserDSID
{
  return self->_purchaserDSID;
}

- (void)setPurchaserDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (BOOL)sendGUID
{
  return self->_sendGUID;
}

- (void)setSendGUID:(BOOL)a3
{
  self->_sendGUID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaserDSID, 0);
  objc_storeStrong((id *)&self->_ownerDSID, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_preflightURLString, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_referrerURL, 0);
  objc_storeStrong((id *)&self->_referrerName, 0);
  objc_storeStrong((id *)&self->_paymentViewServiceListener, 0);
  objc_storeStrong((id *)&self->_metricsOverlay, 0);
  objc_storeStrong((id *)&self->_installVolume, 0);
  objc_storeStrong((id *)&self->_gratisIdentifiers, 0);
  objc_storeStrong((id *)&self->_downloadVolume, 0);
  objc_storeStrong((id *)&self->_bagKey, 0);
  objc_storeStrong((id *)&self->_appCapabilities, 0);
  objc_storeStrong((id *)&self->_affiliateIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalHeaders, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_buyParameters, 0);
}

@end
