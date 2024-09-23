@implementation CPLMingleUtility

+ (BOOL)_applyMingledBatch:(id)a3 scope:(id)a4 forStore:(id)a5 onPutBatchInPullQueue:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  char v32;
  id v33;
  int v34;
  NSObject *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  char v46;
  id v47;
  int v48;
  NSObject *v49;
  void *v50;
  int v51;
  void *v53;
  char v54;
  __int128 v55;
  id v56;
  unsigned int (**v57)(_QWORD, _QWORD);
  void *v58;
  id v59;
  NSObject *obj;
  id v61;
  id v62;
  uint64_t (**v64)(id, id, id *);
  void *v65;
  void *v66;
  id v67;
  unsigned int (**v68)(void);
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  id v79;
  char v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[4];
  id v86;
  id v87;
  id v88;
  id v89;
  _QWORD v90[4];
  id v91;
  id v92;
  _QWORD *v93;
  _QWORD *v94;
  _QWORD v95[3];
  char v96;
  _QWORD v97[3];
  char v98;
  uint8_t v99[128];
  uint8_t buf[4];
  id v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  id v105;
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v69 = a3;
  v10 = a4;
  v11 = a5;
  v64 = (uint64_t (**)(id, id, id *))a6;
  v97[0] = 0;
  v97[1] = v97;
  v97[2] = 0x2020000000;
  v98 = 0;
  v95[0] = 0;
  v95[1] = v95;
  v95[2] = 0x2020000000;
  v96 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v90[0] = MEMORY[0x1E0C809B0];
  v90[1] = 3221225472;
  v90[2] = __82__CPLMingleUtility__applyMingledBatch_scope_forStore_onPutBatchInPullQueue_error___block_invoke;
  v90[3] = &unk_1E60D76D8;
  v93 = v97;
  v94 = v95;
  v67 = v11;
  v91 = v67;
  v62 = v10;
  v92 = v62;
  v68 = (unsigned int (**)(void))MEMORY[0x1B5E08DC4](v90);
  objc_msgSend(v67, "cloudCache");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "idMapping");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v69;
  if (v69)
  {
    if (!objc_msgSend(v69, "count"))
    {
      v17 = 0;
LABEL_7:
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_584();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v101 = v69;
          _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEBUG, "Applying to cloud cache %@", buf, 0xCu);
        }

        v13 = v69;
      }
      v88 = v17;
      LODWORD(v14) = objc_msgSend(v65, "applyBatch:isFinal:direction:withError:", v13, 0, 2, &v88);
      v16 = v88;

      if (!(_DWORD)v14)
        goto LABEL_79;
      if (!objc_msgSend(v69, "count"))
      {
        LOBYTE(v14) = 1;
        goto LABEL_82;
      }
      objc_msgSend(v67, "downloadQueue");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "scopes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v85[0] = v12;
      v85[1] = 3221225472;
      v85[2] = __82__CPLMingleUtility__applyMingledBatch_scope_forStore_onPutBatchInPullQueue_error___block_invoke_2;
      v85[3] = &unk_1E60DAF30;
      v56 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v86 = v56;
      v61 = v19;
      v87 = v61;
      v57 = (unsigned int (**)(_QWORD, _QWORD))MEMORY[0x1B5E08DC4](v85);
      v83 = 0u;
      v84 = 0u;
      v82 = 0u;
      v81 = 0u;
      obj = v69;
      v20 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v81, v106, 16);
      if (v20)
      {
        v22 = *(_QWORD *)v82;
        *(_QWORD *)&v21 = 138412802;
        v55 = v21;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v82 != v22)
              objc_enumerationMutation(obj);
            v24 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
            v25 = (void *)MEMORY[0x1B5E08BF0]();
            if (objc_msgSend(v24, "supportsResources") && v68[2]())
            {
              objc_msgSend(v24, "scopedIdentifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "scopeIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v59, "containsObject:", v27) & 1) == 0
                && ((unsigned int (**)(_QWORD, void *))v57)[2](v57, v27))
              {
                if ((objc_msgSend(v24, "isDelete") & 1) != 0
                  || objc_msgSend(v24, "hasChangeType:", 2) && (objc_msgSend(v24, "inTrash") & 1) != 0
                  || objc_msgSend(v24, "isFullRecord", v55)
                  && (objc_msgSend(v24, "resources"),
                      v28 = (void *)objc_claimAutoreleasedReturnValue(),
                      v29 = objc_msgSend(v28, "count") == 0,
                      v28,
                      !v29))
                {
                  objc_msgSend(v59, "addObject:", v27, (_QWORD)v55);
                }
              }

            }
            objc_msgSend(v24, "scopedIdentifier", (_QWORD)v55);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = 0;
            if (objc_msgSend(v24, "supportsResources")
              && ((objc_msgSend(v24, "hasChangeType:", 8) & 1) != 0 || objc_msgSend(v24, "isDelete")))
            {
              objc_msgSend(v66, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v30, &v80);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (v31)
              {
                v79 = v16;
                v32 = objc_msgSend(v58, "removeAllBackgroundDownloadTasksForItemWithScopedIdentifier:error:", v31, &v79);
                v33 = v79;

                if ((v32 & 1) != 0)
                {
                  v34 = 1;
                }
                else
                {
                  if (!_CPLSilentLogging)
                  {
                    __CPLTaskOSLogDomain_584();
                    v35 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                    {
                      v36 = (void *)objc_opt_class();
                      *(_DWORD *)buf = v55;
                      v101 = v36;
                      v102 = 2112;
                      v103 = v31;
                      v104 = 2112;
                      v105 = v33;
                      v37 = v36;
                      _os_log_impl(&dword_1B03C2000, v35, OS_LOG_TYPE_ERROR, "Can't remove background download tasks for <%@ %@> from queue: %@", buf, 0x20u);

                    }
                  }
                  v34 = 0;
                }
                v16 = v33;
              }
              else
              {
                v34 = 1;
              }

            }
            else
            {
              v34 = 1;
            }

            objc_autoreleasePoolPop(v25);
            if (!v34)
            {
              v14 = obj;
LABEL_76:
              v47 = v16;
              goto LABEL_77;
            }
          }
          v20 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v81, v106, 16);
          if (v20)
            continue;
          break;
        }
      }

      if (objc_msgSend(v59, "count"))
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_584();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v59, "allObjects");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "componentsJoinedByString:", CFSTR(","));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v101 = v40;
            _os_log_impl(&dword_1B03C2000, v38, OS_LOG_TYPE_DEFAULT, "Tentatively consider %{public}@ have moved under quota", buf, 0xCu);

          }
        }
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v14 = v59;
        v41 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v75, v99, 16);
        if (v41)
        {
          v42 = *(_QWORD *)v76;
          do
          {
            for (j = 0; j != v41; ++j)
            {
              if (*(_QWORD *)v76 != v42)
                objc_enumerationMutation(v14);
              objc_msgSend(v61, "scopeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * j));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              if (v44)
              {
                objc_msgSend(v61, "sharingScopeForScope:", v44);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                if (v45)
                {
                  v74 = v16;
                  v46 = objc_msgSend(v61, "setValue:forFlag:forScope:error:", 0, 2, v45, &v74);
                  v47 = v74;

                  if ((v46 & 1) == 0)
                  {

                    goto LABEL_77;
                  }
                }
                else
                {
                  v47 = v16;
                }
                v73 = v47;
                v48 = objc_msgSend(v61, "setValue:forFlag:forScope:error:", 0, 2, v44, &v73);
                v16 = v73;

                if (!v48)
                  goto LABEL_76;
              }
            }
            v41 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v75, v99, 16);
          }
          while (v41);
        }

      }
      if (objc_msgSend(v61, "busyStateForScope:", v62))
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_584();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v101 = v62;
            _os_log_impl(&dword_1B03C2000, v49, OS_LOG_TYPE_DEFAULT, "Tentatively consider %@ is not busy any more", buf, 0xCu);
          }

        }
        v72 = v16;
        LODWORD(v14) = objc_msgSend(v61, "storeBusyState:forScope:error:", 0, v62, &v72);
        v47 = v72;

        if (!(_DWORD)v14)
          goto LABEL_78;
        objc_msgSend(v61, "sharingScopeForScope:", v62);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (v50)
        {
          v71 = v47;
          v51 = objc_msgSend(v61, "storeBusyState:forScope:error:", 0, v50, &v71);
          v16 = v71;

          if (!v51)
          {
            LOBYTE(v14) = 0;
            v47 = v16;
LABEL_78:

            v16 = v47;
            goto LABEL_79;
          }
        }
        else
        {
          v16 = v47;
        }
      }
      objc_msgSend(v67, "pullQueue");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v16;
      LOBYTE(v14) = objc_msgSend(v53, "appendChangeBatch:error:", obj, &v70);
      v47 = v70;

      if (_CPLSilentLogging)
        v54 = 1;
      else
        v54 = (char)v14;
      if ((v54 & 1) == 0)
      {
        __CPLTaskOSLogDomain_584();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v101 = v47;
          _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Can't put batch in pull queue: %@", buf, 0xCu);
        }
