@implementation INChangeAlarmStatusIntent

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

  -[INChangeAlarmStatusIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INChangeAlarmStatusIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INChangeAlarmStatusIntent)initWithAlarmSearch:(id)a3 alarms:(id)a4 operation:(int64_t)a5
{
  id v8;
  id v9;
  INChangeAlarmStatusIntent *v10;
  INChangeAlarmStatusIntent *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)INChangeAlarmStatusIntent;
  v10 = -[INIntent init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[INChangeAlarmStatusIntent setAlarmSearch:](v10, "setAlarmSearch:", v8);
    -[INChangeAlarmStatusIntent setAlarms:](v11, "setAlarms:", v9);
    -[INChangeAlarmStatusIntent setOperation:](v11, "setOperation:", a5);
  }

  return v11;
}

- (INAlarmSearch)alarmSearch
{
  void *v2;
  void *v3;
  void *v4;

  -[INChangeAlarmStatusIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INChangeAlarmStatusIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToAlarmSearch(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAlarmSearch:", v5);
}

- (NSArray)alarms
{
  void *v2;
  void *v3;
  void *v4;

  -[INChangeAlarmStatusIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INChangeAlarmStatusIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToAlarms(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAlarms:", v5);
}

- (int64_t)operation
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;

  -[INChangeAlarmStatusIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasOperation");
  -[INChangeAlarmStatusIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "operation") - 1;
  if (v6 <= 2)
    v7 = v6 + 1;
  else
    v7 = 0;
  if (v4)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)setOperation:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INChangeAlarmStatusIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 2)
    objc_msgSend(v4, "setHasOperation:", 0);
  else
    objc_msgSend(v4, "setOperation:");

}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("alarmSearch");
  -[INChangeAlarmStatusIntent alarmSearch](self, "alarmSearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v4;
  v12[1] = CFSTR("alarms");
  -[INChangeAlarmStatusIntent alarms](self, "alarms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v6;
  v12[2] = CFSTR("operation");
  v7 = -[INChangeAlarmStatusIntent operation](self, "operation");
  if ((unint64_t)(v7 - 1) > 2)
    v8 = CFSTR("unknown");
  else
    v8 = off_1E2294BD8[v7 - 1];
  v9 = v8;
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  if (!v3)

  return v10;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INChangeAlarmStatusIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
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
  return CFSTR("ChangeAlarmStatus");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
