@implementation ICNoteMergePolicy

- (ICNoteMergePolicy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICNoteMergePolicy;
  return -[NSMergePolicy initWithMergeType:](&v3, sel_initWithMergeType_, 2);
}

- (BOOL)resolveOptimisticLockingVersionConflicts:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  int v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  BOOL v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  ICNoteMergePolicy *v76;
  uint64_t v77;
  os_log_t obj;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  objc_super v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  void *v87;
  uint8_t v88[4];
  uint64_t v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v76 = self;
  v83.receiver = self;
  v83.super_class = (Class)ICNoteMergePolicy;
  v7 = -[NSMergePolicy resolveOptimisticLockingVersionConflicts:error:](&v83, sel_resolveOptimisticLockingVersionConflicts_error_, v6, a4);
  objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 15);
  if (v7 && !*a4)
  {
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    obj = (os_log_t)v6;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
    if (!v9)
      goto LABEL_5;
    v10 = v9;
    v66 = v7;
    v67 = v6;
    v11 = *(_QWORD *)v80;
    v77 = *(_QWORD *)v80;
LABEL_8:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v80 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v12);
      if (!objc_msgSend(v13, "newVersionNumber"))
      {
        v20 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[ICNoteMergePolicy resolveOptimisticLockingVersionConflicts:error:].cold.1(v88, v13, &v89, v20);

        objc_msgSend(v13, "sourceObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "managedObjectContext");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sourceObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "deleteObject:", v21);

        goto LABEL_66;
      }
      objc_msgSend(v13, "sourceObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      objc_msgSend(v13, "sourceObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((isKindOfClass & 1) != 0)
      {
        objc_opt_class();
        objc_msgSend(v13, "persistedSnapshot");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("modificationDate"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          ICDynamicCast();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v13, "cachedSnapshot");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("modificationDate"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          ICDynamicCast();
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = v77;
        }
        v30 = v10;

        if (v19)
        {
          objc_msgSend(v16, "modificationDate");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "compare:", v19);

          if (v32 == -1)
            objc_msgSend(v16, "setModificationDate:", v19);
        }
        objc_msgSend(v16, "cryptoTag");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          objc_msgSend(v16, "noteData");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "cryptoTag");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
          {
            objc_msgSend(v16, "cryptoInitializationVector");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (v36)
            {
              objc_msgSend(v16, "noteData");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "cryptoInitializationVector");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = v37;
              if (v38)
              {
                v74 = v38;
                objc_msgSend(v16, "cryptoTag");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "noteData");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "cryptoTag");
                v73 = v39;
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v39, "isEqual:"))
                {
                  objc_msgSend(v16, "cryptoInitializationVector");
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "noteData");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v70, "cryptoInitializationVector");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = objc_msgSend(v69, "isEqual:", v68) ^ 1;

                }
                else
                {
                  v40 = 1;
                }

                v38 = v74;
              }
              else
              {
                v40 = 0;
              }

            }
            else
            {
              v40 = 0;
            }

          }
          else
          {
            v40 = 0;
          }

          v11 = v77;
        }
        else
        {
          v40 = 0;
        }

        v10 = v30;
        if (objc_msgSend(v16, "isPasswordProtected"))
        {
          v53 = +[ICCryptoStrategyFactory cipherVersionForObject:](ICCryptoStrategyFactory, "cipherVersionForObject:", v16)? 0: v40;
          if (v53 == 1)
          {
            v54 = os_log_create("com.apple.notes", "CoreData");
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v16, "noteData");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "ic_loggingIdentifier");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "shortLoggingDescription");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v85 = v61;
              v86 = 2112;
              v87 = v62;
              _os_log_error_impl(&dword_1BD918000, v54, OS_LOG_TYPE_ERROR, "Re-saving note data (%@) because crypto goo has diverged for note: %@", buf, 0x16u);

              v11 = v77;
            }

            objc_msgSend(v16, "noteData");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "setNeedsToBeSaved:", 1);

            objc_msgSend(v16, "noteData");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "saveNoteDataIfNeeded");

          }
        }
        goto LABEL_65;
      }
      objc_opt_class();
      v22 = objc_opt_isKindOfClass();

      objc_msgSend(v13, "sourceObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v22 & 1) != 0)
        break;
      objc_opt_class();
      v25 = objc_opt_isKindOfClass();

      if ((v25 & 1) != 0)
      {
        objc_msgSend(v13, "sourceObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        objc_msgSend(v13, "persistedSnapshot");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("mergeableData"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          ICDynamicCast();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v13, "cachedSnapshot");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("mergeableData"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          ICDynamicCast();
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = v77;
        }

        if (v19)
        {
          v50 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            v63 = (void *)objc_opt_class();
            v64 = v63;
            objc_msgSend(v16, "identifier");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v85 = v63;
            v86 = 2112;
            v87 = v65;
            _os_log_debug_impl(&dword_1BD918000, v50, OS_LOG_TYPE_DEBUG, "Resolving mergeableData conflict for %@ (%@)", buf, 0x16u);

            v11 = v77;
          }

          objc_msgSend(v16, "attachmentModel");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "mergeWithMergeableData:", v19);

          objc_msgSend(v16, "attachmentModel");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setMergeableDataDirty:", 1);

          objc_msgSend(v16, "saveMergeableDataIfNeeded");
        }
