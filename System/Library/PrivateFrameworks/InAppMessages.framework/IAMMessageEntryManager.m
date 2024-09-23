@implementation IAMMessageEntryManager

- (id)messageEntriesByTriggerForEventContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  IAMTriggerKey *v38;
  void *v39;
  IAMTriggerKey *v40;
  IAMTriggerKey *v41;
  void *v42;
  IAMTriggerKey *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)-[NSDictionary copy](self->_messageEntriesByEventTriggers, "copy");
  v6 = (void *)-[NSDictionary copy](self->_messageEntriesByUnknownKindTriggers, "copy");
  objc_msgSend(v4, "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(self) = objc_opt_isKindOfClass();
  v66 = (void *)objc_opt_new();
  if ((self & 1) != 0)
  {
    v67 = v8;
    v64 = v4;
    v65 = v6;
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v63 = v5;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v73 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "count"))
          {
            objc_msgSend(v14, "bundleIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (!v16 || objc_msgSend(v16, "isEqualToString:", v67))
            {
              objc_msgSend(v14, "name");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v7, "matchesWithKey:", v18);

              if (v19)
              {
                objc_msgSend(v66, "objectForKeyedSubscript:", v14);
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v20)
                {
                  v21 = (void *)objc_opt_new();
                  objc_msgSend(v66, "setObject:forKeyedSubscript:", v21, v14);

                }
                objc_msgSend(v66, "objectForKeyedSubscript:", v14);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "addObjectsFromArray:", v15);

              }
            }

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
      }
      while (v11);
    }

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v23 = v65;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v69 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
          objc_msgSend(v23, "objectForKey:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v29, "count"))
          {
            objc_msgSend(v28, "bundleIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v30;
            if (!v30 || objc_msgSend(v30, "isEqualToString:", v67))
            {
              objc_msgSend(v28, "name");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v7, "matchesWithKey:", v32);

              if (v33)
              {
                objc_msgSend(v66, "objectForKeyedSubscript:", v28);
                v34 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v34)
                {
                  v35 = (void *)objc_opt_new();
                  objc_msgSend(v66, "setObject:forKeyedSubscript:", v35, v28);

                }
                objc_msgSend(v66, "objectForKeyedSubscript:", v28);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "addObjectsFromArray:", v29);

              }
            }

          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
      }
      while (v25);
    }

    v37 = (void *)objc_msgSend(v66, "copy");
    v5 = v63;
    v4 = v64;
    v6 = v65;
    v8 = v67;
  }
  else
  {
    v38 = [IAMTriggerKey alloc];
    objc_msgSend(v7, "name");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[IAMTriggerKey initWithName:bundleIdentifier:](v38, "initWithName:bundleIdentifier:", v39, v8);

    v41 = [IAMTriggerKey alloc];
    objc_msgSend(v7, "name");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[IAMTriggerKey initWithName:bundleIdentifier:](v41, "initWithName:bundleIdentifier:", v42, 0);

    objc_msgSend(v5, "objectForKeyedSubscript:", v40);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      v45 = (void *)objc_opt_new();
      objc_msgSend(v66, "setObject:forKeyedSubscript:", v45, v40);

      objc_msgSend(v66, "objectForKeyedSubscript:", v40);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v40);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addObjectsFromArray:", v47);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", v43);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      v49 = (void *)objc_opt_new();
      objc_msgSend(v66, "setObject:forKeyedSubscript:", v49, v43);

      objc_msgSend(v66, "objectForKeyedSubscript:", v43);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v43);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "addObjectsFromArray:", v51);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", v40);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(v66, "objectForKeyedSubscript:", v40);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v53)
      {
        v54 = (void *)objc_opt_new();
        objc_msgSend(v66, "setObject:forKeyedSubscript:", v54, v40);

      }
      objc_msgSend(v66, "objectForKeyedSubscript:", v40);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v40);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "addObjectsFromArray:", v56);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", v43);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      objc_msgSend(v66, "objectForKeyedSubscript:", v43);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v58)
      {
        v59 = (void *)objc_opt_new();
        objc_msgSend(v66, "setObject:forKeyedSubscript:", v59, v43);

      }
      objc_msgSend(v66, "objectForKeyedSubscript:", v43);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v43);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "addObjectsFromArray:", v61);

    }
    v37 = (void *)objc_msgSend(v66, "copy");

  }
  return v37;
}

