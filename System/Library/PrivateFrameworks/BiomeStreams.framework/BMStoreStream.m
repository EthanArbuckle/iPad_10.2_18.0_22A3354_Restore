@implementation BMStoreStream

- (id)publisherFromStartTime:(double)a3
{
  void *v4;
  BMPublisherOptions *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BMPublisherOptions initWithStartDate:endDate:maxEvents:lastN:reversed:]([BMPublisherOptions alloc], "initWithStartDate:endDate:maxEvents:lastN:reversed:", v4, 0, 0, 0, 0);
  -[BMStorePublisherManager publisherWithOptions:](self->_publisherManager, "publisherWithOptions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BMPublisherOptions *v20;
  void *v21;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v12)
  {
    v17 = 0;
    if (v13)
      goto LABEL_3;
LABEL_5:
    v19 = 0;
    goto LABEL_6;
  }
  v16 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v12, "doubleValue");
  objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_5;
LABEL_3:
  v18 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v13, "doubleValue");
  objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v20 = -[BMPublisherOptions initWithStartDate:endDate:maxEvents:lastN:reversed:]([BMPublisherOptions alloc], "initWithStartDate:endDate:maxEvents:lastN:reversed:", v17, v19, objc_msgSend(v14, "unsignedLongLongValue"), objc_msgSend(v15, "unsignedLongLongValue"), v7);
  -[BMStorePublisherManager publisherWithOptions:](self->_publisherManager, "publisherWithOptions:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (NSString)useCase
{
  return self->_useCase;
}

- (BMStoreStream)initWithPrivateStreamIdentifier:(id)a3 storeConfig:(id)a4
{
  return -[BMStoreStream initWithPrivateStreamIdentifier:storeConfig:eventDataClass:](self, "initWithPrivateStreamIdentifier:storeConfig:eventDataClass:", a3, a4, 0);
}

- (id)remoteDevices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((-[BMStoreConfig storeLocationOption](self->_storeConfig, "storeLocationOption") & 4) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[BMStoreConfig datastorePath](self->_storeConfig, "datastorePath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", self->_streamIdentifier);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D01D38], "remoteDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[BMFileManager contentsOfDirectoryAtPath:error:](self->_fileManager, "contentsOfDirectoryAtPath:error:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)source
{
  os_unfair_lock_s *p_lock;
  BMStoreSource *source;
  void *v5;
  void *v6;
  BMStoreSource *v7;
  BMStoreSource *v8;
  BMStoreSource *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  source = self->_source;
  if (!source)
  {
    -[NSString componentsSeparatedByString:](self->_streamIdentifier, "componentsSeparatedByString:", CFSTR(":"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[BMStoreSource initWithIdentifier:storeConfig:accessClient:eventDataClass:]([BMStoreSource alloc], "initWithIdentifier:storeConfig:accessClient:eventDataClass:", v6, self->_storeConfig, self->_accessClient, self->_eventDataClass);
    v8 = self->_source;
    self->_source = v7;

    source = self->_source;
  }
  v9 = source;
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)pruner
{
  os_unfair_lock_s *p_lock;
  BMStreamDatastorePruner *pruner;
  BMStreamDatastorePruner *v5;
  BMStreamDatastorePruner *v6;
  BMStreamDatastorePruner *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  pruner = self->_pruner;
  if (!pruner)
  {
    v5 = (BMStreamDatastorePruner *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024D8]), "initWithStream:config:eventDataClass:", self->_streamIdentifier, self->_storeConfig, self->_eventDataClass);
    v6 = self->_pruner;
    self->_pruner = v5;

    -[BMStreamDatastorePruner setDelegate:](self->_pruner, "setDelegate:", self->_pruningDelegate);
    pruner = self->_pruner;
  }
  v7 = pruner;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (NSString)identifier
{
  return self->_streamIdentifier;
}

- (BMStoreStream)initWithStreamIdentifier:(id)a3 storeConfig:(id)a4 streamType:(unint64_t)a5 eventDataClass:(Class)a6 useCase:(id)a7
{
  id v13;
  id v14;
  id v15;
  BMStoreStream *v16;
  BMStoreStream *v17;
  id *p_storeConfig;
  uint64_t v19;
  id v20;
  Class v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  BMFileManager *fileManager;
  void *v30;
  void *v31;
  BMStorePublisherManager *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  BMStorePublisherManager *publisherManager;
  BMStoreStreamPruningBridge *v37;
  BMStreamDatastorePruningDelegate *pruningDelegate;
  void *v40;
  objc_super v41;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v41.receiver = self;
  v41.super_class = (Class)BMStoreStream;
  v16 = -[BMStoreStream init](&v41, sel_init);
  v17 = v16;
  if (!v16)
    goto LABEL_17;
  v16->_lock._os_unfair_lock_opaque = 0;
  objc_storeStrong((id *)&v16->_streamIdentifier, a3);
  p_storeConfig = (id *)&v17->_storeConfig;
  objc_storeStrong((id *)&v17->_storeConfig, a4);
  objc_storeStrong((id *)&v17->_useCase, a7);
  if (objc_msgSend(v13, "hasSuffix:", CFSTR(":subscriptions")))
  {
    objc_msgSend(*p_storeConfig, "subscriptionsConfig");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v13, "hasSuffix:", CFSTR(":tombstones")))
      goto LABEL_7;
    objc_msgSend(*p_storeConfig, "tombstonesConfig");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v20 = *p_storeConfig;
  *p_storeConfig = (id)v19;

LABEL_7:
  v21 = a6;
  v22 = a5;
  objc_msgSend(v14, "datastorePath");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsSeparatedByString:", CFSTR(":"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByAppendingPathComponent:", v25);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "isManaged")
    && (objc_msgSend(MEMORY[0x1E0D01D18], "current"),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v27 = objc_msgSend(v26, "reliesOnDirectAccessForDomain:", objc_msgSend(*p_storeConfig, "domain")),
        v26,
        (v27 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0D01D00], "fileManagerWithMediatedAccessToDirectory:useCase:domain:user:", v40, v15, objc_msgSend(v14, "domain"), objc_msgSend(v14, "uid"));
    v28 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D01D00], "fileManagerWithDirectAccessToDirectory:cachingOptions:", v40, 3);
    v28 = objc_claimAutoreleasedReturnValue();
  }
  fileManager = v17->_fileManager;
  v17->_fileManager = (BMFileManager *)v28;

  if (v14)
  {
    objc_msgSend(v14, "pruningPolicy");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", 0, 0, 52428800, 2419200.0);
      objc_msgSend(v14, "setPruningPolicy:", v31);

    }
  }
  v17->_streamType = v22;
  v32 = [BMStorePublisherManager alloc];
  objc_msgSend(v13, "componentsSeparatedByString:", CFSTR(":"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "firstObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[BMStorePublisherManager initWithStreamIdentifier:streamConfig:accessClient:eventDataClass:useCase:](v32, "initWithStreamIdentifier:streamConfig:accessClient:eventDataClass:useCase:", v34, v17->_storeConfig, v17->_accessClient, v21, v15);
  publisherManager = v17->_publisherManager;
  v17->_publisherManager = (BMStorePublisherManager *)v35;

  v17->_eventDataClass = v21;
  if (-[BMStoreConfig isManaged](v17->_storeConfig, "isManaged"))
  {
    v37 = -[BMStoreStreamPruningBridge initWithStreamIdentifier:domain:]([BMStoreStreamPruningBridge alloc], "initWithStreamIdentifier:domain:", v17->_streamIdentifier, -[BMStoreConfig domain](v17->_storeConfig, "domain"));
    pruningDelegate = v17->_pruningDelegate;
    v17->_pruningDelegate = (BMStreamDatastorePruningDelegate *)v37;

  }
LABEL_17:

  return v17;
}

- (BMStoreStream)initWithPrivateStreamIdentifier:(id)a3 storeConfig:(id)a4 eventDataClass:(Class)a5
{
  return -[BMStoreStream initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:](self, "initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:", a3, a4, 3, a5, *MEMORY[0x1E0D01C98]);
}

- (BMStoreStream)initWithRestrictedStreamIdentifier:(id)a3 storeConfig:(id)a4
{
  return (BMStoreStream *)-[BMStoreStream _initWithRestrictedStreamIdentifier:storeConfig:eventDataClass:](self, "_initWithRestrictedStreamIdentifier:storeConfig:eventDataClass:", a3, a4, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_pruningDelegate, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_accessClient, 0);
  objc_storeStrong((id *)&self->_tombstonePruner, 0);
  objc_storeStrong((id *)&self->_pruner, 0);
  objc_storeStrong((id *)&self->_validator, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_storeConfig, 0);
  objc_storeStrong((id *)&self->_streamIdentifier, 0);
  objc_storeStrong((id *)&self->_publisherManager, 0);
}

- (BOOL)pruneEventsWithError:(id *)a3 predicateBlock:(id)a4
{
  return -[BMStoreStream pruneEventsOfRemote:withReason:policyID:error:predicateBlock:](self, "pruneEventsOfRemote:withReason:policyID:error:predicateBlock:", 0, 0, 0, a3, a4);
}

- (id)publishersForRemoteDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  void *v12;

  v6 = a5;
  v10 = a6;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMStoreStream publishersForDevices:startTime:includeLocal:pipeline:](self, "publishersForDevices:startTime:includeLocal:pipeline:", v11, v6, v10, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)publishersForDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  BMPublisherOptions *v13;
  void *v14;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  if (a4 == 0.0)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = -[BMPublisherOptions initWithStartDate:endDate:maxEvents:lastN:reversed:]([BMPublisherOptions alloc], "initWithStartDate:endDate:maxEvents:lastN:reversed:", v12, 0, 0, 0, 0);
  -[BMStorePublisherManager publishersForDevices:includeLocal:options:pipeline:](self->_publisherManager, "publishersForDevices:includeLocal:options:pipeline:", v10, v7, v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BMStoreStream)initWithStreamIdentifier:(id)a3 storeConfig:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  BMStoreStream *v9;
  uint64_t v10;
  BMStoreStream *v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E0D01D20], "streamForStreamIdentifier:", v6);
  if (v8)
  {
    v9 = -[BMStoreStream initWithPublicStream:](self, "initWithPublicStream:", v8);
  }
  else
  {
    v10 = objc_msgSend(v7, "streamType");
    v9 = -[BMStoreStream initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:](self, "initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:", v6, v7, v10, 0, *MEMORY[0x1E0D01C98]);
  }
  v11 = v9;

  return v11;
}