LABEL_77:

        LOBYTE(v14) = 0;
      }
      goto LABEL_78;
    }
    v89 = 0;
    LODWORD(v14) = v64[2](v64, v69, &v89);
    v15 = v89;
    v16 = v15;
    if ((_DWORD)v14)
    {
      v17 = v15;
      goto LABEL_7;
    }
  }
  else
  {
    LOBYTE(v14) = 0;
    v16 = 0;
  }
LABEL_79:
  if (a7 && (v14 & 1) == 0)
  {
    v16 = objc_retainAutorelease(v16);
    LOBYTE(v14) = 0;
    *a7 = v16;
  }
LABEL_82:

  _Block_object_dispose(v95, 8);
  _Block_object_dispose(v97, 8);

  return (char)v14;
}

+ (BOOL)mingleChangeBatch:(id)a3 scope:(id)a4 forStore:(id)a5 onPutBatchInPullQueue:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  id v22;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(v14, "cloudCache");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_584();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v12;
      _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_DEBUG, "Processing %@", buf, 0xCu);
    }

  }
  v25 = 0;
  objc_msgSend(v16, "cloudChangeBatchFromBatch:usingMapping:isFinal:withError:", v12, 0, 0, &v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v25;
  v20 = v19;
  if (v18)
  {
    v24 = v19;
    v21 = objc_msgSend(a1, "_applyMingledBatch:scope:forStore:onPutBatchInPullQueue:error:", v18, v13, v14, v15, &v24);
    v22 = v24;

    v20 = v22;
    if (!a7)
      goto LABEL_11;
  }
  else
  {
    v21 = 0;
    if (!a7)
      goto LABEL_11;
  }
  if ((v21 & 1) == 0)
    *a7 = objc_retainAutorelease(v20);
LABEL_11:

  return v21;
}

