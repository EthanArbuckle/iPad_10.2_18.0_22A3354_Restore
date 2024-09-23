@implementation AMUIProactiveUsageObserver

- (AMUIProactiveUsageObserver)initWithListModel:(id)a3 iconManager:(id)a4 proactiveClient:(id)a5
{
  id v9;
  id v10;
  id v11;
  AMUIProactiveUsageObserver *v12;
  AMUIProactiveUsageObserver *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMUIProactiveUsageObserver;
  v12 = -[AMUIProactiveUsageObserver init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_listModel, a3);
    objc_storeStrong((id *)&v13->_iconManager, a4);
    objc_storeStrong((id *)&v13->_proactiveClient, a5);
  }

  return v13;
}

- (void)pushStackConfigurationsToProactive
{
  id v3;
  SBIconListModel *listModel;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  listModel = self->_listModel;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__AMUIProactiveUsageObserver_pushStackConfigurationsToProactive__block_invoke;
  v6[3] = &unk_250763638;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  -[SBIconListModel enumerateIconsUsingBlock:](listModel, "enumerateIconsUsingBlock:", v6);
  -[ATXAmbientSuggestionProvider writeStacks:completion:](self->_proactiveClient, "writeStacks:completion:", v5, &__block_literal_global_3);

}

void __64__AMUIProactiveUsageObserver_pushStackConfigurationsToProactive__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isWidgetIcon"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_proactiveWidgetStackForWidgetIcon:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  }
}

void __64__AMUIProactiveUsageObserver_pushStackConfigurationsToProactive__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    AMUILogProactive();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __64__AMUIProactiveUsageObserver_pushStackConfigurationsToProactive__block_invoke_2_cold_1((uint64_t)v2, v3);

  }
}

- (id)_proactiveWidgetStackForWidgetIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v4, "widgets", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        -[AMUIProactiveUsageObserver _proactiveWidgetForWidget:ofIcon:](self, "_proactiveWidgetForWidget:ofIcon:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10), v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  v12 = objc_alloc(MEMORY[0x24BE199F0]);
  objc_msgSend(v4, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeWidget");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uniqueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithIdentifier:widgets:topWidgetIdentifier:family:allowsNewWidget:allowsSmartRotate:", v13, v5, v15, 1, objc_msgSend(v4, "allowsExternalSuggestions"), objc_msgSend(v4, "allowsSuggestions"));

  return v16;
}

- (id)_proactiveWidgetForWidget:(id)a3 ofIcon:(id)a4
{
  SBHIconManager *iconManager;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;

  iconManager = self->_iconManager;
  v6 = a3;
  -[SBHIconManager intentForWidget:ofIcon:](iconManager, "intentForWidget:ofIcon:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x24BE169B8]);
  objc_msgSend(v6, "extensionBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v9, v10, 0);

  v12 = objc_alloc(MEMORY[0x24BE16A18]);
  objc_msgSend(v6, "kind");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithExtensionIdentity:kind:family:intent:activityIdentifier:", v11, v13, 1, v7, 0);

  v15 = objc_alloc(MEMORY[0x24BE199E8]);
  objc_msgSend(v6, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v6, "suggestionSource");

  v18 = (void *)objc_msgSend(v15, "initWithIdentifier:chsWidget:suggestedWidget:", v16, v14, v17 == 1);
  return v18;
}

- (id)_proactiveWidgetForIconDataSource:(id)a3 ofIcon:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  v9 = v6;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  if (v11)
  {
    -[AMUIProactiveUsageObserver _proactiveWidgetForWidget:ofIcon:](self, "_proactiveWidgetForWidget:ofIcon:", v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteDataSourceDidAppear:(id)a4 forWidgetIcon:(id)a5
{
  void *v6;
  void *v7;

  -[AMUIProactiveUsageObserver _proactiveWidgetForIconDataSource:ofIcon:](self, "_proactiveWidgetForIconDataSource:ofIcon:", a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    -[ATXAmbientSuggestionProvider logWidgetDidAppear:](self->_proactiveClient, "logWidgetDidAppear:", v6);
    v6 = v7;
  }

}

- (void)homeScreenUsageAggregator:(id)a3 didNoteDataSourceDidDisappear:(id)a4 forWidgetIcon:(id)a5
{
  void *v6;
  void *v7;

  -[AMUIProactiveUsageObserver _proactiveWidgetForIconDataSource:ofIcon:](self, "_proactiveWidgetForIconDataSource:ofIcon:", a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    -[ATXAmbientSuggestionProvider logWidgetDidDisappear:](self->_proactiveClient, "logWidgetDidDisappear:", v6);
    v6 = v7;
  }

}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserTappedWidgetIcon:(id)a4 withURL:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(v6, "activeWidget");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[AMUIProactiveUsageObserver _proactiveWidgetForWidget:ofIcon:](self, "_proactiveWidgetForWidget:ofIcon:", v8, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXAmbientSuggestionProvider logUserDidTapWidget:](self->_proactiveClient, "logUserDidTapWidget:", v7);
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconStackChangedActiveWidget:(id)a4
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  objc_msgSend(v11, "activeDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v11, "stackChangeReason") - 1;
  if (v6 > 5)
  {
    v7 = 0;
    if (!v5)
      goto LABEL_7;
  }
  else
  {
    v7 = qword_23603B250[v6];
    if (!v5)
      goto LABEL_7;
  }
  -[AMUIProactiveUsageObserver _proactiveWidgetForIconDataSource:ofIcon:](self, "_proactiveWidgetForIconDataSource:ofIcon:", v5, v11);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[AMUIProactiveUsageObserver _proactiveWidgetStackForWidgetIcon:](self, "_proactiveWidgetStackForWidgetIcon:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAmbientSuggestionProvider logWidgetStack:didChangeToWidget:reason:](self->_proactiveClient, "logWidgetStack:didChangeToWidget:reason:", v10, v9, v7);

  }
LABEL_7:
  -[AMUIProactiveUsageObserver pushStackConfigurationsToProactive](self, "pushStackConfigurationsToProactive");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveClient, 0);
  objc_storeStrong((id *)&self->_iconManager, 0);
  objc_storeStrong((id *)&self->_listModel, 0);
}

void __64__AMUIProactiveUsageObserver_pushStackConfigurationsToProactive__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_23600A000, a2, OS_LOG_TYPE_ERROR, "Could not write stack configurations: %@", (uint8_t *)&v2, 0xCu);
}

@end
