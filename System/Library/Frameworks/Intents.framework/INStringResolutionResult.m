@implementation INStringResolutionResult

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
  _INPBStringList *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if (objc_msgSend(v6, "valueType") == 30)
  {
    -[_INPBIntentSlotValue setType:](v7, "setType:", 1);
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
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v45;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v45 != v13)
                  objc_enumerationMutation(v10);
                INIntentSlotValueTransformToString(*(void **)(*((_QWORD *)&v44 + 1) + 8 * i));
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "values");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "firstObject");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                -[_INPBIntentSlotValue addPayloadStringValue:](v7, "addPayloadStringValue:", v17);

              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
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
      INIntentSlotValueTransformToString(v5);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "values");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INPBIntentSlotValue addPayloadStringValue:](v7, "addPayloadStringValue:", v29);

LABEL_27:
    }
  }
  else
  {
    if (objc_msgSend(v6, "valueType") != 31)
    {
      if (objc_msgSend(v6, "valueType") != 7)
        goto LABEL_44;
      -[_INPBIntentSlotValue setType:](v7, "setType:", 104);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_INPBIntentSlotValue addPayloadPrimitiveString:](v7, "addPayloadPrimitiveString:", v5);
        goto LABEL_44;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_44;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v10 = v5;
      v30 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v37;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v37 != v32)
              objc_enumerationMutation(v10);
            v34 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[_INPBIntentSlotValue addPayloadPrimitiveString:](v7, "addPayloadPrimitiveString:", v34, (_QWORD)v36);
          }
          v31 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        }
        while (v31);
      }
      goto LABEL_27;
    }
    -[_INPBIntentSlotValue setType:](v7, "setType:", 50);
    if (objc_msgSend(v6, "valueStyle") != 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (objc_msgSend(v5, "firstObject"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            v19 = objc_opt_isKindOfClass(),
            v18,
            (v19 & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_44;
        -[_INPBIntentSlotValue setType:](v7, "setType:", 1);
        INIntentSlotValueTransformToStringValue(v5);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        -[_INPBIntentSlotValue addPayloadStringValue:](v7, "addPayloadStringValue:", v10);
        goto LABEL_27;
      }
      v20 = v5;
      v21 = objc_alloc_init(_INPBStringList);
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v22 = v20;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v41;
        do
        {
          for (k = 0; k != v24; ++k)
          {
            if (*(_QWORD *)v41 != v25)
              objc_enumerationMutation(v22);
            INIntentSlotValueTransformToString(*(void **)(*((_QWORD *)&v40 + 1) + 8 * k));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[_INPBStringList addDataString:](v21, "addDataString:", v27);

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        }
        while (v24);
      }

      -[_INPBIntentSlotValue addPayloadStringList:](v7, "addPayloadStringList:", v21);
    }
  }
LABEL_44:

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
  uint64_t v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "groupingSeparator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "valueType") == 7 || objc_msgSend(v6, "valueType") == 30)
  {
    if (objc_msgSend(v6, "valueStyle") != 3)
      goto LABEL_9;
  }
  else if (objc_msgSend(v6, "valueType") != 31 || objc_msgSend(v6, "valueStyle") == 3)
  {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "if_escapedComponentsJoinedByString:forLocale:", v9, v8);
      v12 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v12;
    }
  }
LABEL_9:

  return v7;
}

@end
