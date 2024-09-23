@implementation ATXHomeScreenConfigurationDiffer

- (ATXHomeScreenConfigurationDiffer)initWithPreviousConfigurations:(id)a3 currentConfigurations:(id)a4
{
  id v6;
  id v7;
  ATXHomeScreenConfigurationDiffer *v8;
  ATXHomeScreenConfigurationComponents *v9;
  ATXHomeScreenConfigurationComponents *previousComponents;
  ATXHomeScreenConfigurationComponents *v11;
  ATXHomeScreenConfigurationComponents *currentComponents;
  ATXHomeScreenConfigurationComponentsDiffer *v13;
  ATXHomeScreenConfigurationComponentsDiffer *componentsDiffer;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXHomeScreenConfigurationDiffer;
  v8 = -[ATXHomeScreenConfigurationDiffer init](&v16, sel_init);
  if (v8)
  {
    v9 = -[ATXHomeScreenConfigurationComponents initWithConfigurations:]([ATXHomeScreenConfigurationComponents alloc], "initWithConfigurations:", v6);
    previousComponents = v8->_previousComponents;
    v8->_previousComponents = v9;

    v11 = -[ATXHomeScreenConfigurationComponents initWithConfigurations:]([ATXHomeScreenConfigurationComponents alloc], "initWithConfigurations:", v7);
    currentComponents = v8->_currentComponents;
    v8->_currentComponents = v11;

    v13 = -[ATXHomeScreenConfigurationComponentsDiffer initWithPreviousComponents:currentComponents:]([ATXHomeScreenConfigurationComponentsDiffer alloc], "initWithPreviousComponents:currentComponents:", v8->_previousComponents, v8->_currentComponents);
    componentsDiffer = v8->_componentsDiffer;
    v8->_componentsDiffer = v13;

    -[ATXHomeScreenConfigurationDiffer _calculatePinnedWidgetChanges](v8, "_calculatePinnedWidgetChanges");
    -[ATXHomeScreenConfigurationDiffer _calculateStackedWidgetChanges](v8, "_calculateStackedWidgetChanges");
  }

  return v8;
}

- (void)_calculatePinnedWidgetChanges
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  uint64_t v18;
  NSArray *addedPinnedWidgets;
  uint64_t v20;
  NSArray *deletedPinnedWidgets;
  uint64_t v22;
  NSArray *configuredPinnedWidgets;
  ATXHomeScreenConfigurationDiffer *v24;
  id obj;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E10]);
  -[ATXHomeScreenConfigurationComponentsDiffer addedPinnedWidgets](self->_componentsDiffer, "addedPinnedWidgets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  v6 = objc_alloc(MEMORY[0x1E0C99E10]);
  v24 = self;
  -[ATXHomeScreenConfigurationComponentsDiffer deletedPinnedWidgets](self->_componentsDiffer, "deletedPinnedWidgets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v6, "initWithArray:", v7);

  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v5;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v28)
  {
    v26 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v34 != v26)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v12 = v27;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v30;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v30 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
              if (+[ATXHomeScreenConfigurationDiffer _widget:hasSamePersonalityAsOtherWidget:](ATXHomeScreenConfigurationDiffer, "_widget:hasSamePersonalityAsOtherWidget:", v17, v11)&& (objc_msgSend(v8, "containsObject:", v11) & 1) == 0&& (objc_msgSend(v9, "containsObject:", v17) & 1) == 0)
              {
                objc_msgSend(v8, "addObject:", v11);
                objc_msgSend(v9, "addObject:", v17);
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v14);
        }

      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v28);
  }

  objc_msgSend(obj, "minusOrderedSet:", v8);
  objc_msgSend(v27, "minusOrderedSet:", v9);
  objc_msgSend(obj, "array");
  v18 = objc_claimAutoreleasedReturnValue();
  addedPinnedWidgets = v24->_addedPinnedWidgets;
  v24->_addedPinnedWidgets = (NSArray *)v18;

  objc_msgSend(v27, "array");
  v20 = objc_claimAutoreleasedReturnValue();
  deletedPinnedWidgets = v24->_deletedPinnedWidgets;
  v24->_deletedPinnedWidgets = (NSArray *)v20;

  objc_msgSend(v8, "array");
  v22 = objc_claimAutoreleasedReturnValue();
  configuredPinnedWidgets = v24->_configuredPinnedWidgets;
  v24->_configuredPinnedWidgets = (NSArray *)v22;

}

