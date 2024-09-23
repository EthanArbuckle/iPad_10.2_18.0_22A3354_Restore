@implementation _ATXInspectionClient

- (_ATXInspectionClient)init
{
  _ATXInspectionClient *v2;
  uint64_t v3;
  NSXPCConnection *xpcConnection;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_ATXInspectionClient;
  v2 = -[_ATXInspectionClient init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.duet.appPrediction.inspection"), 0);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    _ATXInspectionInterface();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_xpcConnection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection setInterruptionHandler:](v2->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_35);
    -[NSXPCConnection resume](v2->_xpcConnection, "resume");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_ATXInspectionClient;
  -[_ATXInspectionClient dealloc](&v3, sel_dealloc);
}

- (void)appAndActionHistoryClear:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49___ATXInspectionClient_appAndActionHistoryClear___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appAndActionHistoryClear:", v6);

}

- (void)appHistoryClearAppIntent:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49___ATXInspectionClient_appHistoryClearAppIntent___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appHistoryClearAppIntent:", v6);

}

- (void)appHistoryAddLaunch:(id)a3 launchReason:(id)a4 date:(id)a5 timeZone:(id)a6 reply:(id)a7
{
  id v12;
  NSXPCConnection *xpcConnection;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  v12 = a7;
  xpcConnection = self->_xpcConnection;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __77___ATXInspectionClient_appHistoryAddLaunch_launchReason_date_timeZone_reply___block_invoke;
  v20[3] = &unk_1E82DD268;
  v21 = v12;
  v14 = v12;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "appHistoryAddLaunch:launchReason:date:timeZone:reply:", v18, v17, v16, v15, v14);

}

- (void)appHistoryUpdateActionPredictionPipelineWithAction:(id)a3 date:(id)a4 timeZone:(id)a5 reply:(id)a6
{
  id v10;
  NSXPCConnection *xpcConnection;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  xpcConnection = self->_xpcConnection;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __95___ATXInspectionClient_appHistoryUpdateActionPredictionPipelineWithAction_date_timeZone_reply___block_invoke;
  v17[3] = &unk_1E82DD268;
  v18 = v10;
  v12 = v10;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appHistoryUpdateActionPredictionPipelineWithAction:date:timeZone:reply:", v15, v14, v13, v12);

}

- (void)appHistoryActionWithUUID:(id)a3 reply:(id)a4
{
  id v6;
  NSXPCConnection *xpcConnection;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55___ATXInspectionClient_appHistoryActionWithUUID_reply___block_invoke;
  v11[3] = &unk_1E82DD268;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appHistoryActionWithUUID:reply:", v9, v8);

}

- (void)appHistoryAddNSUALaunch:(id)a3 requiredString:(id)a4 itemIdentifier:(id)a5 date:(id)a6 timeZone:(id)a7 reply:(id)a8
{
  id v14;
  NSXPCConnection *xpcConnection;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v14 = a8;
  xpcConnection = self->_xpcConnection;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __98___ATXInspectionClient_appHistoryAddNSUALaunch_requiredString_itemIdentifier_date_timeZone_reply___block_invoke;
  v23[3] = &unk_1E82DD268;
  v24 = v14;
  v16 = v14;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appHistoryAddNSUALaunch:requiredString:itemIdentifier:date:timeZone:reply:", v21, v20, v19, v18, v17, v16);

}

- (void)appHistoryAddAppIntentLaunch:(id)a3 intent:(id)a4 source:(id)a5 date:(id)a6 timeZone:(id)a7 reply:(id)a8
{
  id v14;
  NSXPCConnection *xpcConnection;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v14 = a8;
  xpcConnection = self->_xpcConnection;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __87___ATXInspectionClient_appHistoryAddAppIntentLaunch_intent_source_date_timeZone_reply___block_invoke;
  v23[3] = &unk_1E82DD268;
  v24 = v14;
  v16 = v14;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appHistoryAddAppIntentLaunch:intent:source:date:timeZone:reply:", v21, v20, v19, v18, v17, v16);

}

