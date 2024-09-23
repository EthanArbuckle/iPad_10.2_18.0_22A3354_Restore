@implementation CAXContextualActionsSuggestionReceiver

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  v5 = a4;
  __atxlog_handle_contextual_actions();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2196B3000, v6, OS_LOG_TYPE_DEFAULT, "Suggestion Receiver listener - received new connection.", buf, 2u);
  }

  CAXContextualActionsXPCInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v7);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_2);
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_5_1);
  objc_msgSend(v5, "resume");

  __atxlog_handle_contextual_actions();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2196B3000, v8, OS_LOG_TYPE_DEFAULT, "Suggestion Receiver listener - resuming connection.", v10, 2u);
  }

  return 1;
}

void __77__CAXContextualActionsSuggestionReceiver_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_contextual_actions();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2196B3000, v0, OS_LOG_TYPE_DEFAULT, "Unexpected interruption on CAX XPC interface", v1, 2u);
  }

}

void __77__CAXContextualActionsSuggestionReceiver_listener_shouldAcceptNewConnection___block_invoke_4()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_contextual_actions();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2196B3000, v0, OS_LOG_TYPE_DEFAULT, "Connection invalidated on CAX XPC interface. Client went away.", v1, 2u);
  }

}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken10 != -1)
    dispatch_once(&sharedInstance__pasOnceToken10, &__block_literal_global_6_0);
  return (id)sharedInstance__pasExprOnceResult;
}

void __56__CAXContextualActionsSuggestionReceiver_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x219A31BB4]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

- (void)startWithBlendingLayerServer:(id)a3
{
  id v4;
  NSObject *v5;
  CAXSuggestionProvider *v6;
  CAXSuggestionProvider *suggestionProvider;
  uint8_t v8[16];

  v4 = a3;
  __atxlog_handle_contextual_actions();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2196B3000, v5, OS_LOG_TYPE_DEFAULT, "Suggestion Receiver starting...", v8, 2u);
  }

  -[CAXContextualActionsSuggestionReceiver setupXPCListener](self, "setupXPCListener");
  v6 = (CAXSuggestionProvider *)objc_opt_new();
  suggestionProvider = self->_suggestionProvider;
  self->_suggestionProvider = v6;

  -[CAXSuggestionProvider registerModelForRealTimeRequestsWithBlendingLayerServer:](self->_suggestionProvider, "registerModelForRealTimeRequestsWithBlendingLayerServer:", v4);
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CAXContextualActionsSuggestionReceiver;
  -[CAXContextualActionsSuggestionReceiver dealloc](&v3, sel_dealloc);
}

- (void)setupXPCListener
{
  NSXPCListener *v3;
  NSXPCListener *xpcListener;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.proactive.ContextualActions.xpc"));
  xpcListener = self->_xpcListener;
  self->_xpcListener = v3;

  -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_xpcListener, "resume");
  __atxlog_handle_contextual_actions();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2196B3000, v5, OS_LOG_TYPE_DEFAULT, "xpcListener resuming in Suggestion Receiver.", v6, 2u);
  }

}

- (void)processShortcutsSessionGivenSummary:(id)a3
{
  id v4;
  CAXContextualActionsPredictor *v5;
  void *v6;
  void *v7;
  CAXContextualActionsPredictor *v8;

  v4 = a3;
  v5 = [CAXContextualActionsPredictor alloc];
  +[CAXContextualActionsPredictor defaultPersonalizedModelUrl](CAXContextualActionsPredictor, "defaultPersonalizedModelUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAXContextualActionsPredictor defaultConfigFileUrl](CAXContextualActionsPredictor, "defaultConfigFileUrl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CAXContextualActionsPredictor initWithDefaultCodersAndModelUrl:configUrl:](v5, "initWithDefaultCodersAndModelUrl:configUrl:", v6, v7);

  -[CAXContextualActionsPredictor updateModelWithSummary:](v8, "updateModelWithSummary:", v4);
  -[CAXContextualActionsSuggestionReceiver donateSessionSummary:](self, "donateSessionSummary:", v4);

}

- (void)processShortcutsSessionGivenSummary:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = (void (**)(id, _QWORD))a4;
  v7 = a3;
  __atxlog_handle_contextual_actions();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2196B3000, v8, OS_LOG_TYPE_DEFAULT, "in receiver - processShortcutsSessionGivenSummary", v9, 2u);
  }

  -[CAXContextualActionsSuggestionReceiver processShortcutsSessionGivenSummary:](self, "processShortcutsSessionGivenSummary:", v7);
  if (v6)
    v6[2](v6, 0);

}

- (void)processShortcutsActionSelectionGivenFeedbackEvent:(id)a3
{
  id v3;
  CAXBiomeContextualActionsFeedbackStream *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = -[CAXBiomeContextualActionsFeedbackStream initWithStoreConfig:]([CAXBiomeContextualActionsFeedbackStream alloc], "initWithStoreConfig:", 0);
  -[CAXBiomeContextualActionsFeedbackStream source](v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendEvent:", v3);

  __atxlog_handle_contextual_actions();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "selectedAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_2196B3000, v6, OS_LOG_TYPE_DEFAULT, "action selection event for action %@ successfully sent to private biome stream.", (uint8_t *)&v9, 0xCu);

  }
}

- (void)processShortcutsActionSelectionGivenFeedbackEvent:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[CAXContextualActionsSuggestionReceiver processShortcutsActionSelectionGivenFeedbackEvent:](self, "processShortcutsActionSelectionGivenFeedbackEvent:", a3);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    v6 = v7;
  }

}

- (void)donateSessionSummary:(id)a3
{
  id v3;
  CAXBiomeContextualActionsFeedbackStream *v4;
  void *v5;
  unint64_t v6;
  CAXContextualActionsFeedbackEvent *v7;
  void *v8;
  void *v9;
  CAXContextualActionsFeedbackEvent *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = -[CAXBiomeContextualActionsFeedbackStream initWithStoreConfig:]([CAXBiomeContextualActionsFeedbackStream alloc], "initWithStoreConfig:", 0);
  objc_msgSend(v3, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    do
    {
      v7 = [CAXContextualActionsFeedbackEvent alloc];
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "sessionIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[CAXContextualActionsFeedbackEvent initWithSelectedAction:suggestion:deviceContext:sessionIdentifier:](v7, "initWithSelectedAction:suggestion:deviceContext:sessionIdentifier:", v8, 0, 0, v9);

      -[CAXBiomeContextualActionsFeedbackStream source](v4, "source");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sendEvent:", v10);

      __atxlog_handle_contextual_actions();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "actionIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v16 = v14;
        _os_log_impl(&dword_2196B3000, v12, OS_LOG_TYPE_DEFAULT, "action: %@ successfully sent to private biome stream.", buf, 0xCu);

      }
      ++v6;
    }
    while (objc_msgSend(v5, "count") > v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionProvider, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end
