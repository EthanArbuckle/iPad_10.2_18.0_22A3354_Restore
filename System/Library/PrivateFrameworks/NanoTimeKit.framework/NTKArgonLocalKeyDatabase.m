@implementation NTKArgonLocalKeyDatabase

void __65__NTKArgonLocalKeyDatabase_latestChangeTokenForServerIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "newlyAddedChangeTokens");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "persistedChangeTokens");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v4);
  if (!v3)
  {

  }
}

uint64_t __66__NTKArgonLocalKeyDatabase_recordChangeToken_forServerIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "newlyAddedChangeTokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_queue_requestDelayedFlushWithMaximumTimeInterval:", 30.0);
}

- (NSMutableDictionary)newlyAddedChangeTokens
{
  return self->_newlyAddedChangeTokens;
}

- (void)_queue_requestDelayedFlushWithMaximumTimeInterval:(double)a3
{
  NSObject *v5;
  unint64_t v6;
  __uint64_t v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  unint64_t v13;
  _QWORD block[5];
  uint8_t buf[4];
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (NTKInternalBuild(self, a2))
  {
    -[NTKArgonLocalKeyDatabase stateQueue](self, "stateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

  }
  v6 = -[NTKArgonLocalKeyDatabase nextFlushTime](self, "nextFlushTime");
  v7 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW_APPROX);
  v8 = (unint64_t)(a3 * 1000000000.0);
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6 - v8 <= v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[NTKArgonLocalKeyDatabase _queue_requestDelayedFlushWithMaximumTimeInterval:].cold.1(v10);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = a3;
      _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "Key Database: Enqueueing flush request within %f seconds.", buf, 0xCu);
    }

    v11 = dispatch_time(0x8000000000000000, (unint64_t)(a3 * 1000000000.0));
    -[NTKArgonLocalKeyDatabase stateQueue](self, "stateQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__NTKArgonLocalKeyDatabase__queue_requestDelayedFlushWithMaximumTimeInterval___block_invoke;
    block[3] = &unk_1E6BCD5F0;
    block[4] = self;
    dispatch_after(v11, v12, block);

    if (v6 <= v7 + v8)
      v13 = v7 + v8;
    else
      v13 = v6;
    -[NTKArgonLocalKeyDatabase setNextFlushTime:](self, "setNextFlushTime:", v13);
  }
}

- (unint64_t)nextFlushTime
{
  return self->_nextFlushTime;
}

- (id)latestChangeTokenForServerIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0;
  -[NTKArgonLocalKeyDatabase stateQueue](self, "stateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__NTKArgonLocalKeyDatabase_latestChangeTokenForServerIdentifier___block_invoke;
  block[3] = &unk_1E6BD0830;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)enumerateKeyDescriptors:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD block[4];
  id v18;
  NTKArgonLocalKeyDatabase *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKArgonLocalKeyDatabase stateQueue](self, "stateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__NTKArgonLocalKeyDatabase_enumerateKeyDescriptors___block_invoke;
  block[3] = &unk_1E6BCD778;
  v7 = v5;
  v18 = v7;
  v19 = self;
  dispatch_sync(v6, block);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
    }
    while (v10);
  }

}

- (BOOL)addKeyDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t *v11;
  NSObject *v12;
  BOOL v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "fileName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__10;
  v23 = __Block_byref_object_dispose__10;
  v24 = 0;
  -[NTKArgonLocalKeyDatabase stateQueue](self, "stateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__NTKArgonLocalKeyDatabase_addKeyDescriptor_error___block_invoke;
  v15[3] = &unk_1E6BD0988;
  v15[4] = self;
  v9 = v6;
  v16 = v9;
  v18 = &v19;
  v10 = v7;
  v17 = v10;
  dispatch_sync(v8, v15);

  v11 = v20;
  if (v20[5])
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v10;
      _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "Skipped key descriptor for file name %@", buf, 0xCu);
    }

    v11 = v20;
    if (a4)
    {
      *a4 = objc_retainAutorelease((id)v20[5]);
      v11 = v20;
    }
  }
  v13 = v11[5] == 0;

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