- (BMStoreStream)initWithStreamIdentifier:(id)a3 storeConfig:(id)a4 streamType:(unint64_t)a5
{
  return -[BMStoreStream initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:](self, "initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:", a3, a4, a5, 0, *MEMORY[0x1E0D01C98]);
}

- (BMStoreStream)initWithPublicStream:(int64_t)a3
{
  int v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  BMStoreStream *v11;
  id v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D01D20], "streamIdentifierForStream:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BMStoreStream initWithPublicStream:].cold.1(v3, v10);
    goto LABEL_10;
  }
  v6 = objc_msgSend(MEMORY[0x1E0D01D40], "legacyClassForLibraryStream:", v5);
  if (!v6)
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BMStoreStream initWithPublicStream:].cold.2((uint64_t)v5, v10);
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  v7 = v6;
  BiomeLibraryNodeBridge();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v8, "streamWithIdentifier:error:", v5, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;

  v11 = 0;
  if (!v10)
  {
    objc_msgSend((id)objc_opt_class(), "_libraryStreamWithIdentifier:eventDataClass:", v5, v7);
    v11 = (BMStoreStream *)objc_claimAutoreleasedReturnValue();
  }

LABEL_11:
  return v11;
}

- (BMStoreStream)initWithRestrictedStreamIdentifier:(id)a3
{
  return (BMStoreStream *)-[BMStoreStream _initWithRestrictedStreamIdentifier:storeConfig:eventDataClass:](self, "_initWithRestrictedStreamIdentifier:storeConfig:eventDataClass:", a3, 0, 0);
}

