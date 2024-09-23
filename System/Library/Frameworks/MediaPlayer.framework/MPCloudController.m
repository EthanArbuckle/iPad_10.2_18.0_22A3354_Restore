@implementation MPCloudController

- (BOOL)hasProperNetworkConditionsToShowCloudMedia
{
  return -[ICCloudAvailability hasProperNetworkConditionsToShowCloudMedia](self->_cloudAvailabilityController, "hasProperNetworkConditionsToShowCloudMedia");
}

- (BOOL)isEnhancedAudioAvailable
{
  return CFPreferencesGetAppBooleanValue(CFSTR("EnhancedAudioAvailable"), CFSTR("com.apple.mobileipod"), 0) != 0;
}

- (BOOL)shouldProhibitMusicActionForCurrentNetworkConditions
{
  return -[ICCloudAvailability shouldProhibitMusicActionForCurrentNetworkConditions](self->_cloudAvailabilityController, "shouldProhibitMusicActionForCurrentNetworkConditions");
}

- (BOOL)canShowCloudDownloadButtons
{
  return -[ICCloudAvailability canShowCloudDownloadButtons](self->_cloudAvailabilityController, "canShowCloudDownloadButtons");
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPCloudController;
  -[MPCloudController description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0DDC108], "canAccessAccountStore"))
  {
    -[MPCloudController userIdentity](self, "userIdentity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" [%@]"), v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

+ (MPCloudController)controllerWithUserIdentity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 138543618;
    v11 = a1;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_INFO, "%{public}@ - Request for a controller with user identity %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsMultipleITunesAccounts");

  if ((v7 & 1) != 0)
    +[MPCloudController _controllerWithUserIdentity:createIfRequired:](MPCloudController, "_controllerWithUserIdentity:createIfRequired:", v4, 1);
  else
    +[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPCloudController *)v8;
}

+ (MPCloudController)sharedCloudController
{
  if (sharedCloudController_onceToken != -1)
    dispatch_once(&sharedCloudController_onceToken, &__block_literal_global_78_34914);
  return (MPCloudController *)(id)sharedCloudController___controller;
}

- (BOOL)canShowCloudVideo
{
  return -[ICCloudAvailability canShowCloudVideo](self->_cloudAvailabilityController, "canShowCloudVideo");
}

- (BOOL)canShowCloudMusic
{
  return -[ICCloudAvailability canShowCloudMusic](self->_cloudAvailabilityController, "canShowCloudMusic");
}

- (BOOL)isEnablingCloudLibraryDestructive
{
  void *v2;
  uint64_t v3;
  void *v4;
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
  void *v16;
  char v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  -[MPCloudController userIdentity](self, "userIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v2);
  v3 = objc_claimAutoreleasedReturnValue();

  +[MPMediaQuery songsQuery](MPMediaQuery, "songsQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMediaLibrary:", v3);
  v17 = 1;
  objc_msgSend(v4, "setIgnoreSystemFilterPredicates:", 1);
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", &unk_1E31E4D38, CFSTR("purchaseHistoryID"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addFilterPredicate:", v5);

  +[MPMediaQuery playlistsQuery](MPMediaQuery, "playlistsQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)v3;
  objc_msgSend(v6, "setMediaLibrary:", v3);
  objc_msgSend(v6, "setIgnoreSystemFilterPredicates:", 1);
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", &unk_1E31E4D38, CFSTR("distinguishedKind"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", &unk_1E31E4D50, CFSTR("distinguishedKind"), 102);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", &unk_1E31E4D68, CFSTR("distinguishedKind"), 104);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaCompoundPredicate predicateMatchingPredicates:](MPMediaCompoundAllPredicate, "predicateMatchingPredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaCompoundPredicate predicateMatchingPredicates:](MPMediaCompoundAnyPredicate, "predicateMatchingPredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addFilterPredicate:", v13);
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", MEMORY[0x1E0C9AAA0], CFSTR("isHidden"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addFilterPredicate:", v14);

  if ((objc_msgSend(v4, "_hasItems") & 1) == 0)
    v17 = objc_msgSend(v6, "_hasCollections");

  return v17;
}

- (BOOL)isUpdateInProgress
{
  -[MPCloudController _initializeUpdateInProgressState](self, "_initializeUpdateInProgressState");
  return self->_cloudLibraryUpdateInProgress || self->_jaliscoUpdateInProgress;
}

- (BOOL)isInitialImport
{
  -[MPCloudController _initializeUpdateInProgressState](self, "_initializeUpdateInProgressState");
  return self->_cloudLibraryInitialImport || self->_jaliscoInitialImport;
}

- (void)updateJaliscoMediaLibraryWithReason:(int64_t)a3 completionHandler:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  -[MPCloudController cloudClient](self, "cloudClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = 6;
    if (a3 != 1)
      v8 = 0;
    if (a3)
      v9 = v8;
    else
      v9 = 3;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCloudController.m"), 1366, CFSTR("Invalid update reason: %ld"), a3);

    }
    -[MPCloudController cloudClient](self, "cloudClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateJaliscoLibraryWithReason:completionHandler:", v9, v13);

    goto LABEL_12;
  }
  v11 = v13;
  if (v13)
  {
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
LABEL_12:
    v11 = v13;
  }

}

- (BOOL)isCloudLibraryEnabled
{
  -[MPCloudController _updateSagaEnabled](self, "_updateSagaEnabled");
  return self->_cloudEnabled;
}

- (BOOL)_updateSagaEnabled
{
  NSObject *v3;
  _BOOL4 cloudEnabled;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  int v12;
  int v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  _BOOL4 cloudEnabledValid;
  _BOOL4 v19;
  _BOOL4 v20;
  NSObject *cloudClientCallbackQueue;
  _BOOL4 v22;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  MPCloudController *v27;
  __int16 v28;
  _WORD v29[9];

  *(_QWORD *)&v29[5] = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    cloudEnabled = self->_cloudEnabled;
    *(_DWORD *)buf = 138543618;
    v27 = self;
    v28 = 1024;
    *(_DWORD *)v29 = cloudEnabled;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - _updateSagaEnabled: - loading cloud library enabled state [current cloudEnabled=%{BOOL}u]", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCloudController userIdentity](self, "userIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v5, "getPropertiesForUserIdentity:error:", v6, &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;

  if (!v8)
  {
    os_unfair_lock_lock(&self->_lock);
    if (v7)
      v12 = objc_msgSend(v7, "isActiveLocker");
    else
      v12 = 0;
    v13 = self->_cloudEnabled;
    if (v13 == v12)
    {
      v14 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v27 = self;
        v15 = "%{public}@ - _updateSagaEnabled: - no change in cloud library enabled state";
        v16 = v14;
        v17 = 12;
LABEL_19:
        _os_log_impl(&dword_193B9B000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
      }
    }
    else
    {
      self->_cloudEnabled = v12;
      cloudEnabledValid = self->_cloudEnabledValid;
      v14 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
      v19 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (cloudEnabledValid)
      {
        if (v19)
        {
          v20 = self->_cloudEnabled;
          *(_DWORD *)buf = 138543874;
          v27 = self;
          v28 = 1024;
          *(_DWORD *)v29 = v13;
          v29[2] = 1024;
          *(_DWORD *)&v29[3] = v20;
          _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - _updateSagaEnabled: - Cloud library enabled state did change [%{BOOL}u -> %{BOOL}u] - Posting notifications [MPCloudControllerIsCloudEnabledDidChangeNotification]", buf, 0x18u);
        }

        -[MPCloudController _initializeUpdateInProgressState](self, "_initializeUpdateInProgressState");
        cloudClientCallbackQueue = self->_cloudClientCallbackQueue;
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __39__MPCloudController__updateSagaEnabled__block_invoke;
        v24[3] = &unk_1E3163508;
        v24[4] = self;
        dispatch_async(cloudClientCallbackQueue, v24);
        v11 = 1;
        goto LABEL_21;
      }
      if (v19)
      {
        v22 = self->_cloudEnabled;
        *(_DWORD *)buf = 138543618;
        v27 = self;
        v28 = 1024;
        *(_DWORD *)v29 = v22;
        v15 = "%{public}@ - _updateSagaEnabled: - loaded initial cloud library enabled state [cloudEnabled=%{BOOL}u]";
        v16 = v14;
        v17 = 18;
        goto LABEL_19;
      }
    }

    v11 = 0;
LABEL_21:
    self->_cloudEnabledValid = 1;
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_22;
  }
  v9 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v8, "msv_description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = self;
    v28 = 2114;
    *(_QWORD *)v29 = v10;
    _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_ERROR, "%{public}@ _updateSagaEnabled Failed to load account properties error=%{public}@", buf, 0x16u);

  }
  v11 = 0;
LABEL_22:

  return v11;
}

_QWORD *__51__MPCloudController__becomeActiveAndWaitUntilDone___block_invoke(uint64_t a1)
{
  _QWORD *result;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  char v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  result = *(_QWORD **)(a1 + 32);
  if (!result[7])
  {
    v3 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - _becomeActiveAndWaitUntilDone: - Activating", (uint8_t *)&v7, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
    objc_msgSend(*(id *)(a1 + 32), "cloudClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "becomeActive");

    v6 = objc_msgSend(*(id *)(a1 + 32), "_updateSagaEnabled");
    result = *(_QWORD **)(a1 + 32);
    if ((v6 & 1) == 0)
    {
      objc_msgSend(result, "_initializeUpdateInProgressState");
      result = *(_QWORD **)(a1 + 32);
    }
  }
  ++result[7];
  return result;
}

- (void)_initializeUpdateInProgressState
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, char, char);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  MPCloudController *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[MPCloudController isCloudEnabled](self, "isCloudEnabled"))
  {
    -[MPCloudController cloudClient](self, "cloudClient");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateSagaInProgressChangedHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v24 = self;
        _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - _initializeUpdateInProgressState - Setting up Saga update progress handler", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __53__MPCloudController__initializeUpdateInProgressState__block_invoke;
      v21[3] = &unk_1E315D4A0;
      objc_copyWeak(&v22, (id *)buf);
      v6 = (void *)MEMORY[0x19403A810](v21);
      -[MPCloudController cloudClient](self, "cloudClient");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "loadIsSagaUpdateInProgressWithCompletionHandler:", v6);

      -[MPCloudController cloudClient](self, "cloudClient");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setUpdateSagaInProgressChangedHandler:", v6);

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
  }
  -[MPCloudController cloudClient](self, "cloudClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateJaliscoInProgressChangedHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (v11)
  {
    v12 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = self;
      _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - _initializeUpdateInProgressState - Setting up Jalisco update progress handler", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __53__MPCloudController__initializeUpdateInProgressState__block_invoke_179;
    v19 = &unk_1E315D4A0;
    objc_copyWeak(&v20, (id *)buf);
    v13 = (void *)MEMORY[0x19403A810](&v16);
    -[MPCloudController cloudClient](self, "cloudClient", v16, v17, v18, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "loadIsJaliscoUpdateInProgressWithCompletionHandler:", v13);

    -[MPCloudController cloudClient](self, "cloudClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setUpdateJaliscoInProgressChangedHandler:", v13);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
}

- (ICUserIdentity)userIdentity
{
  void *v2;
  void *v3;
  void *v4;

  -[MPCloudController cloudClient](self, "cloudClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICUserIdentity *)v4;
}

- (ICCloudClient)cloudClient
{
  return self->_cloudClient;
}

- (BOOL)isCloudEnabled
{
  return self->_cloudEnabled;
}

- (BOOL)isJaliscoUpdateInProgress
{
  -[MPCloudController _initializeUpdateInProgressState](self, "_initializeUpdateInProgressState");
  return self->_jaliscoUpdateInProgress;
}

- (void)setJaliscoInitialImport:(BOOL)a3
{
  self->_jaliscoInitialImport = a3;
}

- (void)setJaliscoUpdateInProgress:(BOOL)a3
{
  self->_jaliscoUpdateInProgress = a3;
}

- (BOOL)isJaliscoInitialImport
{
  -[MPCloudController _initializeUpdateInProgressState](self, "_initializeUpdateInProgressState");
  return self->_jaliscoInitialImport;
}

+ (void)_postNotificationName:(id)a3 controller:(id)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    v10 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = v8;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - Posting notification [%@]", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", v7, v8);

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__MPCloudController__postNotificationName_controller_userInfo___block_invoke;
    v13[3] = &unk_1E315D240;
    v14 = v7;
    objc_msgSend(v8, "_performBlockOnControllerHandlingTheSameAccount:", v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:userInfo:", v7, 0, v9);

  }
}