+ (BOOL)_remapScopedIdentifier:(id)a3 to:(id)a4 class:(Class)a5 inBatch:(id)a6 store:(id)a7 idMapping:(id)a8 cloudCache:(id)a9 remappedRecords:(id)a10 error:(id *)a11
{
  id v17;
  objc_class *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  int v29;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  os_log_type_t v33;
  NSObject *v34;
  NSObject *v35;
  char v36;
  id v37;
  void *v38;
  NSObject *v39;
  char v40;
  id v41;
  id v42;
  char v43;
  char v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v55;
  id v56;
  id v57;
  id v58;
  char v59;
  uint8_t buf[4];
  Class v61;
  __int16 v62;
  id v63;
  __int16 v64;
  objc_class *v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = (objc_class *)a4;
  v19 = a6;
  v55 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  if (!v18)
  {
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_584();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v61 = a5;
        v62 = 2112;
        v63 = v17;
        _os_log_impl(&dword_1B03C2000, v49, OS_LOG_TYPE_ERROR, "Trying to remap <%@ %@> to no other scoped identifier", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLMingleUtility.m");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v51, 176, CFSTR("Trying to remap <%@ %@> to no other scoped identifier"), a5, v17);

    abort();
  }
  v23 = v22;
  v59 = 0;
  objc_msgSend(v20, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v18, &v59);
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
LABEL_23:
    v38 = v21;
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_584();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v61 = a5;
        v62 = 2112;
        v63 = v17;
        v64 = 2112;
        v65 = v18;
        _os_log_impl(&dword_1B03C2000, v39, OS_LOG_TYPE_DEFAULT, "<%@ %@> has been remapped to %@", buf, 0x20u);
      }

    }
    v57 = 0;
    v40 = objc_msgSend(v20, "setFinalCloudScopedIdentifier:forPendingCloudScopedIdentifier:error:", v18, v17, &v57);
    v41 = v57;
    v42 = v41;
    if ((v40 & 1) != 0)
    {
      v56 = v41;
      v53 = v21;
      v43 = objc_msgSend(v21, "remapAllRecordsWithPreviousScopedIdentifier:newScopedIdentifier:error:", v17, v18, &v56);
      v25 = v56;

      if ((v43 & 1) != 0)
        goto LABEL_29;
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_584();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          v61 = a5;
          v62 = 2112;
          v63 = v17;
          v64 = 2112;
          v65 = v18;
          v66 = 2112;
          v67 = v25;
          _os_log_impl(&dword_1B03C2000, v46, OS_LOG_TYPE_ERROR, "Failed to update cloud cache remapping all %@s with %@ to %@: %@", buf, 0x2Au);
        }

      }
      v42 = v25;
      v38 = v21;
      if (!a11)
      {
LABEL_36:

        v44 = 0;
        goto LABEL_51;
      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_584();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v61 = v18;
          v62 = 2112;
          v63 = v17;
          v64 = 2112;
          v65 = (objc_class *)v42;
          _os_log_impl(&dword_1B03C2000, v45, OS_LOG_TYPE_ERROR, "Failed to set final cloud identifier %@ for cloud identifier %@: %@", buf, 0x20u);
        }

      }
      if (!a11)
        goto LABEL_36;
    }
    v42 = objc_retainAutorelease(v42);
    *a11 = v42;
    goto LABEL_36;
  }
  v25 = (id)v24;
  objc_msgSend(v20, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v17, &v59);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    v53 = v21;
    if (!objc_msgSend(v21, "hasRecordWithScopedIdentifier:", v17))
    {
      if (_CPLSilentLogging)
        goto LABEL_16;
      __CPLTaskOSLogDomain_584();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v61 = a5;
        v62 = 2112;
        v63 = v17;
        _os_log_impl(&dword_1B03C2000, v34, OS_LOG_TYPE_DEFAULT, "Ignoring remap for <%@ %@> as we don't know this record", buf, 0x16u);
      }
