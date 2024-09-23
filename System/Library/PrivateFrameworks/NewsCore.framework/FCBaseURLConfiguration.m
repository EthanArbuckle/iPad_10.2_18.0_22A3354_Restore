@implementation FCBaseURLConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreConfiguration, 0);
}

+ (id)ckEdgeCachedMultiFetchBaseURLForConfiguration:(id)a3
{
  id v3;
  FCBaseURLConfiguration *v4;
  void *v5;

  v3 = a3;
  v4 = -[FCBaseURLConfiguration initWithCoreConfiguration:]([FCBaseURLConfiguration alloc], "initWithCoreConfiguration:", v3);

  -[FCBaseURLConfiguration ckEdgeCachedMultiFetchBaseURLForConfiguration](v4, "ckEdgeCachedMultiFetchBaseURLForConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ckEdgeCachedMultiFetchBaseURLForConfiguration
{
  return -[FCBaseURLConfiguration baseURL:fallback:](self, "baseURL:fallback:", &__block_literal_global_88_1, FCDefaultCKEdgeCacheURLStringForEnvironment);
}

+ (id)CAPIBaseURLForConfiguration:(id)a3
{
  id v3;
  FCBaseURLConfiguration *v4;
  void *v5;

  v3 = a3;
  v4 = -[FCBaseURLConfiguration initWithCoreConfiguration:]([FCBaseURLConfiguration alloc], "initWithCoreConfiguration:", v3);

  -[FCBaseURLConfiguration CAPIBaseURL](v4, "CAPIBaseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (FCBaseURLConfiguration)initWithCoreConfiguration:(id)a3
{
  id v5;
  FCBaseURLConfiguration *v6;
  FCBaseURLConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCBaseURLConfiguration;
  v6 = -[FCBaseURLConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_coreConfiguration, a3);

  return v7;
}

- (id)CAPIBaseURL
{
  void *v2;
  void *v3;

  -[FCBaseURLConfiguration baseURLString:fallback:](self, "baseURLString:fallback:", &__block_literal_global_76_0, FCDefaultClientAPIBaseURLStringForEnvironment);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)baseURL:(id)a3 fallback:(void *)a4
{
  void *v4;
  void *v5;

  -[FCBaseURLConfiguration baseURLString:fallback:](self, "baseURLString:fallback:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)baseURLString:(id)a3 fallback:(void *)a4
{
  void (**v6)(id, void *);
  uint64_t EndpointEnvironment;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void (**)(id, void *))a3;
  EndpointEnvironment = FCDefaultsReadEndpointEnvironment();
  -[FCBaseURLConfiguration coreConfiguration](self, "coreConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endpointConfigsByEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", EndpointEnvironment);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v6[2](v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    ((void (*)(uint64_t))a4)(EndpointEnvironment);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (FCCoreConfiguration)coreConfiguration
{
  return self->_coreConfiguration;
}

uint64_t __37__FCBaseURLConfiguration_CAPIBaseURL__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clientAPIBaseURLString");
}

uint64_t __71__FCBaseURLConfiguration_ckEdgeCachedMultiFetchBaseURLForConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ckEdgeCachedMultiFetchBaseURLString");
}

uint64_t __62__FCBaseURLConfiguration_ckRecordFetchBaseURLForConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ckRecordFetchBaseURLString");
}

uint64_t __46__FCBaseURLConfiguration_notificationsBaseURL__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "notificationsBaseURLString");
}

uint64_t __43__FCBaseURLConfiguration_newsletterBaseURL__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "newsletterAPIBaseURLString");
}

uint64_t __41__FCBaseURLConfiguration_fairPlayBaseURL__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fairPlayBaseURLString");
}

+ (id)ckRecordFetchBaseURLForConfiguration:(id)a3
{
  id v3;
  FCBaseURLConfiguration *v4;
  void *v5;

  v3 = a3;
  v4 = -[FCBaseURLConfiguration initWithCoreConfiguration:]([FCBaseURLConfiguration alloc], "initWithCoreConfiguration:", v3);

  -[FCBaseURLConfiguration ckRecordFetchBaseURLForConfiguration](v4, "ckRecordFetchBaseURLForConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ckRecordFetchBaseURLForConfiguration
{
  return -[FCBaseURLConfiguration baseURL:fallback:](self, "baseURL:fallback:", &__block_literal_global_86_1, FCDefaultCKFetchURLStringForEnvironment);
}

uint64_t __73__FCBaseURLConfiguration_appAnalyticsSportsEventsBaseURLForConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appAnalyticsSportsEventsBaseURLString");
}

uint64_t __61__FCBaseURLConfiguration_ckMultiFetchBaseURLForConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ckMultiFetchBaseURLString");
}

uint64_t __60__FCBaseURLConfiguration_ckOrderFeedBaseURLForConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ckOrderFeedBaseURLString");
}