LABEL_65:
        -[ICNoteMergePolicy resolveConflict:forWallClockMergeablesInObject:](v76, "resolveConflict:forWallClockMergeablesInObject:", v13, v16);
LABEL_66:

      }
      if (v10 == ++v12)
      {
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
        if (!v10)
        {
          v6 = v67;
          LOBYTE(v7) = v66;
          goto LABEL_5;
        }
        goto LABEL_8;
      }
    }
    objc_opt_class();
    objc_msgSend(v13, "persistedSnapshot");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("data"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      ICDynamicCast();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v13, "cachedSnapshot");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("data"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v77;
    }

    if (v19)
    {
      v43 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v16, "ic_loggingIdentifier");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "note");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "shortLoggingDescription");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v85 = v57;
        v86 = 2112;
        v87 = v59;
        _os_log_debug_impl(&dword_1BD918000, v43, OS_LOG_TYPE_DEBUG, "Resolving note data (%@) conflict for note: %@", buf, 0x16u);

        v11 = v77;
      }

      objc_msgSend(v16, "note");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "isPasswordProtected");

      objc_msgSend(v16, "note");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v46;
      if (v45)
        objc_msgSend(v46, "mergeEncryptedData:mergeConflict:", v19, v13);
      else
        objc_msgSend(v46, "mergeWithNoteData:", v19);

      objc_msgSend(v16, "setNeedsToBeSaved:", 1);
      objc_msgSend(v16, "saveNoteDataIfNeeded");
    }
    goto LABEL_66;
  }
  objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 16);
  obj = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    -[ICNoteMergePolicy resolveOptimisticLockingVersionConflicts:error:].cold.2((uint64_t)v6, (uint64_t *)a4, obj);
LABEL_5:

  return v7;
}

- (void)resolveConflict:(id)a3 forWallClockMergeablesInObject:(id)a4
{
  id v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  ICTTMergeableWallClockValue *v18;
  ICTTMergeableWallClockValue *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  __int128 v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend((id)objc_opt_class(), "mergeableWallClockValueKeyPaths");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v31;
    *(_QWORD *)&v7 = 138412546;
    v26 = v7;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
        objc_opt_class();
        objc_msgSend(v5, "persistedSnapshot");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          ICDynamicCast();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v5, "cachedSnapshot");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          ICDynamicCast();
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (objc_msgSend(v12, "length"))
        {
          v15 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            v22 = (void *)objc_opt_class();
            v23 = v22;
            objc_msgSend(v6, "ic_loggingIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v35 = v22;
            v36 = 2112;
            v37 = v9;
            v38 = 2112;
            v39 = v24;
            _os_log_debug_impl(&dword_1BD918000, v15, OS_LOG_TYPE_DEBUG, "Resolving wall clock mergeable conflict for %@ (key=%@, identifier=%@)", buf, 0x20u);

          }
          objc_opt_class();
          objc_msgSend(v6, "valueForKey:", v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          ICDynamicCast();
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v17, "length"))
          {
            v18 = -[ICTTMergeableWallClockValue initWithData:]([ICTTMergeableWallClockValue alloc], "initWithData:", v17);
            v19 = -[ICTTMergeableWallClockValue initWithData:]([ICTTMergeableWallClockValue alloc], "initWithData:", v12);
            if (!-[ICTTMergeableWallClockValue merge:](v18, "merge:", v19))
            {
              v20 = os_log_create("com.apple.notes", "CoreData");
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v6, "ic_loggingIdentifier");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v26;
                v35 = v9;
                v36 = 2112;
                v37 = v25;
                _os_log_error_impl(&dword_1BD918000, v20, OS_LOG_TYPE_ERROR, "Merge failed when resolving conflict for key (%@): %@", buf, 0x16u);

              }
            }
            -[ICTTMergeableWallClockValue serialize](v18, "serialize", v26);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setValue:forKeyPath:", v21, v9);

          }
          else
          {
            objc_msgSend(v6, "setValue:forKeyPath:", v12, v9);
          }

        }
        ++v8;
      }
      while (v29 != v8);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v29);
  }

}

