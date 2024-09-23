@implementation INSetSeatSettingsInCarIntent

- (INSetSeatSettingsInCarIntent)initWithEnableHeating:(NSNumber *)enableHeating enableCooling:(NSNumber *)enableCooling enableMassage:(NSNumber *)enableMassage seat:(INCarSeat)seat level:(NSNumber *)level relativeLevelSetting:(INRelativeSetting)relativeLevelSetting
{
  return -[INSetSeatSettingsInCarIntent initWithEnableHeating:enableCooling:enableMassage:seat:level:relativeLevelSetting:carName:](self, "initWithEnableHeating:enableCooling:enableMassage:seat:level:relativeLevelSetting:carName:", enableHeating, enableCooling, enableMassage, seat, level, relativeLevelSetting, 0);
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

  -[INSetSeatSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetSeatSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INSetSeatSettingsInCarIntent)initWithEnableHeating:(NSNumber *)enableHeating enableCooling:(NSNumber *)enableCooling enableMassage:(NSNumber *)enableMassage seat:(INCarSeat)seat level:(NSNumber *)level relativeLevelSetting:(INRelativeSetting)relativeLevelSetting carName:(INSpeakableString *)carName
{
  NSNumber *v15;
  NSNumber *v16;
  NSNumber *v17;
  NSNumber *v18;
  INSpeakableString *v19;
  INSetSeatSettingsInCarIntent *v20;
  INSetSeatSettingsInCarIntent *v21;
  objc_super v23;

  v15 = enableHeating;
  v16 = enableCooling;
  v17 = enableMassage;
  v18 = level;
  v19 = carName;
  v23.receiver = self;
  v23.super_class = (Class)INSetSeatSettingsInCarIntent;
  v20 = -[INIntent init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    -[INSetSeatSettingsInCarIntent setEnableHeating:](v20, "setEnableHeating:", v15);
    -[INSetSeatSettingsInCarIntent setEnableCooling:](v21, "setEnableCooling:", v16);
    -[INSetSeatSettingsInCarIntent setEnableMassage:](v21, "setEnableMassage:", v17);
    -[INSetSeatSettingsInCarIntent setSeat:](v21, "setSeat:", seat);
    -[INSetSeatSettingsInCarIntent setLevel:](v21, "setLevel:", v18);
    -[INSetSeatSettingsInCarIntent setRelativeLevelSetting:](v21, "setRelativeLevelSetting:", relativeLevelSetting);
    -[INSetSeatSettingsInCarIntent setCarName:](v21, "setCarName:", v19);
  }

  return v21;
}

- (NSNumber)enableHeating
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INSetSeatSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasEnableHeating"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INSetSeatSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "enableHeating"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setEnableHeating:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INSetSeatSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setEnableHeating:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasEnableHeating:", 0);

}

- (NSNumber)enableCooling
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INSetSeatSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasEnableCooling"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INSetSeatSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "enableCooling"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setEnableCooling:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INSetSeatSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setEnableCooling:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasEnableCooling:", 0);

}

- (NSNumber)enableMassage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INSetSeatSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasEnableMassage"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INSetSeatSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "enableMassage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setEnableMassage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INSetSeatSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setEnableMassage:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasEnableMassage:", 0);

}

- (INCarSeat)seat
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  INCarSeat v7;

  -[INSetSeatSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSeat");
  -[INSetSeatSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "seat");
  if (v4 && (v6 - 1) <= 0x15)
    v7 = qword_18C311338[v6 - 1];
  else
    v7 = INCarSeatUnknown;

  return v7;
}

- (void)setSeat:(int64_t)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = 0x7FFFFFFFLL;
  if ((unint64_t)(a3 - 1) <= 0xB)
    v3 = dword_18C311304[a3 - 1];
  -[INSetSeatSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((_DWORD)v3 == 0x7FFFFFFF)
    objc_msgSend(v4, "setHasSeat:", 0);
  else
    objc_msgSend(v4, "setSeat:", v3);

}

- (NSNumber)level
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetSeatSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "level");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromInteger(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)setLevel:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSetSeatSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToInteger(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setLevel:", v5);
}

- (INRelativeSetting)relativeLevelSetting
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  INRelativeSetting v7;
  INRelativeSetting v8;

  -[INSetSeatSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasRelativeLevelSetting");
  -[INSetSeatSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "relativeLevelSetting") - 1;
  if (v6 <= 3)
    v7 = v6 + 1;
  else
    v7 = INRelativeSettingUnknown;
  if (v4)
    v8 = v7;
  else
    v8 = INRelativeSettingUnknown;

  return v8;
}

- (void)setRelativeLevelSetting:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INSetSeatSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 3)
    objc_msgSend(v4, "setHasRelativeLevelSetting:", 0);
  else
    objc_msgSend(v4, "setRelativeLevelSetting:");

}

- (INSpeakableString)carName
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetSeatSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetSeatSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setCarName:", v5);
}

- (id)_dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  INCarSeat v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  INRelativeSetting v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[7];
  _QWORD v25[8];

  v25[7] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("enableHeating");
  -[INSetSeatSettingsInCarIntent enableHeating](self, "enableHeating");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v3;
  v25[0] = v3;
  v24[1] = CFSTR("enableCooling");
  -[INSetSeatSettingsInCarIntent enableCooling](self, "enableCooling");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v5;
  v25[1] = v5;
  v24[2] = CFSTR("enableMassage");
  -[INSetSeatSettingsInCarIntent enableMassage](self, "enableMassage");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v25[2] = v7;
  v24[3] = CFSTR("seat");
  v9 = -[INSetSeatSettingsInCarIntent seat](self, "seat", v7);
  if ((unint64_t)(v9 - 1) > 0xB)
    v10 = CFSTR("unknown");
  else
    v10 = off_1E228B018[v9 - 1];
  v11 = v10;
  v25[3] = v11;
  v24[4] = CFSTR("level");
  -[INSetSeatSettingsInCarIntent level](self, "level");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v13;
  v24[5] = CFSTR("relativeLevelSetting");
  v14 = -[INSetSeatSettingsInCarIntent relativeLevelSetting](self, "relativeLevelSetting");
  if ((unint64_t)(v14 - 1) > 3)
    v15 = CFSTR("unknown");
  else
    v15 = off_1E2291BA0[v14 - 1];
  v16 = v15;
  v25[5] = v16;
  v24[6] = CFSTR("carName");
  -[INSetSeatSettingsInCarIntent carName](self, "carName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[6] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)

  if (!v12)
  if (!v8)

  if (!v6)
  if (!v4)

  return v19;
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
  -[INSetSeatSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "level");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedIntegerFromInteger(v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setLevel:", v10);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)domain
{
  return CFSTR("CarPlay");
}

- (id)verb
{
  return CFSTR("SetSeatSettingsInCar");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
