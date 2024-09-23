@implementation _DPDatabaseRecorder

- (_DPDatabaseRecorder)init
{

  return 0;
}

- (_DPDatabaseRecorder)initWithKey:(id)a3 storage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _DPDatabaseRecorder *v10;

  v6 = a4;
  v7 = a3;
  +[_DPStrings systemBlacklistDirectoryPath](_DPStrings, "systemBlacklistDirectoryPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPStrings runtimeBlacklistDirectoryPath](_DPStrings, "runtimeBlacklistDirectoryPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_DPDatabaseRecorder initWithKey:storage:systemBlacklistPath:runtimeBlacklistPath:](self, "initWithKey:storage:systemBlacklistPath:runtimeBlacklistPath:", v7, v6, v8, v9);

  return v10;
}

- (_DPDatabaseRecorder)initWithKey:(id)a3 storage:(id)a4 systemBlacklistPath:(id)a5 runtimeBlacklistPath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _DPDatabaseRecorder *v14;
  _DPDatabaseRecorder *v15;
  _DPStorage **p_db;
  void *v17;
  uint64_t v18;
  NSSet *blacklistSet;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _DPDatabaseRecorder *v26;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)_DPDatabaseRecorder;
  v14 = -[_DPDataRecorder initWithKey:](&v28, sel_initWithKey_, v10);
  v15 = v14;
  if (!v14)
  {
LABEL_8:
    v26 = v15;
    goto LABEL_9;
  }
  p_db = &v14->_db;
  objc_storeStrong((id *)&v14->_db, a4);
  if (*p_db)
  {
    +[_DPBlacklist blacklistForKey:systemBlacklistDirectory:runtimeBlacklistDirectory:](_DPBlacklist, "blacklistForKey:systemBlacklistDirectory:runtimeBlacklistDirectory:", v10, v12, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "blacklist");
    v18 = objc_claimAutoreleasedReturnValue();
    blacklistSet = v15->_blacklistSet;
    v15->_blacklistSet = (NSSet *)v18;

    v20 = (void *)MEMORY[0x1D8256B78]();
    +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "parameterDictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("puzzleCount"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
      v25 = objc_msgSend(v23, "unsignedIntegerValue");
    else
      v25 = 256;
    v15->_puzzlePieceCount = v25;

    objc_autoreleasePoolPop(v20);
    goto LABEL_8;
  }
  v26 = 0;
LABEL_9:

  return v26;
}

- (void)recordNumbers:(id)a3
{
  -[_DPDatabaseRecorder recordNumbers:metadata:](self, "recordNumbers:metadata:", a3, 0);
}

- (void)recordNumbers:(id)a3 metadata:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  _DPStorage *db;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  SEL v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  objc_super v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  uint64_t v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1D8256B78]();
  v73.receiver = self;
  v73.super_class = (Class)_DPDatabaseRecorder;
  -[_DPDataRecorder randomizer](&v73, sel_randomizer);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "randomizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v50 = v9;
    v68.receiver = self;
    v68.super_class = (Class)_DPDatabaseRecorder;
    -[_DPDataRecorder keyName](&v68, sel_keyName);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    +[_DPSubmissionRateLimiter sharedInstance](_DPSubmissionRateLimiter, "sharedInstance");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v49, "debit:forKey:", objc_msgSend(v7, "count"), v12);
    if (objc_msgSend(v7, "count") != v13)
    {
      v14 = 0;
      do
      {
        -[_DPDataRecorder keyName](self, "keyName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v15, 0, 201);

        ++v14;
      }
      while (v14 < objc_msgSend(v7, "count") - v13);
    }
    if (!v13)
    {
      +[_DPLog framework](_DPLog, "framework");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[_DPDatabaseRecorder recordNumbers:metadata:].cold.1();
      v16 = v7;
      goto LABEL_32;
    }
    objc_msgSend(v7, "subarrayWithRange:", 0, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (-[_DPDatabaseRecorder isMetadataValid:](self, "isMetadataValid:", v8))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v11, "randomizeNumbers:metadata:forKey:", v16, v8, v12);
          v17 = objc_claimAutoreleasedReturnValue();
LABEL_22:
          v22 = v17;
          v23 = objc_msgSend(v16, "count");
          if (v23 != -[NSObject count](v22, "count"))
          {
            v24 = 0;
            do
            {
              -[_DPDataRecorder keyName](self, "keyName");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v25, 0, 207);

              ++v24;
              v26 = objc_msgSend(v16, "count");
            }
            while (v24 < v26 - -[NSObject count](v22, "count"));
          }
          if (-[NSObject count](v22, "count"))
          {
            v27 = 0;
            do
            {
              -[_DPDataRecorder keyName](self, "keyName");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v28, 1, 0);

              ++v27;
            }
            while (v27 < -[NSObject count](v22, "count"));
          }
          if (!-[_DPDataRecorder directUpload](self, "directUpload"))
          {
            db = self->_db;
            v51[0] = MEMORY[0x1E0C809B0];
            v51[1] = 3221225472;
            v51[2] = __46___DPDatabaseRecorder_recordNumbers_metadata___block_invoke;
            v51[3] = &unk_1E95D9958;
            v54 = a2;
            v32 = v49;
            v52 = v49;
            v53 = v12;
            v55 = v13;
            -[_DPStorage saveRecords:withCompletion:](db, "saveRecords:withCompletion:", v22, v51);

            v9 = v50;
            goto LABEL_61;
          }
          +[_DPLog framework](_DPLog, "framework");
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = -[NSObject count](v22, "count");
            *(_DWORD *)buf = 138412546;
            v75 = v30;
            v76 = 2048;
            v77 = v31;
            _os_log_impl(&dword_1D3FAA000, v29, OS_LOG_TYPE_INFO, "%@: performing direct upload, count: %ld", buf, 0x16u);

          }
          -[_DPDatabaseRecorder directUploadRecords:forKey:](self, "directUploadRecords:forKey:", v22, v12);
LABEL_32:
          v32 = v49;
          v9 = v50;