- (void)appIntentHistoryMockIntentLaunch:(id)a3 source:(id)a4 startDate:(id)a5 endDate:(id)a6 timeZone:(id)a7 reply:(id)a8
{
  id v14;
  NSXPCConnection *xpcConnection;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v14 = a8;
  xpcConnection = self->_xpcConnection;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __97___ATXInspectionClient_appIntentHistoryMockIntentLaunch_source_startDate_endDate_timeZone_reply___block_invoke;
  v23[3] = &unk_1E82DD268;
  v24 = v14;
  v16 = v14;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appIntentHistoryMockIntentLaunch:source:startDate:endDate:timeZone:reply:", v21, v20, v19, v18, v17, v16);

}

- (void)appIntentHistoryDonateINIntent:(id)a3 intentType:(id)a4 startDate:(id)a5 endDate:(id)a6 timeZone:(id)a7 reply:(id)a8
{
  id v14;
  NSXPCConnection *xpcConnection;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v14 = a8;
  xpcConnection = self->_xpcConnection;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __99___ATXInspectionClient_appIntentHistoryDonateINIntent_intentType_startDate_endDate_timeZone_reply___block_invoke;
  v23[3] = &unk_1E82DD268;
  v24 = v14;
  v16 = v14;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appIntentHistoryDonateINIntent:intentType:startDate:endDate:timeZone:reply:", v21, v20, v19, v18, v17, v16);

}

- (void)appHistoryStartDeltaRecording:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54___ATXInspectionClient_appHistoryStartDeltaRecording___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appHistoryStartDeltaRecording:", v6);

}

- (void)appHistoryStopDeltaRecording:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53___ATXInspectionClient_appHistoryStopDeltaRecording___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appHistoryStopDeltaRecording:", v6);

}

- (void)appInstallHistoryClear:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47___ATXInspectionClient_appInstallHistoryClear___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appInstallHistoryClear:", v6);

}

- (void)appInstallHistorySet:(id)a3 date:(id)a4 reply:(id)a5
{
  id v8;
  NSXPCConnection *xpcConnection;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  xpcConnection = self->_xpcConnection;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56___ATXInspectionClient_appInstallHistorySet_date_reply___block_invoke;
  v14[3] = &unk_1E82DD268;
  v15 = v8;
  v10 = v8;
  v11 = a4;
  v12 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appInstallHistorySet:date:reply:", v12, v11, v10);

}

- (void)appInstallHistoryStartDeltaRecording:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61___ATXInspectionClient_appInstallHistoryStartDeltaRecording___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appInstallHistoryStartDeltaRecording:", v6);

}

- (void)appInstallHistoryStopDeltaRecording:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60___ATXInspectionClient_appInstallHistoryStopDeltaRecording___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appInstallHistoryStopDeltaRecording:", v6);

}

- (void)feedbackClear:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38___ATXInspectionClient_feedbackClear___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "feedbackClear:", v6);

}

- (void)feedbackLaunchedWithConsumerSubType:(unsigned __int8)a3 forBundleId:(id)a4 rejected:(id)a5 reply:(id)a6
{
  uint64_t v8;
  id v10;
  NSXPCConnection *xpcConnection;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v8 = a3;
  v10 = a6;
  xpcConnection = self->_xpcConnection;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __87___ATXInspectionClient_feedbackLaunchedWithConsumerSubType_forBundleId_rejected_reply___block_invoke;
  v16[3] = &unk_1E82DD268;
  v17 = v10;
  v12 = v10;
  v13 = a5;
  v14 = a4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "feedbackLaunchedWithConsumerSubType:forBundleId:rejected:reply:", v8, v14, v13, v12);

}

- (void)feedbackLaunched:(id)a3 rejected:(id)a4 reply:(id)a5
{
  id v8;
  NSXPCConnection *xpcConnection;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  xpcConnection = self->_xpcConnection;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56___ATXInspectionClient_feedbackLaunched_rejected_reply___block_invoke;
  v14[3] = &unk_1E82DD268;
  v15 = v8;
  v10 = v8;
  v11 = a4;
  v12 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "feedbackLaunchedWithConsumerSubType:forBundleId:rejected:reply:", 9, v12, v11, v10);

}

