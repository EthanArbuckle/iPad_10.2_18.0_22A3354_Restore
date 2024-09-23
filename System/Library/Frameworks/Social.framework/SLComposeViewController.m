@implementation SLComposeViewController

+ (id)_unsupportedServiceTypes
{
  if (_unsupportedServiceTypes_onceToken != -1)
    dispatch_once(&_unsupportedServiceTypes_onceToken, &__block_literal_global_0);
  return (id)_unsupportedServiceTypes__unsupportedServiceTypes;
}

void __51__SLComposeViewController__unsupportedServiceTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.social.facebook"), CFSTR("com.apple.social.twitter"), CFSTR("com.apple.social.sinaweibo"), CFSTR("com.apple.social.flickr"), CFSTR("com.apple.social.vimeo"), CFSTR("com.apple.social.tencentweibo"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_unsupportedServiceTypes__unsupportedServiceTypes;
  _unsupportedServiceTypes__unsupportedServiceTypes = v0;

}

+ (id)_serviceTypeToExtensionIdentifierMap
{
  if (_serviceTypeToExtensionIdentifierMap_onceToken != -1)
    dispatch_once(&_serviceTypeToExtensionIdentifierMap_onceToken, &__block_literal_global_1_0);
  return (id)_serviceTypeToExtensionIdentifierMap__map;
}

void __63__SLComposeViewController__serviceTypeToExtensionIdentifierMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.social.facebook");
  v2[1] = CFSTR("com.apple.social.twitter");
  v3[0] = CFSTR("com.apple.share.Facebook.post");
  v3[1] = CFSTR("com.apple.share.Twitter.post");
  v2[2] = CFSTR("com.apple.social.sinaweibo");
  v2[3] = CFSTR("com.apple.social.flickr");
  v3[2] = CFSTR("com.apple.share.SinaWeibo.post");
  v3[3] = CFSTR("com.apple.share.Flickr.post");
  v2[4] = CFSTR("com.apple.social.vimeo");
  v2[5] = CFSTR("com.apple.social.tencentweibo");
  v3[4] = CFSTR("com.apple.share.Vimeo.post");
  v3[5] = CFSTR("com.apple.share.TencentWeibo.post");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_serviceTypeToExtensionIdentifierMap__map;
  _serviceTypeToExtensionIdentifierMap__map = v0;

}

+ (id)_extensionIdentifierForServiceType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_serviceTypeToExtensionIdentifierMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_serviceTypeForExtensionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_serviceTypeToExtensionIdentifierMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v5, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v5, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "isEqualToString:", v11);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (BOOL)_isServiceType:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SLComposeViewController__isServiceType___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v3 = _isServiceType__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_isServiceType__onceToken, block);
  v5 = objc_msgSend((id)_isServiceType___serviceTypes, "containsObject:", v4);

  return v5;
}

void __42__SLComposeViewController__isServiceType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_serviceTypeToExtensionIdentifierMap");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_isServiceType___serviceTypes;
  _isServiceType___serviceTypes = v1;

}

+ (id)extensionIdentifierForActivityType:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v11;
  _QWORD v12[6];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CEB208];
  v12[0] = *MEMORY[0x1E0CEB1F0];
  v12[1] = v4;
  v13[0] = CFSTR("com.apple.share.Facebook.post");
  v13[1] = CFSTR("com.apple.share.Twitter.post");
  v5 = *MEMORY[0x1E0CEB1F8];
  v12[2] = *MEMORY[0x1E0CEB218];
  v12[3] = v5;
  v13[2] = CFSTR("com.apple.share.SinaWeibo.post");
  v13[3] = CFSTR("com.apple.share.Flickr.post");
  v6 = *MEMORY[0x1E0CEB200];
  v12[4] = *MEMORY[0x1E0CEB210];
  v12[5] = v6;
  v13[4] = CFSTR("com.apple.share.Vimeo.post");
  v13[5] = CFSTR("com.apple.share.TencentWeibo.post");
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, v12, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v3, 7, CFSTR("SLComposeViewController extensionIdentifierForActivityType: %@ => %@"));

  return v11;
}

+ (id)_shareExtensionWithIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  v3 = _shareExtensionWithIdentifier__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_shareExtensionWithIdentifier__onceToken, &__block_literal_global_16);
  objc_msgSend((id)_shareExtensionWithIdentifier___identifierToMatcherMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "extension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __57__SLComposeViewController__shareExtensionWithIdentifier___block_invoke()
{
  _SLExtensionLazyMatcher *v0;
  _SLExtensionLazyMatcher *v1;
  _SLExtensionLazyMatcher *v2;
  _SLExtensionLazyMatcher *v3;
  _SLExtensionLazyMatcher *v4;
  _SLExtensionLazyMatcher *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[7];

  v9[6] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("com.apple.share.Facebook.post");
  v0 = -[_SLExtensionLazyMatcher initWithIdentifier:]([_SLExtensionLazyMatcher alloc], "initWithIdentifier:", CFSTR("com.apple.share.Facebook.post"));
  v9[0] = v0;
  v8[1] = CFSTR("com.apple.share.Twitter.post");
  v1 = -[_SLExtensionLazyMatcher initWithIdentifier:]([_SLExtensionLazyMatcher alloc], "initWithIdentifier:", CFSTR("com.apple.share.Twitter.post"));
  v9[1] = v1;
  v8[2] = CFSTR("com.apple.share.SinaWeibo.post");
  v2 = -[_SLExtensionLazyMatcher initWithIdentifier:]([_SLExtensionLazyMatcher alloc], "initWithIdentifier:", CFSTR("com.apple.share.SinaWeibo.post"));
  v9[2] = v2;
  v8[3] = CFSTR("com.apple.share.Flickr.post");
  v3 = -[_SLExtensionLazyMatcher initWithIdentifier:]([_SLExtensionLazyMatcher alloc], "initWithIdentifier:", CFSTR("com.apple.share.Flickr.post"));
  v9[3] = v3;
  v8[4] = CFSTR("com.apple.share.Vimeo.post");
  v4 = -[_SLExtensionLazyMatcher initWithIdentifier:]([_SLExtensionLazyMatcher alloc], "initWithIdentifier:", CFSTR("com.apple.share.Vimeo.post"));
  v9[4] = v4;
  v8[5] = CFSTR("com.apple.share.TencentWeibo.post");
  v5 = -[_SLExtensionLazyMatcher initWithIdentifier:]([_SLExtensionLazyMatcher alloc], "initWithIdentifier:", CFSTR("com.apple.share.TencentWeibo.post"));
  v9[5] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 6);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_shareExtensionWithIdentifier___identifierToMatcherMap;
  _shareExtensionWithIdentifier___identifierToMatcherMap = v6;

}