LABEL_61:

          goto LABEL_62;
        }
        +[_DPLog framework](_DPLog, "framework");
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          -[_DPDatabaseRecorder recordNumbers:metadata:].cold.3(a2);

        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v22 = v16;
        v45 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v60, v79, 16);
        v9 = v50;
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v61;
          while (1)
          {
            if (*(_QWORD *)v61 != v47)
              objc_enumerationMutation(v22);
            -[_DPDataRecorder keyName](self, "keyName");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v48, 0, 202);

            if (!--v46)
            {
              v46 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v60, v79, 16);
              if (!v46)
                break;
            }
          }
        }
      }
      else
      {
        +[_DPLog framework](_DPLog, "framework");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[_DPDatabaseRecorder recordNumbers:metadata:].cold.4();

        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v22 = v16;
        v34 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
        v9 = v50;
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v65;
          while (1)
          {
            if (*(_QWORD *)v65 != v36)
              objc_enumerationMutation(v22);
            -[_DPDataRecorder keyName](self, "keyName");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v37, 0, 202);

            if (!--v35)
            {
              v35 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
              if (!v35)
                break;
            }
          }
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v11, "randomizeNumbers:forKey:", v16, v12);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      +[_DPLog framework](_DPLog, "framework");
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[_DPDatabaseRecorder recordNumbers:metadata:].cold.2(a2);

      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v22 = v16;
      v39 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v56, v78, 16);
      v9 = v50;
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v57;
        while (1)
        {
          if (*(_QWORD *)v57 != v41)
            objc_enumerationMutation(v22);
          -[_DPDataRecorder keyName](self, "keyName");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v42, 0, 202);

          if (!--v40)
          {
            v40 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v56, v78, 16);
            if (!v40)
              break;
          }
        }
      }
    }
    v16 = v22;
    v32 = v49;
    goto LABEL_61;
  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v12 = v7;
  v18 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v70;
    while (1)
    {
      if (*(_QWORD *)v70 != v20)
        objc_enumerationMutation(v12);
      -[_DPDataRecorder keyName](self, "keyName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v21, 0, 200);

      if (!--v19)
      {
        v19 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
        if (!v19)
          break;
      }
    }
  }
  v16 = v12;
LABEL_62:

  objc_autoreleasePoolPop(v9);
}

- (void)recordNumbersVectors:(id)a3
{
  -[_DPDatabaseRecorder recordNumbersVectors:metadata:](self, "recordNumbersVectors:metadata:", a3, 0);
}

- (void)recordNumbersVectors:(id)a3 metadata:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  _DPStorage *db;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  SEL v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  objc_super v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  uint64_t v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1D8256B78]();
  v73.receiver = self;
  v73.super_class = (Class)_DPDatabaseRecorder;
  -[_DPDataRecorder randomizer](&v73, sel_randomizer);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "randomizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v50 = v9;
    v68.receiver = self;
    v68.super_class = (Class)_DPDatabaseRecorder;
    -[_DPDataRecorder keyName](&v68, sel_keyName);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    +[_DPSubmissionRateLimiter sharedInstance](_DPSubmissionRateLimiter, "sharedInstance");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v49, "debit:forKey:", objc_msgSend(v7, "count"), v12);
    if (objc_msgSend(v7, "count") != v13)
    {
      v14 = 0;
      do
      {
        -[_DPDataRecorder keyName](self, "keyName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v15, 0, 201);

        ++v14;
      }
      while (v14 < objc_msgSend(v7, "count") - v13);
    }
    if (!v13)
    {
      +[_DPLog framework](_DPLog, "framework");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[_DPDatabaseRecorder recordNumbers:metadata:].cold.1();
      v16 = v7;
      goto LABEL_32;
    }
    objc_msgSend(v7, "subarrayWithRange:", 0, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (-[_DPDatabaseRecorder isMetadataValid:](self, "isMetadataValid:", v8))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v11, "randomizeNumbersVectors:metadata:forKey:", v16, v8, v12);
          v17 = objc_claimAutoreleasedReturnValue();
LABEL_22:
          v22 = v17;
          v23 = objc_msgSend(v16, "count");
          if (v23 != -[NSObject count](v22, "count"))
          {
            v24 = 0;
            do
            {
              -[_DPDataRecorder keyName](self, "keyName");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v25, 0, 207);

              ++v24;
              v26 = objc_msgSend(v16, "count");
            }
            while (v24 < v26 - -[NSObject count](v22, "count"));
          }
          if (-[NSObject count](v22, "count"))
          {
            v27 = 0;
            do
            {
              -[_DPDataRecorder keyName](self, "keyName");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v28, 1, 0);

              ++v27;
            }
            while (v27 < -[NSObject count](v22, "count"));
          }
          if (!-[_DPDataRecorder directUpload](self, "directUpload"))
          {
            db = self->_db;
            v51[0] = MEMORY[0x1E0C809B0];
            v51[1] = 3221225472;
            v51[2] = __53___DPDatabaseRecorder_recordNumbersVectors_metadata___block_invoke;
            v51[3] = &unk_1E95D9958;
            v54 = a2;
            v32 = v49;
            v52 = v49;
            v53 = v12;
            v55 = v13;
            -[_DPStorage saveRecords:withCompletion:](db, "saveRecords:withCompletion:", v22, v51);

            v9 = v50;
            goto LABEL_61;
          }
          +[_DPLog framework](_DPLog, "framework");
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = -[NSObject count](v22, "count");
            *(_DWORD *)buf = 138412546;
            v75 = v30;
            v76 = 2048;
            v77 = v31;
            _os_log_impl(&dword_1D3FAA000, v29, OS_LOG_TYPE_INFO, "%@: performing direct upload, count: %ld", buf, 0x16u);

          }
          -[_DPDatabaseRecorder directUploadRecords:forKey:](self, "directUploadRecords:forKey:", v22, v12);
LABEL_32:
          v32 = v49;
          v9 = v50;
