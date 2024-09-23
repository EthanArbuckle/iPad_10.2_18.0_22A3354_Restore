@implementation NSSNewsAnalyticsEventAnnotator

- (NSSNewsAnalyticsEventAnnotator)init
{
  return -[NSSNewsAnalyticsEventAnnotator initWithSessionManager:userIDProvider:](self, "initWithSessionManager:userIDProvider:", 0, 0);
}

- (NSSNewsAnalyticsEventAnnotator)initWithSessionManager:(id)a3 userIDProvider:(id)a4
{
  id v6;
  id v7;
  NSSNewsAnalyticsEventAnnotator *v8;
  NSSNewsAnalyticsEventAnnotator *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NSSNewsAnalyticsEventAnnotator;
  v8 = -[NSSNewsAnalyticsEventAnnotator init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_sessionManager, v6);
    objc_storeStrong((id *)&v9->_userIDProvider, a4);
  }

  return v9;
}

- (void)annotateEvent:(id)a3 withOptions:(unint64_t)a4
{
  char v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a4;
  v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[NSSNewsAnalyticsEventAnnotator annotateEvent:withOptions:].cold.1();
    if ((v4 & 1) == 0)
    {
LABEL_4:
      if ((v4 & 2) == 0)
        goto LABEL_5;
      goto LABEL_13;
    }
  }
  else if ((v4 & 1) == 0)
  {
    goto LABEL_4;
  }
  NSSNTPBAnalyticsUserStorefrontIdValue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserStorefrontId:", v10);

  if ((v4 & 2) == 0)
  {
LABEL_5:
    if ((v4 & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v6, "setReachabilityStatus:", NSSNTPBAnalyticsReachabilityStatusValue());
  if ((v4 & 4) == 0)
  {
LABEL_6:
    if ((v4 & 8) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(v6, "setCellularRadioAccessTechnology:", NSSNTPBAnalyticsCellularRadioAccessTechnologyValue());
  if ((v4 & 8) == 0)
  {
LABEL_7:
    if ((v4 & 0x10) == 0)
      goto LABEL_8;
LABEL_16:
    -[NSSNewsAnalyticsEventAnnotator sessionManager](self, "sessionManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sessionId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSessionId:", v15);

    if ((v4 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_15:
  -[NSSNewsAnalyticsEventAnnotator userIDProvider](self, "userIDProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserId:", v12);

  if ((v4 & 0x10) != 0)
    goto LABEL_16;
LABEL_8:
  if ((v4 & 0x20) != 0)
  {
LABEL_9:
    -[NSSNewsAnalyticsEventAnnotator sessionManager](self, "sessionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "widgetSessionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWidgetSessionId:", v9);

  }
LABEL_10:

}

- (NSSNewsAnalyticsSessionManager)sessionManager
{
  return (NSSNewsAnalyticsSessionManager *)objc_loadWeakRetained((id *)&self->_sessionManager);
}

- (NSSNewsAnalyticsUserIDProvider)userIDProvider
{
  return self->_userIDProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIDProvider, 0);
  objc_destroyWeak((id *)&self->_sessionManager);
}

- (void)annotateEvent:withOptions:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"event", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
