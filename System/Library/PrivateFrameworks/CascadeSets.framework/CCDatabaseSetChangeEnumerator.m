@implementation CCDatabaseSetChangeEnumerator

- (CCDatabaseSetChangeEnumerator)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CCDatabaseSetChangeEnumerator)initWithSet:(id)a3 readAccess:(id)a4
{
  id v7;
  id v8;
  CCDatabaseSetChangeEnumerator *v9;
  CCDatabaseSetChangeEnumerator *v10;
  uint64_t v11;
  CCDatabaseReadOnlyAccess *databaseAccess;
  CCDatabaseSetStateReader *v13;
  CCDatabaseSetStateReader *stateReader;
  CCDatabaseSetChangeEnumerator *v15;
  NSObject *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CCDatabaseSetChangeEnumerator;
  v9 = -[CCDatabaseSetChangeEnumerator init](&v18, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_4;
  objc_storeStrong((id *)&v9->_set, a3);
  objc_msgSend(v8, "databaseReadAccessForSet:", v7);
  v11 = objc_claimAutoreleasedReturnValue();
  databaseAccess = v10->_databaseAccess;
  v10->_databaseAccess = (CCDatabaseReadOnlyAccess *)v11;

  if (!v10->_databaseAccess)
  {
    __biome_log_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CCDatabaseSetChangeEnumerator initWithSet:readAccess:].cold.1();
    goto LABEL_9;
  }
  v13 = -[CCDatabaseSetStateReader initWithDatabaseAccess:]([CCDatabaseSetStateReader alloc], "initWithDatabaseAccess:", v10->_databaseAccess);
  stateReader = v10->_stateReader;
  v10->_stateReader = v13;

  if (!v10->_stateReader)
  {
    __biome_log_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CCDatabaseSetChangeEnumerator initWithSet:readAccess:].cold.2();
LABEL_9:

    v15 = 0;
    goto LABEL_10;
  }
LABEL_4:
  v15 = v10;
LABEL_10:

  return v15;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "dealloc - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (BOOL)beginWithBookmark:(id)a3 error:(id *)a4
{
  id v6;
  int64_t v7;
  int64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  CKDistributedTimestampStateVector *v12;
  CKDistributedTimestampStateVector *lastContentStateVector;
  CKDistributedTimestampStateVector *v14;
  CKDistributedTimestampStateVector *lastMetaContentStateVector;
  BOOL v16;
  CKDistributedTimestampStateVector *v17;
  CKDistributedTimestampStateVector *v18;
  CKDistributedTimestampStateVector *v19;
  CKDistributedTimestampStateVector *v20;
  CKDistributedTimestampStateVector *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  objc_class *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[CCDatabaseSetChangeEnumerator resourceVersion](self, "resourceVersion");
  if (v7 != -1)
  {
    if (v6)
    {
      v8 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v6;
        v10 = +[CCSetChangeBookmark currentBookmarkVersion](CCSetChangeBookmark, "currentBookmarkVersion");
        if (-[NSObject bookmarkVersion](v9, "bookmarkVersion") == (_DWORD)v10)
        {
          v11 = -[NSObject resourceVersion](v9, "resourceVersion");
          if (v11 && v11 == v8)
          {
            -[NSObject contentVector](v9, "contentVector");
            v12 = (CKDistributedTimestampStateVector *)objc_claimAutoreleasedReturnValue();
            lastContentStateVector = self->_lastContentStateVector;
            self->_lastContentStateVector = v12;

            -[NSObject metaContentVector](v9, "metaContentVector");
            v14 = (CKDistributedTimestampStateVector *)objc_claimAutoreleasedReturnValue();
            lastMetaContentStateVector = self->_lastMetaContentStateVector;
            self->_lastMetaContentStateVector = v14;

            goto LABEL_12;
          }
          v43 = (void *)MEMORY[0x24BDD1540];
          v44 = *MEMORY[0x24BE0C990];
          v50 = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Database resource version (%lld) invalidates the bookmark provided: %@"), v8, v9);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v29;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v43;
          v37 = v44;
        }
        else
        {
          v33 = (void *)MEMORY[0x24BDD1540];
          v34 = *MEMORY[0x24BE0C990];
          v52 = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Current bookmark version requirement (%d) invalidates the bookmark provided: %@"), v10, v9);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v29;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v33;
          v37 = v34;
        }
        objc_msgSend(v36, "errorWithDomain:code:userInfo:", v37, 2, v35);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        CCSetError(a4, v45);

      }
      else
      {
        v25 = objc_alloc(MEMORY[0x24BDD1540]);
        v54 = *MEMORY[0x24BDD0FC8];
        v26 = (void *)MEMORY[0x24BDD17C8];
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v9 = objc_claimAutoreleasedReturnValue();
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("The provided bookmark was of class %@, but we expected %@"), v9, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = v30;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(v25, "initWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Set"), 2, v31);
        CCSetError(a4, v32);

      }
      v16 = 0;
      goto LABEL_25;
    }
    v17 = (CKDistributedTimestampStateVector *)objc_alloc_init((Class)getCKDistributedTimestampStateVectorClass_1());
    v18 = self->_lastContentStateVector;
    self->_lastContentStateVector = v17;

    v19 = (CKDistributedTimestampStateVector *)objc_alloc_init((Class)getCKDistributedTimestampStateVectorClass_1());
    v9 = self->_lastMetaContentStateVector;
    self->_lastMetaContentStateVector = v19;