- (BOOL)resolveConstraintConflicts:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  ICNoteMergePolicy *v19;
  void *v20;
  NSObject *v21;
  BOOL v22;
  id obj;
  void *v26;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 17);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v29;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v10);
        v12 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v11, "conflictingObjects");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (objc_class *)objc_opt_class();
          NSStringFromClass(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "constraintValues");
          v16 = v7;
          v17 = v8;
          v18 = v9;
          v19 = self;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v33 = v15;
          v34 = 2112;
          v35 = v20;
          _os_log_impl(&dword_1BD918000, v12, OS_LOG_TYPE_INFO, "Found constraint conflict for %@: %@", buf, 0x16u);

          self = v19;
          v9 = v18;
          v8 = v17;
          v7 = v16;

        }
        if (!-[ICNoteMergePolicy resolveConstraintConflict:](self, "resolveConstraintConflict:", v11))
        {
          objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 3);
          v21 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v11;
            _os_log_error_impl(&dword_1BD918000, v21, OS_LOG_TYPE_ERROR, "Constraint violation when merging the MOC: %@", buf, 0xCu);
          }

          if ((v8 & 1) != 0)
          {
            v8 = 1;
          }
          else
          {
            v8 = 1;
            objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICNoteMergePolicy resolveConstraintConflicts:error:]", 1, 1, CFSTR("Constraint violation when merging the MOC"));
          }
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v7);
  }

  v27.receiver = self;
  v27.super_class = (Class)ICNoteMergePolicy;
  v22 = -[NSMergePolicy resolveConstraintConflicts:error:](&v27, sel_resolveConstraintConflicts_error_, obj, a4);

  return v22;
}

