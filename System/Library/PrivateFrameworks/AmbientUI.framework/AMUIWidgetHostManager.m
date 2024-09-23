@implementation AMUIWidgetHostManager

- (AMUIWidgetHostManager)init
{
  AMUIWidgetHostManager *v2;
  id v3;
  AMUIInfographListLayoutProvider *v4;
  void *v5;
  SBHIconManager *iconManager;
  id v7;
  uint64_t v8;
  CHSWidgetHost *widgetHost;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AMUIWidgetHostManager;
  v2 = -[AMUIWidgetHostManager init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BEB08E8]);
    v4 = objc_alloc_init(AMUIInfographListLayoutProvider);
    objc_msgSend(v3, "setListLayoutProvider:", v4);
    objc_msgSend(v3, "setUsageMonitoringEnabled:", 1);
    objc_msgSend(v3, "usageMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:", v2);

    iconManager = v2->_iconManager;
    v2->_iconManager = (SBHIconManager *)v3;
    v7 = v3;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE16A68]), "initWithIdentifier:", CFSTR("Ambient-Infograph"));
    widgetHost = v2->_widgetHost;
    v2->_widgetHost = (CHSWidgetHost *)v8;

    -[AMUIWidgetHostManager _rebuildAndTransmitConfiguredWidgetData:](v2, "_rebuildAndTransmitConfiguredWidgetData:", v7);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CHSWidgetHost deactivate](self->_widgetHost, "deactivate");
  -[CHSWidgetHost invalidate](self->_widgetHost, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AMUIWidgetHostManager;
  -[AMUIWidgetHostManager dealloc](&v3, sel_dealloc);
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconAdded:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  AMUILogWidgets();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "widgets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_23600A000, v8, OS_LOG_TYPE_DEFAULT, "Widget icon added: %@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(v7, "iconManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMUIWidgetHostManager _rebuildAndTransmitConfiguredWidgetData:](self, "_rebuildAndTransmitConfiguredWidgetData:", v10);
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconRemoved:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  AMUILogWidgets();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "widgets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_23600A000, v8, OS_LOG_TYPE_DEFAULT, "Widget icon removed: %@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(v7, "iconManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMUIWidgetHostManager _rebuildAndTransmitConfiguredWidgetData:](self, "_rebuildAndTransmitConfiguredWidgetData:", v10);
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconStackChangedActiveWidget:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  AMUILogWidgets();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "activeDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widgets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_23600A000, v8, OS_LOG_TYPE_DEFAULT, "Widget icon stack changed active widget: %@ all widgets: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend(v7, "iconManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMUIWidgetHostManager _rebuildAndTransmitConfiguredWidgetData:](self, "_rebuildAndTransmitConfiguredWidgetData:", v11);
  -[AMUIWidgetHostManager delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "widgetHostManager:didNoteStackChangedActiveWidget:", self, v6);

}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserAddedWidgetIconStackSuggestion:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  AMUILogWidgets();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "widgets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_23600A000, v5, OS_LOG_TYPE_DEFAULT, "Widget icon stack noted user added suggestion: %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserDislikedWidgetIconStackSuggestion:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  AMUILogWidgets();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "widgets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_23600A000, v5, OS_LOG_TYPE_DEFAULT, "Widget icon stack noted user dislike of suggestion: %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserDislikedSiriSuggestionOnWidgetIconStackSuggestion:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  AMUILogWidgets();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "widgets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_23600A000, v5, OS_LOG_TYPE_DEFAULT, "Widget icon stack noted dislike of Siri Suggestion on suggestion: %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserTappedWidgetIcon:(id)a4 withURL:(id)a5
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  AMUILogWidgets();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "widgets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_23600A000, v6, OS_LOG_TYPE_DEFAULT, "Widget icon tapped: %@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)homeScreenUsageAggregatorAddWidgetSheetWillPresent:(id)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  AMUILogWidgets();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_23600A000, v4, OS_LOG_TYPE_DEFAULT, "Add Widget sheet will present", v8, 2u);
  }

  v5 = objc_alloc_init(MEMORY[0x24BE169D0]);
  -[AMUIWidgetHostManager widgetHost](self, "widgetHost");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userEnteredAddGalleryForHost:", v7);

}

- (void)_rebuildAndTransmitConfiguredWidgetData:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;
  unint64_t v9;

  v4 = a3;
  v5 = -[AMUIWidgetHostManager widgetDataGeneration](self, "widgetDataGeneration") + 1;
  -[AMUIWidgetHostManager setWidgetDataGeneration:](self, "setWidgetDataGeneration:", v5);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__AMUIWidgetHostManager__rebuildAndTransmitConfiguredWidgetData___block_invoke;
  v7[3] = &unk_250763938;
  v8 = v4;
  v9 = v5;
  v7[4] = self;
  v6 = v4;
  objc_msgSend(v6, "performAfterCachingWidgetIntentsUsingBlock:", v7);

}

void __65__AMUIWidgetHostManager__rebuildAndTransmitConfiguredWidgetData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 == objc_msgSend(*(id *)(a1 + 32), "widgetDataGeneration"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "rootFolder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __65__AMUIWidgetHostManager__rebuildAndTransmitConfiguredWidgetData___block_invoke_2;
    v15[3] = &unk_250763910;
    v5 = v4;
    v6 = *(_QWORD *)(a1 + 32);
    v16 = v5;
    v17 = v6;
    v7 = v3;
    v18 = v7;
    objc_msgSend(v5, "enumerateAllIconsWithOptions:usingBlock:", 2, v15);
    AMUILogWidgets();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "_descriptionForArray:name:", v7, CFSTR("containers"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl(&dword_23600A000, v8, OS_LOG_TYPE_DEFAULT, "Configured widgets changed: %@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "iconManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "widgetMetricsProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "systemDefaultMetricsSpecification");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE169F0]), "initWithContainerDescriptors:metricsSpecification:", v7, v12);
    objc_msgSend(*(id *)(a1 + 32), "_rateLimitPolicies");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRateLimitPolicies:", v14);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setConfiguration:", v13);
  }
}