LABEL_15:

LABEL_16:
LABEL_29:

      v44 = objc_msgSend(v23, "addRemappedRecordWithScopedIdentifier:realScopedIdentifier:error:", v17, v18, a11);
      v38 = v53;
      goto LABEL_51;
    }
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_584();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v61 = a5;
        v62 = 2112;
        v63 = v17;
        v31 = "<%@ %@> has been remapped and should not even be here to begin with. Fixing cloud cache";
        v32 = v30;
        v33 = OS_LOG_TYPE_ERROR;
        goto LABEL_12;
      }
LABEL_13:

    }
LABEL_14:
    v34 = -[objc_class newDeleteChangeWithScopedIdentifier:](a5, "newDeleteChangeWithScopedIdentifier:", v17);
    objc_msgSend(v19, "addRecord:", v34);
    goto LABEL_15;
  }
  v52 = v23;
  v27 = v19;
  objc_msgSend(v55, "transactionClientCacheView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "hasRecordWithScopedIdentifier:", v25);

  if (v29)
  {
    v19 = v27;
    v53 = v21;
    v23 = v52;
    if (!_CPLSilentLogging)
    {
      __CPLTaskOSLogDomain_584();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v61 = a5;
        v62 = 2112;
        v63 = v17;
        v31 = "Got a remapped <%@ %@> too late, so we will need to delete it in the client";
        v32 = v30;
        v33 = OS_LOG_TYPE_DEFAULT;
LABEL_12:
        _os_log_impl(&dword_1B03C2000, v32, v33, v31, buf, 0x16u);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_584();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v61 = a5;
      v62 = 2112;
      v63 = v17;
      v64 = 2112;
      v65 = v18;
      v66 = 2112;
      v67 = v25;
      _os_log_impl(&dword_1B03C2000, v35, OS_LOG_TYPE_DEFAULT, "<%@ %@> had been remapped to %@ but we believed %@ was already pointing to this cloud identifier. Which is wrong. Doing a normal remap here", buf, 0x2Au);
    }

  }
  v58 = 0;
  v36 = objc_msgSend(v20, "removeMappingForCloudScopedIdentifier:error:", v18, &v58);
  v37 = v58;
  if ((v36 & 1) != 0)
  {

    v19 = v27;
    v23 = v52;
    goto LABEL_23;
  }
  v19 = v27;
  if (!_CPLSilentLogging)
  {
    __CPLTaskOSLogDomain_584();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v61 = v18;
      v62 = 2112;
      v63 = v37;
      _os_log_impl(&dword_1B03C2000, v47, OS_LOG_TYPE_ERROR, "Can't reset mapping for %@: %@", buf, 0x16u);
    }

  }
  v44 = 0;
  v38 = v21;
  v23 = v52;
LABEL_51:

  return v44;
}

