@implementation NRDataFileHistoryHelpers

+ (id)unarchiveDeviceHistory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3710];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NRDataFilePaths pathToNanoRegistryHistoryFile](NRDataFilePaths, "pathToNanoRegistryHistoryFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nr_secureUnarchiveObjectOfClasses:withFile:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      nr_daemon_log();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

      if (v7)
      {
        nr_daemon_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          +[NRDataFilePaths pathToNanoRegistryHistoryFile](NRDataFilePaths, "pathToNanoRegistryHistoryFile");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138543618;
          v14 = v10;
          v15 = 2114;
          v16 = v12;
          _os_log_error_impl(&dword_1A0BDB000, v8, OS_LOG_TYPE_ERROR, "Failure loading history file %{public}@: File has incorrect object %{public}@.", (uint8_t *)&v13, 0x16u);

        }
      }

      v5 = 0;
    }
  }
  return v5;
}

+ (BOOL)archiveDeviceHistory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[NRDataFilePaths pathToNanoRegistryHistoryFile](NRDataFilePaths, "pathToNanoRegistryHistoryFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "dirty"))
  {
    v5 = (void *)MEMORY[0x1A1B01C40]();
    objc_msgSend(MEMORY[0x1E0CB36F8], "nr_secureArchivedDataWithRootObject:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v15 = 0;
      v8 = objc_msgSend(v6, "writeToFile:options:error:", v4, 268435457, &v15);
      v9 = v15;
      if ((v8 & 1) != 0)
      {
        LOBYTE(v10) = 1;
LABEL_15:

        objc_autoreleasePoolPop(v5);
        goto LABEL_16;
      }
      nr_daemon_log();
      v12 = objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

      if (!(_DWORD)v10)
        goto LABEL_15;
      nr_daemon_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "nr_safeDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v17 = v4;
        v18 = 2114;
        v19 = v14;
        _os_log_error_impl(&dword_1A0BDB000, v10, OS_LOG_TYPE_ERROR, "Failure saving active state machine file %{public}@: writeToFile returned \"NO\" %{public}@", buf, 0x16u);

      }
    }
    else
    {
      nr_daemon_log();
      v11 = objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

      if (!(_DWORD)v10)
      {
        v9 = 0;
        goto LABEL_15;
      }
      nr_daemon_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v4;
        _os_log_error_impl(&dword_1A0BDB000, v10, OS_LOG_TYPE_ERROR, "Failure saving history file %{public}@: Archiver returned \"nil\", buf, 0xCu);
      }
      v9 = 0;
    }

    LOBYTE(v10) = 0;
    goto LABEL_15;
  }
  v9 = 0;
  LOBYTE(v10) = 1;
LABEL_16:

  return (char)v10;
}

void __64__NRDataFileHistoryHelpers_findPairedDateForDeviceID_inHistory___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a4;
  if (objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32))
    && objc_msgSend(v9, "isEqual:", MEMORY[0x1E0C9AAB0]))
  {
    objc_msgSend(*(id *)(a1 + 40), "date");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

+ (BOOL)createMissingDates:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NRDevicePropertyDiffType *v28;
  NRDevicePropertyDiff *v29;
  NRDevicePropertyDiffType *v30;
  void *v31;
  uint64_t v32;
  NRDevicePropertyDiffType *v33;
  NRDevicePropertyDiff *v34;
  NRDevicePropertyDiffType *v35;
  NRDeviceDiff *v36;
  NRDeviceDiffType *v37;
  NRDeviceCollectionDiff *v38;
  void *v39;
  id v40;
  BOOL v41;
  const __CFString *v43;
  void *v44;
  id obj;
  int isKindOfClass;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t i;
  _QWORD *v60;
  uint64_t v61;
  __CFString *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[2];
  void (*v68)(uint64_t, void *, uint64_t, void *);
  void *v69;
  id v70;
  void *v71;
  uint64_t *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  objc_msgSend(v50, "deviceCollection");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v87, 16);
  if (v48)
  {
    v47 = *(_QWORD *)v64;
    v43 = CFSTR("lastActiveDate");
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v64 != v47)
        {
          v4 = v3;
          objc_enumerationMutation(obj);
          v3 = v4;
        }
        v49 = v3;
        v52 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v3);
        objc_msgSend(v50, "deviceCollection", v43);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v52);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("isPaired"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "value");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "BOOLValue");

        if (v8)
        {
          objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("pairedDate"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "value");
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          v10 = (void *)MEMORY[0x1E0C99D68];
          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v51, "doubleValue");
            objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
            v11 = (id)objc_claimAutoreleasedReturnValue();
            if (!v11)
              goto LABEL_12;
