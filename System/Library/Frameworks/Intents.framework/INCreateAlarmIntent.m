@implementation INCreateAlarmIntent

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

  -[INCreateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INCreateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 8;
}

- (id)_categoryVerb
{
  return CFSTR("Create");
}

- (INCreateAlarmIntent)initWithRelativeOffsetInMinutes:(id)a3 time:(id)a4 label:(id)a5 alarmRepeatScheduleOptions:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  INCreateAlarmIntent *v13;
  INCreateAlarmIntent *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)INCreateAlarmIntent;
  v13 = -[INIntent init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    -[INCreateAlarmIntent setRelativeOffsetInMinutes:](v13, "setRelativeOffsetInMinutes:", v10);
    -[INCreateAlarmIntent setTime:](v14, "setTime:", v11);
    -[INCreateAlarmIntent setLabel:](v14, "setLabel:", v12);
    -[INCreateAlarmIntent setAlarmRepeatScheduleOptions:](v14, "setAlarmRepeatScheduleOptions:", a6);
  }

  return v14;
}

- (NSNumber)relativeOffsetInMinutes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INCreateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasRelativeOffsetInMinutes"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INCreateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "relativeOffsetInMinutes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setRelativeOffsetInMinutes:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INCreateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setRelativeOffsetInMinutes:", objc_msgSend(v5, "intValue"));
  else
    objc_msgSend(v4, "setHasRelativeOffsetInMinutes:", 0);

}

- (INDateComponentsRange)time
{
  void *v2;
  void *v3;
  void *v4;

  -[INCreateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "time");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDateTimeRange(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INDateComponentsRange *)v4;
}

- (void)setTime:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INCreateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDateTimeRange(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTime:", v5);
}

- (INSpeakableString)label
{
  void *v2;
  void *v3;
  void *v4;

  -[INCreateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INSpeakableString *)v4;
}

- (void)setLabel:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INCreateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setLabel:", v5);
}

- (unint64_t)alarmRepeatScheduleOptions
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  unint64_t v8;

  v8 = 0;
  -[INCreateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "alarmRepeatScheduleOptionsCount");

  if (!v4)
    return 0;
  for (i = 0; i != v4; ++i)
  {
    -[INCreateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    INAlarmRepeatScheduleOptionsAddBackingType((uint64_t *)&v8, objc_msgSend(v6, "alarmRepeatScheduleOptionsAtIndex:", i));

  }
  return v8;
}

- (void)setAlarmRepeatScheduleOptions:(unint64_t)a3
{
  void *v5;
  _QWORD v6[5];

  -[INCreateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearAlarmRepeatScheduleOptions");

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__INCreateAlarmIntent_setAlarmRepeatScheduleOptions___block_invoke;
  v6[3] = &unk_1E2295130;
  v6[4] = self;
  INAlarmRepeatScheduleOptionsEnumerateBackingTypes(a3, v6);
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("relativeOffsetInMinutes");
  -[INCreateAlarmIntent relativeOffsetInMinutes](self, "relativeOffsetInMinutes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v4;
  v13[1] = CFSTR("time");
  -[INCreateAlarmIntent time](self, "time");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v6;
  v13[2] = CFSTR("label");
  -[INCreateAlarmIntent label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v8;
  v13[3] = CFSTR("alarmRepeatScheduleOptions");
  INAlarmRepeatScheduleOptionsGetNames(-[INCreateAlarmIntent alarmRepeatScheduleOptions](self, "alarmRepeatScheduleOptions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)

  if (!v7)
  if (!v5)

  if (!v3)
  return v11;
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
  -[INCreateAlarmIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "time");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTime:", v10);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)domain
{
  return CFSTR("Alarm");
}

- (id)verb
{
  return CFSTR("CreateAlarm");
}

void __53__INCreateAlarmIntent_setAlarmRepeatScheduleOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_typedBackingStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAlarmRepeatScheduleOptions:", a2);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
