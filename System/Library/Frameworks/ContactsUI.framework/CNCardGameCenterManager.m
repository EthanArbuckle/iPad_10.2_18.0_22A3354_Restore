@implementation CNCardGameCenterManager

uint64_t __82__CNCardGameCenterManager_getGameCenterRelationshipsForContact_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleResults:forContact:error:completionHandler:", a2, *(_QWORD *)(a1 + 40), a3, *(_QWORD *)(a1 + 48));
}

- (void)setRecentsManager:(id)a3
{
  objc_storeStrong((id *)&self->_recentsManager, a3);
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (CNCardGameCenterManager)init
{
  CNCardGameCenterManager *v2;
  void *v3;
  uint64_t v4;
  CNSchedulerProvider *schedulerProvider;
  void *v6;
  void *v7;
  uint64_t v8;
  CNScheduler *workQueue;
  CNCardGameCenterManager *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CNCardGameCenterManager;
  v2 = -[CNCardGameCenterManager init](&v12, sel_init);
  if (v2)
  {
    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultSchedulerProvider");
    v4 = objc_claimAutoreleasedReturnValue();
    schedulerProvider = v2->_schedulerProvider;
    v2->_schedulerProvider = (CNSchedulerProvider *)v4;

    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultSchedulerProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "newSerialSchedulerWithName:", CFSTR("com.apple.Contacts.CNCardGameCenterManager.workQueue"));
    workQueue = v2->_workQueue;
    v2->_workQueue = (CNScheduler *)v8;

    v10 = v2;
  }

  return v2;
}

- (void)getGameCenterRelationshipsForContact:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[CNCardGameCenterManager relationshipResultsCancelable](self, "relationshipResultsCancelable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancel");

  -[CNCardGameCenterManager schedulerProvider](self, "schedulerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__CNCardGameCenterManager_getGameCenterRelationshipsForContact_completionHandler___block_invoke;
  v14[3] = &unk_1E204CDE8;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "performCancelableBlock:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardGameCenterManager setRelationshipResultsCancelable:](self, "setRelationshipResultsCancelable:", v13);

}

- (void)setRelationshipResultsCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipResultsCancelable, a3);
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNCancelable)relationshipResultsCancelable
{
  return self->_relationshipResultsCancelable;
}

void __82__CNCardGameCenterManager_getGameCenterRelationshipsForContact_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "gameCenterProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profileServicePrivate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__CNCardGameCenterManager_getGameCenterRelationshipsForContact_completionHandler___block_invoke_2;
  v5[3] = &unk_1E204CDC0;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "getGameCenterRelationshipsForContact:shouldRefresh:completionHandler:", v6, 0, v5);

}

- (GKServiceProxy)gameCenterProxy
{
  GKServiceProxy *gameCenterProxy;
  Class GKDaemonProxyClass_39780;
  void *v5;
  GKServiceProxy *v6;
  GKServiceProxy *v7;

  gameCenterProxy = self->_gameCenterProxy;
  if (!gameCenterProxy)
  {
    GKDaemonProxyClass_39780 = getGKDaemonProxyClass_39780();
    -[objc_class currentLocalPlayer](getGKLocalPlayerClass_39783(), "currentLocalPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class proxyForPlayer:](GKDaemonProxyClass_39780, "proxyForPlayer:", v5);
    v6 = (GKServiceProxy *)objc_claimAutoreleasedReturnValue();
    v7 = self->_gameCenterProxy;
    self->_gameCenterProxy = v6;

    gameCenterProxy = self->_gameCenterProxy;
  }
  return gameCenterProxy;
}

- (void)handleResults:(id)a3 forContact:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, id, id);
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void (**v20)(id, id, id);
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  void (**v25)(id, id, id);
  _QWORD v26[4];
  id v27;
  id v28;
  CNCardGameCenterManager *v29;
  void (**v30)(id, id, id);
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, id, id))a6;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
  {
    CNUILogContactCard();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v12;
      _os_log_error_impl(&dword_18AC56000, v14, OS_LOG_TYPE_ERROR, "Failed to get Game Center relationships: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v10, "_cn_filter:", &__block_literal_global_39773);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v15, "count") < 2)
  {
    v13[2](v13, v10, v11);
  }
  else
  {
    -[CNCardGameCenterManager recentsManager](self, "recentsManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v16, "sortedRecentHandlesMatchingAllPropertiesOfContact:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __76__CNCardGameCenterManager_handleResults_forContact_error_completionHandler___block_invoke_2;
    v26[3] = &unk_1E204CE78;
    v19 = v15;
    v27 = v19;
    v20 = v13;
    v30 = v20;
    v21 = v11;
    v28 = v21;
    v29 = self;
    objc_msgSend(v18, "addSuccessBlock:", v26);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __76__CNCardGameCenterManager_handleResults_forContact_error_completionHandler___block_invoke_4;
    v22[3] = &unk_1E204CEA0;
    v25 = v20;
    v22[4] = self;
    v23 = v19;
    v24 = v21;
    objc_msgSend(v18, "addFailureBlock:", v22);

  }
}

- (id)handles
{
  void *v3;
  void *v4;

  -[CNCardGameCenterManager contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardGameCenterManager handlesForContact:](self, "handlesForContact:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)shouldActionDisplayDropdownMenu
{
  void *v2;
  BOOL v3;

  -[CNCardGameCenterManager handles](self, "handles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (void)refreshGameCenterRelationshipsForContact:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[CNCardGameCenterManager relationshipResultsCancelable](self, "relationshipResultsCancelable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancel");

  -[CNCardGameCenterManager schedulerProvider](self, "schedulerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __86__CNCardGameCenterManager_refreshGameCenterRelationshipsForContact_completionHandler___block_invoke;
  v14[3] = &unk_1E204CDE8;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "performCancelableBlock:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardGameCenterManager setRelationshipResultsCancelable:](self, "setRelationshipResultsCancelable:", v13);

}

- (id)defaultFriendResultFromFriendResults:(id)a3 forContact:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CNCardGameCenterManager handlesForContact:](self, "handlesForContact:", a4);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    v11 = MEMORY[0x1E0C809B0];
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        v17[0] = v11;
        v17[1] = 3221225472;
        v17[2] = __75__CNCardGameCenterManager_defaultFriendResultFromFriendResults_forContact___block_invoke;
        v17[3] = &unk_1E204CE50;
        v17[4] = v13;
        objc_msgSend(v6, "_cn_firstObjectPassingTest:", v17);
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;

          goto LABEL_11;
        }
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }

  objc_msgSend(v6, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v15;
}

- (id)handlesForContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "phoneNumbers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_map:", &__block_literal_global_12_39765);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "emailAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_cn_map:", &__block_literal_global_13_39766);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CNContact)contact
{
  return self->_contact;
}

