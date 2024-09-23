@implementation BMStoreEnumerator

- (void)setFrameStoreOffset:(unint64_t)a3
{
  self->_frameStoreOffset = a3;
}

- (void)setEndTime:(double)a3 maxEvents:(unint64_t)a4 lastN:(unint64_t)a5 reverse:(BOOL)a6
{
  uint64_t v6;
  unint64_t v7;

  self->_endTime = a3;
  self->_maxEvents = a4;
  v6 = 8;
  if (!a6)
    v6 = 0;
  v7 = self->_options & 0xFFFFFFFFFFFFFFF7 | v6;
  self->_lastEventCount = a5;
  self->_options = v7;
}

- (BMStoreEnumerator)initWithStreamDatastore:(id)a3 bookmarkEnumerator:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  BMStoreEnumerator *v16;
  BMStoreEnumerator *v17;
  BMFrameStore *currentFrameStore;
  void *v19;
  double v20;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "streamId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "config");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "storeLocationOption") & 6;

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMStoreEnumerator.m"), 69, CFSTR("enumerating bookmarks for a subscription or tombstone is not supported"));

  }
  __biome_log_for_category();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "streamPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v25 = v11;
    v26 = 2112;
    v27 = v15;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_1A95BD000, v14, OS_LOG_TYPE_DEFAULT, "Enumerator for %@ from %@ using bookmarkEnumerator %@", buf, 0x20u);

  }
  v23.receiver = self;
  v23.super_class = (Class)BMStoreEnumerator;
  v16 = -[BMStoreEnumerator init](&v23, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_ds, a3);
    objc_storeStrong((id *)&v17->_bookmarkEnumerator, a4);
    currentFrameStore = v17->_currentFrameStore;
    v17->_currentFrameStore = 0;

    v17->_frameStoreOffset = 0;
    v17->_iterationStartTime = CFAbsoluteTimeGetCurrent();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceReferenceDate");
    v17->_endTime = v20;

    *(_OWORD *)&v17->_maxEvents = xmmword_1A95E4F00;
    *(_OWORD *)&v17->_lastEventCount = xmmword_1A95E4F00;
    v17->_dataType = 0;
  }

  return v17;
}

