@implementation DKAppInstallMonitor

void __58___DKAppInstallMonitor__applicationsDidChange_didInstall___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void (**v43)(_QWORD, _QWORD);
  void *v44;
  void *v45;
  void (**v46)(_QWORD, _QWORD);
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  id obj;
  id obja;
  id WeakRetained;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v3 = *(id *)(a1 + 32);
  obj = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
  v4 = 0;
  if (obj)
  {
    v5 = *(_QWORD *)v66;
    v51 = v3;
    v52 = *(_QWORD *)v66;
    v48 = v2;
    do
    {
      for (i = 0; i != obj; i = (char *)i + 1)
      {
        if (*(_QWORD *)v66 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "applicationType");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("System")) & 1) != 0)
        {

        }
        else
        {
          v9 = objc_msgSend(v7, "isAppUpdate");

          if ((v9 & 1) != 0)
            continue;
        }
        objc_msgSend((id)objc_opt_class(), "_eventWithAppProxy:didInstall:", v7, *(unsigned __int8 *)(a1 + 48));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v2, "addObject:", v10);
        if (!*(_BYTE *)(a1 + 48))
        {
          +[_DKAppInstallMonitor _identifierFromProxy:](_DKAppInstallMonitor, "_identifierFromProxy:", v7);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            if (!v4)
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
              v4 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v7, "correspondingApplicationRecord");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "appClipMetadata");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v53 = v13;
            if (v13)
            {
              v63 = 0u;
              v64 = 0u;
              v61 = 0u;
              v62 = 0u;
              objc_msgSend(v13, "parentApplicationIdentifiers");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
              if (v15)
              {
                v16 = v15;
                v49 = v4;
                v17 = *(_QWORD *)v62;
                while (2)
                {
                  for (j = 0; j != v16; ++j)
                  {
                    if (*(_QWORD *)v62 != v17)
                      objc_enumerationMutation(v14);
                    objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithApplicationIdentifier:error:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j), 0);
                    v19 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v19)
                    {
                      LODWORD(v13) = 1;
                      goto LABEL_26;
                    }
                  }
                  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
                  if (v16)
                    continue;
                  break;
                }
                LODWORD(v13) = 0;
LABEL_26:
                v4 = v49;
                v3 = v51;
              }
              else
              {
                LODWORD(v13) = 0;
              }

            }
            v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            objc_msgSend(MEMORY[0x24BE1B0F0], "deletionPredicateForBundleID:", v11);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v21);

            if ((_DWORD)v13)
            {
              v22 = (void *)MEMORY[0x24BDD14C0];
              v23 = (void *)MEMORY[0x24BE1B0F8];
              objc_msgSend(MEMORY[0x24BE1B130], "appUsageStream");
              v24 = v4;
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "name");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "predicateForEventsWithStreamName:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "notPredicateWithSubpredicate:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              v3 = v51;
              v4 = v24;
              v2 = v48;
              objc_msgSend(v20, "addObject:", v28);

            }
            objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v20);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v29);
            objc_msgSend(MEMORY[0x24BE0CBE8], "pruneWithUninstalledBundleIdentifier:", v11);

            v5 = v52;
          }

        }
      }
      obj = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    }
    while (obj);
  }
  v50 = v4;

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obja = v2;
  v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v58;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v58 != v32)
          objc_enumerationMutation(obja);
        v34 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * k);
        v35 = objc_alloc(MEMORY[0x24BE0C290]);
        objc_msgSend(v34, "stringValue");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "metadata");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE1B008], "isInstall");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(v35, "initWithBundleID:isInstall:", v36, v39);

        objc_msgSend(WeakRetained, "source");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "sendEvent:", v40);

      }
      v31 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    }
    while (v31);
  }

  if (objc_msgSend(obja, "count"))
  {
    objc_msgSend(WeakRetained, "historicalHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(WeakRetained, "historicalHandler");
      v43 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v43)[2](v43, obja);

    }
  }
  if (v50)
  {
    if (objc_msgSend(v50, "count"))
    {
      objc_msgSend(WeakRetained, "historicalDeletingHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        objc_msgSend(MEMORY[0x24BDD14C0], "orPredicateWithSubpredicates:", v50);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "historicalDeletingHandler");
        v46 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v46)[2](v46, v45);

      }
    }
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setLastUpdate:", v47);

}

@end
