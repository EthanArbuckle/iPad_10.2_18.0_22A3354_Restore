@implementation INGetSettingIntent

- (INGetSettingIntent)initWithSettingMetadata:(id)a3
{
  return -[INGetSettingIntent initWithSettingMetadata:confirmationValue:](self, "initWithSettingMetadata:confirmationValue:", a3, 0);
}

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

  -[INGetSettingIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INGetSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 1;
}

- (id)_categoryVerb
{
  return CFSTR("View");
}

- (INGetSettingIntent)initWithSettingMetadata:(id)a3 confirmationValue:(int64_t)a4
{
  id v6;
  INGetSettingIntent *v7;
  INGetSettingIntent *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INGetSettingIntent;
  v7 = -[INIntent init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[INGetSettingIntent setSettingMetadata:](v7, "setSettingMetadata:", v6);
    -[INGetSettingIntent setConfirmationValue:](v8, "setConfirmationValue:", a4);
  }

  return v8;
}

- (INSettingMetadata)settingMetadata
{
  void *v2;
  void *v3;
  void *v4;

  -[INGetSettingIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INGetSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToSettingMetadata(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSettingMetadata:", v5);
}

- (int64_t)confirmationValue
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;

  -[INGetSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasConfirmationValue");
  -[INGetSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "confirmationValue") - 1;
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

- (void)setConfirmationValue:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INGetSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 2)
    objc_msgSend(v4, "setHasConfirmationValue:", 0);
  else
    objc_msgSend(v4, "setConfirmationValue:");

}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  int64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("settingMetadata");
  -[INGetSettingIntent settingMetadata](self, "settingMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = CFSTR("confirmationValue");
  v11[0] = v4;
  v5 = -[INGetSettingIntent confirmationValue](self, "confirmationValue");
  if ((unint64_t)(v5 - 1) > 2)
    v6 = CFSTR("unknown");
  else
    v6 = *(&off_1E22946E8 + v5 - 1);
  v7 = v6;
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  return v8;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INGetSettingIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
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
  return CFSTR("GetSetting");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