- (BOOL)resolveConstraintConflict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  BOOL v21;
  BOOL v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  char v42;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "constraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    objc_msgSend(v4, "conflictingObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v4, "databaseObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "databaseObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "insertObject:atIndex:", v11, 0);

    }
    v12 = (void *)MEMORY[0x1E0CB3928];
    NSStringFromSelector(sel_className);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortDescriptorWithKey:ascending:", v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortUsingDescriptors:", v15);

    if (objc_msgSend(v9, "count") == 2)
    {
      objc_msgSend(v9, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "lastObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v9, "firstObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "lastObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[ICNoteMergePolicy resolveConflictingAttachment:withInlineAttachment:](self, "resolveConflictingAttachment:withInlineAttachment:", v19, v20);
          goto LABEL_44;
        }
      }
      else
      {

      }
    }
    if (objc_msgSend(v9, "count") == 2)
    {
      objc_msgSend(v9, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "lastObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v25 = objc_opt_isKindOfClass();

        if ((v25 & 1) != 0)
        {
          objc_msgSend(v9, "firstObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "lastObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[ICNoteMergePolicy resolveConflictingNote:with:](self, "resolveConflictingNote:with:", v19, v20);
          goto LABEL_44;
        }
      }
      else
      {

      }
    }
    if (objc_msgSend(v9, "count") == 2)
    {
      objc_msgSend(v9, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "lastObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v28 = objc_opt_isKindOfClass();

        if ((v28 & 1) != 0)
        {
          objc_msgSend(v9, "firstObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "lastObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[ICNoteMergePolicy resolveConflictingFolder:with:](self, "resolveConflictingFolder:with:", v19, v20);
          goto LABEL_44;
        }
      }
      else
      {

      }
    }
    if (objc_msgSend(v9, "count") == 2)
    {
      objc_msgSend(v9, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "lastObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v31 = objc_opt_isKindOfClass();

        if ((v31 & 1) != 0)
        {
          objc_msgSend(v9, "firstObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "lastObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[ICNoteMergePolicy resolveConflictingAttachment:with:](self, "resolveConflictingAttachment:with:", v19, v20);
          goto LABEL_44;
        }
      }
      else
      {

      }
    }
    if (objc_msgSend(v9, "count") == 2)
    {
      objc_msgSend(v9, "firstObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "lastObject");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v34 = objc_opt_isKindOfClass();

        if ((v34 & 1) != 0)
        {
          objc_msgSend(v9, "firstObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "lastObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[ICNoteMergePolicy resolveConflictingAttachmentPreviewImage:with:](self, "resolveConflictingAttachmentPreviewImage:with:", v19, v20);
          goto LABEL_44;
        }
      }
      else
      {

      }
    }
    if (objc_msgSend(v9, "count") == 2)
    {
      objc_msgSend(v9, "firstObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "lastObject");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v37 = objc_opt_isKindOfClass();

        if ((v37 & 1) != 0)
        {
          objc_msgSend(v9, "firstObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "lastObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[ICNoteMergePolicy resolveConflictingInlineAttachment:with:](self, "resolveConflictingInlineAttachment:with:", v19, v20);
          goto LABEL_44;
        }
      }
      else
      {

      }
    }
    if (objc_msgSend(v9, "count") == 2)
    {
      objc_msgSend(v9, "firstObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "lastObject");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v40 = objc_opt_isKindOfClass();

        if ((v40 & 1) != 0)
        {
          objc_msgSend(v9, "firstObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "lastObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[ICNoteMergePolicy resolveConflictingDeviceMigrationState:with:](self, "resolveConflictingDeviceMigrationState:with:", v19, v20);
          goto LABEL_44;
        }
      }
      else
      {

      }
    }
    if (objc_msgSend(v9, "count") != 2)
      goto LABEL_46;
    objc_msgSend(v9, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v22 = 0;
      goto LABEL_45;
    }
    objc_msgSend(v9, "lastObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v42 = objc_opt_isKindOfClass();

    if ((v42 & 1) == 0)
    {
LABEL_46:
      v22 = 0;
      goto LABEL_47;
    }
    objc_msgSend(v9, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[ICNoteMergePolicy resolveConflictingLegacyTombstone:with:](self, "resolveConflictingLegacyTombstone:with:", v19, v20);
LABEL_44:
    v22 = v21;

LABEL_45:
LABEL_47:

    goto LABEL_48;
  }
  v22 = 0;
LABEL_48:

  return v22;
}

- (BOOL)resolveConflictingAttachment:(id)a3 withInlineAttachment:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5 || !v6)
    goto LABEL_8;
  objc_msgSend(v5, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (objc_msgSend(v5, "userTitle"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(v5, "urlString"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(v5, "media"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_8:
    v9 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICNoteMergePolicy resolveConflictingAttachment:withInlineAttachment:].cold.2();

    v10 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v5, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if (!v14)
    goto LABEL_8;
  v15 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ICNoteMergePolicy resolveConflictingAttachment:withInlineAttachment:].cold.1();

  objc_msgSend(v5, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deleteObject:", v5);

  v10 = 1;
  objc_msgSend(v7, "setNeedsToBeFetchedFromCloud:", 1);
LABEL_11:

  return v10;
}

- (BOOL)resolveConflictingFolder:(id)a3 with:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  void *v52;
  BOOL v53;
  NSObject *v54;
  void *v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint8_t v68[128];
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "needsInitialFetchFromCloud")
    && (objc_msgSend(v6, "needsInitialFetchFromCloud") & 1) == 0)
  {
    v7 = v6;
    v8 = v5;
    goto LABEL_22;
  }
  if ((objc_msgSend(v5, "needsInitialFetchFromCloud") & 1) == 0
    && objc_msgSend(v6, "needsInitialFetchFromCloud")
    || objc_msgSend(v5, "needsInitialFetchFromCloud")
    && objc_msgSend(v6, "needsInitialFetchFromCloud"))
  {
    v7 = v5;
    v8 = v6;
LABEL_22:
    v13 = v8;
    goto LABEL_23;
  }
  if ((objc_msgSend(v5, "needsInitialFetchFromCloud") & 1) != 0)
    goto LABEL_20;
  if ((objc_msgSend(v6, "needsInitialFetchFromCloud") & 1) != 0)
    goto LABEL_20;
  v9 = objc_msgSend(v5, "folderType");
  if (v9 != objc_msgSend(v6, "folderType")
    || (objc_msgSend(v5, "account"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "account"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v10, "isEqual:", v11),
        v11,
        v10,
        !v12))
  {
LABEL_20:
    v7 = 0;
    v13 = 0;
    goto LABEL_46;
  }
  v7 = v5;
  v13 = v6;
  objc_msgSend(v13, "dateForLastTitleModification");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateForLastTitleModification");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "ic_isLaterThanDate:", v15);

  if (v16)
  {
    objc_msgSend(v13, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v17);

    objc_msgSend(v13, "dateForLastTitleModification");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDateForLastTitleModification:", v18);

  }
  objc_msgSend(v13, "parentModificationDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parentModificationDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "ic_isLaterThanDate:", v20);

  if (v21)
  {
    objc_msgSend(v13, "parent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setParent:", v22);

  }
  objc_msgSend(v13, "customNoteSortTypeModificationDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "customNoteSortTypeModificationDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "ic_isLaterThanDate:", v24);

  if (v25)
  {
    objc_msgSend(v13, "customNoteSortTypeValue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCustomNoteSortTypeValue:", v26);

    objc_msgSend(v13, "customNoteSortTypeModificationDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCustomNoteSortTypeModificationDate:", v27);

  }
  objc_msgSend(v13, "mergeableData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v13, "mergeableData");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mergeWithMergeableData:", v29);

  }
LABEL_23:
  if (v13 && v7)
  {
    v30 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "identifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectID");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectID");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v70 = v56;
      v71 = 2112;
      v72 = v57;
      v73 = 2112;
      v74 = v58;
      _os_log_debug_impl(&dword_1BD918000, v30, OS_LOG_TYPE_DEBUG, "Resolving folder conflict (%@) by keeping (%@) and deleting (%@)", buf, 0x20u);

    }
    objc_msgSend(v13, "notes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    if (v32)
    {
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      objc_msgSend(v13, "notes");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v33, "copy");

      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v64;
        do
        {
          for (i = 0; i != v36; ++i)
          {
            if (*(_QWORD *)v64 != v37)
              objc_enumerationMutation(v34);
            objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "setFolder:", v7);
          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
        }
        while (v36);
      }

      objc_msgSend(v13, "notes");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend(v39, "copy");
      objc_msgSend(v7, "addNotes:", v40);

      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setNotes:", v41);

    }
    objc_msgSend(v13, "children");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "count");

    if (v43)
    {
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      objc_msgSend(v13, "children", 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)objc_msgSend(v44, "copy");

      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v60;
        do
        {
          for (j = 0; j != v47; ++j)
          {
            if (*(_QWORD *)v60 != v48)
              objc_enumerationMutation(v45);
            objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * j), "setParent:", v7);
          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
        }
        while (v47);
      }

      objc_msgSend(v13, "children");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)objc_msgSend(v50, "copy");
      objc_msgSend(v7, "addChildren:", v51);

      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setChildren:", v52);

    }
    +[ICFolder purgeFolder:](ICFolder, "purgeFolder:", v13);
    v53 = 1;
    goto LABEL_49;
  }
