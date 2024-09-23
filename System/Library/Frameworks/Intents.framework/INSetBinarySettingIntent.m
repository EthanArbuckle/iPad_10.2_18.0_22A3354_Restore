@implementation INSetBinarySettingIntent

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

  -[INSetBinarySettingIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetBinarySettingIntent _typedBackingStore](self, "_typedBackingStore");
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

- (INSetBinarySettingIntent)initWithSettingMetadata:(id)a3 binaryValue:(int64_t)a4 temporalEventTrigger:(id)a5
{
  id v8;
  id v9;
  INSetBinarySettingIntent *v10;
  INSetBinarySettingIntent *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)INSetBinarySettingIntent;
  v10 = -[INIntent init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[INSetBinarySettingIntent setSettingMetadata:](v10, "setSettingMetadata:", v8);
    -[INSetBinarySettingIntent setBinaryValue:](v11, "setBinaryValue:", a4);
    -[INSetBinarySettingIntent setTemporalEventTrigger:](v11, "setTemporalEventTrigger:", v9);
  }

  return v11;
}

- (INSettingMetadata)settingMetadata
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetBinarySettingIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetBinarySettingIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToSettingMetadata(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSettingMetadata:", v5);
}

- (int64_t)binaryValue
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;

  -[INSetBinarySettingIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasBinaryValue");
  -[INSetBinarySettingIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "binaryValue") - 1;
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

- (void)setBinaryValue:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INSetBinarySettingIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 2)
    objc_msgSend(v4, "setHasBinaryValue:", 0);
  else
    objc_msgSend(v4, "setBinaryValue:");

}

- (INTemporalEventTrigger)temporalEventTrigger
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetBinarySettingIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetBinarySettingIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToTemporalEventTrigger(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTemporalEventTrigger:", v5);
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
  v12[0] = CFSTR("settingMetadata");
  -[INSetBinarySettingIntent settingMetadata](self, "settingMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v4;
  v12[1] = CFSTR("binaryValue");
  v5 = -[INSetBinarySettingIntent binaryValue](self, "binaryValue");
  if ((unint64_t)(v5 - 1) > 2)
    v6 = CFSTR("unknown");
  else
    v6 = *(&off_1E22946E8 + v5 - 1);
  v7 = v6;
  v13[1] = v7;
  v12[2] = CFSTR("temporalEventTrigger");
  -[INSetBinarySettingIntent temporalEventTrigger](self, "temporalEventTrigger");
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

  -[INSetBinarySettingIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
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
  return CFSTR("SetBinarySetting");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
