@implementation FCNewsTabiChannelPickerSuggestionsConfiguration

- (FCNewsTabiChannelPickerSuggestionsConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration *v5;
  void *v6;
  FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration *v7;
  FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration *v8;
  FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration *v9;
  void *v10;
  FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration *v11;
  FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration *v12;
  FCNewsTabiChannelPickerSuggestionsConfiguration *v13;
  FCNewsTabiChannelPickerSuggestionsConfiguration *v14;
  void *v15;
  FCNewsTabiChannelPickerSuggestionsUserContextConfiguration *v16;
  FCNewsTabiChannelPickerSuggestionsUserContextConfiguration *userContextConfiguration;
  void *v18;
  int v19;
  void *v20;
  int v21;
  NSObject *v22;
  FCNewsTabiChannelPickerSuggestionsConfiguration *v23;
  objc_super v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration alloc];
  FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("bundleInputOutputConfiguration"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration initWithDictionary:](v5, "initWithDictionary:", v6);

  if (v7)
  {
    v8 = v7;
    v9 = [FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("nonBundleInputOutputConfiguration"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration initWithDictionary:](v9, "initWithDictionary:", v10);

    if (v11)
    {
      v12 = v11;
      v25.receiver = self;
      v25.super_class = (Class)FCNewsTabiChannelPickerSuggestionsConfiguration;
      v13 = -[FCNewsTabiChannelPickerSuggestionsConfiguration init](&v25, sel_init);
      v14 = v13;
      if (v13)
      {
        objc_storeStrong((id *)&v13->_bundleInputOutputConfiguration, v7);
        objc_storeStrong((id *)&v14->_nonBundleInputOutputConfiguration, v11);
        FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("userContextConfiguration"), 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[FCNewsTabiChannelPickerSuggestionsUserContextConfiguration initWithDictionary:]([FCNewsTabiChannelPickerSuggestionsUserContextConfiguration alloc], "initWithDictionary:", v15);
        userContextConfiguration = v14->_userContextConfiguration;
        v14->_userContextConfiguration = v16;

        if (NFInternalBuild()
          && (NewsCoreUserDefaults(),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              v19 = objc_msgSend(v18, "BOOLForKey:", CFSTR("news.news_personalization.should_override_local_channel_picker_configuration")), v18, v19))
        {
          NewsCoreUserDefaults();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "BOOLForKey:", CFSTR("news.news_personalization.should_filter_location_suggestions_only_to_apple_news_local"));

          v22 = FCTabiConfigurationLog;
          if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            v31 = v21;
            _os_log_error_impl(&dword_1A1B90000, v22, OS_LOG_TYPE_ERROR, "See override for filterLocationSuggestionsOnlyToAppleNewsLocal, setting to %d", buf, 8u);
          }
          v14->_filterLocationSuggestionsOnlyToAppleNewsLocal = v21;
        }
        else
        {
          v14->_filterLocationSuggestionsOnlyToAppleNewsLocal = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("filterLocationSuggestionsOnlyToAppleNewsLocal"), 0);
        }

      }
      self = v14;

      v23 = self;
    }
    else
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __70__FCNewsTabiChannelPickerSuggestionsConfiguration_initWithDictionary___block_invoke_50;
      v26[3] = &unk_1E463B350;
      v27 = v4;
      __70__FCNewsTabiChannelPickerSuggestionsConfiguration_initWithDictionary___block_invoke_50((uint64_t)v26);
      v23 = (FCNewsTabiChannelPickerSuggestionsConfiguration *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __70__FCNewsTabiChannelPickerSuggestionsConfiguration_initWithDictionary___block_invoke;
    v28[3] = &unk_1E463B350;
    v29 = v4;
    __70__FCNewsTabiChannelPickerSuggestionsConfiguration_initWithDictionary___block_invoke((uint64_t)v28);
    v23 = (FCNewsTabiChannelPickerSuggestionsConfiguration *)objc_claimAutoreleasedReturnValue();

  }
  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userContextConfiguration, 0);
  objc_storeStrong((id *)&self->_nonBundleInputOutputConfiguration, 0);
  objc_storeStrong((id *)&self->_bundleInputOutputConfiguration, 0);
}

- (FCNewsTabiChannelPickerSuggestionsConfiguration)init
{
  return -[FCNewsTabiChannelPickerSuggestionsConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

uint64_t __70__FCNewsTabiChannelPickerSuggestionsConfiguration_initWithDictionary___block_invoke(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiChannelPickerSuggestionsConfiguration due to failure to decode bundleInputOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __70__FCNewsTabiChannelPickerSuggestionsConfiguration_initWithDictionary___block_invoke_50(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiChannelPickerSuggestionsConfiguration due to failure to decode nonBundleInputOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);

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
  -[FCNewsTabiChannelPickerSuggestionsConfiguration bundleInputOutputConfiguration](self, "bundleInputOutputConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indentedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tbundleInputOutputConfiguration: %@;"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tfilterLocationSuggestionsOnlyToAppleNewsLocal: %d;"),
    -[FCNewsTabiChannelPickerSuggestionsConfiguration filterLocationSuggestionsOnlyToAppleNewsLocal](self, "filterLocationSuggestionsOnlyToAppleNewsLocal"));
  -[FCNewsTabiChannelPickerSuggestionsConfiguration nonBundleInputOutputConfiguration](self, "nonBundleInputOutputConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indentedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tnonBundleInputOutputConfiguration: %@;"), v7);

  -[FCNewsTabiChannelPickerSuggestionsConfiguration userContextConfiguration](self, "userContextConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indentedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tuserContextConfiguration: %@;"), v9);

  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration)bundleInputOutputConfiguration
{
  return self->_bundleInputOutputConfiguration;
}

- (void)setBundleInputOutputConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_bundleInputOutputConfiguration, a3);
}

- (FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration)nonBundleInputOutputConfiguration
{
  return self->_nonBundleInputOutputConfiguration;
}

- (void)setNonBundleInputOutputConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_nonBundleInputOutputConfiguration, a3);
}

- (FCNewsTabiChannelPickerSuggestionsUserContextConfiguration)userContextConfiguration
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

@end