- (BMStoreEnumerator)initWithStreamDatastore:(id)a3 bookmark:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  const __CFString *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  BMStoreEnumerator *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  BMStoreEnumerator *v38;
  unint64_t v39;
  char v40;
  NSObject *v41;
  _BOOL4 v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void **v52;
  uint64_t *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  char v60;
  _BOOL4 v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  id v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint8_t buf[4];
  uint64_t v93;
  __int16 v94;
  _BYTE v95[10];
  _BYTE v96[10];
  void *v97;
  __int16 v98;
  uint64_t v99;
  uint64_t v100;
  _QWORD v101[3];

  v101[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "streamId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "streamId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if ((v14 & 1) != 0)
  {
    objc_msgSend(v10, "streamId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "config");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "storeLocationOption");

    if ((v17 & 4) != 0)
    {
      v20 = CFSTR(":subscriptions");
    }
    else
    {
      objc_msgSend(v10, "config");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "storeLocationOption");

      if ((v19 & 2) != 0)
        v20 = CFSTR(":tombstones");
      else
        v20 = &stru_1E5566870;
    }
    __biome_log_for_category();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "segmentDirectory");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "segmentName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v93 = (uint64_t)v15;
      v94 = 2112;
      *(_QWORD *)v95 = v20;
      *(_WORD *)&v95[8] = 2112;
      *(_QWORD *)v96 = v29;
      *(_WORD *)&v96[8] = 2112;
      v97 = v30;
      v98 = 2048;
      v99 = objc_msgSend(v11, "offset");
      _os_log_impl(&dword_1A95BD000, v28, OS_LOG_TYPE_DEFAULT, "Enumerator for %@%@ starting from %@/%@+0x%llx", buf, 0x34u);

    }
    objc_msgSend(v11, "segmentName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = 0;
    objc_msgSend(v10, "segmentWithFilename:error:", v31, &v85);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v85;

    if (v26)
    {
      if (a6)
      {
        v27 = 0;
        *a6 = objc_retainAutorelease(v26);
LABEL_50:

        goto LABEL_51;
      }
LABEL_49:
      v27 = 0;
      goto LABEL_50;
    }
    if (!v11 || (~objc_msgSend(v11, "offset") & 0xFFFFFFFE) == 0)
    {
LABEL_19:
      v33 = objc_msgSend(v11, "offset");
      objc_msgSend(v11, "iterationStartTime");
      v35 = v34;
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "timeIntervalSinceReferenceDate");
      v38 = -[BMStoreEnumerator initWithStreamDatastore:currentFrameStore:frameStoreOffset:iterationStartTime:endTime:maxEvents:lastN:options:dataType:](self, "initWithStreamDatastore:currentFrameStore:frameStoreOffset:iterationStartTime:endTime:maxEvents:lastN:options:dataType:", v10, v32, v33, -1, -1, a5, v35, v37, 0);

      self = v38;
      v27 = self;
      goto LABEL_50;
    }
    if (objc_msgSend(v32, "datastoreVersion") == 9)
    {
      v39 = objc_msgSend(v11, "offset");
      if (v39 <= (unint64_t)objc_msgSend(v32, "bytesUsed") - 56)
        goto LABEL_19;
      v40 = objc_msgSend(v32, "isCheckSumValidAtOffsetV1:", objc_msgSend(v11, "offset"));
      __biome_log_for_category();
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = os_log_type_enabled(v41, OS_LOG_TYPE_FAULT);
      if ((v40 & 1) != 0)
      {
        if (v42)
          -[BMStoreEnumerator initWithStreamDatastore:bookmark:options:error:].cold.1(v11, v32, v41);
        goto LABEL_43;
      }
      if (v42)
        -[BMStoreEnumerator initWithStreamDatastore:bookmark:options:error:].cold.2(v11, v32, v41);

      v83 = objc_alloc(MEMORY[0x1E0CB3940]);
      v80 = objc_msgSend(v11, "offset");
      v54 = objc_msgSend(v32, "bytesUsed");
      v55 = (void *)MEMORY[0x1E0D01D10];
      objc_msgSend(v32, "segmentPath");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "privacyPathname:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (void *)objc_msgSend(v83, "initWithFormat:", CFSTR("frameStore checksum mismatched and is beyond frame offset:%zu bytesUsed:%d for store: %@"), v80, v54, v57);

      if (!a6)
      {
LABEL_37:

        goto LABEL_49;
      }
      v50 = (void *)MEMORY[0x1E0CB35C8];
      v90 = *MEMORY[0x1E0CB2D50];
      v91 = v49;
      v51 = (void *)MEMORY[0x1E0C99D80];
      v52 = &v91;
      v53 = &v90;
LABEL_36:
      objc_msgSend(v51, "dictionaryWithObjects:forKeys:count:", v52, v53, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "errorWithDomain:code:userInfo:", CFSTR("com.apple.biome.BiomeStorage"), -1, v58);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_37;
    }
    if (objc_msgSend(v32, "datastoreVersion") != 10)
      goto LABEL_19;
    if (objc_msgSend(v11, "offset"))
    {
      v43 = objc_msgSend(v32, "frameNumberFromOffsetToOffsetTableEntryV2:", objc_msgSend(v11, "offset"));
      if ((v43 & 0x80000000) != 0)
      {
        __biome_log_for_category();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
          -[BMStoreEnumerator initWithStreamDatastore:bookmark:options:error:].cold.3(v11, v32, v44);

        v82 = objc_alloc(MEMORY[0x1E0CB3940]);
        v79 = objc_msgSend(v11, "offset");
        v45 = objc_msgSend(v32, "frameStoreSize");
        v46 = (void *)MEMORY[0x1E0D01D10];
        objc_msgSend(v32, "segmentPath");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "privacyPathname:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (void *)objc_msgSend(v82, "initWithFormat:", CFSTR("initWithStreamDatastore: bookmark offset (%zu) is beyond frameStore size:%zu for store: %@"), v79, v45, v48);

        if (!a6)
          goto LABEL_37;
        v50 = (void *)MEMORY[0x1E0CB35C8];
        v88 = *MEMORY[0x1E0CB2D50];
        v89 = v49;
        v51 = (void *)MEMORY[0x1E0C99D80];
        v52 = &v89;
        v53 = &v88;
        goto LABEL_36;
      }
    }
    else
    {
      v43 = 0;
    }
    v59 = objc_msgSend(v32, "atomicReadTotalFramesV2");
    if ((int)v43 <= (int)v59)
      goto LABEL_19;
    v81 = v59;
    v84 = v43;
    v60 = objc_msgSend(v32, "isCheckSumValidAtOffsetV2:frameNumber:", objc_msgSend(v11, "offset"), v43);
    __biome_log_for_category();
    v41 = objc_claimAutoreleasedReturnValue();
    v61 = os_log_type_enabled(v41, OS_LOG_TYPE_FAULT);
    if ((v60 & 1) == 0)
    {
      if (v61)
      {
        v78 = objc_msgSend(v11, "offset");
        v73 = (void *)MEMORY[0x1E0D01D10];
        objc_msgSend(v32, "segmentPath");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "privacyPathname:", v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v93 = v78;
        v94 = 1024;
        *(_DWORD *)v95 = v84;
        *(_WORD *)&v95[4] = 1024;
        *(_DWORD *)&v95[6] = v81;
        *(_WORD *)v96 = 2114;
        *(_QWORD *)&v96[2] = v75;
        _os_log_fault_impl(&dword_1A95BD000, v41, OS_LOG_TYPE_FAULT, "frameStore checksum mismatched, offset %zu, frame:%d is beyond totalFrames:%d for store: %{public}@", buf, 0x22u);

      }
      v76 = objc_alloc(MEMORY[0x1E0CB3940]);
      v62 = objc_msgSend(v11, "offset");
      v63 = (void *)MEMORY[0x1E0D01D10];
      objc_msgSend(v32, "segmentPath");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "privacyPathname:", v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = (void *)objc_msgSend(v76, "initWithFormat:", CFSTR("frameStore checksum mismatched, offset %zu, frame:%d is beyond totalFrames:%d for store: %@"), v62, v84, v81, v65);

      if (a6)
      {
        v67 = (void *)MEMORY[0x1E0CB35C8];
        v86 = *MEMORY[0x1E0CB2D50];
        v87 = v66;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "errorWithDomain:code:userInfo:", CFSTR("com.apple.biome.BiomeStorage"), -1, v68);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_49;
    }
    if (v61)
    {
      v77 = objc_msgSend(v11, "offset");
      v70 = (void *)MEMORY[0x1E0D01D10];
      objc_msgSend(v32, "segmentPath");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "privacyPathname:", v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v93 = v77;
      v94 = 1024;
      *(_DWORD *)v95 = v84;
      *(_WORD *)&v95[4] = 1024;
      *(_DWORD *)&v95[6] = v81;
      *(_WORD *)v96 = 2114;
      *(_QWORD *)&v96[2] = v72;
      _os_log_fault_impl(&dword_1A95BD000, v41, OS_LOG_TYPE_FAULT, "frameStore checksum matched, although offset %zu, frame:%d is beyond totalFrames:%d for store: %{public}@", buf, 0x22u);

    }