- (BMStoreStream)initWithRestrictedStreamIdentifier:(id)a3 protectionClass:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  BMStoreStream *v9;

  v6 = (void *)MEMORY[0x1E0D024C0];
  v7 = a3;
  v8 = (void *)objc_msgSend(v6, "newRestrictedStreamDefaultConfigurationWithProtectionClass:", a4);
  v9 = -[BMStoreStream _initWithRestrictedStreamIdentifier:storeConfig:eventDataClass:](self, "_initWithRestrictedStreamIdentifier:storeConfig:eventDataClass:", v7, v8, 0);

  return v9;
}

- (BMStoreStream)initWithRestrictedStreamIdentifier:(id)a3 eventDataClass:(Class)a4
{
  return (BMStoreStream *)-[BMStoreStream _initWithRestrictedStreamIdentifier:storeConfig:eventDataClass:](self, "_initWithRestrictedStreamIdentifier:storeConfig:eventDataClass:", a3, 0, a4);
}

- (id)_initWithRestrictedStreamIdentifier:(id)a3 storeConfig:(id)a4 eventDataClass:(Class)a5
{
  id v8;
  id v9;
  uint64_t v10;
  BMStoreStream *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(MEMORY[0x1E0D01D10], "isTestPathOverridden") & 1) != 0 || (objc_msgSend(v9, "isManaged") & 1) == 0)
  {
    if (!v9)
      v9 = (id)objc_msgSend(MEMORY[0x1E0D024C0], "newRestrictedStreamDefaultConfiguration");
    v11 = [BMStoreStream alloc];
    v10 = -[BMStoreStream initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:](v11, "initWithStreamIdentifier:storeConfig:streamType:eventDataClass:useCase:", v8, v9, 2, a5, *MEMORY[0x1E0D01C98]);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_libraryStreamWithIdentifier:eventDataClass:", v8, a5);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v10;

  return v12;
}