void __52__NTKArgonLocalKeyDatabase_enumerateKeyDescriptors___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "persistedKeyDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionOrderedSet:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "newlyAddedKeyDescriptors");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionOrderedSet:", v5);

}

void __51__NTKArgonLocalKeyDatabase_addKeyDescriptor_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistedKeyDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "newlyAddedKeyDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40)) & 1) != 0
    || objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend((id)objc_opt_class(), "_argonKeyDatabaseErrorWithCode:userInfo:", 1, &unk_1E6CA87A8);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  else
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 48);
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "Adding key descriptor for file name %@", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "newlyAddedKeyDescriptors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", *(_QWORD *)(a1 + 40));

    if (*(_QWORD *)(a1 + 48))
    {
      v10 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "newlyAddedKeyDescriptorsByFileName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, *(_QWORD *)(a1 + 48));

    }
    objc_msgSend(*(id *)(a1 + 32), "_queue_requestDelayedFlushWithMaximumTimeInterval:", 30.0);
  }

}

- (NSMutableOrderedSet)persistedKeyDescriptors
{
  return self->_persistedKeyDescriptors;
}

- (NSMutableOrderedSet)newlyAddedKeyDescriptors
{
  return self->_newlyAddedKeyDescriptors;
}

+ (id)_argonKeyDatabaseErrorWithCode:(unint64_t)a3 userInfo:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKArgonLocalKeyDatabaseErrorDomain"), a3, a4);
}

- (void)recordChangeToken:(id)a3 forServerIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[NTKArgonLocalKeyDatabase stateQueue](self, "stateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__NTKArgonLocalKeyDatabase_recordChangeToken_forServerIdentifier___block_invoke;
  block[3] = &unk_1E6BCDCB8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, block);

}

- (NTKArgonLocalKeyDatabase)initWithKeyStoragePath:(id)a3
{
  id v4;
  NTKArgonLocalKeyDatabase *v5;
  uint64_t v6;
  NSString *storagePath;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *stateQueue;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  id v19;
  id v20;
  NSObject *v21;
  NSMutableOrderedSet *v22;
  NSMutableOrderedSet *persistedKeyDescriptors;
  NSObject *v24;
  NSMutableDictionary *v25;
  NSMutableDictionary *persistedChangeTokens;
  uint64_t v27;
  NSMutableOrderedSet *newlyAddedKeyDescriptors;
  uint64_t v29;
  NSMutableDictionary *newlyAddedChangeTokens;
  uint64_t v31;
  NSMutableDictionary *persistedKeyDescriptorsByFileName;
  NSMutableOrderedSet *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  NSMutableDictionary *newlyAddedKeyDescriptorsByFileName;
  NSMutableOrderedSet *v44;
  void *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  id v52;
  id v53;
  id v54;
  objc_super v55;
  uint8_t buf[4];
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)NTKArgonLocalKeyDatabase;
  v5 = -[NTKArgonLocalKeyDatabase init](&v55, sel_init);
  if (!v5)
    goto LABEL_29;
  v6 = objc_msgSend(v4, "copy");
  storagePath = v5->_storagePath;
  v5->_storagePath = (NSString *)v6;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create("com.apple.nanotimekit.facesupport.keydatabase", v8);
  stateQueue = v5->_stateQueue;
  v5->_stateQueue = (OS_dispatch_queue *)v9;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fileExistsAtPath:", v5->_storagePath);

  v13 = 0;
  if (!v12)
    goto LABEL_13;
  v14 = (void *)MEMORY[0x1E0C99D50];
  -[NTKArgonLocalKeyDatabase storagePath](v5, "storagePath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0;
  objc_msgSend(v14, "dataWithContentsOfFile:options:error:", v15, 0, &v54);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v54;

  if (!v16)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[NTKArgonLocalKeyDatabase initWithKeyStoragePath:].cold.1();

    v13 = 0;
    goto LABEL_13;
  }
  v52 = 0;
  v53 = 0;
  v51 = v17;
  v18 = +[NTKArgonLocalKeyDatabase _decodedKeyDescriptors:changeTokens:fromData:error:](NTKArgonLocalKeyDatabase, "_decodedKeyDescriptors:changeTokens:fromData:error:", &v53, &v52, v16, &v51);
  v19 = v53;
  v13 = v52;
  v20 = v51;

  if (!v18)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[NTKArgonLocalKeyDatabase initWithKeyStoragePath:].cold.2();

  }
  if (!v19)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v22 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    persistedKeyDescriptors = v5->_persistedKeyDescriptors;
    goto LABEL_14;
  }
  v22 = (NSMutableOrderedSet *)v19;
  persistedKeyDescriptors = v5->_persistedKeyDescriptors;
  v44 = v22;