LABEL_43:

    goto LABEL_19;
  }
  __biome_log_for_category();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    -[BMStoreEnumerator initWithStreamDatastore:bookmark:options:error:].cold.4();

  v22 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v10, "streamId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "streamId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("Data store streamId is %@ while bookmark streamId is %@"), v23, v24);

  if (a6)
  {
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v100 = *MEMORY[0x1E0CB2D50];
    v101[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, &v100, 1);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.biome.BiomeStorage"), -1, v26);
    v27 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_51:

    goto LABEL_52;
  }
  v27 = 0;
LABEL_52:

  return v27;
}

- (BMStoreEnumerator)initWithStreamDatastore:(id)a3 startTime:(double)a4 endTime:(double)a5 maxEvents:(unint64_t)a6 lastN:(unint64_t)a7 options:(unint64_t)a8
{
  return -[BMStoreEnumerator initWithStreamDatastore:startTime:endTime:maxEvents:lastN:options:dataType:](self, "initWithStreamDatastore:startTime:endTime:maxEvents:lastN:options:dataType:", a3, a6, a7, a8, 0, a4, a5);
}

- (BMStoreEnumerator)initWithStreamDatastore:(id)a3 startTime:(double)a4 endTime:(double)a5 maxEvents:(unint64_t)a6 lastN:(unint64_t)a7 options:(unint64_t)a8 dataType:(Class)a9
{
  id v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  BMStoreEnumerator *v22;
  unint64_t v23;
  unint64_t v24;
  double v25;
  void *v26;
  BMStoreEnumerator *v27;
  char v28;
  char v29;
  id *p_currentFrameStore;
  unint64_t frameStoreOffset;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  NSObject *p_super;
  uint64_t v36;
  _BYTE buf[12];
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  __int16 v43;
  const char *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = v16;
  v18 = a4 < a5;
  if ((a8 & 8) == 0)
    v18 = a4 > a5;
  if (!v18)
  {
    v23 = (a8 ^ 8) & 8;
    if (a7 == -1)
    {
      v24 = a8 & 8;
    }
    else
    {
      a8 ^= 8uLL;
      v24 = v23;
    }
    if (a7 == -1)
      v25 = a5;
    else
      v25 = a4;
    if (a7 == -1)
      a5 = a4;
    objc_msgSend(v16, "segmentContainingTimestamp:", a5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[BMStoreEnumerator initWithStreamDatastore:currentFrameStore:frameStoreOffset:iterationStartTime:endTime:maxEvents:lastN:options:dataType:](self, "initWithStreamDatastore:currentFrameStore:frameStoreOffset:iterationStartTime:endTime:maxEvents:lastN:options:dataType:", v17, v26, 0xFFFFFFFFLL, -1, a7, a8, CFAbsoluteTimeGetCurrent(), v25, a9);

    if (!v27)
      goto LABEL_41;
    *(_QWORD *)buf = 0;
    v28 = -[BMStoreEnumerator advanceBookmarkToStartTime:eventsFound:lastN:](v27, "advanceBookmarkToStartTime:eventsFound:lastN:", buf, a7, a5);
    if (a7 == -1)
    {
LABEL_40:
      v27->_maxEvents = a6;
LABEL_41:
      self = v27;
      v22 = self;
      goto LABEL_42;
    }
    if (*(_QWORD *)buf)
      v29 = v28;
    else
      v29 = 1;
    if ((v29 & 1) != 0)
      goto LABEL_38;
    p_currentFrameStore = (id *)&v27->_currentFrameStore;
    if (-[BMFrameStore datastoreVersion](v27->_currentFrameStore, "datastoreVersion") == 9)
    {
      frameStoreOffset = v27->_frameStoreOffset;
      if (v24)
      {
        if (frameStoreOffset != 4294967294)
          goto LABEL_38;
        goto LABEL_36;
      }
      if (frameStoreOffset + 56 != objc_msgSend(*p_currentFrameStore, "bytesUsed"))
      {
LABEL_38:
        v27->_endTime = a5;
        v27->_options ^= 8uLL;
        if (*(_QWORD *)buf < a6)
          a6 = *(_QWORD *)buf;
        goto LABEL_40;
      }
    }
    else
    {
      if (objc_msgSend(*p_currentFrameStore, "datastoreVersion") != 10)
      {
        __biome_log_for_category();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
          -[BMStoreEnumerator initWithStreamDatastore:startTime:endTime:maxEvents:lastN:options:dataType:].cold.1((id *)&v27->_currentFrameStore);
        goto LABEL_37;
      }
      -[BMStoreEnumerator currentFrameStore](v27, "currentFrameStore");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "atomicReadTotalFramesV2");

      v34 = v27->_frameStoreOffset;
      if (v24)
      {
        if (v34 != 4294967294)
          goto LABEL_38;
      }
      else if (v34 != objc_msgSend(*p_currentFrameStore, "offsetTableOffsetFromFrameNumberV2:", v33))
      {
        goto LABEL_38;
      }
    }
LABEL_36:
    v27->_frameStoreOffset = 0xFFFFFFFFLL;
    objc_msgSend(v17, "segmentContainingTimestamp:", v25);
    v36 = objc_claimAutoreleasedReturnValue();
    p_super = &v27->_currentFrameStore->super;
    v27->_currentFrameStore = (BMFrameStore *)v36;
LABEL_37:

    goto LABEL_38;
  }
  __biome_log_for_category();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v17, "streamId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = "YES";
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v20;
    v39 = 2048;
    if ((a8 & 8) == 0)
      v21 = "NO";
    v40 = a4;
    v41 = 2048;
    v42 = a5;
    v43 = 2080;
    v44 = v21;
    _os_log_impl(&dword_1A95BD000, v19, OS_LOG_TYPE_INFO, "initWithStreamDatastore: stream: %{public}@ with startTime: %f, endTime: %f, and reverse: %s will result in no events, so returning nil", buf, 0x2Au);

  }
  v22 = 0;
