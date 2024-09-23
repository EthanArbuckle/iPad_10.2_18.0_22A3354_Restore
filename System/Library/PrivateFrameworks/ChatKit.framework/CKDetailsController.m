@implementation CKDetailsController

- (BOOL)fmfEnabled
{
  void *v2;
  void *v3;
  char v4;
  void *v5;

  -[CKDetailsController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSMS");

  objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = (objc_msgSend(v5, "disableLocationSharing") | v4) ^ 1;

  return (char)v3;
}

- (BOOL)fmfRestricted
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "restrictLocationSharing");

  return v3;
}

- (BOOL)shouldShowFooterInLocationSection:(int64_t)a3
{
  _BOOL4 v5;
  _BOOL8 v6;
  void *v7;
  uint64_t v8;

  v5 = -[CKDetailsController shouldShowFMFView](self, "shouldShowFMFView");
  v6 = -[CKDetailsController allRecipientsAlreadyFollowingLocation](self, "allRecipientsAlreadyFollowingLocation");
  -[CKDetailsController conversation](self, "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[CKDetailsControllerLocationHelper numberOfCellsInLocationSectionWithConversation:isFMFEnabled:isSharingLocation:shouldShowFMFView:](_TtC7ChatKit33CKDetailsControllerLocationHelper, "numberOfCellsInLocationSectionWithConversation:isFMFEnabled:isSharingLocation:shouldShowFMFView:", v7, -[CKDetailsController fmfEnabled](self, "fmfEnabled"), v6, -[CKDetailsController shouldShowFMFView](self, "shouldShowFMFView"));

  return (a3 == 3 && v5 || a3 == 7 && !v5 && v8 >= 1)
      && -[CKDetailsController shouldShowActiveDeviceSwitchFooter](self, "shouldShowActiveDeviceSwitchFooter");
}

- (void)stageCurrentLocation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  objc_msgSend(MEMORY[0x1E0D35858], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && objc_msgSend(v3, "locationAuthorizationDetermined")
    && (objc_msgSend(v3, "locationAuthorizationDenied") & 1) == 0)
  {
    -[CKDetailsController conversation](self, "conversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKDetailsControllerLocationHelper mapURLFor:in:](_TtC7ChatKit33CKDetailsControllerLocationHelper, "mapURLFor:in:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKDetailsController _stageCurrentLocationInEntryViewForURL:](self, "_stageCurrentLocationInEntryViewForURL:", v6);
  }
  else
  {
    location = 0;
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__CKDetailsController_Location__stageCurrentLocation__block_invoke_2;
    v7[3] = &unk_1E274BA40;
    v8 = v4;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v3, "startUpdatingCurrentLocationWithAuthorizedHandler:updateHandler:", &__block_literal_global_11, v7);
    objc_destroyWeak(&v9);

    objc_destroyWeak(&location);
  }

}

void __53__CKDetailsController_Location__stageCurrentLocation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "code") != 42)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v7;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Received unknown error while trying to send current location: %@. Aborting _stageCurrentLocation.", (uint8_t *)&v15, 0xCu);
      }

    }
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained(v9);
    objc_msgSend(WeakRetained, "conversation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKDetailsControllerLocationHelper mapURLFor:in:](_TtC7ChatKit33CKDetailsControllerLocationHelper, "mapURLFor:in:", v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_loadWeakRetained(v9);
    objc_msgSend(v13, "_stageCurrentLocationInEntryViewForURL:", v12);

  }
}

- (void)_stageCurrentLocationInEntryViewForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  CKDetailsController *v13;

  v4 = a3;
  -[CKDetailsController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "authorizationToSendCurrentLocationMessageDenied"))
  {
    -[CKDetailsController currentLocationDeniedAlert](self, "currentLocationDeniedAlert");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentFromViewController:animated:completion:", self, 1, 0);

  }
  else if (objc_msgSend(v6, "canSendCurrentLocationMessage"))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CC11E0]);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__CKDetailsController_Location___stageCurrentLocationInEntryViewForURL___block_invoke;
    block[3] = &unk_1E274A0B8;
    v11 = v8;
    v12 = v4;
    v13 = self;
    v9 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __72__CKDetailsController_Location___stageCurrentLocationInEntryViewForURL___block_invoke(uint64_t a1)
{
  void *v1;
  int8x16_t v2;
  _QWORD v3[4];
  int8x16_t v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__CKDetailsController_Location___stageCurrentLocationInEntryViewForURL___block_invoke_2;
  v3[3] = &unk_1E274BA90;
  v2 = *(int8x16_t *)(a1 + 40);
  v4 = vextq_s8(v2, v2, 8uLL);
  objc_msgSend(v1, "startFetchingMetadataForURL:completionHandler:", (id)v2.i64[0], v3);

}

void __72__CKDetailsController_Location___stageCurrentLocationInEntryViewForURL___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loginIMHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v9);

  objc_msgSend(v4, "setURL:", *(_QWORD *)(a1 + 40));
  +[CKBrowserItemPayload createBrowserItemPayloadWithRichLinkMetadata:](CKBrowserItemPayload, "createBrowserItemPayloadWithRichLinkMetadata:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__CKDetailsController_Location___stageCurrentLocationInEntryViewForURL___block_invoke_3;
  v11[3] = &unk_1E274BA68;
  v11[4] = *(_QWORD *)(a1 + 32);
  +[CKComposition compositionWithShelfPluginPayload:completionHandler:](CKComposition, "compositionWithShelfPluginPayload:completionHandler:", v10, v11);

}

void __72__CKDetailsController_Location___stageCurrentLocationInEntryViewForURL___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "detailsControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "detailsControllerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "detailsController:wantsToStageComposition:", *(_QWORD *)(a1 + 32), v6);

  }
}

- (id)currentLocationDeniedAlert
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("TURN_ON_LOCATION_SERVICES_TO_SEND_LOCATION"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v3, 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v7);

  CKFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SETTINGS"), &stru_1E276D870, CFSTR("ChatKit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v9, 0, &__block_literal_global_72_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addAction:", v10);
  return v4;
}

void __59__CKDetailsController_Location__currentLocationDeniedAlert__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=Privacy&path=LOCATION"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, 0);

}

- (void)shareLocationAction
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  if (-[CKDetailsController allRecipientsAlreadyFollowingLocation](self, "allRecipientsAlreadyFollowingLocation"))
  {
    -[CKDetailsController conversation](self, "conversation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "chat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopSharingLocation");

    -[CKDetailsController reloadTableView](self, "reloadTableView");
    -[CKDetailsController _notifyDelegateDidSelectStopSharingLocation](self, "_notifyDelegateDidSelectStopSharingLocation");
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "We reached -[CKDetailsController tableView:didSelectRowAtIndexPath:] for CKDetailsLocationShareSection, CKLocationShareFMFRow while currently sharing the user's location, but this should have been handled by the cell's embedded UIButton.", v6, 2u);
    }

  }
}

- (BOOL)allRecipientsAlreadyFollowingLocation
{
  void *v2;
  void *v3;
  char v4;

  -[CKDetailsController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allRecipientsFollowingLocation");

  return v4;
}

- (void)detailsController:(id)a3 didSelectSendLocationMessage:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  int v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint8_t v22[8];
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isWaldoEnabled");

  if (v12)
  {
    -[CKDetailsController findMyWaldoMapViewController](self, "findMyWaldoMapViewController");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 == v8)
    {
      +[CKComposition compositionWithMSMessage:appExtensionIdentifier:](CKComposition, "compositionWithMSMessage:appExtensionIdentifier:", v9, *MEMORY[0x1E0D37508]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsController detailsControllerDelegate](self, "detailsControllerDelegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) != 0)
      {
        -[CKDetailsController detailsControllerDelegate](self, "detailsControllerDelegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "detailsController:wantsToStageComposition:", self, v18);

      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "CKDetails detailsController:didSelectSendLocationMessage: details controller is not our current map controller. Aborting.", v22, 2u);
        }

      }
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB2938];
      v24[0] = CFSTR("FMFMapViewController is not referenced by CKDetailsController. Aborting message send.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ChatKit.CKDetailsController"), 0, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v10[2](v10, v17);
    }
  }

}

- (void)_notifyDelegateDidSelectStopSharingLocation
{
  void *v3;
  char v4;
  id v5;

  -[CKDetailsController detailsControllerDelegate](self, "detailsControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CKDetailsController detailsControllerDelegate](self, "detailsControllerDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "detailsControllerDidSelectStopSharingLocation:", self);

  }
}

- (void)setupFMF
{
  void *v3;
  void *v4;
  void *v5;

  if (-[CKDetailsController fmfEnabled](self, "fmfEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleActiveDeviceChanged_, *MEMORY[0x1E0D35558], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handleFriendshipStatusChanged_, *MEMORY[0x1E0D35570], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleLocationChanged_, *MEMORY[0x1E0D35568], 0);

    -[CKDetailsController setupFMFTimerIfNecessary](self, "setupFMFTimerIfNecessary");
  }
}

- (void)setupFMFTimerIfNecessary
{
  _BOOL4 v3;
  void *v4;
  id v5;
  id v6;

  if (-[CKDetailsController fmfEnabled](self, "fmfEnabled"))
  {
    v3 = -[CKDetailsController _fmfExpirationDateIsValid](self, "_fmfExpirationDateIsValid");
    -[CKDetailsController fmfUpdateTimer](self, "fmfUpdateTimer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (-[CKDetailsController allRecipientsAlreadyFollowingLocation](self, "allRecipientsAlreadyFollowingLocation")
      || v3)
    {
      v4 = v5;
      if (!v5)
      {
        objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_updateTimedFMFState, 0, 1, 60.0);
        v6 = (id)objc_claimAutoreleasedReturnValue();
        -[CKDetailsController setFmfUpdateTimer:](self, "setFmfUpdateTimer:", v6);
        v4 = v6;
      }
    }
    else
    {
      objc_msgSend(v5, "invalidate");

      v4 = 0;
    }

  }
}

- (void)sendCurrentLocation
{
  void *v3;
  void *v4;
  id v5;

  -[CKDetailsController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chat");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "authorizationToSendCurrentLocationMessageDenied"))
  {
    -[CKDetailsController currentLocationDeniedAlert](self, "currentLocationDeniedAlert");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentFromViewController:animated:completion:", self, 1, 0);

  }
  else if (objc_msgSend(v5, "canSendCurrentLocationMessage"))
  {
    objc_msgSend(v5, "sendCurrentLocationMessage");
    -[CKDetailsController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (id)locationShareMenu
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD aBlock[4];
  id v39;
  id location[2];

  -[CKDetailsController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsCapabilities:", 4096);

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    location[0] = 0;
    objc_initWeak(location, self);
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__CKDetailsController_Location__locationShareMenu__block_invoke;
    aBlock[3] = &unk_1E274BAD8;
    objc_copyWeak(&v39, location);
    v8 = _Block_copy(aBlock);
    v9 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SHARE_LOCATION_ONE_HOUR"), &stru_1E276D870, CFSTR("ChatKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("clock"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v7;
    v35[1] = 3221225472;
    v35[2] = __50__CKDetailsController_Location__locationShareMenu__block_invoke_2;
    v35[3] = &unk_1E274BB00;
    objc_copyWeak(&v37, location);
    v13 = v8;
    v36 = v13;
    objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v11, v12, 0, v35);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v14);
    v15 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SHARE_LOCATION_EOD"), &stru_1E276D870, CFSTR("ChatKit"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("calendar"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __50__CKDetailsController_Location__locationShareMenu__block_invoke_3;
    v32[3] = &unk_1E274BB00;
    objc_copyWeak(&v34, location);
    v19 = v13;
    v33 = v19;
    objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", v17, v18, 0, v32);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v20);
    v21 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("SHARE_INDEFINITELY"), &stru_1E276D870, CFSTR("ChatKit"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("infinity"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __50__CKDetailsController_Location__locationShareMenu__block_invoke_4;
    v29[3] = &unk_1E274BB00;
    objc_copyWeak(&v31, location);
    v25 = v19;
    v30 = v25;
    objc_msgSend(v21, "actionWithTitle:image:identifier:handler:", v23, v24, 0, v29);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v26);
    objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E276D870, v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v34);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    objc_destroyWeak(location);

  }
  else
  {
    v27 = 0;
  }
  return v27;
}

void __50__CKDetailsController_Location__locationShareMenu__block_invoke(uint64_t a1, uint64_t a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shareLocationWithDuration:", a2);

  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "reloadTableView");

}

void __50__CKDetailsController_Location__locationShareMenu__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWaldoEnabled");

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_stageLocationShareComposition:", 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __50__CKDetailsController_Location__locationShareMenu__block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWaldoEnabled");

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_stageLocationShareComposition:", 1);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __50__CKDetailsController_Location__locationShareMenu__block_invoke_4(uint64_t a1)
{
  void *v2;
  int v3;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWaldoEnabled");

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_stageLocationShareComposition:", 2);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (void)_stageLocationShareComposition:(int64_t)a3
{
  void *v5;
  int v6;
  id MSMessageClass;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isWaldoEnabled");

  if (v6)
  {
    MSMessageClass = getMSMessageClass();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MSMessageClass, "findMyLocationShareMessageWithDuration:", a3);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      +[CKComposition compositionWithMSMessage:appExtensionIdentifier:](CKComposition, "compositionWithMSMessage:appExtensionIdentifier:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsController detailsControllerDelegate](self, "detailsControllerDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        -[CKDetailsController _evaluateMetricsForStagingLocation](self, "_evaluateMetricsForStagingLocation");
        -[CKDetailsController detailsControllerDelegate](self, "detailsControllerDelegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "detailsController:wantsToStageComposition:", self, v8);

      }
    }
  }
}

- (void)stageLocationRequest
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  id MSMessageClass;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isWaldoEnabled");

  if (v4)
  {
    -[CKDetailsController conversation](self, "conversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsCapabilities:", 4096);

    if (v7)
    {
      MSMessageClass = getMSMessageClass();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MSMessageClass, "findMyLocationRequestMessage");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        +[CKComposition compositionWithMSMessage:appExtensionIdentifier:](CKComposition, "compositionWithMSMessage:appExtensionIdentifier:");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKDetailsController detailsControllerDelegate](self, "detailsControllerDelegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_opt_respondsToSelector();

        if ((v11 & 1) != 0)
        {
          -[CKDetailsController _evaluateMetricsForStagingLocation](self, "_evaluateMetricsForStagingLocation");
          -[CKDetailsController detailsControllerDelegate](self, "detailsControllerDelegate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "detailsController:wantsToStageComposition:", self, v9);

        }
      }
    }
  }
}

- (void)handleFriendshipStatusChanged:(id)a3
{
  -[CKDetailsController setupFMFTimerIfNecessary](self, "setupFMFTimerIfNecessary", a3);
  -[CKDetailsController reloadTableView](self, "reloadTableView");
}

- (void)_handleLocationChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a3, "object");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "fmfHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[CKDetailsController conversation](self, "conversation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "chat");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allSiblingFMFHandles");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsObject:", v4);

      if (v8)
      {
        -[CKDetailsController conversation](self, "conversation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "recipients");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[CKDetailsController updateLocationForRecipient:](self, "updateLocationForRecipient:", v11);
      }
    }
  }
  else
  {
    v4 = 0;
  }

}

- (void)updateLocationForRecipient:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v4 = (void *)MEMORY[0x1E0D35810];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultIMHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "findMyLocationForHandleOrSibling:", v7);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "fmfLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "locationShortAddressWithAgeIncludeLocating");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(v14, "shortAddress");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    -[CKDetailsController updateLocationStringCellWithString:](self, "updateLocationStringCellWithString:", v13);
  }

}

- (id)currentlyActiveFMFDevice
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_fmfExpirationDateIsValid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  double v10;

  objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timedOfferExpirationForChat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToDate:", v7) & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSinceDate:", v9);
      v8 = v10 > 0.0;

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_evaluateMetricsForStagingLocation
{
  void *v2;
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setValue:forKey:", &unk_1E28701B0, *MEMORY[0x1E0D38A90]);
  objc_msgSend(v3, "setValue:forKey:", *MEMORY[0x1E0D37508], *MEMORY[0x1E0D38A98]);
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackEvent:withDictionary:", *MEMORY[0x1E0D38790], v3);

}

- (BOOL)shouldShowFMFView
{
  void *v3;
  void *v4;
  BOOL v5;

  -[CKDetailsController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "hasSiblingRecipientsSharingLocation"))
    v5 = -[CKDetailsController fmfEnabled](self, "fmfEnabled");
  else
    v5 = 0;

  return v5;
}

- (BOOL)shouldShowActiveDeviceSwitchFooter
{
  CKDetailsController *v2;
  void *v3;
  char v4;
  void *v5;
  _BOOL4 v6;

  v2 = self;
  -[CKDetailsController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBusinessConversation");

  if ((v4 & 1) != 0)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    -[CKDetailsController currentlyActiveFMFDevice](v2, "currentlyActiveFMFDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CKDetailsController fmfEnabled](v2, "fmfEnabled");
    LOBYTE(v2) = 0;
    if (v6 && v5)
      LODWORD(v2) = objc_msgSend(v5, "isThisDevice") ^ 1;

  }
  return (char)v2;
}

- (BOOL)shouldShowLocationStringForOneToOneConversation
{
  int v3;
  void *v4;

  if (-[CKDetailsController shouldShowFMFView](self, "shouldShowFMFView")
    && !-[CKDetailsController isGroupChat](self, "isGroupChat"))
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isWaldoEnabled") ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (unint64_t)countOfContactViewModels
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CKDetailsController contactsManager](self, "contactsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactsViewModels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)rowForShowMoreContactsCell
{
  if (CKIsRunningInMacCatalyst() || !-[CKDetailsController isGroupChat](self, "isGroupChat"))
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return -[CKDetailsController hasTUConversation](self, "hasTUConversation");
}

- (int64_t)rowForAddMemberCell
{
  _BOOL4 v3;
  int64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[CKDetailsController hasTUConversation](self, "hasTUConversation");
  if (!-[CKDetailsController isContactsSectionCollapsible](self, "isContactsSectionCollapsible"))
  {
    -[CKDetailsController contactsManager](self, "contactsManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactsViewModels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "count") + v3;
LABEL_8:

    return v4;
  }
  if (!-[CKDetailsController isContactsSectionCollapsed](self, "isContactsSectionCollapsed"))
  {
    -[CKDetailsController contactsManager](self, "contactsManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactsViewModels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    v8 = 1;
    if (v3)
      v8 = 2;
    v4 = v8 + v7;
    goto LABEL_8;
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)rowForFirstContactCell
{
  if (!-[CKDetailsController isContactsSectionCollapsible](self, "isContactsSectionCollapsible"))
    return 0;
  if (-[CKDetailsController isContactsSectionCollapsed](self, "isContactsSectionCollapsed"))
    return 0x7FFFFFFFFFFFFFFFLL;
  if (-[CKDetailsController hasTUConversation](self, "hasTUConversation"))
    return 2;
  return 1;
}

- (int64_t)rowForLastContact
{
  int64_t v3;
  int v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[CKDetailsController visibleContactsRows](self, "visibleContactsRows");
  v4 = CKIsRunningInMacCatalyst();
  v5 = -[CKDetailsController hasTUConversation](self, "hasTUConversation");
  v6 = v5;
  v7 = 1;
  if (v5)
    v7 = 2;
  if (!v4)
    v6 = v7;
  return v6 + v3;
}

- (BOOL)shouldShowAddMemberCell
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[CKDetailsController conversationHasLeft](self, "conversationHasLeft"))
    return 0;
  -[CKDetailsController conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isGroupConversation")
    && !-[CKDetailsController isContactsSectionCollapsed](self, "isContactsSectionCollapsed"))
  {
    -[CKDetailsController conversation](self, "conversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (objc_msgSend(v6, "isBusinessChat") & 1) == 0
      && -[CKDetailsController _allowAddContactFromThisDevice](self, "_allowAddContactFromThisDevice");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_allowAddContactFromThisDevice
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CKDetailsController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35918], "rcsService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    return IMSharedHelperRetrieveSimDetailsFromTelephony();
  else
    return 1;
}

- (int64_t)visibleContactsRows
{
  void *v4;
  void *v5;
  int64_t v6;

  if (-[CKDetailsController isContactsSectionCollapsed](self, "isContactsSectionCollapsed"))
    return 0;
  -[CKDetailsController contactsManager](self, "contactsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactsViewModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (BOOL)isContactsSectionCollapsible
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[CKDetailsController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isBusinessChat") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CKDetailsController contactsManager](self, "contactsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactsViewModels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "count") != 0;

  }
  return v5;
}

- (id)tuConversation
{
  void *v2;
  void *v3;
  void *v4;

  -[CKDetailsController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hasTUConversation
{
  void *v3;
  void *v4;
  BOOL v5;

  -[CKDetailsController tuConversation](self, "tuConversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[CKDetailsController tuConversation](self, "tuConversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)shouldAddToVisibleContactRowCountForTUConversation
{
  _BOOL4 v3;
  _BOOL4 v4;

  v3 = -[CKDetailsController isContactsSectionCollapsible](self, "isContactsSectionCollapsible");
  v4 = -[CKDetailsController hasTUConversation](self, "hasTUConversation");
  if (v3)
    LOBYTE(v4) = v4
              && (-[CKDetailsController isContactsSectionCollapsed](self, "isContactsSectionCollapsed")
               || !-[CKDetailsController isContactsSectionCollapsed](self, "isContactsSectionCollapsed")
               && -[CKDetailsController visibleContactsRows](self, "visibleContactsRows") > 0);
  return v4;
}

- (int64_t)rowForTUConversationCell
{
  if (-[CKDetailsController hasTUConversation](self, "hasTUConversation"))
    return 0;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_supportsForceTouch");

  if (v5)
  {
    -[CKDetailsController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController unregisterPreviewSourceView:](self, "unregisterPreviewSourceView:", v6);

  }
  v7.receiver = self;
  v7.super_class = (Class)CKDetailsController;
  -[CKDetailsController dealloc](&v7, sel_dealloc);
}

- (CKDetailsController)initWithConversation:(id)a3
{
  id v4;
  CKDetailsController *v5;
  CKDetailsController *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CKDetailsController;
  v5 = -[CKDetailsController initWithNibName:bundle:](&v39, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    -[CKDetailsController setConversation:](v5, "setConversation:", v4);
    -[CKDetailsController setupFMF](v6, "setupFMF");
    -[CKDetailsController setupKT](v6, "setupKT");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__handleKeyboardWillShowNotification_, *MEMORY[0x1E0CEB978], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v6, sel__handleKeyboardWillHideNotification_, *MEMORY[0x1E0CEB970], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0D353F0];
    -[CKDetailsController conversation](v6, "conversation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "chat");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__lastAddressedHandleUpdateNotification_, v10, v12);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__chatAutoDonatingHandleUpdateNotification_, *MEMORY[0x1E0D35458], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0D35448];
    objc_msgSend(v4, "chat");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v6, sel__batchDownloadNotificationFired_, v15, v16);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0D35450];
    objc_msgSend(v4, "chat");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v6, sel__batchDownloadNotificationFired_, v18, v19);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v6, sel__reloadForReadReceiptVisibilityChangeIfNeeded_, *MEMORY[0x1E0D352A0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0D354D0];
    objc_msgSend(v4, "chat");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v6, sel__reloadForReadReceiptVisibilityChangeIfNeeded_, v22, v23);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v6, sel__handleAddressBookChanged_, *MEMORY[0x1E0D373C0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v6, sel__conversationListFinishedMerging_, CFSTR("CKConversationListFinishedMergingChatsNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v6, sel__handleGroupPhotoChanged_, *MEMORY[0x1E0D35308], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v6, sel__handleGroupDisplayNameChanged_, *MEMORY[0x1E0D352F0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v6, sel__chatParticipantsChangedNotification_, *MEMORY[0x1E0D35418], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v6, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0CEB3F0], 0);

    objc_msgSend(v4, "chat");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "allowedByScreenTime");

    if ((v31 & 1) == 0)
      -[CKDetailsController dismissViewControllerAnimated:completion:](v6, "dismissViewControllerAnimated:completion:", 1, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *MEMORY[0x1E0D352D8];
    objc_msgSend(v4, "chat");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", v6, sel__chatAllowedByScreenTimeChanged_, v33, v34);

    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, v6, sel_handleDoneButton_);
    -[CKDetailsController navigationItem](v6, "navigationItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setRightBarButtonItem:", v35);

    -[CKDetailsController setTuConversationCellHeight:](v6, "setTuConversationCellHeight:", -1.0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObserver:selector:name:object:", v6, sel__handleMultiWayStateChange_, *MEMORY[0x1E0D35410], 0);

    -[CKDetailsController setAddContactCellHeight:](v6, "setAddContactCellHeight:", -1.0);
    -[CKDetailsController setShowMoreContactCellHeight:](v6, "setShowMoreContactCellHeight:", -1.0);
    -[CKDetailsController setGroupPhotoHeaderHeight:](v6, "setGroupPhotoHeaderHeight:", -1.0);
    -[CKDetailsController setSimLabelCellHeight:](v6, "setSimLabelCellHeight:", -1.0);

  }
  return v6;
}

- (void)loadView
{
  CKDetailsTableView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CKDetailsTableView *v21;

  v3 = [CKDetailsTableView alloc];
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v21 = -[CKDetailsTableView initWithFrame:style:](v3, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], v5, v6, v7);
  -[CKDetailsTableView setAutoresizingMask:](v21, "setAutoresizingMask:", 18);
  -[CKDetailsTableView setDelegate:](v21, "setDelegate:", self);
  -[CKDetailsTableView setDataSource:](v21, "setDataSource:", self);
  -[CKDetailsTableView registerClass:forHeaderFooterViewReuseIdentifier:](v21, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("locationShareTextView"));
  -[CKDetailsTableView registerClass:forHeaderFooterViewReuseIdentifier:](v21, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("CKDetailsSharedWithYouHeaderFooterView_reuseIdentifier"));
  v8 = objc_opt_class();
  +[CKGroupPhotoCell reuseIdentifier](CKGroupPhotoCell, "reuseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsTableView registerClass:forCellReuseIdentifier:](v21, "registerClass:forCellReuseIdentifier:", v8, v9);

  -[CKDetailsTableView setTableHeaderViewShouldAutoHide:](v21, "setTableHeaderViewShouldAutoHide:", 1);
  -[CKDetailsTableView setContentInsetAdjustmentBehavior:](v21, "setContentInsetAdjustmentBehavior:", 2);
  -[CKDetailsTableView _setPinsTableHeaderView:](v21, "_setPinsTableHeaderView:", 0);
  -[CKDetailsTableView setBackgroundView:](v21, "setBackgroundView:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsTableView setBackgroundColor:](v21, "setBackgroundColor:", v10);

  -[CKDetailsTableView setEstimatedSectionHeaderHeight:](v21, "setEstimatedSectionHeaderHeight:", 0.0);
  -[CKDetailsTableView setEstimatedSectionFooterHeight:](v21, "setEstimatedSectionFooterHeight:", 0.0);
  -[CKDetailsTableView setSeparatorStyle:](v21, "setSeparatorStyle:", 0);
  -[CKDetailsTableView setLayoutMargins:](v21, "setLayoutMargins:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
  -[CKDetailsTableView setPreservesSuperviewLayoutMargins:](v21, "setPreservesSuperviewLayoutMargins:", 1);
  -[CKDetailsTableView setSectionHeaderHeight:](v21, "setSectionHeaderHeight:", 0.0);
  -[CKDetailsTableView setSectionFooterHeight:](v21, "setSectionFooterHeight:", 0.0);
  -[CKDetailsTableView setEstimatedRowHeight:](v21, "setEstimatedRowHeight:", 0.0);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "theme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "detailsHeaderFooterContentViewBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKDetailsTableView setBackgroundColor:](v21, "setBackgroundColor:", v13);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v4, v5, v6, v7);
  objc_msgSend(v14, "setBackgroundColor:", v13);
  -[CKDetailsTableView setTableFooterView:](v21, "setTableFooterView:", v14);
  -[CKDetailsController setTableView:](self, "setTableView:", v21);
  -[CKDetailsController setView:](self, "setView:", v21);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "_supportsForceTouch");

  if (v16)
  {
    -[CKDetailsController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController registerPreviewSourceView:previewingDelegate:](self, "registerPreviewSourceView:previewingDelegate:", v17, self);

  }
  if (CKIsRunningInMacCatalyst())
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController setScreenShareContextButton:](self, "setScreenShareContextButton:", v18);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController screenShareContextButton](self, "screenShareContextButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBackgroundColor:", v19);

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKDetailsController;
  -[CKDetailsController viewDidLoad](&v17, sel_viewDidLoad);
  -[CKDetailsController setupContactsManager](self, "setupContactsManager");
  -[CKDetailsController setIsContactsSectionCollapsed:](self, "setIsContactsSectionCollapsed:", -[CKDetailsController isContactsSectionCollapsible](self, "isContactsSectionCollapsible"));
  -[CKDetailsController _determineFocusStatusSharingState](self, "_determineFocusStatusSharingState");
  -[CKDetailsController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setManualScrollEdgeAppearanceProgress:", 0.0);

  -[CKDetailsController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setManualScrollEdgeAppearanceEnabled:", 1);

  -[CKDetailsController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setAlwaysUseManualScrollEdgeAppearance:", 1);

  -[CKDetailsController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController transparentNavBarAppearance](self, "transparentNavBarAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScrollEdgeAppearance:", v7);

  -[CKDetailsController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController defaultNavBarAppearance](self, "defaultNavBarAppearance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStandardAppearance:", v9);

  if (CKIsRunningInMacCatalyst())
  {
    -[CKDetailsController detailsControllerDelegate](self, "detailsControllerDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isDetailsNavigationControllerDetached");

    if ((v11 & 1) == 0)
    {
      -[CKDetailsController computedPreferredContentSize](self, "computedPreferredContentSize");
      -[CKDetailsController setPreferredContentSize:](self, "setPreferredContentSize:");
    }
  }
  if (!self->_groupPhotoHeaderViewController)
    -[CKDetailsController _configureGroupPhotoHeader](self, "_configureGroupPhotoHeader");
  objc_msgSend(MEMORY[0x1E0D358A8], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController conversation](self, "conversation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recipientStrings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createSharedProfileStateOracleForHandles:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKDetailsController groupPhotoHeaderViewController](self, "groupPhotoHeaderViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSharedProfileStateOracle:", v15);

}

- (void)reloadTableView
{
  id v2;

  -[CKDetailsController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)_determineFocusStatusSharingState
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CKDetailsController *v8;
  id v9;
  id location;

  -[CKDetailsController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  location = 0;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__CKDetailsController__determineFocusStatusSharingState__block_invoke;
  v6[3] = &unk_1E274F418;
  objc_copyWeak(&v9, &location);
  v5 = v4;
  v7 = v5;
  v8 = self;
  objc_msgSend(v5, "canShareFocusStatusWithCompletion:", v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __56__CKDetailsController__determineFocusStatusSharingState__block_invoke(uint64_t a1, int a2)
{
  uint64_t v4;
  int v5;
  void *v6;
  id *v7;
  id WeakRetained;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend((id)v4, "isSatelliteConnectionActive");

  LOBYTE(v4) = a2 & ~(_BYTE)v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2 & ~v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setCanShareFocusStatus:", v6);

  v9 = IMOSLoggingEnabled();
  if ((v4 & 1) != 0)
  {
    if (v9)
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "guid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v20 = v11;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Checking to see if focus status is shared with chat: %@", buf, 0xCu);

      }
    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __56__CKDetailsController__determineFocusStatusSharingState__block_invoke_136;
    v17[3] = &unk_1E274F3F0;
    v12 = *(void **)(a1 + 32);
    v17[4] = *(_QWORD *)(a1 + 40);
    objc_copyWeak(&v18, v7);
    objc_msgSend(v12, "isInvitedToViewMyFocusStatusWithCompletion:", v17);
    objc_destroyWeak(&v18);
  }
  else
  {
    if (v9)
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Cannot share focus status with chat, not checking to see if focus status is already shared", buf, 2u);
      }

    }
    v14 = objc_loadWeakRetained(v7);
    objc_msgSend(v14, "setIsSharingFocusStatus:", 0);

    v15 = objc_loadWeakRetained(v7);
    objc_msgSend(v15, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "reloadData");

  }
}

void __56__CKDetailsController__determineFocusStatusSharingState__block_invoke_136(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  char v12;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__CKDetailsController__determineFocusStatusSharingState__block_invoke_2;
  v8[3] = &unk_1E274F3C8;
  v12 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], v8);
  objc_destroyWeak(&v11);

}

void __56__CKDetailsController__determineFocusStatusSharingState__block_invoke_2(uint64_t a1)
{
  uint64_t *v1;
  NSObject *WeakRetained;
  int v4;
  int v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int16 v12;

  v1 = (uint64_t *)(a1 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    v4 = *(unsigned __int8 *)(a1 + 56);
    v5 = IMOSLoggingEnabled();
    if (v4)
    {
      if (v5)
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v12 = 0;
          v7 = "Determined focus status is shared with chat, enabling and updating switch";
          v8 = (uint8_t *)&v12;
LABEL_11:
          _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
          goto LABEL_12;
        }
        goto LABEL_12;
      }
    }
    else if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        v7 = "Determined focus status is NOT shared with chat, enabling and updating switch";
        v8 = (uint8_t *)&v11;
        goto LABEL_11;
      }
LABEL_12:

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56), v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setIsSharingFocusStatus:", v9);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[NSObject tableView](WeakRetained, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadData");

    goto LABEL_14;
  }
  IMLogHandleForCategory();
  WeakRetained = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    __56__CKDetailsController__determineFocusStatusSharingState__block_invoke_2_cold_1(v1, WeakRetained);
LABEL_14:

}

- (id)transparentNavBarAppearance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[CKDetailsController groupPhotoHeaderViewController](self, "groupPhotoHeaderViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "group");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v5, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController setTitle:](self, "setTitle:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0CEA7B0]);
  v12 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTitleTextAttributes:", v10);
  objc_msgSend(v8, "configureWithTransparentBackground");

  return v8;
}

- (id)defaultNavBarAppearance
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[CKDetailsController setTitle:](self, "setTitle:", 0);
  v2 = objc_alloc_init(MEMORY[0x1E0CEA7B0]);
  v6 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setTitleTextAttributes:", v4);
  objc_msgSend(v2, "configureWithDefaultBackground");

  return v2;
}

