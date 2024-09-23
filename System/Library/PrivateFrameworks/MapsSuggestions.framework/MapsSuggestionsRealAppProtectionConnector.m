@implementation MapsSuggestionsRealAppProtectionConnector

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90__MapsSuggestionsRealAppProtectionConnector_appProtectionSubjectsChanged_forSubscription___block_invoke;
  v12[3] = &unk_1E4BD0C48;
  v9 = v8;
  v13 = v9;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);
  -[MapsSuggestionsRealAppProtectionConnector delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "appProtectionStatusChanged:", v9);
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v15 = "MapsSuggestionsRealAppProtectionConnector.m";
      v16 = 1026;
      v17 = 78;
      v18 = 2082;
      v19 = "-[MapsSuggestionsRealAppProtectionConnector appProtectionSubjectsChanged:forSubscription:]";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongDelegate went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __90__MapsSuggestionsRealAppProtectionConnector_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v5, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (void)addMonitor:(id)a3
{
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CF96A8], "subjectMonitorRegistry", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "addMonitor:", self);

}

- (MapsSuggestionsAppProtectionStatusMonitoring)delegate
{
  return (MapsSuggestionsAppProtectionStatusMonitoring *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
}

@end
