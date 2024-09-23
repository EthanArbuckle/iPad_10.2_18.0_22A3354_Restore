@implementation HUCameraPresenceRecordingSettingsModule

- (HUCameraPresenceRecordingSettingsModule)initWithItemUpdater:(id)a3 cameraProfiles:(id)a4 presenceEventType:(unint64_t)a5
{
  id v9;
  id v10;
  HUCameraPresenceRecordingSettingsModule *v11;
  uint64_t v12;
  NSSet *cameraProfiles;
  void *v14;
  void *v15;
  uint64_t v16;
  HMHome *home;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v9 = a3;
  v10 = a4;
  if (!objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraPresenceRecordingSettingsModule.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cameraProfiles.count > 0"));

  }
  v25.receiver = self;
  v25.super_class = (Class)HUCameraPresenceRecordingSettingsModule;
  v11 = -[HFItemModule initWithItemUpdater:](&v25, sel_initWithItemUpdater_, v9);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    cameraProfiles = v11->_cameraProfiles;
    v11->_cameraProfiles = (NSSet *)v12;

    v11->_presenceEventType = a5;
    objc_msgSend(v10, "anyObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "accessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "home");
    v16 = objc_claimAutoreleasedReturnValue();
    home = v11->_home;
    v11->_home = (HMHome *)v16;

    if (_os_feature_enabled_impl())
    {
      objc_initWeak(&location, v11);
      v18 = (void *)MEMORY[0x1E0D116A0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __96__HUCameraPresenceRecordingSettingsModule_initWithItemUpdater_cameraProfiles_presenceEventType___block_invoke;
      v22[3] = &unk_1E6F4DD08;
      objc_copyWeak(&v23, &location);
      objc_msgSend(v18, "registerForFeatureChangeNotificationsUsingBlock:", v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraPresenceRecordingSettingsModule setFeatureChangeObserver:](v11, "setFeatureChangeObserver:", v19);

      -[HUCameraPresenceRecordingSettingsModule updatePlanCameraCount](v11, "updatePlanCameraCount");
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
    -[HUCameraPresenceRecordingSettingsModule _buildItemProvider](v11, "_buildItemProvider");
  }

  return v11;
}

void __96__HUCameraPresenceRecordingSettingsModule_initWithItemUpdater_cameraProfiles_presenceEventType___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updatePlanCameraCount");

}

- (HUCameraPresenceRecordingSettingsModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_cameraProfiles_presenceEventType_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraPresenceRecordingSettingsModule.m"), 117, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCameraPresenceRecordingSettingsModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (BOOL)isItemHeader:(id)a3
{
  return 0;
}

- (unint64_t)accessModeSetting
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)MEMORY[0x1E0CBA408];
  -[HUCameraPresenceRecordingSettingsModule cameraProfiles](self, "cameraProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hf_cameraAccessModeSelectedOptionForCameraProfiles:presenceType:", v4, -[HUCameraPresenceRecordingSettingsModule presenceEventType](self, "presenceEventType"));

  return v5;
}

- (id)updateStreamingSetting:(unint64_t)a3 isRetry:(BOOL)a4
{
  int v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[5];
  id v23;
  BOOL v24;
  _QWORD v25[7];
  id v26[2];
  id location;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[3];
  char v33;
  _QWORD v34[4];
  _QWORD block[5];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = _os_feature_enabled_impl();
  v8 = (void *)a3;
  if (a3 == 2
    && v7
    && (-[HUCameraPresenceRecordingSettingsModule home](self, "home"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "hf_currentUserIsAdministrator"),
        v9,
        (v10 & 1) == 0))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke;
    block[3] = &unk_1E6F4D988;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = (void *)objc_opt_new();
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    v34[3] = 0;
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v33 = 0;
    -[HUCameraPresenceRecordingSettingsModule setNumCamerasSupportRecordingService:](self, "setNumCamerasSupportRecordingService:", -[HUCameraPresenceRecordingSettingsModule countCameraProfilesWithRecordingService](self, "countCameraProfilesWithRecordingService"));
    if (!a4)
    {
      -[HUCameraPresenceRecordingSettingsModule setUpgradeState:](self, "setUpgradeState:", 0);
      -[HUCameraPresenceRecordingSettingsModule setOfferState:](self, "setOfferState:", 0);
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[HUCameraPresenceRecordingSettingsModule cameraProfiles](self, "cameraProfiles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_initWeak(&location, self);
          v16 = (void *)MEMORY[0x1E0D519C0];
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke_2;
          v25[3] = &unk_1E6F57500;
          objc_copyWeak(v26, &location);
          v25[4] = v15;
          v25[5] = v34;
          v26[1] = v8;
          v25[6] = v32;
          objc_msgSend(v16, "futureWithBlock:", v25);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v17);

          objc_destroyWeak(v26);
          objc_destroyWeak(&location);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v12);
    }

    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke_2_46;
    v22[3] = &unk_1E6F57528;
    objc_copyWeak(&v23, &location);
    v22[4] = v34;
    v24 = a4;
    objc_msgSend(v18, "addCompletionBlock:", v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v23);

    objc_destroyWeak(&location);
    _Block_object_dispose(v32, 8);
    _Block_object_dispose(v34, 8);

  }
  return v19;
}

