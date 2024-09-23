@implementation HMDWidgetTimelineRefresherDailyTotalLogEvent

- (HMDWidgetTimelineRefresherDailyTotalLogEvent)initWithKind:(id)a3 reason:(id)a4 count:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  HMDWidgetTimelineRefresherDailyTotalLogEvent *v11;
  uint64_t v12;
  NSString *kind;
  uint64_t v14;
  NSString *reason;
  HMDWidgetTimelineRefresherDailyTotalLogEvent *v17;
  SEL v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v10 = v9;
  if (!v9)
  {
LABEL_7:
    v17 = (HMDWidgetTimelineRefresherDailyTotalLogEvent *)_HMFPreconditionFailure();
    return (HMDWidgetTimelineRefresherDailyTotalLogEvent *)-[HMDWidgetTimelineRefresherDailyTotalLogEvent coreAnalyticsEventName](v17, v18);
  }
  v19.receiver = self;
  v19.super_class = (Class)HMDWidgetTimelineRefresherDailyTotalLogEvent;
  v11 = -[HMMLogEvent init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    kind = v11->_kind;
    v11->_kind = (NSString *)v12;

    v14 = objc_msgSend(v10, "copy");
    reason = v11->_reason;
    v11->_reason = (NSString *)v14;

    v11->_count = a5;
  }

  return v11;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.homed.daemon.widgetTimelineRefresherDailyTotal");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("widgetKind");
  -[HMDWidgetTimelineRefresherDailyTotalLogEvent kind](self, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("refreshReason");
  -[HMDWidgetTimelineRefresherDailyTotalLogEvent reason](self, "reason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("refreshCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDWidgetTimelineRefresherDailyTotalLogEvent count](self, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)reason
{
  return self->_reason;
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_kind, 0);
}

@end
