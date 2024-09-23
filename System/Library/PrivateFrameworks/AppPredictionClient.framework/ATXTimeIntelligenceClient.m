@implementation ATXTimeIntelligenceClient

- (ATXTimeIntelligenceClient)init
{
  ATXTimeIntelligenceClient *v2;
  uint64_t v3;
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v5;
  void *v6;
  NSXPCConnection *v7;
  void *v8;
  uint64_t v9;
  NSHashTable *observers;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ATXTimeIntelligenceClient;
  v2 = -[ATXTimeIntelligenceClient init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.proactive.timeIntelligence"), 0);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    -[NSXPCConnection setExportedObject:](v2->_xpcConnection, "setExportedObject:", v2);
    v5 = v2->_xpcConnection;
    ATXTimeIntelligenceClientInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v5, "setExportedInterface:", v6);

    v7 = v2->_xpcConnection;
    ATXTimeIntelligenceInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection setInterruptionHandler:](v2->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_53);
    -[NSXPCConnection setInvalidationHandler:](v2->_xpcConnection, "setInvalidationHandler:", &__block_literal_global_3_3);
    -[NSXPCConnection resume](v2->_xpcConnection, "resume");
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v9;

  }
  return v2;
}

void __33__ATXTimeIntelligenceClient_init__block_invoke()
{
  NSObject *v0;

  __atxlog_handle_time_intelligence();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __33__ATXTimeIntelligenceClient_init__block_invoke_cold_1(v0);

}

void __33__ATXTimeIntelligenceClient_init__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_time_intelligence();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_INFO, "ATXTimeIntelligenceClient: invalidation handler called", v1, 2u);
  }

}

- (void)dataSourcesDidUpdateWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__ATXTimeIntelligenceClient_dataSourcesDidUpdateWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E4D57678;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __71__ATXTimeIntelligenceClient_dataSourcesDidUpdateWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfReload");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_notifyObserversOfReload
{
  NSHashTable *v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = self->_observers;
  objc_sync_enter(v3);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_observers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "timeIntelligenceClientDidRefresh", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

- (void)registerObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)predictedTimelineWithDate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[ATXTimeIntelligenceClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__ATXTimeIntelligenceClient_predictedTimelineWithDate_completionHandler___block_invoke;
  v11[3] = &unk_1E4D571E0;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predictedTimelineWithDate:completionHandler:", v7, v9);

}

void __73__ATXTimeIntelligenceClient_predictedTimelineWithDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_time_intelligence();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__ATXTimeIntelligenceClient_predictedTimelineWithDate_completionHandler___block_invoke_cold_1(v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)predictedDailyOverviewWithDate:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ATXTimeIntelligenceClient xpcConnection](self, "xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __86__ATXTimeIntelligenceClient_predictedDailyOverviewWithDate_options_completionHandler___block_invoke;
  v14[3] = &unk_1E4D571E0;
  v15 = v8;
  v12 = v8;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predictedDailyOverviewWithDate:options:completionHandler:", v10, v9, v12);

}

void __86__ATXTimeIntelligenceClient_predictedDailyOverviewWithDate_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_time_intelligence();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__ATXTimeIntelligenceClient_predictedTimelineWithDate_completionHandler___block_invoke_cold_1(v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)predictedFreeMomentsWithDateRange:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ATXTimeIntelligenceClient xpcConnection](self, "xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__ATXTimeIntelligenceClient_predictedFreeMomentsWithDateRange_options_completionHandler___block_invoke;
  v14[3] = &unk_1E4D571E0;
  v15 = v8;
  v12 = v8;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predictedFreeMomentsWithDateRange:options:completionHandler:", v10, v9, v12);

}

void __89__ATXTimeIntelligenceClient_predictedFreeMomentsWithDateRange_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  __atxlog_handle_time_intelligence();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __89__ATXTimeIntelligenceClient_predictedFreeMomentsWithDateRange_options_completionHandler___block_invoke_cold_1((uint64_t)v3, v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)computeDailySummaryWithDate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[ATXTimeIntelligenceClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__ATXTimeIntelligenceClient_computeDailySummaryWithDate_completionHandler___block_invoke;
  v11[3] = &unk_1E4D571E0;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "computeDailySummaryWithDate:completionHandler:", v7, v9);

}

uint64_t __75__ATXTimeIntelligenceClient_computeDailySummaryWithDate_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)computeCompactTimeSummaryWithOptions:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  -[ATXTimeIntelligenceClient xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__ATXTimeIntelligenceClient_computeCompactTimeSummaryWithOptions_completionHandler___block_invoke;
  v10[3] = &unk_1E4D571E0;
  v11 = v6;
  v8 = v6;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "computeCompactTimeSummaryWithOptions:completionHandler:", a3, v8);

}

uint64_t __84__ATXTimeIntelligenceClient_computeCompactTimeSummaryWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invokeActionWithIdentifier:(id)a3 forEvent:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ATXTimeIntelligenceClient xpcConnection](self, "xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83__ATXTimeIntelligenceClient_invokeActionWithIdentifier_forEvent_completionHandler___block_invoke;
  v14[3] = &unk_1E4D571E0;
  v15 = v8;
  v12 = v8;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "invokeActionWithIdentifier:forEvent:completionHandler:", v10, v9, v12);

}

uint64_t __83__ATXTimeIntelligenceClient_invokeActionWithIdentifier_forEvent_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invokeFeedbackOption:(id)a3 forEvent:(id)a4 referenceDate:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[ATXTimeIntelligenceClient xpcConnection](self, "xpcConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __91__ATXTimeIntelligenceClient_invokeFeedbackOption_forEvent_referenceDate_completionHandler___block_invoke;
  v17[3] = &unk_1E4D571E0;
  v18 = v10;
  v15 = v10;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "invokeFeedbackOption:forEvent:referenceDate:completionHandler:", v13, v12, v11, v15);

}

