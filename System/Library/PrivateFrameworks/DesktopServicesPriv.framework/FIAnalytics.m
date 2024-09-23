@implementation FIAnalytics

+ (id)sharedAnalytics
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&+[FIAnalytics sharedAnalytics]::sWeakSharedInstance);
  if (!WeakRetained)
  {
    WeakRetained = objc_alloc_init((Class)a1);
    objc_storeWeak(&+[FIAnalytics sharedAnalytics]::sWeakSharedInstance, WeakRetained);
  }
  return WeakRetained;
}

- (void)sendAnalytics:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "validate"))
  {
    objc_msgSend(v4, "eventName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __29__FIAnalytics_sendAnalytics___block_invoke;
    v6[3] = &unk_1E8751608;
    v7 = v4;
    -[FIAnalytics sendEvent:eventDictionary:](self, "sendEvent:eventDictionary:", v5, v6);

  }
}

uint64_t __29__FIAnalytics_sendAnalytics___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "eventDict");
}

- (void)sendEvent:(id)a3 eventDictionary:(id)a4
{
  AnalyticsSendEventLazy();
}

@end
