@implementation FCPaidBundleConfiguration

- (BOOL)isFreeBadgeEnabledForNonSubscribers
{
  void *v2;
  char v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("freeBadgeEnabled"), 0);

  return v3;
}

- (BOOL)areMagazinesEnabled
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;

  if (qword_1ED0F85E8 != -1)
    dispatch_once(&qword_1ED0F85E8, &__block_literal_global_69_0);
  if (_MergedGlobals_194)
    return 1;
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isContentStoreFrontSupported");

  if (!v5)
    return 0;
  -[FCPaidBundleConfiguration defaultSupportedStoreFronts](self, "defaultSupportedStoreFronts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPaidBundleConfiguration storefrontID](self, "storefrontID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", v7))
    v8 = 7;
  else
    v8 = 0;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = FCAppConfigurationIntegerValueWithDefaultValueIfMissing(v9, (uint64_t)CFSTR("enabledLevel"), v8, 0);

  return v10 & 1;
}

- (NSDictionary)configDict
{
  return self->_configDict;
}

- (NSString)storefrontID
{
  return self->_storefrontID;
}

- (NSArray)defaultSupportedStoreFronts
{
  return self->_defaultSupportedStoreFronts;
}

- (FCPaidBundleConfiguration)initWithConfigDictionary:(id)a3 storefrontID:(id)a4 localizedStorefrontID:(id)a5 defaultSupportedStoreFronts:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FCPaidBundleConfiguration *v14;
  uint64_t v15;
  NSDictionary *configDict;
  uint64_t v17;
  NSString *storefrontID;
  uint64_t v19;
  NSString *localizedStorefrontID;
  uint64_t v21;
  NSMutableDictionary *keyedPaywallConfigurationsByType;
  uint64_t v23;
  NSMutableDictionary *keyedSubscriptionButtonConfigurationsByType;
  uint64_t v25;
  NSMutableDictionary *keyedPostPurchaseOnboardingConfigurationsByType;
  uint64_t v27;
  NFUnfairLock *lock;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  objc_super v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v34.receiver = self;
  v34.super_class = (Class)FCPaidBundleConfiguration;
  v14 = -[FCPaidBundleConfiguration init](&v34, sel_init);
  if (!v14)
    goto LABEL_17;
  v15 = objc_msgSend(v10, "copy");
  configDict = v14->_configDict;
  v14->_configDict = (NSDictionary *)v15;

  v17 = objc_msgSend(v11, "copy");
  storefrontID = v14->_storefrontID;
  v14->_storefrontID = (NSString *)v17;

  v19 = objc_msgSend(v12, "copy");
  localizedStorefrontID = v14->_localizedStorefrontID;
  v14->_localizedStorefrontID = (NSString *)v19;

  objc_storeStrong((id *)&v14->_defaultSupportedStoreFronts, a6);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = objc_claimAutoreleasedReturnValue();
  keyedPaywallConfigurationsByType = v14->_keyedPaywallConfigurationsByType;
  v14->_keyedPaywallConfigurationsByType = (NSMutableDictionary *)v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v23 = objc_claimAutoreleasedReturnValue();
  keyedSubscriptionButtonConfigurationsByType = v14->_keyedSubscriptionButtonConfigurationsByType;
  v14->_keyedSubscriptionButtonConfigurationsByType = (NSMutableDictionary *)v23;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v25 = objc_claimAutoreleasedReturnValue();
  keyedPostPurchaseOnboardingConfigurationsByType = v14->_keyedPostPurchaseOnboardingConfigurationsByType;
  v14->_keyedPostPurchaseOnboardingConfigurationsByType = (NSMutableDictionary *)v25;

  v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60B18]), "initWithOptions:", 1);
  lock = v14->_lock;
  v14->_lock = (NFUnfairLock *)v27;

  FCAppConfigurationStringValue(v10, (uint64_t)CFSTR("articleSoftPaywallPosition"), CFSTR("top"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v29, "isEqualToString:", CFSTR("top")))
  {
    if (objc_msgSend(v29, "isEqualToString:", CFSTR("both")))
    {
      v30 = 2;
      goto LABEL_10;
    }
    if (objc_msgSend(v29, "isEqualToString:", CFSTR("bottom")))
    {
      v30 = 4;
      goto LABEL_10;
    }
    if (objc_msgSend(v29, "isEqualToString:", CFSTR("none")))
    {
      v30 = 1;
      goto LABEL_10;
    }
  }
  v30 = 3;
LABEL_10:
  v14->_articleSoftPaywallPosition = v30;
  FCAppConfigurationStringValue(v10, (uint64_t)CFSTR("aLaCarteArticleSoftPaywallPosition"), CFSTR("bottom"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "isEqualToString:", CFSTR("top")))
  {
    v32 = 2;
  }
  else if (objc_msgSend(v31, "isEqualToString:", CFSTR("bottom"))
         || !objc_msgSend(v31, "isEqualToString:", CFSTR("none")))
  {
    v32 = 3;
  }
  else
  {
    v32 = 1;
  }
  v14->_aLaCarteArticleSoftPaywallPosition = v32;

LABEL_17:
  return v14;
}

- (BOOL)isPaidBadgeEnabledForNonSubscribers
{
  void *v2;
  char v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("paidBadgeEnabled"), 1);

  return v3;
}

- (NSArray)restorableBundlePurchaseIDs
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;

  NewsCoreUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayForKey:", CFSTR("newssubscription.bundle_subscriptions.restorable_purchase_ids"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_7;
  objc_msgSend(v4, "firstObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_7;
  v6 = (void *)v5;
  objc_msgSend(v4, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {

    goto LABEL_7;
  }
  v8 = NFInternalBuild();

  if (!v8)
  {
LABEL_7:
    -[FCPaidBundleConfiguration configDict](self, "configDict");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationArrayValueWithDefaultValue(v10, (uint64_t)CFSTR("restorablePurchaseIds"), &unk_1E470C798);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  v9 = v4;
LABEL_8:

  return (NSArray *)v9;
}

- (NSArray)offeredBundlePurchaseIDs
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;

  NewsCoreUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayForKey:", CFSTR("newssubscription.bundle_subscriptions.offered_purchase_ids"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_7;
  objc_msgSend(v4, "firstObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_7;
  v6 = (void *)v5;
  objc_msgSend(v4, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {

    goto LABEL_7;
  }
  v8 = NFInternalBuild();

  if (!v8)
  {
LABEL_7:
    -[FCPaidBundleConfiguration configDict](self, "configDict");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationArrayValueWithDefaultValue(v10, (uint64_t)CFSTR("offeredPurchaseIds"), &unk_1E470C7B0);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  v9 = v4;
LABEL_8:

  return (NSArray *)v9;
}

- (FCPaidBundleConfiguration)initWithConfigDictionary:(id)a3
{
  return -[FCPaidBundleConfiguration initWithConfigDictionary:storefrontID:localizedStorefrontID:defaultSupportedStoreFronts:](self, "initWithConfigDictionary:storefrontID:localizedStorefrontID:defaultSupportedStoreFronts:", a3, CFSTR("143441"), CFSTR("143441"), MEMORY[0x1E0C9AA60]);
}

- (NSString)vanityURLMappingResourceID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[FCPaidBundleConfiguration defaultVanityURLMappingResourceIDByLocalizedStorefrontID](FCPaidBundleConfiguration, "defaultVanityURLMappingResourceIDByLocalizedStorefrontID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPaidBundleConfiguration localizedStorefrontID](self, "localizedStorefrontID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v6, (uint64_t)CFSTR("vanityUrlMappingResourceId"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (int64_t)vanityURLMappingRefreshRate
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("vanityUrlMappingRefreshRate"), 3600);

  return v3;
}

- (NSString)localizedStorefrontID
{
  return self->_localizedStorefrontID;
}

+ (id)defaultVanityURLMappingResourceIDByLocalizedStorefrontID
{
  if (qword_1ED0F8668 != -1)
    dispatch_once(&qword_1ED0F8668, &__block_literal_global_367);
  return (id)qword_1ED0F8660;
}

- (BOOL)isNarrativeAudioEnabled
{
  void *v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("news.features.audio"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x1E0CB3940], "fc_string:isEqualToString:", v4, CFSTR("enabled")) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(MEMORY[0x1E0CB3940], "fc_string:isEqualToString:", v4, CFSTR("disabled")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    if ((NFInternalBuild() & 1) != 0)
    {
      v6 = 1;
    }
    else if (NFSeedBuild())
    {
      v6 = 2;
    }
    else
    {
      v6 = 4;
    }
    +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isContentStoreFrontSupported") & 1) != 0)
    {
      -[FCPaidBundleConfiguration storefrontID](self, "storefrontID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("143441"));

      if (v9)
        v10 = 7;
      else
        v10 = 0;
    }
    else
    {

      v10 = 0;
    }
    -[FCPaidBundleConfiguration configDict](self, "configDict");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = FCAppConfigurationIntegerValue(v11, (uint64_t)CFSTR("audioEnabledLevel"), v10);

    v5 = (v12 & v6) != 0;
  }

  return v5;
}

void __48__FCPaidBundleConfiguration_areMagazinesEnabled__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  if ((NFInternalBuild() & 1) != 0)
  {
    v0 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringForKey:", CFSTR("news.features.magazines"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    _MergedGlobals_194 = objc_msgSend(v0, "fc_string:isEqualToString:", CFSTR("enabled"), v1);

  }
  else
  {
    _MergedGlobals_194 = 0;
  }
}

- (int64_t)minimumArticlesBeforeArticleSoftPaywall
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("minimumArticlesBeforeArticleSoftPaywall"), 0);

  return v3;
}

- (int64_t)maximumArticlesWithSoftPaywallPerSession
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("maximumArticlesWithSoftPaywallPerSession"), 10000);

  return v3;
}

