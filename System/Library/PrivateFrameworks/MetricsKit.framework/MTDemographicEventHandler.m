@implementation MTDemographicEventHandler

- (id)ageDataForUserId:(id)a3 updateInterval:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  MTDemographicEventHandler *v32;
  void *v33;
  void *v34;
  uint8_t buf[8];
  _QWORD v36[3];
  _QWORD v37[4];

  v37[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "date");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = self;
  -[MTObject metricsKit](self, "metricsKit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("MTDemographicDataProviderLastAgeUpdateDate"), "stringByAppendingString:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("MTDemographicDataProviderPreviousUserID"), "stringByAppendingString:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKey:", v11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v13, "isEqualToString:", v6)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(v34, "timeIntervalSinceDate:", v33), v14 < a4))
  {
    v15 = 0;
  }
  else
  {
    +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dateOfBirthComponents");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = objc_alloc(MEMORY[0x24BDBCE48]);
      v19 = objc_msgSend(v18, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
      objc_msgSend(v17, "setCalendar:", v19);
      objc_msgSend(v17, "date");
      v30 = v17;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTDemographicEventHandler totalYearsSinceDate:calendar:](v32, "totalYearsSinceDate:calendar:", v20, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = v21;
      objc_msgSend(v21, "setCalendar:", v19);
      v37[0] = v6;
      v36[0] = CFSTR("userId");
      v36[1] = CFSTR("ageRange");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v21, "year"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v22;
      v36[2] = CFSTR("eventTime");
      objc_msgSend(MEMORY[0x24BDBCE60], "mt_millisecondsSince1970");
      v31 = v11;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v37[2] = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
      v24 = v12;
      v25 = v9;
      v26 = v6;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTEventHandler metricsDataWithFields:](v32, "metricsDataWithFields:", v27, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v26;
      v9 = v25;
      v12 = v24;

      v11 = v31;
      v17 = v30;
      objc_msgSend(v10, "setValue:forKey:", v34, v31);
      objc_msgSend(v10, "setValue:forKey:", v6, v12);
      objc_msgSend(v10, "synchronize");

    }
    else
    {
      MTMetricsKitOSLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D758000, v19, OS_LOG_TYPE_INFO, "MetricsKit: Skipping demographics update because date of birth is unavailable.", buf, 2u);
      }
      v15 = 0;
    }

  }
  return v15;
}

- (void)clearUserDefaultsForTopic:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDBCF50];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("MTDemographicDataProviderLastAgeUpdateDate"), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v5);

  objc_msgSend(CFSTR("MTDemographicDataProviderPreviousUserID"), "stringByAppendingString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeObjectForKey:", v6);
  objc_msgSend(v7, "synchronize");

}

- (id)totalYearsSinceDate:(id)a3 calendar:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:toDate:options:", 4, v6, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)eventVersion:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTDemographicEventHandler;
  -[MTEventHandler eventVersion:](&v7, sel_eventVersion_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &unk_24C7B82E0;
  v5 = v3;

  return v5;
}

- (id)eventType
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTDemographicEventHandler;
  -[MTEventHandler eventType](&v6, sel_eventType);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("demographic");
  v4 = v2;

  return v4;
}

- (BOOL)mtIncludeBaseFields
{
  return 0;
}

@end
