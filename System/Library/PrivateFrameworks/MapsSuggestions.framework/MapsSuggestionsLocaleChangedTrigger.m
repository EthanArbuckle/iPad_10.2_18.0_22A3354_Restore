@implementation MapsSuggestionsLocaleChangedTrigger

- (MapsSuggestionsLocaleChangedTrigger)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsLocaleChangedTrigger;
  return -[MapsSuggestionsBaseTrigger initWithName:](&v3, sel_initWithName_, CFSTR("MapsSuggestionsLocaleChangedTrigger"));
}

- (void)didAddFirstObserver
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "currentQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C99720];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__MapsSuggestionsLocaleChangedTrigger_didAddFirstObserver__block_invoke;
  v6[3] = &unk_1E4BD1158;
  objc_copyWeak(&v7, &location);
  v5 = (id)objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", v4, 0, v3, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __58__MapsSuggestionsLocaleChangedTrigger_didAddFirstObserver__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  int v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "triggerMyObservers");
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446722;
      v8 = "MapsSuggestionsLocaleChangedTrigger.m";
      v9 = 1026;
      v10 = 32;
      v11 = 2082;
      v12 = "-[MapsSuggestionsLocaleChangedTrigger didAddFirstObserver]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }

  }
}

- (void)didRemoveLastObserver
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

@end
