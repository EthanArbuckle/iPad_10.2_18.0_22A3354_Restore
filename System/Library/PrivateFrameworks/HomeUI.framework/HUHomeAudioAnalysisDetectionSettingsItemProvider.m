@implementation HUHomeAudioAnalysisDetectionSettingsItemProvider

- (HUHomeAudioAnalysisDetectionSettingsItemProvider)initWithHome:(id)a3
{
  id v5;
  HUHomeAudioAnalysisDetectionSettingsItemProvider *v6;
  HUHomeAudioAnalysisDetectionSettingsItemProvider *v7;
  uint64_t v8;
  NSMutableSet *items;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUHomeAudioAnalysisDetectionSettingsItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v8 = objc_opt_new();
    items = v7->_items;
    v7->_items = (NSMutableSet *)v8;

  }
  return v7;
}

- (HUHomeAudioAnalysisDetectionSettingsItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUHomeAudioAnalysisDetectionSettingsItemProvider.m"), 72, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUHomeAudioAnalysisDetectionSettingsItemProvider init]",
    v5);

  return 0;
}

- (id)reloadItems
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__HUHomeAudioAnalysisDetectionSettingsItemProvider_reloadItems__block_invoke_3;
  v9[3] = &unk_1E6F4EC68;
  objc_copyWeak(&v10, &location);
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", &unk_1E7042DE0, &__block_literal_global_289, &__block_literal_global_36_5, 0, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __63__HUHomeAudioAnalysisDetectionSettingsItemProvider_reloadItems__block_invoke_5;
  v7[3] = &unk_1E6F4D2C8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v5;
}

id __63__HUHomeAudioAnalysisDetectionSettingsItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __63__HUHomeAudioAnalysisDetectionSettingsItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "audioDetectionType"));
}

HUHomeAudioAnalysisDetectionSettingsItem *__63__HUHomeAudioAnalysisDetectionSettingsItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  HUHomeAudioAnalysisDetectionSettingsItem *v7;
  HUHomeAudioAnalysisDetectionSettingsItem *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__HUHomeAudioAnalysisDetectionSettingsItemProvider_reloadItems__block_invoke_4;
  v12[3] = &unk_1E6F4DAD8;
  v6 = v3;
  v13 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v12);
  v7 = (HUHomeAudioAnalysisDetectionSettingsItem *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = [HUHomeAudioAnalysisDetectionSettingsItem alloc];
    v9 = objc_msgSend(v6, "unsignedIntegerValue");
    objc_msgSend(WeakRetained, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUHomeAudioAnalysisDetectionSettingsItem initWithDetectionType:home:](v8, "initWithDetectionType:home:", v9, v10);

  }
  return v7;
}

BOOL __63__HUHomeAudioAnalysisDetectionSettingsItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  _BOOL8 v8;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = objc_msgSend(v6, "audioDetectionType");
    v8 = v7 == objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __63__HUHomeAudioAnalysisDetectionSettingsItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSMutableSet)items
{
  return self->_items;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