- (void)predictItemsAndReturnInputsAndSubscoresForConsumerSubType:(unsigned __int8)a3 intent:(id)a4 candidateBundleIds:(id)a5 candidateActiontypes:(id)a6 reply:(id)a7
{
  uint64_t v10;
  id v12;
  NSXPCConnection *xpcConnection;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v10 = a3;
  v12 = a7;
  xpcConnection = self->_xpcConnection;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __135___ATXInspectionClient_predictItemsAndReturnInputsAndSubscoresForConsumerSubType_intent_candidateBundleIds_candidateActiontypes_reply___block_invoke;
  v19[3] = &unk_1E82DD268;
  v20 = v12;
  v14 = v12;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "predictItemsAndReturnInputsAndSubscoresForConsumerSubType:intent:candidateBundleIds:candidateActiontypes:reply:", v10, v17, v16, v15, v14);

}

- (void)predictItemsAndReturnMetaDataAndInputsAndSubScoresWithCandidateBundleIdentifiers:(id)a3 candidateActiontypes:(id)a4 consumerSubType:(unsigned __int8)a5 reply:(id)a6
{
  uint64_t v6;
  id v10;
  NSXPCConnection *xpcConnection;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v6 = a5;
  v10 = a6;
  xpcConnection = self->_xpcConnection;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __148___ATXInspectionClient_predictItemsAndReturnMetaDataAndInputsAndSubScoresWithCandidateBundleIdentifiers_candidateActiontypes_consumerSubType_reply___block_invoke;
  v16[3] = &unk_1E82DD268;
  v17 = v10;
  v12 = v10;
  v13 = a4;
  v14 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predictItemsAndReturnMetaDataAndInputsAndSubScoresWithCandidateBundleIdentifiers:candidateActiontypes:consumerSubType:reply:", v14, v13, v6, v12);

}

- (void)predictItemsAndReturnStageScoresWithCandidateBundleIdentifiers:(id)a3 candidateActiontypes:(id)a4 consumerSubType:(unsigned __int8)a5 reply:(id)a6
{
  uint64_t v6;
  id v10;
  NSXPCConnection *xpcConnection;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v6 = a5;
  v10 = a6;
  xpcConnection = self->_xpcConnection;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __130___ATXInspectionClient_predictItemsAndReturnStageScoresWithCandidateBundleIdentifiers_candidateActiontypes_consumerSubType_reply___block_invoke;
  v16[3] = &unk_1E82DD268;
  v17 = v10;
  v12 = v10;
  v13 = a4;
  v14 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predictItemsAndReturnStageScoresWithCandidateBundleIdentifiers:candidateActiontypes:consumerSubType:reply:", v14, v13, v6, v12);

}

- (void)predictAppsAndReturnInputsAndSubscores:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63___ATXInspectionClient_predictAppsAndReturnInputsAndSubscores___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predictAppsAndReturnInputsAndSubscores:", v6);

}

- (void)getParseTreeForConsumerSubType:(unsigned __int8)a3 reply:(id)a4
{
  uint64_t v4;
  id v6;
  NSXPCConnection *xpcConnection;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v6 = a4;
  xpcConnection = self->_xpcConnection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61___ATXInspectionClient_getParseTreeForConsumerSubType_reply___block_invoke;
  v10[3] = &unk_1E82DD268;
  v11 = v6;
  v8 = v6;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getParseTreeForConsumerSubType:reply:", v4, v8);

}

- (void)getPredictionModelDetailsForConsumerSubType:(unsigned __int8)a3 reply:(id)a4
{
  uint64_t v4;
  id v6;
  NSXPCConnection *xpcConnection;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v6 = a4;
  xpcConnection = self->_xpcConnection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74___ATXInspectionClient_getPredictionModelDetailsForConsumerSubType_reply___block_invoke;
  v10[3] = &unk_1E82DD268;
  v11 = v6;
  v8 = v6;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getPredictionModelDetailsForConsumerSubType:reply:", v4, v8);

}

- (void)benchmarkAppPredictionForConsumerSubType:(unsigned __int8)a3 ntimes:(unint64_t)a4 reply:(id)a5
{
  uint64_t v6;
  id v8;
  NSXPCConnection *xpcConnection;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v8 = a5;
  xpcConnection = self->_xpcConnection;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78___ATXInspectionClient_benchmarkAppPredictionForConsumerSubType_ntimes_reply___block_invoke;
  v12[3] = &unk_1E82DD268;
  v13 = v8;
  v10 = v8;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "benchmarkAppPredictionForConsumerSubType:ntimes:reply:", v6, a4, v10);

}

