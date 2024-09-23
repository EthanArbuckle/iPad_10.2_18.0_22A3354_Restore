@implementation ATXSearchFeedbackListenerTargetBiomeStream

- (ATXSearchFeedbackListenerTargetBiomeStream)init
{
  void *v3;
  ATXSearchFeedbackListenerTargetBiomeStream *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXSearchFeedbackListenerTargetBiomeStream initWithBiomeUIStream:](self, "initWithBiomeUIStream:", v3);

  return v4;
}

- (ATXSearchFeedbackListenerTargetBiomeStream)initWithBiomeUIStream:(id)a3
{
  id v5;
  ATXSearchFeedbackListenerTargetBiomeStream *v6;
  ATXSearchFeedbackListenerTargetBiomeStream *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSearchFeedbackListenerTargetBiomeStream;
  v6 = -[ATXSearchFeedbackListenerTargetBiomeStream init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_uiStream, a3);

  return v7;
}

- (void)writeSpotlightEvent:(id)a3
{
  id v4;
  ATXUniversalBiomeUIStream *uiStream;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  id v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  uiStream = self->_uiStream;
  +[ATXUIEvent uiEventWithSpotlightEvent:](ATXUIEvent, "uiEventWithSpotlightEvent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXUniversalBiomeUIStream donateGenericUIEvent:](uiStream, "donateGenericUIEvent:", v6);

  __atxlog_handle_feedback();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "eventType");
    if ((v10 - 1) >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E4D5CBF0[(int)v10 - 1];
    }
    objc_msgSend(v4, "appBlendingCacheId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionBlendingCacheId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appSuggestionIds");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionSuggestionIds");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v17 = v9;
    v18 = 2112;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    v24 = 2112;
    v25 = v14;
    v26 = 2112;
    v27 = v15;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_INFO, "%@ - wrote event of type %@ \nappBlendingCacheId: %@ \nactionBlendingCacheId: %@ \nappUUIDs: %@ \nactionUUIDs: %@", buf, 0x3Eu);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiStream, 0);
}

@end
