@implementation HSCloudClient

- (HSCloudClient)init
{
  return -[HSCloudClient initWithConfiguration:](self, "initWithConfiguration:", 0);
}

- (HSCloudClient)initWithConfiguration:(id)a3
{
  id v4;
  HSCloudClient *v5;
  HSCloudClient *v6;
  uint64_t v7;
  ICConnectionConfiguration *configuration;
  uint64_t v9;
  ICCloudClient *icCloudClient;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HSCloudClient;
  v5 = -[HSCloudClient init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    -[HSCloudClient _ICConnectionConfigurationFromHSConnectionConfiguration:](v5, "_ICConnectionConfigurationFromHSConnectionConfiguration:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    configuration = v6->_configuration;
    v6->_configuration = (ICConnectionConfiguration *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BEC8778]), "initWithConfiguration:", v6->_configuration);
    icCloudClient = v6->_icCloudClient;
    v6->_icCloudClient = (ICCloudClient *)v9;

    v6->_preferredVideoQuality = -1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)_ServerJaliscoUpdateInProgressDidChangeNotification, CFSTR("com.apple.itunescloudd.jaliscoUpdateInProgressChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v12 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v12, v6, (CFNotificationCallback)_ServerSagaUpdateInProgressDidChangeNotification, CFSTR("com.apple.itunescloudd.sagaUpdateInProgressChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v6;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  __CFNotificationCenter *v5;
  objc_super v6;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.itunescloudd.launched"), 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, CFSTR("com.apple.itunescloudd.sagaUpdateInProgressChanged"), 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, CFSTR("com.apple.itunescloudd.jaliscoUpdateInProgressChanged"), 0);
  v6.receiver = self;
  v6.super_class = (Class)HSCloudClient;
  -[HSCloudClient dealloc](&v6, sel_dealloc);
}

- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 completionHandler:(id)a6
{
  id v10;
  ICCloudClient *icCloudClient;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v10 = a6;
  icCloudClient = self->_icCloudClient;
  v12 = a4;
  -[HSCloudClient _ICCloudItemIDListFromHSCloudItemIDList:](self, "_ICCloudItemIDListFromHSCloudItemIDList:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __87__HSCloudClient_createPlaylistWithPersistentID_properties_trackList_completionHandler___block_invoke;
  v15[3] = &unk_24C364878;
  v16 = v10;
  v14 = v10;
  -[ICCloudClient createPlaylistWithPersistentID:properties:trackList:completionHandler:](icCloudClient, "createPlaylistWithPersistentID:properties:trackList:completionHandler:", a3, v12, v13, v15);

}

- (void)sdk_createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 tracklist:(id)a5 completionHandler:(id)a6
{
  id v10;
  ICCloudClient *icCloudClient;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v10 = a6;
  icCloudClient = self->_icCloudClient;
  v12 = a4;
  -[HSCloudClient _ICCloudItemIDListFromHSCloudItemIDList:](self, "_ICCloudItemIDListFromHSCloudItemIDList:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __91__HSCloudClient_sdk_createPlaylistWithPersistentID_properties_tracklist_completionHandler___block_invoke;
  v15[3] = &unk_24C364878;
  v16 = v10;
  v14 = v10;
  -[ICCloudClient sdk_createPlaylistWithPersistentID:properties:tracklist:completionHandler:](icCloudClient, "sdk_createPlaylistWithPersistentID:properties:tracklist:completionHandler:", a3, v12, v13, v15);

}

- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  ICCloudClient *icCloudClient;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v10 = a6;
  icCloudClient = self->_icCloudClient;
  v12 = a3;
  -[HSCloudClient _ICCloudItemIDListFromHSCloudItemIDList:](self, "_ICCloudItemIDListFromHSCloudItemIDList:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __91__HSCloudClient_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke;
  v15[3] = &unk_24C3648A0;
  v16 = v10;
  v14 = v10;
  -[ICCloudClient setPlaylistProperties:trackList:forPlaylistPersistentID:completionHandler:](icCloudClient, "setPlaylistProperties:trackList:forPlaylistPersistentID:completionHandler:", v12, v13, a5, v15);

}

- (void)addStoreItemWithAdamID:(int64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  ICCloudClient *icCloudClient;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  icCloudClient = self->_icCloudClient;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __85__HSCloudClient_addStoreItemWithAdamID_toPlaylistWithPersistentID_completionHandler___block_invoke;
  v11[3] = &unk_24C3648A0;
  v12 = v8;
  v10 = v8;
  -[ICCloudClient addStoreItemWithAdamID:referral:toPlaylistWithPersistentID:completionHandler:](icCloudClient, "addStoreItemWithAdamID:referral:toPlaylistWithPersistentID:completionHandler:", a3, 0, a4, v11);

}

- (void)addItemWithSagaID:(int64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  ICCloudClient *icCloudClient;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  icCloudClient = self->_icCloudClient;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__HSCloudClient_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke;
  v11[3] = &unk_24C3648A0;
  v12 = v8;
  v10 = v8;
  -[ICCloudClient addItemWithSagaID:toPlaylistWithPersistentID:completionHandler:](icCloudClient, "addItemWithSagaID:toPlaylistWithPersistentID:completionHandler:", a3, a4, v11);

}

- (void)sdk_addStoreItemWithOpaqueID:(id)a3 toPlaylistWithPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  ICCloudClient *icCloudClient;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  icCloudClient = self->_icCloudClient;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __91__HSCloudClient_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke;
  v11[3] = &unk_24C3648C8;
  v12 = v8;
  v10 = v8;
  -[ICCloudClient sdk_addStoreItemWithOpaqueID:toPlaylistWithPersistentID:completionHandler:](icCloudClient, "sdk_addStoreItemWithOpaqueID:toPlaylistWithPersistentID:completionHandler:", a3, a4, v11);

}

- (void)publishPlaylistWithSagaID:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__HSCloudClient_publishPlaylistWithSagaID_completionHandler___block_invoke;
  v9[3] = &unk_24C3648F0;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient publishPlaylistWithSagaID:completionHandler:](icCloudClient, "publishPlaylistWithSagaID:completionHandler:", a3, v9);

}

- (void)uploadArtworkForPlaylistWithPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __76__HSCloudClient_uploadArtworkForPlaylistWithPersistentID_completionHandler___block_invoke;
  v9[3] = &unk_24C3648A0;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient uploadArtworkForPlaylistWithPersistentID:completionHandler:](icCloudClient, "uploadArtworkForPlaylistWithPersistentID:completionHandler:", a3, v9);

}

- (void)updateSubscribedPlaylistsWithSagaIDs:(id)a3 ignoreMinRefreshInterval:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  ICCloudClient *icCloudClient;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v8 = a5;
  icCloudClient = self->_icCloudClient;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __97__HSCloudClient_updateSubscribedPlaylistsWithSagaIDs_ignoreMinRefreshInterval_completionHandler___block_invoke;
  v11[3] = &unk_24C3648A0;
  v12 = v8;
  v10 = v8;
  -[ICCloudClient updateSubscribedPlaylistsWithSagaIDs:ignoreMinRefreshInterval:completionHandler:](icCloudClient, "updateSubscribedPlaylistsWithSagaIDs:ignoreMinRefreshInterval:completionHandler:", a3, v5, v11);

}

- (void)addStoreItemWithAdamID:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__HSCloudClient_addStoreItemWithAdamID_completionHandler___block_invoke;
  v9[3] = &unk_24C3648C8;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient addStoreItemWithAdamID:referral:completionHandler:](icCloudClient, "addStoreItemWithAdamID:referral:completionHandler:", a3, 0, v9);

}

- (void)sdk_addStoreItemWithOpaqueID:(id)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__HSCloudClient_sdk_addStoreItemWithOpaqueID_completionHandler___block_invoke;
  v9[3] = &unk_24C3648C8;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient sdk_addStoreItemWithOpaqueID:completionHandler:](icCloudClient, "sdk_addStoreItemWithOpaqueID:completionHandler:", a3, v9);

}

- (void)addStorePlaylistWithGlobalID:(id)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__HSCloudClient_addStorePlaylistWithGlobalID_completionHandler___block_invoke;
  v9[3] = &unk_24C3648C8;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient addStorePlaylistWithGlobalID:completionHandler:](icCloudClient, "addStorePlaylistWithGlobalID:completionHandler:", a3, v9);

}

- (void)removePlaylistsWithSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__HSCloudClient_removePlaylistsWithSagaIDs_completionHandler___block_invoke;
  v9[3] = &unk_24C3648A0;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient removePlaylistsWithSagaIDs:completionHandler:](icCloudClient, "removePlaylistsWithSagaIDs:completionHandler:", a3, v9);

}

- (void)removeItemsWithSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__HSCloudClient_removeItemsWithSagaIDs_completionHandler___block_invoke;
  v9[3] = &unk_24C3648A0;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient removeItemsWithSagaIDs:completionHandler:](icCloudClient, "removeItemsWithSagaIDs:completionHandler:", a3, v9);

}

- (void)hideItemsWithPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__HSCloudClient_hideItemsWithPurchaseHistoryIDs_completionHandler___block_invoke;
  v9[3] = &unk_24C3648A0;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient hideItemsWithPurchaseHistoryIDs:completionHandler:](icCloudClient, "hideItemsWithPurchaseHistoryIDs:completionHandler:", a3, v9);

}

- (void)addGeniusPlaylistWithPersistentID:(int64_t)a3 name:(id)a4 seedItemSagaIDs:(id)a5 itemSagaIDs:(id)a6 completionHandler:(id)a7
{
  id v11;
  ICCloudClient *icCloudClient;
  id v13;
  _QWORD v14[4];
  id v15;

  v11 = a7;
  icCloudClient = self->_icCloudClient;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __102__HSCloudClient_addGeniusPlaylistWithPersistentID_name_seedItemSagaIDs_itemSagaIDs_completionHandler___block_invoke;
  v14[3] = &unk_24C364878;
  v15 = v11;
  v13 = v11;
  -[ICCloudClient addGeniusPlaylistWithPersistentID:name:seedItemSagaIDs:itemSagaIDs:completionHandler:](icCloudClient, "addGeniusPlaylistWithPersistentID:name:seedItemSagaIDs:itemSagaIDs:completionHandler:", a3, a4, a5, a5, v14);

}

- (void)authenticateWithCompletionHandler:(id)a3
{
  id v4;
  ICCloudClient *icCloudClient;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  icCloudClient = self->_icCloudClient;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__HSCloudClient_authenticateWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C3648A0;
  v8 = v4;
  v6 = v4;
  -[ICCloudClient authenticateWithCompletionHandler:](icCloudClient, "authenticateWithCompletionHandler:", v7);

}

- (void)authenticateAndStartInitialImport:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__HSCloudClient_authenticateAndStartInitialImport_completionHandler___block_invoke;
  v9[3] = &unk_24C3648A0;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient authenticateAndStartInitialImport:completionHandler:](icCloudClient, "authenticateAndStartInitialImport:completionHandler:", v4, v9);

}

- (void)becomeActive
{
  -[ICCloudClient becomeActive](self->_icCloudClient, "becomeActive");
}

- (void)updateJaliscoLibraryWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__HSCloudClient_updateJaliscoLibraryWithReason_completionHandler___block_invoke;
  v9[3] = &unk_24C364918;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient updateJaliscoLibraryWithReason:completionHandler:](icCloudClient, "updateJaliscoLibraryWithReason:completionHandler:", a3, v9);

}

