@implementation MLModelCollection

- (MLModelCollection)initWithIdentifier:(id)a3
{
  id v4;
  MLModelCollection *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *namespaceName;
  objc_class *v10;
  uint64_t v11;
  TRIClient *trialClient;
  MLModelCollection *v13;
  NSObject *v14;
  objc_class *v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MLModelCollection;
  v5 = -[MLModelCollection init](&v18, sel_init);
  if (!v5)
    goto LABEL_4;
  v6 = objc_msgSend(v4, "copy");
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  +[MLModelCollection _namespaceNameFromCollectionIdentifier:](MLModelCollection, "_namespaceNameFromCollectionIdentifier:", v4);
  v8 = objc_claimAutoreleasedReturnValue();
  namespaceName = v5->_namespaceName;
  v5->_namespaceName = (NSString *)v8;

  v10 = +[MLModelCollection getTrialClientClass](MLModelCollection, "getTrialClientClass");
  if (v10)
  {
    -[objc_class clientWithIdentifier:](v10, "clientWithIdentifier:", 211);
    v11 = objc_claimAutoreleasedReturnValue();
    trialClient = v5->_trialClient;
    v5->_trialClient = (TRIClient *)v11;

LABEL_4:
    v13 = v5;
    goto LABEL_8;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v17;
    _os_log_error_impl(&dword_19C486000, v14, OS_LOG_TYPE_ERROR, "%@: unable to initialize client due to soft-link failure", buf, 0xCu);

  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (BOOL)_register
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[MLModelCollection trialClient](self, "trialClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelCollection namespaceName](self, "namespaceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v5 = objc_msgSend(v3, "registerNamespaceName:compatibilityVersion:defaultsFileURL:applicationGroup:cloudKitContainerId:error:", v4, 1, 0, 0, 2, &v12);
  v6 = v12;

  if ((v5 & 1) == 0)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLModelCollection namespaceName](self, "namespaceName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v6;
      _os_log_error_impl(&dword_19C486000, v7, OS_LOG_TYPE_ERROR, "%@: namespace (%@) registration failed. %@", buf, 0x20u);

    }
  }

  return v5;
}

- (BOOL)_downloadWithProgress:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  BOOL v12;
  objc_class *v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  -[MLModelCollection trialClient](self, "trialClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelCollection namespaceName](self, "namespaceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelCollection _downloadOptions](self, "_downloadOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __43__MLModelCollection__downloadWithProgress___block_invoke;
  v17[3] = &unk_1E3D64E60;
  v17[4] = self;
  v19 = &v20;
  v9 = v5;
  v18 = v9;
  objc_msgSend(v6, "downloadNamespaceWithName:options:progress:completion:", v7, v8, v4, v17);

  v10 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      -[MLModelCollection namespaceName](self, "namespaceName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v15;
      v26 = 2112;
      v27 = v16;
      _os_log_error_impl(&dword_19C486000, v11, OS_LOG_TYPE_ERROR, "%@: namespace (%@) download timed out.", buf, 0x16u);

    }
    v12 = 0;
  }
  else
  {
    v12 = *((_BYTE *)v21 + 24) != 0;
  }

  _Block_object_dispose(&v20, 8);
  return v12;
}

- (id)_downloadOptions
{
  objc_class *v2;
  void *v3;
  NSObject *v4;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = +[MLModelCollection getTrialDownloadOptionsClass](MLModelCollection, "getTrialDownloadOptionsClass");
  if (v2)
  {
    v3 = (void *)objc_msgSend([v2 alloc], "initWithAllowsCellular:discretionaryBehavior:", 1, 0);
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_19C486000, v4, OS_LOG_TYPE_ERROR, "%@: unable to initialize download options due to soft-link failure", (uint8_t *)&v8, 0xCu);

    }
    v3 = 0;
  }
  return v3;
}

- (void)_registerForUpdates
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[MLModelCollection trialClient](self, "trialClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelCollection namespaceName](self, "namespaceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__MLModelCollection__registerForUpdates__block_invoke;
  v6[3] = &unk_1E3D64E88;
  objc_copyWeak(&v7, &location);
  v5 = (id)objc_msgSend(v3, "addUpdateHandlerForNamespaceName:usingBlock:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (BOOL)_endAccess
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[MLModelCollection trialClient](self, "trialClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelCollection namespaceName](self, "namespaceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v5 = objc_msgSend(v3, "deregisterNamespaceName:error:", v4, &v12);
  v6 = v12;

  if ((v5 & 1) == 0)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLModelCollection namespaceName](self, "namespaceName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v6;
      _os_log_error_impl(&dword_19C486000, v7, OS_LOG_TYPE_ERROR, "%@: failed to deregister namespace (%@). %@", buf, 0x20u);

    }
  }

  return v5;
}