- (void)benchmarkAppPrediction:(unint64_t)a3 reply:(id)a4
{
  id v6;
  NSXPCConnection *xpcConnection;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  xpcConnection = self->_xpcConnection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53___ATXInspectionClient_benchmarkAppPrediction_reply___block_invoke;
  v10[3] = &unk_1E82DD268;
  v11 = v6;
  v8 = v6;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "benchmarkAppPrediction:reply:", a3, v8);

}

- (void)createAppPredictionLogs:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48___ATXInspectionClient_createAppPredictionLogs___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createAppPredictionLogs:", v6);

}

- (void)getActionLogs:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38___ATXInspectionClient_getActionLogs___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getActionLogs:", v6);

}

- (void)getAppFeedbackData:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43___ATXInspectionClient_getAppFeedbackData___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getAppFeedbackData:", v6);

}

- (void)histogramsInMemory:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43___ATXInspectionClient_histogramsInMemory___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "histogramsInMemory:", v6);

}

- (void)histogramsInMemoryBySize:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49___ATXInspectionClient_histogramsInMemoryBySize___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "histogramsInMemoryBySize:", v6);

}

- (void)allHistogramsBySize:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44___ATXInspectionClient_allHistogramsBySize___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allHistogramsBySize:", v6);

}

- (void)retrainActionHistograms:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48___ATXInspectionClient_retrainActionHistograms___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "retrainActionHistograms:", v6);

}

- (void)retrainActionSlotDatabase:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50___ATXInspectionClient_retrainActionSlotDatabase___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "retrainActionSlotDatabase:", v6);

}

- (void)resetActionPredictions:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47___ATXInspectionClient_resetActionPredictions___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetActionPredictions:", v6);

}

- (void)trainMagicalMomentsAppPredictor:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56___ATXInspectionClient_trainMagicalMomentsAppPredictor___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trainMagicalMomentsAppPredictor:", v6);

}

- (void)forceMagicalMomentsAppPredictionForBundleId:(id)a3 expert:(id)a4 reply:(id)a5
{
  id v8;
  NSXPCConnection *xpcConnection;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  xpcConnection = self->_xpcConnection;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81___ATXInspectionClient_forceMagicalMomentsAppPredictionForBundleId_expert_reply___block_invoke;
  v14[3] = &unk_1E82DD268;
  v15 = v8;
  v10 = v8;
  v11 = a4;
  v12 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "forceMagicalMomentsAppPredictionForBundleId:expert:reply:", v12, v11, v10);

}

- (void)dumpPredictionTableForMMExpert:(id)a3 reply:(id)a4
{
  id v6;
  NSXPCConnection *xpcConnection;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61___ATXInspectionClient_dumpPredictionTableForMMExpert_reply___block_invoke;
  v11[3] = &unk_1E82DD268;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dumpPredictionTableForMMExpert:reply:", v9, v8);

}

- (void)evaluateInfoSuggestionsWithCompletionHandler:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69___ATXInspectionClient_evaluateInfoSuggestionsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "evaluateInfoSuggestionsWithCompletionHandler:", v6);

}

- (void)getInfoSuggestionsInString:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51___ATXInspectionClient_getInfoSuggestionsInString___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getInfoSuggestionsInString:", v6);

}

- (void)fetchSuggestionsForSourceId:(id)a3 reply:(id)a4
{
  id v6;
  NSXPCConnection *xpcConnection;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58___ATXInspectionClient_fetchSuggestionsForSourceId_reply___block_invoke;
  v11[3] = &unk_1E82DD268;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchSuggestionsForSourceId:reply:", v9, v8);

}

- (void)widgetBundleIdentifiersForAllInfoSuggestionsInString:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77___ATXInspectionClient_widgetBundleIdentifiersForAllInfoSuggestionsInString___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "widgetBundleIdentifiersForAllInfoSuggestionsInString:", v6);

}

