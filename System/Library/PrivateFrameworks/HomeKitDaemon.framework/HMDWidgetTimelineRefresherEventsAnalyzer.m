@implementation HMDWidgetTimelineRefresherEventsAnalyzer

- (HMDWidgetTimelineRefresherEventsAnalyzer)initWithEventCountersManager:(id)a3 logEventSubmitter:(id)a4 dailyScheduler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HMDWidgetTimelineRefresherEventsAnalyzer *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[HMDWidgetFetchSpecification allHomeLockScreenWidgetKinds](HMDWidgetFetchSpecification, "allHomeLockScreenWidgetKinds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("com.apple.Home.widget.interactive");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[HMDWidgetTimelineRefresherEventsAnalyzer initWithEventCountersManager:logEventSubmitter:widgetKinds:dailyScheduler:](self, "initWithEventCountersManager:logEventSubmitter:widgetKinds:dailyScheduler:", v10, v9, v13, v8);
  return v14;
}

- (HMDWidgetTimelineRefresherEventsAnalyzer)initWithEventCountersManager:(id)a3 logEventSubmitter:(id)a4 widgetKinds:(id)a5 dailyScheduler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDWidgetTimelineRefresherEventsAnalyzer *v15;
  HMDWidgetTimelineRefresherEventsAnalyzer *v16;
  NSMutableDictionary *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  NSMutableDictionary *widgetRefreshReasonCounterGroupByKind;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v33.receiver = self;
  v33.super_class = (Class)HMDWidgetTimelineRefresherEventsAnalyzer;
  v15 = -[HMDWidgetTimelineRefresherEventsAnalyzer init](&v33, sel_init);
  v16 = v15;
  if (v15)
  {
    v28 = v12;
    objc_storeStrong((id *)&v15->_logEventSubmitter, a4);
    objc_storeStrong((id *)&v16->_eventCountersManager, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v27 = v13;
    v18 = v13;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v11, "counterGroupForName:", v23, v27);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v24, v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v20);
    }

    widgetRefreshReasonCounterGroupByKind = v16->_widgetRefreshReasonCounterGroupByKind;
    v16->_widgetRefreshReasonCounterGroupByKind = v17;

    objc_msgSend(v14, "registerDailyTaskRunner:", v16);
    v13 = v27;
    v12 = v28;
  }

  return v16;
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
  void *v13;
  id v14;

  v14 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v14;
  else
    v4 = 0;
  v5 = v4;
  if (v5)
  {
    -[HMDWidgetTimelineRefresherEventsAnalyzer widgetRefreshReasonCounterGroupByKind](self, "widgetRefreshReasonCounterGroupByKind");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "kind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[HMDWidgetTimelineRefresherEventsAnalyzer eventCountersManager](self, "eventCountersManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "kind");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "counterGroupForName:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDWidgetTimelineRefresherEventsAnalyzer widgetRefreshReasonCounterGroupByKind](self, "widgetRefreshReasonCounterGroupByKind");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "kind");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v12);

    }
    objc_msgSend(v5, "reason");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "incrementEventCounterForEventName:", v13);

  }
}

- (void)runDailyTask
{
  void *v3;
  _QWORD v4[5];

  -[HMDWidgetTimelineRefresherEventsAnalyzer widgetRefreshReasonCounterGroupByKind](self, "widgetRefreshReasonCounterGroupByKind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__HMDWidgetTimelineRefresherEventsAnalyzer_runDailyTask__block_invoke;
  v4[3] = &unk_24E77AE20;
  v4[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[HMDWidgetTimelineRefresherEventsAnalyzer widgetRefreshReasonCounterGroupByKind](self, "widgetRefreshReasonCounterGroupByKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __88__HMDWidgetTimelineRefresherEventsAnalyzer_populateAggregationAnalysisLogEvent_forDate___block_invoke;
  v13 = &unk_24E77AE48;
  v15 = &v16;
  v9 = v7;
  v14 = v9;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v10);

  objc_msgSend(v6, "setWidgetMaxRefreshCountForKind:", v17[3], v10, v11, v12, v13);
  _Block_object_dispose(&v16, 8);

}

- (void)resetAggregationAnalysisContext
{
  id v2;

  -[HMDWidgetTimelineRefresherEventsAnalyzer widgetRefreshReasonCounterGroupByKind](self, "widgetRefreshReasonCounterGroupByKind");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_39412);

}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (NSMutableDictionary)widgetRefreshReasonCounterGroupByKind
{
  return self->_widgetRefreshReasonCounterGroupByKind;
}

- (HMDEventCountersManager)eventCountersManager
{
  return self->_eventCountersManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventCountersManager, 0);
  objc_storeStrong((id *)&self->_widgetRefreshReasonCounterGroupByKind, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
}

uint64_t __75__HMDWidgetTimelineRefresherEventsAnalyzer_resetAggregationAnalysisContext__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "resetEventCounters");
}

unint64_t __88__HMDWidgetTimelineRefresherEventsAnalyzer_populateAggregationAnalysisLogEvent_forDate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4;
  unint64_t result;
  unint64_t v6;

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  result = objc_msgSend(a3, "summedEventCountersForDate:", *(_QWORD *)(a1 + 32));
  if (v4 <= result)
    v6 = result;
  else
    v6 = v4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  return result;
}

void __56__HMDWidgetTimelineRefresherEventsAnalyzer_runDailyTask__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a2;
  objc_msgSend(a3, "eventCounters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__HMDWidgetTimelineRefresherEventsAnalyzer_runDailyTask__block_invoke_2;
  v8[3] = &unk_24E77ADF8;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __56__HMDWidgetTimelineRefresherEventsAnalyzer_runDailyTask__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  HMDWidgetTimelineRefresherDailyTotalLogEvent *v8;
  uint64_t v9;
  unsigned int v10;
  HMDWidgetTimelineRefresherDailyTotalLogEvent *v11;
  id v12;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "logEventSubmitter");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v8 = [HMDWidgetTimelineRefresherDailyTotalLogEvent alloc];
  v9 = *(_QWORD *)(a1 + 40);
  v10 = objc_msgSend(v6, "unsignedIntValue");

  v11 = -[HMDWidgetTimelineRefresherDailyTotalLogEvent initWithKind:reason:count:](v8, "initWithKind:reason:count:", v9, v7, v10);
  objc_msgSend(v12, "submitLogEvent:", v11);

}

@end