- (void)_handleTrialUpdateForNamespaceName:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  char v9;
  MLModelCollection *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  objc_class *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v7;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_19C486000, v5, OS_LOG_TYPE_INFO, "%@: namespace (%@) updated", (uint8_t *)&v15, 0x16u);

  }
  -[MLModelCollection namespaceName](self, "namespaceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isEqualToString:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = [MLModelCollection alloc];
    -[MLModelCollection identifier](self, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MLModelCollection initWithIdentifier:](v10, "initWithIdentifier:", v11);

    -[NSObject _populateEntries](v12, "_populateEntries");
    -[NSObject _setDeploymentID](v12, "_setDeploymentID");
    -[NSObject _registerForUpdates](v12, "_registerForUpdates");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:", CFSTR("MLModelCollectionDidChangeNotification"), v12);
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v13;
    v17 = 2112;
    v18 = v4;
    _os_log_error_impl(&dword_19C486000, v12, OS_LOG_TYPE_ERROR, "%@: unexpected update notification for namespace (%@)", (uint8_t *)&v15, 0x16u);
  }

LABEL_7:
}

- (void)_setDeploymentID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MLModelCollection trialClient](self, "trialClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelCollection namespaceName](self, "namespaceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "experimentIdentifiersWithNamespaceName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "experimentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MLModelCollection setDeploymentID:](self, "setDeploymentID:", v6);
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLModelCollection deploymentID](self, "deploymentID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_debug_impl(&dword_19C486000, v7, OS_LOG_TYPE_DEBUG, "%@: set deployment id: %@", (uint8_t *)&v14, 0x16u);

    }
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_error_impl(&dword_19C486000, v8, OS_LOG_TYPE_ERROR, "%@: experimentId unexpectedly not returned", (uint8_t *)&v14, 0xCu);

    }
    -[MLModelCollection setDeploymentID:](self, "setDeploymentID:", 0);
  }

}

- (void)_populateEntries
{
  MLModelCollection *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  MLModelCollection *obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  obj = v2;
  -[MLModelCollection trialClient](v2, "trialClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refresh");

  -[MLModelCollection trialClient](v2, "trialClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelCollection namespaceName](v2, "namespaceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "factorLevelsWithNamespaceName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = v6;
  if (v6)
  {
    v7 = (void *)objc_opt_new();
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v12, "factor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "level");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "directoryValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "path");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14 && v17)
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            +[MLModelCollectionEntry entryWithModelIdentifier:modelURL:](MLModelCollectionEntry, "entryWithModelIdentifier:modelURL:", v14, v18);
            v19 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, v14);
          }
          else
          {
            +[MLLogging coreChannel](MLLogging, "coreChannel");
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              v20 = (objc_class *)objc_opt_class();
              NSStringFromClass(v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v36 = v21;
              v37 = 2112;
              v38 = (uint64_t)v12;
              _os_log_error_impl(&dword_19C486000, v19, OS_LOG_TYPE_ERROR, "%@: missing factorLevel information: %@", buf, 0x16u);

            }
          }

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v9);
    }

    -[MLModelCollection setEntries:](obj, "setEntries:", v7);
    v22 = v29;
  }
  else
  {
    -[MLModelCollection setEntries:](obj, "setEntries:", MEMORY[0x1E0C9AA70]);
    v22 = 0;
  }
  v23 = v22 == 0;

  objc_sync_exit(obj);
  if (!v23)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLModelCollection entries](obj, "entries");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "count");
      *(_DWORD *)buf = 138412546;
      v36 = v26;
      v37 = 2048;
      v38 = v28;
      _os_log_debug_impl(&dword_19C486000, v24, OS_LOG_TYPE_DEBUG, "%@: set %lu model entries", buf, 0x16u);

    }
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)deploymentID
{
  return self->_deploymentID;
}

- (void)setDeploymentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_deploymentID, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __40__MLModelCollection__registerForUpdates__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "namespaceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_handleTrialUpdateForNamespaceName:", v4);
}

