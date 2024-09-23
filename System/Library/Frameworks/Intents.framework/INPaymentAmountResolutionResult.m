@implementation INPaymentAmountResolutionResult

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5;
  id v6;
  _INPBIntentSlotValue *v7;
  void *v8;
  char isKindOfClass;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if (objc_msgSend(v6, "valueType") == 62)
  {
    -[_INPBIntentSlotValue setType:](v7, "setType:", 1000);
    if (objc_msgSend(v6, "valueStyle") == 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v10 = v5;
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v18;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v18 != v13)
                  objc_enumerationMutation(v10);
                INIntentSlotValueTransformToPaymentAmountValue(*(void **)(*((_QWORD *)&v17 + 1) + 8 * i));
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                -[_INPBIntentSlotValue addPayloadPaymentAmountValue:](v7, "addPayloadPaymentAmountValue:", v15);

              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
            }
            while (v12);
          }
LABEL_16:

          goto LABEL_17;
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      INIntentSlotValueTransformToPaymentAmountValue(v5);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10)
        -[_INPBIntentSlotValue addPayloadPaymentAmountValue:](v7, "addPayloadPaymentAmountValue:", v10);
      goto LABEL_16;
    }
  }
LABEL_17:

  return v7;
}

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "valueType") == 62 && objc_msgSend(v6, "valueStyle") != 3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v5;
      objc_msgSend(v8, "amount");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v9, "amount");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "currencyCode");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ %@"), v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v12;
      }
      else
      {
        v15 = 0;
      }

      v16 = objc_msgSend(v8, "amountType");
      if ((unint64_t)(v16 - 1) > 5)
        v17 = CFSTR("unknown");
      else
        v17 = off_1E228D238[v16 - 1];
      v18 = v17;
      if ((-[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("unknown")) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (%@)"), v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByAppendingString:", v19);
        v20 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v20;
      }

      v7 = v15;
    }
  }

  return v7;
}

@end