- (void)getInfoPredictionsInString:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51___ATXInspectionClient_getInfoPredictionsInString___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getInfoPredictionsInString:", v6);

}

- (void)rankAndReturnInfoPredictionsInString:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61___ATXInspectionClient_rankAndReturnInfoPredictionsInString___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rankAndReturnInfoPredictionsInString:", v6);

}

- (void)categoriesWithShouldUseDefault:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSXPCConnection *xpcConnection;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v6 = a4;
  xpcConnection = self->_xpcConnection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61___ATXInspectionClient_categoriesWithShouldUseDefault_reply___block_invoke;
  v10[3] = &unk_1E82DD268;
  v11 = v6;
  v8 = v6;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "categoriesWithShouldUseDefault:reply:", v4, v8);

}

- (void)updateAppDirectoryCache:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48___ATXInspectionClient_updateAppDirectoryCache___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateAppDirectoryCache:", v6);

}

- (void)getModeTimelineDataFromStartDate:(id)a3 reply:(id)a4
{
  id v6;
  NSXPCConnection *xpcConnection;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63___ATXInspectionClient_getModeTimelineDataFromStartDate_reply___block_invoke;
  v11[3] = &unk_1E82DD268;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getModeTimelineDataFromStartDate:reply:", v9, v8);

}

- (void)appLaunchInformationWithReply:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54___ATXInspectionClient_appLaunchInformationWithReply___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appLaunchInformationWithReply:", v6);

}

- (void)categoryLaunchInformationWithReply:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59___ATXInspectionClient_categoryLaunchInformationWithReply___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "categoryLaunchInformationWithReply:", v6);

}

- (void)appLaunchDatesWithReply:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48___ATXInspectionClient_appLaunchDatesWithReply___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appLaunchDatesWithReply:", v6);

}

- (void)refreshBlendingLayer:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45___ATXInspectionClient_refreshBlendingLayer___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "refreshBlendingLayer:", v6);

}

- (void)promoteSuggestionsFromClientModel:(id)a3 reply:(id)a4
{
  id v6;
  NSXPCConnection *xpcConnection;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64___ATXInspectionClient_promoteSuggestionsFromClientModel_reply___block_invoke;
  v11[3] = &unk_1E82DD268;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "promoteSuggestionsFromClientModel:reply:", v9, v8);

}

- (void)donateSuggestion:(id)a3 forClientModel:(int64_t)a4 withReply:(id)a5
{
  id v8;
  NSXPCConnection *xpcConnection;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  xpcConnection = self->_xpcConnection;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66___ATXInspectionClient_donateSuggestion_forClientModel_withReply___block_invoke;
  v13[3] = &unk_1E82DD268;
  v14 = v8;
  v10 = v8;
  v11 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "donateSuggestion:forClientModel:withReply:", v11, a4, v10);

}

- (void)clearBlendingSuggestionsForClientModel:(int64_t)a3 withReply:(id)a4
{
  id v6;
  NSXPCConnection *xpcConnection;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  xpcConnection = self->_xpcConnection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73___ATXInspectionClient_clearBlendingSuggestionsForClientModel_withReply___block_invoke;
  v10[3] = &unk_1E82DD268;
  v11 = v6;
  v8 = v6;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clearBlendingSuggestionsForClientModel:withReply:", a3, v8);

}

- (void)blendedSuggestionsForConsumerSubType:(unsigned __int8)a3 reply:(id)a4
{
  uint64_t v4;
  id v6;
  NSXPCConnection *xpcConnection;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v6 = a4;
  xpcConnection = self->_xpcConnection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67___ATXInspectionClient_blendedSuggestionsForConsumerSubType_reply___block_invoke;
  v10[3] = &unk_1E82DD268;
  v11 = v6;
  v8 = v6;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "blendedSuggestionsForConsumerSubType:reply:", v4, v8);

}

- (void)buildAnchorModelTrainingDataset:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56___ATXInspectionClient_buildAnchorModelTrainingDataset___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buildAnchorModelTrainingDataset:", v6);

}

- (void)trainAnchorModel:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41___ATXInspectionClient_trainAnchorModel___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trainAnchorModel:", v6);

}