- (void)_performBlockOnControllerHandlingTheSameAccount:(id)a3
{
  void *v4;
  int v5;
  MPCloudController *v6;
  MPCloudController *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  MPCloudController *v11;
  void *v12;
  void *v13;
  void (**v14)(id, void *);

  v14 = (void (**)(id, void *))a3;
  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsMultipleITunesAccounts");

  if (v5)
  {
    +[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController");
    v6 = (MPCloudController *)objc_claimAutoreleasedReturnValue();
    if (v6 == self)
    {

    }
    else
    {
      v7 = v6;
      +[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[MPCloudController _handlesSameAccountAs:](self, "_handlesSameAccountAs:", v8);

      if (v9)
      {
        +[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
          goto LABEL_10;
        goto LABEL_9;
      }
    }
    +[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController");
    v11 = (MPCloudController *)objc_claimAutoreleasedReturnValue();

    if (v11 == self)
    {
      +[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "userIdentity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPCloudController _controllerWithUserIdentity:createIfRequired:](MPCloudController, "_controllerWithUserIdentity:createIfRequired:", v13, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
LABEL_9:
        v14[2](v14, v10);

      }
    }
  }
LABEL_10:

}

+ (void)_postNotificationName:(id)a3 controller:(id)a4
{
  +[MPCloudController _postNotificationName:controller:userInfo:](MPCloudController, "_postNotificationName:controller:userInfo:", a3, a4, 0);
}

void __42__MPCloudController_sharedCloudController__block_invoke()
{
  id v0;
  void *v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = -[MPCloudController _initWithUserIdentity:]([MPCloudController alloc], "_initWithUserIdentity:", 0);
  v1 = (void *)sharedCloudController___controller;
  sharedCloudController___controller = (uint64_t)v0;

  v2 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138543362;
    v4 = sharedCloudController___controller;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - Singleton", (uint8_t *)&v3, 0xCu);
  }

}

- (id)_initWithUserIdentity:(id)a3
{
  id v4;
  MPCloudController *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *serialQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *cloudClientCallbackQueue;
  void *v11;
  uint64_t v12;
  ICCloudClient *cloudClient;
  uint64_t v14;
  ICCloudAvailability *cloudAvailabilityController;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v23;
  __CFNotificationCenter *v24;
  __CFNotificationCenter *v25;
  __CFNotificationCenter *v26;
  __CFNotificationCenter *v27;
  __CFNotificationCenter *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  MSVDistributedNotificationObserver *addToPlaylistBehaviorChangedObserver;
  uint64_t v34;
  MSVDistributedNotificationObserver *favoriteSongAddToLibraryBehaviorChangedObserver;
  void *v36;
  uint64_t v37;
  void *v38;
  objc_super v40;
  uint8_t buf[4];
  MPCloudController *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)MPCloudController;
  v5 = -[MPCloudController init](&v40, sel_init);
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v42 = v5;
      v43 = 2112;
      v44 = v4;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ - Creating new controller for user identity %@", buf, 0x16u);
    }

    v7 = dispatch_queue_create("com.apple.mediaplayer.MPCloudController.serial.queue", 0);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.mediaplayer.MPCloudController.cloudClient.callback.queue", 0);
    cloudClientCallbackQueue = v5->_cloudClientCallbackQueue;
    v5->_cloudClientCallbackQueue = (OS_dispatch_queue *)v9;

    v5->_lock._os_unfair_lock_opaque = 0;
    if (v4)
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDBF38]), "initWithUserIdentity:", v4);
    else
      v11 = 0;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DDBF10]), "initWithConfiguration:", v11);
    cloudClient = v5->_cloudClient;
    v5->_cloudClient = (ICCloudClient *)v12;

    if (+[MPCloudController isMediaApplication](MPCloudController, "isMediaApplication"))
    {
      objc_msgSend(MEMORY[0x1E0DDBF08], "sharedController");
      v14 = objc_claimAutoreleasedReturnValue();
      cloudAvailabilityController = v5->_cloudAvailabilityController;
      v5->_cloudAvailabilityController = (ICCloudAvailability *)v14;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObserver:selector:name:object:", v5, sel_canShowCloudDownloadButtonsDidChangeNotification_, *MEMORY[0x1E0DDBC98], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObserver:selector:name:object:", v5, sel_canShowCloudTracksDidChangeNotification_, *MEMORY[0x1E0DDBCA0], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObserver:selector:name:object:", v5, sel_isCellularDataRestrictedDidChangeNotification_, *MEMORY[0x1E0DDBCB0], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObserver:selector:name:object:", v5, sel_hasProperNetworkConditionsToShowCloudMediaDidChangeNotification_, *MEMORY[0x1E0DDBCA8], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObserver:selector:name:object:", v5, sel_hasProperNetworkConditionsToShowCloudMediaDidChangeNotification_, *MEMORY[0x1E0DDBCB8], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObserver:selector:name:object:", v5, sel_enableICMLErrorReasonChange_, *MEMORY[0x1E0DDBCD0], 0);

    }
    else
    {
      objc_storeStrong((id *)&v5->_cloudAvailabilityController, v5->_cloudClient);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)__MPCloudControllerReceivedRemoteNotification, (CFStringRef)*MEMORY[0x1E0DDBC98], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v23 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v23, v5, (CFNotificationCallback)__MPCloudControllerReceivedRemoteNotification, (CFStringRef)*MEMORY[0x1E0DDBCA0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v24 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v24, v5, (CFNotificationCallback)__MPCloudControllerReceivedRemoteNotification, (CFStringRef)*MEMORY[0x1E0DDBCB0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v25 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v25, v5, (CFNotificationCallback)__MPCloudControllerReceivedRemoteNotification, (CFStringRef)*MEMORY[0x1E0DDBCA8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v26 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v26, v5, (CFNotificationCallback)__MPCloudControllerReceivedRemoteNotification, (CFStringRef)*MEMORY[0x1E0DDBCD0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    v27 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v27, v5, (CFNotificationCallback)__MPCloudControllerReceivedRemoteNotification, (CFStringRef)*MEMORY[0x1E0DDBCE0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v28 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v28, v5, (CFNotificationCallback)__MPCloudControllerReceivedRemoteNotification, (CFStringRef)*MEMORY[0x1E0DDBCF8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v29 = (void *)MEMORY[0x1E0D4D068];
    v30 = *MEMORY[0x1E0DDBCC0];
    dispatch_get_global_queue(0, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "observerWithDistributedName:localName:queue:", v30, CFSTR("MPCloudControllerCloudAddToPlaylistBehaviorDidChangeNotification"), v31);
    v32 = objc_claimAutoreleasedReturnValue();
    addToPlaylistBehaviorChangedObserver = v5->_addToPlaylistBehaviorChangedObserver;
    v5->_addToPlaylistBehaviorChangedObserver = (MSVDistributedNotificationObserver *)v32;

    objc_msgSend(MEMORY[0x1E0D4D068], "observerWithDistributedName:localName:queue:", *MEMORY[0x1E0DDBCC8], CFSTR("MPCloudControllerCloudFavoriteSongAddToLibraryBehaviorDidChangeNotification"), v31);
    v34 = objc_claimAutoreleasedReturnValue();
    favoriteSongAddToLibraryBehaviorChangedObserver = v5->_favoriteSongAddToLibraryBehaviorChangedObserver;
    v5->_favoriteSongAddToLibraryBehaviorChangedObserver = (MSVDistributedNotificationObserver *)v34;

    if (objc_msgSend(MEMORY[0x1E0DDC108], "canAccessAccountStore"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = *MEMORY[0x1E0DDBC38];
      objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addObserver:selector:name:object:", v5, sel_activeUserDidChangeNotification_, v37, v38);

    }
  }

  return v5;
}

+ (BOOL)isMediaApplication
{
  if (isMediaApplication_onceToken != -1)
    dispatch_once(&isMediaApplication_onceToken, &__block_literal_global_50_34916);
  return isMediaApplication_isMediaApplication;
}

- (BOOL)hasProperNetworkConditionsToPlayMedia
{
  return -[ICCloudAvailability hasProperNetworkConditionsToPlayMedia](self->_cloudAvailabilityController, "hasProperNetworkConditionsToPlayMedia");
}

- (void)becomeActive
{
  -[MPCloudController becomeActiveAndWaitUntilDone:](self, "becomeActiveAndWaitUntilDone:", 0);
}

+ (void)migrateCellularDataPreferencesIfNeeded
{
  ICCloudClientMigrateAllowMatchOnCellularToAllowAutoDownloadOnCellular();
  ICCloudClientMigrateStoreAllowAutomaticDownloadsOnCellularToMusicAllowDownloadOnCellular();
}

void __39__MPCloudController_isMediaApplication__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  isMediaApplication_isMediaApplication = objc_msgSend(&unk_1E31E6250, "containsObject:", v1);
}

- (void)becomeActiveAndWaitUntilDone:(BOOL)a3
{
  _BOOL8 v3;
  MPCloudController *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  NSObject *v10;
  _QWORD v11[4];
  BOOL v12;
  _QWORD block[4];
  BOOL v14;

  v3 = a3;
  +[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController");
  v5 = (MPCloudController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    -[MPCloudController _becomeActiveAndWaitUntilDone:](self, "_becomeActiveAndWaitUntilDone:", v3);
    objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsMultipleITunesAccounts");

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isAudioAccessory");

      if (v9)
      {
        +[MPCloudController globalSerialQueue](MPCloudController, "globalSerialQueue");
        v10 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __50__MPCloudController_becomeActiveAndWaitUntilDone___block_invoke;
        block[3] = &__block_descriptor_33_e5_v8__0l;
        v14 = v3;
        dispatch_sync(v10, block);

      }
      else
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __50__MPCloudController_becomeActiveAndWaitUntilDone___block_invoke_3;
        v11[3] = &__block_descriptor_33_e27_v16__0__MPCloudController_8l;
        v12 = v3;
        -[MPCloudController _performBlockOnControllerHandlingTheSameAccount:](self, "_performBlockOnControllerHandlingTheSameAccount:", v11);
      }
    }
  }
}

- (void)_becomeActiveAndWaitUntilDone:(BOOL)a3
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MPCloudController__becomeActiveAndWaitUntilDone___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (MPCloudController)init
{
  return (MPCloudController *)-[MPCloudController _initWithUserIdentity:](self, "_initWithUserIdentity:", 0);
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  if (+[MPCloudController isMediaApplication](MPCloudController, "isMediaApplication"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

  }
  else
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  }
  v5.receiver = self;
  v5.super_class = (Class)MPCloudController;
  -[MPCloudController dealloc](&v5, sel_dealloc);
}

- (void)canShowCloudDownloadButtonsDidChangeNotification:(id)a3
{
  +[MPCloudController _postNotificationName:controller:](MPCloudController, "_postNotificationName:controller:", CFSTR("MPCloudControllerCanShowCloudDownloadButtonsDidChangeNotification"), 0);
}

- (void)canShowCloudTracksDidChangeNotification:(id)a3
{
  +[MPCloudController _postNotificationName:controller:](MPCloudController, "_postNotificationName:controller:", CFSTR("MPCloudControllerCanShowCloudTracksDidChangeNotification"), 0);
}

- (void)hasProperNetworkConditionsToShowCloudMediaDidChangeNotification:(id)a3
{
  +[MPCloudController _postNotificationName:controller:](MPCloudController, "_postNotificationName:controller:", CFSTR("MPCloudControllerHasProperNetworkConditionsToShowCloudMediaDidChangeNotification"), 0);
}

- (void)isCellularDataRestrictedDidChangeNotification:(id)a3
{
  +[MPCloudController _postNotificationName:controller:](MPCloudController, "_postNotificationName:controller:", CFSTR("MPCloudControllerIsCellularDataRestrictedDidChangeNotification"), 0);
}

- (void)activeUserDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  MPCloudController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_INFO, "%{public}@ - Received notification [%{public}@]", (uint8_t *)&v7, 0x16u);

  }
  -[MPCloudController _updateSagaEnabled](self, "_updateSagaEnabled");

}

