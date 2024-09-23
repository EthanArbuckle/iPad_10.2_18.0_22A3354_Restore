@implementation ASPasswordManagerIconController

void __65___ASPasswordManagerIconController__privacyProxyStateInitialized__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = WeakRetained[16];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7));
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

void __65___ASPasswordManagerIconController__privacyProxyStateInitialized__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  void *v3;
  void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v1 + 64);
  v2 = (id *)(v1 + 64);
  v3 = v4;
  if (v4)
    objc_msgSend(v3, "addObjectsFromArray:", v2[8]);
  else
    objc_storeStrong(v2, v2[8]);
}

void __49___ASPasswordManagerIconController__fetchHistory__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __49___ASPasswordManagerIconController__fetchHistory__block_invoke_2;
  v2[3] = &unk_24C94F5A8;
  v1 = *(void **)(a1 + 32);
  v2[4] = *(_QWORD *)(a1 + 40);
  objc_copyWeak(&v3, (id *)(a1 + 48));
  objc_msgSend(v1, "getAllItemsWithCompletionHandler:", v2);
  objc_destroyWeak(&v3);
}

void __49___ASPasswordManagerIconController__fetchHistory__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49___ASPasswordManagerIconController__fetchHistory__block_invoke_3;
  v6[3] = &unk_24C94F580;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __49___ASPasswordManagerIconController__fetchHistory__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)WeakRetained + 6);
    *((_QWORD *)WeakRetained + 6) = v3;

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v5 = *(id *)(a1 + 32);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v10, "url");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "host");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "safari_highLevelDomainFromHost");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v13, "length"))
          {

            goto LABEL_21;
          }
          objc_msgSend(*((id *)WeakRetained + 6), "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            objc_msgSend(MEMORY[0x24BDBCEF0], "set");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*((id *)WeakRetained + 6), "setObject:forKeyedSubscript:", v14, v13);
          }
          objc_msgSend(v14, "addObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v7)
          continue;
        break;
      }
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = *((id *)WeakRetained + 8);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j) + 16))(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j));
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v17);
    }

    v20 = (void *)*((_QWORD *)WeakRetained + 8);
    *((_QWORD *)WeakRetained + 8) = 0;

    *((_WORD *)WeakRetained + 4) = 257;
  }
LABEL_21:

}

void __58___ASPasswordManagerIconController_clearIconFetchingState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 80);
  v4 = (void *)objc_msgSend(*(id *)(v2 + 40), "copy");
  objc_msgSend(v3, "cancelRequestsWithTokens:", v4);

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 112))
    objc_msgSend(getWBSHistoryClass(), "clearExistingSharedHistory");
}

void __50___ASPasswordManagerIconController_cancelRequest___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "cancelRequestWithToken:", v2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", v2);
  }
  else
  {
    v3 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __50___ASPasswordManagerIconController_cancelRequest___block_invoke_cold_1(v3);
  }

}

uint64_t __76___ASPasswordManagerIconController_iconForDomain_requestID_responseHandler___block_invoke(_QWORD *a1)
{
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 56), "containsObject:", a1[5]);
  return objc_msgSend(*(id *)(a1[4] + 56), "addObject:", a1[5]);
}

void __61___ASPasswordManagerIconController_backgroundColorForDomain___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __62___ASPasswordManagerIconController__mobileSafariContainerPath__block_invoke()
{
  xpc_object_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  xpc_object_t objects;

  container_query_create();
  container_query_set_class();
  objects = xpc_string_create("com.apple.mobilesafari");
  v0 = xpc_array_create(&objects, 1uLL);
  container_query_set_identifiers();
  container_query_operation_set_flags();
  container_query_set_persona_unique_string();
  if (container_query_get_single_result())
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", container_get_path());
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)_mobileSafariContainerPath_mobileSafariContainerPath;
    _mobileSafariContainerPath_mobileSafariContainerPath = v1;

    v3 = (void *)container_copy_sandbox_token();
    if ((sandbox_extension_consume() & 0x8000000000000000) == 0)
      free(v3);
    container_query_free();
  }
  else
  {
    container_query_get_last_error();
    v4 = (void *)container_error_copy_unlocalized_description();
    v5 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __62___ASPasswordManagerIconController__mobileSafariContainerPath__block_invoke_cold_1((uint64_t)v4, v5);
    free(v4);
    container_query_free();
    v6 = (void *)_mobileSafariContainerPath_mobileSafariContainerPath;
    _mobileSafariContainerPath_mobileSafariContainerPath = 0;

  }
}