uint64_t __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentInsufficientPrivilegesAlert");
}

void __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  __int128 v13;
  id v14[2];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "userSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 64);
  v7 = objc_msgSend(WeakRetained, "presenceEventType");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke_3;
  v10[3] = &unk_1E6F574D8;
  objc_copyWeak(v14, (id *)(a1 + 56));
  v14[1] = *(id *)(a1 + 64);
  v13 = *(_OWORD *)(a1 + 40);
  v8 = v3;
  v9 = *(_QWORD *)(a1 + 32);
  v11 = v8;
  v12 = v9;
  objc_msgSend(v5, "updateAccessMode:forPresenceEventType:completionHandler:", v6, v7, v10);

  objc_destroyWeak(v14);
}

void __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (*(_QWORD *)(a1 + 72) == 2 && objc_msgSend(v3, "code") == 2006)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    objc_msgSend(WeakRetained, "setUpgradeState:", 2);
    goto LABEL_15;
  }
  if (objc_msgSend(v3, "code") == 17)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "Error setting camera streaming setting: %@", buf, 0xCu);
    }

    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke_42;
      v17 = &unk_1E6F4D988;
      v18 = WeakRetained;
      v6 = MEMORY[0x1E0C80D38];
      v7 = &v14;
LABEL_14:
      dispatch_async(v6, v7);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  else if (v3)
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "Error setting camera streaming setting: %@", buf, 0xCu);
    }

    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke_43;
      v12 = &unk_1E6F4D988;
      v13 = WeakRetained;
      v6 = MEMORY[0x1E0C80D38];
      v7 = &v9;
      goto LABEL_14;
    }
  }
LABEL_15:
  objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult", v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
  objc_msgSend(WeakRetained, "_dispatchUpdateForCameraProfile:", *(_QWORD *)(a1 + 40));

}

uint64_t __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke_42(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentInsufficientPrivilegesAlert");
}

uint64_t __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke_43(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentGenericError");
}

void __74__HUCameraPresenceRecordingSettingsModule_updateStreamingSetting_isRetry___block_invoke_2_46(uint64_t a1)
{
  int v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "didCompleteCloudUpgradeOffer") & 1) != 0
    || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    if (objc_msgSend(WeakRetained, "didCompleteCloudUpgradeOffer"))
      objc_msgSend(WeakRetained, "setDidCompleteCloudUpgradeOffer:", 0);
  }
  else
  {
    v2 = _os_feature_enabled_impl();
    objc_msgSend(WeakRetained, "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hf_currentUserIsOwner");

    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (v2)
    {
      if (v4)
      {
        objc_msgSend(WeakRetained, "presentHomeOwnerQuotaAlertForOverflowCount:", v5);
        goto LABEL_11;
      }
    }
    else if (v4)
    {
      objc_msgSend(WeakRetained, "presentCloudUpgradeFlowWithCameraCount:", v5);
      goto LABEL_11;
    }
    objc_msgSend(WeakRetained, "presentSharedAdminQuotaAlertForCount:", v5);
  }
LABEL_11:
  if (!*(_BYTE *)(a1 + 48))
  {
    v6 = WeakRetained;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      goto LABEL_14;
    objc_msgSend(WeakRetained, "setUpgradeState:", 1);
  }
  objc_msgSend(WeakRetained, "sendCAMetricInfo");
  v6 = WeakRetained;
LABEL_14:
  objc_msgSend(v6, "clearLoadingIndicator");

}