+ (BOOL)_legacyBuiltInAvailabilityForService:(id)a3 inHostApplicationBundleID:(id)a4
{
  id v6;
  id v7;
  int v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isFirstClassService"))
  {
    if ((!objc_msgSend(v7, "hasPrefix:", CFSTR("com.apple."))
       || !objc_msgSend(v7, "compare:options:", CFSTR("com.apple.gamecenter.GameCenterUIService"), 1))
      && (objc_msgSend(v6, "hasAccounts") & 1) == 0)
    {
      goto LABEL_5;
    }
LABEL_7:
    v8 = objc_msgSend(a1, "_isMultiUserDevice") ^ 1;
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "hasAccounts"))
    goto LABEL_7;
LABEL_5:
  LOBYTE(v8) = 0;
LABEL_8:

  return v8;
}

+ (BOOL)_isMultiUserDevice
{
  if (_isMultiUserDevice_onceToken != -1)
    dispatch_once(&_isMultiUserDevice_onceToken, &__block_literal_global_22);
  return _isMultiUserDevice_isMultiUserDevice;
}

void __45__SLComposeViewController__isMultiUserDevice__block_invoke()
{
  uint64_t v0;
  void *v1;
  int v2;
  id v3;

  v3 = (id)MKBUserTypeDeviceMode();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D4E5A0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D4E5A8]);
  _isMultiUserDevice_isMultiUserDevice = v2;
  if (v2)
    _SLLog(v0, 7, CFSTR("Built-in Social services disabled for multi-user mode."));

}

+ (BOOL)isAvailableForExtension:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "isAvailableForExtension:inHostApplicationBundleID:", v5, v7);

  return (char)a1;
}