+ (id)targetIdentifiersForMessageEntries:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "applicationMessage", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "targets");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v4, "addObjectsFromArray:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)uniqueMessageEntriesInMessageEntriesByTrigger:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unionSet:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)messageEntriesForTargetIdentifier:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_messageEntriesByTargetIdentifier, "objectForKeyedSubscript:", a3);
}

+ (id)messageEntries:(id)a3 withSatisfiedPresentationTriggerForTriggerContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  char v26;
  uint64_t v27;
  void *v28;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = v7;
  if (!v5)
  {
    v28 = (void *)objc_msgSend(v7, "copy");
    goto LABEL_35;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v30 = v5;
  v9 = v5;
  v34 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (!v34)
    goto LABEL_33;
  v32 = v9;
  v33 = *(_QWORD *)v40;
  v31 = v8;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v40 != v33)
        objc_enumerationMutation(v9);
      v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v10);
      objc_msgSend(v11, "applicationMessage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "presentationTriggers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "rule");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "count");
      if (v14)
      {
        objc_msgSend(v14, "triggerEventName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16 != 0;

      }
      else
      {
        v17 = 0;
      }
      if (v15)
        v18 = 0;
      else
        v18 = !v17;
      if (v18)
      {
LABEL_26:
        objc_msgSend(v8, "addObject:", v11);
        goto LABEL_27;
      }
      if (!v6)
        goto LABEL_27;
      if (v15)
      {
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v19 = v13;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v36;
          while (2)
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v36 != v22)
                objc_enumerationMutation(v19);
              if ((objc_msgSend(v6, "satisfiesPresentationTrigger:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i)) & 1) != 0)
              {

                v8 = v31;
                v9 = v32;
                goto LABEL_26;
              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            v8 = v31;
            if (v21)
              continue;
            break;
          }
        }

        v9 = v32;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "event");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "triggerEventName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "matchesWithKey:", v25);

          v9 = v32;
          if ((v26 & 1) != 0)
            goto LABEL_26;
        }
      }
LABEL_27:

      ++v10;
    }
    while (v10 != v34);
    v27 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    v34 = v27;
  }
  while (v27);
LABEL_33:

  v28 = (void *)objc_msgSend(v8, "copy");
  v5 = v30;
LABEL_35:

  return v28;
}

- (id)messageEntriesForContextPropertiesContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  IAMTriggerKey *v13;
  IAMTriggerKey *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id obj;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v28 = (void *)objc_opt_new();
  v5 = (void *)-[NSDictionary copy](self->_messageEntriesByContextPropertyTriggers, "copy");
  v6 = (void *)-[NSDictionary copy](self->_messageEntriesByUnknownKindTriggers, "copy");
  objc_msgSend(v4, "contextPropertyNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v4;
  objc_msgSend(v4, "bundleIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v11);
        v13 = -[IAMTriggerKey initWithName:bundleIdentifier:]([IAMTriggerKey alloc], "initWithName:bundleIdentifier:", v12, v29);
        v14 = -[IAMTriggerKey initWithName:bundleIdentifier:]([IAMTriggerKey alloc], "initWithName:bundleIdentifier:", v12, 0);
        v15 = (void *)objc_opt_new();
        objc_msgSend(v5, "objectForKeyedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObjectsFromArray:", v17);

        }
        objc_msgSend(v5, "objectForKeyedSubscript:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObjectsFromArray:", v19);

        }
        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v13);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObjectsFromArray:", v21);

        }
        objc_msgSend(v6, "objectForKeyedSubscript:", v14);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v14);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObjectsFromArray:", v23);

        }
        if (objc_msgSend(v15, "count"))
          objc_msgSend(v28, "addObjectsFromArray:", v15);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v9);
  }

  objc_msgSend(v28, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)setMessageEntries:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *messageEntries;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSDictionary *v16;
  NSDictionary *messageEntryByIdentifier;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  messageEntries = self->_messageEntries;
  self->_messageEntries = v5;

  v7 = (void *)objc_opt_new();
  if (v4)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v13, "applicationMessage", (_QWORD)v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v15);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

  }
  v16 = (NSDictionary *)objc_msgSend(v7, "copy", (_QWORD)v18);
  messageEntryByIdentifier = self->_messageEntryByIdentifier;
  self->_messageEntryByIdentifier = v16;

  -[IAMMessageEntryManager _updateMessageIndexes](self, "_updateMessageIndexes");
}

