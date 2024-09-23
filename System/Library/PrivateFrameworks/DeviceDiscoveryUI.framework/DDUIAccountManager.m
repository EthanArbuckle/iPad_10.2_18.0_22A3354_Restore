@implementation DDUIAccountManager

void __58___DDUIAccountManager_altDsidForiCloudAccount_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "iCloudToAltDSIDDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __65___DDUIAccountManager_nameComponentsForiCloudAccount_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "iCloudToNameComponentsDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __68___DDUIAccountManager__updateMemberDataForiCloudAccount_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  if (a2)
  {
    v3 = a2;
    objc_msgSend(v3, "altDSID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "iCloudToAltDSIDDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 32));

    v11 = objc_alloc_init(MEMORY[0x24BDD1730]);
    objc_msgSend(v3, "firstName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setGivenName:", v7);

    objc_msgSend(v3, "lastName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setFamilyName:", v8);
    v9 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v9, "iCloudToNameComponentsDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *(_QWORD *)(a1 + 32));

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __69___DDUIAccountManager__findMemberForiCloudAccount_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create((const char *)*MEMORY[0x24BE2BF68], "core");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __69___DDUIAccountManager__findMemberForiCloudAccount_completionHandler___block_invoke_cold_1((uint64_t)v6, v7);

    objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v5, "members", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "appleID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(a1 + 40));

        if (v14)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

          goto LABEL_15;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_15:

}

void __69___DDUIAccountManager__findMemberForiCloudAccount_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_23A3B5000, a2, OS_LOG_TYPE_ERROR, "There was an error fetching from the family circle %@", (uint8_t *)&v2, 0xCu);
}

@end
