@implementation BMIntentStream

- (id)source
{
  return -[BMStoreStream source](self->_storeStream, "source");
}

- (NSString)identifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01D20], "streamIdentifierForStream:", 2);
}

- (BMIntentStream)init
{
  BMIntentStream *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BMStoreStream *storeStream;
  NSObject *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BMIntentStream;
  v2 = -[BMIntentStream init](&v10, sel_init);
  if (v2)
  {
    BMRootLibraryBridge();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "App");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "Intent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "storeStreamWithLegacyClass:", objc_opt_class());
    v6 = objc_claimAutoreleasedReturnValue();
    storeStream = v2->_storeStream;
    v2->_storeStream = (BMStoreStream *)v6;

    if (!v2->_storeStream)
    {
      __biome_log_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[BMIntentStream init].cold.1();

    }
  }
  return v2;
}

- (id)publisherFromStartTime:(double)a3
{
  return -[BMStoreStream publisherFromStartTime:](self->_storeStream, "publisherFromStartTime:", a3);
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6
{
  return -[BMStoreStream publisherWithStartTime:endTime:maxEvents:lastN:reversed:](self->_storeStream, "publisherWithStartTime:endTime:maxEvents:lastN:reversed:", a3, a4, a5, 0, a6);
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7
{
  return -[BMStoreStream publisherWithStartTime:endTime:maxEvents:lastN:reversed:](self->_storeStream, "publisherWithStartTime:endTime:maxEvents:lastN:reversed:", a3, a4, a5, a6, a7);
}

- (id)publisher
{
  BMDSLStreamPublisher *v3;
  void *v4;
  BMDSLStreamPublisher *v5;

  v3 = [BMDSLStreamPublisher alloc];
  -[BMIntentStream identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BMDSLStreamPublisher initWithIdentifier:streamType:eventDataClass:](v3, "initWithIdentifier:streamType:eventDataClass:", v4, 1, objc_opt_class());

  return v5;
}

- (void)deleteIntentsWithIdentifiers:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  BMStoreStream *storeStream;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(_QWORD *, void *, _BYTE *);
  void *v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  if (!v8)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D810000, v9, OS_LOG_TYPE_INFO, "No itemIDs specified for deletion, returning early", buf, 2u);
    }

  }
  storeStream = self->_storeStream;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __56__BMIntentStream_deleteIntentsWithIdentifiers_bundleID___block_invoke;
  v24 = &unk_1E2647F40;
  v11 = v7;
  v25 = v11;
  v12 = v6;
  v26 = v12;
  v27 = &v29;
  v28 = v8;
  -[BMStoreStream pruneWithPredicateBlock:](storeStream, "pruneWithPredicateBlock:", &v21);
  v13 = v30[3];
  if (v13 == objc_msgSend(v12, "count", v21, v22, v23, v24))
  {
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 134217984;
      v34 = v15;
      v16 = "Deleted all intents identifiers matching %lu specified";
      v17 = v14;
      v18 = 12;
LABEL_10:
      _os_log_impl(&dword_18D810000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
    }
  }
  else
  {
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v30[3];
      v20 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 134218240;
      v34 = v19;
      v35 = 2048;
      v36 = v20;
      v16 = "Deleted %ld intents matching %lu provided";
      v17 = v14;
      v18 = 22;
      goto LABEL_10;
    }
  }

  _Block_object_dispose(&v29, 8);
}

uint64_t __56__BMIntentStream_deleteIntentsWithIdentifiers_bundleID___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v3;
  id v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  NSObject *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v19;
  NSObject *v20;
  uint8_t v21[16];

  v6 = a2;
  v7 = v6;
  if (!v6)
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __56__BMIntentStream_deleteIntentsWithIdentifiers_bundleID___block_invoke_cold_1();
    goto LABEL_11;
  }
  objc_msgSend(v6, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __56__BMIntentStream_deleteIntentsWithIdentifiers_bundleID___block_invoke_cold_3(v7);
    goto LABEL_11;
  }
  objc_msgSend(v7, "eventBody");
  v10 = objc_claimAutoreleasedReturnValue();
  -[NSObject bundleID](v10, "bundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 || a1[4])
  {
    -[NSObject bundleID](v10, "bundleID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", a1[4]) & 1) == 0)
      goto LABEL_18;
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  -[NSObject itemID](v10, "itemID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {

    if ((v12 & 1) == 0)
    {
LABEL_19:

      goto LABEL_20;
    }
LABEL_18:

    goto LABEL_19;
  }
  v15 = (void *)a1[5];
  -[NSObject itemID](v10, "itemID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "containsObject:", v16);

  if ((v12 & 1) == 0)
  {

    if (v17)
      goto LABEL_23;
LABEL_20:
    v13 = 0;
    goto LABEL_21;
  }

  if ((v17 & 1) == 0)
    goto LABEL_20;
LABEL_23:
  __biome_log_for_category();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    __56__BMIntentStream_deleteIntentsWithIdentifiers_bundleID___block_invoke_cold_2(v10, v19);

  if (++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) != a1[7])
  {
LABEL_11:
    v13 = 1;
    goto LABEL_21;
  }
  __biome_log_for_category();
  v20 = objc_claimAutoreleasedReturnValue();
  v13 = 1;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_18D810000, v20, OS_LOG_TYPE_INFO, "Deleted all requested identifiers, stopping early", v21, 2u);
  }

  *a3 = 1;