- (int64_t)bundleSubscriptionsGlobalMeteredCount
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("bundleSubscriptionsGlobalMeteredCount2"), 15);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_keyedPostPurchaseOnboardingConfigurationsByType, 0);
  objc_storeStrong((id *)&self->_keyedSubscriptionButtonConfigurationsByType, 0);
  objc_storeStrong((id *)&self->_keyedPaywallConfigurationsByType, 0);
  objc_storeStrong((id *)&self->_defaultSupportedStoreFronts, 0);
  objc_storeStrong((id *)&self->_localizedStorefrontID, 0);
  objc_storeStrong((id *)&self->_storefrontID, 0);
  objc_storeStrong((id *)&self->_configDict, 0);
  objc_storeStrong((id *)&self->_audioUpsellConfigurationsByID, 0);
  objc_storeStrong((id *)&self->_magazineGenresByGenre, 0);
}

- (NSString)appLaunchUpsellArticleID
{
  void *v2;
  void *v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("appLaunchUpsellArticleID"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)arePaywallConfigsEqualToOtherPaidBundleConfig:(id)a3
{
  id v4;
  unint64_t v5;
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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    v5 = -[FCPaidBundleConfiguration paywallConfigsOfferType](self, "paywallConfigsOfferType");
    if (v5 == objc_msgSend(v4, "paywallConfigsOfferType"))
    {
      -[FCPaidBundleConfiguration configDict](self, "configDict");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      FCAppConfigurationArrayValueWithDefaultValue(v6, (uint64_t)CFSTR("paywallConfigs"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "configDict");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      FCAppConfigurationArrayValueWithDefaultValue(v8, (uint64_t)CFSTR("paywallConfigs"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(MEMORY[0x1E0DE7910], "nf_object:isEqualToObject:", v7, v9) & 1) == 0)
      {
        v33 = FCPaywallLog;
        v26 = 0;
        if (os_log_type_enabled((os_log_t)FCPaywallLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1B90000, v33, OS_LOG_TYPE_DEFAULT, "PaywallConfigs are not equal: 'paywallConfigs' have changed", buf, 2u);
          v26 = 0;
        }
        goto LABEL_30;
      }
      -[FCPaidBundleConfiguration configDict](self, "configDict");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      FCAppConfigurationArrayValueWithDefaultValue(v10, (uint64_t)CFSTR("audioPaywallConfigs"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "configDict");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      FCAppConfigurationArrayValueWithDefaultValue(v12, (uint64_t)CFSTR("audioPaywallConfigs"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(MEMORY[0x1E0DE7910], "nf_object:isEqualToObject:", v11, v13) & 1) == 0)
      {
        v34 = FCPaywallLog;
        v26 = 0;
        if (os_log_type_enabled((os_log_t)FCPaywallLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1B90000, v34, OS_LOG_TYPE_DEFAULT, "PaywallConfigs are not equal: 'audioPaywallConfigs' have changed", buf, 2u);
          v26 = 0;
        }
        goto LABEL_29;
      }
      v43 = v11;
      -[FCPaidBundleConfiguration configDict](self, "configDict");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      FCAppConfigurationArrayValueWithDefaultValue(v14, (uint64_t)CFSTR("sbPaywallConfigs"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "configDict");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      FCAppConfigurationArrayValueWithDefaultValue(v16, (uint64_t)CFSTR("sbPaywallConfigs"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(MEMORY[0x1E0DE7910], "nf_object:isEqualToObject:", v15, v17) & 1) == 0)
      {
        v35 = FCPaywallLog;
        v26 = 0;
        v11 = v43;
        if (os_log_type_enabled((os_log_t)FCPaywallLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1B90000, v35, OS_LOG_TYPE_DEFAULT, "PaywallConfigs are not equal: 'sbPaywallConfigs' have changed", buf, 2u);
          v26 = 0;
        }
        goto LABEL_28;
      }
      v42 = v15;
      -[FCPaidBundleConfiguration configDict](self, "configDict");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      FCAppConfigurationArrayValueWithDefaultValue(v18, (uint64_t)CFSTR("audioSbPaywallConfigs"), 0);
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "configDict");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      FCAppConfigurationArrayValueWithDefaultValue(v20, (uint64_t)CFSTR("audioSbPaywallConfigs"), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = v21;
      v41 = (void *)v19;
      if ((objc_msgSend(MEMORY[0x1E0DE7910], "nf_object:isEqualToObject:", v19, v21) & 1) == 0)
      {
        v36 = FCPaywallLog;
        v26 = 0;
        v29 = (void *)v19;
        v15 = v42;
        if (os_log_type_enabled((os_log_t)FCPaywallLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1B90000, v36, OS_LOG_TYPE_DEFAULT, "PaywallConfigs are not equal: 'audioSbPaywallConfigs' have changed", buf, 2u);
          v26 = 0;
        }
        goto LABEL_27;
      }
      -[FCPaidBundleConfiguration configDict](self, "configDict");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      FCAppConfigurationArrayValueWithDefaultValue(v22, (uint64_t)CFSTR("flexiblePaywallConfig"), 0);
      v23 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "configDict");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      FCAppConfigurationArrayValueWithDefaultValue(v24, (uint64_t)CFSTR("flexiblePaywallConfig"), 0);
      v25 = objc_claimAutoreleasedReturnValue();

      v26 = objc_msgSend(MEMORY[0x1E0DE7910], "nf_object:isEqualToObject:", v23, v25);
      v27 = FCPaywallLog;
      v28 = os_log_type_enabled((os_log_t)FCPaywallLog, OS_LOG_TYPE_DEFAULT);
      v38 = (void *)v25;
      v39 = (void *)v23;
      if ((v26 & 1) != 0)
      {
        v29 = v41;
        v15 = v42;
        v21 = v40;
        if (v28)
        {
          *(_WORD *)buf = 0;
          v30 = "PaywallConfigs are equal";
LABEL_25:
          _os_log_impl(&dword_1A1B90000, v27, OS_LOG_TYPE_DEFAULT, v30, buf, 2u);
        }
      }
      else
      {
        v29 = v41;
        v15 = v42;
        v21 = v40;
        if (v28)
        {
          *(_WORD *)buf = 0;
          v30 = "PaywallConfigs are not equal: 'flexiblePaywallConfig' have changed";
          goto LABEL_25;
        }
      }

LABEL_27:
      v11 = v43;
LABEL_28:

LABEL_29:
LABEL_30:

      goto LABEL_31;
    }
    v31 = FCPaywallLog;
    v26 = 0;
    if (os_log_type_enabled((os_log_t)FCPaywallLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v32 = "PaywallConfigs are not equal: the offer type has changed";
      goto LABEL_14;
    }
  }
  else
  {
    v31 = FCPaywallLog;
    v26 = 0;
    if (os_log_type_enabled((os_log_t)FCPaywallLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v32 = "PaywallConfigs are not equal: the other object is nil";
LABEL_14:
      _os_log_impl(&dword_1A1B90000, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 2u);
      v26 = 0;
    }
  }
LABEL_31:

  return v26;
}

- (unint64_t)paywallConfigsOfferType
{
  void *v3;
  unint64_t v4;
  void *v5;

  NewsCoreUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("newssubscription.paywall_configs.config_overrides.config_type"));

  if (!v4)
  {
    -[FCPaidBundleConfiguration configDict](self, "configDict");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("paywallConfigsOfferType"), 0);

  }
  return v4;
}

void __85__FCPaidBundleConfiguration_defaultVanityURLMappingResourceIDByLocalizedStorefrontID__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("143441");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("VUM"), CFSTR("143441"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v7[1] = CFSTR("143455");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("VUM"), CFSTR("143455"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v7[2] = CFSTR("143455-fr-ca");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-fr"), CFSTR("VUM"), CFSTR("143455"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v7[3] = CFSTR("143444");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("VUM"), CFSTR("143444"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v3;
  v7[4] = CFSTR("143460");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("VUM"), CFSTR("143460"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED0F8660;
  qword_1ED0F8660 = v5;

}

- (FCPaidBundleConfiguration)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPaidBundleConfiguration init]";
    v9 = 2080;
    v10 = "FCPaidBundleConfiguration.m";
    v11 = 1024;
    v12 = 65;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPaidBundleConfiguration init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCPaidBundleConfiguration)initWithConfigDictionary:(id)a3 storefrontID:(id)a4
{
  return -[FCPaidBundleConfiguration initWithConfigDictionary:storefrontID:localizedStorefrontID:defaultSupportedStoreFronts:](self, "initWithConfigDictionary:storefrontID:localizedStorefrontID:defaultSupportedStoreFronts:", a3, a4, a4, MEMORY[0x1E0C9AA60]);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0DE7910];
    -[FCPaidBundleConfiguration configDict](self, "configDict");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configDict");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9))
    {
      v10 = (void *)MEMORY[0x1E0DE7910];
      -[FCPaidBundleConfiguration storefrontID](self, "storefrontID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "storefrontID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "nf_object:isEqualToObject:", v11, v12))
      {
        v13 = (void *)MEMORY[0x1E0DE7910];
        -[FCPaidBundleConfiguration localizedStorefrontID](self, "localizedStorefrontID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "localizedStorefrontID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "nf_object:isEqualToObject:", v14, v15);

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[FCPaidBundleConfiguration storefrontID](self, "storefrontID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[FCPaidBundleConfiguration localizedStorefrontID](self, "localizedStorefrontID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)paywallConfigurationsByTypeForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  FCPaywallConfiguration *v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FCPaidBundleConfiguration lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[NSMutableDictionary objectForKeyedSubscript:](self->_keyedPaywallConfigurationsByType, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPaidBundleConfiguration lock](self, "lock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[FCPaidBundleConfiguration configDict](self, "configDict");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationArrayValueWithDefaultValue(v9, (uint64_t)v4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v11);
            v16 = -[FCPaywallConfiguration initWithConfigDictionary:]([FCPaywallConfiguration alloc], "initWithConfigDictionary:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
            v17 = -[FCPaywallConfiguration paywallType](v16, "paywallType");
            if (v16)
              v18 = v17 == 0;
            else
              v18 = 1;
            if (!v18)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "fc_safelySetObject:forKey:", v16, v19);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v13);
      }

      -[FCPaidBundleConfiguration lock](self, "lock");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lock");

      -[NSMutableDictionary fc_safelySetObject:forKey:](self->_keyedPaywallConfigurationsByType, "fc_safelySetObject:forKey:", v8, v4);
      -[FCPaidBundleConfiguration lock](self, "lock");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "unlock");

      v6 = 0;
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)subscriptionButtonConfigurationsByTypeForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  FCSubscriptionButtonConfiguration *v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FCPaidBundleConfiguration lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[NSMutableDictionary objectForKeyedSubscript:](self->_keyedSubscriptionButtonConfigurationsByType, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPaidBundleConfiguration lock](self, "lock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[FCPaidBundleConfiguration configDict](self, "configDict");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationArrayValueWithDefaultValue(v9, (uint64_t)v4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v11);
            v16 = -[FCSubscriptionButtonConfiguration initWithConfigDictionary:]([FCSubscriptionButtonConfiguration alloc], "initWithConfigDictionary:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
            v17 = -[FCSubscriptionButtonConfiguration subscriptionButtonType](v16, "subscriptionButtonType");
            if (v16)
              v18 = v17 == 0;
            else
              v18 = 1;
            if (!v18)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "fc_safelySetObject:forKey:", v16, v19);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v13);
      }

      -[FCPaidBundleConfiguration lock](self, "lock");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lock");

      -[NSMutableDictionary fc_safelySetObject:forKey:](self->_keyedSubscriptionButtonConfigurationsByType, "fc_safelySetObject:forKey:", v8, v4);
      -[FCPaidBundleConfiguration lock](self, "lock");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "unlock");

      v6 = 0;
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)postPurchaseOnboardingConfigurationsByTypeForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  -[FCPaidBundleConfiguration lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[NSMutableDictionary objectForKeyedSubscript:](self->_keyedPostPurchaseOnboardingConfigurationsByType, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPaidBundleConfiguration lock](self, "lock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[FCPaidBundleConfiguration configDict](self, "configDict");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationDictionaryValueWithDefaultValue(v9, (uint64_t)v4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __78__FCPaidBundleConfiguration_postPurchaseOnboardingConfigurationsByTypeForKey___block_invoke;
      v17[3] = &unk_1E4643580;
      v12 = v11;
      v18 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v17);
      -[FCPaidBundleConfiguration lock](self, "lock");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lock");

      -[NSMutableDictionary fc_safelySetObject:forKey:](self->_keyedPostPurchaseOnboardingConfigurationsByType, "fc_safelySetObject:forKey:", v12, v4);
      -[FCPaidBundleConfiguration lock](self, "lock");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "unlock");

      v15 = v18;
      v8 = v12;

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

