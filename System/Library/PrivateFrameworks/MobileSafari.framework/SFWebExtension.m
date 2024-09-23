@implementation SFWebExtension

- (WKWebViewConfiguration)extensionWebViewConfiguration
{
  void *v2;
  void *v3;

  -[WBSWebExtensionData webKitContext](self, "webKitContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webViewConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WKWebViewConfiguration *)v3;
}

- (BOOL)_applicationIsActive
{
  return objc_msgSend((id)*MEMORY[0x1E0DC4730], "applicationState") == 0;
}

- (void)promptForAccessToURLs:(id)a3 inTab:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id, _QWORD);
  void *v11;
  id v12;
  void *v13;
  id accessRequestDialogCompletionHandler;
  void *v15;
  void *v16;
  uint64_t v17;
  void (**v18)(_QWORD);
  void *v19;
  char v20;
  void *v21;
  void *v22;
  BOOL v23;
  char v24;
  double v25;
  double v26;
  char v27;
  dispatch_time_t v28;
  uint64_t v29;
  dispatch_time_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  objc_class *v35;
  void *v36;
  _QWORD v37[4];
  void (**v38)(id, id, _QWORD);
  _QWORD v39[4];
  void (**v40)(id, id, _QWORD);
  _QWORD block[4];
  id v42;
  _QWORD v43[4];
  id v44;
  SFWebExtension *v45;
  id v46;
  _QWORD aBlock[4];
  id v48;
  id v49;
  id v50;
  void (**v51)(id, id, _QWORD);
  id v52;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id, _QWORD))a5;
  objc_initWeak(location, self);
  if (!self->_isAccessRequestDialogPresentedOrScheduled)
  {
    if (!objc_msgSend(v8, "count"))
    {
      v10[2](v10, v8, 0);
      goto LABEL_25;
    }
    -[WBSSafariExtension extensionsController](self, "extensionsController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "parentalControlsAreEnabledForExtensions"))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v16, 0);
LABEL_24:

      goto LABEL_25;
    }
    v17 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke_2;
    v43[3] = &unk_1E21E55F0;
    v44 = v8;
    v45 = self;
    v46 = v9;
    v18 = (void (**)(_QWORD))_Block_copy(v43);
    -[WBSWebExtensionData toolbarItem](self, "toolbarItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "showingExtensionPopup");

    if ((v20 & 1) != 0)
    {
      v18[2](v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "count"))
      {
        v37[0] = v17;
        v37[1] = 3221225472;
        v37[2] = __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke_6;
        v37[3] = &unk_1E21E2608;
        v38 = v10;
        -[SFWebExtension _showAccessRequestDialogForPendingRequestsAndAdditionalURLs:additionalCallingAPIName:performingUserGestureInTab:completionHandler:](self, "_showAccessRequestDialogForPendingRequestsAndAdditionalURLs:additionalCallingAPIName:performingUserGestureInTab:completionHandler:", v21, 0, 0, v37);
        v22 = v38;
LABEL_22:

LABEL_23:
        v16 = v44;
        goto LABEL_24;
      }
    }
    else
    {
      v23 = -[WBSWebExtensionData hasPendingWebsiteRequests](self, "hasPendingWebsiteRequests");
      v18[2](v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "count"))
        v24 = 1;
      else
        v24 = v23;
      if ((v24 & 1) != 0)
      {
        +[WBSWebExtensionsController pendingSiteAccessTimeoutInterval](SFWebExtensionsController, "pendingSiteAccessTimeoutInterval");
        v26 = v25;
        v27 = v25 > 0.0 || v23;
        if ((v27 & 1) != 0)
        {
          v28 = dispatch_time(0, (uint64_t)((v25 + 1.0) * 1000000000.0));
          v29 = v17;
          v30 = v28;
          block[0] = v29;
          block[1] = 3221225472;
          block[2] = __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke_4;
          block[3] = &unk_1E21E2AE8;
          objc_copyWeak(&v42, location);
          dispatch_after(v30, MEMORY[0x1E0C80D38], block);
          v31 = objc_alloc_init(MEMORY[0x1E0D8ADB8]);
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v26);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setExpirationDate:", v32);

          objc_msgSend(v31, "setUrls:", v21);
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke_5;
          v39[3] = &unk_1E21E4698;
          v40 = v10;
          objc_msgSend(v31, "setCompletionHandler:", v39);
          v33 = (int)*MEMORY[0x1E0D8AE20];
          v34 = *(Class *)((char *)&self->super.super.super.isa + v33);
          if (!v34)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v35 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v36 = *(Class *)((char *)&self->super.super.super.isa + v33);
            *(Class *)((char *)&self->super.super.super.isa + v33) = v35;

            v34 = *(Class *)((char *)&self->super.super.super.isa + v33);
          }
          objc_msgSend(v34, "addObject:", v31);
          -[WBSWebExtensionData _validateToolbarItemInAllWindows](self, "_validateToolbarItemInAllWindows");

          objc_destroyWeak(&v42);
          goto LABEL_23;
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v22, 0);
    goto LABEL_22;
  }
  v11 = _Block_copy(self->_accessRequestDialogCompletionHandler);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke;
  aBlock[3] = &unk_1E21E55A0;
  objc_copyWeak(&v52, location);
  v50 = v11;
  v48 = v8;
  v49 = v9;
  v51 = v10;
  v12 = v11;
  v13 = _Block_copy(aBlock);
  accessRequestDialogCompletionHandler = self->_accessRequestDialogCompletionHandler;
  self->_accessRequestDialogCompletionHandler = v13;

  objc_destroyWeak(&v52);