- (CNUICoreRecentsManager)recentsManager
{
  return self->_recentsManager;
}

- (BOOL)hasSentInvite
{
  return self->_hasSentInvite;
}

- (void)setHasSentInvite:(BOOL)a3
{
  self->_hasSentInvite = a3;
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (void)setGameCenterProxy:(id)a3
{
  objc_storeStrong((id *)&self->_gameCenterProxy, a3);
}

- (BOOL)hasCheckedAuthenticatedLocalPlayer
{
  return self->_hasCheckedAuthenticatedLocalPlayer;
}

- (void)setHasCheckedAuthenticatedLocalPlayer:(BOOL)a3
{
  self->_hasCheckedAuthenticatedLocalPlayer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gameCenterProxy, 0);
  objc_storeStrong((id *)&self->_relationshipResultsCancelable, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_recentsManager, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

uint64_t __45__CNCardGameCenterManager_handlesForContact___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

id __45__CNCardGameCenterManager_handlesForContact___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __75__CNCardGameCenterManager_defaultFriendResultFromFriendResults_forContact___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(v3, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_rangeOfCommonPrefixWithString:", CFSTR("tel:"));
  v6 = v5;

  if (!v6)
  {
    objc_msgSend(v3, "handle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_cn_rangeOfCommonPrefixWithString:", CFSTR("mailto:"));
    v6 = v8;

  }
  objc_msgSend(v3, "handle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_cn_skip:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v11;
}

void __76__CNCardGameCenterManager_handleResults_forContact_error_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __76__CNCardGameCenterManager_handleResults_forContact_error_completionHandler___block_invoke_3;
  v14 = &unk_1E204CE50;
  v5 = v3;
  v15 = v5;
  objc_msgSend(v4, "_cn_firstObjectPassingTest:", &v11);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = *(_QWORD *)(a1 + 56);
  if (v6)
  {
    v17[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1, v11, v12, v13, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "defaultFriendResultFromFriendResults:forContact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v11, v12, v13, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v10, *(_QWORD *)(a1 + 40));

  }
}

void __76__CNCardGameCenterManager_handleResults_forContact_error_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CNUILogContactCard();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_error_impl(&dword_18AC56000, v4, OS_LOG_TYPE_ERROR, "Failed to query recents: %@", buf, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "defaultFriendResultFromFriendResults:forContact:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v7, *(_QWORD *)(a1 + 48));

}

uint64_t __76__CNCardGameCenterManager_handleResults_forContact_error_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

BOOL __76__CNCardGameCenterManager_handleResults_forContact_error_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "relationship") == 2;
}

void __86__CNCardGameCenterManager_refreshGameCenterRelationshipsForContact_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "gameCenterProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profileServicePrivate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__CNCardGameCenterManager_refreshGameCenterRelationshipsForContact_completionHandler___block_invoke_2;
  v5[3] = &unk_1E204CDC0;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "getGameCenterRelationshipsForContact:shouldRefresh:completionHandler:", v6, 1, v5);

}

uint64_t __86__CNCardGameCenterManager_refreshGameCenterRelationshipsForContact_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleResults:forContact:error:completionHandler:", a2, *(_QWORD *)(a1 + 40), a3, *(_QWORD *)(a1 + 48));
}

@end
