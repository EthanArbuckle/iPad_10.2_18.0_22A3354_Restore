@implementation _DKTombstonePolicy

- (NSArray)propertiesToFetchForTombstones
{
  NSArray *propertiesToFetchForTombstones;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSArray *v16;
  NSArray *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  propertiesToFetchForTombstones = self->_propertiesToFetchForTombstones;
  if (!propertiesToFetchForTombstones)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", CFSTR("objectID"), CFSTR("uuid"), CFSTR("streamName"), 0);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[_DKTombstonePolicy requirements](self, "requirements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v10, "propertiesToFetch");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)v11;
            objc_msgSend(v10, "propertiesToFetch");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "count");

            if (v14)
            {
              objc_msgSend(v10, "propertiesToFetch");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addObjectsFromArray:", v15);

            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v7);
    }

    v16 = (NSArray *)objc_msgSend(v4, "copy");
    v17 = self->_propertiesToFetchForTombstones;
    self->_propertiesToFetchForTombstones = v16;

    propertiesToFetchForTombstones = self->_propertiesToFetchForTombstones;
  }
  return propertiesToFetchForTombstones;
}

+ (id)defaultPolicy
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc((Class)objc_opt_class());
  +[_DKTombstoneRequirement requirement](_DKSyncStreamsTombstoneRequirement, "requirement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKTombstoneRequirement requirement](_DKAppIntentsStreamTombstoneRequirement, "requirement", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  +[_DKTombstoneRequirement requirement](_DKAppActivityStreamTombstoneRequirement, "requirement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  +[_DKTombstoneRequirement requirement](_DKEligibleForPredictionTombstoneRequirement, "requirement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  +[_DKTombstoneRequirement requirement](_DKAppUsageTombstoneRequirement, "requirement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v2, "initWithRequirements:", v8);

  return v9;
}

- (_DKTombstonePolicy)initWithRequirements:(id)a3
{
  id v5;
  _DKTombstonePolicy *v6;
  _DKTombstonePolicy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DKTombstonePolicy;
  v6 = -[_DKTombstonePolicy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_requirements, a3);

  return v7;
}

- (_DKTombstonePolicy)init
{
  return -[_DKTombstonePolicy initWithRequirements:](self, "initWithRequirements:", MEMORY[0x1E0C9AA60]);
}

- (NSPredicate)predicateForEventsRequiredToBeTombstoned
{
  NSPredicate *predicateForEventsRequiredToBeTombstoned;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSPredicate *v15;
  NSPredicate *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  predicateForEventsRequiredToBeTombstoned = self->_predicateForEventsRequiredToBeTombstoned;
  if (!predicateForEventsRequiredToBeTombstoned)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithObjects:", v5, 0);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[_DKTombstonePolicy requirements](self, "requirements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v12, "predicate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v12, "predicate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v14);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v6);
    v15 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
    v16 = self->_predicateForEventsRequiredToBeTombstoned;
    self->_predicateForEventsRequiredToBeTombstoned = v15;

    predicateForEventsRequiredToBeTombstoned = self->_predicateForEventsRequiredToBeTombstoned;
  }
  return predicateForEventsRequiredToBeTombstoned;
}

- (_QWORD)eventPredicateForEventsRequiredToBeTombstoned
{
  _QWORD *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[4];
    if (!v2)
    {
      v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v3, "initWithObjects:", v4, 0);

      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v1, "requirements");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v17 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            objc_msgSend(v11, "eventPredicate");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v12)
            {
              objc_msgSend(v11, "predicate");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v12)
                continue;
            }
            objc_msgSend(v5, "addObject:", v12);

          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v8);
      }

      objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v5);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v1[4];
      v1[4] = v13;

      v2 = (void *)v1[4];
    }
    a1 = v2;
  }
  return a1;
}

