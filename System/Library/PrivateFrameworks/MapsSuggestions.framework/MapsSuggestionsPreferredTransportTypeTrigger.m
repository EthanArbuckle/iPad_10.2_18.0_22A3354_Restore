@implementation MapsSuggestionsPreferredTransportTypeTrigger

- (MapsSuggestionsPreferredTransportTypeTrigger)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsPreferredTransportTypeTrigger;
  return -[MapsSuggestionsBaseTrigger initWithName:](&v3, sel_initWithName_, CFSTR("MapsSuggestionsPreferredTransportTypeTrigger"));
}

- (void)didAddFirstObserver
{
  void *v3;
  void *v4;
  id transportTypeChangedListener;
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[MapsSuggestionsBaseTrigger dispatchQueue](self, "dispatchQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_copyWeak(&v6, &location);
  _GEOConfigAddBlockListenerForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  transportTypeChangedListener = self->_transportTypeChangedListener;
  self->_transportTypeChangedListener = v4;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __67__MapsSuggestionsPreferredTransportTypeTrigger_didAddFirstObserver__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  int v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "triggerMyObservers");
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsPreferredTransportTypeTrigger.m";
      v6 = 1026;
      v7 = 37;
      v8 = 2082;
      v9 = "-[MapsSuggestionsPreferredTransportTypeTrigger didAddFirstObserver]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (void)didRemoveLastObserver
{
  GEOConfigRemoveBlockListener();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transportTypeChangedListener, 0);
}

@end
