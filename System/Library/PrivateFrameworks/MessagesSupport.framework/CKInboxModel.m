@implementation CKInboxModel

- (CKInboxModel)initWithSections:(id)a3 footerAction:(id)a4
{
  id v7;
  id v8;
  CKInboxModel *v9;
  CKInboxModel *v10;
  uint64_t v11;
  id footerAction;
  uint64_t v13;
  NSDictionary *itemsMap;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CKInboxModel;
  v9 = -[CKInboxModel init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sections, a3);
    v11 = MEMORY[0x1DF0AA838](v8);
    footerAction = v10->_footerAction;
    v10->_footerAction = (id)v11;

    -[CKInboxModel buildItemsMap:](v10, "buildItemsMap:", v7);
    v13 = objc_claimAutoreleasedReturnValue();
    itemsMap = v10->_itemsMap;
    v10->_itemsMap = (NSDictionary *)v13;

  }
  return v10;
}

- (id)buildItemsMap:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v9, "items");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v22 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
              objc_msgSend(v15, "filterMode");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
              {
                objc_msgSend(v15, "filterMode");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v17);

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v12);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }

  v18 = (void *)objc_msgSend(v4, "copy");
  return v18;
}

- (void)setIsCollapsed:(BOOL)a3
{
  _BOOL8 v3;
  CKInboxModelDelegate **p_delegate;
  id WeakRetained;
  id v6;

  v3 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "inboxModelDidUpdateIsCollapsed:", v3);

  }
}

- (CKInboxModelDelegate)delegate
{
  return (CKInboxModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (id)footerAction
{
  return self->_footerAction;
}

- (void)setFooterAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)logInboxViewedMetric
{
  return self->_logInboxViewedMetric;
}

- (void)setLogInboxViewedMetric:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)itemsMap
{
  return self->_itemsMap;
}

- (void)setItemsMap:(id)a3
{
  objc_storeStrong((id *)&self->_itemsMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsMap, 0);
  objc_storeStrong(&self->_logInboxViewedMetric, 0);
  objc_storeStrong(&self->_footerAction, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