- (void)enableICMLErrorReasonChange:(id)a3
{
  +[MPCloudController _postNotificationName:controller:userInfo:](MPCloudController, "_postNotificationName:controller:userInfo:", CFSTR("MPCloudControllerCloudLibraryFailureDidChangeNotification"), self, 0);
}

- (ICConnectionConfiguration)configuration
{
  void *v2;
  void *v3;

  -[MPCloudController cloudClient](self, "cloudClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICConnectionConfiguration *)v3;
}

- (BOOL)isCellularDataRestrictedForMusic
{
  return -[ICCloudAvailability isCellularDataRestrictedForMusic](self->_cloudAvailabilityController, "isCellularDataRestrictedForMusic");
}

- (BOOL)isCellularDataRestrictedForVideos
{
  return -[ICCloudAvailability isCellularDataRestrictedForVideos](self->_cloudAvailabilityController, "isCellularDataRestrictedForVideos");
}

- (BOOL)shouldProhibitVideosActionForCurrentNetworkConditions
{
  return -[ICCloudAvailability shouldProhibitVideosActionForCurrentNetworkConditions](self->_cloudAvailabilityController, "shouldProhibitVideosActionForCurrentNetworkConditions");
}

- (BOOL)isCellularDataRestrictedForStoreApps
{
  return -[ICCloudAvailability isCellularDataRestrictedForStoreApps](self->_cloudAvailabilityController, "isCellularDataRestrictedForStoreApps");
}

- (BOOL)shouldProhibitStoreAppsActionForCurrentNetworkConditions
{
  return -[ICCloudAvailability shouldProhibitStoreAppsActionForCurrentNetworkConditions](self->_cloudAvailabilityController, "shouldProhibitStoreAppsActionForCurrentNetworkConditions");
}

- (BOOL)canDefaultMediaLibraryShowCloudContent
{
  void *v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;

  +[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cloudFilteringType");

  if (v4 == 4)
    return -[MPCloudController canShowCloudMusic](self, "canShowCloudMusic");
  +[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "cloudFilteringType");

  return v7 == 5 && -[MPCloudController canShowCloudVideo](self, "canShowCloudVideo");
}

- (BOOL)hasCloudLockerAccount
{
  -[MPCloudController _updateSagaEnabled](self, "_updateSagaEnabled");
  return self->_cloudEnabled;
}

- (BOOL)hasPurchaseHistoryAccount
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  id v11;
  uint8_t buf[4];
  MPCloudController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCloudController userIdentity](self, "userIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v3, "getPropertiesForUserIdentity:error:", v4, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;

  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "msv_description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "%{public}@ hasPurchaseHistoryAccount Failed to load account properties error=%{public}@", buf, 0x16u);

    }
  }
  else if (v5)
  {
    v9 = objc_msgSend(v5, "isActive");
    goto LABEL_8;
  }
  v9 = 0;
LABEL_8:

  return v9;
}

- (void)updateSubscribedPlaylistWithSagaID:(unint64_t)a3 ignoreMinRefreshInterval:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v5 = a4;
  v12[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[MPCloudController cloudClient](self, "cloudClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateSubscribedPlaylistsWithSagaIDs:ignoreMinRefreshInterval:completionHandler:", v11, v5, v8);

}

- (void)createPlaylistWithPersistentID:(unint64_t)a3 properties:(id)a4 trackList:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v10 = a6;
  v11 = a5;
  _ML3CollectionPropertiesFromMPMediaItemColectionProperties(a4);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[MPCloudController cloudClient](self, "cloudClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ICCloudItemIDList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "createPlaylistWithPersistentID:properties:trackList:completionHandler:", a3, v14, v13, v10);
}

- (void)sdk_createPlaylistWithPersistenID:(unint64_t)a3 properties:(id)a4 tracklist:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v10 = a6;
  v11 = a5;
  _ML3CollectionPropertiesFromMPMediaItemColectionProperties(a4);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[MPCloudController cloudClient](self, "cloudClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ICCloudItemIDList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "sdk_createPlaylistWithPersistentID:properties:tracklist:completionHandler:", a3, v14, v13, v10);
}

- (void)addGeniusPlaylistWithPersistentID:(unint64_t)a3 name:(id)a4 seedItemSagaIDs:(id)a5 itemSagaIDs:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  -[MPCloudController cloudClient](self, "cloudClient");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addGeniusPlaylistWithPersistentID:name:seedItemSagaIDs:itemSagaIDs:completionHandler:", a3, v15, v14, v13, v12);

}

- (BOOL)canSetPlaylistProperty:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = canSetPlaylistProperty__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&canSetPlaylistProperty__onceToken, &__block_literal_global_121_34861);
  v5 = objc_msgSend((id)canSetPlaylistProperty____containerProperties, "containsObject:", v4);

  return v5;
}

- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistWithPersistentID:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  MPCloudController *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("dateModified"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MPCloudController _setDateModified:forPlaylistPersistentID:](self, "_setDateModified:forPlaylistPersistentID:", v13, a5);
  _ML3CollectionPropertiesFromMPMediaItemColectionProperties(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __99__MPCloudController_setPlaylistProperties_trackList_forPlaylistWithPersistentID_completionHandler___block_invoke;
  v19[3] = &unk_1E315D290;
  v19[4] = self;
  v19[5] = &v20;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v19);
  if (!*((_BYTE *)v21 + 24))
  {

    v15 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(0, "allKeys");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = self;
      v26 = 2112;
      v27 = v16;
      _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - Skipping all properties for setPlaylistProperties:trackList:forPlaylist:completionHandler: %@", buf, 0x16u);

    }
    v14 = 0;
  }
  -[MPCloudController cloudClient](self, "cloudClient");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ICCloudItemIDList");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPlaylistProperties:trackList:forPlaylistPersistentID:completionHandler:", v14, v18, a5, v11);

  _Block_object_dispose(&v20, 8);
}

- (void)sdk_setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistWithPersistentID:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  MPCloudController *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("dateModified"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MPCloudController _setDateModified:forPlaylistPersistentID:](self, "_setDateModified:forPlaylistPersistentID:", v13, a5);
  _ML3CollectionPropertiesFromMPMediaItemColectionProperties(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __103__MPCloudController_sdk_setPlaylistProperties_trackList_forPlaylistWithPersistentID_completionHandler___block_invoke;
  v19[3] = &unk_1E315D290;
  v19[4] = self;
  v19[5] = &v20;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v19);
  if (!*((_BYTE *)v21 + 24))
  {

    v15 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(0, "allKeys");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = self;
      v26 = 2112;
      v27 = v16;
      _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - Skipping all properties for setPlaylistProperties:trackList:forPlaylist:completionHandler: %@", buf, 0x16u);

    }
    v14 = 0;
  }
  -[MPCloudController cloudClient](self, "cloudClient");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ICCloudItemIDList");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sdk_setPlaylistProperties:trackList:forPlaylistPersistentID:completionHandler:", v14, v18, a5, v11);

  _Block_object_dispose(&v20, 8);
}

- (void)addStoreItemWithAdamID:(int64_t)a3 toPlaylistWithPersistentID:(unint64_t)a4 completionHandler:(id)a5
{
  -[MPCloudController addStoreItemWithAdamID:referralObject:toPlaylistWithPersistentID:completionHandler:](self, "addStoreItemWithAdamID:referralObject:toPlaylistWithPersistentID:completionHandler:", a3, 0, a4, a5);
}

- (void)addStoreItemWithAdamID:(int64_t)a3 referralObject:(id)a4 toPlaylistWithPersistentID:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v10 = a6;
  if (-[MPCloudController _isCollaborativePlaylist:](self, "_isCollaborativePlaylist:", a5))
  {
    -[MPCloudController _addItemWithAdamID:toCollaborationWithPersistentID:completionHandler:](self, "_addItemWithAdamID:toCollaborationWithPersistentID:completionHandler:", a3, a5, v10);
  }
  else
  {
    -[MPCloudController cloudClient](self, "cloudClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCloudController _referralForModelObject:](self, "_referralForModelObject:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addStoreItemWithAdamID:referral:toPlaylistWithPersistentID:completionHandler:", a3, v12, a5, v10);

  }
}

- (void)addItemWithSagaID:(unint64_t)a3 toPlaylistWithPersistentID:(unint64_t)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;

  v9 = a5;
  if (-[MPCloudController _isCollaborativePlaylist:](self, "_isCollaborativePlaylist:", a4))
  {
    -[MPCloudController _addItemWithSagaID:toCollaborationWithPersistentID:completionHandler:](self, "_addItemWithSagaID:toCollaborationWithPersistentID:completionHandler:", a3, a4, v9);
  }
  else
  {
    -[MPCloudController cloudClient](self, "cloudClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addItemWithSagaID:toPlaylistWithPersistentID:completionHandler:", a3, a4, v9);

  }
}

- (void)sdk_addStoreItemWithOpaqueID:(id)a3 toPlaylistWithPersistentID:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  v9 = a5;
  if (-[MPCloudController _isCollaborativePlaylist:](self, "_isCollaborativePlaylist:", a4))
  {
    v10 = objc_msgSend(v8, "msv_unsignedLongLongValue");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __95__MPCloudController_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke;
    v12[3] = &unk_1E31624C0;
    v13 = v9;
    -[MPCloudController _addItemWithAdamID:toCollaborationWithPersistentID:completionHandler:](self, "_addItemWithAdamID:toCollaborationWithPersistentID:completionHandler:", v10, a4, v12);

  }
  else
  {
    -[MPCloudController cloudClient](self, "cloudClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sdk_addStoreItemWithOpaqueID:toPlaylistWithPersistentID:completionHandler:", v8, a4, v9);

  }
}

- (void)sdk_addItemWithSagaID:(unint64_t)a3 toPlaylistWithPersistentID:(unint64_t)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;

  v9 = a5;
  if (-[MPCloudController _isCollaborativePlaylist:](self, "_isCollaborativePlaylist:", a4))
  {
    -[MPCloudController _addItemWithSagaID:toCollaborationWithPersistentID:completionHandler:](self, "_addItemWithSagaID:toCollaborationWithPersistentID:completionHandler:", a3, a4, v9);
  }
  else
  {
    -[MPCloudController cloudClient](self, "cloudClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sdk_addItemWithSagaID:toPlaylistWithPersistentID:completionHandler:", a3, a4, v9);

  }
}

- (void)uploadCloudPlaylistProperties
{
  id v2;

  -[MPCloudController cloudClient](self, "cloudClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uploadCloudPlaylistProperties");

}

- (void)removePlaylistsWithSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MPCloudController cloudClient](self, "cloudClient");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removePlaylistsWithSagaIDs:completionHandler:", v7, v6);

}

- (void)publishPlaylistWithSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[MPCloudController cloudClient](self, "cloudClient");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "publishPlaylistWithSagaID:completionHandler:", a3, v6);

}

- (void)uploadArtworkForPlaylist:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[MPCloudController cloudClient](self, "cloudClient");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "persistentID");

  objc_msgSend(v9, "uploadArtworkForPlaylistWithPersistentID:completionHandler:", v8, v6);
}

- (void)favoriteEntityWithPersistentID:(int64_t)a3 storeID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;

  v12 = a7;
  v13 = a6;
  -[MPCloudController cloudClient](self, "cloudClient");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "favoriteEntityWithPersistentID:storeID:entityType:time:completionHandler:", a3, a4, -[MPCloudController _icFavoriteEntityTypeFromMPEntityType:](self, "_icFavoriteEntityTypeFromMPEntityType:", a5), v13, v12);

}

- (void)favoritePlaylistWithPersistentID:(int64_t)a3 globalID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[MPCloudController cloudClient](self, "cloudClient");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "favoritePlaylistWithPersistentID:globalID:time:completionHandler:", a3, v12, v11, v10);

}

- (void)favoriteAlbumWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[MPCloudController cloudClient](self, "cloudClient");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "favoriteAlbumWithPersistentID:cloudLibraryID:time:completionHandler:", a3, v12, v11, v10);

}

- (void)favoriteArtistWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[MPCloudController cloudClient](self, "cloudClient");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "favoriteArtistWithPersistentID:cloudLibraryID:time:completionHandler:", a3, v12, v11, v10);

}