LABEL_12:

    v20 = self->_lastContentStateVector;
    v21 = self->_lastMetaContentStateVector;
    v47 = 0;
    v16 = -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:](self, "imputeChangesSinceLastContentVector:lastMetaContentVector:error:", v20, v21, &v47);
    v22 = v47;
    v9 = v22;
    if (!v16)
    {
      -[NSObject domain](v22, "domain");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "isEqual:", CFSTR("com.apple.CascadeSets.Set")))
        v24 = 2 * (-[NSObject code](v9, "code") == 2);
      else
        v24 = 0;

      v38 = (void *)MEMORY[0x24BDD1540];
      v39 = *MEMORY[0x24BE0C990];
      v48 = *MEMORY[0x24BDD1398];
      v40 = v9;
      if (!v9)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v49 = v40;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "errorWithDomain:code:userInfo:", v39, v24, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      CCSetError(a4, v42);

      if (!v9)
    }
    goto LABEL_25;
  }
  __biome_log_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[CCDatabaseSetChangeEnumerator beginWithBookmark:error:].cold.1();
  v16 = 1;
LABEL_25:

  return v16;
}

- (BOOL)reset:(id *)a3
{
  CKDistributedTimestampStateVector *lastContentStateVector;
  CKDistributedTimestampStateVector *lastMetaContentStateVector;
  CKDistributedTimestampStateVector *contentContentsVector;
  CKDistributedTimestampStateVector *contentRemovalsVector;
  CKDistributedTimestampStateVector *metaContentContentsVector;
  CKDistributedTimestampStateVector *metaContentRemovalsVector;
  CCMutableSetChange *currentMutableSetChange;
  CCDatabaseSetStateVectorBuilder *seenContentBuilder;
  CCDatabaseSetStateVectorBuilder *seenMetaContentBuilder;
  CCDatabaseValueRowEnumerator *provenanceEnumerator;
  NSNumber *resourceVersion;
  NSNumber *lastDeltaDate;
  CCDatabaseDeviceMapping *deviceMapping;
  NSMutableDictionary *deviceCache;

  lastContentStateVector = self->_lastContentStateVector;
  self->_lastContentStateVector = 0;

  lastMetaContentStateVector = self->_lastMetaContentStateVector;
  self->_lastMetaContentStateVector = 0;

  contentContentsVector = self->_contentContentsVector;
  self->_contentContentsVector = 0;

  contentRemovalsVector = self->_contentRemovalsVector;
  self->_contentRemovalsVector = 0;

  metaContentContentsVector = self->_metaContentContentsVector;
  self->_metaContentContentsVector = 0;

  metaContentRemovalsVector = self->_metaContentRemovalsVector;
  self->_metaContentRemovalsVector = 0;

  currentMutableSetChange = self->_currentMutableSetChange;
  self->_currentMutableSetChange = 0;

  seenContentBuilder = self->_seenContentBuilder;
  self->_seenContentBuilder = 0;

  seenMetaContentBuilder = self->_seenMetaContentBuilder;
  self->_seenMetaContentBuilder = 0;

  provenanceEnumerator = self->_provenanceEnumerator;
  self->_provenanceEnumerator = 0;

  resourceVersion = self->_resourceVersion;
  self->_resourceVersion = 0;

  lastDeltaDate = self->_lastDeltaDate;
  self->_lastDeltaDate = 0;

  deviceMapping = self->_deviceMapping;
  self->_deviceMapping = 0;

  deviceCache = self->_deviceCache;
  self->_deviceCache = 0;

  return -[CCDatabaseSetChangeEnumerator _resetDatabaseAccess:](self, "_resetDatabaseAccess:", a3);
}

- (BOOL)_resetDatabaseAccess:(id *)a3
{
  CCDatabaseReadOnlyAccess *databaseAccess;
  char v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  databaseAccess = self->_databaseAccess;
  if (!databaseAccess)
  {
    v7 = 0;
    goto LABEL_9;
  }
  v15 = 0;
  v5 = -[CCDatabaseReadOnlyAccess reset:](databaseAccess, "reset:", &v15);
  v6 = v15;
  v7 = v6;
  if ((v5 & 1) != 0)
  {
LABEL_9:
    v13 = 1;
    goto LABEL_10;
  }
  v8 = (void *)MEMORY[0x24BDD1540];
  v9 = *MEMORY[0x24BE0C990];
  v16[0] = *MEMORY[0x24BDD1398];
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[1] = *MEMORY[0x24BDD0BA0];
  v17[0] = v10;
  v17[1] = CFSTR("Failed to reset database");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CCSetError(a3, v12);

  if (!v7)
  v13 = 0;
LABEL_10:

  return v13;
}

