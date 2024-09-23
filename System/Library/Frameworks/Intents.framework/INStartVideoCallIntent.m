@implementation INStartVideoCallIntent

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

  -[INStartVideoCallIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INStartVideoCallIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 18;
}

- (id)_categoryVerb
{
  return CFSTR("Call");
}

- (INStartVideoCallIntent)initWithContacts:(NSArray *)contacts
{
  NSArray *v4;
  INStartVideoCallIntent *v5;
  INStartVideoCallIntent *v6;
  objc_super v8;

  v4 = contacts;
  v8.receiver = self;
  v8.super_class = (Class)INStartVideoCallIntent;
  v5 = -[INIntent init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[INStartVideoCallIntent setContacts:](v5, "setContacts:", v4);

  return v6;
}

- (int64_t)audioRoute
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  int64_t v7;

  -[INStartVideoCallIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasAudioRoute");
  -[INStartVideoCallIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "audioRoute");
  if (v4 && (v6 - 2) <= 2)
    v7 = qword_18C311CB0[v6 - 2];
  else
    v7 = 0;

  return v7;
}

- (void)setAudioRoute:(int64_t)a3
{
  uint64_t v3;
  id v4;

  switch(a3)
  {
    case 1:
      v3 = 2;
      break;
    case 1000:
      v3 = 4;
      break;
    case 2:
      v3 = 3;
      break;
    default:
      -[INStartVideoCallIntent _typedBackingStore](self, "_typedBackingStore");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHasAudioRoute:", 0);
      goto LABEL_9;
  }
  -[INStartVideoCallIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAudioRoute:", v3);
LABEL_9:

}

- (NSArray)contacts
{
  void *v2;
  void *v3;
  void *v4;

  -[INStartVideoCallIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDialingContacts(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setContacts:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INStartVideoCallIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDialingContacts(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setContacts:", v5);
}

- (INStartCallRequestMetadata)callRequestMetadata
{
  void *v2;
  INStartCallRequestMetadata *v3;
  void *v4;

  -[INStartVideoCallIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callRequestMetadata");
  v3 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromStartCallRequestMetadata(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INStartCallRequestMetadata *)v4;
}

- (void)setCallRequestMetadata:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INStartVideoCallIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToStartCallRequestMetadata(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setCallRequestMetadata:", v5);
}

- (id)_dictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("contacts");
  -[INStartVideoCallIntent contacts](self, "contacts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)

  return v4;
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
  -[INStartVideoCallIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "contacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedDialingContactsFromDialingContacts(v9, a3, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setContacts:", v10);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)domain
{
  return CFSTR("Calls");
}

- (id)verb
{
  return CFSTR("StartVideoCall");
}

- (BOOL)configureAttributeSet:(id)a3 includingData:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[INStartVideoCallIntent contacts](self, "contacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        INPersonToCSPerson(*(void **)(*((_QWORD *)&v21 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  objc_msgSend(v6, "setPrimaryRecipients:", v8);
  NSStringFromSelector(sel_displayName);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRecipientNames:", v16);

  objc_msgSend(v8, "valueForKeyPath:", CFSTR("handles.@distinctUnionOfArrays.self"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRecipientAddresses:", v17);

  v20.receiver = self;
  v20.super_class = (Class)INStartVideoCallIntent;
  v18 = -[INIntent configureAttributeSet:includingData:](&v20, sel_configureAttributeSet_includingData_, v6, v4);

  return v18;
}

- (id)_spotlightContentType
{
  __CFString *v2;

  v2 = CFSTR("com.apple.siri.interaction.video");
  return CFSTR("com.apple.siri.interaction.video");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_titleWithLocalizer:(id)a3 fromBundleURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  -[INIntent _intents_bundleIdForDisplay](self, "_intents_bundleIdForDisplay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.facetime"));

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    INLocalizedStringWithLocalizer(CFSTR("FaceTime %@"), CFSTR("FaceTime %@"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[INStartVideoCallIntent contacts](self, "contacts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_intents_readableTitleWithLocalizer:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)INStartVideoCallIntent;
    -[INIntent _titleWithLocalizer:fromBundleURL:](&v16, sel__titleWithLocalizer_fromBundleURL_, v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

@end
