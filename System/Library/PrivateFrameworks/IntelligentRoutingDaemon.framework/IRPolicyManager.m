@implementation IRPolicyManager

- (int64_t)mode
{
  return self->_mode;
}

- (IRSystemStateManager)systemStateManager
{
  return self->_systemStateManager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IRStatisticsManager)statisticsManager
{
  return self->_statisticsManager;
}

- (IRServiceDO)service
{
  return self->_service;
}

- (IRPolicyEngine)policyEngine
{
  return self->_policyEngine;
}

- (IRCandidateManager)candidateManager
{
  return self->_candidateManager;
}

- (void)setUpdateMode:(int64_t)a3
{
  NSObject *v5;

  -[IRPolicyManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[IRPolicyManager setMode:](self, "setMode:", a3);
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (void)run
{
  NSObject *v3;

  -[IRPolicyManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[IRPolicyManager didUpdateContextWithReason:andOverrides:](self, "didUpdateContextWithReason:andOverrides:", CFSTR("Run"), 0);
}

- (IRReplayWriter)replayWriter
{
  return self->_replayWriter;
}

- (IRHistoryManager)historyManager
{
  return self->_historyManager;
}

- (IRPolicyManagerDelegate)delegate
{
  return (IRPolicyManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (IRPolicyManager)initWithService:(id)a3 queue:(id)a4 delegate:(id)a5 avOutputDeviceProvider:(id)a6 biomeProvider:(id)a7 miloProvider:(id)a8 rapportProvider:(id)a9 proximityProvider:(id)a10 serviceStore:(id)a11 displayMonitor:(id)a12 audioAVOutputContextController:(id)a13 isLowLatencyMiLo:(BOOL)a14
{
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  IRPolicyManager *v28;
  IRPolicyManager *v29;
  id v30;
  IRPolicyEngine *v31;
  IRReplayWriter *v32;
  IRCandidateManager *v33;
  void *v34;
  IRCandidateManager *v35;
  IRStatisticsManager *v36;
  IRHistoryManager *v37;
  IRSystemStateManager *v38;
  void *v39;
  IRSystemStateManager *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  IRSessionAnalytics *v49;
  IRSessionAnalytics *v50;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  id v58;
  id v59;
  id v60;
  id v61;
  NSObject *v62;
  objc_super v63;

  v59 = a3;
  v19 = a4;
  v20 = a5;
  v60 = a6;
  v61 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = v21;
  v26 = a12;
  v27 = a13;
  v62 = v19;
  dispatch_assert_queue_V2(v19);
  v63.receiver = self;
  v63.super_class = (Class)IRPolicyManager;
  v28 = -[IRPolicyManager init](&v63, sel_init);
  v29 = v28;
  if (v28)
  {
    -[IRPolicyManager setQueue:](v28, "setQueue:", v19);
    v58 = v20;
    -[IRPolicyManager setDelegate:](v29, "setDelegate:", v20);
    -[IRPolicyManager setService:](v29, "setService:", v59);
    v30 = v26;
    v31 = -[IRPolicyEngine initWithServicePackage:]([IRPolicyEngine alloc], "initWithServicePackage:", objc_msgSend(v59, "servicePackage"));
    -[IRPolicyManager setPolicyEngine:](v29, "setPolicyEngine:", v31);

    v32 = -[IRReplayWriter initWithServiceStore:]([IRReplayWriter alloc], "initWithServiceStore:", v24);
    -[IRPolicyManager setReplayWriter:](v29, "setReplayWriter:", v32);

    v33 = [IRCandidateManager alloc];
    -[IRPolicyManager queue](v29, "queue");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[IRCandidateManager initWithQueue:contextObserver:avOutputDeviceProvider:rapportDeviceProvider:store:](v33, "initWithQueue:contextObserver:avOutputDeviceProvider:rapportDeviceProvider:store:", v34, v29, v60, v22, v24);
    -[IRPolicyManager setCandidateManager:](v29, "setCandidateManager:", v35);

    v36 = -[IRStatisticsManager initWithStore:]([IRStatisticsManager alloc], "initWithStore:", v24);
    -[IRPolicyManager setStatisticsManager:](v29, "setStatisticsManager:", v36);

    -[IRPolicyManager setIsLowLatencyMiLo:](v29, "setIsLowLatencyMiLo:", a14);
    v37 = -[IRHistoryManager initWithStore:miloFeedback:]([IRHistoryManager alloc], "initWithStore:miloFeedback:", v24, v25);
    -[IRPolicyManager setHistoryManager:](v29, "setHistoryManager:", v37);

    v38 = [IRSystemStateManager alloc];
    -[IRPolicyManager queue](v29, "queue");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v52) = -[IRPolicyManager isLowLatencyMiLo](v29, "isLowLatencyMiLo");
    v54 = v27;
    v55 = v30;
    v56 = v23;
    v40 = -[IRSystemStateManager initWithQueue:contextObserver:biomeProvider:miloProvider:proximityProvider:serviceStore:displayMonitor:audioAVOutputContextController:isLowLatencyMiLo:](v38, "initWithQueue:contextObserver:biomeProvider:miloProvider:proximityProvider:serviceStore:displayMonitor:audioAVOutputContextController:isLowLatencyMiLo:", v39, v29, v61, v25, v23, v24, v30, v27, v52);
    -[IRPolicyManager setSystemStateManager:](v29, "setSystemStateManager:", v40);

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRPolicyManager setSpotOnPendingClientIDs:](v29, "setSpotOnPendingClientIDs:", v41);

    +[IRPreferences shared](IRPreferences, "shared");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "coreAnalyticsSessionEnable");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v43, "BOOLValue"))
    {
LABEL_7:
      v27 = v54;
      v26 = v55;

      v20 = v58;
      v23 = v56;
      goto LABEL_8;
    }
    v53 = v25;
    -[IRPolicyManager service](v29, "service");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "clientIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v45, "isEqual:", CFSTR("com.apple.mediaremoted")) & 1) != 0)
    {

      v25 = v53;
LABEL_6:
      v49 = [IRSessionAnalytics alloc];
      -[IRPolicyManager queue](v29, "queue");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[IRPolicyManager service](v29, "service");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = -[IRSessionAnalytics initWithQueue:service:](v49, "initWithQueue:service:", v42, v43);
      -[IRPolicyManager setSessionAnalytics:](v29, "setSessionAnalytics:", v50);

      goto LABEL_7;
    }
    -[IRPolicyManager service](v29, "service");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "clientIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "isEqual:", CFSTR("com.apple.intelligentroutingclient.Media"));

    v20 = v58;
    v25 = v53;
    v27 = v54;
    v26 = v55;
    v23 = v56;
    if ((v48 & 1) != 0)
      goto LABEL_6;
  }
LABEL_8:

  return v29;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)IRPolicyManager;
  -[IRPolicyManager dealloc](&v2, sel_dealloc);
}

