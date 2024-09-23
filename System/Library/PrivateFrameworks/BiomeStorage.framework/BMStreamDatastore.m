@implementation BMStreamDatastore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentManager, 0);
  objc_storeStrong((id *)&self->_segmentDirectory, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_streamId, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_tombstoneStore, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_pruningPolicy, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_streamPath, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

- (BMStreamDatastore)initWithStream:(id)a3 permission:(unint64_t)a4 config:(id)a5 includeTombstones:(BOOL)a6 eventDataClass:(Class)a7 useCase:(id)a8
{
  return -[BMStreamDatastore initWithStream:streamPath:permission:config:includeTombstones:eventDataClass:useCase:](self, "initWithStream:streamPath:permission:config:includeTombstones:eventDataClass:useCase:", a3, 0, a4, a5, a6, a7, a8);
}

- (BMStreamDatastore)initWithStream:(id)a3 streamPath:(id)a4 permission:(unint64_t)a5 config:(id)a6 includeTombstones:(BOOL)a7 eventDataClass:(Class)a8 useCase:(id)a9
{
  int v10;
  id v15;
  id v16;
  id v17;
  id v18;
  BMStreamDatastore *v19;
  BMStreamDatastore *v20;
  void *v22;
  void *v23;
  void *v24;

  v10 = a7;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a9;
  if (v10)
  {
    if ((-[objc_class isEqual:](a8, "isEqual:", objc_opt_class()) & 1) != 0
      || (objc_msgSend(v15, "hasPrefix:", CFSTR("_DKEvent.")) & 1) != 0)
    {
      LOBYTE(v10) = 0;
    }
    else if (a5 == 2
           && (objc_msgSend(v17, "streamType") == 1
            || objc_msgSend(v17, "streamType") == 2
            || objc_msgSend(v17, "streamType") == 4))
    {
      __softlink__BiomeLibraryAndInternalLibraryNode();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "streamWithIdentifier:error:", v15, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(v23, "valueForKeyPath:", CFSTR("configuration.enableTombstoneSubstream"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v10) = objc_msgSend(v24, "BOOLValue");

      }
      else
      {
        LOBYTE(v10) = 1;
      }

    }
    else
    {
      LOBYTE(v10) = 1;
    }
  }
  v19 = -[BMStreamDatastore initWithStream:streamPath:permission:config:eventDataClass:useCase:](self, "initWithStream:streamPath:permission:config:eventDataClass:useCase:", v15, v16, a5, v17, a8, v18);
  v20 = v19;
  if (v19)
    v19->_includeTombstones = v10;

  return v20;
}

- (BMStreamDatastore)initWithStream:(id)a3 permission:(unint64_t)a4 config:(id)a5
{
  return -[BMStreamDatastore initWithStream:streamPath:permission:config:eventDataClass:useCase:](self, "initWithStream:streamPath:permission:config:eventDataClass:useCase:", a3, 0, a4, a5, 0, *MEMORY[0x1E0D01C98]);
}

- (BMStreamDatastore)initWithStream:(id)a3 streamPath:(id)a4 permission:(unint64_t)a5 config:(id)a6
{
  return -[BMStreamDatastore initWithStream:streamPath:permission:config:eventDataClass:useCase:](self, "initWithStream:streamPath:permission:config:eventDataClass:useCase:", a3, a4, a5, a6, 0, *MEMORY[0x1E0D01C98]);
}

- (BMStreamDatastore)initWithStream:(id)a3 streamPath:(id)a4 permission:(unint64_t)a5 config:(id)a6 eventDataClass:(Class)a7 useCase:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  BMStreamDatastore *v18;
  BMStreamDatastore *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  BMFileManager *fileManager;
  uint64_t v30;
  NSString *segmentDirectory;
  void *v32;
  void *v33;
  BMSegmentManager *v34;
  BMSegmentManager *segmentManager;
  uint64_t v36;
  NSString *streamId;
  unint64_t v38;
  NSUInteger v39;
  uint64_t v40;
  uint64_t v41;
  BMPruningPolicy *pruningPolicy;
  BMStreamDatastore *v43;
  objc_super v45;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  v45.receiver = self;
  v45.super_class = (Class)BMStreamDatastore;
  v18 = -[BMStreamDatastore init](&v45, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_lock._os_unfair_lock_opaque = 0;
    if (objc_msgSend(v14, "hasSuffix:", CFSTR(":tombstones")))
    {
      objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(":"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "tombstonesConfig");
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v14, "hasSuffix:", CFSTR(":subscriptions")))
      {
        if (!v16)
          goto LABEL_10;
        goto LABEL_6;
      }
      objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(":"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "firstObject");
      v21 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "subscriptionsConfig");
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v24 = (void *)v22;
    v14 = (id)v21;

    v16 = v24;
    if (!v24)
    {
LABEL_10:
      v16 = +[BMStoreConfig newStreamDefaultConfigurationForPublicStream:](BMStoreConfig, "newStreamDefaultConfigurationForPublicStream:", 0);
      if (!v15)
        goto LABEL_11;
      goto LABEL_12;
    }
LABEL_6:
    if (!v15)
    {
LABEL_11:
      objc_msgSend(v16, "datastorePath");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringByAppendingPathComponent:", v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        v43 = 0;
        goto LABEL_24;
      }
    }
LABEL_12:
    if (objc_msgSend(v16, "isManaged")
      && (objc_msgSend(MEMORY[0x1E0D01D18], "current"),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          v27 = objc_msgSend(v26, "reliesOnDirectAccessForDomain:", objc_msgSend(v16, "domain")),
          v26,
          (v27 & 1) == 0))
    {
      objc_msgSend(MEMORY[0x1E0D01D00], "fileManagerWithMediatedAccessToDirectory:useCase:domain:user:", v15, v17, objc_msgSend(v16, "domain"), objc_msgSend(v16, "uid"));
      v28 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D01D00], "fileManagerWithDirectAccessToDirectory:cachingOptions:", v15, 3);
      v28 = objc_claimAutoreleasedReturnValue();
    }
    fileManager = v19->_fileManager;
    v19->_fileManager = (BMFileManager *)v28;

    -[BMFileManager setDelegate:](v19->_fileManager, "setDelegate:", v19);
    objc_msgSend(v16, "resolvedPathWithStreamIdentifier:", v14);
    v30 = objc_claimAutoreleasedReturnValue();
    segmentDirectory = v19->_segmentDirectory;
    v19->_segmentDirectory = (NSString *)v30;

    objc_storeStrong((id *)&v19->_config, v16);
    v19->_biomeLibrary = 0;
    if (-[BMStoreConfig isManaged](v19->_config, "isManaged"))
    {
      __softlink__BiomeLibraryAndInternalLibraryNode();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "streamWithIdentifier:error:", v14, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
        v19->_biomeLibrary = 1;
    }
    v34 = -[BMSegmentManager initWithDirectory:fileManager:permission:config:]([BMSegmentManager alloc], "initWithDirectory:fileManager:permission:config:", v19->_segmentDirectory, v19->_fileManager, a5, v16);
    segmentManager = v19->_segmentManager;
    v19->_segmentManager = v34;

    -[BMSegmentManager setDelegate:](v19->_segmentManager, "setDelegate:", v19);
    v36 = objc_msgSend(v14, "copy");
    streamId = v19->_streamId;
    v19->_streamId = (NSString *)v36;

    objc_storeStrong((id *)&v19->_streamPath, v15);
    v19->_permission = a5;
    v38 = objc_msgSend(v16, "segmentSize");
    v39 = NSPageSize();
    if (v39 > v38)
      v40 = 1;
    else
      v40 = v38 / v39;
    v19->_maxFileSize = NSPageSize() * v40;
    objc_msgSend(v16, "pruningPolicy");
    v41 = objc_claimAutoreleasedReturnValue();
    pruningPolicy = v19->_pruningPolicy;
    v19->_pruningPolicy = (BMPruningPolicy *)v41;

    v19->_eventDataClass = a7;
    objc_storeStrong((id *)&v19->_useCase, a8);
  }
  v43 = v19;

LABEL_24:
  return v43;
}

- (BOOL)isTombstoneStore
{
  return ((unint64_t)-[BMStoreConfig storeLocationOption](self->_config, "storeLocationOption") >> 1) & 1;
}

- (BOOL)isSubscriptionStore
{
  return ((unint64_t)-[BMStoreConfig storeLocationOption](self->_config, "storeLocationOption") >> 2) & 1;
}

- (id)segmentNames
{
  return -[BMSegmentManager segmentNames](self->_segmentManager, "segmentNames");
}

- (BMStreamMetadata)metadata
{
  os_unfair_lock_s *p_lock;
  BMStreamMetadata *v4;
  BMStreamMetadata *metadata;
  BMStreamMetadata *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BMStreamDatastore loadMetadata](self, "loadMetadata");
  v4 = (BMStreamMetadata *)objc_claimAutoreleasedReturnValue();
  metadata = self->_metadata;
  self->_metadata = v4;

  v6 = self->_metadata;
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (Class)eventBodyClass
{
  objc_class *v3;
  Class eventDataClass;
  NSObject *v5;
  uint64_t v6;
  void *v7;

  if (-[BMStreamDatastore isTombstoneStore](self, "isTombstoneStore")
    || -[BMStreamDatastore isSubscriptionStore](self, "isSubscriptionStore"))
  {
    objc_opt_class();
    v3 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    eventDataClass = self->_eventDataClass;
    if (!eventDataClass)
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[BMStreamDatastore eventBodyClass].cold.1((uint64_t)self, v5, v6);

      -[BMStreamDatastore metadata](self, "metadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      self->_eventDataClass = (Class)objc_msgSend(v7, "eventDataClass");

      eventDataClass = self->_eventDataClass;
    }
    v3 = eventDataClass;
  }
  return v3;
}

- (BOOL)writeEventWithEventBody:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = -[BMStreamDatastore writeEventWithEventBody:timestamp:outEventSize:outBookmark:](self, "writeEventWithEventBody:timestamp:outEventSize:outBookmark:", v4, 0, 0, CFAbsoluteTimeGetCurrent());

  return (char)self;
}

- (BOOL)writeEventWithEventBody:(id)a3 timestamp:(double)a4
{
  return -[BMStreamDatastore writeEventWithEventBody:timestamp:outBookmark:](self, "writeEventWithEventBody:timestamp:outBookmark:", a3, 0, a4);
}

- (BOOL)writeEventWithEventBody:(id)a3 timestamp:(double)a4 outEventSize:(unint64_t *)a5
{
  return -[BMStreamDatastore writeEventWithEventBody:timestamp:outEventSize:outBookmark:](self, "writeEventWithEventBody:timestamp:outEventSize:outBookmark:", a3, a5, 0, a4);
}

- (BOOL)writeEventWithEventBody:(id)a3 timestamp:(double)a4 outBookmark:(id *)a5
{
  return -[BMStreamDatastore writeEventWithEventBody:timestamp:outEventSize:outBookmark:](self, "writeEventWithEventBody:timestamp:outEventSize:outBookmark:", a3, 0, a5, a4);
}