void __79___ASPasswordManagerIconController__checkForLocalVisitToDomain_withCompletion___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:", a1[5]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(getWBSHistoryClass(), "existingSharedHistory");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "checkIfLocalVisitExistsInAnyOfItems:withCompletion:", v3, a1[6]);

  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }

}

void __87___ASPasswordManagerIconController__fetchTouchIconForDomain_requestID_responseHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __87___ASPasswordManagerIconController__fetchTouchIconForDomain_requestID_responseHandler___block_invoke_2;
  v4[3] = &unk_24C94F6F0;
  v4[4] = v3;
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v3, "_checkForLocalVisitToDomain:withCompletion:", v5, v4);

}

uint64_t __87___ASPasswordManagerIconController__fetchTouchIconForDomain_requestID_responseHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2;

  if (a2)
    v2 = 2;
  else
    v2 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_requestTouchIconForDomain:options:requestID:responseHandler:", *(_QWORD *)(a1 + 40), v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __87___ASPasswordManagerIconController__fetchTouchIconForDomain_requestID_responseHandler___block_invoke_3(uint64_t a1)
{
  _BYTE *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "initialized")
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "shouldFetchPasswordManagerWebsiteDataUsingPrivacyProxy"))
  {
    return objc_msgSend(*(id *)(a1 + 32), "_requestTouchIconForDomain:options:requestID:responseHandler:", *(_QWORD *)(a1 + 40), 6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  v3 = *(_BYTE **)(a1 + 32);
  if (!v3[9])
    objc_msgSend(v3, "_requestTouchIconForDomain:options:requestID:responseHandler:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v4 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 141558275;
    v7 = 1752392040;
    v8 = 2117;
    v9 = v5;
    _os_log_impl(&dword_20E4D9000, v4, OS_LOG_TYPE_DEFAULT, "Fetching touch icon in history; domain=%{sensitive, mask.hash}@",
      (uint8_t *)&v6,
      0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_fetchIconInHistoryWithBlock:", *(_QWORD *)(a1 + 64));
}

void __97___ASPasswordManagerIconController__requestTouchIconForDomain_options_requestID_responseHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18[2];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE buf[24];
  void *v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  getSFScreenScale();
  +[_ASPasswordManagerIconController _preferredIconSize](_ASPasswordManagerIconController, "_preferredIconSize");
  v2 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = (*(_DWORD *)(a1 + 72) >> 2) & 1;
    *(_DWORD *)buf = 141558531;
    *(_QWORD *)&buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2117;
    *(_QWORD *)&buf[14] = v3;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v24) = v4;
    _os_log_impl(&dword_20E4D9000, v2, OS_LOG_TYPE_DEFAULT, "Fetching touch icon; domain=%{sensitive, mask.hash}@; enablePrivateRelay=%{BOOL}d",
      buf,
      0x1Cu);
  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v5 = (void *)get_SFSavedAccountTouchIconRequestClass_softClass;
  v22 = get_SFSavedAccountTouchIconRequestClass_softClass;
  v6 = MEMORY[0x24BDAC760];
  if (!get_SFSavedAccountTouchIconRequestClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __get_SFSavedAccountTouchIconRequestClass_block_invoke;
    v24 = &unk_24C94F880;
    v25 = &v19;
    __get_SFSavedAccountTouchIconRequestClass_block_invoke((uint64_t)buf);
    v5 = (void *)v20[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v19, 8);
  objc_msgSend(*(id *)(a1 + 32), "safari_bestURLForUserTypedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ASPasswordManagerIconController _minimumIconSize](_ASPasswordManagerIconController, "_minimumIconSize");
  objc_msgSend(v7, "requestWithTitle:url:minimumIconSize:maximumIconSize:options:", 0, v8, *(_QWORD *)(a1 + 72));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __97___ASPasswordManagerIconController__requestTouchIconForDomain_options_requestID_responseHandler___block_invoke_36;
  v14[3] = &unk_24C94F790;
  objc_copyWeak(v18, (id *)(a1 + 64));
  v15 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v12 = *(void **)(a1 + 72);
  v17 = v11;
  v18[1] = v12;
  objc_msgSend(v10, "registerRequest:priority:responseHandler:", v9, 2, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "addObject:", v13);
    if (*(_QWORD *)(a1 + 48))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setObject:forKeyedSubscript:", v13);
  }

  objc_destroyWeak(v18);
}

void __97___ASPasswordManagerIconController__requestTouchIconForDomain_options_requestID_responseHandler___block_invoke_36(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12[2];

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __97___ASPasswordManagerIconController__requestTouchIconForDomain_options_requestID_responseHandler___block_invoke_2;
  v7[3] = &unk_24C94F768;
  v8 = v3;
  v4 = v3;
  objc_copyWeak(v12, (id *)(a1 + 56));
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(void **)(a1 + 64);
  v11 = v5;
  v12[1] = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

  objc_destroyWeak(v12);
}

void __97___ASPasswordManagerIconController__requestTouchIconForDomain_options_requestID_responseHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id *WeakRetained;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id WBSImageUtilitiesClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE buf[24];
  void *v20;
  uint64_t *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v2 = (void *)getWBSTouchIconResponseClass_softClass;
  v18 = getWBSTouchIconResponseClass_softClass;
  if (!getWBSTouchIconResponseClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getWBSTouchIconResponseClass_block_invoke;
    v20 = &unk_24C94F880;
    v21 = &v15;
    __getWBSTouchIconResponseClass_block_invoke((uint64_t)buf);
    v2 = (void *)v16[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v15, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
    if (WeakRetained)
    {
      v5 = *(id *)(a1 + 32);
      objc_msgSend(v5, "touchIcon", v15);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
      v8 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 141558275;
          *(_QWORD *)&buf[4] = 1752392040;
          *(_WORD *)&buf[12] = 2117;
          *(_QWORD *)&buf[14] = v9;
          _os_log_impl(&dword_20E4D9000, v8, OS_LOG_TYPE_DEFAULT, "Finished fetching touch icon; domain=%{sensitive, mask.hash}@",
            buf,
            0x16u);
        }
        WBSImageUtilitiesClass = getWBSImageUtilitiesClass();
        +[_ASPasswordManagerIconController _preferredIconSize](_ASPasswordManagerIconController, "_preferredIconSize");
        objc_msgSend(WBSImageUtilitiesClass, "resizedImage:withSize:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained[2], "setObject:forKey:", v11, *(_QWORD *)(a1 + 40));
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        objc_msgSend(WeakRetained, "_iconDidUpdateForDomain:", *(_QWORD *)(a1 + 40));

      }
      else
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          __97___ASPasswordManagerIconController__requestTouchIconForDomain_options_requestID_responseHandler___block_invoke_2_cold_1();
        objc_msgSend(v5, "nextIconDownloadRetryDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v5, "nextIconDownloadRetryDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained[17], "setObject:forKeyedSubscript:", v13, *(_QWORD *)(a1 + 40));

        }
        objc_msgSend(WeakRetained, "iconForDomain:requestID:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {

        }
        else if ((*(_BYTE *)(a1 + 72) & 4) != 0)
        {
          objc_msgSend(WeakRetained, "_fetchTouchIconInHistoryForDomain:requestID:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
        }
        objc_msgSend(WeakRetained, "_handleIconFetchFailureWithDomain:options:requestID:response:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), v5, *(_QWORD *)(a1 + 56));
      }

    }
  }
}

uint64_t __113___ASPasswordManagerIconController__handleIconFetchFailureWithDomain_options_requestID_response_responseHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_iconDidUpdateForDomain:", *(_QWORD *)(a1 + 48));
}