- (void)deallocSync
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;

  -[IRPolicyManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[IRPolicyManager candidateManager](self, "candidateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deallocSync");

  -[IRPolicyManager systemStateManager](self, "systemStateManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deallocSync");

  -[IRPolicyManager replayWriter](self, "replayWriter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deallocSync");

}

- (id)requestCurrentContextWithBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[IRPolicyManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[IRPolicyManager _createContextOverrdiesForBundleIDIfNeeded:](self, "_createContextOverrdiesForBundleIDIfNeeded:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IRPolicyManager didUpdateContextWithReason:andOverrides:](self, "didUpdateContextWithReason:andOverrides:", CFSTR("Request current context"), v6);
  -[IRPolicyManager policyEngine](self, "policyEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contexts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)updateCandidates:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[IRPolicyManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[IRPolicyManager candidateManager](self, "candidateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRPolicyManager historyManager](self, "historyManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "historyEventsContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateCandidates:withHistoryEventsContainer:", v4, v8);

  -[IRPolicyManager historyManager](self, "historyManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "historyEventsContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRPolicyManager _checkAndStartLowLatencyMiLoIfNeededWithForce:historyEventsContainer:](self, "_checkAndStartLowLatencyMiLoIfNeededWithForce:historyEventsContainer:", 0, v9);

}

- (void)deleteCandidate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[IRPolicyManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[IRPolicyManager candidateManager](self, "candidateManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteCandidate:", v4);

}

- (void)addEvent:(id)a3 forCandidateIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  const void **v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[IRPolicyManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[IRPolicyManager candidateManager](self, "candidateManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "candidatesContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "candidateForCandidateIdentifier:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (const void **)MEMORY[0x24BE5B328];
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)*MEMORY[0x24BE5B280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B280], OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    +[IRLogQEUtility getEventAsString:](IRLogQEUtility, "getEventAsString:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[IRLogQEUtility getCandidateAsString:](IRLogQEUtility, "getCandidateAsString:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v56 = "#policy-manager, ";
    v57 = 2112;
    v58 = v13;
    v59 = 2112;
    v60 = v16;
    v61 = 2112;
    v62 = v17;
    _os_log_impl(&dword_23FFBA000, v15, OS_LOG_TYPE_DEFAULT, "%s[%@], Adding event:\n %@\n for candidate:\n %@", buf, 0x2Au);

  }
  -[IRPolicyManager _sendSessionAnalyticsEvent:candidateIdentifier:](self, "_sendSessionAnalyticsEvent:candidateIdentifier:", v6, v7);
  -[IRPolicyManager policyEngine](self, "policyEngine");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRPolicyManager historyManager](self, "historyManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "historyEventsContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v18, "shouldRejectEvent:withHistoryEventsContainer:forCandidateIdentifier:", v6, v20, v7);

  if (v21)
  {
    dispatch_get_specific(*v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
    {
      v24 = (void *)MEMORY[0x24BDD16E0];
      v25 = v23;
      objc_msgSend(v24, "numberWithLongLong:", objc_msgSend(v6, "eventType"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v6, "eventSubType"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v56 = "#policy-manager, ";
      v57 = 2112;
      v58 = v22;
      v59 = 2112;
      v60 = v26;
      v61 = 2112;
      v62 = v27;
      v63 = 2112;
      v64 = v7;
      _os_log_impl(&dword_23FFBA000, v25, OS_LOG_TYPE_INFO, "%s[%@], Event rejected, type: %@, subtype: %@, for candidate: %@", buf, 0x34u);

    }
  }
  else
  {
    -[IRPolicyManager candidateManager](self, "candidateManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "notifyAddEventForCandidateIdentifier:", v7);

    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRPolicyManager systemStateManager](self, "systemStateManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "systemState");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[IRHistoryEventDO historyEventDOWithDate:candidateIdentifier:event:miloPredictionEvent:systemState:sharingPolicy:](IRHistoryEventDO, "historyEventDOWithDate:candidateIdentifier:event:miloPredictionEvent:systemState:sharingPolicy:", v29, v7, v6, 0, v31, 0);
    v51 = objc_claimAutoreleasedReturnValue();

    v54 = v51;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[IRHistoryEventsContainerDO historyEventsContainerDOWithHistoryEvents:](IRHistoryEventsContainerDO, "historyEventsContainerDOWithHistoryEvents:", v32);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    -[IRPolicyManager _checkAndStartLowLatencyMiLoIfNeededWithForce:historyEventsContainer:](self, "_checkAndStartLowLatencyMiLoIfNeededWithForce:historyEventsContainer:", 0, v50);
    -[IRPolicyManager historyManager](self, "historyManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRPolicyManager systemStateManager](self, "systemStateManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "systemState");
    v53 = v7;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRPolicyManager systemStateManager](self, "systemStateManager");
    v52 = v11;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "miloProviderLslPredictionResults");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addEvent:forCandidateIdentifier:withSystemState:andMiloPrediction:", v6, v53, v35, v37);

    -[IRPolicyManager _checkAndUpdateBundlesForEventIfNeeded:](self, "_checkAndUpdateBundlesForEventIfNeeded:", v6);
    -[IRPolicyManager policyEngine](self, "policyEngine");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "policyInspections");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    -[IRPolicyManager systemStateManager](self, "systemStateManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addEvent:forCandidate:", v6, v52);

    -[IRPolicyManager service](self, "service");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRPolicyManager systemStateManager](self, "systemStateManager");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRPolicyManager candidateManager](self, "candidateManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "candidatesContainer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRPolicyManager statisticsManager](self, "statisticsManager");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRPolicyManager historyManager](self, "historyManager");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "historyEventsContainer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    +[IRAnalyticsManager logUiEvent:withService:forCandidateIdentifier:systemStateManager:candidatesContainer:inspections:statisticsManager:historyEventsContainer:](IRAnalyticsManager, "logUiEvent:withService:forCandidateIdentifier:systemStateManager:candidatesContainer:inspections:statisticsManager:historyEventsContainer:", v6, v40, v53, v41, v43, v49, v44, v46);

    v11 = v52;
    v7 = v53;

    -[IRPolicyManager statisticsManager](self, "statisticsManager");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "event:forCandidate:inspections:date:", v6, v52, v49, v48);

    v22 = (void *)v51;
  }

}

