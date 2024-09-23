@implementation INCodableCurrencyAmountAttributeMetadata

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSArray *currencyCodes;
  INCodableCurrencyAmountAttributeMetadata *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)INCodableCurrencyAmountAttributeMetadata;
  -[INCodableNumberAttributeMetadata updateWithDictionary:](&v26, sel_updateWithDictionary_, v4);
  v21 = self;
  -[INCodableCurrencyAmountAttributeMetadata __INCodableDescriptionCurrencyCodesKey](self, "__INCodableDescriptionCurrencyCodesKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (v15)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v16 = v15;
          else
            v16 = 0;
        }
        else
        {
          v16 = 0;
        }
        v17 = v16;

        objc_msgSend(v17, "objectForKey:", CFSTR("CurrencyCode"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v9, "addObject:", v18);
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v12);
  }

  v19 = objc_msgSend(v9, "copy");
  currencyCodes = v21->_currencyCodes;
  v21->_currencyCodes = (NSArray *)v19;

}

- (id)__INCodableDescriptionCurrencyCodesKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableCurrencyAmountAttributeMetadataCurrencyCodesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
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
  objc_super v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)INCodableCurrencyAmountAttributeMetadata;
  -[INCodableNumberAttributeMetadata dictionaryRepresentationWithLocalizer:](&v15, sel_dictionaryRepresentationWithLocalizer_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableCurrencyAmountAttributeMetadata __INCodableDescriptionCurrencyCodesKey](self, "__INCodableDescriptionCurrencyCodesKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  -[INCodableCurrencyAmountAttributeMetadata currencyCodes](self, "currencyCodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v7;
  -[INCodableCurrencyAmountAttributeMetadata __INCodableDescriptionCurrencyCodeKey](self, "__INCodableDescriptionCurrencyCodeKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  -[INCodableCurrencyAmountAttributeMetadata currencyCode](self, "currencyCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  if (!v6)

  objc_msgSend(v12, "if_dictionaryWithNonEmptyValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)defaultValueForIntentDefaultValueProvider
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  INCurrencyAmount *v8;
  id v9;
  void *v10;
  _BYTE v12[20];

  -[INCodableNumberAttributeMetadata defaultValue](self, "defaultValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableCurrencyAmountAttributeMetadata currencyCode](self, "currencyCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[INCodableCurrencyAmountAttributeMetadata currencyCodes](self, "currencyCodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  v8 = 0;
  if (v3 && v6)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3598]);
    objc_msgSend(v3, "decimalValue");
    v10 = (void *)objc_msgSend(v9, "initWithDecimal:", v12);
    v8 = -[INCurrencyAmount initWithAmount:currencyCode:]([INCurrencyAmount alloc], "initWithAmount:currencyCode:", v10, v6);

  }
  return v8;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;
  id v12;

  v11.receiver = self;
  v11.super_class = (Class)INCodableCurrencyAmountAttributeMetadata;
  v12 = 0;
  -[INCodableNumberAttributeMetadata widgetPlistableRepresentationWithParameters:error:](&v11, sel_widgetPlistableRepresentationWithParameters_error_, a3, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  v8 = v7;
  if (v7)
  {
    v9 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }
  else
  {
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_currencyCodes, CFSTR("currencyCodes"));
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
    v9 = (void *)objc_msgSend(v6, "copy");
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INCodableCurrencyAmountAttributeMetadata;
  v4 = a3;
  -[INCodableNumberAttributeMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_currencyCodes, CFSTR("currencyCodes"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));

}

- (INCodableCurrencyAmountAttributeMetadata)initWithCoder:(id)a3
{
  id v4;
  INCodableCurrencyAmountAttributeMetadata *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *currencyCodes;
  uint64_t v12;
  NSString *currencyCode;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INCodableCurrencyAmountAttributeMetadata;
  v5 = -[INCodableNumberAttributeMetadata initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("currencyCodes"));
    v10 = objc_claimAutoreleasedReturnValue();
    currencyCodes = v5->_currencyCodes;
    v5->_currencyCodes = (NSArray *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v12 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v12;

  }
  return v5;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)currencyCodes
{
  return self->_currencyCodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCodes, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  _QWORD *v7;
  id v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;
  id v17;

  v6 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___INCodableCurrencyAmountAttributeMetadata;
  v17 = 0;
  objc_msgSendSuper2(&v16, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v17);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  v9 = v8;
  if (v8)
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    objc_msgSend(v6, "intents_safeObjectForKey:ofType:", CFSTR("currencyCodes"), objc_opt_class());
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v7[10];
    v7[10] = v11;

    objc_msgSend(v6, "intents_stringForKey:", CFSTR("currencyCode"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v7[9];
    v7[9] = v13;

    v10 = v7;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)__INTypeCodableDescriptionCurrencyCodesKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableCurrencyAmountAttributeMetadataCurrencyCodesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionCurrencyCodeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableCurrencyAmountAttributeMetadataCurrencyCodeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionCurrencyCodesKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableCurrencyAmountAttributeMetadataCurrencyCodesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionCurrencyCodeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableCurrencyAmountAttributeMetadataCurrencyCodeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionCurrencyCodeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableCurrencyAmountAttributeMetadataCurrencyCodeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