void __78__FCPaidBundleConfiguration_postPurchaseOnboardingConfigurationsByTypeForKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = FCPostPurchaseOnboardingConfigurationTypeWithValue(v5);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __78__FCPaidBundleConfiguration_postPurchaseOnboardingConfigurationsByTypeForKey___block_invoke_2;
    v14[3] = &unk_1E46459B0;
    v15 = v8;
    v9 = v8;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v14);
    v10 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fc_safelySetObject:forKey:", v9, v11);

  }
  else
  {
    v12 = FCAppConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_ERROR, "Incorrect json structure received for onboarding steps. Expected a JSON array of onboarding steps.", v13, 2u);
    }
  }

}

void __78__FCPaidBundleConfiguration_postPurchaseOnboardingConfigurationsByTypeForKey___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  FCPostPurchaseOnboardingConfiguration *v5;
  BOOL v6;
  FCPostPurchaseOnboardingConfiguration *v7;

  v3 = a2;
  v7 = -[FCPostPurchaseOnboardingConfiguration initWithConfigDictionary:]([FCPostPurchaseOnboardingConfiguration alloc], "initWithConfigDictionary:", v3);

  v4 = -[FCPostPurchaseOnboardingConfiguration postPurchaseOnboardingStep](v7, "postPurchaseOnboardingStep");
  v5 = v7;
  if (v7)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    v5 = v7;
  }

}

- (NSDictionary)flexiblePaywallConfig
{
  void *v2;
  void *v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("flexiblePaywallConfig"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (unint64_t)subscriptionLinkTargetType
{
  void *v3;
  unint64_t v4;
  void *v5;

  NewsCoreUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("newssubscription.subscriptionlink.target_type"));

  if (!v4)
  {
    -[FCPaidBundleConfiguration configDict](self, "configDict");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("subscriptionLinkTargetType"), 0);

  }
  return v4;
}

- (double)maxPriceDeltaThreshold
{
  void *v2;
  double v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("maxDeltaThreshold"), 0.0);

  return v3;
}

