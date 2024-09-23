@implementation ATXFaceSuggestionConfiguredHomeScreenWidgetSignal

- (ATXFaceSuggestionConfiguredHomeScreenWidgetSignal)init
{
  ATXFaceSuggestionConfiguredHomeScreenWidgetSignal *v2;
  ATXFaceSuggestionConfiguredHomeScreenWidgetSignal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXFaceSuggestionConfiguredHomeScreenWidgetSignal;
  v2 = -[ATXFaceSuggestionConfiguredHomeScreenWidgetSignal init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ATXFaceSuggestionConfiguredHomeScreenWidgetSignal _prepare](v2, "_prepare");
  return v3;
}

- (void)_prepare
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[ATXFaceSuggestionConfiguredHomeScreenWidgetSignal _prepare]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "%s: error loading home screen page configurations: %@", (uint8_t *)&v2, 0x16u);
}

- (double)valueForDescriptor:(id)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  double v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "containerBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[NSMutableSet containsObject:](self->_configuredWidgetContainerBundleIdentifiers, "containsObject:", v4);
    __atxlog_handle_lock_screen();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      v8 = 1.0;
      if (v7)
      {
        v13 = 136315394;
        v14 = "-[ATXFaceSuggestionConfiguredHomeScreenWidgetSignal valueForDescriptor:]";
        v15 = 2112;
        v16 = v4;
        v9 = "%s: containerBundleId contains widgets on home screen: %@";
LABEL_9:
        v10 = v6;
        v11 = 22;
        goto LABEL_10;
      }
    }
    else
    {
      v8 = 0.0;
      if (v7)
      {
        v13 = 136315394;
        v14 = "-[ATXFaceSuggestionConfiguredHomeScreenWidgetSignal valueForDescriptor:]";
        v15 = 2112;
        v16 = v4;
        v9 = "%s: containerBundleId does not contain widgets on home screen: %@";
        goto LABEL_9;
      }
    }
  }
  else
  {
    __atxlog_handle_lock_screen();
    v6 = objc_claimAutoreleasedReturnValue();
    v8 = 0.0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315138;
      v14 = "-[ATXFaceSuggestionConfiguredHomeScreenWidgetSignal valueForDescriptor:]";
      v9 = "%s: no containerBundleId";
      v10 = v6;
      v11 = 12;
LABEL_10:
      _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
    }
  }

  return v8;
}

- (double)weight
{
  return 10.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuredWidgetContainerBundleIdentifiers, 0);
}

@end