LABEL_61:

          goto LABEL_62;
        }
        +[_DPLog framework](_DPLog, "framework");
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          -[_DPDatabaseRecorder recordNumbers:metadata:].cold.3(a2);

        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v22 = v16;
        v45 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v60, v79, 16);
        v9 = v50;
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v61;
          while (1)
          {
            if (*(_QWORD *)v61 != v47)
              objc_enumerationMutation(v22);
            -[_DPDataRecorder keyName](self, "keyName");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v48, 0, 202);

            if (!--v46)
            {
              v46 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v60, v79, 16);
              if (!v46)
                break;
            }
          }
        }
      }
      else
      {
        +[_DPLog framework](_DPLog, "framework");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[_DPDatabaseRecorder recordNumbersVectors:metadata:].cold.4();

        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v22 = v16;
        v34 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
        v9 = v50;
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v65;
          while (1)
          {
            if (*(_QWORD *)v65 != v36)
              objc_enumerationMutation(v22);
            -[_DPDataRecorder keyName](self, "keyName");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v37, 0, 202);

            if (!--v35)
            {
              v35 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
              if (!v35)
                break;
            }
          }
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v11, "randomizeNumbersVectors:forKey:", v16, v12);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      +[_DPLog framework](_DPLog, "framework");
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[_DPDatabaseRecorder recordNumbers:metadata:].cold.2(a2);

      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v22 = v16;
      v39 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v56, v78, 16);
      v9 = v50;
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v57;
        while (1)
        {
          if (*(_QWORD *)v57 != v41)
            objc_enumerationMutation(v22);
          -[_DPDataRecorder keyName](self, "keyName");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v42, 0, 202);

          if (!--v40)
          {
            v40 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v56, v78, 16);
            if (!v40)
              break;
          }
        }
      }
    }
    v16 = v22;
    v32 = v49;
    goto LABEL_61;
  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v12 = v7;
  v18 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v70;
    while (1)
    {
      if (*(_QWORD *)v70 != v20)
        objc_enumerationMutation(v12);
      -[_DPDataRecorder keyName](self, "keyName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v21, 0, 200);

      if (!--v19)
      {
        v19 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
        if (!v19)
          break;
      }
    }
  }
  v16 = v12;
LABEL_62:

  objc_autoreleasePoolPop(v9);
}

- (void)recordBitValues:(id)a3
{
  -[_DPDatabaseRecorder recordBitValues:metadata:](self, "recordBitValues:metadata:", a3, 0);
}

- (void)recordBitValues:(id)a3 metadata:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  _DPStorage *db;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *aSelector;
  void *v49;
  _QWORD v50[4];
  id v51;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  objc_super v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  uint64_t v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1D8256B78]();
  v72.receiver = self;
  v72.super_class = (Class)_DPDatabaseRecorder;
  -[_DPDataRecorder randomizer](&v72, sel_randomizer);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "randomizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v49 = v9;
    v67.receiver = self;
    v67.super_class = (Class)_DPDatabaseRecorder;
    -[_DPDataRecorder keyName](&v67, sel_keyName);
    v12 = objc_claimAutoreleasedReturnValue();
    +[_DPSubmissionRateLimiter sharedInstance](_DPSubmissionRateLimiter, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "debit:forKey:", objc_msgSend(v7, "count"), v12);
    if (objc_msgSend(v7, "count") != v14)
    {
      v15 = 0;
      do
      {
        -[_DPDataRecorder keyName](self, "keyName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v16, 0, 201);

        ++v15;
      }
      while (v15 < objc_msgSend(v7, "count") - v14);
    }
    if (!v14)
    {
      +[_DPLog framework](_DPLog, "framework");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[_DPDatabaseRecorder recordNumbers:metadata:].cold.1();
      v17 = v7;
      goto LABEL_51;
    }
    objc_msgSend(v7, "subarrayWithRange:", 0, v14);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (!-[_DPDatabaseRecorder isMetadataValid:](self, "isMetadataValid:", v8))
      {
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v17 = v17;
        v33 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v64;
          while (1)
          {
            if (*(_QWORD *)v64 != v35)
              objc_enumerationMutation(v17);
            -[_DPDataRecorder keyName](self, "keyName");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v36, 0, 202);

            if (!--v34)
            {
              v34 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
              if (!v34)
                break;
            }
          }
        }

        +[_DPLog framework](_DPLog, "framework");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[_DPDatabaseRecorder recordBitValues:metadata:].cold.5();
        goto LABEL_51;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        aSelector = a2;
        objc_msgSend(v11, "randomizeBitValues:metadata:forKey:", v17, v8, v12);
        v18 = objc_claimAutoreleasedReturnValue();
LABEL_23:
        v23 = v18;
        v24 = objc_msgSend(v17, "count");
        if (v24 != -[NSObject count](v23, "count"))
        {
          v25 = 0;
          do
          {
            -[_DPDataRecorder keyName](self, "keyName");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v26, 0, 207);

            ++v25;
            v27 = objc_msgSend(v17, "count");
          }
          while (v25 < v27 - -[NSObject count](v23, "count"));
        }
        if (-[NSObject count](v23, "count"))
        {
          v28 = 0;
          do
          {
            -[_DPDataRecorder keyName](self, "keyName");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v29, 1, 0);

            ++v28;
          }
          while (v28 < -[NSObject count](v23, "count"));
        }
        if (-[_DPDataRecorder directUpload](self, "directUpload"))
        {
          +[_DPLog framework](_DPLog, "framework");
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(aSelector);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = -[NSObject count](v23, "count");
            *(_DWORD *)buf = 138412546;
            v74 = v31;
            v75 = 2048;
            v76 = v32;
            _os_log_impl(&dword_1D3FAA000, v30, OS_LOG_TYPE_INFO, "%@: performing direct upload, count: %ld", buf, 0x16u);

          }
          -[_DPDatabaseRecorder directUploadRecords:forKey:](self, "directUploadRecords:forKey:", v23, v12);
        }
        else
        {
          db = self->_db;
          v50[0] = MEMORY[0x1E0C809B0];
          v50[1] = 3221225472;
          v50[2] = __48___DPDatabaseRecorder_recordBitValues_metadata___block_invoke;
          v50[3] = &unk_1E95D9958;
          v53 = aSelector;
          v51 = v13;
          v52 = v12;
          v54 = v14;
          -[_DPStorage saveRecords:withCompletion:](db, "saveRecords:withCompletion:", v23, v50);

        }
LABEL_51:
        v9 = v49;
LABEL_61:

        goto LABEL_62;
      }
      +[_DPLog framework](_DPLog, "framework");
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        -[_DPDatabaseRecorder recordNumbers:metadata:].cold.3(a2);

      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v23 = v17;
      v44 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v59, v78, 16);
      v9 = v49;
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v60;
        while (1)
        {
          if (*(_QWORD *)v60 != v46)
            objc_enumerationMutation(v23);
          -[_DPDataRecorder keyName](self, "keyName");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v47, 0, 206);

          if (!--v45)
          {
            v45 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v59, v78, 16);
            if (!v45)
              break;
          }
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        aSelector = a2;
        objc_msgSend(v11, "randomizeBitValues:forKey:", v17, v12);
        v18 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      +[_DPLog framework](_DPLog, "framework");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        -[_DPDatabaseRecorder recordBitValues:metadata:].cold.3(a2);

      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v23 = v17;
      v38 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v55, v77, 16);
      v9 = v49;
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v56;
        while (1)
        {
          if (*(_QWORD *)v56 != v40)
            objc_enumerationMutation(v23);
          -[_DPDataRecorder keyName](self, "keyName");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v41, 0, 206);

          if (!--v39)
          {
            v39 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v55, v77, 16);
            if (!v39)
              break;
          }
        }
      }
    }
    v17 = v23;
    goto LABEL_61;
  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v17 = v7;
  v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v69;
    while (1)
    {
      if (*(_QWORD *)v69 != v21)
        objc_enumerationMutation(v17);
      -[_DPDataRecorder keyName](self, "keyName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v22, 0, 200);

      if (!--v20)
      {
        v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
        if (!v20)
          break;
      }
    }
  }

  +[_DPLog daemon](_DPLog, "daemon");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[_DPDatabaseRecorder recordBitValues:metadata:].cold.1(v12);
