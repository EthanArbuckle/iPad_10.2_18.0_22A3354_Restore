@implementation HDPluginManager

- (id)_builtInPluginClasses
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HDPluginManager)initWithDaemon:(id)a3
{
  id v5;
  HDPluginManager *v6;
  HDPluginManager *v7;
  void *v8;
  uint64_t v9;
  NSArray *plugins;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDPluginManager.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("daemon != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)HDPluginManager;
  v6 = -[HDPluginManager init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_daemon, v5);
    -[HDPluginManager _pluginClasses](v7, "_pluginClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDPluginManager _createPluginsFromClasses:](v7, "_createPluginsFromClasses:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    plugins = v7->_plugins;
    v7->_plugins = (NSArray *)v9;

  }
  return v7;
}

- (id)_pluginsDirectoryPath
{
  if (a1)
  {
    objc_msgSend((id)GSSystemRootDirectory(), "stringByAppendingPathComponent:", CFSTR("/System/Library/Health/Plugins"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_internalPluginsDirectoryPaths
{
  void *v1;
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)GSSystemRootDirectory(), "stringByAppendingPathComponent:", CFSTR("/AppleInternal/Library/Health/Plugins"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_pluginDirectoryPaths
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[HDPluginManager _pluginsDirectoryPath](self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
  {
    -[HDPluginManager _internalPluginsDirectoryPaths]((uint64_t)self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

  }
  return v5;
}

- (NSArray)allowablePluginDirectoryPaths
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HDPluginManager _pluginsDirectoryPath](self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[HDPluginManager _internalPluginsDirectoryPaths]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  objc_msgSend((id)GSSystemRootDirectory(), "stringByAppendingPathComponent:", *MEMORY[0x1E0CB5768]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  return (NSArray *)v3;
}

- (id)_pluginClasses
{
  id v3;
  void *v4;
  os_log_t *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  char v24;
  char v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  os_log_t *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  NSObject *v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  __CFString *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  NSObject *v46;
  uint64_t v47;
  id obj;
  HDPluginManager *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  id v58;
  id v59;
  void *v60;
  uint64_t v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  id v79;
  _BYTE v80[128];
  uint8_t v81[128];
  uint8_t v82[4];
  id v83;
  __int16 v84;
  __CFString *v85;
  __int16 v86;
  void *v87;
  _BYTE buf[12];
  __int16 v89;
  id v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HDPluginManager _builtInPluginClasses](self, "_builtInPluginClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v3;
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  -[HDPluginManager _pluginDirectoryPaths](self, "_pluginDirectoryPaths");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
  if (v53)
  {
    v5 = (os_log_t *)MEMORY[0x1E0CB52C0];
    v52 = *(_QWORD *)v68;
    v6 = 0x1E0CB3000uLL;
    v50 = self;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v68 != v52)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1BCCACAC4]();
        if (self)
        {
          *(_QWORD *)buf = &unk_1EF1A83E0;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }
        v66 = 0;
        v62 = v10;
        v11 = v8;
        if (self)
        {
          v12 = objc_alloc_init(MEMORY[0x1E0CB3620]);
          objc_msgSend(v12, "contentsOfDirectoryAtPath:error:", v11, &v66);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v55 = v12;
            v56 = v9;
            v57 = v7;
            v59 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v71 = 0u;
            v72 = 0u;
            v73 = 0u;
            v74 = 0u;
            v54 = v13;
            v63 = v13;
            v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
            if (v65)
            {
              v14 = *(_QWORD *)v72;
              v58 = v11;
              v61 = *(_QWORD *)v72;
              do
              {
                v15 = 0;
                do
                {
                  if (*(_QWORD *)v72 != v14)
                    objc_enumerationMutation(v63);
                  v16 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v15);
                  v17 = (void *)MEMORY[0x1BCCACAC4]();
                  objc_msgSend(v16, "pathExtension");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("bundle"));

                  if (v19)
                  {
                    objc_msgSend(v11, "stringByAppendingPathComponent:", v16);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    v21 = v62;
                    v22 = v20;
                    v23 = (void *)objc_msgSend(objc_alloc(*(Class *)(v6 + 1232)), "initWithPath:", v22);
                    if (v23)
                    {
                      v24 = objc_msgSend(MEMORY[0x1E0CB6F18], "processHasLoadedUIKit");
                      v79 = 0;
                      v25 = objc_msgSend(v23, "loadAndReturnError:", &v79);
                      v64 = v79;
                      if ((v25 & 1) != 0)
                      {
                        if ((v24 & 1) == 0)
                        {
                          if (objc_msgSend(MEMORY[0x1E0CB6F18], "processHasLoadedUIKit"))
                          {
                            _HKInitializeLogging();
                            v26 = *v5;
                            if (os_log_type_enabled(*v5, OS_LOG_TYPE_FAULT))
                            {
                              *(_DWORD *)buf = 138543362;
                              *(_QWORD *)&buf[4] = v22;
                              _os_log_fault_impl(&dword_1B7802000, v26, OS_LOG_TYPE_FAULT, "**** IMPROPER LOADING OF UIKIT BY HEALTHD PLUGIN *** (%{public}@)", buf, 0xCu);
                            }
                          }
                        }
                        v60 = v21;
                        v27 = (void *)objc_msgSend(v23, "principalClass");
                        if (!v27)
                        {
                          _HKInitializeLogging();
                          v28 = *v5;
                          if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138543362;
                            *(_QWORD *)&buf[4] = v22;
                            _os_log_error_impl(&dword_1B7802000, v28, OS_LOG_TYPE_ERROR, "Error: failed to get principal class from bundle \"%{public}@\", buf, 0xCu);
                          }
                        }
                        v29 = v5;
                        v77 = 0u;
                        v78 = 0u;
                        v75 = 0u;
                        v76 = 0u;
                        v30 = v60;
                        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v75, buf, 16);
                        if (v31)
                        {
                          v32 = v31;
                          v33 = *(_QWORD *)v76;
                          while (2)
                          {
                            for (i = 0; i != v32; ++i)
                            {
                              if (*(_QWORD *)v76 != v33)
                                objc_enumerationMutation(v30);
                              if (objc_msgSend(v27, "conformsToProtocol:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i)))
                              {
                                _HKInitializeLogging();
                                v5 = v29;
                                v39 = *v29;
                                if (os_log_type_enabled(*v29, OS_LOG_TYPE_DEBUG))
                                {
                                  *(_DWORD *)v82 = 138543362;
                                  v83 = v22;
                                  _os_log_debug_impl(&dword_1B7802000, v39, OS_LOG_TYPE_DEBUG, "Loaded bundle \"%{public}@\", v82, 0xCu);
                                }
                                v36 = v27;

                                v6 = 0x1E0CB3000;
                                v11 = v58;
                                v21 = v60;
                                goto LABEL_45;
                              }
                            }
                            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v75, buf, 16);
                            if (v32)
                              continue;
                            break;
                          }
                        }

                        _HKInitializeLogging();
                        v5 = v29;
                        v35 = *v29;
                        v21 = v60;
                        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                        {
                          v41 = CFSTR("<>");
                          if (v27)
                          {
                            NSStringFromClass((Class)v27);
                            v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
                          }
                          objc_msgSend(v30, "hk_map:", &__block_literal_global_140);
                          v42 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)v82 = 138543874;
                          v83 = v22;
                          v84 = 2114;
                          v85 = v41;
                          v86 = 2114;
                          v87 = v42;
                          _os_log_error_impl(&dword_1B7802000, v35, OS_LOG_TYPE_ERROR, "Error: failed to load bundle \"%{public}@\": principal class %{public}@ doesn't conform to any of: %{public}@", v82, 0x20u);
                          if (v27)

                        }
                        v36 = 0;
                        v6 = 0x1E0CB3000;
                      }
                      else
                      {
                        _HKInitializeLogging();
                        v38 = *v5;
                        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138543618;
                          *(_QWORD *)&buf[4] = v22;
                          v89 = 2114;
                          v90 = v64;
                          _os_log_error_impl(&dword_1B7802000, v38, OS_LOG_TYPE_ERROR, "Error: failed to load bundle \"%{public}@\": %{public}@", buf, 0x16u);
                        }
                        v36 = 0;
                      }
                      v11 = v58;
LABEL_45:

                    }
                    else
                    {
                      _HKInitializeLogging();
                      v37 = *v5;
                      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543362;
                        *(_QWORD *)&buf[4] = v22;
                        _os_log_error_impl(&dword_1B7802000, v37, OS_LOG_TYPE_ERROR, "Error: failed to instantiate bundle \"%{public}@\", buf, 0xCu);
                      }
                      v36 = 0;
                    }

                    v40 = v36;
                    if (v40)
                      objc_msgSend(v59, "addObject:", v40);

                    v14 = v61;
                  }
                  objc_autoreleasePoolPop(v17);
                  ++v15;
                }
                while (v15 != v65);
                v43 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
                v65 = v43;
              }
              while (v43);
            }

            self = v50;
            v9 = v56;
            v7 = v57;
            v44 = v59;
            v13 = v54;
            v12 = v55;
          }
          else
          {
            v44 = 0;
          }

        }
        else
        {
          v44 = 0;
        }

        v45 = v66;
        if (v44)
        {
          objc_msgSend(v51, "addObjectsFromArray:", v44);
        }
        else if ((objc_msgSend(v45, "hk_isCocoaNoSuchFileError") & 1) == 0)
        {
          _HKInitializeLogging();
          v46 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v11;
            v89 = 2114;
            v90 = v45;
            _os_log_error_impl(&dword_1B7802000, v46, OS_LOG_TYPE_ERROR, "Failed to load plugins at \"%{public}@\": %{public}@", buf, 0x16u);
          }
        }

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v7 != v53);
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
      v53 = v47;
    }
    while (v47);
  }

  return v51;
}

