@implementation HMDHouseholdMetricsRequestContributor

- (HMDHouseholdMetricsRequestContributor)initWithCountersManager:(id)a3 dateProvider:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDHouseholdMetricsRequestContributor;
  return -[HMDHouseholdActivityLogEventContributor initWithHouseholdGroupName:countersManager:dateProvider:](&v5, sel_initWithHouseholdGroupName_countersManager_dateProvider_, CFSTR("HouseholdMetricsClient"), a3, a4);
}

- (void)incrementRequestCountForHomeUUID:(id)a3 date:(id)a4
{
  id v4;

  -[HMDHouseholdActivityLogEventContributor householdGroupForHomeWithUUID:associatedWithDate:](self, "householdGroupForHomeWithUUID:associatedWithDate:", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "incrementEventCounterForEventName:", CFSTR("RequestCount"));

}

- (void)populateLogEvent:(id)a3 forHomeWithUUID:(id)a4 associatedToDate:(id)a5
{
  id v8;
  id v9;

  v8 = a3;
  -[HMDHouseholdActivityLogEventContributor householdGroupForHomeWithUUID:associatedWithDate:](self, "householdGroupForHomeWithUUID:associatedWithDate:", a4, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRequestCount:", objc_msgSend(v9, "fetchEventCounterForEventName:", CFSTR("RequestCount")));
  objc_msgSend(v8, "setActiveDeviceCount:", 1);

}

- (void)contributeLogEvent:(id)a3 toSerializedMetric:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v7, "requestCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("requestCountKey"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(v7, "activeDeviceCount");

  objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("activeDeviceCountKey"));

}

- (void)deserializeLogEvent:(id)a3 fromSerializedMetric:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;

  v5 = a4;
  v14 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("requestCountKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  objc_msgSend(v14, "setRequestCount:", v9);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("activeDeviceCountKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  v13 = objc_msgSend(v12, "unsignedIntegerValue");
  objc_msgSend(v14, "setActiveDeviceCount:", v13);

}

- (void)contributeLogEvent:(id)a3 toCoreAnalyticsEvent:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a4;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(a3, "activeDeviceCount"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("activeDeviceCountKey"));

}

- (void)coalesceLogEvent:(id)a3 fromSourceEvent:(id)a4
{
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setActiveDeviceCount:", objc_msgSend(v5, "activeDeviceCount") + objc_msgSend(a4, "activeDeviceCount"));

}

@end
