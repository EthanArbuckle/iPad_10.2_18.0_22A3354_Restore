@implementation MusicKit_SoftLinking_MPCloudController

+ (MusicKit_SoftLinking_MPCloudController)sharedCloudController
{
  if (sharedCloudController_sOnceToken != -1)
    dispatch_once(&sharedCloudController_sOnceToken, &__block_literal_global_6);
  return (MusicKit_SoftLinking_MPCloudController *)(id)sharedCloudController_sSharedCloudController;
}

+ (NSString)isUpdateInProgressDidChangeNotificationName
{
  return (NSString *)CFSTR("MusicKit_SoftLinking_MPCloudControllerIsUpdateInProgressDidChangeNotification");
}

- (id)_initWithUnderlyingCloudController:(id)a3
{
  id v5;
  MusicKit_SoftLinking_MPCloudController *v6;
  MusicKit_SoftLinking_MPCloudController *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MusicKit_SoftLinking_MPCloudController;
  v6 = -[MusicKit_SoftLinking_MPCloudController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingCloudController, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    getMPCloudControllerCanShowCloudDownloadButtonsDidChangeNotification();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__handleCanShowCloudDownloadButtonsDidChangeNotification_, v9, v7->_underlyingCloudController);

    getMPCloudControllerIsUpdateInProgressDidChangeNotification();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__handleIsUpdateInProgressDidChangeNotificationName_, v10, v7->_underlyingCloudController);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getMPCloudControllerCanShowCloudDownloadButtonsDidChangeNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, self->_underlyingCloudController);

  getMPCloudControllerIsUpdateInProgressDidChangeNotification();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v5, self->_underlyingCloudController);

  v6.receiver = self;
  v6.super_class = (Class)MusicKit_SoftLinking_MPCloudController;
  -[MusicKit_SoftLinking_MPCloudController dealloc](&v6, sel_dealloc);
}

- (BOOL)canShowCloudDownloadButtons
{
  return -[MPCloudController canShowCloudDownloadButtons](self->_underlyingCloudController, "canShowCloudDownloadButtons");
}

- (BOOL)isUpdateInProgress
{
  return -[MPCloudController isUpdateInProgress](self->_underlyingCloudController, "isUpdateInProgress");
}

- (BOOL)isCloudLibraryEnabled
{
  return -[MPCloudController isCloudLibraryEnabled](self->_underlyingCloudController, "isCloudLibraryEnabled");
}

- (BOOL)isInitialImport
{
  return -[MPCloudController isInitialImport](self->_underlyingCloudController, "isInitialImport");
}

- (void)updateSubscribedPlaylistWithSagaID:(unint64_t)a3 ignoreMinRefreshInterval:(BOOL)a4 completionHandler:(id)a5
{
  -[MPCloudController updateSubscribedPlaylistWithSagaID:ignoreMinRefreshInterval:completionHandler:](self->_underlyingCloudController, "updateSubscribedPlaylistWithSagaID:ignoreMinRefreshInterval:completionHandler:", a3, a4, a5);
}

- (void)setCloudAddToPlaylistBehavior:(int64_t)a3 completionHandler:(id)a4
{
  if (a3 != 2)
    a3 = a3 == 1;
  -[MPCloudController setCloudAddToPlaylistBehavior:completionHandler:](self->_underlyingCloudController, "setCloudAddToPlaylistBehavior:completionHandler:", a3, a4);
}

- (int64_t)cloudAddToPlaylistBehavior
{
  int64_t result;

  result = -[MPCloudController cloudAddToPlaylistBehavior](self->_underlyingCloudController, "cloudAddToPlaylistBehavior");
  if (result != 2)
    return result == 1;
  return result;
}

- (void)becomeActive
{
  -[MPCloudController becomeActive](self->_underlyingCloudController, "becomeActive");
}

- (void)resignActive
{
  -[MPCloudController resignActive](self->_underlyingCloudController, "resignActive");
}

