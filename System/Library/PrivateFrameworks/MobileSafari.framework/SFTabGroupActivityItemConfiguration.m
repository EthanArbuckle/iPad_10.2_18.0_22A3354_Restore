@implementation SFTabGroupActivityItemConfiguration

- (SFTabGroupActivityItemConfiguration)initWithTabGroup:(id)a3 inTabGroupManager:(id)a4 existingShare:(id)a5 icon:(id)a6
{
  id v11;
  id v12;
  id v13;
  UIImage *v14;
  SFTabGroupActivityItemConfiguration *v15;
  SFTabGroupActivityItemConfiguration *v16;
  uint64_t v17;
  CKShare *existingShare;
  NSItemProvider *v19;
  NSItemProvider *itemProvider;
  void *v21;
  LPLinkMetadata *v22;
  LPLinkMetadata *linkMetadata;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSItemProvider *v29;
  void *v30;
  NSItemProvider *v31;
  void *v32;
  SFTabGroupActivityItemConfiguration *v33;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id location;
  objc_super v41;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (UIImage *)a6;
  v41.receiver = self;
  v41.super_class = (Class)SFTabGroupActivityItemConfiguration;
  v15 = -[SFTabGroupActivityItemConfiguration init](&v41, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_tabGroup, a3);
    objc_storeStrong((id *)&v16->_tabGroupManager, a4);
    v17 = objc_msgSend(v13, "copy");
    existingShare = v16->_existingShare;
    v16->_existingShare = (CKShare *)v17;

    v19 = (NSItemProvider *)objc_alloc_init(MEMORY[0x1E0CB36C8]);
    itemProvider = v16->_itemProvider;
    v16->_itemProvider = v19;

    -[WBTabGroup title](v16->_tabGroup, "title");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSItemProvider setSuggestedName:](v16->_itemProvider, "setSuggestedName:", v21);

    v22 = (LPLinkMetadata *)objc_alloc_init(MEMORY[0x1E0CC11A8]);
    linkMetadata = v16->_linkMetadata;
    v16->_linkMetadata = v22;

    -[WBTabGroup title](v16->_tabGroup, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setTitle:](v16->_linkMetadata, "setTitle:", v24);

    v25 = objc_alloc_init(MEMORY[0x1E0CC1190]);
    objc_msgSend(v25, "setType:", 5);
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:properties:", v14, v25);
    -[LPLinkMetadata setImage:](v16->_linkMetadata, "setImage:", v26);

    UIImagePNGRepresentation(v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94BA8]), "initWithAllowedParticipantPermissionOptions:allowedParticipantAccessOptions:", 2, 2);
    objc_msgSend(v28, "setSupportAllowingAddedParticipantsToInviteOthers:", 1);
    if (v13)
    {
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0C94A78]);
      v29 = v16->_itemProvider;
      objc_msgSend(MEMORY[0x1E0C94C28], "safari_cloudTabsContainer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSItemProvider registerCKShare:container:allowedSharingOptions:](v29, "registerCKShare:container:allowedSharingOptions:", v13, v30, v28);

    }
    else
    {
      v35 = v12;
      objc_initWeak(&location, v16);
      v31 = v16->_itemProvider;
      objc_msgSend(MEMORY[0x1E0C94C28], "safari_cloudTabsContainer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __93__SFTabGroupActivityItemConfiguration_initWithTabGroup_inTabGroupManager_existingShare_icon___block_invoke;
      v36[3] = &unk_1E21E2EF8;
      objc_copyWeak(&v39, &location);
      v37 = v11;
      v38 = v27;
      -[NSItemProvider registerCKShareWithContainer:allowedSharingOptions:preparationHandler:](v31, "registerCKShareWithContainer:allowedSharingOptions:preparationHandler:", v32, v28, v36);

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
      v12 = v35;
    }
    v33 = v16;

  }
  return v16;
}

void __93__SFTabGroupActivityItemConfiguration_initWithTabGroup_inTabGroupManager_existingShare_icon___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __93__SFTabGroupActivityItemConfiguration_initWithTabGroup_inTabGroupManager_existingShare_icon___block_invoke_2;
    v5[3] = &unk_1E21E2ED0;
    v6 = a1[4];
    objc_copyWeak(&v9, a1 + 6);
    v7 = a1[5];
    v8 = v3;
    objc_msgSend(WeakRetained, "_beginSharingTabGroupWithCompletionHandler:", v5);

    objc_destroyWeak(&v9);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
  }

}

void __93__SFTabGroupActivityItemConfiguration_initWithTabGroup_inTabGroupManager_existingShare_icon___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id WeakRetained;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("SFTabGroupDidBeginSharingNotification"), v7);

  }
  if (objc_msgSend(v5, "safari_matchesErrorDomain:andCode:", *MEMORY[0x1E0D89DB8], 2))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_presentSharedTabGroupsManateePrompt");

  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0C94A78]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (NSArray)itemProvidersForActivityItemsConfiguration
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_itemProvider;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)activityItemsConfigurationMetadataForKey:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqual:", *MEMORY[0x1E0DC4710]))
  {
    -[WBTabGroup title](self->_tabGroup, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)activityItemsConfigurationMetadataForItemAtIndex:(int64_t)a3 key:(id)a4
{
  LPLinkMetadata *v5;

  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0DC4700]))
    v5 = self->_linkMetadata;
  else
    v5 = 0;
  return v5;
}