- (void)removeJaliscoLibraryWithCompletionHander:(id)a3
{
  id v4;
  ICCloudClient *icCloudClient;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  icCloudClient = self->_icCloudClient;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__HSCloudClient_removeJaliscoLibraryWithCompletionHander___block_invoke;
  v7[3] = &unk_24C3648A0;
  v8 = v4;
  v6 = v4;
  -[ICCloudClient removeJaliscoLibraryWithCompletionHander:](icCloudClient, "removeJaliscoLibraryWithCompletionHander:", v7);

}

- (BOOL)isMediaKindDisabledForJaliscoLibrary:(int64_t)a3
{
  return -[ICCloudClient isMediaKindDisabledForJaliscoLibrary:](self->_icCloudClient, "isMediaKindDisabledForJaliscoLibrary:", a3);
}

- (void)updateJaliscoLibraryWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__HSCloudClient_updateJaliscoLibraryWithCompletionHandler___block_invoke;
  v6[3] = &unk_24C364918;
  v7 = v4;
  v5 = v4;
  -[HSCloudClient updateJaliscoLibraryWithReason:completionHandler:](self, "updateJaliscoLibraryWithReason:completionHandler:", 0, v6);

}

- (void)updateSagaLibraryWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__HSCloudClient_updateSagaLibraryWithCompletionHandler___block_invoke;
  v6[3] = &unk_24C364918;
  v7 = v4;
  v5 = v4;
  -[HSCloudClient updateSagaLibraryWithReason:completionHandler:](self, "updateSagaLibraryWithReason:completionHandler:", 0, v6);

}

- (void)updateSagaLibraryWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__HSCloudClient_updateSagaLibraryWithReason_completionHandler___block_invoke;
  v9[3] = &unk_24C364918;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient updateSagaLibraryWithReason:completionHandler:](icCloudClient, "updateSagaLibraryWithReason:completionHandler:", a3, v9);

}

- (void)deauthenticateWithCompletionHandler:(id)a3
{
  id v4;
  ICCloudClient *icCloudClient;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  icCloudClient = self->_icCloudClient;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__HSCloudClient_deauthenticateWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C3648A0;
  v8 = v4;
  v6 = v4;
  -[ICCloudClient deauthenticateWithCompletionHandler:](icCloudClient, "deauthenticateWithCompletionHandler:", v7);

}

- (void)isAuthenticatedWithCompletionHandler:(id)a3
{
  id v4;
  ICCloudClient *icCloudClient;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  icCloudClient = self->_icCloudClient;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__HSCloudClient_isAuthenticatedWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C364918;
  v8 = v4;
  v6 = v4;
  -[ICCloudClient isAuthenticatedWithCompletionHandler:](icCloudClient, "isAuthenticatedWithCompletionHandler:", v7);

}

- (void)isAuthenticatedWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__HSCloudClient_isAuthenticatedWithQueue_completionHandler___block_invoke;
  v9[3] = &unk_24C364918;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient isAuthenticatedWithQueue:completionHandler:](icCloudClient, "isAuthenticatedWithQueue:completionHandler:", a3, v9);

}

- (void)loadLastKnownEnableICMLErrorStatusWithCompletionHander:(id)a3
{
  id v4;
  ICCloudClient *icCloudClient;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  icCloudClient = self->_icCloudClient;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__HSCloudClient_loadLastKnownEnableICMLErrorStatusWithCompletionHander___block_invoke;
  v7[3] = &unk_24C364940;
  v8 = v4;
  v6 = v4;
  -[ICCloudClient loadLastKnownEnableICMLErrorStatusWithCompletionHander:](icCloudClient, "loadLastKnownEnableICMLErrorStatusWithCompletionHander:", v7);

}

- (void)importItemArtworkForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __73__HSCloudClient_importItemArtworkForPurchaseHistoryID_completionHandler___block_invoke;
  v9[3] = &unk_24C3648A0;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient importItemArtworkForPurchaseHistoryID:completionHandler:](icCloudClient, "importItemArtworkForPurchaseHistoryID:completionHandler:", a3, v9);

}

- (void)importScreenshotForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__HSCloudClient_importScreenshotForPurchaseHistoryID_completionHandler___block_invoke;
  v9[3] = &unk_24C3648A0;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient importScreenshotForPurchaseHistoryID:completionHandler:](icCloudClient, "importScreenshotForPurchaseHistoryID:completionHandler:", a3, v9);

}

- (void)importItemArtworkForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__HSCloudClient_importItemArtworkForSagaID_completionHandler___block_invoke;
  v9[3] = &unk_24C3648A0;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient importItemArtworkForSagaID:completionHandler:](icCloudClient, "importItemArtworkForSagaID:completionHandler:", a3, v9);

}

- (void)importScreenshotForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__HSCloudClient_importScreenshotForSagaID_completionHandler___block_invoke;
  v9[3] = &unk_24C3648A0;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient importScreenshotForSagaID:completionHandler:](icCloudClient, "importScreenshotForSagaID:completionHandler:", a3, v9);

}

- (void)importContainerArtworkForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__HSCloudClient_importContainerArtworkForSagaID_completionHandler___block_invoke;
  v9[3] = &unk_24C3648A0;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient importContainerArtworkForSagaID:completionHandler:](icCloudClient, "importContainerArtworkForSagaID:completionHandler:", a3, v9);

}

- (void)importSubscriptionItemArtworkForPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __80__HSCloudClient_importSubscriptionItemArtworkForPersistentID_completionHandler___block_invoke;
  v9[3] = &unk_24C3648A0;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient importSubscriptionItemArtworkForPersistentID:completionHandler:](icCloudClient, "importSubscriptionItemArtworkForPersistentID:completionHandler:", a3, v9);

}

- (void)importSubscriptionScreenshotForPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__HSCloudClient_importSubscriptionScreenshotForPersistentID_completionHandler___block_invoke;
  v9[3] = &unk_24C3648A0;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient importSubscriptionScreenshotForPersistentID:completionHandler:](icCloudClient, "importSubscriptionScreenshotForPersistentID:completionHandler:", a3, v9);

}

- (void)importSubscriptionContainerArtworkForPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __85__HSCloudClient_importSubscriptionContainerArtworkForPersistentID_completionHandler___block_invoke;
  v9[3] = &unk_24C3648A0;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient importSubscriptionContainerArtworkForPersistentID:completionHandler:](icCloudClient, "importSubscriptionContainerArtworkForPersistentID:completionHandler:", a3, v9);

}

- (void)importArtistHeroImageForPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__HSCloudClient_importArtistHeroImageForPersistentID_completionHandler___block_invoke;
  v9[3] = &unk_24C3648A0;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient importArtistHeroImageForPersistentID:completionHandler:](icCloudClient, "importArtistHeroImageForPersistentID:completionHandler:", a3, v9);

}

- (void)importAlbumArtistHeroImageForPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __77__HSCloudClient_importAlbumArtistHeroImageForPersistentID_completionHandler___block_invoke;
  v9[3] = &unk_24C3648A0;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient importAlbumArtistHeroImageForPersistentID:completionHandler:](icCloudClient, "importAlbumArtistHeroImageForPersistentID:completionHandler:", a3, v9);

}

- (void)deprioritizeItemArtworkForPurchaseHistoryID:(unint64_t)a3
{
  -[ICCloudClient deprioritizeItemArtworkForPurchaseHistoryID:](self->_icCloudClient, "deprioritizeItemArtworkForPurchaseHistoryID:", a3);
}

- (void)deprioritizeScreenshotForPurchaseHistoryID:(unint64_t)a3
{
  -[ICCloudClient deprioritizeScreenshotForPurchaseHistoryID:](self->_icCloudClient, "deprioritizeScreenshotForPurchaseHistoryID:", a3);
}

- (void)deprioritizeItemArtworkForSagaID:(unint64_t)a3
{
  -[ICCloudClient deprioritizeItemArtworkForSagaID:](self->_icCloudClient, "deprioritizeItemArtworkForSagaID:", a3);
}

- (void)deprioritizeScreenshotForSagaID:(unint64_t)a3
{
  -[ICCloudClient deprioritizeScreenshotForSagaID:](self->_icCloudClient, "deprioritizeScreenshotForSagaID:", a3);
}

- (void)deprioritizeContainerArtworkForSagaID:(unint64_t)a3
{
  -[ICCloudClient deprioritizeContainerArtworkForSagaID:](self->_icCloudClient, "deprioritizeContainerArtworkForSagaID:", a3);
}

- (void)deprioritizeSubscriptionItemArtworkForPersistentID:(int64_t)a3
{
  -[ICCloudClient deprioritizeSubscriptionItemArtworkForPersistentID:](self->_icCloudClient, "deprioritizeSubscriptionItemArtworkForPersistentID:", a3);
}

- (void)deprioritizeSubscriptionScreenshotForPersistentID:(int64_t)a3
{
  -[ICCloudClient deprioritizeSubscriptionScreenshotForPersistentID:](self->_icCloudClient, "deprioritizeSubscriptionScreenshotForPersistentID:", a3);
}

- (void)deprioritizeSubscriptionContainerArtworkForPersistentID:(int64_t)a3
{
  -[ICCloudClient deprioritizeSubscriptionContainerArtworkForPersistentID:](self->_icCloudClient, "deprioritizeSubscriptionContainerArtworkForPersistentID:", a3);
}

- (void)deprioritizeArtistHeroImageForPersistentID:(int64_t)a3
{
  -[ICCloudClient deprioritizeArtistHeroImageForPersistentID:](self->_icCloudClient, "deprioritizeArtistHeroImageForPersistentID:", a3);
}

- (void)deprioritizeAlbumArtistHeroImageForPersistentID:(int64_t)a3
{
  -[ICCloudClient deprioritizeAlbumArtistHeroImageForPersistentID:](self->_icCloudClient, "deprioritizeAlbumArtistHeroImageForPersistentID:", a3);
}

- (void)loadArtworkInfoForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __71__HSCloudClient_loadArtworkInfoForPurchaseHistoryID_completionHandler___block_invoke;
  v9[3] = &unk_24C364968;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient loadArtworkInfoForPurchaseHistoryID:completionHandler:](icCloudClient, "loadArtworkInfoForPurchaseHistoryID:completionHandler:", a3, v9);

}

- (void)loadArtworkInfoForPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__HSCloudClient_loadArtworkInfoForPurchaseHistoryIDs_completionHandler___block_invoke;
  v9[3] = &unk_24C364990;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient loadArtworkInfoForPurchaseHistoryIDs:completionHandler:](icCloudClient, "loadArtworkInfoForPurchaseHistoryIDs:completionHandler:", a3, v9);

}

- (void)loadScreenshotInfoForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __74__HSCloudClient_loadScreenshotInfoForPurchaseHistoryID_completionHandler___block_invoke;
  v9[3] = &unk_24C364968;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient loadScreenshotInfoForPurchaseHistoryID:completionHandler:](icCloudClient, "loadScreenshotInfoForPurchaseHistoryID:completionHandler:", a3, v9);

}

