@implementation EMDiagnosticsHelper

uint64_t __54__EMDiagnosticsHelper_registerDiagnosticFileProvider___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

- (EMDiagnosticsHelper)initWithDaemonInterface:(id)a3
{
  id v4;
  EMDiagnosticsHelper *v5;
  EMObjectID *v6;
  EMObjectID *providerObjectID;
  void *v8;
  uint64_t v9;
  EFCancelable *diagnosticInfoProviderToken;
  id v11;
  void *v12;
  uint64_t v13;
  EFLocked *providers;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)EMDiagnosticsHelper;
  v5 = -[EMDiagnosticsHelper init](&v16, sel_init);
  if (v5)
  {
    v6 = -[EMObjectID initAsEphemeralID:]([EMObjectID alloc], "initAsEphemeralID:", 1);
    providerObjectID = v5->_providerObjectID;
    v5->_providerObjectID = v6;

    objc_msgSend(v4, "diagnosticInfoGatherer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerDiagnosticInfoProvider:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    diagnosticInfoProviderToken = v5->_diagnosticInfoProviderToken;
    v5->_diagnosticInfoProviderToken = (EFCancelable *)v9;

    v5->_source = 0;
    v11 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithObject:", v12);
    providers = v5->_providers;
    v5->_providers = (EFLocked *)v13;

  }
  return v5;
}

- (id)registerDiagnosticFileProvider:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _BYTE buf[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EMDiagnosticsHelper log](EMDiagnosticsHelper, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "Registering a diagnostic file provider: %@", buf, 0xCu);
  }

  -[EMDiagnosticsHelper providers](self, "providers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__EMDiagnosticsHelper_registerDiagnosticFileProvider___block_invoke;
  v15[3] = &unk_1E70F2CF0;
  v8 = v4;
  v16 = v8;
  objc_msgSend(v6, "performWhileLocked:", v15);

  v9 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __54__EMDiagnosticsHelper_registerDiagnosticFileProvider___block_invoke_2;
  v12[3] = &unk_1E70F2BE0;
  objc_copyWeak(&v14, (id *)buf);
  v10 = v8;
  v13 = v10;
  objc_msgSend(v9, "addCancelationBlock:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

  return v9;
}

- (EFLocked)providers
{
  return self->_providers;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__EMDiagnosticsHelper_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_13 != -1)
    dispatch_once(&log_onceToken_13, block);
  return (id)log_log_13;
}

- (EMObjectID)providerObjectID
{
  return self->_providerObjectID;
}

void __26__EMDiagnosticsHelper_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_13;
  log_log_13 = (uint64_t)v1;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[EMDiagnosticsHelper diagnosticInfoProviderToken](self, "diagnosticInfoProviderToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)EMDiagnosticsHelper;
  -[EMDiagnosticsHelper dealloc](&v4, sel_dealloc);
}

void __54__EMDiagnosticsHelper_registerDiagnosticFileProvider___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "providers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54__EMDiagnosticsHelper_registerDiagnosticFileProvider___block_invoke_3;
    v5[3] = &unk_1E70F2CF0;
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v3, "performWhileLocked:", v5);

    WeakRetained = v4;
  }

}

uint64_t __54__EMDiagnosticsHelper_registerDiagnosticFileProvider___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void)provideDiagnosticsAt:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void (**v23)(id, id, _QWORD);
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint8_t v34[128];
  uint8_t buf[4];
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v23 = (void (**)(id, id, _QWORD))a5;
  if ((a4 & 1) != 0)
  {
    -[EMDiagnosticsHelper providers](self, "providers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v21;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v30;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v14), "messageListItemsForDiagnosticsHelper:", self, v21, v22);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          v16 = v15;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v26;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v26 != v18)
                  objc_enumerationMutation(v16);
                objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v19), "displayMessageObjectID");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "addObject:", v20);

                ++v19;
              }
              while (v17 != v19);
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            }
            while (v17);
          }

          ++v14;
        }
        while (v14 != v12);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v12);
    }

    -[EMDiagnosticsHelper setSource:](self, "setSource:", 0);
    v23[2](v23, v11, 0);

    v9 = obj;
  }
  else
  {
    +[EMDiagnosticsHelper log](EMDiagnosticsHelper, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v36 = a4;
      _os_log_impl(&dword_1B99BB000, v8, OS_LOG_TYPE_DEFAULT, "Skipping visible message source diagnostics because options are: %lu", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2](v23, v9, 0);
  }

}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (EFCancelable)diagnosticInfoProviderToken
{
  return self->_diagnosticInfoProviderToken;
}

- (void)setDiagnosticInfoProviderToken:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticInfoProviderToken, a3);
}

- (void)setProviders:(id)a3
{
  objc_storeStrong((id *)&self->_providers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_diagnosticInfoProviderToken, 0);
  objc_storeStrong((id *)&self->_providerObjectID, 0);
}

@end
