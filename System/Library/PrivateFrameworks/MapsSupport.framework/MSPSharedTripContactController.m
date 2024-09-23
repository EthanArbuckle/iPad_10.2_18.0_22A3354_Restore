@implementation MSPSharedTripContactController

void __61__MSPSharedTripContactController_updateActiveSharingHandles___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateActiveSharingHandles:", *(_QWORD *)(a1 + 32));

}

- (void)_updateActiveSharingHandles:(id)a3
{
  id v4;
  void *v5;
  NSOrderedSet *activeHandles;
  unint64_t v7;
  id v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  NSOrderedSet *v34;
  NSOrderedSet *activeContacts;
  NSObject *v36;
  MSPSharedTripContactController *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint8_t v52[128];
  uint8_t buf[4];
  unint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  activeHandles = self->_activeHandles;
  v7 = v5;
  v8 = activeHandles;
  if (v7 | (unint64_t)v8)
  {
    v9 = v8;
    v10 = objc_msgSend((id)v7, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
      MSPGetSharedTripLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v54 = v7;
        _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_DEFAULT, "[ContactController] updating _activeHandles with: %{private}@", buf, 0xCu);
      }

      objc_storeStrong((id *)&self->_activeHandles, v5);
      v12 = (void *)-[NSOrderedSet mutableCopy](self->_activeContacts, "mutableCopy");
      v13 = (void *)objc_msgSend((id)v7, "mutableCopy");
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v14 = v12;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v48 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "handleForIDS");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "removeObject:", v19);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        }
        while (v16);
      }

      objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isInternalInstall");

      if (v21)
      {
        v37 = self;
        v38 = v4;
        MSPSharedTripGetVirtualReceivers(v13);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v44;
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v44 != v25)
                objc_enumerationMutation(v22);
              v27 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
              +[MSPSharedTripContact virtualReceiverWithHandle:](MSPSharedTripContact, "virtualReceiverWithHandle:", v27, v37, v38);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addObject:", v28);

              objc_msgSend(v13, "removeObject:", v27);
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          }
          while (v24);
        }

        self = v37;
        v4 = v38;
      }
      if (objc_msgSend(v13, "count", v37, v38))
      {
        objc_msgSend(v13, "allObjects");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[MSPSharedTripContact contactsFromIDSHandles:](MSPSharedTripContact, "contactsFromIDSHandles:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObjectsFromArray:", v30);

      }
      v31 = MEMORY[0x1E0C809B0];
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __62__MSPSharedTripContactController__updateActiveSharingHandles___block_invoke;
      v41[3] = &unk_1E66536C0;
      v32 = (id)v7;
      v42 = v32;
      objc_msgSend(v14, "indexesOfObjectsPassingTest:", v41);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectsAtIndexes:", v33);
      v39[0] = v31;
      v39[1] = 3221225472;
      v39[2] = __62__MSPSharedTripContactController__updateActiveSharingHandles___block_invoke_2;
      v39[3] = &unk_1E66536E8;
      v40 = v32;
      objc_msgSend(v14, "sortUsingComparator:", v39);
      v34 = (NSOrderedSet *)objc_msgSend(v14, "copy");
      activeContacts = self->_activeContacts;
      self->_activeContacts = v34;

      MSPGetSharedTripLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v54 = (unint64_t)v14;
        _os_log_impl(&dword_1B39C0000, v36, OS_LOG_TYPE_DEFAULT, "[ContactController] activeContacts is now: %{private}@", buf, 0xCu);
      }

      -[MSPSharedTripContactController _notifyDelegateContactsChanged](self, "_notifyDelegateContactsChanged");
    }
  }

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MSPSharedTripContactController)initWithSharedTripServer:(id)a3
{
  id v4;
  MSPSharedTripContactController *v5;
  MSPSharedTripContactController *v6;
  uint64_t v7;
  NSUUID *sessionIdentifier;
  NSOrderedSet *v9;
  NSOrderedSet *activeHandles;
  NSOrderedSet *v11;
  NSOrderedSet *activeContacts;
  NSMutableSet *v13;
  NSMutableSet *pendingContacts;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *isolationQueue;
  void *v18;
  void *v19;
  char v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MSPSharedTripContactController;
  v5 = -[MSPSharedTripContactController init](&v22, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sharedTripServer, v4);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v6->_sessionIdentifier;
    v6->_sessionIdentifier = (NSUUID *)v7;

    v9 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E40]);
    activeHandles = v6->_activeHandles;
    v6->_activeHandles = v9;

    v11 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E40]);
    activeContacts = v6->_activeContacts;
    v6->_activeContacts = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pendingContacts = v6->_pendingContacts;
    v6->_pendingContacts = v13;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.Maps.SharedTrip.ContactController", v15);
    isolationQueue = v6->_isolationQueue;
    v6->_isolationQueue = (OS_dispatch_queue *)v16;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D26D08]);

    if ((v20 & 1) == 0)
      objc_msgSend(MEMORY[0x1E0D27698], "setInitialShareSessionWithMaps:", 1);
  }

  return v6;
}

