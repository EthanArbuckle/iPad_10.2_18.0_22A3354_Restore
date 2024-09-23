@implementation ATClientController

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "ATClientController dealloc", buf, 2u);
  }

  if (self->_queueMap)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[NSDictionary allValues](self->_clientMap, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          CFDictionaryGetValue(self->_queueMap, *(const void **)(*((_QWORD *)&v11 + 1) + 8 * v8));
          v9 = objc_claimAutoreleasedReturnValue();
          dispatch_queue_set_specific(v9, CFSTR("disabled_queue"), (void *)1, 0);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v6);
    }

    CFRelease(self->_queueMap);
    self->_queueMap = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)ATClientController;
  -[ATClientController dealloc](&v10, sel_dealloc);
}

- (id)clientForDataclass:(id)a3
{
  return -[NSDictionary objectForKey:](self->_clientMap, "objectForKey:", a3);
}

- (id)allClients
{
  return -[NSDictionary allValues](self->_clientMap, "allValues");
}

- (void)resetQueues
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  id v15;
  dispatch_queue_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_queueMap)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[NSDictionary allValues](self->_clientMap, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v22;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v22 != v6)
            objc_enumerationMutation(v3);
          CFDictionaryGetValue(self->_queueMap, *(const void **)(*((_QWORD *)&v21 + 1) + 8 * v7));
          v8 = objc_claimAutoreleasedReturnValue();
          dispatch_queue_set_specific(v8, CFSTR("disabled_queue"), (void *)1, 0);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v5);
    }

    CFRelease(self->_queueMap);
    self->_queueMap = 0;
  }
  self->_queueMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[ATClientController allClients](self, "allClients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(const void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.atc-%@"), objc_opt_class());
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v16 = dispatch_queue_create((const char *)objc_msgSend(v15, "UTF8String"), 0);

        CFDictionaryAddValue(self->_queueMap, v14, v16);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v11);
  }

}

- (void)waitToDrain
{
  CFIndex Count;
  const void **v4;
  size_t v5;
  NSObject *v6;
  CFIndex i;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[8];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  Count = CFDictionaryGetCount(self->_queueMap);
  v4 = (const void **)&v9[-((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0)];
  if ((unint64_t)(8 * Count) >= 0x200)
    v5 = 512;
  else
    v5 = 8 * Count;
  bzero(&v9[-((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0)], v5);
  CFDictionaryGetKeysAndValues(self->_queueMap, 0, v4);
  _ATLogCategoryFramework();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1868000, v6, OS_LOG_TYPE_DEFAULT, "Waiting for queues to drain...", buf, 2u);
  }

  for (i = 0; CFDictionaryGetCount(self->_queueMap) > i; ++i)
    dispatch_barrier_sync((dispatch_queue_t)v4[i], &__block_literal_global_9);
  _ATLogCategoryFramework();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_DEFAULT, "Queues drained.", v9, 2u);
  }

}

