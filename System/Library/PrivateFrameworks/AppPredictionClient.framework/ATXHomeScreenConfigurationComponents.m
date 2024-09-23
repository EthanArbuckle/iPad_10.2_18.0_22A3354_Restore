@implementation ATXHomeScreenConfigurationComponents

- (ATXHomeScreenConfigurationComponents)initWithConfigurations:(id)a3
{
  id v4;
  ATXHomeScreenConfigurationComponents *v5;
  uint64_t v6;
  NSMutableDictionary *stackForStackedWidgetIdDictionary;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  NSMutableDictionary *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  uint64_t v40;
  NSArray *stackedWidgets;
  uint64_t v42;
  NSArray *pinnedWidgets;
  uint64_t v44;
  NSArray *stacks;
  uint64_t v46;
  NSArray *apps;
  id v49;
  id obj;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[5];
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  objc_super v80;
  uint8_t v81[128];
  uint8_t buf[4];
  void *v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v80.receiver = self;
  v80.super_class = (Class)ATXHomeScreenConfigurationComponents;
  v5 = -[ATXHomeScreenConfigurationComponents init](&v80, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    stackForStackedWidgetIdDictionary = v5->_stackForStackedWidgetIdDictionary;
    v5->_stackForStackedWidgetIdDictionary = (NSMutableDictionary *)v6;

    v52 = (void *)objc_opt_new();
    v8 = (void *)objc_opt_new();
    v9 = (void *)objc_opt_new();
    v57 = (void *)objc_opt_new();
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v49 = v4;
    obj = v4;
    v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
    if (v53)
    {
      v51 = *(_QWORD *)v77;
      v56 = v8;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v77 != v51)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v10);
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          v54 = v10;
          v55 = v11;
          objc_msgSend(v11, "stacks");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v73;
            v58 = *(_QWORD *)v73;
            v59 = v12;
            do
            {
              v16 = 0;
              v60 = v14;
              do
              {
                if (*(_QWORD *)v73 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v16);
                objc_msgSend(v17, "widgets");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "count");

                objc_msgSend(v17, "widgets");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = v20;
                if (v19 == 1)
                {
                  objc_msgSend(v20, "firstObject");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v8, "addObject:", v22);
                }
                else
                {
                  v23 = objc_msgSend(v20, "count");

                  if (v23 >= 2)
                  {
                    v61 = v16;
                    v70 = 0u;
                    v71 = 0u;
                    v68 = 0u;
                    v69 = 0u;
                    objc_msgSend(v17, "widgets");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
                    if (v25)
                    {
                      v26 = v25;
                      v27 = *(_QWORD *)v69;
                      do
                      {
                        for (i = 0; i != v26; ++i)
                        {
                          if (*(_QWORD *)v69 != v27)
                            objc_enumerationMutation(v24);
                          v29 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
                          objc_msgSend(v9, "addObject:", v29);
                          objc_msgSend(v29, "widgetUniqueId");
                          v30 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v30)
                          {
                            v31 = v5->_stackForStackedWidgetIdDictionary;
                            objc_msgSend(v29, "widgetUniqueId");
                            v32 = objc_claimAutoreleasedReturnValue();
                            -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v17, v32);
                          }
                          else
                          {
                            __atxlog_handle_home_screen();
                            v32 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
                            {
                              *(_DWORD *)buf = 138412290;
                              v83 = v29;
                              _os_log_fault_impl(&dword_1A49EF000, v32, OS_LOG_TYPE_FAULT, "ATXHomeScreenConfigurationComponents: stacked widget has no widgetUniqueId: %@", buf, 0xCu);
                            }
                          }

                        }
                        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
                      }
                      while (v26);
                    }

                    objc_msgSend(v57, "addObject:", v17);
                    v8 = v56;
                    v15 = v58;
                    v12 = v59;
                    v14 = v60;
                    v16 = v61;
                  }
                }
                ++v16;
              }
              while (v16 != v14);
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
            }
            while (v14);
          }

          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          objc_msgSend(v55, "panels");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v65;
            do
            {
              for (j = 0; j != v35; ++j)
              {
                if (*(_QWORD *)v65 != v36)
                  objc_enumerationMutation(v33);
                objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "widgets");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "firstObject");
                v39 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v8, "addObject:", v39);
              }
              v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
            }
            while (v35);
          }

          v62[0] = MEMORY[0x1E0C809B0];
          v62[1] = 3221225472;
          v62[2] = __63__ATXHomeScreenConfigurationComponents_initWithConfigurations___block_invoke;
          v62[3] = &unk_1E4D5A510;
          v62[4] = v55;
          v63 = v52;
          objc_msgSend(v55, "enumerateApps:", v62);

          v10 = v54 + 1;
        }
        while (v54 + 1 != v53);
        v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
      }
      while (v53);
    }

    v40 = objc_msgSend(v9, "copy");
    stackedWidgets = v5->_stackedWidgets;
    v5->_stackedWidgets = (NSArray *)v40;

    v42 = objc_msgSend(v8, "copy");
    pinnedWidgets = v5->_pinnedWidgets;
    v5->_pinnedWidgets = (NSArray *)v42;

    v44 = objc_msgSend(v57, "copy");
    stacks = v5->_stacks;
    v5->_stacks = (NSArray *)v44;

    v46 = objc_msgSend(v52, "copy");
    apps = v5->_apps;
    v5->_apps = (NSArray *)v46;

    v4 = v49;
  }

  return v5;
}

void __63__ATXHomeScreenConfigurationComponents_initWithConfigurations___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setPage:", v3);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

- (id)stackForStackedWidget:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *stackForStackedWidgetIdDictionary;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "widgetUniqueId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    stackForStackedWidgetIdDictionary = self->_stackForStackedWidgetIdDictionary;
    objc_msgSend(v4, "widgetUniqueId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](stackForStackedWidgetIdDictionary, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)containsWidgetWithBundleId:(id)a3 kind:(id)a4 size:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[NSArray arrayByAddingObjectsFromArray:](self->_pinnedWidgets, "arrayByAddingObjectsFromArray:", self->_stackedWidgets);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v11)
    goto LABEL_14;
  v12 = v11;
  v13 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v22 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
      objc_msgSend(v15, "extensionBundleId", (_QWORD)v21);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v16, "isEqualToString:", v8))
        goto LABEL_11;
      objc_msgSend(v15, "widgetKind");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "isEqualToString:", v9) & 1) == 0)
      {

LABEL_11:
        continue;
      }
      v18 = objc_msgSend(v15, "size");

      if (v18 == a5)
      {
        v19 = 1;
        goto LABEL_15;
      }
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v12);
LABEL_14:
  v19 = 0;
LABEL_15:

  return v19;
}

- (NSArray)apps
{
  return self->_apps;
}

- (NSArray)pinnedWidgets
{
  return self->_pinnedWidgets;
}

- (NSArray)stackedWidgets
{
  return self->_stackedWidgets;
}

- (NSArray)stacks
{
  return self->_stacks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stacks, 0);
  objc_storeStrong((id *)&self->_stackedWidgets, 0);
  objc_storeStrong((id *)&self->_pinnedWidgets, 0);
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong((id *)&self->_stackForStackedWidgetIdDictionary, 0);
}

@end