- (BOOL)writeEventWithEventBody:(id)a3 timestamp:(double)a4 outEventSize:(unint64_t *)a5 outBookmark:(id *)a6
{
  id v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  _BOOL4 v14;
  objc_class *v15;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  int v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!v10)
  {
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      v13 = "Attempt to write nil event";
      goto LABEL_12;
    }
LABEL_13:
    v16 = 0;
    goto LABEL_26;
  }
  if (-[BMStreamDatastore isTombstoneStore](self, "isTombstoneStore"))
  {
    v11 = objc_opt_class();
    if (v11 != objc_opt_class())
    {
      __biome_log_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        v13 = "Attempt to write non-tombstone to tombstone store";
LABEL_12:
        _os_log_impl(&dword_1A95BD000, v12, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v21, 2u);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else
  {
    v14 = -[BMStreamDatastore isSubscriptionStore](self, "isSubscriptionStore");
    v15 = (objc_class *)objc_opt_class();
    if (v14)
    {
      if (v15 != (objc_class *)objc_opt_class())
      {
        __biome_log_for_category();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v21) = 0;
          v13 = "Attempt to write non-subscription to subscription store";
          goto LABEL_12;
        }
        goto LABEL_13;
      }
    }
    else
    {
      NSStringFromClass(v15);
      v12 = objc_claimAutoreleasedReturnValue();
      if (-[BMStreamDatastore eventBodyClass](self, "eventBodyClass"))
      {
        if ((-[objc_class isEqual:](-[BMStreamDatastore eventBodyClass](self, "eventBodyClass"), "isEqual:", objc_opt_class()) & 1) == 0)
        {
          __biome_log_for_category();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            -[BMStreamDatastore writeEventWithEventBody:timestamp:outEventSize:outBookmark:].cold.1((uint64_t)v12, self, v17);

          goto LABEL_13;
        }
      }
      else
      {
        __biome_log_for_category();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v21 = 138543362;
          v22 = v12;
          _os_log_impl(&dword_1A95BD000, v18, OS_LOG_TYPE_INFO, "Data type will be set to %{public}@", (uint8_t *)&v21, 0xCu);
        }

      }
      -[BMStreamDatastore updateMetadata:](self, "updateMetadata:", objc_opt_class());

    }
  }
  objc_msgSend(v10, "serialize");
  v19 = objc_claimAutoreleasedReturnValue();
  v12 = v19;
  if (a5)
    *a5 = -[NSObject length](v19, "length");
  v16 = -[BMStreamDatastore writeEventData:dataVersion:timestamp:outBookmark:](self, "writeEventData:dataVersion:timestamp:outBookmark:", v12, objc_msgSend(v10, "dataVersion"), a6, a4);
LABEL_26:

  return v16;
}

- (id)fetchEventsFrom:(double)a3 to:(double)a4
{
  return -[BMStreamDatastore fetchEventsFrom:to:options:](self, "fetchEventsFrom:to:options:", 0, a3, a4);
}

- (id)fetchEventsFrom:(double)a3 to:(double)a4 options:(unint64_t)a5
{
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = (id)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__BMStreamDatastore_fetchEventsFrom_to_options___block_invoke;
  v11[3] = &unk_1E5565F10;
  v11[4] = &v12;
  -[BMStreamDatastore enumerateEventsFrom:to:options:usingBlock:](self, "enumerateEventsFrom:to:options:usingBlock:", a5, v11, a3, a4);
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __48__BMStreamDatastore_fetchEventsFrom_to_options___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
  return 1;
}

- (void)removeEventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 pruneFutureEvents:(BOOL)a6 usingBlock:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v7 = a6;
  v12 = a7;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__BMStreamDatastore_removeEventsFrom_to_reason_pruneFutureEvents_usingBlock___block_invoke;
  v14[3] = &unk_1E5565F38;
  v15 = v12;
  v13 = v12;
  -[BMStreamDatastore removeEventsFrom:to:reason:pruneFutureEvents:shouldDeleteUsingBlock:](self, "removeEventsFrom:to:reason:pruneFutureEvents:shouldDeleteUsingBlock:", a5, v7, v14, a3, a4);

}

uint64_t __77__BMStreamDatastore_removeEventsFrom_to_reason_pruneFutureEvents_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "timestamp");
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a3);
  return 1;
}

- (void)removeEventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 pruneFutureEvents:(BOOL)a6 shouldDeleteUsingBlock:(id)a7
{
  -[BMStreamDatastore _removeEventsFrom:to:reason:policyID:pruneFutureEvents:shouldDeleteUsingBlock:](self, "_removeEventsFrom:to:reason:policyID:pruneFutureEvents:shouldDeleteUsingBlock:", a5, 0, a6, a7, a3, a4);
}

- (void)removeEventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 policyID:(id)a6 shouldDeleteUsingBlock:(id)a7
{
  -[BMStreamDatastore _removeEventsFrom:to:reason:policyID:pruneFutureEvents:shouldDeleteUsingBlock:](self, "_removeEventsFrom:to:reason:policyID:pruneFutureEvents:shouldDeleteUsingBlock:", a5, a6, 0, a7, a3, a4);
}

- (void)_removeEventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 policyID:(id)a6 pruneFutureEvents:(BOOL)a7 shouldDeleteUsingBlock:(id)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  NSObject *v19;
  CFAbsoluteTime Current;
  double v21;
  void *v22;
  BMSegmentManager *segmentManager;
  id v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t *v42;
  uint64_t *v43;
  double v44;
  CFAbsoluteTime v45;
  unint64_t v46;
  double v47;
  BOOL v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _BYTE v59[128];
  uint64_t v60;

  v9 = a7;
  v60 = *MEMORY[0x1E0C80C00];
  v14 = a6;
  v15 = a8;
  -[BMStreamDatastore delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "timeIntervalSince1970");
  if (v9 && v18 < 604800.0)
  {
    __biome_log_for_category();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[BMStreamDatastore _removeEventsFrom:to:reason:policyID:pruneFutureEvents:shouldDeleteUsingBlock:].cold.2();

    v9 = 0;
  }
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__0;
  v57 = __Block_byref_object_dispose__0;
  v58 = (id)objc_opt_new();
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  Current = CFAbsoluteTimeGetCurrent();
  if (v9)
    v21 = -1.0;
  else
    v21 = a4;
  -[BMSegmentManager refreshSegmentsList](self->_segmentManager, "refreshSegmentsList");
  if (-[BMStreamDatastore isTombstoneStore](self, "isTombstoneStore")
    || -[BMStreamDatastore isSubscriptionStore](self, "isSubscriptionStore"))
  {
    v22 = 0;
  }
  else
  {
    -[BMStreamDatastore metadata](self, "metadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  segmentManager = self->_segmentManager;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __99__BMStreamDatastore__removeEventsFrom_to_reason_policyID_pruneFutureEvents_shouldDeleteUsingBlock___block_invoke;
  v37[3] = &unk_1E5565F88;
  v44 = a3;
  v37[4] = self;
  v42 = &v53;
  v24 = v22;
  v38 = v24;
  v48 = v9;
  v45 = Current;
  v25 = v15;
  v41 = v25;
  v26 = v16;
  v39 = v26;
  v46 = a5;
  v27 = v14;
  v40 = v27;
  v43 = &v49;
  v47 = a4;
  -[BMSegmentManager enumerateSegmentsFrom:to:withBlock:](segmentManager, "enumerateSegmentsFrom:to:withBlock:", v37, a3, v21);
  if (*((_BYTE *)v50 + 24))
  {
    __biome_log_for_category();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[BMStreamDatastore _removeEventsFrom:to:reason:policyID:pruneFutureEvents:shouldDeleteUsingBlock:].cold.1();

  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v29 = (id)v54[5];
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v33, v59, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v34;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v34 != v31)
          objc_enumerationMutation(v29);
        -[BMSegmentManager removeSegmentNamed:](self->_segmentManager, "removeSegmentNamed:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v32++), (_QWORD)v33);
      }
      while (v30 != v32);
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v33, v59, 16);
    }
    while (v30);
  }

  -[BMSegmentManager refreshSegmentsList](self->_segmentManager, "refreshSegmentsList");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v26, "didPruneEvents");

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

}

void __99__BMStreamDatastore__removeEventsFrom_to_reason_policyID_pruneFutureEvents_shouldDeleteUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  double v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  int v55;

  v7 = a2;
  v8 = a3;
  if (v7)
  {
    v52 = 0;
    v53 = &v52;
    v54 = 0x2020000000;
    v55 = 0;
    v48 = 0;
    v49 = &v48;
    v50 = 0x2020000000;
    v51 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__0;
    v46 = __Block_byref_object_dispose__0;
    v47 = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __99__BMStreamDatastore__removeEventsFrom_to_reason_policyID_pruneFutureEvents_shouldDeleteUsingBlock___block_invoke_2;
    v24[3] = &unk_1E5565F60;
    v9 = v7;
    v25 = v9;
    v26 = *(id *)(a1 + 40);
    v32 = &v52;
    v41 = *(_BYTE *)(a1 + 120);
    v36 = *(_QWORD *)(a1 + 96);
    v31 = *(id *)(a1 + 64);
    v10 = *(id *)(a1 + 48);
    v33 = &v48;
    v34 = &v42;
    v11 = *(_QWORD *)(a1 + 32);
    v27 = v10;
    v28 = v11;
    v12 = v8;
    v13 = *(_QWORD *)(a1 + 104);
    v29 = v12;
    v37 = v13;
    v14 = *(id *)(a1 + 56);
    v15 = *(_QWORD *)(a1 + 80);
    v30 = v14;
    v35 = v15;
    v16 = *(_QWORD *)(a1 + 112);
    v38 = *(_QWORD *)(a1 + 88);
    v39 = v16;
    v40 = a4;
    objc_msgSend(v9, "enumerateFromOffset:withCallback:", 0, v24);
    if (*((_DWORD *)v53 + 6) == *((_DWORD *)v49 + 6)
      && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "lastSegmentName"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "isEqual:", v12),
          v17,
          (v18 & 1) == 0))
    {
      v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      objc_msgSend(v9, "segmentName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v23);

    }
    else if (v43[5] && objc_msgSend(v9, "datastoreVersion") == 10)
    {
      objc_msgSend(v9, "updateHighestDeletedFrameV2:addToDeletedFrameCount:", v43[5], *((unsigned int *)v49 + 6));
    }

    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(&v52, 8);
  }
  else
  {
    +[BMSegmentManager timestampFromSegmentName:](BMSegmentManager, "timestampFromSegmentName:", v8);
    if (v19 >= *(double *)(a1 + 88))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "lastSegmentName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqual:", v8);

      if ((v21 & 1) == 0)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", v8);
    }
  }

}