+ (BOOL)isAvailableForServiceType:(NSString *)serviceType
{
  uint64_t v3;
  NSString *v5;
  void *v6;
  int v7;
  char v8;
  void *v9;
  void *v10;

  v5 = serviceType;
  objc_msgSend(a1, "_unsupportedServiceTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if (v7)
  {
    _SLLog(v3, 3, CFSTR("isAvailableForServiceType: for %@ returning NO"));
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(a1, "_isAvailableForServiceType:inHostApplicationBundleID:", v5, v10);

  }
  return v8;
}

+ (BOOL)isAvailableForExtension:(id)a3 inHostApplicationBundleID:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  _SLLog(v4, 7, CFSTR("SLComposeViewController isAvailableForExtension: %@ inHostApplicationBundleID: %@"));
  objc_msgSend(v7, "_plugIn", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "supersededBy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_serviceTypeForExtensionIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    _SLLog(v4, 7, CFSTR("SLComposeViewController isAvailableForExtension: %@ inHostApplicationBundleID: %@ got serviceType %@"));
    if (v13)
    {
      +[SLService serviceForServiceType:](SLService, "serviceForServiceType:", v13, v7, v8, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(a1, "_legacyBuiltInAvailabilityForService:inHostApplicationBundleID:", v14, v8);

    }
    else
    {
      v11 = 1;
    }

  }
  return v11;
}

+ (BOOL)_isAvailableForServiceType:(id)a3 inHostApplicationBundleID:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v20;
  void *v21;
  void *v22;

  v7 = a3;
  v8 = a4;
  _SLLog(v4, 7, CFSTR("SLComposeViewController isAvailableForServiceType %@"));
  v9 = objc_msgSend(a1, "_isServiceType:", v7, v7);
  v10 = v7;
  if (v9)
  {
    objc_msgSend(a1, "_extensionIdentifierForServiceType:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
  }
  else
  {
    objc_msgSend(a1, "_serviceTypeForExtensionIdentifier:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
  }
  if (v12)
  {
    +[SLService serviceForServiceType:](SLService, "serviceForServiceType:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(a1, "_legacyBuiltInAvailabilityForService:inHostApplicationBundleID:", v13, v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
    v20 = v12;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _SLLog(v4, 7, CFSTR("SLComposeViewController isAvailableForServiceType got serviceType %@ isAvailable %@"));

    if ((v14 & 1) == 0)
    {
      +[SLComposeViewController _shareExtensionWithIdentifier:](SLComposeViewController, "_shareExtensionWithIdentifier:", v11, v12, v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _SLLog(v4, 7, CFSTR("SLComposeViewController isAvailableForServiceType got extension %@ for extensionIdentifer %@"));
      if (v15)
      {
        objc_msgSend(v15, "_plugIn", v15, v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "supersededBy");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v20 = v11;
          _SLLog(v4, 7, CFSTR("SLComposeViewController isAvailableForServiceType returning YES for overridden extensionIdentifier %@"));
          v18 = 1;
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {
        v20 = v11;
        _SLLog(v4, 3, CFSTR("SLComposeViewController isAvailableForServiceType failed to get extension for identifier %@"));
      }
      v18 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v20 = v11;
    _SLLog(v4, 7, CFSTR("SLComposeViewController isAvailableForServiceType returning YES for extensionIdentifer %@"));
  }
  v18 = 1;
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v4, 7, CFSTR("SLComposeViewController isAvailableForServiceType %@ returning %@"));

  return v18;
}

- (SLComposeViewController)initWithExtension:(id)a3 requestedServiceType:(id)a4
{
  uint64_t v4;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SLComposeViewController *v14;
  SLComposeViewController *v15;
  SLComposeViewController *v16;
  id *p_extension;
  uint64_t v18;
  NSArray *itemProviders;
  const __CFString *v20;
  NSString *serviceType;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id location;
  objc_super v39;

  v8 = a3;
  v9 = a4;
  _SLLog(v4, 7, CFSTR("SLComposeViewController initWithExtension: %@ requestedServiceType: %@"));
  v10 = (void *)objc_opt_class();
  objc_msgSend(v8, "identifier", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_serviceTypeForExtensionIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    +[SLService serviceForServiceType:](SLService, "serviceForServiceType:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isFirstClassService") & 1) == 0 && !objc_msgSend(v13, "hasAccounts"))
    {
      v14 = 0;
      goto LABEL_30;
    }
  }
  else
  {
    v13 = 0;
  }
  v39.receiver = self;
  v39.super_class = (Class)SLComposeViewController;
  v15 = -[SLComposeViewController initWithNibName:bundle:](&v39, sel_initWithNibName_bundle_, 0, 0);
  v16 = v15;
  if (v15)
  {
    p_extension = (id *)&v15->_extension;
    objc_storeStrong((id *)&v15->_extension, a3);
    v18 = objc_opt_new();
    itemProviders = v16->_itemProviders;
    v16->_itemProviders = (NSArray *)v18;

    if (v9)
      v20 = (const __CFString *)v9;
    else
      v20 = &stru_1E7592238;
    serviceType = v16->_serviceType;
    v16->_serviceType = &v20->isa;

    if (v13)
    {
      v16->_maximumImageCount = objc_msgSend(v13, "maximumImageCount");
      v16->_maximumURLCount = objc_msgSend(v13, "maximumURLCount");
      v16->_maximumVideoCount = objc_msgSend(v13, "maximumVideoCount");
    }
    else
    {
      v16->_maximumImageCount = 0;
      v16->_maximumURLCount = 0;
      v16->_maximumVideoCount = 0;
      objc_msgSend(*p_extension, "attributes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("NSExtensionActivationRule"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("NSExtensionActivationSupportsImageWithMaxCount"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v16->_maximumImageCount = objc_msgSend(v24, "integerValue");
          }
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("NSExtensionActivationSupportsWebURLWithMaxCount"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v16->_maximumURLCount = objc_msgSend(v25, "integerValue");
          }
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("NSExtensionActivationSupportsMovieWithMaxCount"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v16->_maximumVideoCount = objc_msgSend(v26, "integerValue");
          }

        }
        else
        {
          v16->_maximumImageCount = -1;
          v16->_maximumURLCount = -1;
          v16->_maximumVideoCount = -1;
        }
      }

    }
    if (!*p_extension)
      v16->_didFailLoadingRemoteViewController = 1;
    objc_initWeak(&location, v16);
    v27 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __66__SLComposeViewController_initWithExtension_requestedServiceType___block_invoke;
    v36[3] = &unk_1E75908B0;
    objc_copyWeak(&v37, &location);
    objc_msgSend(*p_extension, "setRequestCompletionBlock:", v36);
    v34[0] = v27;
    v34[1] = 3221225472;
    v34[2] = __66__SLComposeViewController_initWithExtension_requestedServiceType___block_invoke_3;
    v34[3] = &unk_1E75906A0;
    objc_copyWeak(&v35, &location);
    objc_msgSend(*p_extension, "setRequestCancellationBlock:", v34);
    -[SLComposeViewController view](v16, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setOpaque:", 0);

    -[SLComposeViewController view](v16, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setClipsToBounds:", 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLComposeViewController view](v16, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setBackgroundColor:", v30);

    -[SLComposeViewController view](v16, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAutoresizingMask:", 18);

    -[SLComposeViewController setModalPresentationStyle:](v16, "setModalPresentationStyle:", 17);
    -[SLComposeViewController setShouldForceNonAnimatedTransition:](v16, "setShouldForceNonAnimatedTransition:", 1);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  self = v16;
  v14 = self;
LABEL_30:

  return v14;
}

void __66__SLComposeViewController_initWithExtension_requestedServiceType___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SLComposeViewController_initWithExtension_requestedServiceType___block_invoke_2;
  block[3] = &unk_1E7590740;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __66__SLComposeViewController_initWithExtension_requestedServiceType___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "completeWithResult:", 1);
    WeakRetained = v2;
  }

}

void __66__SLComposeViewController_initWithExtension_requestedServiceType___block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SLComposeViewController_initWithExtension_requestedServiceType___block_invoke_4;
  block[3] = &unk_1E7590740;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __66__SLComposeViewController_initWithExtension_requestedServiceType___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "completeWithResult:", 0);
    WeakRetained = v2;
  }

}