- (void)updateManualScrollEdgeProgress
{
  NSObject *v3;
  const char *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  int v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  _QWORD block[5];
  uint8_t buf[16];

  if (CKIsRunningInMacCatalyst())
  {
    if (!IMOSLoggingEnabled())
      return;
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v4 = "Not updating manual scroll edge appearance progress because it does not apply to Mac.";
LABEL_13:
    _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, v4, buf, 2u);
LABEL_14:

    return;
  }
  -[CKDetailsController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isManualScrollEdgeAppearanceEnabled");

  if ((v6 & 1) == 0)
  {
    if (!IMOSLoggingEnabled())
      return;
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v4 = "Not updating manual scroll edge appearance progress because it is not enabled on the navigation item.";
    goto LABEL_13;
  }
  -[CKDetailsController groupPhotoHeaderViewController](self, "groupPhotoHeaderViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CKDetailsController_updateManualScrollEdgeProgress__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (updateManualScrollEdgeProgress_onceToken != -1)
    dispatch_once(&updateManualScrollEdgeProgress_onceToken, block);
  v11 = updateManualScrollEdgeProgress_hasNewContactsAPI;
  -[CKDetailsController groupPhotoHeaderViewController](self, "groupPhotoHeaderViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    objc_msgSend(v12, "titleLabelBaselineOffset");
    v15 = v10 + v14;
  }
  else
  {
    objc_msgSend(v12, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v15 = v10 + v17 * 0.5;

  }
  -[CKDetailsController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentOffset");
  v20 = v19;
  -[CKDetailsController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "adjustedContentInset");
  v23 = v20 + v22;

  if (v23 <= 0.0)
  {
    -[CKDetailsController navigationItem](self, "navigationItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_setManualScrollEdgeAppearanceProgress:", 0.0);

    -[CKDetailsController setTitle:](self, "setTitle:", 0);
  }
  else
  {
    -[CKDetailsController navigationItem](self, "navigationItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_setManualScrollEdgeAppearanceProgress:", fmin(v23, 14.0) / 14.0);

    if (updateManualScrollEdgeProgress_hasNewContactsAPI)
    {
      -[CKDetailsController groupPhotoHeaderViewController](self, "groupPhotoHeaderViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "hideTitleLabel:", v23 > v15);

    }
    if (v23 <= v15)
    {
      v26 = &stru_1E276D870;
    }
    else
    {
      -[CKDetailsController _navigationBarTitle](self, "_navigationBarTitle");
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    -[CKDetailsController setTitle:](self, "setTitle:", v26);

  }
}

void __53__CKDetailsController_updateManualScrollEdgeProgress__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "groupPhotoHeaderViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  updateManualScrollEdgeProgress_hasNewContactsAPI = objc_opt_respondsToSelector() & 1;

}

- (id)_navigationBarTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (!-[CKDetailsController supportsChatNameAndPhotoHeader](self, "supportsChatNameAndPhotoHeader"))
    goto LABEL_4;
  -[CKDetailsController groupPhotoHeaderViewController](self, "groupPhotoHeaderViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "group");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[CKDetailsController conversation](self, "conversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
LABEL_4:
      CKFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DETAILS"), &stru_1E276D870, CFSTR("ChatKit"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v5;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKDetailsController;
  -[CKDetailsController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  if (CKIsRunningInMacCatalyst())
  {
    -[CKDetailsController updateScreenSharingStatusAndViews](self, "updateScreenSharingStatusAndViews");
    -[CKDetailsController initializeSearchController](self, "initializeSearchController");
  }
  else
  {
    -[CKDetailsController navigationController](self, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "frame");
    -[CKDetailsTableView _setTopPadding:](self->_tableView, "_setTopPadding:", v5);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKDetailsController;
  -[CKViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  if (CKIsRunningInMacCatalyst())
  {
    -[CKDetailsController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNavigationBarHidden:animated:", 1, 0);

  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "theme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detailsBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  -[CKScrollViewController updateScrollGeometryWithoutAnimationForReason:](self, "updateScrollGeometryWithoutAnimationForReason:", CFSTR("DetailsViewWillAppear"));
  -[CKDetailsController _resetPurgedAttachmentCount](self, "_resetPurgedAttachmentCount");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKDetailsController;
  -[CKViewController viewDidAppear:](&v17, sel_viewDidAppear_, a3);
  -[CKDetailsController becomeFirstResponder](self, "becomeFirstResponder");
  -[CKDetailsController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trackEvent:", *MEMORY[0x1E0D38570]);

  -[CKDetailsController _updateDownloadButtonStateIfNeeded](self, "_updateDownloadButtonStateIfNeeded");
  if (CKIsRunningInMacCatalyst())
  {
    -[CKDetailsController detailsControllerDelegate](self, "detailsControllerDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isDetailsNavigationControllerDetached");

    if (v7)
    {
      -[CKDetailsController computedPreferredContentSize](self, "computedPreferredContentSize");
      v9 = v8;
      v11 = v10;
      -[CKDetailsController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "windowScene");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "sizeRestrictions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setMinimumSize:", v9, v11);

      objc_msgSend(v14, "sizeRestrictions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setMaximumSize:", v9, v11);

    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKDetailsController;
  -[CKViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[CKDetailsController groupNameCell](self, "groupNameCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupNameView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commitGroupName");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKDetailsController;
  -[CKViewController viewDidDisappear:](&v9, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackEvent:", *MEMORY[0x1E0D38568]);

  -[CKDetailsController fmfUpdateTimer](self, "fmfUpdateTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  if ((-[CKDetailsController isBeingDismissed](self, "isBeingDismissed") & 1) != 0
    || (-[CKDetailsController navigationController](self, "navigationController"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isBeingDismissed"),
        v6,
        v7))
  {
    -[CKDetailsController detailsControllerDelegate](self, "detailsControllerDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "detailsControllerDidDismiss:", self);

  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)keyCommands
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController searchViewController](self, "searchViewController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[CKDetailsController searchViewController](self, "searchViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "wantsSpaceKeyCommandActive");

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR(" "), 0, sel_spacePressed_);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v8);

    }
  }
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (void)spacePressed:(id)a3
{
  id v3;

  -[CKDetailsController searchViewController](self, "searchViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleSpacePressed");

}

- (id)inputAccessoryViewController
{
  return 0;
}

- (CGSize)computedPreferredContentSize
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  -[CKDetailsController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBusinessConversation");

  if (v4)
  {
    -[CKDetailsController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "detailsPreferredContentSizeWidth");
    objc_msgSend(v5, "sizeThatFits:");
    v8 = v7;
    v10 = v9;

    v11 = v10 + 40.0;
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "detailsPreferredContentSizeHeight");
    v11 = v13;

    if (-[CKDetailsController shouldShowExpanseFeatures](self, "shouldShowExpanseFeatures"))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "detailsExpanseScreenShareCellHeight");
      v11 = v11 + v15;

    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "detailsPreferredContentSizeWidth");
    v8 = v17;

  }
  v18 = v8;
  v19 = v11;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)handleDoneButton:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  _QWORD v8[5];

  -[CKDetailsController detailsControllerDelegate](self, "detailsControllerDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKDetailsController detailsControllerDelegate](self, "detailsControllerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[CKDetailsController detailsControllerDelegate](self, "detailsControllerDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "detailsControllerWillDismiss:", self);

    }
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__CKDetailsController_handleDoneButton___block_invoke;
  v8[3] = &unk_1E274A208;
  v8[4] = self;
  -[CKDetailsController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v8);
}

void __40__CKDetailsController_handleDoneButton___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "detailsControllerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detailsControllerDidDismiss:", *(_QWORD *)(a1 + 32));

}

- (void)_handleKeyboardWillShowNotification:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v49;
  double v50;
  double v51;
  double v52;
  id v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CEB890]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[CKDetailsController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "convertRect:fromWindow:", 0, v7, v9, v11, v13);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  -[CKDetailsController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "window");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController groupNameCell](self, "groupNameCell");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "frame");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  -[CKDetailsController groupNameCell](self, "groupNameCell");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "superview");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "convertRect:fromView:", v36, v28, v30, v32, v34);
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;

  v54.origin.x = v17;
  v54.origin.y = v19;
  v54.size.width = v21;
  v54.size.height = v23;
  v59.origin.x = v38;
  v59.origin.y = v40;
  v59.size.width = v42;
  v59.size.height = v44;
  if (CGRectIntersectsRect(v54, v59))
  {
    -[CKDetailsController tableView](self, "tableView");
    v53 = (id)objc_claimAutoreleasedReturnValue();
    v55.origin.x = v38;
    v55.origin.y = v40;
    v55.size.width = v42;
    v55.size.height = v44;
    v60.origin.x = v17;
    v60.origin.y = v19;
    v60.size.width = v21;
    v60.size.height = v23;
    v56 = CGRectIntersection(v55, v60);
    x = v56.origin.x;
    y = v56.origin.y;
    width = v56.size.width;
    height = v56.size.height;
    objc_msgSend(v53, "contentOffset");
    v50 = v49;
    v52 = v51;
    v57.origin.x = x;
    v57.origin.y = y;
    v57.size.width = width;
    v57.size.height = height;
    -[CKDetailsController setContentOffsetYShiftAfterKeyboardNotification:](self, "setContentOffsetYShiftAfterKeyboardNotification:", CGRectGetHeight(v57));
    v58.origin.x = x;
    v58.origin.y = y;
    v58.size.width = width;
    v58.size.height = height;
    objc_msgSend(v53, "setContentOffset:animated:", 1, v50, v52 + CGRectGetHeight(v58));

  }
}

