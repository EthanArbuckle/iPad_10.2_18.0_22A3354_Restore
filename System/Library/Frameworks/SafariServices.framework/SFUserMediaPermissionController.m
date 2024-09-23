@implementation SFUserMediaPermissionController

void __54___SFUserMediaPermissionController_savePendingChanges__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  v2 = WBS_LOG_CHANNEL_PREFIXUserMediaCapture();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __54___SFUserMediaPermissionController_savePendingChanges__block_invoke_cold_1(v2);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

}

void __54___SFUserMediaPermissionController_savePendingChanges__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

}

uint64_t __85___SFUserMediaPermissionController_coalescedAsynchronousWriter_didFinishWritingData___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CB35B0], "_sf_postPerSitePreferencesDidChangeDistributedNotification");
}

uint64_t __125___SFUserMediaPermissionController_requestUserMediaAuthorizationForDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didRetrieveUserMediaPermission:forDevices:url:mainFrameURL:decisionHandler:dialogPresenter:", a2, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

uint64_t __128___SFUserMediaPermissionController__didRetrieveUserMediaPermission_forDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __128___SFUserMediaPermissionController__didRetrieveUserMediaPermission_forDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __128___SFUserMediaPermissionController__didRetrieveUserMediaPermission_forDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  __int16 v24;

  objc_msgSend(*(id *)(a1 + 32), "safari_userVisibleString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "safari_isSafariWebExtensionURL"))
  {
    objc_msgSend(*(id *)(a1 + 40), "safari_userVisibleHostOrExtensionDisplayName");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  objc_msgSend(*(id *)(a1 + 48), "permissionDialogThrottler");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __128___SFUserMediaPermissionController__didRetrieveUserMediaPermission_forDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke_4;
    v20[3] = &unk_1E4AC2728;
    v24 = *(_WORD *)(a1 + 96);
    v8 = *(void **)(a1 + 64);
    v20[4] = *(_QWORD *)(a1 + 56);
    v21 = v8;
    v22 = *(id *)(a1 + 72);
    v23 = *(id *)(a1 + 80);
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __128___SFUserMediaPermissionController__didRetrieveUserMediaPermission_forDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke_5;
    v13[3] = &unk_1E4AC2750;
    v18 = (id)MEMORY[0x1A8598C40](v20);
    v14 = *(id *)(a1 + 48);
    v15 = v3;
    v19 = *(_QWORD *)(a1 + 88);
    v9 = *(_QWORD *)(a1 + 56);
    v16 = v6;
    v17 = v9;
    v10 = v6;
    v11 = v3;
    v12 = v18;
    objc_msgSend(v10, "requestPermissionDialogPresentation:", v13);

  }
  else
  {
    __break(0xC471u);
  }
}

uint64_t __128___SFUserMediaPermissionController__didRetrieveUserMediaPermission_forDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = 2;
  if (a2)
    v3 = 4;
  v4 = 16;
  if (a2)
    v4 = 32;
  if (!*(_BYTE *)(a1 + 64))
    v3 = 0;
  if (*(_BYTE *)(a1 + 65))
    v5 = v4;
  else
    v5 = 0;
  objc_msgSend(*(id *)(a1 + 32), "setPermission:expirationPolicy:forOrigin:topLevelOrigin:", v5 | v3, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __128___SFUserMediaPermissionController__didRetrieveUserMediaPermission_forDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke_5(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12;
  id v13;

  if ((a2 & 1) != 0)
  {
    v3 = (void *)MEMORY[0x1E0D4EC60];
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 72);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __128___SFUserMediaPermissionController__didRetrieveUserMediaPermission_forDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke_6;
    v11 = &unk_1E4AC18A0;
    v12 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 64);
    objc_msgSend(v3, "userMediaPermissionDialogWithHost:permissions:completionHandler:", v5, v6, &v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentDialog:sender:", v7, *(_QWORD *)(a1 + 56), v8, v9, v10, v11);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

uint64_t __128___SFUserMediaPermissionController__didRetrieveUserMediaPermission_forDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke_6(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "didCompletePermissionDialog:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __54___SFUserMediaPermissionController_savePendingChanges__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_ERROR, "Failed to save permissions before app suspend", v1, 2u);
}

@end