LABEL_29:
            v28 = [NRDevicePropertyDiffType alloc];
            v29 = -[NRDevicePropertyDiff initWithValue:]([NRDevicePropertyDiff alloc], "initWithValue:", v11);
            v30 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:](v28, "initWithDiff:andChangeType:", v29, 1);

            objc_msgSend(v53, "setObject:forKeyedSubscript:", v30, CFSTR("pairedDate"));
            if (v11)
            {
LABEL_30:
              objc_msgSend(v54, "objectForKeyedSubscript:", v43);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "value");
              v32 = objc_claimAutoreleasedReturnValue();

              if (v32)
              {
                v51 = (void *)v32;
              }
              else
              {
                v33 = [NRDevicePropertyDiffType alloc];
                v34 = -[NRDevicePropertyDiff initWithValue:]([NRDevicePropertyDiff alloc], "initWithValue:", v11);
                v35 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:](v33, "initWithDiff:andChangeType:", v34, 1);

                objc_msgSend(v53, "setObject:forKeyedSubscript:", v35, v43);
                v51 = 0;
              }
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v11 = v51;
              if (v11)
                goto LABEL_30;
            }
LABEL_12:
            v57 = v52;
            v12 = v50;
            objc_opt_self();
            v77 = 0;
            v78 = &v77;
            v79 = 0x3032000000;
            v80 = __Block_byref_object_copy__6;
            v81 = __Block_byref_object_dispose__6;
            v82 = 0;
            v73 = 0u;
            v74 = 0u;
            v75 = 0u;
            v76 = 0u;
            v55 = v12;
            v58 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
            if (v58)
            {
              v56 = *(_QWORD *)v74;
              do
              {
                for (i = 0; i != v58; ++i)
                {
                  if (*(_QWORD *)v74 != v56)
                    objc_enumerationMutation(v55);
                  v13 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
                  objc_msgSend(v13, "diff");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  v67[0] = MEMORY[0x1E0C809B0];
                  v67[1] = 3221225472;
                  v68 = __64__NRDataFileHistoryHelpers_findPairedDateForDeviceID_inHistory___block_invoke;
                  v69 = &unk_1E4496E18;
                  v15 = v57;
                  v71 = v13;
                  v72 = &v77;
                  v70 = v15;
                  v16 = v14;
                  v62 = CFSTR("isPaired");
                  v60 = v67;
                  objc_opt_self();
                  v85 = 0u;
                  v86 = 0u;
                  v83 = 0u;
                  v84 = 0u;
                  v17 = v16;
                  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
                  if (v18)
                  {
                    v61 = *(_QWORD *)v84;
                    do
                    {
                      for (j = 0; j != v18; ++j)
                      {
                        if (*(_QWORD *)v84 != v61)
                          objc_enumerationMutation(v17);
                        v20 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
                        objc_msgSend(v17, "objectForKeyedSubscript:", v20);
                        v21 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v21, "diff");
                        v22 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v22, "objectForKeyedSubscript:", v62);
                        v23 = (void *)objc_claimAutoreleasedReturnValue();
                        v24 = v23;
                        if (v23)
                        {
                          v25 = objc_msgSend(v23, "changeType");
                          objc_msgSend(v24, "diff");
                          v26 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v26, "value");
                          v27 = (void *)objc_claimAutoreleasedReturnValue();
                          v68((uint64_t)v60, v20, v25, v27);

                        }
                      }
                      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
                    }
                    while (v18);
                  }

                }
                v58 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
              }
              while (v58);
            }

            v11 = (id)v78[5];
            _Block_object_dispose(&v77, 8);

            if (((v11 == 0) & ~isKindOfClass) == 0)
              goto LABEL_29;
            v11 = 0;
          }

        }
        if (objc_msgSend(v53, "count"))
        {
          v36 = -[NRDeviceDiff initWithDiffPropertyDiffs:]([NRDeviceDiff alloc], "initWithDiffPropertyDiffs:", v53);
          v37 = -[NRDeviceDiffType initWithDiff:andChangeType:]([NRDeviceDiffType alloc], "initWithDiff:andChangeType:", v36, 1);
          objc_msgSend(v44, "setObject:forKeyedSubscript:", v37, v52);

        }
        v3 = v49 + 1;
      }
      while (v49 + 1 != v48);
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v87, 16);
    }
    while (v48);
  }

  if (objc_msgSend(v44, "count"))
  {
    v38 = -[NRDeviceCollectionDiff initWithDeviceCollectionDiffDeviceDiffs:]([NRDeviceCollectionDiff alloc], "initWithDeviceCollectionDiffDeviceDiffs:", v44);
    objc_msgSend(v50, "deviceCollection");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (id)objc_msgSend(v39, "applyDiff:", v38);

  }
  if (objc_msgSend(v50, "dirty"))
    v41 = +[NRDataFileHistoryHelpers archiveDeviceHistory:](NRDataFileHistoryHelpers, "archiveDeviceHistory:", v50);
  else
    v41 = 1;

  return v41;
}