- (void)_handleKeyboardWillHideNotification:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  -[CKDetailsController tableView](self, "tableView", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentOffset");
  v5 = v4;
  v7 = v6;
  -[CKDetailsController contentOffsetYShiftAfterKeyboardNotification](self, "contentOffsetYShiftAfterKeyboardNotification");
  objc_msgSend(v9, "setContentOffset:animated:", 1, v5, v7 - v8);
  -[CKDetailsController setContentOffsetYShiftAfterKeyboardNotification:](self, "setContentOffsetYShiftAfterKeyboardNotification:", 0.0);

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  CKDetailsController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v7 = (CKDetailsController *)a4;
  if (v7 != self)
  {
    -[CKDetailsController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController titleForBackButton](self, "titleForBackButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackButtonTitle:", v9);

    LODWORD(v8) = -[CKDetailsController isContactViewController:](self, "isContactViewController:", v7);
    -[CKDetailsController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((_DWORD)v8)
      v12 = 2;
    else
      v12 = 0;
    objc_msgSend(v10, "setBackButtonDisplayMode:", v12);

  }
}

- (id)titleForBackButton
{
  void *v2;
  void *v3;

  -[CKDetailsController groupPhotoHeaderViewController](self, "groupPhotoHeaderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayNameForGroupIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isContactViewController:(id)a3
{
  void *v3;

  v3 = (void *)objc_opt_class();
  return objc_msgSend(v3, "isEqual:", objc_opt_class());
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  UITextView *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;

  v7 = (UITextView *)a3;
  v8 = a4;
  if (self->_locationSharingTextView == v7)
  {
    objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "makeThisDeviceActiveDevice");

    -[CKDetailsController locationSharingTextView](self, "locationSharingTextView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", 0);

    -[CKDetailsController setLocationSharingTextView:](self, "setLocationSharingTextView:", 0);
    -[CKDetailsController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadData");
    goto LABEL_5;
  }
  if (self->_sharedWithYouFooterTextView == v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=MESSAGES&path=SHARED_WITH_YOU_BUTTON"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "openSensitiveURL:withOptions:", v9, 0);

LABEL_5:
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isKeyTransparencyEnabled");

  if (v14 && self->_ktSecurityFooterTextView == v7)
    +[CKKeyTransparencyErrorUtilities learnMorePressedFromError:](CKKeyTransparencyErrorUtilities, "learnMorePressedFromError:", 0);

  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  uint64_t v5;
  int64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "detailsSectionCount");

  v6 = v5 + -[CKDetailsController shouldShowSIMTypeSection](self, "shouldShowSIMTypeSection");
  if (-[CKDetailsController shouldShowExpanseFeatures](self, "shouldShowExpanseFeatures"))
  {
    v7 = CKIsRunningInMacCatalyst();
    v8 = 1;
    if (v7)
      v8 = 2;
    v6 += v8;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isKeyTransparencyEnabled");

  if (v10)
    v6 += -[CKDetailsController shouldShowKTSection](self, "shouldShowKTSection");
  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  int v8;
  int64_t result;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  int v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  int64_t v21;
  int64_t v22;
  _BOOL8 v23;
  void *v24;
  int64_t v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  unint64_t ktChatState;
  void *v31;
  void *v32;
  int64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  unsigned int v41;

  -[CKDetailsController conversation](self, "conversation", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isBusinessChat");

  if (v8)
    return a4 == 6 || a4 == 9;
  result = 0;
  switch(a4)
  {
    case 0:
      LODWORD(result) = -[CKDetailsController supportsChatNameAndPhotoHeader](self, "supportsChatNameAndPhotoHeader");
      goto LABEL_25;
    case 1:
      LODWORD(result) = -[CKDetailsController shouldShowExpanseFeatures](self, "shouldShowExpanseFeatures");
      goto LABEL_25;
    case 2:
      LODWORD(result) = -[CKDetailsController shouldShowSIMTypeSection](self, "shouldShowSIMTypeSection");
      goto LABEL_25;
    case 3:
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isWaldoEnabled");

      LODWORD(result) = -[CKDetailsController shouldShowFMFView](self, "shouldShowFMFView");
      if (v15)
        goto LABEL_25;
      if ((_DWORD)result)
        result = 3;
      else
        result = 0;
      break;
    case 5:
      LODWORD(result) = -[CKDetailsController shouldShowGroupCount](self, "shouldShowGroupCount");
      goto LABEL_25;
    case 6:
      v16 = -[CKDetailsController visibleContactsRows](self, "visibleContactsRows");
      -[CKDetailsController conversation](self, "conversation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "chat");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "participants");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (v20 < 2)
        goto LABEL_31;
      v21 = v16 + -[CKDetailsController isContactsSectionCollapsible](self, "isContactsSectionCollapsible");
      v22 = v21 + -[CKDetailsController shouldShowAddMemberCell](self, "shouldShowAddMemberCell");
      result = v22 + -[CKDetailsController hasTUConversation](self, "hasTUConversation");
      break;
    case 7:
      v23 = -[CKDetailsController allRecipientsAlreadyFollowingLocation](self, "allRecipientsAlreadyFollowingLocation");
      -[CKDetailsController conversation](self, "conversation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = +[CKDetailsControllerLocationHelper numberOfCellsInLocationSectionWithConversation:isFMFEnabled:isSharingLocation:shouldShowFMFView:](_TtC7ChatKit33CKDetailsControllerLocationHelper, "numberOfCellsInLocationSectionWithConversation:isFMFEnabled:isSharingLocation:shouldShowFMFView:", v24, -[CKDetailsController fmfEnabled](self, "fmfEnabled"), v23, -[CKDetailsController shouldShowFMFView](self, "shouldShowFMFView"));

      return v25;
    case 8:
      LODWORD(result) = -[CKDetailsController shouldShowSharedWithYouFeatures](self, "shouldShowSharedWithYouFeatures");
      goto LABEL_25;
    case 9:
      -[CKDetailsController conversation](self, "conversation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v26, "isGroupConversation") & 1) != 0)
      {
        v27 = 0;
      }
      else
      {
        -[CKDetailsController conversation](self, "conversation");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "chat");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v35, "supportsSendingReadReceipts");

      }
      objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isSatelliteConnectionActive");

      v38 = v27 & ~v37;
      if ((v27 & ~v37) != 0)
        v39 = 2;
      else
        v39 = 1;
      -[CKDetailsController setWasShowingReadReceiptSwitch:](self, "setWasShowingReadReceiptSwitch:", v38);
      -[CKDetailsController canShareFocusStatus](self, "canShareFocusStatus");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "BOOLValue");

      return v39 + v41;
    case 10:
      LODWORD(result) = -[CKDetailsController shouldShowEnhancedGroupFeatures](self, "shouldShowEnhancedGroupFeatures");
LABEL_25:
      result = result;
      break;
    case 11:
      -[CKDetailsController conversation](self, "conversation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "chat");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "supportsCapabilities:", 256);

      result = v13;
      break;
    case 12:
      result = 1;
      break;
    case 13:
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isKeyTransparencyEnabled");

      if (v29 && -[CKDetailsController shouldShowKTSection](self, "shouldShowKTSection"))
      {
        ktChatState = self->_ktChatState;
        -[CKDetailsController conversation](self, "conversation");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "chat");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = +[CKKTDetailsViewUtilities numberOfRowsInKTSectionForStatus:isGroupChat:](CKKTDetailsViewUtilities, "numberOfRowsInKTSectionForStatus:isGroupChat:", ktChatState, objc_msgSend(v32, "isGroupChat"));

        result = v33;
      }
      else
      {
LABEL_31:
        result = 0;
      }
      break;
    default:
      return result;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  switch(objc_msgSend(v5, "section"))
  {
    case 0:
      -[CKDetailsController groupPhotoCellForIndexPath:](self, "groupPhotoCellForIndexPath:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 1:
      -[CKDetailsController expanseActivityCellForIndexPath:](self, "expanseActivityCellForIndexPath:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 2:
      if (!-[CKDetailsController shouldShowSIMTypeSection](self, "shouldShowSIMTypeSection"))
        goto LABEL_13;
      -[CKDetailsController switchSubscriptionCellForIndexPathRow:](self, "switchSubscriptionCellForIndexPathRow:", objc_msgSend(v5, "row"));
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 3:
      -[CKDetailsController fmfViewControllerCellForIndexPath:shouldShowLocation:](self, "fmfViewControllerCellForIndexPath:shouldShowLocation:", v5, -[CKDetailsController shouldShowLocationStringForOneToOneConversation](self, "shouldShowLocationStringForOneToOneConversation"));
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 4:
      -[CKDetailsController groupNameCellForIndexPath:](self, "groupNameCellForIndexPath:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 5:
      -[CKDetailsController groupCountCellForIndexPath:](self, "groupCountCellForIndexPath:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 6:
      -[CKDetailsController contactsManagerCellForIndexPath:](self, "contactsManagerCellForIndexPath:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 7:
      -[CKDetailsController locationShareCellForIndexPathRow:](self, "locationShareCellForIndexPathRow:", objc_msgSend(v5, "row"));
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 8:
      -[CKDetailsController sharedWithYouCellForIndexPath:](self, "sharedWithYouCellForIndexPath:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 9:
      -[CKDetailsController chatOptionsCellForIndexPath:](self, "chatOptionsCellForIndexPath:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 10:
      -[CKDetailsController leaveCellForIndexPath:](self, "leaveCellForIndexPath:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 11:
      -[CKDetailsController deleteAndBlockCellForIndexPath:](self, "deleteAndBlockCellForIndexPath:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 12:
      -[CKDetailsController searchAttachmentViewControllerCellForIndexPath:](self, "searchAttachmentViewControllerCellForIndexPath:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (CKIsRunningInMacCatalyst())
      {
        v19[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKDetailsController popoverPresentationController](self, "popoverPresentationController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setPassthroughViews:", v8);

      }
      break;
    case 13:
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isKeyTransparencyEnabled");

      if (!v11)
        goto LABEL_12;
      -[CKDetailsController ktCellForRow:](self, "ktCellForRow:", objc_msgSend(v5, "row"));
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v7 = (void *)v6;
      break;
    case 15:
      -[CKDetailsController conversation](self, "conversation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "chat");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "participants");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17 < 2)
        -[CKDetailsController openInContactsCell](self, "openInContactsCell");
      else
        -[CKDetailsController changeGroupNamePhotoCell](self, "changeGroupNamePhotoCell");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    default:
LABEL_12:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** %s: Unsupported section in indexPath %@"), "-[CKDetailsController tableView:cellForRowAtIndexPath:]", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "raise");

LABEL_13:
      v7 = 0;
      break;
  }

  return v7;
}

- (id)_groupPhotoHeaderRequiredContactKeys
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97500], "descriptorForRequiredKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldShowGroupPhotoActionTitle
{
  void *v2;
  char v3;

  -[CKDetailsController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsMutatingGroupIdentity");

  return v3;
}

- (void)_configureGroupPhotoHeader
{
  CKGroupPhotoCell *v3;
  void *v4;
  CKGroupPhotoCell *v5;
  CKGroupPhotoCell *groupPhotoCell;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *actions;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  CNGroupIdentityHeaderViewController *v21;
  CNGroupIdentityHeaderViewController *groupPhotoHeaderViewController;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  CKGroupPhotoCell *v35;
  id v36;

  if (!self->_groupPhotoCell)
  {
    v3 = [CKGroupPhotoCell alloc];
    +[CKGroupPhotoCell reuseIdentifier](CKGroupPhotoCell, "reuseIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CKGroupPhotoCell initWithStyle:reuseIdentifier:](v3, "initWithStyle:reuseIdentifier:", 0, v4);
    groupPhotoCell = self->_groupPhotoCell;
    self->_groupPhotoCell = v5;

  }
  if (!self->_groupPhotoHeaderViewController || self->_needsContactsReload)
  {
    -[CKDetailsController conversation](self, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKDetailsController setupAlternativeCommunicationActionsForChat:](self, "setupAlternativeCommunicationActionsForChat:", v8);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    actions = self->_actions;
    self->_actions = v9;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "detailsActionViewStyle");

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97508]), "initWithDefaultActionItems:displaysUnavailableActionTypes:actionViewStyle:", self->_actions, 1, v12);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CKDetailsController conversation](self, "conversation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "chat");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastAddressedSIMID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setGeminiChannelIdentifier:", v16);

    }
    -[CKDetailsController _groupPhotoHeaderRequiredContactKeys](self, "_groupPhotoHeaderRequiredContactKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend((id)objc_opt_class(), "maxContactAvatars");
    -[CKDetailsController conversation](self, "conversation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (CNGroupIdentityHeaderViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97500]), "initWithGroupIdentity:actionsViewConfiguration:", v20, v13);
    groupPhotoHeaderViewController = self->_groupPhotoHeaderViewController;
    self->_groupPhotoHeaderViewController = v21;

    if (-[CKDetailsController shouldShowGroupPhotoActionTitle](self, "shouldShowGroupPhotoActionTitle"))
    {
      CKFrameworkBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("GROUP_PHOTO_ACTION_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNGroupIdentityHeaderViewController setActionButtonTitle:](self->_groupPhotoHeaderViewController, "setActionButtonTitle:", v24);

    }
    else
    {
      -[CNGroupIdentityHeaderViewController setActionButtonTitle:](self->_groupPhotoHeaderViewController, "setActionButtonTitle:", 0);
    }
    -[CNGroupIdentityHeaderViewController view](self->_groupPhotoHeaderViewController, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAutoresizingMask:", 18);

    -[CNGroupIdentityHeaderViewController setDelegate:](self->_groupPhotoHeaderViewController, "setDelegate:", self);
    self->_needsContactsReload = 0;

  }
  -[CKDetailsController updateContactsHeaderVerificationState](self, "updateContactsHeaderVerificationState");
  -[CKGroupPhotoCell frame](self->_groupPhotoCell, "frame");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  -[CNGroupIdentityHeaderViewController view](self->_groupPhotoHeaderViewController, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFrame:", v27, v29, v31, v33);

  v35 = self->_groupPhotoCell;
  -[CNGroupIdentityHeaderViewController view](self->_groupPhotoHeaderViewController, "view");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  -[CKGroupPhotoCell setGroupView:](v35, "setGroupView:", v36);

}

- (id)screenSharingActionView
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;

  -[CNGroupIdentityHeaderViewController actionsViewConfiguration](self->_groupPhotoHeaderViewController, "actionsViewConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedActionTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (v5 = objc_msgSend(v4, "indexOfObject:", CFSTR("ScreenShareType")), v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    -[CNGroupIdentityHeaderViewController viewForActionAtIndex:](self->_groupPhotoHeaderViewController, "viewForActionAtIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v6 = v7;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)calculateHeightForGroupPhotoHeader
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  CGFloat v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double result;
  CGRect v25;

  -[CKDetailsController groupPhotoHeaderHeight](self, "groupPhotoHeaderHeight");
  if (v3 < 0.0)
  {
    -[CKDetailsController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v9 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);

    if (v6 != v9 || v8 != v10)
      goto LABEL_8;
  }
  if (-[CKDetailsController shouldForceGroupPhotoHeaderReload](self, "shouldForceGroupPhotoHeaderReload"))
  {
LABEL_8:
    -[CKDetailsController _configureGroupPhotoHeader](self, "_configureGroupPhotoHeader");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "detailsTableViewInsets");
      v14 = v13;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "detailsTableViewInsets");
      v17 = v14 + v16;

      -[CKDetailsController tableView](self, "tableView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bounds");
      v19 = CGRectGetWidth(v25) - v17;

      -[CNGroupIdentityHeaderViewController sizeForLayoutInContainerSize:](self->_groupPhotoHeaderViewController, "sizeForLayoutInContainerSize:", v19, 1.79769313e308);
      v21 = v20;
      -[CKDetailsController traitCollection](self, "traitCollection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "displayScale");
      if (v23 == 0.0)
      {
        if (CKMainScreenScale_once_26 != -1)
          dispatch_once(&CKMainScreenScale_once_26, &__block_literal_global_1282);
        v23 = *(double *)&CKMainScreenScale_sMainScreenScale_26;
        if (*(double *)&CKMainScreenScale_sMainScreenScale_26 == 0.0)
          v23 = 1.0;
      }
      -[CKDetailsController setGroupPhotoHeaderHeight:](self, "setGroupPhotoHeaderHeight:", ceil(v21 * v23) / v23);

    }
    else
    {
      -[CKDetailsController setGroupPhotoHeaderHeight:](self, "setGroupPhotoHeaderHeight:", 300.0);
    }
    -[CKDetailsController setShouldForceGroupPhotoHeaderReload:](self, "setShouldForceGroupPhotoHeaderReload:", 0);
  }
  -[CKDetailsController groupPhotoHeaderHeight](self, "groupPhotoHeaderHeight");
  return result;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  CKDetailsChatOptionsCell *v10;
  void *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  CKDetailsSharedWithYouCell *v16;
  double v17;
  CKDetailsSharedWithYouCell *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  CKDetailsChatOptionsCell *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  CKDetailsLocationShareCell *v29;
  CKDetailsLocationShareCell *v30;
  void *v31;
  double v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  char v37;
  int64_t v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v6 = a3;
  v7 = a4;
  v8 = 0.0;
  switch(objc_msgSend(v7, "section"))
  {
    case 0:
      if (-[CKDetailsController supportsChatNameAndPhotoHeader](self, "supportsChatNameAndPhotoHeader"))
      {
        -[CKDetailsController calculateHeightForGroupPhotoHeader](self, "calculateHeightForGroupPhotoHeader");
        goto LABEL_53;
      }
      goto LABEL_54;
    case 1:
      -[CKDetailsController _heightForExpanseActivityCell](self, "_heightForExpanseActivityCell");
      goto LABEL_53;
    case 2:
      if (!-[CKDetailsController shouldShowSIMTypeSection](self, "shouldShowSIMTypeSection"))
        goto LABEL_54;
      -[CKDetailsController switchSubscriptionCellForIndexPathRow:](self, "switchSubscriptionCellForIndexPathRow:", objc_msgSend(v7, "row"));
      v10 = (CKDetailsChatOptionsCell *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsController switchToLabelForChat](self, "switchToLabelForChat");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v6, "bounds");
        -[CKDetailsChatOptionsCell sizeThatFits:](v10, "sizeThatFits:", CGRectGetWidth(v44), 3.40282347e38);
        v8 = v12;
      }

      goto LABEL_46;
    case 3:
      if (objc_msgSend(v7, "row"))
      {
        v13 = objc_msgSend(v7, "row") - 1;
LABEL_15:
        -[CKDetailsController locationShareCellForIndexPathRow:](self, "locationShareCellForIndexPathRow:", v13);
        v16 = (CKDetailsSharedWithYouCell *)objc_claimAutoreleasedReturnValue();
        if (CKIsRunningInMacCatalyst())
        {
LABEL_16:
          -[CKDetailsSharedWithYouCell frame](v16, "frame");
          v8 = v17;
        }
        else
        {
LABEL_26:
          objc_msgSend(v6, "bounds");
          -[CKDetailsSharedWithYouCell sizeThatFits:](v16, "sizeThatFits:", CGRectGetWidth(v45), 3.40282347e38);
          v8 = v32;
        }

      }
      else
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "detailsViewMapHeight");
        v8 = v40;

        if (-[CKDetailsController shouldShowLocationStringForOneToOneConversation](self, "shouldShowLocationStringForOneToOneConversation"))
        {
          v8 = v8 + 44.0;
        }
      }
      goto LABEL_54;
    case 5:
      +[CKDetailsGroupCountCell preferredHeight](CKDetailsGroupCountCell, "preferredHeight");
      goto LABEL_53;
    case 6:
      -[CKDetailsController visibleContactsRows](self, "visibleContactsRows");
      -[CKDetailsController shouldAddToVisibleContactRowCountForTUConversation](self, "shouldAddToVisibleContactRowCountForTUConversation");
      v14 = objc_msgSend(v7, "row");
      v15 = v14 <= -[CKDetailsController rowForLastContact](self, "rowForLastContact")
         && -[CKDetailsController countOfContactViewModels](self, "countOfContactViewModels") != 0;
      v35 = objc_msgSend(v7, "row");
      -[CKDetailsController conversation](self, "conversation");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isBusinessConversation");

      if ((v37 & 1) != 0)
        goto LABEL_34;
      if (CKIsRunningInMacCatalyst())
      {
        if (!-[CKDetailsController hasTUConversation](self, "hasTUConversation"))
        {
          if (!v15)
            goto LABEL_52;
LABEL_34:
          -[CKDetailsController _heightForContactCellAtIndexPath:](self, "_heightForContactCellAtIndexPath:", v7);
          goto LABEL_53;
        }
        if (!v15)
          goto LABEL_52;
        v38 = -[CKDetailsController rowForTUConversationCell](self, "rowForTUConversationCell");
      }
      else
      {
        if (!v15)
          goto LABEL_52;
        v35 = objc_msgSend(v7, "row");
        v38 = -[CKDetailsController rowForShowMoreContactsCell](self, "rowForShowMoreContactsCell");
      }
      if (v35 > v38)
        goto LABEL_34;
LABEL_52:
      -[CKDetailsController _heightForAuxContactCellAtIndexPath:](self, "_heightForAuxContactCellAtIndexPath:", v7);
LABEL_53:
      v8 = v9;
LABEL_54:

      return v8;
    case 7:
      v13 = objc_msgSend(v7, "row");
      goto LABEL_15;
    case 8:
      v18 = [CKDetailsSharedWithYouCell alloc];
      v16 = -[CKDetailsSharedWithYouCell initWithFrame:](v18, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[CKDetailsSharedWithYouCell textLabel](v16, "textLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      CKFrameworkBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = CFSTR("MARK_AS_AUTO_DONATING");
      goto LABEL_24;
    case 9:
      v23 = [CKDetailsChatOptionsCell alloc];
      v10 = -[CKDetailsChatOptionsCell initWithFrame:](v23, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v24 = -[CKDetailsController _optionRowForIndexPath:](self, "_optionRowForIndexPath:", v7);
      if (v24 == 2)
      {
        -[CKDetailsChatOptionsCell textLabel](v10, "textLabel");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        CKFrameworkBundle();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        v28 = CFSTR("SHARE_FOCUS_STATUS");
      }
      else if (v24 == 1)
      {
        -[CKDetailsChatOptionsCell textLabel](v10, "textLabel");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        CKFrameworkBundle();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        v28 = CFSTR("READ_RECEIPTS");
      }
      else
      {
        if (v24)
          goto LABEL_45;
        -[CKDetailsChatOptionsCell textLabel](v10, "textLabel");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        CKFrameworkBundle();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        v28 = CFSTR("DETAILS_VIEW_HIDE_ALERTS_TOGGLE_TITLE");
      }
      objc_msgSend(v26, "localizedStringForKey:value:table:", v28, &stru_1E276D870, CFSTR("ChatKit"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setText:", v41);

LABEL_45:
      objc_msgSend(v6, "bounds");
      -[CKDetailsChatOptionsCell sizeThatFits:](v10, "sizeThatFits:", CGRectGetWidth(v46), 3.40282347e38);
      v8 = v42;
LABEL_46:

      goto LABEL_54;
    case 10:
      v29 = [CKDetailsLocationShareCell alloc];
      v16 = -[CKDetailsLocationShareCell initWithFrame:](v29, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[CKDetailsSharedWithYouCell textLabel](v16, "textLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      CKFrameworkBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = CFSTR("LEAVE_CONVERSATION");
      goto LABEL_24;
    case 11:
      v30 = [CKDetailsLocationShareCell alloc];
      v16 = -[CKDetailsLocationShareCell initWithFrame:](v30, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[CKDetailsSharedWithYouCell textLabel](v16, "textLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      CKFrameworkBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = CFSTR("DELETE_AND_BLOCK_THIS_CONVERSATION");
LABEL_24:
      objc_msgSend(v20, "localizedStringForKey:value:table:", v22, &stru_1E276D870, CFSTR("ChatKit"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setText:", v31);

      goto LABEL_26;
    case 12:
      -[CKDetailsController searchViewController](self, "searchViewController");
      v16 = (CKDetailsSharedWithYouCell *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 13:
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isKeyTransparencyEnabled");

      if (!v34)
        goto LABEL_54;
      -[CKDetailsController ktCellForRow:](self, "ktCellForRow:", objc_msgSend(v7, "row"));
      v16 = (CKDetailsSharedWithYouCell *)objc_claimAutoreleasedReturnValue();
      if (!CKIsRunningInMacCatalyst())
        goto LABEL_26;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_26;
      goto LABEL_16;
    default:
      goto LABEL_54;
  }
}

- (id)labelForChat
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
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!IMSharedHelperDeviceHasMultipleActiveSubscriptions())
    return 0;
  -[CKDetailsController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastAddressedSIMID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKDetailsController conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastAddressedHandleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ctSubscriptionInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "__im_subscriptionContextForForSimID:phoneNumber:", v5, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v15 = 138412802;
      v16 = v11;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Found current context %@ for phoneNumber %@ simID %@", (uint8_t *)&v15, 0x20u);
    }

  }
  objc_msgSend(v11, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)switchToLabelForChat
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
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!IMSharedHelperDeviceHasMultipleActiveSubscriptions())
    return 0;
  -[CKDetailsController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastAddressedSIMID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKDetailsController conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastAddressedHandleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ctSubscriptionInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "__im_switchSubscriptionContextFromPhoneNumber:simID:", v8, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v15 = 138412802;
      v16 = v11;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Found context to switch to %@ for phoneNumber %@ simID %@", (uint8_t *)&v15, 0x20u);
    }

  }
  objc_msgSend(v11, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (double)_heightForContactCellAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;
  CGRect v29;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[CKDetailsController countOfContactViewModels](self, "countOfContactViewModels");
  v6 = objc_msgSend(v4, "row");
  if (v6 < v5 || -[CKDetailsController hasTUConversation](self, "hasTUConversation"))
  {
    if (-[CKDetailsController shouldAddToVisibleContactRowCountForTUConversation](self, "shouldAddToVisibleContactRowCountForTUConversation"))
    {
      v6 = v5 - 2;
    }
    else
    {
      -[CKDetailsController conversation](self, "conversation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "chat");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "isBusinessChat");

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "row"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412802;
        v23 = v10;
        v24 = 2112;
        v25 = v11;
        v26 = 2112;
        v27 = v12;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "_heightForContactCellAtIndexPath passed an indexPath with an invalid row index:%@, model count:%@, backtrace:%@", (uint8_t *)&v22, 0x20u);

      }
    }
    if (!v5)
    {
      v20 = 0.0;
      goto LABEL_13;
    }
    v6 = v5 - 1;
  }
  v13 = objc_alloc(+[CKDetailsContactsTableViewCell cellClass](CKDetailsContactsTableViewCell, "cellClass"));
  v14 = (void *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CKDetailsController contactsManager](self, "contactsManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contactsViewModels");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndex:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "configureWithViewModel:", v17);
  -[CKDetailsController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  objc_msgSend(v14, "sizeThatFits:", CGRectGetWidth(v29), 3.40282347e38);
  v20 = v19;

LABEL_13:
  return v20;
}

- (double)_heightForAuxContactCellAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  CKDetailsGroupHeaderCell *v7;
  void *v8;
  void *v9;
  void *v10;
  CKDetailsGroupHeaderCell *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  CKDetailsTUConversationCell *v24;
  void *v25;
  void *v26;
  CKDetailsTUConversationCell *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  if (v5 == -[CKDetailsController rowForShowMoreContactsCell](self, "rowForShowMoreContactsCell"))
  {
    -[CKDetailsController showMoreContactCellHeight](self, "showMoreContactCellHeight");
    if (v6 < 0.0)
    {
      v7 = [CKDetailsGroupHeaderCell alloc];
      +[CKDetailsGroupHeaderCell reuseIdentifier](CKDetailsGroupHeaderCell, "reuseIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsController contactsManager](self, "contactsManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "recipientsSortedByIsContact:alphabetically:", 1, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[CKDetailsGroupHeaderCell initWithStyle:reuseIdentifier:participants:](v7, "initWithStyle:reuseIdentifier:participants:", 0, v8, v10);

      -[CKDetailsController tableView](self, "tableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      -[CKDetailsGroupHeaderCell sizeThatFits:](v11, "sizeThatFits:", CGRectGetWidth(v36), 3.40282347e38);
      -[CKDetailsController setShowMoreContactCellHeight:](self, "setShowMoreContactCellHeight:", v13);

    }
    -[CKDetailsController showMoreContactCellHeight](self, "showMoreContactCellHeight");
LABEL_16:
    v22 = v14;
    goto LABEL_17;
  }
  v15 = objc_msgSend(v4, "row");
  if (v15 == -[CKDetailsController rowForAddMemberCell](self, "rowForAddMemberCell"))
  {
    -[CKDetailsController addContactCellHeight](self, "addContactCellHeight");
    if (v16 < 0.0)
    {
      v17 = objc_alloc(+[CKDetailsAddMemberCell cellClass](CKDetailsAddMemberCell, "cellClass"));
      v18 = (void *)objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[CKDetailsController tableView](self, "tableView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      objc_msgSend(v18, "sizeThatFits:", CGRectGetWidth(v37), 3.40282347e38);
      -[CKDetailsController setAddContactCellHeight:](self, "setAddContactCellHeight:", v20);

    }
    -[CKDetailsController addContactCellHeight](self, "addContactCellHeight");
    goto LABEL_16;
  }
  v21 = objc_msgSend(v4, "row");
  v22 = 0.0;
  if (v21 == -[CKDetailsController rowForTUConversationCell](self, "rowForTUConversationCell"))
  {
    -[CKDetailsController tuConversationCellHeight](self, "tuConversationCellHeight");
    if (v23 < 0.0)
    {
      v24 = [CKDetailsTUConversationCell alloc];
      +[CKDetailsTUConversationCell reuseIdentifier](CKDetailsTUConversationCell, "reuseIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsController tuConversation](self, "tuConversation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[CKDetailsTUConversationCell initWithStyle:reuseIdentifier:conversation:](v24, "initWithStyle:reuseIdentifier:conversation:", 0, v25, v26);

      -[CKDetailsController tableView](self, "tableView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "bounds");
      -[CKDetailsTUConversationCell sizeThatFits:](v27, "sizeThatFits:", CGRectGetWidth(v38), 3.40282347e38);
      v30 = v29;

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "detailsContactCellMinimumHeight");
      v33 = v32;

      if (v30 >= v33)
        v34 = v30;
      else
        v34 = v33;
      -[CKDetailsController setTuConversationCellHeight:](self, "setTuConversationCellHeight:", v34);

    }
    -[CKDetailsController tuConversationCellHeight](self, "tuConversationCellHeight");
    goto LABEL_16;
  }
LABEL_17:

  return v22;
}

- (double)_heightForExpanseActivityCell
{
  void *v3;
  CKDetailsExpanseActivityCell *v4;
  void *v5;
  void *v6;
  CKDetailsExpanseActivityCell *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  CGRect v21;
  CGRect v22;

  -[CKDetailsController tuConversation](self, "tuConversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0.0;
  v4 = [CKDetailsExpanseActivityCell alloc];
  +[CKDetailsExpanseActivityCell reuseIdentifier](CKDetailsExpanseActivityCell, "reuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController tuConversation](self, "tuConversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CKDetailsExpanseActivityCell initWithStyle:reuseIdentifier:conversation:](v4, "initWithStyle:reuseIdentifier:conversation:", 0, v5, v6);

  v8 = (void *)MEMORY[0x1E0D35818];
  -[CKDetailsController tuConversation](self, "tuConversation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isScreenShareActivityForTUConversation:", v9))
  {

LABEL_7:
    -[CKDetailsController tableView](self, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    -[CKDetailsExpanseActivityCell sizeThatFits:](v7, "sizeThatFits:", CGRectGetWidth(v22), 3.40282347e38);
    v10 = v18;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "detailsExpanseScreenShareCellHeight");
    goto LABEL_8;
  }
  -[CKDetailsController tuConversation](self, "tuConversation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKTUConversationViewUtilities activityImageForTUConversation:](CKTUConversationViewUtilities, "activityImageForTUConversation:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_7;
  -[CKDetailsController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  -[CKDetailsExpanseActivityCell sizeThatFits:](v7, "sizeThatFits:", CGRectGetWidth(v21), 3.40282347e38);
  v10 = v14;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "detailsExpanseCellHeight");
LABEL_8:
  v19 = v16;

  if (v10 < v19)
    v10 = v19;

  return v10;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  BOOL v6;
  __objc2_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  char v24;

  v5 = a4;
  if (-[CKDetailsController conversationHasLeft](self, "conversationHasLeft"))
  {
LABEL_2:
    v6 = 0;
  }
  else
  {
    v6 = 1;
    switch(objc_msgSend(v5, "section"))
    {
      case 2:
        v7 = CKDetailsSIMCell;
        goto LABEL_22;
      case 3:
        v7 = CKDetailsMapViewCell;
        goto LABEL_22;
      case 4:
        v7 = CKDetailsGroupNameCell;
        goto LABEL_22;
      case 6:
        v8 = objc_msgSend(v5, "row");
        if (v8 == -[CKDetailsController rowForAddMemberCell](self, "rowForAddMemberCell"))
          goto LABEL_20;
        v9 = objc_msgSend(v5, "row");
        if (v9 == -[CKDetailsController rowForShowMoreContactsCell](self, "rowForShowMoreContactsCell"))
          goto LABEL_20;
        v10 = objc_msgSend(v5, "row");
        if (v10 == -[CKDetailsController rowForTUConversationCell](self, "rowForTUConversationCell"))
          goto LABEL_2;
        v6 = CKIsRunningInMacCatalyst() == 0;
        break;
      case 7:
        v16 = objc_msgSend(v5, "row");
        -[CKDetailsController conversation](self, "conversation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = +[CKDetailsControllerLocationHelper cellTypeForRow:conversation:isFMFEnabled:shouldShowFMFView:](_TtC7ChatKit33CKDetailsControllerLocationHelper, "cellTypeForRow:conversation:isFMFEnabled:shouldShowFMFView:", v16, v17, -[CKDetailsController fmfEnabled](self, "fmfEnabled"), -[CKDetailsController shouldShowFMFView](self, "shouldShowFMFView"));

        v19 = -[CKDetailsController fmfEnabled](self, "fmfEnabled");
        v6 = v18 == 2 || v19;
        break;
      case 8:
        v7 = CKDetailsSharedWithYouCell;
        goto LABEL_22;
      case 9:
        v7 = CKDetailsChatOptionsCell;
        goto LABEL_22;
      case 10:
        if (!CKIsRunningUITests())
          goto LABEL_25;
        -[CKDetailsController conversation](self, "conversation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "chat");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "participants");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

        if (v23 > 2)
        {
LABEL_20:
          v6 = 1;
        }
        else
        {
LABEL_25:
          v24 = -[CKDetailsController canLeaveConversation](self, "canLeaveConversation");
LABEL_23:
          v6 = v24;
        }
        break;
      case 11:
      case 15:
        break;
      case 12:
        v7 = CKDetailsSegmentedControlCell;
LABEL_22:
        v24 = -[__objc2_class shouldHighlight](v7, "shouldHighlight");
        goto LABEL_23;
      case 13:
        objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isKeyTransparencyEnabled");

        if (!v12)
          goto LABEL_2;
        -[CKDetailsController tableView](self, "tableView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "cellForRowAtIndexPath:", v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[CKDetailsController conversation](self, "conversation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = +[CKKTDetailsViewUtilities shouldHighlightCell:forConversation:](CKKTDetailsViewUtilities, "shouldHighlightCell:forConversation:", v14, v15);

        break;
      default:
        goto LABEL_2;
    }
  }

  return v6;
}

- (BOOL)shouldDisplayHeaderForSection:(unint64_t)a3
{
  CKDetailsController *v3;
  void *v4;
  int v5;

  v3 = self;
  LOBYTE(self) = 0;
  if ((uint64_t)a3 > 9)
  {
    if (a3 == 13)
    {
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isKeyTransparencyEnabled");

      if (v5)
      {
        LODWORD(self) = -[CKDetailsController shouldShowKTSection](v3, "shouldShowKTSection");
        if ((_DWORD)self)
          LOBYTE(self) = CKIsRunningInMacCatalyst() == 0;
      }
      else
      {
        LOBYTE(self) = 0;
      }
    }
    else if (a3 == 10)
    {
      LOBYTE(self) = -[CKDetailsController shouldShowEnhancedGroupFeatures](v3, "shouldShowEnhancedGroupFeatures");
    }
  }
  else if (a3 == 1 || a3 == 3)
  {
    LOBYTE(self) = -[CKDetailsController shouldShowExpanseFeatures](v3, "shouldShowExpanseFeatures");
  }
  return (char)self;
}

- (BOOL)shouldDisplayFooterForSection:(unint64_t)a3
{
  BOOL result;
  void *v5;
  int v6;

  result = 1;
  switch(a3)
  {
    case 0uLL:
      return result;
    case 1uLL:
      result = -[CKDetailsController shouldShowExpanseFeatures](self, "shouldShowExpanseFeatures");
      break;
    case 2uLL:
      result = -[CKDetailsController shouldShowSIMTypeSection](self, "shouldShowSIMTypeSection");
      break;
    case 6uLL:
      result = -[CKDetailsController shouldShowBusinessInfoFooter](self, "shouldShowBusinessInfoFooter");
      break;
    case 8uLL:
      result = -[CKDetailsController shouldShowSharedWithYouFeatures](self, "shouldShowSharedWithYouFeatures");
      break;
    case 0xDuLL:
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isKeyTransparencyEnabled");

      if (!v6)
        goto LABEL_2;
      result = -[CKDetailsController shouldShowKTSection](self, "shouldShowKTSection");
      break;
    default:
LABEL_2:
      result = 0;
      break;
  }
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  _BOOL4 v6;
  void *v7;

  if (a4 == 13)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "isKeyTransparencyEnabled"))
    {
      v7 = 0;
      goto LABEL_7;
    }
    v6 = -[CKDetailsController shouldShowKTSection](self, "shouldShowKTSection");

    if (v6)
    {
      CKFrameworkBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("KT_HEADER_TEXT"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

      return v7;
    }
  }
  v7 = 0;
  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  _BOOL4 v10;

  v6 = a3;
  if (a4 == 13)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isKeyTransparencyEnabled") & 1) != 0)
    {
      v10 = -[CKDetailsController shouldShowKTSection](self, "shouldShowKTSection");

      if (v10)
      {
        v8 = *MEMORY[0x1E0CEBC10];
        goto LABEL_11;
      }
    }
    else
    {

    }
  }
  else if (a4 == 1)
  {
    -[CKDetailsController calculateHeightForExpanseActivityHeader](self, "calculateHeightForExpanseActivityHeader");
    v8 = v7;
    goto LABEL_11;
  }
  if (-[CKDetailsController shouldDisplayHeaderForSection:](self, "shouldDisplayHeaderForSection:", a4))
    v8 = 16.0;
  else
    v8 = 0.0;
LABEL_11:

  return v8;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;

  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v15 = v5;
    objc_msgSend(v5, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "theme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "detailsHeaderFooterContentViewBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v10);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "theme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "detailsHeaderFooterContentViewBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v13);

    v14 = CKIsRunningInMacCatalyst();
    v6 = v15;
    if (v14)
    {
      objc_msgSend(v15, "setBackgroundView:", 0);
      v6 = v15;
    }
  }

}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (CKIsRunningInMacCatalyst()
    && objc_msgSend(v8, "section") == 6
    && (v9 = objc_msgSend(v8, "row"),
        v9 != -[CKDetailsController rowForTUConversationCell](self, "rowForTUConversationCell")))
  {
    objc_msgSend(v7, "cellForRowAtIndexPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController _menuConfigForContactsCell:](self, "_menuConfigForContactsCell:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_menuConfigForContactsCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  -[CKDetailsController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CKDetailsController adjustedViewModelIndexForIndexPath:](self, "adjustedViewModelIndexForIndexPath:", v6);
  -[CKDetailsController contactsManager](self, "contactsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contactsViewModels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 <= v7)
  {
    v17 = 0;
  }
  else
  {
    v11 = -[CKDetailsController _canRemoveRecipientAtIndexPath:](self, "_canRemoveRecipientAtIndexPath:", v6);
    -[CKDetailsController contactsManager](self, "contactsManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contactsViewModels");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "entity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKDetailsController contactsManager](self, "contactsManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "conversationContextMenuConfigForEntity:allowConversationRemoval:", v15, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  double v7;
  BOOL v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  int v27;
  double v28;
  void *v29;
  int v30;
  void *v31;
  char v32;
  void *v33;
  int v34;
  CGRect v36;

  v6 = a3;
  v7 = 16.0;
  switch(a4)
  {
    case 0:
      v8 = !-[CKDetailsController supportsChatNameAndPhotoHeader](self, "supportsChatNameAndPhotoHeader");
      v9 = 0.0;
      v10 = 16.0;
      goto LABEL_25;
    case 2:
      v7 = 0.0;
      if (-[CKDetailsController shouldShowSIMTypeSection](self, "shouldShowSIMTypeSection"))
      {
        -[CKDetailsController switchToLabelForChat](self, "switchToLabelForChat");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          v7 = 16.0;
        else
          v7 = 0.0;
      }
      break;
    case 3:
      v7 = 0.0;
      if (!-[CKDetailsController shouldShowFMFView](self, "shouldShowFMFView"))
        break;
      goto LABEL_13;
    case 6:
      if (-[CKDetailsController shouldShowBusinessInfoFooter](self, "shouldShowBusinessInfoFooter"))
      {
        -[CKDetailsController initializeBusinessInfoViewIfNecessary](self, "initializeBusinessInfoViewIfNecessary");
        -[CKDetailsController tableView](self, "tableView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bounds");
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;

        -[CKDetailsController tableView](self, "tableView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "_marginWidth");
        v23 = v22;

        -[CKDetailsController businessInfoView](self, "businessInfoView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v36.origin.x = v14;
        v36.origin.y = v16;
        v36.size.width = v18;
        v36.size.height = v20;
        objc_msgSend(v24, "sizeThatFits:", CGRectGetWidth(v36) + v23 * -2.0, 1.79769313e308);
        v7 = v25;

      }
      else
      {
        -[CKDetailsController conversation](self, "conversation");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isGroupConversation");

        if ((v32 & 1) == 0)
        {
          -[CKDetailsController conversation](self, "conversation");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "isGroupConversation");

          v8 = v34 == 0;
          v9 = 0.0;
          v10 = 28.0;
LABEL_25:
          if (v8)
            v7 = v9;
          else
            v7 = v10;
        }
      }
      break;
    case 7:
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isWaldoCPolishEnabled");

      if (!v27)
      {
        v7 = 0.0;
        if (-[CKDetailsController shouldShowFMFView](self, "shouldShowFMFView"))
          break;
      }
LABEL_13:
      -[CKDetailsController calculateHeightForLocationSharingFooter](self, "calculateHeightForLocationSharingFooter");
      goto LABEL_19;
    case 8:
      v7 = 0.0;
      if (!-[CKDetailsController shouldShowSharedWithYouFeatures](self, "shouldShowSharedWithYouFeatures"))
        break;
      -[CKDetailsController calculateHeightForShareAutomaticallyFooter](self, "calculateHeightForShareAutomaticallyFooter");
      goto LABEL_19;
    case 10:
    case 11:
      break;
    case 12:
      if (!-[CKDetailsController downloadButtonState](self, "downloadButtonState"))
        goto LABEL_22;
      v8 = !-[CKDetailsController isDisplayingPhotos](self, "isDisplayingPhotos");
      v9 = 190.0;
      v10 = 110.0;
      goto LABEL_25;
    case 13:
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isKeyTransparencyEnabled");

      v7 = 0.0;
      if (!v30 || !-[CKDetailsController shouldShowKTSection](self, "shouldShowKTSection"))
        break;
      -[CKDetailsController calculateHeightForKTFooter](self, "calculateHeightForKTFooter");
LABEL_19:
      v7 = v28;
      break;
    default:
LABEL_22:
      v7 = 0.0;
      break;
  }

  return v7;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    switch(a5)
    {
      case 6:
        -[CKDetailsController businessInfoView](self, "businessInfoView");
        v11 = objc_claimAutoreleasedReturnValue();
        break;
      case 7:
        -[CKDetailsController locationSharingTextView](self, "locationSharingTextView");
        v11 = objc_claimAutoreleasedReturnValue();
        break;
      case 8:
        -[CKDetailsController sharedWithYouFooterTextView](self, "sharedWithYouFooterTextView");
        v11 = objc_claimAutoreleasedReturnValue();
        break;
      case 9:
      case 10:
      case 11:
      case 12:
        goto LABEL_11;
      case 13:
        objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isKeyTransparencyEnabled");

        if (!v13)
          goto LABEL_11;
        -[CKDetailsController ktSecurityFooterTextView](self, "ktSecurityFooterTextView");
        v11 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        if (a5 != 1)
          goto LABEL_11;
        -[CKDetailsController expanseActivityTextView](self, "expanseActivityTextView");
        v11 = objc_claimAutoreleasedReturnValue();
        break;
    }
    v14 = (void *)v11;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v15);

LABEL_11:
    objc_msgSend(v10, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "theme");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "detailsHeaderFooterContentViewBackgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v19);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "theme");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "detailsHeaderFooterContentViewBackgroundColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v22);

  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v5;

  if (a4 == 1)
  {
    if (-[CKDetailsController shouldDisplayHeaderForSection:](self, "shouldDisplayHeaderForSection:", 1))
    {
      -[CKDetailsController expanseActivityHeaderViewForSection:](self, "expanseActivityHeaderViewForSection:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  CKDetailsController *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;

  v6 = a3;
  v7 = 0;
  switch(a4)
  {
    case 3:
      if (!-[CKDetailsController shouldShowFooterInLocationSection:](self, "shouldShowFooterInLocationSection:", 3))
        goto LABEL_15;
      v8 = self;
      v9 = 3;
      goto LABEL_6;
    case 6:
      if (!-[CKDetailsController shouldShowBusinessInfoFooter](self, "shouldShowBusinessInfoFooter"))
        goto LABEL_15;
      -[CKDetailsController businessInfoFooterViewForSection:](self, "businessInfoFooterViewForSection:", 6);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 7:
      if (!-[CKDetailsController shouldShowFooterInLocationSection:](self, "shouldShowFooterInLocationSection:", 7))
        goto LABEL_15;
      v8 = self;
      v9 = 7;
LABEL_6:
      -[CKDetailsController locationFooterViewForSection:](v8, "locationFooterViewForSection:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 8:
      if (!-[CKDetailsController shouldShowSharedWithYouFeatures](self, "shouldShowSharedWithYouFeatures"))
        goto LABEL_15;
      -[CKDetailsController sharedWithYouFooterView](self, "sharedWithYouFooterView");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 12:
      if (-[CKDetailsController shouldShowDownloadMoreCell](self, "shouldShowDownloadMoreCell"))
      {
        -[CKDetailsController downloadAttachmentsFooterViewForSection:](self, "downloadAttachmentsFooterViewForSection:", 12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
      -[CKDetailsController setDownloadAttachmentsFooterView:](self, "setDownloadAttachmentsFooterView:", v7);
      -[CKDetailsController _updateDownloadFooterView](self, "_updateDownloadFooterView");
      goto LABEL_20;
    case 13:
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isKeyTransparencyEnabled");

      if (v12 && -[CKDetailsController shouldShowKTSection](self, "shouldShowKTSection"))
      {
        -[CKDetailsController ktSecurityFooterView](self, "ktSecurityFooterView");
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v7 = (void *)v10;
      }
      else
      {
LABEL_15:
        v7 = 0;
      }
LABEL_20:

      return v7;
    default:
      goto LABEL_20;
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  BOOL v6;

  v5 = a4;
  v6 = objc_msgSend(v5, "section") == 6
    && -[CKDetailsController _canRemoveRecipientAtIndexPath:](self, "_canRemoveRecipientAtIndexPath:", v5);

  return v6;
}

- (double)calculateHeightForLocationSharingFooter
{
  _BOOL4 v3;
  double result;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  CGRect v20;

  v3 = -[CKDetailsController shouldShowActiveDeviceSwitchFooter](self, "shouldShowActiveDeviceSwitchFooter");
  result = 24.0;
  if (v3)
  {
    -[CKDetailsController initializeLocationSharingTextViewIfNecessary](self, "initializeLocationSharingTextViewIfNecessary", 24.0);
    -[CKDetailsController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    -[CKDetailsController tableView](self, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_marginWidth");
    v16 = v15;

    -[CKDetailsController locationSharingTextView](self, "locationSharingTextView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20.origin.x = v7;
    v20.origin.y = v9;
    v20.size.width = v11;
    v20.size.height = v13;
    objc_msgSend(v17, "sizeThatFits:", CGRectGetWidth(v20) + v16 * -2.0, 1.79769313e308);
    v19 = v18;

    return v19 + 32.0;
  }
  return result;
}

- (double)calculateHeightForShareAutomaticallyFooter
{
  _BOOL4 v3;
  double result;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;

  v3 = -[CKDetailsController shouldShowSharedWithYouFeatures](self, "shouldShowSharedWithYouFeatures");
  result = 0.0;
  if (v3)
  {
    -[CKDetailsController tableView](self, "tableView", 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    -[CKDetailsController tableView](self, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_marginWidth");
    v16 = v15;

    -[CKDetailsController sharedWithYouFooterTextView](self, "sharedWithYouFooterTextView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23.origin.x = v7;
    v23.origin.y = v9;
    v23.size.width = v11;
    v23.size.height = v13;
    objc_msgSend(v17, "sizeThatFits:", CGRectGetWidth(v23) + v16 * -2.0, 1.79769313e308);
    v19 = v18;

    +[CKDetailsSharedWithYouHeaderFooterView topPadding](CKDetailsSharedWithYouHeaderFooterView, "topPadding");
    v21 = v19 + v20;
    +[CKDetailsSharedWithYouHeaderFooterView bottomPadding](CKDetailsSharedWithYouHeaderFooterView, "bottomPadding");
    return v21 + v22 + 16.0;
  }
  return result;
}

- (double)calculateHeightForExpanseActivityHeader
{
  double v3;
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  CGRect v23;

  v3 = 0.0;
  if (-[CKDetailsController shouldShowExpanseFeatures](self, "shouldShowExpanseFeatures"))
  {
    v4 = -[CKDetailsController expanseActivityTextView](self, "expanseActivityTextView");
    -[CKDetailsController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    -[CKDetailsController tableView](self, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_marginWidth");
    v16 = v15;

    -[CKDetailsController expanseActivityTextView](self, "expanseActivityTextView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23.origin.x = v7;
    v23.origin.y = v9;
    v23.size.width = v11;
    v23.size.height = v13;
    objc_msgSend(v17, "sizeThatFits:", CGRectGetWidth(v23) + v16 * -2.0, 1.79769313e308);
    v19 = v18;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "detailsExpanseActivityDescriptionVerticalPadding");
    v3 = v19 + 0.0 + v21;

  }
  return v3;
}

- (BOOL)_canRemoveRecipientAtIndexPath:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  v5 = -[CKDetailsController rowForShowMoreContactsCell](self, "rowForShowMoreContactsCell");
  if (-[CKDetailsController shouldShowEnhancedGroupFeatures](self, "shouldShowEnhancedGroupFeatures")
    && -[CKDetailsController _moreThanMinNumberOfParticipantsInGroup](self, "_moreThanMinNumberOfParticipantsInGroup")
    && !-[CKDetailsController conversationHasLeft](self, "conversationHasLeft")
    && (v6 = objc_msgSend(v4, "row"),
        v6 != -[CKDetailsController rowForTUConversationCell](self, "rowForTUConversationCell"))
    && (v5 == 0x7FFFFFFFFFFFFFFFLL
     || (v7 = objc_msgSend(v4, "row"),
         v7 > -[CKDetailsController rowForShowMoreContactsCell](self, "rowForShowMoreContactsCell"))))
  {
    v8 = objc_msgSend(v4, "row");
    v9 = v8 <= -[CKDetailsController rowForLastContact](self, "rowForLastContact");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_moreThanMinNumberOfParticipantsInGroup
{
  void *v2;
  BOOL v3;

  -[CKDetailsController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "recipientCount") > 2;

  return v3;
}

- (id)tableView:(id)a3 editActionsForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, void *);
  void *v19;
  CKDetailsController *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section") == 6
    && (v8 = objc_msgSend(v7, "row"), v8 != -[CKDetailsController rowForAddMemberCell](self, "rowForAddMemberCell")))
  {
    v10 = (void *)MEMORY[0x1E0CEAA80];
    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("REMOVE"), &stru_1E276D870, CFSTR("ChatKit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __62__CKDetailsController_tableView_editActionsForRowAtIndexPath___block_invoke;
    v19 = &unk_1E274F440;
    v20 = self;
    v21 = v6;
    objc_msgSend(v10, "rowActionWithStyle:title:handler:", 1, v12, &v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA478], "redColor", v16, v17, v18, v19, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v14);

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __62__CKDetailsController_tableView_editActionsForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = objc_msgSend(v4, "adjustedViewModelIndexForIndexPath:", v5);
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedHandles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "cellForRowAtIndexPath:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_presentRemoveRecipientSheetForHandle:fromView:", v10, v9);
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v4;
  void *v5;
  int v6;
  id v7;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isWaldoEnabled");

  if (v6 && objc_msgSend(v4, "section") == 3)
    v7 = 0;
  else
    v7 = v4;

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "row");
  switch(objc_msgSend(v6, "section"))
  {
    case 2:
      if (-[CKDetailsController shouldShowSIMTypeSection](self, "shouldShowSIMTypeSection"))
      {
        -[CKDetailsController tableView](self, "tableView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "reloadData");

      }
      goto LABEL_21;
    case 3:
      switch(v7)
      {
        case 2:
          goto LABEL_27;
        case 1:
          goto LABEL_30;
        case 0:
          -[CKDetailsController presentFullFMFMapViewController](self, "presentFullFMFMapViewController");
          break;
      }
      goto LABEL_21;
    case 6:
      -[CKDetailsController tableView](self, "tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cellForRowAtIndexPath:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && !CKIsRunningInMacCatalyst())
      {
        -[CKDetailsController conversation](self, "conversation");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isBusinessConversation");

        if (v23)
        {
          -[CKDetailsController _showBrandCard](self, "_showBrandCard");
        }
        else
        {
          v24 = objc_msgSend(v6, "row");
          v25 = -[CKDetailsController hasTUConversation](self, "hasTUConversation");
          v26 = -2;
          if (!v25)
            v26 = -1;
          v27 = v26 + v24;
          -[CKDetailsController contactsManager](self, "contactsManager");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "recipientsSortedByIsContact:alphabetically:", 1, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectAtIndex:", v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          -[CKDetailsController view](self, "view");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKDetailsController showContactCardForEntity:fromView:](self, "showContactCardForEntity:fromView:", v30, v31);

        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v32, "deselectRowAtIndexPath:animated:", v6, 1);
          if (-[CKDetailsController isContactsSectionCollapsed](self, "isContactsSectionCollapsed"))
            -[CKDetailsController expandContactsSection](self, "expandContactsSection");
          else
            -[CKDetailsController collapseContactsSection](self, "collapseContactsSection");
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[CKDetailsController presentGroupRecipientSelectionControllerAtIndexPath:](self, "presentGroupRecipientSelectionControllerAtIndexPath:", v6);
        }
      }
      goto LABEL_20;
    case 7:
      -[CKDetailsController conversation](self, "conversation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = +[CKDetailsControllerLocationHelper cellTypeForRow:conversation:isFMFEnabled:shouldShowFMFView:](_TtC7ChatKit33CKDetailsControllerLocationHelper, "cellTypeForRow:conversation:isFMFEnabled:shouldShowFMFView:", v7, v11, -[CKDetailsController fmfEnabled](self, "fmfEnabled"), -[CKDetailsController shouldShowFMFView](self, "shouldShowFMFView"));

      switch(v12)
      {
        case 2:
          -[CKDetailsController stageCurrentLocation](self, "stageCurrentLocation");
          break;
        case 1:
LABEL_27:
          -[CKDetailsController shareLocationAction](self, "shareLocationAction");
          break;
        case 0:
          objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isWaldoEnabled");

          if (v14)
            -[CKDetailsController stageLocationRequest](self, "stageLocationRequest");
          else
LABEL_30:
            -[CKDetailsController sendCurrentLocation](self, "sendCurrentLocation");
          break;
      }
      goto LABEL_21;
    case 10:
      objc_msgSend(v32, "cellForRowAtIndexPath:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsController presentLeaveActionSheetFromView:](self, "presentLeaveActionSheetFromView:", v10);
      goto LABEL_20;
    case 11:
      objc_msgSend(v32, "cellForRowAtIndexPath:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsController presentDeleteAndBlockActionSheetFromView:](self, "presentDeleteAndBlockActionSheetFromView:", v10);
      goto LABEL_20;
    case 13:
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isKeyTransparencyEnabled");

      if (!v16)
        goto LABEL_21;
      -[CKDetailsController tableView](self, "tableView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "cellForRowAtIndexPath:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[CKDetailsController showKTContactVerificationUI](self, "showKTContactVerificationUI");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[CKDetailsController enableEnhancedProtection](self, "enableEnhancedProtection");
      }
LABEL_20:

LABEL_21:
      objc_msgSend(v32, "deselectRowAtIndexPath:animated:", v6, 1);

      return;
    case 15:
      -[CKDetailsController conversation](self, "conversation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "chat");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "participants");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v21 >= 2)
        -[CKDetailsController _presentGroupNameAndPhotoEditor](self, "_presentGroupNameAndPhotoEditor");
      goto LABEL_21;
    default:
      goto LABEL_21;
  }
}

- (void)_showBrandCard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CKDetailsController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "businessHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "brand");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D396F8], "makeBrandPlacecardForIMBrand:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v6, 1);

    v5 = v8;
  }

}

- (void)setupKT
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  -[CKDetailsController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isBusinessChat");

  if ((v5 & 1) == 0)
  {
    -[CKDetailsController getKTStatus](self, "getKTStatus");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleKeyTransparencyStatusChangedNotification_, *MEMORY[0x1E0D353E8], 0);

    -[CKDetailsController conversation](self, "conversation");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchKTStatus");

  }
}

- (void)getKTStatus
{
  void *v3;
  void *v4;
  unint64_t v5;
  int64_t v6;
  id obj;

  -[CKDetailsController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = 0;
  v5 = objc_msgSend(v4, "keyTransparencyStatusForAffectedHandles:", &obj);
  objc_storeStrong((id *)&self->_ktHandlesForKtChatStatus, obj);
  v6 = 0;
  self->_ktChatState = v5;
  if (v5 - 1 <= 0xD)
    v6 = qword_18E7CA8A0[v5 - 1];
  self->_ktEnhancedProtectionStatusCellState = v6;
  if (self->_groupPhotoHeaderViewController)
    -[CKDetailsController _configureGroupPhotoHeader](self, "_configureGroupPhotoHeader");

}

- (void)_handleKeyTransparencyStatusChangedNotification:(id)a3
{
  id v4;

  -[CKDetailsController getKTStatus](self, "getKTStatus", a3);
  -[CKDetailsController tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (BOOL)shouldShowKeyTransparency
{
  return self->_ktEnhancedProtectionStatusCellState == 1;
}

- (void)_lastAddressedHandleUpdateNotification:(id)a3
{
  id v3;

  -[CKDetailsController tableView](self, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)_reloadForReadReceiptVisibilityChangeIfNeeded:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  v4 = -[CKDetailsController wasShowingReadReceiptSwitch](self, "wasShowingReadReceiptSwitch", a3);
  -[CKDetailsController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsSendingReadReceipts");

  if (v4 != v7)
  {
    -[CKDetailsController tableView](self, "tableView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadData");

  }
}

- (void)_chatAutoDonatingHandleUpdateNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v4 = a3;
  -[CKDetailsController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v11)
    goto LABEL_4;
  objc_msgSend(v11, "deviceIndependentID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceIndependentID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    objc_msgSend(v11, "setAutoDonationBehavior:", objc_msgSend(v6, "autoDonationBehavior"));
LABEL_4:
    -[CKDetailsController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadData");

  }
}

- (void)_handleAddressBookChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CKDetailsController conversation](self, "conversation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController _groupPhotoHeaderRequiredContactKeys](self, "_groupPhotoHeaderRequiredContactKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", v5, objc_msgSend(MEMORY[0x1E0C97468], "maxContactAvatars"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController groupIdentityDidUpdate:](self->_groupPhotoHeaderViewController, "groupIdentityDidUpdate:", v6);
  -[CKDetailsController _chatAutoDonatingHandleUpdateNotification:](self, "_chatAutoDonatingHandleUpdateNotification:", v4);

}

- (void)_conversationListFinishedMerging:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKDetailsController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conversationForExistingChatWithGUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (v5 != v9)
    {
      -[CKDetailsController setConversation:](self, "setConversation:", v9);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v13 = 138412546;
          v14 = v9;
          v15 = 2112;
          v16 = v5;
          _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Conversation list performed re-merge, updating details view conversation to %@ from %@", (uint8_t *)&v13, 0x16u);
        }

      }
    }
  }
  else if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = 138412290;
        v14 = v5;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "CKDetailsController attempted to replace conversation after re-merge, but couldn't find a new conversation to replace %@", (uint8_t *)&v13, 0xCu);
      }

    }
    -[CKDetailsController detailsControllerDelegate](self, "detailsControllerDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dismissDetailsNavigationController");

  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  -[CKDetailsController setGroupPhotoHeaderHeight:](self, "setGroupPhotoHeaderHeight:", a3, -1.0);
  -[CKDetailsController setSimLabelCellHeight:](self, "setSimLabelCellHeight:", -1.0);
}

- (void)_handleGroupPhotoChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CKGroupPhotoCell *v19;
  CKGroupPhotoCell *groupPhotoCell;
  CKGroupPhotoCell *v21;
  uint8_t buf[4];
  CKDetailsController *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v23 = self;
      v24 = 2112;
      v25 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "IMChatGroupPhotoChangedNotification _handleGroupPhotoChanged called on details controller %@ with notification %@", buf, 0x16u);
    }

  }
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chatIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController conversation](self, "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "chatIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isEqual:", v10);

  if (v11)
  {
    -[CKDetailsController conversation](self, "conversation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForKey:", CFSTR("sender"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController conversation](self, "conversation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateConversationVisualIdentityGroupPhotoWithSender:", v14);

    if (self->_groupPhotoHeaderViewController)
    {
      -[CKDetailsController _groupPhotoHeaderRequiredContactKeys](self, "_groupPhotoHeaderRequiredContactKeys");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", v16, objc_msgSend(MEMORY[0x1E0C97468], "maxContactAvatars"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNGroupIdentityHeaderViewController groupIdentityDidUpdate:](self->_groupPhotoHeaderViewController, "groupIdentityDidUpdate:", v17);
      if (!self->_groupPhotoCell)
      {
        v21 = [CKGroupPhotoCell alloc];
        +[CKGroupPhotoCell reuseIdentifier](CKGroupPhotoCell, "reuseIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[CKGroupPhotoCell initWithStyle:reuseIdentifier:](v21, "initWithStyle:reuseIdentifier:", 0, v18);
        groupPhotoCell = self->_groupPhotoCell;
        self->_groupPhotoCell = v19;

      }
      self->_needsContactsReload = 1;

    }
  }

}

- (void)_handleGroupDisplayNameChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  CKDetailsController *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v16 = 138412546;
      v17 = self;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "IMChatGroupDisplayNameChangedNotification _handleGroupDisplayNameChanged called on details controller %@ with notification %@", (uint8_t *)&v16, 0x16u);
    }

  }
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController conversation](self, "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
  {
    objc_msgSend(v4, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForKey:", CFSTR("sender"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController conversation](self, "conversation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateConversationVisualIdentityDisplayNameWithSender:", v11);

    if (self->_groupPhotoHeaderViewController)
    {
      -[CKDetailsController _groupPhotoHeaderRequiredContactKeys](self, "_groupPhotoHeaderRequiredContactKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsController conversation](self, "conversation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", v13, objc_msgSend(MEMORY[0x1E0C97468], "maxContactAvatars"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNGroupIdentityHeaderViewController groupIdentityDidUpdate:](self->_groupPhotoHeaderViewController, "groupIdentityDidUpdate:", v15);
    }

  }
}

- (void)_chatParticipantsChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CKDetailsController conversation](self, "conversation", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isGroupConversation") && self->_groupPhotoHeaderViewController)
  {
    objc_msgSend(v6, "setNeedsUpdatedContactOrderForVisualIdentity");
    -[CKDetailsController _groupPhotoHeaderRequiredContactKeys](self, "_groupPhotoHeaderRequiredContactKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", v4, objc_msgSend(MEMORY[0x1E0C97468], "maxContactAvatars"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGroupIdentityHeaderViewController groupIdentityDidUpdate:](self->_groupPhotoHeaderViewController, "groupIdentityDidUpdate:", v5);
    self->_needsContactsReload = 1;
    -[CKDetailsController _configureGroupPhotoHeader](self, "_configureGroupPhotoHeader");

  }
}

- (id)locationFooterViewForSection:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;

  -[CKDetailsController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  +[CKDetailsLocationShareHeaderFooterView reuseIdentifier](CKDetailsLocationShareHeaderFooterView, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forHeaderFooterViewReuseIdentifier:", v5, v6);

  +[CKDetailsLocationShareHeaderFooterView reuseIdentifier](CKDetailsLocationShareHeaderFooterView, "reuseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v4;
  objc_msgSend(v4, "dequeueReusableHeaderFooterViewWithIdentifier:", v7);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKDetailsController locationSharingTextView](self, "locationSharingTextView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("LOCATION_CURRENTLY_SHARING_FROM"), &stru_1E276D870, CFSTR("ChatKit"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deviceName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "userInterfaceLayoutDirection");

  if (v17 == 1)
    v18 = CFSTR("\u200F");
  else
    v18 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v18, "stringByAppendingString:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("LOCATION_SHARE_FROM_THIS_DEVICE"), &stru_1E276D870, CFSTR("ChatKit"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = v10;
  if (-[CKDetailsController fmfRestricted](self, "fmfRestricted")
    || CKIsRunningInMacCatalyst()
    || (objc_msgSend(v10, "isThisDevice") & 1) != 0)
  {
    v22 = v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v19, v21);
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = v22;
  v24 = objc_msgSend(v22, "rangeOfString:", v21);
  v39 = v25;
  v40 = v24;
  v26 = objc_msgSend(v23, "length");
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v23);
  v28 = *MEMORY[0x1E0DC1138];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "headerFont");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addAttribute:value:range:", v28, v30, 0, v26);

  v31 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addAttribute:value:range:", v31, v32, 0, v26);

  if (!-[CKDetailsController fmfRestricted](self, "fmfRestricted") && !CKIsRunningInMacCatalyst())
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "theme");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "appTintColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addAttribute:value:range:", v31, v34, v40, v39);

    v35 = *MEMORY[0x1E0DC1160];
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E276D870);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addAttribute:value:range:", v35, v36, v40, v39);

    objc_msgSend(v27, "addAttribute:value:range:", *MEMORY[0x1E0DC1248], MEMORY[0x1E0C9AAA0], v40, v39);
  }
  objc_msgSend(v8, "setAttributedText:", v27);
  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v42, "setLocationSharingTextView:", v8);

  return v42;
}

- (id)expanseActivityHeaderViewForSection:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[CKDetailsController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  +[CKDetailsExpanseActivityHeaderView reuseIdentifier](CKDetailsExpanseActivityHeaderView, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forHeaderFooterViewReuseIdentifier:", v5, v6);

  +[CKDetailsExpanseActivityHeaderView reuseIdentifier](CKDetailsExpanseActivityHeaderView, "reuseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableHeaderFooterViewWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKDetailsController expanseActivityTextView](self, "expanseActivityTextView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExpanseActivityTextView:", v9);

  return v8;
}

- (id)businessInfoFooterViewForSection:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[CKDetailsController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  +[CKDetailsBusinessInfoHeaderFooterView reuseIdentifier](CKDetailsBusinessInfoHeaderFooterView, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forHeaderFooterViewReuseIdentifier:", v5, v6);

  +[CKDetailsBusinessInfoHeaderFooterView reuseIdentifier](CKDetailsBusinessInfoHeaderFooterView, "reuseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableHeaderFooterViewWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKDetailsController businessInfoView](self, "businessInfoView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("BUSINESS_DESCRIPTION_IN_DETAILS"), &stru_1E276D870, CFSTR("ChatKit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDescriptionText:", v11);

  objc_msgSend(v8, "setBusinessInfoView:", v9);
  return v8;
}

- (id)sharedWithYouFooterView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CKDetailsController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  +[CKDetailsSharedWithYouHeaderFooterView reuseIdentifier](CKDetailsSharedWithYouHeaderFooterView, "reuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forHeaderFooterViewReuseIdentifier:", v4, v5);

  +[CKDetailsSharedWithYouHeaderFooterView reuseIdentifier](CKDetailsSharedWithYouHeaderFooterView, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableHeaderFooterViewWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKDetailsController sharedWithYouFooterTextView](self, "sharedWithYouFooterTextView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSharedWithYouTextView:", v8);

  return v7;
}

- (id)downloadAttachmentsFooterViewForSection:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[CKDetailsController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  +[CKDetailsDownloadAttachmentsHeaderFooterView reuseIdentifier](CKDetailsDownloadAttachmentsHeaderFooterView, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forHeaderFooterViewReuseIdentifier:", v5, v6);

  +[CKDetailsDownloadAttachmentsHeaderFooterView reuseIdentifier](CKDetailsDownloadAttachmentsHeaderFooterView, "reuseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableHeaderFooterViewWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDelegate:", self);
  return v8;
}

- (void)_updateDownloadFooterView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[CKDetailsController downloadAttachmentsText](self, "downloadAttachmentsText");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController downloadButtonText](self, "downloadButtonText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController downloadAttachmentsFooterView](self, "downloadAttachmentsFooterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleText:", v11);

  -[CKDetailsController downloadAttachmentsFooterView](self, "downloadAttachmentsFooterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButtonText:", v3);

  if (-[CKDetailsController downloadButtonState](self, "downloadButtonState") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[CKDetailsController downloadAttachmentsFooterView](self, "downloadAttachmentsFooterView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDownloadButtonTextColor:", v6);

  -[CKDetailsController downloadAttachmentsFooterView](self, "downloadAttachmentsFooterView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLogoHidden:", -[CKDetailsController isDisplayingPhotos](self, "isDisplayingPhotos"));

}

- (id)expanseActivityCellForIndexPath:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  CKDetailsExpanseActivityCell *v7;
  void *v8;
  void *v9;
  CKDetailsExpanseActivityCell *v10;

  -[CKDetailsController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  +[CKDetailsExpanseActivityCell reuseIdentifier](CKDetailsExpanseActivityCell, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v5, v6);

  v7 = [CKDetailsExpanseActivityCell alloc];
  +[CKDetailsExpanseActivityCell reuseIdentifier](CKDetailsExpanseActivityCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController tuConversation](self, "tuConversation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CKDetailsExpanseActivityCell initWithStyle:reuseIdentifier:conversation:](v7, "initWithStyle:reuseIdentifier:conversation:", 0, v8, v9);

  return v10;
}

- (id)reuseIdentifierForCellInSection:(unint64_t)a3
{
  return &stru_1E276D870;
}

- (id)leaveCellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  double v15;
  void *v16;
  void *v17;

  v4 = a3;
  -[CKDetailsController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("leaveCell_reuseIdentifier"));

  -[CKDetailsController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("leaveCell_reuseIdentifier"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("LEAVE_CONVERSATION"), &stru_1E276D870, CFSTR("ChatKit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v10);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v11);

  if (-[CKDetailsController conversationHasLeft](self, "conversationHasLeft"))
  {
    objc_msgSend(v8, "setEnabled:", 0);
  }
  else
  {
    -[CKDetailsController conversation](self, "conversation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", objc_msgSend(v12, "canLeave"));

  }
  objc_msgSend(v8, "setNumberOfLines:", 0);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isAccessibilityPreferredContentSizeCategory");

  if (v14)
  {
    LODWORD(v15) = 0.5;
    objc_msgSend(v8, "_setHyphenationFactor:", v15);
  }
  objc_msgSend(v7, "topSeperator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", 1);

  objc_msgSend(v7, "bottomSeperator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHidden:", 1);

  return v7;
}

- (id)deleteAndBlockCellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[CKDetailsController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("deleteAndBlockCell_reuseIdentifier"));

  -[CKDetailsController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("deleteAndBlockCell_reuseIdentifier"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DELETE_AND_BLOCK_THIS_CONVERSATION"), &stru_1E276D870, CFSTR("ChatKit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v10);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v11);

  objc_msgSend(v8, "setEnabled:", 1);
  objc_msgSend(v8, "setNumberOfLines:", 0);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v12, "isAccessibilityPreferredContentSizeCategory");

  if ((_DWORD)v10)
  {
    LODWORD(v13) = 0.5;
    objc_msgSend(v8, "_setHyphenationFactor:", v13);
  }
  objc_msgSend(v7, "topSeperator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", 1);

  objc_msgSend(v7, "bottomSeperator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidden:", 1);

  return v7;
}

- (id)simTypeCellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[CKDetailsController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("CKDetailsSIM_reuseIdentifier"));

  -[CKDetailsController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("CKDetailsSIM_reuseIdentifier"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNumberOfLines:", 0);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isAccessibilityPreferredContentSizeCategory");

  if (v10)
  {
    LODWORD(v11) = 0.5;
    objc_msgSend(v8, "_setHyphenationFactor:", v11);
  }
  objc_msgSend(v7, "bottomSeperator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", 1);

  objc_msgSend(v7, "topSeperator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", 1);

  return v7;
}

- (id)groupPhotoCellForIndexPath:(id)a3
{
  CKGroupPhotoCell *groupPhotoCell;

  groupPhotoCell = self->_groupPhotoCell;
  if (!groupPhotoCell)
  {
    -[CKDetailsController _configureGroupPhotoHeader](self, "_configureGroupPhotoHeader", a3);
    -[CKDetailsController addChildViewController:](self, "addChildViewController:", self->_groupPhotoHeaderViewController);
    groupPhotoCell = self->_groupPhotoCell;
  }
  return groupPhotoCell;
}

- (id)groupNameCellForIndexPath:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  CKDetailsGroupNameCell *v8;
  CKDetailsGroupNameCell *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  -[CKDetailsController groupNameCell](self, "groupNameCell", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[CKDetailsController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_class();
    +[CKDetailsGroupNameCell reuseIdentifier](CKDetailsGroupNameCell, "reuseIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", v6, v7);

    v8 = [CKDetailsGroupNameCell alloc];
    v9 = -[CKDetailsGroupNameCell initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CKDetailsController setGroupNameCell:](self, "setGroupNameCell:", v9);
    -[CKDetailsController groupNameView](self, "groupNameView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsGroupNameCell setGroupNameView:](v9, "setGroupNameView:", v10);

  }
  v11 = -[CKDetailsController groupNameView](self, "groupNameView");
  -[CKDetailsController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CKDetailsController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v12, 3);

  if (v13 > 0 || CKIsRunningInMacCatalyst())
  {
    -[CKDetailsController groupNameCell](self, "groupNameCell");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topSeperator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", 1);

  }
  -[CKDetailsController groupNameCell](self, "groupNameCell");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomSeperator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHidden:", 1);

  -[CKDetailsController groupNameCell](self, "groupNameCell");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (CKDetailsAddGroupNameView)groupNameView
{
  CKDetailsAddGroupNameView *groupNameView;
  CKDetailsAddGroupNameView *v4;
  CKDetailsAddGroupNameView *v5;
  CKDetailsAddGroupNameView *v6;
  void *v7;
  void *v8;

  groupNameView = self->_groupNameView;
  if (!groupNameView)
  {
    v4 = [CKDetailsAddGroupNameView alloc];
    v5 = -[CKDetailsAddGroupNameView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_groupNameView;
    self->_groupNameView = v5;

    groupNameView = self->_groupNameView;
  }
  -[CKDetailsController conversation](self, "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsAddGroupNameView setGroupName:](groupNameView, "setGroupName:", v8);

  -[CKDetailsAddGroupNameView setEnabled:](self->_groupNameView, "setEnabled:", -[CKDetailsController conversationHasLeft](self, "conversationHasLeft") ^ 1);
  -[CKDetailsAddGroupNameView setDelegate:](self->_groupNameView, "setDelegate:", self);
  return self->_groupNameView;
}

- (id)fmfViewControllerCellForIndexPath:(id)a3 shouldShowLocation:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  CKDetailsLocationStringCell *v48;
  CKDetailsLocationStringCell *v49;
  CKDetailsLocationStringCell *locationStringCell;
  CKDetailsLocationStringCell *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  __int128 buf;
  Class (*v70)(uint64_t);
  void *v71;
  uint64_t *v72;
  uint64_t v73;

  v4 = a4;
  v73 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "row"))
  {
    -[CKDetailsController locationShareCellForIndexPathRow:](self, "locationShareCellForIndexPathRow:", objc_msgSend(v6, "row") - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_41;
  }
  -[CKDetailsController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  +[CKDetailsMapViewCell reuseIdentifier](CKDetailsMapViewCell, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", v9, v10);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v11, "isWaldoEnabled");

  if ((_DWORD)v9)
  {
    -[CKDetailsController findMyWaldoMapViewController](self, "findMyWaldoMapViewController");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v65 = 0;
      v66 = &v65;
      v67 = 0x2050000000;
      v13 = (void *)getFMUILocationDetailViewControllerClass_softClass;
      v68 = getFMUILocationDetailViewControllerClass_softClass;
      if (!getFMUILocationDetailViewControllerClass_softClass)
      {
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v70 = __getFMUILocationDetailViewControllerClass_block_invoke;
        v71 = &unk_1E274A178;
        v72 = &v65;
        __getFMUILocationDetailViewControllerClass_block_invoke((uint64_t)&buf);
        v13 = (void *)v66[3];
      }
      v14 = objc_retainAutorelease(v13);
      _Block_object_dispose(&v65, 8);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array", v65);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsController conversation](self, "conversation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "chat");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "participants");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "__imArrayByApplyingBlock:", &__block_literal_global_58);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObjectsFromArray:", v19);

      v12 = objc_alloc_init(v14);
      if (!v12)
        goto LABEL_34;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v12, "setDelegate:", self);
      v65 = 0;
      v66 = &v65;
      v67 = 0x2050000000;
      v20 = (void *)getFMUILocationDetailViewControllerViewOptionsClass_softClass;
      v68 = getFMUILocationDetailViewControllerViewOptionsClass_softClass;
      if (!getFMUILocationDetailViewControllerViewOptionsClass_softClass)
      {
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v70 = __getFMUILocationDetailViewControllerViewOptionsClass_block_invoke;
        v71 = &unk_1E274A178;
        v72 = &v65;
        __getFMUILocationDetailViewControllerViewOptionsClass_block_invoke((uint64_t)&buf);
        v20 = (void *)v66[3];
      }
      v21 = objc_retainAutorelease(v20);
      _Block_object_dispose(&v65, 8);
      if (v21
        && (objc_opt_respondsToSelector() & 1) != 0
        && ((objc_msgSend(v21, "messagesChatDetails", v65),
             v22 = (void *)objc_claimAutoreleasedReturnValue(),
             (objc_opt_isKindOfClass() & 1) == 0)
          ? (v23 = 0)
          : (v23 = v22),
            v24 = v23,
            v22,
            v24))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "setViewOptions:", v24);
      }
      else
      {
        v22 = 0;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[CKDetailsController groupPhotoHeaderViewController](self, "groupPhotoHeaderViewController");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "displayNameForGroupIdentity");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        -[CKDetailsController conversation](self, "conversation");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "lastAddressedHandle");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "startObservingHandles:callerHandle:groupName:", v15, v37, v35);

      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
LABEL_32:
          -[CKDetailsController setFindMyWaldoMapViewController:](self, "setFindMyWaldoMapViewController:", v12, v65);
          objc_msgSend(v12, "willMoveToParentViewController:", self);
          -[CKDetailsController addChildViewController:](self, "addChildViewController:", v12);
          objc_msgSend(v12, "didMoveToParentViewController:", self);
LABEL_33:

LABEL_34:
          goto LABEL_35;
        }
        -[CKDetailsController conversation](self, "conversation");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "lastAddressedHandle");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setRemoteParticipantHandles:localParticipantHandle:", v15, v36);
      }

      goto LABEL_32;
    }
  }
  else
  {
    -[CKDetailsController mapViewController](self, "mapViewController");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v25 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("FMFMapViewController"), CFSTR("FMFUI"));
      -[CKDetailsController conversation](self, "conversation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "chat");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "participants");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsController fmfHandlesFromIMHandles:](self, "fmfHandlesFromIMHandles:", v28);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (id)objc_msgSend([v25 alloc], "initSimpleMapWithDelegate:handles:", self, v15);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "theme");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "appTintColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAnnotationTintColor:", v31);

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = CFSTR("NO");
          _os_log_impl(&dword_18DFCD000, v32, OS_LOG_TYPE_INFO, "Enable Map Controls? %@", (uint8_t *)&buf, 0xCu);
        }

      }
      objc_msgSend(v12, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setUserInteractionEnabled:", 0);

      objc_msgSend(v12, "mapView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setZoomEnabled:", 0);
      objc_msgSend(v22, "setScrollEnabled:", 0);
      objc_msgSend(v22, "setPitchEnabled:", 0);
      objc_msgSend(v22, "setRotateEnabled:", 0);
      -[CKDetailsController setMapViewController:](self, "setMapViewController:", v12);
      objc_msgSend(v12, "willMoveToParentViewController:", self);
      -[CKDetailsController addChildViewController:](self, "addChildViewController:", v12);
      objc_msgSend(v12, "didMoveToParentViewController:", self);
      goto LABEL_33;
    }
  }
LABEL_35:
  objc_msgSend(v12, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKDetailsController mapViewCell](self, "mapViewCell");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39 == 0;

  if (v40)
  {
    -[CKDetailsController tableView](self, "tableView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKDetailsMapViewCell reuseIdentifier](CKDetailsMapViewCell, "reuseIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "dequeueReusableCellWithIdentifier:forIndexPath:", v42, v6);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController setMapViewCell:](self, "setMapViewCell:", v43);

    if (v4)
    {
      -[CKDetailsController mapViewCell](self, "mapViewCell");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setShouldShowLocationString:", 1);

      if (!self->_locationStringCell)
      {
        -[CKDetailsController conversation](self, "conversation");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "recipients");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "firstObject");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        v48 = [CKDetailsLocationStringCell alloc];
        v49 = -[CKDetailsLocationStringCell initWithFrame:](v48, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        locationStringCell = self->_locationStringCell;
        self->_locationStringCell = v49;

        v51 = self->_locationStringCell;
        -[CKDetailsController mapViewCell](self, "mapViewCell");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "contentView");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "layoutMargins");
        -[CKDetailsLocationStringCell setLayoutMargins:](v51, "setLayoutMargins:");

        -[CKDetailsController updateLocationForRecipient:](self, "updateLocationForRecipient:", v47);
        -[CKDetailsController mapViewCell](self, "mapViewCell");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setLocationStringView:", self->_locationStringCell);

      }
    }
    -[CKDetailsController mapViewCell](self, "mapViewCell");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setMapView:", v38);

    -[CKDetailsController mapViewCell](self, "mapViewCell");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "contentView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController mapViewCell](self, "mapViewCell");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "topSeperator");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "bringSubviewToFront:", v59);

    -[CKDetailsController mapViewCell](self, "mapViewCell");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "contentView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController mapViewCell](self, "mapViewCell");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "bottomSeperator");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "bringSubviewToFront:", v63);

  }
  -[CKDetailsController mapViewCell](self, "mapViewCell");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_41:
  return v7;
}

uint64_t __76__CKDetailsController_fmfViewControllerCellForIndexPath_shouldShowLocation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ID");
}

- (void)initializeLocationSharingTextViewIfNecessary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CKDetailsController locationSharingTextView](self, "locationSharingTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEAB18]);
    v9 = (id)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v9, "setEditable:", 0);
    objc_msgSend(v9, "textContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLineFragmentPadding:", 0.0);

    objc_msgSend(v9, "setTextContainerInset:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
    objc_msgSend(v9, "setBackgroundColor:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v6);

    objc_msgSend(v9, "setScrollEnabled:", 0);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "headerFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v8);

    objc_msgSend(v9, "setDelegate:", self);
    -[CKDetailsController setLocationSharingTextView:](self, "setLocationSharingTextView:", v9);
    v3 = v9;
  }

}

- (void)initializeBusinessInfoViewIfNecessary
{
  void *v3;
  CKBusinessInfoView *v4;

  -[CKDetailsController businessInfoView](self, "businessInfoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = -[CKBusinessInfoView initWithLayoutType:]([CKBusinessInfoView alloc], "initWithLayoutType:", 1);
    -[CKBusinessInfoView setDelegate:](v4, "setDelegate:", self);
    -[CKDetailsController setBusinessInfoView:](self, "setBusinessInfoView:", v4);
    v3 = v4;
  }

}

- (id)groupCountCellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = a3;
  if (-[CKDetailsController shouldShowGroupCount](self, "shouldShowGroupCount"))
  {
    -[CKDetailsController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_class();
    +[CKDetailsGroupCountCell reuseIdentifier](CKDetailsGroupCountCell, "reuseIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", v6, v7);

    -[CKDetailsController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKDetailsGroupCountCell reuseIdentifier](CKDetailsGroupCountCell, "reuseIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DETAILS_VIEW_GROUP_COUNT_TEXT"), &stru_1E276D870, CFSTR("ChatKit"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController contactsManager](self, "contactsManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contactsViewModels");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v13, objc_msgSend(v15, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "userInterfaceLayoutDirection");

    if (v18 == 1)
      v19 = CFSTR("\u200F");
    else
      v19 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v20, "length");
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v20);
    v23 = *MEMORY[0x1E0DC1138];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "headerFont");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addAttribute:value:range:", v23, v25, 0, v21);

    v26 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addAttribute:value:range:", v26, v27, 0, v21);

    objc_msgSend(v10, "textLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAttributedText:", v22);

    objc_msgSend(v10, "topSeperator");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setHidden:", 0);

    objc_msgSend(v10, "bottomSeperator");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setHidden:", 1);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)contactsManagerCellForIndexPath:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  v6 = -[CKDetailsController visibleContactsRows](self, "visibleContactsRows");
  v7 = -[CKDetailsController isContactsSectionCollapsible](self, "isContactsSectionCollapsible");
  v8 = -[CKDetailsController shouldAddToVisibleContactRowCountForTUConversation](self, "shouldAddToVisibleContactRowCountForTUConversation");
  if (v5 == -[CKDetailsController rowForTUConversationCell](self, "rowForTUConversationCell"))
  {
    -[CKDetailsController tuConversationCellForIndexPath:](self, "tuConversationCellForIndexPath:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v13 = (void *)v9;
    goto LABEL_6;
  }
  if (v5 == -[CKDetailsController rowForShowMoreContactsCell](self, "rowForShowMoreContactsCell"))
  {
    -[CKDetailsController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    +[CKDetailsGroupHeaderCell reuseIdentifier](CKDetailsGroupHeaderCell, "reuseIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerClass:forCellReuseIdentifier:", v11, v12);

    -[CKDetailsController groupHeaderCellForIndexPath:](self, "groupHeaderCellForIndexPath:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (v5 >= v6 + v7 + v8)
  {
    if (v5 == -[CKDetailsController rowForAddMemberCell](self, "rowForAddMemberCell"))
    {
      -[CKDetailsController tableView](self, "tableView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = +[CKDetailsAddMemberCell cellClass](CKDetailsAddMemberCell, "cellClass");
      +[CKDetailsAddMemberCell reuseIdentifier](CKDetailsAddMemberCell, "reuseIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "registerClass:forCellReuseIdentifier:", v31, v32);

      -[CKDetailsController tableView](self, "tableView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKDetailsAddMemberCell reuseIdentifier](CKDetailsAddMemberCell, "reuseIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "dequeueReusableCellWithIdentifier:forIndexPath:", v34, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v34) = objc_msgSend(v35, "isCarrierPigeonEnabled");

      if ((_DWORD)v34)
        objc_msgSend(v13, "setEnabled:", -[CKDetailsController shouldEnableAddContactButton](self, "shouldEnableAddContactButton"));
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    -[CKDetailsController tableView](self, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[CKDetailsContactsTableViewCell cellClass](CKDetailsContactsTableViewCell, "cellClass");
    +[CKDetailsContactsTableViewCell reuseIdentifier](CKDetailsContactsTableViewCell, "reuseIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerClass:forCellReuseIdentifier:", v16, v17);

    -[CKDetailsController tableView](self, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKDetailsContactsTableViewCell reuseIdentifier](CKDetailsContactsTableViewCell, "reuseIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dequeueReusableCellWithIdentifier:forIndexPath:", v19, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = -[CKDetailsController adjustedViewModelIndexForIndexPath:](self, "adjustedViewModelIndexForIndexPath:", v4);
    -[CKDetailsController contactsManager](self, "contactsManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contactsViewModels");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndex:", v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "configureWithViewModel:", v23);
    objc_msgSend(v13, "contactAvatarView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDelegate:", self);
    objc_msgSend(v24, "setShowsContactOnTap:", 0);
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "_supportsForceTouch");

    if (v26)
    {
      objc_msgSend(v24, "setForcePressView:", v13);
      objc_msgSend(v24, "setUserInteractionEnabled:", 1);
      objc_msgSend(v24, "setShowsActionsOnForcePress:", 1);
    }
    -[CKDetailsController conversation](self, "conversation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "shouldHaveRoundRectAvatar");

    objc_msgSend(v24, "setStyle:", v28);
    objc_msgSend(v13, "setDelegate:", self);
    if (objc_msgSend(v4, "row") == 1
      && -[CKDetailsController hasTUConversation](self, "hasTUConversation")
      && !-[CKDetailsController isContactsSectionCollapsed](self, "isContactsSectionCollapsed"))
    {
      objc_msgSend(v13, "topSeperator");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setHidden:", 1);

    }
  }
LABEL_6:
  -[CKDetailsController _configureSeparatorForContactCell:indexPath:](self, "_configureSeparatorForContactCell:indexPath:", v13, v4);

  return v13;
}

- (id)tuConversationCellForIndexPath:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  CKDetailsTUConversationCell *v7;
  void *v8;
  void *v9;
  CKDetailsTUConversationCell *v10;

  -[CKDetailsController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  +[CKDetailsTUConversationCell reuseIdentifier](CKDetailsTUConversationCell, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v5, v6);

  v7 = [CKDetailsTUConversationCell alloc];
  +[CKDetailsTUConversationCell reuseIdentifier](CKDetailsTUConversationCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController tuConversation](self, "tuConversation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CKDetailsTUConversationCell initWithStyle:reuseIdentifier:conversation:](v7, "initWithStyle:reuseIdentifier:conversation:", 0, v8, v9);

  return v10;
}

- (id)groupHeaderCellForIndexPath:(id)a3
{
  CKDetailsGroupHeaderCell *v4;
  void *v5;
  void *v6;
  void *v7;
  CKDetailsGroupHeaderCell *v8;

  v4 = [CKDetailsGroupHeaderCell alloc];
  +[CKDetailsGroupHeaderCell reuseIdentifier](CKDetailsGroupHeaderCell, "reuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController contactsManager](self, "contactsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recipientsSortedByIsContact:alphabetically:", 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CKDetailsGroupHeaderCell initWithStyle:reuseIdentifier:participants:](v4, "initWithStyle:reuseIdentifier:participants:", 0, v5, v7);

  -[CKDetailsGroupHeaderCell configureCellIconForCollapsedState:](v8, "configureCellIconForCollapsedState:", -[CKDetailsController isContactsSectionCollapsed](self, "isContactsSectionCollapsed"));
  return v8;
}

- (id)indexPathForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  CKDetailsController *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = self;
  -[CKDetailsController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleCells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "contentView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "subviews");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsObject:", v4);

        if (v15)
        {
          -[CKDetailsController tableView](v19, "tableView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "indexPathForCell:", v12);
          v17 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v17;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)contactsCellDidTapPhoneButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CKEntity *v15;
  void *v16;
  int64_t v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a3;
  -[CKDetailsController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  -[CKDetailsController conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v6, "isBusinessConversation");

  if ((_DWORD)v5)
  {
    v7 = objc_alloc(MEMORY[0x1E0D35730]);
    objc_msgSend(MEMORY[0x1E0D35918], "iMessageService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithService:", v8);

    -[CKDetailsController conversation](self, "conversation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "businessHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "brand");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "primaryPhoneNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "length"))
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35830]), "initWithAccount:ID:alreadyCanonical:", v9, v13, 1);
      v15 = -[CKEntity initWithIMHandle:]([CKEntity alloc], "initWithIMHandle:", v14);
      -[CKDetailsController contactsManager](self, "contactsManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "startCommunicationForEntity:action:address:", v15, 2, 0);

    }
  }
  else
  {
    v17 = -[CKDetailsController adjustedViewModelIndexForIndexPath:](self, "adjustedViewModelIndexForIndexPath:", v20);
    -[CKDetailsController contactsManager](self, "contactsManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contactsViewModels");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndex:", v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKDetailsController contactsManager](self, "contactsManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startCommunicationForViewModel:action:address:", v9, 2, 0);
  }

}

- (void)contactsCellDidTapMessagesButton:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[CKDetailsController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v6 = -[CKDetailsController adjustedViewModelIndexForIndexPath:](self, "adjustedViewModelIndexForIndexPath:", v11);
  -[CKDetailsController contactsManager](self, "contactsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactsViewModels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKDetailsController contactsManager](self, "contactsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startCommunicationForViewModel:action:address:", v9, 4, 0);

}

- (void)contactsCellDidTapFaceTimeVideoButton:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[CKDetailsController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v6 = -[CKDetailsController adjustedViewModelIndexForIndexPath:](self, "adjustedViewModelIndexForIndexPath:", v11);
  -[CKDetailsController contactsManager](self, "contactsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactsViewModels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKDetailsController contactsManager](self, "contactsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startCommunicationForViewModel:action:address:", v9, 0, 0);

}

- (void)contactsCell:(id)a3 didHoverWithState:(int64_t)a4
{
  void *v6;
  void *v7;
  _BOOL4 v8;
  id v9;

  v9 = a3;
  -[CKDetailsController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visibleCells");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "containsObject:", v9))
  {
    v8 = -[CKDetailsController shouldShowGroupCount](self, "shouldShowGroupCount");

    if (v8)
    {
      if (a4 == 3)
      {
        objc_msgSend(v9, "_hideAllButtons");
      }
      else if (a4 == 1)
      {
        objc_msgSend(v9, "_updateVisibleButtons");
      }
    }
  }
  else
  {

  }
}

- (void)groupCellDidTapFaceTimeVideoButton:(id)a3
{
  id v4;

  if (CKIsRunningInMacCatalyst())
  {
    -[CKDetailsController contactsManager](self, "contactsManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginFacetimeCallWithVideo:", 1);

  }
}

- (void)groupCellDidTapPhoneButton:(id)a3
{
  id v4;

  if (CKIsRunningInMacCatalyst())
  {
    -[CKDetailsController contactsManager](self, "contactsManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginFacetimeCallWithVideo:", 0);

  }
}

- (void)_configureSeparatorForContactCell:(id)a3 indexPath:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "row");
  v8 = objc_msgSend(v6, "section");

  -[CKDetailsController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CKDetailsController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v9, v8);

  if (v7)
  {
    if (v7 < 1)
      goto LABEL_9;
    if (v7 == -[CKDetailsController rowForFirstContactCell](self, "rowForFirstContactCell"))
    {
      objc_msgSend(v23, "topSeperator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHidden:", 1);

    }
    objc_msgSend(v23, "bottomSeperator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", 1);

    if (!CKIsRunningInMacCatalyst())
    {
      objc_msgSend(v23, "setIndentTopSeperator:", 1);
      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(v23, "setIndentBottomSeperator:", 1);
    objc_msgSend(v23, "bottomSeperator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 0);

    if (!CKIsRunningInMacCatalyst())
      goto LABEL_9;
  }
  objc_msgSend(v23, "topSeperator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", 1);

LABEL_9:
  if (-[CKDetailsController hasTUConversation](self, "hasTUConversation"))
  {
    if (v7 == -[CKDetailsController rowForFirstContactCell](self, "rowForFirstContactCell"))
    {
      objc_msgSend(v23, "topSeperator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHidden:", 1);

    }
    if (v7 == -[CKDetailsController rowForShowMoreContactsCell](self, "rowForShowMoreContactsCell"))
    {
      objc_msgSend(v23, "topSeperator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setHidden:", 1);

      objc_msgSend(v23, "bottomSeperator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setHidden:", 0);

      objc_msgSend(v23, "setIndentBottomSeperator:", 1);
    }
  }
  v18 = v10 - 1;
  if (v7 == v10 - 2)
  {
    objc_msgSend(v23, "bottomSeperator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHidden:", 0);

    objc_msgSend(v23, "setIndentBottomSeperator:", 1);
  }
  v20 = v23;
  if (v7 == v18)
  {
    objc_msgSend(v23, "bottomSeperator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHidden:", 1);

    if (!v7)
      objc_msgSend(v23, "setIndentTopSeperator:", 0);
    objc_msgSend(v23, "topSeperator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHidden:", 1);

    v20 = v23;
  }

}

- (void)_configureSeparatorForOptionCell:(id)a3 indexPath:(id)a4
{
  id v5;
  _BOOL8 v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = objc_msgSend(a4, "row") == 0;
  objc_msgSend(v5, "topSeperator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v6);

  objc_msgSend(v5, "bottomSeperator");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setHidden:", 1);
}

- (id)switchSubscriptionCellForIndexPathRow:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[CKDetailsController simSwitchCell](self, "simSwitchCell", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMSharedHelperDeviceHasMultipleActiveSubscriptions())
  {
    -[CKDetailsController simSwitcherMenu](self, "simSwitcherMenu");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMenu:", v5);

    -[CKDetailsController labelForChat](self, "labelForChat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v4, "textLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsController simCellText:](self, "simCellText:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", v8);

    }
  }
  objc_msgSend(v4, "bottomSeperator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 1);

  objc_msgSend(v4, "topSeperator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", 1);

  return v4;
}

- (id)locationShareCellForIndexPathRow:(int64_t)a3
{
  void *v5;
  int64_t v6;
  void *v7;

  -[CKDetailsController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[CKDetailsControllerLocationHelper cellTypeForRow:conversation:isFMFEnabled:shouldShowFMFView:](_TtC7ChatKit33CKDetailsControllerLocationHelper, "cellTypeForRow:conversation:isFMFEnabled:shouldShowFMFView:", a3, v5, -[CKDetailsController fmfEnabled](self, "fmfEnabled"), -[CKDetailsController shouldShowFMFView](self, "shouldShowFMFView"));

  if (v6 == 2)
  {
    -[CKDetailsController _tableViewCellForSendCurrentLocation](self, "_tableViewCellForSendCurrentLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v6 == 1)
  {
    -[CKDetailsController _tableViewCellForSharingLocation:](self, "_tableViewCellForSharingLocation:", -[CKDetailsController allRecipientsAlreadyFollowingLocation](self, "allRecipientsAlreadyFollowingLocation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v6)
  {
    v7 = 0;
  }
  else
  {
    -[CKDetailsController _tableViewCellForSendOrRequestLocation](self, "_tableViewCellForSendOrRequestLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)_tableViewCellForSendOrRequestLocation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[CKDetailsController locationSendOrRequestCell](self, "locationSendOrRequestCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "theme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detailsTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v7);

  -[CKDetailsController conversation](self, "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "supportsCapabilities:", 4096);

  objc_msgSend(v3, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v10);

  objc_msgSend(v3, "setUserInteractionEnabled:", v10);
  return v3;
}

- (id)_tableViewCellForSendCurrentLocation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[CKDetailsController sendCurrentLocationCell](self, "sendCurrentLocationCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "theme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detailsTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v7);

  -[CKDetailsController conversation](self, "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "supportsCapabilities:", 4096);

  objc_msgSend(v3, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v10);

  objc_msgSend(v3, "setUserInteractionEnabled:", v10);
  return v3;
}

- (id)_tableViewCellForSharingLocation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  int v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;

  v3 = a3;
  -[CKDetailsController locationShareCell](self, "locationShareCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowOfferTimeRemaining:", 0);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isWaldoCPolishEnabled");

  v8 = -[CKDetailsController isGroupChat](self, "isGroupChat");
  v9 = v8;
  if (v7)
    v9 = v8 || -[CKDetailsController shouldShowFMFView](self, "shouldShowFMFView");
  objc_msgSend(v5, "topSeperator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v9);

  objc_msgSend(v5, "setIndentTopSeperator:", 1);
  if (v3)
  {
    objc_msgSend(v5, "setMenu:", 0);
    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("STOP_SHARE_LOCATION"), &stru_1E276D870, CFSTR("ChatKit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v14);

    -[CKDetailsController _conversationOfferTimeExpiration](self, "_conversationOfferTimeExpiration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceDate:", v17);
      v19 = v18;

      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v16, "isEqual:", v20);

      if ((v21 & 1) == 0 && v19 > 0.0)
      {
        objc_msgSend(v5, "setShowOfferTimeRemaining:", 1);
        objc_msgSend(v5, "setOfferTimeRemaining:", v19);
      }
    }
  }
  else
  {
    -[CKDetailsController locationShareMenu](self, "locationShareMenu");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMenu:", v22);

    CKFrameworkBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("SHARE_LOCATION"), &stru_1E276D870, CFSTR("ChatKit"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setText:", v24);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "theme");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "detailsTextColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTextColor:", v27);

  }
  if (CKIsRunningInMacCatalyst())
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isWaldoCPolishEnabled");

    if (v30
      && -[CKDetailsController allRecipientsAlreadyFollowingLocation](self, "allRecipientsAlreadyFollowingLocation"))
    {
      objc_msgSend(v5, "bottomSeperator");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setHidden:", 1);

    }
    objc_msgSend(v5, "setIndentBottomSeperator:", 1);
  }
  else
  {
    objc_msgSend(v5, "bottomSeperator");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setHidden:", 1);

  }
  -[CKDetailsController conversation](self, "conversation");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "chat");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "supportsCapabilities:", 4096);

  if (v35)
    v36 = -[CKDetailsController fmfRestricted](self, "fmfRestricted") ^ 1;
  else
    v36 = 0;
  objc_msgSend(v5, "textLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setEnabled:", v36);

  objc_msgSend(v5, "setUserInteractionEnabled:", v36);
  return v5;
}

- (id)_conversationOfferTimeExpiration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timedOfferExpirationForChat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CKDetailsSIMCell)simCell
{
  CKDetailsSIMCell *simCell;
  void *v4;
  uint64_t v5;
  void *v6;
  CKDetailsSIMCell *v7;
  void *v8;
  CKDetailsSIMCell *v9;
  CKDetailsSIMCell *v10;

  simCell = self->_simCell;
  if (!simCell)
  {
    -[CKDetailsController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_class();
    +[CKDetailsSIMCell reuseIdentifier](CKDetailsSIMCell, "reuseIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v5, v6);

    v7 = [CKDetailsSIMCell alloc];
    +[CKDetailsSIMCell reuseIdentifier](CKDetailsSIMCell, "reuseIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CKDetailsSIMCell initWithStyle:reuseIdentifier:](v7, "initWithStyle:reuseIdentifier:", 1, v8);
    v10 = self->_simCell;
    self->_simCell = v9;

    -[CKDetailsCell setIndentTopSeperator:](self->_simCell, "setIndentTopSeperator:", 1);
    simCell = self->_simCell;
  }
  return simCell;
}

- (CKDetailsLocationShareCell)locationShareCell
{
  CKDetailsLocationShareCell *locationShareCell;
  void *v4;
  uint64_t v5;
  void *v6;
  CKDetailsLocationShareCell *v7;
  void *v8;
  CKDetailsLocationShareCell *v9;
  CKDetailsLocationShareCell *v10;

  locationShareCell = self->_locationShareCell;
  if (!locationShareCell)
  {
    -[CKDetailsController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_class();
    +[CKDetailsLocationShareCell identifier](CKDetailsLocationShareCell, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v5, v6);

    v7 = [CKDetailsLocationShareCell alloc];
    +[CKDetailsLocationShareCell identifier](CKDetailsLocationShareCell, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CKDetailsLocationShareCell initWithStyle:reuseIdentifier:](v7, "initWithStyle:reuseIdentifier:", 1, v8);
    v10 = self->_locationShareCell;
    self->_locationShareCell = v9;

    -[CKDetailsLocationShareCell setShowOfferTimeRemaining:](self->_locationShareCell, "setShowOfferTimeRemaining:", 0);
    -[CKDetailsCell setIndentTopSeperator:](self->_locationShareCell, "setIndentTopSeperator:", 1);
    locationShareCell = self->_locationShareCell;
  }
  return locationShareCell;
}

- (CKDetailsSIMCell)simSwitchCell
{
  CKDetailsSIMCell *simSwitchCell;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CKDetailsSIMCell *v16;
  void *v17;
  void *v18;
  CKDetailsSIMCell *v19;
  void *v20;
  void *v21;
  void *v22;
  CKDetailsSIMCell *v23;
  CKDetailsSIMCell *v24;
  CKDetailsSIMCell *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  simSwitchCell = self->_simSwitchCell;
  if (!simSwitchCell)
  {
    -[CKDetailsController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_class();
    +[CKDetailsSIMCell reuseIdentifier](CKDetailsSIMCell, "reuseIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v5, v6);

    -[CKDetailsController conversation](self, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastAddressedSIMID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKDetailsController conversation](self, "conversation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "chat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastAddressedHandleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ctSubscriptionInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "__im_subscriptionContextForForSimID:phoneNumber:", v9, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = [CKDetailsSIMCell alloc];
      +[CKDetailsSIMCell reuseIdentifier](CKDetailsSIMCell, "reuseIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "label");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[CKDetailsSIMCell initWithStyle:reuseIdentifier:simLabelText:](v16, "initWithStyle:reuseIdentifier:simLabelText:", 0, v17, v18);
      v20 = self->_simSwitchCell;
      self->_simSwitchCell = v19;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "ctSubscriptionInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "preferredOrDefaultSubscriptionContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "label");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = [CKDetailsSIMCell alloc];
      +[CKDetailsSIMCell reuseIdentifier](CKDetailsSIMCell, "reuseIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[CKDetailsSIMCell initWithStyle:reuseIdentifier:simLabelText:](v23, "initWithStyle:reuseIdentifier:simLabelText:", 0, v20, v18);
      v25 = self->_simSwitchCell;
      self->_simSwitchCell = v24;

    }
    -[CKDetailsSIMCell textLabel](self->_simSwitchCell, "textLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("DETAILS_VIEW_SWITCH_SIM_CELL"), &stru_1E276D870, CFSTR("ChatKit"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setText:", v28);

    -[CKDetailsCell topSeperator](self->_simSwitchCell, "topSeperator");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setHidden:", 1);

    -[CKDetailsCell bottomSeperator](self->_simSwitchCell, "bottomSeperator");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setHidden:", 1);

    simSwitchCell = self->_simSwitchCell;
  }
  return simSwitchCell;
}

- (CKTranscriptDetailsResizableCell)locationSendOrRequestCell
{
  void *v3;
  uint64_t v4;
  void *v5;
  CKTranscriptDetailsResizableCell *v6;
  void *v7;
  CKTranscriptDetailsResizableCell *v8;
  CKTranscriptDetailsResizableCell *locationSendOrRequestCell;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;

  -[CKDetailsController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  +[CKTranscriptDetailsResizableCell identifier](CKTranscriptDetailsResizableCell, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v5);

  v6 = [CKTranscriptDetailsResizableCell alloc];
  +[CKTranscriptDetailsResizableCell identifier](CKTranscriptDetailsResizableCell, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CKTranscriptDetailsResizableCell initWithStyle:reuseIdentifier:](v6, "initWithStyle:reuseIdentifier:", 0, v7);
  locationSendOrRequestCell = self->_locationSendOrRequestCell;
  self->_locationSendOrRequestCell = v8;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v10, "isWaldoEnabled");

  -[CKTranscriptDetailsResizableCell textLabel](self->_locationSendOrRequestCell, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((_DWORD)v7)
    v14 = CFSTR("REQUEST_LOCATION");
  else
    v14 = CFSTR("SEND_LOCATION");
  objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1E276D870, CFSTR("ChatKit"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v15);

  -[CKDetailsCell topSeperator](self->_locationSendOrRequestCell, "topSeperator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", 1);

  -[CKDetailsCell bottomSeperator](self->_locationSendOrRequestCell, "bottomSeperator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHidden:", 1);

  return self->_locationSendOrRequestCell;
}

- (CKTranscriptDetailsResizableCell)sendCurrentLocationCell
{
  void *v3;
  uint64_t v4;
  void *v5;
  CKTranscriptDetailsResizableCell *v6;
  void *v7;
  CKTranscriptDetailsResizableCell *v8;
  CKTranscriptDetailsResizableCell *sendCurrentLocationCell;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[CKDetailsController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  +[CKTranscriptDetailsResizableCell identifier](CKTranscriptDetailsResizableCell, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v5);

  v6 = [CKTranscriptDetailsResizableCell alloc];
  +[CKTranscriptDetailsResizableCell identifier](CKTranscriptDetailsResizableCell, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CKTranscriptDetailsResizableCell initWithStyle:reuseIdentifier:](v6, "initWithStyle:reuseIdentifier:", 0, v7);
  sendCurrentLocationCell = self->_sendCurrentLocationCell;
  self->_sendCurrentLocationCell = v8;

  -[CKTranscriptDetailsResizableCell textLabel](self->_sendCurrentLocationCell, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SEND_LOCATION"), &stru_1E276D870, CFSTR("ChatKit"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v12);

  -[CKDetailsCell topSeperator](self->_sendCurrentLocationCell, "topSeperator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", 1);

  -[CKDetailsCell bottomSeperator](self->_sendCurrentLocationCell, "bottomSeperator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", 1);

  return self->_sendCurrentLocationCell;
}

- (CKTranscriptDetailsResizableCell)locationStartShareCell
{
  void *v3;
  uint64_t v4;
  void *v5;
  CKTranscriptDetailsResizableCell *v6;
  void *v7;
  CKTranscriptDetailsResizableCell *v8;
  CKTranscriptDetailsResizableCell *locationStartShareCell;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  CKTranscriptDetailsResizableCell *v14;
  void *v15;

  if (!self->_locationStartShareCell)
  {
    -[CKDetailsController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_class();
    +[CKTranscriptDetailsResizableCell identifier](CKTranscriptDetailsResizableCell, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v5);

    v6 = [CKTranscriptDetailsResizableCell alloc];
    +[CKTranscriptDetailsResizableCell identifier](CKTranscriptDetailsResizableCell, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CKTranscriptDetailsResizableCell initWithStyle:reuseIdentifier:](v6, "initWithStyle:reuseIdentifier:", 0, v7);
    locationStartShareCell = self->_locationStartShareCell;
    self->_locationStartShareCell = v8;

    -[CKTranscriptDetailsResizableCell textLabel](self->_locationStartShareCell, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SHARE_LOCATION"), &stru_1E276D870, CFSTR("ChatKit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v12);

    -[CKDetailsCell setIndentTopSeperator:](self->_locationStartShareCell, "setIndentTopSeperator:", 1);
    v13 = CKIsRunningInMacCatalyst();
    v14 = self->_locationStartShareCell;
    if (v13)
    {
      -[CKDetailsCell setIndentBottomSeperator:](v14, "setIndentBottomSeperator:", 1);
    }
    else
    {
      -[CKDetailsCell bottomSeperator](v14, "bottomSeperator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHidden:", 1);

    }
  }
  return self->_locationStartShareCell;
}

- (CKTranscriptDetailsResizableCell)openInContactsCell
{
  CKTranscriptDetailsResizableCell *openInContactsCell;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  CKTranscriptDetailsResizableCell *v8;
  void *v9;
  CKTranscriptDetailsResizableCell *v10;
  CKTranscriptDetailsResizableCell *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  openInContactsCell = self->_openInContactsCell;
  if (!openInContactsCell)
  {
    -[CKDetailsController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_class();
    +[CKTranscriptDetailsResizableCell identifier](CKTranscriptDetailsResizableCell, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v5, v6);

    -[CKDetailsCell bottomSeperator](self->_locationStartShareCell, "bottomSeperator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

    v8 = [CKTranscriptDetailsResizableCell alloc];
    +[CKTranscriptDetailsResizableCell identifier](CKTranscriptDetailsResizableCell, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CKTranscriptDetailsResizableCell initWithStyle:reuseIdentifier:](v8, "initWithStyle:reuseIdentifier:", 0, v9);
    v11 = self->_openInContactsCell;
    self->_openInContactsCell = v10;

    -[CKTranscriptDetailsResizableCell textLabel](self->_openInContactsCell, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("OPEN_IN_CONTACTS"), &stru_1E276D870, CFSTR("ChatKit"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v14);

    -[CKTranscriptDetailsResizableCell textLabel](self->_openInContactsCell, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "theme");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appTintColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v18);

    -[CKTranscriptDetailsResizableCell textLabel](self->_openInContactsCell, "textLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setEnabled:", 1);

    openInContactsCell = self->_openInContactsCell;
  }
  return openInContactsCell;
}

- (CKDetailsCell)changeGroupNamePhotoCell
{
  void *v3;
  uint64_t v4;
  void *v5;
  CKTranscriptDetailsResizableCell *v6;
  void *v7;
  CKDetailsCell *v8;
  CKDetailsCell *changeGroupNamePhotoCell;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  if (!self->_changeGroupNamePhotoCell && !CKIsRunningInMacCatalyst())
  {
    -[CKDetailsController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_class();
    +[CKTranscriptDetailsResizableCell identifier](CKTranscriptDetailsResizableCell, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v5);

    v6 = [CKTranscriptDetailsResizableCell alloc];
    +[CKTranscriptDetailsResizableCell identifier](CKTranscriptDetailsResizableCell, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CKTranscriptDetailsResizableCell initWithStyle:reuseIdentifier:](v6, "initWithStyle:reuseIdentifier:", 0, v7);
    changeGroupNamePhotoCell = self->_changeGroupNamePhotoCell;
    self->_changeGroupNamePhotoCell = v8;

    -[CKDetailsCell textLabel](self->_changeGroupNamePhotoCell, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CHANGE_GROUP_NAME_AND_PHOTO"), &stru_1E276D870, CFSTR("ChatKit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v12);

    -[CKDetailsCell textLabel](self->_changeGroupNamePhotoCell, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "theme");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appTintColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v16);

    -[CKDetailsCell textLabel](self->_changeGroupNamePhotoCell, "textLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setEnabled:", 1);

    -[CKDetailsCell bottomSeperator](self->_changeGroupNamePhotoCell, "bottomSeperator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHidden:", 1);

    -[CKDetailsCell topSeperator](self->_changeGroupNamePhotoCell, "topSeperator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHidden:", 1);

  }
  return self->_changeGroupNamePhotoCell;
}

- (int64_t)_targetToggleIndexForOptionRow:(unint64_t)a3
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v7;
  void *v8;
  int v9;

  if (a3 == 2)
  {
    -[CKDetailsController conversation](self, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "supportsSendingReadReceipts");

    if (v9)
      return 2;
    else
      return 1;
  }
  else if (a3 == 1)
  {
    -[CKDetailsController conversation](self, "conversation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "chat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "supportsSendingReadReceipts");

    return v5;
  }
  else
  {
    return 0;
  }
}

- (unint64_t)_optionRowForIndexPath:(id)a3
{
  unint64_t result;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  result = objc_msgSend(a3, "row");
  if (result)
  {
    if (result != 2)
    {
      if (result != 1)
        return -1;
      -[CKDetailsController conversation](self, "conversation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "chat");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "supportsSendingReadReceipts");

      if ((v7 & 1) != 0)
        return 1;
    }
    -[CKDetailsController canShareFocusStatus](self, "canShareFocusStatus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if ((v9 & 1) != 0)
      return 2;
    return -1;
  }
  return result;
}

- (id)chatOptionsCellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;

  v4 = a3;
  -[CKDetailsController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  +[CKDetailsChatOptionsCell reuseIdentifier](CKDetailsChatOptionsCell, "reuseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", v6, v7);

  v8 = -[CKDetailsController _optionRowForIndexPath:](self, "_optionRowForIndexPath:", v4);
  if (v8 == 2)
  {
    -[CKDetailsController canShareFocusStatus](self, "canShareFocusStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    if (v14)
    {
      -[CKDetailsController createShareFocusStatusCellAtIndexPath:](self, "createShareFocusStatusCellAtIndexPath:", v4);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_10:
    v15 = 0;
    goto LABEL_11;
  }
  if (v8 != 1)
  {
    if (v8)
    {
      v15 = 0;
      goto LABEL_13;
    }
    -[CKDetailsController createDNDCellAtIndexPath:](self, "createDNDCellAtIndexPath:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[CKDetailsController conversation](self, "conversation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "chat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "supportsSendingReadReceipts");

  if (!v12)
    goto LABEL_10;
  -[CKDetailsController createReadReceiptsCellAtIndexPath:](self, "createReadReceiptsCellAtIndexPath:", v4);
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v15 = (void *)v9;
LABEL_11:
  -[CKDetailsController _configureSeparatorForOptionCell:indexPath:](self, "_configureSeparatorForOptionCell:indexPath:", v15, v4);
LABEL_13:

  return v15;
}

- (id)createDNDCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;

  v4 = a3;
  -[CKDetailsController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKDetailsChatOptionsCell reuseIdentifier](CKDetailsChatOptionsCell, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "controlSwitch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DETAILS_VIEW_HIDE_ALERTS_TOGGLE_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v11);

  objc_msgSend(v9, "setEnabled:", -[CKDetailsController conversationHasLeft](self, "conversationHasLeft") ^ 1);
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel_doNotDisturbValueChange_, 4096);
  objc_msgSend(v8, "setEnabled:", -[CKDetailsController conversationHasLeft](self, "conversationHasLeft") ^ 1);
  -[CKDetailsController conversation](self, "conversation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOn:animated:", objc_msgSend(v12, "isMuted"), 0);

  v13 = 0;
  if (!-[CKDetailsController shouldShowEnhancedGroupFeatures](self, "shouldShowEnhancedGroupFeatures"))
  {
    -[CKDetailsController conversation](self, "conversation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "chat");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "supportsCapabilities:", 256);

    v13 = v16 ^ 1;
  }
  if (CKIsRunningInMacCatalyst() && (v13 & 1) == 0)
  {
    objc_msgSend(v7, "bottomSeperator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHidden:", 0);

    objc_msgSend(v7, "setIndentBottomSeperator:", 1);
  }

  return v7;
}

- (id)createReadReceiptsCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[CKDetailsController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKDetailsChatOptionsCell reuseIdentifier](CKDetailsChatOptionsCell, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "controlSwitch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("READ_RECEIPTS"), &stru_1E276D870, CFSTR("ChatKit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v11);

  objc_msgSend(v8, "addTarget:action:forEvents:", self, sel_readReceiptsSwitchValueChanged_, 4096);
  -[CKDetailsController conversation](self, "conversation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOn:animated:", objc_msgSend(v12, "shouldSendReadReceipts"), 0);

  objc_msgSend(v7, "setIndentTopSeperator:", 1);
  return v7;
}

- (id)createShareFocusStatusCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[CKDetailsController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKDetailsChatOptionsCell reuseIdentifier](CKDetailsChatOptionsCell, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "controlSwitch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SHARE_FOCUS_STATUS"), &stru_1E276D870, CFSTR("ChatKit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);
  objc_msgSend(v8, "addTarget:action:forEvents:", self, sel_shareFocusStatusSwitchValueChanged_, 4096);
  -[CKDetailsController isSharingFocusStatus](self, "isSharingFocusStatus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v12 != 0);

  -[CKDetailsController isSharingFocusStatus](self, "isSharingFocusStatus");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOn:animated:", objc_msgSend(v13, "BOOLValue"), 0);

  objc_msgSend(v7, "setIndentTopSeperator:", 1);
  return v7;
}

- (id)sharedWithYouCellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  -[CKDetailsController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  +[CKDetailsSharedWithYouCell reuseIdentifier](CKDetailsSharedWithYouCell, "reuseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", v6, v7);

  -[CKDetailsController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKDetailsSharedWithYouCell reuseIdentifier](CKDetailsSharedWithYouCell, "reuseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "controlSwitch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("MARK_AS_AUTO_DONATING"), &stru_1E276D870, CFSTR("ChatKit"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v14);

  objc_msgSend(v10, "topSeperator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidden:", 1);

  objc_msgSend(v10, "bottomSeperator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", 1);

  objc_msgSend(v11, "addTarget:action:forEvents:", self, sel_autoDonationSwitchValueChanged_, 4096);
  -[CKDetailsController conversation](self, "conversation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "chat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOn:animated:", objc_msgSend(v18, "isAutoDonatingMessages"), 0);

  return v10;
}

- (id)editConversationCellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[CKDetailsController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKTranscriptDetailsResizableCell identifier](CKTranscriptDetailsResizableCell, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("EDIT_CONVERSATION"), &stru_1E276D870, CFSTR("ChatKit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v10);

  objc_msgSend(v7, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "theme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appTintColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v14);

  objc_msgSend(v7, "setIndentTopSeperator:", 1);
  return v7;
}

- (id)childViewController:(id)a3 cellForIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  unint64_t v17;
  void *v18;

  v6 = a4;
  v7 = a3;
  -[CKDetailsController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  +[CKDetailsChildViewControllerCell reuseIdentifier](CKDetailsChildViewControllerCell, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", v9, v10);

  -[CKDetailsController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKDetailsChildViewControllerCell reuseIdentifier](CKDetailsChildViewControllerCell, "reuseIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dequeueReusableCellWithIdentifier:forIndexPath:", v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKDetailsController traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "horizontalSizeClass") == 1)
  {
    v15 = 0;
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "orientation") - 1;

  if (v17 >= 2)
  {
    -[CKDetailsController traitCollection](self, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "verticalSizeClass") != 1;
    goto LABEL_6;
  }
  v15 = 0;
LABEL_7:
  objc_msgSend(v13, "setShouldUseLayoutMargins:", v15);
  objc_msgSend(v7, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setChildViewControllerView:", v18);
  return v13;
}

- (void)initializeSearchController
{
  void *v3;
  CKDetailsSearchViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CKDetailsSearchViewController *v12;

  -[CKDetailsController searchViewController](self, "searchViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [CKDetailsSearchViewController alloc];
    +[CKSpotlightQueryUtilities detailsSearchControllers](CKSpotlightQueryUtilities, "detailsSearchControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CKDetailsSearchViewController initWithSearchControllerClasses:](v4, "initWithSearchControllerClasses:", v5);

    -[CKSearchViewController setMode:](v12, "setMode:", 3);
    -[CKDetailsController conversation](self, "conversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsSearchViewController setConversation:](v12, "setConversation:", v6);

    -[CKDetailsSearchViewController setDetailsDelegate:](v12, "setDetailsDelegate:", self);
    -[CKDetailsController setSearchViewController:](self, "setSearchViewController:", v12);
    -[CKDetailsController searchViewController](self, "searchViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "willMoveToParentViewController:", self);

    -[CKDetailsController searchViewController](self, "searchViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController addChildViewController:](self, "addChildViewController:", v8);

    -[CKDetailsController searchViewController](self, "searchViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchWithText:", &stru_1E276D870);

    if (CKIsRunningInMacCatalyst())
    {
      -[CKDetailsController searchViewController](self, "searchViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "layoutIfNeeded");

    }
  }
}

- (id)searchAttachmentViewControllerCellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CKDetailsController initializeSearchController](self, "initializeSearchController");
  -[CKDetailsController searchViewController](self, "searchViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController childViewController:cellForIndexPath:](self, "childViewController:cellForIndexPath:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setShouldUseLayoutMargins:", 0);
  objc_msgSend(v6, "topSeperator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  objc_msgSend(v6, "bottomSeperator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 1);

  return v6;
}

- (void)detailsSearchControllerContentDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "DISMISSED SIM switch menu", buf, 2u);
    }

  }
  -[CKDetailsController simSwitchCell](self, "simSwitchCell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contextMenuInteraction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dismissMenu");

  -[CKDetailsController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadData");

  v10 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__CKDetailsController_detailsSearchControllerContentDidChange___block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_after(v10, MEMORY[0x1E0C80D38], block);

}

void __63__CKDetailsController_detailsSearchControllerContentDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (void)detailsSearchController:(id)a3 requestsPushOfSearchController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CKDetailsController navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v5, 1);

}

- (void)setupContactsManager
{
  CKDetailsContactsManager *v3;
  void *v4;
  CKDetailsContactsManager *v5;

  v3 = [CKDetailsContactsManager alloc];
  -[CKDetailsController conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CKDetailsContactsManager initWithConversation:delegate:](v3, "initWithConversation:delegate:", v4, self);

  -[CKDetailsController setContactsManager:](self, "setContactsManager:", v5);
  -[CKDetailsController setShouldCollapseContactsSection:](self, "setShouldCollapseContactsSection:", 1);

}

- (void)handleTapOnChromeAvatar:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CKDetailsController conversation](self, "conversation", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CKDetailsController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController showContactCardForEntity:fromView:](self, "showContactCardForEntity:fromView:", v7, v6);

}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  y = a4.y;
  x = a4.x;
  -[CKDetailsController tableView](self, "tableView", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CKDetailsController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v7, 3);

  if (v8)
  {
    -[CKDetailsController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexPathForRowAtPoint:", x, y);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "section") == 3
      && (v11 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("FMFMapViewController"), CFSTR("FMF"))) != 0)
    {
      v12 = [v11 alloc];
      -[CKDetailsController conversation](self, "conversation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "chat");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "allSiblingFMFHandles");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v12, "initWithDelegate:handles:", self, v15);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "theme");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "appTintColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAnnotationTintColor:", v19);

      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v16);
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (void)previewingContext:(id)a3 commitViewController:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if (MEMORY[0x193FF3C18](CFSTR("FMFMapViewController"), CFSTR("FMF")))
    {
      objc_msgSend(v8, "visibleViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v8, "visibleViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            v14 = 138412290;
            v15 = v8;
            _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "navController: %@, clearing viewControllers", (uint8_t *)&v14, 0xCu);
          }

        }
        objc_msgSend(v8, "setViewControllers:", MEMORY[0x1E0C9AA60]);
        -[CKDetailsController navigationController](self, "navigationController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "showViewController:sender:", v11, 0);

      }
    }

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[CKDetailsController traitCollection](self, "traitCollection");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v12, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v5)
  {
    -[CKDetailsController simSwitchCell](self, "simSwitchCell");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      return;
    -[CKDetailsController simSwitchCell](self, "simSwitchCell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "button");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contextMenuInteraction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissMenu");

    -[CKDetailsController simSwitchCell](self, "simSwitchCell");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "button");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController simSwitcherMenu](self, "simSwitcherMenu");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMenu:", v11);

  }
}

- (id)simSwitcherMenu
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
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  CKDetailsController *val;
  _QWORD v35[4];
  id v36;
  void *v37;
  id v38;
  id location;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (-[CKDetailsController shouldShowSIMTypeSection](self, "shouldShowSIMTypeSection"))
  {
    val = self;
    -[CKDetailsController conversation](self, "conversation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "chat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastAddressedSIMID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKDetailsController conversation](val, "conversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastAddressedHandleID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ctSubscriptionInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "__im_subscriptionContextForForSimID:phoneNumber:", v32, v31);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ctSubscriptionInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subscriptions");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v30;
    if (objc_msgSend(v30, "count"))
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      obj = v30;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v41 != v15)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            CKFrameworkBundle();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "label");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "localizedStringForKey:value:table:", v19, &stru_1E276D870, CFSTR("ChatKit"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            location = 0;
            objc_initWeak(&location, val);
            v21 = (void *)MEMORY[0x1E0CEA2A8];
            v35[0] = MEMORY[0x1E0C809B0];
            v35[1] = 3221225472;
            v35[2] = __38__CKDetailsController_simSwitcherMenu__block_invoke;
            v35[3] = &unk_1E274B1F0;
            v22 = v9;
            v36 = v22;
            v37 = v17;
            objc_copyWeak(&v38, &location);
            objc_msgSend(v21, "actionWithTitle:image:identifier:handler:", v20, 0, 0, v35);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setState:", objc_msgSend(v22, "isEqual:", v17));
            CKLocalizedShortNameForContext(v17);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CEA638], "__ck_actionImageForSubscriptionShortName:isFilled:", v24, 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setImage:", v25);

            objc_msgSend(v13, "addObject:", v23);
            objc_destroyWeak(&v38);

            objc_destroyWeak(&location);
          }
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        }
        while (v14);
      }

      v26 = (void *)MEMORY[0x1E0CEA740];
      v27 = (void *)objc_msgSend(v13, "copy");
      objc_msgSend(v26, "menuWithChildren:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v30;
    }
    else
    {
      v28 = 0;
    }

  }
  else
  {
    v28 = 0;
  }
  return v28;
}

void __38__CKDetailsController_simSwitcherMenu__block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  uint64_t v4;
  id *v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D38558];
  v14 = v3;
  if ((v2 & 1) != 0)
  {
    objc_msgSend(v3, "trackEvent:withDictionary:", v4, &unk_1E2871CB8);
  }
  else
  {
    objc_msgSend(v3, "trackEvent:withDictionary:", v4, &unk_1E2871C90);

    v5 = (id *)(a1 + 48);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "switchSubscriptionToContext:", *(_QWORD *)(a1 + 40));

    v7 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v7, "simSwitchCell");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained(v5);
    objc_msgSend(v9, "labelForChat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSIMLabelText:", v10);

    v14 = objc_loadWeakRetained(v5);
    objc_msgSend(v14, "simSwitchCell");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_loadWeakRetained(v5);
    objc_msgSend(v12, "simSwitcherMenu");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMenu:", v13);

  }
}

- (void)handleActiveDeviceChanged:(id)a3
{
  void *v4;
  id v5;

  -[CKDetailsController locationSharingTextView](self, "locationSharingTextView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  -[CKDetailsController setLocationSharingTextView:](self, "setLocationSharingTextView:", 0);
  -[CKDetailsController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (void)updateLocationStringCellWithString:(id)a3
{
  CKDetailsLocationStringCell *locationStringCell;

  locationStringCell = self->_locationStringCell;
  if (locationStringCell)
    -[CKDetailsLocationStringCell setLocationString:](locationStringCell, "setLocationString:", a3);
}

- (BOOL)shouldShowExpanseFeatures
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1E0D35818];
  -[CKDetailsController tuConversation](self, "tuConversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "activeTUConversationHasActivitySession:", v3);

  return (char)v2;
}

- (int64_t)adjustedViewModelIndexForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    v5 = 0;
  }
  else
  {
    -[CKDetailsController conversation](self, "conversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isBusinessChat");

    v5 = v8 - 1;
  }
  v9 = v5 - -[CKDetailsController hasTUConversation](self, "hasTUConversation");
  v10 = objc_msgSend(v4, "row");

  return v9 + v10;
}

- (BOOL)shouldShowBusinessInfoFooter
{
  void *v3;
  void *v4;
  int v5;

  -[CKDetailsController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isBusinessConversation"))
  {
    -[CKDetailsController conversation](self, "conversation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isMakoConversation") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)shouldShowKTSection
{
  void *v2;
  void *v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  char v10;
  void *v11;
  void *v12;
  _BOOL4 v13;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isKeyTransparencyEnabled");

  if (v6)
  {
    -[CKDetailsController conversation](self, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendingService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (_QWORD *)MEMORY[0x1E0D38E20];
    v10 = objc_msgSend(v8, "supportsCapability:", *MEMORY[0x1E0D38E20]);
    if ((v10 & 1) != 0
      || (-[CKDetailsController conversation](self, "conversation"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v2, "chat"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "hasMessageWithServiceCapability:", *v9)))
    {
      -[CKDetailsController conversation](self, "conversation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "chat");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isBusinessChat") & 1) != 0)
        LOBYTE(v13) = 0;
      else
        v13 = !-[CKDetailsController conversationHasLeft](self, "conversationHasLeft");

      if ((v10 & 1) != 0)
        goto LABEL_12;
    }
    else
    {
      LOBYTE(v13) = 0;
    }

LABEL_12:
    return v13;
  }
  LOBYTE(v13) = 0;
  return v13;
}

- (void)expandContactsSection
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[CKDetailsController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfRowsInSection:", 6);

  if (v4
    && -[CKDetailsController isContactsSectionCollapsible](self, "isContactsSectionCollapsible")
    && -[CKDetailsController isContactsSectionCollapsed](self, "isContactsSectionCollapsed"))
  {
    -[CKDetailsController setIsContactsSectionCollapsed:](self, "setIsContactsSectionCollapsed:", 0);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[CKDetailsController contactsManager](self, "contactsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactsViewModels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    v9 = v8 + -[CKDetailsController shouldShowAddMemberCell](self, "shouldShowAddMemberCell");
    v10 = v9 + -[CKDetailsController hasTUConversation](self, "hasTUConversation");
    v11 = -[CKDetailsController hasTUConversation](self, "hasTUConversation");
    if (v10 > v11)
    {
      v12 = v11;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v12, 6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);

        ++v12;
      }
      while (v12 < v10);
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CKDetailsController hasTUConversation](self, "hasTUConversation"))
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 1, 6);
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }
    -[CKDetailsController tableView](self, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "beginUpdates");

    -[CKDetailsController tableView](self, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "insertRowsAtIndexPaths:withRowAnimation:", v5, 0);

    -[CKDetailsController tableView](self, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "reloadRowsAtIndexPaths:withRowAnimation:", v19, 0);

    -[CKDetailsController tableView](self, "tableView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "endUpdates");

  }
}

- (void)collapseContactsSection
{
  _BOOL4 v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = -[CKDetailsController shouldShowAddMemberCell](self, "shouldShowAddMemberCell");
  -[CKDetailsController setIsContactsSectionCollapsed:](self, "setIsContactsSectionCollapsed:", 1);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CKDetailsController contactsManager](self, "contactsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactsViewModels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = v7 + v3 + -[CKDetailsController hasTUConversation](self, "hasTUConversation");
  v9 = -[CKDetailsController hasTUConversation](self, "hasTUConversation");
  if (v8 > v9)
  {
    v10 = v9;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v10, 6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v11);

      ++v10;
    }
    while (v10 < v8);
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v8, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "beginUpdates");

  -[CKDetailsController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "deleteRowsAtIndexPaths:withRowAnimation:", v4, 0);

  -[CKDetailsController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reloadRowsAtIndexPaths:withRowAnimation:", v16, 0);

  -[CKDetailsController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "endUpdates");

}

- (void)presentGroupRecipientSelectionControllerAtIndexPath:(id)a3
{
  void *v4;
  CKGroupRecipientSelectionController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CKNavigationController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  v35 = a3;
  -[CKDetailsController conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CKGroupRecipientSelectionController initWithConversation:]([CKGroupRecipientSelectionController alloc], "initWithConversation:", v4);
  -[CKDetailsController setAddRecipientsController:](self, "setAddRecipientsController:", v5);
  if (CKIsRunningInMacCatalyst())
  {
    -[CKDetailsController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cellForRowAtIndexPath:", v35);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKGroupRecipientSelectionController setModalPresentationStyle:](v5, "setModalPresentationStyle:", objc_msgSend(v8, "groupRecipientSelectionPresentationStyle"));

    -[CKGroupRecipientSelectionController popoverPresentationController](v5, "popoverPresentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSourceView:", v7);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "popOverWidthInDetailsView");
    v12 = v11;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "popOverMaxHeightInDetailsView");
    -[CKGroupRecipientSelectionController setPreferredContentSize:](v5, "setPreferredContentSize:", v12, v14);

    -[CKDetailsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  }
  else
  {
    v15 = -[CKNavigationController initWithRootViewController:]([CKNavigationController alloc], "initWithRootViewController:", v5);
    -[CKDetailsController setGroupNavigationController:](self, "setGroupNavigationController:", v15);

    -[CKDetailsController groupNavigationController](self, "groupNavigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "navigationBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "theme");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBarStyle:", objc_msgSend(v19, "navBarStyle"));

    if ((objc_msgSend(v4, "hasDisplayName") & 1) != 0)
    {
      objc_msgSend(v4, "displayName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CKFrameworkBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("MADRID_GROUP"), &stru_1E276D870, CFSTR("ChatKit"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[CKGroupRecipientSelectionController setTitle:](v5, "setTitle:", v7);
    -[CKDetailsController groupNavigationController](self, "groupNavigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setModalPresentationStyle:", objc_msgSend(v22, "groupRecipientSelectionPresentationStyle"));

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "userInterfaceIdiom");

    if ((v24 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      -[CKDetailsController view](self, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "frame");
      v27 = v26;
      -[CKDetailsController view](self, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "frame");
      -[CKDetailsController setPreferredContentSize:](self, "setPreferredContentSize:", v27, v29);

    }
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_handleCancelAction_);
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_handleDoneAction_);
    -[CKGroupRecipientSelectionController navigationItem](v5, "navigationItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setLeftBarButtonItem:", v30);

    -[CKGroupRecipientSelectionController navigationItem](v5, "navigationItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setRightBarButtonItem:", v31);

    -[CKGroupRecipientSelectionController setDoneButton:](v5, "setDoneButton:", v31);
    -[CKDetailsController groupNavigationController](self, "groupNavigationController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v34, 1, 0);

  }
}

- (void)handleDoneAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v4 = a3;
  -[CKDetailsController addRecipientsController](self, "addRecipientsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recipients");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
  v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[CKDetailsController conversation](self, "conversation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recipientStrings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithArray:", v10);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __40__CKDetailsController_handleDoneAction___block_invoke;
  v15[3] = &unk_1E274F468;
  v15[4] = self;
  v16 = v7;
  v17 = v11;
  v12 = v11;
  v13 = v7;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v15);
  -[CKDetailsController _handleAddingHandles:allRecipientsAddresses:sender:](self, "_handleAddingHandles:allRecipientsAddresses:sender:", v13, v12, v4);

}

void __40__CKDetailsController_handleDoneAction___block_invoke(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "rawAddress");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imHandleWithID:alreadyCanonical:", v7, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "addObject:", v6);
  objc_msgSend(a1[6], "addObject:", v7);

}

- (void)handleCancelAction:(id)a3
{
  id v4;

  -[CKDetailsController addRecipientsController](self, "addRecipientsController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopCheckingRecipientAvailabilityAndRemoveAllTimers");
  objc_msgSend(v4, "invalidateOutstandingIDStatusRequests");
  -[CKDetailsController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[CKDetailsController setAddRecipientsController:](self, "setAddRecipientsController:", 0);

}

- (void)doNotDisturbValueChange:(id)a3
{
  -[CKDetailsController toggleHideAlertsWithReload:](self, "toggleHideAlertsWithReload:", 0);
}

- (void)readReceiptsSwitchValueChanged:(id)a3
{
  -[CKDetailsController toggleSendReadReceiptsWithReload:](self, "toggleSendReadReceiptsWithReload:", 0);
}

- (void)shareFocusStatusSwitchValueChanged:(id)a3
{
  -[CKDetailsController toggleShareFocusStatusWithReload:](self, "toggleShareFocusStatusWithReload:", 0);
}

- (void)autoDonationSwitchValueChanged:(id)a3
{
  -[CKDetailsController toggleShowInSharedWithYouWithReload:](self, "toggleShowInSharedWithYouWithReload:", 0);
}

- (void)toggleHideAlertsWithReload:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;

  v3 = a3;
  -[CKDetailsController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMuted") ^ 1;

  -[CKDetailsController setHideAlerts:reload:](self, "setHideAlerts:reload:", v6, v3);
}

- (void)setHideAlerts:(BOOL)a3 reload:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  const __CFString *v17;
  uint64_t v18;

  v4 = a4;
  v5 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (v5)
        v8 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Set hideAlerts to %@", buf, 0xCu);
    }

  }
  -[CKDetailsController conversation](self, "conversation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMutedUntilDate:", v11);

  }
  else
  {
    objc_msgSend(v9, "unmute");
  }

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reloadRowsAtIndexPaths:withRowAnimation:", v14, 0);

  }
}

- (void)toggleSendReadReceiptsWithReload:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;

  v3 = a3;
  -[CKDetailsController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldSendReadReceipts") ^ 1;

  -[CKDetailsController setSendReadReceipts:reload:](self, "setSendReadReceipts:reload:", v6, v3);
}

- (void)setSendReadReceipts:(BOOL)a3 reload:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  const __CFString *v18;
  uint64_t v19;

  v4 = a4;
  v5 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  -[CKDetailsController conversation](self, "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSMS");

  if ((v9 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = CFSTR("NO");
        if (v5)
          v11 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v18 = v11;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Set sendReadReceipts to %@", buf, 0xCu);
      }

    }
    -[CKDetailsController conversation](self, "conversation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSendReadReceipts:", v5);

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 1, 9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsController tableView](self, "tableView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reloadRowsAtIndexPaths:withRowAnimation:", v15, 0);

    }
  }
}

- (void)toggleShareFocusStatusWithReload:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;

  v3 = a3;
  -[CKDetailsController isSharingFocusStatus](self, "isSharingFocusStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue") ^ 1;

  -[CKDetailsController setShareFocusStatus:reload:](self, "setShareFocusStatus:reload:", v6, v3);
}

- (void)setShareFocusStatus:(BOOL)a3 reload:(BOOL)a4
{
  _BOOL4 v5;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD aBlock[5];
  id v31;
  BOOL v32;
  id location;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v5 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  -[CKDetailsController canShareFocusStatus](self, "canShareFocusStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    location = 0;
    objc_initWeak(&location, self);
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__CKDetailsController_setShareFocusStatus_reload___block_invoke;
    aBlock[3] = &unk_1E274F490;
    v32 = a4;
    aBlock[4] = self;
    objc_copyWeak(&v31, &location);
    v10 = _Block_copy(aBlock);
    -[CKDetailsController conversation](self, "conversation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "chat");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "recipient");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "normalizedID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v12, "lastAddressedHandleID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v35 = v14;
          v36 = 2112;
          v37 = v15;
          _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "User requested begin sharing focus status with handleID: %@ fromHandleID: %@", buf, 0x16u);
        }

      }
      objc_msgSend(MEMORY[0x1E0D396E8], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v9;
      v25[1] = 3221225472;
      v25[2] = __50__CKDetailsController_setShareFocusStatus_reload___block_invoke_359;
      v25[3] = &unk_1E274F4B8;
      v26 = v14;
      v18 = v15;
      v27 = v18;
      objc_copyWeak(&v29, &location);
      v28 = v10;
      objc_msgSend(v17, "manuallyShareFocusStatusWithHandleID:fromHandleID:completion:", v26, v18, v25);

      objc_destroyWeak(&v29);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v14;
          _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "User requested end sharing focus status with handleID: %@", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0D396E8], "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v9;
      v21[1] = 3221225472;
      v21[2] = __50__CKDetailsController_setShareFocusStatus_reload___block_invoke_361;
      v21[3] = &unk_1E274F4E0;
      v22 = v14;
      objc_copyWeak(&v24, &location);
      v23 = v10;
      objc_msgSend(v20, "manuallyRemoveSharingOfFocusStatusWithHandleID:completion:", v22, v21);

      objc_destroyWeak(&v24);
      v18 = v22;
    }

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
}

void __50__CKDetailsController_setShareFocusStatus_reload___block_invoke(uint64_t a1)
{
  _QWORD v1[5];
  id v2;

  if (*(_BYTE *)(a1 + 48))
  {
    v1[0] = MEMORY[0x1E0C809B0];
    v1[1] = 3221225472;
    v1[2] = __50__CKDetailsController_setShareFocusStatus_reload___block_invoke_2;
    v1[3] = &unk_1E274D388;
    v1[4] = *(_QWORD *)(a1 + 32);
    objc_copyWeak(&v2, (id *)(a1 + 40));
    dispatch_async(MEMORY[0x1E0C80D38], v1);
    objc_destroyWeak(&v2);
  }
}

void __50__CKDetailsController_setShareFocusStatus_reload___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(*(id *)(a1 + 32), "_targetToggleIndexForOptionRow:", 2), 9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadRowsAtIndexPaths:withRowAnimation:", v5, 0);

}

void __50__CKDetailsController_setShareFocusStatus_reload___block_invoke_359(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *WeakRetained;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6 || (a3 & 1) == 0)
  {
    IMLogHandleForCategory();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      __50__CKDetailsController_setShareFocusStatus_reload___block_invoke_359_cold_1();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(_QWORD *)(a1 + 40);
        v11 = 138412546;
        v12 = v8;
        v13 = 2112;
        v14 = v9;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Successfully shared focus status with handleID: %@ fromHandleID: %@", (uint8_t *)&v11, 0x16u);
      }

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    -[NSObject setIsSharingFocusStatus:](WeakRetained, "setIsSharingFocusStatus:", MEMORY[0x1E0C9AAB0]);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __50__CKDetailsController_setShareFocusStatus_reload___block_invoke_361(uint64_t a1, void *a2)
{
  id v3;
  NSObject *WeakRetained;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    IMLogHandleForCategory();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      __50__CKDetailsController_setShareFocusStatus_reload___block_invoke_361_cold_1();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = 138412290;
        v8 = v6;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Successfully manually unshared focus status with handleID: %@", (uint8_t *)&v7, 0xCu);
      }

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[NSObject setIsSharingFocusStatus:](WeakRetained, "setIsSharingFocusStatus:", MEMORY[0x1E0C9AAA0]);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)toggleShowInSharedWithYouWithReload:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  -[CKDetailsController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAutoDonatingMessages") ^ 1;

  -[CKDetailsController setShowInSharedWithYou:reload:](self, "setShowInSharedWithYou:reload:", v7, v3);
}

- (void)setShowInSharedWithYou:(BOOL)a3 reload:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v4 = a4;
  v5 = a3;
  v12[1] = *MEMORY[0x1E0C80C00];
  if (-[CKDetailsController shouldShowSharedWithYouFeatures](self, "shouldShowSharedWithYouFeatures"))
  {
    -[CKDetailsController conversation](self, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendAutoDonationUpdate:", v5);

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsController tableView](self, "tableView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "reloadRowsAtIndexPaths:withRowAnimation:", v11, 0);

    }
  }
}

- (void)adjustContentOffsetReloadingSharedAssetsContentViewCell
{
  id v2;

  -[CKDetailsController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)contactsManagerViewModelsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "contactsViewModels");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "contacts view models changed, new model count:%@", (uint8_t *)&v14, 0xCu);

    }
  }
  if (-[CKDetailsController shouldCollapseContactsSection](self, "shouldCollapseContactsSection"))
  {
    -[CKDetailsController setIsContactsSectionCollapsed:](self, "setIsContactsSectionCollapsed:", -[CKDetailsController isContactsSectionCollapsible](self, "isContactsSectionCollapsible"));
    -[CKDetailsController setShouldCollapseContactsSection:](self, "setShouldCollapseContactsSection:", 0);
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "DISMISSED SIM switch menu", (uint8_t *)&v14, 2u);
    }

  }
  -[CKDetailsController simSwitchCell](self, "simSwitchCell");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contextMenuInteraction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dismissMenu");

  -[CKDetailsController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reloadData");

}

- (void)_hideAllContactCellButtons
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[CKDetailsController tableView](self, "tableView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        -[CKDetailsController tableView](self, "tableView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "indexPathForCell:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "section") == 6)
        {
          if (CKIsRunningInMacCatalyst())
          {
            -[CKDetailsController conversation](self, "conversation");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "isGroupConversation");

            if (v13)
            {
              v14 = objc_msgSend(v11, "row");
              if (v14 != -[CKDetailsController rowForShowMoreContactsCell](self, "rowForShowMoreContactsCell"))
              {
                v15 = objc_msgSend(v11, "row");
                if (v15 != -[CKDetailsController rowForAddMemberCell](self, "rowForAddMemberCell"))
                {
                  v16 = objc_msgSend(v11, "row");
                  if (v16 != -[CKDetailsController rowForTUConversationCell](self, "rowForTUConversationCell"))
                    objc_msgSend(v9, "_hideAllButtons");
                }
              }
            }
          }
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

}

- (void)_presentRemoveRecipientSheetForHandle:(id)a3 fromView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[5];
  id v37;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v35 = a4;
  CKFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("REMOVE_DESCRIPTION"), &stru_1E276D870, CFSTR("ChatKit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fullName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceLayoutDirection");

  if (v13 == 1)
    v14 = CFSTR("\u200F");
  else
    v14 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v15, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("REMOVE"), &stru_1E276D870, CFSTR("ChatKit"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __70__CKDetailsController__presentRemoveRecipientSheetForHandle_fromView___block_invoke;
  v36[3] = &unk_1E274B818;
  v36[4] = self;
  v37 = v6;
  v19 = v6;
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v18, 2, v36);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v20);

  CKFrameworkBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v22, 1, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v23);

  objc_msgSend(v16, "popoverPresentationController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "frame");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  objc_msgSend(v24, "setSourceRect:", v26, v28, v30, v32);
  objc_msgSend(v16, "popoverPresentationController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setSourceView:", v34);

  objc_msgSend(v16, "presentFromViewController:animated:completion:", self, 1, 0);
}

void __70__CKDetailsController__presentRemoveRecipientSheetForHandle_fromView___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeRecipientHandles:", v3);

}

- (void)presentLeaveActionSheetFromView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  CKDetailsController *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  CKDetailsController *v21;
  CKDetailsController *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];

  v4 = a3;
  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("LEAVE_CONVERSATION"), &stru_1E276D870, CFSTR("ChatKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (CKIsRunningInMacCatalyst())
  {
    CKFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("LEAVE_CONVERSATION_CONFIRMATION"), &stru_1E276D870, CFSTR("ChatKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("LEAVE_CONVERSATION_SHORT"), &stru_1E276D870, CFSTR("ChatKit"));
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }
  else
  {
    v8 = 0;
  }
  +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v8, CKIsRunningInMacCatalyst() != 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __55__CKDetailsController_presentLeaveActionSheetFromView___block_invoke;
  v26[3] = &unk_1E274B0D8;
  v26[4] = self;
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v6, 2, v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v12);

  CKFrameworkBundle();
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v13, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v14, 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v15);

  v16 = self;
  -[CKDetailsController detailsControllerDelegate](v16, "detailsControllerDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_opt_respondsToSelector();

  if ((v13 & 1) == 0)
    goto LABEL_9;
  -[CKDetailsController detailsControllerDelegate](v16, "detailsControllerDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "presentingViewControllerForGroupAlertsFromDetailsController:", v16);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  v21 = v19 ? (CKDetailsController *)v19 : v16;
  v22 = v21;

  if (v22 == v16)
  {
LABEL_9:
    objc_msgSend(v11, "popoverPresentationController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    objc_msgSend(v23, "setSourceRect:");

    objc_msgSend(v11, "popoverPresentationController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController view](v16, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setSourceView:", v25);

    v22 = v16;
  }
  objc_msgSend(v11, "presentFromViewController:animated:completion:", v22, 1, 0);

}

void __55__CKDetailsController_presentLeaveActionSheetFromView___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leave");

  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasRecipientsFollowingLocation");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CEA2E8];
    CKFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("STOP_SHARING_ON_DELETE_OR_LEAVE_BODY"), &stru_1E276D870, CFSTR("ChatKit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", 0, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("YES"), &stru_1E276D870, CFSTR("ChatKit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __55__CKDetailsController_presentLeaveActionSheetFromView___block_invoke_2;
    v18[3] = &unk_1E274B0D8;
    v18[4] = *(_QWORD *)(a1 + 32);
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v12, 0, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v13);

    CKFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("NO"), &stru_1E276D870, CFSTR("ChatKit"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v15, 1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v16);

    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v10, 1, 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "reloadData");

}

void __55__CKDetailsController_presentLeaveActionSheetFromView___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chat");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopSharingLocation");

}

- (void)presentDeleteAndBlockActionSheetFromView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  CKDetailsController *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  CKDetailsController *v26;
  CKDetailsController *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];

  v4 = a3;
  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DELETE_AND_BLOCK_CONVERSATION"), &stru_1E276D870, CFSTR("ChatKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (CKIsRunningInMacCatalyst())
  {
    CKFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DELETE_AND_BLOCK_CONVERSATION_TITLE_CATALYST"), &stru_1E276D870, CFSTR("ChatKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DELETE_AND_BLOCK_CONVERSATION_DESCRIPTION_CATALYST"), &stru_1E276D870, CFSTR("ChatKit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DELETE_AND_BLOCK_CONVERSATION_SHORT"), &stru_1E276D870, CFSTR("ChatKit"));
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v12;
  }
  else
  {
    v13 = objc_msgSend(MEMORY[0x1E0D39AF8], "isFilterUnknownSendersEnabled");
    CKFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;
    if (v13)
      v15 = CFSTR("DELETE_AND_BLOCK_CONVERSATION_DESCRIPTION_FILTERS");
    else
      v15 = CFSTR("DELETE_AND_BLOCK_CONVERSATION_DESCRIPTION_EDIT");
    objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_1E276D870, CFSTR("ChatKit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }

  +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, v10, CKIsRunningInMacCatalyst() != 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __64__CKDetailsController_presentDeleteAndBlockActionSheetFromView___block_invoke;
  v31[3] = &unk_1E274B0D8;
  v31[4] = self;
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v6, 2, v31);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v17);

  CKFrameworkBundle();
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v18, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v19, 1, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v20);

  v21 = self;
  -[CKDetailsController detailsControllerDelegate](v21, "detailsControllerDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v18) = objc_opt_respondsToSelector();

  if ((v18 & 1) == 0)
    goto LABEL_12;
  -[CKDetailsController detailsControllerDelegate](v21, "detailsControllerDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "presentingViewControllerForGroupAlertsFromDetailsController:", v21);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  v26 = v24 ? (CKDetailsController *)v24 : v21;
  v27 = v26;

  if (v27 == v21)
  {
LABEL_12:
    objc_msgSend(v16, "popoverPresentationController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    objc_msgSend(v28, "setSourceRect:");

    objc_msgSend(v16, "popoverPresentationController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController view](v21, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSourceView:", v30);

    v27 = v21;
  }
  objc_msgSend(v16, "presentFromViewController:animated:completion:", v27, 1, 0);

}

void __64__CKDetailsController_presentDeleteAndBlockActionSheetFromView___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasRecipientsFollowingLocation");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CEA2E8];
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("STOP_SHARING_ON_DELETE_OR_LEAVE_BODY"), &stru_1E276D870, CFSTR("ChatKit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", 0, v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("YES"), &stru_1E276D870, CFSTR("ChatKit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __64__CKDetailsController_presentDeleteAndBlockActionSheetFromView___block_invoke_2;
    v22[3] = &unk_1E274B0D8;
    v22[4] = *(_QWORD *)(a1 + 32);
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v10, 0, v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v11);

    CKFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("NO"), &stru_1E276D870, CFSTR("ChatKit"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v13, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v14);

    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v8, 1, 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "chat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDeletingIncomingMessages:", 1);

  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "recoverableDeleteForConversations:deleteDate:synchronousQuery:completionHandler:", v19, v20, 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "detailsControllerDelegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dismissDetailsViewAndShowConversationList");

}