- (NSDictionary)paywallConfigurationsByType
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[FCPaidBundleConfiguration paywallConfigurationsByTypeForKey:](self, "paywallConfigurationsByTypeForKey:", CFSTR("paywallConfigs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[FCPaidBundleConfiguration defaultPaywallConfigs](self, "defaultPaywallConfigs");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSDictionary *)v6;
}

- (NSDictionary)servicesBundlePaywallConfigurationsByType
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[FCPaidBundleConfiguration paywallConfigurationsByTypeForKey:](self, "paywallConfigurationsByTypeForKey:", CFSTR("sbPaywallConfigs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[FCPaidBundleConfiguration defaultPaywallConfigs](self, "defaultPaywallConfigs");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSDictionary *)v6;
}

- (NSDictionary)audioPaywallConfigurationsByType
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[FCPaidBundleConfiguration paywallConfigurationsByTypeForKey:](self, "paywallConfigurationsByTypeForKey:", CFSTR("audioPaywallConfigs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[FCPaidBundleConfiguration defaultAudioPaywallConfigs](self, "defaultAudioPaywallConfigs");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSDictionary *)v6;
}

- (NSDictionary)audioServicesBundlePaywallConfigurationsByType
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[FCPaidBundleConfiguration paywallConfigurationsByTypeForKey:](self, "paywallConfigurationsByTypeForKey:", CFSTR("audioSbPaywallConfigs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[FCPaidBundleConfiguration defaultAudioPaywallConfigs](self, "defaultAudioPaywallConfigs");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSDictionary *)v6;
}

- (NSDictionary)subscriptionButtonConfigurationsByType
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[FCPaidBundleConfiguration subscriptionButtonConfigurationsByTypeForKey:](self, "subscriptionButtonConfigurationsByTypeForKey:", CFSTR("subscriptionButtonConfigs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[FCPaidBundleConfiguration defaultSubscriptionButtonConfigs](self, "defaultSubscriptionButtonConfigs");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSDictionary *)v6;
}

- (NSDictionary)servicesBundleSubscriptionButtonConfigurationsByType
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[FCPaidBundleConfiguration subscriptionButtonConfigurationsByTypeForKey:](self, "subscriptionButtonConfigurationsByTypeForKey:", CFSTR("sbSubscriptionButtonConfigs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[FCPaidBundleConfiguration defaultServicesBundleSubscriptionButtonConfigs](self, "defaultServicesBundleSubscriptionButtonConfigs");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSDictionary *)v6;
}

- (NSDictionary)carrierServicesBundleSubscriptionButtonConfigurationsByType
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[FCPaidBundleConfiguration subscriptionButtonConfigurationsByTypeForKey:](self, "subscriptionButtonConfigurationsByTypeForKey:", CFSTR("carrierServicesBundleSubscriptionButtonConfigs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[FCPaidBundleConfiguration defaultServicesBundleSubscriptionButtonConfigs](self, "defaultServicesBundleSubscriptionButtonConfigs");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSDictionary *)v6;
}

- (NSDictionary)bundleViaOfferSubscriptionButtonConfigurationsByType
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[FCPaidBundleConfiguration subscriptionButtonConfigurationsByTypeForKey:](self, "subscriptionButtonConfigurationsByTypeForKey:", CFSTR("bundleViaOfferSubscriptionButtonConfigs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[FCPaidBundleConfiguration defaultServicesBundleSubscriptionButtonConfigs](self, "defaultServicesBundleSubscriptionButtonConfigs");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSDictionary *)v6;
}

- (NSDictionary)postPurchaseOnboardingConfigurationsByType
{
  return (NSDictionary *)-[FCPaidBundleConfiguration postPurchaseOnboardingConfigurationsByTypeForKey:](self, "postPurchaseOnboardingConfigurationsByTypeForKey:", CFSTR("postPurchaseOnboardingConfig"));
}

- (unint64_t)articleHardPaywallType
{
  void *v2;
  unint64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("articleHardPaywallType"), 0);

  return v3;
}

- (unint64_t)audioFeedPaywallSubtype
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  __int16 v15;
  __int16 v16;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = FCAppConfigurationIntegerValue(v3, (uint64_t)CFSTR("audioFeedPaywallType"), 0);

  if (v4 == 2)
  {
    -[FCPaidBundleConfiguration audioPaywallConfigurationsByType](self, "audioPaywallConfigurationsByType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[FCPaidBundleConfiguration audioPaywallConfigurationsByType](self, "audioPaywallConfigurationsByType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        return 2;
      v11 = FCPaywallLog;
      if (os_log_type_enabled((os_log_t)FCPaywallLog, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 0;
        v12 = "Missing 'Large' configuration data for Video Audio Feed Paywall! Defaulting to Regular Audio Feed Paywall type!";
        v13 = (uint8_t *)&v15;
        goto LABEL_9;
      }
    }
    else
    {
      v11 = FCPaywallLog;
      if (os_log_type_enabled((os_log_t)FCPaywallLog, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 0;
        v12 = "Missing 'Small' configuration data for Video Audio Feed Paywall! Defaulting to Regular Audio Feed Paywall type!";
        v13 = (uint8_t *)&v16;
LABEL_9:
        _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
      }
    }
    return 1;
  }
  return v4;
}

- (unint64_t)magazineFeedPaywallSubtype
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  __int16 v15;
  __int16 v16;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = FCAppConfigurationIntegerValue(v3, (uint64_t)CFSTR("magazineFeedPaywallType"), 0);

  if (v4 == 2)
  {
    -[FCPaidBundleConfiguration paywallConfigurationsByType](self, "paywallConfigurationsByType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[FCPaidBundleConfiguration paywallConfigurationsByType](self, "paywallConfigurationsByType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        return 2;
      v11 = FCPaywallLog;
      if (os_log_type_enabled((os_log_t)FCPaywallLog, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 0;
        v12 = "Missing 'Large' configuration data for Video Magazine Feed Paywall! Defaulting to Regular Magazine Feed Paywall type!";
        v13 = (uint8_t *)&v15;
        goto LABEL_9;
      }
    }
    else
    {
      v11 = FCPaywallLog;
      if (os_log_type_enabled((os_log_t)FCPaywallLog, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 0;
        v12 = "Missing 'Small' configuration data for Video Magazine Feed Paywall! Defaulting to Regular Magazine Feed Paywall type!";
        v13 = (uint8_t *)&v16;
LABEL_9:
        _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
      }
    }
    return 1;
  }
  return v4;
}

- (NSDictionary)magazineGenresByGenre
{
  NSDictionary *magazineGenresByGenre;
  void *v4;
  void *v5;
  NSDictionary *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  FCMagazineGenre *v13;
  FCMagazineGenre *v14;
  void *v15;
  void *v16;
  NSDictionary *v17;
  NSDictionary *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  magazineGenresByGenre = self->_magazineGenresByGenre;
  if (!magazineGenresByGenre)
  {
    -[FCPaidBundleConfiguration configDict](self, "configDict");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationArrayValueWithDefaultValue(v4, (uint64_t)CFSTR("magazineGenres"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v21;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v21 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
            v13 = [FCMagazineGenre alloc];
            v14 = -[FCMagazineGenre initWithConfigDictionary:](v13, "initWithConfigDictionary:", v12, (_QWORD)v20);
            -[FCMagazineGenre genre](v14, "genre");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              -[FCMagazineGenre genre](v14, "genre");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary fc_safelySetObject:forKey:](v6, "fc_safelySetObject:forKey:", v14, v16);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v9);
      }

      v17 = self->_magazineGenresByGenre;
      self->_magazineGenresByGenre = v6;
    }
    else
    {
      -[FCPaidBundleConfiguration defaultMagazineGenres](self, "defaultMagazineGenres");
      v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v17 = self->_magazineGenresByGenre;
      self->_magazineGenresByGenre = v18;
    }

    magazineGenresByGenre = self->_magazineGenresByGenre;
  }
  return magazineGenresByGenre;
}

- (BOOL)isPaidBundleVisible
{
  return 1;
}

- (BOOL)isTemporaryAccessEnabled
{
  return 0;
}

- (BOOL)isSharingIssuesEnabled
{
  return 1;
}

- (BOOL)isFamilySharingSetupEnabled
{
  void *v2;
  char v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("familySharingSetupEnabled"), 0);

  return v3;
}

- (NSString)servicesBundleMetricsTopicName
{
  void *v2;
  void *v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("sbFigaroTopic"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)defaultLandingPageArticleID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[FCPaidBundleConfiguration defaultLandingPageByLocalizedStorefrontID](FCPaidBundleConfiguration, "defaultLandingPageByLocalizedStorefrontID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPaidBundleConfiguration localizedStorefrontID](self, "localizedStorefrontID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v6, (uint64_t)CFSTR("deArticleID"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)defaultServicesBundleLandingPageArticleID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[FCPaidBundleConfiguration defaultServicesBundleLandingPageByLocalizedStorefrontID](FCPaidBundleConfiguration, "defaultServicesBundleLandingPageByLocalizedStorefrontID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPaidBundleConfiguration localizedStorefrontID](self, "localizedStorefrontID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v6, (uint64_t)CFSTR("sbArticleID"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)familySharingLandingPageArticleID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[FCPaidBundleConfiguration defaultFamilySharingLandingPageByLocalizedStorefrontID](FCPaidBundleConfiguration, "defaultFamilySharingLandingPageByLocalizedStorefrontID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPaidBundleConfiguration localizedStorefrontID](self, "localizedStorefrontID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v6, (uint64_t)CFSTR("shArticleID"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)endOfPurchaseFamilySharingSetupArticleID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[FCPaidBundleConfiguration defaultEndOfPurchaseFamilySharingSetupArticleIDByLocalizedStorefrontID](FCPaidBundleConfiguration, "defaultEndOfPurchaseFamilySharingSetupArticleIDByLocalizedStorefrontID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPaidBundleConfiguration localizedStorefrontID](self, "localizedStorefrontID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v6, (uint64_t)CFSTR("endOfPurchaseFamilySharingSetupArticleID"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)endOfPurchaseNoFamilySharingSetupArticleID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[FCPaidBundleConfiguration defaultEndOfPurchaseNoFamilySharingSetupArticleIDByLocalizedStorefrontID](FCPaidBundleConfiguration, "defaultEndOfPurchaseNoFamilySharingSetupArticleIDByLocalizedStorefrontID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPaidBundleConfiguration localizedStorefrontID](self, "localizedStorefrontID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v6, (uint64_t)CFSTR("endOfPurchaseNoFamilySharingSetupArticleID"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)endOfPurchaseServicesBundleFamilySharingSetupArticleID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[FCPaidBundleConfiguration defaultEndOfPurchaseFamilySharingSetupArticleIDByLocalizedStorefrontID](FCPaidBundleConfiguration, "defaultEndOfPurchaseFamilySharingSetupArticleIDByLocalizedStorefrontID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPaidBundleConfiguration localizedStorefrontID](self, "localizedStorefrontID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v6, (uint64_t)CFSTR("endOfPurchaseServicesBundleFamilySharingSetupArticleID"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)endOfPurchaseServicesBundleNoFamilySharingSetupArticleID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[FCPaidBundleConfiguration defaultEndOfPurchaseNoFamilySharingSetupArticleIDByLocalizedStorefrontID](FCPaidBundleConfiguration, "defaultEndOfPurchaseNoFamilySharingSetupArticleIDByLocalizedStorefrontID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPaidBundleConfiguration localizedStorefrontID](self, "localizedStorefrontID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v6, (uint64_t)CFSTR("endOfPurchaseServicesBundleNoFamilySharingSetupArticleID"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)renewalLandingPageArticleID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[FCPaidBundleConfiguration renewalLandingPageByLocalizedStorefrontID](FCPaidBundleConfiguration, "renewalLandingPageByLocalizedStorefrontID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPaidBundleConfiguration localizedStorefrontID](self, "localizedStorefrontID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v6, (uint64_t)CFSTR("reArticleID"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSDictionary)offeredBundlePurchaseIDsMap
{
  void *v2;
  void *v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("offeredBundlePurchaseIDsMap"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (int64_t)newIssuesCheckLocalTime
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("newIssuesCheckLocalTime"), 10800);

  return v3;
}

- (int64_t)newIssuesNotificationDeliveryLocalTime
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("newIssuesNotificationDeliveryLocalTime"), 68400);

  return v3;
}

- (int64_t)maxAllowedSubscriptionDetectionTime
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("maxAllowedSubscriptionDetectionTime"), 2592000);

  return v3;
}

- (NSString)featuredArticlesTagList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[FCPaidBundleConfiguration defaultTagListIDByLocalizedStorefrontID](FCPaidBundleConfiguration, "defaultTagListIDByLocalizedStorefrontID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPaidBundleConfiguration localizedStorefrontID](self, "localizedStorefrontID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v6, (uint64_t)CFSTR("featuredArticlesTagList"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (int64_t)featuredArticlesFetchLimit
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("featuredArticlesFetchLimit"), 250);

  return v3;
}

- (NSString)recommendableIssuesTagList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[FCPaidBundleConfiguration defaultTagListIDByLocalizedStorefrontID](FCPaidBundleConfiguration, "defaultTagListIDByLocalizedStorefrontID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPaidBundleConfiguration localizedStorefrontID](self, "localizedStorefrontID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v6, (uint64_t)CFSTR("recommendableIssuesTagList"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)globalFeedIDForFreeUsers
{
  void *v2;
  void *v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("paidFeedIdForFreeUsers"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)globalFeedIDForPaidUsers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[FCPaidBundleConfiguration defaultPaidFeedIDByLocalizedStorefrontID](FCPaidBundleConfiguration, "defaultPaidFeedIDByLocalizedStorefrontID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPaidBundleConfiguration localizedStorefrontID](self, "localizedStorefrontID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v6, (uint64_t)CFSTR("paidFeedId"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)forYouIncludePaidSectionFeedsForFreeUsers
{
  void *v2;
  char v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("forYouIncludePaidSectionFeedsForFreeUsers"), 0);

  return v3;
}

- (BOOL)forYouIncludePaidSectionFeedsForPaidUsers
{
  void *v2;
  char v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("forYouIncludePaidSectionFeedsForPaidUsers"), 0);

  return v3;
}

- (NSString)expirationAlertDescription
{
  void *v2;
  void *v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("expirationAlertDescription"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)forYouMaxDailyPaidArticlesForFreeUsers
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = FCAppConfigurationIntegerValue(v3, (uint64_t)CFSTR("forYouMaxDailyPaidArticlesForFreeUsers"), 10);

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("forYouMaxDailyPaidArticlesForFreeUsers2"), v4);

  return v6;
}

- (int64_t)forYouMaxMagazineGroupsForFreeUsers
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("forYouMaxMagazineGroupsForAUsers"), 1);

  return v3;
}

- (int64_t)forYouMaxMagazineGroupsForTrialUsers
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("forYouMaxMagazineGroupsForBUsers"), 3);

  return v3;
}

- (int64_t)forYouMaxMagazineGroupsForPaidUsers
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("forYouMaxMagazineGroupsForCUsers"), 3);

  return v3;
}

- (BOOL)isFreeBadgeEnabledForSubscribers
{
  void *v2;
  char v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("freeBadgeEnabledForPaidUsers"), 0);

  return v3;
}

- (BOOL)isPaidBadgeEnabledForSubscribers
{
  void *v2;
  char v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("paidBadgeEnabledForPaidUsers"), 0);

  return v3;
}

- (NSString)freeBadgeTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  FCBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Free"), &stru_1E464BC40, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v5, (uint64_t)CFSTR("freeBadgeTitle"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)paidBadgeTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  FCBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR(" News+"), &stru_1E464BC40, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v5, (uint64_t)CFSTR("paidBadgeTitle"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (int64_t)feedAutoRefreshMinimumInterval
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("feedAutoRefreshMinimumInterval"), 43200);

  return v3;
}

- (int64_t)normalStorageManualIssueDownloadTTL
{
  void *v2;
  uint64_t v3;
  int64_t v4;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("normalStorageManualIssueDownloadTTL"), v3);

  return v4;
}

