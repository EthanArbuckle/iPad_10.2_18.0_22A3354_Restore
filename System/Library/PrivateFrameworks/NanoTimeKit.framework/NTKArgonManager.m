@implementation NTKArgonManager

void __37__NTKArgonManager_refreshWithReason___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __37__NTKArgonManager_refreshWithReason___block_invoke_3_cold_1(a1, v2);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "removeObject:", *(_QWORD *)(a1 + 32));
    v3 = *(void **)(a1 + 56);
    if (v3)
    {
      objc_msgSend(v3, "allObjects");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "addObjectsFromArray:", v4);

    }
    objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32));
    v5 = *(void **)(a1 + 80);
    if (v5)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), v5);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 88));
  }
}

- (void)refreshWithReason:(int64_t)a3
{
  void (**v3)(void *, const __CFString *, const __CFString *);
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  dispatch_time_t v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  id v35;
  void (**v36)(void *, const __CFString *, const __CFString *);
  void *v38;
  dispatch_queue_t queue;
  _QWORD v41[5];
  id v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD block[4];
  id v46;
  NSObject *v47;
  _QWORD *v48;
  _QWORD v49[4];
  NSObject *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  NSObject *v55;
  _QWORD *v56;
  _QWORD *v57;
  _QWORD *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[3];
  char v68;
  _QWORD v69[5];
  id v70;
  _QWORD aBlock[5];
  _QWORD v72[5];
  id v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  -[NTKArgonManager workQueue](self, "workQueue");
  queue = (dispatch_queue_t)objc_claimAutoreleasedReturnValue();
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3032000000;
  v72[3] = __Block_byref_object_copy__17;
  v72[4] = __Block_byref_object_dispose__17;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v73 = (id)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__NTKArgonManager_refreshWithReason___block_invoke;
  aBlock[3] = &unk_1E6BD22F8;
  aBlock[4] = v72;
  v36 = (void (**)(void *, const __CFString *, const __CFString *))_Block_copy(aBlock);
  v3 = v36;
  v36[2](v36, CFSTR("7fANGylL6PUa3uY81gCLFCCt5U+XnmAjQ3dxfLMkoSw="), CFSTR("6d71ba2edb6ed7bcac81260d78a90e2d406774094c76eb31a442f8b4ff5b3631.aea"));
  v3[2](v3, CFSTR("TL/Q1YYFljbn/n5bqLhisDb9QNanzHRT5EaNf+ZMCiM="), CFSTR("56d4a6adb4b04c9917f0c1ae56cf70e6044de7e91d6fd6fc5e9113148f8619d0.aea"));
  v3[2](v3, CFSTR("dEc80tVMljpKxC/0UaPLLcbNZMatPSFK8pYhVp8a9f8="), CFSTR("520971cc499189d3cb8042fb7551a727effccfc6201fcf32bedab306ac668881.aea"));
  v4 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[NTKArgonManager fetchers](self, "fetchers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x3032000000;
  v69[3] = __Block_byref_object_copy__17;
  v69[4] = __Block_byref_object_dispose__17;
  v70 = 0;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  v68 = 0;
  v6 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[NTKArgonManager fetchers](self, "fetchers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[NTKArgonManager fetchers](self, "fetchers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v64;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v64 != v11)
          objc_enumerationMutation(v9);
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    }
    while (v10);
  }

  v15 = dispatch_group_create();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[NTKArgonManager fetchers](self, "fetchers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v60;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v60 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v19);
        dispatch_group_enter(v15);
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKArgonManager keyDatabase](self, "keyDatabase");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "latestChangeTokenForServerIdentifier:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __37__NTKArgonManager_refreshWithReason___block_invoke_2;
        v49[3] = &unk_1E6BD2348;
        v50 = queue;
        v56 = v67;
        v26 = v22;
        v51 = v26;
        v27 = v25;
        v52 = v27;
        v53 = v8;
        v57 = v72;
        v54 = v38;
        v58 = v69;
        v55 = v15;
        objc_msgSend(v20, "fetchNewRecordsSinceChangeToken:forReason:completion:", v24, a3, v49);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
    }
    while (v17);
  }

  if (NTKInternalBuild(v28, v29))
    v30 = 60000000000;
  else
    v30 = 43200000000000;
  v31 = dispatch_time(0, v30);
  v32 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__NTKArgonManager_refreshWithReason___block_invoke_39;
  block[3] = &unk_1E6BD0830;
  v47 = v15;
  v48 = v67;
  v46 = v8;
  v33 = v15;
  v34 = v8;
  dispatch_after(v31, queue, block);
  v41[0] = v32;
  v41[1] = 3221225472;
  v41[2] = __37__NTKArgonManager_refreshWithReason___block_invoke_40;
  v41[3] = &unk_1E6BD2370;
  v41[4] = self;
  v42 = v38;
  v43 = v72;
  v44 = v69;
  v35 = v38;
  dispatch_group_notify(v33, queue, v41);

  _Block_object_dispose(v67, 8);
  _Block_object_dispose(v69, 8);

  _Block_object_dispose(v72, 8);
}