LABEL_62:

  objc_autoreleasePoolPop(v9);
}

- (void)recordBitVectors:(id)a3
{
  -[_DPDatabaseRecorder recordBitVectors:metadata:](self, "recordBitVectors:metadata:", a3, 0);
}

- (void)recordBitVectors:(id)a3 metadata:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  _DPStorage *db;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  SEL v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  objc_super v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  uint64_t v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1D8256B78]();
  v73.receiver = self;
  v73.super_class = (Class)_DPDatabaseRecorder;
  -[_DPDataRecorder randomizer](&v73, sel_randomizer);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "randomizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v50 = v9;
    v68.receiver = self;
    v68.super_class = (Class)_DPDatabaseRecorder;
    -[_DPDataRecorder keyName](&v68, sel_keyName);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    +[_DPSubmissionRateLimiter sharedInstance](_DPSubmissionRateLimiter, "sharedInstance");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v49, "debit:forKey:", objc_msgSend(v7, "count"), v12);
    if (objc_msgSend(v7, "count") != v13)
    {
      v14 = 0;
      do
      {
        -[_DPDataRecorder keyName](self, "keyName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v15, 0, 201);

        ++v14;
      }
      while (v14 < objc_msgSend(v7, "count") - v13);
    }
    if (!v13)
    {
      +[_DPLog framework](_DPLog, "framework");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[_DPDatabaseRecorder recordNumbers:metadata:].cold.1();
      v16 = v7;
      goto LABEL_32;
    }
    objc_msgSend(v7, "subarrayWithRange:", 0, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (-[_DPDatabaseRecorder isMetadataValid:](self, "isMetadataValid:", v8))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v11, "randomizeBitVectors:metadata:forKey:", v16, v8, v12);
          v17 = objc_claimAutoreleasedReturnValue();
LABEL_22:
          v22 = v17;
          v23 = objc_msgSend(v16, "count");
          if (v23 != -[NSObject count](v22, "count"))
          {
            v24 = 0;
            do
            {
              -[_DPDataRecorder keyName](self, "keyName");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v25, 0, 207);

              ++v24;
              v26 = objc_msgSend(v16, "count");
            }
            while (v24 < v26 - -[NSObject count](v22, "count"));
          }
          if (-[NSObject count](v22, "count"))
          {
            v27 = 0;
            do
            {
              -[_DPDataRecorder keyName](self, "keyName");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v28, 1, 0);

              ++v27;
            }
            while (v27 < -[NSObject count](v22, "count"));
          }
          if (!-[_DPDataRecorder directUpload](self, "directUpload"))
          {
            db = self->_db;
            v51[0] = MEMORY[0x1E0C809B0];
            v51[1] = 3221225472;
            v51[2] = __49___DPDatabaseRecorder_recordBitVectors_metadata___block_invoke;
            v51[3] = &unk_1E95D9958;
            v54 = a2;
            v32 = v49;
            v52 = v49;
            v53 = v12;
            v55 = v13;
            -[_DPStorage saveRecords:withCompletion:](db, "saveRecords:withCompletion:", v22, v51);

            v9 = v50;
            goto LABEL_61;
          }
          +[_DPLog framework](_DPLog, "framework");
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = -[NSObject count](v22, "count");
            *(_DWORD *)buf = 138412546;
            v75 = v30;
            v76 = 2048;
            v77 = v31;
            _os_log_impl(&dword_1D3FAA000, v29, OS_LOG_TYPE_INFO, "%@: performing direct upload, count: %ld", buf, 0x16u);

          }
          -[_DPDatabaseRecorder directUploadRecords:forKey:](self, "directUploadRecords:forKey:", v22, v12);
LABEL_32:
          v32 = v49;
          v9 = v50;
LABEL_61:

          goto LABEL_62;
        }
        +[_DPLog framework](_DPLog, "framework");
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          -[_DPDatabaseRecorder recordNumbers:metadata:].cold.3(a2);

        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v22 = v16;
        v45 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v60, v79, 16);
        v9 = v50;
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v61;
          while (1)
          {
            if (*(_QWORD *)v61 != v47)
              objc_enumerationMutation(v22);
            -[_DPDataRecorder keyName](self, "keyName");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v48, 0, 206);

            if (!--v46)
            {
              v46 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v60, v79, 16);
              if (!v46)
                break;
            }
          }
        }
      }
      else
      {
        +[_DPLog framework](_DPLog, "framework");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[_DPDatabaseRecorder recordBitValues:metadata:].cold.5();

        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v22 = v16;
        v34 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
        v9 = v50;
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v65;
          while (1)
          {
            if (*(_QWORD *)v65 != v36)
              objc_enumerationMutation(v22);
            -[_DPDataRecorder keyName](self, "keyName");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v37, 0, 202);

            if (!--v35)
            {
              v35 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
              if (!v35)
                break;
            }
          }
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v11, "randomizeBitVectors:forKey:", v16, v12);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      +[_DPLog framework](_DPLog, "framework");
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[_DPDatabaseRecorder recordBitVectors:metadata:].cold.2();

      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v22 = v16;
      v39 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v56, v78, 16);
      v9 = v50;
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v57;
        while (1)
        {
          if (*(_QWORD *)v57 != v41)
            objc_enumerationMutation(v22);
          -[_DPDataRecorder keyName](self, "keyName");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v42, 0, 206);

          if (!--v40)
          {
            v40 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v56, v78, 16);
            if (!v40)
              break;
          }
        }
      }
    }
    v16 = v22;
    v32 = v49;
    goto LABEL_61;
  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v12 = v7;
  v18 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v70;
    while (1)
    {
      if (*(_QWORD *)v70 != v20)
        objc_enumerationMutation(v12);
      -[_DPDataRecorder keyName](self, "keyName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v21, 0, 200);

      if (!--v19)
      {
        v19 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
        if (!v19)
          break;
      }
    }
  }
  v16 = v12;
