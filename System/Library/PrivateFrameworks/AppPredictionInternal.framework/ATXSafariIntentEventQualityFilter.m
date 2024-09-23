@implementation ATXSafariIntentEventQualityFilter

- (ATXSafariIntentEventQualityFilter)init
{
  void *v3;
  ATXSafariIntentEventQualityFilter *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXSafariIntentEventQualityFilter initWithContextKitClient:](self, "initWithContextKitClient:", v3);

  return v4;
}

- (ATXSafariIntentEventQualityFilter)initWithContextKitClient:(id)a3
{
  id v5;
  ATXSafariIntentEventQualityFilter *v6;
  ATXSafariIntentEventQualityFilter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSafariIntentEventQualityFilter;
  v6 = -[ATXSafariIntentEventQualityFilter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_ckClient, a3);

  return v7;
}

- (BOOL)shouldAcceptSafariDonation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  const char *v16;
  BOOL v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilesafari"))
    && objc_msgSend(v6, "isEqualToString:", CFSTR("NSUA_NSUserActivityTypeBrowsingWeb")))
  {
    objc_msgSend(v4, "action");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      __atxlog_handle_default();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412290;
        v23 = v19;
        _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "%@ - No ATXAction found. Skipping this action.", (uint8_t *)&v22, 0xCu);

      }
      goto LABEL_15;
    }
    objc_msgSend(v4, "action");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userActivity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "webpageURL");
    v10 = objc_claimAutoreleasedReturnValue();

    -[NSObject absoluteString](v10, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
      if (!-[ATXSafariIntentEventQualityFilter shouldBlockURLForObjectionableContent:](self, "shouldBlockURLForObjectionableContent:", v10))
      {
        v17 = 1;
        goto LABEL_16;
      }
      __atxlog_handle_default();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412290;
      v23 = v15;
      v16 = "%@ - Objectionable Safari donation found by ContextKit. Skipping this action.";
    }
    else
    {
      __atxlog_handle_default();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

LABEL_15:
        v17 = 0;
LABEL_16:

        goto LABEL_17;
      }
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412290;
      v23 = v15;
      v16 = "%@ - No webpageURL found. Skipping this action.";
    }
    _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v22, 0xCu);

    goto LABEL_14;
  }
  v17 = 1;
LABEL_17:

  return v17;
}

- (BOOL)shouldBlockURLForObjectionableContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ATXSafariIntentEventQualityFilter ckClient](self, "ckClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "level1TopicIdsForURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "containsObject:", CFSTR("EC9001"));
  return (char)v4;
}

- (ATXContextKitClient)ckClient
{
  return self->_ckClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckClient, 0);
}

@end
