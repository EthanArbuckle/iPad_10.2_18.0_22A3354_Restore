@implementation CPAnalyticsDestinationsRegistry

- (CPAnalyticsDestinationsRegistry)init
{
  CPAnalyticsDestinationsRegistry *v2;
  NSMutableArray *v3;
  NSMutableArray *destinations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPAnalyticsDestinationsRegistry;
  v2 = -[CPAnalyticsDestinationsRegistry init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    destinations = v2->_destinations;
    v2->_destinations = v3;

  }
  return v2;
}

- (void)setupWithConfigurationAtURL:(id)a3 cpAnalyticsInstance:(id)a4
{
  id v6;
  NSMutableArray *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self->_destinations;
  objc_sync_enter(v7);
  -[NSMutableArray removeAllObjects](self->_destinations, "removeAllObjects");
  objc_sync_exit(v7);

  -[CPAnalyticsDestinationsRegistry updateWithConfigurationAtURL:cpAnalyticsInstance:](self, "updateWithConfigurationAtURL:cpAnalyticsInstance:", v8, v6);
}

- (void)updateWithConfigurationAtURL:(id)a3 cpAnalyticsInstance:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[CPAnalyticsDestinationsRegistry _readConfiguration:](self, "_readConfiguration:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CPAnalyticsDestinationsRegistry _parseDestinationsFromConfig:cpAnalyticsInstance:](self, "_parseDestinationsFromConfig:cpAnalyticsInstance:", v7, v6);

}

- (void)addDestination:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self->_destinations;
    objc_sync_enter(v5);
    -[NSMutableArray addObject:](self->_destinations, "addObject:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (void)removeDestination:(id)a3
{
  NSMutableArray *v4;
  id v5;

  v5 = a3;
  v4 = self->_destinations;
  objc_sync_enter(v4);
  -[NSMutableArray removeObject:](self->_destinations, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)sendToAllDestinations:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_destinations;
  objc_sync_enter(v5);
  -[CPAnalyticsDestinationsRegistry destinations](self, "destinations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_sync_exit(v5);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "processEvent:", v4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)removePhotoLibraryFromDestinations
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = self->_destinations;
  objc_sync_enter(v3);
  -[CPAnalyticsDestinationsRegistry destinations](self, "destinations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_sync_exit(v3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "setPhotoLibrary:", 0, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (NSArray)destinations
{
  return (NSArray *)self->_destinations;
}

- (id)_readConfiguration:(id)a3
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v9;
  uint8_t buf[4];
  NSObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v9 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v3, 0, &v9);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v9;
      if (v5)
      {
        CPAnalyticsLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v11 = v5;
          _os_log_error_impl(&dword_20AB22000, v6, OS_LOG_TYPE_ERROR, "Error parsing CPAnalytics config file: %@", buf, 0xCu);
        }

        v7 = 0;
      }
      else
      {
        v7 = v4;
      }

    }
    else
    {
      CPAnalyticsLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20AB22000, v5, OS_LOG_TYPE_ERROR, "Error reading CPAnalytics config file", buf, 2u);
      }
      v7 = 0;
    }

  }
  else
  {
    CPAnalyticsLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20AB22000, v3, OS_LOG_TYPE_ERROR, "Error reading CPAnalytics config: nil", buf, 2u);
    }
    v7 = 0;
  }

  return v7;
}

