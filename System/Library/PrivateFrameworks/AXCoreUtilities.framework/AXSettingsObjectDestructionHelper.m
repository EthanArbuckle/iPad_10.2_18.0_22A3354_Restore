@implementation AXSettingsObjectDestructionHelper

- (AXSettingsObjectDestructionHelper)initWithListenerAddress:(void *)a3 forSettings:(id)a4
{
  id v6;
  AXSettingsObjectDestructionHelper *v7;
  AXSettingsObjectDestructionHelper *v8;
  AXSettingsObjectDestructionHelper *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXSettingsObjectDestructionHelper;
  v7 = -[AXSettingsObjectDestructionHelper init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_listenerAddress = a3;
    objc_storeWeak((id *)&v7->_settings, v6);
    v9 = v8;
  }

  return v8;
}

- (void)addPreferenceKey:(id)a3
{
  id v4;
  NSMutableArray *preferenceKeys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  preferenceKeys = self->_preferenceKeys;
  v8 = v4;
  if (!preferenceKeys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_preferenceKeys;
    self->_preferenceKeys = v6;

    v4 = v8;
    preferenceKeys = self->_preferenceKeys;
  }
  -[NSMutableArray addObject:](preferenceKeys, "addObject:", v4);

}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_preferenceKeys;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        WeakRetained = objc_loadWeakRetained((id *)&self->_settings);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_listenerAddress);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "unregisterUpdateBlockForPreferenceKey:withListenerID:", v8, v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v11.receiver = self;
  v11.super_class = (Class)AXSettingsObjectDestructionHelper;
  -[AXSettingsObjectDestructionHelper dealloc](&v11, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_settings);
  objc_storeStrong((id *)&self->_preferenceKeys, 0);
}

@end