+ (BOOL)archiveSecureProperties:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "dirty")
    && (v4 = (void *)MEMORY[0x1E0CB36F8],
        +[NRDataFilePaths pathToNanoRegistryHistorySecurePropertiesFile](NRDataFilePaths, "pathToNanoRegistryHistorySecurePropertiesFile"), v5 = (void *)objc_claimAutoreleasedReturnValue(), LOBYTE(v4) = objc_msgSend(v4, "nr_secureArchiveRootObject:toFile:", v3, v5), v5, (v4 & 1) == 0))
  {
    nr_daemon_log();
    v8 = objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if ((_DWORD)v6)
    {
      nr_daemon_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        +[NRDataFilePaths pathToNanoRegistryHistorySecurePropertiesFile](NRDataFilePaths, "pathToNanoRegistryHistorySecurePropertiesFile");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543362;
        v11 = v9;
        _os_log_error_impl(&dword_1A0BDB000, v6, OS_LOG_TYPE_ERROR, "Failure saving secure properties file %{public}@: Archiver returned \"NO\", (uint8_t *)&v10, 0xCu);

      }
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return (char)v6;
}

+ (id)unarchiveSecureProperties
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3710];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NRDataFilePaths pathToNanoRegistryHistorySecurePropertiesFile](NRDataFilePaths, "pathToNanoRegistryHistorySecurePropertiesFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nr_secureUnarchiveObjectOfClasses:withFile:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      nr_daemon_log();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

      if (v7)
      {
        nr_daemon_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          +[NRDataFilePaths pathToNanoRegistryHistorySecurePropertiesFile](NRDataFilePaths, "pathToNanoRegistryHistorySecurePropertiesFile");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138543618;
          v14 = v10;
          v15 = 2114;
          v16 = v12;
          _os_log_error_impl(&dword_1A0BDB000, v8, OS_LOG_TYPE_ERROR, "Failure loading secure properties file %{public}@: File has incorrect object %{public}@.", (uint8_t *)&v13, 0x16u);

        }
      }

      v5 = 0;
    }
  }
  return v5;
}

@end
