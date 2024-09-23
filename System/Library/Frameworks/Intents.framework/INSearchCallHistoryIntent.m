@implementation INSearchCallHistoryIntent

- (INSearchCallHistoryIntent)initWithDateCreated:(id)a3 recipient:(id)a4 callCapabilities:(unint64_t)a5 callTypes:(unint64_t)a6
{
  return -[INSearchCallHistoryIntent initWithDateCreated:recipient:callCapabilities:callTypes:unseen:](self, "initWithDateCreated:recipient:callCapabilities:callTypes:unseen:", a3, a4, a5, a6, &unk_1E23E9AF0);
}

- (INSearchCallHistoryIntent)initWithCallType:(INCallRecordType)callType dateCreated:(INDateComponentsRange *)dateCreated recipient:(INPerson *)recipient callCapabilities:(INCallCapabilityOptions)callCapabilities
{
  uint64_t v7;

  if ((unint64_t)(callType - 1) > 7)
    v7 = 0;
  else
    v7 = qword_18C311BE0[callType - 1];
  return -[INSearchCallHistoryIntent initWithDateCreated:recipient:callCapabilities:callTypes:](self, "initWithDateCreated:recipient:callCapabilities:callTypes:", dateCreated, recipient, callCapabilities, v7);
}

- (INCallRecordType)callType
{
  void *v2;
  INCallRecordType v3;
  unsigned int v4;

  -[INSearchCallHistoryIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "callTypesCount"))
  {
    v3 = INCallRecordTypeUnknown;
    v4 = objc_msgSend(v2, "callTypesAtIndex:", 0) - 2;
    if (v4 <= 8)
      v3 = qword_18C311768[v4];
  }
  else
  {
    v3 = INCallRecordTypeUnknown;
  }

  return v3;
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

  -[INSearchCallHistoryIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSearchCallHistoryIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INSearchCallHistoryIntent)initWithDateCreated:(INDateComponentsRange *)dateCreated recipient:(INPerson *)recipient callCapabilities:(INCallCapabilityOptions)callCapabilities callTypes:(INCallRecordTypeOptions)callTypes unseen:(NSNumber *)unseen
{
  INDateComponentsRange *v12;
  INPerson *v13;
  NSNumber *v14;
  INSearchCallHistoryIntent *v15;
  INSearchCallHistoryIntent *v16;
  objc_super v18;

  v12 = dateCreated;
  v13 = recipient;
  v14 = unseen;
  v18.receiver = self;
  v18.super_class = (Class)INSearchCallHistoryIntent;
  v15 = -[INIntent init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    -[INSearchCallHistoryIntent setDateCreated:](v15, "setDateCreated:", v12);
    -[INSearchCallHistoryIntent setRecipient:](v16, "setRecipient:", v13);
    -[INSearchCallHistoryIntent setCallCapabilities:](v16, "setCallCapabilities:", callCapabilities);
    -[INSearchCallHistoryIntent setCallTypes:](v16, "setCallTypes:", callTypes);
    -[INSearchCallHistoryIntent setUnseen:](v16, "setUnseen:", v14);
  }

  return v16;
}

- (INDateComponentsRange)dateCreated
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchCallHistoryIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateCreated");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDateTimeRange(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INDateComponentsRange *)v4;
}

- (void)setDateCreated:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSearchCallHistoryIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDateTimeRange(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDateCreated:", v5);
}

- (INPerson)recipient
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchCallHistoryIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromContact(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INPerson *)v4;
}

- (void)setRecipient:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSearchCallHistoryIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToContact(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setRecipient:", v5);
}

- (INCallCapabilityOptions)callCapabilities
{
  void *v3;
  uint64_t v4;
  INCallCapabilityOptions v5;
  uint64_t i;
  void *v7;
  int v8;
  uint64_t v9;

  -[INSearchCallHistoryIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "callCapabilitiesCount");

  v5 = 0;
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      -[INSearchCallHistoryIntent _typedBackingStore](self, "_typedBackingStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "callCapabilitiesAtIndex:", i);
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

- (void)setCallCapabilities:(unint64_t)a3
{
  void *v5;
  _QWORD v6[5];

  -[INSearchCallHistoryIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearCallCapabilities");

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__INSearchCallHistoryIntent_setCallCapabilities___block_invoke;
  v6[3] = &unk_1E2295130;
  v6[4] = self;
  INCallCapabilityOptionsEnumerateBackingTypes(a3, v6);
}

- (INCallRecordTypeOptions)callTypes
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  INCallRecordTypeOptions v8;

  v8 = 0;
  -[INSearchCallHistoryIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "callTypesCount");

  if (!v4)
    return 0;
  for (i = 0; i != v4; ++i)
  {
    -[INSearchCallHistoryIntent _typedBackingStore](self, "_typedBackingStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    INCallRecordTypeOptionsAddBackingType((uint64_t *)&v8, objc_msgSend(v6, "callTypesAtIndex:", i));

  }
  return v8;
}

- (void)setCallTypes:(unint64_t)a3
{
  void *v5;
  _QWORD v6[5];

  -[INSearchCallHistoryIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearCallTypes");

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__INSearchCallHistoryIntent_setCallTypes___block_invoke;
  v6[3] = &unk_1E2295130;
  v6[4] = self;
  INCallRecordTypeOptionsEnumerateBackingTypes(a3, v6);
}

- (int64_t)preferredCallProvider
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;

  -[INSearchCallHistoryIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPreferredCallProvider");
  -[INSearchCallHistoryIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "preferredCallProvider") - 2;
  if (v6 <= 2)
    v7 = v6 + 1;
  else
    v7 = 0;
  if (v4)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)setPreferredCallProvider:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INSearchCallHistoryIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 2)
    objc_msgSend(v4, "setHasPreferredCallProvider:", 0);
  else
    objc_msgSend(v4, "setPreferredCallProvider:");

}

- (NSNumber)unseen
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INSearchCallHistoryIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasUnseen"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INSearchCallHistoryIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "unseen"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setUnseen:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INSearchCallHistoryIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setUnseen:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasUnseen:", 0);

}

- (id)_dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("dateCreated");
  -[INSearchCallHistoryIntent dateCreated](self, "dateCreated");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v3;
  v16[1] = CFSTR("recipient");
  -[INSearchCallHistoryIntent recipient](self, "recipient", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v6;
  v16[2] = CFSTR("callCapabilities");
  INCallCapabilityOptionsGetNames(-[INSearchCallHistoryIntent callCapabilities](self, "callCapabilities"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v8;
  v16[3] = CFSTR("callTypes");
  INCallRecordTypeOptionsGetNames(-[INSearchCallHistoryIntent callTypes](self, "callTypes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[3] = v10;
  v16[4] = CFSTR("unseen");
  -[INSearchCallHistoryIntent unseen](self, "unseen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)

  if (!v9)
  if (!v7)

  if (!v5)
  if (!v4)

  return v13;
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
  -[INSearchCallHistoryIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "dateCreated");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDateCreated:", v10);

  objc_msgSend(v7, "recipient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedContactFromContact(v11, a3, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setRecipient:", v12);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)domain
{
  return CFSTR("Calls");
}

- (id)verb
{
  return CFSTR("SearchCallHistory");
}

void __42__INSearchCallHistoryIntent_setCallTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_typedBackingStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addCallTypes:", a2);

}

void __49__INSearchCallHistoryIntent_setCallCapabilities___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_typedBackingStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addCallCapabilities:", a2);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