- (void)_updateMessageIndexes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  IAMTriggerKey *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  BOOL v46;
  int v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  unint64_t m;
  void *v55;
  BOOL v56;
  uint64_t v57;
  NSDictionary *messageEntriesByEventTriggers;
  uint64_t v59;
  NSDictionary *messageEntriesByContextPropertyTriggers;
  uint64_t v61;
  NSDictionary *messageEntriesByUnknownKindTriggers;
  uint64_t v63;
  NSDictionary *messageEntriesByTargetIdentifier;
  IAMMessageEntryManager *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  id obj;
  uint64_t v70;
  void *v71;
  uint64_t i;
  void (**v73)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[7];
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  uint8_t buf[4];
  void *v108;
  __int16 v109;
  void *v110;
  _BYTE v111[128];
  _BYTE v112[128];
  NSString *modalTargetIdentifier;
  _BYTE v114[128];
  uint64_t v115;

  v65 = self;
  v115 = *MEMORY[0x24BDAC8D0];
  v101 = 0;
  v102 = &v101;
  v103 = 0x3032000000;
  v104 = __Block_byref_object_copy_;
  v105 = __Block_byref_object_dispose_;
  v106 = (id)objc_opt_new();
  v95 = 0;
  v96 = &v95;
  v97 = 0x3032000000;
  v98 = __Block_byref_object_copy_;
  v99 = __Block_byref_object_dispose_;
  v100 = (id)objc_opt_new();
  v89 = 0;
  v90 = &v89;
  v91 = 0x3032000000;
  v92 = __Block_byref_object_copy_;
  v93 = __Block_byref_object_dispose_;
  v94 = (id)objc_opt_new();
  v2 = (void *)objc_opt_new();
  v88[0] = MEMORY[0x24BDAC760];
  v88[1] = 3221225472;
  v88[2] = __47__IAMMessageEntryManager__updateMessageIndexes__block_invoke;
  v88[3] = &unk_24C8710C0;
  v88[4] = &v89;
  v88[5] = &v101;
  v88[6] = &v95;
  v73 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x212BB42FC](v88);
  v68 = (void *)objc_opt_new();
  v71 = (void *)objc_opt_new();
  v3 = (void *)-[NSDictionary copy](v65->_messageEntryByIdentifier, "copy");
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  obj = v3;
  v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v114, 16);
  if (v67)
  {
    v66 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v67; ++i)
      {
        if (*(_QWORD *)v85 != v66)
          objc_enumerationMutation(obj);
        objc_msgSend(obj, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i), v65);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "applicationMessage");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "targets");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = v5;
        if (objc_msgSend(v5, "messageType") == 1)
        {
          modalTargetIdentifier = v65->_modalTargetIdentifier;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &modalTargetIdentifier, 1);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          v8 = (void *)objc_msgSend(v7, "mutableCopy");
          objc_msgSend(v74, "setTargets:", v8);

          if (v7)
            goto LABEL_10;
        }
        else
        {
          v7 = v6;
          if (v6)
          {
LABEL_10:
            if (objc_msgSend(v7, "count"))
              goto LABEL_14;
          }
        }
        IAMLogCategoryDefault();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v74, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v108 = v10;
          _os_log_impl(&dword_20DD38000, v9, OS_LOG_TYPE_ERROR, "Error indexing message, message specifies no targets = %{public}@", buf, 0xCu);

        }