- (id)queueForClient:(id)a3
{
  id v5;
  __CFDictionary *queueMap;
  void *v7;
  void *v9;

  v5 = a3;
  queueMap = self->_queueMap;
  if (!queueMap)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATClientController.m"), 110, CFSTR("We have no queues!"));

    queueMap = self->_queueMap;
  }
  CFDictionaryGetValue(queueMap, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_loadClientsForDataclasses:(id)a3
{
  unint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  objc_class *v24;
  objc_class *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void **v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  objc_class *v56;
  void *v59;
  id obj;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  objc_class *v65;
  void *v66;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
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
  const __CFString *v86;
  id v87;
  void *v88;
  const __CFString *v89;
  void *v90;
  void *v91;
  _QWORD v92[2];
  _QWORD v93[2];
  void *v94;
  const __CFString *v95;
  void *v96;
  void *v97;
  const __CFString *v98;
  void *v99;
  void *v100;
  uint8_t buf[4];
  objc_class *v102;
  __int16 v103;
  id v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99D68], "date", a3);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v107, 16);
  if (v62)
  {
    v61 = *(_QWORD *)v83;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v83 != v61)
          objc_enumerationMutation(obj);
        v64 = v5;
        v6 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * v5);
        MSVSystemRootDirectory();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("SyncBundles"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByResolvingSymlinksInPath");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = 0;
        objc_msgSend(v11, "contentsOfDirectoryAtPath:error:", v10, &v77);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v77;

        v69 = v12;
        v71 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v78, v106, 16);
        if (v71)
        {
          v70 = *(_QWORD *)v79;
          v68 = v10;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v79 != v70)
                objc_enumerationMutation(v69);
              v14 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * v13);
              objc_msgSend(*(id *)(v3 + 3432), "date");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "stringByAppendingPathComponent:", v14);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "pathExtension");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("syncBundle"));

              if (v18)
              {
                _ATLogCategoryFramework();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v102 = (objc_class *)v16;
                  _os_log_impl(&dword_1D1868000, v19, OS_LOG_TYPE_DEFAULT, "Loading bundle at path '%{public}@'", buf, 0xCu);
                }

                v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithPath:", v16);
                v21 = v20;
                if (v20)
                {
                  v76 = 0;
                  v22 = objc_msgSend(v20, "loadAndReturnError:", &v76);
                  v23 = v76;
                  if (v22)
                  {
                    v24 = (objc_class *)objc_msgSend(v21, "principalClass");
                    if (v24)
                    {
                      v25 = v24;
                      if (-[objc_class conformsToProtocol:](v24, "conformsToProtocol:", &unk_1EFC7B5B0))
                      {
                        v65 = v25;
                        v66 = v23;
                        v26 = objc_alloc_init(v25);
                        v72 = 0u;
                        v73 = 0u;
                        v74 = 0u;
                        v75 = 0u;
                        objc_msgSend(v26, "supportedDataclasses");
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v72, v105, 16);
                        if (v28)
                        {
                          v29 = v28;
                          v30 = *(_QWORD *)v73;
                          do
                          {
                            for (i = 0; i != v29; ++i)
                            {
                              if (*(_QWORD *)v73 != v30)
                                objc_enumerationMutation(v27);
                              objc_msgSend(v4, "setObject:forKey:", v26, *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i));
                            }
                            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v72, v105, 16);
                          }
                          while (v29);
                        }

                        _ATLogCategoryFramework();
                        v32 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                        {
                          objc_msgSend(MEMORY[0x1E0C99D68], "date");
                          v33 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v33, "timeIntervalSinceDate:", v15);
                          *(_DWORD *)buf = 138543618;
                          v102 = v65;
                          v103 = 2048;
                          v104 = v34;
                          _os_log_impl(&dword_1D1868000, v32, OS_LOG_TYPE_DEFAULT, "Loaded bundle %{public}@ in %.2fs", buf, 0x16u);

                        }
                        v3 = 0x1E0C99000;
                        goto LABEL_40;
                      }
                      v36 = v23;
                      NSStringFromProtocol((Protocol *)&unk_1EFC7B5B0);
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      _ATLogCategoryFramework();
                      v44 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543618;
                        v102 = (objc_class *)v16;
                        v103 = 2114;
                        v104 = v37;
                        _os_log_impl(&dword_1D1868000, v44, OS_LOG_TYPE_ERROR, "unable to load sync bundle at path %{public}@: principal class does not implement %{public}@ protocol", buf, 0x16u);
                      }

                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("principal class does not implement %@ protocol"), v37);
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      v98 = CFSTR("bundlePath");
                      v99 = v16;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      v100 = v43;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      -[ATClientController _snapShotWithContext:events:](self, "_snapShotWithContext:events:", v38, v45);

                      v3 = 0x1E0C99000;
LABEL_38:

LABEL_39:
                      objc_msgSend(v21, "unload");