LABEL_62:

  objc_autoreleasePoolPop(v9);
}

- (void)recordFloatVectors:(id)a3
{
  -[_DPDatabaseRecorder recordFloatVectors:metadata:](self, "recordFloatVectors:metadata:", a3, 0);
}

- (void)recordFloatVectors:(id)a3 metadata:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  _DPStorage *db;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  SEL v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  objc_super v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  uint64_t v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1D8256B78]();
  v73.receiver = self;
  v73.super_class = (Class)_DPDatabaseRecorder;
  -[_DPDataRecorder randomizer](&v73, sel_randomizer);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "randomizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v50 = v9;
    v68.receiver = self;
    v68.super_class = (Class)_DPDatabaseRecorder;
    -[_DPDataRecorder keyName](&v68, sel_keyName);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    +[_DPSubmissionRateLimiter sharedInstance](_DPSubmissionRateLimiter, "sharedInstance");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v49, "debit:forKey:", objc_msgSend(v7, "count"), v12);
    if (objc_msgSend(v7, "count") != v13)
    {
      v14 = 0;
      do
      {
        -[_DPDataRecorder keyName](self, "keyName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v15, 0, 201);

        ++v14;
      }
      while (v14 < objc_msgSend(v7, "count") - v13);
    }
    if (!v13)
    {
      +[_DPLog framework](_DPLog, "framework");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[_DPDatabaseRecorder recordNumbers:metadata:].cold.1();
      v16 = v7;
      goto LABEL_32;
    }
    objc_msgSend(v7, "subarrayWithRange:", 0, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (-[_DPDatabaseRecorder isMetadataValid:](self, "isMetadataValid:", v8))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v11, "randomizeFloatVectors:metadata:forKey:", v16, v8, v12);
          v17 = objc_claimAutoreleasedReturnValue();
LABEL_22:
          v22 = v17;
          v23 = objc_msgSend(v16, "count");
          if (v23 != -[NSObject count](v22, "count"))
          {
            v24 = 0;
            do
            {
              -[_DPDataRecorder keyName](self, "keyName");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v25, 0, 207);

              ++v24;
              v26 = objc_msgSend(v16, "count");
            }
            while (v24 < v26 - -[NSObject count](v22, "count"));
          }
          if (-[NSObject count](v22, "count"))
          {
            v27 = 0;
            do
            {
              -[_DPDataRecorder keyName](self, "keyName");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v28, 1, 0);

              ++v27;
            }
            while (v27 < -[NSObject count](v22, "count"));
          }
          if (!-[_DPDataRecorder directUpload](self, "directUpload"))
          {
            db = self->_db;
            v51[0] = MEMORY[0x1E0C809B0];
            v51[1] = 3221225472;
            v51[2] = __51___DPDatabaseRecorder_recordFloatVectors_metadata___block_invoke;
            v51[3] = &unk_1E95D9958;
            v54 = a2;
            v32 = v49;
            v52 = v49;
            v53 = v12;
            v55 = v13;
            -[_DPStorage saveRecords:withCompletion:](db, "saveRecords:withCompletion:", v22, v51);

            v9 = v50;
            goto LABEL_61;
          }
          +[_DPLog framework](_DPLog, "framework");
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = -[NSObject count](v22, "count");
            *(_DWORD *)buf = 138412546;
            v75 = v30;
            v76 = 2048;
            v77 = v31;
            _os_log_impl(&dword_1D3FAA000, v29, OS_LOG_TYPE_INFO, "%@: performing direct upload, count: %ld", buf, 0x16u);

          }
          -[_DPDatabaseRecorder directUploadRecords:forKey:](self, "directUploadRecords:forKey:", v22, v12);
LABEL_32:
          v32 = v49;
          v9 = v50;
LABEL_61:

          goto LABEL_62;
        }
        +[_DPLog framework](_DPLog, "framework");
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          -[_DPDatabaseRecorder recordFloatVectors:metadata:].cold.3();

        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v22 = v16;
        v45 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v60, v79, 16);
        v9 = v50;
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v61;
          while (1)
          {
            if (*(_QWORD *)v61 != v47)
              objc_enumerationMutation(v22);
            -[_DPDataRecorder keyName](self, "keyName");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v48, 0, 206);

            if (!--v46)
            {
              v46 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v60, v79, 16);
              if (!v46)
                break;
            }
          }
        }
      }
      else
      {
        +[_DPLog framework](_DPLog, "framework");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[_DPDatabaseRecorder recordFloatVectors:metadata:].cold.4();

        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v22 = v16;
        v34 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
        v9 = v50;
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v65;
          while (1)
          {
            if (*(_QWORD *)v65 != v36)
              objc_enumerationMutation(v22);
            -[_DPDataRecorder keyName](self, "keyName");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v37, 0, 202);

            if (!--v35)
            {
              v35 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
              if (!v35)
                break;
            }
          }
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v11, "randomizeFloatVectors:forKey:", v16, v12);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      +[_DPLog framework](_DPLog, "framework");
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[_DPDatabaseRecorder recordFloatVectors:metadata:].cold.2();

      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v22 = v16;
      v39 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v56, v78, 16);
      v9 = v50;
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v57;
        while (1)
        {
          if (*(_QWORD *)v57 != v41)
            objc_enumerationMutation(v22);
          -[_DPDataRecorder keyName](self, "keyName");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v42, 0, 206);

          if (!--v40)
          {
            v40 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v56, v78, 16);
            if (!v40)
              break;
          }
        }
      }
    }
    v16 = v22;
    v32 = v49;
    goto LABEL_61;
  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v12 = v7;
  v18 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v70;
    while (1)
    {
      if (*(_QWORD *)v70 != v20)
        objc_enumerationMutation(v12);
      -[_DPDataRecorder keyName](self, "keyName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v21, 0, 200);

      if (!--v19)
      {
        v19 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
        if (!v19)
          break;
      }
    }
  }
  v16 = v12;
LABEL_62:

  objc_autoreleasePoolPop(v9);
}

- (void)recordStrings:(id)a3
{
  -[_DPDatabaseRecorder recordStrings:metadata:](self, "recordStrings:metadata:", a3, 0);
}

