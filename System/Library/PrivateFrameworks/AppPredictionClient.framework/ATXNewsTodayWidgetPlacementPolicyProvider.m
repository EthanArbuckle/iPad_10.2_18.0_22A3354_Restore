@implementation ATXNewsTodayWidgetPlacementPolicyProvider

- (BOOL)isTodayWidgetPermittedForLocale:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  int v14;
  NSObject *v15;
  const char *v16;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "isChild");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (!v6)
  {
    objc_msgSend(v3, "countryCode");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      __atxlog_handle_home_screen();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315138;
        v19 = "-[ATXNewsTodayWidgetPlacementPolicyProvider isTodayWidgetPermittedForLocale:]";
        v12 = "%s: no country code in locale, allowing News widget";
        goto LABEL_11;
      }
LABEL_20:
      v8 = 1;
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend((id)objc_opt_class(), "_newsSupportedCountries");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v7);

    if (v10)
    {
      __atxlog_handle_home_screen();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315138;
        v19 = "-[ATXNewsTodayWidgetPlacementPolicyProvider isTodayWidgetPermittedForLocale:]";
        v12 = "%s: in news supported country, allowing News widget";
LABEL_11:
        _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v18, 0xCu);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    objc_msgSend(v3, "localeIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend((id)objc_opt_class(), "_parsecEditorialLocales");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsObject:", v11);

      if (!v14)
      {
        v8 = 0;
        goto LABEL_21;
      }
      __atxlog_handle_home_screen();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      v18 = 136315138;
      v19 = "-[ATXNewsTodayWidgetPlacementPolicyProvider isTodayWidgetPermittedForLocale:]";
      v16 = "%s: in parsec editorial locale, allowing News widget";
    }
    else
    {
      __atxlog_handle_home_screen();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:

        goto LABEL_20;
      }
      v18 = 136315138;
      v19 = "-[ATXNewsTodayWidgetPlacementPolicyProvider isTodayWidgetPermittedForLocale:]";
      v16 = "%s: no locale identifier, allowing News widget";
    }
    _os_log_impl(&dword_1A49EF000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v18, 0xCu);
    goto LABEL_19;
  }
  __atxlog_handle_home_screen();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315138;
    v19 = "-[ATXNewsTodayWidgetPlacementPolicyProvider isTodayWidgetPermittedForLocale:]";
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "%s: not allowing News widget for child account", (uint8_t *)&v18, 0xCu);
  }
  v8 = 0;
LABEL_22:

  return v8;
}

+ (id)_newsSupportedCountries
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("AU"), CFSTR("CA"), CFSTR("GB"), CFSTR("US"), 0);
}

+ (id)_parsecEditorialLocales
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("fr_FR"), CFSTR("de_DE"), 0);
}

@end