- (void)setSpotOnLocationWithParameters:(id)a3 andClientID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const void **v9;
  void *v10;
  os_log_t *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  os_log_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  IRTimer *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  IRTimer *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[IRPolicyManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (const void **)MEMORY[0x24BE5B328];
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (os_log_t *)MEMORY[0x24BE5B270];
  v12 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v13 = (void *)MEMORY[0x24BDD16E0];
    v14 = v12;
    objc_msgSend(v13, "numberWithBool:", objc_msgSend(v6, "resetAllBrokerDiscoveredCandidates"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v40 = "#policy-manager, ";
    v41 = 2112;
    v42 = v10;
    v43 = 2112;
    v44 = v7;
    v45 = 2112;
    v46 = v15;
    _os_log_impl(&dword_23FFBA000, v14, OS_LOG_TYPE_INFO, "%s[%@], Set Spot On for clientId: %@, shouldResetBrokeredDevices: %@", buf, 0x2Au);

  }
  if (objc_msgSend(v6, "resetAllBrokerDiscoveredCandidates"))
  {
    -[IRPolicyManager candidateManager](self, "candidateManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "deleteBrokerCandidates");

  }
  -[IRPolicyManager spotOnPendingClientIDs](self, "spotOnPendingClientIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v7);

  -[IRPolicyManager spotOnPendingClientIDs](self, "spotOnPendingClientIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (unint64_t)objc_msgSend(v18, "count") > 1;

  if (v19)
  {
    dispatch_get_specific(*v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      v22 = v21;
      -[IRPolicyManager spotOnPendingClientIDs](self, "spotOnPendingClientIDs");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v40 = "#policy-manager, ";
      v41 = 2112;
      v42 = v20;
      v43 = 2112;
      v44 = v7;
      v45 = 2112;
      v46 = v23;
      _os_log_impl(&dword_23FFBA000, v22, OS_LOG_TYPE_INFO, "%s[%@], Set Spot On for clientId: %@, there is already a pending request for: %@", buf, 0x2Au);

    }
  }
  else
  {
    -[IRPolicyManager spotOnTimeout](self, "spotOnTimeout");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      dispatch_get_specific(*v9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v40 = "#policy-manager, ";
        v41 = 2112;
        v42 = v25;
        _os_log_impl(&dword_23FFBA000, v26, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - spot on timer conflict] Spot on timer retriggered while is still ongoing", buf, 0x16u);
      }

    }
    objc_initWeak((id *)buf, self);
    v27 = [IRTimer alloc];
    +[IRPreferences shared](IRPreferences, "shared");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "miloTimeoutForSetSpotOnRequestSeconds");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "integerValue");
    -[IRPolicyManager queue](self, "queue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __63__IRPolicyManager_setSpotOnLocationWithParameters_andClientID___block_invoke;
    v37[3] = &unk_251043FF8;
    objc_copyWeak(&v38, (id *)buf);
    v32 = -[IRTimer initWithInterval:repeats:queue:block:](v27, "initWithInterval:repeats:queue:block:", 0, v31, v37, (double)v30);
    -[IRPolicyManager setSpotOnTimeout:](self, "setSpotOnTimeout:", v32);

    -[IRPolicyManager historyManager](self, "historyManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "historyEventsContainer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRPolicyManager _checkAndStartLowLatencyMiLoIfNeededWithForce:historyEventsContainer:](self, "_checkAndStartLowLatencyMiLoIfNeededWithForce:historyEventsContainer:", 1, v34);

    -[IRPolicyManager systemStateManager](self, "systemStateManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "miloProvider");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setSpotOnLocation");

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);
  }

}

void __63__IRPolicyManager_setSpotOnLocationWithParameters_andClientID___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "#policy-manager, ";
      v14 = 2112;
      v15 = v2;
      _os_log_impl(&dword_23FFBA000, v3, OS_LOG_TYPE_INFO, "%s[%@], spot on milo request timeout, returning error", buf, 0x16u);
    }

    objc_msgSend(WeakRetained, "systemStateManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "miloProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resetSpotOnLocationRequest");

    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = *MEMORY[0x24BE5B268];
    v10 = *MEMORY[0x24BDD0FD8];
    v11 = CFSTR("timeout");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, -12898, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "didSpotOnLocationComplete:", v9);

  }
}