LABEL_14:
  v5->_persistedKeyDescriptors = v22;

  v45 = v13;
  v46 = v4;
  if (v13)
  {
    v25 = (NSMutableDictionary *)v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  }
  persistedChangeTokens = v5->_persistedChangeTokens;
  v5->_persistedChangeTokens = v25;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v27 = objc_claimAutoreleasedReturnValue();
  newlyAddedKeyDescriptors = v5->_newlyAddedKeyDescriptors;
  v5->_newlyAddedKeyDescriptors = (NSMutableOrderedSet *)v27;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v29 = objc_claimAutoreleasedReturnValue();
  newlyAddedChangeTokens = v5->_newlyAddedChangeTokens;
  v5->_newlyAddedChangeTokens = (NSMutableDictionary *)v29;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableOrderedSet count](v5->_persistedKeyDescriptors, "count"));
  v31 = objc_claimAutoreleasedReturnValue();
  persistedKeyDescriptorsByFileName = v5->_persistedKeyDescriptorsByFileName;
  v5->_persistedKeyDescriptorsByFileName = (NSMutableDictionary *)v31;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v33 = v5->_persistedKeyDescriptors;
  v34 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v48 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v38, "fileName");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_persistedKeyDescriptorsByFileName, "setObject:forKeyedSubscript:", v38, v39);
          _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v39;
            _os_log_impl(&dword_1B72A3000, v40, OS_LOG_TYPE_DEFAULT, "Loaded key descriptor for file name %@", buf, 0xCu);
          }

        }
      }
      v35 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
    }
    while (v35);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v41 = objc_claimAutoreleasedReturnValue();
  newlyAddedKeyDescriptorsByFileName = v5->_newlyAddedKeyDescriptorsByFileName;
  v5->_newlyAddedKeyDescriptorsByFileName = (NSMutableDictionary *)v41;

  v5->_nextFlushTime = 0;
  v4 = v46;
LABEL_29:

  return v5;
}

- (id)keyDescriptorForFileName:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__10;
    v15 = __Block_byref_object_dispose__10;
    v16 = 0;
    -[NTKArgonLocalKeyDatabase stateQueue](self, "stateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__NTKArgonLocalKeyDatabase_keyDescriptorForFileName___block_invoke;
    block[3] = &unk_1E6BD0830;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(v5, block);

    v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __53__NTKArgonLocalKeyDatabase_keyDescriptorForFileName___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "newlyAddedKeyDescriptorsByFileName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "persistedKeyDescriptorsByFileName");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v4);
  if (!v3)
  {

  }
}

- (void)flush
{
  -[NTKArgonLocalKeyDatabase flushWithinTimeInterval:](self, "flushWithinTimeInterval:", 1.0);
}

- (void)flushWithinTimeInterval:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[NTKArgonLocalKeyDatabase stateQueue](self, "stateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__NTKArgonLocalKeyDatabase_flushWithinTimeInterval___block_invoke;
  v6[3] = &unk_1E6BD09B0;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_sync(v5, v6);

}

