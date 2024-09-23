@implementation ICNAWindowSceneReportingManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventReporters, 0);
}

+ (id)sharedManager
{
  if (s_onceToken_2 != -1)
    dispatch_once(&s_onceToken_2, &__block_literal_global_6);
  return (id)sharedManager_s_instance_0;
}

void __48__ICNAWindowSceneReportingManager_sharedManager__block_invoke()
{
  ICNAWindowSceneReportingManager *v0;
  void *v1;

  v0 = objc_alloc_init(ICNAWindowSceneReportingManager);
  v1 = (void *)sharedManager_s_instance_0;
  sharedManager_s_instance_0 = (uint64_t)v0;

}

- (ICNAWindowSceneReportingManager)init
{
  ICNAWindowSceneReportingManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *eventReporters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNAWindowSceneReportingManager;
  v2 = -[ICNAOptedInObject init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    eventReporters = v2->_eventReporters;
    v2->_eventReporters = v3;

  }
  return v2;
}

- (void)windowSceneWillBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ICNAWindowSceneEventReporter *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  if (v4)
  {
    v15 = v4;
    objc_msgSend(v4, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "persistentIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICNAWindowSceneReportingManager eventReporters](self, "eventReporters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8 && +[ICNAOptedInObject isOptedInForAnalytics](ICNAEventReporter, "isOptedInForAnalytics"))
    {
      +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "saltedID:forClass:", v6, objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = -[ICNAWindowSceneEventReporter initWithSubTrackerName:windowScene:]([ICNAWindowSceneEventReporter alloc], "initWithSubTrackerName:windowScene:", v10, v15);
      -[ICNAWindowSceneReportingManager eventReporters](self, "eventReporters");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v6);

    }
    -[ICNAWindowSceneReportingManager eventReporters](self, "eventReporters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "startWindowSceneEventDurationTracking");
    objc_msgSend(v14, "submitWindowSceneResizeEventIfNecessaryWithWindowScene:forceSubmit:", v15, 1);

    v4 = v15;
  }

}

- (void)windowSceneDidEnd:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    objc_msgSend(a3, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentIdentifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[ICNAWindowSceneReportingManager eventReporters](self, "eventReporters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "submitWindowSceneEvent");
    -[ICNAWindowSceneReportingManager eventReporters](self, "eventReporters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v8);

  }
}

- (void)windowSceneMayBeResized:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "persistentIdentifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[ICNAWindowSceneReportingManager eventReporters](self, "eventReporters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "submitWindowSceneResizeEventIfNecessaryWithWindowScene:forceSubmit:", v4, 0);
  }
}

- (BOOL)hasActiveWindowScenes
{
  void *v2;
  BOOL v3;

  -[ICNAWindowSceneReportingManager eventReporters](self, "eventReporters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSMutableDictionary)eventReporters
{
  return self->_eventReporters;
}

- (void)setEventReporters:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporters, a3);
}

@end