- (void)recordStrings:(id)a3 metadata:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  _DPStorage *db;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *aSelector;
  void *v57;
  void *v58;
  _QWORD v59[4];
  id v60;
  id v61;
  const char *v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  objc_super v76;
  _QWORD v77[5];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  objc_super v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  uint64_t v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1D8256B78]();
  v82.receiver = self;
  v82.super_class = (Class)_DPDatabaseRecorder;
  -[_DPDataRecorder randomizer](&v82, sel_randomizer);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "randomizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v57 = v9;
    v12 = v7;
    -[_DPDatabaseRecorder blacklistSet](self, "blacklistSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v12;
    if (v13)
    {
      v77[0] = MEMORY[0x1E0C809B0];
      v77[1] = 3221225472;
      v77[2] = __46___DPDatabaseRecorder_recordStrings_metadata___block_invoke;
      v77[3] = &unk_1E95D96D8;
      v77[4] = self;
      objc_msgSend(v12, "indexesOfObjectsPassingTest:", v77);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "mutableCopy");
      objc_msgSend(v14, "removeObjectsAtIndexes:", v15);

    }
    v16 = objc_msgSend(v12, "count");
    if (v16 != objc_msgSend(v14, "count"))
    {
      v17 = 0;
      do
      {
        -[_DPDataRecorder keyName](self, "keyName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v18, 0, 201);

        ++v17;
        v19 = objc_msgSend(v12, "count");
      }
      while (v17 < v19 - objc_msgSend(v14, "count"));
    }
    v76.receiver = self;
    v76.super_class = (Class)_DPDatabaseRecorder;
    -[_DPDataRecorder keyName](&v76, sel_keyName);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DPSubmissionRateLimiter sharedInstance](_DPSubmissionRateLimiter, "sharedInstance");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v58, "debit:forKey:", objc_msgSend(v14, "count"), v20);
    if (objc_msgSend(v14, "count") != v21)
    {
      v22 = 0;
      do
      {
        -[_DPDataRecorder keyName](self, "keyName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v23, 0, 201);

        ++v22;
      }
      while (v22 < objc_msgSend(v14, "count") - v21);
    }
    if (!v21)
    {
      +[_DPLog framework](_DPLog, "framework");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        -[_DPDatabaseRecorder recordNumbers:metadata:].cold.1();
      v24 = v14;
      goto LABEL_65;
    }
    objc_msgSend(v14, "subarrayWithRange:", 0, v21);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (-[_DPDatabaseRecorder isMetadataValid:](self, "isMetadataValid:", v8))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          aSelector = a2;
          objc_msgSend(v11, "randomizeStrings:metadata:forKey:", v24, v8, v20);
          v25 = objc_claimAutoreleasedReturnValue();
LABEL_27:
          v30 = v25;
          v31 = objc_msgSend(v24, "count");
          if (v31 != -[NSObject count](v30, "count"))
          {
            v32 = 0;
            do
            {
              -[_DPDataRecorder keyName](self, "keyName");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v33, 0, 207);

              ++v32;
              v34 = objc_msgSend(v24, "count");
            }
            while (v32 < v34 - -[NSObject count](v30, "count"));
          }
          if (-[NSObject count](v30, "count"))
          {
            v35 = 0;
            do
            {
              -[_DPDataRecorder keyName](self, "keyName");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v36, 1, 0);

              ++v35;
            }
            while (v35 < -[NSObject count](v30, "count"));
          }
          if (-[_DPDataRecorder directUpload](self, "directUpload"))
          {
            +[_DPLog framework](_DPLog, "framework");
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(aSelector);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = -[NSObject count](v30, "count");
              *(_DWORD *)buf = 138412546;
              v84 = v38;
              v85 = 2048;
              v86 = v39;
              _os_log_impl(&dword_1D3FAA000, v37, OS_LOG_TYPE_INFO, "%@: performing direct upload, count: %ld", buf, 0x16u);

            }
            -[_DPDatabaseRecorder directUploadRecords:forKey:](self, "directUploadRecords:forKey:", v30, v20);
          }
          else
          {
            db = self->_db;
            v59[0] = MEMORY[0x1E0C809B0];
            v59[1] = 3221225472;
            v59[2] = __46___DPDatabaseRecorder_recordStrings_metadata___block_invoke_34;
            v59[3] = &unk_1E95D9958;
            v62 = aSelector;
            v60 = v58;
            v61 = v20;
            v63 = v21;
            -[_DPStorage saveRecords:withCompletion:](db, "saveRecords:withCompletion:", v30, v59);

          }
          goto LABEL_65;
        }
        +[_DPLog framework](_DPLog, "framework");
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          -[_DPDatabaseRecorder recordFloatVectors:metadata:].cold.3();

        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v30 = v24;
        v52 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v68, v88, 16);
        if (v52)
        {
          v53 = v52;
          v54 = *(_QWORD *)v69;
          while (1)
          {
            if (*(_QWORD *)v69 != v54)
              objc_enumerationMutation(v30);
            -[_DPDataRecorder keyName](self, "keyName");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v55, 0, 202);

            if (!--v53)
            {
              v53 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v68, v88, 16);
              if (!v53)
                break;
            }
          }
        }
      }
      else
      {
        +[_DPLog framework](_DPLog, "framework");
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          -[_DPDatabaseRecorder recordStrings:metadata:].cold.4();

        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v30 = v24;
        v41 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v73;
          while (1)
          {
            if (*(_QWORD *)v73 != v43)
              objc_enumerationMutation(v30);
            -[_DPDataRecorder keyName](self, "keyName");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v44, 0, 200);

            if (!--v42)
            {
              v42 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
              if (!v42)
                break;
            }
          }
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        aSelector = a2;
        objc_msgSend(v11, "randomizeStrings:forKey:", v24, v20);
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      +[_DPLog framework](_DPLog, "framework");
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        -[_DPDatabaseRecorder recordStrings:metadata:].cold.2();

      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v30 = v24;
      v46 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v64, v87, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v65;
        while (1)
        {
          if (*(_QWORD *)v65 != v48)
            objc_enumerationMutation(v30);
          -[_DPDataRecorder keyName](self, "keyName");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v49, 0, 206);

          if (!--v47)
          {
            v47 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v64, v87, 16);
            if (!v47)
              break;
          }
        }
      }
    }
    v24 = v30;
LABEL_65:
    v9 = v57;

    goto LABEL_66;
  }
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v24 = v7;
  v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v79;
    while (1)
    {
      if (*(_QWORD *)v79 != v28)
        objc_enumerationMutation(v24);
      -[_DPDataRecorder keyName](self, "keyName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v29, 0, 200);

      if (!--v27)
      {
        v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
        if (!v27)
          break;
      }
    }
  }
