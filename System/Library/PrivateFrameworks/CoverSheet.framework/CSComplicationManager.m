@implementation CSComplicationManager

- (CSComplicationManager)initWithApplicationInformer:(id)a3 urlHandler:(id)a4
{
  id v7;
  id v8;
  CSComplicationManager *v9;
  uint64_t v10;
  CHSWidgetHost *widgetHost;
  PRWidgetMetricsProvider *v12;
  PRWidgetMetricsProvider *widgetMetricsProvider;
  NSArray *graphicComplicationDescriptors;
  NSArray *v15;
  NSArray *sidebarComplicationDescriptors;
  CHSWidgetDescriptorProvider *v17;
  CHSWidgetDescriptorProvider *widgetDescriptorProvider;
  uint64_t v19;
  PRSWallpaperObserver *wallpaperObserver;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id location;
  objc_super v30;

  v7 = a3;
  v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)CSComplicationManager;
  v9 = -[CSComplicationManager init](&v30, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D101D0]), "initWithIdentifier:", CFSTR("Complications"));
    widgetHost = v9->_widgetHost;
    v9->_widgetHost = (CHSWidgetHost *)v10;

    v12 = (PRWidgetMetricsProvider *)objc_alloc_init(MEMORY[0x1E0D7FBD0]);
    widgetMetricsProvider = v9->_widgetMetricsProvider;
    v9->_widgetMetricsProvider = v12;

    graphicComplicationDescriptors = v9->_graphicComplicationDescriptors;
    v15 = (NSArray *)MEMORY[0x1E0C9AA60];
    v9->_graphicComplicationDescriptors = (NSArray *)MEMORY[0x1E0C9AA60];

    sidebarComplicationDescriptors = v9->_sidebarComplicationDescriptors;
    v9->_sidebarComplicationDescriptors = v15;

    objc_storeStrong((id *)&v9->_applicationInformer, a3);
    objc_storeStrong((id *)&v9->_urlHandler, a4);
    v17 = (CHSWidgetDescriptorProvider *)objc_alloc_init(MEMORY[0x1E0D10170]);
    widgetDescriptorProvider = v9->_widgetDescriptorProvider;
    v9->_widgetDescriptorProvider = v17;

    -[CHSWidgetDescriptorProvider addObserver:](v9->_widgetDescriptorProvider, "addObserver:", v9);
    if ((CSFeatureEnabled(0) & 1) != 0 || CSFeatureEnabled(4))
    {
      -[CSApplicationInforming addApplicationInformationObserver:](v9->_applicationInformer, "addApplicationInformationObserver:", v9);
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7F720]), "initWithExplanation:", CFSTR("CoverSheet"));
      wallpaperObserver = v9->_wallpaperObserver;
      v9->_wallpaperObserver = (PRSWallpaperObserver *)v19;

      objc_initWeak(&location, v9);
      v21 = (void *)MEMORY[0x1E0D7F728];
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __64__CSComplicationManager_initWithApplicationInformer_urlHandler___block_invoke;
      v27 = &unk_1E8E2EB58;
      objc_copyWeak(&v28, &location);
      objc_msgSend(v21, "configurationWithHandler:", &v24);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRSWallpaperObserver activateWithConfiguration:](v9->_wallpaperObserver, "activateWithConfiguration:", v22, v24, v25, v26, v27);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
  }

  return v9;
}

void __64__CSComplicationManager_initWithApplicationInformer_urlHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__CSComplicationManager_initWithApplicationInformer_urlHandler___block_invoke_2;
  v5[3] = &unk_1E8E2E958;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __64__CSComplicationManager_initWithApplicationInformer_urlHandler___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 2, *(id *)(a1 + 32));
    objc_msgSend(v3, "_updateComplicationsForActivePosterConfiguration");
    WeakRetained = v3;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[PRSWallpaperObserver invalidate](self->_wallpaperObserver, "invalidate");
  -[CHSWidgetHost invalidate](self->_widgetHost, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CSComplicationManager;
  -[CSComplicationManager dealloc](&v3, sel_dealloc);
}

- (id)_widgetMetricsForBounds:(CGRect)a3 fromMetrics:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (objc_class *)MEMORY[0x1E0D1BCB0];
  v9 = a4;
  v10 = [v8 alloc];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithTraitEnvironment:", v11);

  objc_msgSend(v12, "frameForElements:withBoundingRect:", 4, x, y, width, height);
  v14 = v13;
  objc_msgSend(v9, "size");
  v16 = v15;

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D101F0]), "initWithSize:cornerRadius:", v14, v16, 0.0);
  return v17;
}