- (id)next
{
  __int128 v2;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  unsigned __int8 v20;
  CCMutableSetChange *currentMutableSetChange;
  CCMutableSetChange *v22;
  void *v23;
  CCSharedItem *v24;
  CCMutableSetChange *v25;
  CCMutableSetChange *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  CCItemInstance *v39;
  void *v40;
  void *v41;
  CCItemInstance *v42;
  void *v43;
  CCItemInstance *v44;
  void *v45;
  CCItemInstance *v46;
  void *v47;
  void *v48;
  CCItemInstance *v49;
  void *v50;
  void *v51;
  CCMutableSetChange *v52;
  CCMutableSetChange *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  CCMutableSetChange *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  __int128 v69;
  void *v70;
  void *v71;
  void *v72;
  unsigned __int8 v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *log;
  void *v78;
  CCMutableSetChange *v79;
  uint8_t buf[4];
  NSObject *v81;
  __int16 v82;
  NSObject *v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  if (!self->_provenanceEnumerator)
  {
    __biome_log_for_category();
    v79 = (CCMutableSetChange *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v79->super, OS_LOG_TYPE_FAULT))
      -[CCDatabaseSetChangeEnumerator next].cold.1();
    v51 = 0;
    goto LABEL_66;
  }
  v4 = 0;
  v5 = 0x2542BD000uLL;
  *(_QWORD *)&v2 = 138412546;
  v69 = v2;
  while (1)
  {
    v6 = v4;
    -[CCDatabaseValueRowEnumerator next](self->_provenanceEnumerator, "next", v69);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)(v5 + 3696), "joinedProvenanceFromDatabaseValueRow:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      break;
    v8 = (void *)MEMORY[0x23B82079C]();
    objc_msgSend(v4, "provenance");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "provenance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentHash");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "provenance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "instanceHash");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "contentData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metaContentData");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      __biome_log_for_category();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v81 = v9;
        _os_log_error_impl(&dword_237B25000, v15, OS_LOG_TYPE_ERROR, "missing content hash, provenance row is not enumerable: %@", buf, 0xCu);
      }
      v79 = 0;
      goto LABEL_45;
    }
    v76 = v13;
    -[NSObject deviceRowId](v9, "deviceRowId");
    v15 = objc_claimAutoreleasedReturnValue();
    -[CCDatabaseDeviceMapping siteIdentifierForDeviceRowId:](self->_deviceMapping, "siteIdentifierForDeviceRowId:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      __biome_log_for_category();
      log = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v69;
        v81 = v15;
        v82 = 2112;
        v83 = v9;
        _os_log_error_impl(&dword_237B25000, log, OS_LOG_TYPE_ERROR, "could not find device with rowId: %@ for provenance row: %@", buf, 0x16u);
      }
      v79 = 0;
      goto LABEL_44;
    }
    v75 = v14;
    -[CCDatabaseSetChangeEnumerator _cachedDeviceWithRowId:](self, "_cachedDeviceWithRowId:", v15);
    log = objc_claimAutoreleasedReturnValue();
    -[NSObject contentState](v9, "contentState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntValue");

    -[NSObject metaContentState](v9, "metaContentState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedIntValue");

    currentMutableSetChange = self->_currentMutableSetChange;
    v72 = v8;
    v73 = v20;
    if (!currentMutableSetChange)
    {
      v79 = 0;
LABEL_21:
      -[CCDatabaseSetChangeEnumerator contentMessageFromContentData:](self, "contentMessageFromContentData:", v75);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[CCSharedItem initWithSharedIdentifier:content:]([CCSharedItem alloc], "initWithSharedIdentifier:content:", v11, v23);
      v25 = -[CCMutableSetChange initWithSharedItem:changeType:]([CCMutableSetChange alloc], "initWithSharedItem:changeType:", v24, 1);
      v26 = self->_currentMutableSetChange;
      self->_currentMutableSetChange = v25;

      goto LABEL_22;
    }
    if (-[CCMutableSetChange containsContentHash:](currentMutableSetChange, "containsContentHash:", v11))
    {
      v79 = 0;
    }
    else
    {
      if (-[CCMutableSetChange containsChanges](self->_currentMutableSetChange, "containsChanges"))
        v79 = self->_currentMutableSetChange;
      else
        v79 = 0;
      v22 = self->_currentMutableSetChange;
      self->_currentMutableSetChange = 0;

    }
    if (!self->_currentMutableSetChange)
      goto LABEL_21;
LABEL_22:
    -[NSObject contentSequenceNumber](v9, "contentSequenceNumber");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "unsignedIntegerValue");

    v29 = objc_msgSend(objc_alloc((Class)getCKDistributedTimestampClass()), "initWithSiteIdentifierObject:clockValue:", v16, v28);
    v30 = v18;
    v71 = (void *)v29;
    if (v18 == 2)
    {
      v14 = v75;
      if (-[CKDistributedTimestampStateVector atomStateForTimestamp:](self->_contentRemovalsVector, "atomStateForTimestamp:", v29) == 2)
      {
        -[CCMutableSetChange removedDevices](self->_currentMutableSetChange, "removedDevices");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", log);

        -[CCDatabaseSetStateVectorBuilder addClockValue:withAtomState:forDeviceRowId:](self->_seenContentBuilder, "addClockValue:withAtomState:forDeviceRowId:", v28, 2, v15);
      }
LABEL_30:
      v32 = v73;
      goto LABEL_31;
    }
    v14 = v75;
    if (v30 != 1)
      goto LABEL_30;
    if (-[CKDistributedTimestampStateVector atomStateForTimestamp:](self->_contentContentsVector, "atomStateForTimestamp:", v29) == 1)
    {
      -[CCMutableSetChange addedDevices](self->_currentMutableSetChange, "addedDevices");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObject:", log);

      -[CCDatabaseSetStateVectorBuilder addClockValue:withAtomState:forDeviceRowId:](self->_seenContentBuilder, "addClockValue:withAtomState:forDeviceRowId:", v28, 1, v15);
    }
    v32 = v73;
    if (v73 != 2)
    {
      -[CCMutableSetChange allDevices](self->_currentMutableSetChange, "allDevices");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", log);

    }