LABEL_46:
  v54 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    -[ICNoteMergePolicy resolveConflictingFolder:with:].cold.1();

  v53 = 0;
LABEL_49:

  return v53;
}

- (BOOL)resolveConflictingInlineAttachment:(id)a3 with:(id)a4
{
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  os_log_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  int v25;
  int v26;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "needsInitialFetchFromCloud")
    || (v7 = objc_msgSend(v6, "needsInitialFetchFromCloud"), v8 = v6, v9 = v5, v7))
  {
    if ((objc_msgSend(v5, "needsInitialFetchFromCloud") & 1) != 0
      || (v10 = objc_msgSend(v6, "needsInitialFetchFromCloud"), v8 = v5, v9 = v6, (v10 & 1) == 0))
    {
      if (!objc_msgSend(v5, "needsInitialFetchFromCloud")
        || (v11 = objc_msgSend(v6, "needsInitialFetchFromCloud"), v8 = v5, v9 = v6, (v11 & 1) == 0))
      {
        if ((objc_msgSend(v5, "needsInitialFetchFromCloud") & 1) != 0
          || (objc_msgSend(v6, "needsInitialFetchFromCloud") & 1) != 0
          || (objc_msgSend(v5, "tokenContentIdentifier"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v6, "tokenContentIdentifier"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              v23 = objc_msgSend(v21, "isEqualToString:", v22),
              v22,
              v21,
              !v23))
        {
          v12 = 0;
          v13 = 0;
          goto LABEL_31;
        }
        v24 = objc_msgSend(v5, "markedForDeletion");
        v25 = objc_msgSend(v6, "markedForDeletion");
        v8 = v5;
        v9 = v6;
        if (v24 != v25)
        {
          v26 = objc_msgSend(v5, "markedForDeletion");
          if (v26)
            v8 = v5;
          else
            v8 = v6;
          if (v26)
            v9 = v6;
          else
            v9 = v5;
        }
      }
    }
  }
  v12 = v8;
  v13 = v9;
  if (v13 && v12)
  {
    v14 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138412802;
      v32 = v28;
      v33 = 2112;
      v34 = v29;
      v35 = 2112;
      v36 = v30;
      _os_log_debug_impl(&dword_1BD918000, v14, OS_LOG_TYPE_DEBUG, "Resolving inline attachment conflict (%@) by keeping (%@) and deleting (%@)", (uint8_t *)&v31, 0x20u);

    }
    objc_msgSend(v12, "note");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(v13, "note");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
        goto LABEL_15;
      objc_msgSend(v13, "note");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setNote:", v15);
    }

LABEL_15:
    objc_msgSend(v12, "parentAttachment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(v13, "parentAttachment");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
LABEL_19:
        objc_msgSend(v13, "managedObjectContext");
        v19 = (os_log_t)objc_claimAutoreleasedReturnValue();
        -[NSObject deleteObject:](v19, "deleteObject:", v13);
        v20 = 1;
        goto LABEL_34;
      }
      objc_msgSend(v13, "parentAttachment");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setParentAttachment:", v17);
    }

    goto LABEL_19;
  }
LABEL_31:
  v19 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[ICNoteMergePolicy resolveConflictingInlineAttachment:with:].cold.1();

  v20 = 0;
LABEL_34:

  return v20;
}

- (BOOL)resolveConflictingNote:(id)a3 with:(id)a4
{
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  os_log_t v48;
  BOOL v49;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t);
  void *v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint8_t v69[128];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "needsInitialFetchFromCloud")
    || (v7 = objc_msgSend(v6, "needsInitialFetchFromCloud"), v8 = v6, v9 = v5, v7))
  {
    if ((objc_msgSend(v5, "needsInitialFetchFromCloud") & 1) != 0
      || (v10 = objc_msgSend(v6, "needsInitialFetchFromCloud"), v8 = v5, v9 = v6, (v10 & 1) == 0))
    {
      if (!objc_msgSend(v5, "needsInitialFetchFromCloud")
        || (v11 = objc_msgSend(v6, "markedForDeletion"), v8 = v6, v9 = v5, (v11 & 1) == 0))
      {
        if (!objc_msgSend(v5, "markedForDeletion")
          || (v12 = objc_msgSend(v6, "needsInitialFetchFromCloud"), v8 = v5, v9 = v6, (v12 & 1) == 0))
        {
          objc_msgSend(v5, "folder");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {

          }
          else
          {
            objc_msgSend(v6, "folder");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v8 = v6;
            v9 = v5;
            if (v21)
              goto LABEL_21;
          }
          objc_msgSend(v5, "folder");
          v14 = objc_claimAutoreleasedReturnValue();
          if (!v14
            || (v15 = (void *)v14,
                objc_msgSend(v6, "folder"),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                v16,
                v15,
                v8 = v5,
                v9 = v6,
                v16))
          {
            objc_msgSend(v5, "folder");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "folder");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v17, "isEqual:", v18);

            if (!v19)
            {
              v22 = 0;
              v23 = 0;
              goto LABEL_47;
            }
            objc_msgSend(v5, "document");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
              v8 = v5;
            else
              v8 = v6;
            if (v20)
              v9 = v6;
            else
              v9 = v5;
          }
        }
      }
    }
  }