LABEL_42:

  return v22;
}

- (BMStoreEnumerator)initWithStreamDatastore:(id)a3 currentFrameStore:(id)a4 frameStoreOffset:(unint64_t)a5 iterationStartTime:(double)a6 endTime:(double)a7 maxEvents:(unint64_t)a8 lastN:(unint64_t)a9 options:(unint64_t)a10 dataType:(Class)a11
{
  id v20;
  id v21;
  BMStoreEnumerator *v22;
  BMStoreEnumerator *v23;
  BMStoreBookmarkEnumerator *bookmarkEnumerator;
  objc_super v26;

  v20 = a3;
  v21 = a4;
  v26.receiver = self;
  v26.super_class = (Class)BMStoreEnumerator;
  v22 = -[BMStoreEnumerator init](&v26, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_ds, a3);
    objc_storeStrong((id *)&v23->_currentFrameStore, a4);
    v23->_frameStoreOffset = a5;
    v23->_iterationStartTime = a6;
    v23->_endTime = a7;
    v23->_maxEvents = a8;
    v23->_eventCount = 0;
    v23->_lastEventCount = a9;
    v23->_options = a10;
    v23->_dataType = a11;
    bookmarkEnumerator = v23->_bookmarkEnumerator;
    v23->_bookmarkEnumerator = 0;

  }
  return v23;
}

- (id)nextEvent
{
  return -[BMStoreEnumerator copyNextEventAndMoveBookmark:](self, "copyNextEventAndMoveBookmark:", 1);
}

- (void)nextEventWithContext:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *, BMFrameStore *);

  v6 = (void (**)(id, void *, BMFrameStore *))a3;
  v4 = (void *)MEMORY[0x1AF4163D4]();
  -[BMStoreEnumerator nextEvent](self, "nextEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v5, self->_currentFrameStore);

  objc_autoreleasePoolPop(v4);
}

- (id)peekEvent
{
  return -[BMStoreEnumerator copyNextEventAndMoveBookmark:](self, "copyNextEventAndMoveBookmark:", 0);
}

- (BOOL)isDataAccessible
{
  return -[BMStreamDatastore isDataAccessible](self->_ds, "isDataAccessible");
}

- (BMStreamMetadata)metadata
{
  BMStreamMetadata *metadata;
  BMStreamMetadata *v4;
  BMStreamMetadata *v5;

  metadata = self->_metadata;
  if (!metadata)
  {
    -[BMStreamDatastore metadata](self->_ds, "metadata");
    v4 = (BMStreamMetadata *)objc_claimAutoreleasedReturnValue();
    v5 = self->_metadata;
    self->_metadata = v4;

    metadata = self->_metadata;
  }
  return metadata;
}