+ (id)_libraryStreamWithIdentifier:(id)a3 eventDataClass:(Class)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  Class v16;
  uint64_t v18;

  v5 = (void *)MEMORY[0x1E0D01D40];
  v6 = a3;
  objc_msgSend(v5, "libraryPathForStreamIdentifier:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v6;
  v10 = v9;

  v11 = objc_msgSend(MEMORY[0x1E0D01D40], "legacyClassForLibraryStream:", v10);
  BiomeLibraryNodeBridge();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v12, "streamWithIdentifier:error:", v10, &v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v18;
  v15 = 0;
  if (!v14)
  {
    if (v11)
      v16 = (Class)v11;
    else
      v16 = a4;
    objc_msgSend(v13, "storeStreamWithLegacyClass:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)tombstoneConfig
{
  void *v2;

  v2 = (void *)-[BMStoreConfig copy](self->_storeConfig, "copy");
  objc_msgSend(v2, "setStoreLocationOption:", objc_msgSend(v2, "storeLocationOption") | 2);
  return v2;
}

- (id)publisherWithStartTime:(id)a3 withEndTime:(id)a4 withMaxEvents:(id)a5 reversed:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BMPublisherOptions *v17;
  void *v18;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    v14 = 0;
    if (v11)
      goto LABEL_3;
LABEL_5:
    v16 = 0;
    goto LABEL_6;
  }
  v13 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v10, "doubleValue");
  objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_5;
LABEL_3:
  v15 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v11, "doubleValue");
  objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v17 = -[BMPublisherOptions initWithStartDate:endDate:maxEvents:lastN:reversed:]([BMPublisherOptions alloc], "initWithStartDate:endDate:maxEvents:lastN:reversed:", v14, v16, objc_msgSend(v12, "unsignedLongLongValue"), 0, v6);
  -[BMStorePublisherManager publisherWithOptions:](self->_publisherManager, "publisherWithOptions:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BMPublisherOptions *v17;
  void *v18;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    v14 = 0;
    if (v11)
      goto LABEL_3;
LABEL_5:
    v16 = 0;
    goto LABEL_6;
  }
  v13 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v10, "doubleValue");
  objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_5;