+ (BOOL)mingleRemappedBatch:(id)a3 scope:(id)a4 forStore:(id)a5 onPutBatchInPullQueue:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  CPLChangeBatch *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  CPLChangeBatch *v25;
  int v26;
  id v27;
  void *v28;
  int v29;
  id v30;
  char v31;
  id *v33;
  id v34;
  id v35;
  id obj;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = objc_alloc_init(CPLChangeBatch);
  objc_msgSend(v13, "idMapping");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cloudCache");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "remappedRecords");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v13;
  objc_msgSend(v13, "transientPullRepository");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v11;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v47;
    v34 = v14;
    v35 = v12;
    v33 = a7;
LABEL_3:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v47 != v18)
        objc_enumerationMutation(obj);
      v20 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v19);
      v21 = (void *)MEMORY[0x1B5E08BF0]();
      objc_msgSend(v20, "scopedIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "realScopedIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v20, "recordClass");
      v45 = 0;
      v25 = v15;
      v26 = objc_msgSend(a1, "_remapScopedIdentifier:to:class:inBatch:store:idMapping:cloudCache:remappedRecords:error:", v22, v23, v24, v15, v42, v41, v40, v39, &v45);
      v27 = v45;

      if (!v26)
        break;
      objc_msgSend(v20, "scopedIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v27;
      v29 = objc_msgSend(v38, "markUnmingledChangeWithScopedIdentifierAsMingled:error:", v28, &v44);
      v30 = v44;

      if (!v29)
      {
        v27 = v30;
        break;
      }

      objc_autoreleasePoolPop(v21);
      ++v19;
      v15 = v25;
      if (v17 == v19)
      {
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
        v14 = v34;
        v12 = v35;
        a7 = v33;
        if (v17)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v15 = v25;
    objc_autoreleasePoolPop(v21);

    v31 = 0;
    v14 = v34;
    v12 = v35;
    a7 = v33;
    if (!v33)
      goto LABEL_18;
  }
  else
  {
LABEL_10:

    if (!-[CPLChangeBatch count](v15, "count"))
    {
      v27 = 0;
      v31 = 1;
      goto LABEL_18;
    }
    v43 = 0;
    v31 = objc_msgSend(a1, "_applyMingledBatch:scope:forStore:onPutBatchInPullQueue:error:", v15, v12, v42, v14, &v43);
    v27 = v43;
    if (!a7)
      goto LABEL_18;
  }
  if ((v31 & 1) == 0)
  {
    v27 = objc_retainAutorelease(v27);
    v31 = 0;
    *a7 = v27;
  }
LABEL_18:

  return v31;
}

+ (BOOL)_shouldDeletePrivateRecordWithNaturalPrivateScopedIdentifier:(id)a3 correctPrivateScopedIdentifier:(id)a4 cloudCache:(id)a5 transientPullRepository:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  BOOL v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v15 = 0;
  if ((objc_msgSend(v9, "isEqual:", v10) & 1) == 0)
  {
    if (objc_msgSend(v11, "hasRecordWithScopedIdentifier:", v9))
    {
      if ((objc_msgSend(v11, "hasRecordWithScopedIdentifier:", v10) & 1) != 0
        || (objc_msgSend(v12, "unmingledChangeWithScopedIdentifier:", v10),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v13, "isFullRecord"),
            v13,
            (v14 & 1) != 0))
      {
        v15 = 1;
      }
    }
  }

  return v15;
}

