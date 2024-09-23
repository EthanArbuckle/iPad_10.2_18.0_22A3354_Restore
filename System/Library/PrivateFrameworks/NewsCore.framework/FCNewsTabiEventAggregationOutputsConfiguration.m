@implementation FCNewsTabiEventAggregationOutputsConfiguration

- (FCNewsTabiEventAggregationOutputsConfiguration)init
{
  return -[FCNewsTabiEventAggregationOutputsConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

- (FCNewsTabiEventAggregationOutputsConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCNewsTabiEventAggregationOutputConfiguration *v5;
  void *v6;
  FCNewsTabiEventAggregationOutputConfiguration *v7;
  FCNewsTabiEventAggregationOutputConfiguration *v8;
  FCNewsTabiEventAggregationOutputConfiguration *v9;
  void *v10;
  FCNewsTabiEventAggregationOutputConfiguration *v11;
  FCNewsTabiEventAggregationOutputConfiguration *v12;
  FCNewsTabiEventAggregationOutputsConfiguration *v13;
  id *p_isa;
  FCNewsTabiEventAggregationOutputsConfiguration *v15;
  objc_super v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  v5 = [FCNewsTabiEventAggregationOutputConfiguration alloc];
  FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("bundleOutputConfiguration"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCNewsTabiEventAggregationOutputConfiguration initWithDictionary:](v5, "initWithDictionary:", v6);

  if (v7)
  {
    v8 = v7;
    v9 = [FCNewsTabiEventAggregationOutputConfiguration alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("nonBundleOutputConfiguration"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[FCNewsTabiEventAggregationOutputConfiguration initWithDictionary:](v9, "initWithDictionary:", v10);

    if (v11)
    {
      v12 = v11;
      v17.receiver = self;
      v17.super_class = (Class)FCNewsTabiEventAggregationOutputsConfiguration;
      v13 = -[FCNewsTabiEventAggregationOutputsConfiguration init](&v17, sel_init);
      p_isa = (id *)&v13->super.isa;
      if (v13)
      {
        objc_storeStrong((id *)&v13->_bundleOutputConfiguration, v7);
        objc_storeStrong(p_isa + 2, v11);
      }
      self = p_isa;

      v15 = self;
    }
    else
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __69__FCNewsTabiEventAggregationOutputsConfiguration_initWithDictionary___block_invoke_4;
      v18[3] = &unk_1E463B350;
      v19 = v4;
      __69__FCNewsTabiEventAggregationOutputsConfiguration_initWithDictionary___block_invoke_4((uint64_t)v18);
      v15 = (FCNewsTabiEventAggregationOutputsConfiguration *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __69__FCNewsTabiEventAggregationOutputsConfiguration_initWithDictionary___block_invoke;
    v20[3] = &unk_1E463B350;
    v21 = v4;
    __69__FCNewsTabiEventAggregationOutputsConfiguration_initWithDictionary___block_invoke((uint64_t)v20);
    v15 = (FCNewsTabiEventAggregationOutputsConfiguration *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

uint64_t __69__FCNewsTabiEventAggregationOutputsConfiguration_initWithDictionary___block_invoke(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiEventAggregationOutputsConfiguration due to failure to decode bundleOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __69__FCNewsTabiEventAggregationOutputsConfiguration_initWithDictionary___block_invoke_4(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiEventAggregationOutputsConfiguration due to failure to decode nonBundleOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

- (FCNewsTabiEventAggregationOutputsConfiguration)initWithOutputs:(id)a3
{
  id v4;
  FCNewsTabiEventAggregationOutputsConfiguration *v5;
  FCNewsTabiEventAggregationOutputConfiguration *v6;
  void *v7;
  uint64_t v8;
  FCNewsTabiEventAggregationOutputConfiguration *bundleOutputConfiguration;
  FCNewsTabiEventAggregationOutputConfiguration *v10;
  void *v11;
  uint64_t v12;
  FCNewsTabiEventAggregationOutputConfiguration *nonBundleOutputConfiguration;
  FCNewsTabiEventAggregationOutputsConfiguration *v14;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[16];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v17.receiver = self;
    v17.super_class = (Class)FCNewsTabiEventAggregationOutputsConfiguration;
    v5 = -[FCNewsTabiEventAggregationOutputsConfiguration init](&v17, sel_init);
    if (v5)
    {
      v6 = [FCNewsTabiEventAggregationOutputConfiguration alloc];
      objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_7_0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[FCNewsTabiEventAggregationOutputConfiguration initWithOutputs:](v6, "initWithOutputs:", v7);
      bundleOutputConfiguration = v5->_bundleOutputConfiguration;
      v5->_bundleOutputConfiguration = (FCNewsTabiEventAggregationOutputConfiguration *)v8;

      v10 = [FCNewsTabiEventAggregationOutputConfiguration alloc];
      objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_8_0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[FCNewsTabiEventAggregationOutputConfiguration initWithOutputs:](v10, "initWithOutputs:", v11);
      nonBundleOutputConfiguration = v5->_nonBundleOutputConfiguration;
      v5->_nonBundleOutputConfiguration = (FCNewsTabiEventAggregationOutputConfiguration *)v12;

    }
    self = v5;
    v14 = self;
  }
  else
  {
    v15 = FCTabiConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiEventAggregationOutputsConfiguration with external outputs because external outputs were empty", buf, 2u);
    }
    v14 = 0;
  }

  return v14;
}

uint64_t __66__FCNewsTabiEventAggregationOutputsConfiguration_initWithOutputs___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleOutputConfiguration");
}

uint64_t __66__FCNewsTabiEventAggregationOutputsConfiguration_initWithOutputs___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "nonBundleOutputConfiguration");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsTabiEventAggregationOutputsConfiguration bundleOutputConfiguration](self, "bundleOutputConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indentedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tbundleOutputConfiguration: %@;"), v5);

  -[FCNewsTabiEventAggregationOutputsConfiguration nonBundleOutputConfiguration](self, "nonBundleOutputConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indentedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tnonBundleOutputConfiguration: %@;"), v7);

  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (FCNewsTabiEventAggregationOutputConfiguration)bundleOutputConfiguration
{
  return self->_bundleOutputConfiguration;
}

- (void)setBundleOutputConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_bundleOutputConfiguration, a3);
}

- (FCNewsTabiEventAggregationOutputConfiguration)nonBundleOutputConfiguration
{
  return self->_nonBundleOutputConfiguration;
}

- (void)setNonBundleOutputConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_nonBundleOutputConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonBundleOutputConfiguration, 0);
  objc_storeStrong((id *)&self->_bundleOutputConfiguration, 0);
}

@end
