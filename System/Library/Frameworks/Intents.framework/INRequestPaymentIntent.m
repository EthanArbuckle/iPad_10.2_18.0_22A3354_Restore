@implementation INRequestPaymentIntent

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

  -[INRequestPaymentIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INRequestPaymentIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 15;
}

- (id)_categoryVerb
{
  return CFSTR("Request");
}

- (INRequestPaymentIntent)initWithPayer:(INPerson *)payer currencyAmount:(INCurrencyAmount *)currencyAmount note:(NSString *)note
{
  INPerson *v8;
  INCurrencyAmount *v9;
  NSString *v10;
  INRequestPaymentIntent *v11;
  INRequestPaymentIntent *v12;
  objc_super v14;

  v8 = payer;
  v9 = currencyAmount;
  v10 = note;
  v14.receiver = self;
  v14.super_class = (Class)INRequestPaymentIntent;
  v11 = -[INIntent init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[INRequestPaymentIntent setPayer:](v11, "setPayer:", v8);
    -[INRequestPaymentIntent setCurrencyAmount:](v12, "setCurrencyAmount:", v9);
    -[INRequestPaymentIntent setNote:](v12, "setNote:", v10);
  }

  return v12;
}

- (INPerson)payer
{
  void *v2;
  void *v3;
  void *v4;

  -[INRequestPaymentIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "payer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromContact(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INPerson *)v4;
}

- (void)setPayer:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INRequestPaymentIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToContact(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPayer:", v5);
}

- (INCurrencyAmount)currencyAmount
{
  void *v2;
  void *v3;
  void *v4;

  -[INRequestPaymentIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currencyAmount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromCurrencyAmount(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INCurrencyAmount *)v4;
}

- (void)setCurrencyAmount:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INRequestPaymentIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToCurrencyAmount(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setCurrencyAmount:", v5);
}

- (NSString)note
{
  void *v2;
  void *v3;
  void *v4;

  -[INRequestPaymentIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setNote:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INRequestPaymentIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setNote:", v5);
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
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("payer");
  -[INRequestPaymentIntent payer](self, "payer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("currencyAmount");
  -[INRequestPaymentIntent currencyAmount](self, "currencyAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("note");
  -[INRequestPaymentIntent note](self, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)

  if (!v5)
  if (!v3)

  return v9;
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
  -[INRequestPaymentIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "payer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedContactFromContact(v9, a3, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPayer:", v10);

  objc_msgSend(v7, "currencyAmount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedCurrencyAmountFromCurrencyAmount(v11, a3, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCurrencyAmount:", v12);

  objc_msgSend(v7, "note");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedStringFromString(v13, a3, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setNote:", v14);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (BOOL)_isUserConfirmationRequired
{
  return 1;
}

- (id)domain
{
  return CFSTR("Payments");
}

- (id)verb
{
  return CFSTR("RequestPayment");
}

- (BOOL)configureAttributeSet:(id)a3 includingData:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[INRequestPaymentIntent payer](self, "payer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, 0);

  v10 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        INPersonToCSPerson(*(void **)(*((_QWORD *)&v24 + 1) + 8 * v15));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  objc_msgSend(v6, "setPrimaryRecipients:", v10);
  NSStringFromSelector(sel_displayName);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRecipientNames:", v18);

  objc_msgSend(v10, "valueForKeyPath:", CFSTR("handles.@distinctUnionOfArrays.self"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRecipientAddresses:", v19);

  -[INRequestPaymentIntent note](self, "note");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextContent:", v20);

  v23.receiver = self;
  v23.super_class = (Class)INRequestPaymentIntent;
  v21 = -[INIntent configureAttributeSet:includingData:](&v23, sel_configureAttributeSet_includingData_, v6, v4);

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
