@implementation CRKCardSectionViewLoader

void __117___CRKCardSectionViewLoader__loadIdentifiedCardSectionViewProvidersFromCard_identifiedProviders_delegate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  id *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  char v37;
  id *v38;
  id v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v40 = a1;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (!v5 && v6 && WeakRetained)
  {
    v38 = WeakRetained;
    objc_msgSend(WeakRetained[3], "addObject:", v6);
    objc_msgSend(v6, "viewConfigurations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)*MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = objc_msgSend(v9, "count");
      v13 = *(_QWORD *)(v40 + 32);
      *(_DWORD *)buf = 134218242;
      v47 = v12;
      v48 = 2112;
      v49 = v13;
      _os_log_impl(&dword_218FCB000, v11, OS_LOG_TYPE_DEFAULT, "Successfully loaded %lu card section views configurations from provider\n    Provider: %@", buf, 0x16u);

    }
    v39 = v6;
    objc_msgSend(v6, "providerIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v16 = v9;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v42 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v21, "_setProviderIdentifier:", v14);
          +[CRKCardSectionViewController cardSectionViewControllerForViewConfiguration:](CRKCardSectionViewController, "cardSectionViewControllerForViewConfiguration:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "_setCardKitCardSectionViewController:", v22);

          objc_msgSend(v21, "cardSection");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(v21, "cardSection");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "cardSectionIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKey:", v21, v25);

          }
          else
          {
            v26 = *MEMORY[0x24BE15490];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
            {
              v27 = *(_QWORD *)(v40 + 32);
              *(_DWORD *)buf = 138412546;
              v47 = (uint64_t)v21;
              v48 = 2112;
              v49 = v27;
              _os_log_error_impl(&dword_218FCB000, v26, OS_LOG_TYPE_ERROR, "Card section view configuration does not have a card section; dropping\n"
                "    Configuration: %@\n"
                "    Provider: %@",
                buf,
                0x16u);
            }
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v18);
    }

    v8 = v38;
    objc_msgSend(v38[1], "setObject:forKey:", v15, v14);

    v6 = v39;
  }
  else
  {
    v28 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      __117___CRKCardSectionViewLoader__loadIdentifiedCardSectionViewProvidersFromCard_identifiedProviders_delegate_completion___block_invoke_cold_1(v40, v28, v29, v30, v31, v32, v33, v34);
  }
  v35 = *(_QWORD *)(*(_QWORD *)(v40 + 48) + 8);
  if (v5)
    v36 = *(_BYTE *)(v35 + 24) == 0;
  else
    v36 = 0;
  v37 = !v36;
  *(_BYTE *)(v35 + 24) = v37;
  dispatch_group_leave(*(dispatch_group_t *)(v40 + 40));

}

void __117___CRKCardSectionViewLoader__loadIdentifiedCardSectionViewProvidersFromCard_identifiedProviders_delegate_completion___block_invoke_5(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v20 = a1;
    objc_msgSend(*(id *)(a1 + 32), "resolvedCardSections");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
    if (v3)
    {
      v4 = v3;
      v22 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          v7 = WeakRetained[3];
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v24;
            while (2)
            {
              for (j = 0; j != v9; ++j)
              {
                if (*(_QWORD *)v24 != v10)
                  objc_enumerationMutation(v7);
                v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
                if ((objc_opt_respondsToSelector() & 1) != 0
                  && objc_msgSend(v12, "vetoDisplayOfCardSection:", v6))
                {
                  v13 = (void *)*MEMORY[0x24BE15490];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_DEFAULT))
                  {
                    v14 = v13;
                    objc_msgSend(v12, "providerIdentifier");
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v32 = v6;
                    v33 = 2112;
                    v34 = v12;
                    v35 = 2112;
                    v36 = v15;
                    _os_log_impl(&dword_218FCB000, v14, OS_LOG_TYPE_DEFAULT, "Vetoing card section view display on behalf of provider\n    Card section: %@\n    Provider: %@\n    Provider identifier: %@", buf, 0x20u);

                  }
                  v16 = WeakRetained[2];
                  objc_msgSend(v12, "providerIdentifier");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "cardSectionIdentifier");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "setObject:forKey:", v17, v18);

                  goto LABEL_20;
                }
              }
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
              if (v9)
                continue;
              break;
            }
          }
LABEL_20:

        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
      }
      while (v4);
    }

    objc_storeStrong(WeakRetained + 5, *(id *)(v20 + 32));
    v19 = *(_QWORD *)(v20 + 40);
    if (v19)
      (*(void (**)(uint64_t, _QWORD))(v19 + 16))(v19, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v20 + 48) + 8) + 24));
  }

}

uint64_t __61___CRKCardSectionViewLoader_viewConfigurationForCardSection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "cardSectionViewLoader:compareCardSectionViewProviderOne:providerTwo:", *(_QWORD *)(a1 + 32), v5, v6);

    if (v9)
    {
      v10 = (id)*MEMORY[0x24BE15490];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        if (v9 == -1)
          v11 = v6;
        else
          v11 = v5;
        if (v9 == -1)
          v12 = v5;
        else
          v12 = v6;
        objc_msgSend(v11, "providerIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "providerIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 40);
        v20 = 138412802;
        v21 = v13;
        v22 = 2112;
        v23 = v14;
        v24 = 2112;
        v25 = v15;
        _os_log_impl(&dword_218FCB000, v10, OS_LOG_TYPE_DEFAULT, "Delegate prefers %@ to %@ in terms of display priority for card section: %@", (uint8_t *)&v20, 0x20u);

      }
      goto LABEL_24;
    }
  }
  else
  {

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16 = objc_msgSend(v5, "displayPriorityForCardSection:", *(_QWORD *)(a1 + 40));
  else
    v16 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v17 = objc_msgSend(v6, "displayPriorityForCardSection:", *(_QWORD *)(a1 + 40));
  else
    v17 = 0;
  v18 = 1;
  if (v16 <= v17)
    v18 = -1;
  if (v16 == v17)
    v9 = 0;
  else
    v9 = v18;
LABEL_24:

  return v9;
}

BOOL __61___CRKCardSectionViewLoader_viewConfigurationForCardSection___block_invoke_14(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(a2, "providerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "cardSectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7 != 0;
}

void __117___CRKCardSectionViewLoader__loadIdentifiedCardSectionViewProvidersFromCard_identifiedProviders_delegate_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_218FCB000, a2, a3, "Failed to load card section views from provider\n    Provider: %@", a5, a6, a7, a8, 2u);
}

@end