- (void)loadScreenshotInfoForPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__HSCloudClient_loadScreenshotInfoForPurchaseHistoryIDs_completionHandler___block_invoke;
  v9[3] = &unk_24C364990;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient loadScreenshotInfoForPurchaseHistoryIDs:completionHandler:](icCloudClient, "loadScreenshotInfoForPurchaseHistoryIDs:completionHandler:", a3, v9);

}

- (void)loadArtworkInfoForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__HSCloudClient_loadArtworkInfoForSagaID_completionHandler___block_invoke;
  v9[3] = &unk_24C364968;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient loadArtworkInfoForSagaID:completionHandler:](icCloudClient, "loadArtworkInfoForSagaID:completionHandler:", a3, v9);

}

- (void)loadArtworkInfoForSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__HSCloudClient_loadArtworkInfoForSagaIDs_completionHandler___block_invoke;
  v9[3] = &unk_24C364990;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient loadArtworkInfoForSagaIDs:completionHandler:](icCloudClient, "loadArtworkInfoForSagaIDs:completionHandler:", a3, v9);

}

- (void)loadArtworkInfoForContainerSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__HSCloudClient_loadArtworkInfoForContainerSagaID_completionHandler___block_invoke;
  v9[3] = &unk_24C364968;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient loadArtworkInfoForContainerSagaID:completionHandler:](icCloudClient, "loadArtworkInfoForContainerSagaID:completionHandler:", a3, v9);

}

- (void)loadArtworkInfoForContainerSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __70__HSCloudClient_loadArtworkInfoForContainerSagaIDs_completionHandler___block_invoke;
  v9[3] = &unk_24C364990;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient loadArtworkInfoForContainerSagaIDs:completionHandler:](icCloudClient, "loadArtworkInfoForContainerSagaIDs:completionHandler:", a3, v9);

}

- (void)loadScreenshotInfoForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__HSCloudClient_loadScreenshotInfoForSagaID_completionHandler___block_invoke;
  v9[3] = &unk_24C364968;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient loadScreenshotInfoForSagaID:completionHandler:](icCloudClient, "loadScreenshotInfoForSagaID:completionHandler:", a3, v9);

}

- (void)loadScreenshotInfoForSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__HSCloudClient_loadScreenshotInfoForSagaIDs_completionHandler___block_invoke;
  v9[3] = &unk_24C364990;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient loadScreenshotInfoForSagaIDs:completionHandler:](icCloudClient, "loadScreenshotInfoForSagaIDs:completionHandler:", a3, v9);

}

- (void)loadArtworkInfoForSubscriptionItemPersistentID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __82__HSCloudClient_loadArtworkInfoForSubscriptionItemPersistentID_completionHandler___block_invoke;
  v9[3] = &unk_24C364968;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient loadArtworkInfoForSubscriptionItemPersistentID:completionHandler:](icCloudClient, "loadArtworkInfoForSubscriptionItemPersistentID:completionHandler:", a3, v9);

}

- (void)loadArtworkInfoForSubscriptionItemPersistentIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __83__HSCloudClient_loadArtworkInfoForSubscriptionItemPersistentIDs_completionHandler___block_invoke;
  v9[3] = &unk_24C364990;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient loadArtworkInfoForSubscriptionItemPersistentIDs:completionHandler:](icCloudClient, "loadArtworkInfoForSubscriptionItemPersistentIDs:completionHandler:", a3, v9);

}

- (void)loadScreenshotInfoForSubscriptionPersistentID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __81__HSCloudClient_loadScreenshotInfoForSubscriptionPersistentID_completionHandler___block_invoke;
  v9[3] = &unk_24C364968;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient loadScreenshotInfoForSubscriptionPersistentID:completionHandler:](icCloudClient, "loadScreenshotInfoForSubscriptionPersistentID:completionHandler:", a3, v9);

}

- (void)loadScreenshotInfoForSubscriptionPersistentIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __82__HSCloudClient_loadScreenshotInfoForSubscriptionPersistentIDs_completionHandler___block_invoke;
  v9[3] = &unk_24C364990;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient loadScreenshotInfoForSubscriptionPersistentIDs:completionHandler:](icCloudClient, "loadScreenshotInfoForSubscriptionPersistentIDs:completionHandler:", a3, v9);

}

- (void)loadArtworkInfoForSubscriptionContainerPersistentID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __87__HSCloudClient_loadArtworkInfoForSubscriptionContainerPersistentID_completionHandler___block_invoke;
  v9[3] = &unk_24C364968;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient loadArtworkInfoForSubscriptionContainerPersistentID:completionHandler:](icCloudClient, "loadArtworkInfoForSubscriptionContainerPersistentID:completionHandler:", a3, v9);

}

- (void)loadArtworkInfoForSubscriptionContainerPersistentIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __88__HSCloudClient_loadArtworkInfoForSubscriptionContainerPersistentIDs_completionHandler___block_invoke;
  v9[3] = &unk_24C364990;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient loadArtworkInfoForSubscriptionContainerPersistentIDs:completionHandler:](icCloudClient, "loadArtworkInfoForSubscriptionContainerPersistentIDs:completionHandler:", a3, v9);

}

- (void)loadGeniusItemsForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__HSCloudClient_loadGeniusItemsForSagaID_completionHandler___block_invoke;
  v9[3] = &unk_24C3649B8;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient loadGeniusItemsForSagaID:completionHandler:](icCloudClient, "loadGeniusItemsForSagaID:completionHandler:", a3, v9);

}

- (void)loadUpdateProgressWithCompletionHandler:(id)a3
{
  id v4;
  ICCloudClient *icCloudClient;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  icCloudClient = self->_icCloudClient;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__HSCloudClient_loadUpdateProgressWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C3649E0;
  v8 = v4;
  v6 = v4;
  -[ICCloudClient loadUpdateProgressWithCompletionHandler:](icCloudClient, "loadUpdateProgressWithCompletionHandler:", v7);

}