- (void)clearLoadingIndicator
{
  dispatch_time_t v3;
  _QWORD block[4];
  id v5[2];
  id location;

  objc_initWeak(&location, self);
  v3 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__HUCameraPresenceRecordingSettingsModule_clearLoadingIndicator__block_invoke;
  block[3] = &unk_1E6F4E870;
  objc_copyWeak(v5, &location);
  v5[1] = (id)a2;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __64__HUCameraPresenceRecordingSettingsModule_clearLoadingIndicator__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_clearItemsUpdating");
  objc_msgSend(WeakRetained, "itemProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0D314C0]);
  objc_msgSend(WeakRetained, "itemProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithItemProviders:items:senderSelector:", v5, v3, *(_QWORD *)(a1 + 40));

  objc_msgSend(WeakRetained, "itemUpdater");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "performItemUpdateRequest:", v6);

}

- (void)updatePlanCameraCount
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id buf[2];

  -[HUCameraPresenceRecordingSettingsModule home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPresenceRecordingSettingsModule home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "hf_userIsOwner:", v5);

  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) != 0)
  {
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "User is owner, checking CloudSubscriptionFeatures for camera numbers.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v9 = (void *)MEMORY[0x1E0D116A0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__HUCameraPresenceRecordingSettingsModule_updatePlanCameraCount__block_invoke;
    v10[3] = &unk_1E6F57550;
    objc_copyWeak(&v11, buf);
    objc_msgSend(v9, "requestFeatureWithId:completion:", CFSTR("home.cameras"), v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
  else
  {
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "User is not owner, skipping CloudSubscriptionFeatures check.", (uint8_t *)buf, 2u);
    }

  }
}

void __64__HUCameraPresenceRecordingSettingsModule_updatePlanCameraCount__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  int v19;
  id v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v19 = 138412290;
      v20 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_ERROR, "Camera count request error:%@", (uint8_t *)&v19, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v5, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(WeakRetained, "currentPlanCameraCount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");
    objc_msgSend(v5, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 >= objc_msgSend(v12, "integerValue"))
      v13 = 0;
    else
      v13 = objc_msgSend(WeakRetained, "pendingUpgradeRequest");

    objc_msgSend(v5, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    objc_msgSend(WeakRetained, "setCurrentPlanCameraCount:", v15);

    goto LABEL_15;
  }
  if (objc_msgSend(v5, "status") == 2)
  {
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "FeatureStatusUnavailable setting Current plan camera count to 0", (uint8_t *)&v19, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    goto LABEL_14;
  }
  v13 = 0;
LABEL_15:
  HFLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "currentPlanCameraCount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v17;
    v21 = 1024;
    v22 = v13;
    _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "Current plan camera count = %@ needsRetry:%{BOOL}d", (uint8_t *)&v19, 0x12u);

  }
  if (v13)
  {
    objc_msgSend(WeakRetained, "setPendingUpgradeRequest:", 0);
    v18 = (id)objc_msgSend(WeakRetained, "updateStreamingSetting:isRetry:", 2, 1);
  }

}

- (void)_presentCloudUpgradeFlowWithCameraCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "upgradeURLForCameraCount:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUCameraPresenceRecordingSettingsModule setPendingUpgradeRequest:](self, "setPendingUpgradeRequest:", 1);
  if (_os_feature_enabled_impl())
  {
    if (objc_msgSend(MEMORY[0x1E0CA58E0], "isCurrentProcessAnApplicationExtension"))
    {
      NSLog(CFSTR("We are currently unable to launch the upgrade flow from an extension.  Please reach out to me if this becomes a need."));
    }
    else
    {
      HFLogForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = v7;
        _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "Launching cloud upgrade flow for url:%@", (uint8_t *)&v10, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CEA2F8], "performSelector:", sel_sharedApplication);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "openURL:withCompletionHandler:", v7, 0);

    }
  }

}

- (void)presentCloudUpgradeFlowWithCameraCount:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  uint8_t buf[8];
  uint64_t v15;
  Class (*v16)(uint64_t);
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v5 = (void *)_MergedGlobals_3_6;
  v22 = _MergedGlobals_3_6;
  v6 = MEMORY[0x1E0C809B0];
  if (!_MergedGlobals_3_6)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __getICQOfferManagerClass_block_invoke;
    v17 = &unk_1E6F4C868;
    v18 = &v19;
    __getICQOfferManagerClass_block_invoke((uint64_t)buf);
    v5 = (void *)v20[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v19, 8);
  v8 = objc_alloc_init(v7);
  v23[0] = CFSTR("cameraCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = CFSTR("appContext");
  v24[0] = v9;
  v10 = *MEMORY[0x1E0D306E8];
  v24[1] = *MEMORY[0x1E0D306E8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_INFO, "ICQOfferManager getting current offer from freshmint service", buf, 2u);
  }

  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __82__HUCameraPresenceRecordingSettingsModule_presentCloudUpgradeFlowWithCameraCount___block_invoke;
  v13[3] = &unk_1E6F57578;
  v13[4] = self;
  objc_msgSend(v8, "getOfferForBundleIdentifier:offerContext:completion:", v10, v11, v13);

}

