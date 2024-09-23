@implementation SFFormAutoFillController

void __72___SFFormAutoFillController_autoFillForm_inFrame_withGeneratedPassword___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0D8AC10]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72___SFFormAutoFillController_autoFillForm_inFrame_withGeneratedPassword___block_invoke_2;
  v6[3] = &unk_1E4AC1080;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v4, "setHandler:", v6);
  if (v3)
  {
    +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGeneratedPassword:", v3);

  }
}

void __72___SFFormAutoFillController_autoFillForm_inFrame_withGeneratedPassword___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __72___SFFormAutoFillController_autoFillForm_inFrame_withGeneratedPassword___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0D8AC10]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72___SFFormAutoFillController_autoFillForm_inFrame_withGeneratedPassword___block_invoke_4;
  v6[3] = &unk_1E4AC1080;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v4, "setHandler:", v6);
  if (v3)
  {
    +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGeneratedPassword:", v3);

  }
}

void __72___SFFormAutoFillController_autoFillForm_inFrame_withGeneratedPassword___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __60___SFFormAutoFillController_fieldWillFocusWithInputSession___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v2, "_setSuppressSoftwareKeyboard:", 0);

    WeakRetained = v3;
  }

}

void __60___SFFormAutoFillController_fieldWillFocusWithInputSession___block_invoke_2(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _SFAutoFillInputView *v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  id v19;
  void *v20;
  _SFAutoFillInputView *v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id WeakRetained;
  id v27;

  v27 = a2;
  if (v27)
  {
    objc_msgSend(a1[4], "webui_URL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "host");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_highLevelDomainFromHost");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(a1[4], "webui_URL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "host");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "safari_simplifiedSiteNameForCredentialLookup");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(a1[5], "owningExtensionState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedDisplayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "enabledExtensions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
        if (!objc_msgSend(MEMORY[0x1E0D8A8F8], "isPasswordManagerAppEnabled"))
          objc_msgSend(MEMORY[0x1E0DD9910], "keychainSyncEnabled");
        _WBSLocalizedString();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
    }
    if (objc_msgSend(MEMORY[0x1E0D8A8F8], "isPasswordManagerAppEnabled"))
    {
      if (a1[5])
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C090]), "initWithCredentialIdentity:host:", a1[5], v5);
      }
      else
      {
        v19 = objc_alloc(MEMORY[0x1E0D6C090]);
        objc_msgSend(v27, "savedAccountMatch");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v19, "initWithSavedAccountMatch:host:", v20, v5);

      }
      v21 = -[_SFAutoFillInputView initWithStreamlinedAutoFillViewController:suggestion:]([_SFAutoFillInputView alloc], "initWithStreamlinedAutoFillViewController:suggestion:", v13, v27);
      v22 = a1[6];
      v15 = (void *)v22[24];
      v22[24] = v21;
    }
    else
    {
      v14 = [_SFAutoFillInputView alloc];
      objc_msgSend(v27, "savedAccountMatch");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "customTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[_SFAutoFillInputView initWithHostString:credentialSource:suggestion:customTitle:](v14, "initWithHostString:credentialSource:suggestion:customTitle:", v5, v9, v27, v15);
      v17 = a1[6];
      v18 = (void *)v17[24];
      v17[24] = v16;

    }
    objc_msgSend(*((id *)a1[6] + 24), "setDelegate:");
    v23 = *((_QWORD *)a1[6] + 24);
    objc_msgSend(a1[7], "formInputSession");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCustomInputView:", v23);

    objc_msgSend(a1[7], "formInputSession");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAccessoryViewShouldNotShow:", 1);

    objc_msgSend(a1[6], "_hideInputAssistantItemsIfNecessary");
  }
  WeakRetained = objc_loadWeakRetained((id *)a1[6] + 1);
  objc_msgSend(WeakRetained, "_setSuppressSoftwareKeyboard:", 0);

}