- (void)loadIsSagaUpdateInProgressWithCompletionHandler:(id)a3
{
  id v4;
  ICCloudClient *icCloudClient;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  icCloudClient = self->_icCloudClient;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__HSCloudClient_loadIsSagaUpdateInProgressWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C364A08;
  v8 = v4;
  v6 = v4;
  -[ICCloudClient loadIsSagaUpdateInProgressWithCompletionHandler:](icCloudClient, "loadIsSagaUpdateInProgressWithCompletionHandler:", v7);

}

- (void)loadIsJaliscoUpdateInProgressWithCompletionHandler:(id)a3
{
  id v4;
  ICCloudClient *icCloudClient;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  icCloudClient = self->_icCloudClient;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__HSCloudClient_loadIsJaliscoUpdateInProgressWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C364A08;
  v8 = v4;
  v6 = v4;
  -[ICCloudClient loadIsJaliscoUpdateInProgressWithCompletionHandler:](icCloudClient, "loadIsJaliscoUpdateInProgressWithCompletionHandler:", v7);

}

- (void)loadSagaUpdateProgressWithCompletionHandler:(id)a3
{
  id v4;
  ICCloudClient *icCloudClient;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  icCloudClient = self->_icCloudClient;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__HSCloudClient_loadSagaUpdateProgressWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C3649E0;
  v8 = v4;
  v6 = v4;
  -[ICCloudClient loadSagaUpdateProgressWithCompletionHandler:](icCloudClient, "loadSagaUpdateProgressWithCompletionHandler:", v7);

}

- (void)loadJaliscoUpdateProgressWithCompletionHandler:(id)a3
{
  id v4;
  ICCloudClient *icCloudClient;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  icCloudClient = self->_icCloudClient;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__HSCloudClient_loadJaliscoUpdateProgressWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C3649E0;
  v8 = v4;
  v6 = v4;
  -[ICCloudClient loadJaliscoUpdateProgressWithCompletionHandler:](icCloudClient, "loadJaliscoUpdateProgressWithCompletionHandler:", v7);

}

- (void)resetConfiguration:(id)a3
{
  ICConnectionConfiguration *v4;
  ICConnectionConfiguration *configuration;

  -[HSCloudClient _ICConnectionConfigurationFromHSConnectionConfiguration:](self, "_ICConnectionConfigurationFromHSConnectionConfiguration:", a3);
  v4 = (ICConnectionConfiguration *)objc_claimAutoreleasedReturnValue();
  configuration = self->_configuration;
  self->_configuration = v4;

}

- (void)resignActive
{
  -[ICCloudClient resignActive](self->_icCloudClient, "resignActive");
}

- (void)setDaemonConfiguration:(unint64_t)a3
{
  -[ICCloudClient setDaemonConfiguration:](self->_icCloudClient, "setDaemonConfiguration:", a3);
}

- (void)setPreferredVideoQuality:(int64_t)a3
{
  -[ICCloudClient setPreferredVideoQuality:](self->_icCloudClient, "setPreferredVideoQuality:", a3);
}

- (void)setItemProperties:(id)a3 forPurchaseHistoryID:(unint64_t)a4
{
  -[ICCloudClient setItemProperties:forPurchaseHistoryID:](self->_icCloudClient, "setItemProperties:forPurchaseHistoryID:", a3, a4);
}

- (void)setItemProperties:(id)a3 forSagaID:(unint64_t)a4
{
  -[ICCloudClient setItemProperties:forSagaID:](self->_icCloudClient, "setItemProperties:forSagaID:", a3, a4);
}

- (void)uploadCloudItemProperties
{
  -[ICCloudClient uploadCloudItemProperties](self->_icCloudClient, "uploadCloudItemProperties");
}

- (void)uploadCloudPlaylistProperties
{
  -[ICCloudClient uploadCloudPlaylistProperties](self->_icCloudClient, "uploadCloudPlaylistProperties");
}

- (void)setAlbumProperties:(id)a3 forAlbumPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  ICCloudClient *icCloudClient;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  icCloudClient = self->_icCloudClient;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__HSCloudClient_setAlbumProperties_forAlbumPersistentID_completionHandler___block_invoke;
  v11[3] = &unk_24C3648A0;
  v12 = v8;
  v10 = v8;
  -[ICCloudClient setAlbumProperties:forAlbumPersistentID:completionHandler:](icCloudClient, "setAlbumProperties:forAlbumPersistentID:completionHandler:", a3, a4, v11);

}

- (void)updateArtistHeroImages
{
  -[ICCloudClient updateArtistHeroImages](self->_icCloudClient, "updateArtistHeroImages");
}

- (void)loadBooksForStoreIDs:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  ICCloudClient *icCloudClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__HSCloudClient_loadBooksForStoreIDs_withCompletionHandler___block_invoke;
  v9[3] = &unk_24C3649B8;
  v10 = v6;
  v8 = v6;
  -[ICCloudClient loadBooksForStoreIDs:withCompletionHandler:](icCloudClient, "loadBooksForStoreIDs:withCompletionHandler:", a3, v9);

}

- (BOOL)hasProperNetworkConditionsToPlayMedia
{
  return -[ICCloudClient hasProperNetworkConditionsToPlayMedia](self->_icCloudClient, "hasProperNetworkConditionsToPlayMedia");
}

- (BOOL)hasProperNetworkConditionsToShowCloudMedia
{
  return -[ICCloudClient hasProperNetworkConditionsToShowCloudMedia](self->_icCloudClient, "hasProperNetworkConditionsToShowCloudMedia");
}

- (BOOL)isCellularDataRestrictedForMusic
{
  return -[ICCloudClient isCellularDataRestrictedForMusic](self->_icCloudClient, "isCellularDataRestrictedForMusic");
}