LABEL_3:
  v15 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v11, "doubleValue");
  objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v17 = -[BMPublisherOptions initWithStartDate:endDate:maxEvents:lastN:reversed:]([BMPublisherOptions alloc], "initWithStartDate:endDate:maxEvents:lastN:reversed:", v14, v16, objc_msgSend(v12, "unsignedLongLongValue"), 0, v6);
  -[BMStorePublisherManager publisherWithOptions:](self->_publisherManager, "publisherWithOptions:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)publisherWithOptions:(id)a3
{
  return -[BMStorePublisherManager publisherWithOptions:](self->_publisherManager, "publisherWithOptions:", a3);
}

- (id)publisher
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMStorePublisherManager publisherWithOptions:](self->_publisherManager, "publisherWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)remoteDevicesWithError:(id *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "remoteDevicesWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)remoteDevicesForAccount:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "remoteDevicesForAccount:error:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)publishersForDevices:(id)a3 startTime:(id)a4 endTime:(id)a5 maxEvents:(id)a6 lastN:(id)a7 reversed:(BOOL)a8 includeLocal:(BOOL)a9 pipeline:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BMPublisherOptions *v24;
  void *v25;
  BMStoreStream *v27;
  _BOOL4 v28;

  v28 = a8;
  v27 = self;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a10;
  if (!v15)
  {
    v21 = 0;
    if (v16)
      goto LABEL_3;
LABEL_5:
    v23 = 0;
    goto LABEL_6;
  }
  v20 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v15, "doubleValue");
  objc_msgSend(v20, "dateWithTimeIntervalSinceReferenceDate:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_5;
LABEL_3:
  v22 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v16, "doubleValue", v27);
  objc_msgSend(v22, "dateWithTimeIntervalSinceReferenceDate:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v24 = -[BMPublisherOptions initWithStartDate:endDate:maxEvents:lastN:reversed:]([BMPublisherOptions alloc], "initWithStartDate:endDate:maxEvents:lastN:reversed:", v21, v23, objc_msgSend(v17, "unsignedLongLongValue"), objc_msgSend(v18, "unsignedLongLongValue"), v28);
  -[BMStorePublisherManager publishersForDevices:includeLocal:options:pipeline:](v27->_publisherManager, "publishersForDevices:includeLocal:options:pipeline:", v14, a9, v24, v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

id __76__BMStoreStream_publishersForRemoteDevices_startTime_includeLocal_pipeline___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D027D8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithDeviceIdentifier:idsDeviceIdentifier:name:model:platform:", v3, 0, 0, 0, 0);

  return v4;
}

- (id)publishersForRemoteDevices:(id)a3 startTime:(id)a4 endTime:(id)a5 maxEvents:(id)a6 lastN:(id)a7 reversed:(BOOL)a8 includeLocal:(BOOL)a9 pipeline:(id)a10
{
  _BOOL8 v10;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v25;

  v10 = a8;
  v17 = a10;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v25) = a9;
  -[BMStoreStream publishersForDevices:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:](self, "publishersForDevices:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:", v22, v21, v20, v19, v18, v10, v25, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

id __109__BMStoreStream_publishersForRemoteDevices_startTime_endTime_maxEvents_lastN_reversed_includeLocal_pipeline___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D027D8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithDeviceIdentifier:idsDeviceIdentifier:name:model:platform:", v3, 0, 0, 0, 0);

  return v4;
}

- (id)publisherForDevice:(id)a3 withUseCase:(id)a4
{
  NSString *useCase;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  useCase = self->_useCase;
  v8 = a3;
  if ((-[NSString isEqual:](useCase, "isEqual:", a4) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMStoreStream.m"), 435, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_useCase isEqual:useCase]"));

  }
  v9 = (void *)objc_opt_new();
  -[BMStorePublisherManager publisherForDevice:options:](self->_publisherManager, "publisherForDevice:options:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)publisherForDevice:(id)a3 withUseCase:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v13;

  v9 = a3;
  v10 = a5;
  if ((-[NSString isEqual:](self->_useCase, "isEqual:", a4) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMStoreStream.m"), 445, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_useCase isEqual:useCase]"));

  }
  -[BMStorePublisherManager publisherForDevice:options:](self->_publisherManager, "publisherForDevice:options:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)publishersForDevices:(id)a3 withUseCase:(id)a4 startTime:(id)a5 endTime:(id)a6 maxEvents:(id)a7 lastN:(id)a8 reversed:(BOOL)a9 includeLocal:(BOOL)a10 pipeline:(id)a11
{
  id v17;
  id v18;
  NSString *useCase;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BMPublisherOptions *v28;
  uint64_t v29;
  uint64_t v30;
  BMPublisherOptions *v31;
  void *v32;
  void *v34;
  BMStoreStream *v36;

  v17 = a5;
  v18 = a6;
  v36 = self;
  useCase = self->_useCase;
  v20 = a11;
  v21 = a8;
  v22 = a7;
  v23 = a3;
  if ((-[NSString isEqual:](useCase, "isEqual:", a4) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, v36, CFSTR("BMStoreStream.m"), 460, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_useCase isEqual:useCase]"));

  }
  if (!v17)
  {
    v25 = 0;
    if (v18)
      goto LABEL_5;
LABEL_7:
    v27 = 0;
    goto LABEL_8;
  }
  v24 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v17, "doubleValue");
  objc_msgSend(v24, "dateWithTimeIntervalSinceReferenceDate:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_7;
LABEL_5:
  v26 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v18, "doubleValue");
  objc_msgSend(v26, "dateWithTimeIntervalSinceReferenceDate:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v28 = [BMPublisherOptions alloc];
  v29 = objc_msgSend(v22, "unsignedLongLongValue");

  v30 = objc_msgSend(v21, "unsignedLongLongValue");
  v31 = -[BMPublisherOptions initWithStartDate:endDate:maxEvents:lastN:reversed:](v28, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v25, v27, v29, v30, a9);
  -[BMStorePublisherManager publishersForDevices:includeLocal:options:pipeline:](v36->_publisherManager, "publishersForDevices:includeLocal:options:pipeline:", v23, a10, v31, v20);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)publishersForDevices:(id)a3 withUseCase:(id)a4 startTime:(double)a5 includeLocal:(BOOL)a6 pipeline:(id)a7
{
  _BOOL8 v7;
  NSString *useCase;
  id v14;
  id v15;
  void *v16;
  BMPublisherOptions *v17;
  void *v18;
  void *v20;

  v7 = a6;
  useCase = self->_useCase;
  v14 = a7;
  v15 = a3;
  if ((-[NSString isEqual:](useCase, "isEqual:", a4) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMStoreStream.m"), 478, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_useCase isEqual:useCase]"));

  }
  if (a5 == 0.0)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = -[BMPublisherOptions initWithStartDate:endDate:maxEvents:lastN:reversed:]([BMPublisherOptions alloc], "initWithStartDate:endDate:maxEvents:lastN:reversed:", v16, 0, 0, 0, 0);
  -[BMStorePublisherManager publishersForDevices:includeLocal:options:pipeline:](self->_publisherManager, "publishersForDevices:includeLocal:options:pipeline:", v15, v7, v17, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_computeSource
{
  void *v2;
  void *v3;

  -[BMStoreStream source](self, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "computeSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)validator
{
  os_unfair_lock_s *p_lock;
  BMStoreValidator *validator;
  BMStoreValidator *v5;
  BMStoreValidator *v6;
  BMStoreValidator *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  validator = self->_validator;
  if (!validator)
  {
    v5 = -[BMStoreValidator initWithIdentifier:storeConfig:]([BMStoreValidator alloc], "initWithIdentifier:storeConfig:", self->_streamIdentifier, self->_storeConfig);
    v6 = self->_validator;
    self->_validator = v5;

    validator = self->_validator;
  }
  v7 = validator;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)_prunerForRemote:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMStoreStream.m"), 538, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("remote"));

  }
  v6 = (void *)-[BMStoreConfig copyWithRemoteName:](self->_storeConfig, "copyWithRemoteName:", v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024D8]), "initWithStream:config:eventDataClass:", self->_streamIdentifier, v6, self->_eventDataClass);
  objc_msgSend(v7, "setDelegate:", self->_pruningDelegate);

  return v7;
}

- (id)tombstonePruner
{
  os_unfair_lock_s *p_lock;
  BMStreamDatastorePruner *tombstonePruner;
  id v5;
  NSString *streamIdentifier;
  void *v7;
  BMStreamDatastorePruner *v8;
  BMStreamDatastorePruner *v9;
  BMStreamDatastorePruner *v10;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  tombstonePruner = self->_tombstonePruner;
  if (!tombstonePruner)
  {
    v5 = objc_alloc(MEMORY[0x1E0D024D8]);
    streamIdentifier = self->_streamIdentifier;
    -[BMStoreStream tombstoneConfig](self, "tombstoneConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (BMStreamDatastorePruner *)objc_msgSend(v5, "initWithStream:config:eventDataClass:", streamIdentifier, v7, objc_opt_class());
    v9 = self->_tombstonePruner;
    self->_tombstonePruner = v8;

    tombstonePruner = self->_tombstonePruner;
  }
  v10 = tombstonePruner;
  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void)pruneTombstonesByAge:(double)a3
{
  CFAbsoluteTime v4;
  id v5;

  v4 = CFAbsoluteTimeGetCurrent() - a3;
  -[BMStoreStream tombstonePruner](self, "tombstonePruner");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeEventsFrom:to:reason:usingBlock:", 1, &__block_literal_global_35, 0.0, v4);

}

- (void)pruneWithPredicateBlock:(id)a3
{
  -[BMStoreStream pruneEventsOfRemote:withReason:policyID:error:predicateBlock:](self, "pruneEventsOfRemote:withReason:policyID:error:predicateBlock:", 0, 0, 0, 0, a3);
}

- (void)pruneWithReason:(unint64_t)a3 usingPredicateBlock:(id)a4
{
  -[BMStoreStream pruneEventsOfRemote:withReason:policyID:error:predicateBlock:](self, "pruneEventsOfRemote:withReason:policyID:error:predicateBlock:", 0, a3, 0, 0, a4);
  -[BMStoreStream pruneTombstonesByAge:](self, "pruneTombstonesByAge:", 691200.0);
}

- (void)pruneEventsOfRemote:(id)a3 withReason:(unint64_t)a4 policyID:(id)a5 usingPredicateBlock:(id)a6
{
  -[BMStoreStream pruneEventsOfRemote:withReason:policyID:error:predicateBlock:](self, "pruneEventsOfRemote:withReason:policyID:error:predicateBlock:", a3, a4, a5, 0, a6);
}

- (BOOL)pruneEventsOfRemote:(id)a3 withReason:(unint64_t)a4 policyID:(id)a5 error:(id *)a6 predicateBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  BMComputeSourceClient *v17;
  NSString *streamIdentifier;
  uint64_t v19;
  BMComputeSourceClient *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a7;
  if (v12)
    -[BMStoreStream _prunerForRemote:](self, "_prunerForRemote:", v12);
  else
    -[BMStoreStream pruner](self, "pruner");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isDataAccessible");
  if (v16)
  {
    objc_msgSend(v15, "eventsFrom:to:reason:policyID:shouldDeleteUsingBlock:", a4, v13, v14, 0.0, CFAbsoluteTimeGetCurrent());
    if ((-[BMStoreConfig isManaged](self->_storeConfig, "isManaged") & 1) != 0)
    {
      v17 = [BMComputeSourceClient alloc];
      streamIdentifier = self->_streamIdentifier;
      v19 = -[BMStoreConfig domain](self->_storeConfig, "domain");
      v20 = -[BMComputeSourceClient initWithStreamIdentifier:domain:useCase:](v17, "initWithStreamIdentifier:domain:useCase:", streamIdentifier, v19, *MEMORY[0x1E0D01CA8]);
      -[BMStoreConfig account](self->_storeConfig, "account");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[BMComputeSourceClient eventsPrunedForAccount:remoteName:reason:](v20, "eventsPrunedForAccount:remoteName:reason:", v21, v12, a4);
      }
      else
      {
        -[BMStoreConfig remoteName](self->_storeConfig, "remoteName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMComputeSourceClient eventsPrunedForAccount:remoteName:reason:](v20, "eventsPrunedForAccount:remoteName:reason:", v21, v24, a4);

      }
    }
  }
  else if (a6)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    v27[0] = CFSTR("Pruner does not have access to data due to lock state");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.biome.BiomeStreams"), 2, v23);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (void)_pruneWithStoreConfig:(id)a3 expirationAge:(double)a4 block:(id)a5
{
  id v8;
  double Current;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a5;
  Current = CFAbsoluteTimeGetCurrent();
  if (objc_msgSend(v14, "isEqual:", self->_storeConfig))
  {
    -[BMStoreStream pruner](self, "pruner");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BMStoreStream tombstoneConfig](self, "tombstoneConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v14, "isEqual:", v11);

    if (!v12)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024D8]), "initWithStream:config:eventDataClass:", self->_streamIdentifier, v14, self->_eventDataClass);
      objc_msgSend(v13, "setDelegate:", self->_pruningDelegate);
      goto LABEL_7;
    }
    -[BMStoreStream tombstonePruner](self, "tombstonePruner");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v10;