void __82__HUCameraPresenceRecordingSettingsModule_presentCloudUpgradeFlowWithCameraCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setOfferState:", 2);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __82__HUCameraPresenceRecordingSettingsModule_presentCloudUpgradeFlowWithCameraCount___block_invoke_2;
    v11[3] = &unk_1E6F4C638;
    v8 = v5;
    v9 = *(_QWORD *)(a1 + 32);
    v12 = v8;
    v13 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
  else if (v6)
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_error_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_ERROR, "ICQOfferManager: there was an error getting the current offer: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setOfferState:", 1);
    objc_msgSend(*(id *)(a1 + 32), "sendCAMetricInfo");
  }

}

void __82__HUCameraPresenceRecordingSettingsModule_presentCloudUpgradeFlowWithCameraCount___block_invoke_2(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v2 = (void *)qword_1EF226B00;
  v20 = qword_1EF226B00;
  if (!qword_1EF226B00)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __getICQUpgradeFlowOptionsClass_block_invoke;
    v15 = &unk_1E6F4C868;
    v16 = &v17;
    __getICQUpgradeFlowOptionsClass_block_invoke((uint64_t)&v12);
    v2 = (void *)v18[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v17, 8);
  v4 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setButtonTintColor:", v5);

  objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNavigationBarTintColor:", v6);

  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v7 = (void *)qword_1EF226B08;
  v20 = qword_1EF226B08;
  if (!qword_1EF226B08)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __getICQUpgradeFlowManagerClass_block_invoke;
    v15 = &unk_1E6F4C868;
    v16 = &v17;
    __getICQUpgradeFlowManagerClass_block_invoke((uint64_t)&v12);
    v7 = (void *)v18[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v17, 8);
  v9 = (void *)objc_msgSend([v8 alloc], "initWithOffer:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v9, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v9, "setFlowOptions:", v4);
  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_INFO, "ICQUpgradeFlowManager presenting current offer UI", (uint8_t *)&v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "beginFlowWithPresentingViewController:", v11);

}

- (void)presentInsufficientPrivilegesAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0CEA2E8];
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingSettingsInsufficientPermissionsAlert_Title"), CFSTR("HUCameraRecordingSettingsInsufficientPermissionsAlert_Title"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingSettingsInsufficientPermissionsAlert_Message"), CFSTR("HUCameraRecordingSettingsInsufficientPermissionsAlert_Message"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v8);

  -[HUCameraPresenceRecordingSettingsModule presentingViewController](self, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentViewController:animated:completion:", v10, 1, 0);

}

+ (id)upgradeURLForCameraCount:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%d"), CFSTR("https://icq.icloud.com/?context=aUNsb3VkU3Vic2NyaXB0aW9uX2NvbS5hcHBsZS5ob21lS2l0X2NhbWVyYVNldHRpbmdz&cameraCount="), objc_msgSend(a3, "intValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)titleForQuotaAlertForCameraCount:(id)a3
{
  uint64_t v3;
  const __CFString *v4;
  __CFString *v5;

  v3 = objc_msgSend(a3, "integerValue");
  v4 = CFSTR("HUCameraRecordingSettingsInsufficientQuotaMultipleAlert_Title");
  if (v3 == 1)
    v4 = CFSTR("HUCameraRecordingSettingsInsufficientQuotaOneAlert_Title");
  if (v3)
    v5 = (__CFString *)v4;
  else
    v5 = CFSTR("HUCameraRecordingSettingsInsufficientQuotaNoneAlert_Title");
  _HULocalizedStringWithDefaultValue(v5, v5, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)messageForQuotaAlertForCameraCount:(id)a3
{
  id v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "integerValue");
  if (v5 == 1)
  {
    v6 = CFSTR("HUCameraRecordingSettingsInsufficientQuotaOneAlert_Message");
  }
  else
  {
    if (v5)
    {
      objc_msgSend(a1, "stringFromNumber:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUCameraRecordingSettingsInsufficientQuotaMultipleAlert_Message"), CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v6 = CFSTR("HUCameraRecordingSettingsInsufficientQuotaNoneAlert_Message");
  }
  _HULocalizedStringWithDefaultValue(v6, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v7;
}

+ (id)titleForHomeOwnerQuotaAlertForCameraCount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  objc_msgSend(a1, "stringFromNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "capitalizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "integerValue");
  HULocalizedStringWithFormat(CFSTR("HUCameraRecordingSettingsInsufficientQuotaHomeOwnerAlert_Title"), CFSTR("%lu"), v8, v9, v10, v11, v12, v13, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "rangeOfCharacterFromSet:", v15);
  v18 = v17;

  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v14, "stringByReplacingCharactersInRange:withString:", v16, v18, v6);
    v19 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v19;
  }

  return v14;
}

