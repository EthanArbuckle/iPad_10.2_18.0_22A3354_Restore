@implementation SFGeolocationPermissionManager

void __48___SFGeolocationPermissionManager_sharedManager__block_invoke()
{
  _SFGeolocationPermissionManager *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [_SFGeolocationPermissionManager alloc];
  objc_msgSend(MEMORY[0x1E0D8AAE0], "sharedStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[WBSGeolocationPreferenceManager initWithPerSitePreferencesStore:](v0, "initWithPerSitePreferencesStore:", v3);
  v2 = (void *)sharedManager_instance;
  sharedManager_instance = v1;

}

void __99___SFGeolocationPermissionManager_requestPermissionForURL_frame_dialogPresenter_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;

  switch(a2)
  {
    case 0:
      goto LABEL_4;
    case 1:
    case 3:
      v5 = *(id *)(a1 + 64);
      WBSRespondWithRandomDelay();
      v3 = v5;
      goto LABEL_6;
    case 2:
    case 4:
      if ((objc_msgSend(MEMORY[0x1E0D8AD68], "isLockdownModeEnabledForSafari") & 1) != 0)
      {
LABEL_4:
        objc_msgSend(*(id *)(a1 + 32), "_showDialogRequestingPermissionForURL:frame:dialogPresenter:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
      }
      else
      {
        v4 = *(id *)(a1 + 64);
        WBSRespondWithRandomDelay();
        v3 = v4;
LABEL_6:

      }
      return;
    default:
      return;
  }
}

uint64_t __99___SFGeolocationPermissionManager_requestPermissionForURL_frame_dialogPresenter_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __99___SFGeolocationPermissionManager_requestPermissionForURL_frame_dialogPresenter_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __113___SFGeolocationPermissionManager__showDialogRequestingPermissionForURL_frame_dialogPresenter_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = a2;
  objc_msgSend(*(id *)(a1 + 32), "didCompletePermissionDialog:", a2);
  objc_msgSend(*(id *)(a1 + 40), "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "webui_privateBrowsingEnabled") & 1) != 0)
  {

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);

    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 48);
      v7 = *(void **)(*(_QWORD *)(a1 + 56) + 48);
      if (v2)
        objc_msgSend(v7, "didAuthorizeGeolocationForPromptInfo:", v6);
      else
        objc_msgSend(v7, "didDenyGeolocationForPromptInfo:", v6);
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __113___SFGeolocationPermissionManager__showDialogRequestingPermissionForURL_frame_dialogPresenter_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  id v3;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D4EC60], "websiteLocationDialogForURL:preciseLocation:completionHandler:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "hasPreciseLocationPermission"), *(_QWORD *)(a1 + 56));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "presentDialog:sender:", v3, *(_QWORD *)(a1 + 40));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

@end