LABEL_14:
        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        v75 = v7;
        v11 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v80, v112, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v81;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v81 != v12)
                objc_enumerationMutation(v75);
              v14 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * j);
              objc_msgSend(v2, "objectForKeyedSubscript:", v14);
              v15 = objc_claimAutoreleasedReturnValue();
              v16 = (void *)v15;
              v17 = (void *)MEMORY[0x24BDBD1A8];
              if (v15)
                v17 = (void *)v15;
              v18 = v17;

              if ((objc_msgSend(v18, "containsObject:", v4) & 1) == 0)
              {
                objc_msgSend(v18, "arrayByAddingObject:", v4);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "setObject:forKeyedSubscript:", v19, v14);

              }
            }
            v11 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v80, v112, 16);
          }
          while (v11);
        }

        objc_msgSend(v74, "presentationTriggers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v20, "copy");

        v70 = objc_msgSend(v21, "count");
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v22 = v21;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v76, v111, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v77;
          do
          {
            for (k = 0; k != v23; ++k)
            {
              if (*(_QWORD *)v77 != v24)
                objc_enumerationMutation(v22);
              v26 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * k);
              if ((objc_msgSend(v26, "hasTriggerName") & 1) != 0)
              {
                if ((objc_msgSend(v26, "hasKind") & 1) != 0)
                {
                  objc_msgSend(v26, "triggerName");
                  v27 = objc_claimAutoreleasedReturnValue();
                  v28 = objc_msgSend(v26, "hasKind");
                  v29 = objc_msgSend(v26, "kind");
                  objc_msgSend(v26, "bundleIdentifier");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  ((void (**)(_QWORD, void *, NSObject *, uint64_t, uint64_t, void *))v73)[2](v73, v4, v27, v28, v29, v30);

                }
                else
                {
                  IAMLogCategoryDefault();
                  v27 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v26, "triggerName");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v74, "identifier");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v108 = v32;
                    v109 = 2114;
                    v110 = v33;
                    _os_log_impl(&dword_20DD38000, v27, OS_LOG_TYPE_ERROR, "Error indexing message, message presentation trigger = %{public}@ missing kind = %{public}@", buf, 0x16u);

                  }
                }
              }
              else
              {
                IAMLogCategoryDefault();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v74, "identifier");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v108 = v31;
                  _os_log_impl(&dword_20DD38000, v27, OS_LOG_TYPE_ERROR, "Error indexing message, message presentation trigger missing triggerName = %{public}@", buf, 0xCu);

                }
              }

            }
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v76, v111, 16);
          }
          while (v23);
        }

        objc_msgSend(v74, "rule");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v34)
        {
          if (!v70)
          {
            objc_msgSend(v34, "triggerEventName");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v36 == 0;

            if (!v37)
            {
              objc_msgSend(v74, "rule");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "triggerEventName");
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              v40 = -[IAMTriggerKey initWithName:bundleIdentifier:]([IAMTriggerKey alloc], "initWithName:bundleIdentifier:", v39, 0);
              +[IAMMessageEntryManager _addMessageEntry:toTriggerKeyDictionary:atKey:](IAMMessageEntryManager, "_addMessageEntry:toTriggerKeyDictionary:atKey:", v4, v102[5], v40);

            }
          }
          objc_msgSend(v68, "addObject:", v35);
          objc_msgSend(v71, "addObject:", v4);
        }

      }
      v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v114, 16);
    }
    while (v67);
  }

  while (objc_msgSend(v68, "count", v65))
  {
    objc_msgSend(v68, "lastObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "lastObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "removeLastObject");
    objc_msgSend(v71, "removeLastObject");
    objc_msgSend(v41, "triggerEventName");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend(v41, "triggerCondition");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
      {

      }
      else
      {
        objc_msgSend(v41, "subrules");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v45 == 0;

        if (v46)
          goto LABEL_57;
      }
    }
    v47 = objc_msgSend(v41, "type");
    if (v47 == 1)
    {
      objc_msgSend(v41, "subrules");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "addObjectsFromArray:", v53);

      for (m = 0; ; ++m)
      {
        objc_msgSend(v41, "subrules");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "count") > m;

        if (!v56)
          break;
        objc_msgSend(v71, "addObject:", v42);
      }
    }
    else if (!v47)
    {
      objc_msgSend(v41, "triggerCondition");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "identifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (v49)
      {
        v50 = objc_msgSend(v48, "hasKind");
        v51 = objc_msgSend(v48, "kind");
        objc_msgSend(v48, "bundleIdentifier");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, void *, uint64_t, uint64_t, void *))v73)[2](v73, v42, v49, v50, v51, v52);

      }
    }