void __99__BMStreamDatastore__removeEventsFrom_to_reason_policyID_pruneFutureEvents_shouldDeleteUsingBlock___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  BMStoreEvent *v6;
  void *v7;
  BMStoreEvent *v8;
  double v9;
  double v10;
  id v11;

  v11 = a2;
  v6 = [BMStoreEvent alloc];
  objc_msgSend(*(id *)(a1 + 32), "segmentName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BMStoreEvent initWithFrame:segmentName:error:eventCategory:metadata:dataType:](v6, "initWithFrame:segmentName:error:eventCategory:metadata:dataType:", v11, v7, 1, 0, *(_QWORD *)(a1 + 40), 0);

  objc_msgSend(v11, "creationTimestamp");
  v10 = v9;
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
  if (*(_BYTE *)(a1 + 160) && v9 > *(double *)(a1 + 120) && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 80) + 16))())
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 48), "willPruneEvent:", v8);
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 32), "markFrameAsRemoved:", v11);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), a2);
    if ((objc_msgSend(*(id *)(a1 + 56), "isTombstoneStore") & 1) == 0
      && (objc_msgSend(*(id *)(a1 + 56), "isSubscriptionStore") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "didMarkFrameAsRemovedWithSegmentName:frame:reason:policyID:outTombstoneBookmark:", *(_QWORD *)(a1 + 64), v11, *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 72), 0);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 1;
    goto LABEL_20;
  }
  if (v10 >= *(double *)(a1 + 136)
    && v10 <= *(double *)(a1 + 144)
    && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 80) + 16))())
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 48), "willPruneEvent:", v8);
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 32), "markFrameAsRemoved:", v11);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), a2);
    if ((objc_msgSend(*(id *)(a1 + 56), "isTombstoneStore") & 1) == 0
      && (objc_msgSend(*(id *)(a1 + 56), "isSubscriptionStore") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "didMarkFrameAsRemovedWithSegmentName:frame:reason:policyID:outTombstoneBookmark:", *(_QWORD *)(a1 + 64), v11, *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 72), 0);
    }
LABEL_20:
    if (!*a3)
      goto LABEL_24;
    goto LABEL_23;
  }
  if (v10 <= *(double *)(a1 + 144) || *(_BYTE *)(a1 + 160))
    goto LABEL_20;
  *a3 = 1;
LABEL_23:
  **(_BYTE **)(a1 + 152) = 1;
LABEL_24:

}

- (void)eventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 shouldDeleteUsingBlock:(id)a6
{
  -[BMStreamDatastore removeEventsFrom:to:reason:pruneFutureEvents:shouldDeleteUsingBlock:](self, "removeEventsFrom:to:reason:pruneFutureEvents:shouldDeleteUsingBlock:", a5, 0, a6, a3, a4);
}

- (void)syncMappedFiles
{
  id v2;

  -[BMStreamDatastore currentFrameStore](self, "currentFrameStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sync");

}

- (id)newEnumeratorFromStartTime:(double)a3
{
  void *v5;
  double v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = -[BMStreamDatastore newEnumeratorFromStartTime:endTime:maxEvents:lastN:options:](self, "newEnumeratorFromStartTime:endTime:maxEvents:lastN:options:", -1, -1, 0, a3, v6);

  return v7;
}

- (id)newEnumeratorFromStartTime:(double)a3 options:(unint64_t)a4
{
  void *v7;
  double v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = -[BMStreamDatastore newEnumeratorFromStartTime:endTime:maxEvents:lastN:options:](self, "newEnumeratorFromStartTime:endTime:maxEvents:lastN:options:", -1, -1, a4, a3, v8);

  return v9;
}

- (id)newEnumeratorFromStartTime:(double)a3 endTime:(double)a4 options:(unint64_t)a5
{
  return -[BMStreamDatastore newEnumeratorFromStartTime:endTime:maxEvents:lastN:options:](self, "newEnumeratorFromStartTime:endTime:maxEvents:lastN:options:", -1, -1, a5, a3, a4);
}

- (id)newEnumeratorFromStartTime:(double)a3 endTime:(double)a4 maxEvents:(unint64_t)a5 options:(unint64_t)a6
{
  return -[BMStreamDatastore newEnumeratorFromStartTime:endTime:maxEvents:lastN:options:](self, "newEnumeratorFromStartTime:endTime:maxEvents:lastN:options:", a5, -1, a6, a3, a4);
}

- (id)newEnumeratorFromStartTime:(double)a3 endTime:(double)a4 maxEvents:(unint64_t)a5 lastN:(unint64_t)a6 options:(unint64_t)a7
{
  BMStoreEnumerator *v13;
  double v14;
  double Current;
  double v16;
  double v17;
  double v18;
  BMStoreEnumerator *v19;
  BMStoreEnumerator *v20;
  NSObject *v21;
  NSString *streamId;
  int v24;
  NSString *v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v13 = [BMStoreEnumerator alloc];
  if (!self->_permission)
  {
    if (-[BMPruningPolicy pruneOnAccess](self->_pruningPolicy, "pruneOnAccess"))
    {
      if (-[BMPruningPolicy filterByAgeOnRead](self->_pruningPolicy, "filterByAgeOnRead"))
      {
        -[BMPruningPolicy maxAge](self->_pruningPolicy, "maxAge");
        if (v14 > 0.0)
        {
          Current = CFAbsoluteTimeGetCurrent();
          -[BMPruningPolicy maxAge](self->_pruningPolicy, "maxAge");
          v17 = Current - v16;
          v18 = 0.0;
          if ((a7 & 8) == 0)
            v18 = v17;
          if (v17 > a3)
            a3 = v18;
        }
      }
    }
  }
  if (!a6)
    a5 = 0;
  v19 = v13;
  v20 = -[BMStoreEnumerator initWithStreamDatastore:startTime:endTime:maxEvents:lastN:options:dataType:](v19, "initWithStreamDatastore:startTime:endTime:maxEvents:lastN:options:dataType:", self, a5, a6, a7, -[BMStreamDatastore eventBodyClass](self, "eventBodyClass"), a3, a4);

  if (!v20)
  {
    __biome_log_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      streamId = self->_streamId;
      v24 = 138413058;
      v25 = streamId;
      v26 = 2048;
      v27 = a3;
      v28 = 2048;
      v29 = a4;
      v30 = 2048;
      v31 = a7;
      _os_log_error_impl(&dword_1A95BD000, v21, OS_LOG_TYPE_ERROR, "Failed to create enumerator for stream: %@ startTime: %f endTime: %f, options: %lu", (uint8_t *)&v24, 0x2Au);
    }

  }
  return v20;
}

- (id)newEnumeratorFromBookmark:(id)a3
{
  return -[BMStreamDatastore newEnumeratorFromBookmark:options:](self, "newEnumeratorFromBookmark:options:", a3, 0);
}

- (double)timestampFromSegmentName:(id)a3
{
  double result;

  +[BMSegmentManager timestampFromSegmentName:](BMSegmentManager, "timestampFromSegmentName:", a3);
  return result;
}

- (id)newEnumeratorFromBookmark:(id)a3 options:(unint64_t)a4
{
  return -[BMStreamDatastore newEnumeratorFromBookmark:options:error:](self, "newEnumeratorFromBookmark:options:error:", a3, a4, 0);
}

- (id)newEnumeratorFromBookmark:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  BMStoreEnumerator *v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSString *streamId;
  id v15;
  uint8_t buf[4];
  NSString *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v15 = 0;
  v9 = -[BMStoreEnumerator initWithStreamDatastore:bookmark:options:error:]([BMStoreEnumerator alloc], "initWithStreamDatastore:bookmark:options:error:", self, v8, a4, &v15);
  v10 = v15;
  v11 = v10;
  if (a5 && v10)
    *a5 = objc_retainAutorelease(v10);
  if (!v9)
  {
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      streamId = self->_streamId;
      *(_DWORD *)buf = 138412802;
      v17 = streamId;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v11;
      _os_log_error_impl(&dword_1A95BD000, v12, OS_LOG_TYPE_ERROR, "Failed to create enumerator with bookmark for stream: %@ %@ error: %@", buf, 0x20u);
    }

  }
  return v9;
}

- (id)newEnumeratorFromBookmarkEnumerator:(id)a3 error:(id *)a4
{
  id v6;
  BMStoreEnumerator *v7;
  id v8;
  NSObject *v9;
  NSString *streamId;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0;
  v7 = -[BMStoreEnumerator initWithStreamDatastore:bookmarkEnumerator:error:]([BMStoreEnumerator alloc], "initWithStreamDatastore:bookmarkEnumerator:error:", self, v6, &v12);
  v8 = v12;
  if (!v7)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      streamId = self->_streamId;
      *(_DWORD *)buf = 138412802;
      v14 = v6;
      v15 = 2112;
      v16 = streamId;
      v17 = 2112;
      v18 = v8;
      _os_log_error_impl(&dword_1A95BD000, v9, OS_LOG_TYPE_ERROR, "Failed to create enumerator with bookmarkEnumerator: %@ for stream: %@ error: %@", buf, 0x20u);
    }

  }
  if (a4)
    *a4 = objc_retainAutorelease(v8);

  return v7;
}

- (BOOL)deleteEventAtBookmark:(id)a3 outTombstoneBookmark:(id *)a4
{
  id v6;
  BMStoreEnumerator *v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  NSString *streamId;
  BOOL v13;
  NSString *v15;
  _QWORD v16[4];
  id v17;
  BMStreamDatastore *v18;
  uint64_t *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  id v25;
  _BYTE buf[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v25 = 0;
  v7 = -[BMStoreEnumerator initWithStreamDatastore:bookmark:options:error:]([BMStoreEnumerator alloc], "initWithStreamDatastore:bookmark:options:error:", self, v6, 3, &v25);
  v8 = (uint64_t (*)(uint64_t, uint64_t))v25;
  if (v8)
  {
    v9 = BMStorageErrorGetErrno() == 2;
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        streamId = self->_streamId;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = streamId;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v6;
        _os_log_impl(&dword_1A95BD000, v11, OS_LOG_TYPE_INFO, "Unable to delete event at bookmark because segment has already been deleted: %@ %@", buf, 0x16u);
      }

      if (a4)
        *a4 = 0;
      v13 = 1;
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v15 = self->_streamId;
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        v27 = v8;
        _os_log_error_impl(&dword_1A95BD000, v11, OS_LOG_TYPE_ERROR, "Failed to create enumerator for deleting event: %@ %@ error: %@", buf, 0x20u);
      }

      v13 = 0;
      if (a4)
        *a4 = 0;
    }
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v27 = __Block_byref_object_copy__0;
    v28 = __Block_byref_object_dispose__0;
    v29 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__BMStreamDatastore_deleteEventAtBookmark_outTombstoneBookmark___block_invoke;
    v16[3] = &unk_1E5565FB0;
    v17 = v6;
    v18 = self;
    v19 = &v21;
    v20 = buf;
    -[BMStoreEnumerator nextEventWithContext:](v7, "nextEventWithContext:", v16);
    if (a4)
      *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    v13 = *((_BYTE *)v22 + 24) != 0;

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(buf, 8);

  }
  return v13;
}

