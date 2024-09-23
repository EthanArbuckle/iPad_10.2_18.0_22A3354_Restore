@implementation BMStorePublisherManager

void __55__BMStorePublisherManager__streamReaderWithRemoteName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v15, "remoteDatastores");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "_createStreamReaderForRemoteName:eventDataClass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "remoteDatastores");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 32));

    }
    objc_msgSend(v15, "remoteDatastores");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  else
  {
    objc_msgSend(v15, "localDatastore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(*(id *)(a1 + 40), "_createStreamReaderForRemoteName:eventDataClass:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setLocalDatastore:", v12);

    }
    objc_msgSend(v15, "localDatastore");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;
  }

}

- (id)_createStreamReaderForRemoteName:(id)a3 eventDataClass:(Class)a4
{
  objc_class *v6;
  id v7;
  id v8;
  NSString *streamIdentifier;
  void *v10;
  void *v11;

  v6 = (objc_class *)MEMORY[0x1E0D024E0];
  v7 = a3;
  v8 = [v6 alloc];
  streamIdentifier = self->_streamIdentifier;
  v10 = (void *)-[BMStoreConfig copyWithRemoteName:](self->_config, "copyWithRemoteName:", v7);

  v11 = (void *)objc_msgSend(v8, "initWithStream:config:eventDataClass:useCase:", streamIdentifier, v10, a4, self->_useCase);
  return v11;
}

- (id)publisherWithOptions:(id)a3
{
  return -[BMStorePublisherManager _publisherForDevice:options:](self, "_publisherForDevice:options:", 0, a3);
}

- (id)_publisherForDevice:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BPSBiomeStorePublisher *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v6 = a4;
  objc_msgSend(a3, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMStorePublisherManager _streamReaderWithRemoteName:](self, "_streamReaderWithRemoteName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[BPSBiomeStorePublisher initWithStreamDatastoreReader:streamsAccessClient:]([BPSBiomeStorePublisher alloc], "initWithStreamDatastoreReader:streamsAccessClient:", v8, self->_accessClient);
  objc_msgSend(v6, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v12 = -[BPSBiomeStorePublisher withStartTime:](v9, "withStartTime:");

  }
  objc_msgSend(v6, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v6, "endDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    v15 = -[BPSBiomeStorePublisher withEndTime:](v9, "withEndTime:");

  }
  objc_msgSend(v6, "indexSearch");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v6, "indexSearch");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[BPSBiomeStorePublisher withIndexSearch:](v9, "withIndexSearch:", v17);

  }
  if (objc_msgSend(v6, "maxEvents"))
    v19 = -[BPSBiomeStorePublisher withMaxEvents:](v9, "withMaxEvents:", objc_msgSend(v6, "maxEvents"));
  if (objc_msgSend(v6, "lastN"))
    v20 = -[BPSBiomeStorePublisher withLastEvents:](v9, "withLastEvents:", objc_msgSend(v6, "lastN"));
  if (objc_msgSend(v6, "reversed"))
    v21 = -[BPSBiomeStorePublisher reverse](v9, "reverse");

  return v9;
}

- (id)_streamReaderWithRemoteName:(id)a3
{
  id v4;
  _PASLock *protectedState;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  BMStorePublisherManager *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  protectedState = self->_protectedState;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__BMStorePublisherManager__streamReaderWithRemoteName___block_invoke;
  v9[3] = &unk_1E2647930;
  v6 = v4;
  v10 = v6;
  v11 = self;
  v12 = &v13;
  -[_PASLock runWithLockAcquired:](protectedState, "runWithLockAcquired:", v9);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (BMStorePublisherManager)initWithStreamIdentifier:(id)a3 streamConfig:(id)a4 accessClient:(id)a5 eventDataClass:(Class)a6 useCase:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  BMStorePublisherManager *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  NSString *streamIdentifier;
  id v21;
  void *v22;
  uint64_t v23;
  _PASLock *protectedState;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)BMStorePublisherManager;
  v16 = -[BMStorePublisherManager init](&v26, sel_init);
  if (v16)
  {
    objc_msgSend(v13, "remoteName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      __biome_log_for_category();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[BMStorePublisherManager initWithStreamIdentifier:streamConfig:accessClient:eventDataClass:useCase:].cold.1(v18);

    }
    objc_storeStrong((id *)&v16->_config, a4);
    v19 = objc_msgSend(v12, "copy");
    streamIdentifier = v16->_streamIdentifier;
    v16->_streamIdentifier = (NSString *)v19;

    objc_storeStrong((id *)&v16->_accessClient, a5);
    v16->_eventDataClass = a6;
    objc_storeStrong((id *)&v16->_useCase, a7);
    v21 = objc_alloc(MEMORY[0x1E0D815F0]);
    v22 = (void *)objc_opt_new();
    v23 = objc_msgSend(v21, "initWithGuardedData:", v22);
    protectedState = v16->_protectedState;
    v16->_protectedState = (_PASLock *)v23;

  }
  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedState, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_accessClient, 0);
  objc_storeStrong((id *)&self->_streamIdentifier, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (id)publishersForDevices:(id)a3 includeLocal:(BOOL)a4 options:(id)a5 pipeline:(id)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BMPublishers *v14;

  v7 = a4;
  v10 = a6;
  -[BMStorePublisherManager _publishersForDevices:includeLocal:options:](self, "_publishersForDevices:includeLocal:options:", a3, v7, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v11, "_pas_mappedArrayWithTransform:", v10);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  v14 = -[BMPublishers initWithPublishers:]([BMPublishers alloc], "initWithPublishers:", v12);

  return v14;
}

- (id)_publishersForDevices:(id)a3 includeLocal:(BOOL)a4 options:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        -[BMStorePublisherManager _publisherForDevice:options:](self, "_publisherForDevice:options:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15), v9, (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  if (v6)
  {
    -[BMStorePublisherManager _publisherForDevice:options:](self, "_publisherForDevice:options:", 0, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v10, "addObject:", v17);

  }
  return v10;
}

- (void)initWithStreamIdentifier:(os_log_t)log streamConfig:accessClient:eventDataClass:useCase:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18D810000, log, OS_LOG_TYPE_ERROR, "Warning: instantiating a BMStorePublisherManager with a config which already specifies a remote", v1, 2u);
}

@end