LABEL_21:
  v22 = v8;
  v23 = v9;
  if (v23 && v22)
  {
    v24 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "identifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectID");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v71 = v51;
      v72 = 2112;
      v73 = v52;
      v74 = 2112;
      v75 = v53;
      _os_log_debug_impl(&dword_1BD918000, v24, OS_LOG_TYPE_DEBUG, "Resolving note conflict (%@) by keeping (%@) and deleting (%@)", buf, 0x20u);

    }
    objc_msgSend(v23, "attachments");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26)
    {
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      objc_msgSend(v23, "attachments");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v27, "copy");

      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v65 != v31)
              objc_enumerationMutation(v28);
            objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "setNote:", v22);
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
        }
        while (v30);
      }

      objc_msgSend(v23, "attachments");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v33, "copy");
      objc_msgSend(v22, "addAttachments:", v34);

      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setAttachments:", v35);

    }
    objc_msgSend(v23, "inlineAttachments");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");

    if (v37)
    {
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      objc_msgSend(v23, "inlineAttachments");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend(v38, "copy");

      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v61;
        do
        {
          for (j = 0; j != v41; ++j)
          {
            if (*(_QWORD *)v61 != v42)
              objc_enumerationMutation(v39);
            objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * j), "setNote:", v22);
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
        }
        while (v41);
      }

      objc_msgSend(v23, "inlineAttachments");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)objc_msgSend(v44, "copy");
      objc_msgSend(v22, "addInlineAttachments:", v45);

      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setInlineAttachments:", v46);

    }
    objc_msgSend(v23, "document");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      v54 = MEMORY[0x1E0C809B0];
      v55 = 3221225472;
      v56 = __49__ICNoteMergePolicy_resolveConflictingNote_with___block_invoke;
      v57 = &unk_1E76C7B30;
      v58 = v22;
      v59 = v23;
      objc_msgSend(v58, "performMerge:", &v54);

    }
    objc_msgSend(v23, "managedObjectContext", v54, v55, v56, v57);
    v48 = (os_log_t)objc_claimAutoreleasedReturnValue();
    -[NSObject deleteObject:](v48, "deleteObject:", v23);
    v49 = 1;
    goto LABEL_50;
  }
LABEL_47:
  v48 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    -[ICNoteMergePolicy resolveConflictingNote:with:].cold.1();

  v49 = 0;
LABEL_50:

  return v49;
}

uint64_t __49__ICNoteMergePolicy_resolveConflictingNote_with___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "mergeWithStringVersionedDocument:", v3);

  return v4;
}

- (BOOL)resolveConflictingAttachment:(id)a3 with:(id)a4
{
  id v5;
  id v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  BOOL v20;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "needsInitialFetchFromCloud") & 1) != 0
    || (v7 = objc_msgSend(v6, "needsInitialFetchFromCloud"), v8 = v5, v9 = v6, (v7 & 1) == 0))
  {
    if (!objc_msgSend(v5, "needsInitialFetchFromCloud")
      || (v10 = objc_msgSend(v6, "needsInitialFetchFromCloud"), v8 = v6, v9 = v5, v10))
    {
      if (!objc_msgSend(v5, "needsInitialFetchFromCloud")
        || (v11 = objc_msgSend(v6, "needsInitialFetchFromCloud"), v8 = v5, v9 = v6, (v11 & 1) == 0))
      {
        objc_msgSend(v5, "serverRecordData");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12
          || (v13 = (void *)v12,
              objc_msgSend(v6, "serverRecordData"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v14,
              v13,
              v8 = v5,
              v9 = v6,
              v14))
        {
          objc_msgSend(v6, "serverRecordData");
          v15 = (id)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
LABEL_12:
            v17 = 0;
LABEL_18:
            v19 = os_log_create("com.apple.notes", "CoreData");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              -[ICNoteMergePolicy resolveConflictingAttachment:with:].cold.1();

            v20 = 0;
            goto LABEL_21;
          }
          objc_msgSend(v5, "serverRecordData");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v8 = v6;
          v9 = v5;
          if (v16)
          {
            v15 = 0;
            goto LABEL_12;
          }
        }
      }
    }
  }
  v15 = v8;
  v17 = v9;
  if (!v17 || !v15)
    goto LABEL_18;
  v18 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412802;
    v26 = v22;
    v27 = 2112;
    v28 = v23;
    v29 = 2112;
    v30 = v24;
    _os_log_debug_impl(&dword_1BD918000, v18, OS_LOG_TYPE_DEBUG, "Resolving attachment conflict (%@) by keeping (%@) and deleting (%@)", (uint8_t *)&v25, 0x20u);

  }
  objc_msgSend(v17, "suppressFileDeletion");
  objc_msgSend(v17, "managedObjectContext");
  v19 = objc_claimAutoreleasedReturnValue();
  -[NSObject deleteObject:](v19, "deleteObject:", v17);
  v20 = 1;
