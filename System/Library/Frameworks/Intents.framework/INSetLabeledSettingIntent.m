@implementation INSetLabeledSettingIntent

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

  -[INSetLabeledSettingIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetLabeledSettingIntent _typedBackingStore](self, "_typedBackingStore");
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

- (INSetLabeledSettingIntent)initWithSettingMetadata:(id)a3 labeledValue:(id)a4 temporalEventTrigger:(id)a5
{
  id v8;
  id v9;
  id v10;
  INSetLabeledSettingIntent *v11;
  INSetLabeledSettingIntent *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)INSetLabeledSettingIntent;
  v11 = -[INIntent init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[INSetLabeledSettingIntent setSettingMetadata:](v11, "setSettingMetadata:", v8);
    -[INSetLabeledSettingIntent setLabeledValue:](v12, "setLabeledValue:", v9);
    -[INSetLabeledSettingIntent setTemporalEventTrigger:](v12, "setTemporalEventTrigger:", v10);
  }

  return v12;
}

- (INSettingMetadata)settingMetadata
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetLabeledSettingIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetLabeledSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToSettingMetadata(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSettingMetadata:", v5);
}

- (NSString)labeledValue
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetLabeledSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "labeledValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (void)setLabeledValue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INSetLabeledSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLabeledValue:", v4);

}

- (INTemporalEventTrigger)temporalEventTrigger
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetLabeledSettingIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetLabeledSettingIntent _typedBackingStore](self, "_typedBackingStore");
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
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("settingMetadata");
  -[INSetLabeledSettingIntent settingMetadata](self, "settingMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("labeledValue");
  -[INSetLabeledSettingIntent labeledValue](self, "labeledValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("temporalEventTrigger");
  -[INSetLabeledSettingIntent temporalEventTrigger](self, "temporalEventTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)

  if (!v5)
  if (!v3)

  return v9;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INSetLabeledSettingIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
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
  return CFSTR("SetLabeledSetting");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
