@implementation INEnergyResolutionResult

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
  if (objc_msgSend(v6, "valueType") == 41)
  {
    -[_INPBIntentSlotValue setType:](v7, "setType:", 17);
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
                INIntentSlotValueTransformToEnergyValue(*(void **)(*((_QWORD *)&v17 + 1) + 8 * i));
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                -[_INPBIntentSlotValue addPayloadEnergyValue:](v7, "addPayloadEnergyValue:", v15);

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
      INIntentSlotValueTransformToEnergyValue(v5);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10)
        -[_INPBIntentSlotValue addPayloadEnergyValue:](v7, "addPayloadEnergyValue:", v10);
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
  if (objc_msgSend(v6, "valueType") == 41)
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