+ (id)stringFromNumber:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB37F0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setNumberStyle:", 5);
  objc_msgSend(v5, "stringFromNumber:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)messageForHomeOwnerQuotaAlertForCameraCount:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = objc_msgSend(a3, "integerValue");
  return HULocalizedStringWithFormat(CFSTR("HUCameraRecordingSettingsInsufficientQuotaHomeOwnerAlert_Message"), CFSTR("%lu"), v4, v5, v6, v7, v8, v9, v3);
}

- (void)presentHomeOwnerQuotaAlertForOverflowCount:(int64_t)a3
{
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
  _QWORD v19[4];
  id v20[2];
  id location;

  -[HUCameraPresenceRecordingSettingsModule clearLoadingIndicator](self, "clearLoadingIndicator");
  v5 = (void *)objc_opt_class();
  -[HUCameraPresenceRecordingSettingsModule currentPlanCameraCount](self, "currentPlanCameraCount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleForHomeOwnerQuotaAlertForCameraCount:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_class();
  -[HUCameraPresenceRecordingSettingsModule currentPlanCameraCount](self, "currentPlanCameraCount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageForHomeOwnerQuotaAlertForCameraCount:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v7, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v12 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUUpgradeNowTitle"), CFSTR("HUUpgradeNowTitle"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __86__HUCameraPresenceRecordingSettingsModule_presentHomeOwnerQuotaAlertForOverflowCount___block_invoke;
  v19[3] = &unk_1E6F575A0;
  objc_copyWeak(v20, &location);
  v20[1] = (id)a3;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAction:", v14);
  v15 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v17);

  -[HUCameraPresenceRecordingSettingsModule presentingViewController](self, "presentingViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "presentViewController:animated:completion:", v11, 1, 0);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

}

void __86__HUCameraPresenceRecordingSettingsModule_presentHomeOwnerQuotaAlertForOverflowCount___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_presentCloudUpgradeFlowWithCameraCount:", *(_QWORD *)(a1 + 40));

}

- (void)presentSharedAdminQuotaAlertForCount:(unint64_t)a3
{
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
  id v15;

  -[HUCameraPresenceRecordingSettingsModule clearLoadingIndicator](self, "clearLoadingIndicator");
  v5 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleForQuotaAlertForCameraCount:", v6);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageForQuotaAlertForCameraCount:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v15, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v13);

  -[HUCameraPresenceRecordingSettingsModule presentingViewController](self, "presentingViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentViewController:animated:completion:", v10, 1, 0);

}

- (void)presentGenericError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0CEA2E8];
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraStreamingSettingsGenericErrorTitle"), CFSTR("HUCameraStreamingSettingsGenericErrorTitle"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraStreamingSettingsGenericErrorDescription"), CFSTR("HUCameraStreamingSettingsGenericErrorDescription"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v8);

  -[HUCameraPresenceRecordingSettingsModule presentingViewController](self, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentViewController:animated:completion:", v10, 1, 0);

}

- (void)presentMissingSupportedHubAlert
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[HUCameraPresenceRecordingSettingsModule home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "residentDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    v6 = CFSTR("HUCameraRecordingSettingsUnsupportedHomeHub_Title");
  else
    v6 = CFSTR("HUHomeHubRequiredTitle");
  if (v5)
    v7 = CFSTR("HUCameraRecordingSettingsUnsupportedHomeHub_Message");
  else
    v7 = CFSTR("HUCameraRecordingSettingsNoHomeHub_Message");
  _HULocalizedStringWithDefaultValue(v6, v6, 1);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(v7, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v14, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v12);

  -[HUCameraPresenceRecordingSettingsModule presentingViewController](self, "presentingViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentViewController:animated:completion:", v9, 1, 0);

}

- (void)_clearItemsUpdating
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HUCameraPresenceRecordingSettingsModule itemProvider](self, "itemProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        v10 = v9;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
        v12 = v11;

        objc_msgSend(v12, "setUpdateInProgress:", 0, (_QWORD)v13);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)_dispatchUpdateForCameraProfile:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__HUCameraPresenceRecordingSettingsModule__dispatchUpdateForCameraProfile___block_invoke;
  v6[3] = &unk_1E6F575C8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "dispatchCameraObserverMessage:sender:", v6, 0);

}

