@implementation HMDLogEventHAPMetricsEventAnalyzer

- (HMDLogEventHAPMetricsEventAnalyzer)initWithEventCountersManager:(id)a3
{
  id v5;
  HMDLogEventHAPMetricsEventAnalyzer *v6;
  HMDLogEventHAPMetricsEventAnalyzer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDLogEventHAPMetricsEventAnalyzer;
  v6 = -[HMDLogEventHAPMetricsEventAnalyzer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_eventCountersManager, a3);

  return v7;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v13;
  else
    v4 = 0;
  v5 = v4;
  if (v5)
  {
    -[HMDLogEventHAPMetricsEventAnalyzer eventCountersManager](self, "eventCountersManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "incrementEventCounterForEventName:requestGroup:withValue:", CFSTR("HMDLogEventHAPMetricsEventAnalyzerHAPIPInvalidationCounter"), CFSTR("HMDLogEventHAPMetricsRequestGroup"), objc_msgSend(v5, "accessoryServerInvalidations"));

    -[HMDLogEventHAPMetricsEventAnalyzer eventCountersManager](self, "eventCountersManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "incrementEventCounterForEventName:requestGroup:withValue:", CFSTR("HMDLogEventHAPMetricsEventAnalyzerHAPIPSentHTTPMessagesCounter"), CFSTR("HMDLogEventHAPMetricsRequestGroup"), objc_msgSend(v5, "sentHTTPRequests"));

    -[HMDLogEventHAPMetricsEventAnalyzer eventCountersManager](self, "eventCountersManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "incrementEventCounterForEventName:requestGroup:withValue:", CFSTR("HMDLogEventHAPMetricsEventAnalyzerHAPIPReceivedHTTPMessagesCounter"), CFSTR("HMDLogEventHAPMetricsRequestGroup"), objc_msgSend(v5, "receivedHTTPResponses"));

    -[HMDLogEventHAPMetricsEventAnalyzer eventCountersManager](self, "eventCountersManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "incrementEventCounterForEventName:requestGroup:withValue:", CFSTR("HMDLogEventHAPMetricsEventAnalyzerHAPIPReceivedHTTPEventsCounter"), CFSTR("HMDLogEventHAPMetricsRequestGroup"), objc_msgSend(v5, "receivedHTTPEvents"));

    -[HMDLogEventHAPMetricsEventAnalyzer eventCountersManager](self, "eventCountersManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "incrementEventCounterForEventName:requestGroup:withValue:", CFSTR("HMDLogEventHAPMetricsEventAnalyzerHAPBTLEConnectionsCounter"), CFSTR("HMDLogEventHAPMetricsRequestGroup"), objc_msgSend(v5, "btleConnections"));

    -[HMDLogEventHAPMetricsEventAnalyzer eventCountersManager](self, "eventCountersManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "incrementEventCounterForEventName:requestGroup:withValue:", CFSTR("HMDLogEventHAPMetricsEventAnalyzerHAPBTLEDiscoveryCounter"), CFSTR("HMDLogEventHAPMetricsRequestGroup"), objc_msgSend(v5, "btleDiscoveries"));

    -[HMDLogEventHAPMetricsEventAnalyzer eventCountersManager](self, "eventCountersManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "incrementEventCounterForEventName:requestGroup:withValue:", CFSTR("HMDLogEventHAPMetricsEventAnalyzerHAPBTLEConnectionPerReasonCounter"), CFSTR("HMDLogEventHAPMetricsRequestGroup"), objc_msgSend(v5, "btleConnectionPerReasons"));

  }
}

- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[HMDLogEventHAPMetricsEventAnalyzer eventCountersManager](self, "eventCountersManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "counterGroupForName:", CFSTR("HMDLogEventHAPMetricsRequestGroup"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setHapIPSentHTTPRequestsCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventHAPMetricsEventAnalyzerHAPIPSentHTTPMessagesCounter"), v6));
  objc_msgSend(v7, "setHapIPReceivedHTTPResponsesCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventHAPMetricsEventAnalyzerHAPIPReceivedHTTPMessagesCounter"), v6));
  objc_msgSend(v7, "setHapIPInvalidationCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventHAPMetricsEventAnalyzerHAPIPInvalidationCounter"), v6));
  objc_msgSend(v7, "setHapIPReceivedHTTPEventCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventHAPMetricsEventAnalyzerHAPIPReceivedHTTPEventsCounter"), v6));
  objc_msgSend(v7, "setHapBTLEConnectionsCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventHAPMetricsEventAnalyzerHAPBTLEConnectionsCounter"), v6));
  objc_msgSend(v7, "setHapBTLEDiscoveriesCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventHAPMetricsEventAnalyzerHAPBTLEDiscoveryCounter"), v6));
  v9 = objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventHAPMetricsEventAnalyzerHAPBTLEConnectionPerReasonCounter"), v6);

  objc_msgSend(v7, "setHapBTLEConnectionPerReasonsCount:", v9);
}

- (void)resetAggregationAnalysisContext
{
  id v2;

  -[HMDLogEventHAPMetricsEventAnalyzer eventCountersManager](self, "eventCountersManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetEventCountersForRequestGroup:", CFSTR("HMDLogEventHAPMetricsRequestGroup"));

}

- (HMDEventCountersManager)eventCountersManager
{
  return (HMDEventCountersManager *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventCountersManager, 0);
}

+ (id)managedEventCounterRequestGroups
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("HMDLogEventHAPMetricsRequestGroup");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