LABEL_25:
  objc_destroyWeak(location);

}

void __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = WeakRetained;
    if (v3)
    {
      (*(void (**)(void))(v3 + 16))();
      WeakRetained = v4;
    }
    objc_msgSend(WeakRetained, "promptForAccessToURLs:inTab:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    WeakRetained = v4;
  }

}

id __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke_3;
  v4[3] = &unk_1E21E55C8;
  v1 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v1, "safari_mapAndFilterObjectsUsingBlock:", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "webKitContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "permissionStatusForURL:inTab:", v3, *(_QWORD *)(a1 + 40));

  if (v5 == 1 || v5 == -1)
    v7 = v3;
  else
    v7 = 0;

  return v7;
}

void __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "dispatchExpiredPendingWebsiteRequests");
    WeakRetained = v2;
  }

}

void __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

void __64__SFWebExtension_promptForAccessToURLs_inTab_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)_showAccessRequestDialogForPendingRequestsAndAdditionalURLs:(id)a3 additionalCallingAPIName:(id)a4 performingUserGestureInTab:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  void (**v29)(void *, uint64_t, _QWORD);
  void *v30;
  void *v31;
  void *v32;
  SFWebExtension *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  SFWebExtension *v42;
  id v43;
  void (**v44)(void *, uint64_t, _QWORD);
  BOOL v45;
  BOOL v46;
  _QWORD aBlock[4];
  id v48;
  SFWebExtension *v49;
  id v50;
  id v51;

  v39 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[WBSWebExtensionData urlsPendingApproval](self, "urlsPendingApproval");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v13, "count");
  if (v13)
  {
    v14 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
  if (v39)
  {
    objc_msgSend(v14, "setByAddingObjectsFromSet:", v39);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  objc_msgSend(v15, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isAccessRequestDialogPresentedOrScheduled = 1;
  -[WBSWebExtensionData apiNamesPendingApproval](self, "apiNamesPendingApproval");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;

  v37 = v10;
  if (v10)
  {
    objc_msgSend(v20, "setByAddingObject:", v10);
    v21 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v21;
  }
  objc_msgSend(v20, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "componentsJoinedByString:", CFSTR(", "));
  v35 = objc_claimAutoreleasedReturnValue();

  v23 = -[WBSWebExtensionData hasMoreThanOneRequestedOriginNotAlreadyConfigured](self, "hasMoreThanOneRequestedOriginNotAlreadyConfigured");
  -[WBSSafariExtension extensionsController](self, "extensionsController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __148__SFWebExtension__showAccessRequestDialogForPendingRequestsAndAdditionalURLs_additionalCallingAPIName_performingUserGestureInTab_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E21E5698;
  v26 = v11;
  v48 = v26;
  v49 = self;
  v27 = v15;
  v50 = v27;
  v28 = v12;
  v51 = v28;
  v29 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
  v38 = v13;
  if (objc_msgSend(v24, "parentalControlsAreEnabledForExtensions"))
  {
    v29[2](v29, 3, 0);
    v31 = v36;
    v30 = v37;
    v32 = (void *)v35;
  }
  else
  {
    v40[0] = v25;
    v40[1] = 3221225472;
    v40[2] = __148__SFWebExtension__showAccessRequestDialogForPendingRequestsAndAdditionalURLs_additionalCallingAPIName_performingUserGestureInTab_completionHandler___block_invoke_4;
    v40[3] = &unk_1E21E56C0;
    v45 = v23;
    v41 = v24;
    v42 = self;
    v31 = v36;
    v43 = v36;
    v46 = v34 != 0;
    v44 = v29;
    v33 = self;
    v32 = (void *)v35;
    objc_msgSend(v41, "showAccessRequestDialogForExtension:domains:callingAPIName:showMoreOptionsForAlwaysAllow:includeDenyButton:responseBlock:", v33, v43, v35, v23, v34 != 0, v40);

    v30 = v37;
  }

}

id __148__SFWebExtension__showAccessRequestDialogForPendingRequestsAndAdditionalURLs_additionalCallingAPIName_performingUserGestureInTab_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_stringByRemovingWwwAndWildcardDotPrefixes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __148__SFWebExtension__showAccessRequestDialogForPendingRequestsAndAdditionalURLs_additionalCallingAPIName_performingUserGestureInTab_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void (**v24)(_QWORD);
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a2 - 4) <= 0xFFFFFFFFFFFFFFFDLL && *(_QWORD *)(a1 + 32) != 0)
    objc_msgSend(*(id *)(a1 + 40), "userGesturePerformedInTab:");
  if (a3)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "requestsAccessToAllHosts"))
      objc_msgSend(MEMORY[0x1E0D8ADA8], "allHostsAndSchemesMatchPatternSet");
    else
      objc_msgSend(*(id *)(a1 + 40), "requestedPermissionOriginsNotAlreadyConfigured");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_14);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v7;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "extensionsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allProfileExtensionsControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v11)
  {
    v13 = 0;
    goto LABEL_29;
  }
  v12 = v11;
  v13 = 0;
  v14 = *(_QWORD *)v29;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v29 != v14)
        objc_enumerationMutation(v10);
      v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
      objc_msgSend(*(id *)(a1 + 40), "extension");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "webExtensionForExtension:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "loadPermissionsIfNecessaryForExtension:", v18);
      if (a2 == 2)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "revokePermissions:origins:expirationDate:", v19, v27, v22);
      }
      else
      {
        if (a2 == 1)
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "set");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)MEMORY[0x1E0C99D68];
          +[WBSExtensionsController temporarySiteAccessTimeInterval](SFWebExtensionsController, "temporarySiteAccessTimeInterval");
          objc_msgSend(v21, "dateWithTimeIntervalSinceNow:");
          v20 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (a2)
            goto LABEL_25;
          objc_msgSend(MEMORY[0x1E0C99E60], "set");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
          v20 = objc_claimAutoreleasedReturnValue();
        }
        v22 = (void *)v20;
        objc_msgSend(v18, "grantPermissions:origins:expirationDate:", v19, v27, v20);
        v13 = 1;
      }