- (int64_t)normalStorageAutomaticIssueDownloadTTL
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("normalStorageAutomaticIssueDownloadTTL"), 2592000);

  return v3;
}

- (int64_t)lowStorageManualIssueDownloadTTL
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("lowStorageManualIssueDownloadTTL"), 2592000);

  return v3;
}

- (int64_t)lowStorageAutomaticIssueDownloadTTL
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("lowStorageAutomaticIssueDownloadTTL"), 2592000);

  return v3;
}

- (int64_t)criticalStorageManualIssueDownloadTTL
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("criticalStorageManualIssueDownloadTTL"), 2592000);

  return v3;
}

- (int64_t)criticalStorageAutomaticIssueDownloadTTL
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("criticalStorageAutomaticIssueDownloadTTL"), 0);

  return v3;
}

- (NSArray)groupWhitelistedTagIds
{
  void *v2;
  void *v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("groupWhitelistedTagIds"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (int64_t)entitlementsGracePeriodInSeconds
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("entitlementsGracePeriodInSeconds"), 604800);

  return v3;
}

- (int64_t)entitlementsCacheExpiredGracePeriodInSeconds
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("entitlementsCacheExpiredGracePeriodInSeconds"), 172800);

  return v3;
}

- (BOOL)isCategoriesDownloadButtonEnabled
{
  void *v2;
  char v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("categoriesDownloadButtonEnabled"), 0);

  return v3;
}

- (int64_t)recentIssuesMaxAge
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("recentIssuesMaxAge"), 604800);

  return v3;
}

- (int64_t)minimumReadIssuesInMyMagazines
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("minimumReadIssuesInMyMagazines"), 3);

  return v3;
}

- (int64_t)minimumArticlesInANFIssueBeforeRead
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("minimumArticlesInANFIssueBeforeRead"), 1);

  return v3;
}

- (int64_t)minimumPagesInPDFIssueBeforeRead
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("minimumPagesInPDFIssueBeforeRead"), 4);

  return v3;
}

- (NSString)todayMastheadPaywallConfiguration
{
  void *v2;
  void *v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("todayMastheadPaywallConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)minFollowedMagazinesToHideSuggestionsCompact
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("minFollowedMagazinesToHideSuggestionsCompact"), 5);

  return v3;
}

- (int64_t)minFollowedMagazinesToHideSuggestionsRegular
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("minFollowedMagazinesToHideSuggestionsRegular"), 8);

  return v3;
}

- (unint64_t)appLaunchUpsellPaidVisibility
{
  void *v2;
  unint64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("appLaunchUpsellPaidVisibility"), 0);

  return v3;
}

- (unint64_t)appLaunchUpsellBundleTrialVisibility
{
  void *v2;
  unint64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("appLaunchUpsellBundleTrialVisibility"), 0);

  return v3;
}

- (NSString)appLaunchUpsellInstanceID
{
  void *v2;
  void *v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("appLaunchUpsellInstanceID"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)appLaunchUpsellCampaignID
{
  void *v2;
  void *v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("appLaunchUpsellCampaignID"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDate)appLaunchUpsellCampaignStartDate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateWithTimeIntervalSince1970:", (double)FCAppConfigurationIntegerValue(v3, (uint64_t)CFSTR("appLaunchUpsellCampaignStartDate"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (NSDate)appLaunchUpsellCampaignEndDate
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValueWithDefaultValueIfMissing(v2, (uint64_t)CFSTR("appLaunchUpsellCampaignEndDate"), -1, -1);

  if (v3 == -1)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v4;
}

- (int64_t)appLaunchUpsellRequiredAppLaunchCount
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("appLaunchUpsellRequiredAppLaunchCount"), 4);

  return v3;
}

- (int64_t)appLaunchUpsellQuiescenceInterval
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("appLaunchUpsellQuiescenceInterval"), 172800);

  return v3;
}

- (int64_t)appLaunchUpsellNewSessionBackgroundTimeInterval
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("appLaunchUpsellNewSessionBackgroundTimeInterval"), 600);

  return v3;
}

- (BOOL)appLaunchUpsellLastSeenDateSyncEnabled
{
  void *v2;
  char v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("appLaunchUpsellLastSeenDateSyncEnabled"), 0);

  return v3;
}

- (BOOL)appLaunchUpsellLastShownCampaignIDSyncEnabled
{
  void *v2;
  char v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("appLaunchUpsellLastShownCampaignIDSyncEnabled"), 0);

  return v3;
}

- (int64_t)appLaunchUpsellBehaviorFlags
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("appLaunchUpsellBehaviorFlags"), 0);

  return v3;
}

- (int64_t)audioSuggestionsMaxCount
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("audioSuggestionsMaxCount"), 6);

  return v3;
}

- (int64_t)audioSuggestionsHighlyPersonalizedCount
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("audioSuggestionsHighlyPersonalizedCount"), 5);

  return v3;
}

- (int64_t)audioSuggestionsMaxAge
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("audioSuggestionsMaxAge"), 604800);

  return v3;
}

- (int64_t)audioSuggestionsRecycleAfterTime
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("audioSuggestionsRecycleAfterTime"), 345600);

  return v3;
}

- (int64_t)audioSuggestionsMaxIgnoreCount
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("audioSuggestionsMaxIgnoreCount"), 2);

  return v3;
}