- (void)_updateComplicationsForActivePosterConfiguration
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_1(&dword_1D0337000, a2, a3, "Failed to load complication layout from %@: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

void __73__CSComplicationManager__updateComplicationsForActivePosterConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __73__CSComplicationManager__updateComplicationsForActivePosterConfiguration__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __73__CSComplicationManager__updateComplicationsForActivePosterConfiguration__block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateWidgetHostConfiguration");
  v2 = *(_QWORD **)(a1 + 32);
  result = v2[15];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, v2[5], v2[6]);
  return result;
}

void __73__CSComplicationManager__updateComplicationsForActivePosterConfiguration__block_invoke_18(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __73__CSComplicationManager__updateComplicationsForActivePosterConfiguration__block_invoke_2_20(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __73__CSComplicationManager__updateComplicationsForActivePosterConfiguration__block_invoke_3_21(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t result;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 40), "complicationIconLayout");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

  objc_msgSend(*(id *)(a1 + 40), "sidebarComplicationIconLayout");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v5;

  objc_msgSend(*(id *)(a1 + 32), "_updateWidgetHostConfiguration");
  v8 = *(_QWORD **)(a1 + 32);
  v9 = v8[16];
  if (v9)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v9 + 16))(v9, v8[7], v8[9]);
    v8 = *(_QWORD **)(a1 + 32);
  }
  result = v8[17];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, v8[8], v8[10]);
  return result;
}

- (void)_complicationDescriptorsForWidgets:(id)a3 completion:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  CSComplicationManager *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  _QWORD block[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  NSObject *v34;
  unint64_t v35;
  _QWORD v36[6];

  v25 = a4;
  v6 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __71__CSComplicationManager__complicationDescriptorsForWidgets_completion___block_invoke;
  v36[3] = &unk_1E8E2EBF8;
  v36[4] = self;
  objc_msgSend(a3, "bs_filter:", v36);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v9 = dispatch_group_create();
  if (objc_msgSend(v7, "count"))
  {
    v10 = 0;
    v27 = v9;
    v28 = v7;
    v26 = v8;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v11);

      dispatch_group_enter(v9);
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc(MEMORY[0x1E0D10148]);
      objc_msgSend(v12, "extensionBundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "containerBundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "kind");
      v16 = self;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v12, "family");
      objc_msgSend(v12, "intent");
      v19 = v6;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v13, "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:family:intent:", v14, v15, v17, v18, v20);

      v6 = v19;
      self = v16;
      v8 = v26;
      v9 = v27;

      -[PRWidgetMetricsProvider systemMetricsForWidget:](self->_widgetMetricsProvider, "systemMetricsForWidget:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v6;
      v32[1] = 3221225472;
      v32[2] = __71__CSComplicationManager__complicationDescriptorsForWidgets_completion___block_invoke_2;
      v32[3] = &unk_1E8E2EC20;
      v33 = v26;
      v35 = v10;
      v34 = v27;
      -[CSComplicationManager _createComplicationDescriptorForWidget:withMetrics:completion:](self, "_createComplicationDescriptorForWidget:withMetrics:completion:", v12, v22, v32);

      v7 = v28;
      ++v10;
    }
    while (v10 < objc_msgSend(v28, "count"));
  }
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __71__CSComplicationManager__complicationDescriptorsForWidgets_completion___block_invoke_3;
  block[3] = &unk_1E8E2E5C8;
  v30 = v8;
  v31 = v25;
  v23 = v8;
  v24 = v25;
  dispatch_group_notify(v9, MEMORY[0x1E0C80D38], block);

}

uint64_t __71__CSComplicationManager__complicationDescriptorsForWidgets_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_widgetHasMatchingSystemDescriptor:", a2);
}

