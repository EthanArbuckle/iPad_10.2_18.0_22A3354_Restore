@implementation _SHMediaLibrary

+ (_SHMediaLibrary)_defaultLibrary
{
  if (_defaultLibrary_onceToken != -1)
    dispatch_once(&_defaultLibrary_onceToken, &__block_literal_global_3);
  return (_SHMediaLibrary *)(id)_defaultLibrary_library;
}

- (_SHMediaLibrary)init
{
  _SHMediaLibrary *v2;
  _SHMediaLibrary *v3;
  uint64_t v4;
  NSMutableDictionary *inflightTasks;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SHMediaLibrary;
  v2 = -[_SHMediaLibrary init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_inflightTasksLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    inflightTasks = v3->_inflightTasks;
    v3->_inflightTasks = (NSMutableDictionary *)v4;

    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_librarySyncDidChange_, CFSTR("SHMediaLibrarySyncDidChangeNotification"), 0);

  }
  return v3;
}

- (void)_addMediaItems:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  SHMediaLibraryTrack *v15;
  SHMediaLibraryTrack *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _SHMediaLibrary *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    if (objc_msgSend(v6, "count"))
    {
      v24 = self;
      v8 = (void *)objc_opt_new();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v9 = v6;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v26;
        while (2)
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v26 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v13);
            v15 = -[SHMediaLibraryTrack initWithMediaItem:]([SHMediaLibraryTrack alloc], "initWithMediaItem:", v14);
            if (!v15)
            {
              sh_log_object();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v14, "properties");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v32 = v18;
                _os_log_impl(&dword_218BF1000, v17, OS_LOG_TYPE_ERROR, "Failed to create library track from media item with properties: %@", buf, 0xCu);

              }
              v19 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v14, "shazamID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ is not a valid shazamID or it is missing. Ensure shazamID is provided and valid."), v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              v29 = *MEMORY[0x24BDD0BA0];
              v30 = v21;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              +[SHError errorWithCode:underlyingError:keyOverrides:](SHError, "errorWithCode:underlyingError:keyOverrides:", 400, 0, v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              v7[2](v7, v23);
              goto LABEL_15;
            }
            v16 = v15;
            objc_msgSend(v8, "addItem:", v15);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v11)
            continue;
          break;
        }
      }

      -[_SHMediaLibrary _synchronizeSnapshot:startCondition:completionHandler:](v24, "_synchronizeSnapshot:startCondition:completionHandler:", v8, CFSTR("UserAction"), v7);
LABEL_15:

    }
    else
    {
      v7[2](v7, 0);
    }
  }

}

- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_opt_new();
  -[_SHMediaLibrary _synchronizeTask:snapshot:startCondition:completionHandler:](self, "_synchronizeTask:snapshot:startCondition:completionHandler:", v8, v7, v6, 0);

}

- (void)_libraryInfoWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  -[_SHMediaLibrary _libraryInfoWithTask:completionHandler:](self, "_libraryInfoWithTask:completionHandler:", v5, v4);

}

- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_opt_new();
  -[_SHMediaLibrary _queryLibraryWithTask:parameters:completionHandler:](self, "_queryLibraryWithTask:parameters:completionHandler:", v8, v7, v6);

}

+ (id)_localizedAttributionForLibraryItem:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "providerIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5
      && (objc_msgSend(v4, "providerIdentifier"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = +[SHAttribution requiresMediaLibraryAttributionForBundleIdentifier:](SHAttribution, "requiresMediaLibraryAttributionForBundleIdentifier:", v6), v6, v7))
    {
      objc_msgSend(v4, "providerIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[SHAttribution productNameForBundleIdentifier:](SHAttribution, "productNameForBundleIdentifier:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE90550], "localizedStringForKey:", CFSTR("SHAZAM_LIBRARY_MISSING_PROVIDER_NAME"));
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_synchronize
{
  id v3;

  v3 = (id)objc_opt_new();
  -[_SHMediaLibrary _synchronizeSnapshot:startCondition:](self, "_synchronizeSnapshot:startCondition:", v3, CFSTR("UserAction"));

}

- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_opt_new();
  -[_SHMediaLibrary _synchronizeTask:snapshot:startCondition:completionHandler:](self, "_synchronizeTask:snapshot:startCondition:completionHandler:", v11, v10, v9, v8);

}