LABEL_25:
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  }
  while (v12);
LABEL_29:

  objc_msgSend(*(id *)(a1 + 40), "dispatchAllPendingWebsiteRequests");
  v23 = *(_QWORD *)(a1 + 56);
  if (v23)
    (*(void (**)(uint64_t, _QWORD))(v23 + 16))(v23, v13 & 1);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 240) = 0;
  v24 = (void (**)(_QWORD))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 40) + 232));
  v25 = *(_QWORD *)(a1 + 40);
  v26 = *(void **)(v25 + 232);
  *(_QWORD *)(v25 + 232) = 0;

  if (v24)
    v24[2](v24);

}

id __148__SFWebExtension__showAccessRequestDialogForPendingRequestsAndAdditionalURLs_additionalCallingAPIName_performingUserGestureInTab_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D8ADA8];
  objc_msgSend(a2, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_stringByRemovingWwwDotPrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "matchPatternForDomain:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __148__SFWebExtension__showAccessRequestDialogForPendingRequestsAndAdditionalURLs_additionalCallingAPIName_performingUserGestureInTab_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2 || !*(_BYTE *)(a1 + 64))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "showAlwaysAllowConfirmationDialogForExtension:domains:includeDenyButton:responseBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 65), *(_QWORD *)(a1 + 56));
}

