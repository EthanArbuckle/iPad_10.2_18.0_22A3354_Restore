@implementation GCControllerMetaDefaultsObserver

- (GCControllerMetaDefaultsObserver)init
{
  GCControllerMetaDefaultsObserver *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSUserDefaults *metaDefaults;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)GCControllerMetaDefaultsObserver;
  v2 = -[GCControllerMetaDefaultsObserver init](&v8, sel_init);
  if (v2)
  {
    +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("%@%@.%@"), &stru_24D2B85A8, CFSTR("com.apple.gamecontroller.settings"), CFSTR("meta"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    getGCSettingsLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v3;
      _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_INFO, "Initializing user defaults with suite = %@", buf, 0xCu);
    }

    v5 = objc_msgSend(objc_alloc((Class)&off_254DEF040), "initWithSuiteName:", v3);
    metaDefaults = v2->_metaDefaults;
    v2->_metaDefaults = (NSUserDefaults *)v5;

    -[NSUserDefaults addObserver:forKeyPath:options:context:](v2->_metaDefaults, "addObserver:forKeyPath:options:context:", v2, CFSTR("settingsExist"), 3, kGCSettingsContext);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v2->_metaDefaults, "addObserver:forKeyPath:options:context:", v2, CFSTR("controllerSettingsExist"), 3, kGCSettingsContext);

  }
  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  objc_super v13;
  _QWORD block[4];
  id v15;
  id v16;

  v10 = a3;
  v11 = a5;
  if ((void *)kGCSettingsContext == a6)
  {
    +[GCControllerSettings settingsDispatchQueue](GCControllerSettings, "settingsDispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__GCControllerMetaDefaultsObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_24D2B2B48;
    v15 = v10;
    v16 = v11;
    dispatch_sync(v12, block);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)GCControllerMetaDefaultsObserver;
    -[GCControllerMetaDefaultsObserver observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
  }

}

void __83__GCControllerMetaDefaultsObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;
  uint64_t m;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t n;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t ii;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t jj;
  void (**v37)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  uint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t k;
  uint64_t v66;
  void *v67;
  void (**v68)(_QWORD, _QWORD, _QWORD);
  id v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v2 = *(__CFString **)(a1 + 32);
  if (v2 == CFSTR("settingsExist"))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSNull null](&off_254E06A98, "null");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v39, "isEqual:", v41);

    if (v42)
    {
      +[NSDictionary dictionary](&off_254DEBCC0, "dictionary");
      v43 = objc_claimAutoreleasedReturnValue();

      v39 = (void *)v43;
    }
    +[NSNull null](&off_254E06A98, "null");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v40, "isEqual:", v44);

    if (v45)
    {
      +[NSDictionary dictionary](&off_254DEBCC0, "dictionary");
      v46 = objc_claimAutoreleasedReturnValue();

      v40 = (void *)v46;
    }
    +[NSMutableArray array](&off_254DEBB20, "array");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    +[NSMutableArray array](&off_254DEBB20, "array");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v38 = v40;
    v48 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v100, v110, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v101;
      do
      {
        for (i = 0; i != v49; ++i)
        {
          if (*(_QWORD *)v101 != v50)
            objc_enumerationMutation(v38);
          v52 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * i);
          objc_msgSend(v39, "objectForKeyedSubscript:", v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v53)
            objc_msgSend(v11, "addObject:", v52);
        }
        v49 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v100, v110, 16);
      }
      while (v49);
    }

    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v54 = v39;
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v96, v109, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v97;
      do
      {
        for (j = 0; j != v56; ++j)
        {
          if (*(_QWORD *)v97 != v57)
            objc_enumerationMutation(v54);
          v59 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * j);
          objc_msgSend(v38, "objectForKeyedSubscript:", v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v60)
            objc_msgSend(v47, "addObject:", v59);
        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v96, v109, 16);
      }
      while (v56);
    }
    v71 = v54;

    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    +[GCControllerSettings settingsCustomizedChangedHandlers](GCControllerSettings, "settingsCustomizedChangedHandlers");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v92, v108, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v93;
      do
      {
        for (k = 0; k != v63; ++k)
        {
          if (*(_QWORD *)v93 != v64)
            objc_enumerationMutation(v61);
          v66 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * k);
          +[GCControllerSettings settingsCustomizedChangedHandlers](GCControllerSettings, "settingsCustomizedChangedHandlers");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "objectForKeyedSubscript:", v66);
          v68 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id, void *))v68)[2](v68, v11, v47);

        }
        v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v92, v108, 16);
      }
      while (v63);
    }

    v3 = v71;
  }
  else
  {
    if (v2 != CFSTR("controllerSettingsExist"))
      return;
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSNull null](&off_254E06A98, "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "isEqual:", v5);

    if (v6)
    {
      +[NSDictionary dictionary](&off_254DEBCC0, "dictionary");
      v7 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v7;
    }
    +[NSNull null](&off_254E06A98, "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "isEqual:", v8);

    if (v9)
    {
      +[NSDictionary dictionary](&off_254DEBCC0, "dictionary");
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v10;
    }
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v11 = v4;
    v73 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v88, v107, 16);
    if (v73)
    {
      v70 = v3;
      v72 = *(_QWORD *)v89;
      v69 = v11;
      do
      {
        for (m = 0; m != v73; ++m)
        {
          if (*(_QWORD *)v89 != v72)
            objc_enumerationMutation(v11);
          v13 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * m);
          +[GCControllerSettings controllerSettingsCustomizedChangedHandlers](GCControllerSettings, "controllerSettingsCustomizedChangedHandlers", v69);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v75 = m;
            objc_msgSend(v3, "objectForKeyedSubscript:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectForKeyedSubscript:", v13);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            +[NSMutableArray array](&off_254DEBB20, "array");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            +[NSMutableArray array](&off_254DEBB20, "array");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = 0u;
            v85 = 0u;
            v86 = 0u;
            v87 = 0u;
            v20 = v17;
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v84, v106, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v85;
              do
              {
                for (n = 0; n != v22; ++n)
                {
                  if (*(_QWORD *)v85 != v23)
                    objc_enumerationMutation(v20);
                  v25 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * n);
                  if ((objc_msgSend(v16, "containsObject:", v25) & 1) == 0)
                    objc_msgSend(v18, "addObject:", v25);
                }
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v84, v106, 16);
              }
              while (v22);
            }

            v82 = 0u;
            v83 = 0u;
            v80 = 0u;
            v81 = 0u;
            v26 = v16;
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v80, v105, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v81;
              do
              {
                for (ii = 0; ii != v28; ++ii)
                {
                  if (*(_QWORD *)v81 != v29)
                    objc_enumerationMutation(v26);
                  v31 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * ii);
                  if ((objc_msgSend(v20, "containsObject:", v31) & 1) == 0)
                    objc_msgSend(v19, "addObject:", v31);
                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v80, v105, 16);
              }
              while (v28);
            }

            v78 = 0u;
            v79 = 0u;
            v76 = 0u;
            v77 = 0u;
            v74 = v15;
            v32 = v15;
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v76, v104, 16);
            if (v33)
            {
              v34 = v33;
              v35 = *(_QWORD *)v77;
              do
              {
                for (jj = 0; jj != v34; ++jj)
                {
                  if (*(_QWORD *)v77 != v35)
                    objc_enumerationMutation(v32);
                  objc_msgSend(v32, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * jj));
                  v37 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                  ((void (**)(_QWORD, uint64_t, void *, void *))v37)[2](v37, v13, v18, v19);

                }
                v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v76, v104, 16);
              }
              while (v34);
            }

            v11 = v69;
            v3 = v70;
            v15 = v74;
            m = v75;
          }

        }
        v73 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v88, v107, 16);
      }
      while (v73);
    }
    v38 = v11;
  }

}

- (void)dealloc
{
  OUTLINED_FUNCTION_0_21(&dword_215181000, a2, a3, "Dealloc: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_20();
}

- (NSUserDefaults)metaDefaults
{
  return self->_metaDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaDefaults, 0);
}

@end
