@implementation INSetTemporalSettingIntent

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

  -[INSetTemporalSettingIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetTemporalSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 16;
}

- (id)_categoryVerb
{
  return CFSTR("Set");
}

- (INSetTemporalSettingIntent)initWithSettingMetadata:(id)a3 timeValue:(id)a4 temporalEventTrigger:(id)a5 action:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  INSetTemporalSettingIntent *v13;
  INSetTemporalSettingIntent *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)INSetTemporalSettingIntent;
  v13 = -[INIntent init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    -[INSetTemporalSettingIntent setSettingMetadata:](v13, "setSettingMetadata:", v10);
    -[INSetTemporalSettingIntent setTimeValue:](v14, "setTimeValue:", v11);
    -[INSetTemporalSettingIntent setTemporalEventTrigger:](v14, "setTemporalEventTrigger:", v12);
    -[INSetTemporalSettingIntent setAction:](v14, "setAction:", a6);
  }

  return v14;
}

- (INSettingMetadata)settingMetadata
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetTemporalSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settingMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromSettingMetadata(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INSettingMetadata *)v4;
}

- (void)setSettingMetadata:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSetTemporalSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToSettingMetadata(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSettingMetadata:", v5);
}

- (INDateComponentsRange)timeValue
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetTemporalSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDateTimeRangeValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INDateComponentsRange *)v4;
}

- (void)setTimeValue:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSetTemporalSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDateTimeRangeValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTimeValue:", v5);
}

- (INTemporalEventTrigger)temporalEventTrigger
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetTemporalSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "temporalEventTrigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromTemporalEventTrigger(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INTemporalEventTrigger *)v4;
}

- (void)setTemporalEventTrigger:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSetTemporalSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToTemporalEventTrigger(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTemporalEventTrigger:", v5);
}

- (int64_t)action
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;

  -[INSetTemporalSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasAction");
  -[INSetTemporalSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "action") - 1;
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

- (void)setAction:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INSetTemporalSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 2)
    objc_msgSend(v4, "setHasAction:", 0);
  else
    objc_msgSend(v4, "setAction:");

}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("settingMetadata");
  -[INSetTemporalSettingIntent settingMetadata](self, "settingMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v4;
  v14[1] = CFSTR("timeValue");
  -[INSetTemporalSettingIntent timeValue](self, "timeValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v6;
  v14[2] = CFSTR("temporalEventTrigger");
  -[INSetTemporalSettingIntent temporalEventTrigger](self, "temporalEventTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[2] = v8;
  v14[3] = CFSTR("action");
  v9 = -[INSetTemporalSettingIntent action](self, "action");
  if ((unint64_t)(v9 - 1) > 2)
    v10 = CFSTR("unknown");
  else
    v10 = *(&off_1E22947A0 + v9 - 1);
  v11 = v10;
  v15[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  if (!v5)

  if (!v3)
  return v12;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INSetTemporalSettingIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  -[INIntent setBackingStore:](self, "setBackingStore:", v5);

}

- (id)domain
{
  return CFSTR("Settings");
}

- (id)verb
{
  return CFSTR("SetTemporalSetting");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