- (id)_createPluginsFromClasses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  char *v14;

  v4 = a3;
  -[HDPluginManager daemon](self, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = &unk_1EF1A83E0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__HDPluginManager__createPluginsFromClasses___block_invoke;
  v11[3] = &unk_1E6CFCF48;
  v13 = v5;
  v14 = sel_shouldLoadPluginForDaemon_;
  v12 = v6;
  v7 = v5;
  v8 = v6;
  objc_msgSend(v4, "hk_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __45__HDPluginManager__createPluginsFromClasses___block_invoke(uint64_t a1, objc_class *a2)
{
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[objc_class conformsToProtocol:](a2, "conformsToProtocol:", *(_QWORD *)(a1 + 32)))
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (-[objc_class shouldLoadPluginForDaemon:](a2, "shouldLoadPluginForDaemon:", *(_QWORD *)(a1 + 40)) & 1) != 0)
    {
      return objc_alloc_init(a2);
    }
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      NSStringFromClass(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "Will NOT load %@", (uint8_t *)&v8, 0xCu);

    }
  }
  return 0;
}

- (id)createExtensionsForDaemon:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_plugins;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "extensionForHealthDaemon:", v4, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v11, "pluginIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v13);

        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)createExtensionsForProfile:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_plugins;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "extensionForProfile:", v4, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v11, "pluginIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v13);

        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)notifyPluginsOfDatabaseObliteration
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_plugins;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "handleDatabaseObliteration", (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)pluginsConformingToProtocol:(id)a3
{
  id v5;
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self->_plugins)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDPluginManager.m"), 155, CFSTR("Plugins not loaded when looking up plugins for protocol. Plugins should have been loaded during init; what happened?"));

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_plugins;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "conformsToProtocol:", v5, (_QWORD)v16))
        {
          objc_msgSend(v12, "pluginIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v13);

        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

NSString *__77__HDPluginManager__loadPrincipalClassConformingToProtocols_fromBundleAtPath___block_invoke(int a1, Protocol *proto)
{
  return NSStringFromProtocol(proto);
}

- (HDDaemon)daemon
{
  return (HDDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (void)setDaemon:(id)a3
{
  objc_storeWeak((id *)&self->_daemon, a3);
}

- (void)setAllowablePluginDirectoryPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowablePluginDirectoryPaths, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_plugins, 0);
}

- (NSArray)notificationInstructionCriteriaClasses
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  -[HDPluginManager pluginsConformingToProtocol:](self, "pluginsConformingToProtocol:", &unk_1EF252518);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "notificationInstructionCriteriaClasses", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return (NSArray *)v13;
}

@end