- (id)tombstonesForEvents:(id)a3 resultingFromRequirementsWithIdentifiers:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id *v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v42;
  void *v43;
  id obj;
  uint64_t v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  void *v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v37 = a4;
  if (a4)
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  else
    v6 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[_DKTombstonePolicy eventPredicateForEventsRequiredToBeTombstoned](self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v5;
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v53;
    v39 = *(_QWORD *)v53;
    do
    {
      v12 = 0;
      v42 = v10;
      do
      {
        if (*(_QWORD *)v53 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v12);
        objc_msgSend(v13, "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stream");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
          v17 = v14 == 0;
        else
          v17 = 1;
        if (!v17)
        {
          +[_DKSystemEventStreams tombstoneStream](_DKSystemEventStreams, "tombstoneStream");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v14;
          +[_DKUUIDIdentifier withUUID:](_DKUUIDIdentifier, "withUUID:", v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[_DKTombstoneMetadataKey eventStreamName](_DKTombstoneMetadataKey, "eventStreamName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v20;
          v58 = v16;
          v46 = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[_DKEvent eventWithStream:startDate:endDate:value:metadata:](_DKEvent, "eventWithStream:startDate:endDate:value:metadata:", v18, v43, v43, v19, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            v45 = v12;
            v50 = 0u;
            v51 = 0u;
            v48 = 0u;
            v49 = 0u;
            -[_DKTombstonePolicy requirements](self, "requirements");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v49;
              do
              {
                for (i = 0; i != v25; ++i)
                {
                  if (*(_QWORD *)v49 != v26)
                    objc_enumerationMutation(v23);
                  v28 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
                  objc_msgSend(v28, "eventPredicate");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = v29;
                  if (v29)
                  {
                    v31 = v29;
                  }
                  else
                  {
                    objc_msgSend(v28, "predicate");
                    v31 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  v32 = v31;

                  if (objc_msgSend(v32, "evaluateWithObject:", v13))
                  {
                    objc_msgSend(v28, "assignPropertiesToTombstone:extractedFromEvent:", v22, v13);
                    if (v6)
                    {
                      objc_msgSend(v28, "identifier");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v33)
                      {
                        objc_msgSend(v28, "identifier");
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v6, "addObject:", v34);

                      }
                    }
                  }

                }
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
              }
              while (v25);
            }

            objc_msgSend(v40, "addObject:", v22);
            v10 = v42;
            v11 = v39;
            v12 = v45;
          }

          v16 = v46;
          v14 = v47;
        }

        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    }
    while (v10);
  }

  if (v37)
    *v37 = (id)objc_msgSend(v6, "copy");
  v35 = (void *)objc_msgSend(v40, "copy");

  return v35;
}

- (id)tombstonesForPartialEvents:(id)a3 resultingFromRequirementsWithIdentifiers:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v42;
  uint64_t v43;
  id obj;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  void *v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a4)
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  else
    v6 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date", a4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[_DKTombstonePolicy predicateForEventsRequiredToBeTombstoned](self, "predicateForEventsRequiredToBeTombstoned");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v5;
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v54;
    v39 = *(_QWORD *)v54;
    do
    {
      v12 = 0;
      v43 = v10;
      do
      {
        if (*(_QWORD *)v54 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v12);
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("streamName"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("uuid"));
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v14)
          v17 = v15 == 0;
        else
          v17 = 1;
        if (!v17)
        {
          v48 = v12;
          v46 = (void *)v15;
          v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v15);
          +[_DKSystemEventStreams tombstoneStream](_DKSystemEventStreams, "tombstoneStream");
          v19 = v14;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)v18;
          +[_DKUUIDIdentifier withUUID:](_DKUUIDIdentifier, "withUUID:", v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[_DKTombstoneMetadataKey eventStreamName](_DKTombstoneMetadataKey, "eventStreamName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v22;
          v59 = v19;
          v47 = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[_DKEvent eventWithStream:startDate:endDate:value:metadata:](_DKEvent, "eventWithStream:startDate:endDate:value:metadata:", v20, v42, v42, v21, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            v51 = 0u;
            v52 = 0u;
            v49 = 0u;
            v50 = 0u;
            -[_DKTombstonePolicy requirements](self, "requirements");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v50;
              do
              {
                for (i = 0; i != v27; ++i)
                {
                  if (*(_QWORD *)v50 != v28)
                    objc_enumerationMutation(v25);
                  v30 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
                  objc_msgSend(v30, "predicate");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = objc_msgSend(v31, "evaluateWithObject:", v13);

                  if (v32)
                  {
                    objc_msgSend(v30, "assignPropertiesToTombstone:extractedFromPartialEvent:", v24, v13);
                    if (v6)
                    {
                      objc_msgSend(v30, "identifier");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v33)
                      {
                        objc_msgSend(v30, "identifier");
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v6, "addObject:", v34);

                      }
                    }
                  }
                }
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
              }
              while (v27);
            }

            objc_msgSend(v40, "addObject:", v24);
            v11 = v39;
          }

          v10 = v43;
          v14 = v47;
          v12 = v48;
          v16 = v46;
        }

        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    }
    while (v10);
  }

  if (v37)
    *v37 = (id)objc_msgSend(v6, "copy");
  v35 = (void *)objc_msgSend(v40, "copy");

  return v35;
}

- (NSArray)requirements
{
  return self->_requirements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPredicateForEventsRequiredToBeTombstoned, 0);
  objc_storeStrong((id *)&self->_propertiesToFetchForTombstones, 0);
  objc_storeStrong((id *)&self->_predicateForEventsRequiredToBeTombstoned, 0);
  objc_storeStrong((id *)&self->_requirements, 0);
}

@end