- (void)updateMetadataIcon:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  if (!self->_existingShare)
  {
    v4 = (objc_class *)MEMORY[0x1E0CC1190];
    v5 = a3;
    v7 = objc_alloc_init(v4);
    objc_msgSend(v7, "setType:", 5);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:properties:", v5, v7);

    -[LPLinkMetadata setImage:](self->_linkMetadata, "setImage:", v6);
  }
}

- (void)_beginSharingTabGroupWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  CKShare *existingShare;
  NSMutableArray *pendingShareCompletionHandlers;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  NSObject *v13;
  WBTabGroup *tabGroup;
  NSObject *v15;
  void *v16;
  WBTabGroupManager *tabGroupManager;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  existingShare = self->_existingShare;
  if (existingShare)
  {
    (*((void (**)(id, CKShare *, _QWORD))v4 + 2))(v4, existingShare, 0);
  }
  else
  {
    pendingShareCompletionHandlers = self->_pendingShareCompletionHandlers;
    if (pendingShareCompletionHandlers)
    {
      v8 = _Block_copy(v4);
      -[NSMutableArray addObject:](pendingShareCompletionHandlers, "addObject:", v8);

    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C99DE8];
      v10 = _Block_copy(v4);
      objc_msgSend(v9, "arrayWithObject:", v10);
      v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v12 = self->_pendingShareCompletionHandlers;
      self->_pendingShareCompletionHandlers = v11;

      v13 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        tabGroup = self->_tabGroup;
        v15 = v13;
        -[WBTabGroup uuid](tabGroup, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v22 = v16;
        _os_log_impl(&dword_18B7B2000, v15, OS_LOG_TYPE_INFO, "Requesting share for tab group with UUID %{public}@", buf, 0xCu);

      }
      objc_initWeak((id *)buf, self);
      tabGroupManager = self->_tabGroupManager;
      -[WBTabGroup uuid](self->_tabGroup, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __82__SFTabGroupActivityItemConfiguration__beginSharingTabGroupWithCompletionHandler___block_invoke;
      v19[3] = &unk_1E21E2F20;
      objc_copyWeak(&v20, (id *)buf);
      -[WBTabGroupManager beginSharingTabGroupWithUUID:completionHandler:](tabGroupManager, "beginSharingTabGroupWithUUID:completionHandler:", v18, v19);

      objc_destroyWeak(&v20);
      objc_destroyWeak((id *)buf);
    }
  }

}

void __82__SFTabGroupActivityItemConfiguration__beginSharingTabGroupWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__SFTabGroupActivityItemConfiguration__beginSharingTabGroupWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E21E2D20;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __82__SFTabGroupActivityItemConfiguration__beginSharingTabGroupWithCompletionHandler___block_invoke_2(id *a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!WeakRetained)
    goto LABEL_16;
  v3 = a1[4];
  v4 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      v6 = (void *)*((_QWORD *)WeakRetained + 5);
      v7 = v4;
      objc_msgSend(v6, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v8;
      _os_log_impl(&dword_18B7B2000, v7, OS_LOG_TYPE_INFO, "Received share for tab group with UUID %{public}@", buf, 0xCu);

LABEL_7:
    }
  }
  else if (v5)
  {
    v9 = (void *)*((_QWORD *)WeakRetained + 5);
    v10 = v4;
    objc_msgSend(v9, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "safari_privacyPreservingDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v8;
    v25 = 2114;
    v26 = v11;
    _os_log_impl(&dword_18B7B2000, v10, OS_LOG_TYPE_INFO, "Failed to get share for tab group with UUID %{public}@, %{public}@", buf, 0x16u);

    goto LABEL_7;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = *((id *)WeakRetained + 3);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16) + 16))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16));
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

  objc_storeStrong((id *)WeakRetained + 1, a1[4]);
  v17 = (void *)*((_QWORD *)WeakRetained + 3);
  *((_QWORD *)WeakRetained + 3) = 0;

LABEL_16:
}

- (void)_presentSharedTabGroupsManateePrompt
{
  id v2;

  +[SFSystemAlert sharedTabGroupsManateeAlert](SFSystemAlert, "sharedTabGroupsManateeAlert");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduleWithCompletionBlock:", &__block_literal_global_4);

}

void __75__SFTabGroupActivityItemConfiguration__presentSharedTabGroupsManateePrompt__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (a2 != 2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

  }
}

- (void)dealloc
{
  NSMutableArray *pendingShareCompletionHandlers;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  pendingShareCompletionHandlers = self->_pendingShareCompletionHandlers;
  if (pendingShareCompletionHandlers)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = pendingShareCompletionHandlers;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

    v9 = self->_pendingShareCompletionHandlers;
    self->_pendingShareCompletionHandlers = 0;

  }
  v10.receiver = self;
  v10.super_class = (Class)SFTabGroupActivityItemConfiguration;
  -[SFTabGroupActivityItemConfiguration dealloc](&v10, sel_dealloc);
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (WBTabGroup)tabGroup
{
  return self->_tabGroup;
}

- (WBTabGroupManager)tabGroupManager
{
  return self->_tabGroupManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabGroupManager, 0);
  objc_storeStrong((id *)&self->_tabGroup, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_pendingShareCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_existingShare, 0);
}

@end