- (id)_eventWithFrameStore:(id)a3 frame:(id)a4 error:(unsigned __int8)a5
{
  uint64_t v5;
  id v8;
  id v9;
  BMStoreEvent *v10;
  void *v11;
  void *v12;
  BMStoreEvent *v13;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [BMStoreEvent alloc];
  objc_msgSend(v9, "segmentName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMStoreEnumerator metadata](self, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[BMStoreEvent initWithFrame:segmentName:error:eventCategory:metadata:dataType:](v10, "initWithFrame:segmentName:error:eventCategory:metadata:dataType:", v8, v11, v5, 0, v12, self->_dataType);

  return v13;
}

- (id)copyNextEventAndMoveBookmark:(BOOL)a3
{
  return -[BMStoreEnumerator copyNextEventAndMoveBookmark:makeEvent:](self, "copyNextEventAndMoveBookmark:makeEvent:", a3, 0);
}

- (BOOL)advanceBookmarkToStartTime:(double)a3 eventsFound:(unint64_t *)a4 lastN:(unint64_t)a5
{
  BMFrameStore *currentFrameStore;
  NSObject *v11;
  os_log_type_t v12;
  unsigned int v13;
  void *v14;
  _QWORD block[5];
  uint8_t buf[8];
  __int128 v17;
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  currentFrameStore = self->_currentFrameStore;
  if (currentFrameStore)
  {
    if (-[BMFrameStore datastoreVersion](currentFrameStore, "datastoreVersion") == 9)
      return -[BMStoreEnumerator advanceBookmarkV1ToStartTime:eventsFound:lastN:](self, "advanceBookmarkV1ToStartTime:eventsFound:lastN:", a4, a5, a3);
    if (-[BMFrameStore datastoreVersion](self->_currentFrameStore, "datastoreVersion") == 10)
      return -[BMStoreEnumerator advanceBookmarkV2ToStartTime:eventsFound:lastN:](self, "advanceBookmarkV2ToStartTime:eventsFound:lastN:", a4, a5, a3);
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v17 = buf;
    *((_QWORD *)&v17 + 1) = 0x2020000000;
    v18 = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__BMStoreEnumerator_advanceBookmarkToStartTime_eventsFound_lastN___block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (advanceBookmarkToStartTime_eventsFound_lastN__onceToken != -1)
      dispatch_once(&advanceBookmarkToStartTime_eventsFound_lastN__onceToken, block);
    v12 = *(_BYTE *)(v17 + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v11, v12))
    {
      v13 = -[BMFrameStore datastoreVersion](self->_currentFrameStore, "datastoreVersion");
      -[BMFrameStore segmentPath](self->_currentFrameStore, "segmentPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v13;
      LOWORD(v17) = 2112;
      *(_QWORD *)((char *)&v17 + 2) = v14;
      _os_log_impl(&dword_1A95BD000, v11, v12, "advanceBookmarkToStartTime: unknown datastoreVersion (%d) in frameStore: %@", buf, 0x12u);

    }
  }
  return 0;
}

uint64_t __66__BMStoreEnumerator_advanceBookmarkToStartTime_eventsFound_lastN___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (BOOL)advanceBookmarkV1ToStartTime:(double)a3 eventsFound:(unint64_t *)a4 lastN:(unint64_t)a5
{
  void *v7;
  unint64_t options;
  uint64_t v9;
  void *v10;
  BMStreamDatastore *ds;
  BMFrameStore *currentFrameStore;
  unint64_t frameStoreOffset;
  unint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  int v27;
  id v28;
  unint64_t *v30;
  char v31;
  int v33;
  id *location;
  _QWORD v35[6];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v33 = 0;
  v30 = a4;
  v31 = 0;
  v7 = 0;
  options = self->_options;
  location = (id *)&self->_currentFrameStore;
  v9 = MEMORY[0x1E0C809B0];
  do
  {
    v10 = (void *)MEMORY[0x1AF4163D4]();
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy_;
    v46 = __Block_byref_object_dispose_;
    v47 = 0;
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy_;
    v40 = __Block_byref_object_dispose_;
    v41 = 0;
    currentFrameStore = self->_currentFrameStore;
    ds = self->_ds;
    frameStoreOffset = self->_frameStoreOffset;
    v14 = self->_options;
    v35[0] = v9;
    v35[1] = 3221225472;
    v35[2] = __68__BMStoreEnumerator_advanceBookmarkV1ToStartTime_eventsFound_lastN___block_invoke;
    v35[3] = &unk_1E5565E18;
    v35[4] = &v42;
    v35[5] = &v36;
    -[BMStreamDatastore fetchEventFromFrameStore:atOffset:withOptions:callback:](ds, "fetchEventFromFrameStore:atOffset:withOptions:callback:", currentFrameStore, frameStoreOffset, v14, v35);
    v15 = (void *)v43[5];
    if (!v15)
      goto LABEL_17;
    if ((options & 8) == 0)
    {
      objc_msgSend(v15, "creationTimestamp");
      if (v16 > self->_endTime)
      {
        objc_msgSend(v7, "creationTimestamp");
        if (v17 >= a3)
          goto LABEL_9;
        goto LABEL_17;
      }
      objc_storeStrong(location, (id)v37[5]);
      objc_msgSend((id)v43[5], "creationTimestamp");
      if (v20 < a3)
        goto LABEL_15;
LABEL_13:
      if (a5 != -1 && ++v33 < a5)
      {
LABEL_15:
        self->_frameStoreOffset = objc_msgSend((id)v43[5], "nextOffset", v30);
        v22 = (id)v43[5];
        v23 = v7;
        v24 = options;
        v25 = v9;
        v26 = v22;

        v27 = 0;
        v28 = v26;
        v9 = v25;
        options = v24;
        v7 = v28;
        goto LABEL_18;
      }
      self->_frameStoreOffset = objc_msgSend((id)v43[5], "offset", v30);
      v31 = 1;
      goto LABEL_17;
    }
    objc_msgSend(v15, "creationTimestamp");
    if (v18 >= self->_endTime)
    {
      objc_storeStrong(location, (id)v37[5]);
      objc_msgSend((id)v43[5], "creationTimestamp");
      if (v21 > a3)
        goto LABEL_15;
      goto LABEL_13;
    }
    objc_msgSend(v7, "creationTimestamp");
    if (v19 <= a3)
LABEL_9:
      self->_frameStoreOffset = objc_msgSend(v7, "offset");
LABEL_17:
    v27 = 1;
LABEL_18:
    _Block_object_dispose(&v36, 8);

    _Block_object_dispose(&v42, 8);
    objc_autoreleasePoolPop(v10);
  }
  while (!v27);
  if (v30)
    *v30 = v33;

  return v31 & 1;
}

void __68__BMStoreEnumerator_advanceBookmarkV1ToStartTime_eventsFound_lastN___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

- (BOOL)advanceBookmarkV2ToStartTime:(double)a3 eventsFound:(unint64_t *)a4 lastN:(unint64_t)a5
{
  BOOL result;
  unint64_t options;
  uint64_t v8;
  unint64_t v9;

  if (a5 != -1)
    return -[BMStoreEnumerator advanceBookmarkV1ToStartTime:eventsFound:lastN:](self, "advanceBookmarkV1ToStartTime:eventsFound:lastN:", a4, a3);
  options = self->_options;
  v8 = -[BMFrameStore firstFrameNumberForTimestampV2:reverse:](self->_currentFrameStore, "firstFrameNumberForTimestampV2:reverse:", (options >> 3) & 1, a3);
  if ((_DWORD)v8 == -1)
  {
    if ((options & 8) != 0)
      v9 = 4294967294;
    else
      v9 = -[BMFrameStore offsetTableOffsetFromFrameNumberV2:](self->_currentFrameStore, "offsetTableOffsetFromFrameNumberV2:", -[BMFrameStore atomicReadTotalFramesV2](self->_currentFrameStore, "atomicReadTotalFramesV2"));
    result = 0;
    self->_frameStoreOffset = v9;
  }
  else
  {
    self->_frameStoreOffset = -[BMFrameStore offsetTableOffsetFromFrameNumberV2:](self->_currentFrameStore, "offsetTableOffsetFromFrameNumberV2:", v8);
    return 1;
  }
  return result;
}

- (id)copyNextEventAndMoveBookmark:(BOOL)a3 makeEvent:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, uint64_t, uint64_t, uint64_t);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BMFrameStore *v13;
  unint64_t frameStoreOffset;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  BMStreamDatastore *ds;
  unint64_t options;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  uint64_t v33;
  unint64_t maxEvents;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[6];
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v4 = a3;
  v64 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t, uint64_t, uint64_t))a4;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy_;
  v56 = __Block_byref_object_dispose_;
  v57 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy_;
  v50 = __Block_byref_object_dispose_;
  v51 = 0;
  -[BMStoreEnumerator bookmarkEnumerator](self, "bookmarkEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[BMStoreEnumerator bookmarkEnumerator](self, "bookmarkEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nextBookmark");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[BMStoreEnumerator bookmarkEnumerator](self, "bookmarkEnumerator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        v37 = 0;
        goto LABEL_40;
      }
      __biome_log_for_category();
      v13 = (BMFrameStore *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR))
      {
        -[BMStoreEnumerator bookmarkEnumerator](self, "bookmarkEnumerator");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "error");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMStoreEnumerator ds](self, "ds");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "streamPath");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v59 = v18;
        v60 = 2112;
        v61 = v20;
        _os_log_error_impl(&dword_1A95BD000, &v13->super, OS_LOG_TYPE_ERROR, "Error calling -[BMStoreBookmarkEnumerator nextBookmark]: %@ for stream %@ to create frame store", buf, 0x16u);

      }
      goto LABEL_33;
    }
    -[BMFrameStore segmentName](self->_currentFrameStore, "segmentName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "segmentName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if (v12)
    {
      v13 = self->_currentFrameStore;
    }
    else
    {
      -[BMStoreEnumerator ds](self, "ds");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "segmentName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0;
      objc_msgSend(v21, "segmentWithFilename:error:", v22, &v45);
      v13 = (BMFrameStore *)objc_claimAutoreleasedReturnValue();
      v23 = v45;

      if (v23)
      {
        __biome_log_for_category();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          -[BMStoreEnumerator ds](self, "ds");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "streamPath");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "segmentName");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v59 = v42;
          v60 = 2112;
          v61 = v43;
          v62 = 2112;
          v63 = v23;
          _os_log_error_impl(&dword_1A95BD000, v24, OS_LOG_TYPE_ERROR, "Unable to create frame store for stream: %@ from segmentName: %@, error:%@", buf, 0x20u);

        }
        goto LABEL_33;
      }
    }
    frameStoreOffset = objc_msgSend(v9, "offset");

  }
  else
  {
    v13 = self->_currentFrameStore;
    frameStoreOffset = self->_frameStoreOffset;
  }
  ds = self->_ds;
  options = self->_options;
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __60__BMStoreEnumerator_copyNextEventAndMoveBookmark_makeEvent___block_invoke;
  v44[3] = &unk_1E5565E18;
  v44[4] = &v52;
  v44[5] = &v46;
  -[BMStreamDatastore fetchEventFromFrameStore:atOffset:withOptions:callback:](ds, "fetchEventFromFrameStore:atOffset:withOptions:callback:", v13, frameStoreOffset, options, v44);
  v27 = (void *)v53[5];
  if (v27)
  {
    if ((self->_options & 8) != 0)
    {
      objc_msgSend(v27, "creationTimestamp");
      if (v29 >= self->_endTime)
        goto LABEL_20;
    }
    else
    {
      objc_msgSend(v27, "creationTimestamp");
      if (v28 <= self->_endTime)
        goto LABEL_20;
    }
    v30 = (void *)v53[5];
    v53[5] = 0;

  }