void __64__CKDetailsController_presentDeleteAndBlockActionSheetFromView___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chat");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopSharingLocation");

}

- (void)detailsAddGroupNameView:(id)a3 didCommitGroupName:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CKDetailsController conversation](self, "conversation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisplayName:", v5);

}

- (id)avatarView:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v26;
  uint64_t v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v7 = a4;
  if (objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0C97420]))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v26 = v7;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v31;
      v12 = *MEMORY[0x1E0C966A8];
      v27 = *MEMORY[0x1E0C967C0];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v14, "key", v26);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v12);

          if (v16)
          {
            objc_msgSend(v14, "value");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v14, "key");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToString:", v27);

            if (v19)
            {
              objc_msgSend(v14, "value");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "stringValue");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v17 = 0;
            }
          }
          IMStripFormattingFromAddress();
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "preferredHandle");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          IMStripFormattingFromAddress();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = MEMORY[0x193FF417C](v21, v23);

          if (v24)
            objc_msgSend(v8, "insertObject:atIndex:", v14, 0);
          else
            objc_msgSend(v8, "addObject:", v14);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v10);
    }

    v7 = v26;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CNContactStore)suggestionsEnabledContactStore
{
  CNContactStore *suggestionsEnabledContactStore;
  void *v4;
  uint64_t v5;
  CNContactStore *v6;
  CNContactStore *v7;

  suggestionsEnabledContactStore = self->_suggestionsEnabledContactStore;
  if (!suggestionsEnabledContactStore)
  {
    v4 = (void *)MEMORY[0x1E0C97298];
    if (objc_msgSend(MEMORY[0x1E0C97200], "suggestionsEnabled"))
      v5 = 3;
    else
      v5 = 1;
    objc_msgSend(v4, "storeWithOptions:", v5);
    v6 = (CNContactStore *)objc_claimAutoreleasedReturnValue();
    v7 = self->_suggestionsEnabledContactStore;
    self->_suggestionsEnabledContactStore = v6;

    suggestionsEnabledContactStore = self->_suggestionsEnabledContactStore;
  }
  return suggestionsEnabledContactStore;
}

