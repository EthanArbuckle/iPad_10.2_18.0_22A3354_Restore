@implementation INSetNumericSettingIntent

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

  -[INSetNumericSettingIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetNumericSettingIntent _typedBackingStore](self, "_typedBackingStore");
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

- (INSetNumericSettingIntent)initWithSettingMetadata:(id)a3 numericValue:(id)a4 boundedValue:(int64_t)a5 action:(int64_t)a6 temporalEventTrigger:(id)a7
{
  id v12;
  id v13;
  id v14;
  INSetNumericSettingIntent *v15;
  INSetNumericSettingIntent *v16;
  objc_super v18;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)INSetNumericSettingIntent;
  v15 = -[INIntent init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    -[INSetNumericSettingIntent setSettingMetadata:](v15, "setSettingMetadata:", v12);
    -[INSetNumericSettingIntent setNumericValue:](v16, "setNumericValue:", v13);
    -[INSetNumericSettingIntent setBoundedValue:](v16, "setBoundedValue:", a5);
    -[INSetNumericSettingIntent setAction:](v16, "setAction:", a6);
    -[INSetNumericSettingIntent setTemporalEventTrigger:](v16, "setTemporalEventTrigger:", v14);
  }

  return v16;
}

- (INSettingMetadata)settingMetadata
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetNumericSettingIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetNumericSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToSettingMetadata(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSettingMetadata:", v5);
}

- (INNumericSettingValue)numericValue
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetNumericSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numericValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromNumericSettingValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INNumericSettingValue *)v4;
}

- (void)setNumericValue:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSetNumericSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToNumericSettingValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setNumericValue:", v5);
}

- (int64_t)boundedValue
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;

  -[INSetNumericSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasBoundedValue");
  -[INSetNumericSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "boundedValue") - 1;
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

- (void)setBoundedValue:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INSetNumericSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 2)
    objc_msgSend(v4, "setHasBoundedValue:", 0);
  else
    objc_msgSend(v4, "setBoundedValue:");

}

- (int64_t)action
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;

  -[INSetNumericSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasAction");
  -[INSetNumericSettingIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetNumericSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 2)
    objc_msgSend(v4, "setHasAction:", 0);
  else
    objc_msgSend(v4, "setAction:");

}

- (INTemporalEventTrigger)temporalEventTrigger
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetNumericSettingIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetNumericSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToTemporalEventTrigger(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTemporalEventTrigger:", v5);
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
  int64_t v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("settingMetadata");
  -[INSetNumericSettingIntent settingMetadata](self, "settingMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[0] = v4;
  v17[1] = CFSTR("numericValue");
  -[INSetNumericSettingIntent numericValue](self, "numericValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[1] = v6;
  v17[2] = CFSTR("boundedValue");
  v7 = -[INSetNumericSettingIntent boundedValue](self, "boundedValue");
  if ((unint64_t)(v7 - 1) > 2)
    v8 = CFSTR("unknown");
  else
    v8 = off_1E2294920[v7 - 1];
  v9 = v8;
  v18[2] = v9;
  v17[3] = CFSTR("action");
  v10 = -[INSetNumericSettingIntent action](self, "action");
  if ((unint64_t)(v10 - 1) > 2)
    v11 = CFSTR("unknown");
  else
    v11 = *(&off_1E22947A0 + v10 - 1);
  v12 = v11;
  v18[3] = v12;
  v17[4] = CFSTR("temporalEventTrigger");
  -[INSetNumericSettingIntent temporalEventTrigger](self, "temporalEventTrigger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)

  if (!v5)
  if (!v3)

  return v15;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INSetNumericSettingIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
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
  return CFSTR("SetNumericSetting");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