- (SLComposeViewController)initWithServiceType:(id)a3
{
  uint64_t v3;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  SLComposeViewController *v16;
  void *v18;

  v5 = a3;
  _SLLog(v3, 7, CFSTR("SLComposeViewController initWithServiceType: %@"));
  if (objc_msgSend((id)objc_opt_class(), "_isServiceType:", v5, v5))
  {
    v6 = v5;
    objc_msgSend((id)objc_opt_class(), "_extensionIdentifierForServiceType:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_serviceTypeForExtensionIdentifier:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v5;
  }
  v8 = v7;
  +[SLComposeViewController _shareExtensionWithIdentifier:](SLComposeViewController, "_shareExtensionWithIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v9;
  _SLLog(v3, 7, CFSTR("SLComposeViewController initWithServiceType got extension %@ for identifier %@"));
  if (v9)
    goto LABEL_7;
  +[SLComposeViewController _unsupportedServiceTypes](SLComposeViewController, "_unsupportedServiceTypes", 0, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v8);

  if (!v11)
    goto LABEL_7;
  +[SLService serviceForServiceType:](SLService, "serviceForServiceType:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[SLComposeViewController _legacyBuiltInAvailabilityForService:inHostApplicationBundleID:](SLComposeViewController, "_legacyBuiltInAvailabilityForService:inHostApplicationBundleID:", v12, v14);

  if (v15)
  {
LABEL_7:
    self = -[SLComposeViewController initWithExtension:requestedServiceType:](self, "initWithExtension:requestedServiceType:", v9, v6, v18);
    v16 = self;
  }
  else
  {
    _SLLog(v3, 3, CFSTR("SLComposeViewController initWithServiceType failed to get extension for identifier %@"));
    v16 = 0;
  }

  return v16;
}

+ (id)composeViewControllerForExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_serviceTypeForExtensionIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithExtension:requestedServiceType:", v4, v6);
  return v7;
}

+ (SLComposeViewController)composeViewControllerForServiceType:(NSString *)serviceType
{
  NSString *v4;
  void *v5;

  v4 = serviceType;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithServiceType:", v4);

  return (SLComposeViewController *)v5;
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  objc_super v6;

  _SLLog(v2, 7, CFSTR("SLComposeViewController dealloc %@"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)SLComposeViewController;
  -[SLComposeViewController dealloc](&v6, sel_dealloc);
}

- (BOOL)canAddContent
{
  return !self->_wasPresented;
}

- (BOOL)setInitialText:(NSString *)text
{
  NSString *v4;
  _BOOL4 v5;
  NSString *v6;
  NSString *initialText;

  v4 = text;
  v5 = -[SLComposeViewController canAddContent](self, "canAddContent");
  if (v5)
  {
    v6 = (NSString *)-[NSString copy](v4, "copy");
    initialText = self->_initialText;
    self->_initialText = v6;

  }
  return v5;
}

- (BOOL)supportsImageAsset:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;

  v5 = a3;
  _SLLog(v3, 6, CFSTR("supportsImageAsset start"));
  -[SLComposeViewController _urlForUntypedAsset:](self, "_urlForUntypedAsset:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (BOOL)supportsVideoAsset:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;

  v5 = a3;
  _SLLog(v3, 7, CFSTR("supportsVideoAsset start"));
  -[SLComposeViewController _urlForUntypedAsset:](self, "_urlForUntypedAsset:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (id)_urlForUntypedAsset:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "defaultRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "url");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
    }
    else
    {
      _SLLog(v3, 3, CFSTR("Unsupported asset type"));
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)addImageAsset:(id)a3
{
  uint64_t v3;
  id v5;
  BOOL v6;

  v5 = a3;
  _SLLog(v3, 7, CFSTR("addImageAsset: start"));
  v6 = -[SLComposeViewController _addImageAsset:preview:](self, "_addImageAsset:preview:", v5, 0);

  return v6;
}

- (BOOL)_addImageAsset:(id)a3 preview:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  int64_t maximumImageCount;
  void *v10;
  int v11;
  id *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *itemProviders;
  BOOL v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _SLLog(v4, 7, CFSTR("SLComposeViewController _addImageAsset: %@ preview: %@"));
  if (!-[SLComposeViewController supportsImageAsset:](self, "supportsImageAsset:", v7, v7, v8))
  {
    _SLLog(v4, 3, CFSTR("Asset type not supported"));
LABEL_11:
    v19 = 0;
    goto LABEL_12;
  }
  if (!-[SLComposeViewController canAddContent](self, "canAddContent"))
    goto LABEL_11;
  maximumImageCount = self->_maximumImageCount;
  if (maximumImageCount != -1 && self->_numImagesAdded >= maximumImageCount)
    goto LABEL_11;
  objc_msgSend(v7, "scheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("file"));
  v12 = (id *)MEMORY[0x1E0CA5B48];
  if (!v11)
    v12 = (id *)MEMORY[0x1E0CA5C90];
  v13 = *v12;

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithItem:typeIdentifier:", v7, v13);
  v23[0] = CFSTR("SLItemProviderIsImage");
  v23[1] = CFSTR("SLItemProviderHasPreview");
  v24[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8 != 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUserInfo:", v16);

  if (v8)
  {
    _SLLog(v4, 7, CFSTR("SLComposeViewController _addImageAsset:preview: supplying itemProvider.previewImageHandler"));
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __50__SLComposeViewController__addImageAsset_preview___block_invoke;
    v21[3] = &unk_1E75908D8;
    v22 = v8;
    objc_msgSend(v14, "setPreviewImageHandler:", v21);

  }
  ++self->_numImagesAdded;
  -[NSArray arrayByAddingObject:](self->_itemProviders, "arrayByAddingObject:", v14);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  itemProviders = self->_itemProviders;
  self->_itemProviders = v17;

  v19 = 1;
LABEL_12:

  return v19;
}

void __50__SLComposeViewController__addImageAsset_preview___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;

  v4 = a2;
  _SLLog(v2, 7, CFSTR("SLComposeViewController _addImageAsset:preview: itemProvider previewImageHandler got expectedValueClass %@ options %@"));
  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, *(_QWORD *)(a1 + 32), 0);

}

- (BOOL)addImage:(UIImage *)image
{
  uint64_t v3;
  UIImage *v5;
  int64_t maximumImageCount;
  void *v7;
  BOOL v8;

  v5 = image;
  _SLLog(v3, 7, CFSTR("addImage start"));
  if (-[SLComposeViewController canAddContent](self, "canAddContent")
    && ((maximumImageCount = self->_maximumImageCount, maximumImageCount == -1)
     || self->_numImagesAdded < maximumImageCount))
  {
    UIImageJPEGRepresentation(v5, 0.8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SLComposeViewController _addImageJPEGData:preview:](self, "_addImageJPEGData:preview:", v7, 0);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_addImageJPEGData:(id)a3 preview:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  int64_t maximumImageCount;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *itemProviders;
  BOOL v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[SLComposeViewController canAddContent](self, "canAddContent")
    && ((maximumImageCount = self->_maximumImageCount, maximumImageCount == -1)
     || self->_numImagesAdded < maximumImageCount))
  {
    v10 = objc_alloc(MEMORY[0x1E0CB36C8]);
    v11 = (void *)objc_msgSend(v10, "initWithItem:typeIdentifier:", v7, *MEMORY[0x1E0CA5BA8]);
    v23[0] = CFSTR("SLItemProviderIsImage");
    v23[1] = CFSTR("SLItemProviderHasPreview");
    v24[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8 != 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUserInfo:", v13);

    if (v8)
    {
      _SLLog(v4, 7, CFSTR("SLComposeViewController _addImageJPEGData:preview: supplying itemProvider.previewImageHandler"));
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __53__SLComposeViewController__addImageJPEGData_preview___block_invoke;
      v21 = &unk_1E75908D8;
      v22 = v8;
      objc_msgSend(v11, "setPreviewImageHandler:", &v18);

    }
    ++self->_numImagesAdded;
    -[NSArray arrayByAddingObject:](self->_itemProviders, "arrayByAddingObject:", v11, v18, v19, v20, v21);
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    itemProviders = self->_itemProviders;
    self->_itemProviders = v14;

    v16 = 1;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __53__SLComposeViewController__addImageJPEGData_preview___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;

  v4 = a2;
  _SLLog(v2, 7, CFSTR("SLComposeViewController _addImageJPEGData:preview: itemProvider previewImageHandler got expectedValueClass %@ options %@"));
  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, *(_QWORD *)(a1 + 32), 0);

}

- (BOOL)removeAllImages
{
  uint64_t v2;
  BOOL v4;
  BOOL v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  BOOL v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = -[SLComposeViewController canAddContent](self, "canAddContent");
  v5 = v4;
  if (v4)
  {
    v18 = v4;
    v6 = (void *)-[NSArray mutableCopy](self->_itemProviders, "mutableCopy");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v17 = 984;
    v7 = self->_itemProviders;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v12, "userInfo", v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SLItemProviderIsImage"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            objc_msgSend(v6, "removeObject:", v12);

        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    self->_numImagesAdded = 0;
    v15 = *(Class *)((char *)&self->super.super.super.isa + v17);
    *(Class *)((char *)&self->super.super.super.isa + v17) = (Class)v6;

    return v18;
  }
  else
  {
    _SLLog(v2, 6, CFSTR("Can't remove images - sheet already presented, returning NO"));
  }
  return v5;
}

- (BOOL)_addVideoAsset:(id)a3 preview:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  int64_t maximumVideoCount;
  void *v10;
  int v11;
  id *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *itemProviders;
  BOOL v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _SLLog(v4, 7, CFSTR("SLComposeViewController _addVideoAsset: %@ preview: %@"));
  if (-[SLComposeViewController supportsVideoAsset:](self, "supportsVideoAsset:", v7, v7, v8)
    && -[SLComposeViewController canAddContent](self, "canAddContent")
    && ((maximumVideoCount = self->_maximumVideoCount, maximumVideoCount == -1)
     || self->_numVideosAdded < maximumVideoCount))
  {
    objc_msgSend(v7, "scheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("file"));
    v12 = (id *)MEMORY[0x1E0CA5B48];
    if (!v11)
      v12 = (id *)MEMORY[0x1E0CA5C90];
    v13 = *v12;

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithItem:typeIdentifier:", v7, v13);
    v23[0] = CFSTR("SLItemProviderIsVideo");
    v23[1] = CFSTR("SLItemProviderHasPreview");
    v24[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8 != 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUserInfo:", v16);

    if (v8)
    {
      _SLLog(v4, 7, CFSTR("SLComposeViewController _addVideoAsset:preview: supplying itemProvider.previewImageHandler"));
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __50__SLComposeViewController__addVideoAsset_preview___block_invoke;
      v21[3] = &unk_1E75908D8;
      v22 = v8;
      objc_msgSend(v14, "setPreviewImageHandler:", v21);

    }
    ++self->_numVideosAdded;
    -[NSArray arrayByAddingObject:](self->_itemProviders, "arrayByAddingObject:", v14);
    v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
    itemProviders = self->_itemProviders;
    self->_itemProviders = v17;

    v19 = 1;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __50__SLComposeViewController__addVideoAsset_preview___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;

  v4 = a2;
  _SLLog(v2, 7, CFSTR("SLComposeViewController _addVideoAsset:preview: itemProvider previewImageHandler got expectedValueClass %@ options %@"));
  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, *(_QWORD *)(a1 + 32), 0);

}

- (BOOL)_addVideoData:(id)a3 preview:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  int64_t maximumVideoCount;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *itemProviders;
  BOOL v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[SLComposeViewController canAddContent](self, "canAddContent")
    && ((maximumVideoCount = self->_maximumVideoCount, maximumVideoCount == -1)
     || self->_numVideosAdded < maximumVideoCount))
  {
    v10 = objc_alloc(MEMORY[0x1E0CB36C8]);
    v11 = (void *)objc_msgSend(v10, "initWithItem:typeIdentifier:", v7, *MEMORY[0x1E0CA5BF8]);
    v23[0] = CFSTR("SLItemProviderIsVideo");
    v23[1] = CFSTR("SLItemProviderHasPreview");
    v24[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8 != 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUserInfo:", v13);

    if (v8)
    {
      _SLLog(v4, 7, CFSTR("SLComposeViewController _addVideoData:preview: supplying itemProvider.previewImageHandler"));
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __49__SLComposeViewController__addVideoData_preview___block_invoke;
      v21 = &unk_1E75908D8;
      v22 = v8;
      objc_msgSend(v11, "setPreviewImageHandler:", &v18);

    }
    ++self->_numVideosAdded;
    -[NSArray arrayByAddingObject:](self->_itemProviders, "arrayByAddingObject:", v11, v18, v19, v20, v21);
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    itemProviders = self->_itemProviders;
    self->_itemProviders = v14;

    v16 = 1;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __49__SLComposeViewController__addVideoData_preview___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;

  v4 = a2;
  _SLLog(v2, 7, CFSTR("SLComposeViewController _addVideoData:preview: itemProvider previewImageHandler got expectedValueClass %@ options %@"));
  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, *(_QWORD *)(a1 + 32), 0);

}

- (BOOL)addURL:(NSURL *)url
{
  uint64_t v3;
  NSURL *v5;
  BOOL v6;

  v5 = url;
  _SLLog(v3, 7, CFSTR("addURL: start"));
  v6 = -[SLComposeViewController addURL:withPreviewImage:](self, "addURL:withPreviewImage:", v5, 0);

  return v6;
}

- (BOOL)addURL:(id)a3 withPreviewImage:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isMusicStoreURL") & 1) != 0)
  {
    v8 = 3;
  }
  else if (objc_msgSend(v6, "isAppStoreURL"))
  {
    v8 = 4;
  }
  else
  {
    v8 = 0;
  }
  v9 = -[SLComposeViewController _addURL:type:preview:](self, "_addURL:type:preview:", v6, v8, v7);

  return v9;
}

- (BOOL)_addURL:(id)a3 type:(int64_t)a4 preview:(id)a5
{
  uint64_t v5;
  id v9;
  id v10;
  int64_t maximumURLCount;
  void *v12;
  int v13;
  id *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  NSArray *itemProviders;
  BOOL v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v5, 7, CFSTR("SLComposeViewController _addURL: %@ type: %@ preview: %@"));

  if (-[SLComposeViewController canAddContent](self, "canAddContent", v9, v24, v10)
    && ((maximumURLCount = self->_maximumURLCount, maximumURLCount == -1) || self->_numURLsAdded < maximumURLCount))
  {
    objc_msgSend(v9, "scheme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("file"));
    v14 = (id *)MEMORY[0x1E0CA5B48];
    if (!v13)
      v14 = (id *)MEMORY[0x1E0CA5C90];
    v15 = *v14;

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithItem:typeIdentifier:", v9, v15);
    v28[0] = MEMORY[0x1E0C9AAB0];
    v27[0] = CFSTR("SLItemProviderIsURL");
    v27[1] = CFSTR("SLAttachmentURLType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v17;
    v27[2] = CFSTR("SLItemProviderHasPreview");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10 != 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUserInfo:", v19);

    if (v10)
    {
      _SLLog(v5, 7, CFSTR("SLComposeViewController _addURL:type:preview: supplying itemProvider.previewImageHandler"));
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __48__SLComposeViewController__addURL_type_preview___block_invoke;
      v25[3] = &unk_1E75908D8;
      v26 = v10;
      objc_msgSend(v16, "setPreviewImageHandler:", v25);

    }
    ++self->_numURLsAdded;
    -[NSArray arrayByAddingObject:](self->_itemProviders, "arrayByAddingObject:", v16);
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
    itemProviders = self->_itemProviders;
    self->_itemProviders = v20;

    v22 = 1;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

void __48__SLComposeViewController__addURL_type_preview___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;

  v4 = a2;
  _SLLog(v2, 7, CFSTR("SLComposeViewController _addURL:type:preview: itemProvider previewImageHandler got expectedValueClass %@ options %@"));
  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, *(_QWORD *)(a1 + 32), 0);

}

- (BOOL)removeAllURLs
{
  uint64_t v2;
  BOOL v4;
  BOOL v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *initialText;
  NSArray *extensionItems;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  NSArray *itemProviders;
  void *v24;
  SLComposeViewController *v25;
  BOOL v26;
  NSArray *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  _SLLog(v2, 7, CFSTR("SLComposeViewController removeAllURLs"));
  v4 = -[SLComposeViewController canAddContent](self, "canAddContent");
  v5 = v4;
  if (v4)
  {
    v26 = v4;
    if (-[NSArray count](self->_extensionItems, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.itunesu"));

      if (v8)
      {
        if (!-[NSString length](self->_initialText, "length"))
        {
          -[NSArray objectAtIndexedSubscript:](self->_extensionItems, "objectAtIndexedSubscript:", 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "attributedContentText");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "string");
          v11 = (NSString *)objc_claimAutoreleasedReturnValue();
          initialText = self->_initialText;
          self->_initialText = v11;

        }
        extensionItems = self->_extensionItems;
        self->_extensionItems = 0;

        _SLLog(v2, 7, CFSTR("SLComposeViewController removeAllURLs did remove all _extensionItems and transfer the first items text to _initialText"));
      }
    }
    v27 = (NSArray *)-[NSArray mutableCopy](self->_itemProviders, "mutableCopy");
    _SLLog(v2, 7, CFSTR("SLComposeViewController removeAllURLs starting with mutableItemProviders %@"));
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v25 = self;
    v14 = self->_itemProviders;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16, v27);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v19, "userInfo");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          _SLLog(v2, 7, CFSTR("SLComposeViewController removeAllURLs examining itemProvider.userInfo %@"));

          objc_msgSend(v19, "userInfo", v24);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("SLItemProviderIsURL"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
            -[NSArray removeObject:](v27, "removeObject:", v19);

        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v16);
    }

    _SLLog(v2, 7, CFSTR("SLComposeViewController removeAllURLs ended with mutableItemProviders %@"));
    v25->_numURLsAdded = 0;
    itemProviders = v25->_itemProviders;
    v25->_itemProviders = v27;

    return v26;
  }
  else
  {
    _SLLog(v2, 6, CFSTR("Can't remove URLs - sheet already presented, returning NO"));
  }
  return v5;
}