- (void)_calculateStackedWidgetChanges
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  uint64_t k;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  uint64_t v30;
  uint64_t v31;
  NSArray *widgetsAddedToStacksByUser;
  uint64_t v33;
  NSArray *widgetsDeletedFromStacksByUser;
  uint64_t v35;
  NSArray *configuredStackedWidgets;
  ATXHomeScreenConfigurationDiffer *v37;
  id obj;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E10]);
  -[ATXHomeScreenConfigurationComponentsDiffer userAddedStackedWidgets](self->_componentsDiffer, "userAddedStackedWidgets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  v6 = objc_alloc(MEMORY[0x1E0C99E10]);
  -[ATXHomeScreenConfigurationComponentsDiffer userDeletedStackedWidgets](self->_componentsDiffer, "userDeletedStackedWidgets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  -[ATXHomeScreenConfigurationDiffer addedStacks](self, "addedStacks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v55 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "widgets");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "removeObjectsInArray:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
    }
    while (v11);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  -[ATXHomeScreenConfigurationDiffer deletedStacks](self, "deletedStacks");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v51 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * j), "widgets");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObjectsInArray:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    }
    while (v17);
  }
  v37 = self;

  v21 = (void *)objc_opt_new();
  v22 = (void *)objc_opt_new();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v5;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
  if (v41)
  {
    v39 = *(_QWORD *)v47;
    v40 = v8;
    do
    {
      for (k = 0; k != v41; ++k)
      {
        if (*(_QWORD *)v47 != v39)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * k);
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v25 = v8;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v43;
          do
          {
            for (m = 0; m != v27; ++m)
            {
              if (*(_QWORD *)v43 != v28)
                objc_enumerationMutation(v25);
              v30 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * m);
              if (+[ATXHomeScreenConfigurationDiffer _widget:hasSamePersonalityAsOtherWidget:](ATXHomeScreenConfigurationDiffer, "_widget:hasSamePersonalityAsOtherWidget:", v30, v24)&& (objc_msgSend(v21, "containsObject:", v24) & 1) == 0&& (objc_msgSend(v22, "containsObject:", v30) & 1) == 0)
              {
                objc_msgSend(v21, "addObject:", v24);
                objc_msgSend(v22, "addObject:", v30);
              }
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
          }
          while (v27);
        }

        v8 = v40;
      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
    }
    while (v41);
  }

  objc_msgSend(obj, "minusOrderedSet:", v21);
  objc_msgSend(v8, "minusOrderedSet:", v22);
  objc_msgSend(obj, "array");
  v31 = objc_claimAutoreleasedReturnValue();
  widgetsAddedToStacksByUser = v37->_widgetsAddedToStacksByUser;
  v37->_widgetsAddedToStacksByUser = (NSArray *)v31;

  objc_msgSend(v8, "array");
  v33 = objc_claimAutoreleasedReturnValue();
  widgetsDeletedFromStacksByUser = v37->_widgetsDeletedFromStacksByUser;
  v37->_widgetsDeletedFromStacksByUser = (NSArray *)v33;

  objc_msgSend(v21, "array");
  v35 = objc_claimAutoreleasedReturnValue();
  configuredStackedWidgets = v37->_configuredStackedWidgets;
  v37->_configuredStackedWidgets = (NSArray *)v35;

}

- (NSArray)addedApps
{
  return -[ATXHomeScreenConfigurationComponentsDiffer addedApps](self->_componentsDiffer, "addedApps");
}

- (NSArray)removedApps
{
  return -[ATXHomeScreenConfigurationComponentsDiffer removedApps](self->_componentsDiffer, "removedApps");
}