void __65__AMUIWidgetHostManager__rebuildAndTransmitConfiguredWidgetData___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = objc_opt_class();
  v11 = v5;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v11;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (v9)
  {
    objc_msgSend(a1[5], "_containerDescriptorForWidgetIcon:atLocation:page:", v9, 5, objc_msgSend(a1[4], "visibleIndexForIndex:", objc_msgSend(v6, "indexAtPosition:", 0)));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(a1[6], "addObject:", v10);

  }
}

- (id)_rateLimitPolicies
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE16A88]), "initWithMaximumRefreshes:perWindow:", 1, 600.0);
  v3 = objc_alloc(MEMORY[0x24BE16A90]);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithIdentifier:rateLimits:", CFSTR("AMUIActiveWidgetRateLimitPolicyIdentifier"), v4);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE16A88]), "initWithMaximumRefreshes:perWindow:", 1, 1200.0);
  v7 = objc_alloc(MEMORY[0x24BE16A90]);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithIdentifier:rateLimits:", CFSTR("AMUIInactiveWidgetRateLimitPolicyIdentifier"), v8);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v5, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_refreshStrategyForIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE16A98], "rateLimitedWithPolicyIdentifier:", a3);
}

- (id)_containerDescriptorForWidgetIcon:(id)a3 atLocation:(int64_t)a4 page:(unint64_t)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  id obj;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  _QWORD v50[2];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gridSizeClass");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = CHSWidgetFamilyForSBHIconGridSizeClass();
  objc_msgSend(v6, "widgets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeWidget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v42 = objc_claimAutoreleasedReturnValue();

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v7;
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v43)
  {
    v39 = *(_QWORD *)v45;
    v40 = v6;
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v45 != v39)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        -[AMUIWidgetHostManager iconManager](self, "iconManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "intentForWidget:ofIcon:", v10, v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_alloc(MEMORY[0x24BE16A18]);
        objc_msgSend(v10, "extensionBundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "containerBundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "kind");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v13, "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:family:intent:", v14, v15, v16, v41, v12);

        -[AMUIWidgetHostManager iconManager](self, "iconManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "widgetMetricsProvider");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "systemMetricsForWidget:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = objc_alloc(MEMORY[0x24BE169E0]);
        objc_msgSend(v10, "uniqueIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v21, "initWithUniqueIdentifier:widget:metrics:", v22, v17, v20);

        objc_msgSend(v23, "setSuggestion:", objc_msgSend(v10, "suggestionSource") == 1);
        objc_msgSend(v23, "setSystemConfigured:", objc_msgSend(v10, "suggestionSource") == 2);
        objc_msgSend(v23, "setSupportedColorSchemes:", 2);
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE16AA0]), "initWithRenderingMode:backgroundViewPolicy:", 1, 1);
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE16AA0]), "initWithRenderingMode:backgroundViewPolicy:", 0, 1);
        v50[0] = v24;
        v50[1] = v25;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setSupportedRenderSchemes:", v26);

        objc_msgSend(v10, "uniqueIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = objc_msgSend(v27, "isEqualToString:", v42);

        if ((_DWORD)v10)
          v28 = CFSTR("AMUIActiveWidgetRateLimitPolicyIdentifier");
        else
          v28 = CFSTR("AMUIInactiveWidgetRateLimitPolicyIdentifier");
        -[AMUIWidgetHostManager _refreshStrategyForIdentifier:](self, "_refreshStrategyForIdentifier:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setRefreshStrategy:", v29);
        if (v23)
        {
          objc_msgSend(v38, "addObject:", v23);
          AMUILogWidgets();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v49 = v23;
            _os_log_impl(&dword_23600A000, v30, OS_LOG_TYPE_DEFAULT, "Found configured widget: %@", buf, 0xCu);
          }

        }
        v6 = v40;
      }
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v43);
  }

  if (objc_msgSend(v38, "count"))
  {
    v31 = objc_alloc(MEMORY[0x24BE16988]);
    objc_msgSend(v6, "uniqueIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)v42;
    v34 = (void *)objc_msgSend(v31, "initWithUniqueIdentifier:location:canAppearInSecureEnvironment:page:family:widgets:activeWidget:", v32, v42);

  }
  else
  {
    v34 = 0;
    v33 = (void *)v42;
  }

  return v34;
}

- (id)_descriptionForArray:(id)a3 name:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BE0BE08];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "builderWithObject:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendArraySection:withName:skipIfEmpty:", v7, v6, 0);

  objc_msgSend(v8, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (AMUIWidgetHostManagerDelegate)delegate
{
  return (AMUIWidgetHostManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CHSWidgetHost)widgetHost
{
  return self->_widgetHost;
}

- (SBHIconManager)iconManager
{
  return self->_iconManager;
}

- (unint64_t)widgetDataGeneration
{
  return self->_widgetDataGeneration;
}

- (void)setWidgetDataGeneration:(unint64_t)a3
{
  self->_widgetDataGeneration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconManager, 0);
  objc_storeStrong((id *)&self->_widgetHost, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
