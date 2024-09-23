@implementation INDateComponentsRangeResolutionResult

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5;
  id v6;
  _INPBIntentSlotValue *v7;
  void *v8;
  char isKindOfClass;
  _INPBDateTimeRangeList *v10;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if (objc_msgSend(v6, "valueType") == 16)
  {
    -[_INPBIntentSlotValue setType:](v7, "setType:", 5);
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
          v10 = (_INPBDateTimeRangeList *)v5;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v11 = -[_INPBDateTimeRangeList countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v33 != v13)
                  objc_enumerationMutation(v10);
                INIntentSlotValueTransformToDateTimeRange(*(void **)(*((_QWORD *)&v32 + 1) + 8 * i));
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "values");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "firstObject");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                -[_INPBIntentSlotValue addPayloadDateTimeRangeValue:](v7, "addPayloadDateTimeRangeValue:", v17);

              }
              v12 = -[_INPBDateTimeRangeList countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
            }
            while (v12);
          }
          goto LABEL_29;
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      INIntentSlotValueTransformToDateTimeRange(v5);
      v10 = (_INPBDateTimeRangeList *)objc_claimAutoreleasedReturnValue();
      -[_INPBDateTimeRangeList values](v10, "values");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INPBIntentSlotValue addPayloadDateTimeRangeValue:](v7, "addPayloadDateTimeRangeValue:", v26);

LABEL_28:
LABEL_29:

    }
  }
  else if (objc_msgSend(v6, "valueType") == 17)
  {
    -[_INPBIntentSlotValue setType:](v7, "setType:", 54);
    if (objc_msgSend(v6, "valueStyle") != 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
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
            v10 = objc_alloc_init(_INPBDateTimeRangeList);
            v20 = v5;
            v28 = 0u;
            v29 = 0u;
            v30 = 0u;
            v31 = 0u;
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v29;
              do
              {
                for (j = 0; j != v22; ++j)
                {
                  if (*(_QWORD *)v29 != v23)
                    objc_enumerationMutation(v20);
                  INIntentSlotValueTransformToDateTimeRange(*(void **)(*((_QWORD *)&v28 + 1) + 8 * j));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_INPBDateTimeRangeList addDateRange:](v10, "addDateRange:", v25);

                }
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
              }
              while (v22);
            }
            -[_INPBIntentSlotValue addPayloadDateTimeRangeList:](v7, "addPayloadDateTimeRangeList:", v10);
            goto LABEL_28;
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
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "valueType") == 16)
  {
    if (objc_msgSend(v6, "valueStyle") != 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        v9 = v5;
        objc_msgSend(v9, "startDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "endDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ - %@"), v10, v11);
        v12 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v12;
      }
    }
  }
  else if (objc_msgSend(v6, "valueType") == 17)
  {
    objc_msgSend(v6, "valueStyle");
  }

  return v7;
}

@end