LABEL_21:

  return v20;
}

- (BOOL)resolveConflictingAttachmentPreviewImage:(id)a3 with:(id)a4
{
  id v5;
  id v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  char v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  id v17;
  BOOL v18;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "versionOutOfDate") & 1) != 0
    || (v7 = objc_msgSend(v6, "versionOutOfDate"), v8 = v5, v9 = v6, (v7 & 1) == 0))
  {
    if (!objc_msgSend(v5, "isInCloud") || (v10 = objc_msgSend(v6, "isInCloud"), v8 = v5, v9 = v6, v10))
    {
      if (!objc_msgSend(v5, "versionOutOfDate")
        || (v11 = objc_msgSend(v6, "versionOutOfDate"), v8 = v6, v9 = v5, v11))
      {
        if ((objc_msgSend(v5, "isInCloud") & 1) != 0
          || (v12 = objc_msgSend(v6, "isInCloud"), v8 = v6, v9 = v5, (v12 & 1) == 0))
        {
          objc_msgSend(v5, "modifiedDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "modifiedDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "ic_isLaterThanDate:", v14);

          if (v15)
            v8 = v5;
          else
            v8 = v6;
          if (v15)
            v9 = v6;
          else
            v9 = v5;
        }
      }
    }
  }
  v16 = v8;
  v17 = v9;
  if (v17)
    v18 = v16 == 0;
  else
    v18 = 1;
  v19 = !v18;
  v20 = os_log_create("com.apple.notes", "CoreData");
  v21 = v20;
  if (v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412802;
      v27 = v23;
      v28 = 2112;
      v29 = v24;
      v30 = 2112;
      v31 = v25;
      _os_log_debug_impl(&dword_1BD918000, v21, OS_LOG_TYPE_DEBUG, "Resolving attachment preview image conflict (%@) by keeping (%@) and deleting (%@)", (uint8_t *)&v26, 0x20u);

    }
    objc_msgSend(v17, "suppressFileDeletion");
    objc_msgSend(v17, "managedObjectContext");
    v21 = objc_claimAutoreleasedReturnValue();
    -[NSObject deleteObject:](v21, "deleteObject:", v17);
  }
  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[ICNoteMergePolicy resolveConflictingAttachmentPreviewImage:with:].cold.1();

  }
  return v19;
}

- (BOOL)resolveConflictingDeviceMigrationState:(id)a3 with:(id)a4
{
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  BOOL v16;
  _BOOL4 v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "isInCloud") || (v7 = objc_msgSend(v6, "isInCloud"), v8 = v5, v9 = v6, v7))
  {
    if ((objc_msgSend(v5, "isInCloud") & 1) != 0
      || (v10 = objc_msgSend(v6, "isInCloud"), v8 = v6, v9 = v5, (v10 & 1) == 0))
    {
      objc_msgSend(v5, "stateModificationDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stateModificationDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "ic_isLaterThanDate:", v12);

      if (v13)
        v8 = v5;
      else
        v8 = v6;
      if (v13)
        v9 = v6;
      else
        v9 = v5;
    }
  }
  v14 = v8;
  v15 = v9;
  if (v15)
    v16 = v14 == 0;
  else
    v16 = 1;
  v17 = !v16;
  v18 = os_log_create("com.apple.notes", "CoreData");
  v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138412802;
      v32 = v25;
      v33 = 2112;
      v34 = v26;
      v35 = 2112;
      v36 = v27;
      _os_log_debug_impl(&dword_1BD918000, v19, OS_LOG_TYPE_DEBUG, "Resolving device migration state conflict (%@) by keeping (%@) and deleting (%@)", (uint8_t *)&v31, 0x20u);

    }
    objc_msgSend(v15, "stateModificationDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stateModificationDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "ic_isLaterThanDate:", v21);

    if (v22)
    {
      objc_msgSend(v14, "setState:", objc_msgSend(v15, "state"));
      objc_msgSend(v15, "stateModificationDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setStateModificationDate:", v23);

      objc_msgSend(v14, "updateChangeCountWithReason:", CFSTR("Resolved Core Data conflict"));
    }
    objc_msgSend(v15, "managedObjectContext");
    v19 = objc_claimAutoreleasedReturnValue();
    -[NSObject deleteObject:](v19, "deleteObject:", v15);
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138412802;
      v32 = v28;
      v33 = 2112;
      v34 = v29;
      v35 = 2112;
      v36 = v30;
      _os_log_error_impl(&dword_1BD918000, v19, OS_LOG_TYPE_ERROR, "Not resolving device migration state constraint conflict (%@) between (%@) and (%@)", (uint8_t *)&v31, 0x20u);

    }
  }

  return v17;
}