- (id)_updateLastInteractionDate
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[WBSSafariExtension extensionsController](self, "extensionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)*MEMORY[0x1E0D8AE18];
  objc_msgSend(v3, "_extensionStateForExtension:", *(Class *)((char *)&self->super.super.super.isa + v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("LastInteractionDate"));
  objc_msgSend(v3, "_setExtensionState:forExtension:", v6, *(Class *)((char *)&self->super.super.super.isa + v4));

  return v7;
}

- (id)_lastInteractionDate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[WBSSafariExtension extensionsController](self, "extensionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_extensionStateForExtension:", *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0D8AE18]));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_dateForKey:", CFSTR("LastInteractionDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    -[SFWebExtension _updateLastInteractionDate](self, "_updateLastInteractionDate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)_hidePermissionBanner
{
  void *v3;

  if (self->_isBannerShownOrScheduled)
  {
    -[WBSSafariExtension extensionsController](self, "extensionsController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hidePermissionBannerForExtension:", self);

    self->_isBannerShownOrScheduled = 0;
  }
}

- (BOOL)_canShowBanner
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  -[SFWebExtension _lastInteractionDate](self, "_lastInteractionDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingTimeInterval:", 480.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v3);
  v6 = v5 < 0.0;

  return v6;
}

- (void)showOrHidePermissionRequestBannerIfNeeded
{
  void *v3;
  id v4;

  -[WBSSafariExtension extensionsController](self, "extensionsController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (-[WBSWebExtensionData hasPendingWebsiteRequests](self, "hasPendingWebsiteRequests")
    && -[SFWebExtension _canShowBanner](self, "_canShowBanner"))
  {
    v3 = v4;
    if (!self->_isBannerShownOrScheduled)
    {
      objc_msgSend(v4, "showPermissionBannerForExtension:", self);
      v3 = v4;
      self->_isBannerShownOrScheduled = 1;
    }
  }
  else
  {
    v3 = v4;
    if (self->_isBannerShownOrScheduled)
    {
      objc_msgSend(v4, "hidePermissionBannerForExtension:", self);
      v3 = v4;
      self->_isBannerShownOrScheduled = 0;
    }
  }

}

- (void)permissionRequestBannerWasDismissed
{
  id v3;

  -[WBSSafariExtension extensionsController](self, "extensionsController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionData dispatchAllPendingWebsiteRequests](self, "dispatchAllPendingWebsiteRequests");

}

- (void)showAlertForPendingPermissionRequests
{
  id v3;

  -[WBSSafariExtension extensionsController](self, "extensionsController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SFWebExtension _showAccessRequestDialogForPendingRequestsAndAdditionalURLs:additionalCallingAPIName:performingUserGestureInTab:completionHandler:](self, "_showAccessRequestDialogForPendingRequestsAndAdditionalURLs:additionalCallingAPIName:performingUserGestureInTab:completionHandler:", 0, 0, 0, 0);

}

- (void)requestPermissionsFromToolbarItemInTab:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[WBSWebExtensionData toolbarItem](self, "toolbarItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldRequestAccessForTab:", v13);

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v13, "urlForExtensions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = CFSTR("action");
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  -[SFWebExtension _showAccessRequestDialogForPendingRequestsAndAdditionalURLs:additionalCallingAPIName:performingUserGestureInTab:completionHandler:](self, "_showAccessRequestDialogForPendingRequestsAndAdditionalURLs:additionalCallingAPIName:performingUserGestureInTab:completionHandler:", v11, v12, v13, v6);

}

- (BOOL)canLoadWithErrorString:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  if (-[WBSWebExtensionData backgroundPageIsPersistent](self, "backgroundPageIsPersistent"))
  {
    -[WBSWebExtensionData manifestErrors](self, "manifestErrors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (a3)
    {
      if (objc_msgSend(v5, "count"))
      {
        objc_msgSend(v6, "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedDescription");
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

    return 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SFWebExtension;
    return -[WBSWebExtensionData canLoadWithErrorString:](&v9, sel_canLoadWithErrorString_, a3);
  }
}

- (void)userGesturePerformedInTab:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFWebExtension;
  -[WBSWebExtensionData userGesturePerformedInTab:](&v6, sel_userGesturePerformedInTab_, a3);
  v4 = -[SFWebExtension _updateLastInteractionDate](self, "_updateLastInteractionDate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", *MEMORY[0x1E0D8B718], self);

}

- (BOOL)isDevelopmentBuild
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0D8AE18]), "_plugIn");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safari_BOOLForKey:", CFSTR("get-task-allow"));

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accessRequestDialogCompletionHandler, 0);
}

@end
