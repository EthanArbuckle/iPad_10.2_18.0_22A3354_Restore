@implementation INOpenSettingIntent

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

  -[INOpenSettingIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INOpenSettingIntent _typedBackingStore](self, "_typedBackingStore");
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

- (INOpenSettingIntent)initWithSettingMetadata:(id)a3 searchQuery:(id)a4
{
  id v6;
  id v7;
  INOpenSettingIntent *v8;
  INOpenSettingIntent *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INOpenSettingIntent;
  v8 = -[INIntent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[INOpenSettingIntent setSettingMetadata:](v8, "setSettingMetadata:", v6);
    -[INOpenSettingIntent setSearchQuery:](v9, "setSearchQuery:", v7);
  }

  return v9;
}

- (INSettingMetadata)settingMetadata
{
  void *v2;
  void *v3;
  void *v4;

  -[INOpenSettingIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INOpenSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToSettingMetadata(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSettingMetadata:", v5);
}

- (INSpeakableString)searchQuery
{
  void *v2;
  void *v3;
  void *v4;

  -[INOpenSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INSpeakableString *)v4;
}

- (void)setSearchQuery:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INOpenSettingIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSearchQuery:", v5);
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("settingMetadata");
  -[INOpenSettingIntent settingMetadata](self, "settingMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("searchQuery");
  v10[0] = v4;
  -[INOpenSettingIntent searchQuery](self, "searchQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)

  if (!v3)
  return v7;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INOpenSettingIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
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
  return CFSTR("OpenSetting");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