void __71__CSComplicationManager__complicationDescriptorsForWidgets_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", a2, *(_QWORD *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __71__CSComplicationManager__complicationDescriptorsForWidgets_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)_widgetHasMatchingSystemDescriptor:(id)a3
{
  CHSWidgetDescriptorProvider *widgetDescriptorProvider;
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  widgetDescriptorProvider = self->_widgetDescriptorProvider;
  v4 = a3;
  -[CHSWidgetDescriptorProvider descriptorForPersonality:](widgetDescriptorProvider, "descriptorForPersonality:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "family");

  v6 = CHSWidgetFamilyMaskFromWidgetFamily();
  if (v5)
    v7 = (v6 & ~objc_msgSend(v5, "supportedFamilies")) == 0;
  else
    v7 = 0;

  return v7;
}

- (void)_updateWidgetHostConfiguration
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  CSComplicationDescriptor *landscapeInlineComplicationDescriptor;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", self->_graphicComplicationDescriptors);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", self->_sidebarComplicationDescriptors);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  if (self->_inlineComplicationDescriptor)
  {
    landscapeInlineComplicationDescriptor = self->_landscapeInlineComplicationDescriptor;
    if (landscapeInlineComplicationDescriptor)
    {
      v14[0] = self->_inlineComplicationDescriptor;
      v14[1] = landscapeInlineComplicationDescriptor;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v10;
    }
  }
  objc_msgSend(v4, "bs_map:", &__block_literal_global_3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRWidgetMetricsProvider lockScreenWidgetMetricsSpecifications](self->_widgetMetricsProvider, "lockScreenWidgetMetricsSpecifications");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10150]), "initWithContainerDescriptors:metricsSpecification:", v11, v12);
  -[CHSWidgetHost setConfiguration:](self->_widgetHost, "setConfiguration:", v13);

}

id __55__CSComplicationManager__updateWidgetHostConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D10080]);
  objc_msgSend(v2, "widget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithUniqueIdentifier:widget:metrics:", v3, v5, v6);

  objc_msgSend(v7, "setSuggestion:", 0);
  objc_msgSend(v7, "setSystemConfigured:", 0);
  objc_msgSend(v7, "setSupportedColorSchemes:", 2);
  objc_msgSend(v7, "setSupportsLowLuminance:", 1);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10250]), "initWithRenderingMode:backgroundViewPolicy:", 1, 1);
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSupportedRenderSchemes:", v9);

  v10 = objc_alloc(MEMORY[0x1E0D0FFB8]);
  objc_msgSend(v2, "widget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "family");
  v16 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithUniqueIdentifier:location:canAppearInSecureEnvironment:page:family:widgets:activeWidget:", v3, 4, 1, 0, v12, v13, v3);

  return v14;
}

- (void)_createComplicationDescriptorForWidget:(id)a3 withMetrics:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  CSApplicationInforming *applicationInformer;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(_QWORD, _QWORD);
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  void (**v29)(_QWORD, _QWORD);
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  uint64_t *v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__0;
  v40 = __Block_byref_object_dispose__0;
  v11 = objc_alloc(MEMORY[0x1E0D10148]);
  objc_msgSend(v8, "extensionBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "kind");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v8, "family");
  objc_msgSend(v8, "intent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (id)objc_msgSend(v11, "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:family:intent:", v12, v13, v14, v15, v16);

  applicationInformer = self->_applicationInformer;
  objc_msgSend((id)v37[5], "containerBundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(applicationInformer) = -[CSApplicationInforming isBundleIdentifierBlockedForScreenTimeExpiration:](applicationInformer, "isBundleIdentifierBlockedForScreenTimeExpiration:", v18);

  v19 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __87__CSComplicationManager__createComplicationDescriptorForWidget_withMetrics_completion___block_invoke;
  v30[3] = &unk_1E8E2EC88;
  v34 = &v36;
  v20 = v8;
  v31 = v20;
  v21 = v9;
  v32 = v21;
  v35 = (char)applicationInformer;
  v22 = v10;
  v33 = v22;
  v23 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E1614](v30);
  -[CHSWidgetDescriptorProvider descriptorForPersonality:](self->_widgetDescriptorProvider, "descriptorForPersonality:", v37[5]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "intentType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25
    && (objc_msgSend((id)v37[5], "intent"),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v26,
        v25,
        !v26))
  {
    v28[0] = v19;
    v28[1] = 3221225472;
    v28[2] = __87__CSComplicationManager__createComplicationDescriptorForWidget_withMetrics_completion___block_invoke_2;
    v28[3] = &unk_1E8E2ECB0;
    v29 = v23;
    objc_msgSend(v24, "loadDefaultIntent:", v28);
    v27 = v29;
  }
  else
  {
    objc_msgSend((id)v37[5], "intent");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v23)[2](v23, v27);
  }

  _Block_object_dispose(&v36, 8);
}