LABEL_7:
  objc_msgSend(v13, "removeEventsFrom:to:reason:usingBlock:", 1, v8, 0.0, Current - a4);

  -[BMStoreStream pruneTombstonesByAge:](self, "pruneTombstonesByAge:", 691200.0);
}

- (void)pruneExpiredEventsWithBlock:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  char isKindOfClass;
  double v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BMStoreConfig pruningPolicy](self->_storeConfig, "pruningPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "maxAge");
  if (v6 == 0.0)
  {

    v9 = 2419200.0;
  }
  else
  {
    -[BMStoreConfig pruningPolicy](self->_storeConfig, "pruningPolicy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "maxAge");
    v9 = v8;

    if (v9 <= 0.0)
    {
      __biome_log_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[BMStoreStream pruneExpiredEventsWithBlock:].cold.1((uint64_t)self, v10, v11, v9);
      goto LABEL_23;
    }
  }
  if ((-[NSString isEqual:](self->_streamIdentifier, "isEqual:", CFSTR("GenerativeExperiences.TransparencyLog")) & 1) != 0
    || -[NSString isEqual:](self->_streamIdentifier, "isEqual:", CFSTR("PrivateCloudCompute.RequestLog")))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.AppleIntelligenceReport"));
    objc_msgSend(v12, "valueForKey:", CFSTR("reportDuration"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = &unk_1E26D3660;
    if (v13)
      v15 = (void *)v13;
    v16 = v15;

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v18 = 0.0;
    if ((isKindOfClass & 1) != 0)
      objc_msgSend(v16, "doubleValue", 0.0);
    if (v18 >= v9)
      v18 = v9;
    v9 = fmax(v18, 0.0);

  }
  v19 = (void *)MEMORY[0x193FECFB4]();
  -[BMStoreStream _pruneWithStoreConfig:expirationAge:block:](self, "_pruneWithStoreConfig:expirationAge:block:", self->_storeConfig, v4, v9);
  objc_autoreleasePoolPop(v19);
  v20 = (void *)MEMORY[0x193FECFB4]();
  -[BMStoreStream remoteDevices](self, "remoteDevices");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v32;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v25);
        v27 = (void *)MEMORY[0x193FECFB4](v22);
        v28 = (void *)-[BMStoreConfig copyWithRemoteName:](self->_storeConfig, "copyWithRemoteName:", v26, (_QWORD)v31);
        -[BMStoreStream _pruneWithStoreConfig:expirationAge:block:](self, "_pruneWithStoreConfig:expirationAge:block:", v28, v4, v9);

        objc_autoreleasePoolPop(v27);
        ++v25;
      }
      while (v23 != v25);
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      v23 = v22;
    }
    while (v22);
  }

  objc_autoreleasePoolPop(v20);
  -[BMStoreStream _computeSource](self, "_computeSource");
  v10 = objc_claimAutoreleasedReturnValue();
  -[BMStoreConfig account](self->_storeConfig, "account");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMStoreConfig remoteName](self->_storeConfig, "remoteName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject eventsPrunedForAccount:remoteName:reason:](v10, "eventsPrunedForAccount:remoteName:reason:", v29, v30, 1);

LABEL_23:
}