- (int64_t)audioOfflineArticlesMaxCountNormalStorage
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("audioOfflineArticlesMaxCountNormalStorage"), 25);

  return v3;
}

- (int64_t)audioOfflineArticlesMaxCountLowStorage
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("audioOfflineArticlesMaxCountLowStorage"), 2);

  return v3;
}

- (int64_t)audioOfflineArticlesMaxCountCriticalStorage
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("audioOfflineArticlesMaxCountCriticalStorage"), 0);

  return v3;
}

- (NSString)audioUpsellArticleID
{
  void *v2;
  void *v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("audioUpsellArticleID"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)audioUpsellMaxDisplayCount
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("audioUpsellMaxDisplayCount"), -1);

  return v3;
}

- (NSString)audioUpsellInstanceID
{
  void *v2;
  void *v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("audioUpsellInstanceID"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)audioRecentlyPlayedMaxCount
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("audioRecentlyPlayedMaxCount"), 100);

  return v3;
}

- (int64_t)audioFinishedAtTimeFromEnd
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("audioFinishedAtTimeFromEnd"), 10);

  return v3;
}

- (NSString)audioDailyBriefingFeatureName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Apple News Today"), &stru_1E464BC40, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("audioDailyBriefingFeatureName"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (int64_t)audioRefreshTimeGMT
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("audioRefreshTimeGMT"), 39600);

  return v3;
}

- (BOOL)audioRefreshForceWakeEnabled
{
  void *v2;
  char v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("audioRefreshShouldForceWake"), 0);

  return v3;
}

- (int64_t)audioRefreshForceWakeRandomizationWindow
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("audioRefreshForceWakeRandomizationWindow"), 600);

  return v3;
}

- (int64_t)audioRewindToParagraphStartAfterTime
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("audioRewindToParagraphStartAfterTime"), 180);

  return v3;
}

- (int64_t)audioCloseIdlePlayerAfterTime
{
  void *v2;
  int64_t v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("audioCloseIdlePlayerAfterTime"), 300);

  return v3;
}

- (NSArray)audioFeedPaywallPositions
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("audioFeedPaywallPositions"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSArray *)v4;
}

- (NSArray)audioChannelPaywallOverrideAllowedTagIDs
{
  void *v2;
  void *v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("audioChannelPaywallOverrideAllowedTagIDs"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)audioArticlesChannelId
{
  void *v2;
  void *v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("audioArticlesChannelId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)audioUpsellConfigurationsByID
{
  NSDictionary *audioUpsellConfigurationsByID;
  void *v4;
  void *v5;
  NSDictionary *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  FCAudioUpsellConfig *v13;
  FCAudioUpsellConfig *v14;
  void *v15;
  NSDictionary *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  audioUpsellConfigurationsByID = self->_audioUpsellConfigurationsByID;
  if (!audioUpsellConfigurationsByID)
  {
    -[FCPaidBundleConfiguration configDict](self, "configDict");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationArrayValueWithDefaultValue(v4, (uint64_t)CFSTR("audioUpsellConfigs"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v19;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
            v13 = [FCAudioUpsellConfig alloc];
            v14 = -[FCAudioUpsellConfig initWithConfigDictionary:](v13, "initWithConfigDictionary:", v12, (_QWORD)v18);
            -[FCAudioUpsellConfig identifier](v14, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary fc_safelySetObject:forKey:](v6, "fc_safelySetObject:forKey:", v14, v15);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v9);
      }

      v16 = self->_audioUpsellConfigurationsByID;
      self->_audioUpsellConfigurationsByID = v6;

    }
    audioUpsellConfigurationsByID = self->_audioUpsellConfigurationsByID;
  }
  return audioUpsellConfigurationsByID;
}

- (BOOL)requiresHardPaywallForIssuesToC
{
  void *v2;
  char v3;

  -[FCPaidBundleConfiguration configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("requiresHardPaywallForIssuesToC"), 1);

  return v3;
}

+ (id)defaultConfigurationForStorefrontID:(id)a3
{
  id v3;
  FCPaidBundleConfiguration *v4;
  void *v5;
  FCPaidBundleConfiguration *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [FCPaidBundleConfiguration alloc];
  v8[0] = CFSTR("143441");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCPaidBundleConfiguration initWithConfigDictionary:storefrontID:localizedStorefrontID:defaultSupportedStoreFronts:](v4, "initWithConfigDictionary:storefrontID:localizedStorefrontID:defaultSupportedStoreFronts:", 0, v3, v3, v5);

  return v6;
}

+ (id)renewalLandingPageByLocalizedStorefrontID
{
  if (qword_1ED0F85F8 != -1)
    dispatch_once(&qword_1ED0F85F8, &__block_literal_global_293);
  return (id)qword_1ED0F85F0;
}

void __70__FCPaidBundleConfiguration_renewalLandingPageByLocalizedStorefrontID__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("143441");
  v2[1] = CFSTR("143455");
  v3[0] = CFSTR("ApD6XdJJuQ9Kr_QCk9ivPDQ");
  v3[1] = CFSTR("AVtXQTyGvT4OsKHgxZ05M1A");
  v2[2] = CFSTR("143455-fr-ca");
  v2[3] = CFSTR("143444");
  v3[2] = CFSTR("Apnn-WUtwSc2wEXaXYwuUWA");
  v3[3] = CFSTR("AXu1vfWkQTGCTyH2EjVUFwQ");
  v2[4] = CFSTR("143460");
  v3[4] = CFSTR("AfRcHZ0YIQbC4GCJ2KwZYxw");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F85F0;
  qword_1ED0F85F0 = v0;

}

+ (id)defaultLandingPageByLocalizedStorefrontID
{
  if (qword_1ED0F8608 != -1)
    dispatch_once(&qword_1ED0F8608, &__block_literal_global_305);
  return (id)qword_1ED0F8600;
}

void __70__FCPaidBundleConfiguration_defaultLandingPageByLocalizedStorefrontID__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("143441");
  v2[1] = CFSTR("143455");
  v3[0] = CFSTR("A53eyrvagTQO5cri5DWwDnw");
  v3[1] = CFSTR("AvPUnt7dQSmGX_KaIUHC5kQ");
  v2[2] = CFSTR("143455-fr-ca");
  v2[3] = CFSTR("143444");
  v3[2] = CFSTR("AfEzIPkyQTxC9g7atKJeVKw");
  v3[3] = CFSTR("A1fFFI_OFTuWOCZBiz3nBkw");
  v2[4] = CFSTR("143460");
  v3[4] = CFSTR("ATV43D73KTPyTlJ-hlICZmA");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8600;
  qword_1ED0F8600 = v0;

}

+ (id)defaultServicesBundleLandingPageByLocalizedStorefrontID
{
  if (qword_1ED0F8618 != -1)
    dispatch_once(&qword_1ED0F8618, &__block_literal_global_316);
  return (id)qword_1ED0F8610;
}

void __84__FCPaidBundleConfiguration_defaultServicesBundleLandingPageByLocalizedStorefrontID__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("143441");
  v2[1] = CFSTR("143455");
  v3[0] = CFSTR("AdgSCAdtlS0P9UQhWGbPVRA");
  v3[1] = CFSTR("AMNrflzD8TRirzxx_2tdqdA");
  v2[2] = CFSTR("143455-fr-ca");
  v2[3] = CFSTR("143444");
  v3[2] = CFSTR("AM3SM6D1cSHG6iB9O-deE_A");
  v3[3] = CFSTR("ASKOyErGaR3vAe6iqsxkekQ");
  v2[4] = CFSTR("143460");
  v3[4] = CFSTR("AiLdUCfKuR2C9hsKAryYVQw");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8610;
  qword_1ED0F8610 = v0;

}

+ (id)defaultFamilySharingLandingPageByLocalizedStorefrontID
{
  if (qword_1ED0F8628 != -1)
    dispatch_once(&qword_1ED0F8628, &__block_literal_global_327);
  return (id)qword_1ED0F8620;
}

void __83__FCPaidBundleConfiguration_defaultFamilySharingLandingPageByLocalizedStorefrontID__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("143441");
  v2[1] = CFSTR("143455");
  v3[0] = CFSTR("ATHi8wuYqRw6_2XiqVdBmRQ");
  v3[1] = CFSTR("ABnZHWwYzQAOG4srVl6oJPw");
  v2[2] = CFSTR("143455-fr-ca");
  v2[3] = CFSTR("143444");
  v3[2] = CFSTR("ADaPfwzFeS4Kqd7ynKkCGtA");
  v3[3] = CFSTR("ApJ3T6edORFWeIsm1UYVVnQ");
  v2[4] = CFSTR("143460");
  v3[4] = CFSTR("AOKrTMJ1ORhKcIeS77Oak5g");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8620;
  qword_1ED0F8620 = v0;

}

+ (id)defaultEndOfPurchaseFamilySharingSetupArticleIDByLocalizedStorefrontID
{
  if (qword_1ED0F8638 != -1)
    dispatch_once(&qword_1ED0F8638, &__block_literal_global_338);
  return (id)qword_1ED0F8630;
}