- (BOOL)addItemProvider:(id)a3
{
  uint64_t v3;
  id v5;
  BOOL v6;
  NSArray *v7;
  NSArray *itemProviders;

  v5 = a3;
  _SLLog(v3, 7, CFSTR("SLComposeViewController addItemProvider: %@"));
  v6 = -[SLComposeViewController canAddContent](self, "canAddContent", v5);
  if (v6)
  {
    -[NSArray arrayByAddingObject:](self->_itemProviders, "arrayByAddingObject:", v5);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    itemProviders = self->_itemProviders;
    self->_itemProviders = v7;

  }
  else
  {
    _SLLog(v3, 6, CFSTR("Can't addItemProvider - sheet already presented, returning NO"));
  }

  return v6;
}

- (BOOL)addExtensionItem:(id)a3
{
  uint64_t v3;
  id v5;
  BOOL v6;
  NSArray *extensionItems;
  NSArray *v8;
  NSArray *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _SLLog(v3, 7, CFSTR("SLComposeViewController addExtensionItem: %@"));
  v6 = -[SLComposeViewController canAddContent](self, "canAddContent", v5);
  if (v6)
  {
    extensionItems = self->_extensionItems;
    if (extensionItems)
    {
      -[NSArray arrayByAddingObject:](extensionItems, "arrayByAddingObject:", v5);
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    v9 = self->_extensionItems;
    self->_extensionItems = v8;

  }
  else
  {
    _SLLog(v3, 6, CFSTR("Can't addExtensionItem - sheet already presented, returning NO"));
  }

  return v6;
}

- (BOOL)addAttachment:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  BOOL v8;
  SLComposeViewController *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  v5 = 0;
  switch(objc_msgSend(v4, "type"))
  {
    case 0:
      objc_msgSend(v4, "payload");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "previewImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[SLComposeViewController _addImageJPEGData:preview:](self, "_addImageJPEGData:preview:", v6, v7);
      goto LABEL_11;
    case 2:
      objc_msgSend(v4, "payload");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "previewImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[SLComposeViewController _addImageAsset:preview:](self, "_addImageAsset:preview:", v6, v7);
      goto LABEL_11;
    case 4:
      objc_msgSend(v4, "payload");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "previewImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self;
      v10 = v6;
      v11 = 0;
      goto LABEL_8;
    case 5:
      objc_msgSend(v4, "payload");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "previewImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self;
      v10 = v6;
      v11 = 3;
      goto LABEL_8;
    case 6:
      objc_msgSend(v4, "payload");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "previewImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self;
      v10 = v6;
      v11 = 4;
      goto LABEL_8;
    case 7:
      objc_msgSend(v4, "payload");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "previewImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self;
      v10 = v6;
      v11 = 5;
LABEL_8:
      v8 = -[SLComposeViewController _addURL:type:preview:](v9, "_addURL:type:preview:", v10, v11, v7);
      goto LABEL_11;
    case 8:
      objc_msgSend(v4, "payload");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "previewImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[SLComposeViewController _addVideoData:preview:](self, "_addVideoData:preview:", v6, v7);
      goto LABEL_11;
    case 9:
      objc_msgSend(v4, "payload");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "previewImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[SLComposeViewController _addVideoAsset:preview:](self, "_addVideoAsset:preview:", v6, v7);
LABEL_11:
      v5 = v8;

      break;
    default:
      break;
  }

  return v5;
}