LABEL_66:

  objc_autoreleasePoolPop(v9);
}

- (void)recordWords:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  _DPDatabaseRecorder *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  _DPDatabaseRecorder *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  _DPStorage *db;
  const char *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[4];
  id v60;
  id v61;
  const char *v62;
  uint64_t v63;
  objc_super v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  objc_super v69;
  objc_super v70;
  objc_super v71;
  objc_super v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  uint64_t v76;
  _BYTE v77[128];
  _QWORD v78[4];

  v78[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D8256B78]();
  v72.receiver = self;
  v72.super_class = (Class)_DPDatabaseRecorder;
  -[_DPDataRecorder randomizer](&v72, sel_randomizer);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "randomizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[_DPDataRecorder keyName](self, "keyName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v18, 0, 200);
    goto LABEL_45;
  }
  v58 = v8;
  v71.receiver = self;
  v71.super_class = (Class)_DPDatabaseRecorder;
  v9 = -[_DPDataRecorder fragmentWidth](&v71, sel_fragmentWidth);
  v70.receiver = self;
  v70.super_class = (Class)_DPDatabaseRecorder;
  v10 = -[_DPDataRecorder fragmentCount](&v70, sel_fragmentCount);
  v69.receiver = self;
  v69.super_class = (Class)_DPDatabaseRecorder;
  v57 = v6;
  v54 = v9;
  if (-[_DPDataRecorder bitStringAlgorithm](&v69, sel_bitStringAlgorithm))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("wordPosition"), 1);
    v78[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingDescriptors:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "valueForKeyPath:", CFSTR("@unionOfObjects.word"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR(" "));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[_DPWordRecord word:atPosition:](_DPWordRecord, "word:atPosition:", v15, &unk_1E96FB010);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObject:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[_DPWordRecord sequenceAndFragmentsFrom:fragmentLimit:fragmentWidth:puzzlePieceCount:](_DPWordRecord, "sequenceAndFragmentsFrom:fragmentLimit:fragmentWidth:puzzlePieceCount:", v5, v10, v9, -[_DPDatabaseRecorder puzzlePieceCount](self, "puzzlePieceCount"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v56 = v17;
  if (!self->_blacklistSet)
    goto LABEL_31;
  v53 = a2;
  v55 = v5;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v19 = v17;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
  if (!v20)
    goto LABEL_15;
  v21 = v20;
  v22 = *(_QWORD *)v66;
  while (2)
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v66 != v22)
        objc_enumerationMutation(v19);
      v24 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
      objc_msgSend(v24, "wordPosition", v53);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToNumber:", &unk_1E96FB010);

      if ((v26 & 1) != 0)
      {
        v27 = v24;

        if (!v27)
          goto LABEL_22;
        objc_msgSend(v27, "sequenceWithoutPadding");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v55;
        v8 = v58;
        if (!v28)
        {
          +[_DPLog daemon](_DPLog, "daemon");
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            -[_DPDatabaseRecorder recordWords:].cold.4();

          -[_DPDataRecorder keyName](self, "keyName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = self;
          v32 = v30;
          v33 = 204;
          goto LABEL_28;
        }
        if (-[NSSet containsObject:](self->_blacklistSet, "containsObject:", v28))
        {
          +[_DPLog daemon](_DPLog, "daemon");
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            __46___DPDatabaseRecorder_recordStrings_metadata___block_invoke_cold_1();

          -[_DPDataRecorder keyName](self, "keyName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = self;
          v32 = v30;
          v33 = 205;
LABEL_28:
          -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](v31, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v32, 0, v33);

          goto LABEL_29;
        }

        a2 = v53;
LABEL_31:
        v64.receiver = self;
        v64.super_class = (Class)_DPDatabaseRecorder;
        -[_DPDataRecorder keyName](&v64, sel_keyName);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DPSubmissionRateLimiter sharedInstance](_DPSubmissionRateLimiter, "sharedInstance");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "debit:forKey:", 1, v37);
        if (v39)
        {
          v40 = v39;
          v41 = a2;
          v8 = v58;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v58, "randomizeWords:fragmentWidth:forKey:", v56, v54, v37);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DPDataRecorder keyName](self, "keyName");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v43, 1, 0);

            if (-[_DPDataRecorder directUpload](self, "directUpload"))
            {
              +[_DPLog framework](_DPLog, "framework");
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
              {
                NSStringFromSelector(v41);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = objc_msgSend(v42, "count");
                *(_DWORD *)buf = 138412546;
                v74 = v45;
                v75 = 2048;
                v76 = v46;
                _os_log_impl(&dword_1D3FAA000, v44, OS_LOG_TYPE_INFO, "%@: performing direct upload, count: %ld", buf, 0x16u);

              }
              -[_DPDatabaseRecorder directUploadRecords:forKey:](self, "directUploadRecords:forKey:", v42, v37);
            }
            else
            {
              db = self->_db;
              v59[0] = MEMORY[0x1E0C809B0];
              v59[1] = 3221225472;
              v59[2] = __35___DPDatabaseRecorder_recordWords___block_invoke;
              v59[3] = &unk_1E95D9958;
              v62 = v41;
              v60 = v38;
              v61 = v37;
              v63 = v40;
              -[_DPStorage saveRecords:withCompletion:](db, "saveRecords:withCompletion:", v42, v59);

            }
            goto LABEL_44;
          }
          +[_DPLog framework](_DPLog, "framework");
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            -[_DPDatabaseRecorder recordStrings:metadata:].cold.2();

          -[_DPDataRecorder keyName](self, "keyName");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = self;
          v49 = v42;
          v50 = 206;
        }
        else
        {
          +[_DPLog framework](_DPLog, "framework");
          v47 = objc_claimAutoreleasedReturnValue();
          v8 = v58;
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            -[_DPDatabaseRecorder recordNumbers:metadata:].cold.1();

          -[_DPDataRecorder keyName](self, "keyName");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = self;
          v49 = v42;
          v50 = 201;
        }
        -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](v48, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v49, 0, v50);
LABEL_44:
        v18 = v56;
        v6 = v57;

        goto LABEL_45;
      }
    }
    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
    if (v21)
      continue;
    break;
  }
LABEL_15:

LABEL_22:
  +[_DPLog daemon](_DPLog, "daemon", v53);
  v34 = objc_claimAutoreleasedReturnValue();
  v5 = v55;
  v8 = v58;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    -[_DPDatabaseRecorder recordWords:].cold.3();

  -[_DPDataRecorder keyName](self, "keyName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:", v35, 0, 203);