void __99__FCPaidBundleConfiguration_defaultEndOfPurchaseFamilySharingSetupArticleIDByLocalizedStorefrontID__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("143441");
  v2[1] = CFSTR("143455");
  v3[0] = CFSTR("Axse1yHejTiq4m6_FDhWjzQ");
  v3[1] = CFSTR("AQteqTSopTuyVb6risDsqqA");
  v2[2] = CFSTR("143455-fr-ca");
  v2[3] = CFSTR("143444");
  v3[2] = CFSTR("AQY3aWLseQxyESRs82-fbVA");
  v3[3] = CFSTR("AHhJreKRQTyueyd82FfUzVA");
  v2[4] = CFSTR("143460");
  v3[4] = CFSTR("ADcFux8UIR96JlKqVNI1fpQ");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8630;
  qword_1ED0F8630 = v0;

}

+ (id)defaultEndOfPurchaseNoFamilySharingSetupArticleIDByLocalizedStorefrontID
{
  if (qword_1ED0F8648 != -1)
    dispatch_once(&qword_1ED0F8648, &__block_literal_global_349);
  return (id)qword_1ED0F8640;
}

void __101__FCPaidBundleConfiguration_defaultEndOfPurchaseNoFamilySharingSetupArticleIDByLocalizedStorefrontID__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("143441");
  v2[1] = CFSTR("143455");
  v3[0] = CFSTR("Aj9QiLScMQ6ux3gXuFpSjLQ");
  v3[1] = CFSTR("AzXHbVKNIT4CFohbsyaGOOw");
  v2[2] = CFSTR("143455-fr-ca");
  v2[3] = CFSTR("143444");
  v3[2] = CFSTR("AbTcLWiv4TvGpXAB-tS0e3w");
  v3[3] = CFSTR("Ad0wrgFufRKKrELGiiY6KAA");
  v2[4] = CFSTR("143460");
  v3[4] = CFSTR("AoXCsrwX1Tm6WCWhQvbwomw");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8640;
  qword_1ED0F8640 = v0;

}

+ (id)defaultTagListIDByLocalizedStorefrontID
{
  if (qword_1ED0F8658 != -1)
    dispatch_once(&qword_1ED0F8658, &__block_literal_global_360);
  return (id)qword_1ED0F8650;
}