void __108___SFFormAutoFillController__getExternalLoginCredentialSuggestionsForDomains_webFrameIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  id *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0D8A040]);
  v5 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "relyingPartyIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __108___SFFormAutoFillController__getExternalLoginCredentialSuggestionsForDomains_webFrameIdentifier_completion___block_invoke_2;
    v13[3] = &unk_1E4AC1FA0;
    v15 = *(id *)(a1 + 40);
    v14 = v4;
    objc_msgSend(v14, "fetchAllCredentialIdentitiesMatchingDomains:completion:", v7, v13);
    v8 = &v15;
    v9 = &v14;

  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __108___SFFormAutoFillController__getExternalLoginCredentialSuggestionsForDomains_webFrameIdentifier_completion___block_invoke_3;
    v10[3] = &unk_1E4AC1FA0;
    v12 = *(id *)(a1 + 40);
    v11 = v4;
    objc_msgSend(v11, "fetchPasswordCredentialIdentitiesMatchingDomains:completion:", v5, v10);
    v8 = &v12;
    v9 = &v11;
  }

}

void __108___SFFormAutoFillController__getExternalLoginCredentialSuggestionsForDomains_webFrameIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void __108___SFFormAutoFillController__getExternalLoginCredentialSuggestionsForDomains_webFrameIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void __116___SFFormAutoFillController__getExternalLoginCredentialSuggestionsForDomains_pageURL_webFrameIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "_filterAndSortCredentialIdentities:pageURL:exactMatchesOnly:", a2, *(_QWORD *)(a1 + 32), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

uint64_t __89___SFFormAutoFillController__filterAndSortCredentialIdentities_pageURL_exactMatchesOnly___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareForQuickTypeBar:");
}

id __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "host");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v18;
  char v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v18 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v4 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v5)
    {
      v19 = 0;
      v6 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v27 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v8, "host");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(WeakRetained, "_preFillDisabledHosts");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "containsObject:", v9);

            if ((v11 & 1) == 0)
            {
              objc_msgSend(v3, "objectForKeyedSubscript:", v9);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v12)
              {
                objc_msgSend((id)objc_opt_class(), "_filterAndSortCredentialIdentities:pageURL:exactMatchesOnly:", v18, v8, 1);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v9);
              }
              if (objc_msgSend(v12, "count"))
              {
                objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setObject:forKeyedSubscript:", v13, v8);

                v19 = 1;
              }

            }
          }

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v5);
    }
    else
    {
      v19 = 0;
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_3;
    block[3] = &unk_1E4AC2098;
    v25 = v19 & 1;
    block[4] = WeakRetained;
    v14 = *(id *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 48);
    v22 = v14;
    v23 = v20;
    v24 = v15;
    v16 = v20;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  if (*(_BYTE *)(a1 + 64))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(WeakRetained, "formAutoFillControllerURLForFormAutoFill:", *(_QWORD *)(a1 + 32));
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(*(id *)(a1 + 40), "isEqual:", v4) & 1) != 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 224), *(id *)(a1 + 48));
      v3 = a1 + 56;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
LABEL_8:

        return;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "collectFormMetadataForPrefillingAtURL:", v4);
    }
    else
    {
      v3 = a1 + 56;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v3 + 8) + 24) = 1;
    goto LABEL_8;
  }
}

void __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_214(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;
  __int128 v16;
  _QWORD v17[5];
  id v18;

  v2 = 0;
  do
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "nextObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      goto LABEL_5;
    objc_opt_class();
    v2 = v3;
  }
  while ((objc_opt_isKindOfClass() & 1) == 0);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
LABEL_5:
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

    goto LABEL_6;
  }
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__212;
  v17[4] = __Block_byref_object_dispose__213;
  v14[2] = __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_2_215;
  v14[3] = &unk_1E4AC20E8;
  v6 = *(void **)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v15 = v6;
  v16 = *(_OWORD *)(a1 + 64);
  v18 = (id)MEMORY[0x1A8598C40](v14);
  v8 = objc_alloc(MEMORY[0x1E0D8AC00]);
  objc_msgSend(*(id *)(a1 + 48), "webFrameIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithURL:options:partialUsername:associatedDomainsManager:webFrameIdentifier:", v3, 8, &stru_1E4AC8470, 0, v9);

  objc_msgSend(*(id *)(a1 + 32), "savedAccountContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContext:", v11);

  +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_3_220;
  v13[3] = &unk_1E4AC2138;
  v13[4] = v17;
  objc_msgSend(v12, "getSavedAccountMatchesWithCriteria:synchronously:completionHandler:", v10, 0, v13);

  _Block_object_dispose(v17, 8);