void __43__MLModelCollection__downloadWithProgress___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "namespaceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 1024;
    LODWORD(v19) = a2;
    _os_log_impl(&dword_19C486000, v6, OS_LOG_TYPE_INFO, "%@: download completion (%@): %d", (uint8_t *)&v14, 0x1Cu);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  if ((a2 & 1) == 0)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "namespaceName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      v18 = 2112;
      v19 = v5;
      _os_log_error_impl(&dword_19C486000, v10, OS_LOG_TYPE_ERROR, "%@: namespace (%@) download failed. %@", (uint8_t *)&v14, 0x20u);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

+ (NSProgress)beginAccessingModelCollectionWithIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler
{
  NSString *v5;
  void *v6;
  NSObject *v7;
  NSString *v8;
  id v9;
  id v10;
  _QWORD block[4];
  NSString *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = identifier;
  v6 = completionHandler;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1033;
  v20 = __Block_byref_object_dispose__1034;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v17[5], "setCancellable:", 0);
  objc_msgSend((id)v17[5], "setPausable:", 0);
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__MLModelCollection_beginAccessingModelCollectionWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E3D64E38;
  v14 = v6;
  v15 = &v16;
  v13 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

  v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return (NSProgress *)v10;
}

+ (void)endAccessingModelCollectionWithIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler
{
  NSString *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSString *v9;
  _QWORD v10[4];
  NSString *v11;
  id v12;

  v5 = identifier;
  v6 = completionHandler;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__MLModelCollection_endAccessingModelCollectionWithIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_1E3D66950;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

+ (Class)getTrialClientClass
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getTRIClientClass_softClass;
  v9 = getTRIClientClass_softClass;
  if (!getTRIClientClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getTRIClientClass_block_invoke;
    v5[3] = &unk_1E3D65388;
    v5[4] = &v6;
    __getTRIClientClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = v2;
  _Block_object_dispose(&v6, 8);
  return (Class)v3;
}

+ (Class)getTrialExperimentIdentifiersClass
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getTRIExperimentIdentifiersClass_softClass;
  v9 = getTRIExperimentIdentifiersClass_softClass;
  if (!getTRIExperimentIdentifiersClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getTRIExperimentIdentifiersClass_block_invoke;
    v5[3] = &unk_1E3D65388;
    v5[4] = &v6;
    __getTRIExperimentIdentifiersClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = v2;
  _Block_object_dispose(&v6, 8);
  return (Class)v3;
}

+ (Class)getTrialDownloadOptionsClass
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getTRIDownloadOptionsClass_softClass;
  v9 = getTRIDownloadOptionsClass_softClass;
  if (!getTRIDownloadOptionsClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getTRIDownloadOptionsClass_block_invoke;
    v5[3] = &unk_1E3D65388;
    v5[4] = &v6;
    __getTRIDownloadOptionsClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = v2;
  _Block_object_dispose(&v6, 8);
  return (Class)v3;
}

+ (Class)getTrialFactorLevelClass
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getTRIFactorLevelClass_softClass;
  v9 = getTRIFactorLevelClass_softClass;
  if (!getTRIFactorLevelClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getTRIFactorLevelClass_block_invoke;
    v5[3] = &unk_1E3D65388;
    v5[4] = &v6;
    __getTRIFactorLevelClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = v2;
  _Block_object_dispose(&v6, 8);
  return (Class)v3;
}

+ (Class)getTrialLevelClass
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getTRILevelClass_softClass;
  v9 = getTRILevelClass_softClass;
  if (!getTRILevelClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getTRILevelClass_block_invoke;
    v5[3] = &unk_1E3D65388;
    v5[4] = &v6;
    __getTRILevelClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = v2;
  _Block_object_dispose(&v6, 8);
  return (Class)v3;
}

+ (Class)getTrialFileClass
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getTRIFileClass_softClass;
  v9 = getTRIFileClass_softClass;
  if (!getTRIFileClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getTRIFileClass_block_invoke;
    v5[3] = &unk_1E3D65388;
    v5[4] = &v6;
    __getTRIFileClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = v2;
  _Block_object_dispose(&v6, 8);
  return (Class)v3;
}

+ (Class)getTrialFactorClass
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getTRIFactorClass_softClass;
  v9 = getTRIFactorClass_softClass;
  if (!getTRIFactorClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getTRIFactorClass_block_invoke;
    v5[3] = &unk_1E3D65388;
    v5[4] = &v6;
    __getTRIFactorClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = v2;
  _Block_object_dispose(&v6, 8);
  return (Class)v3;
}

+ (id)_namespaceNameFromCollectionIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  objc_class *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0;
  +[MLCloudDeploymentUtils extractTeamIdentifierAndReturnError:](MLCloudDeploymentUtils, "extractTeamIdentifierAndReturnError:", &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v4, v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_error_impl(&dword_19C486000, v7, OS_LOG_TYPE_ERROR, "%@: unable to extract team identifier for the client. error:%@", buf, 0x16u);

    }
    v6 = v3;
  }
  v8 = v6;

  return v8;
}

