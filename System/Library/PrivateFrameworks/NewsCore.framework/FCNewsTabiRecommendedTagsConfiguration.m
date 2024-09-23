@implementation FCNewsTabiRecommendedTagsConfiguration

- (FCNewsTabiRecommendedTagsConfiguration)init
{
  return -[FCNewsTabiRecommendedTagsConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

- (FCNewsTabiRecommendedTagsConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCNewsTabiRecommendedTagsInputOutputConfiguration *v5;
  void *v6;
  FCNewsTabiRecommendedTagsInputOutputConfiguration *v7;
  FCNewsTabiRecommendedTagsInputOutputConfiguration *v8;
  FCNewsTabiRecommendedTagsInputOutputConfiguration *v9;
  void *v10;
  FCNewsTabiRecommendedTagsInputOutputConfiguration *v11;
  FCNewsTabiRecommendedTagsInputOutputConfiguration *v12;
  FCNewsTabiRecommendedTagsConfiguration *v13;
  FCNewsTabiRecommendedTagsConfiguration *v14;
  void *v15;
  FCNewsTabiRecommendedTagsContextConfiguration *v16;
  FCNewsTabiRecommendedTagsContextConfiguration *contextConfiguration;
  FCNewsTabiRecommendedTagsConfiguration *v18;
  objc_super v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v4 = a3;
  v5 = [FCNewsTabiRecommendedTagsInputOutputConfiguration alloc];
  FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("bundleInputOutputConfiguration"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCNewsTabiRecommendedTagsInputOutputConfiguration initWithDictionary:](v5, "initWithDictionary:", v6);

  if (v7)
  {
    v8 = v7;
    v9 = [FCNewsTabiRecommendedTagsInputOutputConfiguration alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("nonBundleInputOutputConfiguration"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[FCNewsTabiRecommendedTagsInputOutputConfiguration initWithDictionary:](v9, "initWithDictionary:", v10);

    if (v11)
    {
      v12 = v11;
      v20.receiver = self;
      v20.super_class = (Class)FCNewsTabiRecommendedTagsConfiguration;
      v13 = -[FCNewsTabiRecommendedTagsConfiguration init](&v20, sel_init);
      v14 = v13;
      if (v13)
      {
        objc_storeStrong((id *)&v13->_bundleInputOutputConfiguration, v7);
        objc_storeStrong((id *)&v14->_nonBundleInputOutputConfiguration, v11);
        FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("contextConfiguration"), 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[FCNewsTabiRecommendedTagsContextConfiguration initWithDictionary:]([FCNewsTabiRecommendedTagsContextConfiguration alloc], "initWithDictionary:", v15);
        contextConfiguration = v14->_contextConfiguration;
        v14->_contextConfiguration = v16;

      }
      self = v14;

      v18 = self;
    }
    else
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __61__FCNewsTabiRecommendedTagsConfiguration_initWithDictionary___block_invoke_48;
      v21[3] = &unk_1E463B350;
      v22 = v4;
      __61__FCNewsTabiRecommendedTagsConfiguration_initWithDictionary___block_invoke_48((uint64_t)v21);
      v18 = (FCNewsTabiRecommendedTagsConfiguration *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __61__FCNewsTabiRecommendedTagsConfiguration_initWithDictionary___block_invoke;
    v23[3] = &unk_1E463B350;
    v24 = v4;
    __61__FCNewsTabiRecommendedTagsConfiguration_initWithDictionary___block_invoke((uint64_t)v23);
    v18 = (FCNewsTabiRecommendedTagsConfiguration *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

uint64_t __61__FCNewsTabiRecommendedTagsConfiguration_initWithDictionary___block_invoke(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiRecommendedTagsConfiguration due to failure to decode bundleInputOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __61__FCNewsTabiRecommendedTagsConfiguration_initWithDictionary___block_invoke_48(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiRecommendedTagsConfiguration due to failure to decode nonBundleInputOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);

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
  -[FCNewsTabiRecommendedTagsConfiguration bundleInputOutputConfiguration](self, "bundleInputOutputConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indentedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tbundleInputOutputConfiguration: %@;"), v5);

  -[FCNewsTabiRecommendedTagsConfiguration nonBundleInputOutputConfiguration](self, "nonBundleInputOutputConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indentedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tnonBundleInputOutputConfiguration: %@;"), v7);

  -[FCNewsTabiRecommendedTagsConfiguration userContextConfiguration](self, "userContextConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indentedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tcontextConfiguration: %@;"), v9);

  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (FCNewsTabiRecommendedTagsInputOutputConfiguration)bundleInputOutputConfiguration
{
  return self->_bundleInputOutputConfiguration;
}

- (void)setBundleInputOutputConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_bundleInputOutputConfiguration, a3);
}

- (FCNewsTabiRecommendedTagsInputOutputConfiguration)nonBundleInputOutputConfiguration
{
  return self->_nonBundleInputOutputConfiguration;
}

- (void)setNonBundleInputOutputConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_nonBundleInputOutputConfiguration, a3);
}

- (FCNewsTabiRecommendedTagsContextConfiguration)contextConfiguration
{
  return self->_contextConfiguration;
}

- (FCNewsTabiRecommendedTagsContextConfiguration)userContextConfiguration
{
  return self->_userContextConfiguration;
}

- (void)setUserContextConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_userContextConfiguration, a3);
}

- (BOOL)filterLocationSuggestionsOnlyToAppleNewsLocal
{
  return self->_filterLocationSuggestionsOnlyToAppleNewsLocal;
}

- (void)setFilterLocationSuggestionsOnlyToAppleNewsLocal:(BOOL)a3
{
  self->_filterLocationSuggestionsOnlyToAppleNewsLocal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userContextConfiguration, 0);
  objc_storeStrong((id *)&self->_contextConfiguration, 0);
  objc_storeStrong((id *)&self->_nonBundleInputOutputConfiguration, 0);
  objc_storeStrong((id *)&self->_bundleInputOutputConfiguration, 0);
}

@end