LABEL_31:
    -[NSObject metaContentSequenceNumber](v9, "metaContentSequenceNumber");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      -[NSObject metaContentSequenceNumber](v9, "metaContentSequenceNumber");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "unsignedIntegerValue");

      v38 = (void *)objc_msgSend(objc_alloc((Class)getCKDistributedTimestampClass()), "initWithSiteIdentifierObject:clockValue:", v16, v37);
      if (v32 == 2)
      {
        if (-[CKDistributedTimestampStateVector atomStateForTimestamp:](self->_metaContentRemovalsVector, "atomStateForTimestamp:", v38) == 2)
        {
          v74 = v38;
          v44 = -[CCItemInstance initWithSharedIdentifier:instanceIdentifier:content:metaContent:]([CCItemInstance alloc], "initWithSharedIdentifier:instanceIdentifier:content:metaContent:", v11, v76, 0, 0);
          -[CCMutableSetChange removedLocalInstances](self->_currentMutableSetChange, "removedLocalInstances");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "addObject:", v44);

          -[CCDatabaseSetStateVectorBuilder addClockValue:withAtomState:forDeviceRowId:](self->_seenMetaContentBuilder, "addClockValue:withAtomState:forDeviceRowId:", v37, 2, v15);
          goto LABEL_41;
        }
      }
      else if (v32 == 1)
      {
        v74 = v38;
        if (-[CKDistributedTimestampStateVector atomStateForTimestamp:](self->_metaContentContentsVector, "atomStateForTimestamp:", v38) == 1&& v78)
        {
          -[CCDatabaseSetChangeEnumerator metaContentMessageFromMetaContentData:](self, "metaContentMessageFromMetaContentData:", v78);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = [CCItemInstance alloc];
          -[CCMutableSetChange sharedItem](self->_currentMutableSetChange, "sharedItem");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "content");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = -[CCItemInstance initWithSharedIdentifier:instanceIdentifier:content:metaContent:](v39, "initWithSharedIdentifier:instanceIdentifier:content:metaContent:", v11, v76, v41, v70);

          -[CCMutableSetChange addedLocalInstances](self->_currentMutableSetChange, "addedLocalInstances");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addObject:", v42);

          -[CCDatabaseSetStateVectorBuilder addClockValue:withAtomState:forDeviceRowId:](self->_seenMetaContentBuilder, "addClockValue:withAtomState:forDeviceRowId:", v37, 1, v15);
          goto LABEL_40;
        }
        if (v78)
        {
LABEL_40:
          -[CCDatabaseSetChangeEnumerator metaContentMessageFromMetaContentData:](self, "metaContentMessageFromMetaContentData:", v78);
          v44 = (CCItemInstance *)objc_claimAutoreleasedReturnValue();
          v46 = [CCItemInstance alloc];
          -[CCMutableSetChange sharedItem](self->_currentMutableSetChange, "sharedItem");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "content");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = -[CCItemInstance initWithSharedIdentifier:instanceIdentifier:content:metaContent:](v46, "initWithSharedIdentifier:instanceIdentifier:content:metaContent:", v11, v76, v48, v44);

          -[CCMutableSetChange allLocalInstances](self->_currentMutableSetChange, "allLocalInstances");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObject:", v49);

LABEL_41:
          v38 = v74;
        }
      }

      v14 = v75;
    }

    v5 = 0x2542BD000;
    v8 = v72;
LABEL_44:

    v13 = v76;
LABEL_45:

    objc_autoreleasePoolPop(v8);
    if (v79)
      goto LABEL_54;
  }
  v52 = self->_currentMutableSetChange;
  if (v52 && -[CCMutableSetChange containsChanges](v52, "containsChanges"))
  {
    v79 = self->_currentMutableSetChange;
    v53 = self->_currentMutableSetChange;
    self->_currentMutableSetChange = 0;

  }
  else
  {
    v79 = 0;
  }
LABEL_54:
  -[CCMutableSetChange addedDevices](v79, "addedDevices");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCMutableSetChange removedDevices](v79, "removedDevices");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v54, "isEqual:", v55);

  if (v56)
  {
    -[CCMutableSetChange addedDevices](v79, "addedDevices");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "removeAllObjects");

    -[CCMutableSetChange removedDevices](v79, "removedDevices");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "removeAllObjects");

    v59 = v79;
    v60 = 1;
    goto LABEL_56;
  }
  -[CCMutableSetChange removedDevices](v79, "removedDevices");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v61, "count"))
  {
    -[CCMutableSetChange allDevices](v79, "allDevices");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "count");

    if (!v63)
    {
      v59 = v79;
      v60 = 2;
      goto LABEL_56;
    }
  }
  else
  {

  }
  -[CCMutableSetChange addedDevices](v79, "addedDevices");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCMutableSetChange allDevices](v79, "allDevices");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v64, "isEqual:", v65) & 1) != 0)
  {
    -[CCMutableSetChange removedDevices](v79, "removedDevices");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "count");

    if (!v67)
    {
      v59 = v79;
      v60 = 0;
LABEL_56:
      -[CCMutableSetChange setSharedItemChangeType:](v59, "setSharedItemChangeType:", v60);
    }
  }
  else
  {

  }
  v51 = (void *)-[CCMutableSetChange copy](v79, "copy");