uint64_t __52__NTKArgonLocalKeyDatabase_flushWithinTimeInterval___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_requestDelayedFlushWithMaximumTimeInterval:", *(double *)(a1 + 40));
}

uint64_t __78__NTKArgonLocalKeyDatabase__queue_requestDelayedFlushWithMaximumTimeInterval___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_flushImmediately");
}

- (void)_queue_flushImmediately
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "Key Database: Couldn't create directory: %@. Skipping persistence attempt.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (id)_jsonDataForKeyDescriptors:(id)a3 changeTokens:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  id v47;
  _QWORD v48[3];
  _QWORD v49[3];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "argon_JSONRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
    }
    while (v12);
  }
  v34 = a5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v17 = v8;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v37 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
        objc_msgSend(v17, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "base64EncodedStringWithOptions:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v24, v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
    }
    while (v19);
  }

  v48[0] = CFSTR("kd");
  v48[1] = CFSTR("ct");
  v49[0] = v9;
  v49[1] = v16;
  v48[2] = CFSTR("v");
  v49[2] = &unk_1E6C9E218;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v25) & 1) != 0)
  {
    v35 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v25, 0, &v35);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v27 = v35;
    if (v26)
    {
      v26 = v26;
      v28 = v26;
    }
    else
    {
      if (v34)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not encode JSON %@"), v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_opt_class();
        v44 = CFSTR("description");
        v45 = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "_argonKeyDatabaseErrorWithCode:userInfo:", 3, v32);
        *v34 = (id)objc_claimAutoreleasedReturnValue();

      }
      v28 = 0;
    }
  }
  else
  {
    if (!v34)
    {
      v28 = 0;
      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Object %@ is not valid JSON"), v25);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_opt_class();
    v46 = CFSTR("description");
    v47 = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_argonKeyDatabaseErrorWithCode:userInfo:", 2, v26);
    v28 = 0;
    *v34 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_24:
  return v28;
}

+ (BOOL)_decodedKeyDescriptors:(id *)a3 changeTokens:(id *)a4 fromData:(id)a5 error:(id *)a6
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  NTKArgonKeyDescriptor *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  NSObject *v38;
  unint64_t v39;
  NSObject *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  NTKArgonKeyDescriptor *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void **v55;
  const __CFString **v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  id *v69;
  id v71;
  void *v72;
  id *v73;
  id *v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  id *v79;
  id v80;
  id v81;
  id obj;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  id v95;
  const __CFString *v96;
  void *v97;
  const __CFString *v98;
  void *v99;
  uint8_t v100[128];
  uint8_t buf[4];
  void *v102;
  __int16 v103;
  void *v104;
  _BYTE v105[128];
  _BYTE v106[128];
  const __CFString *v107;
  void *v108;
  const __CFString *v109;
  void *v110;
  uint64_t v111;
  _QWORD v112[4];

  v112[1] = *MEMORY[0x1E0C80C00];
  v95 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a5, 0, &v95);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v95;
  if (!a6 || v9)
  {
    v79 = a3;
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v81 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v74 = a4;
        v76 = v10;
        v80 = v12;
        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        v78 = v9;
        v42 = v9;
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
        if (v43)
        {
          v44 = v43;
          v45 = *(_QWORD *)v84;
          while (2)
          {
            for (i = 0; i != v44; ++i)
            {
              if (*(_QWORD *)v84 != v45)
                objc_enumerationMutation(v42);
              v47 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (a6)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Array contains class %@, not dictionary"), objc_opt_class());
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  v61 = (void *)objc_opt_class();
                  v98 = CFSTR("description");
                  v99 = v60;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v61, "_argonKeyDatabaseErrorWithCode:userInfo:", 5, v62);
                  v63 = (void *)objc_claimAutoreleasedReturnValue();

                  v64 = objc_retainAutorelease(v63);
                  *a6 = v64;

                }
                v13 = 0;
                v10 = v76;
                v9 = v78;
                v12 = v80;
                goto LABEL_70;
              }
              v48 = [NTKArgonKeyDescriptor alloc];
              -[NTKArgonKeyDescriptor argon_initWithJSONRepresentation:](v48, "argon_initWithJSONRepresentation:", v47);
              v49 = (void *)objc_claimAutoreleasedReturnValue();

              if (v49)
              {
                objc_msgSend(v80, "addObject:", v49);
              }
              else
              {
                _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
                v50 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v102 = v47;
                  _os_log_error_impl(&dword_1B72A3000, v50, OS_LOG_TYPE_ERROR, "Could not create descriptor from %@", buf, 0xCu);
                }

              }
            }
            v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
            if (v44)
              continue;
            break;
          }
        }

        v12 = v80;
        *v79 = objc_retainAutorelease(v80);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v10 = v76;
        *v74 = (id)objc_claimAutoreleasedReturnValue();
        v13 = 1;
        v9 = v78;
      }
      else
      {
        if (a6)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown format with root object of class %@"), objc_opt_class());
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = (void *)objc_opt_class();
          v96 = CFSTR("description");
          v97 = v57;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "_argonKeyDatabaseErrorWithCode:userInfo:", 5, v59);
          *a6 = (id)objc_claimAutoreleasedReturnValue();

        }
        v13 = 0;
      }
      goto LABEL_70;
    }
    v14 = v9;
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("v"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", &unk_1E6C9E218);

    if ((v16 & 1) != 0)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kd"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v73 = a4;
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ct"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v75 = v10;
          v77 = v9;
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kd"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v14;
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ct"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = 0u;
          v92 = 0u;
          v93 = 0u;
          v94 = 0u;
          obj = v20;
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v106, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v92;
            do
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v92 != v23)
                  objc_enumerationMutation(obj);
                v25 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v26 = [NTKArgonKeyDescriptor alloc];
                  -[NTKArgonKeyDescriptor argon_initWithJSONRepresentation:](v26, "argon_initWithJSONRepresentation:", v25);
                  v27 = objc_claimAutoreleasedReturnValue();

                  if (v27)
                  {
                    objc_msgSend(v12, "addObject:", v27);
                  }
                  else
                  {
                    v28 = v12;
                    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
                    v29 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v102 = v25;
                      _os_log_error_impl(&dword_1B72A3000, v29, OS_LOG_TYPE_ERROR, "Could not create descriptor from %@", buf, 0xCu);
                    }

                    v12 = v28;
                  }
                }
                else
                {
                  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
                  v27 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v102 = v25;
                    _os_log_error_impl(&dword_1B72A3000, v27, OS_LOG_TYPE_ERROR, "Could not create key descriptor from %@", buf, 0xCu);
                  }
                }

              }
              v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v106, 16);
            }
            while (v22);
          }

          v89 = 0u;
          v90 = 0u;
          v87 = 0u;
          v88 = 0u;
          v30 = v72;
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v87, v105, 16);
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v88;
            v34 = 0x1E0C99000uLL;
            do
            {
              for (k = 0; k != v32; ++k)
              {
                if (*(_QWORD *)v88 != v33)
                  objc_enumerationMutation(v30);
                v36 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * k);
                objc_msgSend(v30, "objectForKeyedSubscript:", v36);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v38 = objc_msgSend(objc_alloc(*(Class *)(v34 + 3408)), "initWithBase64EncodedString:options:", v37, 0);
                  if (!v38)
                  {
                    v39 = v34;
                    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
                    v40 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v102 = v37;
                      _os_log_error_impl(&dword_1B72A3000, v40, OS_LOG_TYPE_ERROR, "Could not create change token from %@: not encoded correctly", buf, 0xCu);
                    }

                    v34 = v39;
                  }
                  objc_msgSend(v81, "setObject:forKeyedSubscript:", v38, v36);
                }
                else
                {
                  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
                  v38 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v102 = v36;
                    v103 = 2112;
                    v104 = v37;
                    _os_log_error_impl(&dword_1B72A3000, v38, OS_LOG_TYPE_ERROR, "Could not create change token from %@ -> %@", buf, 0x16u);
                  }
                }

              }
              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v87, v105, 16);
            }
            while (v32);
          }

          *v79 = objc_retainAutorelease(v12);
          v10 = v75;
          *v73 = objc_retainAutorelease(v81);
          v13 = 1;
          v9 = v77;
          v14 = v71;
          v41 = obj;
          goto LABEL_67;
        }
      }
      else
      {

      }
      if (a6)
      {
        v65 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kd"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_opt_class();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ct"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "stringWithFormat:", CFSTR("Unknown format with key descriptor container of class %@ and change token container of class %@"), v67, objc_opt_class());
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = (void *)objc_opt_class();
        v107 = CFSTR("description");
        v108 = v41;
        v54 = (void *)MEMORY[0x1E0C99D80];
        v55 = &v108;
        v56 = &v107;
        goto LABEL_66;
      }
    }
    else if (a6)
    {
      v51 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("v"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "stringWithFormat:", CFSTR("Unknown format version %@"), v52);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = (void *)objc_opt_class();
      v109 = CFSTR("description");
      v110 = v41;
      v54 = (void *)MEMORY[0x1E0C99D80];
      v55 = &v110;
      v56 = &v109;
LABEL_66:
      objc_msgSend(v54, "dictionaryWithObjects:forKeys:count:", v55, v56, 1);
      v69 = a6;
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "_argonKeyDatabaseErrorWithCode:userInfo:", 5, v30);
      v13 = 0;
      *v69 = (id)objc_claimAutoreleasedReturnValue();
