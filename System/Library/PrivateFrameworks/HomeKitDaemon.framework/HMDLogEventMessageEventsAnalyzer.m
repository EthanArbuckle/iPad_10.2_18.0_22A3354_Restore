@implementation HMDLogEventMessageEventsAnalyzer

- (void)_handleXPCMessageCounterLogEvent:(id)a3
{
  id v4;
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "type");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", CFSTR("XPCAcceptedRequests")) & 1) != 0)
  {
    v6 = CFSTR("HMDLogEventXPCAcceptedMessagesCountDailyRequestGroup");
LABEL_5:

LABEL_6:
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "peerInformation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@/%@"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDLogEventMessageEventsAnalyzer eventCountersManager](self, "eventCountersManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "count");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "incrementEventCounterForEventName:requestGroup:withValue:", v10, v6, objc_msgSend(v12, "unsignedIntegerValue"));

    goto LABEL_7;
  }
  if (objc_msgSend(v5, "isEqual:", CFSTR("XPCSentNotifications")))
  {
    v6 = CFSTR("HMDLogEventXPCSentMessagesCountDailyRequestGroup");
    goto LABEL_5;
  }
  v13 = objc_msgSend(v5, "isEqual:", CFSTR("XPCDroppedRequests"));
  v14 = v13;
  if (v13)
    v6 = CFSTR("HMDLogEventXPCAErroredMessagesCountDailyRequestGroup");
  else
    v6 = 0;

  if ((v14 & 1) != 0)
    goto LABEL_6;
  v15 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v17;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Unknown XPC message counter type - dropping the LogEvent %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
LABEL_7:

}

