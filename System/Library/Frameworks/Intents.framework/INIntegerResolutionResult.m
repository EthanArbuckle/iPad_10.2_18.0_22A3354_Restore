@implementation INIntegerResolutionResult

+ (INIntegerResolutionResult)successWithResolvedValue:(NSInteger)resolvedValue
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", resolvedValue);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resolutionResultSuccessWithResolvedValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (INIntegerResolutionResult *)v5;
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
  _INPBIntegerList *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if (objc_msgSend(v6, "valueType") == 24)
  {
    -[_INPBIntentSlotValue setType:](v7, "setType:", 3);
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
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v49;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v49 != v13)
                  objc_enumerationMutation(v10);
                INIntentSlotValueTransformToInteger(*(void **)(*((_QWORD *)&v48 + 1) + 8 * i));
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "values");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "firstObject");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                -[_INPBIntentSlotValue addPayloadIntegerValue:](v7, "addPayloadIntegerValue:", v17);

              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
            }
            while (v12);
          }
          goto LABEL_47;
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      INIntentSlotValueTransformToInteger(v5);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "values");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INPBIntentSlotValue addPayloadIntegerValue:](v7, "addPayloadIntegerValue:", v29);
LABEL_46:

LABEL_47:
    }
  }
  else if (objc_msgSend(v6, "valueType") == 25)
  {
    -[_INPBIntentSlotValue setType:](v7, "setType:", 52);
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
          v21 = objc_alloc_init(_INPBIntegerList);
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v22 = v20;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v45;
            do
            {
              for (j = 0; j != v24; ++j)
              {
                if (*(_QWORD *)v45 != v25)
                  objc_enumerationMutation(v22);
                INIntentSlotValueTransformToInteger(*(void **)(*((_QWORD *)&v44 + 1) + 8 * j));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[_INPBIntegerList addDataString:](v21, "addDataString:", v27);

              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
            }
            while (v24);
          }

          -[_INPBIntentSlotValue addPayloadIntegerList:](v7, "addPayloadIntegerList:", v21);
        }
      }
    }
  }
  else if (objc_msgSend(v6, "valueType") == 26)
  {
    -[_INPBIntentSlotValue setType:](v7, "setType:", 8);
    if (objc_msgSend(v6, "valueStyle") == 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "firstObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v31 = objc_opt_isKindOfClass();

        if ((v31 & 1) != 0)
        {
          v10 = v5;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v32 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v41;
            do
            {
              for (k = 0; k != v33; ++k)
              {
                if (*(_QWORD *)v41 != v34)
                  objc_enumerationMutation(v10);
                INIntentSlotValueTransformToLong(*(void **)(*((_QWORD *)&v40 + 1) + 8 * k));
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "values");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "firstObject");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                -[_INPBIntentSlotValue addPayloadLongValue:](v7, "addPayloadLongValue:", v38);

              }
              v33 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
            }
            while (v33);
          }
          goto LABEL_47;
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      INIntentSlotValueTransformToLong(v5);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "values");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INPBIntentSlotValue addPayloadLongValue:](v7, "addPayloadLongValue:", v29);
      goto LABEL_46;
    }
  }
  else if (objc_msgSend(v6, "valueType") == 8 || objc_msgSend(v6, "valueType") == 5)
  {
    -[_INPBIntentSlotValue setType:](v7, "setType:", 101);
    if (objc_msgSend(v6, "valueStyle") != 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[_INPBIntentSlotValue addPayloadPrimitiveInt:](v7, "addPayloadPrimitiveInt:", objc_msgSend(v5, "intValue"));
    }
  }
  else if (objc_msgSend(v6, "valueType") == 9 || objc_msgSend(v6, "valueType") == 6)
  {
    -[_INPBIntentSlotValue setType:](v7, "setType:", 102);
    if (objc_msgSend(v6, "valueStyle") != 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[_INPBIntentSlotValue addPayloadPrimitiveLong:](v7, "addPayloadPrimitiveLong:", objc_msgSend(v5, "longLongValue"));
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
  if (objc_msgSend(v6, "valueType") != 24
    && objc_msgSend(v6, "valueType") != 8
    && objc_msgSend(v6, "valueType") != 5
    && objc_msgSend(v6, "valueType") != 9
    && objc_msgSend(v6, "valueType") != 6)
  {
    if (objc_msgSend(v6, "valueType") != 25)
      goto LABEL_13;
LABEL_7:
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
LABEL_12:

        v7 = (void *)v13;
        goto LABEL_13;
      }
    }
    goto LABEL_13;
  }
  if (objc_msgSend(v6, "valueStyle") == 3)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "stringValue");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
LABEL_13:

  return v7;
}

@end