LABEL_67:

LABEL_69:
LABEL_70:

      goto LABEL_71;
    }
    v13 = 0;
    goto LABEL_69;
  }
  v11 = (void *)objc_opt_class();
  v111 = *MEMORY[0x1E0CB3388];
  v112[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, &v111, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_argonKeyDatabaseErrorWithCode:userInfo:", 4, v12);
  v13 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_71:

  return v13;
}

- (NSString)storagePath
{
  return self->_storagePath;
}

- (void)setStateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_stateQueue, a3);
}

- (NSMutableDictionary)persistedKeyDescriptorsByFileName
{
  return self->_persistedKeyDescriptorsByFileName;
}

- (NSMutableDictionary)newlyAddedKeyDescriptorsByFileName
{
  return self->_newlyAddedKeyDescriptorsByFileName;
}

- (NSMutableDictionary)persistedChangeTokens
{
  return self->_persistedChangeTokens;
}

- (void)setNextFlushTime:(unint64_t)a3
{
  self->_nextFlushTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newlyAddedChangeTokens, 0);
  objc_storeStrong((id *)&self->_persistedChangeTokens, 0);
  objc_storeStrong((id *)&self->_newlyAddedKeyDescriptorsByFileName, 0);
  objc_storeStrong((id *)&self->_persistedKeyDescriptorsByFileName, 0);
  objc_storeStrong((id *)&self->_newlyAddedKeyDescriptors, 0);
  objc_storeStrong((id *)&self->_persistedKeyDescriptors, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_storagePath, 0);
}

- (void)initWithKeyStoragePath:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1B72A3000, v0, (uint64_t)v0, "Error loading key database at %@: %@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)initWithKeyStoragePath:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_1B72A3000, v0, (uint64_t)v0, "Error decoding key database at %@: %@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_requestDelayedFlushWithMaximumTimeInterval:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B72A3000, log, OS_LOG_TYPE_DEBUG, "Key Database: Flush request already in flight. Not enqueueing additional flush task.", v1, 2u);
}

@end