LABEL_57:

  }
  v57 = objc_msgSend((id)v102[5], "copy");
  messageEntriesByEventTriggers = v65->_messageEntriesByEventTriggers;
  v65->_messageEntriesByEventTriggers = (NSDictionary *)v57;

  v59 = objc_msgSend((id)v96[5], "copy");
  messageEntriesByContextPropertyTriggers = v65->_messageEntriesByContextPropertyTriggers;
  v65->_messageEntriesByContextPropertyTriggers = (NSDictionary *)v59;

  v61 = objc_msgSend((id)v90[5], "copy");
  messageEntriesByUnknownKindTriggers = v65->_messageEntriesByUnknownKindTriggers;
  v65->_messageEntriesByUnknownKindTriggers = (NSDictionary *)v61;

  v63 = objc_msgSend(v2, "copy");
  messageEntriesByTargetIdentifier = v65->_messageEntriesByTargetIdentifier;
  v65->_messageEntriesByTargetIdentifier = (NSDictionary *)v63;

  _Block_object_dispose(&v89, 8);
  _Block_object_dispose(&v95, 8);

  _Block_object_dispose(&v101, 8);
}

- (IAMMessageEntryManager)initWithModalTargetIdentifier:(id)a3
{
  id v4;
  IAMMessageEntryManager *v5;
  uint64_t v6;
  NSString *modalTargetIdentifier;
  NSDictionary *messageEntryByIdentifier;
  NSDictionary *v9;
  NSDictionary *priorityMessageEntryByIdentifier;
  NSDictionary *messageEntriesByEventTriggers;
  NSDictionary *messageEntriesByContextPropertyTriggers;
  NSDictionary *messageEntriesByUnknownKindTriggers;
  NSDictionary *messageEntriesByTargetIdentifier;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IAMMessageEntryManager;
  v5 = -[IAMMessageEntryManager init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    modalTargetIdentifier = v5->_modalTargetIdentifier;
    v5->_modalTargetIdentifier = (NSString *)v6;

    messageEntryByIdentifier = v5->_messageEntryByIdentifier;
    v9 = (NSDictionary *)MEMORY[0x24BDBD1B8];
    v5->_messageEntryByIdentifier = (NSDictionary *)MEMORY[0x24BDBD1B8];

    priorityMessageEntryByIdentifier = v5->_priorityMessageEntryByIdentifier;
    v5->_priorityMessageEntryByIdentifier = v9;

    messageEntriesByEventTriggers = v5->_messageEntriesByEventTriggers;
    v5->_messageEntriesByEventTriggers = v9;

    messageEntriesByContextPropertyTriggers = v5->_messageEntriesByContextPropertyTriggers;
    v5->_messageEntriesByContextPropertyTriggers = v9;

    messageEntriesByUnknownKindTriggers = v5->_messageEntriesByUnknownKindTriggers;
    v5->_messageEntriesByUnknownKindTriggers = v9;

    messageEntriesByTargetIdentifier = v5->_messageEntriesByTargetIdentifier;
    v5->_messageEntriesByTargetIdentifier = v9;

  }
  return v5;
}