void __96___ASPasswordManagerIconController__fetchTouchIconInHistoryForDomain_requestID_responseHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __96___ASPasswordManagerIconController__fetchTouchIconInHistoryForDomain_requestID_responseHandler___block_invoke_2;
  v4[3] = &unk_24C94F6F0;
  v4[4] = v3;
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v3, "_checkForLocalVisitToDomain:withCompletion:", v5, v4);

}

uint64_t __96___ASPasswordManagerIconController__fetchTouchIconInHistoryForDomain_requestID_responseHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2;

  if (a2)
    v2 = 2;
  else
    v2 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_requestTouchIconForDomain:options:requestID:responseHandler:", *(_QWORD *)(a1 + 40), v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __73___ASPasswordManagerIconController__populateDomainToAppIDWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[9];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __73___ASPasswordManagerIconController__populateDomainToAppIDWithCompletion___block_invoke_2;
    v7[3] = &unk_24C94F5F8;
    v7[4] = WeakRetained;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __73___ASPasswordManagerIconController__populateDomainToAppIDWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 88);
  *(_QWORD *)(v3 + 88) = v2;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = *(id *)(a1 + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x24BE83038];
        objc_msgSend(v10, "domain");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "domainByStrippingSubdomainWildcardPrefixIfNecessary:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(MEMORY[0x24BE83038], "domainIsProhibitedForSavingCredentials:", v13) & 1) == 0)
        {
          objc_msgSend(v13, "safari_highLevelDomainFromHost");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14 && (objc_msgSend(MEMORY[0x24BE83038], "highLevelDomainHasSuiteOfAssociatedApps:", v14) & 1) == 0)
          {
            objc_msgSend(v10, "appID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setObject:forKeyedSubscript:", v15, v14);

          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j) + 16))(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 96);
  *(_QWORD *)(v21 + 96) = 0;

}