- (void)requestUpdatedBundlesWithSignificantInteraction
{
  -[IRPolicyManager _checkAndUpdateBundlesForEventIfNeeded:](self, "_checkAndUpdateBundlesForEventIfNeeded:", 0);
}

- (void)synchronizeAndFetchFromDBOnDisk
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[IRPolicyManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[IRPolicyManager candidateManager](self, "candidateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronizeAndFetchFromDBOnDisk");

  -[IRPolicyManager historyManager](self, "historyManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronizeAndFetchFromDBOnDisk");

  -[IRPolicyManager _checkAndUpdateBundlesForEventIfNeeded:](self, "_checkAndUpdateBundlesForEventIfNeeded:", 0);
}

- (id)getStatistics
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[IRPolicyManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[IRPolicyManager statisticsManager](self, "statisticsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statistics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)clearStatistics
{
  NSObject *v3;
  void *v4;
  id v5;

  -[IRPolicyManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[IRPolicyManager statisticsManager](self, "statisticsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearStatistics:", v4);

}

- (void)_checkAndStartLowLatencyMiLoIfNeededWithForce:(BOOL)a3 historyEventsContainer:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  const __CFString *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (!-[IRPolicyManager isLowLatencyMiLo](self, "isLowLatencyMiLo"))
  {
    if (a3)
      goto LABEL_4;
    -[IRPolicyManager policyEngine](self, "policyEngine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRPolicyManager candidateManager](self, "candidateManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "candidatesContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "shouldAskForLowLatencyMiLo:historyEventsContainer:", v9, v6);

    if (v10)
    {
LABEL_4:
      -[IRPolicyManager systemStateManager](self, "systemStateManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IRPolicyManager setIsLowLatencyMiLo:](self, "setIsLowLatencyMiLo:", objc_msgSend(v11, "startLowLatencyMiLo"));

      dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)*MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
      {
        v14 = v13;
        v15 = -[IRPolicyManager isLowLatencyMiLo](self, "isLowLatencyMiLo");
        v16 = CFSTR("No");
        v18 = "#policy-manager, ";
        v17 = 136315650;
        v19 = 2112;
        v20 = v12;
        if (v15)
          v16 = CFSTR("Yes");
        v21 = 2112;
        v22 = v16;
        _os_log_impl(&dword_23FFBA000, v14, OS_LOG_TYPE_INFO, "%s[%@], Low Latency MiLo started: %@", (uint8_t *)&v17, 0x20u);

      }
    }
  }

}

- (id)_createContextOverrdiesForBundleIDIfNeeded:(id)a3
{
  id v3;
  IRContextRequestOverrides *v4;

  if (a3)
  {
    v3 = a3;
    v4 = -[IRContextRequestOverrides initWithOverrideAppInFocusWindow:overrideBundleId:]([IRContextRequestOverrides alloc], "initWithOverrideAppInFocusWindow:overrideBundleId:", 1, v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_checkAndUpdateBundlesForEventIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    goto LABEL_3;
  -[IRPolicyManager policyEngine](self, "policyEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundlesWithSignificantInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __58__IRPolicyManager__checkAndUpdateBundlesForEventIfNeeded___block_invoke;
  v21[3] = &unk_2510446F8;
  v22 = v4;
  v7 = objc_msgSend(v6, "containsObjectPassingTest:", v21);

  if ((v7 & 1) == 0)
  {
LABEL_3:
    -[IRPolicyManager policyEngine](self, "policyEngine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRPolicyManager candidateManager](self, "candidateManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "candidatesContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRPolicyManager historyManager](self, "historyManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "historyEventsContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "updateBundlesWithSignificantInteractionForEvent:candidatesContainer:historyEventsContainer:", v4, v10, v12);

    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
    {
      v16 = CFSTR("NO");
      *(_DWORD *)buf = 136315650;
      v24 = "#policy-manager, ";
      v25 = 2112;
      v26 = v14;
      if (v13)
        v16 = CFSTR("YES");
      v27 = 2112;
      v28 = v16;
      _os_log_impl(&dword_23FFBA000, v15, OS_LOG_TYPE_INFO, "%s[%@], _checkAndUpdateBundlesForEventIfNeeded bundlesUpdated: %@", buf, 0x20u);
    }

    v17 = v13 ^ 1;
    if (!v4)
      v17 = 0;
    if ((v17 & 1) == 0)
    {
      -[IRPolicyManager delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[IRPolicyManager policyEngine](self, "policyEngine");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bundlesWithSignificantInteraction");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "policyManager:didUpdateBundlesWithSignificantInteractionPattern:", self, v20);

    }
  }

}

BOOL __58__IRPolicyManager__checkAndUpdateBundlesForEventIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 == v4;

  return v5;
}

- (void)_sendSessionAnalyticsEvent:(id)a3 candidateIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v6 = a3;
  if (objc_msgSend(v15, "isEqual:", CFSTR("Speaker")))
  {
    +[IRCandidateDO mediaRemoteSpeakerCandidate](IRCandidateDO, "mediaRemoteSpeakerCandidate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[IRPolicyManager candidateManager](self, "candidateManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "candidatesContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "candidateForCandidateIdentifier:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[IRPolicyManager sessionAnalytics](self, "sessionAnalytics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRPolicyManager systemStateManager](self, "systemStateManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "miloProviderLslPredictionResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRPolicyManager systemStateManager](self, "systemStateManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "systemState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "event:forCandidate:miloPrediction:systemState:", v6, v7, v12, v14);

}

- (void)didUpdateContextWithReason:(id)a3 andOverrides:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  _BYTE v65[10];
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[IRPolicyManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRPolicyManager systemStateManager](self, "systemStateManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "systemState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "overrideSystemStateIfNeeded:", v7);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  -[IRPolicyManager statisticsManager](self, "statisticsManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[IRPolicyManager mode](self, "mode");
  -[IRPolicyManager systemStateManager](self, "systemStateManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "miloProviderLslPredictionResults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contextChangedWithReason:mode:miloPrediction:date:", v6, v13, v15, v9);

  -[IRPolicyManager sessionAnalytics](self, "sessionAnalytics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRPolicyManager systemStateManager](self, "systemStateManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "systemState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contextChangedWithReason:systemState:", v6, v18);

  if (-[IRPolicyManager mode](self, "mode") != 1
    && (objc_msgSend(v6, "isEqual:", CFSTR("Request current context")) & 1) == 0)
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v61 = "#policy-manager, ";
      v62 = 2112;
      v63 = v53;
      v64 = 2112;
      *(_QWORD *)v65 = v6;
      _os_log_impl(&dword_23FFBA000, v54, OS_LOG_TYPE_INFO, "%s[%@], didUpdateContextWithReason was triggered with reason: %@, but service is not in updates mode", buf, 0x20u);
    }
    goto LABEL_18;
  }
  -[IRPolicyManager policyEngine](self, "policyEngine");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRPolicyManager candidateManager](self, "candidateManager");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "candidatesContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRPolicyManager historyManager](self, "historyManager");
  v58 = v6;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "historyEventsContainer");
  v22 = v9;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRPolicyManager systemStateManager](self, "systemStateManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "miloProviderLslPredictionResults");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRPolicyManager systemStateManager](self, "systemStateManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "nearbyDeviceContainer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v55) = 1;
  v57 = objc_msgSend(v19, "updateContextWithDate:candidatesContainer:historyEventsContainer:systemState:miloProviderLslPredictionResults:nearbyDeviceContainer:fillInspection:", v22, v20, v23, v59, v25, v27, v55);

  v9 = v22;
  v6 = v58;

  -[IRPolicyManager replayWriter](self, "replayWriter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRPolicyManager systemStateManager](self, "systemStateManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "miloProviderLslPredictionResults");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRPolicyManager candidateManager](self, "candidateManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "candidatesContainer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRPolicyManager systemStateManager](self, "systemStateManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "nearbyDeviceContainer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "writeReplayEventWithReason:SystemState:miloLslPrediction:candidatesContainerDO:nearbyDeviceContainerDO:date:", v58, v59, v30, v32, v34, v9);

  if ((v57 & 1) != 0 || objc_msgSend(v58, "isEqual:", CFSTR("Run")))
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
    {
      v37 = v36;
      -[IRPolicyManager policyEngine](self, "policyEngine");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "lastEventsString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v61 = "#policy-manager, ";
      v62 = 2112;
      v63 = v35;
      v64 = 2112;
      *(_QWORD *)v65 = v39;
      _os_log_impl(&dword_23FFBA000, v37, OS_LOG_TYPE_INFO, "%s[%@], %@", buf, 0x20u);

    }
    -[IRPolicyManager systemStateManager](self, "systemStateManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "logProviderState");

  }
  if ((objc_msgSend(v58, "isEqual:", CFSTR("Run")) & 1) != 0)
    v41 = 1;
  else
    v41 = v57 & ~objc_msgSend(v58, "isEqual:", CFSTR("Request current context"));
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v61 = "#policy-manager, ";
    v62 = 2112;
    v63 = v42;
    v64 = 1024;
    *(_DWORD *)v65 = v41;
    *(_WORD *)&v65[4] = 1024;
    *(_DWORD *)&v65[6] = v57;
    v66 = 2112;
    v67 = v58;
    _os_log_impl(&dword_23FFBA000, v43, OS_LOG_TYPE_INFO, "%s[%@], sendContextToClient: %d, context updated: %d, reason: %@", buf, 0x2Cu);
  }

  if (v41)
  {
    -[IRPolicyManager delegate](self, "delegate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRPolicyManager policyEngine](self, "policyEngine");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "contexts");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "policyManager:didUpdateContexts:withReason:", self, v46, v58);

    -[IRPolicyManager policyEngine](self, "policyEngine");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "contexts");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectForKeyedSubscript:", *MEMORY[0x24BE5B260]);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "candidateResults");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "firstWhere:", &__block_literal_global_8);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      -[IRPolicyManager systemStateManager](self, "systemStateManager");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "endAppInFocusWindow");

      -[IRPolicyManager statisticsManager](self, "statisticsManager");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "bannerContextWithDate:", v9);
LABEL_18:

    }
  }

}

BOOL __59__IRPolicyManager_didUpdateContextWithReason_andOverrides___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "classification") == 3 || objc_msgSend(v2, "classification") == 4;

  return v3;
}