- (void)updateActiveSharingHandles:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MSPSharedTripContactController_updateActiveSharingHandles___block_invoke;
  block[3] = &unk_1E6651C58;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_notifyDelegateContactsChanged
{
  void *v3;
  NSOrderedSet *v4;
  NSOrderedSet *v5;
  _QWORD block[4];
  id v7;
  MSPSharedTripContactController *v8;
  NSOrderedSet *v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[MSPSharedTripContactController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = self->_activeContacts;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__MSPSharedTripContactController__notifyDelegateContactsChanged__block_invoke;
    block[3] = &unk_1E66534B8;
    v7 = v3;
    v8 = self;
    v9 = v4;
    v5 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __64__MSPSharedTripContactController__notifyDelegateContactsChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sharedTripContactController:didUpdateActiveContactsValues:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)shareWithContactValue:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *isolationQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__MSPSharedTripContactController_shareWithContactValue_queue_completion___block_invoke;
  block[3] = &unk_1E66534E0;
  objc_copyWeak(&v19, &location);
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __73__MSPSharedTripContactController_shareWithContactValue_queue_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_shareWithContactValue:queue:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_shareWithContactValue:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  const __CFString *v27;
  NSObject *v28;
  void *v29;
  int v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  OS_dispatch_queue *isolationQueue;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  NSObject *v49;
  id v50;
  id v51;
  uint64_t *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  uint64_t *v56;
  _QWORD v57[5];
  id v58;
  NSObject *v59;
  id v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD block[4];
  id v67;
  _QWORD v68[4];
  id v69;
  void *v70;
  uint8_t buf[4];
  uint64_t v72;
  __int16 v73;
  const __CFString *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_sharedTripServer);
  if (v8)
  {
    if (-[MSPSharedTripContactController _contactIsActive:](self, "_contactIsActive:", v8))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_2;
      block[3] = &unk_1E6653508;
      v67 = v10;
      dispatch_async(v9, block);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D26D08]);

      if ((v14 & 1) == 0)
        objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", 9025, 0, 0);
      objc_msgSend(v8, "handleForIDS");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v62 = 0;
        v63 = &v62;
        v64 = 0x2020000000;
        v65 = 0;
        +[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "capabilityLevelForContact:", v8);

        v65 = v17;
        v18 = (void *)-[NSUUID copy](self->_sessionIdentifier, "copy");
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_3;
        v57[3] = &unk_1E6653558;
        v57[4] = self;
        v19 = v8;
        v58 = v19;
        v61 = &v62;
        v20 = v9;
        v59 = v20;
        v21 = v10;
        v60 = v21;
        v42 = (void *)MEMORY[0x1B5E2B4E8](v57);
        v22 = v63[3];
        if ((unint64_t)(v22 - 2) >= 3)
        {
          if (v22)
          {
            if (v22 == 1)
            {
              MSPGetSharedTripLog();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v19, "handleForIDS");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v72 = (uint64_t)v29;
                _os_log_impl(&dword_1B39C0000, v28, OS_LOG_TYPE_ERROR, "[ContactController] shareWithContactValue called for handle %@ with MSPSharedTripCapabilityType_Invalid. Exiting Early.", buf, 0xCu);

              }
              v53[0] = MEMORY[0x1E0C809B0];
              v53[1] = 3221225472;
              v53[2] = __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_16;
              v53[3] = &unk_1E6653580;
              v55 = v21;
              v56 = &v62;
              v54 = v19;
              dispatch_async(v20, v53);

            }
          }
          else
          {
            v41 = v18;
            v30 = -[NSMutableSet containsObject:](self->_pendingContacts, "containsObject:", v19);
            MSPGetSharedTripLog();
            v31 = objc_claimAutoreleasedReturnValue();
            v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
            if (v30)
            {
              v18 = v41;
              if (v32)
              {
                objc_msgSend(v19, "handleForIDS");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v72 = (uint64_t)v33;
                _os_log_impl(&dword_1B39C0000, v31, OS_LOG_TYPE_INFO, "[ContactController] shareWithContactValue called for handle %@ with MSPSharedTripCapabilityType_Unknown. Already waiting for response.", buf, 0xCu);

              }
            }
            else
            {
              if (v32)
              {
                objc_msgSend(v19, "handleForIDS");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v72 = (uint64_t)v38;
                _os_log_impl(&dword_1B39C0000, v31, OS_LOG_TYPE_INFO, "[ContactController] shareWithContactValue called for handle %@ with MSPSharedTripCapabilityType_Unknown. Will wait for response.", buf, 0xCu);

              }
              -[NSMutableSet addObject:](self->_pendingContacts, "addObject:", v19);
              +[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              isolationQueue = self->_isolationQueue;
              v45[0] = MEMORY[0x1E0C809B0];
              v45[1] = 3221225472;
              v45[2] = __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_18;
              v45[3] = &unk_1E66535D0;
              v45[4] = self;
              v46 = v41;
              v47 = v19;
              v52 = &v62;
              v48 = WeakRetained;
              v50 = v42;
              v49 = v20;
              v51 = v21;
              objc_msgSend(v39, "fetchCapabilityLevelForContact:timeout:queue:completion:", v47, isolationQueue, v45, 0.0);

              v18 = v41;
            }
          }
        }
        else
        {
          MSPGetSharedTripLog();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v19, "handleForIDS");
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = (void *)v24;
            v26 = v63[3];
            if (v26 > 4)
              v27 = CFSTR("Unknown");
            else
              v27 = off_1E6653730[v26];
            *(_DWORD *)buf = 138412546;
            v72 = v24;
            v73 = 2114;
            v74 = v27;
            _os_log_impl(&dword_1B39C0000, v23, OS_LOG_TYPE_INFO, "[ContactController] shareWithContactValue called for handle %@ with %{public}@. Will pass to trip service.", buf, 0x16u);

          }
          v34 = v18;
          objc_msgSend(v19, "handleForIDS");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = v35;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v63[3];
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_21;
          v43[3] = &unk_1E66535A8;
          v44 = v42;
          objc_msgSend(WeakRetained, "startSharingTripWithContacts:capabilityType:completion:", v36, v37, v43);

          v18 = v34;
        }

        _Block_object_dispose(&v62, 8);
      }
    }
  }
  else
  {
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke;
    v68[3] = &unk_1E6653508;
    v69 = v10;
    dispatch_async(v9, v68);

  }
}