- (void)scheduledPredictionsForAnchorModelWithReply:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68___ATXInspectionClient_scheduledPredictionsForAnchorModelWithReply___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scheduledPredictionsForAnchorModelWithReply:", v6);

}

- (void)validPredictionsRightNowForAnchorModelWithReply:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72___ATXInspectionClient_validPredictionsRightNowForAnchorModelWithReply___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "validPredictionsRightNowForAnchorModelWithReply:", v6);

}

- (void)schedulePredictionsForAnchorModel:(id)a3 anchorType:(id)a4 reply:(id)a5
{
  id v8;
  NSXPCConnection *xpcConnection;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  xpcConnection = self->_xpcConnection;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75___ATXInspectionClient_schedulePredictionsForAnchorModel_anchorType_reply___block_invoke;
  v14[3] = &unk_1E82DD268;
  v15 = v8;
  v10 = v8;
  v11 = a4;
  v12 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "schedulePredictionsForAnchorModel:anchorType:reply:", v12, v11, v10);

}

- (void)processLockscreenFeedbackWithReply:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59___ATXInspectionClient_processLockscreenFeedbackWithReply___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processLockscreenFeedbackWithReply:", v6);

}

- (void)processHomeScreenFeedbackWithReply:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59___ATXInspectionClient_processHomeScreenFeedbackWithReply___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processHomeScreenFeedbackWithReply:", v6);

}

- (void)processSpotlightAppFeedbackWithReply:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61___ATXInspectionClient_processSpotlightAppFeedbackWithReply___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processSpotlightAppFeedbackWithReply:", v6);

}

- (void)processSpotlightActionFeedbackWithReply:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64___ATXInspectionClient_processSpotlightActionFeedbackWithReply___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processSpotlightActionFeedbackWithReply:", v6);

}

- (void)processAppDirectoryFeedbackWithReply:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61___ATXInspectionClient_processAppDirectoryFeedbackWithReply___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processAppDirectoryFeedbackWithReply:", v6);

}

- (void)performHomeScreenCoreAnalyticsDryRunWithCustomStartDate:(id)a3 reply:(id)a4
{
  id v6;
  NSXPCConnection *xpcConnection;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86___ATXInspectionClient_performHomeScreenCoreAnalyticsDryRunWithCustomStartDate_reply___block_invoke;
  v11[3] = &unk_1E82DD268;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "performHomeScreenCoreAnalyticsDryRunWithCustomStartDate:reply:", v9, v8);

}

- (void)nPlusOneStudyDryRunResultFilterByExtensionBundleId:(id)a3 reply:(id)a4
{
  id v6;
  NSXPCConnection *xpcConnection;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81___ATXInspectionClient_nPlusOneStudyDryRunResultFilterByExtensionBundleId_reply___block_invoke;
  v11[3] = &unk_1E82DD268;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nPlusOneStudyDryRunResultFilterByExtensionBundleId:reply:", v9, v8);

}

- (void)trainModeEntityModelsWithDeferTrainingWhenApplicable:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSXPCConnection *xpcConnection;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v6 = a4;
  xpcConnection = self->_xpcConnection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83___ATXInspectionClient_trainModeEntityModelsWithDeferTrainingWhenApplicable_reply___block_invoke;
  v10[3] = &unk_1E82DD268;
  v11 = v6;
  v8 = v6;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trainModeEntityModelsWithDeferTrainingWhenApplicable:reply:", v4, v8);

}

- (void)trainModeSetupPredictionModelWithReply:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63___ATXInspectionClient_trainModeSetupPredictionModelWithReply___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trainModeSetupPredictionModelWithReply:", v6);

}

- (void)inspectInferredActivitySessionStream:(id)a3 fromTimestamp:(double)a4 reply:(id)a5
{
  id v8;
  NSXPCConnection *xpcConnection;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  xpcConnection = self->_xpcConnection;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81___ATXInspectionClient_inspectInferredActivitySessionStream_fromTimestamp_reply___block_invoke;
  v13[3] = &unk_1E82DD268;
  v14 = v8;
  v10 = v8;
  v11 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inspectInferredActivitySessionStream:fromTimestamp:reply:", v11, v10, a4);

}