- (HMDEventCountersManager)eventCountersManager
{
  return self->_eventCountersManager;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDLogEventMessageEventsAnalyzer *v9;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__HMDLogEventMessageEventsAnalyzer_didReceiveEventFromDispatcher___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)resetAggregationAnalysisContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HMDLogEventMessageEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetEventCountersForRequestGroup:", CFSTR("HMDLogEventXPCAcceptedMessagesCountDailyRequestGroup"));

  -[HMDLogEventMessageEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetEventCountersForRequestGroup:", CFSTR("HMDLogEventXPCSentMessagesCountDailyRequestGroup"));

  -[HMDLogEventMessageEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetEventCountersForRequestGroup:", CFSTR("HMDLogEventXPCAErroredMessagesCountDailyRequestGroup"));

  -[HMDLogEventMessageEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetEventCountersForRequestGroup:", CFSTR("HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup"));

  -[HMDLogEventMessageEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetEventCountersForRequestGroup:", CFSTR("HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup"));

  -[HMDLogEventMessageEventsAnalyzer residentSyncGroup](self, "residentSyncGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resetEventCounters");

  -[HMDLogEventMessageEventsAnalyzer homeManagerMessagesGroup](self, "homeManagerMessagesGroup");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resetEventCounters");

}

- (HMDLogEventMessageEventsAnalyzer)initWithDataSource:(id)a3
{
  id v4;
  HMDLogEventMessageEventsAnalyzer *v5;
  uint64_t v6;
  HMDEventCountersManager *eventCountersManager;
  uint64_t v8;
  HMMLogEventSubmitting *logEventSubmitter;
  uint64_t v10;
  NSUserDefaults *userDefaults;
  void *v12;
  uint64_t v13;
  OS_dispatch_queue *workQueue;
  uint64_t v15;
  HMDEventCounterGroup *residentSyncGroup;
  uint64_t v17;
  HMDEventCounterGroup *homeManagerMessagesGroup;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HMDLogEventMessageEventsAnalyzer;
  v5 = -[HMDLogEventMessageEventsAnalyzer init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "legacyCountersManager");
    v6 = objc_claimAutoreleasedReturnValue();
    eventCountersManager = v5->_eventCountersManager;
    v5->_eventCountersManager = (HMDEventCountersManager *)v6;

    objc_msgSend(v4, "logEventSubmitter");
    v8 = objc_claimAutoreleasedReturnValue();
    logEventSubmitter = v5->_logEventSubmitter;
    v5->_logEventSubmitter = (HMMLogEventSubmitting *)v8;

    objc_msgSend(v4, "userDefaults");
    v10 = objc_claimAutoreleasedReturnValue();
    userDefaults = v5->_userDefaults;
    v5->_userDefaults = (NSUserDefaults *)v10;

    objc_msgSend(v4, "logEventDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clientQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v13;

    -[HMDEventCountersManager counterGroupForName:](v5->_eventCountersManager, "counterGroupForName:", CFSTR("HMDLogEventResidentSyncRemoteMessagesRequestGroup"));
    v15 = objc_claimAutoreleasedReturnValue();
    residentSyncGroup = v5->_residentSyncGroup;
    v5->_residentSyncGroup = (HMDEventCounterGroup *)v15;

    -[HMDEventCountersManager counterGroupForName:](v5->_eventCountersManager, "counterGroupForName:", CFSTR("HMDMessageEventsAnalyzerHomeManagerMessagesRequestGroup"));
    v17 = objc_claimAutoreleasedReturnValue();
    homeManagerMessagesGroup = v5->_homeManagerMessagesGroup;
    v5->_homeManagerMessagesGroup = (HMDEventCounterGroup *)v17;

    objc_msgSend(v4, "logEventDispatcher");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    v24[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:forEventClasses:", v5, v20);

    objc_msgSend(v4, "notificationCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v5, sel_handlePrimaryResidentChangedNotification_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), 0);

  }
  return v5;
}

- (void)submitXPCMessageCountersForGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id obj;
  HMDLogEventMessageEventsAnalyzer *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDLogEventMessageEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "counterGroupForName:", CFSTR("HMDLogEventMessageAnalyzerCommon"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fetchEventCounterForEventName:", CFSTR("PrimaryResidentDuration"));

  v24 = self;
  -[HMDLogEventMessageEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchEventCountersForRequestGroup:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v25 = v9;
  objc_msgSend(v9, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = (double)v7;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("/"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "hmf_numberForKey:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "isEqualToString:", CFSTR("HMDLogEventXPCAcceptedMessagesCountDailyRequestGroup")))
        {
          +[HMDAggregateXPCMessageCountersLogEvent xpcAcceptedCountersLogEventWithPeerInformation:messageName:primaryResidentDuration:count:](HMDAggregateXPCMessageCountersLogEvent, "xpcAcceptedCountersLogEventWithPeerInformation:messageName:primaryResidentDuration:count:", v17, v18, v19, v12);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = 0;
        }
        if (objc_msgSend(v4, "isEqualToString:", CFSTR("HMDLogEventXPCSentMessagesCountDailyRequestGroup")))
        {
          +[HMDAggregateXPCMessageCountersLogEvent xpcSentCountersLogEventWithPeerInformation:messageName:primaryResidentDuration:count:](HMDAggregateXPCMessageCountersLogEvent, "xpcSentCountersLogEventWithPeerInformation:messageName:primaryResidentDuration:count:", v17, v18, v19, v12);
          v21 = objc_claimAutoreleasedReturnValue();

          v20 = (void *)v21;
        }
        if (v20)
        {
          -[HMDLogEventMessageEventsAnalyzer logEventSubmitter](v24, "logEventSubmitter");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "submitLogEvent:", v20);

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v11);
  }

}

- (id)transportTypeStringForRemoteMessageCounterRequestGroup:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HMDLogEventMessageAnalyzerTxIDSMessagesCountPeriodicRequestGroup")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("HMDLogEventMessageAnalyzerRxIDSMessagesCountPeriodicRequestGroup")) & 1) != 0)
  {
    v4 = CFSTR("IDS");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HMDLogEventMessageAnalyzerTxIDSProxyMessagesCountPeriodicRequestGroup")) & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", CFSTR("HMDLogEventMessageAnalyzerRxIDSProxyMessagesCountPeriodicRequestGroup")) & 1) != 0)
  {
    v4 = CFSTR("IDSProxy");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HMDLogEventMessageAnalyzerTxLoxyMessagesCountPeriodicRequestGroup")) & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", CFSTR("HMDLogEventMessageAnalyzerRxLoxyMessagesCountPeriodicRequestGroup")) & 1) != 0)
  {
    v4 = CFSTR("Loxy");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HMDLogEventMessageAnalyzerTxRapportMessagesCountPeriodicRequestGroup")) & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", CFSTR("HMDLogEventMessageAnalyzerRxRapportMessagesCountPeriodicRequestGroup")) & 1) != 0)
  {
    v4 = CFSTR("Rapport");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HMDLogEventMessageAnalyzerTxSecureMessagesCountPeriodicRequestGroup")) & 1) != 0|| objc_msgSend(v3, "isEqualToString:", CFSTR("HMDLogEventMessageAnalyzerRxSecureMessagesCountPeriodicRequestGroup")))
  {
    v4 = CFSTR("Secure");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

- (id)messageDirectionStringForRemoteMessageCounterRequestGroup:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HMDLogEventMessageAnalyzerTxIDSMessagesCountPeriodicRequestGroup")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("HMDLogEventMessageAnalyzerTxIDSProxyMessagesCountPeriodicRequestGroup")) & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", CFSTR("HMDLogEventMessageAnalyzerTxLoxyMessagesCountPeriodicRequestGroup")) & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", CFSTR("HMDLogEventMessageAnalyzerTxRapportMessagesCountPeriodicRequestGroup")) & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", CFSTR("HMDLogEventMessageAnalyzerTxSecureMessagesCountPeriodicRequestGroup")) & 1) != 0)
  {
    v4 = CFSTR("Sent");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HMDLogEventMessageAnalyzerRxIDSMessagesCountPeriodicRequestGroup")) & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", CFSTR("HMDLogEventMessageAnalyzerRxIDSProxyMessagesCountPeriodicRequestGroup")) & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", CFSTR("HMDLogEventMessageAnalyzerRxLoxyMessagesCountPeriodicRequestGroup")) & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", CFSTR("HMDLogEventMessageAnalyzerRxRapportMessagesCountPeriodicRequestGroup")) & 1) != 0|| objc_msgSend(v3, "isEqualToString:", CFSTR("HMDLogEventMessageAnalyzerRxSecureMessagesCountPeriodicRequestGroup")))
  {
    v4 = CFSTR("Received");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

- (void)submitRemoteMessageCountersForGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  HMDLogEventMessageEventsAnalyzer *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  uint64_t v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDLogEventMessageEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "counterGroupForName:", CFSTR("HMDLogEventMessageAnalyzerCommon"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fetchEventCounterForEventName:", CFSTR("PrimaryResidentDuration"));

  -[HMDLogEventMessageEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchEventCountersForRequestGroup:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v9, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v26)
  {
    v10 = (double)v7;
    v11 = *(_QWORD *)v30;
    v24 = v9;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("/"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDLogEventMessageEventsAnalyzer transportTypeStringForRemoteMessageCounterRequestGroup:](self, "transportTypeStringForRemoteMessageCounterRequestGroup:", v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDLogEventMessageEventsAnalyzer messageDirectionStringForRemoteMessageCounterRequestGroup:](self, "messageDirectionStringForRemoteMessageCounterRequestGroup:", v4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "hmf_numberForKey:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 && v16)
        {
          +[HMDAggregateRemoteMessageCountersLogEvent aggregateRemoteCountersLogEventWithMessageName:deviceType:transportType:direction:primaryResidentDuration:count:](HMDAggregateRemoteMessageCountersLogEvent, "aggregateRemoteCountersLogEventWithMessageName:deviceType:transportType:direction:primaryResidentDuration:count:", v27, v28, v15, v16, v17, v10);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDLogEventMessageEventsAnalyzer logEventSubmitter](self, "logEventSubmitter");
          v19 = v11;
          v20 = self;
          v21 = v4;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "submitLogEvent:", v18);

          v4 = v21;
          self = v20;
          v11 = v19;

          v9 = v24;
        }

      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v26);
  }

  -[HMDLogEventMessageEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "resetEventCountersForRequestGroup:", v4);

}

