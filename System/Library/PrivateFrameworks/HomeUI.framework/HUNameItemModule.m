@implementation HUNameItemModule

- (HUNameItemModule)initWithItemUpdater:(id)a3 sourceServiceLikeItem:(id)a4 itemBuilder:(id)a5
{
  id v8;
  id v9;
  HUNameItemModule *v10;
  HUNameItemModule *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HUNameItemModule;
  v10 = -[HFItemModule initWithItemUpdater:](&v13, sel_initWithItemUpdater_, a3);
  v11 = v10;
  if (v10)
  {
    -[HUNameItemModule setSourceItem:](v10, "setSourceItem:", v8);
    -[HUNameItemModule setSourceItemBuilder:](v11, "setSourceItemBuilder:", v9);
  }

  return v11;
}

- (HUNameItemModule)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_sourceServiceLikeItem_itemBuilder_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUNameItemModule.m"), 38, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUNameItemModule init]",
    v5);

  return 0;
}

- (id)itemProviders
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  -[HUNameItemModule itemProvider](self, "itemProvider");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[HUNameItemModule nameAndIconItem](self, "nameAndIconItem"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    v6 = objc_alloc(MEMORY[0x1E0D31920]);
    -[HUNameItemModule sourceItem](self, "sourceItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    v9 = (void *)objc_msgSend(v6, "initWithSourceItem:transformationBlock:", v8, &__block_literal_global_170);
    -[HUNameItemModule setNameAndIconItem:](self, "setNameAndIconItem:", v9);

    v10 = (void *)MEMORY[0x1E0C99E60];
    -[HUNameItemModule nameAndIconItem](self, "nameAndIconItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "na_setWithSafeObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNameItemModule setItems:](self, "setItems:", v12);

    v13 = objc_alloc(MEMORY[0x1E0D31848]);
    -[HUNameItemModule items](self, "items");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithItems:", v14);
    -[HUNameItemModule setItemProvider:](self, "setItemProvider:", v15);

  }
  v16 = (void *)MEMORY[0x1E0C99E60];
  -[HUNameItemModule itemProvider](self, "itemProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "na_setWithSafeObject:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id __33__HUNameItemModule_itemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = *MEMORY[0x1E0D30B80];
  v19[0] = *MEMORY[0x1E0D30D18];
  v19[1] = v4;
  v5 = *MEMORY[0x1E0D30C78];
  v19[2] = *MEMORY[0x1E0D30C60];
  v19[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v2, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "na_safeSetObject:forKey:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30F00]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeSetObject:forKey:", v13, *MEMORY[0x1E0D30C80]);

  return v3;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D31570];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIdentifier:", CFSTR("HUNameItemModuleSectionIdentifier"));
  -[HUNameItemModule nameAndIconItem](self, "nameAndIconItem");
  v7 = objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v8);

  -[HUNameItemModule sourceItem](self, "sourceItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v7) = objc_opt_isKindOfClass();

  if ((v7 & 1) != 0)
  {
    HULocalizedWiFiString(CFSTR("HUNetworkRouterNameSectionFooter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFooterTitle:", v10);

  }
  v11 = (void *)MEMORY[0x1E0D314B0];
  v15 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "filterSections:toDisplayedItems:", v12, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (HFNamingComponentCreating)sourceItem
{
  return self->_sourceItem;
}

- (void)setSourceItem:(id)a3
{
  objc_storeStrong((id *)&self->_sourceItem, a3);
}

- (HFItemBuilder)sourceItemBuilder
{
  return self->_sourceItemBuilder;
}

- (void)setSourceItemBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_sourceItemBuilder, a3);
}

- (HFTransformItem)nameAndIconItem
{
  return self->_nameAndIconItem;
}

- (void)setNameAndIconItem:(id)a3
{
  objc_storeStrong((id *)&self->_nameAndIconItem, a3);
}

- (NSSet)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (HFStaticItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_itemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_nameAndIconItem, 0);
  objc_storeStrong((id *)&self->_sourceItemBuilder, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
}

@end