LABEL_66:
  return v51;
}

- (id)nextBookmark
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CCSetChangeBookmark *v7;

  getCKDistributedTimestampStateVectorClass_1();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "unionStateVector:", self->_lastContentStateVector);
  -[CCDatabaseSetStateVectorBuilder build](self->_seenContentBuilder, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionStateVector:", v4);

  getCKDistributedTimestampStateVectorClass_1();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "unionStateVector:", self->_lastMetaContentStateVector);
  -[CCDatabaseSetStateVectorBuilder build](self->_seenMetaContentBuilder, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionStateVector:", v6);

  v7 = -[CCSetChangeBookmark initWithContentVector:metaContentVector:resourceVersion:lastDeltaDate:set:]([CCSetChangeBookmark alloc], "initWithContentVector:metaContentVector:resourceVersion:lastDeltaDate:set:", v3, v5, -[CCDatabaseSetChangeEnumerator resourceVersion](self, "resourceVersion"), -[CCDatabaseSetChangeEnumerator lastDeltaDate](self, "lastDeltaDate"), self->_set);
  return v7;
}

- (id)sharedItemCount:(id *)a3
{
  CCDatabaseSetStateReader *stateReader;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  stateReader = self->_stateReader;
  v16 = 0;
  -[CCDatabaseSetStateReader sharedItemCount:](stateReader, "sharedItemCount:", &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  v8 = v7;
  if (!v6)
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BE0C990];
    v17[0] = *MEMORY[0x24BDD1398];
    v11 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17[1] = *MEMORY[0x24BDD0BA0];
    v18[0] = v11;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to count shared items in set: %@"), self->_set);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a3, v14);

    if (!v8)
  }

  return v6;
}

- (id)itemInstanceCount:(id *)a3
{
  CCDatabaseSetStateReader *stateReader;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  stateReader = self->_stateReader;
  v16 = 0;
  -[CCDatabaseSetStateReader itemInstanceCount:](stateReader, "itemInstanceCount:", &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  v8 = v7;
  if (!v6)
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BE0C990];
    v17[0] = *MEMORY[0x24BDD1398];
    v11 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17[1] = *MEMORY[0x24BDD0BA0];
    v18[0] = v11;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to count item instances in set: %@"), self->_set);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a3, v14);

    if (!v8)
  }

  return v6;
}

- (int64_t)resourceVersion
{
  NSNumber *resourceVersion;
  CCDatabaseSetStateReader *stateReader;
  NSNumber *v5;
  id v6;
  NSNumber *v7;
  NSObject *v9;
  id v10;

  resourceVersion = self->_resourceVersion;
  if (resourceVersion)
    return -[NSNumber longLongValue](resourceVersion, "longLongValue");
  stateReader = self->_stateReader;
  v10 = 0;
  -[CCDatabaseSetStateReader resourceVersion:](stateReader, "resourceVersion:", &v10);
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = self->_resourceVersion;
  self->_resourceVersion = v5;

  if (self->_resourceVersion)
  {

    resourceVersion = self->_resourceVersion;
    return -[NSNumber longLongValue](resourceVersion, "longLongValue");
  }
  __biome_log_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[CCDatabaseSetChangeEnumerator resourceVersion].cold.1((uint64_t)self);

  return -1;
}

- (int64_t)lastDeltaDate
{
  NSNumber *lastDeltaDate;
  CCDatabaseSetStateReader *stateReader;
  NSNumber *v5;
  id v6;
  NSNumber *v7;
  NSObject *v9;
  id v10;

  lastDeltaDate = self->_lastDeltaDate;
  if (lastDeltaDate)
    return -[NSNumber longLongValue](lastDeltaDate, "longLongValue");
  stateReader = self->_stateReader;
  v10 = 0;
  -[CCDatabaseSetStateReader lastDeltaDate:](stateReader, "lastDeltaDate:", &v10);
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = self->_lastDeltaDate;
  self->_lastDeltaDate = v5;

  if (self->_lastDeltaDate)
  {
LABEL_3:

    lastDeltaDate = self->_lastDeltaDate;
    return -[NSNumber longLongValue](lastDeltaDate, "longLongValue");
  }
  if (!v6)
  {
    self->_lastDeltaDate = (NSNumber *)&unk_2509A1BF8;

    goto LABEL_3;
  }
  __biome_log_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[CCDatabaseSetChangeEnumerator lastDeltaDate].cold.1((uint64_t)self);

  return -1;
}

- (BOOL)isBookmarkUpToDate:(id)a3
{
  id v4;
  int64_t v5;
  BOOL v6;
  NSObject *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CCDatabaseSetChangeEnumerator isBookmarkUpToDate:].cold.1((uint64_t)v4, v7);

    goto LABEL_7;
  }
  v5 = -[CCDatabaseSetChangeEnumerator lastDeltaDate](self, "lastDeltaDate");
  if (v5 < 0)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v6 = v5 == objc_msgSend(v4, "lastDeltaDate");
LABEL_8:

  return v6;
}

