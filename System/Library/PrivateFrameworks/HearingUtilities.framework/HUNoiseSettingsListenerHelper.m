@implementation HUNoiseSettingsListenerHelper

- (HUNoiseSettingsListenerHelper)initWithListenerAddress:(id)a3
{
  HUNoiseSettingsListenerHelper *v4;
  id v5;
  objc_super v7;
  id location;

  objc_initWeak(&location, a3);
  v7.receiver = self;
  v7.super_class = (Class)HUNoiseSettingsListenerHelper;
  v4 = -[HUNoiseSettingsListenerHelper init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_loadWeakRetained(&location);
    objc_storeWeak(&v4->_listenerAddress, v5);

  }
  objc_destroyWeak(&location);
  return v4;
}

- (void)addSelectorKey:(SEL)a3
{
  NSMutableArray *selectorKeys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  selectorKeys = self->_selectorKeys;
  if (!selectorKeys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_selectorKeys;
    self->_selectorKeys = v6;

    selectorKeys = self->_selectorKeys;
  }
  NSStringFromSelector(a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](selectorKeys, "addObject:", v8);

}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  SEL v10;
  id WeakRetained;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = self->_selectorKeys;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(NSString **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        +[HUNoiseSettings sharedInstance](HUNoiseSettings, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = NSSelectorFromString(v8);
        WeakRetained = objc_loadWeakRetained(&self->_listenerAddress);
        objc_msgSend(v9, "registerUpdateBlock:forRetrieveSelector:withListener:", 0, v10, WeakRetained);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  v12.receiver = self;
  v12.super_class = (Class)HUNoiseSettingsListenerHelper;
  -[HUNoiseSettingsListenerHelper dealloc](&v12, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectorKeys, 0);
  objc_destroyWeak(&self->_listenerAddress);
}

@end
