@implementation PARBag

- (PARBag)initWithData:(id)a3 userAgent:(id)a4 userDefaults:(id)a5
{
  id v9;
  id v10;
  id v11;
  PARBag *v12;
  PARBag *v13;
  uint64_t v14;
  NSString *userAgent;
  NSString *clientName;
  uint64_t v17;
  NSString *v18;
  uint64_t v19;
  NSUserDefaults *userDefaults;
  uint64_t v21;
  NSUserDefaults *v22;
  NSObject *v23;
  uint8_t v25[16];
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PARBag;
  v12 = -[PARBag init](&v26, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bagData, a3);
    v14 = objc_msgSend(v10, "copy");
    userAgent = v13->_userAgent;
    v13->_userAgent = (NSString *)v14;

    clientName = v13->_clientName;
    v13->_clientName = (NSString *)&stru_1E39232C8;

    if (v10)
    {
      +[ClientName extractClientNameFromUserAgent:allowAbbreviation:](_TtC10CoreParsec10ClientName, "extractClientNameFromUserAgent:allowAbbreviation:", v10, 1);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v13->_clientName;
      v13->_clientName = (NSString *)v17;

    }
    if (v11)
    {
      objc_storeStrong((id *)&v13->_userDefaults, a5);
    }
    else
    {
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.parsecd"));
      userDefaults = v13->_userDefaults;
      v13->_userDefaults = (NSUserDefaults *)v19;

      if (!v13->_userDefaults)
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v13->_userDefaults;
        v13->_userDefaults = (NSUserDefaults *)v21;

        if (PARLogHandleForCategory_onceToken_91 != -1)
          dispatch_once(&PARLogHandleForCategory_onceToken_91, &__block_literal_global_92);
        v23 = PARLogHandleForCategory_logHandles_3_93;
        if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_3_93, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v25 = 0;
          _os_log_debug_impl(&dword_19A825000, v23, OS_LOG_TYPE_DEBUG, "bag using standardUserDefaults", v25, 2u);
        }
      }
    }
  }

  return v13;
}

- (PARBag)initWithBag:(id)a3 userAgent:(id)a4
{
  return -[PARBag initWithData:userAgent:userDefaults:](self, "initWithData:userAgent:userDefaults:", *((_QWORD *)a3 + 4), a4, *((_QWORD *)a3 + 3));
}