void __64__BMStreamDatastore_deleteEventAtBookmark_outTombstoneBookmark___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "frame");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "datastoreVersion");
    v9 = objc_msgSend(v7, "framePtr");
    if (v8 == 9)
      v10 = bm_frame_header_statusV1((unint64_t *)v9) >> 32;
    else
      LODWORD(v10) = *(_DWORD *)(v9 + 4);
    if ((v10 & 0xFFFFFFFE) == 2)
    {
      __biome_log_for_category();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v26 = v14;
        v27 = 1024;
        v28 = v10;
        _os_log_impl(&dword_1A95BD000, v13, OS_LOG_TYPE_DEFAULT, "deleteEventAtBookmark: event at bookmark %@ already in deleted state %u", buf, 0x12u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      objc_msgSend(v5, "frame");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "markFrameAsRemoved:", v15);

      if (objc_msgSend(v6, "datastoreVersion") == 10)
      {
        objc_msgSend(v5, "frame");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "updateHighestDeletedFrameV2:addToDeletedFrameCount:", v16, 1);

      }
      if ((objc_msgSend(*(id *)(a1 + 40), "isTombstoneStore") & 1) != 0
        || (objc_msgSend(*(id *)(a1 + 40), "isSubscriptionStore") & 1) != 0)
      {
        v17 = 0;
      }
      else
      {
        v18 = *(void **)(a1 + 40);
        objc_msgSend(v6, "segmentName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "frame");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0;
        objc_msgSend(v18, "didMarkFrameAsRemovedWithSegmentName:frame:reason:policyID:outTombstoneBookmark:", v19, v20, 2, 0, &v24);
        v17 = v24;

      }
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v17;
      v23 = v17;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }

  }
  else
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v26 = v12;
      _os_log_impl(&dword_1A95BD000, v11, OS_LOG_TYPE_DEFAULT, "deleteEventAtBookmark: couldn't find event with bookmark %@", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (void)enumerateEventsFrom:(double)a3 to:(double)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  void *v15;
  double v16;
  uint64_t v17;
  void *v18;
  unsigned int (**v19)(id, void *);

  v19 = (unsigned int (**)(id, void *))a6;
  if (a3 <= a4)
  {
    if ((a5 & 8) != 0)
      v11 = a3;
    else
      v11 = a4;
    if ((a5 & 8) != 0)
      v12 = a4;
    else
      v12 = a3;
    v13 = -[BMStreamDatastore newEnumeratorFromStartTime:endTime:options:](self, "newEnumeratorFromStartTime:endTime:options:", a5, v12, v11);
    objc_msgSend(v13, "nextEvent");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      do
      {
        objc_msgSend(v15, "timestamp");
        if ((a5 & 8) != 0)
        {
          if (v16 < a3)
            break;
        }
        else if (v16 > a4)
        {
          break;
        }
        if (!v19[2](v19, v15))
          break;
        objc_msgSend(v13, "nextEvent");
        v17 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v17;
      }
      while (v17);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMStreamDatastore.m"), 707, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("start <= end"));

  }
}

- (BOOL)writeEventData:(id)a3 dataVersion:(unsigned int)a4 timestamp:(double)a5
{
  return -[BMStreamDatastore writeEventData:dataVersion:timestamp:outBookmark:](self, "writeEventData:dataVersion:timestamp:outBookmark:", a3, *(_QWORD *)&a4, 0, a5);
}

- (BOOL)writeEventBytes:(const void *)a3 length:(unint64_t)a4 dataVersion:(unsigned int)a5 timestamp:(double)a6
{
  return -[BMStreamDatastore writeEventBytes:length:dataVersion:timestamp:outBookmark:](self, "writeEventBytes:length:dataVersion:timestamp:outBookmark:", a3, a4, *(_QWORD *)&a5, 0, a6);
}

- (BOOL)writeEventData:(id)a3 dataVersion:(unsigned int)a4 timestamp:(double)a5 outBookmark:(id *)a6
{
  uint64_t v8;
  id v10;
  void *v11;
  BOOL v12;
  NSObject *v13;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = v10;
  if (v10)
  {
    v12 = -[BMStreamDatastore writeEventBytes:length:dataVersion:timestamp:outBookmark:](self, "writeEventBytes:length:dataVersion:timestamp:outBookmark:", objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), v8, a6, a5);
  }
  else
  {
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BMStreamDatastore writeEventData:dataVersion:timestamp:outBookmark:].cold.1();

    v12 = 0;
  }

  return v12;
}

- (id)_bookmarkWithSegmentName:(id)a3 offset:(unint64_t)a4 datastoreVersion:(unsigned int)a5
{
  unint64_t v6;
  id v7;
  BMStoreBookmark *v8;

  if (a5 == 9)
    v6 = a4 - 56;
  else
    v6 = a4;
  v7 = a3;
  v8 = -[BMStoreBookmark initWithStream:segment:iterationStartTime:offset:]([BMStoreBookmark alloc], "initWithStream:segment:iterationStartTime:offset:", self->_streamId, v7, v6, CFAbsoluteTimeGetCurrent());

  return v8;
}

- (BOOL)writeEventBytes:(const void *)a3 length:(unint64_t)a4 dataVersion:(unsigned int)a5 timestamp:(double)a6 outBookmark:(id *)a7
{
  uint64_t v9;
  void *v13;
  NSObject *v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  unsigned int v22;
  NSObject *v24;
  BOOL v25;
  NSString *streamId;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  NSString *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v41;
  void *v42;
  id *v43;
  BMStreamDatastore *v44;
  _QWORD block[5];
  uint64_t v46;
  _BYTE buf[24];
  _BYTE v48[18];
  __int16 v49;
  NSObject *v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v9 = *(_QWORD *)&a5;
  v53 = *MEMORY[0x1E0C80C00];
  -[BMStreamDatastore currentFrameStore](self, "currentFrameStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "start"))
    -[BMStreamDatastore currentFrameStore](self, "currentFrameStore");
  else
    -[BMSegmentManager lastFrameStoreOrCreateWithTimestamp:](self->_segmentManager, "lastFrameStoreOrCreateWithTimestamp:", a6);
  v14 = objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    __biome_log_for_category();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[BMStreamDatastore writeEventBytes:length:dataVersion:timestamp:outBookmark:].cold.1(self, v20);
    v25 = 0;
    goto LABEL_38;
  }
  v43 = a7;
  v44 = self;
  v46 = 0;
  -[NSObject segmentName](v14, "segmentName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[NSObject writeFrameForBytes:length:dataVersion:timestamp:outOffset:](v14, "writeFrameForBytes:length:dataVersion:timestamp:outOffset:", a3, a4, v9, &v46, a6);
  if (v16 == 2)
  {
    v17 = 0;
    do
    {
      v18 = (void *)MEMORY[0x1AF4163D4]();
      __biome_log_for_category();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = a4;
        _os_log_impl(&dword_1A95BD000, v19, OS_LOG_TYPE_INFO, "Not enough free space to write event of size %zu. Attempting to create new segment", buf, 0xCu);
      }

      -[BMSegmentManager segmentAfterFrameStore:orCreateSegmentWithTimestamp:](v44->_segmentManager, "segmentAfterFrameStore:orCreateSegmentWithTimestamp:", v14, a6);
      v20 = objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        __biome_log_for_category();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          -[BMStreamDatastore writeEventBytes:length:dataVersion:timestamp:outBookmark:].cold.2(v44, v39);

        objc_autoreleasePoolPop(v18);
        v20 = 0;
        v25 = 0;
        goto LABEL_37;
      }
      -[NSObject segmentName](v20, "segmentName");
      v21 = objc_claimAutoreleasedReturnValue();

      v22 = -[NSObject writeFrameForBytes:length:dataVersion:timestamp:outOffset:](v20, "writeFrameForBytes:length:dataVersion:timestamp:outOffset:", a3, a4, v9, &v46, a6);
      objc_autoreleasePoolPop(v18);
      if (v22 != 2)
        break;
      v14 = v20;
      v15 = (void *)v21;
    }
    while (v17++ < 9);
    if (!v22)
      goto LABEL_21;
    goto LABEL_14;
  }
  v22 = v16;
  v21 = (uint64_t)v15;
  v20 = v14;
  if (v16)
  {
LABEL_14:
    __biome_log_for_category();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      -[BMStreamDatastore streamPath](v44, "streamPath");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBMFrameWriteStatus(v22);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v41;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a4;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)v48 = v9;
      *(_WORD *)&v48[4] = 2112;
      *(_QWORD *)&v48[6] = v42;
      _os_log_error_impl(&dword_1A95BD000, v24, OS_LOG_TYPE_ERROR, "Failed to write frame for: %@, length: %zu dataVersion: %u writeStatus: %@", buf, 0x26u);

    }
    v25 = 0;
    goto LABEL_33;
  }
LABEL_21:
  streamId = v44->_streamId;
  if (!streamId)
    goto LABEL_25;
  if (!-[NSString length](streamId, "length"))
    goto LABEL_25;
  -[NSObject segmentName](v20, "segmentName");
  v27 = objc_claimAutoreleasedReturnValue();
  if (!v27
    || (v28 = (void *)v27,
        -[NSObject segmentName](v20, "segmentName"),
        v29 = (void *)objc_claimAutoreleasedReturnValue(),
        v30 = objc_msgSend(v29, "length"),
        v29,
        v28,
        !v30))
  {
LABEL_25:
    __biome_log_for_category();
    v31 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v48[0] = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__BMStreamDatastore_writeEventBytes_length_dataVersion_timestamp_outBookmark___block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (writeEventBytes_length_dataVersion_timestamp_outBookmark__onceToken != -1)
      dispatch_once(&writeEventBytes_length_dataVersion_timestamp_outBookmark__onceToken, block);
    v32 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v31, v32))
    {
      v33 = v44->_streamId;
      v34 = -[NSString length](v33, "length");
      -[NSObject segmentName](v20, "segmentName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject segmentName](v20, "segmentName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "length");
      *(_DWORD *)buf = 138413570;
      *(_QWORD *)&buf[4] = v33;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v34;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)v48 = v35;
      *(_WORD *)&v48[8] = 2048;
      *(_QWORD *)&v48[10] = v37;
      v49 = 2112;
      v50 = v20;
      v51 = 2112;
      v52 = v21;
      _os_log_impl(&dword_1A95BD000, v31, v32, "Calling _bookmarkWithSegmentName(streamId=%@ (len=%lu), segmentName=%@ (len=%lu)) frameStore=%@, segment before write=%@", buf, 0x3Eu);

    }
  }
  if (v43)
  {
    -[NSObject segmentName](v20, "segmentName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMStreamDatastore _bookmarkWithSegmentName:offset:datastoreVersion:](v44, "_bookmarkWithSegmentName:offset:datastoreVersion:", v38, v46, -[NSObject datastoreVersion](v20, "datastoreVersion"));
    *v43 = (id)objc_claimAutoreleasedReturnValue();

  }
  v25 = 1;
LABEL_33:
  v15 = (void *)v21;
LABEL_37:

LABEL_38:
  return v25;
}

