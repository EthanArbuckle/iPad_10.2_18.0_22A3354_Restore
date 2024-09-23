@implementation INPlayMessageSoundIntent

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

  -[INPlayMessageSoundIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INPlayMessageSoundIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 2;
}

- (id)_categoryVerb
{
  return CFSTR("Play");
}

- (INPlayMessageSoundIntent)initWithSoundType:(int64_t)a3 messageIdentifier:(id)a4
{
  id v6;
  INPlayMessageSoundIntent *v7;
  INPlayMessageSoundIntent *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)INPlayMessageSoundIntent;
  v7 = -[INIntent init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[INPlayMessageSoundIntent setSoundType:](v7, "setSoundType:", a3);
    -[INPlayMessageSoundIntent setMessageIdentifier:](v8, "setMessageIdentifier:", v6);
  }

  return v8;
}

- (int64_t)soundType
{
  void *v3;
  int64_t v4;
  void *v5;

  -[INPlayMessageSoundIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v3, "hasSoundType");
  -[INPlayMessageSoundIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "soundType") == 1)
    v4 = v4;
  else
    v4 = 0;

  return v4;
}

- (void)setSoundType:(int64_t)a3
{
  void *v4;
  id v5;

  -[INPlayMessageSoundIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 == 1)
    objc_msgSend(v4, "setSoundType:", 1);
  else
    objc_msgSend(v4, "setHasSoundType:", 0);

}

- (NSString)messageIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[INPlayMessageSoundIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (void)setMessageIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INPlayMessageSoundIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessageIdentifier:", v4);

}

- (id)_dictionaryRepresentation
{
  int64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("soundType");
  v3 = -[INPlayMessageSoundIntent soundType](self, "soundType");
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("outgoingMessage");
  v5 = v4;
  v10[1] = CFSTR("messageIdentifier");
  v11[0] = v5;
  -[INPlayMessageSoundIntent messageIdentifier](self, "messageIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)

  return v8;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INPlayMessageSoundIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  -[INIntent setBackingStore:](self, "setBackingStore:", v5);

}

- (id)domain
{
  return CFSTR("Messages");
}

- (id)verb
{
  return CFSTR("PlayMessageSound");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