- (void)favoriteEntityWithPersistentID:(int64_t)a3 sagaID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;

  v12 = a7;
  v13 = a6;
  -[MPCloudController cloudClient](self, "cloudClient");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "favoriteEntityWithPersistentID:sagaID:entityType:time:completionHandler:", a3, a4, -[MPCloudController _icFavoriteEntityTypeFromMPEntityType:](self, "_icFavoriteEntityTypeFromMPEntityType:", a5), v13, v12);

}

- (void)beginCollaborationUsingPlaylistWithPersistentID:(int64_t)a3 sharingMode:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[MPCloudController cloudClient](self, "cloudClient");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "beginCollaborationUsingPlaylistWithPersistentID:sharingMode:completion:", a3, a4, v8);

}

- (void)endCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[MPCloudController cloudClient](self, "cloudClient");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endCollaborationWithPersistentID:completion:", a3, v6);

}

- (void)editCollaborationWithPersistentID:(int64_t)a3 properties:(id)a4 trackEdits:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;

  v10 = a6;
  v11 = a5;
  _ML3CollectionPropertiesFromMPMediaItemColectionProperties(a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[MPCloudController cloudClient](self, "cloudClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "editCollaborationWithPersistentID:properties:trackEdits:completion:", a3, v13, v11, v10);

}

- (void)joinCollaborationWithGlobalPlaylistID:(id)a3 invitationURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MPCloudController cloudClient](self, "cloudClient");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "joinCollaborationWithGlobalPlaylistID:invitationURL:completion:", v10, v9, v8);

}

- (void)respondToPendingCollaborator:(id)a3 onCollaborationWithPersistentID:(int64_t)a4 withApproval:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;

  v6 = a5;
  v10 = a6;
  v11 = a3;
  -[MPCloudController cloudClient](self, "cloudClient");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "respondToPendingCollaborator:onCollaborationWithPersistentID:withApproval:completion:", v11, a4, v6, v10);

}

- (void)removeCollaborators:(id)a3 fromCollaborationWithPersistentID:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[MPCloudController cloudClient](self, "cloudClient");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeCollaborators:fromCollaborationWithPersistentID:completion:", v9, a4, v8);

}

- (void)updateSharingMode:(int64_t)a3 onCollaboratinWithPersistentID:(int64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[MPCloudController cloudClient](self, "cloudClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0D50930];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "editCollaborationWithPersistentID:properties:trackEdits:completion:", a4, v11, MEMORY[0x1E0C9AA60], v8);

}

- (void)resetInvitationURLForCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[MPCloudController cloudClient](self, "cloudClient");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetInvitationURLForCollaborationWithPersistentID:completion:", a3, v6);

}

- (BOOL)canSetItemProperty:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = canSetItemProperty__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&canSetItemProperty__onceToken, &__block_literal_global_130);
  v5 = objc_msgSend((id)canSetItemProperty____itemProperties, "containsObject:", v4);

  return v5;
}

- (void)setItemProperties:(id)a3 forSagaID:(unint64_t)a4
{
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint8_t buf[4];
  MPCloudController *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _ML3TrackPropertiesFromMPMediaItemProperties(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__MPCloudController_setItemProperties_forSagaID___block_invoke;
  v9[3] = &unk_1E315D290;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);
  if (*((_BYTE *)v11 + 24))
  {
    -[MPCloudController cloudClient](self, "cloudClient");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject setItemProperties:forSagaID:](v7, "setItemProperties:forSagaID:", v6, a4);
  }
  else
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "allKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = self;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - Skipping all properties for setItemProperties:forSagaID: %@", buf, 0x16u);

    }
  }

  _Block_object_dispose(&v10, 8);
}

- (void)uploadCloudItemProperties
{
  id v2;

  -[MPCloudController cloudClient](self, "cloudClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uploadCloudItemProperties");

}

- (void)setCollectionProperties:(id)a3 forCollectionWithPersistentID:(int64_t)a4 groupingType:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = (void (**)(_QWORD, _QWORD))v11;
  if (a5 == 1)
  {
    _ML3CollectionPropertiesFromMPMediaItemColectionProperties(v10);
    v13 = objc_claimAutoreleasedReturnValue();

    -[MPCloudController cloudClient](self, "cloudClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAlbumProperties:forAlbumPersistentID:completionHandler:", v13, a4, v12);

    v10 = (id)v13;
  }
  else if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot set cloud properties for groupingType=%ld properties=%@"), a5, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2938];
    v20[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("MPCloudControllerErrorDomain"), 1010102, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v12)[2](v12, v18);

  }
}

- (void)setAlbumProperties:(id)a3 forEntityWithPersistentID:(int64_t)a4 cloudLibraryID:(id)a5 completionHandler:(id)a6
{
  id v9;
  void *v10;
  id v11;

  v9 = a6;
  _ML3CollectionPropertiesFromMPMediaItemColectionProperties(a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[MPCloudController cloudClient](self, "cloudClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlbumEntityProperties:forAlbumPersistentID:completionHandler:", v11, a4, v9);

}

- (void)setAlbumArtistProperties:(id)a3 forEntityWithPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a5;
  _ML3CollectionPropertiesFromMPMediaItemColectionProperties(a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MPCloudController cloudClient](self, "cloudClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlbumArtistProperties:forAlbumArtistPersistentID:completionHandler:", v10, a4, v8);

}

- (void)addStoreItemWithAdamID:(int64_t)a3 completionHandler:(id)a4
{
  -[MPCloudController addStoreItemWithAdamID:referralObject:completionHandler:](self, "addStoreItemWithAdamID:referralObject:completionHandler:", a3, 0, a4);
}

- (void)addStoreItemWithAdamID:(int64_t)a3 referralObject:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a4;
  -[MPCloudController cloudClient](self, "cloudClient");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[MPCloudController _referralForModelObject:](self, "_referralForModelObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addStoreItemWithAdamID:referral:completionHandler:", a3, v10, v8);
}

- (void)sdk_addStoreItemWithOpaqueID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MPCloudController cloudClient](self, "cloudClient");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sdk_addStoreItemWithOpaqueID:completionHandler:", v7, v6);

}

- (void)addStorePlaylistWithGlobalID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MPCloudController cloudClient](self, "cloudClient");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addStorePlaylistWithGlobalID:completionHandler:", v7, v6);

}

- (void)removeItemsWithSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MPCloudController cloudClient](self, "cloudClient");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeItemsWithSagaIDs:completionHandler:", v7, v6);

}

- (void)loadArtworkForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 artworkSourceType:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;
  int64_t v20;

  v12 = a7;
  dispatch_get_global_queue(0, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __113__MPCloudController_loadArtworkForEntityPersistentID_entityType_artworkType_artworkSourceType_completionHandler___block_invoke;
  v15[3] = &unk_1E315D2C8;
  v15[4] = self;
  v16 = v12;
  v17 = a4;
  v18 = a3;
  v19 = a5;
  v20 = a6;
  v14 = v12;
  dispatch_async(v13, v15);

}

- (void)loadArtworkInfoForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 artworkSourceType:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;
  int64_t v20;

  v12 = a7;
  dispatch_get_global_queue(0, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __117__MPCloudController_loadArtworkInfoForEntityPersistentID_entityType_artworkType_artworkSourceType_completionHandler___block_invoke;
  v15[3] = &unk_1E315D2C8;
  v15[4] = self;
  v16 = v12;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v14 = v12;
  dispatch_async(v13, v15);

}

- (void)deprioritizeArtworkRequestForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 artworkSourceType:(int64_t)a6
{
  NSObject *v11;
  _QWORD block[9];

  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__MPCloudController_deprioritizeArtworkRequestForEntityPersistentID_entityType_artworkType_artworkSourceType___block_invoke;
  block[3] = &unk_1E315D318;
  block[4] = self;
  block[5] = a4;
  block[6] = a3;
  block[7] = a5;
  block[8] = a6;
  dispatch_async(v11, block);

}

- (void)resignActive
{
  MPCloudController *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  NSObject *v8;

  +[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController");
  v3 = (MPCloudController *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    -[MPCloudController _resignActive](self, "_resignActive");
    objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "supportsMultipleITunesAccounts");

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isAudioAccessory");

      if (v7)
      {
        +[MPCloudController globalSerialQueue](MPCloudController, "globalSerialQueue");
        v8 = objc_claimAutoreleasedReturnValue();
        dispatch_sync(v8, &__block_literal_global_155_34828);

      }
      else
      {
        -[MPCloudController _performBlockOnControllerHandlingTheSameAccount:](self, "_performBlockOnControllerHandlingTheSameAccount:", &__block_literal_global_157_34829);
      }
    }
  }
}

- (BOOL)isActive
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__MPCloudController_isActive__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isGeniusEnabled
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__MPCloudController_isGeniusEnabled__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isCloudLibraryInitialImport
{
  -[MPCloudController _initializeUpdateInProgressState](self, "_initializeUpdateInProgressState");
  return self->_cloudLibraryInitialImport;
}

- (BOOL)isCloudLibraryUpdateInProgress
{
  -[MPCloudController _initializeUpdateInProgressState](self, "_initializeUpdateInProgressState");
  return self->_cloudLibraryUpdateInProgress;
}

- (void)loadGeniusItemsForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[MPCloudController cloudClient](self, "cloudClient");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loadGeniusItemsForSagaID:completionHandler:", a3, v6);

}

- (void)loadUpdateProgressWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCloudController cloudClient](self, "cloudClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadUpdateProgressWithCompletionHandler:", v4);

}

- (void)loadCloudMusicLibraryUpdateProgressWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCloudController cloudClient](self, "cloudClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadUpdateProgressWithCompletionHandler:", v4);

}

- (void)loadJaliscoLibraryUpdateProgressWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCloudController cloudClient](self, "cloudClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadJaliscoUpdateProgressWithCompletionHandler:", v4);

}

- (void)loadLastKnownEnableICMLErrorStatusWithCompletionHander:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCloudController cloudClient](self, "cloudClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadLastKnownEnableICMLErrorStatusWithCompletionHander:", v4);

}

- (void)enableCloudLibraryWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MPCloudControllerEnableCloudLibraryOptionStartInitialImport"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MPCloudControllerEnableCloudLibraryOptionMergeWithCloudLibrary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v10, "BOOLValue");
  -[MPCloudController cloudClient](self, "cloudClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  if ((_DWORD)v7)
    v12 = 1;
  else
    v12 = 2;
  objc_msgSend(v11, "enableCloudLibraryWithPolicy:startInitialImport:completionHandler:", v12, v9, v6);

}

- (void)disableCloudLibraryWithCompletionHandler:(id)a3
{
  -[MPCloudController disableCloudLibraryWithReason:completionHandler:](self, "disableCloudLibraryWithReason:completionHandler:", 0, a3);
}

- (void)disableCloudLibraryWithReason:(int64_t)a3 completionHandler:(id)a4
{
  int v4;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  MPCloudController *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
    v6 = -5;
  else
    v6 = -7;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543874;
    v11 = self;
    v12 = 1024;
    v13 = v4;
    v14 = 1024;
    v15 = v6;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - reason=%d, disableCloudLibraryReason=%d", (uint8_t *)&v10, 0x18u);
  }

  -[MPCloudController cloudClient](self, "cloudClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "disableCloudLibraryWithReason:completionHandler:", v6, v7);

}

- (BOOL)isAutomaticDownloadsEnabled
{
  void *v2;
  char v3;

  -[MPCloudController cloudClient](self, "cloudClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAutomaticDownloadsEnabledForMediaKindMusic");

  return v3;
}

- (BOOL)hasSetPreferenceForAutomaticDownloads
{
  void *v2;
  char v3;

  -[MPCloudController cloudClient](self, "cloudClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSetPreferenceForAutomaticDownloads");

  return v3;
}

- (void)enableAutomaticDownloadsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCloudController cloudClient](self, "cloudClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleAutomaticDownloadPreferenceChangedForMediaKindMusic:withCompletionHandler:", 1, v4);

}

- (void)disableAutomaticDownloadsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCloudController cloudClient](self, "cloudClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleAutomaticDownloadPreferenceChangedForMediaKindMusic:withCompletionHandler:", 0, v4);

}

