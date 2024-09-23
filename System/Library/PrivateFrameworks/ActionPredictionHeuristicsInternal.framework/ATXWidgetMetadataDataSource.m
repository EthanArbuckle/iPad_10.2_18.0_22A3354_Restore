@implementation ATXWidgetMetadataDataSource

- (ATXWidgetMetadataDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXWidgetMetadataDataSource *v6;
  ATXWidgetMetadataDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXWidgetMetadataDataSource;
  v6 = -[ATXWidgetMetadataDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (void)fetchWidgetMetadataForAppBundleIds:(id)a3 callback:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, void *);
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void (**v34)(id, _QWORD, void *);
  id v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
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
  id v57;
  _QWORD v58[2];
  _QWORD v59[2];
  uint8_t buf[4];
  void *v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = (void *)MEMORY[0x1CAA46CBC]();
  if (v5)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CF8E58]);
    v57 = 0;
    objc_msgSend(v8, "loadHomeScreenAndTodayPageConfigurationsWithError:", &v57);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v57;
    v11 = v10;
    if (v9)
    {
      v30 = v10;
      v32 = v8;
      v33 = v7;
      v34 = v6;
      v35 = v5;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v5);
      v44 = (void *)objc_opt_new();
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v31 = v9;
      obj = v9;
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
      if (!v38)
        goto LABEL_39;
      v37 = *(_QWORD *)v54;
      while (1)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v54 != v37)
            objc_enumerationMutation(obj);
          v39 = v13;
          v14 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v13);
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          objc_msgSend(v14, "stacks", v30);
          v40 = (id)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
          if (v42)
          {
            v41 = *(_QWORD *)v50;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v50 != v41)
                  objc_enumerationMutation(v40);
                v43 = v15;
                v16 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v15);
                v45 = 0u;
                v46 = 0u;
                v47 = 0u;
                v48 = 0u;
                objc_msgSend(v16, "widgets");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
                if (v18)
                {
                  v19 = v18;
                  v20 = *(_QWORD *)v46;
                  do
                  {
                    for (i = 0; i != v19; ++i)
                    {
                      if (*(_QWORD *)v46 != v20)
                        objc_enumerationMutation(v17);
                      v22 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
                      objc_msgSend(v22, "appBundleId");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v23)
                      {
                        objc_msgSend(v22, "widgetKind");
                        v24 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v24)
                        {
                          objc_msgSend(v22, "extensionBundleId");
                          v25 = objc_claimAutoreleasedReturnValue();
                          if (v25)
                          {
                            if (objc_msgSend(v12, "containsObject:", v23))
                            {
                              v58[0] = CFSTR("widgetBundleId");
                              v58[1] = CFSTR("widgetKind");
                              v59[0] = v25;
                              v59[1] = v24;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
                              v26 = objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v44, "objectForKeyedSubscript:", v23);
                              v27 = (void *)objc_claimAutoreleasedReturnValue();
                              if (!v27)
                              {
                                v27 = (void *)objc_opt_new();
                                objc_msgSend(v44, "setObject:forKeyedSubscript:", v27, v23);
                              }
                              if ((objc_msgSend(v27, "containsObject:", v26) & 1) == 0)
                                objc_msgSend(v27, "addObject:", v26);

                              goto LABEL_31;
                            }
                          }
                          else
                          {
                            __atxlog_handle_heuristic();
                            v26 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)buf = 138412290;
                              v61 = v22;
                              _os_log_error_impl(&dword_1C99DF000, v26, OS_LOG_TYPE_ERROR, "ATXWidgetMetadataDataSource: no widget bundle id for widget: %@", buf, 0xCu);
                            }
LABEL_31:

                          }
                        }
                        else
                        {
                          __atxlog_handle_heuristic();
                          v25 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412290;
                            v61 = v22;
                            _os_log_error_impl(&dword_1C99DF000, v25, OS_LOG_TYPE_ERROR, "ATXWidgetMetadataDataSource: no widget kind for widget: %@", buf, 0xCu);
                          }
                        }

                      }
                    }
                    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
                  }
                  while (v19);
                }

                v15 = v43 + 1;
              }
              while (v43 + 1 != v42);
              v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
            }
            while (v42);
          }

          v13 = v39 + 1;
        }
        while (v39 + 1 != v38);
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
        if (!v38)
        {
LABEL_39:

          v6 = v34;
          ((void (**)(id, void *, void *))v34)[2](v34, v44, 0);

          v5 = v35;
          v8 = v32;
          v7 = v33;
          v11 = v30;
          v9 = v31;
          goto LABEL_46;
        }
      }
    }
    __atxlog_handle_heuristic();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[ATXWidgetMetadataDataSource fetchWidgetMetadataForAppBundleIds:callback:].cold.2((uint64_t)v11, v29);

    v6[2](v6, 0, v11);
LABEL_46:

  }
  else
  {
    __atxlog_handle_heuristic();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[ATXWidgetMetadataDataSource fetchWidgetMetadataForAppBundleIds:callback:].cold.1(v28);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v8);
  }

  objc_autoreleasePoolPop(v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)fetchWidgetMetadataForAppBundleIds:(os_log_t)log callback:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C99DF000, log, OS_LOG_TYPE_ERROR, "ATXWidgetMetadataDataSource: no bundle ids passed in", v1, 2u);
}

- (void)fetchWidgetMetadataForAppBundleIds:(uint64_t)a1 callback:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_ERROR, "ATXWidgetMetadataDataSource: could not fetch page configs with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
