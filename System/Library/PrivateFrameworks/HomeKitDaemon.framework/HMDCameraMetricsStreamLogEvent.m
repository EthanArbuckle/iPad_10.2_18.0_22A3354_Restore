@implementation HMDCameraMetricsStreamLogEvent

- (HMDCameraMetricsStreamLogEvent)initWithSessionID:(id)a3 cameraAccessory:(id)a4 isLocal:(BOOL)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDCameraMetricsStreamLogEvent;
  return -[HMDCameraMetricsLogEvent initWithSessionID:cameraAccessory:isLocal:](&v6, sel_initWithSessionID_cameraAccessory_isLocal_, a3, a4, a5);
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.camera.stream");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[HMDCameraMetricsStreamLogEvent _milestonesSortedByTimestamp](self, "_milestonesSortedByTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraMetricsStreamLogEvent _addFirstToLastDurationFromMilestones:toEvent:](self, "_addFirstToLastDurationFromMilestones:toEvent:", v4, v3);
  -[HMDCameraMetricsStreamLogEvent _addStreamStartToFirstFrameDurationFromMilestones:toEvent:](self, "_addStreamStartToFirstFrameDurationFromMilestones:toEvent:", v4, v3);
  -[HMDCameraMetricsStreamLogEvent _addDurationsBetweenMilestones:toEvent:](self, "_addDurationsBetweenMilestones:toEvent:", v4, v3);
  -[HMDCameraMetricsStreamLogEvent _addInitialConfigurationMetricsToEvent:](self, "_addInitialConfigurationMetricsToEvent:", v3);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDCameraMetricsLogEvent isLocal](self, "isLocal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isLocal"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v6;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 4;
}

- (NSString)accessoryIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraMetricsLogEvent accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_milestonesSortedByTimestamp
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[HMDCameraMetricsLogEvent sessionID](self, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceMilestones");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__HMDCameraMetricsStreamLogEvent__milestonesSortedByTimestamp__block_invoke;
  v8[3] = &unk_24E796DA0;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

- (id)_durationBetweenMilestone1:(id)a3 andMilestone2:(id)a4 index:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _BOOL4 v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BDBD1B8];
  if (v8 && a4)
  {
    v11 = a4;
    v12 = -[HMDCameraMetricsLogEvent isLocal](self, "isLocal");
    v13 = CFSTR("Remote");
    if (v12)
      v13 = CFSTR("Local");
    v14 = (void *)MEMORY[0x24BDD17C8];
    v15 = v13;
    objc_msgSend(v8, "key");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "key");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v9)
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@_%@_%@_%@"), v15, v9, v16, v17);
    else
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@_%@_%@"), v15, v16, v17, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v11, "timestamp");
    v21 = objc_msgSend(v8, "timestamp");
    v25 = v19;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v20 - v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void)_addFirstToLastDurationFromMilestones:(id)a3 toEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "firstObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraMetricsStreamLogEvent _durationBetweenMilestone1:andMilestone2:index:](self, "_durationBetweenMilestone1:andMilestone2:index:", v10, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v9);

}

- (void)_addStreamStartToFirstFrameDurationFromMilestones:(id)a3 toEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HMDCameraMetricsMilestone *v15;
  HMDCameraMetricsMilestone *v16;
  void *v17;
  id v18;

  v18 = a4;
  -[HMDCameraMetricsLogEvent sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceMilestones");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ReceivedFirstFrame"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = -[HMDCameraMetricsLogEvent isLocal](self, "isLocal");
    v9 = CFSTR("SentStartRemoteStreamRequest");
    if (v8)
      v9 = CFSTR("SentStartResponse");
    v10 = v9;
    -[HMDCameraMetricsLogEvent sessionID](self, "sessionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deviceMilestones");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    v15 = -[HMDCameraMetricsMilestone initWithKey:timestamp:]([HMDCameraMetricsMilestone alloc], "initWithKey:timestamp:", v10, v14);
    v16 = -[HMDCameraMetricsMilestone initWithKey:timestamp:]([HMDCameraMetricsMilestone alloc], "initWithKey:timestamp:", CFSTR("ReceivedFirstFrame"), objc_msgSend(v7, "integerValue"));

    -[HMDCameraMetricsStreamLogEvent _durationBetweenMilestone1:andMilestone2:index:](self, "_durationBetweenMilestone1:andMilestone2:index:", v15, v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addEntriesFromDictionary:", v17);

  }
}

- (void)_addDurationsBetweenMilestones:(id)a3 toEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  HMDCameraMetricsStreamLogEvent *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__HMDCameraMetricsStreamLogEvent__addDurationsBetweenMilestones_toEvent___block_invoke;
  v10[3] = &unk_24E78A188;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v9, "enumerateObjectsWithOptions:usingBlock:", 2, v10);

}

- (void)_addInitialConfigurationMetricsToEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDCameraMetricsLogEvent sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceMilestones");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("InitialConfiguration"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addEntriesFromDictionary:", v7);
}

- (NSNumber)referenceTimestamp
{
  return self->_referenceTimestamp;
}

- (void)setReferenceTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_referenceTimestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceTimestamp, 0);
}

void __73__HMDCameraMetricsStreamLogEvent__addDurationsBetweenMilestones_toEvent___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (a3)
  {
    v6 = (void *)a1[4];
    v7 = a3 - 1;
    v8 = a2;
    objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v10 = (void *)a1[5];
    v9 = (void *)a1[6];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_durationBetweenMilestone1:andMilestone2:index:", v13, v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addEntriesFromDictionary:", v12);
  }
  else
  {
    *a4 = 1;
  }
}

void __62__HMDCameraMetricsStreamLogEvent__milestonesSortedByTimestamp__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  HMDCameraMetricsMilestone *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  if (v7)
  {
    v8 = -[HMDCameraMetricsMilestone initWithKey:timestamp:]([HMDCameraMetricsMilestone alloc], "initWithKey:timestamp:", v9, objc_msgSend(v7, "integerValue"));
    objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v8, objc_msgSend(*(id *)(a1 + 32), "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, objc_msgSend(*(id *)(a1 + 32), "count"), 1024, &__block_literal_global_154145));

  }
}

uint64_t __62__HMDCameraMetricsStreamLogEvent__milestonesSortedByTimestamp__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "timestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v5, "timestamp");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

@end
