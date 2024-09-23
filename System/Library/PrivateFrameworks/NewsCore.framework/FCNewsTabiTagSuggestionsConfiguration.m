@implementation FCNewsTabiTagSuggestionsConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonBundleOutputConfiguration, 0);
  objc_storeStrong((id *)&self->_bundleOutputConfiguration, 0);
}

- (FCNewsTabiTagSuggestionsConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCNewsTabiTagSuggestionsOutputConfiguration *v5;
  void *v6;
  FCNewsTabiTagSuggestionsOutputConfiguration *v7;
  FCNewsTabiTagSuggestionsOutputConfiguration *v8;
  FCNewsTabiTagSuggestionsOutputConfiguration *v9;
  void *v10;
  FCNewsTabiTagSuggestionsOutputConfiguration *v11;
  FCNewsTabiTagSuggestionsOutputConfiguration *v12;
  FCNewsTabiTagSuggestionsConfiguration *v13;
  id *p_isa;
  FCNewsTabiTagSuggestionsConfiguration *v15;
  objc_super v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  v5 = [FCNewsTabiTagSuggestionsOutputConfiguration alloc];
  FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("bundleOutputConfiguration"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCNewsTabiTagSuggestionsOutputConfiguration initWithDictionary:](v5, "initWithDictionary:", v6);

  if (v7)
  {
    v8 = v7;
    v9 = [FCNewsTabiTagSuggestionsOutputConfiguration alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("nonBundleOutputConfiguration"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[FCNewsTabiTagSuggestionsOutputConfiguration initWithDictionary:](v9, "initWithDictionary:", v10);

    if (v11)
    {
      v12 = v11;
      v17.receiver = self;
      v17.super_class = (Class)FCNewsTabiTagSuggestionsConfiguration;
      v13 = -[FCNewsTabiTagSuggestionsConfiguration init](&v17, sel_init);
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
      v18[2] = __60__FCNewsTabiTagSuggestionsConfiguration_initWithDictionary___block_invoke_46;
      v18[3] = &unk_1E463B350;
      v19 = v4;
      __60__FCNewsTabiTagSuggestionsConfiguration_initWithDictionary___block_invoke_46((uint64_t)v18);
      v15 = (FCNewsTabiTagSuggestionsConfiguration *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __60__FCNewsTabiTagSuggestionsConfiguration_initWithDictionary___block_invoke;
    v20[3] = &unk_1E463B350;
    v21 = v4;
    __60__FCNewsTabiTagSuggestionsConfiguration_initWithDictionary___block_invoke((uint64_t)v20);
    v15 = (FCNewsTabiTagSuggestionsConfiguration *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

uint64_t __60__FCNewsTabiTagSuggestionsConfiguration_initWithDictionary___block_invoke(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiTagSuggestionsConfiguration due to failure to decode bundleOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __60__FCNewsTabiTagSuggestionsConfiguration_initWithDictionary___block_invoke_46(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiTagSuggestionsConfiguration due to failure to decode nonBundleOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);

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
  -[FCNewsTabiTagSuggestionsConfiguration bundleOutputConfiguration](self, "bundleOutputConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indentedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tbundleOutputConfiguration: %@;"), v5);

  -[FCNewsTabiTagSuggestionsConfiguration nonBundleOutputConfiguration](self, "nonBundleOutputConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indentedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tnonBundleOutputConfiguration: %@;"), v7);

  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (FCNewsTabiTagSuggestionsOutputConfiguration)bundleOutputConfiguration
{
  return self->_bundleOutputConfiguration;
}

- (void)setBundleOutputConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_bundleOutputConfiguration, a3);
}

- (FCNewsTabiTagSuggestionsOutputConfiguration)nonBundleOutputConfiguration
{
  return self->_nonBundleOutputConfiguration;
}

- (void)setNonBundleOutputConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_nonBundleOutputConfiguration, a3);
}

@end
