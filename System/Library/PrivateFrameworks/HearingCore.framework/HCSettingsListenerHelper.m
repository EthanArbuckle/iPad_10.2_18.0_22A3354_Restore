@implementation HCSettingsListenerHelper

- (HCSettingsListenerHelper)initWithListenerAddress:(id)a3 andDelegate:(id)a4
{
  id v6;
  HCSettingsListenerHelper *v7;
  id v8;
  objc_super v10;
  id location;

  objc_initWeak(&location, a3);
  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HCSettingsListenerHelper;
  v7 = -[HCSettingsListenerHelper init](&v10, sel_init);
  if (v7)
  {
    v8 = objc_loadWeakRetained(&location);
    objc_storeWeak(&v7->_listenerAddress, v8);

    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  objc_destroyWeak(&location);
  return v7;
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
  id WeakRetained;
  SEL v10;
  id v11;
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
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v10 = NSSelectorFromString(v8);
        v11 = objc_loadWeakRetained(&self->_listenerAddress);
        objc_msgSend(WeakRetained, "registerUpdateBlock:forRetrieveSelector:withListener:", 0, v10, v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  v12.receiver = self;
  v12.super_class = (Class)HCSettingsListenerHelper;
  -[HCSettingsListenerHelper dealloc](&v12, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectorKeys, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak(&self->_listenerAddress);
}

@end