- (int64_t)cloudAddToPlaylistBehavior
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0D51270];
  -[ICCloudClient configuration](self->_cloudClient, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "musicLibraryForUserAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sagaCloudAddToPlaylistBehavior");

  if (v6 == 1)
    return 1;
  else
    return 2 * (v6 == 2);
}

- (void)setCloudAddToPlaylistBehavior:(int64_t)a3 completionHandler:(id)a4
{
  _BOOL4 v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = a3 == 2;
  v7 = a4;
  -[MPCloudController cloudClient](self, "cloudClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  if (a3 == 1)
    v9 = 1;
  else
    v9 = 2 * v6;
  objc_msgSend(v8, "setCloudAddToPlaylistBehavior:completionHandler:", v9, v7);

}

- (int64_t)favoriteSongAddToLibraryBehavior
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1E0D51270];
  -[ICCloudClient configuration](self->_cloudClient, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "musicLibraryForUserAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForDatabaseProperty:", CFSTR("MLCloudAccountFavoriteSongAddToLibraryBehavior"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v7 == 1)
    return 1;
  else
    return 2 * (v7 == 2);
}

- (void)setCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3 completionHandler:(id)a4
{
  _BOOL4 v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = a3 == 2;
  v7 = a4;
  -[MPCloudController cloudClient](self, "cloudClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  if (a3 == 1)
    v9 = 1;
  else
    v9 = 2 * v6;
  objc_msgSend(v8, "setCloudFavoriteSongAddToLibraryBehavior:completionHandler:", v9, v7);

}

- (void)hideItemsWithPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MPCloudController cloudClient](self, "cloudClient");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hideItemsWithPurchaseHistoryIDs:completionHandler:", v7, v6);

}

- (void)setItemProperties:(id)a3 forPurchaseHistoryID:(unint64_t)a4
{
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  MPCloudController *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _ML3TrackPropertiesFromMPMediaItemProperties(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__MPCloudController_setItemProperties_forPurchaseHistoryID___block_invoke;
  v9[3] = &unk_1E315D290;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);
  if (v11[3])
  {
    -[MPCloudController cloudClient](self, "cloudClient");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject setItemProperties:forPurchaseHistoryID:](v7, "setItemProperties:forPurchaseHistoryID:", v6, a4);
  }
  else
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "allKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "%{public}@ - Skipping all properties for setItemProperties:forPurchaseHistoryID: %{public}@", buf, 0x16u);

    }
  }

  _Block_object_dispose(&v10, 8);
}

- (void)fetchRecommendedContentWithSeedTrackID:(int64_t)a3 seedTrackIDType:(int64_t)a4 count:(unint64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v9 = a6;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MPCloudController fetchRecommendedContentWithSeedTrackID:seedTrackIDType:count:completion:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("MPCloudController.m"), 1379, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v10 = objc_alloc(MEMORY[0x1E0DDC0A0]);
  -[MPCloudController userIdentity](self, "userIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithIdentity:", v11);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDBFD8]), "initWithRequestContext:seedItemID:isLibraryID:maxResultCount:", v12, a3, a3 == 0, a5);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __93__MPCloudController_fetchRecommendedContentWithSeedTrackID_seedTrackIDType_count_completion___block_invoke;
  v17[3] = &unk_1E315D450;
  v18 = v9;
  v14 = v9;
  objc_msgSend(v13, "performRequestWithResponseHandler:", v17);

}

- (void)setLikedState:(int64_t)a3 forEntityWithStoreID:(int64_t)a4 withMediaType:(unint64_t)a5 timeStamp:(id)a6
{
  -[MPCloudController setLikedState:forEntityWithStoreID:withMediaType:timeStamp:completion:](self, "setLikedState:forEntityWithStoreID:withMediaType:timeStamp:completion:", a3, a4, a5, a6, 0);
}

- (void)setLikedState:(int64_t)a3 forEntityWithStoreID:(int64_t)a4 withMediaType:(unint64_t)a5 timeStamp:(id)a6 completion:(id)a7
{
  _BOOL4 v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v11 = a3 == 3;
  v12 = a7;
  v13 = (void *)MEMORY[0x1E0DDBF20];
  v14 = a6;
  objc_msgSend(v13, "sharedCloudContentTasteRequestListener");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
    v16 = 1;
  else
    v16 = 2 * v11;
  -[MPCloudController configuration](self, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __91__MPCloudController_setLikedState_forEntityWithStoreID_withMediaType_timeStamp_completion___block_invoke;
  v19[3] = &unk_1E31624C0;
  v20 = v12;
  v18 = v12;
  objc_msgSend(v15, "setContentTaste:forMediaItem:storeIdentifier:configuration:timeStamp:withCompletionHandler:", v16, 0, a4, v17, v14, v19);

}

- (void)setLikedState:(int64_t)a3 forEntityWithStoreID:(int64_t)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 completion:(id)a7
{
  _BOOL4 v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v12 = a3 == 3;
  v13 = a7;
  v14 = (void *)MEMORY[0x1E0DDBF20];
  v15 = a6;
  objc_msgSend(v14, "sharedCloudContentTasteRequestListener");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
    v17 = 1;
  else
    v17 = 2 * v12;
  -[MPCloudController configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __90__MPCloudController_setLikedState_forEntityWithStoreID_persistentID_timeStamp_completion___block_invoke;
  v20[3] = &unk_1E31624C0;
  v21 = v13;
  v19 = v13;
  objc_msgSend(v16, "setContentTaste:forMediaItem:storeIdentifier:persistentID:timeStamp:configuration:withCompletionHandler:", v17, 0, a4, a5, v15, v18, v20);

}

- (void)setLikedState:(int64_t)a3 forAlbumWithStoreID:(int64_t)a4
{
  -[MPCloudController setLikedState:forAlbumWithStoreID:completion:](self, "setLikedState:forAlbumWithStoreID:completion:", a3, a4, 0);
}

- (void)setLikedState:(int64_t)a3 forAlbumWithStoreID:(int64_t)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;

  v8 = (void *)MEMORY[0x1E0C99D68];
  v9 = a5;
  objc_msgSend(v8, "date");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MPCloudController setLikedState:forAlbumWithStoreID:persistentID:timeStamp:completion:](self, "setLikedState:forAlbumWithStoreID:persistentID:timeStamp:completion:", a3, a4, 0, v10, v9);

}

- (void)setLikedState:(int64_t)a3 forAlbumWithStoreID:(int64_t)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 completion:(id)a7
{
  _BOOL4 v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v12 = a3 == 3;
  v13 = a7;
  v14 = (void *)MEMORY[0x1E0DDBF20];
  v15 = a6;
  objc_msgSend(v14, "sharedCloudContentTasteRequestListener");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
    v17 = 1;
  else
    v17 = 2 * v12;
  -[MPCloudController configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __89__MPCloudController_setLikedState_forAlbumWithStoreID_persistentID_timeStamp_completion___block_invoke;
  v20[3] = &unk_1E31624C0;
  v21 = v13;
  v19 = v13;
  objc_msgSend(v16, "setContentTaste:forAlbumStoreID:persistentID:timeStamp:configuration:withCompletionHandler:", v17, a4, a5, v15, v18, v20);

}

- (void)setLikedState:(int64_t)a3 forPlaylistWithGlobalID:(id)a4
{
  -[MPCloudController setLikedState:forPlaylistWithGlobalID:completion:](self, "setLikedState:forPlaylistWithGlobalID:completion:", a3, a4, 0);
}

- (void)setLikedState:(int64_t)a3 forPlaylistWithGlobalID:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x1E0C99D68];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "date");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[MPCloudController setLikedState:forPlaylistWithGlobalID:persistentID:timeStamp:completion:](self, "setLikedState:forPlaylistWithGlobalID:persistentID:timeStamp:completion:", a3, v10, 0, v11, v9);

}