- (void)pruneStreamByPruningPolicyMaxStreamSize
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  -[BMStoreConfig pruningPolicy](self->_storeConfig, "pruningPolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "maxStreamSize");

  if (v4)
    v5 = v4;
  else
    v5 = 52428800;
  -[BMStoreStream pruneStreamBySize:](self, "pruneStreamBySize:", v5);
}

- (void)pruneStreamBySize:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSString *streamIdentifier;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *context;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a3)
    v4 = a3;
  else
    v4 = 52428800;
  v5 = (void *)MEMORY[0x193FECFB4](self, a2);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024D0]), "initWithStream:permission:config:includeTombstones:", self->_streamIdentifier, 2, self->_storeConfig, -[BMStoreConfig isManaged](self->_storeConfig, "isManaged"));
  objc_msgSend(v6, "setDelegate:", self->_pruningDelegate);
  objc_msgSend(v6, "pruneStreamToMaxStreamSizeInBytes:", v4);
  v7 = objc_alloc(MEMORY[0x1E0D024D0]);
  streamIdentifier = self->_streamIdentifier;
  -[BMStoreStream tombstoneConfig](self, "tombstoneConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithStream:permission:config:includeTombstones:", streamIdentifier, 2, v9, 0);

  objc_msgSend(v10, "pruneStreamToMaxStreamSizeInBytes:", v4);
  objc_autoreleasePoolPop(v5);
  context = (void *)MEMORY[0x193FECFB4]();
  -[BMStoreStream remoteDevices](self, "remoteDevices");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x193FECFB4]();
        v17 = (void *)-[BMStoreConfig copyWithRemoteName:](self->_storeConfig, "copyWithRemoteName:", v15);
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024D0]), "initWithStream:permission:config:includeTombstones:", self->_streamIdentifier, 2, v17, -[BMStoreConfig isManaged](self->_storeConfig, "isManaged"));
        objc_msgSend(v18, "pruneStreamToMaxStreamSizeInBytes:", v4);
        v19 = (void *)objc_msgSend(v17, "copy");
        objc_msgSend(v19, "setStoreLocationOption:", objc_msgSend(v19, "storeLocationOption") | 2);
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024D0]), "initWithStream:permission:config:includeTombstones:", self->_streamIdentifier, 2, v19, 0);

        objc_msgSend(v20, "pruneStreamToMaxStreamSizeInBytes:", v4);
        objc_autoreleasePoolPop(v16);
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }

  objc_autoreleasePoolPop(context);
  -[BMStoreStream _computeSource](self, "_computeSource");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMStoreConfig account](self->_storeConfig, "account");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMStoreConfig remoteName](self->_storeConfig, "remoteName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "eventsPrunedForAccount:remoteName:reason:", v22, v23, 1);

}

