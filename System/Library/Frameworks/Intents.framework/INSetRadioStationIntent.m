@implementation INSetRadioStationIntent

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

  -[INSetRadioStationIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetRadioStationIntent _typedBackingStore](self, "_typedBackingStore");
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

- (INSetRadioStationIntent)initWithRadioType:(INRadioType)radioType frequency:(NSNumber *)frequency stationName:(NSString *)stationName channel:(NSString *)channel presetNumber:(NSNumber *)presetNumber
{
  NSNumber *v12;
  NSString *v13;
  NSString *v14;
  NSNumber *v15;
  INSetRadioStationIntent *v16;
  INSetRadioStationIntent *v17;
  objc_super v19;

  v12 = frequency;
  v13 = stationName;
  v14 = channel;
  v15 = presetNumber;
  v19.receiver = self;
  v19.super_class = (Class)INSetRadioStationIntent;
  v16 = -[INIntent init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    -[INSetRadioStationIntent setRadioType:](v16, "setRadioType:", radioType);
    -[INSetRadioStationIntent setFrequency:](v17, "setFrequency:", v12);
    -[INSetRadioStationIntent setStationName:](v17, "setStationName:", v13);
    -[INSetRadioStationIntent setChannel:](v17, "setChannel:", v14);
    -[INSetRadioStationIntent setPresetNumber:](v17, "setPresetNumber:", v15);
  }

  return v17;
}

- (INRadioType)radioType
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  INRadioType v7;
  INRadioType v8;

  -[INSetRadioStationIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasRadioType");
  -[INSetRadioStationIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "radioType") - 1;
  if (v6 <= 4)
    v7 = v6 + 1;
  else
    v7 = INRadioTypeUnknown;
  if (v4)
    v8 = v7;
  else
    v8 = INRadioTypeUnknown;

  return v8;
}

- (void)setRadioType:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INSetRadioStationIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 4)
    objc_msgSend(v4, "setHasRadioType:", 0);
  else
    objc_msgSend(v4, "setRadioType:");

}

- (NSNumber)frequency
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetRadioStationIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frequency");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDouble(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)setFrequency:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSetRadioStationIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDouble(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setFrequency:", v5);
}

- (NSString)stationName
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetRadioStationIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setStationName:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSetRadioStationIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setStationName:", v5);
}

- (NSString)channel
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetRadioStationIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "channel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setChannel:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSetRadioStationIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setChannel:", v5);
}

- (NSNumber)presetNumber
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetRadioStationIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presetNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromInteger(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)setPresetNumber:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSetRadioStationIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToInteger(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPresetNumber:", v5);
}

- (id)_dictionaryRepresentation
{
  INRadioType v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("radioType");
  v3 = -[INSetRadioStationIntent radioType](self, "radioType");
  if ((unint64_t)(v3 - 1) > 4)
    v4 = CFSTR("unknown");
  else
    v4 = off_1E228BFA8[v3 - 1];
  v5 = v4;
  v17[0] = v5;
  v16[1] = CFSTR("frequency");
  -[INSetRadioStationIntent frequency](self, "frequency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v7;
  v16[2] = CFSTR("stationName");
  -[INSetRadioStationIntent stationName](self, "stationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v9;
  v16[3] = CFSTR("channel");
  -[INSetRadioStationIntent channel](self, "channel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[3] = v11;
  v16[4] = CFSTR("presetNumber");
  -[INSetRadioStationIntent presetNumber](self, "presetNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)

  if (!v10)
  if (!v8)

  if (!v6)
  return v14;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a4;
  -[INSetRadioStationIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "frequency");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedDoubleFromDouble(v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrequency:", v10);

  objc_msgSend(v7, "stationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedStringFromString(v11, a3, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStationName:", v12);

  objc_msgSend(v7, "channel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedStringFromString(v13, a3, v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setChannel:", v14);

  objc_msgSend(v7, "presetNumber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedIntegerFromInteger(v15, a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPresetNumber:", v16);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)domain
{
  return CFSTR("Radio");
}

- (id)verb
{
  return CFSTR("SetRadioStation");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