LABEL_29:
  v18 = v19;
LABEL_45:

  objc_autoreleasePoolPop(v6);
}

- (void)directUploadRecords:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "transport") == 4)
  {
    +[_DPDediscoReporter filterNonConformingDediscoRecordsFrom:](_DPDediscoReporter, "filterNonConformingDediscoRecordsFrom:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_opt_new();
    -[_DPDatabaseRecorder db](self, "db");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "directlyUploadDediscoRecords:forKey:keyProperties:storage:", v10, v8, v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[_DPLog framework](_DPLog, "framework");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v15;
      v18 = 2048;
      v19 = objc_msgSend(v13, "count");
      v20 = 2048;
      v21 = -[NSObject count](v10, "count");
      _os_log_impl(&dword_1D3FAA000, v14, OS_LOG_TYPE_DEFAULT, "%@: successfully submitted %ld of %ld records", (uint8_t *)&v16, 0x20u);

    }
  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_DPDatabaseRecorder directUploadRecords:forKey:].cold.1(a2);
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { database=%@ }"), v5, self->_db);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isMetadataValid:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t j;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _DPMetadataRequiredKeys();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _DPMetadataOptionalKeys();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    v10 = 1;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        if ((v10 & 1) != 0)
        {
          v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v3, "allKeys");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v13, "containsObject:", v12);

        }
        else
        {
          v10 = 0;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 1;
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    v18 = 1;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        if ((v18 & 1) != 0)
        {
          v20 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
          if ((objc_msgSend(v6, "containsObject:", v20) & 1) != 0)
            v18 = 1;
          else
            v18 = objc_msgSend(v5, "containsObject:", v20);
        }
        else
        {
          v18 = 0;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v16);
  }
  else
  {
    v18 = 1;
  }

  return v10 & v18;
}

- (void)donateRandomizationEventToBitacoraForKey:(id)a3 succeeded:(BOOL)a4 errorCode:(int)a5
{
  uint64_t v5;
  _BOOL8 v6;
  const __CFString *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  id v11;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v11 = a3;
  switch((int)v5)
  {
    case 200:
      v7 = CFSTR("Failed to create randomizer");
      break;
    case 201:
      v7 = CFSTR("Rate limited");
      break;
    case 202:
      v7 = CFSTR("Malformed metadata provided");
      break;
    case 203:
      v7 = CFSTR("recordWords, missing sequence");
      break;
    case 204:
      v7 = CFSTR("recordWords, missing sequence without padding");
      break;
    case 205:
      v7 = CFSTR("recordWords, missing sequence without padding blacklisted");
      break;
    default:
      if ((_DWORD)v5)
        v7 = &stru_1E95DA470;
      else
        v7 = 0;
      break;
  }
  +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_msgSend(v8, "telemetryAllowed") & 1) != 0
    || +[_DPDeviceInfo isInternalBuild](_DPDeviceInfo, "isInternalBuild");
  LOBYTE(v10) = v9;
  +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:telemetryAllowed:", v11, 2, 0, v6, v5, v7, v10);

}

- (_DPStorage)db
{
  return self->_db;
}

- (NSSet)blacklistSet
{
  return self->_blacklistSet;
}

- (unint64_t)puzzlePieceCount
{
  return self->_puzzlePieceCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blacklistSet, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)recordNumbers:metadata:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5_0(&dword_1D3FAA000, v2, v3, "%@: Not recording : rate limiting %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)recordNumbers:(const char *)a1 metadata:.cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_3(&dword_1D3FAA000, v2, v3, "%@: metadata is not provided, but method that should accepts values without metadata is not supported", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)recordNumbers:(const char *)a1 metadata:.cold.3(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_3(&dword_1D3FAA000, v2, v3, "%@: metadata is provided, but method that should accepts it is not supported", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)recordNumbers:metadata:.cold.4()
{
  void *v0;
  SEL v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D3FAA000, v3, v4, "%@: failed to save numbers records with invalid metadata (keys: %@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)recordNumbersVectors:metadata:.cold.4()
{
  void *v0;
  SEL v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D3FAA000, v3, v4, "%@: failed to save number vectors records with invalid metadata (keys: %@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)recordBitValues:(os_log_t)log metadata:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D3FAA000, log, OS_LOG_TYPE_ERROR, "Fail to create randomizer", v1, 2u);
}

- (void)recordBitValues:(const char *)a1 metadata:.cold.3(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_3(&dword_1D3FAA000, v2, v3, "%@: method not supported", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)recordBitValues:metadata:.cold.5()
{
  void *v0;
  SEL v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D3FAA000, v3, v4, "%@: failed to save bitvalue records with invalid metadata (keys: %@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)recordBitVectors:metadata:.cold.2()
{
  void *v0;
  SEL v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (const char *)OUTLINED_FUNCTION_10();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D3FAA000, v4, v5, "%@: method=%@ not supported", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

- (void)recordFloatVectors:metadata:.cold.2()
{
  void *v0;
  SEL v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (const char *)OUTLINED_FUNCTION_10();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D3FAA000, v4, v5, "%@: metadata is not provided, but method=(%@) not supported", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

- (void)recordFloatVectors:metadata:.cold.3()
{
  void *v0;
  SEL v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (const char *)OUTLINED_FUNCTION_10();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D3FAA000, v4, v5, "%@: metadata is provided, but method=(%@) not supported", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

- (void)recordFloatVectors:metadata:.cold.4()
{
  void *v0;
  SEL v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D3FAA000, v3, v4, "%@: failed to save floatvector records with invalid metadata (keys: %@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)recordStrings:metadata:.cold.2()
{
  void *v0;
  SEL v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (const char *)OUTLINED_FUNCTION_10();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D3FAA000, v4, v5, "%@: method=(%@) not supported", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

- (void)recordStrings:metadata:.cold.4()
{
  void *v0;
  SEL v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D3FAA000, v3, v4, "%@: failed to save string records with invalid metadata (keys: %@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)recordWords:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_2(&dword_1D3FAA000, v0, v1, "Missing sequence in %@ - not recording in DB", v2);
  OUTLINED_FUNCTION_1();
}

- (void)recordWords:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_2(&dword_1D3FAA000, v0, v1, "Missing sequenceWithoutPadding in %@ - not recording in DB", v2);
  OUTLINED_FUNCTION_1();
}

- (void)directUploadRecords:(const char *)a1 forKey:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_3(&dword_1D3FAA000, v2, v3, "%@: unrecognized transport for direct upload, cannot proceed", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

@end