- (void)_parseDestinationsFromConfig:(id)a3 cpAnalyticsInstance:(id)a4
{
  id v5;
  void *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v30 = a4;
  v28 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("destinations"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v27;
    if (v27)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = self->_destinations;
        objc_sync_enter(v7);
        -[CPAnalyticsDestinationsRegistry destinations](self, "destinations");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v8, "copy");

        objc_sync_exit(v7);
        -[CPAnalyticsDestinationsRegistry _destinationClassMap](self, "_destinationClassMap");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v9 = v27;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        if (!v10)
          goto LABEL_38;
        v11 = *(_QWORD *)v39;
        while (1)
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v39 != v11)
              objc_enumerationMutation(v9);
            v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v13, "objectForKey:", CFSTR("enabled"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "BOOLValue");

              if (v15)
              {
                objc_msgSend(v13, "objectForKey:", CFSTR("name"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "objectForKey:", CFSTR("config"));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = 0;
                v35 = &v34;
                v36 = 0x2050000000;
                v37 = 0;
                v37 = objc_msgSend(v32, "objectForKey:", v16);
                if (!v35[3])
                {
                  CPAnalyticsLog();
                  v20 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v43 = v16;
                    _os_log_error_impl(&dword_20AB22000, v20, OS_LOG_TYPE_ERROR, "Error parsing CPAnalytics config file: destination name '%@' not found in mapping.", buf, 0xCu);
                  }
                  goto LABEL_32;
                }
                v33[0] = MEMORY[0x24BDAC760];
                v33[1] = 3221225472;
                v33[2] = __84__CPAnalyticsDestinationsRegistry__parseDestinationsFromConfig_cpAnalyticsInstance___block_invoke;
                v33[3] = &unk_24C36E780;
                v33[4] = &v34;
                v18 = objc_msgSend(v31, "indexOfObjectPassingTest:", v33);
                if (v18 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  v19 = objc_msgSend(objc_alloc((Class)v35[3]), "initWithConfig:cpAnalyticsInstance:", v17, v30);
                  v20 = v19;
                  if (v19)
                  {
                    if ((-[NSObject conformsToProtocol:](v19, "conformsToProtocol:", &unk_2546169E8) & 1) != 0)
                    {
                      if ((objc_opt_respondsToSelector() & 1) != 0
                        && -[NSObject disabled](v20, "disabled"))
                      {
                        CPAnalyticsLog();
                        v21 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                        {
                          v22 = (void *)objc_opt_class();
                          *(_DWORD *)buf = 138412290;
                          v43 = v22;
                          v26 = v22;
                          _os_log_impl(&dword_20AB22000, v21, OS_LOG_TYPE_INFO, "Destination %@ class is disabled.", buf, 0xCu);

                        }
                        goto LABEL_26;
                      }
                      -[CPAnalyticsDestinationsRegistry addDestination:](self, "addDestination:", v20, v26);
LABEL_32:

                      _Block_object_dispose(&v34, 8);
                      goto LABEL_33;
                    }
                    CPAnalyticsLog();
                    v21 = objc_claimAutoreleasedReturnValue();
                    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                      goto LABEL_26;
                    *(_DWORD *)buf = 138412290;
                    v43 = v16;
                    v23 = v21;
                    v24 = "Destination %@ class does not conform to CPAnalyticsDestination protocol.";
                  }
                  else
                  {
                    CPAnalyticsLog();
                    v21 = objc_claimAutoreleasedReturnValue();
                    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                      goto LABEL_26;
                    *(_DWORD *)buf = 138412290;
                    v43 = v16;
                    v23 = v21;
                    v24 = "Error initializing %@ destination in CPAnalytics";
                  }
                  _os_log_error_impl(&dword_20AB22000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0xCu);
                  goto LABEL_26;
                }
                objc_msgSend(v31, "objectAtIndexedSubscript:", v18);
                v20 = objc_claimAutoreleasedReturnValue();
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  -[NSObject updateWithConfig:](v20, "updateWithConfig:", v17);
                  CPAnalyticsLog();
                  v21 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v43 = v16;
                    _os_log_impl(&dword_20AB22000, v21, OS_LOG_TYPE_INFO, "Updated %@ destination", buf, 0xCu);
                  }
                }
                else
                {
                  CPAnalyticsLog();
                  v21 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v43 = v16;
                    _os_log_error_impl(&dword_20AB22000, v21, OS_LOG_TYPE_ERROR, "Cannot update %@ destination. Missing updateWithConfig selector.", buf, 0xCu);
                  }
                }
LABEL_26:

                goto LABEL_32;
              }
            }
LABEL_33:
            ++v12;
          }
          while (v10 != v12);
          v25 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
          v10 = v25;
          if (!v25)
          {
LABEL_38:

            v6 = v27;
            break;
          }
        }
      }
    }

  }
}

- (id)_destinationClassMap
{
  _QWORD v3[8];
  _QWORD v4[9];

  v4[8] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("devLogging");
  v4[0] = objc_opt_class();
  v3[1] = CFSTR("metricsDestination");
  v4[1] = objc_opt_class();
  v3[2] = CFSTR("signpost");
  v4[2] = objc_opt_class();
  v3[3] = CFSTR("appState");
  v4[3] = objc_opt_class();
  v3[4] = CFSTR("knowledgeStore");
  v4[4] = objc_opt_class();
  v3[5] = CFSTR("interval");
  v4[5] = objc_opt_class();
  v3[6] = CFSTR("log");
  v4[6] = objc_opt_class();
  v3[7] = CFSTR("biome");
  v4[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinations, 0);
}

uint64_t __84__CPAnalyticsDestinationsRegistry__parseDestinationsFromConfig_cpAnalyticsInstance___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end