uint64_t __78__BMStreamDatastore_writeEventBytes_length_dataVersion_timestamp_outBookmark___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (void)fetchEventFromFrameStore:(id)a3 atOffset:(unint64_t)a4 withOptions:(unint64_t)a5 callback:(id)a6
{
  id v11;
  void (**v12)(id, _QWORD, void *);
  BMPruningPolicy *pruningPolicy;
  void *v14;
  NSObject *v15;
  NSString *streamPath;
  void *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  NSString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (void (**)(id, _QWORD, void *))a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMStreamDatastore.m"), 854, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("callback"));

  }
  if (!v11)
  {
    -[BMSegmentManager segmentAfterFrameStore:direction:](self->_segmentManager, "segmentAfterFrameStore:direction:", 0, (a5 >> 3) & 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  if (v11)
  {
    if (!v20[5])
    {
      while (1)
      {
        pruningPolicy = self->_pruningPolicy;
        if (pruningPolicy)
        {
          objc_msgSend(v11, "setFilterByAgeOnRead:", -[BMPruningPolicy filterByAgeOnRead](pruningPolicy, "filterByAgeOnRead"));
          objc_msgSend(v11, "setPruneOnAccess:", -[BMPruningPolicy pruneOnAccess](self->_pruningPolicy, "pruneOnAccess"));
          -[BMPruningPolicy maxAge](self->_pruningPolicy, "maxAge");
          objc_msgSend(v11, "setMaxAge:");
        }
        if (!-[BMSegmentManager isDataAccessible](self->_segmentManager, "isDataAccessible"))
          break;
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __76__BMStreamDatastore_fetchEventFromFrameStore_atOffset_withOptions_callback___block_invoke;
        v18[3] = &unk_1E5565FD8;
        v18[4] = &v19;
        objc_msgSend(v11, "enumerateWithOptions:fromOffset:usingBlock:", a5, a4, v18);
        if (v20[5])
        {
          v14 = v11;
        }
        else
        {
          -[BMSegmentManager segmentAfterFrameStore:direction:](self->_segmentManager, "segmentAfterFrameStore:direction:", v11, (a5 >> 3) & 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            __biome_log_for_category();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              -[BMStreamDatastore fetchEventFromFrameStore:atOffset:withOptions:callback:].cold.1();
            goto LABEL_21;
          }

          a4 = 0xFFFFFFFFLL;
          v11 = v14;
        }
        if (v20[5])
          goto LABEL_23;
      }
      __biome_log_for_category();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        streamPath = self->_streamPath;
        *(_DWORD *)buf = 138543362;
        v26 = streamPath;
        _os_log_impl(&dword_1A95BD000, v15, OS_LOG_TYPE_INFO, "Segment is no longer accessible: %{public}@", buf, 0xCu);
      }
LABEL_21:

    }
    v14 = v11;
  }
  else
  {
    v14 = 0;
  }
LABEL_23:
  v12[2](v12, v20[5], v14);
  _Block_object_dispose(&v19, 8);

}

void __76__BMStreamDatastore_fetchEventFromFrameStore_atOffset_withOptions_callback___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

- (id)metadataPath
{
  NSString *streamPath;
  void *v3;
  void *v4;

  streamPath = self->_streamPath;
  objc_msgSend(MEMORY[0x1E0D01D38], "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](streamPath, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)updateMetadata:(Class)a3
{
  return self->_biomeLibrary
      || -[BMStreamDatastore isTombstoneStore](self, "isTombstoneStore")
      || -[BMStreamDatastore isSubscriptionStore](self, "isSubscriptionStore")
      || -[BMStreamDatastore updateMetadata:pruningPolicy:](self, "updateMetadata:pruningPolicy:", a3, 0);
}

- (BOOL)updateMetadata:(Class)a3 pruningPolicy:(id)a4
{
  BMPruningPolicy *v6;
  os_unfair_lock_s *p_lock;
  BOOL v8;
  BMStreamMetadata *metadata;
  id *p_metadata;
  uint64_t v12;
  id v13;
  BMStreamMetadata *v14;
  NSString *streamId;
  void *v16;
  void *v17;
  BMPruningPolicy *pruningPolicy;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v6 = (BMPruningPolicy *)a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_biomeLibrary
    && !-[BMStreamDatastore isTombstoneStore](self, "isTombstoneStore")
    && !-[BMStreamDatastore isSubscriptionStore](self, "isSubscriptionStore"))
  {
    p_metadata = (id *)&self->_metadata;
    metadata = self->_metadata;
    if (!metadata)
    {
      -[BMStreamDatastore loadMetadata](self, "loadMetadata");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *p_metadata;
      *p_metadata = (id)v12;

      metadata = (BMStreamMetadata *)*p_metadata;
    }
    if (-[BMStreamMetadata eventDataClass](metadata, "eventDataClass")
      && (-[objc_class isEqual:](a3, "isEqual:", objc_msgSend(*p_metadata, "eventDataClass")) & 1) == 0)
    {
      __biome_log_for_category();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        -[BMStreamDatastore updateMetadata:pruningPolicy:].cold.2((uint64_t)a3, objc_msgSend(*p_metadata, "eventDataClass"), (uint64_t)v22, v19);
    }
    else
    {
      v14 = [BMStreamMetadata alloc];
      streamId = self->_streamId;
      -[BMStoreConfig account](self->_config, "account");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMStoreConfig remoteName](self->_config, "remoteName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      pruningPolicy = v6;
      if (!v6)
        pruningPolicy = self->_pruningPolicy;
      v19 = -[BMStreamMetadata initWithStreamId:eventType:account:remoteStreamName:pruningPolicy:](v14, "initWithStreamId:eventType:account:remoteStreamName:pruningPolicy:", streamId, a3, v16, v17, pruningPolicy);

      if ((objc_msgSend(*p_metadata, "isEqual:", v19) & 1) != 0
        || (objc_storeStrong((id *)&self->_metadata, v19),
            -[BMStreamDatastore saveMetadata:](self, "saveMetadata:", self->_metadata)))
      {
        v8 = 1;
LABEL_21:

        goto LABEL_5;
      }
      __biome_log_for_category();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        -[BMStreamDatastore streamId](self, "streamId");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMStreamDatastore updateMetadata:pruningPolicy:].cold.1(v21, (uint64_t)v22, v20);
      }

    }
    v8 = 0;
    goto LABEL_21;
  }
  v8 = 1;
LABEL_5:
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (id)loadMetadata
{
  Class eventDataClass;
  NSString *v4;
  NSString *v5;
  objc_class *v6;
  void *v7;
  BMFileManager *fileManager;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  BMStreamMetadata *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  BMStreamMetadata *v24;
  NSString *streamId;
  Class v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v34;
  id v35;
  id v36;

  os_unfair_lock_assert_owner(&self->_lock);
  eventDataClass = self->_eventDataClass;
  if (!self->_biomeLibrary)
  {
    if (eventDataClass && self->_pruningPolicy)
      goto LABEL_25;
    -[BMStreamDatastore metadataPath](self, "metadataPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    fileManager = self->_fileManager;
    v36 = 0;
    -[BMFileManager fileHandleForFileAtPath:flags:protection:error:](fileManager, "fileHandleForFileAtPath:flags:protection:error:", v7, 0x20000000, 3, &v36);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v36;
    v11 = v10;
    if (v9)
    {
      v35 = v10;
      objc_msgSend(v9, "readDataWithError:", &v35);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v35;

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (self->_eventDataClass)
        {
          -[NSObject setByAddingObject:](v14, "setByAddingObject:");
          v16 = objc_claimAutoreleasedReturnValue();

          v15 = v16;
        }
        v34 = v13;
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v15, v12, &v34);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v34;

        if (v11)
        {
          __biome_log_for_category();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[BMStreamDatastore loadMetadata].cold.3();

          v19 = 0;
        }
        else
        {
          -[BMStoreConfig remoteName](self->_config, "remoteName");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setRemoteStreamName:", v31);

          -[BMStoreConfig account](self->_config, "account");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setAccount:", v32);

          v19 = v17;
        }

      }
      else
      {
        __biome_log_for_category();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[BMStreamDatastore loadMetadata].cold.2((uint64_t)v13, self);
        v19 = 0;
        v11 = v13;
      }

    }
    else
    {
      -[BMSegmentManager segmentNames](self->_segmentManager, "segmentNames");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");

      if (!v30)
      {
        v19 = 0;
        goto LABEL_37;
      }
      __biome_log_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[BMStreamDatastore loadMetadata].cold.1((uint64_t)v11, self);
      v19 = 0;
    }

LABEL_37:
    return v19;
  }
  if (!eventDataClass)
  {
    objc_msgSend(MEMORY[0x1E0D01D40], "legacyClassNameForLibraryStream:", self->_streamId);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = NSClassFromString(v4);
      self->_eventDataClass = v6;
      if (!v6)
        goto LABEL_17;
    }
    else if (!self->_eventDataClass)
    {
LABEL_17:
      __biome_log_for_category();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        -[BMStreamDatastore loadMetadata].cold.5((uint64_t *)&self->_streamId, v20, v21);

    }
    if (!self->_pruningPolicy)
    {
      __biome_log_for_category();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        -[BMStreamDatastore loadMetadata].cold.4((uint64_t *)&self->_streamId, v22, v23);

    }
  }
LABEL_25:
  v24 = [BMStreamMetadata alloc];
  streamId = self->_streamId;
  v26 = self->_eventDataClass;
  -[BMStoreConfig account](self->_config, "account");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMStoreConfig remoteName](self->_config, "remoteName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[BMStreamMetadata initWithStreamId:eventType:account:remoteStreamName:pruningPolicy:](v24, "initWithStreamId:eventType:account:remoteStreamName:pruningPolicy:", streamId, v26, v27, v28, self->_pruningPolicy);

  return v19;
}

