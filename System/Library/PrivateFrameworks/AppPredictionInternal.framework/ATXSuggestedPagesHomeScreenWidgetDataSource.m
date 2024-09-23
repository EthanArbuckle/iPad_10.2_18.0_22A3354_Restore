@implementation ATXSuggestedPagesHomeScreenWidgetDataSource

- (id)provideWidgetsForPageType:(int64_t)a3 environment:(id)a4
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  unint64_t v25;
  BOOL v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  id v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
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
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v5 = objc_alloc_init(MEMORY[0x1E0CF8E58]);
  objc_msgSend(v5, "loadHomeScreenPageConfigurationsIncludingHidden:error:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v34 = v5;
    v43 = (id)objc_opt_new();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v33 = v6;
    obj = v6;
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    if (v37)
    {
      v36 = *(_QWORD *)v54;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v54 != v36)
            objc_enumerationMutation(obj);
          v38 = v7;
          v8 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v7);
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          objc_msgSend(v8, "stacks", v33);
          v39 = (id)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
          if (v41)
          {
            v40 = *(_QWORD *)v50;
            do
            {
              v9 = 0;
              do
              {
                if (*(_QWORD *)v50 != v40)
                  objc_enumerationMutation(v39);
                v42 = v9;
                v10 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v9);
                v45 = 0u;
                v46 = 0u;
                v47 = 0u;
                v48 = 0u;
                objc_msgSend(v10, "widgets");
                v44 = (id)objc_claimAutoreleasedReturnValue();
                v11 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
                if (v11)
                {
                  v12 = v11;
                  v13 = *(_QWORD *)v46;
                  do
                  {
                    for (i = 0; i != v12; ++i)
                    {
                      if (*(_QWORD *)v46 != v13)
                        objc_enumerationMutation(v44);
                      v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
                      objc_msgSend(v15, "appBundleId");
                      v16 = (void *)objc_claimAutoreleasedReturnValue();
                      v17 = objc_msgSend(v16, "length");

                      if (v17)
                      {
                        objc_msgSend(v15, "appBundleId");
                        v18 = (void *)objc_claimAutoreleasedReturnValue();
                        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E50]), "initWithBundleId:", v18);
                        objc_msgSend(v4, "suggestedApps");
                        v20 = (void *)objc_claimAutoreleasedReturnValue();
                        v21 = objc_msgSend(v20, "containsObject:", v19);

                        if (v21)
                        {
                          objc_msgSend(v4, "appLaunchCounts");
                          v22 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v22, "objectForKeyedSubscript:", v18);
                          v23 = (void *)objc_claimAutoreleasedReturnValue();
                          v24 = v4;
                          v25 = objc_msgSend(v23, "rawLaunchCount");

                          v26 = v25 >= 0xA;
                          v4 = v24;
                          if (v26)
                          {
                            v27 = objc_alloc_init(MEMORY[0x1E0CF8EB0]);
                            objc_msgSend(v15, "intent");
                            v28 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v27, "setIntent:", v28);

                            objc_msgSend(v27, "setSize:", objc_msgSend(v15, "size"));
                            objc_msgSend(v15, "widgetKind");
                            v29 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v27, "setWidgetKind:", v29);

                            objc_msgSend(v15, "extensionBundleId");
                            v30 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v27, "setExtensionBundleId:", v30);

                            v4 = v24;
                            objc_msgSend(v15, "appBundleId");
                            v31 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v27, "setAppBundleId:", v31);

                            objc_msgSend(v27, "setScore:", 0.25);
                            objc_msgSend(v27, "setPredictionSource:", CFSTR("Home Screen"));
                            objc_msgSend(v43, "addObject:", v27);

                          }
                        }

                      }
                    }
                    v12 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
                  }
                  while (v12);
                }

                v9 = v42 + 1;
              }
              while (v42 + 1 != v41);
              v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
            }
            while (v41);
          }

          v7 = v38 + 1;
        }
        while (v38 + 1 != v37);
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      }
      while (v37);
    }

    v6 = v33;
    v5 = v34;
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

@end