- (void)didSpotOnLocationComplete:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IRPolicyManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v13 = 136315650;
    v14 = "#policy-manager, ";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_INFO, "%s[%@], got call for didSpotOnLocationComplete with error: %@, answering relevant clients and removing all spotOnPendingClients", (uint8_t *)&v13, 0x20u);
  }

  -[IRPolicyManager delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRPolicyManager spotOnPendingClientIDs](self, "spotOnPendingClientIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v8, "policyManager:didSpotOnLocationCompleteForClientIds:withError:", self, v10, v4);

  -[IRPolicyManager spotOnPendingClientIDs](self, "spotOnPendingClientIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  -[IRPolicyManager spotOnTimeout](self, "spotOnTimeout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "invalidate");

  -[IRPolicyManager setSpotOnTimeout:](self, "setSpotOnTimeout:", 0);
}

- (void)restartLowLatencyMiLo:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  -[IRPolicyManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[IRPolicyManager isLowLatencyMiLo](self, "isLowLatencyMiLo");
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x24BE5B270];
  v9 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO);
  if (v6 == v3)
  {
    if (v9)
    {
      v14 = (void *)MEMORY[0x24BDD16E0];
      v15 = v8;
      objc_msgSend(v14, "numberWithBool:", v3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136315650;
      v18 = "#policy-manager, ";
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_23FFBA000, v15, OS_LOG_TYPE_INFO, "%s[%@], restartLowLatencyMiLo: %@, nothing to do", (uint8_t *)&v17, 0x20u);

    }
  }
  else
  {
    if (v9)
    {
      v10 = (void *)MEMORY[0x24BDD16E0];
      v11 = v8;
      objc_msgSend(v10, "numberWithBool:", -[IRPolicyManager isLowLatencyMiLo](self, "isLowLatencyMiLo"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136315906;
      v18 = "#policy-manager, ";
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_23FFBA000, v11, OS_LOG_TYPE_INFO, "%s[%@], restartLowLatencyMiLo: prev %@, current %@", (uint8_t *)&v17, 0x2Au);

    }
    -[IRPolicyManager setIsLowLatencyMiLo:](self, "setIsLowLatencyMiLo:", v3);
    -[IRPolicyManager systemStateManager](self, "systemStateManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "restartLowLatencyMiLo:", v3);
  }

}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setCandidateManager:(id)a3
{
  objc_storeStrong((id *)&self->_candidateManager, a3);
}

- (void)setSystemStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_systemStateManager, a3);
}