LABEL_20:
  v31 = (void *)v53[5];
  if (!v31)
  {
    v33 = 1;
    goto LABEL_30;
  }
  if (objc_msgSend(v31, "datastoreVersion") == 9
    && (objc_msgSend((id)v53[5], "modifiedTimestamp"), v32 > self->_iterationStartTime))
  {
    v33 = 4;
    if (!v4)
      goto LABEL_30;
  }
  else
  {
    v33 = 1;
    if (!v4)
      goto LABEL_30;
  }
  if (objc_msgSend((id)v53[5], "state") == 1)
  {
    maxEvents = self->_maxEvents;
    v35 = self->_eventCount + 1;
    self->_eventCount = v35;
    if (v35 > maxEvents)
    {
      v36 = (void *)v53[5];
      v53[5] = 0;

    }
  }
LABEL_30:
  if (v53[5])
  {
    if (v6)
      v6[2](v6, v47[5], v53[5], v33);
    else
      -[BMStoreEnumerator _eventWithFrameStore:frame:error:](self, "_eventWithFrameStore:frame:error:", v47[5]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_currentFrameStore, (id)v47[5]);
    v38 = (void *)v53[5];
    if (v4)
      v39 = objc_msgSend(v38, "nextOffset");
    else
      v39 = objc_msgSend(v38, "offset");
    self->_frameStoreOffset = v39;
    goto LABEL_39;
  }