- (BOOL)imputeChangesSinceLastContentVector:(id)a3 lastMetaContentVector:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  CCDatabaseSetStateReader *stateReader;
  BOOL v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  char v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  CCDatabaseSetStateReader *v33;
  BOOL v34;
  CCDatabaseSetStateReader *v35;
  BOOL v36;
  CCDatabaseSetStateVectorBuilder *v37;
  CCDatabaseSetStateVectorBuilder *seenContentBuilder;
  CCDatabaseSetStateVectorBuilder *v39;
  CCDatabaseSetStateVectorBuilder *seenMetaContentBuilder;
  void *v41;
  CCDatabaseSetStateReader *v42;
  CCDatabaseSetStateVectorBuilder *v43;
  CCDatabaseSetStateVectorBuilder *v44;
  CCDatabaseDeviceMapping *deviceMapping;
  uint64_t v46;
  id v47;
  CCDatabaseValueRowEnumerator **p_provenanceEnumerator;
  CCDatabaseValueRowEnumerator *provenanceEnumerator;
  BOOL v50;
  BOOL v51;
  void *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *contexta;
  id context;
  void *v65;
  void *v66;
  id v67;
  id obj;
  id v69;
  id v70;
  id v71;
  void *v72;
  id v74;
  _QWORD v75[5];
  id v76;
  _QWORD v77[5];
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  char v82;
  id v83;
  id v84;
  id v85;
  id v86[2];

  v7 = a3;
  v8 = a4;
  stateReader = self->_stateReader;
  v85 = 0;
  v86[0] = 0;
  v83 = 0;
  v84 = 0;
  v10 = -[CCDatabaseSetStateReader constructStateVectorsFromDatabaseOutContent:outMetaContent:outDeviceMapping:error:](stateReader, "constructStateVectorsFromDatabaseOutContent:outMetaContent:outDeviceMapping:error:", v86, &v85, &v84, &v83);
  v11 = v86[0];
  v12 = v85;
  v13 = v84;
  v14 = v84;
  v15 = v83;
  __biome_log_for_category();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v10)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.15();

    __biome_log_for_category();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.12();

    if (v11)
    {
      __biome_log_for_category();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v12)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.16();

        __biome_log_for_category();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.15();

        objc_msgSend(v7, "clockVector");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v11, "isGreaterThanOrEqualToVector:");
        __biome_log_for_category();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if ((v22 & 1) == 0)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
            -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.14((uint64_t)v11);

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Set"), 2, 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          CCSetError(a5, v26);
          v51 = 0;
          goto LABEL_70;
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.13();

        __biome_log_for_category();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.12();

        objc_msgSend(v8, "clockVector");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "isGreaterThanOrEqualToVector:", v26) & 1) == 0)
        {
          __biome_log_for_category();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
            -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.11((uint64_t)v12);

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Set"), 2, 0);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          CCSetError(a5, v57);
          v51 = 0;
          goto LABEL_69;
        }
        v27 = (void *)objc_msgSend(objc_alloc((Class)getCKMergeableDeltaVectorsClass()), "initWithPreviousStateVector:currentStateVector:", v7, v11);
        objc_msgSend(v27, "contents");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v66 = v27;
        objc_msgSend(v27, "removals");
        v71 = (id)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(objc_alloc((Class)getCKMergeableDeltaVectorsClass()), "initWithPreviousStateVector:currentStateVector:", v8, v12);
        objc_msgSend(v28, "contents");
        v67 = (id)objc_claimAutoreleasedReturnValue();
        v65 = v28;
        objc_msgSend(v28, "removals");
        v70 = (id)objc_claimAutoreleasedReturnValue();
        __biome_log_for_category();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.10();

        __biome_log_for_category();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.9();

        __biome_log_for_category();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.8();
        v62 = v26;

        __biome_log_for_category();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.7();

        v79 = 0;
        v80 = &v79;
        v81 = 0x2020000000;
        v82 = 1;
        contexta = (void *)MEMORY[0x23B82079C]();
        v33 = self->_stateReader;
        v78 = 0;
        v77[0] = MEMORY[0x24BDAC760];
        v77[1] = 3221225472;
        v77[2] = __97__CCDatabaseSetChangeEnumerator_imputeChangesSinceLastContentVector_lastMetaContentVector_error___block_invoke;
        v77[3] = &unk_250990C80;
        v77[4] = &v79;
        v34 = -[CCDatabaseSetStateReader enumerateProvenanceRecordsForStateVector:withType:selectAtomsInState:skipOverAtomsInState:deviceMapping:error:usingBlock:](v33, "enumerateProvenanceRecordsForStateVector:withType:selectAtomsInState:skipOverAtomsInState:deviceMapping:error:usingBlock:", v71, 0, 2, 1, v14, &v78, v77);
        v69 = v78;
        objc_autoreleasePoolPop(contexta);
        if (!v34)
        {
          __biome_log_for_category();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.6();

          CCSetError(a5, v69);
          v51 = 0;
          goto LABEL_68;
        }
        v61 = (void *)MEMORY[0x23B82079C]();
        v35 = self->_stateReader;
        v76 = 0;
        v75[0] = MEMORY[0x24BDAC760];
        v75[1] = 3221225472;
        v75[2] = __97__CCDatabaseSetChangeEnumerator_imputeChangesSinceLastContentVector_lastMetaContentVector_error___block_invoke_27;
        v75[3] = &unk_250990C80;
        v75[4] = &v79;
        v36 = -[CCDatabaseSetStateReader enumerateProvenanceRecordsForStateVector:withType:selectAtomsInState:skipOverAtomsInState:deviceMapping:error:usingBlock:](v35, "enumerateProvenanceRecordsForStateVector:withType:selectAtomsInState:skipOverAtomsInState:deviceMapping:error:usingBlock:", v70, 1, 2, 1, v14, &v76, v75);
        context = v76;
        objc_autoreleasePoolPop(v61);
        if (!v36)
        {
          __biome_log_for_category();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.5();

          CCSetError(a5, context);
          v51 = 0;
          goto LABEL_67;
        }
        if (*((_BYTE *)v80 + 24))
        {
          objc_storeStrong((id *)&self->_contentContentsVector, obj);
          objc_storeStrong((id *)&self->_contentRemovalsVector, v71);
          objc_storeStrong((id *)&self->_metaContentContentsVector, v67);
          objc_storeStrong((id *)&self->_metaContentRemovalsVector, v70);
          objc_storeStrong((id *)&self->_deviceMapping, v13);
          v37 = -[CCDatabaseSetStateVectorBuilder initWithDeviceMapping:missingAtomsImplied:]([CCDatabaseSetStateVectorBuilder alloc], "initWithDeviceMapping:missingAtomsImplied:", self->_deviceMapping, 0);
          seenContentBuilder = self->_seenContentBuilder;
          self->_seenContentBuilder = v37;

          v39 = -[CCDatabaseSetStateVectorBuilder initWithDeviceMapping:missingAtomsImplied:]([CCDatabaseSetStateVectorBuilder alloc], "initWithDeviceMapping:missingAtomsImplied:", self->_deviceMapping, 0);
          seenMetaContentBuilder = self->_seenMetaContentBuilder;
          self->_seenMetaContentBuilder = v39;

          v41 = (void *)MEMORY[0x23B82079C]();
          v42 = self->_stateReader;
          v43 = self->_seenContentBuilder;
          v44 = self->_seenMetaContentBuilder;
          deviceMapping = self->_deviceMapping;
          v74 = 0;
          -[CCDatabaseSetStateReader provenanceRecordEnumeratorForContentDeltaVector:metaContentDeltaVector:seenContentBuilder:seenMetaContentBuilder:deviceMapping:error:](v42, "provenanceRecordEnumeratorForContentDeltaVector:metaContentDeltaVector:seenContentBuilder:seenMetaContentBuilder:deviceMapping:error:", v66, v65, v43, v44, deviceMapping, &v74);
          v46 = objc_claimAutoreleasedReturnValue();
          v47 = v74;
          objc_autoreleasePoolPop(v41);
          provenanceEnumerator = self->_provenanceEnumerator;
          p_provenanceEnumerator = &self->_provenanceEnumerator;
          *p_provenanceEnumerator = (CCDatabaseValueRowEnumerator *)v46;

          if (*p_provenanceEnumerator)
            v50 = v47 == 0;
          else
            v50 = 0;
          v51 = v50;
          v52 = v47;
          if (!v50)
          {
            __biome_log_for_category();
            v26 = v62;
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.4(p_provenanceEnumerator);

            CCSetError(a5, v52);
            v51 = 0;
            goto LABEL_66;
          }
        }
        else
        {
          __biome_log_for_category();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.3();

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Set"), 2, 0);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          CCSetError(a5, v52);
          v51 = 0;
        }
        v26 = v62;
