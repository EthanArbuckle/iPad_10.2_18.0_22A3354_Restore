@implementation FCNewsTabiRecommendedIssuesConfiguration

- (FCNewsTabiRecommendedIssuesConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCNewsTabiRecommendedIssuesInputOutputConfiguration *v5;
  void *v6;
  FCNewsTabiRecommendedIssuesInputOutputConfiguration *v7;
  FCNewsTabiRecommendedIssuesInputOutputConfiguration *v8;
  FCNewsTabiRecommendedIssuesInputOutputConfiguration *v9;
  void *v10;
  FCNewsTabiRecommendedIssuesInputOutputConfiguration *v11;
  FCNewsTabiRecommendedIssuesInputOutputConfiguration *v12;
  FCNewsTabiRecommendedIssuesConfiguration *v13;
  FCNewsTabiRecommendedIssuesConfiguration *v14;
  void *v15;
  FCNewsTabiRecommendedIssuesUserContextConfiguration *v16;
  FCNewsTabiRecommendedIssuesUserContextConfiguration *userContextConfiguration;
  FCNewsTabiRecommendedIssuesConfiguration *v18;
  objc_super v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v4 = a3;
  v5 = [FCNewsTabiRecommendedIssuesInputOutputConfiguration alloc];
  FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("bundleInputOutputConfiguration"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCNewsTabiRecommendedIssuesInputOutputConfiguration initWithDictionary:](v5, "initWithDictionary:", v6);

  if (v7)
  {
    v8 = v7;
    v9 = [FCNewsTabiRecommendedIssuesInputOutputConfiguration alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("nonBundleInputOutputConfiguration"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[FCNewsTabiRecommendedIssuesInputOutputConfiguration initWithDictionary:](v9, "initWithDictionary:", v10);

    if (v11)
    {
      v12 = v11;
      v20.receiver = self;
      v20.super_class = (Class)FCNewsTabiRecommendedIssuesConfiguration;
      v13 = -[FCNewsTabiRecommendedIssuesConfiguration init](&v20, sel_init);
      v14 = v13;
      if (v13)
      {
        objc_storeStrong((id *)&v13->_bundleInputOutputConfiguration, v7);
        objc_storeStrong((id *)&v14->_nonBundleInputOutputConfiguration, v11);
        FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("userContextConfiguration"), 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[FCNewsTabiRecommendedIssuesUserContextConfiguration initWithDictionary:]([FCNewsTabiRecommendedIssuesUserContextConfiguration alloc], "initWithDictionary:", v15);
        userContextConfiguration = v14->_userContextConfiguration;
        v14->_userContextConfiguration = v16;

      }
      self = v14;

      v18 = self;
    }
    else
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __63__FCNewsTabiRecommendedIssuesConfiguration_initWithDictionary___block_invoke_48;
      v21[3] = &unk_1E463B350;
      v22 = v4;
      __63__FCNewsTabiRecommendedIssuesConfiguration_initWithDictionary___block_invoke_48((uint64_t)v21);
      v18 = (FCNewsTabiRecommendedIssuesConfiguration *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __63__FCNewsTabiRecommendedIssuesConfiguration_initWithDictionary___block_invoke;
    v23[3] = &unk_1E463B350;
    v24 = v4;
    __63__FCNewsTabiRecommendedIssuesConfiguration_initWithDictionary___block_invoke((uint64_t)v23);
    v18 = (FCNewsTabiRecommendedIssuesConfiguration *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userContextConfiguration, 0);
  objc_storeStrong((id *)&self->_nonBundleInputOutputConfiguration, 0);
  objc_storeStrong((id *)&self->_bundleInputOutputConfiguration, 0);
}

- (FCNewsTabiRecommendedIssuesConfiguration)init
{
  return -[FCNewsTabiRecommendedIssuesConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

uint64_t __63__FCNewsTabiRecommendedIssuesConfiguration_initWithDictionary___block_invoke(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiRecommendedIssuesConfiguration due to failure to decode bundleInputOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __63__FCNewsTabiRecommendedIssuesConfiguration_initWithDictionary___block_invoke_48(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiRecommendedIssuesConfiguration due to failure to decode nonBundleInputOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);

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
  -[FCNewsTabiRecommendedIssuesConfiguration bundleInputOutputConfiguration](self, "bundleInputOutputConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indentedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tbundleInputOutputConfiguration: %@;"), v5);

  -[FCNewsTabiRecommendedIssuesConfiguration nonBundleInputOutputConfiguration](self, "nonBundleInputOutputConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indentedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tnonBundleInputOutputConfiguration: %@;"), v7);

  -[FCNewsTabiRecommendedIssuesConfiguration userContextConfiguration](self, "userContextConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indentedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tuserContextConfiguration: %@;"), v9);

  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (FCNewsTabiRecommendedIssuesInputOutputConfiguration)bundleInputOutputConfiguration
{
  return self->_bundleInputOutputConfiguration;
}

- (void)setBundleInputOutputConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_bundleInputOutputConfiguration, a3);
}

- (FCNewsTabiRecommendedIssuesInputOutputConfiguration)nonBundleInputOutputConfiguration
{
  return self->_nonBundleInputOutputConfiguration;
}

- (void)setNonBundleInputOutputConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_nonBundleInputOutputConfiguration, a3);
}

- (FCNewsTabiRecommendedIssuesUserContextConfiguration)userContextConfiguration
{
  return self->_userContextConfiguration;
}

- (void)setUserContextConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_userContextConfiguration, a3);
}

@end
