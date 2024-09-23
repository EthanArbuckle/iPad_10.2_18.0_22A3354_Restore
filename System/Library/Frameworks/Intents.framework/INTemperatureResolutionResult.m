@implementation INTemperatureResolutionResult

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5;
  id v6;
  _INPBIntentSlotValue *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  _INPBTemperatureList *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  char isKindOfClass;
  void *v25;
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if (objc_msgSend(v6, "valueType") == 32)
  {
    -[_INPBIntentSlotValue setType:](v7, "setType:", 10);
    if (objc_msgSend(v6, "valueStyle") == 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v5;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v32 != v11)
                objc_enumerationMutation(v8);
              INIntentSlotValueTransformToTemperatureValue(*(void **)(*((_QWORD *)&v31 + 1) + 8 * i));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              -[_INPBIntentSlotValue addPayloadTemperatureValue:](v7, "addPayloadTemperatureValue:", v13);

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
          }
          while (v10);
        }
        goto LABEL_26;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "unit");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
LABEL_25:
        INIntentSlotValueTransformToTemperatureValue(v5);
        v8 = (id)objc_claimAutoreleasedReturnValue();
        -[_INPBIntentSlotValue addPayloadTemperatureValue:](v7, "addPayloadTemperatureValue:", v8);
LABEL_26:

      }
    }
  }
  else if (objc_msgSend(v6, "valueType") == 33)
  {
    -[_INPBIntentSlotValue setType:](v7, "setType:", 59);
    if (objc_msgSend(v6, "valueStyle") != 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v5;
        v15 = objc_alloc_init(_INPBTemperatureList);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v16 = v14;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v28;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v28 != v19)
                objc_enumerationMutation(v16);
              INIntentSlotValueTransformToTemperature(*(void **)(*((_QWORD *)&v27 + 1) + 8 * j));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[_INPBTemperatureList addTemperature:](v15, "addTemperature:", v21, (_QWORD)v27);

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v18);
        }

        -[_INPBIntentSlotValue addPayloadTemperatureList:](v7, "addPayloadTemperatureList:", v15);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v5, "unit");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v26 = objc_opt_isKindOfClass();

          if ((v26 & 1) != 0)
          {
            -[_INPBIntentSlotValue setType:](v7, "setType:", 10);
            goto LABEL_25;
          }
        }
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
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "groupingSeparator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "valueType") == 32 || objc_msgSend(v6, "valueType") == 33)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v5, "unit"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v10,
          (isKindOfClass & 1) != 0))
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (void *)MEMORY[0x1E0CB37E8];
      v14 = v5;
      objc_msgSend(v14, "doubleValue");
      objc_msgSend(v13, "numberWithDouble:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "unit");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "symbol");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ %@"), v16, v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v19;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = v9;
        v35 = v7;
        v36 = v8;
        v37 = v6;
        v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v38 = v5;
        obj = v5;
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v41 != v23)
                objc_enumerationMutation(obj);
              v25 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
              v26 = (void *)MEMORY[0x1E0CB3940];
              v27 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v25, "doubleValue");
              objc_msgSend(v27, "numberWithDouble:");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "description");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "unit");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "symbol");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "stringWithFormat:", CFSTR("%@ %@"), v29, v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v20, "addObject:", v32);
            }
            v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
          }
          while (v22);
        }

        v9 = v34;
        v8 = v36;
        objc_msgSend(v20, "if_escapedComponentsJoinedByString:forLocale:", v34, v36);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = v37;
        v5 = v38;
      }
    }
  }

  return v7;
}

@end