- (CGSize)screenSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  void *v5;

  -[CKDetailsController groupNameCell](self, "groupNameCell", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupNameView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commitGroupName");

  if (CKIsRunningInMacCatalyst())
    -[CKDetailsController _hideAllContactCellButtons](self, "_hideAllContactCellButtons");
}

- (void)presentFullFMFMapViewController
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("FMFMapViewController"), CFSTR("FMF"));
  if (v3)
  {
    v4 = [v3 alloc];
    -[CKDetailsController conversation](self, "conversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allSiblingFMFHandles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v4, "initWithDelegate:handles:", self, v7);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "theme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appTintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAnnotationTintColor:", v10);

    -[CKDetailsController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pushViewController:animated:", v12, 1);

  }
}

- (id)fmfHandlesFromIMHandles:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v35;
    v26 = *(_QWORD *)v35;
    v27 = v4;
    do
    {
      v8 = 0;
      v28 = v6;
      do
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance", v26);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "findMyLocationForHandleOrSibling:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fmfLocation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v12, "location");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v12, "handle");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
            objc_msgSend(v4, "addObject:", v14);
            goto LABEL_22;
          }
        }
        objc_msgSend(v9, "findMyHandle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "findMyHandleIsSharingLocationWithMe:", v14);

        if (v16)
          goto LABEL_10;
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v9, "findMySiblingHandles");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v31;
          while (2)
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v31 != v20)
                objc_enumerationMutation(v17);
              v22 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v21);
              objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "findMyHandleIsSharingLocationWithMe:", v22);

              if (v24)
              {
                v4 = v27;
                objc_msgSend(v27, "addObject:", v22);

                goto LABEL_21;
              }
              ++v21;
            }
            while (v19 != v21);
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            if (v19)
              continue;
            break;
          }
        }

        v4 = v27;
