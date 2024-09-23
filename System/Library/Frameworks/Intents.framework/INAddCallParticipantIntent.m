@implementation INAddCallParticipantIntent

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

  -[INAddCallParticipantIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INAddCallParticipantIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INAddCallParticipantIntent)initWithParticipants:(id)a3
{
  id v4;
  INAddCallParticipantIntent *v5;
  INAddCallParticipantIntent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)INAddCallParticipantIntent;
  v5 = -[INIntent init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[INAddCallParticipantIntent setParticipants:](v5, "setParticipants:", v4);

  return v6;
}

- (NSArray)participants
{
  void *v2;
  void *v3;
  void *v4;

  -[INAddCallParticipantIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromContacts(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setParticipants:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INAddCallParticipantIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToContacts(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setParticipants:", v5);
}

- (id)_dictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("participants");
  -[INAddCallParticipantIntent participants](self, "participants");
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
  -[INAddCallParticipantIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "participants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedContactsFromContacts(v9, a3, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setParticipants:", v10);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)domain
{
  return CFSTR("Calls");
}

- (id)verb
{
  return CFSTR("AddCallParticipant");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