+ (BOOL)mingleSharedRemappedBatch:(id)a3 scope:(id)a4 sharedScope:(id)a5 forStore:(id)a6 fixUpTasks:(id *)a7 onPutBatchInPullQueue:(id)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  __int128 v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CPLScopedIdentifier *v26;
  void *v27;
  void *v28;
  CPLScopedIdentifier *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  CPLSharedRemapFixUpTask *v37;
  id v38;
  int v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  const char *v43;
  uint32_t v44;
  CPLScopedIdentifier *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  int v49;
  CPLSharedRemapFixUpTask *v50;
  CPLSharedRemapFixUpTask *v51;
  char v52;
  CPLSharedRemapFixUpTask *v53;
  char v54;
  CPLSharedRemapFixUpTask *v55;
  id v56;
  BOOL v57;
  CPLChangeBatch *v58;
  __int128 v60;
  id *v61;
  id v62;
  id v63;
  id v64;
  CPLChangeBatch *v65;
  id v66;
  id obj;
  char v68;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  CPLSharedRemapFixUpTask *v74;
  void *v75;
  CPLSharedRemapFixUpTask *v76;
  CPLSharedRemapFixUpTask *v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  NSObject *v88;
  __int16 v89;
  void *v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v73 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  objc_msgSend(v16, "cloudCache");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "remappedRecords");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "transientPullRepository");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_alloc_init(CPLChangeBatch);
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v19 = v14;
  v72 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
  if (!v72)
  {

    v53 = 0;
    v66 = 0;
    goto LABEL_58;
  }
  v61 = a7;
  v62 = v17;
  v66 = 0;
  obj = v19;
  v63 = v16;
  v64 = v15;
  v74 = 0;
  v68 = 1;
  v71 = *(_QWORD *)v80;
  *(_QWORD *)&v20 = 138413058;
  v60 = v20;
  do
  {
    for (i = 0; i != v72; ++i)
    {
      if (*(_QWORD *)v80 != v71)
        objc_enumerationMutation(obj);
      v22 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
      v23 = (void *)MEMORY[0x1B5E08BF0]();
      objc_msgSend(v22, "scopedIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "realScopedIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = [CPLScopedIdentifier alloc];
      objc_msgSend(v73, "scopeIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](v26, "initWithScopeIdentifier:identifier:", v27, v28);

      v30 = v29;
      objc_msgSend(v18, "unmingledChangeWithScopedIdentifier:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31 && objc_msgSend(v31, "supportsSharingScopedIdentifier"))
      {
        if (objc_msgSend(v32, "isDelete"))
        {
          v33 = v30;
          if (_CPLSilentLogging)
          {
LABEL_36:

            goto LABEL_37;
          }
          __CPLTaskOSLogDomain_584();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v84 = v24;
            v85 = 2112;
            v86 = v25;
            v87 = 2112;
            v88 = v30;
            _os_log_impl(&dword_1B03C2000, v34, OS_LOG_TYPE_DEFAULT, "%@ has been remapped to %@ but the private record %@ is meant to be deleted", buf, 0x20u);
          }
          v33 = v30;
LABEL_35:

          goto LABEL_36;
        }
        objc_msgSend(v32, "sharingRecordScopedIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v40;
        if (!v40)
        {
          if (!_CPLSilentLogging)
          {
            __CPLTaskOSLogDomain_584();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v84 = v24;
              v85 = 2112;
              v86 = v25;
              v87 = 2112;
              v88 = v30;
              v42 = v41;
              v43 = "%@ has been remapped to %@ but the private record %@ is not shared any more";
              v44 = 32;
              goto LABEL_32;
            }
LABEL_33:

          }
LABEL_34:
          v34 = v30;
          goto LABEL_35;
        }
        if ((objc_msgSend(v40, "isEqual:", v24) & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            __CPLTaskOSLogDomain_584();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v60;
              v84 = v24;
              v85 = 2112;
              v86 = v25;
              v87 = 2112;
              v88 = v30;
              v89 = 2112;
              v90 = v33;
              v42 = v41;
              v43 = "%@ has been remapped to %@ but the private record %@ is already shared to %@";
              v44 = 42;
LABEL_32:
              _os_log_impl(&dword_1B03C2000, v42, OS_LOG_TYPE_DEFAULT, v43, buf, v44);
            }
            goto LABEL_33;
          }
          goto LABEL_34;
        }
        v35 = v30;
      }
      else
      {

        objc_msgSend(v75, "targetForRecordWithSharedCloudScopedIdentifier:", v24);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "targetState") != 3)
          goto LABEL_36;
        objc_msgSend(v33, "scopedIdentifier");
        v35 = objc_claimAutoreleasedReturnValue();
      }

      if (v35)
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_584();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v84 = v24;
            v85 = 2112;
            v86 = v25;
            v87 = 2112;
            v88 = v35;
            _os_log_impl(&dword_1B03C2000, v36, OS_LOG_TYPE_DEFAULT, "%@ has been remapped to %@ but we will need to fix up %@ first", buf, 0x20u);
          }

        }
        v37 = -[CPLSharedRemapFixUpTask initWithSharedCloudScopedIdentifier:realCloudScopedIdentifier:privateCloudScopedIdentifier:proposedPrivateScopedIdentifier:recordClass:]([CPLSharedRemapFixUpTask alloc], "initWithSharedCloudScopedIdentifier:realCloudScopedIdentifier:privateCloudScopedIdentifier:proposedPrivateScopedIdentifier:recordClass:", v24, v25, v35, v30, objc_msgSend(v22, "recordClass"));
        v38 = v66;
        if (!v66)
          v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v66 = v38;
        objc_msgSend(v38, "addObject:", v37, v60);
        v39 = 1;
        goto LABEL_52;
      }
