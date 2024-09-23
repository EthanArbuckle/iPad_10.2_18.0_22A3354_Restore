@implementation CPAnalyticsEvent

- (CPAnalyticsEvent)initWithName:(id)a3 payload:(id)a4 systemProperties:(id)a5
{
  id v9;
  id v10;
  id v11;
  CPAnalyticsEvent *v12;
  CPAnalyticsEvent *v13;
  uint64_t v14;
  NSDate *timestamp;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CPAnalyticsEvent;
  v12 = -[CPAnalyticsEvent init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_payload, a4);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = objc_claimAutoreleasedReturnValue();
    timestamp = v13->_timestamp;
    v13->_timestamp = (NSDate *)v14;

    objc_storeStrong((id *)&v13->_systemProperties, a5);
  }

  return v13;
}

void __30__CPAnalyticsEvent_initialize__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x24BDBCE48]);
  v1 = objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  v2 = (void *)gregorianCalendar;
  gregorianCalendar = v1;

}

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_670);
}

- (id)propertyForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("cpa_common_hourOfDay")))
  {
    v5 = (void *)objc_opt_class();
    -[CPAnalyticsEvent timestamp](self, "timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hourOfDayFromDate:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (void *)v7;
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("cpa_common_dayOfWeek")))
  {
    v8 = (void *)objc_opt_class();
    -[CPAnalyticsEvent timestamp](self, "timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dayOfWeekFromDate:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[CPAnalyticsEvent payload](self, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_7;
  -[CPAnalyticsEvent systemProperties](self, "systemProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPAnalyticsEvent name](self, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPAnalyticsEvent payload](self, "payload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyForKey:forEventName:payloadForSystemPropertyExtraction:", v4, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
LABEL_7:

  return v9;
}

- (id)copyRawPayload
{
  void *v2;
  void *v3;

  -[CPAnalyticsEvent payload](self, "payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (CPAnalyticsSystemProperties)systemProperties
{
  return self->_systemProperties;
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_systemProperties, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)hourOfDayFromDate:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend((id)gregorianCalendar, "component:fromDate:", 32, a3);
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v3);
}

+ (id)dayOfWeekFromDate:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend((id)gregorianCalendar, "component:fromDate:", 512, a3);
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v3);
}

@end