LABEL_66:

LABEL_67:
LABEL_68:
        v57 = v66;

        _Block_object_dispose(&v79, 8);
LABEL_69:

LABEL_70:
        goto LABEL_49;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.2();

    }
    else
    {
      __biome_log_for_category();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.1();

    }
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CCDatabaseSetChangeEnumerator imputeChangesSinceLastContentVector:lastMetaContentVector:error:].cold.19();

    CCSetError(a5, v15);
  }
  v51 = 0;
LABEL_49:

  return v51;
}

void __97__CCDatabaseSetChangeEnumerator_imputeChangesSinceLastContentVector_lastMetaContentVector_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "contentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "unsignedIntValue") == 2)
  {
    objc_msgSend(v7, "contentHash");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      *a3 = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    }
  }
  else
  {

  }
}

void __97__CCDatabaseSetChangeEnumerator_imputeChangesSinceLastContentVector_lastMetaContentVector_error___block_invoke_27(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "metaContentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "unsignedIntValue") == 2)
  {
    objc_msgSend(v7, "instanceHash");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      *a3 = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    }
  }
  else
  {

  }
}

- (id)contentMessageFromContentData:(id)a3
{
  CCSet *set;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;

  if (a3)
  {
    set = self->_set;
    v4 = a3;
    v9 = 0;
    +[CCItemMessage contentMessageForItemType:data:error:](CCItemMessage, "contentMessageForItemType:data:error:", -[CCSet itemType](set, "itemType"), v4, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v9;
    if (!v5)
    {
      __biome_log_for_category();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CCDatabaseSetChangeEnumerator contentMessageFromContentData:].cold.1();

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)metaContentMessageFromMetaContentData:(id)a3
{
  CCSet *set;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;

  if (a3)
  {
    set = self->_set;
    v4 = a3;
    v9 = 0;
    +[CCItemMessage metaContentMessageForItemType:data:error:](CCItemMessage, "metaContentMessageForItemType:data:error:", -[CCSet itemType](set, "itemType"), v4, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v9;
    if (!v5)
    {
      __biome_log_for_category();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CCDatabaseSetChangeEnumerator contentMessageFromContentData:].cold.1();

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_cachedDeviceWithRowId:(id)a3
{
  id v4;
  CCDevice *v5;
  void *v6;
  CCDevice *v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *deviceCache;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_deviceCache, "objectForKey:", v4);
  v5 = (CCDevice *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[CCDatabaseDeviceMapping deviceRecordForDeviceRowId:](self->_deviceMapping, "deviceRecordForDeviceRowId:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [CCDevice alloc];
    objc_msgSend(v6, "deviceId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CCDevice initWithIdentifier:options:](v7, "initWithIdentifier:options:", v8, objc_msgSend(v6, "options"));

    if (!self->_deviceCache)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      deviceCache = self->_deviceCache;
      self->_deviceCache = v9;

    }
    if (v5)
      -[NSMutableDictionary setObject:forKey:](self->_deviceCache, "setObject:forKey:", v5, v4);

  }
  return v5;
}

+ (unint64_t)sharedItemCountFromBookmark:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_msgSend(v3, "contentVector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__CCDatabaseSetChangeEnumerator_sharedItemCountFromBookmark___block_invoke;
  v7[3] = &unk_250990CA8;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateAllClockValuesUsingBlock:", v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __61__CCDatabaseSetChangeEnumerator_sharedItemCountFromBookmark___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  if (a6 == 1)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += a4;
  return result;
}

+ (unint64_t)localItemInstanceCountFromBookmark:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_msgSend(v3, "metaContentVector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__CCDatabaseSetChangeEnumerator_localItemInstanceCountFromBookmark___block_invoke;
  v7[3] = &unk_250990CA8;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateAllClockValuesUsingBlock:", v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __68__CCDatabaseSetChangeEnumerator_localItemInstanceCountFromBookmark___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  if (a6 == 1)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += a4;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCache, 0);
  objc_storeStrong((id *)&self->_deviceMapping, 0);
  objc_storeStrong((id *)&self->_lastDeltaDate, 0);
  objc_storeStrong((id *)&self->_resourceVersion, 0);
  objc_storeStrong((id *)&self->_seenMetaContentBuilder, 0);
  objc_storeStrong((id *)&self->_seenContentBuilder, 0);
  objc_storeStrong((id *)&self->_currentMutableSetChange, 0);
  objc_storeStrong((id *)&self->_provenanceEnumerator, 0);
  objc_storeStrong((id *)&self->_metaContentRemovalsVector, 0);
  objc_storeStrong((id *)&self->_metaContentContentsVector, 0);
  objc_storeStrong((id *)&self->_contentRemovalsVector, 0);
  objc_storeStrong((id *)&self->_contentContentsVector, 0);
  objc_storeStrong((id *)&self->_lastMetaContentStateVector, 0);
  objc_storeStrong((id *)&self->_lastContentStateVector, 0);
  objc_storeStrong((id *)&self->_stateReader, 0);
  objc_storeStrong((id *)&self->_databaseAccess, 0);
  objc_storeStrong((id *)&self->_set, 0);
}

- (void)initWithSet:readAccess:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_237B25000, v0, v1, "Failed to obtain database read access.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithSet:readAccess:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_237B25000, v0, v1, "State reader creation failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)beginWithBookmark:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_237B25000, v0, v1, "Could not determine a valid resource version for the current set - returning no results from enumeration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)next
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_237B25000, v0, OS_LOG_TYPE_FAULT, "provenance enumerator was not initialized, returning nil results", v1, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)resourceVersion
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 8);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_0(&dword_237B25000, v1, v2, "failed to read resource version for set: %@ error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)lastDeltaDate
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 8);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_0(&dword_237B25000, v1, v2, "failed to read last delta date for set: %@ error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)isBookmarkUpToDate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_237B25000, a2, OS_LOG_TYPE_ERROR, "Unexpected bookmark class: %@", v5, 0xCu);

}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_237B25000, v0, v1, "The current stateVector is missing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_237B25000, v0, v1, "The current metaContentStateVector is missing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_237B25000, v0, v1, "Bookmark is invalid and cannot be resumed from as it is too old and tombstones have been cleaned up", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)imputeChangesSinceLastContentVector:(_QWORD *)a1 lastMetaContentVector:error:.cold.4(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_0(&dword_237B25000, v1, v2, "Could not construct provenance enumerator %@ with error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Failed to enumerate provenance rows for tombstoned metacontent: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Failed to enumerate provenance rows for tombstoned content: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_237B25000, v0, v1, "metaContentRemovalsVector %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_237B25000, v0, v1, "metaContentContentsVector %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_237B25000, v0, v1, "contentRemovalsVector %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_237B25000, v0, v1, "contentContentsVector %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)imputeChangesSinceLastContentVector:(uint64_t)a1 lastMetaContentVector:error:.cold.11(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9(&dword_237B25000, v1, v2, "Current meta content state vector has regressed from last known client provided state vector current:%@ last:%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_237B25000, v0, v1, "metaContentStateVector %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_237B25000, v0, v1, "lastMetaContentVector %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)imputeChangesSinceLastContentVector:(uint64_t)a1 lastMetaContentVector:error:.cold.14(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9(&dword_237B25000, v1, v2, "Current content state vector has regressed from last known client provided state vector current:%@ last:%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_237B25000, v0, v1, "contentStateVector %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_237B25000, v0, v1, "lastContentVector %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)imputeChangesSinceLastContentVector:lastMetaContentVector:error:.cold.19()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Failed to construct content and metacontent state vectors from database: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)contentMessageFromContentData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "error initializing metacontent message: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