- (BOOL)shouldProhibitMusicActionForCurrentNetworkConditions
{
  return -[ICCloudClient shouldProhibitMusicActionForCurrentNetworkConditions](self->_icCloudClient, "shouldProhibitMusicActionForCurrentNetworkConditions");
}

- (BOOL)isCellularDataRestrictedForVideos
{
  return -[ICCloudClient isCellularDataRestrictedForVideos](self->_icCloudClient, "isCellularDataRestrictedForVideos");
}

- (BOOL)shouldProhibitVideosActionForCurrentNetworkConditions
{
  return -[ICCloudClient shouldProhibitVideosActionForCurrentNetworkConditions](self->_icCloudClient, "shouldProhibitVideosActionForCurrentNetworkConditions");
}

- (BOOL)isCellularDataRestrictedForStoreApps
{
  return -[ICCloudClient isCellularDataRestrictedForStoreApps](self->_icCloudClient, "isCellularDataRestrictedForStoreApps");
}

- (BOOL)shouldProhibitStoreAppsActionForCurrentNetworkConditions
{
  return -[ICCloudClient shouldProhibitStoreAppsActionForCurrentNetworkConditions](self->_icCloudClient, "shouldProhibitStoreAppsActionForCurrentNetworkConditions");
}

- (BOOL)canShowCloudDownloadButtons
{
  return -[ICCloudClient canShowCloudDownloadButtons](self->_icCloudClient, "canShowCloudDownloadButtons");
}

- (BOOL)canShowCloudMusic
{
  return -[ICCloudClient canShowCloudMusic](self->_icCloudClient, "canShowCloudMusic");
}

- (BOOL)canShowCloudVideo
{
  return -[ICCloudClient canShowCloudVideo](self->_icCloudClient, "canShowCloudVideo");
}

- (void)_serverSagaUpdateInProgressDidChange
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  -[HSCloudClient updateSagaInProgressChangedHandler](self, "updateSagaInProgressChangedHandler");
  v3 = objc_claimAutoreleasedReturnValue();
  -[HSCloudClient updateInProgressChangedHandler](self, "updateInProgressChangedHandler");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v3 | v4)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __53__HSCloudClient__serverSagaUpdateInProgressDidChange__block_invoke;
    v5[3] = &unk_24C364A30;
    v6 = (id)v3;
    v7 = (id)v4;
    -[HSCloudClient loadIsSagaUpdateInProgressWithCompletionHandler:](self, "loadIsSagaUpdateInProgressWithCompletionHandler:", v5);

  }
}

- (void)_serverJaliscoUpdateInProgressDidChange
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  -[HSCloudClient updateJaliscoInProgressChangedHandler](self, "updateJaliscoInProgressChangedHandler");
  v3 = objc_claimAutoreleasedReturnValue();
  -[HSCloudClient updateInProgressChangedHandler](self, "updateInProgressChangedHandler");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v3 | v4)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __56__HSCloudClient__serverJaliscoUpdateInProgressDidChange__block_invoke;
    v5[3] = &unk_24C364A30;
    v6 = (id)v3;
    v7 = (id)v4;
    -[HSCloudClient loadIsJaliscoUpdateInProgressWithCompletionHandler:](self, "loadIsJaliscoUpdateInProgressWithCompletionHandler:", v5);

  }
}

- (id)_ICCloudItemIDListFromHSCloudItemIDList:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  if (!a3)
    return 0;
  v3 = (objc_class *)MEMORY[0x24BEC8780];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__HSCloudClient__ICCloudItemIDListFromHSCloudItemIDList___block_invoke;
  v8[3] = &unk_24C364A58;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateCloudItemIDsUsingBlock:", v8);

  return v6;
}

- (id)_ICConnectionConfigurationFromHSConnectionConfiguration:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BEC8790];
    v4 = a3;
    v5 = [v3 alloc];
    objc_msgSend(v4, "userIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userIdentityStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithUserIdentity:userIdentityStore:", v6, v7);

    objc_msgSend(v4, "baseURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBaseURL:", v9);

    objc_msgSend(v4, "libraryBagKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLibraryBagKey:", v10);

    objc_msgSend(v4, "buildIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBuildIdentifier:", v11);

    objc_msgSend(v4, "purchaseClientIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPurchaseClientIdentifier:", v12);

    objc_msgSend(v8, "setRequestReason:", objc_msgSend(v4, "requestReason"));
    objc_msgSend(v4, "familyMemberStoreID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setFamilyMemberStoreID:", v13);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)updateInProgressChangedHandler
{
  return self->_updateInProgressChangedHandler;
}

- (void)setUpdateInProgressChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)updateSagaInProgressChangedHandler
{
  return self->_updateSagaInProgressChangedHandler;
}

- (void)setUpdateSagaInProgressChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)updateJaliscoInProgressChangedHandler
{
  return self->_updateJaliscoInProgressChangedHandler;
}

- (void)setUpdateJaliscoInProgressChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateJaliscoInProgressChangedHandler, 0);
  objc_storeStrong(&self->_updateSagaInProgressChangedHandler, 0);
  objc_storeStrong(&self->_updateInProgressChangedHandler, 0);
  objc_storeStrong((id *)&self->_icCloudClient, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

uint64_t __57__HSCloudClient__ICCloudItemIDListFromHSCloudItemIDList___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addCloudItemID:idType:", a2, a3);
}

uint64_t __56__HSCloudClient__serverJaliscoUpdateInProgressDidChange__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t result;

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, a3);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

uint64_t __53__HSCloudClient__serverSagaUpdateInProgressDidChange__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t result;

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, a3);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

