@implementation FCNewsTabiFeedPersonalizationConfiguration

- (FCNewsTabiFeedPersonalizationConfiguration)initWithDictionary:(id)a3
{
  id v5;
  FCNewsTabiFeedPersonalizationOutputConfiguration *v6;
  void *v7;
  FCNewsTabiFeedPersonalizationOutputConfiguration *v8;
  FCNewsTabiFeedPersonalizationOutputConfiguration *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  FCNewsTabiFeedPersonalizationOutputConfiguration *v15;
  void *v16;
  FCNewsTabiFeedPersonalizationOutputConfiguration *v17;
  void *v18;
  FCNewsTabiFeedPersonalizationConfiguration *v19;
  FCNewsTabiFeedPersonalizationConfiguration *v20;
  void *v21;
  FCNewsTabiFeedPersonalizationConfiguration *v22;
  FCNewsTabiFeedPersonalizationOutputConfiguration *v24;
  id v25;
  void *v26;
  objc_super v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;

  v5 = a3;
  v6 = [FCNewsTabiFeedPersonalizationOutputConfiguration alloc];
  FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("bundleOutputConfiguration"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCNewsTabiFeedPersonalizationOutputConfiguration initWithDictionary:](v6, "initWithDictionary:", v7);

  if (v8)
  {
    v9 = v8;
    FCAppConfigurationNumberValue(v5, (uint64_t)CFSTR("fullBodyEmbeddingDimension"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
      FCAppConfigurationNumberValue(v5, (uint64_t)CFSTR("maxTopicIds"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v26 = v12;
        v25 = v13;
        v15 = [FCNewsTabiFeedPersonalizationOutputConfiguration alloc];
        FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("nonBundleOutputConfiguration"), 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[FCNewsTabiFeedPersonalizationOutputConfiguration initWithDictionary:](v15, "initWithDictionary:", v16);

        if (v17)
        {
          v24 = v17;
          FCAppConfigurationNumberValue(v5, (uint64_t)CFSTR("titleEmbeddingDimension"), 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v27.receiver = self;
            v27.super_class = (Class)FCNewsTabiFeedPersonalizationConfiguration;
            v19 = -[FCNewsTabiFeedPersonalizationConfiguration init](&v27, sel_init);
            v20 = v19;
            v21 = v25;
            if (v19)
            {
              objc_storeStrong((id *)&v19->_dictionary, a3);
              objc_storeStrong((id *)&v20->_bundleOutputConfiguration, v8);
              v20->_fullBodyEmbeddingDimension = (int)objc_msgSend(v26, "intValue");
              v20->_maxTopicIds = (int)objc_msgSend(v25, "intValue");
              objc_storeStrong((id *)&v20->_nonBundleOutputConfiguration, v17);
              v20->_titleEmbeddingDimension = (int)objc_msgSend(v18, "intValue");
            }
            self = v20;
            v22 = self;
          }
          else
          {
            v28[0] = MEMORY[0x1E0C809B0];
            v28[1] = 3221225472;
            v28[2] = __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_55;
            v28[3] = &unk_1E463B350;
            v29 = v5;
            __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_55((uint64_t)v28);
            v22 = (FCNewsTabiFeedPersonalizationConfiguration *)objc_claimAutoreleasedReturnValue();

            v21 = v25;
          }

          v12 = v26;
        }
        else
        {
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_54;
          v30[3] = &unk_1E463B350;
          v31 = v5;
          __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_54((uint64_t)v30);
          v22 = (FCNewsTabiFeedPersonalizationConfiguration *)objc_claimAutoreleasedReturnValue();

          v21 = v25;
          v12 = v26;
        }

      }
      else
      {
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_53;
        v32[3] = &unk_1E463B350;
        v33 = v5;
        __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_53((uint64_t)v32);
        v22 = (FCNewsTabiFeedPersonalizationConfiguration *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_52;
      v34[3] = &unk_1E463B350;
      v35 = v5;
      __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_52((uint64_t)v34);
      v22 = (FCNewsTabiFeedPersonalizationConfiguration *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke;
    v36[3] = &unk_1E463B350;
    v37 = v5;
    __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke((uint64_t)v36);
    v22 = (FCNewsTabiFeedPersonalizationConfiguration *)objc_claimAutoreleasedReturnValue();

  }
  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonBundleOutputConfiguration, 0);
  objc_storeStrong((id *)&self->_bundleOutputConfiguration, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

- (FCNewsTabiFeedPersonalizationConfiguration)init
{
  return -[FCNewsTabiFeedPersonalizationConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

uint64_t __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiFeedPersonalizationConfiguration due to failure to decode bundleOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_52(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiFeedPersonalizationConfiguration due to failure to decode fullBodyEmbeddingDimension from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_53(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiFeedPersonalizationConfiguration due to failure to decode maxTopicIds from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_54(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiFeedPersonalizationConfiguration due to failure to decode nonBundleOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_55(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiFeedPersonalizationConfiguration due to failure to decode titleEmbeddingDimension from configuration %{public}@", (uint8_t *)&v7, 0xCu);

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

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsTabiFeedPersonalizationConfiguration bundleOutputConfiguration](self, "bundleOutputConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indentedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tbundleOutputConfiguration: %@"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tfullBodyEmbeddingDimension: %lu"), -[FCNewsTabiFeedPersonalizationConfiguration fullBodyEmbeddingDimension](self, "fullBodyEmbeddingDimension"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tmaxTopicIds: %lu"), -[FCNewsTabiFeedPersonalizationConfiguration maxTopicIds](self, "maxTopicIds"));
  -[FCNewsTabiFeedPersonalizationConfiguration nonBundleOutputConfiguration](self, "nonBundleOutputConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indentedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tnonBundleOutputConfiguration: %@"), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR("\n\ttitleEmbeddingDimension: %lu"), -[FCNewsTabiFeedPersonalizationConfiguration titleEmbeddingDimension](self, "titleEmbeddingDimension"));
  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (int64_t)maxTopicIds
{
  return self->_maxTopicIds;
}

- (void)setMaxTopicIds:(int64_t)a3
{
  self->_maxTopicIds = a3;
}

- (int64_t)titleEmbeddingDimension
{
  return self->_titleEmbeddingDimension;
}

- (void)setTitleEmbeddingDimension:(int64_t)a3
{
  self->_titleEmbeddingDimension = a3;
}

- (int64_t)fullBodyEmbeddingDimension
{
  return self->_fullBodyEmbeddingDimension;
}

- (void)setFullBodyEmbeddingDimension:(int64_t)a3
{
  self->_fullBodyEmbeddingDimension = a3;
}

- (FCNewsTabiFeedPersonalizationOutputConfiguration)bundleOutputConfiguration
{
  return self->_bundleOutputConfiguration;
}

- (void)setBundleOutputConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_bundleOutputConfiguration, a3);
}

- (FCNewsTabiFeedPersonalizationOutputConfiguration)nonBundleOutputConfiguration
{
  return self->_nonBundleOutputConfiguration;
}

- (void)setNonBundleOutputConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_nonBundleOutputConfiguration, a3);
}

@end