void __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v4 = *MEMORY[0x1E0CB2938];
  v5[0] = CFSTR("No contacts provided");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.SharedTrip"), 10, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v3);
}

void __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v4 = *MEMORY[0x1E0CB2938];
  v5[0] = CFSTR("Already sharing with contacts");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.SharedTrip"), 12, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v3);
}

void __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_4;
  v9[3] = &unk_1E6653530;
  v9[4] = v4;
  v7 = v5;
  v14 = *(_QWORD *)(a1 + 64);
  v10 = v7;
  v11 = v3;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v8 = v3;
  dispatch_async(v6, v9);

}

uint64_t __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didStartSharingWithContact:withCapabilityType:error:queue:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_16(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v1 = a1[5];
  v2 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  v7 = a1[4];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = *MEMORY[0x1E0CB2938];
    v8[0] = CFSTR("InvalidContacts");
    v8[1] = v4;
    v9[0] = v3;
    v9[1] = CFSTR("Contacts not valid due to missing/unusable handles");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.SharedTrip"), 14, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  (*(void (**)(uint64_t, uint64_t, void *))(v1 + 16))(v1, v2, v6);
}

void __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_18(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    MSPGetSharedTripLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 48), "handleForIDS");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v18 = v8;
      v9 = "[ContactController] shareWithContactValue will not retry sharing for pending handle %{private}@ as that session is over";
LABEL_11:
      _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_INFO, v9, buf, 0xCu);

    }