- (BOOL)resolveConflictingLegacyTombstone:(id)a3 with:(id)a4
{
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  BOOL v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "isInCloud") || (v7 = objc_msgSend(v6, "isInCloud"), v8 = v5, v9 = v6, v7))
  {
    if ((objc_msgSend(v5, "isInCloud") & 1) != 0
      || (v10 = objc_msgSend(v6, "isInCloud"), v8 = v6, v9 = v5, (v10 & 1) == 0))
    {
      objc_msgSend(v5, "account");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11
        || (v12 = (void *)v11,
            objc_msgSend(v6, "account"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v13,
            v12,
            v8 = v5,
            v9 = v6,
            v13))
      {
        objc_msgSend(v5, "account");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {

        }
        else
        {
          objc_msgSend(v6, "account");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v8 = v6;
          v9 = v5;
          if (v18)
            goto LABEL_12;
        }
        v15 = objc_msgSend(v5, "isEquivalentTo:", v6);
        v8 = v5;
        v9 = v6;
        if (!v15)
        {
          v16 = 0;
          v17 = 0;
LABEL_17:
          v20 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v5, "identifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 138412802;
            v30 = v23;
            v31 = 2112;
            v32 = v24;
            v33 = 2112;
            v34 = v25;
            _os_log_error_impl(&dword_1BD918000, v20, OS_LOG_TYPE_ERROR, "Not resolving legacy tombstone constraint conflict (%@) between (%@) and (%@)", (uint8_t *)&v29, 0x20u);

          }
          v21 = 0;
          goto LABEL_20;
        }
      }
    }
  }
LABEL_12:
  v16 = v8;
  v17 = v9;
  if (!v17 || !v16)
    goto LABEL_17;
  v19 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138412802;
    v30 = v26;
    v31 = 2112;
    v32 = v27;
    v33 = 2112;
    v34 = v28;
    _os_log_debug_impl(&dword_1BD918000, v19, OS_LOG_TYPE_DEBUG, "Resolving legacy tombstone conflict (%@) by keeping (%@) and deleting (%@)", (uint8_t *)&v29, 0x20u);

  }
  objc_msgSend(v17, "managedObjectContext");
  v20 = objc_claimAutoreleasedReturnValue();
  -[NSObject deleteObject:](v20, "deleteObject:", v17);
  v21 = 1;
LABEL_20:

  return v21;
}

- (void)resolveOptimisticLockingVersionConflicts:(_QWORD *)a3 error:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a2, "sourceObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v9;
  _os_log_debug_impl(&dword_1BD918000, a4, OS_LOG_TYPE_DEBUG, "Another context deleted a %@ and we are deleting it too", a1, 0xCu);

}

- (void)resolveOptimisticLockingVersionConflicts:(os_log_t)log error:.cold.2(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "CoreData optimistic locking resolution failed for conflicts: %@, error: %@", (uint8_t *)&v4, 0x16u);
}

- (void)resolveConflictingAttachment:withInlineAttachment:.cold.1()
{
  NSObject *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  OUTLINED_FUNCTION_3_2();
  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_debug_impl(&dword_1BD918000, v0, OS_LOG_TYPE_DEBUG, "Resolving attachment vs inline attachment conflict (%@) by keeping (%@) and deleting (%@)", (uint8_t *)&v7, 0x20u);

  OUTLINED_FUNCTION_7();
}

- (void)resolveConflictingAttachment:withInlineAttachment:.cold.2()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_2();
  objc_msgSend(v2, "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_1(), "objectID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_5(&dword_1BD918000, v4, v5, "Not resolving attachment vs inline attachment constraint conflict (%@) between (%@) and (%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

- (void)resolveConflictingFolder:with:.cold.1()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_2();
  objc_msgSend(v2, "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_1(), "objectID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_5(&dword_1BD918000, v4, v5, "Not resolving folder constraint conflict (%@) between (%@) and (%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

- (void)resolveConflictingInlineAttachment:with:.cold.1()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_2();
  objc_msgSend(v2, "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_1(), "objectID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_5(&dword_1BD918000, v4, v5, "Not resolving inline attachment constraint conflict (%@) between (%@) and (%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

- (void)resolveConflictingNote:with:.cold.1()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_2();
  objc_msgSend(v2, "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_1(), "objectID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_5(&dword_1BD918000, v4, v5, "Not resolving note constraint conflict (%@) between (%@) and (%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

- (void)resolveConflictingAttachment:with:.cold.1()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_2();
  objc_msgSend(v2, "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_1(), "objectID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_5(&dword_1BD918000, v4, v5, "Not resolving attachment constraint conflict (%@) between (%@) and (%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

- (void)resolveConflictingAttachmentPreviewImage:with:.cold.1()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_2();
  objc_msgSend(v2, "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4_1(), "objectID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_5(&dword_1BD918000, v4, v5, "Not resolving attachment preview image constraint conflict (%@) between (%@) and (%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

@end