- (NSArray)fetchers
{
  return self->_fetchers;
}

void __37__NTKArgonManager_refreshWithReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NTKArgonKeyDescriptor *v7;
  NTKArgonKeyDescriptor *v8;

  v5 = a3;
  v6 = a2;
  v8 = -[NTKArgonKeyDescriptor initWithKey:fileName:]([NTKArgonKeyDescriptor alloc], "initWithKey:fileName:", v6, v5);

  v7 = v8;
  if (v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v8);
    v7 = v8;
  }

}

- (void)_queue_extractKnownKeyDescriptorsIfNeededWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NTKArgonEncryptedBundleEnumerator *v12;
  void *v13;
  NTKArgonEncryptedBundleEnumerator *v14;
  void *v15;
  NTKArgonEncryptedBundleEnumerator *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  _QWORD block[4];
  id v31;
  NTKArgonManager *v32;
  id v33;
  _QWORD *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  NSObject *v38;
  NTKArgonManager *v39;
  _QWORD *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  int v46;
  _BYTE v47[128];
  _QWORD v48[4];

  v48[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NTKArgonManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2810000000;
  v45[3] = &unk_1B75A3F6B;
  v46 = 0;
  -[NTKArgonManager _queue_extractedKeyDescriptors](self, "_queue_extractedKeyDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v8 = (void *)MEMORY[0x1E0C99E98];
  -[NTKArgonManager extractor](self, "extractor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourcePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileURLWithPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [NTKArgonEncryptedBundleEnumerator alloc];
  v48[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[NTKArgonEncryptedBundleEnumerator initWithSourceDirectoryURLs:](v12, "initWithSourceDirectoryURLs:", v13);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v16 = v14;
  v17 = -[NTKArgonEncryptedBundleEnumerator countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v42;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v42 != v18)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v19), "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = -[NTKArgonEncryptedBundleEnumerator countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v17);
  }

  v21 = dispatch_group_create();
  dispatch_group_enter(v21);
  -[NTKArgonManager keyDatabase](self, "keyDatabase");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke;
  v35[3] = &unk_1E6BD23C0;
  v40 = v45;
  v24 = v7;
  v36 = v24;
  v25 = v15;
  v37 = v25;
  v26 = v21;
  v38 = v26;
  v39 = self;
  objc_msgSend(v22, "enumerateKeyDescriptors:", v35);

  -[NTKArgonManager workQueue](self, "workQueue");
  v27 = objc_claimAutoreleasedReturnValue();
  block[0] = v23;
  block[1] = 3221225472;
  block[2] = __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke_51;
  block[3] = &unk_1E6BD23E8;
  v31 = v24;
  v32 = self;
  v33 = v4;
  v34 = v45;
  v28 = v4;
  v29 = v24;
  dispatch_group_notify(v26, v27, block);

  dispatch_group_leave(v26);
  _Block_object_dispose(v45, 8);
}

- (id)_queue_extractedKeyDescriptors
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  NTKArgonKeyDescriptor *v31;
  uint64_t v32;
  void *v33;
  __int128 v35;
  NSObject *log;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[NTKArgonManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKArgonManager extractor](self, "extractor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extractionPath");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKArgonManager extractor](self, "extractor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extractionPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumeratorAtPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "skipDescendants");
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v10)
  {
    v12 = v10;
    v13 = CFSTR("bundle");
    v14 = *(_QWORD *)v42;
    v15 = *MEMORY[0x1E0CB2B20];
    *(_QWORD *)&v11 = 138543362;
    v35 = v11;
    v39 = *(_QWORD *)v42;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v42 != v14)
          objc_enumerationMutation(v9);
        v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v16);
        objc_msgSend(v9, "fileAttributes", v35);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fileType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", v15);

        if (v20)
        {
          objc_msgSend(v17, "pathExtension");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", v13);

          if (v22)
          {
            v23 = v13;
            objc_msgSend(v40, "stringByAppendingPathComponent:", v17);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "stringByAppendingPathComponent:", CFSTR("Info.plist"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v26;
            if (v26)
            {
              objc_msgSend(v26, "objectForKey:", CFSTR("Argon"));
              v28 = objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                -[NSObject objectForKey:](v28, "objectForKey:", CFSTR("Key"));
                v29 = objc_claimAutoreleasedReturnValue();
                -[NSObject objectForKey:](v28, "objectForKey:", CFSTR("FileName"));
                v30 = objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v38 = (void *)v30;
                if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v31 = -[NTKArgonKeyDescriptor initWithKey:fileName:]([NTKArgonKeyDescriptor alloc], "initWithKey:fileName:", v29, v30);
                  if (v31)
                  {
                    objc_msgSend(v37, "addObject:", v31);
                  }
                  else
                  {
                    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
                    log = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = v35;
                      v46 = v25;
                      _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "Invalid Argon bundle info at %{public}@: malformed key descriptor", buf, 0xCu);
                    }

                  }
                }
                else
                {
                  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
                  v31 = (NTKArgonKeyDescriptor *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(&v31->super, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = v35;
                    v46 = v25;
                    _os_log_error_impl(&dword_1B72A3000, &v31->super, OS_LOG_TYPE_ERROR, "Invalid Argon bundle info at %{public}@: malformed Info.plist", buf, 0xCu);
                  }
                }

              }
              else
              {
                _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v35;
                  v46 = v25;
                  _os_log_error_impl(&dword_1B72A3000, v29, OS_LOG_TYPE_ERROR, "Invalid Argon bundle info at %{public}@: malformed Info.plist", buf, 0xCu);
                }
              }

            }
            else
            {
              _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v35;
                v46 = v25;
                _os_log_error_impl(&dword_1B72A3000, v28, OS_LOG_TYPE_ERROR, "Invalid Argon bundle info at %{public}@: malformed or missing Info.plist", buf, 0xCu);
              }
            }

            v13 = v23;
            v14 = v39;
          }
        }
        ++v16;
      }
      while (v12 != v16);
      v32 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      v12 = v32;
    }
    while (v32);
  }

  v33 = (void *)objc_msgSend(v37, "copy");
  return v33;
}