- (void)setLikedState:(int64_t)a3 forPlaylistWithGlobalID:(id)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 completion:(id)a7
{
  _BOOL4 v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v12 = a3 == 3;
  v13 = a7;
  v14 = (void *)MEMORY[0x1E0DDBF20];
  v15 = a6;
  v16 = a4;
  objc_msgSend(v14, "sharedCloudContentTasteRequestListener");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
    v18 = 1;
  else
    v18 = 2 * v12;
  -[MPCloudController configuration](self, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __93__MPCloudController_setLikedState_forPlaylistWithGlobalID_persistentID_timeStamp_completion___block_invoke;
  v21[3] = &unk_1E31624C0;
  v22 = v13;
  v20 = v13;
  objc_msgSend(v17, "setContentTaste:forPlaylistGlobalID:persistentID:timeStamp:configuration:withCompletionHandler:", v18, v16, a5, v15, v19, v21);

}

- (void)setLikedState:(int64_t)a3 forArtistWithStoreID:(int64_t)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 completion:(id)a7
{
  _BOOL4 v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v12 = a3 == 3;
  v13 = a7;
  v14 = (void *)MEMORY[0x1E0DDBF20];
  v15 = a6;
  objc_msgSend(v14, "sharedCloudContentTasteRequestListener");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
    v17 = 1;
  else
    v17 = 2 * v12;
  -[MPCloudController configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __90__MPCloudController_setLikedState_forArtistWithStoreID_persistentID_timeStamp_completion___block_invoke;
  v20[3] = &unk_1E31624C0;
  v21 = v13;
  v19 = v13;
  objc_msgSend(v16, "setContentTaste:forArtistStoreID:persistentID:timeStamp:configuration:withCompletionHandler:", v17, a4, a5, v15, v18, v20);

}

- (void)processPendingKeyInvalidations
{
  id v2;

  -[MPCloudController cloudClient](self, "cloudClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processPendingKeyInvalidations");

}

- (id)_referralForModelObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "flattenedGenericObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "identifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "universalStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "adamID");

      if (v15 >= 1)
      {
        v16 = (void *)MEMORY[0x1E0DDBF00];
        objc_msgSend(v6, "universalStore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "referralWithAlbumAdamID:", objc_msgSend(v11, "adamID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v6, "universalStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "globalPlaylistID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
    goto LABEL_10;
  v10 = (void *)MEMORY[0x1E0DDBF00];
  objc_msgSend(v6, "universalStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "globalPlaylistID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "referralWithPlaylistGlobalID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
LABEL_11:

  return v13;
}

- (void)_setDateModified:(id)a3 forPlaylistPersistentID:(int64_t)a4
{
  id v6;
  void *v7;
  MPMediaPlaylist *v8;
  id v9;

  v6 = a3;
  -[MPCloudController userIdentity](self, "userIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = -[MPMediaPlaylist initWithPersistentID:mediaLibrary:]([MPMediaPlaylist alloc], "initWithPersistentID:mediaLibrary:", a4, v9);
  -[MPMediaItemCollection setValue:forProperty:](v8, "setValue:forProperty:", v6, CFSTR("dateModified"));

}

- (int64_t)_icFavoriteEntityTypeFromMPEntityType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

- (void)_copyObservationStateFrom:(id)a3
{
  _QWORD *v4;
  void *v5;
  int v6;
  NSObject *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsMultipleITunesAccounts");

  if (v6)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v7 = v4[5];
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __47__MPCloudController__copyObservationStateFrom___block_invoke;
    v12 = &unk_1E3163580;
    v14 = &v15;
    v13 = v4;
    dispatch_sync(v7, &v9);
    if (v16[3])
    {
      v8 = 0;
      do
      {
        -[MPCloudController _becomeActiveAndWaitUntilDone:](self, "_becomeActiveAndWaitUntilDone:", 0, v9, v10, v11, v12);
        ++v8;
      }
      while (v8 < v16[3]);
    }

    _Block_object_dispose(&v15, 8);
  }

}

- (BOOL)_handlesSameAccountAs:(id)a3
{
  MPCloudController *v4;
  void *v5;
  int v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (MPCloudController *)a3;
  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsMultipleITunesAccounts");

  v7 = 0;
  if (self != v4 && v6)
  {
    -[MPCloudController userIdentity](self, "userIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCloudController userIdentity](v4, "userIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == v11)
      v7 = 1;
    else
      v7 = objc_msgSend(v9, "isEqual:", v11);

  }
  return v7;
}

- (void)_resignActive
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__MPCloudController__resignActive__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_addItemWithAdamID:(int64_t)a3 toCollaborationWithPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0DDBF18];
  v10 = (void *)objc_msgSend(MEMORY[0x1E0DDBF18], "newIdentifierString");
  v11 = (void *)objc_msgSend(MEMORY[0x1E0DDBF18], "newIdentifierString");
  objc_msgSend(v9, "paramsForAddingTrackWithAdamID:itemUUID:itemPositionUUID:atPosition:", a3, v10, v11, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__MPCloudController__addItemWithAdamID_toCollaborationWithPersistentID_completionHandler___block_invoke;
  v15[3] = &unk_1E31624C0;
  v16 = v8;
  v14 = v8;
  -[MPCloudController editCollaborationWithPersistentID:properties:trackEdits:completion:](self, "editCollaborationWithPersistentID:properties:trackEdits:completion:", a4, MEMORY[0x1E0C9AA70], v13, v15);

}

- (void)_addItemWithSagaID:(unint64_t)a3 toCollaborationWithPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  int64_t v8;
  void *v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a5;
  v8 = -[MPCloudController _storeAdamIDForItemWithSagaID:](self, "_storeAdamIDForItemWithSagaID:", a3);
  if (v8)
  {
    -[MPCloudController _addItemWithAdamID:toCollaborationWithPersistentID:completionHandler:](self, "_addItemWithAdamID:toCollaborationWithPersistentID:completionHandler:", v8, a4, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPErrorDomain"), 4, CFSTR("failed to find song with given saga ID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v9);

  }
}

- (BOOL)_isCollaborativePlaylist:(unint64_t)a3
{
  void *v4;
  void *v5;
  MPMediaPlaylist *v6;
  void *v7;
  char v8;

  -[MPCloudController userIdentity](self, "userIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[MPMediaPlaylist initWithPersistentID:mediaLibrary:]([MPMediaPlaylist alloc], "initWithPersistentID:mediaLibrary:", a3, v5);
  -[MPMediaPlaylist valueForProperty:](v6, "valueForProperty:", CFSTR("isCollaborative"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (int64_t)_storeAdamIDForItemWithSagaID:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  NSObject *v15;
  int v17;
  MPCloudController *v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[MPCloudController userIdentity](self, "userIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[MPMediaQuery songsQuery](MPMediaQuery, "songsQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMediaLibrary:", v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v8, CFSTR("storeSagaID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addFilterPredicate:", v9);

  objc_msgSend(v7, "setIgnoreRestrictionsPredicates:", 1);
  objc_msgSend(v7, "setIgnoreSystemFilterPredicates:", 1);
  objc_msgSend(v7, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "valueForProperty:", CFSTR("subscriptionStoreItemAdamID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "longLongValue");

    if (!v13)
    {
      objc_msgSend(v11, "valueForProperty:", CFSTR("storeItemAdamID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v14, "longLongValue");

    }
  }
  else
  {
    v15 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543618;
      v18 = self;
      v19 = 2048;
      v20 = a3;
      _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - failed to find song with saga ID %lld", (uint8_t *)&v17, 0x16u);
    }

    v13 = 0;
  }

  return v13;
}

- (void)setCanShowCloudDownloadButtons:(BOOL)a3
{
  self->_canShowCloudDownloadButtons = a3;
}

- (void)setCanDefaultMediaLibraryShowCloudContent:(BOOL)a3
{
  self->_canDefaultMediaLibraryShowCloudContent = a3;
}

- (void)setCanShowCloudMusic:(BOOL)a3
{
  self->_canShowCloudMusic = a3;
}

- (void)setCanShowCloudVideo:(BOOL)a3
{
  self->_canShowCloudVideo = a3;
}

- (void)setCloudEnabled:(BOOL)a3
{
  self->_cloudEnabled = a3;
}

- (void)setCloudLockerAccount:(BOOL)a3
{
  self->_cloudLockerAccount = a3;
}

- (void)setPurchaseHistoryAccount:(BOOL)a3
{
  self->_purchaseHistoryAccount = a3;
}

- (void)setUpdateInProgress:(BOOL)a3
{
  self->_updateInProgress = a3;
}

- (void)setInitialImport:(BOOL)a3
{
  self->_initialImport = a3;
}

- (void)setCloudLibraryUpdateInProgress:(BOOL)a3
{
  self->_cloudLibraryUpdateInProgress = a3;
}

- (void)setCloudLibraryInitialImport:(BOOL)a3
{
  self->_cloudLibraryInitialImport = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (ICCloudAvailability)cloudAvailabilityController
{
  return self->_cloudAvailabilityController;
}

- (int64_t)activeCount
{
  return self->_activeCount;
}

- (void)setActiveCount:(int64_t)a3
{
  self->_activeCount = a3;
}

- (int)preferencesChangedNotifyToken
{
  return self->_preferencesChangedNotifyToken;
}

- (void)setPreferencesChangedNotifyToken:(int)a3
{
  self->_preferencesChangedNotifyToken = a3;
}

- (BOOL)preferencesChangedNotifyTokenIsValid
{
  return self->_preferencesChangedNotifyTokenIsValid;
}

- (void)setPreferencesChangedNotifyTokenIsValid:(BOOL)a3
{
  self->_preferencesChangedNotifyTokenIsValid = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)cloudClientCallbackQueue
{
  return self->_cloudClientCallbackQueue;
}

- (MSVDistributedNotificationObserver)addToPlaylistBehaviorChangedObserver
{
  return self->_addToPlaylistBehaviorChangedObserver;
}

- (MSVDistributedNotificationObserver)favoriteSongAddToLibraryBehaviorChangedObserver
{
  return self->_favoriteSongAddToLibraryBehaviorChangedObserver;
}

- (BOOL)isCloudEnabledValid
{
  return self->_cloudEnabledValid;
}

- (void)setCloudEnabledValid:(BOOL)a3
{
  self->_cloudEnabledValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoriteSongAddToLibraryBehaviorChangedObserver, 0);
  objc_storeStrong((id *)&self->_addToPlaylistBehaviorChangedObserver, 0);
  objc_storeStrong((id *)&self->_cloudClientCallbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cloudAvailabilityController, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_cloudClient, 0);
}

uint64_t __90__MPCloudController__addItemWithAdamID_toCollaborationWithPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __34__MPCloudController__resignActive__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 56);
  v3 = v2 < 1;
  v4 = v2 - 1;
  if (!v3)
  {
    *(_QWORD *)(v1 + 56) = v4;
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
    {
      v6 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v15 = v7;
        _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ - _resignActive - Resigning", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "cloudClient");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "resignActive");

      objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "supportsMultipleITunesAccounts");

      if ((v10 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "userIdentity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __34__MPCloudController__resignActive__block_invoke_185;
        v13[3] = &unk_1E315D4C8;
        v13[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v11, "getPropertiesForUserIdentity:completionHandler:", v12, v13);

      }
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
    }
  }
}

void __34__MPCloudController__resignActive__block_invoke_185(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!a3 && (objc_msgSend(a2, "isActive") & 1) == 0)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v5;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - _resignActive - Removing update handlers on inactive account", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "cloudClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUpdateSagaInProgressChangedHandler:", 0);

    objc_msgSend(*(id *)(a1 + 32), "cloudClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUpdateJaliscoInProgressChangedHandler:", 0);

  }
}

uint64_t __47__MPCloudController__copyObservationStateFrom___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 56);
  return result;
}

void __53__MPCloudController__initializeUpdateInProgressState__block_invoke(uint64_t a1, char a2, char a3)
{
  _QWORD v5[4];
  id v6;
  char v7;
  char v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__MPCloudController__initializeUpdateInProgressState__block_invoke_2;
  v5[3] = &unk_1E315D478;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  v7 = a2;
  v8 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);
  objc_destroyWeak(&v6);
}

void __53__MPCloudController__initializeUpdateInProgressState__block_invoke_179(uint64_t a1, char a2, char a3)
{
  _QWORD v5[4];
  id v6;
  char v7;
  char v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__MPCloudController__initializeUpdateInProgressState__block_invoke_2_180;
  v5[3] = &unk_1E315D478;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  v7 = a2;
  v8 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);
  objc_destroyWeak(&v6);
}

void __53__MPCloudController__initializeUpdateInProgressState__block_invoke_2_180(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _BOOL8 v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_BYTE *)(a1 + 40) && (unint64_t)(*(_BYTE *)(a1 + 41) != 0);
    objc_msgSend(WeakRetained, "setJaliscoInitialImport:", v4);
    v5 = objc_msgSend(v3, "isJaliscoUpdateInProgress");
    v6 = *(unsigned __int8 *)(a1 + 40);
    if (v6 != v5)
    {
      objc_msgSend(v3, "setJaliscoUpdateInProgress:", v6 != 0);
      v7 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138543874;
        v9 = v3;
        v10 = 1024;
        v11 = objc_msgSend(v3, "isJaliscoUpdateInProgress");
        v12 = 1024;
        v13 = objc_msgSend(v3, "isJaliscoInitialImport");
        _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - Setting JaliscoLibraryUpdateInProgress to %{BOOL}u JaliscoLibraryInitialImport to %{BOOL}u - Posting MPCloudControllerIsUpdateInProgressDidChangeNotification [Jalisco]", (uint8_t *)&v8, 0x18u);
      }

      +[MPCloudController _postNotificationName:controller:](MPCloudController, "_postNotificationName:controller:", CFSTR("MPCloudControllerIsUpdateInProgressDidChangeNotification"), v3);
    }
  }

}

void __53__MPCloudController__initializeUpdateInProgressState__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _BOOL8 v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_BYTE *)(a1 + 40) && (unint64_t)(*(_BYTE *)(a1 + 41) != 0);
    objc_msgSend(WeakRetained, "setCloudLibraryInitialImport:", v4);
    v5 = objc_msgSend(v3, "isCloudLibraryUpdateInProgress");
    v6 = *(unsigned __int8 *)(a1 + 40);
    if (v6 != v5)
    {
      objc_msgSend(v3, "setCloudLibraryUpdateInProgress:", v6 != 0);
      v7 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138543874;
        v9 = v3;
        v10 = 1024;
        v11 = objc_msgSend(v3, "isCloudLibraryUpdateInProgress");
        v12 = 1024;
        v13 = objc_msgSend(v3, "isCloudLibraryInitialImport");
        _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - Setting CloudLibraryUpdateInProgress to %{BOOL}u CloudLibraryInitialImport to %{BOOL}u - Posting MPCloudControllerIsUpdateInProgressDidChangeNotification [Saga]", (uint8_t *)&v8, 0x18u);
      }

      +[MPCloudController _postNotificationName:controller:](MPCloudController, "_postNotificationName:controller:", CFSTR("MPCloudControllerIsUpdateInProgressDidChangeNotification"), v3);
    }
  }

}

uint64_t __39__MPCloudController__updateSagaEnabled__block_invoke(uint64_t a1)
{
  +[MPCloudController _postNotificationName:controller:](MPCloudController, "_postNotificationName:controller:", CFSTR("MPCloudControllerIsCloudEnabledDidChangeNotification"), *(_QWORD *)(a1 + 32));
  return +[MPCloudController _postNotificationName:controller:](MPCloudController, "_postNotificationName:controller:", CFSTR("MPCloudControllerIsGeniusEnabledDidChangeNotification"), *(_QWORD *)(a1 + 32));
}

uint64_t __90__MPCloudController_setLikedState_forArtistWithStoreID_persistentID_timeStamp_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __93__MPCloudController_setLikedState_forPlaylistWithGlobalID_persistentID_timeStamp_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __89__MPCloudController_setLikedState_forAlbumWithStoreID_persistentID_timeStamp_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __90__MPCloudController_setLikedState_forEntityWithStoreID_persistentID_timeStamp_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __91__MPCloudController_setLikedState_forEntityWithStoreID_withMediaType_timeStamp_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __93__MPCloudController_fetchRecommendedContentWithSeedTrackID_seedTrackIDType_count_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__MPCloudController_setItemProperties_forPurchaseHistoryID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "canSetItemProperty:", a2);
  if ((_DWORD)result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __36__MPCloudController_isGeniusEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCloudEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __29__MPCloudController_isActive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

uint64_t __33__MPCloudController_resignActive__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_resignActive");
}

