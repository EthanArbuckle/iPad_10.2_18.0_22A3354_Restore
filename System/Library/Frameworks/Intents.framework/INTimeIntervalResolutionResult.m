@implementation INTimeIntervalResolutionResult

+ (INTimeIntervalResolutionResult)successWithResolvedTimeInterval:(NSTimeInterval)resolvedTimeInterval
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", resolvedTimeInterval);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resolutionResultSuccessWithResolvedValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (INTimeIntervalResolutionResult *)v5;
}

+ (INTimeIntervalResolutionResult)confirmationRequiredWithTimeIntervalToConfirm:(NSTimeInterval)timeIntervalToConfirm
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", timeIntervalToConfirm);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resolutionResultConfirmationRequiredWithItemToConfirm:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (INTimeIntervalResolutionResult *)v5;
}

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
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  _INPBDoubleList *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if (objc_msgSend(v6, "valueType") == 21)
  {
    -[_INPBIntentSlotValue setType:](v7, "setType:", 2);
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
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v36;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v36 != v13)
                  objc_enumerationMutation(v10);
                INIntentSlotValueTransformToDouble(*(void **)(*((_QWORD *)&v35 + 1) + 8 * i));
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "values");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "firstObject");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                -[_INPBIntentSlotValue addPayloadDoubleValue:](v7, "addPayloadDoubleValue:", v17);

              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
            }
            while (v12);
          }
          goto LABEL_27;
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      INIntentSlotValueTransformToDouble(v5);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "values");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INPBIntentSlotValue addPayloadDoubleValue:](v7, "addPayloadDoubleValue:", v29);

LABEL_27:
    }
  }
  else if (objc_msgSend(v6, "valueType") == 22)
  {
    -[_INPBIntentSlotValue setType:](v7, "setType:", 51);
    if (objc_msgSend(v6, "valueStyle") != 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v19 = objc_opt_isKindOfClass();

        if ((v19 & 1) != 0)
        {
          v20 = v5;
          v21 = objc_alloc_init(_INPBDoubleList);
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v22 = v20;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v32;
            do
            {
              for (j = 0; j != v24; ++j)
              {
                if (*(_QWORD *)v32 != v25)
                  objc_enumerationMutation(v22);
                INIntentSlotValueTransformToDouble(*(void **)(*((_QWORD *)&v31 + 1) + 8 * j));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[_INPBDoubleList addDataString:](v21, "addDataString:", v27, (_QWORD)v31);

              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            }
            while (v24);
          }

          -[_INPBIntentSlotValue addPayloadDoubleList:](v7, "addPayloadDoubleList:", v21);
        }
      }
    }
  }
  else if (objc_msgSend(v6, "valueType") == 4 || objc_msgSend(v6, "valueType") == 3)
  {
    -[_INPBIntentSlotValue setType:](v7, "setType:", 103);
    if (objc_msgSend(v6, "valueStyle") != 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "doubleValue");
        -[_INPBIntentSlotValue addPayloadPrimitiveDouble:](v7, "addPayloadPrimitiveDouble:");
      }
    }
  }

  return v7;
}

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  uint64_t v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "groupingSeparator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "valueType") != 21 && objc_msgSend(v6, "valueType") != 4 && objc_msgSend(v6, "valueType") != 3)
  {
    if (objc_msgSend(v6, "valueType") != 22)
      goto LABEL_11;
LABEL_5:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v5, "valueForKey:", CFSTR("stringValue"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "if_escapedComponentsJoinedByString:forLocale:", v9, v8);
        v13 = objc_claimAutoreleasedReturnValue();

        v7 = v12;
LABEL_10:

        v7 = (void *)v13;
        goto LABEL_11;
      }
    }
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "valueStyle") == 3)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "stringValue");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:

  return v7;
}

@end
