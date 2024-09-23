@implementation CalFoundationPreferences

+ (id)shared
{
  if (shared_onceToken_1 != -1)
    dispatch_once(&shared_onceToken_1, &__block_literal_global_35);
  return (id)shared_sharedPreferences;
}

void __34__CalFoundationPreferences_shared__block_invoke()
{
  CalFoundationPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(CalFoundationPreferences);
  v1 = (void *)shared_sharedPreferences;
  shared_sharedPreferences = (uint64_t)v0;

}

- (CalFoundationPreferences)init
{
  CalFoundationPreferences *v2;
  CalPreferences *v3;
  CalPreferences *preferences;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CalFoundationPreferences;
  v2 = -[CalFoundationPreferences init](&v6, sel_init);
  if (v2)
  {
    v3 = -[CalPreferences initWithDomain:]([CalPreferences alloc], "initWithDomain:", CFSTR("com.apple.mobilecal"));
    preferences = v2->_preferences;
    v2->_preferences = v3;

  }
  return v2;
}

- (CalFoundationPreferences)initWithPreferencesForUnitTesting:(id)a3
{
  id v5;
  CalFoundationPreferences *v6;
  CalFoundationPreferences *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalFoundationPreferences;
  v6 = -[CalFoundationPreferences init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_preferences, a3);

  return v7;
}

- (double)simulatedDateForNowOffset
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("simulatedDateForNowOffset"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)setSimulatedDateForNowOffset:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("simulatedDateForNowOffset"), v4, 0);

}

- (NSString)stopTimeDemoMode
{
  return (NSString *)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("stopTimeDemoMode"), objc_opt_class());
}

- (void)setStopTimeDemoMode:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("stopTimeDemoMode"), a3, 0);
}

- (BOOL)stopTimeDemoModeActive
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CalFoundationPreferences stopTimeDemoMode](self, "stopTimeDemoMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "length") != 0;
  else
    v4 = 0;

  return v4;
}

- (NSDateComponents)stopTimeDemoModeComponents
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  -[CalFoundationPreferences stopTimeDemoMode](self, "stopTimeDemoMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CalFoundationPreferences stopTimeDemoModeActive](self, "stopTimeDemoModeActive"))
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:", 124, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(":"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setYear:", (int)objc_msgSend(v9, "intValue"));

    }
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMonth:", (int)objc_msgSend(v10, "intValue"));

    }
    if ((unint64_t)objc_msgSend(v8, "count") >= 3)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDay:", (int)objc_msgSend(v11, "intValue"));

    }
    if ((unint64_t)objc_msgSend(v8, "count") >= 4)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHour:", (int)objc_msgSend(v12, "intValue"));

    }
    if ((unint64_t)objc_msgSend(v8, "count") >= 5)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMinute:", (int)objc_msgSend(v13, "intValue"));

    }
    objc_msgSend(v5, "dateFromComponents:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:", 638, v14);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSDateComponents *)v3;
}

- (double)defaultEventDuration
{
  void *v2;
  void *v3;
  double v4;
  double v6;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("defaultEventDuration"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    if (v4 >= 21600.0 || v4 <= 240.0)
      v6 = 3600.0;
    else
      v6 = v4;
  }
  else
  {
    v6 = 3600.0;
  }

  return v6;
}

- (void)setDefaultEventDuration:(double)a3
{
  CalPreferences *preferences;
  id v4;

  if (a3 > 240.0 && a3 < 21600.0)
  {
    preferences = self->_preferences;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CalPreferences setValueForPreference:value:notificationName:](preferences, "setValueForPreference:value:notificationName:", CFSTR("defaultEventDuration"), v4, CFSTR("com.apple.mobilecal.preference.notification.defaultEventDuration"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
}

@end
