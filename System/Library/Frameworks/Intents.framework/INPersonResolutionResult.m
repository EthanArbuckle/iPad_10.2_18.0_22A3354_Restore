@implementation INPersonResolutionResult

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5;
  id v6;
  _INPBIntentSlotValue *v7;
  void *v8;
  char isKindOfClass;
  _INPBContactList *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
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
  if (objc_msgSend(v6, "valueType") == 18)
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
          v10 = (_INPBContactList *)v5;
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v11 = -[_INPBContactList countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
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
                INIntentSlotValueTransformToDialingContact(*(void **)(*((_QWORD *)&v44 + 1) + 8 * i));
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                -[_INPBIntentSlotValue addPayloadDialingContact:](v7, "addPayloadDialingContact:", v15);

              }
              v12 = -[_INPBContactList countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
            }
            while (v12);
          }
          goto LABEL_45;
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      INIntentSlotValueTransformToDialingContact(v5);
      v10 = (_INPBContactList *)objc_claimAutoreleasedReturnValue();
      -[_INPBIntentSlotValue addPayloadDialingContact:](v7, "addPayloadDialingContact:", v10);
LABEL_45:

      goto LABEL_46;
    }
    goto LABEL_46;
  }
  if (objc_msgSend(v6, "valueType") != 10)
  {
    if (objc_msgSend(v6, "valueType") != 11)
      goto LABEL_46;
    -[_INPBIntentSlotValue setType:](v7, "setType:", 53);
    if (objc_msgSend(v6, "valueStyle") == 3)
      goto LABEL_46;
    v10 = objc_alloc_init(_INPBContactList);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v5, "firstObject"),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          v26 = objc_opt_isKindOfClass(),
          v25,
          (v26 & 1) != 0))
    {
      v27 = v5;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v37;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v37 != v30)
              objc_enumerationMutation(v27);
            INIntentSlotValueTransformToContact(*(void **)(*((_QWORD *)&v36 + 1) + 8 * j));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[_INPBContactList addContact:](v10, "addContact:", v32);

          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        }
        while (v29);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_44:
        -[_INPBIntentSlotValue addPayloadContactList:](v7, "addPayloadContactList:", v10);
        goto LABEL_45;
      }
      INIntentSlotValueTransformToContact(v5);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      -[_INPBContactList addContact:](v10, "addContact:", v27);
    }

    goto LABEL_44;
  }
  -[_INPBIntentSlotValue setType:](v7, "setType:", 4);
  if (objc_msgSend(v6, "valueStyle") == 3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v17 = objc_opt_isKindOfClass();

      if ((v17 & 1) != 0)
      {
        v10 = (_INPBContactList *)v5;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v18 = -[_INPBContactList countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v41;
          do
          {
            for (k = 0; k != v19; ++k)
            {
              if (*(_QWORD *)v41 != v20)
                objc_enumerationMutation(v10);
              INIntentSlotValueTransformToContact(*(void **)(*((_QWORD *)&v40 + 1) + 8 * k));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "values");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "firstObject");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[_INPBIntentSlotValue addPayloadContactValue:](v7, "addPayloadContactValue:", v24);

            }
            v19 = -[_INPBContactList countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          }
          while (v19);
        }
        goto LABEL_45;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    INIntentSlotValueTransformToContact(v5);
    v10 = (_INPBContactList *)objc_claimAutoreleasedReturnValue();
    -[_INPBContactList values](v10, "values");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[_INPBIntentSlotValue addPayloadContactValue:](v7, "addPayloadContactValue:", v34);

    goto LABEL_45;
  }
LABEL_46:

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
  void *v14;
  char v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "groupingSeparator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "valueType") == 18 || objc_msgSend(v6, "valueType") == 10)
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
LABEL_5:
        objc_msgSend(v5, "valueForKey:", CFSTR("displayName"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "if_escapedComponentsJoinedByString:forLocale:", v9, v8);
        v13 = objc_claimAutoreleasedReturnValue();

        v7 = v12;
LABEL_8:

        v7 = (void *)v13;
        goto LABEL_13;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "displayName");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  else if (objc_msgSend(v6, "valueType") == 11 && objc_msgSend(v6, "valueStyle") != 3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v15 = objc_opt_isKindOfClass();

      if ((v15 & 1) != 0)
        goto LABEL_5;
    }
  }
LABEL_13:

  return v7;
}

@end
