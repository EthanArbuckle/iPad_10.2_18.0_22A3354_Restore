@implementation INSpeakableStringResolutionResult

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5;
  id v6;
  _INPBIntentSlotValue *v7;
  _INPBDataStringList *v8;
  id v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  char isKindOfClass;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if (objc_msgSend(v6, "valueType") != 12)
  {
    if (objc_msgSend(v6, "valueType") != 13)
      goto LABEL_29;
    -[_INPBIntentSlotValue setType:](v7, "setType:", 56);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_alloc_init(_INPBDataStringList);
      INIntentSlotValueTransformToDataString(v5);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[_INPBDataStringList addDataString:](v8, "addDataString:", v9);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_29;
      objc_msgSend(v5, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_29;
      v8 = objc_alloc_init(_INPBDataStringList);
      v9 = v5;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v26 != v21)
              objc_enumerationMutation(v9);
            INIntentSlotValueTransformToDataString(*(void **)(*((_QWORD *)&v25 + 1) + 8 * i));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[_INPBDataStringList addDataString:](v8, "addDataString:", v23);

          }
          v20 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        }
        while (v20);
      }
    }
    -[_INPBIntentSlotValue addPayloadDataStringList:](v7, "addPayloadDataStringList:", v8);

    goto LABEL_8;
  }
  -[_INPBIntentSlotValue setType:](v7, "setType:", 7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    INIntentSlotValueTransformToDataString(v5);
    v8 = (_INPBDataStringList *)objc_claimAutoreleasedReturnValue();
    -[_INPBIntentSlotValue addPayloadDataString:](v7, "addPayloadDataString:", v8);
LABEL_8:

    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) != 0)
    {
      v8 = (_INPBDataStringList *)v5;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v12 = -[_INPBDataStringList countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v30;
        do
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v30 != v14)
              objc_enumerationMutation(v8);
            INIntentSlotValueTransformToDataString(*(void **)(*((_QWORD *)&v29 + 1) + 8 * j));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[_INPBIntentSlotValue addPayloadDataString:](v7, "addPayloadDataString:", v16);

          }
          v13 = -[_INPBDataStringList countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v13);
      }
      goto LABEL_8;
    }
  }
LABEL_29:

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
  if (objc_msgSend(v6, "valueType") == 12)
  {
    if (objc_msgSend(v6, "valueStyle") != 3)
      goto LABEL_9;
  }
  else if (objc_msgSend(v6, "valueType") != 11 || objc_msgSend(v6, "valueStyle") == 3)
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
      objc_msgSend(v5, "valueForKey:", CFSTR("description"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "if_escapedComponentsJoinedByString:forLocale:", v9, v8);
      v13 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v13;
    }
  }
LABEL_9:

  return v7;
}

@end