- (id)messageEntryForIdentifier:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_messageEntryByIdentifier, "objectForKeyedSubscript:", a3);
}

- (id)priorityMessageEntryForIdentifier:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_priorityMessageEntryByIdentifier, "objectForKeyedSubscript:", a3);
}

- (void)addPriorityMessageEntry:(id)a3
{
  NSDictionary *priorityMessageEntryByIdentifier;
  id v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  NSDictionary *v9;
  id v10;

  priorityMessageEntryByIdentifier = self->_priorityMessageEntryByIdentifier;
  v5 = a3;
  v10 = (id)-[NSDictionary mutableCopy](priorityMessageEntryByIdentifier, "mutableCopy");
  objc_msgSend(v5, "applicationMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v5, v7);

  v8 = (NSDictionary *)objc_msgSend(v10, "copy");
  v9 = self->_priorityMessageEntryByIdentifier;
  self->_priorityMessageEntryByIdentifier = v8;

}

+ (void)_addMessageEntry:(id)a3 toTriggerKeyDictionary:(id)a4 atKey:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = (void *)MEMORY[0x24BDBD1A8];
  if (v9)
    v11 = (void *)v9;
  v12 = v11;

  if ((objc_msgSend(v12, "containsObject:", v14) & 1) == 0)
  {
    objc_msgSend(v12, "arrayByAddingObject:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v8);

  }
}

void __47__IAMMessageEntryManager__updateMessageIndexes__block_invoke(_QWORD *a1, void *a2, void *a3, char a4, int a5, void *a6)
{
  id v11;
  id v12;
  IAMTriggerKey *v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  v11 = a6;
  v12 = a3;
  v13 = -[IAMTriggerKey initWithName:bundleIdentifier:]([IAMTriggerKey alloc], "initWithName:bundleIdentifier:", v12, v11);

  if ((a4 & 1) == 0)
  {
    v14 = a1[4];
    goto LABEL_7;
  }
  if (a5 == 1)
  {
    v14 = a1[6];
    goto LABEL_7;
  }
  if (!a5)
  {
    v14 = a1[5];
LABEL_7:
    +[IAMMessageEntryManager _addMessageEntry:toTriggerKeyDictionary:atKey:](IAMMessageEntryManager, "_addMessageEntry:toTriggerKeyDictionary:atKey:", v15, *(_QWORD *)(*(_QWORD *)(v14 + 8) + 40), v13);
  }

}

- (NSArray)messageEntries
{
  return self->_messageEntries;
}

- (NSString)modalTargetIdentifier
{
  return self->_modalTargetIdentifier;
}

- (void)setModalTargetIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modalTargetIdentifier, 0);
  objc_storeStrong((id *)&self->_messageEntries, 0);
  objc_storeStrong((id *)&self->_messageEntriesByTargetIdentifier, 0);
  objc_storeStrong((id *)&self->_messageEntriesByUnknownKindTriggers, 0);
  objc_storeStrong((id *)&self->_messageEntriesByContextPropertyTriggers, 0);
  objc_storeStrong((id *)&self->_messageEntriesByEventTriggers, 0);
  objc_storeStrong((id *)&self->_priorityMessageEntryByIdentifier, 0);
  objc_storeStrong((id *)&self->_messageEntryByIdentifier, 0);
}

@end
