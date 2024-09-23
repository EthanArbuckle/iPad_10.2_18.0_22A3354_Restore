@implementation FCNewsTabiRecommendedTagsEndpoint

- (FCNewsTabiRecommendedTagsEndpoint)init
{
  return -[FCNewsTabiRecommendedTagsEndpoint initWithDictionary:](self, "initWithDictionary:", 0);
}

- (FCNewsTabiRecommendedTagsEndpoint)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  FCNewsTabiRecommendedTagsConfiguration *v8;
  FCNewsTabiRecommendedTagsConfiguration *v9;
  FCNewsTabiRecommendedTagsConfiguration *v10;
  FCNewsTabiRecommendedTagsEndpoint *v11;
  FCNewsTabiRecommendedTagsEndpoint *v12;
  void *v13;
  FCNewsTabiEventAggregationOutputsConfiguration *v14;
  FCNewsTabiEventAggregationOutputsConfiguration *eventAggregationOutputs;
  FCNewsTabiRecommendedTagsEndpoint *v16;
  objc_super v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("packageAssetID"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    v8 = -[FCNewsTabiRecommendedTagsConfiguration initWithDictionary:]([FCNewsTabiRecommendedTagsConfiguration alloc], "initWithDictionary:", v4);
    v9 = v8;
    if (v8)
    {
      v10 = v8;
      v18.receiver = self;
      v18.super_class = (Class)FCNewsTabiRecommendedTagsEndpoint;
      v11 = -[FCNewsTabiRecommendedTagsEndpoint init](&v18, sel_init);
      v12 = v11;
      if (v11)
      {
        objc_storeStrong((id *)&v11->_packageAssetID, v6);
        objc_storeStrong((id *)&v12->_configuration, v9);
        FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("eventAggregationOutputs"), 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = -[FCNewsTabiEventAggregationOutputsConfiguration initWithDictionary:]([FCNewsTabiEventAggregationOutputsConfiguration alloc], "initWithDictionary:", v13);
          eventAggregationOutputs = v12->_eventAggregationOutputs;
          v12->_eventAggregationOutputs = v14;

        }
      }
      self = v12;

      v16 = self;
    }
    else
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __56__FCNewsTabiRecommendedTagsEndpoint_initWithDictionary___block_invoke_4;
      v19[3] = &unk_1E463B350;
      v20 = v4;
      __56__FCNewsTabiRecommendedTagsEndpoint_initWithDictionary___block_invoke_4((uint64_t)v19);
      v16 = (FCNewsTabiRecommendedTagsEndpoint *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __56__FCNewsTabiRecommendedTagsEndpoint_initWithDictionary___block_invoke;
    v21[3] = &unk_1E463B350;
    v22 = v4;
    __56__FCNewsTabiRecommendedTagsEndpoint_initWithDictionary___block_invoke((uint64_t)v21);
    v16 = (FCNewsTabiRecommendedTagsEndpoint *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

uint64_t __56__FCNewsTabiRecommendedTagsEndpoint_initWithDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiRecommendedTagsEndpoint due to failure to decode packageAssetID from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __56__FCNewsTabiRecommendedTagsEndpoint_initWithDictionary___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiRecommendedTagsEndpoint due to failure to decode configuration from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsTabiRecommendedTagsEndpoint packageAssetID](self, "packageAssetID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indentedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tpackageAssetID: %@;"), v5);

  -[FCNewsTabiRecommendedTagsEndpoint configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indentedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tconfiguration: %@;"), v7);

  -[FCNewsTabiRecommendedTagsEndpoint eventAggregationOutputs](self, "eventAggregationOutputs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indentedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\teventAggregationOutputs: %@;"), v9);

  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (NSString)packageAssetID
{
  return self->_packageAssetID;
}

- (void)setPackageAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_packageAssetID, a3);
}

- (FCNewsTabiRecommendedTagsConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (FCNewsTabiEventAggregationOutputsConfiguration)eventAggregationOutputs
{
  return self->_eventAggregationOutputs;
}

- (void)setEventAggregationOutputs:(id)a3
{
  objc_storeStrong((id *)&self->_eventAggregationOutputs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventAggregationOutputs, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_packageAssetID, 0);
}

@end