LABEL_33:
  v37 = 0;
LABEL_39:

LABEL_40:
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
  return v37;
}

void __60__BMStoreEnumerator_copyNextEventAndMoveBookmark_makeEvent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

- (BMStoreBookmark)bookmark
{
  BMFrameStore *currentFrameStore;
  BMFrameStore **p_currentFrameStore;
  unint64_t frameStoreOffset;
  unint64_t *p_frameStoreOffset;
  unint64_t v7;
  BOOL v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v12;
  os_log_type_t v13;
  unsigned int v14;
  void *v15;
  int v16;
  int v17;
  BOOL v18;
  _BOOL4 v19;
  BMStoreBookmark *v20;
  NSObject *v21;
  BMStoreBookmark *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  _QWORD block[5];
  _BYTE buf[24];
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  p_currentFrameStore = &self->_currentFrameStore;
  currentFrameStore = self->_currentFrameStore;
  if (!currentFrameStore)
    return (BMStoreBookmark *)0;
  p_frameStoreOffset = &self->_frameStoreOffset;
  frameStoreOffset = self->_frameStoreOffset;
  if ((~LODWORD(self->_frameStoreOffset) & 0xFFFFFFFE) == 0)
    goto LABEL_30;
  if (-[BMFrameStore datastoreVersion](currentFrameStore, "datastoreVersion") == 9)
  {
    v7 = *p_frameStoreOffset;
    if (v7 <= (unint64_t)-[BMFrameStore bytesUsed](*p_currentFrameStore, "bytesUsed") - 56)
      goto LABEL_26;
    v8 = -[BMFrameStore isCheckSumValidAtOffsetV1:](*p_currentFrameStore, "isCheckSumValidAtOffsetV1:", *p_frameStoreOffset);
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_FAULT);
    if (!v8)
    {
      if (v10)
        -[BMStoreEnumerator bookmark].cold.4(&self->_frameStoreOffset, p_currentFrameStore, v9);
      goto LABEL_29;
    }
    if (v10)
      -[BMStoreEnumerator bookmark].cold.3(&self->_frameStoreOffset, p_currentFrameStore, v9);
    goto LABEL_25;
  }
  if (-[BMFrameStore datastoreVersion](*p_currentFrameStore, "datastoreVersion") != 10)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v33) = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__BMStoreEnumerator_bookmark__block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (bookmark_onceToken != -1)
      dispatch_once(&bookmark_onceToken, block);
    v13 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (!os_log_type_enabled(v9, v13))
      goto LABEL_25;
    v14 = -[BMFrameStore datastoreVersion](*p_currentFrameStore, "datastoreVersion");
    -[BMFrameStore segmentPath](*p_currentFrameStore, "segmentPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v14;
    *(_WORD *)&buf[8] = 2112;
    *(_QWORD *)&buf[10] = v15;
    _os_log_impl(&dword_1A95BD000, v9, v13, "BMStoreEnumerator.bookmark: unknown datastoreVersion (%d) in frameStore: %@", buf, 0x12u);
LABEL_18:

LABEL_25:
    goto LABEL_26;
  }
  if (*p_frameStoreOffset)
  {
    v12 = -[BMFrameStore frameNumberFromOffsetToOffsetTableEntryV2:](*p_currentFrameStore, "frameNumberFromOffsetToOffsetTableEntryV2:");
    if ((v12 & 0x80000000) != 0)
    {
      __biome_log_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[BMStoreEnumerator bookmark].cold.5(&self->_frameStoreOffset, p_currentFrameStore, v9);
      goto LABEL_29;
    }
  }
  else
  {
    v12 = 0;
  }
  v16 = -[BMFrameStore atomicReadTotalFramesV2](*p_currentFrameStore, "atomicReadTotalFramesV2");
  if ((int)v12 > v16)
  {
    v17 = v16;
    v18 = -[BMFrameStore isCheckSumValidAtOffsetV2:frameNumber:](*p_currentFrameStore, "isCheckSumValidAtOffsetV2:frameNumber:", *p_frameStoreOffset, v12);
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v9, OS_LOG_TYPE_FAULT);
    if (!v18)
    {
      if (v19)
      {
        v24 = *p_frameStoreOffset;
        v25 = (void *)MEMORY[0x1E0D01D10];
        -[BMFrameStore segmentPath](*p_currentFrameStore, "segmentPath");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "privacyPathname:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        *(_QWORD *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v12;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v17;
        v33 = 2114;
        v34 = v27;
        _os_log_fault_impl(&dword_1A95BD000, v9, OS_LOG_TYPE_FAULT, "frameStore checksum mismatched, offset %zu, frame:%d is beyond totalFrames:%d for store: %{public}@", buf, 0x22u);

      }
      goto LABEL_29;
    }
    if (!v19)
      goto LABEL_25;
    v28 = *p_frameStoreOffset;
    v29 = (void *)MEMORY[0x1E0D01D10];
    -[BMFrameStore segmentPath](*p_currentFrameStore, "segmentPath");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "privacyPathname:", v30);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = v28;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v12;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v17;
    v33 = 2114;
    v34 = v15;
    _os_log_fault_impl(&dword_1A95BD000, v9, OS_LOG_TYPE_FAULT, "frameStore checksum matched, although offset %zu, frame:%d is beyond totalFrames:%d for store: %{public}@", buf, 0x22u);

    goto LABEL_18;
  }