void __33__MPCloudController_resignActive__block_invoke()
{
  id v0;

  +[MPCloudController controllers](MPCloudController, "controllers");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_156_34831);

}

uint64_t __33__MPCloudController_resignActive__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_resignActive");
}

void __50__MPCloudController_becomeActiveAndWaitUntilDone___block_invoke(uint64_t a1)
{
  id v2;
  _QWORD v3[4];
  char v4;

  +[MPCloudController controllers](MPCloudController, "controllers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__MPCloudController_becomeActiveAndWaitUntilDone___block_invoke_2;
  v3[3] = &__block_descriptor_33_e44_v32__0__NSString_8__MPCloudController_16_B24l;
  v4 = *(_BYTE *)(a1 + 32);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

uint64_t __50__MPCloudController_becomeActiveAndWaitUntilDone___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_becomeActiveAndWaitUntilDone:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __50__MPCloudController_becomeActiveAndWaitUntilDone___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_becomeActiveAndWaitUntilDone:", *(unsigned __int8 *)(a1 + 32));
}

void __110__MPCloudController_deprioritizeArtworkRequestForEntityPersistentID_entityType_artworkType_artworkSourceType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  MPMediaPlaylist *v4;
  MPMediaPlaylist *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cloudClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "userIdentity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v3);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    switch(*(_QWORD *)(a1 + 40))
    {
      case 0:
        objc_msgSend(v25, "itemWithPersistentID:verifyExistence:", *(_QWORD *)(a1 + 48), 0);
        v4 = (MPMediaPlaylist *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = *(_QWORD *)(a1 + 56);
        if (v6 == 2)
        {
          v15 = *(_QWORD *)(a1 + 64);
          switch(v15)
          {
            case 600:
              objc_msgSend(*(id *)(a1 + 32), "cloudClient");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "deprioritizeSubscriptionScreenshotForPersistentID:", *(_QWORD *)(a1 + 48));
              goto LABEL_33;
            case 400:
              -[MPMediaPlaylist valueForProperty:](v4, "valueForProperty:", CFSTR("purchaseHistoryID"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "unsignedLongLongValue");

              if (v21 < 1)
                goto LABEL_35;
              objc_msgSend(*(id *)(a1 + 32), "cloudClient");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "deprioritizeScreenshotForPurchaseHistoryID:", v21);
              goto LABEL_33;
            case 200:
              -[MPMediaPlaylist valueForProperty:](v4, "valueForProperty:", CFSTR("storeSagaID"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "unsignedLongLongValue");

              if (v17 >= 1)
              {
                objc_msgSend(*(id *)(a1 + 32), "cloudClient");
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "deprioritizeScreenshotForSagaID:", v17);
                goto LABEL_33;
              }
              break;
          }
        }
        else
        {
          if (v6 != 1)
            goto LABEL_35;
          v7 = *(_QWORD *)(a1 + 64);
          switch(v7)
          {
            case 600:
              objc_msgSend(*(id *)(a1 + 32), "cloudClient");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "deprioritizeSubscriptionItemArtworkForPersistentID:", *(_QWORD *)(a1 + 48));
              goto LABEL_33;
            case 400:
              -[MPMediaPlaylist valueForProperty:](v4, "valueForProperty:", CFSTR("purchaseHistoryID"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "unsignedLongLongValue");

              if (v19 < 1)
                goto LABEL_35;
              objc_msgSend(*(id *)(a1 + 32), "cloudClient");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "deprioritizeItemArtworkForPurchaseHistoryID:", v19);
              goto LABEL_33;
            case 200:
              -[MPMediaPlaylist valueForProperty:](v4, "valueForProperty:", CFSTR("storeSagaID"));
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = objc_msgSend(v8, "unsignedLongLongValue");

              if (v9 >= 1)
              {
                objc_msgSend(*(id *)(a1 + 32), "cloudClient");
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "deprioritizeItemArtworkForSagaID:", v9);
LABEL_33:

                goto LABEL_34;
              }
              break;
          }
        }
        goto LABEL_35;
      case 1:
        if (*(_QWORD *)(a1 + 56) != 5)
          goto LABEL_36;
        v11 = *(_QWORD *)(a1 + 64);
        if (v11 == 600)
        {
          objc_msgSend(*(id *)(a1 + 32), "cloudClient");
          v5 = (MPMediaPlaylist *)objc_claimAutoreleasedReturnValue();
          -[MPMediaPlaylist deprioritizeSubscriptionContainerArtworkForPersistentID:](v5, "deprioritizeSubscriptionContainerArtworkForPersistentID:", *(_QWORD *)(a1 + 48));
          goto LABEL_34;
        }
        if (v11 != 200)
          goto LABEL_36;
        v5 = -[MPMediaPlaylist initWithPersistentID:mediaLibrary:]([MPMediaPlaylist alloc], "initWithPersistentID:mediaLibrary:", *(_QWORD *)(a1 + 48), v25);
        -[MPMediaPlaylist valueForProperty:](v5, "valueForProperty:", CFSTR("storeCloudID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "unsignedLongLongValue");

        if (v13 >= 1)
        {
          objc_msgSend(*(id *)(a1 + 32), "cloudClient");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "deprioritizeContainerArtworkForSagaID:", v13);

LABEL_34:
          return;
        }
LABEL_35:

LABEL_36:
        break;
      case 2:
        if (*(_QWORD *)(a1 + 56) != 4 || *(_QWORD *)(a1 + 64) != 500)
          goto LABEL_36;
        objc_msgSend(*(id *)(a1 + 32), "cloudClient");
        v5 = (MPMediaPlaylist *)objc_claimAutoreleasedReturnValue();
        -[MPMediaPlaylist deprioritizeArtistHeroImageForPersistentID:](v5, "deprioritizeArtistHeroImageForPersistentID:", *(_QWORD *)(a1 + 48));
        goto LABEL_34;
      case 7:
        if (*(_QWORD *)(a1 + 56) != 4 || *(_QWORD *)(a1 + 64) != 500)
          goto LABEL_36;
        objc_msgSend(*(id *)(a1 + 32), "cloudClient");
        v5 = (MPMediaPlaylist *)objc_claimAutoreleasedReturnValue();
        -[MPMediaPlaylist deprioritizeAlbumArtistHeroImageForPersistentID:](v5, "deprioritizeAlbumArtistHeroImageForPersistentID:", *(_QWORD *)(a1 + 48));
        goto LABEL_34;
      default:
        goto LABEL_36;
    }
  }
  v22 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = *(_QWORD *)(a1 + 56);
    v24 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 134218240;
    v27 = v23;
    v28 = 2048;
    v29 = v24;
    _os_log_impl(&dword_193B9B000, v22, OS_LOG_TYPE_DEFAULT, "[CloudPersonalization] Deprioritize artwork request not supported for artworkType=%ld, sourceType=%ld", buf, 0x16u);
  }

}

void __117__MPCloudController_loadArtworkInfoForEntityPersistentID_entityType_artworkType_artworkSourceType_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  MPMediaPlaylist *v8;
  MPMediaPlaylist *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[2] = __117__MPCloudController_loadArtworkInfoForEntityPersistentID_entityType_artworkType_artworkSourceType_completionHandler___block_invoke_2;
  v32[3] = &unk_1E315D2F0;
  v2 = *(void **)(a1 + 40);
  v34 = *(_QWORD *)(a1 + 48);
  v32[1] = 3221225472;
  v33 = v2;
  v3 = (void *)MEMORY[0x19403A810](v32);
  objc_msgSend(*(id *)(a1 + 32), "cloudClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "userIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(_QWORD *)(a1 + 56);
    if (v7 != 1)
    {
      if (!v7)
      {
        objc_msgSend(v6, "itemWithPersistentID:verifyExistence:", *(_QWORD *)(a1 + 48), 0);
        v8 = (MPMediaPlaylist *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = *(_QWORD *)(a1 + 64);
        if (v10 == 2)
        {
          v20 = *(_QWORD *)(a1 + 72);
          switch(v20)
          {
            case 600:
              objc_msgSend(*(id *)(a1 + 32), "cloudClient");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "loadScreenshotInfoForSubscriptionPersistentID:completionHandler:", *(_QWORD *)(a1 + 48), v3);
              goto LABEL_29;
            case 400:
              -[MPMediaPlaylist valueForProperty:](v8, "valueForProperty:", CFSTR("purchaseHistoryID"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "unsignedLongLongValue");

              if (v26 >= 1)
              {
                objc_msgSend(*(id *)(a1 + 32), "cloudClient");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "loadScreenshotInfoForPurchaseHistoryID:completionHandler:", v26, v3);
                goto LABEL_29;
              }
              break;
            case 200:
              -[MPMediaPlaylist valueForProperty:](v8, "valueForProperty:", CFSTR("storeSagaID"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "unsignedLongLongValue");

              if (v22 >= 1)
              {
                objc_msgSend(*(id *)(a1 + 32), "cloudClient");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "loadScreenshotInfoForSagaID:completionHandler:", v22, v3);
                goto LABEL_29;
              }
              break;
          }
        }
        else if (v10 == 1)
        {
          v11 = *(_QWORD *)(a1 + 72);
          switch(v11)
          {
            case 600:
              objc_msgSend(*(id *)(a1 + 32), "cloudClient");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "loadArtworkInfoForSubscriptionItemPersistentID:completionHandler:", *(_QWORD *)(a1 + 48), v3);
              goto LABEL_29;
            case 400:
              -[MPMediaPlaylist valueForProperty:](v8, "valueForProperty:", CFSTR("purchaseHistoryID"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "unsignedLongLongValue");

              if (v24 >= 1)
              {
                objc_msgSend(*(id *)(a1 + 32), "cloudClient");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "loadArtworkInfoForPurchaseHistoryID:completionHandler:", v24, v3);
                goto LABEL_29;
              }
              break;
            case 200:
              -[MPMediaPlaylist valueForProperty:](v8, "valueForProperty:", CFSTR("storeSagaID"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "unsignedLongLongValue");

              if (v13 >= 1)
              {
                objc_msgSend(*(id *)(a1 + 32), "cloudClient");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "loadArtworkInfoForSagaID:completionHandler:", v13, v3);
LABEL_29:

                goto LABEL_30;
              }
              break;
          }
        }
LABEL_31:
        v19 = 0;
        goto LABEL_32;
      }
LABEL_16:
      v19 = 0;
      goto LABEL_33;
    }
    v15 = *(_QWORD *)(a1 + 72);
    if (v15 == 600)
    {
      objc_msgSend(*(id *)(a1 + 32), "cloudClient");
      v9 = (MPMediaPlaylist *)objc_claimAutoreleasedReturnValue();
      -[MPMediaPlaylist loadArtworkInfoForSubscriptionContainerPersistentID:completionHandler:](v9, "loadArtworkInfoForSubscriptionContainerPersistentID:completionHandler:", *(_QWORD *)(a1 + 48), v3);
    }
    else
    {
      if (v15 != 200)
        goto LABEL_16;
      v9 = -[MPMediaPlaylist initWithPersistentID:mediaLibrary:]([MPMediaPlaylist alloc], "initWithPersistentID:mediaLibrary:", *(_QWORD *)(a1 + 48), v6);
      -[MPMediaPlaylist valueForProperty:](v9, "valueForProperty:", CFSTR("storeCloudID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedLongLongValue");

      if (v17 < 1)
        goto LABEL_31;
      objc_msgSend(*(id *)(a1 + 32), "cloudClient");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "loadArtworkInfoForContainerSagaID:completionHandler:", v17, v3);

    }
LABEL_30:
    v19 = 1;
LABEL_32:

LABEL_33:
    if ((v19 & 1) != 0)
      goto LABEL_36;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Artwork info loading not supported for artworkType=%ld, sourceType=%ld"), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(a1 + 40);
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2D50];
    v36[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("MPCloudControllerErrorDomain"), 1010101, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v28 + 16))(v28, 0, v31);

  }
LABEL_36:

}