void __75__HUCameraPresenceRecordingSettingsModule__dispatchUpdateForCameraProfile___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "userSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cameraUserSettingsDidUpdate:", v4);

}

- (id)_titleString
{
  __CFString *v2;

  if (-[HUCameraPresenceRecordingSettingsModule presenceEventType](self, "presenceEventType") == 4)
    v2 = CFSTR("HUCameraStreamingSettingsModuleNoOneHomeSettings");
  else
    v2 = CFSTR("HUCameraStreamingSettingsModuleAnybodyHomeSettings");
  _HULocalizedStringWithDefaultValue(v2, v2, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)didSelectItem:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HUCameraPresenceRecordingSettingsModule home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hf_hasCameraRecordingResident");

  if ((v7 & 1) == 0)
  {
    HFLogForCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      -[HUCameraPresenceRecordingSettingsModule home](self, "home");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraPresenceRecordingSettingsModule home](self, "home");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "residentDevices");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412546;
      v30 = v25;
      v31 = 2112;
      v32 = v27;
      _os_log_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_INFO, "Expected a camera recording resident, but none found. Home: %@ Residents: %@", (uint8_t *)&v29, 0x16u);

    }
    -[HUCameraPresenceRecordingSettingsModule presentMissingSupportedHubAlert](self, "presentMissingSupportedHubAlert");
    goto LABEL_10;
  }
  objc_msgSend(v5, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HUCameraSettingResultKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  -[HUCameraPresenceRecordingSettingsModule _clearItemsUpdating](self, "_clearItemsUpdating");
  -[HUCameraPresenceRecordingSettingsModule recordingSettingItemProvider](self, "recordingSettingItemProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v5);

  if (!v13)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_opt_class();
  v14 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  objc_msgSend(v16, "setUpdateInProgress:", 1);
  v17 = objc_alloc(MEMORY[0x1E0D314C0]);
  -[HUCameraPresenceRecordingSettingsModule itemProviders](self, "itemProviders");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithItemProviders:items:senderSelector:", v18, v19, a2);

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v21, "performItemUpdateRequest:", v20);

  -[HUCameraPresenceRecordingSettingsModule updateStreamingSetting:isRetry:](self, "updateStreamingSetting:isRetry:", v10, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v23;
}

- (id)itemProviders
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUCameraPresenceRecordingSettingsModule itemProvider](self, "itemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_buildItemProvider
{
  id v3;
  HFItem *v4;
  HFItem *showOptionsItem;
  HUCameraUsageOptionItemProvider *v6;
  unint64_t v7;
  void *v8;
  HUCameraUsageOptionItemProvider *v9;
  void *v10;
  id v11;
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
  uint64_t v22;
  id (*v23)(uint64_t);
  void *v24;
  id v25;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0D31840]);
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __61__HUCameraPresenceRecordingSettingsModule__buildItemProvider__block_invoke;
  v24 = &unk_1E6F4C4E8;
  objc_copyWeak(&v25, &location);
  v4 = (HFItem *)objc_msgSend(v3, "initWithResultsBlock:", &v21);
  showOptionsItem = self->_showOptionsItem;
  self->_showOptionsItem = v4;

  v6 = [HUCameraUsageOptionItemProvider alloc];
  v7 = -[HUCameraPresenceRecordingSettingsModule presenceEventType](self, "presenceEventType", v21, v22, v23, v24);
  -[HUCameraPresenceRecordingSettingsModule cameraProfiles](self, "cameraProfiles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HUCameraUsageOptionItemProvider initWithPresenceEventType:cameraProfiles:](v6, "initWithPresenceEventType:cameraProfiles:", v7, v8);
  -[HUCameraPresenceRecordingSettingsModule setRecordingSettingItemProvider:](self, "setRecordingSettingItemProvider:", v9);

  -[HUCameraPresenceRecordingSettingsModule recordingSettingItemProvider](self, "recordingSettingItemProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "reloadItems");

  -[HUCameraPresenceRecordingSettingsModule recordingSettingItemProvider](self, "recordingSettingItemProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPresenceRecordingSettingsModule setOptionItems:](self, "setOptionItems:", v14);

  v15 = (void *)MEMORY[0x1E0C99E60];
  -[HUCameraPresenceRecordingSettingsModule optionItems](self, "optionItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPresenceRecordingSettingsModule showOptionsItem](self, "showOptionsItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setByAddingObject:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v19);
  -[HUCameraPresenceRecordingSettingsModule setItemProvider:](self, "setItemProvider:", v20);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

id __61__HUCameraPresenceRecordingSettingsModule__buildItemProvider__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(WeakRetained, "_titleString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D30D18]);

    objc_msgSend(WeakRetained, "accessModeSetting");
    HFLocalizedStringFromHMCameraAccessMode();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30BF8]);

    objc_msgSend(WeakRetained, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hf_currentUserIsAdministrator");
    v7 = MEMORY[0x1E0C9AAB0];
    if (v6)
      v8 = MEMORY[0x1E0C9AAA0];
    else
      v8 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30C80]);

    objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30C88]);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0D519C0];
    v13 = *MEMORY[0x1E0D30D70];
    v14[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "futureWithResult:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D31570]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), -[HUCameraPresenceRecordingSettingsModule presenceEventType](self, "presenceEventType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:", v6);

  v8 = (void *)MEMORY[0x1E0C99DE8];
  -[HUCameraPresenceRecordingSettingsModule showOptionsItem](self, "showOptionsItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HUExpandableItemModule showOptions](self, "showOptions"))
  {
    -[HUCameraPresenceRecordingSettingsModule optionItems](self, "optionItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_142);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addObjectsFromArray:", v12);
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__HUCameraPresenceRecordingSettingsModule_buildSectionsWithDisplayedItems___block_invoke_3;
  v17[3] = &unk_1E6F4DAD8;
  v18 = v4;
  v13 = v4;
  objc_msgSend(v10, "na_filter:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItems:", v14);

  v19[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __75__HUCameraPresenceRecordingSettingsModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v4 = a3;
  objc_msgSend(a2, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D30DA8];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D30DA8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v10 = -1;
  else
    v10 = v9 != 0;
  if (v7)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (!v11)
    v10 = objc_msgSend(v7, "compare:", v9);

  return v10;
}

uint64_t __75__HUCameraPresenceRecordingSettingsModule_buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (NSString)longestCameraUsageOptionItemTitle
{
  NSString **p_longestCameraUsageOptionItemTitle;
  NSString *longestCameraUsageOptionItemTitle;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  p_longestCameraUsageOptionItemTitle = &self->_longestCameraUsageOptionItemTitle;
  longestCameraUsageOptionItemTitle = self->_longestCameraUsageOptionItemTitle;
  if (longestCameraUsageOptionItemTitle)
    return longestCameraUsageOptionItemTitle;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__19;
  v13 = __Block_byref_object_dispose__19;
  v14 = 0;
  -[HUCameraPresenceRecordingSettingsModule recordingSettingItemProvider](self, "recordingSettingItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__HUCameraPresenceRecordingSettingsModule_longestCameraUsageOptionItemTitle__block_invoke;
  v8[3] = &unk_1E6F57610;
  v8[4] = &v9;
  objc_msgSend(v6, "na_each:", v8);

  objc_storeStrong((id *)p_longestCameraUsageOptionItemTitle, (id)v10[5]);
  v7 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSString *)v7;
}

void __76__HUCameraPresenceRecordingSettingsModule_longestCameraUsageOptionItemTitle__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  id obj;

  objc_msgSend(a2, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v4 = obj;
  if (obj)
  {
    v5 = objc_msgSend(obj, "length");
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "length");
    v4 = obj;
    if (v5 > v6)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
      v4 = obj;
    }
  }

}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_INFO, "ICQUpgradeFlowManager did cancel upgrade flow", buf, 2u);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[HUCameraPresenceRecordingSettingsModule cameraProfiles](self, "cameraProfiles", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[HUCameraPresenceRecordingSettingsModule _dispatchUpdateForCameraProfile:](self, "_dispatchUpdateForCameraProfile:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

  -[HUCameraPresenceRecordingSettingsModule sendCAMetricInfo](self, "sendCAMetricInfo");
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  NSObject *v4;
  id v5;
  uint8_t v6[16];

  -[HUCameraPresenceRecordingSettingsModule setDidCompleteCloudUpgradeOffer:](self, "setDidCompleteCloudUpgradeOffer:", 1);
  -[HUCameraPresenceRecordingSettingsModule setUpgradeState:](self, "setUpgradeState:", 3);
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_INFO, "ICQUpgradeFlowManager did complete upgrade flow", v6, 2u);
  }

  v5 = -[HUCameraPresenceRecordingSettingsModule updateStreamingSetting:isRetry:](self, "updateStreamingSetting:isRetry:", 2, 1);
}