- (id)addDownSampledImageDataByProxyWithPreviewImage:(id)a3
{
  uint64_t v3;

  _SLLog(v3, 3, CFSTR("addDownSampledImageDataByProxyWithPreviewImage is non-functional. please stop using it."));
  return &__block_literal_global_159;
}

void __74__SLComposeViewController_addDownSampledImageDataByProxyWithPreviewImage___block_invoke()
{
  uint64_t v0;

  _SLLog(v0, 3, CFSTR("you called the proxy block returned by addDownSampledImageDataByProxyWithPreviewImage. please stop using it."));
}

- (void)completeWithResult:(int64_t)a3
{
  uint64_t v3;
  void *v6;
  char v7;
  void (**completionHandler)(id, int64_t);
  id v9;
  void (**v10)(id, int64_t);
  id v11;
  int64_t v12;
  id v13;

  v12 = a3;
  _SLLog(v3, 7, CFSTR("SLComposeViewController completeWithResult: %d"));
  self->_didCompleteSheet = 1;
  if (self->_completionHandler)
  {
    -[SLComposeViewController serviceType](self, "serviceType", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.social.sinaweibo")))
    {
      v7 = dyld_program_sdk_at_least();

      completionHandler = (void (**)(id, int64_t))self->_completionHandler;
      if (completionHandler)
      {
        completionHandler[2](completionHandler, a3);
        v9 = self->_completionHandler;
        self->_completionHandler = 0;

      }
      if ((v7 & 1) == 0)
      {
        _SLLog(v3, 6, CFSTR("Expecting client to dismiss SLComposeViewController."));
        return;
      }
    }
    else
    {

      v10 = (void (**)(id, int64_t))self->_completionHandler;
      if (v10)
      {
        v10[2](v10, a3);
        v11 = self->_completionHandler;
        self->_completionHandler = 0;

      }
    }
  }
  if (-[SLComposeViewController isBeingDismissed](self, "isBeingDismissed", v12))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SLComposeViewController isBeingDismissed](self, "isBeingDismissed"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    _SLLog(v3, 7, CFSTR("SLComposeViewController skipping explicit dismiss because isBeingDismissed is already %@"));
  }
  else
  {
    _SLLog(v3, 7, CFSTR("SLComposeViewController automatically dismissing itself"));
    -[SLComposeViewController presentingViewController](self, "presentingViewController");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)userDidCancel
{
  -[SLComposeViewController completeWithResult:](self, "completeWithResult:", 0);
}

- (void)userDidPost
{
  -[SLComposeViewController completeWithResult:](self, "completeWithResult:", 1);
}

- (void)didLoadSheetViewController
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  -[SLComposeViewController remoteViewController](self, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willMoveToParentViewController:", self);

  -[SLComposeViewController remoteViewController](self, "remoteViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLComposeViewController addChildViewController:](self, "addChildViewController:", v4);

  -[SLComposeViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLComposeViewController remoteViewController](self, "remoteViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v7);

  -[SLComposeViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLComposeViewController remoteViewController](self, "remoteViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bringSubviewToFront:", v10);

  -[SLComposeViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[SLComposeViewController remoteViewController](self, "remoteViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v13, v15, v17, v19);

  -[SLComposeViewController remoteViewController](self, "remoteViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAlpha:", 1.0);

  -[SLComposeViewController remoteViewController](self, "remoteViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "didMoveToParentViewController:", self);

  -[SLComposeViewController view](self, "view");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setNeedsLayout");

}

- (void)_handleRemoteViewFailure
{
  uint64_t v2;

  if ((-[SLComposeViewController isBeingPresented](self, "isBeingPresented") & 1) != 0)
  {
    _SLLog(v2, 3, CFSTR("Sheet is being presented, delaying dismissal and callbacks"));
  }
  else
  {
    _SLLog(v2, 3, CFSTR("Sheet not being presented, calling premature completion"));
    -[SLComposeViewController completeWithResult:](self, "completeWithResult:", 0);
  }
  self->_hasInstantiatedExtensionUI = 1;
  self->_didFailLoadingRemoteViewController = 1;
}

- (void)remoteController:(id)a3 didLoadWithError:(id)a4
{
  uint64_t v4;
  void *v7;
  id v8;

  v8 = a3;
  if (a4)
  {
    _SLLog(v4, 3, CFSTR("HOST: Failed to load remote view controller with error: %@"));
    -[SLComposeViewController _handleRemoteViewFailure](self, "_handleRemoteViewFailure", a4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      _SLLog(v4, 7, CFSTR("SLComposeViewController received remoteViewController of class SLRemoteComposeViewController, and setting its delegate to self"));
      objc_msgSend(v8, "setDelegate:", self);
    }
    objc_msgSend(v8, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClipsToBounds:", 0);

    _SLLog(v4, 6, CFSTR("HOST: Successfully loaded remote SLComposeVC"));
    -[SLComposeViewController setRemoteViewController:](self, "setRemoteViewController:", v8);
    _SLLog(v4, 6, CFSTR("[remoteViewController setupRemoteViewController]"));
    -[SLComposeViewController setRemoteViewController:](self, "setRemoteViewController:", v8);
    -[SLComposeViewController didLoadSheetViewController](self, "didLoadSheetViewController");
    _SLLog(v4, 6, CFSTR("Finished setting up remote view controller"));
  }

}

- (void)remoteViewController:(id)a3 didTerminateWithError:(id)a4
{
  uint64_t v4;

  _SLLog(v4, 7, CFSTR("SLComposeViewController remoteViewController: %@ didTerminateWithError: %@"));
  if (!self->_didCompleteSheet)
    -[SLComposeViewController completeWithResult:](self, "completeWithResult:", 0);
}

- (BOOL)_useCustomDimmingView
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v3;
  _BOOL8 v4;
  void *v6;
  objc_super v7;

  v4 = a3;
  _SLLog(v3, 7, CFSTR("viewWillAppear"));
  self->_wasPresented = 1;
  v7.receiver = self;
  v7.super_class = (Class)SLComposeViewController;
  -[SLComposeViewController viewWillAppear:](&v7, sel_viewWillAppear_, v4);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_savedStatusBarStyle = objc_msgSend(v6, "statusBarStyle");

  -[SLComposeViewController _instantiateAndBeginExtensionIfNeeded](self, "_instantiateAndBeginExtensionIfNeeded");
}

- (void)_instantiateAndBeginExtensionIfNeededWithCompletion:(id)a3
{
  uint64_t v3;
  id v5;
  id v6;
  id v7;
  NSArray *extensionItems;
  id v9;
  void *v10;
  void *v11;
  NSExtension *extension;
  void *v13;
  void *v14;
  NSString *initialText;
  void *v16;
  _QWORD v17[5];
  id v18;

  v5 = a3;
  if (!self->_hasInstantiatedExtensionUI && self->_extension)
  {
    -[SLComposeViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", 0, 3.0);
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (-[NSArray count](self->_itemProviders, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](self->_itemProviders, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _SLLog(v3, 7, CFSTR("SLComposeViewController building implicit NSExtensionItem from array of %@ _itemProviders"));

      v7 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
      objc_msgSend(v7, "setAttachments:", self->_itemProviders, v13);
      objc_msgSend(v6, "addObject:", v7);

    }
    extensionItems = self->_extensionItems;
    if (extensionItems)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](extensionItems, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _SLLog(v3, 7, CFSTR("SLComposeViewController including %@ explicit NSExtensionItems"));

      objc_msgSend(v6, "addObjectsFromArray:", self->_extensionItems, v14);
    }
    if (self->_initialText)
    {
      initialText = self->_initialText;
      _SLLog(v3, 7, CFSTR("SLComposeViewController setting first extensionItem.attributedContentText to '%@'"));
      if (!objc_msgSend(v6, "count", initialText))
      {
        v9 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
        objc_msgSend(v6, "addObject:", v9);

      }
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", self->_initialText);
      objc_msgSend(v6, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAttributedContentText:", v10);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _SLLog(v3, 7, CFSTR("SLComposeViewController about to instantiate remote view controller with array of %@ NSExtensionItems"));

    self->_hasInstantiatedExtensionUI = 1;
    extension = self->_extension;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __79__SLComposeViewController__instantiateAndBeginExtensionIfNeededWithCompletion___block_invoke;
    v17[3] = &unk_1E7590940;
    v17[4] = self;
    v18 = v5;
    -[NSExtension instantiateViewControllerWithInputItems:listenerEndpoint:connectionHandler:](extension, "instantiateViewControllerWithInputItems:listenerEndpoint:connectionHandler:", v6, 0, v17, v16);

  }
}

void __79__SLComposeViewController__instantiateAndBeginExtensionIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v4;
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v8 = a3;
  v9 = a4;
  _SLLog(v4, 7, CFSTR("SLComposeViewController finished instantiate remote view controller %@ error %{public}@ extension request identifier %@"));
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
  objc_msgSend(*(id *)(a1 + 32), "remoteController:didLoadWithError:", v8, v9, v8, v9, v11);
  objc_msgSend(*(id *)(a1 + 32), "_endDelayingPresentation");

}

- (void)_instantiateAndBeginExtensionIfNeeded
{
  -[SLComposeViewController _instantiateAndBeginExtensionIfNeededWithCompletion:](self, "_instantiateAndBeginExtensionIfNeededWithCompletion:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SLComposeViewController;
  -[SLComposeViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v3;
  _BOOL8 v4;
  _QWORD block[5];
  objc_super v7;

  v4 = a3;
  _SLLog(v3, 7, CFSTR("viewDidAppear"));
  v7.receiver = self;
  v7.super_class = (Class)SLComposeViewController;
  -[SLComposeViewController viewDidAppear:](&v7, sel_viewDidAppear_, v4);
  if (self->_didFailLoadingRemoteViewController)
  {
    _SLLog(v3, 6, CFSTR("ViewDidAppear, but remote VC failed, dismissing"));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__SLComposeViewController_viewDidAppear___block_invoke;
    block[3] = &unk_1E7590248;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __41__SLComposeViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRemoteViewFailure");
}

- (void)viewDidUnload
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SLComposeViewController;
  -[SLComposeViewController viewDidUnload](&v2, sel_viewDidUnload);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    v7 = v6 != 0;
  }
  else
  {
    v7 = 0;
  }

  return a3 != 2 || v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (SLComposeViewControllerCompletionHandler)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(SLComposeViewControllerCompletionHandler)completionHandler
{
  objc_setProperty_nonatomic_copy(self, a2, completionHandler, 1032);
}

- (UIViewController)remoteViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setRemoteViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_keyboardTrackingView, 0);
  objc_storeStrong((id *)&self->_keyboardTopConstraint, 0);
  objc_storeStrong((id *)&self->_extensionItems, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
  objc_storeStrong((id *)&self->_initialText, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end