LABEL_40:

                      v10 = v68;
                      goto LABEL_41;
                    }
                    v36 = v23;
                    _ATLogCategoryFramework();
                    v42 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543362;
                      v102 = (objc_class *)v16;
                      _os_log_impl(&dword_1D1868000, v42, OS_LOG_TYPE_ERROR, "unable to load sync bundle at path %{public}@: no principal class", buf, 0xCu);
                    }

                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no principal class"));
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    v95 = CFSTR("bundlePath");
                    v96 = v16;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    v97 = v38;
                    v40 = (void *)MEMORY[0x1E0C99D20];
                    v41 = &v97;
                  }
                  else
                  {
                    _ATLogCategoryFramework();
                    v39 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543618;
                      v102 = (objc_class *)v16;
                      v103 = 2114;
                      v104 = v23;
                      _os_log_impl(&dword_1D1868000, v39, OS_LOG_TYPE_ERROR, "unable to load sync bundle at path %{public}@: error %{public}@", buf, 0x16u);
                    }

                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to load sync bundle"));
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    v92[0] = CFSTR("bundlePath");
                    v92[1] = CFSTR("loadError");
                    v93[0] = v16;
                    v93[1] = v23;
                    v36 = v23;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 2);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    v94 = v38;
                    v40 = (void *)MEMORY[0x1E0C99D20];
                    v41 = &v94;
                  }
                  objc_msgSend(v40, "arrayWithObjects:count:", v41, 1);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  -[ATClientController _snapShotWithContext:events:](self, "_snapShotWithContext:events:", v37, v43);
                  goto LABEL_38;
                }
                _ATLogCategoryFramework();
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v102 = (objc_class *)v16;
                  _os_log_impl(&dword_1D1868000, v35, OS_LOG_TYPE_ERROR, "unable to load sync bundle at path %{public}@, filesystem error", buf, 0xCu);
                }

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("filesystem error"));
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v89 = CFSTR("bundlePath");
                v90 = v16;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v91 = v37;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 1);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                -[ATClientController _snapShotWithContext:events:](self, "_snapShotWithContext:events:", v36, v38);
                goto LABEL_39;
              }
LABEL_41:

              ++v13;
            }
            while (v13 != v71);
            v46 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v78, v106, 16);
            v71 = v46;
          }
          while (v46);
        }

        if (v63)
        {
          v47 = objc_msgSend(v63, "code");
          _ATLogCategoryFramework();
          v48 = objc_claimAutoreleasedReturnValue();
          v49 = v48;
          if (v47 == 260)
          {
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v102 = (objc_class *)v63;
              _os_log_impl(&dword_1D1868000, v49, OS_LOG_TYPE_DEFAULT, "Encountered error loading sync bundles: %{public}@. Ignoring", buf, 0xCu);
            }
          }
          else
          {
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v102 = (objc_class *)v63;
              _os_log_impl(&dword_1D1868000, v49, OS_LOG_TYPE_ERROR, "Encountered error loading sync bundles: %{public}@", buf, 0xCu);
            }

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error loading sync bundles"));
            v49 = objc_claimAutoreleasedReturnValue();
            v86 = CFSTR("error");
            v87 = v63;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = v50;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            -[ATClientController _snapShotWithContext:events:](self, "_snapShotWithContext:events:", v49, v51);

          }
        }

        v5 = v64 + 1;
      }
      while (v64 + 1 != v62);
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v107, 16);
    }
    while (v62);
  }

  if (!objc_msgSend(v4, "count"))
  {
    _ATLogCategoryFramework();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1868000, v52, OS_LOG_TYPE_ERROR, "found 0 sync bundle clients.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATClientController.m"), 196, CFSTR("Failed to load sync bundles"));

  }
  objc_storeStrong((id *)&self->_clientMap, v4);
  -[ATClientController resetQueues](self, "resetQueues");
  _ATLogCategoryFramework();
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(v3 + 3432), "date");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "timeIntervalSinceDate:", v59);
    *(_DWORD *)buf = 134217984;
    v102 = v56;
    _os_log_impl(&dword_1D1868000, v54, OS_LOG_TYPE_DEFAULT, "Loaded all clients in %.2fs", buf, 0xCu);

  }
  return 1;
}

- (void)_snapShotWithContext:(id)a3 events:(id)a4
{
  objc_msgSend(MEMORY[0x1E0D4D030], "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", *MEMORY[0x1E0D4CE28], CFSTR("Bug"), CFSTR("ATCClientController"), a3, 0, a4, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientMap, 0);
}

+ (id)controllerForDataclasses:(id)a3
{
  id v3;
  ATClientController *v4;
  _BOOL4 v5;
  ATClientController *v6;

  v3 = a3;
  v4 = objc_alloc_init(ATClientController);
  v5 = -[ATClientController _loadClientsForDataclasses:](v4, "_loadClientsForDataclasses:", v3);

  if (v5)
    v6 = v4;
  else
    v6 = 0;

  return v6;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2528 != -1)
    dispatch_once(&sharedInstance_onceToken_2528, &__block_literal_global_2529);
  return (id)sharedInstance___sharedInstance;
}

void __36__ATClientController_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[ATClientController controllerForDataclasses:](ATClientController, "controllerForDataclasses:", 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = v0;

}

@end