LABEL_12:

    return;
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", *(_QWORD *)(a1 + 48)) & 1) == 0)
  {
    MSPGetSharedTripLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 48), "handleForIDS");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v18 = v8;
      v9 = "[ContactController] shareWithContactValue will not retry sharing for pending handle %{private}@ as it was rem"
           "oved from the pending set";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 48));
  MSPGetSharedTripLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 48), "handleForIDS");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v18 = v6;
      v19 = 2048;
      v20 = a2;
      _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_INFO, "[ContactController] shareWithContactValue received capability for pending contact %{private}@: %lu", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_shareWithContactValue:queue:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80));
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 48), "handleForIDS");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v18 = v10;
      _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_INFO, "[ContactController] shareWithContactValue timed out waiting for pending contact %{private}@. falling back to messages", buf, 0xCu);

    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 3;
    v11 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "handleForIDS");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_19;
    v15[3] = &unk_1E66535A8;
    v16 = *(id *)(a1 + 72);
    objc_msgSend(v11, "startSharingTripWithContacts:capabilityType:completion:", v13, v14, v15);

  }
}

uint64_t __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__MSPSharedTripContactController__shareWithContactValue_queue_completion___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_didStartSharingWithContact:(id)a3 withCapabilityType:(unint64_t)a4 error:(id)a5 queue:(id)a6 completion:(id)a7
{
  __CFString *v11;
  id v12;
  NSObject *isolationQueue;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  void *v19;
  void *v20;
  char v21;
  const __CFString *v22;
  __CFString *v23;
  id v24;
  _QWORD block[4];
  __CFString *v26;
  id v27;
  unint64_t v28;
  uint8_t buf[4];
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = (__CFString *)a5;
  v12 = a7;
  isolationQueue = self->_isolationQueue;
  v14 = a6;
  dispatch_assert_queue_V2(isolationQueue);
  if (v11)
  {
    MSPGetSharedTripLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v11;
      v16 = "[ContactController] Error trying to start sharing: %{public}@";
      v17 = v15;
      v18 = OS_LOG_TYPE_ERROR;
LABEL_11:
      _os_log_impl(&dword_1B39C0000, v17, v18, v16, buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D26D08]);

    if ((v21 & 1) == 0)
      objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", 104, 0, 0);
    MSPGetSharedTripLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (a4 > 4)
        v22 = CFSTR("Unknown");
      else
        v22 = off_1E6653730[a4];
      *(_DWORD *)buf = 138543362;
      v30 = v22;
      v16 = "[ContactController] Did start sharing via %{public}@";
      v17 = v15;
      v18 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_11;
    }
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__MSPSharedTripContactController__didStartSharingWithContact_withCapabilityType_error_queue_completion___block_invoke;
  block[3] = &unk_1E66535F8;
  v27 = v12;
  v28 = a4;
  v26 = v11;
  v23 = v11;
  v24 = v12;
  dispatch_async(v14, block);

}

uint64_t __104__MSPSharedTripContactController__didStartSharingWithContact_withCapabilityType_error_queue_completion___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)stopSharingWithContactValue:(id)a3 reason:(unint64_t)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *isolationQueue;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21[2];
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __86__MSPSharedTripContactController_stopSharingWithContactValue_reason_queue_completion___block_invoke;
  v17[3] = &unk_1E6653620;
  objc_copyWeak(v21, &location);
  v18 = v10;
  v19 = v11;
  v21[1] = (id)a4;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(isolationQueue, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __86__MSPSharedTripContactController_stopSharingWithContactValue_reason_queue_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_stopSharingWithContactValue:reason:queue:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_stopSharingWithContactValue:(id)a3 reason:(unint64_t)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  NSOrderedSet *activeHandles;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id WeakRetained;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD block[4];
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (v10)
  {
    activeHandles = self->_activeHandles;
    objc_msgSend(v10, "handleForIDS");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(activeHandles) = -[NSOrderedSet containsObject:](activeHandles, "containsObject:", v14);

    if ((activeHandles & 1) != 0)
    {
      -[NSMutableSet removeObject:](self->_pendingContacts, "removeObject:", v10);
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0D26D08]);

      if ((v17 & 1) == 0)
        objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", 9026, 0, 0);
      WeakRetained = objc_loadWeakRetained((id *)&self->_sharedTripServer);
      objc_msgSend(v10, "handleForIDS");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "stopSharingTripWithContacts:reason:completion:", v20, a4, v12);

    }
    else
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __87__MSPSharedTripContactController__stopSharingWithContactValue_reason_queue_completion___block_invoke_2;
      v21[3] = &unk_1E6653508;
      v22 = v12;
      dispatch_async(v11, v21);
      WeakRetained = v22;
    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__MSPSharedTripContactController__stopSharingWithContactValue_reason_queue_completion___block_invoke;
    block[3] = &unk_1E6653508;
    v24 = v12;
    dispatch_async(v11, block);
    WeakRetained = v24;
  }

}