- (NTKArgonExtractorProviding)extractor
{
  return self->_extractor;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NTKArgonLocalKeyDatabaseProviding)keyDatabase
{
  return self->_keyDatabase;
}

void __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  int8x16_t v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  int8x16_t v14;
  uint64_t v15;

  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
  if ((v4 & 1) == 0)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v3, "fileName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v6);

    if ((v5 & 1) != 0)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 56), "extractor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke_48;
      v11[3] = &unk_1E6BD2398;
      v15 = *(_QWORD *)(a1 + 64);
      v12 = *(id *)(a1 + 32);
      v13 = v3;
      v10 = *(int8x16_t *)(a1 + 48);
      v8 = (id)v10.i64[0];
      v14 = vextq_s8(v10, v10, 8uLL);
      objc_msgSend(v7, "extractUsingKeyDescriptor:completion:", v13, v11);

      v9 = v12;
    }
    else
    {
      _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke_cold_1(v3, v9);
    }

  }
}

- (NSHashTable)observers
{
  return self->_observers;
}

void __37__NTKArgonManager_refreshWithReason___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__NTKArgonManager_refreshWithReason___block_invoke_3;
  block[3] = &unk_1E6BD2320;
  v24 = *(_QWORD *)(a1 + 80);
  v10 = *(NSObject **)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  v19 = v7;
  v25 = *(_QWORD *)(a1 + 88);
  v20 = *(id *)(a1 + 64);
  v21 = v8;
  v11 = *(_QWORD *)(a1 + 96);
  v22 = v9;
  v26 = v11;
  v23 = *(id *)(a1 + 72);
  v12 = v9;
  v13 = v8;
  v14 = v7;
  dispatch_async(v10, block);

}