void __75___ASPasswordManagerIconController__fetchAppIconForDomain_responseHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __75___ASPasswordManagerIconController__fetchAppIconForDomain_responseHandler___block_invoke_2;
  v3[3] = &unk_24C94F830;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_populateDomainToAppIDWithCompletion:", v3);

  objc_destroyWeak(&v6);
}

void __75___ASPasswordManagerIconController__fetchAppIconForDomain_responseHandler___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id WBSImageUtilitiesClass;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[11], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v6, "length");
      if (objc_msgSend(v6, "length") && (v8 = v7 + 1, v8 < objc_msgSend(v4, "length")))
      {
        objc_msgSend(v4, "substringFromIndex:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isValid");

        if ((v12 & 1) != 0)
        {
          WBSImageUtilitiesClass = getWBSImageUtilitiesClass();
          iconForApplicationProxy(v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[_ASPasswordManagerIconController _preferredIconSize](_ASPasswordManagerIconController, "_preferredIconSize");
          objc_msgSend(WBSImageUtilitiesClass, "resizedImage:withSize:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v3[2], "setObject:forKey:", v15, *(_QWORD *)(a1 + 32));
            (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
            objc_msgSend(v3, "_iconDidUpdateForDomain:", *(_QWORD *)(a1 + 32));
          }
          else
          {
            v20 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              __75___ASPasswordManagerIconController__fetchAppIconForDomain_responseHandler___block_invoke_2_cold_2();
          }

        }
        else
        {
          v19 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            __75___ASPasswordManagerIconController__fetchAppIconForDomain_responseHandler___block_invoke_2_cold_3();
        }

      }
      else
      {
        v16 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          __75___ASPasswordManagerIconController__fetchAppIconForDomain_responseHandler___block_invoke_2_cold_1();
      }

    }
    else
    {
      v17 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 32);
        v21 = 141558275;
        v22 = 1752392040;
        v23 = 2117;
        v24 = v18;
        _os_log_impl(&dword_20E4D9000, v17, OS_LOG_TYPE_DEFAULT, "App does not exist for domain; domain=%{sensitive, mask.hash}@",
          (uint8_t *)&v21,
          0x16u);
      }
    }

  }
}

void __50___ASPasswordManagerIconController_cancelRequest___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20E4D9000, log, OS_LOG_TYPE_ERROR, "Asked to cancel icon fetching request, but couldn't find identifier for it", v1, 2u);
}

void __62___ASPasswordManagerIconController__mobileSafariContainerPath__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136380675;
  v3 = a1;
  _os_log_error_impl(&dword_20E4D9000, a2, OS_LOG_TYPE_ERROR, "Error executing query: %{private}s", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __97___ASPasswordManagerIconController__requestTouchIconForDomain_options_requestID_responseHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20E4D9000, v0, v1, "Failed to fetch touch icon; domain=%{sensitive, mask.hash}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2();
}

void __75___ASPasswordManagerIconController__fetchAppIconForDomain_responseHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20E4D9000, v0, v1, "Application identifier for retrieving icon did not match expected format; domain=%{sensitive, mask.hash}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2();
}

void __75___ASPasswordManagerIconController__fetchAppIconForDomain_responseHandler___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20E4D9000, v0, v1, "Failed to fetch app icon; domain=%{sensitive, mask.hash}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2();
}

void __75___ASPasswordManagerIconController__fetchAppIconForDomain_responseHandler___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20E4D9000, v0, v1, "Application Proxy stat is invalid; domain=%{sensitive, mask.hash}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2();
}

@end