void __87__MSPSharedTripContactController__stopSharingWithContactValue_reason_queue_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v4 = *MEMORY[0x1E0CB2938];
  v5[0] = CFSTR("No contacts provided");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.SharedTrip"), 10, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

void __87__MSPSharedTripContactController__stopSharingWithContactValue_reason_queue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v4 = *MEMORY[0x1E0CB2938];
  v5[0] = CFSTR("Not currently sharing with contacts");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.SharedTrip"), 13, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

- (void)stopAllSharingWithReason:(unint64_t)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *isolationQueue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__MSPSharedTripContactController_stopAllSharingWithReason_queue_completion___block_invoke;
  block[3] = &unk_1E6653648;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a3;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __76__MSPSharedTripContactController_stopAllSharingWithReason_queue_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_stopAllSharingWithReason:queue:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_stopAllSharingWithReason:(unint64_t)a3 queue:(id)a4 completion:(id)a5
{
  NSObject *v8;
  id v9;
  id WeakRetained;
  _QWORD block[4];
  id v12;

  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (-[NSOrderedSet count](self->_activeHandles, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_sharedTripServer);
    objc_msgSend(WeakRetained, "stopSharingTripWithReason:completion:", a3, v9);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__MSPSharedTripContactController__stopAllSharingWithReason_queue_completion___block_invoke;
    block[3] = &unk_1E6653508;
    v12 = v9;
    dispatch_async(v8, block);

  }
}

void __77__MSPSharedTripContactController__stopAllSharingWithReason_queue_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v4 = *MEMORY[0x1E0CB2938];
  v5[0] = CFSTR("Not currently sharing with contacts");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.SharedTrip"), 13, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

- (NSOrderedSet)activeContactsValues
{
  NSObject *isolationQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  isolationQueue = self->_isolationQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__MSPSharedTripContactController_activeContactsValues__block_invoke;
  v6[3] = &unk_1E6653670;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(isolationQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSOrderedSet *)v4;
}

void __54__MSPSharedTripContactController_activeContactsValues__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (BOOL)contactIsActive:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  id v11;
  id location;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__MSPSharedTripContactController_contactIsActive___block_invoke;
  v8[3] = &unk_1E6653698;
  v10 = &v13;
  objc_copyWeak(&v11, &location);
  v9 = v4;
  v6 = v4;
  dispatch_sync(isolationQueue, v8);
  LOBYTE(isolationQueue) = *((_BYTE *)v14 + 24);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v13, 8);
  return (char)isolationQueue;
}

void __50__MSPSharedTripContactController_contactIsActive___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(WeakRetained, "_contactIsActive:", *(_QWORD *)(a1 + 32));

}

- (BOOL)_contactIsActive:(id)a3
{
  NSObject *isolationQueue;
  id v5;
  NSOrderedSet *activeHandles;
  void *v7;

  isolationQueue = self->_isolationQueue;
  v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  activeHandles = self->_activeHandles;
  objc_msgSend(v5, "handleForIDS");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(activeHandles) = -[NSOrderedSet containsObject:](activeHandles, "containsObject:", v7);
  return (char)activeHandles;
}

uint64_t __62__MSPSharedTripContactController__updateActiveSharingHandles___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "handleForIDS");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

uint64_t __62__MSPSharedTripContactController__updateActiveSharingHandles___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "handleForIDS");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "indexOfObject:", v7);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "handleForIDS");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v9, "indexOfObject:", v10);
  if (v8 < v11)
    return -1;
  else
    return v8 > v11;
}