- (void)setHistoryManager:(id)a3
{
  objc_storeStrong((id *)&self->_historyManager, a3);
}

- (void)setPolicyEngine:(id)a3
{
  objc_storeStrong((id *)&self->_policyEngine, a3);
}

- (void)setReplayWriter:(id)a3
{
  objc_storeStrong((id *)&self->_replayWriter, a3);
}

- (void)setStatisticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_statisticsManager, a3);
}

- (IRMediaRemoteProvider)saredLocalEndpointProvider
{
  return self->_saredLocalEndpointProvider;
}

- (void)setSaredLocalEndpointProvider:(id)a3
{
  objc_storeStrong((id *)&self->_saredLocalEndpointProvider, a3);
}

- (NSMutableSet)spotOnPendingClientIDs
{
  return self->_spotOnPendingClientIDs;
}

- (void)setSpotOnPendingClientIDs:(id)a3
{
  objc_storeStrong((id *)&self->_spotOnPendingClientIDs, a3);
}

- (IRTimer)spotOnTimeout
{
  return self->_spotOnTimeout;
}

- (void)setSpotOnTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_spotOnTimeout, a3);
}

- (BOOL)isLowLatencyMiLo
{
  return self->_isLowLatencyMiLo;
}

- (void)setIsLowLatencyMiLo:(BOOL)a3
{
  self->_isLowLatencyMiLo = a3;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (IRSessionAnalytics)sessionAnalytics
{
  return self->_sessionAnalytics;
}

- (void)setSessionAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_sessionAnalytics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionAnalytics, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_spotOnTimeout, 0);
  objc_storeStrong((id *)&self->_spotOnPendingClientIDs, 0);
  objc_storeStrong((id *)&self->_saredLocalEndpointProvider, 0);
  objc_storeStrong((id *)&self->_statisticsManager, 0);
  objc_storeStrong((id *)&self->_replayWriter, 0);
  objc_storeStrong((id *)&self->_policyEngine, 0);
  objc_storeStrong((id *)&self->_historyManager, 0);
  objc_storeStrong((id *)&self->_systemStateManager, 0);
  objc_storeStrong((id *)&self->_candidateManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