- (void)submitXPCMessageCounters
{
  -[HMDLogEventMessageEventsAnalyzer submitXPCMessageCountersForGroup:](self, "submitXPCMessageCountersForGroup:", CFSTR("HMDLogEventXPCAcceptedMessagesCountDailyRequestGroup"));
  -[HMDLogEventMessageEventsAnalyzer submitXPCMessageCountersForGroup:](self, "submitXPCMessageCountersForGroup:", CFSTR("HMDLogEventXPCSentMessagesCountDailyRequestGroup"));
  -[HMDLogEventMessageEventsAnalyzer submitXPCMessageCountersForGroup:](self, "submitXPCMessageCountersForGroup:", CFSTR("HMDLogEventXPCAErroredMessagesCountDailyRequestGroup"));
}

- (void)submitRemoteMessageCounters
{
  -[HMDLogEventMessageEventsAnalyzer submitRemoteMessageCountersForGroup:](self, "submitRemoteMessageCountersForGroup:", CFSTR("HMDLogEventMessageAnalyzerRxIDSMessagesCountPeriodicRequestGroup"));
  -[HMDLogEventMessageEventsAnalyzer submitRemoteMessageCountersForGroup:](self, "submitRemoteMessageCountersForGroup:", CFSTR("HMDLogEventMessageAnalyzerTxIDSMessagesCountPeriodicRequestGroup"));
  -[HMDLogEventMessageEventsAnalyzer submitRemoteMessageCountersForGroup:](self, "submitRemoteMessageCountersForGroup:", CFSTR("HMDLogEventMessageAnalyzerRxIDSProxyMessagesCountPeriodicRequestGroup"));
  -[HMDLogEventMessageEventsAnalyzer submitRemoteMessageCountersForGroup:](self, "submitRemoteMessageCountersForGroup:", CFSTR("HMDLogEventMessageAnalyzerTxIDSProxyMessagesCountPeriodicRequestGroup"));
  -[HMDLogEventMessageEventsAnalyzer submitRemoteMessageCountersForGroup:](self, "submitRemoteMessageCountersForGroup:", CFSTR("HMDLogEventMessageAnalyzerRxLoxyMessagesCountPeriodicRequestGroup"));
  -[HMDLogEventMessageEventsAnalyzer submitRemoteMessageCountersForGroup:](self, "submitRemoteMessageCountersForGroup:", CFSTR("HMDLogEventMessageAnalyzerTxLoxyMessagesCountPeriodicRequestGroup"));
  -[HMDLogEventMessageEventsAnalyzer submitRemoteMessageCountersForGroup:](self, "submitRemoteMessageCountersForGroup:", CFSTR("HMDLogEventMessageAnalyzerRxRapportMessagesCountPeriodicRequestGroup"));
  -[HMDLogEventMessageEventsAnalyzer submitRemoteMessageCountersForGroup:](self, "submitRemoteMessageCountersForGroup:", CFSTR("HMDLogEventMessageAnalyzerTxRapportMessagesCountPeriodicRequestGroup"));
  -[HMDLogEventMessageEventsAnalyzer submitRemoteMessageCountersForGroup:](self, "submitRemoteMessageCountersForGroup:", CFSTR("HMDLogEventMessageAnalyzerRxSecureMessagesCountPeriodicRequestGroup"));
  -[HMDLogEventMessageEventsAnalyzer submitRemoteMessageCountersForGroup:](self, "submitRemoteMessageCountersForGroup:", CFSTR("HMDLogEventMessageAnalyzerTxSecureMessagesCountPeriodicRequestGroup"));
}

