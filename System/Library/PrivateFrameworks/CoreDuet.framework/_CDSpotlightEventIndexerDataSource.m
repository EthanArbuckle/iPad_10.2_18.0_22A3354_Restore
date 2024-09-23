@implementation _CDSpotlightEventIndexerDataSource

+ (unint64_t)currentVersion
{
  return 0;
}

- (_CDSpotlightEventIndexerDataSource)initWithKnowledgeStore:(id)a3 eventStream:(id)a4
{
  id v7;
  id v8;
  _CDSpotlightEventIndexerDataSource *v9;
  _CDSpotlightEventIndexerDataSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_CDSpotlightEventIndexerDataSource;
  v9 = -[_CDSpotlightEventIndexerDataSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_knowledgeStore, a3);
    objc_storeStrong((id *)&v10->_stream, a4);
  }

  return v10;
}

- (id)earliestEventCreationDateWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_creationDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortDescriptorWithKey:ascending:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CDSpotlightEventIndexerDataSource stream](self, "stream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", 0, v9, 0, 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_CDSpotlightEventIndexerDataSource.m");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(":%d"), 51);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClientName:", v13);

  objc_msgSend(v11, "setTracker:", &__block_literal_global_23);
  objc_msgSend(v11, "setReadMetadata:", 0);
  -[_CDSpotlightEventIndexerDataSource knowledgeStore](self, "knowledgeStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v14, "executeQuery:error:", v11, &v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v23;

  if (a3)
    *a3 = objc_retainAutorelease(v16);
  if (v15)
  {
    objc_msgSend(v15, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "creationDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v20;

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)searchableItemUniqueIdentifierWithDomain:(id)a3 indexingIdentifier:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (!v5)
    goto LABEL_6;
  v7 = objc_msgSend(v5, "length");
  v8 = 0;
  if (v6 && v7)
  {
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coreduet.%@.%@"), v5, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
  }
LABEL_7:

  return v8;
}

- (id)searchableItemIdentifiersForTombstonedEventsInInterval:(id)a3 latestTombstoneDate:(id *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  _BYTE v49[128];
  void *v50;
  void *v51;
  _QWORD v52[4];

  v52[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  +[_DKTombstoneMetadataKey eventStreamName](_DKTombstoneMetadataKey, "eventStreamName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDSpotlightEventIndexerDataSource stream](self, "stream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForObjectsWithMetadataKey:andStringValue:](_DKQuery, "predicateForObjectsWithMetadataKey:andStringValue:", v8, v10);
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v7;
  objc_msgSend(v7, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForEventsWithCreationInDateRangeFromAfter:to:](_DKQuery, "predicateForEventsWithCreationInDateRangeFromAfter:to:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = (void *)v11;
  v52[0] = v11;
  v52[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_creationDate);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sortDescriptorWithKey:ascending:", v17, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKSystemEventStreams tombstoneStream](_DKSystemEventStreams, "tombstoneStream");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)v15;
  +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v15, v20, 0, 0, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_CDSpotlightEventIndexerDataSource.m");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByAppendingFormat:", CFSTR(":%d"), 96);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClientName:", v24);

  objc_msgSend(v22, "setTracker:", &__block_literal_global_15);
  objc_msgSend(v22, "setReadMetadata:", 0);
  -[_CDSpotlightEventIndexerDataSource knowledgeStore](self, "knowledgeStore");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  objc_msgSend(v25, "executeQuery:error:", v22, &v48);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v48;

  if (a5)
    *a5 = objc_retainAutorelease(v27);
  if (v26)
  {
    v38 = v14;
    objc_msgSend(v26, "lastObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "creationDate");
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v26, "count"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v30 = v26;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v45;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v45 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v34), "stringValue");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
            objc_msgSend(v29, "addObject:", v35);

          ++v34;
        }
        while (v32 != v34);
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v32);
    }

    v36 = (void *)objc_msgSend(v29, "copy");
    v14 = v38;
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (id)bundleIDToSearchableItemsDictionaryWithCreationDateInInterval:(id)a3 limit:(int64_t)a4 nextBatch:(BOOL *)a5 latestCreationDate:(id *)a6 error:(id *)a7
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
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
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v31;
  void *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  objc_msgSend(v11, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKQuery predicateForEventsWithCreationInDateRangeFromAfter:to:](_DKQuery, "predicateForEventsWithCreationInDateRangeFromAfter:to:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_creationDate);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortDescriptorWithKey:ascending:", v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CDSpotlightEventIndexerDataSource stream](self, "stream");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v14, v19, 0, a4, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_CDSpotlightEventIndexerDataSource.m");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringByAppendingFormat:", CFSTR(":%d"), 131);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setClientName:", v23);

  objc_msgSend(v21, "setTracker:", &__block_literal_global_17);
  -[_CDSpotlightEventIndexerDataSource knowledgeStore](self, "knowledgeStore");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v24, "executeQuery:error:", v21, &v31);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v31;

  if (a7)
    *a7 = objc_retainAutorelease(v26);
  if (v25)
  {
    objc_msgSend(v25, "lastObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "creationDate");
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    *a5 = objc_msgSend(v25, "count") == a4;
    -[_CDSpotlightEventIndexerDataSource bundleIDToSearchableItemsDictionaryFromEvents:](self, "bundleIDToSearchableItemsDictionaryFromEvents:", v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)bundleIDToSearchableItemsDictionaryFromEvents:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = objc_opt_class();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("%@ is an abstract class, subclasses must override %@"), v6, v7);

  return 0;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (_DKEventStream)stream
{
  return self->_stream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

@end