- (BOOL)saveMetadata:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  NSString *streamId;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  BMFileManager *fileManager;
  void *v14;
  int v15;
  NSObject *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_biomeLibrary)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      streamId = self->_streamId;
      *(_DWORD *)buf = 138543362;
      v20 = streamId;
      _os_log_impl(&dword_1A95BD000, v6, OS_LOG_TYPE_DEFAULT, "-[BMStreamDatastore saveMetadata:] called for stream %{public}@", buf, 0xCu);
    }

    if (-[BMStreamDatastore isTombstoneStore](self, "isTombstoneStore"))
    {
      __biome_log_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[BMStreamDatastore saveMetadata:].cold.1();
      goto LABEL_11;
    }
    if (-[BMStreamDatastore isSubscriptionStore](self, "isSubscriptionStore"))
    {
      __biome_log_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[BMStreamDatastore saveMetadata:].cold.2();
      goto LABEL_11;
    }
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v18);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v18;
    if (v9)
    {
      v10 = v9;
      __biome_log_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[BMStreamDatastore saveMetadata:].cold.5();

    }
    else if (v8)
    {
      fileManager = self->_fileManager;
      -[BMStreamDatastore metadataPath](self, "metadataPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v15 = -[BMFileManager replaceFileAtPath:withData:protection:error:](fileManager, "replaceFileAtPath:withData:protection:error:", v14, v8, 4, &v17);
      v10 = v17;

      if (v15 && !v10)
      {
LABEL_11:
        v5 = 1;
LABEL_17:

        goto LABEL_18;
      }
      __biome_log_for_category();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[BMStreamDatastore saveMetadata:].cold.4(self, (uint64_t)v10, v16);

    }
    else
    {
      __biome_log_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BMStreamDatastore saveMetadata:].cold.3();
    }

    v5 = 0;
    goto LABEL_17;
  }
  v5 = 1;
LABEL_18:

  return v5;
}

- (int64_t)cachingOptionsForFileHandleWithAttributes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;

  v3 = a3;
  objc_msgSend(v3, "filename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01D38], "localDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v5) & 1) != 0)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0D01D38], "remoteDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v6))
  {
LABEL_5:

LABEL_6:
    v8 = 1;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0D01D38], "lock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v7))
  {

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0D01D38], "tmp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "isEqual:", v10);

  if ((v11 & 1) != 0)
  {
    v8 = 1;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0D01D38], "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "isEqual:", v12);

  if ((v13 & 1) != 0)
  {
    v8 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsSeparatedByString:", CFSTR("/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    v8 = 2;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v5, "count") - 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D01D38], "remoteDevices");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (v17)
      v8 = 1;
    else
      v8 = 2;
  }
LABEL_7:

LABEL_8:
  return v8;
}

- (BMFrameStore)currentFrameStore
{
  return -[BMSegmentManager currentFrameStore](self->_segmentManager, "currentFrameStore");
}

- (void)pruneStreamToMaxStreamSizeInBytes:(unint64_t)a3
{
  -[BMSegmentManager pruneSegmentsToMaxSizeInBytes:](self->_segmentManager, "pruneSegmentsToMaxSizeInBytes:", a3);
}

- (void)pruneStreamToMaxSegmentAge:(double)a3
{
  -[BMSegmentManager pruneSegmentsToMaxAge:](self->_segmentManager, "pruneSegmentsToMaxAge:", a3);
}

- (id)segmentContainingTimestamp:(double)a3
{
  return -[BMSegmentManager segmentContainingTimestamp:](self->_segmentManager, "segmentContainingTimestamp:", a3);
}

- (id)segmentWithFilename:(id)a3 error:(id *)a4
{
  return -[BMSegmentManager segmentWithFilename:error:](self->_segmentManager, "segmentWithFilename:error:", a3, a4);
}

- (BOOL)isDataAccessible
{
  return -[BMSegmentManager isDataAccessible](self->_segmentManager, "isDataAccessible");
}

- (void)segmentManager:(id)a3 willDeleteSegmentName:(id)a4 frameStore:(id)a5
{
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BMStreamDatastore *v11;
  id v12;

  v8 = a5;
  -[BMStreamDatastore delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && !-[BMStreamDatastore isTombstoneStore](self, "isTombstoneStore")
    && !-[BMStreamDatastore isSubscriptionStore](self, "isSubscriptionStore"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __69__BMStreamDatastore_segmentManager_willDeleteSegmentName_frameStore___block_invoke;
    v9[3] = &unk_1E5566000;
    v10 = v8;
    v11 = self;
    v7 = v6;
    v12 = v7;
    objc_msgSend(v10, "enumerateFromOffset:withCallback:", 0, v9);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "didPruneEvents");

  }
}

void __69__BMStreamDatastore_segmentManager_willDeleteSegmentName_frameStore___block_invoke(id *a1, void *a2)
{
  BMStoreEvent *v3;
  void *v4;
  void *v5;
  BMStoreEvent *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = [BMStoreEvent alloc];
  objc_msgSend(a1[4], "segmentName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BMStoreEvent initWithFrame:segmentName:error:eventCategory:metadata:dataType:](v3, "initWithFrame:segmentName:error:eventCategory:metadata:dataType:", v9, v4, 1, 0, v5, 0);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a1[6], "willPruneEvent:", v6);
  v7 = a1[5];
  objc_msgSend(a1[4], "segmentName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "creationTimestamp");
  objc_msgSend(v7, "writeTombstoneEventWithSegmentName:offset:length:eventTimestamp:reason:policyID:", v8, 0, 0, 1, 0);

}

- (BMStreamDatastore)initWithStream:(id)a3 permission:(unint64_t)a4 config:(id)a5 includeTombstones:(BOOL)a6
{
  return -[BMStreamDatastore initWithStream:permission:config:includeTombstones:eventDataClass:useCase:](self, "initWithStream:permission:config:includeTombstones:eventDataClass:useCase:", a3, a4, a5, a6, 0, *MEMORY[0x1E0D01C98]);
}

- (id)initForReadingWithStream:(id)a3 config:(id)a4 includeTombstones:(BOOL)a5
{
  return -[BMStreamDatastore initWithStream:permission:config:includeTombstones:](self, "initWithStream:permission:config:includeTombstones:", a3, 0, a4, a5);
}

- (id)initForWritingWithStream:(id)a3 config:(id)a4 includeTombstones:(BOOL)a5
{
  return -[BMStreamDatastore initWithStream:permission:config:includeTombstones:](self, "initWithStream:permission:config:includeTombstones:", a3, 1, a4, a5);
}

- (id)initForPruningWithStream:(id)a3 config:(id)a4 includeTombstones:(BOOL)a5
{
  return -[BMStreamDatastore initWithStream:permission:config:includeTombstones:](self, "initWithStream:permission:config:includeTombstones:", a3, 2, a4, a5);
}

- (void)didMarkFrameAsRemovedWithSegmentName:(id)a3 frame:(id)a4 reason:(unint64_t)a5 policyID:(id)a6 outTombstoneBookmark:(id *)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  id v19;

  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = objc_msgSend(v13, "offset");
  objc_msgSend(v13, "data");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v19, "length");
  objc_msgSend(v13, "creationTimestamp");
  v18 = v17;

  -[BMStreamDatastore writeTombstoneEventWithSegmentName:offset:length:eventTimestamp:reason:policyID:outTombstoneBookmark:](self, "writeTombstoneEventWithSegmentName:offset:length:eventTimestamp:reason:policyID:outTombstoneBookmark:", v14, v15, v16, a5, v12, a7, v18);
}

- (BOOL)updatePruningPolicy:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = -[BMStreamDatastore updateMetadata:pruningPolicy:](self, "updateMetadata:pruningPolicy:", -[BMStreamDatastore eventBodyClass](self, "eventBodyClass"), v4);

  return (char)self;
}

- (id)tombstoneStore
{
  BMStreamDatastore *tombstoneStore;
  void *v4;
  void *v5;
  _BOOL8 v6;
  BMStreamDatastore *v7;
  void *v8;
  void *v9;
  BMStreamDatastore *v10;
  BMStreamDatastore *v11;

  tombstoneStore = self->_tombstoneStore;
  if (!tombstoneStore)
  {
    -[BMStreamDatastore config](self, "config");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tombstonesConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[BMStreamDatastore permission](self, "permission") == 2;
    v7 = [BMStreamDatastore alloc];
    -[BMStreamDatastore streamId](self, "streamId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMStreamDatastore streamPath](self, "streamPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[BMStreamDatastore initWithStream:streamPath:permission:config:includeTombstones:eventDataClass:useCase:](v7, "initWithStream:streamPath:permission:config:includeTombstones:eventDataClass:useCase:", v8, v9, v6, v5, 0, objc_opt_class(), self->_useCase);
    v11 = self->_tombstoneStore;
    self->_tombstoneStore = v10;

    tombstoneStore = self->_tombstoneStore;
  }
  return tombstoneStore;
}

- (id)newTombstoneEnumeratorFromStartTime:(double)a3
{
  void *v4;
  void *v5;

  -[BMStreamDatastore tombstoneStore](self, "tombstoneStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "newEnumeratorFromStartTime:", a3);

  return v5;
}

- (id)newTombstoneEnumeratorFromBookmark:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[BMStreamDatastore tombstoneStore](self, "tombstoneStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newEnumeratorFromBookmark:", v4);

  return v6;
}

- (void)writeTombstoneEventWithSegmentName:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 eventTimestamp:(double)a6 reason:(unint64_t)a7 policyID:(id)a8
{
  -[BMStreamDatastore writeTombstoneEventWithSegmentName:offset:length:eventTimestamp:reason:policyID:outTombstoneBookmark:](self, "writeTombstoneEventWithSegmentName:offset:length:eventTimestamp:reason:policyID:outTombstoneBookmark:", a3, a4, a5, a7, a8, 0, a6);
}

- (void)writeTombstoneEventWithSegmentName:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 eventTimestamp:(double)a6 reason:(unint64_t)a7 policyID:(id)a8 outTombstoneBookmark:(id *)a9
{
  id v16;
  id v17;
  double Current;
  BMTombstoneEvent *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;

  if (self->_includeTombstones)
  {
    v16 = a8;
    v17 = a3;
    Current = CFAbsoluteTimeGetCurrent();
    v19 = -[BMTombstoneEvent initWithSegmentName:offset:length:eventTimestamp:reason:policyID:]([BMTombstoneEvent alloc], "initWithSegmentName:offset:length:eventTimestamp:reason:policyID:", v17, a4, a5, a7, v16, a6);

    -[BMStreamDatastore tombstoneStore](self, "tombstoneStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(a9) = objc_msgSend(v20, "writeEventWithEventBody:timestamp:outEventSize:outBookmark:", v19, 0, a9, Current);

    if ((_DWORD)a9)
    {
      -[BMStreamDatastore delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[BMStoreConfig account](self->_config, "account");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMStoreConfig remoteName](self->_config, "remoteName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "didWriteTombstone:timestamp:account:remoteName:", v19, v22, v23, Current);

      }
    }
    else
    {
      __biome_log_for_category();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[BMStreamDatastore writeTombstoneEventWithSegmentName:offset:length:eventTimestamp:reason:policyID:outTombstoneBookmark:].cold.1();

    }
  }
}

- (NSString)streamId
{
  return self->_streamId;
}

- (BMStoreConfig)config
{
  return self->_config;
}

- (BMStreamDatastorePruningDelegate)delegate
{
  return (BMStreamDatastorePruningDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)includeTombstones
{
  return self->_includeTombstones;
}

- (unint64_t)permission
{
  return self->_permission;
}

- (unint64_t)maxFileSize
{
  return self->_maxFileSize;
}

- (NSString)streamPath
{
  return self->_streamPath;
}

- (NSString)segmentDirectory
{
  return self->_segmentDirectory;
}

- (BMPruningPolicy)pruningPolicy
{
  return self->_pruningPolicy;
}

- (BMSegmentManager)segmentManager
{
  return self->_segmentManager;
}

- (BOOL)verifyStreamHealthFrom:(double)a3 to:(double)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  char v11;
  _QWORD v13[10];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__1;
  v20[4] = __Block_byref_object_dispose__1;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  -[BMStreamDatastore segmentManager](self, "segmentManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__BMStreamDatastore_HealthCheck__verifyStreamHealthFrom_to_error___block_invoke;
  v13[3] = &unk_1E5566048;
  v13[4] = self;
  v13[5] = &v22;
  *(double *)&v13[8] = a3;
  *(double *)&v13[9] = a4;
  v13[6] = &v14;
  v13[7] = v20;
  objc_msgSend(v9, "enumerateSegmentsFrom:to:withBlock:", v13, a3, a4);

  if (a5)
  {
    v10 = (void *)v15[5];
    if (v10)
      *a5 = objc_retainAutorelease(v10);
  }
  v11 = *((_BYTE *)v23 + 24);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);
  return v11;
}

void __66__BMStreamDatastore_HealthCheck__verifyStreamHealthFrom_to_error___block_invoke(double *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  id *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id obj;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!v7)
    goto LABEL_10;
  if (objc_msgSend(v7, "datastoreVersion") == 9)
  {
    v9 = (void *)*((_QWORD *)a1 + 4);
    v10 = a1[8];
    v11 = a1[9];
    v12 = *(_QWORD *)(*((_QWORD *)a1 + 6) + 8);
    v14 = *(void **)(v12 + 40);
    v13 = (id *)(v12 + 40);
    v31 = v14;
    v15 = objc_msgSend(v9, "verifyStreamHealthFromV1:to:frameStore:error:", v7, &v31, v10, v11);
    v16 = v31;
LABEL_6:
    objc_storeStrong(v13, v16);
    *(_BYTE *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 24) = v15;
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "datastoreVersion") == 10)
  {
    v17 = (void *)*((_QWORD *)a1 + 4);
    v18 = a1[8];
    v19 = a1[9];
    v20 = *(_QWORD *)(*((_QWORD *)a1 + 6) + 8);
    v21 = *(void **)(v20 + 40);
    v13 = (id *)(v20 + 40);
    obj = v21;
    v15 = objc_msgSend(v17, "verifyStreamHealthFromV2:to:frameStore:error:", v7, &obj, v18, v19);
    v16 = obj;
    goto LABEL_6;
  }
  v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v32 = *MEMORY[0x1E0CB2D50];
  v23 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 7) + 8) + 40));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("streamHealth failed: %@ for segment: %@, Framestore version not recognized: %d"), CFSTR("BMStreamHealthErrorUnrecognizedDatastoreVersion"), v24, objc_msgSend(v7, "datastoreVersion"));
  v33[0] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v22, "initWithDomain:code:userInfo:", CFSTR("BiomeStreamHealth"), 10, v26);
  v28 = *(_QWORD *)(*((_QWORD *)a1 + 6) + 8);
  v29 = *(void **)(v28 + 40);
  *(_QWORD *)(v28 + 40) = v27;

  *(_BYTE *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 24) = 0;