LABEL_6:

}

void __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_2_215(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "formAutoFillControllerURLForFormAutoFill:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(a1 + 40), "isEqual:", v4) & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  objc_msgSend(v10, "exactMatches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "_preFillDisabledHosts");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "host");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "containsObject:", v8);

      if ((v9 & 1) == 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "collectFormMetadataForPrefillingAtURL:", v4);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) + 16))();

}

void __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_3_220(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_4;
  v6[3] = &unk_1E4AC2110;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __87___SFFormAutoFillController__authenticateForAutoFillForHighLevelDomain_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "authenticationContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "authenticatedContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, 0, 0);
  }

}

uint64_t __69___SFFormAutoFillController_textDidChangeInTextField_inForm_inFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFormTelemetryDataMonitorWithFormMetadata:textFieldMetadata:textFieldValueLength:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __68___SFFormAutoFillController_didFillGeneratedPasswordInForm_inFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFormTelemetryDataMonitorWithFormMetadata:textFieldMetadata:textFieldValueLength:", *(_QWORD *)(a1 + 40), 0, 0);
}

void __59___SFFormAutoFillController_sendEventsForAutoFillTelemetry__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "sendTelemetryEventsOnFormSubmission");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 120);
  *(_QWORD *)(v2 + 120) = 0;

}

uint64_t __90___SFFormAutoFillController_reportAutoFillOfferedType_forTextFieldWithID_forFormMetadata___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_createFormTelemetryDataMonitorIfNeeded");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "updateAutoFillOfferedType:forTextFieldWithID:forFormMetadata:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __52___SFFormAutoFillController_autoFilledField_inForm___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFormTelemetryDataMonitorWithFormMetadata:textFieldMetadata:textFieldValueLength:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __91___SFFormAutoFillController_autoFillDidFinishWithUpdatedFormMetadata_inFrame_shouldSubmit___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performPageLevelAutoFill");
}

uint64_t __80___SFFormAutoFillController__dismissKeyboardAndSimulateCarriageReturnKeyEvents___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "insertText:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "clearSelection");
}

void __80___SFFormAutoFillController__dismissKeyboardAndSimulateCarriageReturnKeyEvents___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_simulatedBEKeyEntryForReturnKeyWithType:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80___SFFormAutoFillController__dismissKeyboardAndSimulateCarriageReturnKeyEvents___block_invoke_3;
  v4[3] = &unk_1E4AC2220;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "handleKeyEntry:withCompletionHandler:", v3, v4);

}

uint64_t __80___SFFormAutoFillController__dismissKeyboardAndSimulateCarriageReturnKeyEvents___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "insertText:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "setSelectedTextRange:", 0);
}

uint64_t __99___SFFormAutoFillController_didRemoveAutomaticStrongPasswordInForm_inputSessionUserObject_inFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFormTelemetryDataMonitorWithFormMetadata:textFieldMetadata:textFieldValueLength:", *(_QWORD *)(a1 + 40), 0, 0);
}

void __64___SFFormAutoFillController_replaceCurrentPasswordWithPassword___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64___SFFormAutoFillController_replaceCurrentPasswordWithPassword___block_invoke_2;
  v5[3] = &unk_1E4AC0590;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __64___SFFormAutoFillController_replaceCurrentPasswordWithPassword___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "frameHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 152);
  *(_QWORD *)(v3 + 152) = v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 144), *(id *)(a1 + 40));
}

void __64___SFFormAutoFillController_replaceCurrentPasswordWithPassword___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __121___SFFormAutoFillController__beginAutomaticPasswordInteractionWithInputSession_generatedPassword_ignorePreviousDecision___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 152);
  *(_QWORD *)(v16 + 152) = v11;
  v29 = v11;

  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 168);
  *(_QWORD *)(v18 + 168) = v12;
  v20 = v12;

  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 176);
  *(_QWORD *)(v21 + 176) = v13;
  v23 = v13;

  v24 = *(_QWORD *)(a1 + 32);
  v25 = *(void **)(v24 + 144);
  *(_QWORD *)(v24 + 144) = v14;
  v26 = v14;

  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(void **)(v27 + 136);
  *(_QWORD *)(v27 + 136) = v15;

}