- (void)_queryLibraryWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_opt_new();
  +[SHMediaLibraryQueryParameters defaultParameters](SHMediaLibraryQueryParameters, "defaultParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SHMediaLibrary _queryLibraryWithTask:parameters:completionHandler:](self, "_queryLibraryWithTask:parameters:completionHandler:", v6, v5, v4);

}

- (void)_libraryWillBeginSync:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[_SHMediaLibrary delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_SHMediaLibrary delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_libraryWillBeginSync:", self);

  }
}

- (void)_library:(id)a3 didChangeWithSnapshot:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[_SHMediaLibrary delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[_SHMediaLibrary delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_library:didChangeWithSnapshot:", self, v8);

  }
}

- (void)_library:(id)a3 didProduceError:(id)a4 failedItemIdentifiers:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  -[_SHMediaLibrary delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[_SHMediaLibrary delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_library:didProduceError:failedItemIdentifiers:", self, v11, v7);

  }
}

- (void)_libraryDidCompleteSync:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_SHMediaLibrary delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_SHMediaLibrary delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_libraryDidCompleteSync:", self);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[_SHMediaLibrary removeInflightTask:](self, "removeInflightTask:", v7);

}

- (void)_synchronizeTask:(id)a3 snapshot:(id)a4 startCondition:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "setDelegate:", self);
  objc_msgSend(v13, "setSyncCompletionBlock:", v10);

  -[_SHMediaLibrary addInflightTask:](self, "addInflightTask:", v13);
  objc_msgSend(v13, "_synchronizeSnapshot:startCondition:", v12, v11);

}

- (void)_queryLibraryWithTask:(id)a3 parameters:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_SHMediaLibrary addInflightTask:](self, "addInflightTask:", v8);
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __70___SHMediaLibrary__queryLibraryWithTask_parameters_completionHandler___block_invoke;
  v13[3] = &unk_24D9B7B38;
  objc_copyWeak(&v16, &location);
  v11 = v8;
  v14 = v11;
  v12 = v10;
  v15 = v12;
  objc_msgSend(v11, "_queryLibraryWithParameters:completionHandler:", v9, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)_libraryInfoWithTask:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  -[_SHMediaLibrary addInflightTask:](self, "addInflightTask:", v6);
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58___SHMediaLibrary__libraryInfoWithTask_completionHandler___block_invoke;
  v10[3] = &unk_24D9B7B60;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v11 = v8;
  v9 = v7;
  v12 = v9;
  objc_msgSend(v8, "_libraryInfoWithCompletionHandler:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)addInflightTask:(id)a3
{
  os_unfair_lock_s *p_inflightTasksLock;
  id v5;
  void *v6;
  void *v7;

  p_inflightTasksLock = &self->_inflightTasksLock;
  v5 = a3;
  os_unfair_lock_lock(p_inflightTasksLock);
  -[_SHMediaLibrary inflightTasks](self, "inflightTasks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v5, v7);

  os_unfair_lock_unlock(p_inflightTasksLock);
}

- (void)removeInflightTask:(id)a3
{
  os_unfair_lock_s *p_inflightTasksLock;
  id v5;
  void *v6;
  void *v7;

  p_inflightTasksLock = &self->_inflightTasksLock;
  v5 = a3;
  os_unfair_lock_lock(p_inflightTasksLock);
  -[_SHMediaLibrary inflightTasks](self, "inflightTasks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectForKey:", v7);
  os_unfair_lock_unlock(p_inflightTasksLock);
}

- (void)librarySyncDidChange:(id)a3
{
  os_unfair_lock_s *p_inflightTasksLock;
  void *v5;
  uint64_t v6;
  void *v7;

  p_inflightTasksLock = &self->_inflightTasksLock;
  os_unfair_lock_lock(&self->_inflightTasksLock);
  -[_SHMediaLibrary inflightTasks](self, "inflightTasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("SHMediaLibraryLocalChangeNotification"), 0);

  }
  os_unfair_lock_unlock(p_inflightTasksLock);
}

- (SHMediaLibrarySyncDelegate)delegate
{
  return (SHMediaLibrarySyncDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (os_unfair_lock_s)inflightTasksLock
{
  return self->_inflightTasksLock;
}

- (void)setInflightTasksLock:(os_unfair_lock_s)a3
{
  self->_inflightTasksLock = a3;
}

- (NSMutableDictionary)inflightTasks
{
  return self->_inflightTasks;
}

- (void)setInflightTasks:(id)a3
{
  objc_storeStrong((id *)&self->_inflightTasks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inflightTasks, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