LABEL_21:
        v7 = v26;
        v6 = v28;
LABEL_22:

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)annotationImageForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  CKEntity *v22;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKDetailsController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "participants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = v7;
  v25 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v25)
  {
    v9 = *(_QWORD *)v32;
    v26 = v8;
    v24 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v8);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v11, "siblings");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v28;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v28 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
              objc_msgSend(v17, "ID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v18, "isEqualToIgnoringCase:", v19);

              if ((v20 & 1) != 0)
              {
                v22 = -[CKEntity initWithIMHandle:]([CKEntity alloc], "initWithIMHandle:", v17);
                -[CKEntity locationMapViewContactImage](v22, "locationMapViewContactImage");
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                v8 = v26;
                goto LABEL_19;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (v14)
              continue;
            break;
          }
        }

        v8 = v26;
        v9 = v24;
      }
      v21 = 0;
      v25 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v25);
  }
  else
  {
    v21 = 0;
  }
LABEL_19:

  return v21;
}

- (id)annotationContactForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _QWORD v38[3];

  v38[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKDetailsController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "participants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C97518], "descriptorForRequiredKeysIncludingImage:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = v7;
  v26 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v26)
  {
    v11 = *(_QWORD *)v33;
    v24 = *(_QWORD *)v33;
    v25 = v9;
    v27 = v10;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(v10);
        v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v13, "findMySiblingHandles", v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v29;
          while (2)
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v29 != v17)
                objc_enumerationMutation(v14);
              objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "identifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v19, "isEqualToIgnoringCase:", v20);

              if ((v21 & 1) != 0)
              {
                v9 = v25;
                objc_msgSend(v13, "cnContactWithKeys:", v25);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                v10 = v27;
                goto LABEL_19;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v16)
              continue;
            break;
          }
        }

        v10 = v27;
        v11 = v24;
      }
      v22 = 0;
      v9 = v25;
      v26 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v26);
  }
  else
  {
    v22 = 0;
  }
LABEL_19:

  return v22;
}

- (void)fmfMapViewController:(id)a3 didSelectHandle:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Map participant selected: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  -[CKDetailsController contactsManager](self, "contactsManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contacts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &__block_literal_global_398_1);

}

- (void)fmfMapViewController:(id)a3 didDeselectHandle:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Map participant de-selected: %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (UITextView)locationSharingTextView
{
  UITextView *locationSharingTextView;
  id v4;
  UITextView *v5;
  UITextView *v6;
  void *v7;
  UITextView *v8;
  void *v9;
  UITextView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v43;
  uint64_t v44;
  void *v45;

  locationSharingTextView = self->_locationSharingTextView;
  if (!locationSharingTextView)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEAB18]);
    v5 = (UITextView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_locationSharingTextView;
    self->_locationSharingTextView = v5;

    -[UITextView setEditable:](self->_locationSharingTextView, "setEditable:", 0);
    -[UITextView _setInteractiveTextSelectionDisabled:](self->_locationSharingTextView, "_setInteractiveTextSelectionDisabled:", 1);
    -[UITextView textContainer](self->_locationSharingTextView, "textContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLineFragmentPadding:", 0.0);

    -[UITextView setTextContainerInset:](self->_locationSharingTextView, "setTextContainerInset:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
    -[UITextView setBackgroundColor:](self->_locationSharingTextView, "setBackgroundColor:", 0);
    v8 = self->_locationSharingTextView;
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v8, "setTextColor:", v9);

    -[UITextView setScrollEnabled:](self->_locationSharingTextView, "setScrollEnabled:", 0);
    v10 = self->_locationSharingTextView;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "headerFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v10, "setFont:", v12);

    objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activeDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("LOCATION_CURRENTLY_SHARING_FROM"), &stru_1E276D870, CFSTR("ChatKit"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v14;
    objc_msgSend(v14, "deviceName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "userInterfaceLayoutDirection");

    if (v21 == 1)
      v22 = CFSTR("\u200F");
    else
      v22 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("LOCATION_SHARE_FROM_THIS_DEVICE"), &stru_1E276D870, CFSTR("ChatKit"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[CKDetailsController fmfRestricted](self, "fmfRestricted")
      || CKIsRunningInMacCatalyst()
      || (objc_msgSend(v45, "isThisDevice") & 1) != 0)
    {
      v26 = v23;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v23, v25);
      v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    v27 = v26;
    v28 = objc_msgSend(v26, "rangeOfString:", v25);
    v43 = v29;
    v44 = v28;
    v30 = objc_msgSend(v27, "length");
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v27);
    v32 = *MEMORY[0x1E0DC1138];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "headerFont");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addAttribute:value:range:", v32, v34, 0, v30);

    v35 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addAttribute:value:range:", v35, v36, 0, v30);

    if (!-[CKDetailsController fmfRestricted](self, "fmfRestricted") && !CKIsRunningInMacCatalyst())
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "theme");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "appTintColor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addAttribute:value:range:", v35, v39, v44, v43);

      v40 = *MEMORY[0x1E0DC1160];
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E276D870);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addAttribute:value:range:", v40, v41, v44, v43);

      objc_msgSend(v31, "addAttribute:value:range:", *MEMORY[0x1E0DC1248], MEMORY[0x1E0C9AAA0], v44, v43);
    }
    -[UITextView setAttributedText:](self->_locationSharingTextView, "setAttributedText:", v31);
    -[UITextView setDelegate:](self->_locationSharingTextView, "setDelegate:", self);

    locationSharingTextView = self->_locationSharingTextView;
  }
  return locationSharingTextView;
}