- (NSArray)addedStacks
{
  return -[ATXHomeScreenConfigurationComponentsDiffer addedStacks](self->_componentsDiffer, "addedStacks");
}

- (NSArray)deletedStacks
{
  return -[ATXHomeScreenConfigurationComponentsDiffer deletedStacks](self->_componentsDiffer, "deletedStacks");
}

- (NSArray)suggestedWidgetsAddedPermanentlyByUser
{
  return -[ATXHomeScreenConfigurationComponentsDiffer userAddedPreviousSuggestedWidgets](self->_componentsDiffer, "userAddedPreviousSuggestedWidgets");
}

- (NSArray)suggestedWidgetsRemoved
{
  return -[ATXHomeScreenConfigurationComponentsDiffer deletedPreviousSuggestedWidgets](self->_componentsDiffer, "deletedPreviousSuggestedWidgets");
}

- (NSArray)configuredWidgets
{
  return -[NSArray arrayByAddingObjectsFromArray:](self->_configuredPinnedWidgets, "arrayByAddingObjectsFromArray:", self->_configuredStackedWidgets);
}

- (id)stackInPreviousConfigurationsForStackedWidget:(id)a3
{
  return -[ATXHomeScreenConfigurationComponents stackForStackedWidget:](self->_previousComponents, "stackForStackedWidget:", a3);
}

- (id)stackInCurrentConfigurationsForStackedWidget:(id)a3
{
  return -[ATXHomeScreenConfigurationComponents stackForStackedWidget:](self->_currentComponents, "stackForStackedWidget:", a3);
}

- (BOOL)currentConfigContainsWidgetWithBundleId:(id)a3 kind:(id)a4 size:(unint64_t)a5
{
  return -[ATXHomeScreenConfigurationComponents containsWidgetWithBundleId:kind:size:](self->_currentComponents, "containsWidgetWithBundleId:kind:size:", a3, a4, a5);
}

+ (BOOL)_widget:(id)a3 hasSamePersonalityAsOtherWidget:(id)a4
{
  id v5;
  id v6;
  ATXWidgetPersonality *v7;
  void *v8;
  void *v9;
  ATXWidgetPersonality *v10;
  ATXWidgetPersonality *v11;
  void *v12;
  void *v13;
  ATXWidgetPersonality *v14;

  v5 = a4;
  v6 = a3;
  v7 = [ATXWidgetPersonality alloc];
  objc_msgSend(v6, "extensionBundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "widgetKind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ATXWidgetPersonality initWithExtensionBundleId:kind:](v7, "initWithExtensionBundleId:kind:", v8, v9);
  v11 = [ATXWidgetPersonality alloc];
  objc_msgSend(v5, "extensionBundleId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widgetKind");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[ATXWidgetPersonality initWithExtensionBundleId:kind:](v11, "initWithExtensionBundleId:kind:", v12, v13);
  LOBYTE(v11) = -[ATXWidgetPersonality isEqual:](v10, "isEqual:", v14);

  return (char)v11;
}

- (NSArray)addedPinnedWidgets
{
  return self->_addedPinnedWidgets;
}

- (NSArray)deletedPinnedWidgets
{
  return self->_deletedPinnedWidgets;
}

- (NSArray)widgetsAddedToStacksByUser
{
  return self->_widgetsAddedToStacksByUser;
}

- (NSArray)widgetsDeletedFromStacksByUser
{
  return self->_widgetsDeletedFromStacksByUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetsDeletedFromStacksByUser, 0);
  objc_storeStrong((id *)&self->_widgetsAddedToStacksByUser, 0);
  objc_storeStrong((id *)&self->_deletedPinnedWidgets, 0);
  objc_storeStrong((id *)&self->_addedPinnedWidgets, 0);
  objc_storeStrong((id *)&self->_configuredStackedWidgets, 0);
  objc_storeStrong((id *)&self->_configuredPinnedWidgets, 0);
  objc_storeStrong((id *)&self->_componentsDiffer, 0);
  objc_storeStrong((id *)&self->_currentComponents, 0);
  objc_storeStrong((id *)&self->_previousComponents, 0);
}

@end