LABEL_8:
  if (!*(_BYTE *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 24))
    *a4 = 1;
LABEL_10:

}

- (BOOL)verifyStreamHealthFromV1:(double)a3 to:(double)a4 frameStore:(id)a5 error:(id *)a6
{
  id v7;
  void *v8;
  unsigned int v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  int v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  void *v26;
  unint64_t *v27;
  unint64_t v28;
  unint64_t v29;
  Bytef *v30;
  uLong Checksum;
  uint64_t v32;
  uint64_t v33;
  unsigned __int8 *v34;
  uint64_t v35;
  BOOL v37;
  id v38;
  void *v39;
  void *v40;
  id v42;
  id v43;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  uint64_t v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  id *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  _QWORD v90[3];

  v90[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(v7, "segmentPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "bytesUsed");
  if (objc_msgSend(v7, "frameStoreSize") < (unint64_t)v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v89 = *MEMORY[0x1E0CB2D50];
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("streamHealth failed: %@ for segment: %@, bytesUsed: %d, frameStoreSize:%zu"), CFSTR("BMStreamHealthErrorBytesUsedBeyondFrameStoreSize"), v12, objc_msgSend(v7, "bytesUsed"), objc_msgSend(v7, "frameStoreSize"));
    v90[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, &v89, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v10;
    v16 = 5;
LABEL_33:
    v22 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("BiomeStreamHealth"), v16, v14);
    goto LABEL_34;
  }
  v17 = objc_msgSend(v7, "start");
  if (*(_DWORD *)(v17 - 4) != *(_DWORD *)"SEGB")
  {
    v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v87 = *MEMORY[0x1E0CB2D50];
    v19 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("streamHealth failed: %@ for segment: %@"), CFSTR("BMStreamHealthErrorSegmentMagicMismatch"), v12);
    v88 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18;
    v16 = 7;
    goto LABEL_33;
  }
  v20 = *(_DWORD *)(v17 - 40);
  if (v20 != objc_msgSend(v7, "datastoreVersion"))
  {
    v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v85 = *MEMORY[0x1E0CB2D50];
    v43 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v43, "initWithFormat:", CFSTR("streamHealth failed: %@ for segment: %@"), CFSTR("BMStreamHealthErrorDatastoreVersionMismatch"), v12);
    v86 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v42;
    v16 = 8;
    goto LABEL_33;
  }
  v21 = objc_msgSend(v7, "bytesUsed");
  v22 = 0;
  v23 = 0;
  v24 = (v21 - 56);
  v25 = v21 - 64;
  v69 = *MEMORY[0x1E0CB2D50];
  v70 = a6;
  while (1)
  {
    if ((v23 & 7) != 0)
    {
      v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v83 = v69;
      v46 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v46, "initWithFormat:", CFSTR("streamHealth failed: %@ for segment: %@, offset: %d"), CFSTR("BMStreamHealthErrorNotAligned"), v12, v23);
      v84 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v45;
      v48 = 1;
LABEL_43:
      v56 = objc_msgSend(v47, "initWithDomain:code:userInfo:", CFSTR("BiomeStreamHealth"), v48, v14);

      v22 = (void *)v56;
      goto LABEL_34;
    }
    v26 = v8;
    v27 = (unint64_t *)(objc_msgSend(v7, "start") + v23);
    v28 = bm_frame_header_statusV1(v27);
    v29 = v23 + (unint64_t)v28 + 31;
    if (objc_msgSend(v7, "frameStoreSize") <= v29)
    {
      v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v81 = v69;
      v50 = objc_alloc(MEMORY[0x1E0CB3940]);
      v8 = v26;
      objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v26);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v50, "initWithFormat:", CFSTR("streamHealth failed: %@ for segment: %@, offset: %d frameStoreSize: %zu"), CFSTR("BMStreamHealthErrorLengthBeyondFrameSize"), v12, v23, objc_msgSend(v7, "frameStoreSize"));
      v82 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v49;
      v48 = 2;
      goto LABEL_43;
    }
    if (v29 >= v24)
    {
      v51 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v79 = v69;
      v52 = objc_alloc(MEMORY[0x1E0CB3940]);
      v8 = v26;
      objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v26);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v52, "initWithFormat:", CFSTR("streamHealth failed: %@ for segment: %@, offset: %d frameSize: %u, bytesUsedByFrames: %d"), CFSTR("BMStreamHealthErrorLengthBeyondBytesUsed"), v12, v23, v28, v24);
      v80 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v51;
      v48 = 3;
      goto LABEL_43;
    }
    if (HIDWORD(v28) == 3)
      break;
    if (HIDWORD(v28) == 1)
    {
      v30 = (Bytef *)bm_frame_bytesV1((uint64_t)v27);
      Checksum = bm_generateChecksum(v30, v28);
      v32 = *(unsigned int *)(bm_frame_header_infoV1((uint64_t)v27) + 16);
      if ((_DWORD)Checksum != (_DWORD)v32)
      {
        v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v77 = v69;
        v58 = objc_alloc(MEMORY[0x1E0CB3940]);
        v59 = v26;
        objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v26);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v32;
        v8 = v59;
        v13 = (void *)objc_msgSend(v58, "initWithFormat:", CFSTR("streamHealth failed: %@ for segment: %@, calculated crc: %d frame crc: %d offset: %d"), CFSTR("BMStreamHealthErrorCheckSumMismatch"), v12, Checksum, v65, v23);
        v78 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v57;
        v61 = 4;
        goto LABEL_45;
      }
LABEL_20:
      v37 = 1;
      a6 = v70;
      goto LABEL_25;
    }
    v37 = 1;
LABEL_24:
    if (HIDWORD(v28) >= 5)
    {
      v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v71 = v69;
      v54 = objc_alloc(MEMORY[0x1E0CB3940]);
      v55 = v26;
      objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v26);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v55;
      v13 = (void *)objc_msgSend(v54, "initWithFormat:", CFSTR("streamHealth failed: %@ for segment: %@, frame state:%d"), CFSTR("BMStreamHealthErrorUnrecognizedState"), v12, HIDWORD(v28));
      v72 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v53;
      v48 = 6;
      goto LABEL_43;
    }
LABEL_25:
    v23 = v23 + (((_DWORD)v28 + 7) & 0xFFFFFFF8) + 32;
    v8 = v26;
    if (v23 > v25)
      v24 = objc_msgSend(v7, "bytesUsed") - 56;
    v25 = v24 - 8;
    if (v23 > (int)v24 - 8 || !v37)
      goto LABEL_35;
  }
  v33 = *(unsigned int *)(bm_frame_header_infoV1((uint64_t)v27) + 16);
  if (!(_DWORD)v33)
  {
    v34 = (unsigned __int8 *)bm_frame_bytesV1((uint64_t)v27);
    if ((int)v28 < 1)
      goto LABEL_20;
    v35 = v28;
    while (!*v34++)
    {
      if (!--v35)
      {
        v37 = 1;
        goto LABEL_23;
      }
    }
    v66 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v73 = v69;
    v38 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v26);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v38, "initWithFormat:", CFSTR("streamHealth failed: %@ for segment: %@, deleted frame data is not zero, offset: %d"), CFSTR("BMStreamHealthErrorDeletedFrameDataNotZero"), v68, v23);
    v74 = v39;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "initWithDomain:code:userInfo:", CFSTR("BiomeStreamHealth"), 12, v40);

    v37 = 0;
    v22 = (void *)v67;
LABEL_23:
    a6 = v70;
    goto LABEL_24;
  }
  v62 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v75 = v69;
  v63 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8 = v26;
  objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v63, "initWithFormat:", CFSTR("streamHealth failed: %@ for segment: %@, crc for deleted frame not zero: %#010X offset: %d"), CFSTR("BMStreamHealthErrorDeletedFrameCheckSumNotZero"), v12, v33, v23);
  v76 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v62;
  v61 = 11;