void __87__CSComplicationManager__createComplicationDescriptorForWidget_withMetrics_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  CSComplicationDescriptor *v6;
  void *v7;
  CSComplicationDescriptor *v8;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "widgetByReplacingIntent:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = [CSComplicationDescriptor alloc];
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CSComplicationDescriptor initWithUniqueIdentifier:widget:metrics:blockedForScreenTimeExpiration:](v6, "initWithUniqueIdentifier:widget:metrics:blockedForScreenTimeExpiration:", v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __87__CSComplicationManager__createComplicationDescriptorForWidget_withMetrics_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setOnInlineComplicationUpdate:(id)a3
{
  void *v4;
  id onInlineComplicationUpdate;
  void (**v6)(id, CSComplicationDescriptor *, CSComplicationDescriptor *);

  v4 = (void *)MEMORY[0x1D17E1614](a3, a2);
  onInlineComplicationUpdate = self->_onInlineComplicationUpdate;
  self->_onInlineComplicationUpdate = v4;

  v6 = (void (**)(id, CSComplicationDescriptor *, CSComplicationDescriptor *))self->_onInlineComplicationUpdate;
  if (v6)
    v6[2](v6, self->_inlineComplicationDescriptor, self->_landscapeInlineComplicationDescriptor);
}

- (void)setOnWidgetUpdate:(id)a3
{
  void *v4;
  id onWidgetUpdate;
  void (**v6)(id, NSArray *, NSDictionary *);

  v4 = (void *)MEMORY[0x1D17E1614](a3, a2);
  onWidgetUpdate = self->_onWidgetUpdate;
  self->_onWidgetUpdate = v4;

  v6 = (void (**)(id, NSArray *, NSDictionary *))self->_onWidgetUpdate;
  if (v6)
    v6[2](v6, self->_graphicComplicationDescriptors, self->_iconLayout);
}

- (void)setOnSidebarWidgetUpdate:(id)a3
{
  void *v4;
  id onSidebarWidgetUpdate;
  void (**v6)(id, NSArray *, NSDictionary *);

  v4 = (void *)MEMORY[0x1D17E1614](a3, a2);
  onSidebarWidgetUpdate = self->_onSidebarWidgetUpdate;
  self->_onSidebarWidgetUpdate = v4;

  v6 = (void (**)(id, NSArray *, NSDictionary *))self->_onSidebarWidgetUpdate;
  if (v6)
    v6[2](v6, self->_sidebarComplicationDescriptors, self->_sidebarIconLayout);
}

- (void)setOnTintColorUpdate:(id)a3
{
  void *v4;
  id onTintColorUpdate;
  void (**v6)(id, UIColor *);

  v4 = (void *)MEMORY[0x1D17E1614](a3, a2);
  onTintColorUpdate = self->_onTintColorUpdate;
  self->_onTintColorUpdate = v4;

  v6 = (void (**)(id, UIColor *))self->_onTintColorUpdate;
  if (v6)
    v6[2](v6, self->_tintColor);
}

- (void)handleLaunchRequestForWidget:(id)a3 withAction:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char isKindOfClass;
  _BOOL4 v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  CSWidgetURLHandling *urlHandler;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithBundleIdentifier:error:", v7, 0);
  objc_msgSend(v8, "containingBundleRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[CSApplicationInforming isBundleIdentifierUserVisible:](self->_applicationInformer, "isBundleIdentifierUserVisible:", v10);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v13 = -[CSComplicationManager _bundleHasOpenURLEntitlement:](self, "_bundleHasOpenURLEntitlement:", v7);
  if ((v11 & 1) == 0 && (isKindOfClass & 1) != 0 && v13)
  {
    v14 = objc_opt_class();
    v15 = v6;
    if (v14)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
    }
    else
    {
      v16 = 0;
    }
    v18 = v16;

    SBLogDashBoard();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v18, "url");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v10;
      v25 = 2114;
      v26 = v20;
      _os_log_impl(&dword_1D0337000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Opening URL from complication tap: %{public}@", (uint8_t *)&v23, 0x16u);

    }
    urlHandler = self->_urlHandler;
    objc_msgSend(v18, "url");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSWidgetURLHandling openURL:](urlHandler, "openURL:", v22);

  }
  else if (v11)
  {
    -[CSComplicationManager _openApplicationWithBundleIdentifier:action:](self, "_openApplicationWithBundleIdentifier:action:", v10, v6);
  }
  else
  {
    SBLogDashBoard();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138543362;
      v24 = v10;
      _os_log_impl(&dword_1D0337000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignored application launch from complication because application is not user visible", (uint8_t *)&v23, 0xCu);
    }

  }
}

