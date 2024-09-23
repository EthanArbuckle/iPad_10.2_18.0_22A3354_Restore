@implementation INActivateCarSignalIntent

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

  -[INActivateCarSignalIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INActivateCarSignalIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INActivateCarSignalIntent)initWithCarName:(INSpeakableString *)carName signals:(INCarSignalOptions)signals
{
  INSpeakableString *v6;
  INActivateCarSignalIntent *v7;
  INActivateCarSignalIntent *v8;
  objc_super v10;

  v6 = carName;
  v10.receiver = self;
  v10.super_class = (Class)INActivateCarSignalIntent;
  v7 = -[INIntent init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[INActivateCarSignalIntent setCarName:](v7, "setCarName:", v6);
    -[INActivateCarSignalIntent setSignals:](v8, "setSignals:", signals);
  }

  return v8;
}

- (INSpeakableString)carName
{
  void *v2;
  void *v3;
  void *v4;

  -[INActivateCarSignalIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INActivateCarSignalIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setCarName:", v5);
}

- (INCarSignalOptions)signals
{
  void *v3;
  uint64_t v4;
  INCarSignalOptions v5;
  uint64_t i;
  void *v7;
  int v8;
  uint64_t v9;

  -[INActivateCarSignalIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "signalsCount");

  v5 = 0;
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      -[INActivateCarSignalIntent _typedBackingStore](self, "_typedBackingStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "signalsAtIndex:", i);
      v9 = v5 | 1;
      if (v8 != 1)
        v9 = v5;
      if (v8 == 2)
        v5 |= 2uLL;
      else
        v5 = v9;

    }
  }
  return v5;
}

- (void)setSignals:(unint64_t)a3
{
  void *v5;
  _QWORD v6[5];

  -[INActivateCarSignalIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearSignals");

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__INActivateCarSignalIntent_setSignals___block_invoke;
  v6[3] = &unk_1E2295130;
  v6[4] = self;
  INCarSignalOptionsEnumerateBackingTypes(a3, v6);
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
  v9[0] = CFSTR("carName");
  -[INActivateCarSignalIntent carName](self, "carName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("signals");
  v10[0] = v4;
  INCarSignalOptionsGetNames(-[INActivateCarSignalIntent signals](self, "signals"));
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

  -[INActivateCarSignalIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
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
  return CFSTR("ActivateCarSignal");
}

void __40__INActivateCarSignalIntent_setSignals___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_typedBackingStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSignals:", a2);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