uint64_t __91__ATXTimeIntelligenceClient_invokeFeedbackOption_forEvent_referenceDate_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)rescheduleEvent:(id)a3 proposedDate:(id)a4 referenceDate:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[ATXTimeIntelligenceClient xpcConnection](self, "xpcConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __90__ATXTimeIntelligenceClient_rescheduleEvent_proposedDate_referenceDate_completionHandler___block_invoke;
  v17[3] = &unk_1E4D571E0;
  v18 = v10;
  v15 = v10;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rescheduleEvent:proposedDate:referenceDate:completionHandler:", v13, v12, v11, v15);

}

uint64_t __90__ATXTimeIntelligenceClient_rescheduleEvent_proposedDate_referenceDate_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)loadPinnedTimeEventsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[ATXTimeIntelligenceClient xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__ATXTimeIntelligenceClient_loadPinnedTimeEventsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E4D571E0;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loadPinnedTimeEventsWithCompletionHandler:", v6);

}

uint64_t __71__ATXTimeIntelligenceClient_loadPinnedTimeEventsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)savePinnedTimeEvent:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[ATXTimeIntelligenceClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__ATXTimeIntelligenceClient_savePinnedTimeEvent_completionHandler___block_invoke;
  v11[3] = &unk_1E4D571E0;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "savePinnedTimeEvent:completionHandler:", v7, v9);

}

uint64_t __67__ATXTimeIntelligenceClient_savePinnedTimeEvent_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deletePinnedTimeEvent:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[ATXTimeIntelligenceClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__ATXTimeIntelligenceClient_deletePinnedTimeEvent_completionHandler___block_invoke;
  v11[3] = &unk_1E4D571E0;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deletePinnedTimeEvent:completionHandler:", v7, v9);

}

uint64_t __69__ATXTimeIntelligenceClient_deletePinnedTimeEvent_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveScheduledPinnedTimeEvent:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[ATXTimeIntelligenceClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__ATXTimeIntelligenceClient_saveScheduledPinnedTimeEvent_completionHandler___block_invoke;
  v11[3] = &unk_1E4D571E0;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "saveScheduledPinnedTimeEvent:completionHandler:", v7, v9);

}

uint64_t __76__ATXTimeIntelligenceClient_saveScheduledPinnedTimeEvent_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)logFocusFilterDidChange:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  -[ATXTimeIntelligenceClient xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__ATXTimeIntelligenceClient_logFocusFilterDidChange_completionHandler___block_invoke;
  v10[3] = &unk_1E4D571E0;
  v11 = v6;
  v8 = v6;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logFocusFilterDidChange:completionHandler:", a3, v8);

}

uint64_t __71__ATXTimeIntelligenceClient_logFocusFilterDidChange_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)logDidInvokeWidgetForEvent:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[ATXTimeIntelligenceClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__ATXTimeIntelligenceClient_logDidInvokeWidgetForEvent_completionHandler___block_invoke;
  v11[3] = &unk_1E4D571E0;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logDidInvokeWidgetForEvent:completionHandler:", v7, v9);

}

uint64_t __74__ATXTimeIntelligenceClient_logDidInvokeWidgetForEvent_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)triggerNudgerToPollWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[ATXTimeIntelligenceClient xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__ATXTimeIntelligenceClient_triggerNudgerToPollWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E4D571E0;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "triggerNudgerToPollWithCompletionHandler:", v6);

}

uint64_t __70__ATXTimeIntelligenceClient_triggerNudgerToPollWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dumpTimeFeedbackStream:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[ATXTimeIntelligenceClient xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__ATXTimeIntelligenceClient_dumpTimeFeedbackStream___block_invoke;
  v8[3] = &unk_1E4D571E0;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dumpTimeFeedbackStream:", v6);

}

uint64_t __52__ATXTimeIntelligenceClient_dumpTimeFeedbackStream___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unhideAllEventsFromSource:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  -[ATXTimeIntelligenceClient xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__ATXTimeIntelligenceClient_unhideAllEventsFromSource_completionHandler___block_invoke;
  v10[3] = &unk_1E4D571E0;
  v11 = v6;
  v8 = v6;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unhideAllEventsFromSource:completionHandler:", a3, v8);

}

uint64_t __73__ATXTimeIntelligenceClient_unhideAllEventsFromSource_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerGoalWithData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[ATXTimeIntelligenceClient xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__ATXTimeIntelligenceClient_registerGoalWithData_completionHandler___block_invoke;
  v11[3] = &unk_1E4D571E0;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerGoalWithData:completionHandler:", v7, v9);

}

uint64_t __68__ATXTimeIntelligenceClient_registerGoalWithData_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)printRLPolicyTable:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[ATXTimeIntelligenceClient xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__ATXTimeIntelligenceClient_printRLPolicyTable___block_invoke;
  v8[3] = &unk_1E4D571E0;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "printRLPolicyTable:", v6);

}

uint64_t __48__ATXTimeIntelligenceClient_printRLPolicyTable___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __33__ATXTimeIntelligenceClient_init__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "ATXTimeIntelligenceClient: interruption handler called", v1, 2u);
}

void __73__ATXTimeIntelligenceClient_predictedTimelineWithDate_completionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, a2, v4, "ATXTimeIntelligenceClient: XPC failed: %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_3();
}

void __89__ATXTimeIntelligenceClient_predictedFreeMomentsWithDateRange_options_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, a2, a3, "ATXTimeIntelligenceClient: Could not fetch free moments: %@", (uint8_t *)&v3);
}

@end
