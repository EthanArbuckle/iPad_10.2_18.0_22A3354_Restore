@implementation CADStatsPreferences

- (CADStatsPreferences)init
{
  CADStatsPreferences *v2;
  uint64_t v3;
  NSMutableDictionary *payload;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CADStatsPreferences;
  v2 = -[CADStatsPreferences init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    payload = v2->payload;
    v2->payload = (NSMutableDictionary *)v3;

  }
  return v2;
}

+ (id)eventName
{
  return CFSTR("cadstats.Preferences");
}

- (id)eventDictionaries
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
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D0C368]);
  v4 = (void *)objc_msgSend(v3, "initWithDomain:", *MEMORY[0x1E0D0C508]);
  objc_msgSend(v4, "getValueForPreference:expectedClass:", CFSTR("overlayCalendarID"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->payload, "setObject:forKeyedSubscript:", v5, CFSTR("overlayCalendarID"));

  if (objc_msgSend(MEMORY[0x1E0D3EFB0], "isLunarCalendarDefaultOn"))
  {
    v6 = (void *)MEMORY[0x1E0D3EFB0];
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredLunarCalendarForLocaleID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->payload, "setObject:forKeyedSubscript:", v9, CFSTR("defaultOverlayCalendarID"));

  }
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0D0BB10], "shared");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithBool:", objc_msgSend(v11, "get_enableTravelAdvisoriesForAutomaticBehavior"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->payload, "setObject:forKeyedSubscript:", v12, CFSTR("travelAdvisoryEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "getBooleanPreference:defaultValue:", CFSTR("ShowWeekNumbers"), 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->payload, "setObject:forKeyedSubscript:", v13, CFSTR("weekNumbersEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "getBooleanPreference:defaultValue:", CFSTR("ShowDeclinedEvents"), 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->payload, "setObject:forKeyedSubscript:", v14, CFSTR("declinedEventsEnabled"));

  v17[0] = self->payload;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->payload, 0);
}

@end
