@implementation INPaymentAccountResolutionResult

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
  if (objc_msgSend(v6, "valueType") == 61)
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
                INIntentSlotValueTransformToFinancialAccountValue(*(void **)(*((_QWORD *)&v17 + 1) + 8 * i));
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                -[_INPBIntentSlotValue addPayloadFinancialAccountValue:](v7, "addPayloadFinancialAccountValue:", v15);

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
      INIntentSlotValueTransformToFinancialAccountValue(v5);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10)
        -[_INPBIntentSlotValue addPayloadFinancialAccountValue:](v7, "addPayloadFinancialAccountValue:", v10);
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
  id v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "valueType") == 61 && objc_msgSend(v6, "valueStyle") != 3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v5;
      objc_msgSend(v8, "nickname");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "spokenPhrase");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = v10;
      }
      else
      {
        objc_msgSend(v8, "organizationName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "spokenPhrase");
        v12 = (id)objc_claimAutoreleasedReturnValue();

        v7 = v13;
      }

      v7 = v12;
    }
  }

  return v7;
}

@end
