@implementation INSaveProfileInCarIntent

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

  -[INSaveProfileInCarIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSaveProfileInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INSaveProfileInCarIntent)initWithProfileNumber:(NSNumber *)profileNumber profileName:(NSString *)profileName
{
  NSNumber *v6;
  NSString *v7;
  INSaveProfileInCarIntent *v8;
  INSaveProfileInCarIntent *v9;
  objc_super v11;

  v6 = profileNumber;
  v7 = profileName;
  v11.receiver = self;
  v11.super_class = (Class)INSaveProfileInCarIntent;
  v8 = -[INIntent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[INSaveProfileInCarIntent setProfileNumber:](v8, "setProfileNumber:", v6);
    -[INSaveProfileInCarIntent setProfileName:](v9, "setProfileName:", v7);
  }

  return v9;
}

- (NSNumber)profileNumber
{
  void *v2;
  void *v3;
  void *v4;

  -[INSaveProfileInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profileNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromInteger(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)setProfileNumber:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSaveProfileInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToInteger(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setProfileNumber:", v5);
}

- (NSString)profileName
{
  void *v2;
  void *v3;
  void *v4;

  -[INSaveProfileInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setProfileName:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSaveProfileInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setProfileName:", v5);
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
  v9[0] = CFSTR("profileNumber");
  -[INSaveProfileInCarIntent profileNumber](self, "profileNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("profileName");
  v10[0] = v4;
  -[INSaveProfileInCarIntent profileName](self, "profileName");
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
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  -[INSaveProfileInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "profileNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedIntegerFromInteger(v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProfileNumber:", v10);

  objc_msgSend(v7, "profileName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedStringFromString(v11, a3, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setProfileName:", v12);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)domain
{
  return CFSTR("CarPlay");
}

- (id)verb
{
  return CFSTR("SaveProfileInCar");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