- (NTKArgonManager)initWithKeyDatabase:(id)a3 fetchers:(id)a4 extractor:(id)a5
{
  id v9;
  id v10;
  id v11;
  NTKArgonManager *v12;
  NTKArgonManager *v13;
  uint64_t v14;
  NSArray *fetchers;
  uint64_t v16;
  NSHashTable *observers;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *workQueue;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)NTKArgonManager;
  v12 = -[NTKArgonManager init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_keyDatabase, a3);
    v14 = objc_msgSend(v10, "copy");
    fetchers = v13->_fetchers;
    v13->_fetchers = (NSArray *)v14;

    objc_storeStrong((id *)&v13->_extractor, a5);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v16 = objc_claimAutoreleasedReturnValue();
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v16;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("com.apple.nanotimekit.facesupport.manager", v18);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v19;

  }
  return v13;
}

void __37__NTKArgonManager_refreshWithReason___block_invoke_39(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[4];
  uint64_t v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v14 = v7;
          _os_log_error_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_ERROR, "Fetcher %{public}@: Timed out. Abandoning results.", buf, 0xCu);
        }

        dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    }
    while (v4);
  }

}

void __37__NTKArgonManager_refreshWithReason___block_invoke_40(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  __int128 v29;
  void *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[4];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint8_t v45[128];
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_queue_extractedKeyDescriptors");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 138412290;
    v47 = v3;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "Downloaded key descriptors %@", buf, 0xCu);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v41;
    *(_QWORD *)&v5 = 138412290;
    v29 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v41 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v9, "fileName", v29);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[NTKFaceSupportUnlockAttemptEventRecorder sharedRecorder](NTKFaceSupportUnlockAttemptEventRecorder, "sharedRecorder");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __37__NTKArgonManager_refreshWithReason___block_invoke_42;
        v38[3] = &unk_1E6BCE728;
        v12 = v10;
        v39 = v12;
        objc_msgSend(v11, "beginRecordingForIdentifier:method:completion:", v12, 2, v38);
        objc_msgSend(*(id *)(a1 + 32), "keyDatabase");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0;
        v14 = objc_msgSend(v13, "addKeyDescriptor:error:", v9, &v37);
        v15 = v37;

        if ((v14 & 1) != 0)
        {
          if (!objc_msgSend(v30, "containsObject:", v9))
            goto LABEL_15;
          _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v29;
            v47 = v9;
            _os_log_impl(&dword_1B72A3000, v16, OS_LOG_TYPE_DEFAULT, "Bundle already extracted for key descriptor %@", buf, 0xCu);
          }
        }
        else
        {
          _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v29;
            v47 = v15;
            _os_log_error_impl(&dword_1B72A3000, v16, OS_LOG_TYPE_ERROR, "Couldn't add key descriptor: %@", buf, 0xCu);
          }
        }

LABEL_15:
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v6);
  }

  v17 = *(void **)(a1 + 32);
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __37__NTKArgonManager_refreshWithReason___block_invoke_44;
  v36[3] = &unk_1E6BCD5F0;
  v36[4] = v17;
  objc_msgSend(v17, "_queue_extractKnownKeyDescriptorsIfNeededWithCompletion:", v36);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v18 = *(id *)(a1 + 40);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "keyDatabase");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "recordChangeToken:forServerIdentifier:", v24, v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v20);
  }

  v27 = *(_QWORD *)(a1 + 56);
  v26 = a1 + 56;
  if (*(_QWORD *)(*(_QWORD *)(v27 + 8) + 40))
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      __37__NTKArgonManager_refreshWithReason___block_invoke_40_cold_1(v26, v28);

  }
}

void __37__NTKArgonManager_refreshWithReason___block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __37__NTKArgonManager_refreshWithReason___block_invoke_42_cold_1(a1, (uint64_t)v3, v4);

  }
}

void __37__NTKArgonManager_refreshWithReason___block_invoke_44(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "argonManagerDidRefresh:", *(_QWORD *)(a1 + 32));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)extractKnownKeyDescriptorsIfNeededWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[NTKArgonManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__NTKArgonManager_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke;
  v8[3] = &unk_1E6BD00B0;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, v8);
  dispatch_async(v5, v7);

}

uint64_t __68__NTKArgonManager_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_extractKnownKeyDescriptorsIfNeededWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)addArgonManagerObserver:(id)a3
{
  id v4;
  NTKArgonManager *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[NTKArgonManager observers](v5, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    objc_sync_exit(v5);
    v4 = v7;
  }

}

