@implementation INSetProfileInCarIntent

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

  -[INSetProfileInCarIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetProfileInCarIntent _typedBackingStore](self, "_typedBackingStore");
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

- (INSetProfileInCarIntent)initWithProfileNumber:(NSNumber *)profileNumber profileName:(NSString *)profileName defaultProfile:(NSNumber *)defaultProfile carName:(INSpeakableString *)carName
{
  NSNumber *v10;
  NSString *v11;
  NSNumber *v12;
  INSpeakableString *v13;
  INSetProfileInCarIntent *v14;
  INSetProfileInCarIntent *v15;
  objc_super v17;

  v10 = profileNumber;
  v11 = profileName;
  v12 = defaultProfile;
  v13 = carName;
  v17.receiver = self;
  v17.super_class = (Class)INSetProfileInCarIntent;
  v14 = -[INIntent init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[INSetProfileInCarIntent setProfileNumber:](v14, "setProfileNumber:", v10);
    -[INSetProfileInCarIntent setProfileName:](v15, "setProfileName:", v11);
    -[INSetProfileInCarIntent setDefaultProfile:](v15, "setDefaultProfile:", v12);
    -[INSetProfileInCarIntent setCarName:](v15, "setCarName:", v13);
  }

  return v15;
}

- (NSNumber)profileNumber
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetProfileInCarIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetProfileInCarIntent _typedBackingStore](self, "_typedBackingStore");
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

  -[INSetProfileInCarIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetProfileInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setProfileName:", v5);
}

- (NSNumber)defaultProfile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INSetProfileInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasDefaultProfile"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INSetProfileInCarIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "defaultProfile"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setDefaultProfile:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INSetProfileInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setDefaultProfile:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasDefaultProfile:", 0);

}

- (INSpeakableString)carName
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetProfileInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "carName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INSpeakableString *)v4;
}

- (void)setCarName:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSetProfileInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setCarName:", v5);
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
  v13[0] = CFSTR("profileNumber");
  -[INSetProfileInCarIntent profileNumber](self, "profileNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v4;
  v13[1] = CFSTR("profileName");
  -[INSetProfileInCarIntent profileName](self, "profileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v6;
  v13[2] = CFSTR("defaultProfile");
  -[INSetProfileInCarIntent defaultProfile](self, "defaultProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v8;
  v13[3] = CFSTR("carName");
  -[INSetProfileInCarIntent carName](self, "carName");
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
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  -[INSetProfileInCarIntent _typedBackingStore](self, "_typedBackingStore");
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
  return CFSTR("SetProfileInCar");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INSetProfileInCarIntent)initWithProfileNumber:(NSNumber *)profileNumber profileName:(NSString *)profileName defaultProfile:(NSNumber *)defaultProfile
{
  return -[INSetProfileInCarIntent initWithProfileNumber:profileName:defaultProfile:carName:](self, "initWithProfileNumber:profileName:defaultProfile:carName:", profileNumber, profileName, defaultProfile, 0);
}

@end
