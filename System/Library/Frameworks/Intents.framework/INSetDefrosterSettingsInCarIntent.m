@implementation INSetDefrosterSettingsInCarIntent

- (INSetDefrosterSettingsInCarIntent)initWithEnable:(NSNumber *)enable defroster:(INCarDefroster)defroster
{
  return -[INSetDefrosterSettingsInCarIntent initWithEnable:defroster:carName:](self, "initWithEnable:defroster:carName:", enable, defroster, 0);
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

  -[INSetDefrosterSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetDefrosterSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
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

- (INSetDefrosterSettingsInCarIntent)initWithEnable:(NSNumber *)enable defroster:(INCarDefroster)defroster carName:(INSpeakableString *)carName
{
  NSNumber *v8;
  INSpeakableString *v9;
  INSetDefrosterSettingsInCarIntent *v10;
  INSetDefrosterSettingsInCarIntent *v11;
  objc_super v13;

  v8 = enable;
  v9 = carName;
  v13.receiver = self;
  v13.super_class = (Class)INSetDefrosterSettingsInCarIntent;
  v10 = -[INIntent init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[INSetDefrosterSettingsInCarIntent setEnable:](v10, "setEnable:", v8);
    -[INSetDefrosterSettingsInCarIntent setDefroster:](v11, "setDefroster:", defroster);
    -[INSetDefrosterSettingsInCarIntent setCarName:](v11, "setCarName:", v9);
  }

  return v11;
}

- (NSNumber)enable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INSetDefrosterSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasEnable"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INSetDefrosterSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "enable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setEnable:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INSetDefrosterSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setEnable:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasEnable:", 0);

}

- (INCarDefroster)defroster
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  INCarDefroster v7;
  INCarDefroster v8;

  -[INSetDefrosterSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasDefroster");
  -[INSetDefrosterSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "defroster") - 1;
  if (v6 <= 2)
    v7 = v6 + 1;
  else
    v7 = INCarDefrosterUnknown;
  if (v4)
    v8 = v7;
  else
    v8 = INCarDefrosterUnknown;

  return v8;
}

- (void)setDefroster:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INSetDefrosterSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 2)
    objc_msgSend(v4, "setHasDefroster:", 0);
  else
    objc_msgSend(v4, "setDefroster:");

}

- (INSpeakableString)carName
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetDefrosterSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetDefrosterSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setCarName:", v5);
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  INCarDefroster v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("enable");
  -[INSetDefrosterSettingsInCarIntent enable](self, "enable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v4;
  v12[1] = CFSTR("defroster");
  v5 = -[INSetDefrosterSettingsInCarIntent defroster](self, "defroster");
  if ((unint64_t)(v5 - 1) > 2)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E228EAC8[v5 - 1];
  v7 = v6;
  v13[1] = v7;
  v12[2] = CFSTR("carName");
  -[INSetDefrosterSettingsInCarIntent carName](self, "carName");
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

  -[INSetDefrosterSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  -[INIntent setBackingStore:](self, "setBackingStore:", v5);

}

- (id)domain
{
  return CFSTR("CarPlay");
}

- (id)verb
{
  return CFSTR("SetDefrosterSettingsInCar");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