- (UITextView)expanseActivityTextView
{
  UITextView *expanseActivityTextView;
  id v4;
  UITextView *v5;
  UITextView *v6;
  void *v7;
  UITextView *v8;
  void *v9;
  UITextView *v10;
  void *v11;
  void *v12;
  UITextView *v13;
  void *v14;
  void *v15;

  expanseActivityTextView = self->_expanseActivityTextView;
  if (!expanseActivityTextView)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEAB18]);
    v5 = (UITextView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_expanseActivityTextView;
    self->_expanseActivityTextView = v5;

    -[UITextView setEditable:](self->_expanseActivityTextView, "setEditable:", 0);
    -[UITextView textContainer](self->_expanseActivityTextView, "textContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLineFragmentPadding:", 0.0);

    -[UITextView setTextContainerInset:](self->_expanseActivityTextView, "setTextContainerInset:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
    -[UITextView setBackgroundColor:](self->_expanseActivityTextView, "setBackgroundColor:", 0);
    v8 = self->_expanseActivityTextView;
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v8, "setTextColor:", v9);

    -[UITextView setScrollEnabled:](self->_expanseActivityTextView, "setScrollEnabled:", 0);
    v10 = self->_expanseActivityTextView;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "headerFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v10, "setFont:", v12);

    v13 = self->_expanseActivityTextView;
    -[CKDetailsController tuConversation](self, "tuConversation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKTUConversationViewUtilities activityDescriptionStringForTUConversation:](CKTUConversationViewUtilities, "activityDescriptionStringForTUConversation:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setText:](v13, "setText:", v15);

    expanseActivityTextView = self->_expanseActivityTextView;
  }
  return expanseActivityTextView;
}

- (UITextView)sharedWithYouFooterTextView
{
  UITextView *sharedWithYouFooterTextView;
  id v4;
  UITextView *v5;
  UITextView *v6;
  void *v7;
  UITextView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;

  sharedWithYouFooterTextView = self->_sharedWithYouFooterTextView;
  if (!sharedWithYouFooterTextView)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEAB18]);
    v5 = (UITextView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_sharedWithYouFooterTextView;
    self->_sharedWithYouFooterTextView = v5;

    -[UITextView setEditable:](self->_sharedWithYouFooterTextView, "setEditable:", 0);
    -[UITextView _setInteractiveTextSelectionDisabled:](self->_sharedWithYouFooterTextView, "_setInteractiveTextSelectionDisabled:", 1);
    -[UITextView textContainer](self->_sharedWithYouFooterTextView, "textContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLineFragmentPadding:", 0.0);

    -[UITextView setTextContainerInset:](self->_sharedWithYouFooterTextView, "setTextContainerInset:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
    -[UITextView setBackgroundColor:](self->_sharedWithYouFooterTextView, "setBackgroundColor:", 0);
    v8 = self->_sharedWithYouFooterTextView;
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v8, "setTextColor:", v9);

    -[UITextView setScrollEnabled:](self->_sharedWithYouFooterTextView, "setScrollEnabled:", 0);
    CKFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("MARK_AS_AUTO_DONATING_DESCRIPTION"), &stru_1E276D870, CFSTR("ChatKit"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SHARED_WITH_YOU_LEARN_MORE"), &stru_1E276D870, CFSTR("ChatKit"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v30, v29);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v12, "rangeOfString:", v29);
    v14 = v13;
    v15 = objc_msgSend(v12, "length");
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v12);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "headerFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior font:adjustedForMaxSizeCategory:](CKUIBehavior, "font:adjustedForMaxSizeCategory:", v18, *MEMORY[0x1E0CEB3C8]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v28, 0, v15);
    v19 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAttribute:value:range:", v19, v20, 0, v15);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "theme");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "linkColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAttribute:value:range:", v19, v23, v27, v14);

    v24 = *MEMORY[0x1E0DC1160];
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E276D870);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAttribute:value:range:", v24, v25, v27, v14);

    objc_msgSend(v16, "addAttribute:value:range:", *MEMORY[0x1E0DC1248], MEMORY[0x1E0C9AAA0], v27, v14);
    -[UITextView setAttributedText:](self->_sharedWithYouFooterTextView, "setAttributedText:", v16);
    -[UITextView setDelegate:](self->_sharedWithYouFooterTextView, "setDelegate:", self);

    sharedWithYouFooterTextView = self->_sharedWithYouFooterTextView;
  }
  return sharedWithYouFooterTextView;
}

- (id)downloadAttachmentsText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CKDetailsController _purgedAttachmentCount](self, "_purgedAttachmentCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("THERE_ARE_IMAGE_ATTACHMENTS_IN_ICLOUD"), &stru_1E276D870, CFSTR("ChatKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceLayoutDirection");

  if (v8 == 1)
    v9 = CFSTR("\u200F");
  else
    v9 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)downloadButtonText
{
  unint64_t v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;

  v2 = -[CKDetailsController downloadButtonState](self, "downloadButtonState");
  v3 = CFSTR("DOWNLOAD");
  if (v2 == 2)
    v3 = CFSTR("DOWNLOADING");
  v4 = v3;
  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_1E276D870, CFSTR("ChatKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CKBusinessInfoView)businessInfoView
{
  CKBusinessInfoView *businessInfoView;
  CKBusinessInfoView *v4;
  CKBusinessInfoView *v5;
  void *v6;
  void *v7;

  businessInfoView = self->_businessInfoView;
  if (!businessInfoView)
  {
    v4 = -[CKBusinessInfoView initWithLayoutType:]([CKBusinessInfoView alloc], "initWithLayoutType:", 1);
    v5 = self->_businessInfoView;
    self->_businessInfoView = v4;

    -[CKBusinessInfoView setDelegate:](self->_businessInfoView, "setDelegate:", self);
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BUSINESS_DESCRIPTION_IN_DETAILS"), &stru_1E276D870, CFSTR("ChatKit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBusinessInfoView setDescriptionText:](self->_businessInfoView, "setDescriptionText:", v7);

    businessInfoView = self->_businessInfoView;
  }
  return businessInfoView;
}

- (void)businessInfoView:(id)a3 infoButtonTapped:(id)a4
{
  void *v5;
  CKDetailsController *v6;
  CKDetailsController *v7;
  void *v8;
  CKDetailsController *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacySplashWithIdentifier:", *MEMORY[0x1E0D651E0], a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (CKIsRunningInMacCatalyst()
    && (-[CKDetailsController detailsControllerDelegate](self, "detailsControllerDelegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "detailsControllerBusinessPrivacyInfoPresentingViewController:", self),
        v6 = (CKDetailsController *)objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    v7 = self;
    if (v6 != self)
    {
      -[CKDetailsController detailsControllerDelegate](self, "detailsControllerDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dismissDetailsNavigationController");

      v7 = v6;
    }
  }
  else
  {
    v7 = 0;
  }
  if (v7)
    v9 = v7;
  else
    v9 = self;
  objc_msgSend(v10, "setPresentingViewController:", v9);
  objc_msgSend(v10, "present");

}

+ (void)saveGroupPhotoDataAndUpdateParticipants:(id)a3 forConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Saving the group photo and updating the recipients.", v12, 2u);
    }

  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "im_randomTemporaryFileURLWithFileName:", *MEMORY[0x1E0D37FB8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "writeToFile:atomically:", v11, 1);
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(a1, "updateParticipantsWithGroupPhotoAtPath:forConversation:", v11, v7);

}

+ (void)updateParticipantsWithGroupPhotoAtPath:(id)a3 forConversation:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = v5;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Should update group photo at path: %@", (uint8_t *)&v15, 0xCu);
    }

  }
  if (!v5)
  {
    v10 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createNewOutgoingGroupPhotoTransferWithLocalFileURL:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transferForGUID:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerTransferWithDaemon:", v10);

LABEL_13:
    objc_msgSend(v6, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendGroupPhotoUpdate:", v10);
    goto LABEL_14;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "IMFileTransfer is nil.", (uint8_t *)&v15, 2u);
    }

  }
LABEL_14:

}

- (void)userDidTapDownloadForAttachmentsFooterView:(id)a3
{
  void *v4;
  id v5;

  if (-[CKDetailsController downloadButtonState](self, "downloadButtonState", a3) != 2)
  {
    -[CKDetailsController setDownloadButtonState:](self, "setDownloadButtonState:", 2);
    -[CKDetailsController conversation](self, "conversation");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "downloadPurgedAttachments");

  }
}

- (unint64_t)_purgedAttachmentCount
{
  void *v3;
  void *v4;
  void *v5;

  if (!self->_didPerformPurgedAttachmentsCheck)
  {
    -[CKDetailsController conversation](self, "conversation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "chat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "countOfAttachmentsNotCachedLocally");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_undownloadedPhotoAttachmentCount = objc_msgSend(v5, "integerValue");

    self->_didPerformPurgedAttachmentsCheck = 1;
  }
  return self->_undownloadedPhotoAttachmentCount;
}

- (void)_resetPurgedAttachmentCount
{
  self->_didPerformPurgedAttachmentsCheck = 0;
  self->_undownloadedPhotoAttachmentCount = 0;
}

- (BOOL)shouldShowDownloadMoreCell
{
  return -[CKDetailsController _purgedAttachmentCount](self, "_purgedAttachmentCount") != 0;
}

- (void)setDownloadButtonState:(unint64_t)a3
{
  self->_downloadButtonState = a3;
  if (a3 - 1 <= 1)
    -[CKDetailsController _updateDownloadFooterView](self, "_updateDownloadFooterView");
}

- (void)_updateDownloadButtonStateIfNeeded
{
  unint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[6];

  v3 = -[CKDetailsController downloadButtonState](self, "downloadButtonState");
  -[CKDetailsController conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__CKDetailsController__updateDownloadButtonStateIfNeeded__block_invoke;
  v6[3] = &unk_1E274F528;
  v6[4] = self;
  v6[5] = v3;
  objc_msgSend(v5, "fetchIsCurrentlyDownloadingPurgedAttachments:", v6);

}

void __57__CKDetailsController__updateDownloadButtonStateIfNeeded__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    v4 = 2;
  }
  else
  {
    v5 = objc_msgSend(v3, "shouldShowDownloadMoreCell");
    v3 = *(void **)(a1 + 32);
    v4 = v5 != 0;
  }
  objc_msgSend(v3, "setDownloadButtonState:", v4);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 != objc_msgSend(*(id *)(a1 + 32), "downloadButtonState"))
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadData");

  }
}

- (void)_batchDownloadNotificationFired:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CKDetailsController__batchDownloadNotificationFired___block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __55__CKDetailsController__batchDownloadNotificationFired___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_resetPurgedAttachmentCount");
  objc_msgSend(*(id *)(a1 + 32), "_updateDownloadButtonStateIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_updateDownloadFooterView");
  objc_msgSend(*(id *)(a1 + 32), "searchViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rekickZKWSearchForAttachmentBatchUpdate");

}

- (void)_presentGroupNameAndPhotoEditor
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc(MEMORY[0x1E0CEA7B8]);
  -[CKDetailsController _generateGroupImagePickerViewController](self, "_generateGroupImagePickerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "initWithRootViewController:", v4);

  -[CKDetailsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (id)_generateGroupImagePickerViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97548], "descriptorForRequiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKDetailsController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", v4, objc_msgSend(MEMORY[0x1E0C97468], "maxContactAvatars"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C97548], "imagePickerForGroupIdentity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "setPresenterDelegate:", self);

  return v7;
}

- (void)groupIdentityHeaderViewController:(id)a3 didDismissSharedProfileBannerWithUpdatedContact:(id)a4 forAction:(unint64_t)a5
{
  id v6;

  -[CKDetailsController setShouldForceGroupPhotoHeaderReload:](self, "setShouldForceGroupPhotoHeaderReload:", 1, a4, a5);
  -[CKDetailsController tableView](self, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

}

- (void)_dismissIdentityPicker:(id)a3
{
  id v3;

  objc_msgSend(a3, "presentingViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)visualIdentityPicker:(id)a3 didUpdatePhotoForVisualIdentity:(id)a4 withContactImage:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t v34[16];
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C97548], "descriptorForRequiredKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKDetailsController conversation](self, "conversation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", v12, objc_msgSend(MEMORY[0x1E0C97468], "maxContactAvatars"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "thumbnailImageData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "groupPhoto");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToData:", v16);

  if ((v17 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Updating visual identity.", v34, 2u);
      }

    }
    -[CKDetailsController conversation](self, "conversation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "chat");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isGroupChat");

    if (v21)
    {
      objc_msgSend(v9, "thumbnailImageData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsController conversation](self, "conversation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKDetailsController saveGroupPhotoDataAndUpdateParticipants:forConversation:](CKDetailsController, "saveGroupPhotoDataAndUpdateParticipants:forConversation:", v22, v23);

    }
    -[CKDetailsController conversation](self, "conversation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setNeedsUpdatedGroupPhotoForVisualIdentity");

  }
  objc_msgSend(v9, "name");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController conversation](self, "conversation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "displayName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v25, "isEqualToString:", v27);

  if ((v28 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_INFO, "Updating display name.", v34, 2u);
      }

    }
    -[CKDetailsController conversation](self, "conversation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setDisplayName:", v31);

    -[CKDetailsController conversation](self, "conversation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setNeedsUpdatedGroupNameForVisualIdentity");

  }
  -[CKDetailsController conversation](self, "conversation");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setGroupIdentityUpdateHandleID:", 0);

  -[CKDetailsController _dismissIdentityPicker:](self, "_dismissIdentityPicker:", v8);
}

- (void)_handleAddingHandles:(id)a3 allRecipientsAddresses:(id)a4 sender:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v7 = a4;
  v8 = a3;
  -[CKDetailsController addRecipientsController](self, "addRecipientsController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController conversation](self, "conversation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__CKDetailsController__handleAddingHandles_allRecipientsAddresses_sender___block_invoke;
  v12[3] = &unk_1E274F550;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v9, "handleAddingHandles:conversation:viewController:allRecipientAddresses:completion:", v8, v10, self, v11, v12);

}

void __74__CKDetailsController__handleAddingHandles_allRecipientsAddresses_sender___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  void *v42;
  uint64_t v43;
  id v44;

  v5 = a3;
  if (!a2)
    goto LABEL_17;
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CREATE_NEW_GROUP_DESC"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendingService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D38F68]);

  v12 = *(void **)(a1 + 32);
  if (v11)
  {
    v13 = objc_msgSend(v12, "_atLeastOneEmailPresentInHandles:", v5);
    CKFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v13 & 1) != 0)
      v15 = CFSTR("CREATE_NEW_GROUP_IMESSAGE_HAS_EMAILS_DESC");
    else
      v15 = CFSTR("CREATE_NEW_GROUP_IMESSAGE_DESC");
LABEL_10:
    objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_1E276D870, CFSTR("ChatKit"));
    v21 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v21;
    goto LABEL_11;
  }
  objc_msgSend(v12, "conversation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendingService");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D38F50]);

  if (v19)
  {
    v20 = objc_msgSend(*(id *)(a1 + 32), "_atLeastOneEmailPresentInHandles:", v5);
    CKFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v20 & 1) != 0)
      v15 = CFSTR("CREATE_NEW_GROUP_RCS_HAS_EMAILS_DESC");
    else
      v15 = CFSTR("CREATE_NEW_GROUP_RCS_DESC");
    goto LABEL_10;
  }
LABEL_11:
  CKFrameworkBundle();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CREATE_NEW_GROUP_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v23, v7, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("CREATE_NEW_GROUP_ACTION_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = MEMORY[0x1E0C809B0];
  v40 = 3221225472;
  v41 = __74__CKDetailsController__handleAddingHandles_allRecipientsAddresses_sender___block_invoke_2;
  v42 = &unk_1E274B818;
  v27 = *(void **)(a1 + 40);
  v43 = *(_QWORD *)(a1 + 32);
  v44 = v27;
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v26, 0, &v39);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v29 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v29, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"), v39, v40, v41, v42, v43);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v30, 1, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "addAction:", v28);
  objc_msgSend(v24, "addAction:", v31);
  objc_msgSend(v24, "setPreferredAction:", v28);
  objc_msgSend(*(id *)(a1 + 32), "addRecipientsController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "detailsControllerDelegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v29) = objc_opt_respondsToSelector();

  if ((v29 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "detailsControllerDelegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "presentingViewControllerForGroupAlertsFromDetailsController:", *(_QWORD *)(a1 + 32));
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v35;
    if (v35)
      v37 = (void *)v35;
    else
      v37 = v32;
    v38 = v37;

    v32 = v38;
  }
  objc_msgSend(v24, "presentFromViewController:animated:completion:", v32, 1, 0);

LABEL_17:
}

void __74__CKDetailsController__handleAddingHandles_allRecipientsAddresses_sender___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __74__CKDetailsController__handleAddingHandles_allRecipientsAddresses_sender___block_invoke_3;
  v2[3] = &unk_1E274A108;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 0, v2);

}

void __74__CKDetailsController__handleAddingHandles_allRecipientsAddresses_sender___block_invoke_3(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "detailsControllerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "detailsControllerDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "detailsController:shouldComposeConversationWithRecipientAddresses:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (BOOL)_atLeastOneEmailPresentInHandles:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  char IsEmail;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "ID", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        IsEmail = IMStringIsEmail();

        if ((IsEmail & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)_chatAllowedByScreenTimeChanged:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v5, "allowedByScreenTime") & 1) == 0)
  {
    if (CKIsRunningInMacCatalyst())
    {
      -[CKDetailsController detailsControllerDelegate](self, "detailsControllerDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dismissDetailsNavigationController");

    }
    else
    {
      -[CKDetailsController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    }
  }

}

- (void)_handleMultiWayStateChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D35408]);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "existingConversationForTelephonyConversationUUID:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController tuConversation](self, "tuConversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    -[CKDetailsController expanseActivityTextView](self, "expanseActivityTextView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromSuperview");

    -[CKDetailsController setExpanseActivityTextView:](self, "setExpanseActivityTextView:", 0);
    -[CKDetailsController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reloadData");

  }
}

- (void)updateContactsHeaderVerificationState
{
  -[CNGroupIdentityHeaderViewController setShouldShowStaticKeyBadge:](self->_groupPhotoHeaderViewController, "setShouldShowStaticKeyBadge:", -[CKDetailsController shouldShowKeyTransparency](self, "shouldShowKeyTransparency"));
}

- (id)ktCellForRow:(int64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;

  -[CKDetailsController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isGroupChat");

  switch(self->_ktChatState)
  {
    case 0uLL:
      -[CKDetailsController ktEnableEnhancedProtectionCell](self, "ktEnableEnhancedProtectionCell");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return v8;
    case 1uLL:
    case 2uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      goto LABEL_2;
    case 3uLL:
      if (!v7)
        goto LABEL_4;
      goto LABEL_2;
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
      if (a3)
      {
LABEL_4:
        -[CKDetailsController ktVerifyConversationCell](self, "ktVerifyConversationCell");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_2:
        -[CKDetailsController ktEnhancedProtectionStateCell](self, "ktEnhancedProtectionStateCell");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      break;
    default:
      v8 = 0;
      break;
  }
  return v8;
}

- (CKEnableEnhancedProtectionCell)ktEnableEnhancedProtectionCell
{
  CKEnableEnhancedProtectionCell *ktEnableEnhancedProtectionCell;
  void *v4;
  uint64_t v5;
  void *v6;
  CKEnableEnhancedProtectionCell *v7;
  void *v8;
  void *v9;
  CKEnableEnhancedProtectionCell *v10;
  CKEnableEnhancedProtectionCell *v11;

  ktEnableEnhancedProtectionCell = self->_ktEnableEnhancedProtectionCell;
  if (!ktEnableEnhancedProtectionCell)
  {
    -[CKDetailsController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_class();
    +[CKEnableEnhancedProtectionCell reuseIdentifier](CKEnableEnhancedProtectionCell, "reuseIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v5, v6);

    v7 = [CKEnableEnhancedProtectionCell alloc];
    +[CKEnableEnhancedProtectionCell reuseIdentifier](CKEnableEnhancedProtectionCell, "reuseIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController tuConversation](self, "tuConversation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CKEnableEnhancedProtectionCell initWithStyle:reuseIdentifier:conversation:shouldShowMacHeader:](v7, "initWithStyle:reuseIdentifier:conversation:shouldShowMacHeader:", 0, v8, v9, 1);
    v11 = self->_ktEnableEnhancedProtectionCell;
    self->_ktEnableEnhancedProtectionCell = v10;

    ktEnableEnhancedProtectionCell = self->_ktEnableEnhancedProtectionCell;
  }
  return ktEnableEnhancedProtectionCell;
}

- (CKKTEnhancedProtectionStatusCell)ktEnhancedProtectionStateCell
{
  int64_t ktEnhancedProtectionStatusCellState;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  __CFString *v32;
  CKKTEnhancedProtectionStatusCell *ktEnhancedProtectionStateCell;
  CKKTEnhancedProtectionStatusCell *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  CKKTEnhancedProtectionStatusCell *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  CKKTEnhancedProtectionStatusCell *v44;
  CKKTEnhancedProtectionStatusCell *v45;
  CKKTEnhancedProtectionStatusCell *v46;
  uint64_t v48;
  void *v49;
  uint8_t buf[8];
  void *v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  ktEnhancedProtectionStatusCellState = self->_ktEnhancedProtectionStatusCellState;
  -[CKDetailsController conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKKTDetailsViewUtilities verifiedHandlesInChat:](CKKTDetailsViewUtilities, "verifiedHandlesInChat:", v5);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 < 2)
  {
    objc_msgSend(v5, "participants");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 == 1)
    {
      objc_msgSend(v5, "participants");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKKTDetailsViewUtilities namesFromHandles:shouldUseShortFormat:](CKKTDetailsViewUtilities, "namesFromHandles:shouldUseShortFormat:", v17, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "CKDetailsController_KT: There are no handles in the chat", buf, 2u);
        }

      }
      v12 = &stru_1E276D870;
    }
  }
  else
  {
    -[CKDetailsController conversation](self, "conversation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      -[CKDetailsController conversation](self, "conversation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "displayName");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v5, "participants");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v52[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKKTDetailsViewUtilities namesFromHandles:shouldUseShortFormat:](CKKTDetailsViewUtilities, "namesFromHandles:shouldUseShortFormat:", v22, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("X_AND_N_PEOPLE"), &stru_1E276D870, CFSTR("ChatKitFormats-Key-Transparency"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "participants");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringWithFormat:", v27, v24, objc_msgSend(v28, "count") - 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "userInterfaceLayoutDirection") == 1;

      if (v31)
        v32 = CFSTR("\u200F");
      else
        v32 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v32, "stringByAppendingString:", v29);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  ktEnhancedProtectionStateCell = self->_ktEnhancedProtectionStateCell;
  if (ktEnhancedProtectionStateCell)
  {
    -[CKKTEnhancedProtectionStatusCell setEnhancedProtectionStatusCellState:](ktEnhancedProtectionStateCell, "setEnhancedProtectionStatusCellState:", ktEnhancedProtectionStatusCellState);
    v34 = self->_ktEnhancedProtectionStateCell;
    objc_msgSend(v5, "participants");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKKTEnhancedProtectionStatusCell setHandlesInChatCount:](v34, "setHandlesInChatCount:", objc_msgSend(v35, "count"));

    -[CKKTEnhancedProtectionStatusCell setVerifiedHandlesCount:](self->_ktEnhancedProtectionStateCell, "setVerifiedHandlesCount:", objc_msgSend(v49, "count"));
    -[CKKTEnhancedProtectionStatusCell setTitleString:](self->_ktEnhancedProtectionStateCell, "setTitleString:", v12);
    -[CKKTEnhancedProtectionStatusCell updateTitleAndStatusButtonConfiguration](self->_ktEnhancedProtectionStateCell, "updateTitleAndStatusButtonConfiguration");
  }
  else
  {
    -[CKDetailsController tableView](self, "tableView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_opt_class();
    +[CKKTEnhancedProtectionStatusCell reuseIdentifier](CKKTEnhancedProtectionStatusCell, "reuseIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "registerClass:forCellReuseIdentifier:", v37, v38);

    v39 = [CKKTEnhancedProtectionStatusCell alloc];
    +[CKKTEnhancedProtectionStatusCell reuseIdentifier](CKKTEnhancedProtectionStatusCell, "reuseIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController conversation](self, "conversation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "chat");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "participants");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v48) = 1;
    v44 = -[CKKTEnhancedProtectionStatusCell initWithStyle:reuseIdentifier:state:delegate:handlesInChat:verifiedHandles:titleString:shouldShowMacHeader:](v39, "initWithStyle:reuseIdentifier:state:delegate:handlesInChat:verifiedHandles:titleString:shouldShowMacHeader:", 0, v40, ktEnhancedProtectionStatusCellState, self, v43, v49, v12, v48);
    v45 = self->_ktEnhancedProtectionStateCell;
    self->_ktEnhancedProtectionStateCell = v44;

  }
  v46 = self->_ktEnhancedProtectionStateCell;

  return v46;
}