uint64_t __121___SFFormAutoFillController__beginAutomaticPasswordInteractionWithInputSession_generatedPassword_ignorePreviousDecision___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[9] + 16))(a1[9], a1[4], a1[5], a1[6], a1[7], a1[8]);
}

void __121___SFFormAutoFillController_fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0D8AC10]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __121___SFFormAutoFillController_fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution_completionHandler___block_invoke_2;
  v5[3] = &unk_1E4AC1080;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "setHandler:", v5);
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "setGeneratedPassword:", v3);

}

void __121___SFFormAutoFillController_fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution_completionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __121___SFFormAutoFillController_fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __121___SFFormAutoFillController_fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution_completionHandler___block_invoke_4(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0D8A8F8], "isPasswordManagerAppEnabledAndInstalled");
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(*(id *)(v3 + 56), "frame");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 != v5)
      return;
    v3 = *(_QWORD *)(a1 + 40);
  }
  else if (v4 != *(void **)(v3 + 152))
  {
    return;
  }
  *(_BYTE *)(v3 + 283) = 1;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
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
        objc_msgSend(*(id *)(a1 + 40), "reportAutoFillOfferedType:forTextFieldWithID:forFormMetadata:", 1, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), *(_QWORD *)(a1 + 48), (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = *(_QWORD *)(a1 + 56);
  if (v10)
    (*(void (**)(void))(v10 + 16))();
}

void __87___SFFormAutoFillController_fillCreditCardData_inFrame_textFieldMetadata_formMetadata___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87___SFFormAutoFillController_fillCreditCardData_inFrame_textFieldMetadata_formMetadata___block_invoke_2;
  v5[3] = &unk_1E4AC2360;
  objc_copyWeak(&v11, a1 + 8);
  v6 = a1[4];
  v7 = v3;
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v11);
}

void __87___SFFormAutoFillController_fillCreditCardData_inFrame_textFieldMetadata_formMetadata___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  id v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  v3 = WeakRetained;
  if (WeakRetained && *((_BYTE *)WeakRetained + 284))
  {
    *((_BYTE *)WeakRetained + 284) = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v6 = v5;

    v7 = *MEMORY[0x1E0D8B170];
    if (v6 <= *MEMORY[0x1E0D8B170])
    {
      objc_msgSend(v3[7], "textFieldMetadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3[7], "frame");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stopShowingSpinnerInFormSoon:textFieldMetadata:frame:", v8, v9, v7 - v6);
    }
    else
    {
      objc_msgSend(v3[7], "textFieldMetadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3[7], "frame");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setAutoFillSpinnerVisibility:textFieldMetadata:frame:", 0, v8, v9);
    }

    objc_msgSend(*(id *)(a1 + 40), "cardNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      v36 = 0;
      v34 = 0;
      objc_msgSend(v12, "getFormFieldValues:andFieldToFocus:andCreditCardDataTypesThatWillBeFilled:forCreditCardForm:fromCreditCardData:", &v36, &v35, &v34, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
      v13 = v36;
      v14 = v36;
      v15 = v35;
      v16 = v34;
      v29 = v34;

      objc_storeStrong(v3 + 38, v13);
      objc_msgSend(*(id *)(a1 + 56), "fieldsToObscureWhenFillingCreditCard:formMetadata:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      objc_msgSend(v14, "allKeys");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v31;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v31 != v20)
              objc_enumerationMutation(v18);
            objc_msgSend(v3, "reportAutoFillOfferedType:forTextFieldWithID:forFormMetadata:", 3, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v21++), *(_QWORD *)(a1 + 48));
          }
          while (v19 != v21);
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
        }
        while (v19);
      }

      LOBYTE(v28) = 0;
      objc_msgSend(v3, "autoFillFormInFrame:withValues:setAutoFilled:focusFieldAfterFilling:fieldToFocus:fieldsToObscure:submitForm:", *(_QWORD *)(a1 + 64), v3[38], 1, 1, v15, v17, v28);
      objc_msgSend(*(id *)(a1 + 56), "markCreditCardDataAsMostRecentlyUsed:", *(_QWORD *)(a1 + 40));
      objc_storeStrong(v3 + 40, *(id *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 40), "virtualCard");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22 == 0;

      if (!v23)
      {
        v24 = v3[41];
        if (!v24)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = v3[41];
          v3[41] = (id)v25;

          v24 = v3[41];
        }
        objc_msgSend(*(id *)(a1 + 40), "cardNumber");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v27);

      }
      objc_storeStrong(v3 + 42, v16);
      objc_msgSend(v3[7], "setAction:", 4);
      objc_msgSend(v3[7], "updateAutoFillButton");

    }
    else
    {
      objc_msgSend(v3[7], "presentUnavailableVirtualCardAlert");
    }
  }

}