+ (id)newsletterBaseURLForConfiguration:(id)a3
{
  id v3;
  FCBaseURLConfiguration *v4;
  void *v5;

  v3 = a3;
  v4 = -[FCBaseURLConfiguration initWithCoreConfiguration:]([FCBaseURLConfiguration alloc], "initWithCoreConfiguration:", v3);

  -[FCBaseURLConfiguration newsletterBaseURL](v4, "newsletterBaseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)newsletterBaseURL
{
  return -[FCBaseURLConfiguration baseURL:fallback:](self, "baseURL:fallback:", &__block_literal_global_75_0, FCDefaultNewsletterAPIBaseURLStringForEnvironment);
}

+ (id)notificationsBaseURLForConfiguration:(id)a3
{
  id v3;
  FCBaseURLConfiguration *v4;
  void *v5;

  v3 = a3;
  v4 = -[FCBaseURLConfiguration initWithCoreConfiguration:]([FCBaseURLConfiguration alloc], "initWithCoreConfiguration:", v3);

  -[FCBaseURLConfiguration notificationsBaseURL](v4, "notificationsBaseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)notificationsBaseURL
{
  return -[FCBaseURLConfiguration baseURL:fallback:](self, "baseURL:fallback:", &__block_literal_global_74_1, FCDefaultNotificationsBaseURLStringForEnvironment);
}

+ (id)fairPlayBaseURLForConfiguration:(id)a3
{
  id v3;
  FCBaseURLConfiguration *v4;
  void *v5;

  v3 = a3;
  v4 = -[FCBaseURLConfiguration initWithCoreConfiguration:]([FCBaseURLConfiguration alloc], "initWithCoreConfiguration:", v3);

  -[FCBaseURLConfiguration fairPlayBaseURL](v4, "fairPlayBaseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fairPlayBaseURL
{
  return -[FCBaseURLConfiguration baseURL:fallback:](self, "baseURL:fallback:", &__block_literal_global_182, FCDefaultFairPlayBaseURLStringForEnvironment);
}

+ (id)appAnalyticsSportsEventsBaseURLForConfiguration:(id)a3
{
  id v3;
  FCBaseURLConfiguration *v4;
  void *v5;

  v3 = a3;
  v4 = -[FCBaseURLConfiguration initWithCoreConfiguration:]([FCBaseURLConfiguration alloc], "initWithCoreConfiguration:", v3);

  -[FCBaseURLConfiguration appAnalyticsSportsEventsBaseURLForConfiguration](v4, "appAnalyticsSportsEventsBaseURLForConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)appAnalyticsSportsEventsBaseURLForConfiguration
{
  return -[FCBaseURLConfiguration baseURL:fallback:](self, "baseURL:fallback:", &__block_literal_global_82_0, FCDefaultAppAnalyticsSportsEventsBaseURLStringForEnvironment);
}

+ (id)ckOrderFeedBaseURLForConfiguration:(id)a3
{
  id v3;
  FCBaseURLConfiguration *v4;
  void *v5;

  v3 = a3;
  v4 = -[FCBaseURLConfiguration initWithCoreConfiguration:]([FCBaseURLConfiguration alloc], "initWithCoreConfiguration:", v3);

  -[FCBaseURLConfiguration ckOrderFeedBaseURLForConfiguration](v4, "ckOrderFeedBaseURLForConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ckOrderFeedBaseURLForConfiguration
{
  return -[FCBaseURLConfiguration baseURL:fallback:](self, "baseURL:fallback:", &__block_literal_global_84_0, FCDefaultCKQueryURLStringForEnvironment);
}

+ (id)ckMultiFetchBaseURLForConfiguration:(id)a3
{
  id v3;
  FCBaseURLConfiguration *v4;
  void *v5;

  v3 = a3;
  v4 = -[FCBaseURLConfiguration initWithCoreConfiguration:]([FCBaseURLConfiguration alloc], "initWithCoreConfiguration:", v3);

  -[FCBaseURLConfiguration ckMultiFetchBaseURLForConfiguration](v4, "ckMultiFetchBaseURLForConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ckMultiFetchBaseURLForConfiguration
{
  return -[FCBaseURLConfiguration baseURL:fallback:](self, "baseURL:fallback:", &__block_literal_global_85_1, FCDefaultCKQueryURLStringForEnvironment);
}

+ (id)searchBaseURLForConfiguration:(id)a3
{
  id v3;
  FCBaseURLConfiguration *v4;
  void *v5;

  v3 = a3;
  v4 = -[FCBaseURLConfiguration initWithCoreConfiguration:]([FCBaseURLConfiguration alloc], "initWithCoreConfiguration:", v3);

  -[FCBaseURLConfiguration searchBaseURLForConfiguration](v4, "searchBaseURLForConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)puzzlesArchiveBaseURLForConfiguration:(id)a3
{
  id v3;
  FCBaseURLConfiguration *v4;
  void *v5;

  v3 = a3;
  v4 = -[FCBaseURLConfiguration initWithCoreConfiguration:]([FCBaseURLConfiguration alloc], "initWithCoreConfiguration:", v3);

  -[FCBaseURLConfiguration puzzlesArchiveBaseURLForConfiguration](v4, "puzzlesArchiveBaseURLForConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)authTokenBaseURLForConfiguration:(id)a3
{
  id v3;
  FCBaseURLConfiguration *v4;
  void *v5;

  v3 = a3;
  v4 = -[FCBaseURLConfiguration initWithCoreConfiguration:]([FCBaseURLConfiguration alloc], "initWithCoreConfiguration:", v3);

  -[FCBaseURLConfiguration authTokenBaseURLForConfiguration](v4, "authTokenBaseURLForConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)sportsDataVisualizationBaseURLForConfiguration:(id)a3
{
  id v3;
  FCBaseURLConfiguration *v4;
  void *v5;

  v3 = a3;
  v4 = -[FCBaseURLConfiguration initWithCoreConfiguration:]([FCBaseURLConfiguration alloc], "initWithCoreConfiguration:", v3);

  -[FCBaseURLConfiguration sportsDataVisualizationBaseURLForConfiguration](v4, "sportsDataVisualizationBaseURLForConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)liveActivityBaseURLForConfiguration:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "sportsDataVisualizationBaseURLForConfiguration:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("/liveactivity/v1/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)fineGrainedNewsletterSubscriptionBaseURLForConfiguration:(id)a3
{
  id v3;
  FCBaseURLConfiguration *v4;
  void *v5;

  v3 = a3;
  v4 = -[FCBaseURLConfiguration initWithCoreConfiguration:]([FCBaseURLConfiguration alloc], "initWithCoreConfiguration:", v3);

  -[FCBaseURLConfiguration fineGrainedNewsletterSubscriptionBaseURLForConfiguration](v4, "fineGrainedNewsletterSubscriptionBaseURLForConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)ckEdgeCachedOrderFeedBaseURLForConfiguration:(id)a3
{
  id v3;
  FCBaseURLConfiguration *v4;
  void *v5;

  v3 = a3;
  v4 = -[FCBaseURLConfiguration initWithCoreConfiguration:]([FCBaseURLConfiguration alloc], "initWithCoreConfiguration:", v3);

  -[FCBaseURLConfiguration ckEdgeCachedOrderFeedBaseURLForConfiguration](v4, "ckEdgeCachedOrderFeedBaseURLForConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)searchBaseURLForConfiguration
{
  return -[FCBaseURLConfiguration baseURL:fallback:](self, "baseURL:fallback:", &__block_literal_global_78_1, FCDefaultSearchBaseURLStringForEnvironment);
}

uint64_t __55__FCBaseURLConfiguration_searchBaseURLForConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "searchAPIBaseURLString");
}

- (id)puzzlesArchiveBaseURLForConfiguration
{
  return -[FCBaseURLConfiguration baseURL:fallback:](self, "baseURL:fallback:", &__block_literal_global_79_3, FCDefaultPuzzlesArchiveBaseURLStringForEnvironment);
}

uint64_t __63__FCBaseURLConfiguration_puzzlesArchiveBaseURLForConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "puzzlesArchiveAPIBaseURLString");
}

- (id)authTokenBaseURLForConfiguration
{
  return -[FCBaseURLConfiguration baseURL:fallback:](self, "baseURL:fallback:", &__block_literal_global_80_0, FCDefaultAuthTokenAPIBaseURLStringForEnvironment);
}

uint64_t __58__FCBaseURLConfiguration_authTokenBaseURLForConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "authTokenAPIBaseURLString");
}

- (id)sportsDataVisualizationBaseURLForConfiguration
{
  return -[FCBaseURLConfiguration baseURL:fallback:](self, "baseURL:fallback:", &__block_literal_global_81_0, FCDefaultSportsDataVisualizationAPIBaseURLStringForEnvironment);
}

uint64_t __72__FCBaseURLConfiguration_sportsDataVisualizationBaseURLForConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sportsDataVisualizationAPIBaseURLString");
}

- (id)fineGrainedNewsletterSubscriptionBaseURLForConfiguration
{
  return -[FCBaseURLConfiguration baseURL:fallback:](self, "baseURL:fallback:", &__block_literal_global_83, FCDefaultFineGrainedNewsletterSubscriptionBaseURLStringForEnvironment);
}

uint64_t __82__FCBaseURLConfiguration_fineGrainedNewsletterSubscriptionBaseURLForConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fineGrainedNewsletterSubscriptionBaseURLString");
}

- (id)ckEdgeCachedOrderFeedBaseURLForConfiguration
{
  return -[FCBaseURLConfiguration baseURL:fallback:](self, "baseURL:fallback:", &__block_literal_global_87_1, FCDefaultCKEdgeCacheURLStringForEnvironment);
}

uint64_t __70__FCBaseURLConfiguration_ckEdgeCachedOrderFeedBaseURLForConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ckEdgeCachedOrderFeedBaseURLString");
}

+ (BOOL)hasOverrideCAPIURL
{
  void *v2;
  BOOL v3;

  +[FCBaseURLConfiguration overrideCAPIURLString](FCBaseURLConfiguration, "overrideCAPIURLString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

+ (id)overrideCAPIURLString
{
  void *v2;
  void *v3;

  NewsCoreUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("capi_base_url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setCoreConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_coreConfiguration, a3);
}

@end