- (void)encodeWithCoder:(id)a3
{
  NSData *bagData;
  id v5;

  bagData = self->_bagData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bagData, CFSTR("_bagData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userAgent, CFSTR("_userAgent"));

}

- (NSString)version
{
  return (NSString *)-[PARBag bag_stringForKey:](self, "bag_stringForKey:", CFSTR("version"));
}

- (BOOL)isEnabled
{
  return -[PARBag bag_BOOLForKey:](self, "bag_BOOLForKey:", CFSTR("enabled"));
}

- (unint64_t)maximumSizeForFeedbackType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[PARBag bag_dictionaryForKey:](self, "bag_dictionaryForKey:", CFSTR("max_custom_feedback_sizes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  return v7;
}

- (id)bag_dictionaryForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PARBag _bag_objectOfClass:forKey:](self, "_bag_objectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)disableAsTypedSuggestion
{
  void *v2;
  char v3;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("spotlight_feature_flags"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)sampleClientTiming
{
  return -[PARBag bag_BOOLForKey:](self, "bag_BOOLForKey:", CFSTR("sample_timing"));
}

- (NSArray)sampleClientTimingEventWhitelist
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[PARBag bag_arrayForKey:](self, "bag_arrayForKey:", CFSTR("sample_timing_event_whitelist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &unk_1E3959500;
  v4 = v2;

  return v4;
}

- (NSString)firstUseLearnMoreText
{
  void *v3;
  void *v4;
  NSString *userAgent;
  NSObject *v6;
  int v8;
  NSString *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[PARBag bag_stringForKey:](self, "bag_stringForKey:", CFSTR("first_use_learn_more"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (PARLogHandleForCategory_onceToken_91 != -1)
    dispatch_once(&PARLogHandleForCategory_onceToken_91, &__block_literal_global_92);
  v4 = (void *)PARLogHandleForCategory_logHandles_3_93;
  if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_3_93, OS_LOG_TYPE_DEFAULT))
  {
    userAgent = self->_userAgent;
    v6 = v4;
    v8 = 138412546;
    v9 = userAgent;
    v10 = 2048;
    v11 = objc_msgSend(v3, "length");
    _os_log_impl(&dword_19A825000, v6, OS_LOG_TYPE_DEFAULT, "FTE learn more lookup for %@, returning FTE of length %lu", (uint8_t *)&v8, 0x16u);

  }
  return (NSString *)v3;
}

- (NSString)firstUseContinueText
{
  void *v3;
  void *v4;
  NSString *userAgent;
  NSObject *v6;
  int v8;
  NSString *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[PARBag bag_stringForKey:](self, "bag_stringForKey:", CFSTR("first_use_continue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (PARLogHandleForCategory_onceToken_91 != -1)
    dispatch_once(&PARLogHandleForCategory_onceToken_91, &__block_literal_global_92);
  v4 = (void *)PARLogHandleForCategory_logHandles_3_93;
  if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_3_93, OS_LOG_TYPE_DEFAULT))
  {
    userAgent = self->_userAgent;
    v6 = v4;
    v8 = 138412546;
    v9 = userAgent;
    v10 = 2048;
    v11 = objc_msgSend(v3, "length");
    _os_log_impl(&dword_19A825000, v6, OS_LOG_TYPE_DEFAULT, "FTE continue lookup for %@, returning FTE of length %lu", (uint8_t *)&v8, 0x16u);

  }
  return (NSString *)v3;
}

- (NSString)firstUseDescriptionText
{
  void *v3;
  void *v4;
  NSString *userAgent;
  NSObject *v6;
  int v8;
  NSString *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[PARBag bag_stringForKey:](self, "bag_stringForKey:", CFSTR("first_use_description"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (PARLogHandleForCategory_onceToken_91 != -1)
    dispatch_once(&PARLogHandleForCategory_onceToken_91, &__block_literal_global_92);
  v4 = (void *)PARLogHandleForCategory_logHandles_3_93;
  if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_3_93, OS_LOG_TYPE_DEFAULT))
  {
    userAgent = self->_userAgent;
    v6 = v4;
    v8 = 138412546;
    v9 = userAgent;
    v10 = 2048;
    v11 = objc_msgSend(v3, "length");
    _os_log_impl(&dword_19A825000, v6, OS_LOG_TYPE_DEFAULT, "FTE description lookup for %@, returning FTE of length %lu", (uint8_t *)&v8, 0x16u);

  }
  return (NSString *)v3;
}

- (BOOL)isRefreshDisabled
{
  void *v2;
  char v3;

  -[PARBag valueForKey:](self, "valueForKey:", CFSTR("__refresh_disabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)valueForKey:(id)a3
{
  return -[PARBag valueForKey:override:](self, "valueForKey:override:", a3, 0);
}

- (BOOL)feedbackEnabled
{
  char v2;
  void *v3;
  void *v4;

  v2 = 1;
  -[PARBag _bag_objectOfClass:forKey:override:](self, "_bag_objectOfClass:forKey:override:", objc_opt_class(), CFSTR("feedback_enabled"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v2 = objc_msgSend(v3, "BOOLValue");

  return v2;
}

- (BOOL)bag_BOOLForKey:(id)a3
{
  void *v3;
  char v4;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)bag_arrayForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PARBag _bag_objectOfClass:forKey:](self, "_bag_objectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)bag_stringForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PARBag _bag_objectOfClass:forKey:](self, "_bag_objectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)bag_numberForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PARBag _bag_objectOfClass:forKey:](self, "_bag_objectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_bag_objectOfClass:(Class)a3 forKey:(id)a4 override:(BOOL)a5
{
  void *v5;
  id v6;

  -[PARBag valueForKey:override:](self, "valueForKey:override:", a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (id)valueForKey:(id)a3 override:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSUserDefaults *userDefaults;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  NSUserDefaults *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(CFSTR("bag."), "stringByAppendingString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      if (PARLogHandleForCategory_onceToken_91 != -1)
        dispatch_once(&PARLogHandleForCategory_onceToken_91, &__block_literal_global_92);
      v9 = PARLogHandleForCategory_logHandles_3_93;
      if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_3_93, OS_LOG_TYPE_DEBUG))
      {
        userDefaults = self->_userDefaults;
        *(_DWORD *)buf = 138412802;
        v17 = v8;
        v18 = 2112;
        v19 = v6;
        v20 = 2112;
        v21 = userDefaults;
        _os_log_debug_impl(&dword_19A825000, v9, OS_LOG_TYPE_DEBUG, "value: %@ key: %@ userDefaults: %@", buf, 0x20u);
      }
      v10 = v8;
      v11 = v10;
    }
    else
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v5, CFSTR("overrides"), 0);
      _CFPropertyListCreateFiltered();
      if (PARLogHandleForCategory_onceToken_91 != -1)
        dispatch_once(&PARLogHandleForCategory_onceToken_91, &__block_literal_global_92);
      v13 = PARLogHandleForCategory_logHandles_3_93;
      if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_3_93, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19A825000, v13, OS_LOG_TYPE_ERROR, "Could not parse mapped plist", buf, 2u);
      }
      v10 = 0;
      v11 = 0;

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_bag_objectOfClass:(Class)a3 forKey:(id)a4
{
  return -[PARBag _bag_objectOfClass:forKey:override:](self, "_bag_objectOfClass:forKey:override:", a3, a4, 1);
}

- (BOOL)use2LayerRanking
{
  return -[PARBag bag_BOOLForKey:](self, "bag_BOOLForKey:", CFSTR("use_twolayer_ranking"));
}

- (NSArray)suggestionRankerModel
{
  return (NSArray *)-[PARBag bag_arrayForKey:](self, "bag_arrayForKey:", CFSTR("spotlight_suggestion_ranker_model"));
}

- (NSArray)enabledDomains
{
  return (NSArray *)-[PARBag bag_arrayForKey:](self, "bag_arrayForKey:", CFSTR("enabled_domains"));
}

- (BOOL)collectAnonymousMetadata
{
  return -[PARBag bag_BOOLForKey:](self, "bag_BOOLForKey:", CFSTR("collect_anonymous_metadata"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagData, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
}

- (PARBag)initWithURL:(id)a3 userAgent:(id)a4 userDefaults:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  PARBag *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v8, 8, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;
  if (v12)
  {
    if (PARLogHandleForCategory_onceToken_91 != -1)
      dispatch_once(&PARLogHandleForCategory_onceToken_91, &__block_literal_global_92);
    v13 = PARLogHandleForCategory_logHandles_3_93;
    if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_3_93, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v12;
      _os_log_error_impl(&dword_19A825000, v13, OS_LOG_TYPE_ERROR, "Could not read bag plist from %@: %@", buf, 0x16u);
    }
    v14 = 0;
  }
  else
  {
    self = -[PARBag initWithData:userAgent:userDefaults:](self, "initWithData:userAgent:userDefaults:", v11, v9, v10);
    v14 = self;
  }

  return v14;
}

- (PARBag)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PARBag *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bagData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userAgent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PARBag initWithData:userAgent:](self, "initWithData:userAgent:", v5, v6);
  return v7;
}

- (PARBag)initWithData:(id)a3 userAgent:(id)a4
{
  return -[PARBag initWithData:userAgent:userDefaults:](self, "initWithData:userAgent:userDefaults:", a3, a4, 0);
}

- (NSNumber)searchRenderTimeout
{
  return (NSNumber *)-[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("search_render_timeout"));
}

- (NSNumber)minSuggestionRenderTimeout
{
  return (NSNumber *)-[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("min_suggestion_render_timeout"));
}

- (PARBag)initWithURL:(id)a3 userDefaults:(id)a4
{
  return -[PARBag initWithURL:userAgent:userDefaults:](self, "initWithURL:userAgent:userDefaults:", a3, 0, a4);
}

- (BOOL)collectScores
{
  return -[PARBag bag_BOOLForKey:](self, "bag_BOOLForKey:", CFSTR("collect_scores"));
}

- (NSArray)anonymousMetadataPreference
{
  return (NSArray *)-[PARBag bag_arrayForKey:](self, "bag_arrayForKey:", CFSTR("anonymous_metadata_preference"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)releaseTag
{
  return (NSString *)-[PARBag bag_stringForKey:](self, "bag_stringForKey:", CFSTR("release_tag"));
}

- (PARBag)initWithURL:(id)a3 userAgent:(id)a4
{
  return -[PARBag initWithURL:userAgent:userDefaults:](self, "initWithURL:userAgent:userDefaults:", a3, a4, 0);
}

- (PARBag)initWithData:(id)a3
{
  return -[PARBag initWithData:userAgent:userDefaults:](self, "initWithData:userAgent:userDefaults:", a3, 0, 0);
}

- (id)bagURL
{
  return -[PARBag valueForKey:](self, "valueForKey:", CFSTR("__bagurl"));
}

- (double)expirationDate
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[PARBag valueForKey:](self, "valueForKey:", CFSTR("__expiration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (NSDictionary)resources
{
  return (NSDictionary *)-[PARBag bag_dictionaryForKey:](self, "bag_dictionaryForKey:", CFSTR("resources"));
}

- (NSNumber)minSearchRenderTimeout
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("min_search_render_timeout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 300);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSNumber *)v5;
}

- (NSNumber)otherRenderTimeout
{
  return (NSNumber *)-[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("other_render_timeout"));
}

- (NSNumber)zkwSearchRenderTimeout
{
  return (NSNumber *)-[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("zkw_search_render_timeout"));
}

- (NSNumber)zkwRecentsExpiration
{
  return (NSNumber *)-[PARBag valueForKey:](self, "valueForKey:", CFSTR("zkw_recents_expiration"));
}

- (NSArray)supportedGeoLocationSources
{
  return (NSArray *)-[PARBag bag_arrayForKey:](self, "bag_arrayForKey:", CFSTR("supported_geo_sources"));
}

- (NSArray)downloadResourcesList
{
  return (NSArray *)-[PARBag bag_arrayForKey:](self, "bag_arrayForKey:", CFSTR("download_resources_list"));
}

- (NSArray)subscriptionProviderDomainWhitelist
{
  return (NSArray *)-[PARBag bag_arrayForKey:](self, "bag_arrayForKey:", CFSTR("subscription_provider_domains"));
}

- (NSArray)subscriptionProviderBundleIdentifierWhitelist
{
  return (NSArray *)-[PARBag bag_arrayForKey:](self, "bag_arrayForKey:", CFSTR("subscription_provider_bundleids"));
}

- (double)subscriptionTTL
{
  void *v2;
  double v3;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("subscription_ttl"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (double)(86400 * objc_msgSend(v2, "integerValue"));

  return v3;
}

- (double)minimumIntervalBetweenQueriesFromBag
{
  void *v2;
  double v3;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("retry_after"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (double)(objc_msgSend(v2, "integerValue") / 1000);

  return v3;
}

- (NSURL)searchURL
{
  void *v3;

  -[PARBag bag_URLForKey:](self, "bag_URLForKey:", CFSTR("search_url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PARBag bag_URLForKey:](self, "bag_URLForKey:", CFSTR("fallback_search_url"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSURL *)v3;
}

- (NSURL)uncommittedSearchURL
{
  void *v3;

  -[PARBag bag_URLForKey:](self, "bag_URLForKey:", CFSTR("uncommitted_search_url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PARBag searchURL](self, "searchURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSURL *)v3;
}

- (NSURL)feedbackURL
{
  void *v3;

  -[PARBag bag_URLForKey:](self, "bag_URLForKey:", CFSTR("feedback_url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PARBag bag_URLForKey:](self, "bag_URLForKey:", CFSTR("fallback_feedback_url"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSURL *)v3;
}

- (NSURL)crowdsourcingURL
{
  return (NSURL *)-[PARBag bag_URLForKey:](self, "bag_URLForKey:", CFSTR("crowdsourcing_url"));
}

- (id)personalizationParameters
{
  return -[PARBag bag_dictionaryForKey:](self, "bag_dictionaryForKey:", CFSTR("client_params"));
}

- (NSURL)flightURL
{
  void *v3;

  -[PARBag bag_URLForKey:](self, "bag_URLForKey:", CFSTR("flight_url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PARBag bag_URLForKey:](self, "bag_URLForKey:", CFSTR("fallback_flight_url"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSURL *)v3;
}

- (NSString)customFlight
{
  return (NSString *)-[PARBag bag_stringForKey:](self, "bag_stringForKey:", CFSTR("custom"));
}

- (unint64_t)minimumQueryLength
{
  void *v2;
  unint64_t v3;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("min_query_len"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (unint64_t)maximumCachedResultsToSend
{
  void *v2;
  unint64_t v3;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("max_cached_results_len"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (unint64_t)maximumCachedQueriesToSend
{
  void *v2;
  unint64_t v3;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("max_cached_queries_len"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (int64_t)abTest2WeekZoneSize
{
  void *v2;
  void *v3;
  uint64_t v4;
  int64_t v5;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("ab_test_2_week_zone_size"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "integerValue");
    if ((v4 & (unint64_t)~(v4 >> 63)) >= 0x64)
      v5 = 100;
    else
      v5 = v4 & ~(v4 >> 63);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)imageTimingFeedbackEnabled
{
  void *v3;
  BOOL v4;

  -[PARBag _bag_objectOfClass:forKey:override:](self, "_bag_objectOfClass:forKey:override:", objc_opt_class(), CFSTR("image_timing_feedback_enabled"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLValue"))
    v4 = -[PARBag bag_BOOLForKey:](self, "bag_BOOLForKey:", CFSTR("image_timing_feedback_enabled"));
  else
    v4 = 1;

  return v4;
}

- (NSArray)skuUploadWhitelist
{
  void *v2;
  void *v3;
  id v4;

  -[PARBag bag_arrayForKey:](self, "bag_arrayForKey:", CFSTR("whitelisted_skus"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = &unk_1E39594E8;

  return (NSArray *)v4;
}

- (NSArray)recentlyUsedAppIdentifierWhitelist
{
  return (NSArray *)-[PARBag bag_arrayForKey:](self, "bag_arrayForKey:", CFSTR("context_whitelist"));
}

- (NSString)firstUseLearnMoreURL
{
  return (NSString *)-[PARBag bag_stringForKey:](self, "bag_stringForKey:", CFSTR("first_use_learn_more_url"));
}

- (NSString)sceneAwareLookupFirstUseDescriptionText
{
  return (NSString *)-[PARBag bag_stringForKey:](self, "bag_stringForKey:", CFSTR("scene_aware_lookup_first_use_description"));
}

- (NSArray)sceneAwareLookupEnabledDomains
{
  return (NSArray *)-[PARBag bag_arrayForKey:](self, "bag_arrayForKey:", CFSTR("scene_aware_lookup_enabled_domains"));
}

- (NSDictionary)maximumCustomFeedbackSizes
{
  return (NSDictionary *)-[PARBag bag_dictionaryForKey:](self, "bag_dictionaryForKey:", CFSTR("max_custom_feedback_sizes"));
}

- (NSNumber)eagerFeedbackSamplingPercentage
{
  return (NSNumber *)-[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("eager_feedback_sampling_percentage"));
}

- (NSNumber)feedbackMaxAgeInDays
{
  return (NSNumber *)-[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("feedback_max_age_in_days"));
}

- (double)timeoutIntervalForRequest
{
  void *v2;
  double v3;
  double v4;
  double result;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("request_timeout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  result = 5.0;
  if (v4 > 0.0)
    return v4;
  return result;
}

- (NSNumber)duetExpertCustomFeedbackSamplingPercentage
{
  return (NSNumber *)-[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("duet_expert_custom_feedback_sampling_percentage"));
}

- (NSNumber)cohortsLookbackInDays
{
  return (NSNumber *)-[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("cohorts_lookback_in_days"));
}

- (double)safariLast1hour
{
  void *v2;
  double v3;
  double v4;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("last_1_hr"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)safariLast1day
{
  void *v2;
  double v3;
  double v4;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("last_1_day"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)safariLast1week
{
  void *v2;
  double v3;
  double v4;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("last_1_week"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)safariLast1month
{
  void *v2;
  double v3;
  double v4;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("last_1_month"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)safariAll
{
  void *v2;
  double v3;
  double v4;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("safari_all"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)safariDecay
{
  void *v2;
  double v3;
  double v4;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("safari_decay"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)safariMostRecent
{
  void *v2;
  double v3;
  double v4;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("safari_recent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)minThresholdToSend
{
  void *v2;
  double v3;
  double v4;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("safari_smart_history_min_threshold"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (BOOL)smartHistoryEnabled
{
  return -[PARBag bag_BOOLForKey:](self, "bag_BOOLForKey:", CFSTR("safari_smart_history_enabled"));
}

- (unint64_t)smartHistoryTimeout
{
  void *v2;
  unint64_t v3;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("safari_smart_history_local_timeout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (unint64_t)smartHistoryMaxRows
{
  void *v2;
  unint64_t v3;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("smart_history_max_rows"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (unint64_t)smartHistorySampleThreshold
{
  void *v2;
  unint64_t v3;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("smart_history_sample_threshold"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (BOOL)smartHistoryFeatureFeedbackEnabled
{
  void *v2;
  char v3;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("smart_history_feature_feedback_enabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (unint64_t)smartHistoryMinimumQueryLength
{
  void *v3;
  unint64_t v4;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("smart_history_min_lc_length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  if (v4)
    return v4;
  if (!-[PARBag minimumQueryLength](self, "minimumQueryLength"))
    return 3;
  return -[PARBag minimumQueryLength](self, "minimumQueryLength");
}

- (NSDictionary)smartSearchV2Parameters
{
  return (NSDictionary *)-[PARBag bag_dictionaryForKey:](self, "bag_dictionaryForKey:", CFSTR("smart_search_v2_parameters"));
}

- (double)safariDwellTimeThresholdMedium
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("safari_dwell_time_threshold_medium"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 5.0;
  }

  return v5;
}

- (double)safariDwellTimeThresholdHigh
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("safari_dwell_time_threshold_high"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 20.0;
  }

  return v5;
}

- (BOOL)allowSafariRankingDataCollection
{
  void *v2;
  void *v3;
  char v4;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("allow_safari_ranking_data_collection"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (unint64_t)safariAssistantHashPrefixLength
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("safari_assistant_hash_prefix_length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 21;

  return v4;
}

- (NSArray)safariAssistantSupportedCountries
{
  void *v2;
  void *v3;
  id v4;

  -[PARBag bag_arrayForKey:](self, "bag_arrayForKey:", CFSTR("safari_assistant_supported_countries"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = &unk_1E3959518;

  return (NSArray *)v4;
}

- (NSArray)safariAssistantSupportedSystemLocales
{
  void *v2;
  void *v3;
  id v4;

  -[PARBag bag_arrayForKey:](self, "bag_arrayForKey:", CFSTR("safari_assistant_supported_system_locales"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = &unk_1E3959530;

  return (NSArray *)v4;
}

- (NSArray)safariAssistantSupportedPageLanguages
{
  void *v2;
  void *v3;
  id v4;

  -[PARBag bag_arrayForKey:](self, "bag_arrayForKey:", CFSTR("safari_assistant_supported_page_languages"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = &unk_1E3959548;

  return (NSArray *)v4;
}

- (unint64_t)safariAssistantForceEnabledState
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("safari_assistant_force_enabled_state"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (unint64_t)objc_msgSend(v2, "unsignedIntegerValue") <= 2)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)sessionExperimentMetadataEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("session_experiment_metadata_enabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)experimentsCustomFeedbackEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("experiments_custom_feedback_enabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)sampleFeatures
{
  return -[PARBag bag_BOOLForKey:](self, "bag_BOOLForKey:", CFSTR("sample_features"));
}

- (BOOL)engagementCardGrpcDisabled
{
  return -[PARBag bag_BOOLForKey:](self, "bag_BOOLForKey:", CFSTR("disable_engagement_grpc"));
}

- (BOOL)spotlightBiomeFBWritesEnabled
{
  return !-[PARBag bag_BOOLForKey:](self, "bag_BOOLForKey:", CFSTR("spotlight_disable_biome_fb_writes"));
}

- (BOOL)spotlightFeatureQualityAggregatesEnabled
{
  return !-[PARBag bag_BOOLForKey:](self, "bag_BOOLForKey:", CFSTR("spotlight_featurequality_disable_aggregation"));
}

- (BOOL)spotlightFeatureQualityUploadsEnabled
{
  return !-[PARBag bag_BOOLForKey:](self, "bag_BOOLForKey:", CFSTR("spotlight_featurequality_disable_upload"));
}

- (NSString)parsecFeedbackFormat
{
  return (NSString *)-[PARBag bag_stringForKey:](self, "bag_stringForKey:", CFSTR("parsec_feedback_format"));
}

- (NSArray)supportedDomains
{
  return (NSArray *)-[PARBag bag_arrayForKey:](self, "bag_arrayForKey:", CFSTR("supported_domains"));
}

- (int64_t)protocolVersion
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PARBag bag_numberForKey:](self, "bag_numberForKey:", CFSTR("protocol_version"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)rpcCompression
{
  return -[PARBag bag_BOOLForKey:](self, "bag_BOOLForKey:", CFSTR("rpc_compression"));
}

- (BOOL)exp
{
  return -[PARBag bag_BOOLForKey:](self, "bag_BOOLForKey:", CFSTR("exp"));
}

- (id)bag_URLForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[PARBag _bag_objectOfClass:forKey:override:](self, "_bag_objectOfClass:forKey:override:", objc_opt_class(), v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5
    && objc_msgSend(v5, "length")
    && (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6), (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    v9 = v6;
  }
  else
  {
    -[PARBag _bag_objectOfClass:forKey:override:](self, "_bag_objectOfClass:forKey:override:", objc_opt_class(), v4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && objc_msgSend(v9, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)urlForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PARBag resources](self, "resources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  else
    -[PARBag bag_URLForKey:](self, "bag_URLForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)rawBag
{
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  const char *v7;
  id v8;
  id v10;
  uint64_t v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (PARLogHandleForCategory_onceToken_91 != -1)
    dispatch_once(&PARLogHandleForCategory_onceToken_91, &__block_literal_global_92);
  v3 = PARLogHandleForCategory_logHandles_3_93;
  if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_3_93, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A825000, v3, OS_LOG_TYPE_DEFAULT, "Please use member accessors on PARBag, do not access rawBag dictionary", buf, 2u);
  }
  v10 = 0;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", self->_bagData, 0, &v11, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
  {
    if (PARLogHandleForCategory_onceToken_91 != -1)
      dispatch_once(&PARLogHandleForCategory_onceToken_91, &__block_literal_global_92);
    v6 = PARLogHandleForCategory_logHandles_3_93;
    if (!os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_3_93, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    v7 = "Bag property list unable to be deserialized: %@";
LABEL_16:
    _os_log_error_impl(&dword_19A825000, v6, OS_LOG_TYPE_ERROR, v7, buf, 0xCu);
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (PARLogHandleForCategory_onceToken_91 != -1)
      dispatch_once(&PARLogHandleForCategory_onceToken_91, &__block_literal_global_92);
    v6 = PARLogHandleForCategory_logHandles_3_93;
    if (!os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_3_93, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    v7 = "Bag property list is not an NSDictionary: %@";
    goto LABEL_16;
  }
  v8 = v4;
LABEL_18:

  return (NSDictionary *)v8;
}

- (NSData)bagData
{
  return (NSData *)(id)-[NSData copy](self->_bagData, "copy");
}

- (id)description
{
  void *v3;
  NSString *userAgent;
  _BOOL4 v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  userAgent = self->_userAgent;
  v5 = -[PARBag isEnabled](self, "isEnabled");
  -[PARBag searchURL](self, "searchURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PARBag: userAgent = %@, enabled = %d, search url = %@"), userAgent, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)dpgDenyListBundleIDs
{
  return (NSString *)-[PARBag bag_stringForKey:](self, "bag_stringForKey:", CFSTR("dpgDenyListBundleIDs"));
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setBagData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