- (MSPSharingRestorationStorage)archivedSharingStorage
{
  NSObject *isolationQueue;
  id v4;
  _QWORD block[5];
  id v7;
  id location;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  v14 = 0;
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MSPSharedTripContactController_archivedSharingStorage__block_invoke;
  block[3] = &unk_1E6653710;
  block[4] = &v9;
  objc_copyWeak(&v7, &location);
  dispatch_sync(isolationQueue, block);
  v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return (MSPSharingRestorationStorage *)v4;
}

void __56__MSPSharedTripContactController_archivedSharingStorage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_archivedSharingStorage");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_archivedSharingStorage
{
  void *v3;
  NSOrderedSet *v4;
  MSPSharingRestorationStorage *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char IsValid;
  void *v15;
  uint64_t v16;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  NSOrderedSet *obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v3 = (void *)-[NSOrderedSet mutableCopy](self->_activeHandles, "mutableCopy");
  if (!objc_msgSend(v3, "count"))
  {
    v5 = 0;
    goto LABEL_35;
  }
  v4 = self->_activeContacts;
  v5 = objc_alloc_init(MSPSharingRestorationStorage);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[MSPSharingRestorationStorage setCreatedTimestamp:](v5, "setCreatedTimestamp:");
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v4;
  v6 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (!v6)
    goto LABEL_22;
  v7 = v6;
  v8 = *(_QWORD *)v33;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v33 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
      objc_msgSend(v10, "handleForIDS");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeObject:", v11);

      objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isInternalInstall") & 1) != 0)
      {
        objc_msgSend(v10, "handleForIDS");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        IsValid = MSPSharedTripVirtualReceiverIsValid(v13);

        if ((IsValid & 1) != 0)
          continue;
      }
      else
      {

      }
      +[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "capabilityLevelForContact:", v10);

      if ((unint64_t)(v16 - 2) < 2 || v16 == 0)
      {
        objc_msgSend(v10, "stringValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSPSharingRestorationStorage addMessagesIdentifier:](v5, "addMessagesIdentifier:", v18);
      }
      else
      {
        if (v16 != 4)
          continue;
        objc_msgSend(v10, "stringValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSPSharingRestorationStorage addMapsIdentifier:](v5, "addMapsIdentifier:", v18);
      }

    }
    v7 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  }
  while (v7);
LABEL_22:

  if (objc_msgSend(v3, "count"))
  {
    MSPGetSharedTripLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      v20 = objc_msgSend(v3, "count");
      *(_DWORD *)buf = 134218243;
      v38 = v20;
      v39 = 2113;
      v40 = v3;
      _os_log_impl(&dword_1B39C0000, v19, OS_LOG_TYPE_FAULT, "There are %lu leftover active handles after enumerating activeContacts: %{private}@", buf, 0x16u);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v21 = v3;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v21);
          -[MSPSharingRestorationStorage addMessagesIdentifier:](v5, "addMessagesIdentifier:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j));
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v23);
    }

  }
LABEL_35:

  return v5;
}

- (void)reset
{
  NSObject *isolationQueue;
  _QWORD v4[4];
  id v5;
  id location;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__MSPSharedTripContactController_reset__block_invoke;
  v4[3] = &unk_1E66520A0;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __39__MSPSharedTripContactController_reset__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reset");

}

- (void)_reset
{
  NSObject *v3;
  NSUUID *v4;
  NSUUID *sessionIdentifier;
  NSOrderedSet *v6;
  NSOrderedSet *activeHandles;
  NSOrderedSet *v8;
  NSOrderedSet *activeContacts;
  NSMutableSet *v10;
  NSMutableSet *pendingContacts;
  uint8_t v12[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  MSPGetSharedTripLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEFAULT, "[ContactController] Reset", v12, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  sessionIdentifier = self->_sessionIdentifier;
  self->_sessionIdentifier = v4;

  v6 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E40]);
  activeHandles = self->_activeHandles;
  self->_activeHandles = v6;

  v8 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E40]);
  activeContacts = self->_activeContacts;
  self->_activeContacts = v8;

  v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  pendingContacts = self->_pendingContacts;
  self->_pendingContacts = v10;

}

- (MSPSharedTripContactControllerDelegate)delegate
{
  return (MSPSharedTripContactControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_destroyWeak((id *)&self->_sharedTripServer);
  objc_storeStrong((id *)&self->_pendingContacts, 0);
  objc_storeStrong((id *)&self->_activeHandles, 0);
  objc_storeStrong((id *)&self->_activeContacts, 0);
}

@end