void __68__FCPaidBundleConfiguration_defaultTagListIDByLocalizedStorefrontID__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("143441");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("GI"), CFSTR("143441"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v7[1] = CFSTR("143455");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("GI"), CFSTR("143455"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v7[2] = CFSTR("143455-fr-ca");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-fr"), CFSTR("GI"), CFSTR("143455"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v7[3] = CFSTR("143444");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("GI"), CFSTR("143444"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v3;
  v7[4] = CFSTR("143460");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("GI"), CFSTR("143460"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED0F8650;
  qword_1ED0F8650 = v5;

}

+ (id)defaultPaidFeedIDByLocalizedStorefrontID
{
  if (qword_1ED0F8678 != -1)
    dispatch_once(&qword_1ED0F8678, &__block_literal_global_370);
  return (id)qword_1ED0F8670;
}

void __69__FCPaidBundleConfiguration_defaultPaidFeedIDByLocalizedStorefrontID__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@$en-US"), CFSTR("TRKNDEVsSSl2ye3cRDsruSQ"), CFSTR("143441"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v7[1] = CFSTR("143455");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@$en-CA"), CFSTR("TRKNDEVsSSl2ye3cRDsruSQ"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v7[2] = CFSTR("143455-fr-ca");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@$fr-CA"), CFSTR("TRKNDEVsSSl2ye3cRDsruSQ"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v7[3] = CFSTR("143444");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@$en-UK"), CFSTR("TRKNDEVsSSl2ye3cRDsruSQ"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v3;
  v7[4] = CFSTR("143460");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@$en-AU"), CFSTR("TRKNDEVsSSl2ye3cRDsruSQ"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED0F8670;
  qword_1ED0F8670 = v5;

}

- (id)defaultPaywallConfigs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[11];
  _QWORD v17[13];

  v17[11] = *MEMORY[0x1E0C80C00];
  -[FCPaidBundleConfiguration defaultLandingPageArticleID](self, "defaultLandingPageArticleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = &unk_1E470ADD8;
  +[FCPaywallConfiguration defaultArticleHardPaywallWithLandingPageArticleID:](FCPaywallConfiguration, "defaultArticleHardPaywallWithLandingPageArticleID:", v2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v15;
  v16[1] = &unk_1E470ADF0;
  +[FCPaywallConfiguration defaultArticleSharedHardPaywallWithLandingPageArticleID:](FCPaywallConfiguration, "defaultArticleSharedHardPaywallWithLandingPageArticleID:", v2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v14;
  v16[2] = &unk_1E470AE08;
  +[FCPaywallConfiguration defaultArticleSoftPaywallWithLandingPageArticleID:](FCPaywallConfiguration, "defaultArticleSoftPaywallWithLandingPageArticleID:", v2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v13;
  v16[3] = &unk_1E470AE20;
  +[FCPaywallConfiguration defaultArticleSharedSoftPaywallWithLandingPageArticleID:](FCPaywallConfiguration, "defaultArticleSharedSoftPaywallWithLandingPageArticleID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v3;
  v16[4] = &unk_1E470AE38;
  +[FCPaywallConfiguration defaultChannelSoftPaywallWithLandingPageArticleID:](FCPaywallConfiguration, "defaultChannelSoftPaywallWithLandingPageArticleID:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v4;
  v16[5] = &unk_1E470AE50;
  +[FCPaywallConfiguration defaultMagazineFeedSoftPaywallSmallPaywallWithLandingPageArticleID:](FCPaywallConfiguration, "defaultMagazineFeedSoftPaywallSmallPaywallWithLandingPageArticleID:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v5;
  v16[6] = &unk_1E470AE68;
  +[FCPaywallConfiguration defaultMagazineFeedSoftPaywallMediumPaywallWithLandingPageArticleID:](FCPaywallConfiguration, "defaultMagazineFeedSoftPaywallMediumPaywallWithLandingPageArticleID:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v6;
  v16[7] = &unk_1E470AE80;
  +[FCPaywallConfiguration defaultMagazineFeedSoftPaywallLargePaywallWithLandingPageArticleID:](FCPaywallConfiguration, "defaultMagazineFeedSoftPaywallLargePaywallWithLandingPageArticleID:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v7;
  v16[8] = &unk_1E470AE98;
  +[FCPaywallConfiguration defaultMagazineFeedVideoSoftPaywallSmallPaywallWithLandingPageArticleID:](FCPaywallConfiguration, "defaultMagazineFeedVideoSoftPaywallSmallPaywallWithLandingPageArticleID:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[8] = v8;
  v16[9] = &unk_1E470AEB0;
  +[FCPaywallConfiguration defaultMagazineFeedVideoSoftPaywallLargePaywallWithLandingPageArticleID:](FCPaywallConfiguration, "defaultMagazineFeedVideoSoftPaywallLargePaywallWithLandingPageArticleID:", v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[9] = v9;
  v16[10] = &unk_1E470AEC8;
  +[FCPaywallConfiguration defaultPDFHardPaywallWithLandingPageArticleID:](FCPaywallConfiguration, "defaultPDFHardPaywallWithLandingPageArticleID:", v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)defaultAudioPaywallConfigs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  -[FCPaidBundleConfiguration defaultLandingPageArticleID](self, "defaultLandingPageArticleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = &unk_1E470ADD8;
  +[FCPaywallConfiguration defaultAudioArticleHardPaywallWithLandingPageArticleID:](FCPaywallConfiguration, "defaultAudioArticleHardPaywallWithLandingPageArticleID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = &unk_1E470ADF0;
  +[FCPaywallConfiguration defaultAudioArticleSharedHardPaywallWithLandingPageArticleID:](FCPaywallConfiguration, "defaultAudioArticleSharedHardPaywallWithLandingPageArticleID:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  v12[2] = &unk_1E470AE08;
  +[FCPaywallConfiguration defaultAudioArticleSoftPaywallWithLandingPageArticleID:](FCPaywallConfiguration, "defaultAudioArticleSoftPaywallWithLandingPageArticleID:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v12[3] = &unk_1E470AE20;
  +[FCPaywallConfiguration defaultAudioArticleSharedSoftPaywallWithLandingPageArticleID:](FCPaywallConfiguration, "defaultAudioArticleSharedSoftPaywallWithLandingPageArticleID:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v6;
  v12[4] = &unk_1E470AEE0;
  +[FCPaywallConfiguration defaultAudioFeedSoftPaywallSmallPaywallWithLandingPageArticleID:](FCPaywallConfiguration, "defaultAudioFeedSoftPaywallSmallPaywallWithLandingPageArticleID:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v7;
  v12[5] = &unk_1E470AEF8;
  +[FCPaywallConfiguration defaultAudioFeedSoftPaywallLargePaywallWithLandingPageArticleID:](FCPaywallConfiguration, "defaultAudioFeedSoftPaywallLargePaywallWithLandingPageArticleID:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v8;
  v12[6] = &unk_1E470AE38;
  +[FCPaywallConfiguration defaultChannelSoftPaywallWithLandingPageArticleID:](FCPaywallConfiguration, "defaultChannelSoftPaywallWithLandingPageArticleID:", v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)defaultSubscriptionButtonConfigs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  -[FCPaidBundleConfiguration defaultLandingPageArticleID](self, "defaultLandingPageArticleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = &unk_1E470ADD8;
  +[FCSubscriptionButtonConfiguration defaultArticleSubscriptionButtonWithLandingPageArticleID:](FCSubscriptionButtonConfiguration, "defaultArticleSubscriptionButtonWithLandingPageArticleID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = &unk_1E470ADF0;
  +[FCSubscriptionButtonConfiguration defaultOsloSheetTargetSubscriptionButton](FCSubscriptionButtonConfiguration, "defaultOsloSheetTargetSubscriptionButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = &unk_1E470AE08;
  +[FCSubscriptionButtonConfiguration defaultIssueCoverSubscriptionButtonWithLandingPageArticleID:](FCSubscriptionButtonConfiguration, "defaultIssueCoverSubscriptionButtonWithLandingPageArticleID:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)defaultServicesBundleSubscriptionButtonConfigs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  -[FCPaidBundleConfiguration defaultServicesBundleLandingPageArticleID](self, "defaultServicesBundleLandingPageArticleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = &unk_1E470ADD8;
  +[FCSubscriptionButtonConfiguration defaultArticleSubscriptionButtonWithLandingPageArticleID:](FCSubscriptionButtonConfiguration, "defaultArticleSubscriptionButtonWithLandingPageArticleID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = &unk_1E470ADF0;
  +[FCSubscriptionButtonConfiguration defaultAmsSheetTargetSubscriptionButton](FCSubscriptionButtonConfiguration, "defaultAmsSheetTargetSubscriptionButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = &unk_1E470AE08;
  +[FCSubscriptionButtonConfiguration defaultIssueCoverSubscriptionButtonWithLandingPageArticleID:](FCSubscriptionButtonConfiguration, "defaultIssueCoverSubscriptionButtonWithLandingPageArticleID:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)defaultMagazineGenres
{
  void *v2;
  void *v3;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD v69[15];
  _QWORD v70[17];

  v70[15] = *MEMORY[0x1E0C80C00];
  FCBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("automotive magazines"), &stru_1E464BC40, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCMagazineGenre magazineGenreWithGenre:localizedDescription:](FCMagazineGenre, "magazineGenreWithGenre:localizedDescription:", CFSTR("automotive"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  FCBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("business & finance magazines"), &stru_1E464BC40, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCMagazineGenre magazineGenreWithGenre:localizedDescription:](FCMagazineGenre, "magazineGenreWithGenre:localizedDescription:", CFSTR("business-finance"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  FCBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("crafts & hobby magazines"), &stru_1E464BC40, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCMagazineGenre magazineGenreWithGenre:localizedDescription:](FCMagazineGenre, "magazineGenreWithGenre:localizedDescription:", CFSTR("crafts-hobby"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  FCBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("entertainment magazines"), &stru_1E464BC40, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCMagazineGenre magazineGenreWithGenre:localizedDescription:](FCMagazineGenre, "magazineGenreWithGenre:localizedDescription:", CFSTR("entertainment"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  FCBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("fashion & style magazines"), &stru_1E464BC40, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCMagazineGenre magazineGenreWithGenre:localizedDescription:](FCMagazineGenre, "magazineGenreWithGenre:localizedDescription:", CFSTR("fashion-style"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  FCBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("food & cooking magazines"), &stru_1E464BC40, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCMagazineGenre magazineGenreWithGenre:localizedDescription:](FCMagazineGenre, "magazineGenreWithGenre:localizedDescription:", CFSTR("food-cooking"), v18);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  FCBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("health & fitness magazines"), &stru_1E464BC40, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCMagazineGenre magazineGenreWithGenre:localizedDescription:](FCMagazineGenre, "magazineGenreWithGenre:localizedDescription:", CFSTR("health-fitness"), v20);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  FCBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("home & gardening magazines"), &stru_1E464BC40, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCMagazineGenre magazineGenreWithGenre:localizedDescription:](FCMagazineGenre, "magazineGenreWithGenre:localizedDescription:", CFSTR("home-gardening"), v22);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  FCBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("kids & parenting magazines"), &stru_1E464BC40, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCMagazineGenre magazineGenreWithGenre:localizedDescription:](FCMagazineGenre, "magazineGenreWithGenre:localizedDescription:", CFSTR("kids-parenting"), v24);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  FCBundle();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("men’s lifestyle magazines"), &stru_1E464BC40, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCMagazineGenre magazineGenreWithGenre:localizedDescription:](FCMagazineGenre, "magazineGenreWithGenre:localizedDescription:", CFSTR("men-lifestyle"), v26);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  FCBundle();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("news & politics magazines"), &stru_1E464BC40, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCMagazineGenre magazineGenreWithGenre:localizedDescription:](FCMagazineGenre, "magazineGenreWithGenre:localizedDescription:", CFSTR("news-politics"), v28);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  FCBundle();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("science & technology magazines"), &stru_1E464BC40, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCMagazineGenre magazineGenreWithGenre:localizedDescription:](FCMagazineGenre, "magazineGenreWithGenre:localizedDescription:", CFSTR("science-technology"), v30);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  FCBundle();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("sports & recreation magazines"), &stru_1E464BC40, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCMagazineGenre magazineGenreWithGenre:localizedDescription:](FCMagazineGenre, "magazineGenreWithGenre:localizedDescription:", CFSTR("sports-recreation"), v32);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  FCBundle();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("travel magazines"), &stru_1E464BC40, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCMagazineGenre magazineGenreWithGenre:localizedDescription:](FCMagazineGenre, "magazineGenreWithGenre:localizedDescription:", CFSTR("travel-regional"), v34);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  FCBundle();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("women’s lifestyle magazines"), &stru_1E464BC40, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCMagazineGenre magazineGenreWithGenre:localizedDescription:](FCMagazineGenre, "magazineGenreWithGenre:localizedDescription:", CFSTR("women-lifestyle"), v36);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = v4;
  objc_msgSend(v4, "genre");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v54;
  v70[0] = v4;
  v58 = v7;
  objc_msgSend(v7, "genre");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v53;
  v70[1] = v7;
  v57 = v10;
  objc_msgSend(v10, "genre");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v69[2] = v52;
  v70[2] = v10;
  v56 = v13;
  objc_msgSend(v13, "genre");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v69[3] = v51;
  v70[3] = v13;
  v55 = v16;
  objc_msgSend(v16, "genre");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v69[4] = v50;
  v70[4] = v16;
  objc_msgSend(v68, "genre");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v69[5] = v49;
  v70[5] = v68;
  objc_msgSend(v67, "genre");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v69[6] = v37;
  v70[6] = v67;
  objc_msgSend(v66, "genre");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v69[7] = v38;
  v70[7] = v66;
  objc_msgSend(v65, "genre");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v69[8] = v39;
  v70[8] = v65;
  objc_msgSend(v64, "genre");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v69[9] = v40;
  v70[9] = v64;
  objc_msgSend(v63, "genre");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v69[10] = v41;
  v70[10] = v63;
  objc_msgSend(v62, "genre");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v69[11] = v42;
  v70[11] = v62;
  objc_msgSend(v61, "genre");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v69[12] = v43;
  v70[12] = v61;
  objc_msgSend(v60, "genre");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v69[13] = v44;
  v70[13] = v60;
  objc_msgSend(v48, "genre");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v69[14] = v45;
  v70[14] = v48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 15);
  v47 = (id)objc_claimAutoreleasedReturnValue();

  return v47;
}

- (unint64_t)articleSoftPaywallPosition
{
  return self->_articleSoftPaywallPosition;
}

- (unint64_t)aLaCarteArticleSoftPaywallPosition
{
  return self->_aLaCarteArticleSoftPaywallPosition;
}

- (void)setMagazineGenresByGenre:(id)a3
{
  objc_storeStrong((id *)&self->_magazineGenresByGenre, a3);
}

- (void)setAudioUpsellConfigurationsByID:(id)a3
{
  objc_storeStrong((id *)&self->_audioUpsellConfigurationsByID, a3);
}

- (void)setConfigDict:(id)a3
{
  objc_storeStrong((id *)&self->_configDict, a3);
}

- (NSMutableDictionary)keyedPaywallConfigurationsByType
{
  return self->_keyedPaywallConfigurationsByType;
}

- (void)setKeyedPaywallConfigurationsByType:(id)a3
{
  objc_storeStrong((id *)&self->_keyedPaywallConfigurationsByType, a3);
}

- (NSMutableDictionary)keyedSubscriptionButtonConfigurationsByType
{
  return self->_keyedSubscriptionButtonConfigurationsByType;
}

- (void)setKeyedSubscriptionButtonConfigurationsByType:(id)a3
{
  objc_storeStrong((id *)&self->_keyedSubscriptionButtonConfigurationsByType, a3);
}

- (NSMutableDictionary)keyedPostPurchaseOnboardingConfigurationsByType
{
  return self->_keyedPostPurchaseOnboardingConfigurationsByType;
}

- (void)setKeyedPostPurchaseOnboardingConfigurationsByType:(id)a3
{
  objc_storeStrong((id *)&self->_keyedPostPurchaseOnboardingConfigurationsByType, a3);
}

- (NFUnfairLock)lock
{
  return self->_lock;
}

@end