LABEL_26:
  frameStoreOffset = *p_frameStoreOffset;
  if ((*p_frameStoreOffset & 7) == 0)
  {
LABEL_30:
    if (frameStoreOffset == 4294967294)
    {
      __biome_log_for_category();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[BMStoreEnumerator bookmark].cold.1(v21);

    }
    v22 = [BMStoreBookmark alloc];
    -[BMStreamDatastore streamId](self->_ds, "streamId");
    v9 = objc_claimAutoreleasedReturnValue();
    -[BMFrameStore segmentName](self->_currentFrameStore, "segmentName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[BMStoreBookmark initWithStream:segment:iterationStartTime:offset:](v22, "initWithStream:segment:iterationStartTime:offset:", v9, v23, self->_frameStoreOffset, self->_iterationStartTime);

    goto LABEL_35;
  }
  __biome_log_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    -[BMStoreEnumerator bookmark].cold.2((uint64_t)&self->_frameStoreOffset, (id *)p_currentFrameStore);
LABEL_29:
  v20 = 0;
LABEL_35:

  return v20;
}

uint64_t __29__BMStoreEnumerator_bookmark__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (BMFrameStore)currentFrameStore
{
  return self->_currentFrameStore;
}

- (BMStreamDatastore)ds
{
  return self->_ds;
}

- (BMStoreBookmarkEnumerator)bookmarkEnumerator
{
  return self->_bookmarkEnumerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkEnumerator, 0);
  objc_storeStrong((id *)&self->_ds, 0);
  objc_storeStrong((id *)&self->_currentFrameStore, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (void)initWithStreamDatastore:bookmark:options:error:.cold.4()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_8();
  objc_msgSend(v1, "streamId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "streamId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_0(&dword_1A95BD000, v4, v5, "Data store streamId is %{public}@ while bookmark streamId is %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithStreamDatastore:(id *)a1 startTime:endTime:maxEvents:lastN:options:dataType:.cold.1(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (void *)MEMORY[0x1E0D01D10];
  objc_msgSend(*a1, "segmentPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privacyPathname:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "datastoreVersion");
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_0(&dword_1A95BD000, v5, v6, "initWithStreamDatastore: %{public}@  has unexpected dataVersion:%lu", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

- (void)bookmark
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = (void *)MEMORY[0x1E0D01D10];
  objc_msgSend(*a2, "segmentPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privacyPathname:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0(&dword_1A95BD000, v4, v5, "bookmark: offset: %zu not 8-byte aligned %{public}@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end
