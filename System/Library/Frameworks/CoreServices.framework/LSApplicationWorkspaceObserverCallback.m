@implementation LSApplicationWorkspaceObserverCallback

void __LSApplicationWorkspaceObserverCallback_block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  char **v5;
  const char *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _LSContextInvalidate();
  v2 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.lsinstallprogress.networkusagechanged"));
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("usingNetwork"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "networkUsageChanged:", objc_msgSend(v14, "BOOLValue"));

    return;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("LSApplicationProxiesList"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.lsinstallprogress.appcontrols.cancel")) & 1) != 0)
  {
    v5 = &selRef_applicationInstallsDidCancel_;
LABEL_11:
    v6 = *v5;
    if (*v5 && objc_msgSend(v4, "count") && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = v4;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v8);
            +[LSApplicationProxy applicationProxyForIdentifier:placeholder:](LSApplicationProxy, "applicationProxyForIdentifier:placeholder:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v13);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v10);
      }

      objc_msgSend(*(id *)(a1 + 48), v6, v7);
    }
    goto LABEL_22;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.lsinstallprogress.appcontrols.pause")) & 1) != 0)
  {
    v5 = &selRef_applicationInstallsDidPause_;
    goto LABEL_11;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.lsinstallprogress.appcontrols.prioritize")) & 1) != 0)
  {
    v5 = &selRef_applicationInstallsDidPrioritize_;
    goto LABEL_11;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.lsinstallprogress.appcontrols.resume")))
  {
    v5 = &selRef_applicationInstallsDidResume_;
    goto LABEL_11;
  }
LABEL_22:

}

@end