- (void)enableCloudLibraryWithCompletionHandler:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v5 = (id *)getMPCloudControllerEnableCloudLibraryOptionStartInitialImportSymbolLoc_ptr;
  v17 = getMPCloudControllerEnableCloudLibraryOptionStartInitialImportSymbolLoc_ptr;
  if (!getMPCloudControllerEnableCloudLibraryOptionStartInitialImportSymbolLoc_ptr)
  {
    v6 = (void *)MediaPlayerLibrary_11();
    v5 = (id *)dlsym(v6, "MPCloudControllerEnableCloudLibraryOptionStartInitialImport");
    v15[3] = (uint64_t)v5;
    getMPCloudControllerEnableCloudLibraryOptionStartInitialImportSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v14, 8);
  if (!v5)
    getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
  v7 = *v5;
  v18 = v7;
  v8 = MEMORY[0x1E0C9AAB0];
  v20[0] = MEMORY[0x1E0C9AAB0];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v9 = (id *)getMPCloudControllerEnableCloudLibraryOptionMergeWithCloudLibrarySymbolLoc_ptr;
  v17 = getMPCloudControllerEnableCloudLibraryOptionMergeWithCloudLibrarySymbolLoc_ptr;
  if (!getMPCloudControllerEnableCloudLibraryOptionMergeWithCloudLibrarySymbolLoc_ptr)
  {
    v10 = (void *)MediaPlayerLibrary_11();
    v9 = (id *)dlsym(v10, "MPCloudControllerEnableCloudLibraryOptionMergeWithCloudLibrary");
    v15[3] = (uint64_t)v9;
    getMPCloudControllerEnableCloudLibraryOptionMergeWithCloudLibrarySymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v14, 8);
  if (!v9)
    getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
  v19 = *v9;
  v20[1] = v8;
  v11 = (void *)MEMORY[0x1E0C99D80];
  v12 = v19;
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v20, &v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCloudController enableCloudLibraryWithOptions:completionHandler:](self->_underlyingCloudController, "enableCloudLibraryWithOptions:completionHandler:", v13, v4);
}

- (void)loadCloudMusicLibraryUpdateProgressWithCompletionHandler:(id)a3
{
  -[MPCloudController loadCloudMusicLibraryUpdateProgressWithCompletionHandler:](self->_underlyingCloudController, "loadCloudMusicLibraryUpdateProgressWithCompletionHandler:", a3);
}

- (void)respondToPendingCollaborator:(id)a3 onCollaborationWithPersistentID:(id)a4 withApproval:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  MPCloudController *underlyingCloudController;
  id v10;
  id v11;

  v6 = a5;
  underlyingCloudController = self->_underlyingCloudController;
  v10 = a6;
  v11 = a3;
  -[MPCloudController respondToPendingCollaborator:onCollaborationWithPersistentID:withApproval:completion:](underlyingCloudController, "respondToPendingCollaborator:onCollaborationWithPersistentID:withApproval:completion:", v11, objc_msgSend(a4, "longLongValue"), v6, v10);

}

- (void)updateSharingMode:(int64_t)a3 onCollaborationWithPersistentID:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  uint64_t v10;
  MPCloudController *underlyingCloudController;
  uint64_t v12;
  id v13;

  v8 = (void *)MEMORY[0x1E0CCDE30];
  v13 = a5;
  v9 = a4;
  v10 = objc_msgSend(v8, "_underlyingMediaSharingModeForSharingMode:", a3);
  underlyingCloudController = self->_underlyingCloudController;
  v12 = objc_msgSend(v9, "longLongValue");

  -[MPCloudController updateSharingMode:onCollaboratinWithPersistentID:completion:](underlyingCloudController, "updateSharingMode:onCollaboratinWithPersistentID:completion:", v10, v12, v13);
}

- (void)resetInvitationURLForCollaborationWithPersistentID:(id)a3 completion:(id)a4
{
  MPCloudController *underlyingCloudController;
  id v6;

  underlyingCloudController = self->_underlyingCloudController;
  v6 = a4;
  -[MPCloudController resetInvitationURLForCollaborationWithPersistentID:completion:](underlyingCloudController, "resetInvitationURLForCollaborationWithPersistentID:completion:", objc_msgSend(a3, "longLongValue"), v6);

}

+ (NSString)canShowCloudDownloadButtonsDidChangeNotificationName
{
  return (NSString *)CFSTR("MusicKit_SoftLinking_MPCloudControllerCanShowCloudDownloadButtonsDidChangeNotification");
}

- (void)_handleCanShowCloudDownloadButtonsDidChangeNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MusicKit_SoftLinking_MPCloudControllerCanShowCloudDownloadButtonsDidChangeNotification"), self, v6);
}

- (void)_handleIsUpdateInProgressDidChangeNotificationName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MusicKit_SoftLinking_MPCloudControllerIsUpdateInProgressDidChangeNotification"), self, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingCloudController, 0);
}

@end
