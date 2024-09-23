@implementation _HDObjectAuthorizationPromptSession

- (void)endPromptTransactionWithSuccess:(void *)a3 error:
{
  id v5;
  const void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  const void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t k;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id obj;
  BOOL v71;
  id v72;
  void *v73;
  id v74;
  id *location;
  id v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  id v86[6];
  id v87;
  id v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _QWORD v101[5];
  id v102;
  id v103;
  __int128 buf;
  uint64_t (*v105)(_QWORD *);
  void *v106;
  uint64_t v107;
  id v108;
  id v109;
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    v6 = *(const void **)(a1 + 40);
    if (v6)
    {
      v7 = _Block_copy(v6);
      v8 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = 0;

      v62 = v7;
      if (a2)
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
        objc_msgSend(WeakRetained, "sourceManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 48);
        v86[0] = 0;
        objc_msgSend(v10, "localSourceForBundleIdentifier:error:", v11, v86);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v86[0];

        if (!v12)
        {
          _HKInitializeLogging();
          v14 = *MEMORY[0x1E0CB5280];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v13;
            _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "Failed to look up source entity: %{public}@", (uint8_t *)&buf, 0xCu);
          }
          v15 = v13;

          v5 = v15;
        }
        v71 = v12 != 0;

      }
      else
      {
        v12 = 0;
        v71 = 0;
      }
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v63 = a1;
      obj = *(id *)(a1 + 16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v100, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v83;
        location = (id *)(a1 + 8);
        v65 = v12;
        v66 = v5;
        v64 = *(_QWORD *)v83;
        do
        {
          v19 = 0;
          v67 = v17;
          do
          {
            if (*(_QWORD *)v83 != v18)
              objc_enumerationMutation(obj);
            v20 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * v19);
            if (v20)
              v21 = *(void **)(v20 + 56);
            else
              v21 = 0;
            v22 = v21;
            v23 = objc_loadWeakRetained(location);
            v24 = v12;
            v25 = v22;
            v26 = v23;
            v27 = v5;
            if (v20)
            {
              v28 = *(const void **)(v20 + 16);
              if (v28)
              {
                v76 = v24;
                v29 = _Block_copy(v28);
                v30 = *(void **)(v20 + 16);
                *(_QWORD *)(v20 + 16) = 0;

                if (v71)
                {
                  v72 = v26;
                  v73 = v29;
                  v74 = v25;
                  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                  v97 = 0u;
                  v98 = 0u;
                  v95 = 0u;
                  v96 = 0u;
                  v32 = *(id *)(v20 + 32);
                  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v95, &buf, 16);
                  if (v33)
                  {
                    v34 = v33;
                    v35 = *(_QWORD *)v96;
                    do
                    {
                      for (i = 0; i != v34; ++i)
                      {
                        if (*(_QWORD *)v96 != v35)
                          objc_enumerationMutation(v32);
                        v37 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
                        objc_msgSend(v37, "UUID");
                        v38 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v31, "setObject:forKeyedSubscript:", v37, v38);

                      }
                      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v95, &buf, 16);
                    }
                    while (v34);
                  }

                  v39 = *(_QWORD *)(v20 + 32);
                  v94 = v27;
                  v26 = v72;
                  +[HDObjectAuthorizationEntity authorizationRecordsForSamples:sourceEntity:sessionIdentifier:profile:error:](HDObjectAuthorizationEntity, "authorizationRecordsForSamples:sourceEntity:sessionIdentifier:profile:error:", v39, v76, v74, v72, &v94);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = v94;

                  if (v40)
                  {
                    v69 = v41;
                    v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    v90 = 0u;
                    v91 = 0u;
                    v92 = 0u;
                    v93 = 0u;
                    v68 = v40;
                    v43 = v40;
                    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
                    if (v44)
                    {
                      v45 = v44;
                      v46 = *(_QWORD *)v91;
                      do
                      {
                        for (j = 0; j != v45; ++j)
                        {
                          if (*(_QWORD *)v91 != v46)
                            objc_enumerationMutation(v43);
                          v48 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * j);
                          if (objc_msgSend(v48, "status") == 2)
                          {
                            objc_msgSend(v48, "objectUUID");
                            v49 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v31, "objectForKeyedSubscript:", v49);
                            v50 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v42, "addObject:", v50);

                          }
                        }
                        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
                      }
                      while (v45);
                    }

                    v86[1] = (id)MEMORY[0x1E0C809B0];
                    v86[2] = (id)3221225472;
                    v86[3] = __106___HDObjectAuthorizationRequest_invokeCompletionWithSuccess_sourceEntity_sessionIdentifier_profile_error___block_invoke_3;
                    v86[4] = &unk_1E6CFA190;
                    v89 = v73;
                    v86[5] = (id)v20;
                    v87 = v42;
                    v51 = v69;
                    v88 = v69;
                    v52 = v42;
                    HKDispatchAsyncOnGlobalConcurrentQueue();

                    v26 = v72;
                    v40 = v68;
                  }
                  else
                  {
                    v101[0] = MEMORY[0x1E0C809B0];
                    v101[1] = 3221225472;
                    v101[2] = __106___HDObjectAuthorizationRequest_invokeCompletionWithSuccess_sourceEntity_sessionIdentifier_profile_error___block_invoke_2;
                    v101[3] = &unk_1E6CEBCA0;
                    v103 = v73;
                    v101[4] = v20;
                    v102 = v41;
                    HKDispatchAsyncOnGlobalConcurrentQueue();

                    v52 = v103;
                    v51 = v41;
                  }

                  v12 = v65;
                  v5 = v66;
                  v18 = v64;
                  v17 = v67;
                  v53 = v73;
                  v25 = v74;
                }
                else
                {
                  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
                  *((_QWORD *)&buf + 1) = 3221225472;
                  v105 = __106___HDObjectAuthorizationRequest_invokeCompletionWithSuccess_sourceEntity_sessionIdentifier_profile_error___block_invoke;
                  v106 = &unk_1E6CEBCA0;
                  v109 = v29;
                  v107 = v20;
                  v51 = v27;
                  v108 = v51;
                  HKDispatchAsyncOnGlobalConcurrentQueue();

                  v53 = v29;
                  v31 = v109;
                }

                v27 = v51;
                v24 = v76;
              }
            }

            ++v19;
          }
          while (v19 != v17);
          v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v100, 16);
          v17 = v54;
        }
        while (v54);
      }

      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      v55 = *(id *)(v63 + 24);
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v78, v99, 16);
      if (v56)
      {
        v57 = v56;
        v58 = *(_QWORD *)v79;
        v59 = v62;
        do
        {
          for (k = 0; k != v57; ++k)
          {
            if (*(_QWORD *)v79 != v58)
              objc_enumerationMutation(v55);
            v77 = v5;
            HKDispatchAsyncOnGlobalConcurrentQueue();

          }
          v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v78, v99, 16);
        }
        while (v57);
      }
      else
      {
        v59 = v62;
      }

      v5 = v5;
      v61 = v59;
      HKDispatchAsyncOnGlobalConcurrentQueue();

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong(&self->_sessionCompletion, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