void __60__HSCloudClient_loadBooksForStoreIDs_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  HSBook *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
        v13 = objc_alloc_init(HSBook);
        -[HSBook setPurchaseHistoryID:](v13, "setPurchaseHistoryID:", objc_msgSend(v12, "purchaseHistoryID"));
        -[HSBook setStoreID:](v13, "setStoreID:", objc_msgSend(v12, "storeID"));
        objc_msgSend(v12, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HSBook setTitle:](v13, "setTitle:", v14);

        objc_msgSend(v12, "author");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HSBook setAuthor:](v13, "setAuthor:", v15);

        objc_msgSend(v12, "genre");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HSBook setGenre:](v13, "setGenre:", v16);

        objc_msgSend(v12, "datePurchased");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HSBook setDatePurchased:](v13, "setDatePurchased:", v17);

        objc_msgSend(v12, "artworkURL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HSBook setArtworkURL:](v13, "setArtworkURL:", v18);

        objc_msgSend(v12, "redownloadParameters");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HSBook setRedownloadParameters:](v13, "setRedownloadParameters:", v19);

        -[HSBook setVppLicensed:](v13, "setVppLicensed:", objc_msgSend(v12, "isVPPLicensed"));
        objc_msgSend(v12, "vppOrganizationID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HSBook setVppOrganizationID:](v13, "setVppOrganizationID:", v20);

        objc_msgSend(v12, "vppOrganizationDisplayName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HSBook setVppOrganizationDisplayName:](v13, "setVppOrganizationDisplayName:", v21);

        objc_msgSend(v6, "addObject:", v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

  v22 = *(_QWORD *)(a1 + 32);
  if (v22)
    (*(void (**)(uint64_t, void *, id))(v22 + 16))(v22, v6, v5);

}

uint64_t __75__HSCloudClient_setAlbumProperties_forAlbumPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __64__HSCloudClient_loadJaliscoUpdateProgressWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __61__HSCloudClient_loadSagaUpdateProgressWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __68__HSCloudClient_loadIsJaliscoUpdateInProgressWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __65__HSCloudClient_loadIsSagaUpdateInProgressWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __57__HSCloudClient_loadUpdateProgressWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __60__HSCloudClient_loadGeniusItemsForSagaID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __88__HSCloudClient_loadArtworkInfoForSubscriptionContainerPersistentIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __87__HSCloudClient_loadArtworkInfoForSubscriptionContainerPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __82__HSCloudClient_loadScreenshotInfoForSubscriptionPersistentIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __81__HSCloudClient_loadScreenshotInfoForSubscriptionPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __83__HSCloudClient_loadArtworkInfoForSubscriptionItemPersistentIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __82__HSCloudClient_loadArtworkInfoForSubscriptionItemPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __64__HSCloudClient_loadScreenshotInfoForSagaIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __63__HSCloudClient_loadScreenshotInfoForSagaID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __70__HSCloudClient_loadArtworkInfoForContainerSagaIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __69__HSCloudClient_loadArtworkInfoForContainerSagaID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __61__HSCloudClient_loadArtworkInfoForSagaIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __60__HSCloudClient_loadArtworkInfoForSagaID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __75__HSCloudClient_loadScreenshotInfoForPurchaseHistoryIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __74__HSCloudClient_loadScreenshotInfoForPurchaseHistoryID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __72__HSCloudClient_loadArtworkInfoForPurchaseHistoryIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __71__HSCloudClient_loadArtworkInfoForPurchaseHistoryID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __77__HSCloudClient_importAlbumArtistHeroImageForPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __72__HSCloudClient_importArtistHeroImageForPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __85__HSCloudClient_importSubscriptionContainerArtworkForPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __79__HSCloudClient_importSubscriptionScreenshotForPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __80__HSCloudClient_importSubscriptionItemArtworkForPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __67__HSCloudClient_importContainerArtworkForSagaID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __61__HSCloudClient_importScreenshotForSagaID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __62__HSCloudClient_importItemArtworkForSagaID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __72__HSCloudClient_importScreenshotForPurchaseHistoryID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __73__HSCloudClient_importItemArtworkForPurchaseHistoryID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __72__HSCloudClient_loadLastKnownEnableICMLErrorStatusWithCompletionHander___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __60__HSCloudClient_isAuthenticatedWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __54__HSCloudClient_isAuthenticatedWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __53__HSCloudClient_deauthenticateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __63__HSCloudClient_updateSagaLibraryWithReason_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __56__HSCloudClient_updateSagaLibraryWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __59__HSCloudClient_updateJaliscoLibraryWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __58__HSCloudClient_removeJaliscoLibraryWithCompletionHander___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __66__HSCloudClient_updateJaliscoLibraryWithReason_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __69__HSCloudClient_authenticateAndStartInitialImport_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __51__HSCloudClient_authenticateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __102__HSCloudClient_addGeniusPlaylistWithPersistentID_name_seedItemSagaIDs_itemSagaIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __67__HSCloudClient_hideItemsWithPurchaseHistoryIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __58__HSCloudClient_removeItemsWithSagaIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __62__HSCloudClient_removePlaylistsWithSagaIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __64__HSCloudClient_addStorePlaylistWithGlobalID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __64__HSCloudClient_sdk_addStoreItemWithOpaqueID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __58__HSCloudClient_addStoreItemWithAdamID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __97__HSCloudClient_updateSubscribedPlaylistsWithSagaIDs_ignoreMinRefreshInterval_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __76__HSCloudClient_uploadArtworkForPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __61__HSCloudClient_publishPlaylistWithSagaID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __91__HSCloudClient_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __80__HSCloudClient_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __85__HSCloudClient_addStoreItemWithAdamID_toPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __91__HSCloudClient_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __91__HSCloudClient_sdk_createPlaylistWithPersistentID_properties_tracklist_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __87__HSCloudClient_createPlaylistWithPersistentID_properties_trackList_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