LABEL_37:
      v45 = [CPLScopedIdentifier alloc];
      objc_msgSend(v25, "identifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v45, "initRelativeToScopedIdentifier:identifier:", v30, v46);

      if (objc_msgSend(a1, "_shouldDeletePrivateRecordWithNaturalPrivateScopedIdentifier:correctPrivateScopedIdentifier:cloudCache:transientPullRepository:", v35, v30, v75, v18))
      {
        if (!_CPLSilentLogging)
        {
          __CPLTaskOSLogDomain_584();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v84 = v24;
            v85 = 2112;
            v86 = v25;
            v87 = 2112;
            v88 = v35;
            _os_log_impl(&dword_1B03C2000, v47, OS_LOG_TYPE_DEFAULT, "Acknowledging shared record %@ has been remapped to %@ too late - so we will need to delete %@ in the client", buf, 0x20u);
          }

        }
        v48 = objc_msgSend((id)objc_msgSend(v22, "recordClass", (_QWORD)v60), "newDeleteChangeWithScopedIdentifier:", v35);
        -[CPLChangeBatch addRecord:](v65, "addRecord:", v48);
LABEL_46:

        goto LABEL_47;
      }
      if (!_CPLSilentLogging)
      {
        __CPLTaskOSLogDomain_584();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v84 = v24;
          v85 = 2112;
          v86 = v25;
          _os_log_impl(&dword_1B03C2000, v48, OS_LOG_TYPE_DEFAULT, "Acknowledging shared record %@ has been remapped to %@", buf, 0x16u);
        }
        goto LABEL_46;
      }
LABEL_47:
      v78 = 0;
      v49 = objc_msgSend(v70, "addRemappedRecordWithScopedIdentifier:realScopedIdentifier:error:", v24, v25, &v78, (_QWORD)v60);
      v50 = (CPLSharedRemapFixUpTask *)v78;
      v51 = v50;
      if (v49)
      {
        v77 = v50;
        v52 = objc_msgSend(v18, "markUnmingledChangeWithScopedIdentifierAsMingled:error:", v24, &v77);
        v37 = v77;

        if ((v52 & 1) != 0)
        {
          v39 = 1;
          v68 = 1;
          goto LABEL_52;
        }
        v51 = v37;
      }
      v39 = 0;
      v68 = 0;
      v37 = v74;
      v74 = v51;
LABEL_52:

      objc_autoreleasePoolPop(v23);
      if (!v39)
        goto LABEL_55;
    }
    v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
  }
  while (v72);
LABEL_55:
  v19 = obj;

  v16 = v63;
  v15 = v64;
  a7 = v61;
  v17 = v62;
  v53 = v74;
  if ((v68 & 1) == 0)
  {
LABEL_61:
    if (a9)
    {
      v53 = objc_retainAutorelease(v53);
      v57 = 0;
      *a9 = v53;
    }
    else
    {
      v57 = 0;
    }
    v58 = v65;
    v56 = v66;
    goto LABEL_65;
  }
LABEL_58:
  if (-[CPLChangeBatch count](v65, "count"))
  {
    v76 = v53;
    v54 = objc_msgSend(a1, "_applyMingledBatch:scope:forStore:onPutBatchInPullQueue:error:", v65, v73, v16, v17, &v76);
    v55 = v76;

    v53 = v55;
    if ((v54 & 1) == 0)
      goto LABEL_61;
  }
  v56 = objc_retainAutorelease(v66);
  *a7 = v56;
  v57 = 1;
  v58 = v65;
LABEL_65:

  return v57;
}

