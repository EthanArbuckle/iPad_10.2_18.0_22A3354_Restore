@implementation INSearchAlarmIntent

- (id)_typedBackingStore
{
  void *v2;
  void *v3;
  id v4;

  -[INIntent backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_metadata
{
  void *v2;
  void *v3;

  -[INSearchAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INSearchAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INSearchAlarmIntent)initWithAlarmSearch:(id)a3 alarmSearchType:(int64_t)a4 alarms:(id)a5
{
  id v8;
  id v9;
  INSearchAlarmIntent *v10;
  INSearchAlarmIntent *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)INSearchAlarmIntent;
  v10 = -[INIntent init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[INSearchAlarmIntent setAlarmSearch:](v10, "setAlarmSearch:", v8);
    -[INSearchAlarmIntent setAlarmSearchType:](v11, "setAlarmSearchType:", a4);
    -[INSearchAlarmIntent setAlarms:](v11, "setAlarms:", v9);
  }

  return v11;
}

- (INAlarmSearch)alarmSearch
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alarmSearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromAlarmSearch(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INAlarmSearch *)v4;
}

- (void)setAlarmSearch:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSearchAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToAlarmSearch(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAlarmSearch:", v5);
}

- (int64_t)alarmSearchType
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  unsigned int v6;
  int64_t v7;

  -[INSearchAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasAlarmSearchType");
  -[INSearchAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "alarmSearchType");
  if (((v6 < 5) & v4) != 0)
    v7 = v6 + 1;
  else
    v7 = 0;

  return v7;
}

- (void)setAlarmSearchType:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INSearchAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 4)
    objc_msgSend(v4, "setHasAlarmSearchType:", 0);
  else
    objc_msgSend(v4, "setAlarmSearchType:", v3);

}

- (NSArray)alarms
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alarms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromAlarms(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setAlarms:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSearchAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToAlarms(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAlarms:", v5);
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  int64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("alarmSearch");
  -[INSearchAlarmIntent alarmSearch](self, "alarmSearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v4;
  v12[1] = CFSTR("alarmSearchType");
  v5 = -[INSearchAlarmIntent alarmSearchType](self, "alarmSearchType");
  if ((unint64_t)(v5 - 1) > 4)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2294ED0[v5 - 1];
  v7 = v6;
  v13[1] = v7;
  v12[2] = CFSTR("alarms");
  -[INSearchAlarmIntent alarms](self, "alarms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)

  if (!v3)
  return v10;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INSearchAlarmIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  -[INIntent setBackingStore:](self, "setBackingStore:", v5);

}

- (id)domain
{
  return CFSTR("Alarm");
}

- (id)verb
{
  return CFSTR("SearchAlarm");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