- (void)pruneLocalAndRemoteEventsWithPredicateBlock:(id)a3
{
  -[BMStoreStream pruneLocalAndRemoteEventsWithReason:usingPredicateBlock:](self, "pruneLocalAndRemoteEventsWithReason:usingPredicateBlock:", 0, a3);
}

- (void)pruneLocalAndRemoteEventsWithReason:(unint64_t)a3 usingPredicateBlock:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BMStoreStream *v15;
  void *context;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x193FECFB4]();
  -[BMStoreStream pruneWithReason:usingPredicateBlock:](self, "pruneWithReason:usingPredicateBlock:", a3, v6);
  objc_autoreleasePoolPop(v7);
  context = (void *)MEMORY[0x193FECFB4]();
  -[BMStoreStream remoteDevices](self, "remoteDevices");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x193FECFB4]();
        v14 = (void *)-[BMStoreConfig copyWithRemoteName:](self->_storeConfig, "copyWithRemoteName:", v12);
        v15 = -[BMStoreStream initWithStreamIdentifier:storeConfig:streamType:]([BMStoreStream alloc], "initWithStreamIdentifier:storeConfig:streamType:", self->_streamIdentifier, v14, -[BMStoreConfig streamType](self->_storeConfig, "streamType"));
        -[BMStoreStream pruneWithReason:usingPredicateBlock:](v15, "pruneWithReason:usingPredicateBlock:", a3, v6);

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  objc_autoreleasePoolPop(context);
}

- (BOOL)deleteStoreEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "bookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteStreamName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "metadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "remoteStreamName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMStoreStream _prunerForRemote:](self, "_prunerForRemote:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[BMStoreStream pruner](self, "pruner");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = objc_msgSend(v10, "deleteEventAtBookmark:outTombstoneBookmark:", v5, 0);
    if (v12)
    {
      -[BMStoreStream _computeSource](self, "_computeSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMStoreConfig account](self->_storeConfig, "account");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMStoreConfig remoteName](self->_storeConfig, "remoteName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "eventsPrunedForAccount:remoteName:reason:", v14, v15, 2);

    }
  }
  else
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BMStoreStream deleteStoreEvent:].cold.1((uint64_t)self, v4, v11);

    LOBYTE(v12) = 0;
  }

  return v12;
}

- (id)_publishersForDevices:(id)a3 includeLocal:(BOOL)a4 options:(id)a5
{
  return -[BMStorePublisherManager publishersForDevices:includeLocal:options:pipeline:](self->_publisherManager, "publishersForDevices:includeLocal:options:pipeline:", a3, a4, a5, 0);
}

- (id)_publisherForDevice:(id)a3 options:(id)a4
{
  return -[BMStorePublisherManager publisherForDevice:options:](self->_publisherManager, "publisherForDevice:options:", a3, a4);
}

- (id)_publisherWithOptions:(id)a3
{
  return -[BMStorePublisherManager publisherWithOptions:](self->_publisherManager, "publisherWithOptions:", a3);
}

- (BMStoreConfig)storeConfig
{
  return self->_storeConfig;
}

- (void)initWithPublicStream:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "Unrecognized stream: %d", (uint8_t *)v2, 8u);
}

- (void)initWithPublicStream:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "Failed to determine legacy class for public stream: %@", (uint8_t *)&v2, 0xCu);
}

- (void)pruneExpiredEventsWithBlock:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, double a4)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 24);
  v5 = 138543618;
  v6 = v4;
  v7 = 2048;
  v8 = a4;
  OUTLINED_FUNCTION_0_4(&dword_18D810000, a2, a3, "Skipping prune for stream %{public}@ with max age: %f ", (uint8_t *)&v5);
}

- (void)deleteStoreEvent:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 24);
  objc_msgSend(a2, "timestamp");
  v7 = 138543618;
  v8 = v4;
  v9 = 2048;
  v10 = v5;
  OUTLINED_FUNCTION_0_4(&dword_18D810000, a3, v6, "Skipping deleteStoreEvent for stream %{public}@ with event timestamp: %f since bookmark could not be initialized", (uint8_t *)&v7);
}

@end