LABEL_21:

  return v13;
}

- (void)deleteIntentsWithGroupIdentifiers:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  BMStoreStream *storeStream;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = (id)objc_opt_new();
  if (objc_msgSend(v6, "count"))
  {
    storeStream = self->_storeStream;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__BMIntentStream_deleteIntentsWithGroupIdentifiers_bundleID___block_invoke;
    v14[3] = &unk_1E2647F68;
    v15 = v7;
    v9 = v6;
    v16 = v9;
    v17 = &v18;
    -[BMStoreStream pruneWithPredicateBlock:](storeStream, "pruneWithPredicateBlock:", v14);
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend((id)v19[5], "count");
      v12 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134218240;
      v25 = v11;
      v26 = 2048;
      v27 = v12;
      _os_log_impl(&dword_18D810000, v10, OS_LOG_TYPE_DEFAULT, "Deleted %lu intents matching %lu provided group identifiers", buf, 0x16u);
    }

    v13 = v15;
  }
  else
  {
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D810000, v13, OS_LOG_TYPE_INFO, "No groupIdentifiers specified for deletion, returning early", buf, 2u);
    }
  }

  _Block_object_dispose(&v18, 8);
}

uint64_t __61__BMIntentStream_deleteIntentsWithGroupIdentifiers_bundleID___block_invoke(_QWORD *a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  NSObject *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v17;
  void *v18;
  void *v19;

  v4 = a2;
  v5 = v4;
  if (!v4)
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __56__BMIntentStream_deleteIntentsWithIdentifiers_bundleID___block_invoke_cold_1();
    goto LABEL_11;
  }
  objc_msgSend(v4, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __56__BMIntentStream_deleteIntentsWithIdentifiers_bundleID___block_invoke_cold_3(v5);
    goto LABEL_11;
  }
  objc_msgSend(v5, "eventBody");
  v8 = objc_claimAutoreleasedReturnValue();
  -[NSObject bundleID](v8, "bundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 || a1[4])
  {
    -[NSObject bundleID](v8, "bundleID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "isEqualToString:", a1[4]) & 1) == 0)
      goto LABEL_18;
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  -[NSObject groupIdentifier](v8, "groupIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

    if ((v10 & 1) == 0)
    {
LABEL_19:

      goto LABEL_20;
    }
LABEL_18:

    goto LABEL_19;
  }
  v13 = (void *)a1[5];
  -[NSObject groupIdentifier](v8, "groupIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "containsObject:", v14);

  if ((v10 & 1) != 0)
  {

    if ((v15 & 1) != 0)
      goto LABEL_23;
LABEL_20:
    v11 = 0;
    goto LABEL_21;
  }

  if (!v15)
    goto LABEL_20;
LABEL_23:
  __biome_log_for_category();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    __61__BMIntentStream_deleteIntentsWithGroupIdentifiers_bundleID___block_invoke_cold_2(v8, v17);

  v18 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  -[NSObject identifier](v8, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v19);

LABEL_11:
  v11 = 1;
LABEL_21:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeStream, 0);
}

- (void)init
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_6();
  _os_log_fault_impl(&dword_18D810000, v0, OS_LOG_TYPE_FAULT, "Unable to initialize BMAppIntentStream, please consult error logs for cause", v1, 2u);
  OUTLINED_FUNCTION_2();
}

void __56__BMIntentStream_deleteIntentsWithIdentifiers_bundleID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6_0(&dword_18D810000, v0, v1, "Unreadable store event, marking for deletion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__BMIntentStream_deleteIntentsWithIdentifiers_bundleID___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  _os_log_debug_impl(&dword_18D810000, a2, OS_LOG_TYPE_DEBUG, "Intent matching itemID %@ found, marking for deletion", v4, 0xCu);

  OUTLINED_FUNCTION_0_0();
}

void __56__BMIntentStream_deleteIntentsWithIdentifiers_bundleID___block_invoke_cold_3(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "timestamp");
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v1, v2, "Event in Intent stream of unexpected class timestamp %{public}f marking for deletion", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_0_0();
}

void __61__BMIntentStream_deleteIntentsWithGroupIdentifiers_bundleID___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "groupIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_18D810000, a2, OS_LOG_TYPE_DEBUG, "Intent with matching groupIdentifier %@ found, marking for deletion event with ID: %@", (uint8_t *)&v6, 0x16u);

}

@end