void __117__MPCloudController_loadArtworkInfoForEntityPersistentID_entityType_artworkType_artworkSourceType_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  MPExportableArtworkProperties *v4;
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
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MPExportableArtworkProperties);
  if (v3)
  {
    v5 = *MEMORY[0x1E0DDBC48];
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0DDBC48]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DDBC68]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length"))
    {
      v8 = (void *)MEMORY[0x1E0CB36D8];
      objc_msgSend(v7, "dataUsingEncoding:", 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "JSONObjectWithData:options:error:", v9, 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPExportableArtworkProperties setArtworkTemplateItems:](v4, "setArtworkTemplateItems:", v11);

      }
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0DDBC60]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (_NSIsNSString())
      -[MPExportableArtworkProperties setResolvedURLString:](v4, "setResolvedURLString:", v13);
    -[MPExportableArtworkProperties artworkTemplateItems](v4, "artworkTemplateItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      v15 = 0;
LABEL_10:

      goto LABEL_14;
    }
    -[MPExportableArtworkProperties resolvedURLString](v4, "resolvedURLString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Artwork info loading failed. No artwork URL found in the artwork info dictionary for item with persistent ID %lld"), *(_QWORD *)(a1 + 40));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB2D50];
      v24 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("MPCloudControllerErrorDomain"), 1010101, v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    v15 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Artwork info loading failed. Got no artwork info dictionary for item with persistent ID %lld"), *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    v22 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("MPCloudControllerErrorDomain"), 1010101, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_14:

  v18 = *(_QWORD *)(a1 + 32);
  if (v18)
    (*(void (**)(uint64_t, MPExportableArtworkProperties *, void *))(v18 + 16))(v18, v4, v15);

}

void __113__MPCloudController_loadArtworkForEntityPersistentID_entityType_artworkType_artworkSourceType_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  MPMediaPlaylist *v7;
  MPMediaPlaylist *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  id v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __113__MPCloudController_loadArtworkForEntityPersistentID_entityType_artworkType_artworkSourceType_completionHandler___block_invoke_2;
  v33 = &unk_1E31624C0;
  v34 = *(id *)(a1 + 40);
  v2 = (void *)MEMORY[0x19403A810](&v30);
  objc_msgSend(*(id *)(a1 + 32), "cloudClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if ((objc_msgSend(MEMORY[0x1E0DDC108], "canAccessAccountStore") & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "userIdentity");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = 0;
    switch(*(_QWORD *)(a1 + 48))
    {
      case 0:
        objc_msgSend(v5, "itemWithPersistentID:verifyExistence:", *(_QWORD *)(a1 + 56), 0);
        v7 = (MPMediaPlaylist *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = *(_QWORD *)(a1 + 64);
        if (v9 == 2)
        {
          v18 = *(_QWORD *)(a1 + 72);
          switch(v18)
          {
            case 600:
              objc_msgSend(*(id *)(a1 + 32), "cloudClient");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "importSubscriptionScreenshotForPersistentID:completionHandler:", *(_QWORD *)(a1 + 56), v2);
              goto LABEL_38;
            case 400:
              -[MPMediaPlaylist valueForProperty:](v7, "valueForProperty:", CFSTR("purchaseHistoryID"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "unsignedLongLongValue");

              if (v24 < 1)
                break;
              objc_msgSend(*(id *)(a1 + 32), "cloudClient");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "importScreenshotForPurchaseHistoryID:completionHandler:", v24, v2);
              goto LABEL_38;
            case 200:
              -[MPMediaPlaylist valueForProperty:](v7, "valueForProperty:", CFSTR("storeSagaID"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "unsignedLongLongValue");

              if (v20 >= 1)
              {
                objc_msgSend(*(id *)(a1 + 32), "cloudClient");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "importScreenshotForSagaID:completionHandler:", v20, v2);
                goto LABEL_38;
              }
              break;
          }
        }
        else
        {
          if (v9 != 1)
            goto LABEL_40;
          v10 = *(_QWORD *)(a1 + 72);
          switch(v10)
          {
            case 600:
              objc_msgSend(*(id *)(a1 + 32), "cloudClient");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "importSubscriptionItemArtworkForPersistentID:completionHandler:", *(_QWORD *)(a1 + 56), v2);
              goto LABEL_38;
            case 400:
              -[MPMediaPlaylist valueForProperty:](v7, "valueForProperty:", CFSTR("purchaseHistoryID"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "unsignedLongLongValue");

              if (v22 < 1)
                break;
              objc_msgSend(*(id *)(a1 + 32), "cloudClient");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "importItemArtworkForPurchaseHistoryID:completionHandler:", v22, v2);
              goto LABEL_38;
            case 200:
              -[MPMediaPlaylist valueForProperty:](v7, "valueForProperty:", CFSTR("storeSagaID"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v11, "unsignedLongLongValue");

              if (v12 >= 1)
              {
                objc_msgSend(*(id *)(a1 + 32), "cloudClient");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "importItemArtworkForSagaID:completionHandler:", v12, v2);
LABEL_38:

                goto LABEL_39;
              }
              break;
          }
        }
LABEL_40:
        v6 = 0;
LABEL_41:

LABEL_42:
        if ((v6 & 1) == 0)
          break;
        goto LABEL_45;
      case 1:
        if (*(_QWORD *)(a1 + 64) != 5)
          goto LABEL_25;
        v14 = *(_QWORD *)(a1 + 72);
        if (v14 == 600)
        {
          objc_msgSend(*(id *)(a1 + 32), "cloudClient");
          v8 = (MPMediaPlaylist *)objc_claimAutoreleasedReturnValue();
          -[MPMediaPlaylist importSubscriptionContainerArtworkForPersistentID:completionHandler:](v8, "importSubscriptionContainerArtworkForPersistentID:completionHandler:", *(_QWORD *)(a1 + 56), v2);
        }
        else
        {
          if (v14 != 200)
          {
LABEL_25:
            v6 = 0;
            goto LABEL_42;
          }
          v8 = -[MPMediaPlaylist initWithPersistentID:mediaLibrary:]([MPMediaPlaylist alloc], "initWithPersistentID:mediaLibrary:", *(_QWORD *)(a1 + 56), v5);
          -[MPMediaPlaylist valueForProperty:](v8, "valueForProperty:", CFSTR("storeCloudID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "unsignedLongLongValue");

          if (v16 < 1)
            goto LABEL_40;
          objc_msgSend(*(id *)(a1 + 32), "cloudClient");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "importContainerArtworkForSagaID:completionHandler:", v16, v2);

        }
LABEL_39:
        v6 = 1;
        goto LABEL_41;
      case 2:
        if (*(_QWORD *)(a1 + 64) != 4 || *(_QWORD *)(a1 + 72) != 500)
          goto LABEL_25;
        objc_msgSend(*(id *)(a1 + 32), "cloudClient");
        v8 = (MPMediaPlaylist *)objc_claimAutoreleasedReturnValue();
        -[MPMediaPlaylist importArtistHeroImageForPersistentID:completionHandler:](v8, "importArtistHeroImageForPersistentID:completionHandler:", *(_QWORD *)(a1 + 56), v2);
        goto LABEL_39;
      case 7:
        if (*(_QWORD *)(a1 + 64) != 4 || *(_QWORD *)(a1 + 72) != 500)
          goto LABEL_25;
        objc_msgSend(*(id *)(a1 + 32), "cloudClient");
        v8 = (MPMediaPlaylist *)objc_claimAutoreleasedReturnValue();
        -[MPMediaPlaylist importAlbumArtistHeroImageForPersistentID:completionHandler:](v8, "importAlbumArtistHeroImageForPersistentID:completionHandler:", *(_QWORD *)(a1 + 56), v2);
        goto LABEL_39;
      default:
        goto LABEL_42;
    }
  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("One-off loading not supported for artworkType=%ld, sourceType=%ld"), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v30, v31, v32, v33);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(a1 + 40);
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2938];
    v36[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("MPCloudControllerErrorDomain"), 1010101, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v29);

  }
LABEL_45:

}

uint64_t __113__MPCloudController_loadArtworkForEntityPersistentID_entityType_artworkType_artworkSourceType_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __49__MPCloudController_setItemProperties_forSagaID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "canSetItemProperty:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __40__MPCloudController_canSetItemProperty___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("daap.incrementplaycount"), CFSTR("daap.incrementskipcount"), CFSTR("dmap.itemhidden"), *MEMORY[0x1E0D51198], *MEMORY[0x1E0D50E20], *MEMORY[0x1E0D50CA8], *MEMORY[0x1E0D50CB8], *MEMORY[0x1E0D50F00], *MEMORY[0x1E0D50B88], *MEMORY[0x1E0D50F10], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)canSetItemProperty____itemProperties;
  canSetItemProperty____itemProperties = v0;

}

uint64_t __95__MPCloudController_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __103__MPCloudController_sdk_setPlaylistProperties_trackList_forPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "canSetPlaylistProperty:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __99__MPCloudController_setPlaylistProperties_trackList_forPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "canSetPlaylistProperty:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __44__MPCloudController_canSetPlaylistProperty___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("daap.incrementplaycount"), CFSTR("com.apple.itunes.cloud-artwork-token"), *MEMORY[0x1E0D50A58], *MEMORY[0x1E0D50968], *MEMORY[0x1E0D50958], *MEMORY[0x1E0D50948], *MEMORY[0x1E0D50A48], *MEMORY[0x1E0D508F8], *MEMORY[0x1E0D50908], *MEMORY[0x1E0D508C8], *MEMORY[0x1E0D50A68], *MEMORY[0x1E0D50988], *MEMORY[0x1E0D50980], *MEMORY[0x1E0D50978], *MEMORY[0x1E0D50940], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)canSetPlaylistProperty____containerProperties;
  canSetPlaylistProperty____containerProperties = v0;

}

+ (OS_dispatch_queue)globalSerialQueue
{
  if (globalSerialQueue_onceToken_34947 != -1)
    dispatch_once(&globalSerialQueue_onceToken_34947, &__block_literal_global_34948);
  return (OS_dispatch_queue *)(id)globalSerialQueue___globalSerialQueue_34949;
}

+ (NSMutableDictionary)controllers
{
  if (controllers_onceToken_34944 != -1)
    dispatch_once(&controllers_onceToken_34944, &__block_literal_global_48_34945);
  return (NSMutableDictionary *)(id)controllers___controllers_34946;
}

+ (id)_controllerWithUserIdentity:(id)a3 createIfRequired:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  __CFString *v11;
  NSObject *v12;
  __CFString *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v19;
  _QWORD block[4];
  __CFString *v21;
  id v22;
  uint64_t *v23;
  id v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v4 = a4;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportsMultipleITunesAccounts");

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPCloudController.m"), 243, CFSTR("Attempting to access a method only available for multi user device"));

  }
  objc_msgSend(v7, "accountDSID");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = (__CFString *)v10;
  else
    v11 = CFSTR("NoDSID");
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__34908;
  v30 = __Block_byref_object_dispose__34909;
  v31 = 0;
  objc_msgSend(a1, "globalSerialQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MPCloudController__controllerWithUserIdentity_createIfRequired___block_invoke;
  block[3] = &unk_1E315D218;
  v25 = v4;
  v24 = a1;
  v13 = v11;
  v21 = v13;
  v14 = v7;
  v22 = v14;
  v23 = &v26;
  dispatch_sync(v12, block);

  if (v4)
  {
    v15 = (void *)v27[5];
    +[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_copyObservationStateFrom:", v16);

  }
  v17 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v17;
}

void __63__MPCloudController__postNotificationName_controller_userInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v3;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - Related controller posting notification [%@]", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", *(_QWORD *)(a1 + 32), v3);

}

void __66__MPCloudController__controllerWithUserIdentity_createIfRequired___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 56), "controllers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 56);
        v6 = *(_QWORD *)(a1 + 40);
        v13 = 138543618;
        v14 = v5;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - No pre-existing controller for user identity %@", (uint8_t *)&v13, 0x16u);
      }

      v7 = -[MPCloudController _initWithUserIdentity:]([MPCloudController alloc], "_initWithUserIdentity:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 56), "controllers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 32));

    }
  }
  objc_msgSend(*(id *)(a1 + 56), "controllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

void __32__MPCloudController_controllers__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)controllers___controllers_34946;
  controllers___controllers_34946 = (uint64_t)v0;

}

void __38__MPCloudController_globalSerialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.mediaplayer.MPCloudController.global.serial.queue", v2);
  v1 = (void *)globalSerialQueue___globalSerialQueue_34949;
  globalSerialQueue___globalSerialQueue_34949 = (uint64_t)v0;

}

@end