- (void)_openApplicationWithBundleIdentifier:(id)a3 action:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  objc_msgSend(v6, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bs_setSafeObject:forKey:", v9, *MEMORY[0x1E0D22828]);

  v10 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v8, "bs_setSafeObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D22838]);
  objc_msgSend(v8, "bs_setSafeObject:forKey:", v10, *MEMORY[0x1E0D22840]);
  objc_msgSend(MEMORY[0x1E0D22938], "optionsWithDictionary:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D22940], "serviceWithDefaultShellEndpoint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__CSComplicationManager__openApplicationWithBundleIdentifier_action___block_invoke;
  v14[3] = &unk_1E8E2ECD8;
  v15 = v5;
  v13 = v5;
  objc_msgSend(v12, "openApplication:withOptions:completion:", v13, v11, v14);

}

void __69__CSComplicationManager__openApplicationWithBundleIdentifier_action___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogDashBoard();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __69__CSComplicationManager__openApplicationWithBundleIdentifier_action___block_invoke_cold_1(a1, (uint64_t)v4, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1D0337000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Application launch from complication succeeded", (uint8_t *)&v8, 0xCu);
  }

}

- (BOOL)_bundleHasOpenURLEntitlement:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", a3, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entitlements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D102C8];
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:ofClass:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (void)descriptorsDidChangeForDescriptorProvider:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__CSComplicationManager_descriptorsDidChangeForDescriptorProvider___block_invoke;
  block[3] = &unk_1E8E2DB38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __67__CSComplicationManager_descriptorsDidChangeForDescriptorProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateComplicationsForActivePosterConfiguration");
}

- (void)applicationInformer:(id)a3 updatedApplications:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  char v17;
  NSArray *graphicComplicationDescriptors;
  NSArray *v19;
  NSArray *v20;
  void (**onWidgetUpdate)(id, NSArray *, NSDictionary *);
  _QWORD v22[5];
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CHSWidgetHost configuration](self->_widgetHost, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerDescriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bs_map:", &__block_literal_global_42);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v7, "containsObject:", v16))
        {
          v17 = objc_msgSend(v6, "isBundleIdentifierBlockedForScreenTimeExpiration:", v16);
          graphicComplicationDescriptors = self->_graphicComplicationDescriptors;
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __65__CSComplicationManager_applicationInformer_updatedApplications___block_invoke_2;
          v22[3] = &unk_1E8E2ED40;
          v22[4] = v16;
          v23 = v17;
          -[NSArray bs_map:](graphicComplicationDescriptors, "bs_map:", v22);
          v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v20 = self->_graphicComplicationDescriptors;
          self->_graphicComplicationDescriptors = v19;

          onWidgetUpdate = (void (**)(id, NSArray *, NSDictionary *))self->_onWidgetUpdate;
          if (onWidgetUpdate)
            onWidgetUpdate[2](onWidgetUpdate, self->_graphicComplicationDescriptors, self->_iconLayout);
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

}

id __65__CSComplicationManager_applicationInformer_updatedApplications___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "activeWidget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __65__CSComplicationManager_applicationInformer_updatedApplications___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "widget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);

  if (v5 == v6)
  {
    objc_msgSend(v3, "descriptorBlockedForScreenTimeExpiration:", *(unsigned __int8 *)(a1 + 40));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v3;
  }
  v8 = v7;

  return v8;
}

- (id)onInlineComplicationUpdate
{
  return self->_onInlineComplicationUpdate;
}

- (id)onWidgetUpdate
{
  return self->_onWidgetUpdate;
}

- (id)onSidebarWidgetUpdate
{
  return self->_onSidebarWidgetUpdate;
}

- (id)onTintColorUpdate
{
  return self->_onTintColorUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onTintColorUpdate, 0);
  objc_storeStrong(&self->_onSidebarWidgetUpdate, 0);
  objc_storeStrong(&self->_onWidgetUpdate, 0);
  objc_storeStrong(&self->_onInlineComplicationUpdate, 0);
  objc_storeStrong((id *)&self->_urlHandler, 0);
  objc_storeStrong((id *)&self->_applicationInformer, 0);
  objc_storeStrong((id *)&self->_widgetMetricsProvider, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_sidebarIconLayout, 0);
  objc_storeStrong((id *)&self->_iconLayout, 0);
  objc_storeStrong((id *)&self->_sidebarComplicationDescriptors, 0);
  objc_storeStrong((id *)&self->_graphicComplicationDescriptors, 0);
  objc_storeStrong((id *)&self->_landscapeInlineComplicationDescriptor, 0);
  objc_storeStrong((id *)&self->_inlineComplicationDescriptor, 0);
  objc_storeStrong((id *)&self->_widgetDescriptorProvider, 0);
  objc_storeStrong((id *)&self->_widgetHost, 0);
  objc_storeStrong((id *)&self->_wallpaperState, 0);
  objc_storeStrong((id *)&self->_wallpaperObserver, 0);
}

void __69__CSComplicationManager__openApplicationWithBundleIdentifier_action___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_1(&dword_1D0337000, a2, a3, "[%{public}@] Application launch from complication failed: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

@end