- (unint64_t)countCameraProfilesWithRecordingService
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HUCameraPresenceRecordingSettingsModule cameraProfiles](self, "cameraProfiles", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "hf_supportsRecordingEvents");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)sendCAMetricInfo
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[3];
  uint8_t buf[4];
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    v12 = -[HUCameraPresenceRecordingSettingsModule numCamerasSupportRecordingService](self, "numCamerasSupportRecordingService");
    v13 = 2048;
    v14 = -[HUCameraPresenceRecordingSettingsModule offerState](self, "offerState");
    v15 = 2048;
    v16 = -[HUCameraPresenceRecordingSettingsModule upgradeState](self, "upgradeState");
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_INFO, "[Core-Analytics iCloud Upgrade Metric Info] numCamerasSupportRecording: %lu offerState: %lu iCloudUpgradeState: %lu", buf, 0x20u);
  }

  v4 = (void *)MEMORY[0x1E0D31170];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HUCameraPresenceRecordingSettingsModule numCamerasSupportRecordingService](self, "numCamerasSupportRecordingService", *MEMORY[0x1E0D30428]));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v9[1] = *MEMORY[0x1E0D30430];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HUCameraPresenceRecordingSettingsModule offerState](self, "offerState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  v9[2] = *MEMORY[0x1E0D30470];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HUCameraPresenceRecordingSettingsModule upgradeState](self, "upgradeState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEvent:withData:", 2, v8);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (_os_feature_enabled_impl())
  {
    v3 = (void *)MEMORY[0x1E0D116A0];
    -[HUCameraPresenceRecordingSettingsModule featureChangeObserver](self, "featureChangeObserver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unregisterForFeatureChangeNotificationsUsingObserver:", v4);

  }
  v5.receiver = self;
  v5.super_class = (Class)HUCameraPresenceRecordingSettingsModule;
  -[HUCameraPresenceRecordingSettingsModule dealloc](&v5, sel_dealloc);
}