- (void)removeArgonManagerObserver:(id)a3
{
  id v4;
  NTKArgonManager *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[NTKArgonManager observers](v5, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v7);

    objc_sync_exit(v5);
    v4 = v7;
  }

}

void __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke_48(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v5;
      _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "Extracted key to %@", buf, 0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
    v9 = *(id *)(a1 + 48);
    objc_sync_enter(v9);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(*(id *)(a1 + 48), "observers", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "argonManager:didExtractKeyDescriptor:toPath:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v5);
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v11);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke_48_cold_1((uint64_t)v6, v8, v14);

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
    v9 = *(id *)(a1 + 48);
    objc_sync_enter(v9);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(*(id *)(a1 + 48), "observers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "argonManager:failedToExtractKeyDescriptor:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v6);
        }
        v15 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
      }
      while (v15);
    }
  }

  objc_sync_exit(v9);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke_51(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t j;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  _QWORD block[4];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v55 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "fileName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    }
    while (v5);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
  v41 = a1;
  v42 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(*(id *)(a1 + 40), "extractor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourcePath");
  v10 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)v10;
  objc_msgSend(v11, "contentsOfDirectoryAtPath:error:", v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
  if (v14)
  {
    v15 = v14;
    v43 = 0;
    v16 = *(_QWORD *)v51;
    v17 = v42;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v51 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        objc_msgSend(v19, "pathExtension");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("aea"));

        if (v21)
        {
          if (objc_msgSend(v2, "containsObject:", v19))
            ++v43;
          else
            objc_msgSend(v42, "addObject:", v19);
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    }
    while (v15);
  }
  else
  {
    v43 = 0;
    v17 = v42;
  }
  v39 = v13;

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v17, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sortedArrayUsingSelector:", sel_compare_);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v47;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v47 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * k);
        _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v59 = v28;
          _os_log_impl(&dword_1B72A3000, v29, OS_LOG_TYPE_DEFAULT, "No key available to extract %@", buf, 0xCu);
        }

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v62, 16, v39);
    }
    while (v25);
  }

  v30 = objc_msgSend(v42, "count") + v43;
  v31 = objc_msgSend(v42, "count");
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
  if (v31)
  {
    v34 = v41;
    if (!v33)
      goto LABEL_36;
    v35 = objc_msgSend(v42, "count");
    *(_DWORD *)buf = 134218240;
    v59 = v35;
    v60 = 2048;
    v61 = v30;
    v36 = "Still waiting for keys for %lu of %lu archives";
    v37 = v32;
    v38 = 22;
  }
  else
  {
    v34 = v41;
    if (!v33)
      goto LABEL_36;
    *(_DWORD *)buf = 134217984;
    v59 = v30;
    v36 = "All keys obtained for %lu available archives";
    v37 = v32;
    v38 = 12;
  }
  _os_log_impl(&dword_1B72A3000, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);
LABEL_36:

  if (*(_QWORD *)(v34 + 48))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke_56;
    block[3] = &unk_1E6BCDF60;
    v45 = *(id *)(v34 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_extractor, 0);
  objc_storeStrong((id *)&self->_fetchers, 0);
  objc_storeStrong((id *)&self->_keyDatabase, 0);
}

void __37__NTKArgonManager_refreshWithReason___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
  v8 = 138543618;
  v9 = v4;
  v10 = 2050;
  v11 = v6;
  OUTLINED_FUNCTION_2(&dword_1B72A3000, a2, v7, "Fetcher %{public}@: Timed out. Fetch completed after %{public}f seconds.", (uint8_t *)&v8);

}

void __37__NTKArgonManager_refreshWithReason___block_invoke_40_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "Asset and key fetch failed: %{public}@.", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __37__NTKArgonManager_refreshWithReason___block_invoke_42_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_2(&dword_1B72A3000, a3, (uint64_t)a3, "Couldn't ingest key from JSON %@ - %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_debug_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_DEBUG, "Skipping extraction of %{public}@: archive doesn't exist; possibly from previous release?",
    (uint8_t *)&v4,
    0xCu);

}

void __75__NTKArgonManager__queue_extractKnownKeyDescriptorsIfNeededWithCompletion___block_invoke_48_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = 0;
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_2(&dword_1B72A3000, a2, a3, "Could not extract to %@ - %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end
