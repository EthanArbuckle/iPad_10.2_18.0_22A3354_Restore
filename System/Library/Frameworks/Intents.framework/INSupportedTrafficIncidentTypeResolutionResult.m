@implementation INSupportedTrafficIncidentTypeResolutionResult

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
  if (objc_msgSend(v6, "valueType") == 229)
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
                INIntentSlotValueTransformToSupportedTrafficIncidentType(*(void **)(*((_QWORD *)&v17 + 1) + 8 * i));
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                -[_INPBIntentSlotValue addPayloadSupportedTrafficIncidentType:](v7, "addPayloadSupportedTrafficIncidentType:", v15);

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
      INIntentSlotValueTransformToSupportedTrafficIncidentType(v5);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10)
        -[_INPBIntentSlotValue addPayloadSupportedTrafficIncidentType:](v7, "addPayloadSupportedTrafficIncidentType:", v10);
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
  uint64_t v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "groupingSeparator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "valueType") == 229)
  {
    if (objc_msgSend(v6, "valueStyle") == 3)
    {
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

          v7 = v12;
LABEL_8:

          v7 = (void *)v13;
          goto LABEL_9;
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "description");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
LABEL_9:

  return v7;
}

@end