- (id)showOptionsItem
{
  return self->_showOptionsItem;
}

- (NSSet)cameraProfiles
{
  return self->_cameraProfiles;
}

- (unint64_t)presenceEventType
{
  return self->_presenceEventType;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (HUCameraUsageOptionItemProvider)recordingSettingItemProvider
{
  return self->_recordingSettingItemProvider;
}

- (void)setRecordingSettingItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_recordingSettingItemProvider, a3);
}

- (HFStaticItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_itemProvider, a3);
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (NSArray)optionItems
{
  return self->_optionItems;
}

- (void)setOptionItems:(id)a3
{
  objc_storeStrong((id *)&self->_optionItems, a3);
}

- (BOOL)didCompleteCloudUpgradeOffer
{
  return self->_didCompleteCloudUpgradeOffer;
}

- (void)setDidCompleteCloudUpgradeOffer:(BOOL)a3
{
  self->_didCompleteCloudUpgradeOffer = a3;
}

- (unint64_t)upgradeState
{
  return self->_upgradeState;
}

- (void)setUpgradeState:(unint64_t)a3
{
  self->_upgradeState = a3;
}

- (unint64_t)offerState
{
  return self->_offerState;
}

- (void)setOfferState:(unint64_t)a3
{
  self->_offerState = a3;
}

- (unint64_t)numCamerasSupportRecordingService
{
  return self->_numCamerasSupportRecordingService;
}

- (void)setNumCamerasSupportRecordingService:(unint64_t)a3
{
  self->_numCamerasSupportRecordingService = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (NSNumber)currentPlanCameraCount
{
  return self->_currentPlanCameraCount;
}

- (void)setCurrentPlanCameraCount:(id)a3
{
  objc_storeStrong((id *)&self->_currentPlanCameraCount, a3);
}

- (FeatureChangeObserver)featureChangeObserver
{
  return self->_featureChangeObserver;
}

- (void)setFeatureChangeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_featureChangeObserver, a3);
}

- (BOOL)pendingUpgradeRequest
{
  return self->_pendingUpgradeRequest;
}

- (void)setPendingUpgradeRequest:(BOOL)a3
{
  self->_pendingUpgradeRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureChangeObserver, 0);
  objc_storeStrong((id *)&self->_currentPlanCameraCount, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_optionItems, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_recordingSettingItemProvider, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_cameraProfiles, 0);
  objc_storeStrong((id *)&self->_longestCameraUsageOptionItemTitle, 0);
  objc_storeStrong((id *)&self->_showOptionsItem, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