- (void)inspectInferredActivityTransitionStream:(id)a3 fromTimestamp:(double)a4 reply:(id)a5
{
  id v8;
  NSXPCConnection *xpcConnection;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  xpcConnection = self->_xpcConnection;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84___ATXInspectionClient_inspectInferredActivityTransitionStream_fromTimestamp_reply___block_invoke;
  v13[3] = &unk_1E82DD268;
  v14 = v8;
  v10 = v8;
  v11 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inspectInferredActivityTransitionStream:fromTimestamp:reply:", v11, v10, a4);

}

- (void)forceNotificationAndSuggestionDbUpdate:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63___ATXInspectionClient_forceNotificationAndSuggestionDbUpdate___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "forceNotificationAndSuggestionDbUpdate:", v6);

}

- (void)generateSerializedNotificationDigestFromFileData:(id)a3 digestTimeString:(id)a4 reply:(id)a5
{
  id v8;
  NSXPCConnection *xpcConnection;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  xpcConnection = self->_xpcConnection;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __96___ATXInspectionClient_generateSerializedNotificationDigestFromFileData_digestTimeString_reply___block_invoke;
  v14[3] = &unk_1E82DD268;
  v15 = v8;
  v10 = v8;
  v11 = a4;
  v12 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "generateSerializedNotificationDigestFromFileData:digestTimeString:reply:", v12, v11, v10);

}

- (void)generateSerializedNotificationDigestFromSource:(id)a3 digestTimeString:(id)a4 startDate:(id)a5 endDate:(id)a6 inferMessages:(BOOL)a7 reply:(id)a8
{
  _BOOL8 v8;
  id v14;
  NSXPCConnection *xpcConnection;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v8 = a7;
  v14 = a8;
  xpcConnection = self->_xpcConnection;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __126___ATXInspectionClient_generateSerializedNotificationDigestFromSource_digestTimeString_startDate_endDate_inferMessages_reply___block_invoke;
  v22[3] = &unk_1E82DD268;
  v23 = v14;
  v16 = v14;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "generateSerializedNotificationDigestFromSource:digestTimeString:startDate:endDate:inferMessages:reply:", v20, v19, v18, v17, v8, v16);

}

- (void)generateSerializedAppGroupedNotificationDigestFromSource:(id)a3 digestTimeString:(id)a4 startDate:(id)a5 endDate:(id)a6 inferMessages:(BOOL)a7 reply:(id)a8
{
  _BOOL8 v8;
  id v14;
  NSXPCConnection *xpcConnection;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v8 = a7;
  v14 = a8;
  xpcConnection = self->_xpcConnection;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __136___ATXInspectionClient_generateSerializedAppGroupedNotificationDigestFromSource_digestTimeString_startDate_endDate_inferMessages_reply___block_invoke;
  v22[3] = &unk_1E82DD268;
  v23 = v14;
  v16 = v14;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "generateSerializedAppGroupedNotificationDigestFromSource:digestTimeString:startDate:endDate:inferMessages:reply:", v20, v19, v18, v17, v8, v16);

}

- (void)generateSerializedMissedNotificationBundleFromFileData:(id)a3 modeString:(id)a4 reply:(id)a5
{
  id v8;
  NSXPCConnection *xpcConnection;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  xpcConnection = self->_xpcConnection;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __96___ATXInspectionClient_generateSerializedMissedNotificationBundleFromFileData_modeString_reply___block_invoke;
  v14[3] = &unk_1E82DD268;
  v15 = v8;
  v10 = v8;
  v11 = a4;
  v12 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "generateSerializedMissedNotificationBundleFromFileData:modeString:reply:", v12, v11, v10);

}

- (void)generateSerializedMissedNotificationBundleFromSource:(id)a3 modeString:(id)a4 startDate:(id)a5 endDate:(id)a6 inferMessages:(BOOL)a7 reply:(id)a8
{
  _BOOL8 v8;
  id v14;
  NSXPCConnection *xpcConnection;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v8 = a7;
  v14 = a8;
  xpcConnection = self->_xpcConnection;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __126___ATXInspectionClient_generateSerializedMissedNotificationBundleFromSource_modeString_startDate_endDate_inferMessages_reply___block_invoke;
  v22[3] = &unk_1E82DD268;
  v23 = v14;
  v16 = v14;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "generateSerializedMissedNotificationBundleFromSource:modeString:startDate:endDate:inferMessages:reply:", v20, v19, v18, v17, v8, v16);

}

