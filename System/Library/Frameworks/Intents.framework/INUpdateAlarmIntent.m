@implementation INUpdateAlarmIntent

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

  -[INUpdateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INUpdateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INUpdateAlarmIntent)initWithAlarmSearch:(id)a3 alarm:(id)a4 operation:(int64_t)a5 proposedTime:(id)a6 proposedLabel:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  INUpdateAlarmIntent *v16;
  INUpdateAlarmIntent *v17;
  objc_super v19;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)INUpdateAlarmIntent;
  v16 = -[INIntent init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    -[INUpdateAlarmIntent setAlarmSearch:](v16, "setAlarmSearch:", v12);
    -[INUpdateAlarmIntent setAlarm:](v17, "setAlarm:", v13);
    -[INUpdateAlarmIntent setOperation:](v17, "setOperation:", a5);
    -[INUpdateAlarmIntent setProposedTime:](v17, "setProposedTime:", v14);
    -[INUpdateAlarmIntent setProposedLabel:](v17, "setProposedLabel:", v15);
  }

  return v17;
}

- (INAlarmSearch)alarmSearch
{
  void *v2;
  void *v3;
  void *v4;

  -[INUpdateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INUpdateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToAlarmSearch(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAlarmSearch:", v5);
}

- (INAlarm)alarm
{
  void *v2;
  void *v3;
  void *v4;

  -[INUpdateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alarm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromAlarm(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INAlarm *)v4;
}

- (void)setAlarm:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INUpdateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToAlarm(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAlarm:", v5);
}

- (int64_t)operation
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  int64_t v8;

  -[INUpdateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasOperation");
  -[INUpdateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "operation");
  v7 = 2 * (v6 == 2);
  if (v6 == 1)
    v7 = 1;
  if (v4)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)setOperation:(int64_t)a3
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (a3 == 1)
    v3 = 1;
  else
    v3 = 0x7FFFFFFF;
  if (a3 == 2)
    v4 = 2;
  else
    v4 = v3;
  -[INUpdateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v4 == 0x7FFFFFFF)
    objc_msgSend(v5, "setHasOperation:", 0);
  else
    objc_msgSend(v5, "setOperation:", v4);

}

- (INDateComponentsRange)proposedTime
{
  void *v2;
  void *v3;
  void *v4;

  -[INUpdateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proposedTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDateTimeRange(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INDateComponentsRange *)v4;
}

- (void)setProposedTime:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INUpdateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDateTimeRange(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setProposedTime:", v5);
}

- (INSpeakableString)proposedLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[INUpdateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proposedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INSpeakableString *)v4;
}

- (void)setProposedLabel:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INUpdateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setProposedLabel:", v5);
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("alarmSearch");
  -[INUpdateAlarmIntent alarmSearch](self, "alarmSearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v4;
  v16[1] = CFSTR("alarm");
  -[INUpdateAlarmIntent alarm](self, "alarm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v6;
  v16[2] = CFSTR("operation");
  v7 = -[INUpdateAlarmIntent operation](self, "operation");
  v8 = CFSTR("unknown");
  if (v7 == 2)
    v8 = CFSTR("updateTime");
  if (v7 == 1)
    v8 = CFSTR("updateLabel");
  v9 = v8;
  v17[2] = v9;
  v16[3] = CFSTR("proposedTime");
  -[INUpdateAlarmIntent proposedTime](self, "proposedTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[3] = v11;
  v16[4] = CFSTR("proposedLabel");
  -[INUpdateAlarmIntent proposedLabel](self, "proposedLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)

  if (!v10)
  if (!v5)

  if (!v3)
  return v14;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  -[INUpdateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "proposedTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setProposedTime:", v10);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)domain
{
  return CFSTR("Alarm");
}

- (id)verb
{
  return CFSTR("UpdateAlarm");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