+ (BOOL)applyShareRemapFixUpTasks:(id)a3 scope:(id)a4 store:(id)a5 onPutBatchInPullQueue:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  CPLChangeBatch *v15;
  id v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CPLScopedIdentifier *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  int v30;
  id v31;
  void *v32;
  char v33;
  id v34;
  int v35;
  id v36;
  id v37;
  id *v39;
  id v40;
  id v41;
  id v42;
  CPLChangeBatch *v43;
  uint64_t v44;
  void *v45;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  id v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v13, "cloudCache");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "remappedRecords");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "transientPullRepository");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(CPLChangeBatch);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v16 = v11;
  v49 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
  if (v49)
  {
    v39 = a7;
    v40 = v14;
    v41 = v13;
    v42 = v12;
    v50 = 0;
    v43 = v15;
    v44 = *(_QWORD *)v56;
    v45 = v16;
    while (1)
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v56 != v44)
          objc_enumerationMutation(v16);
        v18 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x1B5E08BF0]();
        objc_msgSend(v18, "sharedCloudScopedIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "realCloudScopedIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "proposedPrivateScopedIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = [CPLScopedIdentifier alloc];
        objc_msgSend(v21, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v23, "initRelativeToScopedIdentifier:identifier:", v22, v24);

        if (objc_msgSend(a1, "_shouldDeletePrivateRecordWithNaturalPrivateScopedIdentifier:correctPrivateScopedIdentifier:cloudCache:transientPullRepository:", v25, v22, v48, v51))
        {
          if (!_CPLSilentLogging)
          {
            __CPLTaskOSLogDomain_584();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v18, "privateCloudScopedIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v60 = v27;
              v61 = 2112;
              v62 = v20;
              v63 = 2112;
              v64 = v21;
              v65 = 2112;
              v66 = v25;
              _os_log_impl(&dword_1B03C2000, v26, OS_LOG_TYPE_DEFAULT, "After fix-up of %@, acknowledging shared record %@ has been remapped to %@ too late - so we will need to delete %@ in the client", buf, 0x2Au);

            }
          }
          v28 = objc_msgSend((id)objc_msgSend(v18, "recordClass", v39, v40, v41, v42), "newDeleteChangeWithScopedIdentifier:", v25);
          -[CPLChangeBatch addRecord:](v43, "addRecord:", v28);
        }
        else
        {
          if (_CPLSilentLogging)
            goto LABEL_16;
          __CPLTaskOSLogDomain_584();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v18, "privateCloudScopedIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v60 = v29;
            v61 = 2112;
            v62 = v20;
            v63 = 2112;
            v64 = v21;
            _os_log_impl(&dword_1B03C2000, v28, OS_LOG_TYPE_DEFAULT, "After fix-up of %@, acknowledging %@ has been remapped to %@", buf, 0x20u);

          }
        }

LABEL_16:
        v54 = 0;
        v30 = objc_msgSend(v47, "addRemappedRecordWithScopedIdentifier:realScopedIdentifier:error:", v20, v21, &v54, v39, v40, v41, v42);
        v31 = v54;
        if (v30)
        {
          objc_msgSend(v18, "sharedCloudScopedIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v31;
          v33 = objc_msgSend(v51, "markUnmingledChangeWithScopedIdentifierAsMingled:error:", v32, &v53);
          v34 = v53;

          if ((v33 & 1) != 0)
          {
            v35 = 1;
            goto LABEL_21;
          }
          v31 = v34;
        }
        v34 = v31;

        v35 = 0;
        v50 = v34;
LABEL_21:

        objc_autoreleasePoolPop(v19);
        v16 = v45;
      }
      v49 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
      if (!v49)
      {

        if (v35)
        {
          v13 = v41;
          v12 = v42;
          a7 = v39;
          v14 = v40;
          v15 = v43;
          v36 = v50;
          goto LABEL_26;
        }
        v13 = v41;
        v12 = v42;
        a7 = v39;
        v14 = v40;
        v15 = v43;
        v36 = v50;
        if (v39)
        {
LABEL_30:
          if ((v35 & 1) == 0)
          {
            v36 = objc_retainAutorelease(v36);
            LOBYTE(v35) = 0;
            *a7 = v36;
          }
        }
        goto LABEL_33;
      }
    }
  }

  v36 = 0;
LABEL_26:
  if (-[CPLChangeBatch count](v15, "count"))
  {
    v52 = v36;
    LOBYTE(v35) = objc_msgSend(a1, "_applyMingledBatch:scope:forStore:onPutBatchInPullQueue:error:", v15, v12, v13, v14, &v52);
    v37 = v52;

    v36 = v37;
    if (a7)
      goto LABEL_30;
  }
  else
  {
    LOBYTE(v35) = 1;
  }
LABEL_33:

  return v35;
}

uint64_t __82__CPLMingleUtility__applyMingledBatch_scope_forStore_onPutBatchInPullQueue_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v2 + 24))
  {
    *(_BYTE *)(v2 + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "pushRepository");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "scopeIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v3, "hasChangesInScopeWithIdentifier:", v4) ^ 1;

  }
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
}

uint64_t __82__CPLMingleUtility__applyMingledBatch_scope_forStore_onPutBatchInPullQueue_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "scopeWithIdentifier:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "valueForFlag:forScope:", 2, v5));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = (void *)MEMORY[0x1E0C9AAA0];
    }
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);

  }
  v6 = objc_msgSend(v4, "BOOLValue");

  return v6;
}

@end