- (void)dumpNotificationJSONFromSource:(id)a3 startDate:(id)a4 endDate:(id)a5 inferMessages:(BOOL)a6 reply:(id)a7
{
  _BOOL8 v7;
  id v12;
  NSXPCConnection *xpcConnection;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v7 = a6;
  v12 = a7;
  xpcConnection = self->_xpcConnection;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __93___ATXInspectionClient_dumpNotificationJSONFromSource_startDate_endDate_inferMessages_reply___block_invoke;
  v19[3] = &unk_1E82DD268;
  v20 = v12;
  v14 = v12;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dumpNotificationJSONFromSource:startDate:endDate:inferMessages:reply:", v17, v16, v15, v7, v14);

}

- (void)clearNotificationsWithReply:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52___ATXInspectionClient_clearNotificationsWithReply___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearNotificationsWithReply:", v6);

}

- (void)showDigestFeedbackHistogramForBundleId:(id)a3 withReply:(id)a4
{
  id v6;
  NSXPCConnection *xpcConnection;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73___ATXInspectionClient_showDigestFeedbackHistogramForBundleId_withReply___block_invoke;
  v11[3] = &unk_1E82DD268;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "showDigestFeedbackHistogramForBundleId:withReply:", v9, v8);

}

- (void)addToDigestFeedbackHistogramForBundleId:(id)a3 location:(id)a4 feedback:(id)a5 withReply:(id)a6
{
  id v10;
  NSXPCConnection *xpcConnection;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  xpcConnection = self->_xpcConnection;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __92___ATXInspectionClient_addToDigestFeedbackHistogramForBundleId_location_feedback_withReply___block_invoke;
  v17[3] = &unk_1E82DD268;
  v18 = v10;
  v12 = v10;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addToDigestFeedbackHistogramForBundleId:location:feedback:withReply:", v15, v14, v13, v12);

}

- (void)setDigestFeedbackHistogramValueForBundleId:(id)a3 location:(id)a4 feedback:(id)a5 value:(id)a6 withReply:(id)a7
{
  id v12;
  NSXPCConnection *xpcConnection;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  v12 = a7;
  xpcConnection = self->_xpcConnection;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __101___ATXInspectionClient_setDigestFeedbackHistogramValueForBundleId_location_feedback_value_withReply___block_invoke;
  v20[3] = &unk_1E82DD268;
  v21 = v12;
  v14 = v12;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDigestFeedbackHistogramValueForBundleId:location:feedback:value:withReply:", v18, v17, v16, v15, v14);

}

- (void)clearDigestFeedbackHistogramWithShouldResetBookmarks:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSXPCConnection *xpcConnection;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v6 = a4;
  xpcConnection = self->_xpcConnection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83___ATXInspectionClient_clearDigestFeedbackHistogramWithShouldResetBookmarks_reply___block_invoke;
  v10[3] = &unk_1E82DD268;
  v11 = v6;
  v8 = v6;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clearDigestFeedbackHistogramWithShouldResetBookmarks:reply:", v4, v8);

}

- (void)getCurrentLocationWithReply:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52___ATXInspectionClient_getCurrentLocationWithReply___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getCurrentLocationWithReply:", v6);

}

- (void)generateDataForStressTestWithReply:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59___ATXInspectionClient_generateDataForStressTestWithReply___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "generateDataForStressTestWithReply:", v6);

}

- (void)clearAllDataForStressTestWithReply:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59___ATXInspectionClient_clearAllDataForStressTestWithReply___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearAllDataForStressTestWithReply:", v6);

}

- (void)fetchPosterDescriptorsWithReply:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56___ATXInspectionClient_fetchPosterDescriptorsWithReply___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchPosterDescriptorsWithReply:", v6);

}

- (void)logNotificationMetrics:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47___ATXInspectionClient_logNotificationMetrics___block_invoke;
  v8[3] = &unk_1E82DD268;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logNotificationMetrics:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
