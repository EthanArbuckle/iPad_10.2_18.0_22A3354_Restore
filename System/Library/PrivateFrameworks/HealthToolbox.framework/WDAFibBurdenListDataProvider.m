@implementation WDAFibBurdenListDataProvider

- (WDAFibBurdenListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4
{
  WDAFibBurdenListDataProvider *v4;
  HKCalendarCache *v5;
  HKCalendarCache *calendarCache;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WDAFibBurdenListDataProvider;
  v4 = -[WDQuantityListDataProvider initWithDisplayType:profile:](&v8, sel_initWithDisplayType_profile_, a3, a4);
  if (v4)
  {
    v5 = (HKCalendarCache *)objc_alloc_init(MEMORY[0x24BDD3968]);
    calendarCache = v4->_calendarCache;
    v4->_calendarCache = v5;

  }
  return v4;
}

- (id)textForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  -[WDSampleListDataProvider displayType](self, "displayType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSampleListDataProvider unitController](self, "unitController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unitForDisplayType:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "quantity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v7);
  v10 = v9;

  objc_msgSend(v5, "presentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "adjustedValueForDaemonValue:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDD31E8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v15, "BOOLValue");

  if ((_DWORD)v12)
  {
    HKAFibBurdenClampedLowerBoundLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "hk_valueFormatterForUnit:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDSampleListDataProvider unitController](self, "unitController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringFromValue:displayType:unitController:", v13, v5, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (id)secondaryTextForObject:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;

  v4 = (objc_class *)MEMORY[0x24BDD1508];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v7, v8);

  objc_msgSend(v5, "_timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKCalendarCache calendarForTimeZone:](self->_calendarCache, "calendarForTimeZone:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD1508];
  -[HKCalendarCache currentCalendar](self->_calendarCache, "currentCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hk_julianDayDateIntervalFromOpenUpperBoundDateInterval:sourceCalendar:localCalendar:", v9, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD1510], "hk_mediumDateStyleIntervalFormatter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringFromDateInterval:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _HKInitializeLogging();
    v17 = *MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_FAULT))
      -[WDAFibBurdenListDataProvider secondaryTextForObject:].cold.1(v17);
    v16 = 0;
  }

  return v16;
}

- (id)_timeZoneForSample:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "_timeZoneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDBCF38]);
    objc_msgSend(v3, "_timeZoneName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithName:", v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)titleForSection:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[WDSampleListDataProvider samples](self, "samples", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 < 1)
  {
    v9 = 0;
  }
  else
  {
    -[WDSampleListDataProvider displayType](self, "displayType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localization");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedUppercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)updateVersionForSample:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDD43F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)featureVersionForSample:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDD3128]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDD43F8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[WDAFibBurdenListDataProvider _generateFeatureVersionFromUpdateVersion:](self, "_generateFeatureVersionFromUpdateVersion:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)_generateFeatureVersionFromUpdateVersion:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)viewControllerForItemAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  v6 = objc_msgSend(v4, "section");

  -[WDSampleListDataProvider objectAtIndex:forSection:](self, "objectAtIndex:forSection:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x24BE4A5A0]);
  -[WDSampleListDataProvider profileName](self, "profileName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithSample:usingInsetStyling:profileName:regulatedFeatureInfoProvider:delegate:", v7, 1, v9, self, self);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarCache, 0);
}

- (void)secondaryTextForObject:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_215814000, log, OS_LOG_TYPE_FAULT, "AFibBurden sample with instantaneous duration detected", v1, 2u);
}

@end
