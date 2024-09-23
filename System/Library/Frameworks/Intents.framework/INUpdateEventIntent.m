@implementation INUpdateEventIntent

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

  -[INUpdateEventIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INUpdateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INUpdateEventIntent)initWithTargetEventIdentifier:(id)a3 setTitle:(id)a4 setDateTimeRange:(id)a5 setLocation:(id)a6 addParticipants:(id)a7 removeParticipants:(id)a8 updateAllOccurrences:(id)a9 removeLocation:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  INUpdateEventIntent *v24;
  INUpdateEventIntent *v25;
  objc_super v27;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v27.receiver = self;
  v27.super_class = (Class)INUpdateEventIntent;
  v24 = -[INIntent init](&v27, sel_init);
  v25 = v24;
  if (v24)
  {
    -[INUpdateEventIntent setTargetEventIdentifier:](v24, "setTargetEventIdentifier:", v16);
    -[INUpdateEventIntent setSetTitle:](v25, "setSetTitle:", v17);
    -[INUpdateEventIntent setSetDateTimeRange:](v25, "setSetDateTimeRange:", v18);
    -[INUpdateEventIntent setSetLocation:](v25, "setSetLocation:", v19);
    -[INUpdateEventIntent setAddParticipants:](v25, "setAddParticipants:", v20);
    -[INUpdateEventIntent setRemoveParticipants:](v25, "setRemoveParticipants:", v21);
    -[INUpdateEventIntent setUpdateAllOccurrences:](v25, "setUpdateAllOccurrences:", v22);
    -[INUpdateEventIntent setRemoveLocation:](v25, "setRemoveLocation:", v23);
  }

  return v25;
}

- (NSString)targetEventIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[INUpdateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetEventIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (void)setTargetEventIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INUpdateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTargetEventIdentifier:", v4);

}

- (NSString)setTitle
{
  void *v2;
  void *v3;
  void *v4;

  -[INUpdateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (void)setSetTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INUpdateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetTitle:", v4);

}

- (INDateComponentsRange)setDateTimeRange
{
  void *v2;
  void *v3;
  void *v4;

  -[INUpdateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDateTimeRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDateTimeRangeValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INDateComponentsRange *)v4;
}

- (void)setSetDateTimeRange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INUpdateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDateTimeRangeValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSetDateTimeRange:", v5);
}

- (CLPlacemark)setLocation
{
  void *v2;
  void *v3;
  void *v4;

  -[INUpdateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromLocation(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLPlacemark *)v4;
}

- (void)setSetLocation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INUpdateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToLocation(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSetLocation:", v5);
}

- (NSArray)addParticipants
{
  void *v2;
  void *v3;
  void *v4;

  -[INUpdateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addParticipants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromContacts(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setAddParticipants:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INUpdateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToContacts(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAddParticipants:", v5);
}

- (NSArray)removeParticipants
{
  void *v2;
  void *v3;
  void *v4;

  -[INUpdateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeParticipants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromContacts(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setRemoveParticipants:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INUpdateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToContacts(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setRemoveParticipants:", v5);
}

- (NSNumber)updateAllOccurrences
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INUpdateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasUpdateAllOccurrences"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INUpdateEventIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "updateAllOccurrences"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setUpdateAllOccurrences:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INUpdateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setUpdateAllOccurrences:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasUpdateAllOccurrences:", 0);

}

- (NSNumber)removeLocation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INUpdateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasRemoveLocation"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INUpdateEventIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "removeLocation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setRemoveLocation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INUpdateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setRemoveLocation:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasRemoveLocation:", 0);

}

- (id)_dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[8];
  _QWORD v28[10];

  v28[8] = *MEMORY[0x1E0C80C00];
  v27[0] = CFSTR("targetEventIdentifier");
  -[INUpdateEventIntent targetEventIdentifier](self, "targetEventIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v3;
  v28[0] = v3;
  v27[1] = CFSTR("setTitle");
  -[INUpdateEventIntent setTitle](self, "setTitle");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v5;
  v28[1] = v5;
  v27[2] = CFSTR("setDateTimeRange");
  -[INUpdateEventIntent setDateTimeRange](self, "setDateTimeRange");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v7;
  v28[2] = v7;
  v27[3] = CFSTR("setLocation");
  -[INUpdateEventIntent setLocation](self, "setLocation");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v9;
  v28[3] = v9;
  v27[4] = CFSTR("addParticipants");
  -[INUpdateEventIntent addParticipants](self, "addParticipants");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v26 = v4;
  v20 = (void *)v11;
  v28[4] = v11;
  v27[5] = CFSTR("removeParticipants");
  -[INUpdateEventIntent removeParticipants](self, "removeParticipants");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[5] = v14;
  v27[6] = CFSTR("updateAllOccurrences");
  -[INUpdateEventIntent updateAllOccurrences](self, "updateAllOccurrences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[6] = v16;
  v27[7] = CFSTR("removeLocation");
  -[INUpdateEventIntent removeLocation](self, "removeLocation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[7] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 8);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)

  if (!v15)
  if (!v13)

  if (!v12)
  if (!v10)

  if (!v8)
  if (!v6)

  if (!v26)
  return v25;
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
  id v15;

  v6 = a4;
  -[INUpdateEventIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "setLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedLocationFromLocation(v9, a3, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSetLocation:", v10);

  objc_msgSend(v7, "addParticipants");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedContactsFromContacts(v11, a3, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAddParticipants:", v12);
  objc_msgSend(v7, "removeParticipants");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedContactsFromContacts(v13, a3, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setRemoveParticipants:", v14);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)domain
{
  return CFSTR("CalendarEvent");
}

- (id)verb
{
  return CFSTR("UpdateEvent");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