- (id)periodicRemoteMessageCounterEventNameWithMessageName:(id)a3 peerInformation:(id)a4
{
  __CFString *v5;
  __CFString *v6;

  v5 = (__CFString *)a4;
  v6 = v5;
  if (a3)
  {
    if (!v5)
      v6 = CFSTR("Unknown");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), v6, a3);
    a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return a3;
}

- (void)_handleRemoteMessageLogEvent:(id)a3
{
  id v4;
  void *v5;
  HMDLogEventMessageEventsAnalyzer *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  unsigned int v13;
  __CFString *v14;
  __CFString *v15;
  unint64_t v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  __CFString *v35;
  __int16 v36;
  __CFString *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "secure");
    v10 = &stru_24E79DB48;
    if (v9)
      v10 = CFSTR("secure ");
    v25 = v10;
    objc_msgSend(v4, "msgName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "sending"))
      v12 = CFSTR("sent");
    else
      v12 = CFSTR("received");
    v13 = objc_msgSend(v4, "transportType");
    if (v13 > 6)
      v14 = 0;
    else
      v14 = off_24E79B0E0[v13];
    v15 = v14;
    v16 = objc_msgSend(v4, "msgType");
    if (v16 > 3)
      v17 = 0;
    else
      v17 = off_24E79B130[v16];
    v18 = v17;
    objc_msgSend(v4, "msgQoS");
    HMFQualityOfServiceToString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v27 = v8;
    v28 = 2114;
    v29 = v25;
    v30 = 2114;
    v31 = v11;
    v32 = 2114;
    v33 = v12;
    v34 = 2114;
    v35 = v15;
    v36 = 2114;
    v37 = v18;
    v38 = 2114;
    v39 = v19;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@[CA] HMDRemoteMessageLogEvent -- %{public}@message %{public}@ %{public}@ over %{public}@ as %{public}@ (QoS: %{public}@)", buf, 0x48u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDLogEventMessageEventsAnalyzer _updateDailySubmissionGroupRemoteMessageEventCountersForTransportType:messageDirectionSending:](v6, "_updateDailySubmissionGroupRemoteMessageEventCountersForTransportType:messageDirectionSending:", objc_msgSend(v4, "transportType"), objc_msgSend(v4, "sending"));
  objc_msgSend(v4, "msgName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peerInformation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v4, "transportType");
  v23 = objc_msgSend(v4, "sending");
  objc_msgSend(v4, "msgIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLogEventMessageEventsAnalyzer _updatePeriodicSubmissionGroupRemoteMessageEventCountersForMessageName:peerInformation:transportType:messageDirectionSending:identifier:](v6, "_updatePeriodicSubmissionGroupRemoteMessageEventCountersForMessageName:peerInformation:transportType:messageDirectionSending:identifier:", v20, v21, v22, v23, v24);

  -[HMDLogEventMessageEventsAnalyzer _updateResidentSyncCountersWithRemoteMessageLogEvent:](v6, "_updateResidentSyncCountersWithRemoteMessageLogEvent:", v4);
}

- (void)_updateDailySubmissionGroupRemoteMessageEventCountersForTransportType:(int)a3 messageDirectionSending:(BOOL)a4
{
  int v4;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  id v9;

  v4 = a3 - 1;
  if ((a3 - 1) <= 5 && ((0x2Fu >> v4) & 1) != 0)
  {
    v6 = off_24E778F98[v4];
    v7 = CFSTR("HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup");
    if (a4)
      v7 = CFSTR("HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup");
    v8 = v7;
    -[HMDLogEventMessageEventsAnalyzer eventCountersManager](self, "eventCountersManager");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "incrementEventCounterForEventName:requestGroup:", v6, v8);

  }
}

- (void)_updatePeriodicSubmissionGroupRemoteMessageEventCountersForMessageName:(id)a3 peerInformation:(id)a4 transportType:(int)a5 messageDirectionSending:(BOOL)a6 identifier:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  const __CFString *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v8 = a6;
  v30 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  switch(a5)
  {
    case 1:
      v15 = CFSTR("HMDLogEventMessageAnalyzerRxSecureMessagesCountPeriodicRequestGroup");
      v16 = CFSTR("HMDLogEventMessageAnalyzerTxSecureMessagesCountPeriodicRequestGroup");
      goto LABEL_10;
    case 2:
      v15 = CFSTR("HMDLogEventMessageAnalyzerRxIDSMessagesCountPeriodicRequestGroup");
      v16 = CFSTR("HMDLogEventMessageAnalyzerTxIDSMessagesCountPeriodicRequestGroup");
      goto LABEL_10;
    case 3:
      v15 = CFSTR("HMDLogEventMessageAnalyzerRxLoxyMessagesCountPeriodicRequestGroup");
      v16 = CFSTR("HMDLogEventMessageAnalyzerTxLoxyMessagesCountPeriodicRequestGroup");
      goto LABEL_10;
    case 4:
      v15 = CFSTR("HMDLogEventMessageAnalyzerRxIDSProxyMessagesCountPeriodicRequestGroup");
      v16 = CFSTR("HMDLogEventMessageAnalyzerTxIDSProxyMessagesCountPeriodicRequestGroup");
      goto LABEL_10;
    case 6:
      v15 = CFSTR("HMDLogEventMessageAnalyzerRxRapportMessagesCountPeriodicRequestGroup");
      v16 = CFSTR("HMDLogEventMessageAnalyzerTxRapportMessagesCountPeriodicRequestGroup");
LABEL_10:
      if (v8)
        v15 = (__CFString *)v16;
      v20 = v15;
      -[HMDLogEventMessageEventsAnalyzer periodicRemoteMessageCounterEventNameWithMessageName:peerInformation:](self, "periodicRemoteMessageCounterEventNameWithMessageName:peerInformation:", v12, v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        -[HMDLogEventMessageEventsAnalyzer eventCountersManager](self, "eventCountersManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "incrementEventCounterForEventName:requestGroup:", v21, v20);

      }
      else
      {
        v23 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 138543618;
          v27 = v25;
          v28 = 2112;
          v29 = v14;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Unable to retrieve eventName for remoteMessage - dropping remote message log event with identifier %@", (uint8_t *)&v26, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
      }

      break;
    default:
      v17 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v19;
        v28 = 2112;
        v29 = v14;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Invalid transport type - dropping remote message log event with identifier %@", (uint8_t *)&v26, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      break;
  }

}

- (void)_updateResidentSyncCountersWithRemoteMessageLogEvent:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "sending"))
  {
    objc_msgSend(v11, "msgName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("HMDHomeDataChangedMessage"));

    if (v5)
    {
      -[HMDLogEventMessageEventsAnalyzer residentSyncGroup](self, "residentSyncGroup");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("HMDLogEventResidentSyncHomeDataChangedNotificationCounter");
LABEL_6:
      objc_msgSend(v6, "incrementEventCounterForEventName:", v8);

      goto LABEL_7;
    }
    objc_msgSend(v11, "msgName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("HMDFetchHomeDataMessage"));

    if (v10)
    {
      -[HMDLogEventMessageEventsAnalyzer residentSyncGroup](self, "residentSyncGroup");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("HMDLogEventResidentSyncFetchHomeDataRequestCounter");
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)handlePrimaryResidentChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  HMDLogEventMessageEventsAnalyzer *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMDResidentDeviceManagerResidentDeviceNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    -[HMDLogEventMessageEventsAnalyzer eventCountersManager](self, "eventCountersManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "counterGroupForName:", CFSTR("HMDLogEventMessageAnalyzerCommon"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "isCurrentDevice"))
      objc_msgSend(v10, "resumeDurationCounter:", CFSTR("PrimaryResidentDuration"));
    else
      objc_msgSend(v10, "pauseDurationCounter:", CFSTR("PrimaryResidentDuration"));

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly received update primary resident notification but the primary resident is nil", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;

  v6 = a4;
  v7 = a3;
  -[HMDLogEventMessageEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "counterGroupForName:", CFSTR("HMDLogEventXPCAcceptedMessagesCountDailyRequestGroup"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAcceptedXPCRequestsCount:", objc_msgSend(v9, "summedEventCountersForDate:", v6));

  -[HMDLogEventMessageEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "counterGroupForName:", CFSTR("HMDLogEventXPCSentMessagesCountDailyRequestGroup"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSentXPCNotificationsCount:", objc_msgSend(v11, "summedEventCountersForDate:", v6));

  -[HMDLogEventMessageEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "counterGroupForName:", CFSTR("HMDLogEventXPCAErroredMessagesCountDailyRequestGroup"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setErroredXPCRequestsCount:", objc_msgSend(v13, "summedEventCountersForDate:", v6));

  -[HMDLogEventMessageEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "counterGroupForName:", CFSTR("HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup"));
  v22 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDLogEventMessageEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "counterGroupForName:", CFSTR("HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setRxIDSMessagesCount:", objc_msgSend(v22, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSEventCounter"), v6));
  objc_msgSend(v7, "setTxIDSMessagesCount:", objc_msgSend(v16, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSEventCounter"), v6));
  objc_msgSend(v7, "setRxIDSProxyMessagesCount:", objc_msgSend(v22, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSProxyEventCounter"), v6));
  objc_msgSend(v7, "setTxIDSProxyMessagesCount:", objc_msgSend(v16, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeIDSProxyEventCounter"), v6));
  objc_msgSend(v7, "setRxLoxyMessagesCount:", objc_msgSend(v22, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeLoxyEventCounter"), v6));
  objc_msgSend(v7, "setTxLoxyMessagesCount:", objc_msgSend(v16, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeLoxyEventCounter"), v6));
  objc_msgSend(v7, "setRxRapportMessagesCount:", objc_msgSend(v22, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeRapportEventCounter"), v6));
  objc_msgSend(v7, "setTxRapportMessagesCount:", objc_msgSend(v16, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeRapportEventCounter"), v6));
  objc_msgSend(v7, "setRxSecureMessagesCount:", objc_msgSend(v22, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeSecureEventCounter"), v6));
  objc_msgSend(v7, "setTxSecureMessagesCount:", objc_msgSend(v16, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventMessageAnalyzerRemoteMessageTransportTypeSecureEventCounter"), v6));
  objc_msgSend(v7, "setRemoteMessagesSentCount:", objc_msgSend(v7, "txIDSProxyMessagesCount")+ objc_msgSend(v7, "txIDSMessagesCount")+ objc_msgSend(v7, "txRapportMessagesCount")+ objc_msgSend(v7, "txLoxyMessagesCount"));
  objc_msgSend(v7, "setRemoteMessagesReceivedCount:", objc_msgSend(v7, "rxLoxyMessagesCount")+ objc_msgSend(v7, "rxIDSMessagesCount")+ objc_msgSend(v7, "rxIDSProxyMessagesCount")+ objc_msgSend(v7, "rxRapportMessagesCount")+ objc_msgSend(v7, "rxSecureMessagesCount"));
  -[HMDLogEventMessageEventsAnalyzer residentSyncGroup](self, "residentSyncGroup");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setResidentSyncHomeDataChangedNotificationCount:", objc_msgSend(v17, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventResidentSyncHomeDataChangedNotificationCounter"), v6));

  -[HMDLogEventMessageEventsAnalyzer residentSyncGroup](self, "residentSyncGroup");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setResidentSyncFetchHomeDataRequestCount:", objc_msgSend(v18, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventResidentSyncFetchHomeDataRequestCounter"), v6));

  -[HMDLogEventMessageEventsAnalyzer homeManagerMessagesGroup](self, "homeManagerMessagesGroup");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGenerationCounterIncrementCount:", objc_msgSend(v19, "fetchEventCounterForEventName:forDate:", CFSTR("HMDMessageEventsAnalyzerHomeManagerIncrementGenerationCounterEvent"), v6));

  -[HMDLogEventMessageEventsAnalyzer homeManagerMessagesGroup](self, "homeManagerMessagesGroup");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "fetchEventCounterForEventName:forDate:", CFSTR("HMDMessageEventsAnalyzerHomeManagerNotifyXPCClientsEvent"), v6);

  objc_msgSend(v7, "setNotifyXPCClientsHomeDataChangedCount:", v21);
}

- (void)submitDailyMessageEvents
{
  -[HMDLogEventMessageEventsAnalyzer submitRemoteMessageCounters](self, "submitRemoteMessageCounters");
  -[HMDLogEventMessageEventsAnalyzer submitXPCMessageCounters](self, "submitXPCMessageCounters");
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDEventCounterGroup)residentSyncGroup
{
  return self->_residentSyncGroup;
}

- (HMDEventCounterGroup)homeManagerMessagesGroup
{
  return self->_homeManagerMessagesGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeManagerMessagesGroup, 0);
  objc_storeStrong((id *)&self->_residentSyncGroup, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_eventCountersManager, 0);
}

void __66__HMDLogEventMessageEventsAnalyzer_didReceiveEventFromDispatcher___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v2 = *(id *)(a1 + 32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v14 = v3;

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 40), "_handleRemoteMessageLogEvent:", v14);
  }
  else
  {
    v4 = *(id *)(a1 + 32);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "_handleXPCMessageCounterLogEvent:", v6);
    }
    else
    {
      v7 = *(id *)(a1 + 32);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
      v9 = v8;

      if (v9)
      {
        objc_msgSend(*(id *)(a1 + 40), "homeManagerMessagesGroup");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "incrementEventCounterForEventName:", CFSTR("HMDMessageEventsAnalyzerHomeManagerIncrementGenerationCounterEvent"));
      }
      else
      {
        v11 = *(id *)(a1 + 32);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
        v10 = v12;

        if (v10)
        {
          objc_msgSend(*(id *)(a1 + 40), "homeManagerMessagesGroup");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "incrementEventCounterForEventName:", CFSTR("HMDMessageEventsAnalyzerHomeManagerNotifyXPCClientsEvent"));

        }
      }

    }
  }

}

+ (id)managedEventCounterRequestGroups
{
  _QWORD v3[18];

  v3[17] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("HMDLogEventMessageAnalyzerRxIDSMessagesCountPeriodicRequestGroup");
  v3[1] = CFSTR("HMDLogEventMessageAnalyzerTxIDSMessagesCountPeriodicRequestGroup");
  v3[2] = CFSTR("HMDLogEventMessageAnalyzerRxIDSProxyMessagesCountPeriodicRequestGroup");
  v3[3] = CFSTR("HMDLogEventMessageAnalyzerTxIDSProxyMessagesCountPeriodicRequestGroup");
  v3[4] = CFSTR("HMDLogEventMessageAnalyzerRxLoxyMessagesCountPeriodicRequestGroup");
  v3[5] = CFSTR("HMDLogEventMessageAnalyzerTxLoxyMessagesCountPeriodicRequestGroup");
  v3[6] = CFSTR("HMDLogEventMessageAnalyzerRxRapportMessagesCountPeriodicRequestGroup");
  v3[7] = CFSTR("HMDLogEventMessageAnalyzerTxRapportMessagesCountPeriodicRequestGroup");
  v3[8] = CFSTR("HMDLogEventMessageAnalyzerRxSecureMessagesCountPeriodicRequestGroup");
  v3[9] = CFSTR("HMDLogEventMessageAnalyzerTxSecureMessagesCountPeriodicRequestGroup");
  v3[10] = CFSTR("HMDLogEventXPCAcceptedMessagesCountDailyRequestGroup");
  v3[11] = CFSTR("HMDLogEventXPCSentMessagesCountDailyRequestGroup");
  v3[12] = CFSTR("HMDLogEventXPCAErroredMessagesCountDailyRequestGroup");
  v3[13] = CFSTR("HMDLogEventMessageAnalyzerRemoteMessageSentDailyRequestGroup");
  v3[14] = CFSTR("HMDLogEventMessageAnalyzerRemoteMessageReceivedDailyRequestGroup");
  v3[15] = CFSTR("HMDLogEventResidentSyncRemoteMessagesRequestGroup");
  v3[16] = CFSTR("HMDMessageEventsAnalyzerHomeManagerMessagesRequestGroup");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 17);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