void __81__MLModelCollection_endAccessingModelCollectionWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  MLModelCollection *v2;
  void *v3;
  void *v4;
  void (*v5)(void);
  void *v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v2 = -[MLModelCollection initWithIdentifier:]([MLModelCollection alloc], "initWithIdentifier:", *(_QWORD *)(a1 + 32));
    v7 = v2;
    if (v2)
    {
      if (-[MLModelCollection _endAccess](v2, "_endAccess"))
      {
        v3 = 0;
      }
      else
      {
        objc_msgSend(v7, "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 10, CFSTR("An error occurred ending access for model collection with identifier '%@': internal error"), v6);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      objc_msgSend(0, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 10, CFSTR("Failed to end access for model collection with identifier '%@': internal error"), v4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    v5();

  }
  else
  {
    +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 10, CFSTR("Failed to end access for model collection with identifier '%@': invalid identifier"), *(_QWORD *)(a1 + 32));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __83__MLModelCollection_beginAccessingModelCollectionWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void (**v7)(void *, const __CFString *);
  MLModelCollection *v8;
  MLModelCollection *v9;
  id v10;
  void *v11;
  void *v12;
  __int128 v13;
  _QWORD v14[4];
  id v15;
  _QWORD aBlock[4];
  __int128 v17;

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addChild:withPendingUnitCount:", v2, 5);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addChild:withPendingUnitCount:", v3, 90);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addChild:withPendingUnitCount:", v4, 5);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__MLModelCollection_beginAccessingModelCollectionWithIdentifier_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E3D64DE8;
  v13 = *(_OWORD *)(a1 + 40);
  v6 = (id)v13;
  v17 = v13;
  v7 = (void (**)(void *, const __CFString *))_Block_copy(aBlock);
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v8 = -[MLModelCollection initWithIdentifier:]([MLModelCollection alloc], "initWithIdentifier:", *(_QWORD *)(a1 + 32));
    v9 = v8;
    if (v8)
    {
      if (-[MLModelCollection _register](v8, "_register"))
      {
        objc_msgSend(v2, "setCompletedUnitCount:", 1);
        v14[0] = v5;
        v14[1] = 3221225472;
        v14[2] = __83__MLModelCollection_beginAccessingModelCollectionWithIdentifier_completionHandler___block_invoke_3;
        v14[3] = &unk_1E3D64E10;
        v10 = v3;
        v15 = v10;
        if (-[MLModelCollection _downloadWithProgress:](v9, "_downloadWithProgress:", v14))
        {
          objc_msgSend(v10, "setCompletedUnitCount:", 100);
          -[MLModelCollection _populateEntries](v9, "_populateEntries");
          -[MLModelCollection _setDeploymentID](v9, "_setDeploymentID");
          -[MLModelCollection _registerForUpdates](v9, "_registerForUpdates");
          objc_msgSend(v4, "setCompletedUnitCount:", 1);
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        }
        else
        {
          -[MLModelCollection identifier](v9, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, CFSTR("Failed to begin access for model collection with identifier '%@': download failed"));

        }
        v11 = v15;
      }
      else
      {
        -[MLModelCollection identifier](v9, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, CFSTR("Failed to begin access for model collection with identifier '%@': internal registration failed"));
      }
    }
    else
    {
      objc_msgSend(0, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, CFSTR("Failed to begin access for model collection with identifier '%@': internal error"));
    }

  }
  else
  {
    v7[2](v7, CFSTR("Failed to begin access for model collection with identifier '%@': invalid identifier"));
  }

}

void __83__MLModelCollection_beginAccessingModelCollectionWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v10;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setCompletedUnitCount:", 0);
  +[MLModelErrorUtils errorWithCode:underlyingError:format:args:](MLModelErrorUtils, "errorWithCode:underlyingError:format:args:", 10, 0, CFSTR("Failed to begin access for model collection with identifier '%@': invalid identifier"), &a9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __83__MLModelCollection_beginAccessingModelCollectionWithIdentifier_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", a2);
}

@end
