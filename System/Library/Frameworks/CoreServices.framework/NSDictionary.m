@implementation NSDictionary

void __91__NSDictionary_LSPluginSDKResolutionAdditions__ls_resolvePlugInKitInfoPlistWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v15);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = objc_msgSend(v15, "isEqualToString:", CFSTR("CleanTimeout"));

    if (!v8)
    {
      if (objc_msgSend(v15, "isEqualToString:", CFSTR("Shared")))
      {
        v9 = (void *)MEMORY[0x1E0C99E20];
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("Shared"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setWithArray:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Shared"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObjectsFromArray:", v12);

        objc_msgSend(v11, "allObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, CFSTR("Shared"));

      }
      else
      {
        if (!_NSIsNSDictionary())
          goto LABEL_9;
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "ls_resolvePlugInKitInfoPlistWithDictionary:", v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, v15);

      }
      goto LABEL_9;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v15);
LABEL_9:

}

void __52__NSDictionary_LSPluginQueryAdditions__ls_hashQuery__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = objc_msgSend(v7, "hash");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) *= objc_msgSend(v5, "hash") + v6;

}

@end
