@implementation INRunVoiceCommandIntent

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

  -[INRunVoiceCommandIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INRunVoiceCommandIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INRunVoiceCommandIntent)initWithVoiceCommand:(id)a3 originDevice:(id)a4 executionResult:(id)a5 previousIntentIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  INRunVoiceCommandIntent *v14;
  INRunVoiceCommandIntent *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)INRunVoiceCommandIntent;
  v14 = -[INIntent init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[INRunVoiceCommandIntent setVoiceCommand:](v14, "setVoiceCommand:", v10);
    -[INRunVoiceCommandIntent setOriginDevice:](v15, "setOriginDevice:", v11);
    -[INRunVoiceCommandIntent setExecutionResult:](v15, "setExecutionResult:", v12);
    -[INRunVoiceCommandIntent setPreviousIntentIdentifier:](v15, "setPreviousIntentIdentifier:", v13);
  }

  return v15;
}

- (INRunVoiceCommandIntent)initWithVoiceCommand:(id)a3 originDevice:(id)a4
{
  return -[INRunVoiceCommandIntent initWithVoiceCommand:originDevice:executionResult:previousIntentIdentifier:](self, "initWithVoiceCommand:originDevice:executionResult:previousIntentIdentifier:", a3, a4, 0, 0);
}

- (INRunVoiceCommandIntent)initWithVoiceCommand:(id)a3 originDevice:(id)a4 executionResult:(id)a5
{
  return -[INRunVoiceCommandIntent initWithVoiceCommand:originDevice:executionResult:previousIntentIdentifier:](self, "initWithVoiceCommand:originDevice:executionResult:previousIntentIdentifier:", a3, a4, a5, 0);
}

- (INSpeakableString)voiceCommand
{
  void *v2;
  void *v3;
  void *v4;

  -[INRunVoiceCommandIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "voiceCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INSpeakableString *)v4;
}

- (void)setVoiceCommand:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INRunVoiceCommandIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setVoiceCommand:", v5);
}

- (INVoiceCommandDeviceInformation)originDevice
{
  void *v2;
  void *v3;
  void *v4;

  -[INRunVoiceCommandIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromVoiceCommandDeviceInformation(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INVoiceCommandDeviceInformation *)v4;
}

- (void)setOriginDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INRunVoiceCommandIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToVoiceCommandDeviceInformation(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setOriginDevice:", v5);
}

- (INIntentExecutionResult)executionResult
{
  void *v2;
  void *v3;
  void *v4;

  -[INRunVoiceCommandIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executionResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromIntentExecutionResult(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INIntentExecutionResult *)v4;
}

- (void)setExecutionResult:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INRunVoiceCommandIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToIntentExecutionResult(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setExecutionResult:", v5);
}

- (NSString)previousIntentIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[INRunVoiceCommandIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previousIntentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (void)setPreviousIntentIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INRunVoiceCommandIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreviousIntentIdentifier:", v4);

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
  v13[0] = CFSTR("voiceCommand");
  -[INRunVoiceCommandIntent voiceCommand](self, "voiceCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v4;
  v13[1] = CFSTR("originDevice");
  -[INRunVoiceCommandIntent originDevice](self, "originDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v6;
  v13[2] = CFSTR("executionResult");
  -[INRunVoiceCommandIntent executionResult](self, "executionResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v8;
  v13[3] = CFSTR("previousIntentIdentifier");
  -[INRunVoiceCommandIntent previousIntentIdentifier](self, "previousIntentIdentifier");
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
  void *v5;
  id v6;

  -[INRunVoiceCommandIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  -[INIntent setBackingStore:](self, "setBackingStore:", v5);

}

- (id)domain
{
  return CFSTR("VoiceCommands");
}

- (id)verb
{
  return CFSTR("RunVoiceCommand");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_intents_enumerateObjectsOfClass:(Class)a3 withBlock:(id)a4
{
  return 0;
}

@end