- (CKKTVerifyConversationTableViewCell)ktVerifyConversationCell
{
  unint64_t ktChatState;
  void *v4;
  void *v5;
  int64_t v6;
  CKKTVerifyConversationTableViewCell *ktVerifyConversationCell;
  void *v8;
  uint64_t v9;
  void *v10;
  CKKTVerifyConversationTableViewCell *v11;
  void *v12;
  CKKTVerifyConversationTableViewCell *v13;
  CKKTVerifyConversationTableViewCell *v14;
  CKKTVerifyConversationTableViewCell *v15;
  void *v16;
  void *v17;

  ktChatState = self->_ktChatState;
  -[CKDetailsController conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[CKKTDetailsViewUtilities numberOfRowsInKTSectionForStatus:isGroupChat:](CKKTDetailsViewUtilities, "numberOfRowsInKTSectionForStatus:isGroupChat:", ktChatState, objc_msgSend(v5, "isGroupChat"));

  ktVerifyConversationCell = self->_ktVerifyConversationCell;
  if (ktVerifyConversationCell)
  {
    -[CKKTVerifyConversationTableViewCell setNumberOfRowsInSection:](ktVerifyConversationCell, "setNumberOfRowsInSection:", v6);
    -[CKKTVerifyConversationTableViewCell setShouldShowMacHeader:](self->_ktVerifyConversationCell, "setShouldShowMacHeader:", v6 == 1);
    -[CKKTVerifyConversationTableViewCell setKtStatus:](self->_ktVerifyConversationCell, "setKtStatus:", -[CKDetailsController ktChatState](self, "ktChatState"));
    -[CKKTVerifyConversationTableViewCell updateForNewKTState](self->_ktVerifyConversationCell, "updateForNewKTState");
  }
  else
  {
    -[CKDetailsController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    +[CKKTVerifyConversationTableViewCell reuseIdentifier](CKKTVerifyConversationTableViewCell, "reuseIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", v9, v10);

    v11 = [CKKTVerifyConversationTableViewCell alloc];
    +[CKKTVerifyConversationTableViewCell reuseIdentifier](CKKTVerifyConversationTableViewCell, "reuseIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CKKTVerifyConversationTableViewCell initWithStyle:reuseIdentifier:numberOfRowsInSection:shouldShowMacHeader:ktStatus:](v11, "initWithStyle:reuseIdentifier:numberOfRowsInSection:shouldShowMacHeader:ktStatus:", 0, v12, v6, v6 == 1, -[CKDetailsController ktChatState](self, "ktChatState"));
    v14 = self->_ktVerifyConversationCell;
    self->_ktVerifyConversationCell = v13;

  }
  v15 = self->_ktVerifyConversationCell;
  -[CKDetailsController conversation](self, "conversation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "chat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKTVerifyConversationTableViewCell setEnabled:](v15, "setEnabled:", objc_msgSend(v17, "hasKnownParticipants"));

  return self->_ktVerifyConversationCell;
}

- (id)ktSecurityFooterView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[CKDetailsController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  +[CKKTSecurityHeaderFooterView footerReuseIdentifier](CKKTSecurityHeaderFooterView, "footerReuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forHeaderFooterViewReuseIdentifier:", v4, v5);

  +[CKKTSecurityHeaderFooterView footerReuseIdentifier](CKKTSecurityHeaderFooterView, "footerReuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableHeaderFooterViewWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKDetailsController ktSecurityFooterTextView](self, "ktSecurityFooterTextView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setKtSecurityTextView:", v8);
  objc_msgSend(v7, "setIsAccessibilityElement:", 1);
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("KeyTransparencyDetailsFooter"));
  objc_msgSend(v8, "attributedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v10);

  return v7;
}

- (UITextView)ktSecurityFooterTextView
{
  unint64_t ktChatState;
  NSArray *ktHandlesForKtChatStatus;
  void *v5;
  UITextView *v6;
  UITextView *ktSecurityFooterTextView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  ktChatState = self->_ktChatState;
  ktHandlesForKtChatStatus = self->_ktHandlesForKtChatStatus;
  if (self->_ktSecurityFooterTextView)
  {
    +[CKKTDetailsViewUtilities securityFooterStringForKTChatState:handles:](CKKTDetailsViewUtilities, "securityFooterStringForKTChatState:handles:", ktChatState, ktHandlesForKtChatStatus);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setAttributedText:](self->_ktSecurityFooterTextView, "setAttributedText:", v5);

  }
  else
  {
    +[CKKTDetailsViewUtilities ktSecuritySectionFooterTextViewForKTStatus:withHandles:](CKKTDetailsViewUtilities, "ktSecuritySectionFooterTextViewForKTStatus:withHandles:", ktChatState, ktHandlesForKtChatStatus);
    v6 = (UITextView *)objc_claimAutoreleasedReturnValue();
    ktSecurityFooterTextView = self->_ktSecurityFooterTextView;
    self->_ktSecurityFooterTextView = v6;

    v16 = *MEMORY[0x1E0DC1140];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "theme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "linkColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setLinkTextAttributes:](self->_ktSecurityFooterTextView, "setLinkTextAttributes:", v11);

    -[UITextView setDelegate:](self->_ktSecurityFooterTextView, "setDelegate:", self);
    -[CKDetailsController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_marginWidth");
    v14 = v13;

    -[UITextView setTextContainerInset:](self->_ktSecurityFooterTextView, "setTextContainerInset:", 0.0, v14, 0.0, v14);
  }
  return self->_ktSecurityFooterTextView;
}

- (double)calculateHeightForKTFooter
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  BOOL IsEmpty;
  double result;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;
  CGRect v24;

  -[CKDetailsController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  IsEmpty = CGRectIsEmpty(v23);
  result = 0.0;
  if (!IsEmpty)
  {
    -[CKDetailsController tableView](self, "tableView", 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_sectionContentInset");
    v16 = v15;
    v18 = v17;

    -[CKDetailsController ktSecurityFooterTextView](self, "ktSecurityFooterTextView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24.origin.x = v5;
    v24.origin.y = v7;
    v24.size.width = v9;
    v24.size.height = v11;
    objc_msgSend(v19, "sizeThatFits:", CGRectGetWidth(v24) - (v16 + v18), 1.79769313e308);
    v21 = v20;

    +[CKKTSecurityHeaderFooterView footerVerticalPadding](CKKTSecurityHeaderFooterView, "footerVerticalPadding");
    return v21 + v22 + v22 + 16.0;
  }
  return result;
}

- (void)enableEnhancedProtection
{
  +[CKUtilities openCKVSettings](CKUtilities, "openCKVSettings");
}

- (void)keyTransparencyConversationViewControllerDidComplete:(id)a3
{
  void *v4;
  void *v5;

  -[CKDetailsController conversation](self, "conversation", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchKTStatus");

  -[CKDetailsController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)keyTransparencyDetailsStatusCellDidSelectLearnMore:(id)a3
{
  +[CKKeyTransparencyErrorUtilities learnMorePressedFromError:](CKKeyTransparencyErrorUtilities, "learnMorePressedFromError:", 1);
}

- (void)showKTContactVerificationUI
{
  void *v3;
  id v4;

  -[CKDetailsController conversation](self, "conversation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKKeyTransparencyErrorUtilities showKTContactVerificationUIForIMChat:fromViewController:](CKKeyTransparencyErrorUtilities, "showKTContactVerificationUIForIMChat:fromViewController:", v3, self);

}

- (void)keyTransparencyDetailsStatusCellDidRequestReportToApple:(id)a3
{
  +[CKKeyTransparencyErrorUtilities showReportToAppleUIFromViewController:](CKKeyTransparencyErrorUtilities, "showReportToAppleUIFromViewController:", self);
}

- (void)keyTransparencyDetailsStatusCellDidSelectIgnoreFailures:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  -[CKDetailsController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __79__CKDetailsController_keyTransparencyDetailsStatusCellDidSelectIgnoreFailures___block_invoke;
  v12 = &unk_1E274B548;
  objc_copyWeak(&v13, &location);
  +[CKKeyTransparencyErrorUtilities ktClearWarningAlertControllerForChat:confirmationHandler:](CKKeyTransparencyErrorUtilities, "ktClearWarningAlertControllerForChat:confirmationHandler:", v6, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!CKIsRunningInMacCatalyst()
    && +[CKUtilities isIpad](CKUtilities, "isIpad", v9, v10, v11, v12))
  {
    objc_msgSend(v7, "popoverPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSourceView:", v4);
    objc_msgSend(v4, "bounds");
    objc_msgSend(v8, "setSourceRect:");

  }
  -[CKDetailsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0, v9, v10, v11, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __79__CKDetailsController_keyTransparencyDetailsStatusCellDidSelectIgnoreFailures___block_invoke(uint64_t a1)
{
  void *v1;
  char v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "detailsControllerDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "detailsControllerDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "detailsControllerWillDismiss:", WeakRetained);

  }
  if (CKIsRunningInMacCatalyst())
  {
    objc_msgSend(WeakRetained, "detailsControllerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissDetailsNavigationController");

    objc_msgSend(WeakRetained, "detailsControllerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "detailsControllerDidDismiss:", WeakRetained);

  }
  else
  {
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (CKDetailsControllerDelegate)detailsControllerDelegate
{
  return (CKDetailsControllerDelegate *)objc_loadWeakRetained((id *)&self->_detailsControllerDelegate);
}

- (void)setDetailsControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_detailsControllerDelegate, a3);
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (BOOL)isContactsSectionCollapsed
{
  return self->_isContactsSectionCollapsed;
}

- (void)setIsContactsSectionCollapsed:(BOOL)a3
{
  self->_isContactsSectionCollapsed = a3;
}

- (CKDetailsContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (void)setContactsManager:(id)a3
{
  objc_storeStrong((id *)&self->_contactsManager, a3);
}

- (NSTimer)fmfUpdateTimer
{
  return self->_fmfUpdateTimer;
}

- (void)setFmfUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_fmfUpdateTimer, a3);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (void)setSuggestionsEnabledContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsEnabledContactStore, a3);
}

- (CKEntity)presentedEntity
{
  return self->_presentedEntity;
}

- (void)setPresentedEntity:(id)a3
{
  objc_storeStrong((id *)&self->_presentedEntity, a3);
}

- (UIViewController)findMyWaldoMapViewController
{
  return self->_findMyWaldoMapViewController;
}

- (void)setFindMyWaldoMapViewController:(id)a3
{
  objc_storeStrong((id *)&self->_findMyWaldoMapViewController, a3);
}

- (CKDetailsTableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectView, a3);
}

- (CKDetailsGroupNameCell)groupNameCell
{
  return self->_groupNameCell;
}

- (void)setGroupNameCell:(id)a3
{
  objc_storeStrong((id *)&self->_groupNameCell, a3);
}

- (CKGroupPhotoCell)groupPhotoCell
{
  return self->_groupPhotoCell;
}

- (void)setGroupPhotoCell:(id)a3
{
  objc_storeStrong((id *)&self->_groupPhotoCell, a3);
}

- (double)showMoreContactCellHeight
{
  return self->_showMoreContactCellHeight;
}

- (void)setShowMoreContactCellHeight:(double)a3
{
  self->_showMoreContactCellHeight = a3;
}

- (double)addContactCellHeight
{
  return self->_addContactCellHeight;
}

- (void)setAddContactCellHeight:(double)a3
{
  self->_addContactCellHeight = a3;
}

- (double)groupPhotoHeaderHeight
{
  return self->_groupPhotoHeaderHeight;
}

- (void)setGroupPhotoHeaderHeight:(double)a3
{
  self->_groupPhotoHeaderHeight = a3;
}

- (double)simLabelCellHeight
{
  return self->_simLabelCellHeight;
}

- (void)setSimLabelCellHeight:(double)a3
{
  self->_simLabelCellHeight = a3;
}

- (double)tuConversationCellHeight
{
  return self->_tuConversationCellHeight;
}

- (void)setTuConversationCellHeight:(double)a3
{
  self->_tuConversationCellHeight = a3;
}

- (BOOL)shouldForceGroupPhotoHeaderReload
{
  return self->_shouldForceGroupPhotoHeaderReload;
}

- (void)setShouldForceGroupPhotoHeaderReload:(BOOL)a3
{
  self->_shouldForceGroupPhotoHeaderReload = a3;
}

- (NSData)selectedImageData
{
  return self->_selectedImageData;
}

- (void)setSelectedImageData:(id)a3
{
  objc_storeStrong((id *)&self->_selectedImageData, a3);
}

- (void)setGroupNameView:(id)a3
{
  objc_storeStrong((id *)&self->_groupNameView, a3);
}

- (CKDetailsMapViewCell)mapViewCell
{
  return self->_mapViewCell;
}

- (void)setMapViewCell:(id)a3
{
  objc_storeStrong((id *)&self->_mapViewCell, a3);
}

- (void)setSimCell:(id)a3
{
  objc_storeStrong((id *)&self->_simCell, a3);
}

- (void)setLocationShareCell:(id)a3
{
  objc_storeStrong((id *)&self->_locationShareCell, a3);
}

- (CKDetailsLocationStringCell)locationStringCell
{
  return self->_locationStringCell;
}

- (void)setLocationStringCell:(id)a3
{
  objc_storeStrong((id *)&self->_locationStringCell, a3);
}

- (void)setSimSwitchCell:(id)a3
{
  objc_storeStrong((id *)&self->_simSwitchCell, a3);
}

- (void)setLocationSendOrRequestCell:(id)a3
{
  objc_storeStrong((id *)&self->_locationSendOrRequestCell, a3);
}

- (void)setLocationStartShareCell:(id)a3
{
  objc_storeStrong((id *)&self->_locationStartShareCell, a3);
}

- (void)setSendCurrentLocationCell:(id)a3
{
  objc_storeStrong((id *)&self->_sendCurrentLocationCell, a3);
}

- (void)setOpenInContactsCell:(id)a3
{
  objc_storeStrong((id *)&self->_openInContactsCell, a3);
}

- (void)setChangeGroupNamePhotoCell:(id)a3
{
  objc_storeStrong((id *)&self->_changeGroupNamePhotoCell, a3);
}

- (CKDetailsSearchViewController)searchViewController
{
  return self->_searchViewController;
}

- (void)setSearchViewController:(id)a3
{
  objc_storeStrong((id *)&self->_searchViewController, a3);
}

- (CNGroupIdentityHeaderViewController)groupPhotoHeaderViewController
{
  return self->_groupPhotoHeaderViewController;
}

- (void)setGroupPhotoHeaderViewController:(id)a3
{
  objc_storeStrong((id *)&self->_groupPhotoHeaderViewController, a3);
}

- (CKNavigationController)groupNavigationController
{
  return self->_groupNavigationController;
}

- (void)setGroupNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_groupNavigationController, a3);
}

- (UIButton)screenShareContextButton
{
  return self->_screenShareContextButton;
}

- (void)setScreenShareContextButton:(id)a3
{
  objc_storeStrong((id *)&self->_screenShareContextButton, a3);
}

- (CKGroupRecipientSelectionController)addRecipientsController
{
  return self->_addRecipientsController;
}

- (void)setAddRecipientsController:(id)a3
{
  objc_storeStrong((id *)&self->_addRecipientsController, a3);
}

- (FMFMapViewController)mapViewController
{
  return self->_mapViewController;
}

- (void)setMapViewController:(id)a3
{
  objc_storeStrong((id *)&self->_mapViewController, a3);
}

- (void)setLocationSharingTextView:(id)a3
{
  objc_storeStrong((id *)&self->_locationSharingTextView, a3);
}

- (CKDetailsDownloadAttachmentsHeaderFooterView)downloadAttachmentsFooterView
{
  return self->_downloadAttachmentsFooterView;
}

- (void)setDownloadAttachmentsFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_downloadAttachmentsFooterView, a3);
}

- (void)setExpanseActivityTextView:(id)a3
{
  objc_storeStrong((id *)&self->_expanseActivityTextView, a3);
}

- (void)setSharedWithYouFooterTextView:(id)a3
{
  objc_storeStrong((id *)&self->_sharedWithYouFooterTextView, a3);
}

- (void)setBusinessInfoView:(id)a3
{
  objc_storeStrong((id *)&self->_businessInfoView, a3);
}

- (BOOL)shouldCollapseContactsSection
{
  return self->_shouldCollapseContactsSection;
}

- (void)setShouldCollapseContactsSection:(BOOL)a3
{
  self->_shouldCollapseContactsSection = a3;
}

- (double)contentOffsetYShiftAfterKeyboardNotification
{
  return self->_contentOffsetYShiftAfterKeyboardNotification;
}

- (void)setContentOffsetYShiftAfterKeyboardNotification:(double)a3
{
  self->_contentOffsetYShiftAfterKeyboardNotification = a3;
}

- (id)selfWeakWrapper
{
  return self->_selfWeakWrapper;
}

- (void)setSelfWeakWrapper:(id)a3
{
  objc_storeStrong(&self->_selfWeakWrapper, a3);
}

- (BOOL)didPerformPurgedAttachmentsCheck
{
  return self->_didPerformPurgedAttachmentsCheck;
}

- (void)setDidPerformPurgedAttachmentsCheck:(BOOL)a3
{
  self->_didPerformPurgedAttachmentsCheck = a3;
}

- (unint64_t)undownloadedPhotoAttachmentCount
{
  return self->_undownloadedPhotoAttachmentCount;
}

- (void)setUndownloadedPhotoAttachmentCount:(unint64_t)a3
{
  self->_undownloadedPhotoAttachmentCount = a3;
}

- (unint64_t)downloadButtonState
{
  return self->_downloadButtonState;
}

- (BOOL)isDisplayingPhotos
{
  return self->_isDisplayingPhotos;
}

- (void)setIsDisplayingPhotos:(BOOL)a3
{
  self->_isDisplayingPhotos = a3;
}

- (BOOL)needsContactsReload
{
  return self->_needsContactsReload;
}

- (void)setNeedsContactsReload:(BOOL)a3
{
  self->_needsContactsReload = a3;
}

- (NSNumber)isSharingFocusStatus
{
  return self->_isSharingFocusStatus;
}

- (void)setIsSharingFocusStatus:(id)a3
{
  objc_storeStrong((id *)&self->_isSharingFocusStatus, a3);
}

- (NSNumber)canShareFocusStatus
{
  return self->_canShareFocusStatus;
}

- (void)setCanShareFocusStatus:(id)a3
{
  objc_storeStrong((id *)&self->_canShareFocusStatus, a3);
}

- (BOOL)wasShowingReadReceiptSwitch
{
  return self->_wasShowingReadReceiptSwitch;
}

- (void)setWasShowingReadReceiptSwitch:(BOOL)a3
{
  self->_wasShowingReadReceiptSwitch = a3;
}

- (void)setKtSecurityFooterTextView:(id)a3
{
  objc_storeStrong((id *)&self->_ktSecurityFooterTextView, a3);
}

- (void)setKtEnhancedProtectionStateCell:(id)a3
{
  objc_storeStrong((id *)&self->_ktEnhancedProtectionStateCell, a3);
}

- (void)setKtEnableEnhancedProtectionCell:(id)a3
{
  objc_storeStrong((id *)&self->_ktEnableEnhancedProtectionCell, a3);
}

- (void)setKtVerifyConversationCell:(id)a3
{
  objc_storeStrong((id *)&self->_ktVerifyConversationCell, a3);
}

- (int64_t)ktEnhancedProtectionStatusCellState
{
  return self->_ktEnhancedProtectionStatusCellState;
}

- (void)setKtEnhancedProtectionStatusCellState:(int64_t)a3
{
  self->_ktEnhancedProtectionStatusCellState = a3;
}

- (NSArray)ktHandlesForKtChatStatus
{
  return self->_ktHandlesForKtChatStatus;
}

- (void)setKtHandlesForKtChatStatus:(id)a3
{
  objc_storeStrong((id *)&self->_ktHandlesForKtChatStatus, a3);
}

- (unint64_t)ktChatState
{
  return self->_ktChatState;
}

- (void)setKtChatState:(unint64_t)a3
{
  self->_ktChatState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ktHandlesForKtChatStatus, 0);
  objc_storeStrong((id *)&self->_ktVerifyConversationCell, 0);
  objc_storeStrong((id *)&self->_ktEnableEnhancedProtectionCell, 0);
  objc_storeStrong((id *)&self->_ktEnhancedProtectionStateCell, 0);
  objc_storeStrong((id *)&self->_ktSecurityFooterTextView, 0);
  objc_storeStrong((id *)&self->_canShareFocusStatus, 0);
  objc_storeStrong((id *)&self->_isSharingFocusStatus, 0);
  objc_storeStrong(&self->_selfWeakWrapper, 0);
  objc_storeStrong((id *)&self->_businessInfoView, 0);
  objc_storeStrong((id *)&self->_sharedWithYouFooterTextView, 0);
  objc_storeStrong((id *)&self->_expanseActivityTextView, 0);
  objc_storeStrong((id *)&self->_downloadAttachmentsFooterView, 0);
  objc_storeStrong((id *)&self->_locationSharingTextView, 0);
  objc_storeStrong((id *)&self->_mapViewController, 0);
  objc_storeStrong((id *)&self->_addRecipientsController, 0);
  objc_storeStrong((id *)&self->_screenShareContextButton, 0);
  objc_storeStrong((id *)&self->_groupNavigationController, 0);
  objc_storeStrong((id *)&self->_groupPhotoHeaderViewController, 0);
  objc_storeStrong((id *)&self->_searchViewController, 0);
  objc_storeStrong((id *)&self->_changeGroupNamePhotoCell, 0);
  objc_storeStrong((id *)&self->_openInContactsCell, 0);
  objc_storeStrong((id *)&self->_sendCurrentLocationCell, 0);
  objc_storeStrong((id *)&self->_locationStartShareCell, 0);
  objc_storeStrong((id *)&self->_locationSendOrRequestCell, 0);
  objc_storeStrong((id *)&self->_simSwitchCell, 0);
  objc_storeStrong((id *)&self->_locationStringCell, 0);
  objc_storeStrong((id *)&self->_locationShareCell, 0);
  objc_storeStrong((id *)&self->_simCell, 0);
  objc_storeStrong((id *)&self->_mapViewCell, 0);
  objc_storeStrong((id *)&self->_groupNameView, 0);
  objc_storeStrong((id *)&self->_selectedImageData, 0);
  objc_storeStrong((id *)&self->_groupPhotoCell, 0);
  objc_storeStrong((id *)&self->_groupNameCell, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_findMyWaldoMapViewController, 0);
  objc_storeStrong((id *)&self->_presentedEntity, 0);
  objc_storeStrong((id *)&self->_suggestionsEnabledContactStore, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_fmfUpdateTimer, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_destroyWeak((id *)&self->_detailsControllerDelegate);
}

- (id)simCellText:(id)a3
{
  void *v3;
  void *v4;

  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DETAILS_VIEW_SWITCH_SIM_CELL"), &stru_1E276D870, CFSTR("ChatKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)metricDSDSLineSwitchWithPreviousServiceName:(id)a3 newServiceName:(id)a4 isGroupConversation:(BOOL)a5
{
  _BOOL4 v5;
  _QWORD *v7;
  uint64_t v8;
  id v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  _QWORD v22[2];

  v5 = a5;
  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = (_QWORD *)MEMORY[0x1E0D38F58];
  v8 = *MEMORY[0x1E0D38F58];
  v9 = a4;
  v10 = objc_msgSend(a3, "isEqualToString:", v8);
  v11 = objc_msgSend(v9, "isEqualToString:", *v7);

  v12 = 6;
  if (v5)
    v12 = 10;
  v13 = 5;
  if (v5)
    v13 = 9;
  if (v11)
    v12 = v13;
  v14 = 4;
  if (v5)
    v14 = 8;
  v15 = 3;
  if (v5)
    v15 = 7;
  if (v11)
    v14 = v15;
  if (v10)
    v16 = v14;
  else
    v16 = v12;
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0D38558];
  v21 = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trackEvent:withDictionary:", v18, v20);

}

- (void)switchSubscriptionToContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;

  v48 = a3;
  -[CKDetailsController conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastAddressedSIMID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKDetailsController conversation](self, "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastAddressedHandleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length") || objc_msgSend(v6, "length"))
  {
    v10 = (uint64_t)v9;
  }
  else
  {
    -[CKDetailsController conversation](self, "conversation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "chat");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "account");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "strippedLogin");
    v10 = objc_claimAutoreleasedReturnValue();

    if (_IMWillLog())
    {
      v41 = v10;
      _IMAlwaysLog();
    }
  }
  -[CKDetailsController conversation](self, "conversation", v41);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "chat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "serviceName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (_IMWillLog())
  {
    v44 = v6;
    v45 = v48;
    v42 = v10;
    _IMAlwaysLog();
  }
  objc_msgSend(v48, "labelID", v42, v44, v45);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)v10;
  v47 = v6;
  if (objc_msgSend(v15, "length") && (objc_msgSend(v15, "isEqualToString:", v6) & 1) == 0)
  {
    v17 = v15;
    objc_msgSend(v48, "phoneNumber");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "iMessageAccountForLastAddressedHandle:simID:", v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v19, "serviceName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D38F68]);

    if (v21)
    {
      -[CKDetailsController conversation](self, "conversation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "chat");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "forceCancelTypingIndicator");

    }
  }
  -[CKDetailsController conversation](self, "conversation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "chat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setLastAddressedHandleID:", v16);

  -[CKDetailsController conversation](self, "conversation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "chat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setLastAddressedSIMID:", v17);

  -[CKDetailsController conversation](self, "conversation");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "chat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "account");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "serviceName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKDetailsController conversation](self, "conversation");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsController metricDSDSLineSwitchWithPreviousServiceName:newServiceName:isGroupConversation:](self, "metricDSDSLineSwitchWithPreviousServiceName:newServiceName:isGroupConversation:", v14, v31, objc_msgSend(v32, "isGroupConversation"));

  if (_IMWillLog())
  {
    -[CKDetailsController conversation](self, "conversation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "chat");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "guid");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    _IMAlwaysLog();

  }
  -[CKDetailsController conversation](self, "conversation", v43);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "chat");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "label");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "updateLineSwitchedTo:", v37);

}

- (BOOL)shouldShowSIMTypeSection
{
  void *v2;
  void *v3;
  char v4;

  -[CKDetailsController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsCapabilities:", 0x2000);

  return v4;
}

- (BOOL)isGroupChat
{
  void *v2;
  void *v3;
  char v4;

  -[CKDetailsController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isGroupChat");

  return v4;
}

- (BOOL)supportsChatNameAndPhotoHeader
{
  return 1;
}

- (BOOL)canLeaveConversation
{
  void *v2;
  char v3;

  -[CKDetailsController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "hasLeft") & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "canLeave");

  return v3;
}

- (BOOL)shouldShowGroupCount
{
  int v3;
  void *v4;
  char v5;

  v3 = CKIsRunningInMacCatalyst();
  if (v3)
  {
    -[CKDetailsController conversation](self, "conversation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isGroupConversation");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)shouldShowSharedWithYouFeatures
{
  void *v2;
  void *v3;
  char v4;

  -[CKDetailsController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldShowAutoDonationAction");

  return v4;
}

- (BOOL)shouldShowEnhancedGroupFeatures
{
  void *v2;
  char v3;

  -[CKDetailsController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isGroupConversation"))
    v3 = objc_msgSend(v2, "supportsMutatingGroupMembers");
  else
    v3 = 0;

  return v3;
}

- (BOOL)conversationHasLeft
{
  void *v2;
  char v3;

  -[CKDetailsController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isGroupConversation") && objc_msgSend(v2, "canLeave"))
    v3 = objc_msgSend(v2, "hasLeft");
  else
    v3 = 0;

  return v3;
}

- (BOOL)shouldEnableAddContactButton
{
  int v3;
  void *v4;
  char v5;
  void *v6;
  char v7;

  v3 = -[CKDetailsController isGroupChat](self, "isGroupChat");
  if (v3)
  {
    if (-[CKDetailsController conversationHasLeft](self, "conversationHasLeft")
      || (-[CKDetailsController conversation](self, "conversation"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "isReadOnlyChat"),
          v4,
          (v5 & 1) != 0))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isSatelliteConnectionActive");

      LOBYTE(v3) = v7 ^ 1;
    }
  }
  return v3;
}

- (id)emailAddressesForChat:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char IsEmail;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "participants", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "ID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        IsEmail = IMStringIsEmail();

        if ((IsEmail & 1) == 0)
        {

          v15 = &stru_1E276D870;
          goto LABEL_14;
        }
        objc_msgSend(v10, "ID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = &stru_1E276D870;
  }
  v15 = v14;
LABEL_14:

  return v15;
}

- (id)screenShareContextMenuForEntity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id location;
  _QWORD v30[4];

  v30[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    location = 0;
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("INVITE_TO_SHARE_MY_SCREEN"), &stru_1E276D870, CFSTR("ChatKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __71__CKDetailsController_ContactActions__screenShareContextMenuForEntity___block_invoke;
    v26[3] = &unk_1E274B010;
    v19 = &v28;
    objc_copyWeak(&v28, &location);
    v10 = v4;
    v27 = v10;
    objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v8, 0, 0, v26);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ASK_TO_SHARE_THEIR_SCREEN"), &stru_1E276D870, CFSTR("ChatKit"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v9;
    v21 = 3221225472;
    v22 = __71__CKDetailsController_ContactActions__screenShareContextMenuForEntity___block_invoke_2;
    v23 = &unk_1E274B010;
    objc_copyWeak(&v25, &location);
    v24 = v10;
    objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v14, 0, 0, &v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v30[0] = v11;
    v30[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v16);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v5, v19, v20, v21, v22, v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __71__CKDetailsController_ContactActions__screenShareContextMenuForEntity___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "contactsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startCommunicationForEntity:action:address:", *(_QWORD *)(a1 + 32), 5, 0);

}

void __71__CKDetailsController_ContactActions__screenShareContextMenuForEntity___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "contactsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startCommunicationForEntity:action:address:", *(_QWORD *)(a1 + 32), 6, 0);

}

- (void)openInContacts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  -[CKDetailsController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "defaultIMHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(MEMORY[0x1E0D397A8], "isCNContactAKnownContact:", v6);
  if (!CKIsRunningInMacCatalyst() || v7)
  {
    -[CKDetailsController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController showContactCardForEntity:fromView:](self, "showContactCardForEntity:fromView:", v9, v8);

  }
}

- (id)setupAlternativeCommunicationActionsForChat:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  int v30;
  _BOOL4 v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id location;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];

  v42[2] = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v4 = (void *)objc_opt_new();
  if (CKIsRunningInMacCatalyst()
    || !-[CKDetailsController conversationHasLeft](self, "conversationHasLeft"))
  {
    -[CKDetailsController createAudioCallActionItemForChat:](self, "createAudioCallActionItemForChat:", v36);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsController createVideoCallActionItemForChat:](self, "createVideoCallActionItemForChat:", v36);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v34);
    objc_msgSend(v4, "addObject:", v33);
    v35 = objc_alloc_init(MEMORY[0x1E0C97348]);
    objc_msgSend(MEMORY[0x1E0C97548], "descriptorForRequiredKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v5;
    objc_msgSend(MEMORY[0x1E0C97348], "descriptorForRequiredKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v7 = objc_claimAutoreleasedReturnValue();

    -[CKDetailsController conversation](self, "conversation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chat");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "participants");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    -[CKDetailsController conversation](self, "conversation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", v7, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v13, "contacts");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "mailUrlForContacts:needsEmailAddresses:", v14, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    v31 = v15 != 0;
    v30 = objc_msgSend(v36, "supportsCapabilities:", 0x4000);
    v16 = objc_alloc(MEMORY[0x1E0C974F8]);
    CKFrameworkBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("MAIL_BUTTON_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v13;
    v20 = (void *)v7;
    v21 = v4;
    v22 = *MEMORY[0x1E0C96618];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __83__CKDetailsController_ContactActions__setupAlternativeCommunicationActionsForChat___block_invoke;
    v40[3] = &unk_1E2758460;
    v32 = v15;
    v41 = v32;
    v23 = v22;
    v4 = v21;
    v24 = (void *)objc_msgSend(v16, "initWithTitle:actionType:actionBlock:", v18, v23, v40);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v24, "setShouldOverrideEnabledState:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v24, "setOverrideEnabledState:", v30 & v31);
    objc_msgSend(v21, "addObject:", v24);
    location = 0;
    objc_initWeak(&location, self);
    if (v11 == 1)
    {
      v25 = objc_alloc(MEMORY[0x1E0C974F8]);
      CKFrameworkBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("INFO_BUTTON_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __83__CKDetailsController_ContactActions__setupAlternativeCommunicationActionsForChat___block_invoke_3;
      v37[3] = &unk_1E2758488;
      objc_copyWeak(&v38, &location);
      v28 = (void *)objc_msgSend(v25, "initWithTitle:actionType:systemImageName:overrideEnabledState:actionBlock:", v27, CFSTR("OpenInContacts"), CFSTR("person.crop.circle.fill"), 1, v37);

      objc_msgSend(v28, "setShouldPresentDisambiguationUI:", 0);
      objc_msgSend(v21, "addObject:", v28);

      objc_destroyWeak(&v38);
    }
    objc_destroyWeak(&location);

  }
  return v4;
}

void __83__CKDetailsController_ContactActions__setupAlternativeCommunicationActionsForChat___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__CKDetailsController_ContactActions__setupAlternativeCommunicationActionsForChat___block_invoke_2;
  v4[3] = &unk_1E274A1B8;
  v5 = v3;
  objc_msgSend(v2, "openURL:options:completionHandler:", v5, MEMORY[0x1E0C9AA70], v4);

}

uint64_t __83__CKDetailsController_ContactActions__setupAlternativeCommunicationActionsForChat___block_invoke_2()
{
  uint64_t result;

  result = _IMWillLog();
  if ((_DWORD)result)
    return _IMAlwaysLog();
  return result;
}

void __83__CKDetailsController_ContactActions__setupAlternativeCommunicationActionsForChat___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "openInContacts");

}

- (id)createAudioCallActionItemForChat:(id)a3
{
  id v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  char v22;

  v4 = a3;
  -[CKDetailsController conversation](self, "conversation");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = +[CKFaceTimeUtilities isFaceTimeVideoAvailable:](CKFaceTimeUtilities, "isFaceTimeVideoAvailable:", v5);

  -[CKDetailsController conversation](self, "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "isGroupConversation");

  v8 = v5 ^ 1 | v6;
  if ((v5 & 1) == 0 && !v6)
    v8 = +[CKFaceTimeUtilities isTelephonyAvailable](CKFaceTimeUtilities, "isTelephonyAvailable");
  v9 = objc_msgSend(v4, "supportsCapabilities:", 0x4000) & v8;
  v10 = objc_alloc(MEMORY[0x1E0C974F8]);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "__ck_localizedString:", CFSTR("CALL_BUTTON_TITLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0C965F8];
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __72__CKDetailsController_ContactActions__createAudioCallActionItemForChat___block_invoke;
  v20 = &unk_1E27584B0;
  v22 = v9;
  v14 = v4;
  v21 = v14;
  v15 = (void *)objc_msgSend(v10, "initWithTitle:actionType:actionBlock:", v12, v13, &v17);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v15, "setShouldOverrideEnabledState:", 1, v17, v18, v19, v20);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v15, "setOverrideEnabledState:", v9);

  return v15;
}

uint64_t __72__CKDetailsController_ContactActions__createAudioCallActionItemForChat___block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "initiateTUConversationWithVideoEnabled:", 0);
  return result;
}

- (id)createVideoCallActionItemForChat:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  char v20;

  v4 = a3;
  -[CKDetailsController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[CKFaceTimeUtilities isFaceTimeVideoAvailable:](CKFaceTimeUtilities, "isFaceTimeVideoAvailable:", v5);

  v7 = objc_msgSend(v4, "supportsCapabilities:", 0x4000) & v6;
  v8 = objc_alloc(MEMORY[0x1E0C974F8]);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "__ck_localizedString:", CFSTR("VIDEO_BUTTON_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0C96658];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __72__CKDetailsController_ContactActions__createVideoCallActionItemForChat___block_invoke;
  v18 = &unk_1E27584B0;
  v20 = v7;
  v12 = v4;
  v19 = v12;
  v13 = (void *)objc_msgSend(v8, "initWithTitle:actionType:actionBlock:", v10, v11, &v15);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "setShouldOverrideEnabledState:", 1, v15, v16, v17, v18);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "setOverrideEnabledState:", v7);

  return v13;
}

uint64_t __72__CKDetailsController_ContactActions__createVideoCallActionItemForChat___block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "initiateTUConversationWithVideoEnabled:", 1);
  return result;
}

- (void)showContactCardForEntity:(id)a3 fromView:(id)a4
{
  id v5;
  void *v6;
  CKDetailsController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[CKDetailsController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topViewController");
  v7 = (CKDetailsController *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
  {
    objc_msgSend(MEMORY[0x1E0C974D8], "descriptorForRequiredKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0D397A8];
    objc_msgSend(v5, "defaultIMHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cnContactWithKeys:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "isCNContactAKnownContact:", v12);

    if (v13)
    {
      -[CKDetailsController suggestionsEnabledContactStore](self, "suggestionsEnabledContactStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "defaultIMHandle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "unifiedContactWithIdentifier:keysToFetch:error:", v17, v9, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v5, "cnContactWithKeys:shouldFetchSuggestedContact:", v9, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "defaultIMHandle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "_appearsToBePhoneNumber");
    v22 = (id *)MEMORY[0x1E0C967C0];
    if (!v21)
      v22 = (id *)MEMORY[0x1E0C966A8];
    v23 = *v22;

    if (v13)
      objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForContact:", v18);
    else
      objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForUnknownContact:", v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultIMHandle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "ID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifierForKey:withDestination:", v23, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "highlightPropertyWithKey:identifier:", v23, v27);

    -[CKDetailsController suggestionsEnabledContactStore](self, "suggestionsEnabledContactStore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setContactStore:", v28);

    objc_msgSend(v24, "setActions:", objc_msgSend(v24, "actions") | 0x80);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v24, "setShouldUseModernNavigationBarHiding:", 1);
    if ((CNUIIsMessages() & v13) == 1
      && -[CKDetailsController fmfEnabled](self, "fmfEnabled")
      && !-[CKDetailsController fmfRestricted](self, "fmfRestricted"))
    {
      objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "defaultIMHandle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "handleIsFollowingMyLocation:", v30);

      CKFrameworkBundle();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if ((_DWORD)v31)
        v34 = CFSTR("STOP_SHARE_LOCATION");
      else
        v34 = CFSTR("SHARE_LOCATION");
      objc_msgSend(v32, "localizedStringForKey:value:table:", v34, &stru_1E276D870, CFSTR("ChatKit"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKDetailsController setPresentedEntity:](self, "setPresentedEntity:", v5);
      objc_msgSend(v24, "contentViewController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setShouldShowLinkedContacts:", 1);
      objc_msgSend(v36, "cardFooterGroup");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addActionWithTitle:target:selector:inGroup:destructive:", v35, self, sel__toggleSharingStateFromABCard, v37, v31);

    }
    -[CKDetailsController navigationController](self, "navigationController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "pushViewController:animated:", v24, 1);

  }
}

- (void)_toggleSharingStateFromABCard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id *v43;
  id *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  void *v62;
  _QWORD aBlock[6];

  -[CKDetailsController presentedEntity](self, "presentedEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultIMHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKDetailsController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "handleIsFollowingMyLocation:", v4);

  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__CKDetailsController_ContactActions___toggleSharingStateFromABCard__block_invoke;
  aBlock[3] = &unk_1E274A1B8;
  aBlock[4] = self;
  v46 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CEA2E0];
  CKFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v7)
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("STOP_SHARE_LOCATION"), &stru_1E276D870, CFSTR("ChatKit"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v8;
    v59[1] = 3221225472;
    v59[2] = __68__CKDetailsController_ContactActions___toggleSharingStateFromABCard__block_invoke_2;
    v59[3] = &unk_1E274D070;
    v44 = &v60;
    v60 = v4;
    v43 = &v61;
    v14 = &v62;
    v61 = v45;
    v62 = v46;
    v15 = v46;
    objc_msgSend(v10, "actionWithTitle:style:handler:", v13, 2, v59);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v16);

    v17 = (void *)MEMORY[0x1E0CEA2E0];
    CKFrameworkBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 1, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v20);

  }
  else
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SHARE_LOCATION_ONE_HOUR"), &stru_1E276D870, CFSTR("ChatKit"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v8;
    v55[1] = 3221225472;
    v55[2] = __68__CKDetailsController_ContactActions___toggleSharingStateFromABCard__block_invoke_3;
    v55[3] = &unk_1E274D070;
    v44 = &v56;
    v22 = v4;
    v56 = v22;
    v43 = &v57;
    v23 = v45;
    v57 = v23;
    v24 = v46;
    v58 = v24;
    objc_msgSend(v10, "actionWithTitle:style:handler:", v21, 0, v55);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v25);

    v26 = (void *)MEMORY[0x1E0CEA2E0];
    CKFrameworkBundle();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("SHARE_LOCATION_EOD"), &stru_1E276D870, CFSTR("ChatKit"));
    v42 = v4;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __68__CKDetailsController_ContactActions___toggleSharingStateFromABCard__block_invoke_4;
    v51[3] = &unk_1E274D070;
    v29 = v22;
    v52 = v29;
    v30 = v23;
    v53 = v30;
    v31 = v24;
    v54 = v31;
    objc_msgSend(v26, "actionWithTitle:style:handler:", v28, 0, v51);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v32);

    v33 = (void *)MEMORY[0x1E0CEA2E0];
    CKFrameworkBundle();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("SHARE_INDEFINITELY"), &stru_1E276D870, CFSTR("ChatKit"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __68__CKDetailsController_ContactActions___toggleSharingStateFromABCard__block_invoke_5;
    v47[3] = &unk_1E274D070;
    v48 = v29;
    v49 = v30;
    v50 = v31;
    v36 = v31;
    objc_msgSend(v33, "actionWithTitle:style:handler:", v35, 0, v47);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v37);

    v38 = (void *)MEMORY[0x1E0CEA2E0];
    CKFrameworkBundle();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "actionWithTitle:style:handler:", v40, 1, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v41);

    v14 = &v58;
    v4 = v42;

    v18 = v52;
  }

  -[CKDetailsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

void __68__CKDetailsController_ContactActions___toggleSharingStateFromABCard__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topViewController");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v16;
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((_DWORD)a2)
      v8 = CFSTR("STOP_SHARE_LOCATION");
    else
      v8 = CFSTR("SHARE_LOCATION");
    objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E276D870, CFSTR("ChatKit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "contentViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v10, "cardFooterGroup");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeActionWithTarget:selector:inGroup:", v11, sel__toggleSharingStateFromABCard, v12);

    v13 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v10, "cardFooterGroup");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addActionWithTitle:target:selector:inGroup:destructive:", v9, v13, sel__toggleSharingStateFromABCard, v14, a2);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v5, "popToViewController:animated:", *(_QWORD *)(a1 + 32), 1);
  }

}

uint64_t __68__CKDetailsController_ContactActions___toggleSharingStateFromABCard__block_invoke_2(_QWORD *a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopSharingWithHandle:inChat:", a1[4], a1[5]);

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __68__CKDetailsController_ContactActions___toggleSharingStateFromABCard__block_invoke_3(_QWORD *a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startSharingWithHandle:inChat:withDuration:", a1[4], a1[5], 0);

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __68__CKDetailsController_ContactActions___toggleSharingStateFromABCard__block_invoke_4(_QWORD *a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startSharingWithHandle:inChat:withDuration:", a1[4], a1[5], 1);

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __68__CKDetailsController_ContactActions___toggleSharingStateFromABCard__block_invoke_5(_QWORD *a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startSharingWithHandle:inChat:withDuration:", a1[4], a1[5], 2);

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __56__CKDetailsController__determineFocusStatusSharingState__block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "Error determining if focus status is shared with chat, leaving switch disabled. Error: %@", (uint8_t *)&v3, 0xCu);
}

void __50__CKDetailsController_setShareFocusStatus_reload___block_invoke_359_cold_1()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t v4[14];
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_5();
  v5 = v0;
  v6 = v1;
  v7 = v2;
  _os_log_error_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_ERROR, "Error manually sharing focus with handleID: %@ fromHandleID: %@ error: %@", v4, 0x20u);
}

void __50__CKDetailsController_setShareFocusStatus_reload___block_invoke_361_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_5();
  v3 = v0;
  _os_log_error_impl(&dword_18DFCD000, v1, OS_LOG_TYPE_ERROR, "Error manually unsharing focus with handleID: %@ error: %@", v2, 0x16u);
}

@end