LABEL_45:
  v64 = objc_msgSend(v60, "initWithDomain:code:userInfo:", CFSTR("BiomeStreamHealth"), v61, v14);

  v22 = (void *)v64;
  a6 = v70;
LABEL_34:

  v37 = 0;
LABEL_35:
  if (a6 && v22)
    *a6 = objc_retainAutorelease(v22);

  return v37;
}

- (BOOL)verifyStreamHealthFromV2:(double)a3 to:(double)a4 frameStore:(id)a5 error:(id *)a6
{
  id v7;
  void *v8;
  unsigned int v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  int v20;
  int v21;
  int v22;
  int v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  _DWORD *v28;
  _DWORD *v29;
  uint64_t v30;
  unsigned int *v31;
  int v32;
  Bytef *v33;
  uLong Checksum;
  unsigned __int8 *v35;
  unint64_t v36;
  id v38;
  id v39;
  void *v40;
  id *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  id v48;
  id v49;
  id v50;
  id v51;
  uLong v52;
  id v53;
  id v54;
  void *v55;
  uint64_t v56;
  id v57;
  id v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  _QWORD v77[3];

  v77[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(v7, "segmentPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "bytesUsed");
  if (objc_msgSend(v7, "frameStoreSize") < (unint64_t)v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v76 = *MEMORY[0x1E0CB2D50];
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("streamHealth failed: %@ for segment: %@, bytesUsed: %d, frameStoreSize:%zu"), CFSTR("BMStreamHealthErrorBytesUsedBeyondFrameStoreSize"), v12, objc_msgSend(v7, "bytesUsed"), objc_msgSend(v7, "frameStoreSize"));
    v77[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, &v76, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v10;
    v16 = 5;
LABEL_24:
    v24 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("BiomeStreamHealth"), v16, v14);
    goto LABEL_25;
  }
  v17 = objc_msgSend(v7, "start");
  if (*(_DWORD *)(v17 - 32) != *(_DWORD *)"SEGB")
  {
    v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v74 = *MEMORY[0x1E0CB2D50];
    v19 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("streamHealth failed: %@ for segment: %@"), CFSTR("BMStreamHealthErrorSegmentMagicMismatch"), v12);
    v75 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18;
    v16 = 7;
    goto LABEL_24;
  }
  v20 = *(_DWORD *)(v17 - 16);
  if (v20 != objc_msgSend(v7, "datastoreVersion"))
  {
    v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v72 = *MEMORY[0x1E0CB2D50];
    v46 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v46, "initWithFormat:", CFSTR("streamHealth failed: %@ for segment: %@"), CFSTR("BMStreamHealthErrorDatastoreVersionMismatch"), v12);
    v73 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v45;
    v16 = 8;
    goto LABEL_24;
  }
  v21 = objc_msgSend(v7, "bytesUsed");
  v22 = objc_msgSend(v7, "atomicReadTotalFramesV2");
  if (v22 < 1)
  {
    v24 = 0;
    v27 = 1;
    goto LABEL_29;
  }
  v23 = v22;
  v24 = 0;
  v25 = 0;
  v26 = (v21 - 16 * v22 - 32);
  v61 = *MEMORY[0x1E0CB2D50];
  v27 = 1;
  while (1)
  {
    v28 = (_DWORD *)objc_msgSend(v7, "offsetTablePtrFromFrameNumberV2:", v25);
    v29 = v28;
    if ((v27 & 1) != 0)
    {
      if (v26 < ((*v28 + 3) & 0xFFFFFFFC))
      {
        v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v70 = v61;
        v49 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v49, "initWithFormat:", CFSTR("streamHealth failed: %@ for segment: %@ frame: %d"), CFSTR("BMStreamHealthErrorBadOffsetToByteAfterFrame"), v12, v25);
        v71 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v48;
        v56 = 9;
        goto LABEL_34;
      }
      if (v28[1] >= 5u)
      {
        v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v68 = v61;
        v51 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v51, "initWithFormat:", CFSTR("streamHealth failed: %@ for segment: %@, frame state:%d frame: %d"), CFSTR("BMStreamHealthErrorUnrecognizedState"), v12, v29[1], v25);
        v69 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v50;
        v56 = 6;
        goto LABEL_34;
      }
    }
    v30 = objc_msgSend(v7, "start");
    v31 = (unsigned int *)(v30 + objc_msgSend(v7, "frameOffsetFromOffsetTableV2:", v29));
    v32 = v29[1];
    if (v32 == 3)
      break;
    if (v32 == 1)
    {
      v33 = (Bytef *)bm_frame_bytesV2((uint64_t)v31);
      Checksum = bm_generateChecksum(v33, objc_msgSend(v7, "sizeOfFrameV2:", v25) - 8);
      if ((_DWORD)Checksum != *v31)
      {
        v52 = Checksum;
        v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v66 = v61;
        v54 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v54, "initWithFormat:", CFSTR("streamHealth failed: %@ for segment: %@, calculated crc: %d frame crc: %d frame: %d"), CFSTR("BMStreamHealthErrorCheckSumMismatch"), v12, v52, *v31, v25);
        v67 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v53;
        v56 = 4;
        goto LABEL_34;
      }
    }
LABEL_21:
    v25 = (v25 + 1);
    if ((_DWORD)v25 == v23)
      goto LABEL_26;
  }
  if (!*v31)
  {
    v35 = (unsigned __int8 *)bm_frame_bytesV2((uint64_t)v31);
    v36 = (objc_msgSend(v7, "sizeOfFrameV2:", v25) - 5) & 0xFFFFFFFFFFFFFFFCLL;
    if (v36)
    {
      while (!*v35++)
      {
        if (!--v36)
          goto LABEL_21;
      }
      v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v62 = v61;
      v39 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v8);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend(v39, "initWithFormat:", CFSTR("streamHealth failed: %@ for segment: %@, deleted frame data is not zero, frame: %d"), CFSTR("BMStreamHealthErrorDeletedFrameDataNotZero"), v60, v25);
      v63 = v40;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
      v41 = a6;
      v42 = v26;
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v38, "initWithDomain:code:userInfo:", CFSTR("BiomeStreamHealth"), 12, v43);

      v26 = v42;
      a6 = v41;

      v27 = 0;
      v24 = (id)v44;
    }
    goto LABEL_21;
  }
  v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v64 = v61;
  v58 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v58, "initWithFormat:", CFSTR("streamHealth failed: %@ for segment: %@, crc for deleted frame not zero: %#010X frame: %d"), CFSTR("BMStreamHealthErrorDeletedFrameCheckSumNotZero"), v12, *v31, v25);
  v65 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v57;
  v56 = 11;
LABEL_34:
  v59 = objc_msgSend(v55, "initWithDomain:code:userInfo:", CFSTR("BiomeStreamHealth"), v56, v14);

  v24 = (id)v59;
LABEL_25:

  v27 = 0;
LABEL_26:
  if (a6 && v24)
  {
    v24 = objc_retainAutorelease(v24);
    *a6 = v24;
  }
LABEL_29:

  return v27 & 1;
}

- (void)eventBodyClass
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 112);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_1(&dword_1A95BD000, a2, a3, "Data type not yet set for stream %{public}@, please switch to APIs that take eventDataClass as a parameter.", (uint8_t *)&v4);
  OUTLINED_FUNCTION_17();
}

- (void)writeEventWithEventBody:(NSObject *)a3 timestamp:outEventSize:outBookmark:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "streamId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = a1;
  v9 = 2112;
  v10 = v6;
  v11 = 2112;
  v12 = objc_msgSend(a2, "eventBodyClass");
  _os_log_fault_impl(&dword_1A95BD000, a3, OS_LOG_TYPE_FAULT, "Incoming event is of type: %@, while stream - %@ only accepts events of type: %@", (uint8_t *)&v7, 0x20u);

}

- (void)_removeEventsFrom:to:reason:policyID:pruneFutureEvents:shouldDeleteUsingBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_1A95BD000, v0, v1, "Stream has event with a timestamp in the future", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_removeEventsFrom:to:reason:policyID:pruneFutureEvents:shouldDeleteUsingBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_1A95BD000, v0, v1, "Should hold off on pruning future events because time looks like it needs an NTP server sync", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)writeEventData:dataVersion:timestamp:outBookmark:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0_1(&dword_1A95BD000, v0, v1, "Fail to write event due to nil event data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)writeEventBytes:(void *)a1 length:(NSObject *)a2 dataVersion:timestamp:outBookmark:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "streamPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_1A95BD000, a2, v4, "Failed to assign a frameStore for: %@", v5);

  OUTLINED_FUNCTION_20();
}

- (void)writeEventBytes:(void *)a1 length:(NSObject *)a2 dataVersion:timestamp:outBookmark:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "streamPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_1A95BD000, a2, v4, "Failed to open new segment for: %@", v5);

  OUTLINED_FUNCTION_20();
}

- (void)fetchEventFromFrameStore:atOffset:withOptions:callback:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_13_0();
  _os_log_debug_impl(&dword_1A95BD000, v0, OS_LOG_TYPE_DEBUG, "No more events and on last segment", v1, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)updateMetadata:(NSObject *)a3 pruningPolicy:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2_2(&dword_1A95BD000, a3, (uint64_t)a3, "updateMetadata: unable to update metadata file for %@", (uint8_t *)a2);

}

- (void)updateMetadata:(uint64_t)a3 pruningPolicy:(NSObject *)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_12_0(&dword_1A95BD000, a4, a3, "updateMetadata: eventBodyClass (%@) does not match existing class metadata (%@)", (uint8_t *)a3);
}

- (void)loadMetadata
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_2_2(&dword_1A95BD000, a2, a3, "Failed to determine class for stream %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_17();
}

- (void)saveMetadata:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0_1(&dword_1A95BD000, v0, v1, "Tombstone variant of BMStreamDatastore does not support saving metadata", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)saveMetadata:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0_1(&dword_1A95BD000, v0, v1, "Subscription variant of BMStreamDatastore does not support saving metadata", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)saveMetadata:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0_1(&dword_1A95BD000, v0, v1, "archivedDataWithRootObject returned nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)saveMetadata:(NSObject *)a3 .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  void *v3;
  void *v6;
  uint64_t v7;
  uint8_t v8[12];
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "metadataPath");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_1(), "privacyPathname:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_12_0(&dword_1A95BD000, a3, v7, "unable to write metadata to file: %{public}@ Err: %@", v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)saveMetadata:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_2(&dword_1A95BD000, v0, v1, "Unable to encode metadata. Err: %@", v2);
  OUTLINED_FUNCTION_17();
}

- (void)writeTombstoneEventWithSegmentName:offset:length:eventTimestamp:reason:policyID:outTombstoneBookmark:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_1A95BD000, v0, v1, "Failed to write tombstone", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