void __57___SFFormAutoFillController_showSpinnerInFormSoon_frame___block_invoke(uint64_t a1)
{
  id v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[29], "invalidate");
    v2 = WeakRetained[29];
    WeakRetained[29] = 0;

    if (*((_BYTE *)WeakRetained + 284))
      objc_msgSend(WeakRetained, "setAutoFillSpinnerVisibility:textFieldMetadata:frame:", 1, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

void __82___SFFormAutoFillController_stopShowingSpinnerInFormSoon_textFieldMetadata_frame___block_invoke(uint64_t a1)
{
  id v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[30], "invalidate");
    v2 = WeakRetained[30];
    WeakRetained[30] = 0;

    objc_msgSend(WeakRetained, "setAutoFillSpinnerVisibility:textFieldMetadata:frame:", 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

void __99___SFFormAutoFillController__collectDiagnosticsForAutoFillIncludingPageContents_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setFormMetadata:");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __89___SFFormAutoFillController__presentAutoFillInternalFeedbackActivityNotificationIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend(*(id *)(a1 + 32), "presentAutoFillInternalFeedbackToastForFormAutoFillController:diagnosticsDataWithoutPageContents:", WeakRetained, v4);

}

id __64___SFFormAutoFillController__addValuesAutoFilledForCurrentPage___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v2, "stringValue");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
LABEL_7:

  return v4;
}

void __66___SFFormAutoFillController_fetchIconForURLWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "touchIcon");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

uint64_t __83___SFFormAutoFillController_handleDidSaveAccountWithGeneratedPasswordNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissKeyboardAndSimulateCarriageReturnKeyEvents:", 0);
}

uint64_t __83___SFFormAutoFillController_handleDidSaveAccountWithGeneratedPasswordNotification___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showICloudKeychainViewInCurrentInputView");
}

void __83___SFFormAutoFillController_handleDidSaveAccountWithGeneratedPasswordNotification___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  _QWORD block[5];
  id v5;
  uint64_t v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83___SFFormAutoFillController_handleDidSaveAccountWithGeneratedPasswordNotification___block_invoke_4;
  block[3] = &unk_1E4AC24D0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v6 = a2;
  block[4] = v2;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __83___SFFormAutoFillController_handleDidSaveAccountWithGeneratedPasswordNotification___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  if (*(_QWORD *)(a1 + 48) == 2)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A3B2D000, v2, OS_LOG_TYPE_DEFAULT, "Scheduling account saved notification", v9, 2u);
    }
    objc_msgSend(MEMORY[0x1E0D8AAC8], "sharedNotificationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "schedulePasswordSavedNotificationForSavedAccount:completionHandler:", *(_QWORD *)(a1 + 40), &__block_literal_global_1217);

    objc_msgSend(*(id *)(a1 + 32), "_dismissKeyboardAndSimulateCarriageReturnKeyEvents:", 0);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 281) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_customInputViewFromAutoFillInputSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_DEFAULT, "Transitioning AutoFill view to Strong Password Saved view", buf, 2u);
      }
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D6C088]), "initWithMode:", 2);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 264);
      *(_QWORD *)(v7 + 264) = v6;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "setDelegate:");
      objc_msgSend(v4, "replaceContentsOfViewWithStrongPasswordIntroductionViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264));
    }

  }
}

@end
