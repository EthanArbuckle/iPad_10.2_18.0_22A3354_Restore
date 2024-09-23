@implementation CKDetailsContactsManager

- (CKDetailsContactsManager)initWithConversation:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  CKDetailsContactsManager *v8;
  CKDetailsContactsManager *v9;
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
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[CKDetailsContactsManager init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[CKDetailsContactsManager setConversation:](v8, "setConversation:", v6);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUIDForObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsManager setServiceAvailabilityKey:](v9, "setServiceAvailabilityKey:", v10);

    -[CKDetailsContactsManager setDelegate:](v9, "setDelegate:", v7);
    objc_msgSend(MEMORY[0x1E0D20BE8], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsManager serviceAvailabilityKey](v9, "serviceAvailabilityKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addListenerID:forService:", v12, 0);

    -[CKDetailsContactsManager serviceAvailabilityKey](v9, "serviceAvailabilityKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addListenerID:forService:", v13, 2);

    objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsManager serviceAvailabilityKey](v9, "serviceAvailabilityKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addListenerID:forService:", v15, *MEMORY[0x1E0D34210]);

    objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsManager serviceAvailabilityKey](v9, "serviceAvailabilityKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addListenerID:forService:", v17, *MEMORY[0x1E0D34208]);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v9, sel__handleConversationRecipientsDidChange_, CFSTR("CKConversationParticipantsDidChangeNotification"), v6);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v9, sel__handleConversationRecipientsDidChange_, CFSTR("CKConversationJoinStateDidChangeNotification"), v6);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v9, sel__handleAddressBookChange_, *MEMORY[0x1E0D373C0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v9, sel__handleLocationChanged_, *MEMORY[0x1E0D35568], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v9, sel__handleConversationPendingRecipientsDidChange_, CFSTR("CKConversationPendingRecipientsUpdatedNotification"), v6);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v9, sel__handleMultiwayStateChanged_, *MEMORY[0x1E0D35410], 0);

    -[CKDetailsContactsManager _updateViewModelsWithDelay:](v9, "_updateViewModelsWithDelay:", 0);
    location = 0;
    objc_initWeak(&location, v9);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __58__CKDetailsContactsManager_initWithConversation_delegate___block_invoke;
    v25[3] = &unk_1E274B548;
    objc_copyWeak(&v26, &location);
    -[CKDetailsContactsManager _refreshIDSStatusWithCompletion:](v9, "_refreshIDSStatusWithCompletion:", v25);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

  }
  return v9;
}

void __58__CKDetailsContactsManager_initWithConversation_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateViewModelsWithDelay:", 1);

}

- (void)_updateViewModelsWithDelay:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__performUpdateViewModels, 0);
  -[CKDetailsContactsManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__performUpdateViewModels, 0, 0.0);
}

- (void)_performUpdateViewModels
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__86;
  v12 = __Block_byref_object_dispose__86;
  v13 = 0;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CKDetailsContactsManager recipientsSortedByIsContact:alphabetically:](self, "recipientsSortedByIsContact:alphabetically:", 1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__CKDetailsContactsManager__performUpdateViewModels__block_invoke;
  v7[3] = &unk_1E2750AA0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

  -[CKDetailsContactsManager setContactsViewModels:](self, "setContactsViewModels:", v9[5]);
  -[CKDetailsContactsManager delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKDetailsContactsManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactsManagerViewModelsDidChange:", self);

  }
  _Block_object_dispose(&v8, 8);

}

void __52__CKDetailsContactsManager__performUpdateViewModels__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  CKDetailsContactsViewModel *v31;
  _BOOL4 v32;
  uint64_t v33;
  char v34;
  char v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  CKDetailsContactsViewModel *v42;
  uint64_t v43;
  uint64_t v44;
  _BOOL4 v45;
  BOOL v46;
  uint64_t v47;
  unsigned int v48;
  char v49;
  void *v50;
  void *v51;
  id v53;
  uint8_t buf[4];
  const __CFString *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v53 = a2;
  objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "defaultIMHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findMyLocationForHandleOrSibling:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fmfLocation");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    objc_msgSend(v51, "locationShortAddressWithAgeIncludeLocating");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v50 = 0;
  }
  if (objc_msgSend(MEMORY[0x1E0D36AF8], "isEngramEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "conversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pendingRecipients");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "conversation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pendingRecipients");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "defaultIMHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "containsObject:", v9);

    }
    else
    {
      v10 = 0;
    }
    v49 = v10;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = CFSTR("NO");
        if (v10)
          v12 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v55 = v12;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "isPendingRecipient: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v49 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "chat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "conversation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = *(void **)(a1 + 32);
    objc_msgSend(v53, "rawAddress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v16, "_isHandleActiveParticipantInTUConversation:", v17);

  }
  else
  {
    v48 = 0;
  }
  v18 = (void *)MEMORY[0x1E0D35818];
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "chat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "conversation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v18) = objc_msgSend(v18, "activeTUConversationHasActivitySession:", v21);

  if ((v18 & 1) != 0)
  {
    v22 = 3;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "conversation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "chat");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "conversation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isVideo");

    if ((v26 & 1) != 0)
    {
      v22 = 2;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "conversation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "chat");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "conversation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isVideo");

      v22 = v30 ^ 1u;
    }
  }
  v47 = v22;
  v46 = v15 != 0;
  v31 = [CKDetailsContactsViewModel alloc];
  if (v50)
    v32 = v51 != 0;
  else
    v32 = 0;
  v45 = v32;
  v33 = objc_msgSend(*(id *)(a1 + 32), "_showMessageButtonForEntity:", v53);
  v34 = objc_msgSend(*(id *)(a1 + 32), "_showFaceTimeVideoButtonForEntity:", v53);
  v35 = objc_msgSend(*(id *)(a1 + 32), "_showPhoneButtonForEntity:", v53);
  v36 = objc_msgSend(*(id *)(a1 + 32), "showScreenSharingButtonForEntity:", v53);
  +[CKDetailsContactsViewModel descriptorForContactRequiredKeys](CKDetailsContactsViewModel, "descriptorForContactRequiredKeys");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "cnContactWithKeys:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "hasVerifiedBusiness");
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE3(v44) = v46;
  BYTE2(v44) = objc_msgSend(v41, "isStewieConversation");
  BYTE1(v44) = v40;
  LOBYTE(v44) = v49;
  BYTE2(v43) = v36;
  BYTE1(v43) = v35;
  LOBYTE(v43) = v34;
  v42 = -[CKDetailsContactsViewModel initWithEntity:locationString:tuConversationStatusIsActive:callType:showsLocation:showsMessageButton:showsFaceTimeVideoButton:showsPhoneButton:showsScreenSharingButton:contact:isPendingRecipient:verified:isSatellite:showsTUConversationStatus:](v31, "initWithEntity:locationString:tuConversationStatusIsActive:callType:showsLocation:showsMessageButton:showsFaceTimeVideoButton:showsPhoneButton:showsScreenSharingButton:contact:isPendingRecipient:verified:isSatellite:showsTUConversationStatus:", v53, v50, v48, v47, v45, v33, v43, v38, v44);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v42);
}

- (BOOL)_isHandleActiveParticipantInTUConversation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKDetailsContactsManager conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeParticipantsForTUConversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "handle", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v4);

        if ((v14 & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (NSArray)contacts
{
  void *v2;
  void *v3;

  -[CKDetailsContactsManager conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)viewModelsSortedByIsContact:(BOOL)a3 alphabetically:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  v5 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v5)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("entity.defaultIMHandle.isContact"), 0);
    objc_msgSend(v7, "addObject:", v8);

  }
  if (v4)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:selector:", CFSTR("entity.fullName"), 1, sel_caseInsensitiveCompare_);
    objc_msgSend(v7, "addObject:", v9);

  }
  -[CKDetailsContactsManager contactsViewModels](self, "contactsViewModels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingDescriptors:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)recipientsSortedByIsContact:(BOOL)a3 alphabetically:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  -[CKDetailsContactsManager conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recipientsSortedByIsContact:alphabetically:", v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  objc_msgSend(MEMORY[0x1E0D20BE8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsContactsManager serviceAvailabilityKey](self, "serviceAvailabilityKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListenerID:forService:", v4, 0);

  -[CKDetailsContactsManager serviceAvailabilityKey](self, "serviceAvailabilityKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListenerID:forService:", v5, 2);

  objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsContactsManager serviceAvailabilityKey](self, "serviceAvailabilityKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeListenerID:forService:", v7, *MEMORY[0x1E0D34210]);

  objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsContactsManager serviceAvailabilityKey](self, "serviceAvailabilityKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeListenerID:forService:", v9, *MEMORY[0x1E0D34208]);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:", self);

  v11.receiver = self;
  v11.super_class = (Class)CKDetailsContactsManager;
  -[CKDetailsContactsManager dealloc](&v11, sel_dealloc);
}

- (void)_handleLocationChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  objc_msgSend(a3, "object");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "fmfHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[CKDetailsContactsManager conversation](self, "conversation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "chat");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allSiblingFMFHandles");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsObject:", v4);

      if (v8)
        -[CKDetailsContactsManager _updateViewModelsWithDelay:](self, "_updateViewModelsWithDelay:", 1);
    }
  }
  else
  {
    v4 = 0;
  }

}

- (void)_handleConversationRecipientsDidChange:(id)a3
{
  -[CKDetailsContactsManager _updateViewModelsWithDelay:](self, "_updateViewModelsWithDelay:", 1);
}

- (void)_conversationJoinStateDidChange:(id)a3
{
  -[CKDetailsContactsManager _updateViewModelsWithDelay:](self, "_updateViewModelsWithDelay:", 1);
}

- (void)_handleConversationPendingRecipientsDidChange:(id)a3
{
  -[CKDetailsContactsManager _updateViewModelsWithDelay:](self, "_updateViewModelsWithDelay:", 1);
}

- (void)_handleAddressBookChange:(id)a3
{
  -[CKDetailsContactsManager _updateViewModelsWithDelay:](self, "_updateViewModelsWithDelay:", 1);
}

- (void)_handleMultiwayStateChanged:(id)a3
{
  -[CKDetailsContactsManager _updateViewModelsWithDelay:](self, "_updateViewModelsWithDelay:", 1);
}

- (id)conversationContextMenuConfigForEntity:(id)a3 allowConversationRemoval:(BOOL)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  -[CKDetailsContactsManager conversationContextMenuForEntity:allowConversationRemoval:](self, "conversationContextMenuForEntity:allowConversationRemoval:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CEA4B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __92__CKDetailsContactsManager_conversationContextMenuConfigForEntity_allowConversationRemoval___block_invoke;
    v9[3] = &unk_1E274B290;
    v10 = v4;
    objc_msgSend(v6, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __92__CKDetailsContactsManager_conversationContextMenuConfigForEntity_allowConversationRemoval___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)conversationContextMenuForEntity:(id)a3 allowConversationRemoval:(BOOL)a4
{
  return -[CKDetailsContactsManager conversationContextMenuForUnknownEntity:allowConversationRemoval:showUnknownContactActionInPopover:unknownContactActionHandler:](self, "conversationContextMenuForUnknownEntity:allowConversationRemoval:showUnknownContactActionInPopover:unknownContactActionHandler:", a3, a4, 0, 0);
}

- (id)conversationContextMenuForUnknownEntity:(id)a3 allowConversationRemoval:(BOOL)a4 showUnknownContactActionInPopover:(BOOL)a5 unknownContactActionHandler:(id)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  id v9;
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
  void *v22;

  v6 = a5;
  v7 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v9, "defaultIMHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKContextMenuGenerator recipientSubmenuForHandle:](CKContextMenuGenerator, "recipientSubmenuForHandle:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v10, "addObject:", v12);
  -[CKDetailsContactsManager conversation](self, "conversation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKContextMenuGenerator submenuForIndividualParticipantWithHandle:forConversation:includeAddToContactsAction:includeRemoveAction:](CKContextMenuGenerator, "submenuForIndividualParticipantWithHandle:forConversation:includeAddToContactsAction:includeRemoveAction:", v11, v13, !v6, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v10, "addObject:", v14);
  if (-[CKDetailsContactsManager showScreenSharingButtonForEntity:](self, "showScreenSharingButtonForEntity:", v9))
  {
    -[CKDetailsContactsManager conversation](self, "conversation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKContextMenuGenerator subMenuForScreenSharingOptionsWithHandle:conversation:andContactsManager:](CKContextMenuGenerator, "subMenuForScreenSharingOptionsWithHandle:conversation:andContactsManager:", v11, v15, self);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      objc_msgSend(v10, "addObject:", v16);

  }
  v17 = (void *)objc_opt_new();
  if (-[CKDetailsContactsManager _showFaceTimeVideoButtonForEntity:](self, "_showFaceTimeVideoButtonForEntity:", v9))
  {
    +[CKContextMenuGenerator menuActionToInitiateFaceTimeVideoWithHandle:andContactsManager:](CKContextMenuGenerator, "menuActionToInitiateFaceTimeVideoWithHandle:andContactsManager:", v11, self);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKContextMenuGenerator menuActionToInitiateFaceTimeAudioWithHandle:andContactsManager:](CKContextMenuGenerator, "menuActionToInitiateFaceTimeAudioWithHandle:andContactsManager:", v11, self);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(v17, "addObject:", v18);
    if (v19)
      objc_msgSend(v17, "addObject:", v19);

  }
  +[CKContextMenuGenerator menuActionsToInitiateRelayPhoneCallWithHandle:](CKContextMenuGenerator, "menuActionsToInitiateRelayPhoneCallWithHandle:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "count"))
    objc_msgSend(v17, "addObjectsFromArray:", v20);
  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v21);

  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E276D870, v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)contextMenuForEntity:(id)a3 atom:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "defaultIMHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isContact");

  if (v9)
    -[CKDetailsContactsManager conversationContextMenuForEntity:allowConversationRemoval:](self, "conversationContextMenuForEntity:allowConversationRemoval:", v7, 0);
  else
    -[CKDetailsContactsManager contextMenuForUnknownRecipient:atom:](self, "contextMenuForUnknownRecipient:atom:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)contextMenuForUnknownRecipient:(id)a3 atom:(id)a4
{
  return 0;
}

- (void)sendEmail
{
  void *v3;
  id v4;
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
  id v16;
  NSObject *v17;
  __int16 v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[12];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[CKDetailsContactsManager conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C97348]);
    objc_msgSend(MEMORY[0x1E0C97548], "descriptorForRequiredKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKDetailsContactsManager conversation](self, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "participants");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    -[CKDetailsContactsManager conversation](self, "conversation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", v6, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "contacts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mailUrlForContacts:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __37__CKDetailsContactsManager_sendEmail__block_invoke;
    v19[3] = &unk_1E274A1B8;
    v20 = v14;
    v16 = v14;
    objc_msgSend(v15, "openURL:options:completionHandler:", v16, MEMORY[0x1E0C9AA70], v19);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = 0;
      _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Cannot send email because no conversation", (uint8_t *)&v18, 2u);
    }

  }
}

void __37__CKDetailsContactsManager_sendEmail__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = CFSTR("NO");
      v6 = *(_QWORD *)(a1 + 32);
      if (a2)
        v5 = CFSTR("YES");
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Opened URL: %@ successfully: %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

- (void)callableAddressesForEntity:(id)a3 withResult:(id)a4
{
  id v5;
  void (**v6)(id, void *, void *);
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *, void *))a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "defaultIMHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "phoneNumbers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v25 = v10;
    v26 = v5;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = v11;
    obj = v11;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v16, "value");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringValue");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "addObject:", v18);
          objc_msgSend(v16, "label");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C97338], "localizedStringForLabel:", v19);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!-[__CFString length](v20, "length"))
          {
            v21 = v19;

            v20 = v21;
          }
          if (!-[__CFString length](v20, "length"))
          {

            v20 = &stru_1E276D870;
          }
          objc_msgSend(v8, "addObject:", v20);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v13);
    }

    v5 = v26;
    v11 = v24;
    v10 = v25;
  }
  v22 = (void *)objc_msgSend(v7, "copy");
  v23 = (void *)objc_msgSend(v8, "copy");
  v6[2](v6, v22, v23);

}

- (BOOL)hasPreferredCallServiceForEntity:(id)a3
{
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "rawAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CKDetailsContactsManager preferredCallServiceForID:](self, "preferredCallServiceForID:", v4);

  return v5 != 0;
}

- (BOOL)shouldAlwaysShowCallMenuForEntity:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v5 = -[CKDetailsContactsManager isFaceTimeAudioAvailableForEntity:](self, "isFaceTimeAudioAvailableForEntity:", v4);
  objc_msgSend(v4, "propertyType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__CKDetailsContactsManager_shouldAlwaysShowCallMenuForEntity___block_invoke;
  v10[3] = &unk_1E275AFE0;
  v10[4] = &v11;
  -[CKDetailsContactsManager callableAddressesForEntity:withResult:](self, "callableAddressesForEntity:withResult:", v4, v10);
  v7 = -[CKDetailsContactsManager hasPreferredCallServiceForEntity:](self, "hasPreferredCallServiceForEntity:", v4);
  if (v6 == (void *)*MEMORY[0x1E0C967C0])
    v8 = v5 && !v7;
  else
    v8 = *((_BYTE *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __62__CKDetailsContactsManager_shouldAlwaysShowCallMenuForEntity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        if (MEMORY[0x193FF3B1C](*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i)))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)callMenuForEntity:(id)a3
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
  -[CKDetailsContactsManager callActionsForEntity:](self, "callActionsForEntity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v4, "propertyType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)*MEMORY[0x1E0C967C0];

    if (v6 == v7)
    {
      objc_msgSend(v4, "defaultIMHandle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "displayID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
    v11 = (void *)MEMORY[0x1E0CEA740];
    v12 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v11, "menuWithTitle:children:", v8, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)callActionsForEntity:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
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
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, uint64_t);
  void *v24;
  id v25;
  id v26;
  _QWORD *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  uint64_t *v34;
  id v35;
  _QWORD v36[6];
  id location;
  _QWORD v38[5];
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v4 = a3;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__86;
  v44 = __Block_byref_object_dispose__86;
  v45 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__86;
  v38[4] = __Block_byref_object_dispose__86;
  v39 = 0;
  location = 0;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __49__CKDetailsContactsManager_callActionsForEntity___block_invoke;
  v36[3] = &unk_1E275B008;
  v36[4] = &v40;
  v36[5] = v38;
  -[CKDetailsContactsManager callableAddressesForEntity:withResult:](self, "callableAddressesForEntity:withResult:", v4, v36);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "propertyType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CKDetailsContactsManager isFaceTimeAudioAvailableForEntity:](self, "isFaceTimeAudioAvailableForEntity:", v4))
  {
    CKFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FACE_TIME_AUDIO"), &stru_1E276D870, CFSTR("ChatKit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("phone"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CEA2A8];
    v32[0] = v5;
    v32[1] = 3221225472;
    v32[2] = __49__CKDetailsContactsManager_callActionsForEntity___block_invoke_2;
    v32[3] = &unk_1E275B030;
    v33 = v4;
    objc_copyWeak(&v35, &location);
    v34 = &v40;
    objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v9, v10, v9, v32);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v12);

    objc_destroyWeak(&v35);
  }
  if (v7 == (void *)*MEMORY[0x1E0C967C0])
  {
    CKFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("VOICE_CALL"), &stru_1E276D870, CFSTR("ChatKit"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("phone"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CEA2A8];
    v29[0] = v5;
    v29[1] = 3221225472;
    v29[2] = __49__CKDetailsContactsManager_callActionsForEntity___block_invoke_3;
    v29[3] = &unk_1E2757858;
    v30 = v4;
    objc_copyWeak(&v31, &location);
    objc_msgSend(v17, "actionWithTitle:image:identifier:handler:", v15, v16, v15, v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v18);

    objc_destroyWeak(&v31);
  }
  else
  {
    v13 = (void *)v41[5];
    v21 = v5;
    v22 = 3221225472;
    v23 = __49__CKDetailsContactsManager_callActionsForEntity___block_invoke_4;
    v24 = &unk_1E275B058;
    v27 = v38;
    objc_copyWeak(&v28, &location);
    v25 = v4;
    v26 = v6;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v21);

    objc_destroyWeak(&v28);
  }
  v19 = (void *)objc_msgSend(v6, "copy", v21, v22, v23, v24);

  objc_destroyWeak(&location);
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(&v40, 8);
  return v19;
}

void __49__CKDetailsContactsManager_callActionsForEntity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  v6 = objc_msgSend(a2, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = objc_msgSend(v5, "copy");
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

void __49__CKDetailsContactsManager_callActionsForEntity___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "rawAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "rawAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setPreferredCallService:forID:", 2, v4);

  }
  v7 = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startCommunicationForEntity:action:address:", v5, 1, v6);

}

void __49__CKDetailsContactsManager_callActionsForEntity___block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "rawAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "rawAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setPreferredCallService:forID:", 1, v4);

  }
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "originalAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startCommunicationForEntity:action:address:", v5, 3, v6);

}

void __49__CKDetailsContactsManager_callActionsForEntity___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((MEMORY[0x193FF3B1C](v5) & 1) != 0)
  {
    v7 = CFSTR("phone");
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (IMStringIsEmail())
  {
    v7 = CFSTR("envelope");
    goto LABEL_5;
  }
  v8 = 0;
LABEL_7:
  v9 = (void *)MEMORY[0x1E0CEA2A8];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__CKDetailsContactsManager_callActionsForEntity___block_invoke_5;
  v12[3] = &unk_1E2757BA0;
  objc_copyWeak(&v15, (id *)(a1 + 56));
  v13 = *(id *)(a1 + 32);
  v10 = v5;
  v14 = v10;
  objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v10, v8, v10, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDiscoverabilityTitle:", v6);
  if (MEMORY[0x193FF3B1C](v10))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

  objc_destroyWeak(&v15);
}

void __49__CKDetailsContactsManager_callActionsForEntity___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "startCommunicationForEntity:action:address:", *(_QWORD *)(a1 + 32), 3, *(_QWORD *)(a1 + 40));

}

- (void)startCommunicationForEntity:(id)a3 action:(unint64_t)a4 address:(id)a5
{
  -[CKDetailsContactsManager startCommunicationForEntity:action:address:usePreferredRouteIfAvailable:](self, "startCommunicationForEntity:action:address:usePreferredRouteIfAvailable:", a3, a4, a5, 1);
}

- (void)startCommunicationForEntity:(id)a3 action:(unint64_t)a4 address:(id)a5 usePreferredRouteIfAvailable:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  CKDetailsContactsManager *v11;
  id v12;
  uint64_t v13;
  id v14;

  v6 = a6;
  v14 = a3;
  v10 = a5;
  switch(a4)
  {
    case 0uLL:
      v11 = self;
      v12 = v14;
      v13 = 0;
      goto LABEL_4;
    case 1uLL:
      v11 = self;
      v12 = v14;
      v13 = 1;
LABEL_4:
      -[CKDetailsContactsManager _startFacetimeCommunicationForEntity:audioOnly:](v11, "_startFacetimeCommunicationForEntity:audioOnly:", v12, v13);
      break;
    case 2uLL:
      -[CKDetailsContactsManager _startCommunicationForEntity:usePreferredRouteIfAvailable:](self, "_startCommunicationForEntity:usePreferredRouteIfAvailable:", v14, v6);
      break;
    case 3uLL:
      -[CKDetailsContactsManager _startCallWithEntity:phoneAddress:](self, "_startCallWithEntity:phoneAddress:", v14, v10);
      break;
    case 4uLL:
      -[CKDetailsContactsManager _startMessageWithEntity:](self, "_startMessageWithEntity:", v14);
      break;
    case 5uLL:
      -[CKDetailsContactsManager shareMyScreenWithEntity:](self, "shareMyScreenWithEntity:", v14);
      break;
    case 6uLL:
      -[CKDetailsContactsManager inviteEntityToShareTheirScreen:](self, "inviteEntityToShareTheirScreen:", v14);
      break;
    default:
      break;
  }

}

- (void)startCommunicationForViewModel:(id)a3 action:(unint64_t)a4 address:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a5;
  objc_msgSend(v11, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v11, "entity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsManager startCommunicationForEntity:action:address:](self, "startCommunicationForEntity:action:address:", v10, a4, v8);

  }
}

- (void)_startMessageWithEntity:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "defaultIMHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("sms://open?addresses=%@"), v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "openURL:", v6);

}

- (void)_startCommunicationForEntity:(id)a3 usePreferredRouteIfAvailable:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  int v17;
  unint64_t v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = +[CKFaceTimeUtilities isTelephonyAvailable](CKFaceTimeUtilities, "isTelephonyAvailable");
  v8 = -[CKDetailsContactsManager isFaceTimeAudioAvailableForEntity:](self, "isFaceTimeAudioAvailableForEntity:", v6);
  objc_msgSend(v6, "propertyType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*MEMORY[0x1E0C967C0];

  if (v8)
  {
    if (!v7 || v9 != v10)
      goto LABEL_4;
    if (v4)
    {
      objc_msgSend(v6, "rawAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[CKDetailsContactsManager preferredCallServiceForID:](self, "preferredCallServiceForID:", v13);

      if (v14 == 2)
      {
LABEL_4:
        -[CKDetailsContactsManager _startFacetimeCommunicationForEntity:audioOnly:](self, "_startFacetimeCommunicationForEntity:audioOnly:", v6, 1);
        goto LABEL_21;
      }
      if (v14 == 1)
      {
LABEL_10:
        objc_msgSend(v6, "originalAddress");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKDetailsContactsManager _startCallWithEntity:phoneAddress:](self, "_startCallWithEntity:phoneAddress:", v6, v12);

        goto LABEL_21;
      }
    }
    else
    {
      v14 = 0;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v17 = 134217984;
        v18 = v14;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Tried to start a call via the transcript header call button, but preferredCallServiceType (%lu) wan't explicitly accounted for. Defaulting to the number attached to the transcript since this is a phone transcript.", (uint8_t *)&v17, 0xCu);
      }

    }
    objc_msgSend(v6, "originalAddress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsManager _startCallWithEntity:phoneAddress:](self, "_startCallWithEntity:phoneAddress:", v6, v16);

  }
  else
  {
    if (v9 == v10)
      goto LABEL_10;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Tried to start a call via the transcript header call button, but this is a non-phone transcript and FT audio is unavailable. Unable to initiate a call.", (uint8_t *)&v17, 2u);
      }

    }
  }
LABEL_21:

}

- (void)_startCallWithEntity:(id)a3 phoneAddress:(id)a4
{
  id v6;
  id v7;
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
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "providerManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "telephonyProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD2E0]), "initWithProvider:", v10);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD2F8]), "initWithType:value:", 2, v7);
  objc_msgSend(v11, "setHandle:", v12);

  objc_msgSend(v6, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContactIdentifier:", v14);

  objc_msgSend(v11, "setPerformDialAssist:", 1);
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    v30 = v7;
    v31 = v6;
    -[CKDetailsContactsManager conversation](self, "conversation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "chat");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastAddressedSIMID");
    v17 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v17;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v17);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v10, "prioritizedSenderIdentities");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v33 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v24, "accountUUID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqual:", v18);

          if (v26)
          {
            objc_msgSend(v24, "UUID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setLocalSenderIdentityUUID:", v27);

            goto LABEL_12;
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v21)
          continue;
        break;
      }
    }
LABEL_12:

    v7 = v30;
    v6 = v31;
  }
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "launchAppForDialRequest:completion:", v11, &__block_literal_global_284);

}

void __62__CKDetailsContactsManager__startCallWithEntity_phoneAddress___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Error making telephony call: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)_startFacetimeCommunicationForEntity:(id)a3 audioOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "defaultIMHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v9 = (void *)MEMORY[0x1E0D35818];
    v15 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsManager conversation](self, "conversation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "chat");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastAddressedHandleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "initiateTUConversationForParticipants:senderAddress:videoEnabled:groupID:displayName:screenShareType:", v10, v13, !v4, 0, 0, 0);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "No handle found for %@. FaceTime could not be initiated.", buf, 0xCu);
    }

  }
}

- (void)shareMyScreenWithEntity:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  -[CKDetailsContactsManager modernScreenSharingCapabilities](self, "modernScreenSharingCapabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[CKFaceTimeUtilities isModernScreenSharingAvailableForEntity:capabilities:](CKFaceTimeUtilities, "isModernScreenSharingAvailableForEntity:capabilities:", v13, v4);

  if (v5)
  {
    -[CKDetailsContactsManager conversation](self, "conversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "initiateTUConversationWithScreenShareType:", 1);
LABEL_8:

    v9 = v13;
    goto LABEL_9;
  }
  v8 = CKIsRunningInMacCatalyst();
  v9 = v13;
  if (v8)
  {
    objc_msgSend(v13, "defaultIMHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(MEMORY[0x1E0D397A8], "isCNContactAKnownContact:", v6);
    if ((v11 & 1) != 0)
      objc_msgSend(v6, "identifier");
    else
      objc_msgSend(v13, "rawAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "inviteHandleIDToShareMyScreen:isContact:", v7, v11);

    goto LABEL_8;
  }
LABEL_9:

}

- (void)inviteEntityToShareTheirScreen:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  -[CKDetailsContactsManager modernScreenSharingCapabilities](self, "modernScreenSharingCapabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[CKFaceTimeUtilities isModernScreenSharingAvailableForEntity:capabilities:](CKFaceTimeUtilities, "isModernScreenSharingAvailableForEntity:capabilities:", v13, v4);

  if (v5)
  {
    -[CKDetailsContactsManager conversation](self, "conversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "initiateTUConversationWithScreenShareType:", 2);
LABEL_8:

    v9 = v13;
    goto LABEL_9;
  }
  v8 = CKIsRunningInMacCatalyst();
  v9 = v13;
  if (v8)
  {
    objc_msgSend(v13, "defaultIMHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(MEMORY[0x1E0D397A8], "isCNContactAKnownContact:", v6);
    if ((v11 & 1) != 0)
      objc_msgSend(v6, "identifier");
    else
      objc_msgSend(v13, "rawAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "askHandleIDToShareTheirScreen:isContact:", v7, v11);

    goto LABEL_8;
  }
LABEL_9:

}

- (BOOL)_showPhoneButtonForEntity:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (v4)
    v5 = -[CKDetailsContactsManager isTelephonyCallAvailableForEntity:](self, "isTelephonyCallAvailableForEntity:", v4)
      || -[CKDetailsContactsManager isFaceTimeAudioAvailableForEntity:](self, "isFaceTimeAudioAvailableForEntity:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isTelephonyCallAvailableForEntity:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;

  v4 = a3;
  if (v4)
  {
    v5 = +[CKFaceTimeUtilities isTelephonyAvailable](CKFaceTimeUtilities, "isTelephonyAvailable");
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "phoneIsAllowlisted");

    objc_msgSend(v4, "propertyType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)*MEMORY[0x1E0C967C0];

    v10 = v5 & v7;
    if (v10 == 1 && v8 != v9)
      LOBYTE(v10) = -[CKDetailsContactsManager _hasLinkedTelephoneNumbersForEntity:](self, "_hasLinkedTelephoneNumbersForEntity:", v4);
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)_showFaceTimeVideoButtonForEntity:(id)a3
{
  return a3
      && -[CKDetailsContactsManager isFaceTimeAudioAvailableForEntity:](self, "isFaceTimeAudioAvailableForEntity:");
}

- (BOOL)isFaceTimeVideoAvailableForEntity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;

  v4 = a3;
  if (!v4)
    goto LABEL_6;
  -[CKDetailsContactsManager conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[CKFaceTimeUtilities isFaceTimeVideoAvailable:](CKFaceTimeUtilities, "isFaceTimeVideoAvailable:", v5))
  {

    goto LABEL_6;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "faceTimeVideoIsAllowlisted");

  if (!v7)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = -[CKDetailsContactsManager _facetimeIDStatusForEntity:](self, "_facetimeIDStatusForEntity:", v4) == 1;
LABEL_7:

  return v8;
}

- (BOOL)isFaceTimeAudioAvailableForEntity:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  BOOL v14;

  v4 = a3;
  if (+[CKFaceTimeUtilities isFaceTimeAudioAvailable:](CKFaceTimeUtilities, "isFaceTimeAudioAvailable:", self->_conversation))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "faceTimeAudioIsAllowlisted");

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v4, "IDSCanonicalAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsContactsManager facetimeAudioIDStatuses](self, "facetimeAudioIDStatuses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CKDetailsContactsManager facetimeAudioIDStatuses](self, "facetimeAudioIDStatuses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    v13 = v12 == 1;
  }
  else
  {
    v13 = 0;
  }
  v14 = v6 & v13;

  return v14;
}

- (BOOL)showScreenSharingButtonForEntity:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  BOOL v7;

  v4 = a3;
  -[CKDetailsContactsManager modernScreenSharingCapabilities](self, "modernScreenSharingCapabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[CKFaceTimeUtilities isModernScreenSharingAvailableForEntity:capabilities:](CKFaceTimeUtilities, "isModernScreenSharingAvailableForEntity:capabilities:", v4, v5);

  if (v6)
  {
    v7 = 1;
  }
  else if (CKIsRunningInMacCatalyst())
  {
    v7 = -[CKDetailsContactsManager _screenSharingStatusForEntity:](self, "_screenSharingStatusForEntity:", v4) == 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_showMessageButtonForEntity:(id)a3
{
  void *v3;
  BOOL v4;

  -[CKConversation recipients](self->_conversation, "recipients", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "count") >= 2 && CKIsRunningInMacCatalyst() == 0;

  return v4;
}

- (BOOL)_hasLinkedTelephoneNumbersForEntity:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D397A8];
  objc_msgSend(a3, "defaultIMHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phoneNumbersForCNContact:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "count") != 0;
  return (char)v4;
}

- (int64_t)_facetimeIDStatusForEntity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  objc_msgSend(a3, "IDSCanonicalAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsContactsManager facetimeIDStatuses](self, "facetimeIDStatuses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CKDetailsContactsManager facetimeIDStatuses](self, "facetimeIDStatuses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)_facetimeAudioIDStatusForEntity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  objc_msgSend(a3, "IDSCanonicalAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsContactsManager facetimeAudioIDStatuses](self, "facetimeAudioIDStatuses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CKDetailsContactsManager facetimeAudioIDStatuses](self, "facetimeAudioIDStatuses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)_screenSharingStatusForEntity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  v4 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    objc_msgSend(v4, "IDSCanonicalAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsManager screenSharingIDSStatuses](self, "screenSharingIDSStatuses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CKDetailsContactsManager screenSharingIDSStatuses](self, "screenSharingIDSStatuses");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "integerValue");

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_refreshIDSStatusWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  _QWORD block[4];
  void (**v30)(_QWORD);
  _QWORD v31[5];
  NSObject *v32;
  _QWORD v33[5];
  NSObject *v34;
  _QWORD v35[5];
  NSObject *v36;
  _QWORD v37[5];
  NSObject *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  const __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  -[CKDetailsContactsManager conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "__imArrayByApplyingBlock:", &__block_literal_global_104_4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    v9 = (void *)MEMORY[0x1E0D39880];
    -[CKDetailsContactsManager serviceAvailabilityKey](self, "serviceAvailabilityKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = *MEMORY[0x1E0D34210];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __60__CKDetailsContactsManager__refreshIDSStatusWithCompletion___block_invoke_106;
    v37[3] = &unk_1E274DED0;
    v37[4] = self;
    v13 = v8;
    v38 = v13;
    LOBYTE(v9) = objc_msgSend(v9, "refreshIDStatusForDestinations:service:listenerID:queue:completionBlock:", v7, v12, v10, MEMORY[0x1E0C80D38], v37);

    if ((v9 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v40 = "-[CKDetailsContactsManager _refreshIDSStatusWithCompletion:]";
          v41 = 2112;
          v42 = CFSTR("NO");
          _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "%s leaving dispatch_group because executedRefreshForFaceTime: %@", buf, 0x16u);
        }

      }
      dispatch_group_leave(v13);
    }
    dispatch_group_enter(v13);
    v15 = (void *)MEMORY[0x1E0D39880];
    -[CKDetailsContactsManager serviceAvailabilityKey](self, "serviceAvailabilityKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0D34208];
    v35[0] = v11;
    v35[1] = 3221225472;
    v35[2] = __60__CKDetailsContactsManager__refreshIDSStatusWithCompletion___block_invoke_108;
    v35[3] = &unk_1E274DED0;
    v35[4] = self;
    v18 = v13;
    v36 = v18;
    LOBYTE(v15) = objc_msgSend(v15, "refreshIDStatusForDestinations:service:listenerID:queue:completionBlock:", v7, v17, v16, MEMORY[0x1E0C80D38], v35);

    if ((v15 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v40 = "-[CKDetailsContactsManager _refreshIDSStatusWithCompletion:]";
          v41 = 2112;
          v42 = CFSTR("NO");
          _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "%s leaving dispatch_group because executedRefreshForCalling: %@", buf, 0x16u);
        }

      }
      dispatch_group_leave(v18);
    }
    -[CKDetailsContactsManager conversation](self, "conversation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = +[CKFaceTimeUtilities isModernScreenSharingAvailable:](CKFaceTimeUtilities, "isModernScreenSharingAvailable:", v20);

    if (v21)
    {
      dispatch_group_enter(v18);
      v33[0] = v11;
      v33[1] = 3221225472;
      v33[2] = __60__CKDetailsContactsManager__refreshIDSStatusWithCompletion___block_invoke_109;
      v33[3] = &unk_1E274DED0;
      v33[4] = self;
      v34 = v18;
      +[CKFaceTimeUtilities queryModernScreenSharingCapabilities:completion:](CKFaceTimeUtilities, "queryModernScreenSharingCapabilities:completion:", v7, v33);

    }
    if (CKIsRunningInMacCatalyst())
    {
      dispatch_group_enter(v18);
      v22 = (void *)MEMORY[0x1E0D39880];
      -[CKDetailsContactsManager serviceAvailabilityKey](self, "serviceAvailabilityKey");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *MEMORY[0x1E0D34238];
      v31[0] = v11;
      v31[1] = 3221225472;
      v31[2] = __60__CKDetailsContactsManager__refreshIDSStatusWithCompletion___block_invoke_2;
      v31[3] = &unk_1E274DED0;
      v31[4] = self;
      v25 = v18;
      v32 = v25;
      LOBYTE(v22) = objc_msgSend(v22, "refreshIDStatusForDestinations:service:listenerID:queue:completionBlock:", v7, v24, v23, MEMORY[0x1E0C80D38], v31);

      if ((v22 & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v40 = "-[CKDetailsContactsManager _refreshIDSStatusWithCompletion:]";
            v41 = 2112;
            v42 = CFSTR("NO");
            _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "%s leaving dispatch_group because executedRefreshForScreenSharing: %@", buf, 0x16u);
          }

        }
        dispatch_group_leave(v25);
      }

    }
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __60__CKDetailsContactsManager__refreshIDSStatusWithCompletion___block_invoke_110;
    block[3] = &unk_1E274AED0;
    v30 = v4;
    v27 = (void *)MEMORY[0x1E0C80D38];
    dispatch_group_notify(v18, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v40 = "-[CKDetailsContactsManager _refreshIDSStatusWithCompletion:]";
        v41 = 2048;
        v42 = (const __CFString *)objc_msgSend(v7, "count");
        _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "%s executing completion block and early returning for addresses.count: %lu", buf, 0x16u);
      }

    }
    v4[2](v4);
  }

}

uint64_t __60__CKDetailsContactsManager__refreshIDSStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "IDSCanonicalAddress");
}

void __60__CKDetailsContactsManager__refreshIDSStatusWithCompletion___block_invoke_106(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setFacetimeIDStatuses:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __60__CKDetailsContactsManager__refreshIDSStatusWithCompletion___block_invoke_108(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setFacetimeAudioIDStatuses:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __60__CKDetailsContactsManager__refreshIDSStatusWithCompletion___block_invoke_109(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setModernScreenSharingCapabilities:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __60__CKDetailsContactsManager__refreshIDSStatusWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setScreenSharingIDSStatuses:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __60__CKDetailsContactsManager__refreshIDSStatusWithCompletion___block_invoke_110(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)preferredCallServiceForID:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v4 = a3;
  if (v4
    && !-[CKDetailsContactsManager _preferredRoutesDisabledViaServerBag](self, "_preferredRoutesDisabledViaServerBag"))
  {
    -[CKDetailsContactsManager _preferredCallServiceToIDMap](self, "_preferredCallServiceToIDMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "unsignedIntegerValue");
      if (v9 <= 2)
        v5 = v9;
      else
        v5 = 0;
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

- (void)setPreferredCallService:(unint64_t)a3 forID:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v6 = a4;
  v7 = v6;
  if (a3 <= 2)
  {
    if (v6)
    {
      v13 = v6;
      v8 = -[CKDetailsContactsManager _preferredRoutesDisabledViaServerBag](self, "_preferredRoutesDisabledViaServerBag");
      v7 = v13;
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", CFSTR("CKCallPreferredServiceToIDMap"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)objc_msgSend(v11, "mutableCopy");

        if (!v12)
          v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        if (a3)
          objc_msgSend(v12, "setObject:forKey:", v9, v13);
        else
          objc_msgSend(v12, "removeObjectForKey:", v13);
        -[CKDetailsContactsManager _setPreferredCallServiceToIDMap:](self, "_setPreferredCallServiceToIDMap:", v12);

        v7 = v13;
      }
    }
  }

}

- (BOOL)_preferredRoutesDisabledViaServerBag
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("madrid-disable-preferred-call-service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (id)_preferredCallServiceToIDMap
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("CKCallPreferredServiceToIDMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setPreferredCallServiceToIDMap:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("CKCallPreferredServiceToIDMap"));

}

- (void)beginFacetimeCallWithVideo:(BOOL)a3
{
  CKDetailsContactsManager *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = self;
  if (a3)
  {
    v4 = 1;
LABEL_5:
    -[CKDetailsContactsManager _callButtonPressedWithVideoEnabled:](self, "_callButtonPressedWithVideoEnabled:", v4);
    return;
  }
  -[CKDetailsContactsManager conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  self = v3;
  if (v7 >= 2)
  {
    v4 = 0;
    goto LABEL_5;
  }
  -[CKDetailsContactsManager startAudioCommunicationUsingPreferredRouteIfAvailable:](v3, "startAudioCommunicationUsingPreferredRouteIfAvailable:", 1);
}

- (void)startAudioCommunicationUsingPreferredRouteIfAvailable:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[CKDetailsContactsManager conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recipient");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    -[CKDetailsContactsManager startCommunicationForEntity:action:address:usePreferredRouteIfAvailable:](self, "startCommunicationForEntity:action:address:usePreferredRouteIfAvailable:", v7, 2, 0, v3);
    v6 = v7;
  }

}

- (void)_callButtonPressedWithVideoEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[CKDetailsContactsManager conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conversation");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (objc_msgSend(v11, "state"))
    {
      +[CKFaceTimeUtilities showCallControlsForConversation:](CKFaceTimeUtilities, "showCallControlsForConversation:", v11);
    }
    else
    {
      -[CKDetailsContactsManager conversation](self, "conversation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "chat");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "joinExistingTUConversation");

    }
  }
  else
  {
    -[CKDetailsContactsManager conversation](self, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "initiateTUConversationWithVideoEnabled:", v3);

  }
}

- (NSArray)contactsViewModels
{
  return self->_contactsViewModels;
}

- (void)setContactsViewModels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CKDetailsContactsManagerDelegate)delegate
{
  return (CKDetailsContactsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (NSString)serviceAvailabilityKey
{
  return self->_serviceAvailabilityKey;
}

- (void)setServiceAvailabilityKey:(id)a3
{
  objc_storeStrong((id *)&self->_serviceAvailabilityKey, a3);
}

- (NSDictionary)facetimeIDStatuses
{
  return self->_facetimeIDStatuses;
}

- (void)setFacetimeIDStatuses:(id)a3
{
  objc_storeStrong((id *)&self->_facetimeIDStatuses, a3);
}

- (NSDictionary)facetimeAudioIDStatuses
{
  return self->_facetimeAudioIDStatuses;
}

- (void)setFacetimeAudioIDStatuses:(id)a3
{
  objc_storeStrong((id *)&self->_facetimeAudioIDStatuses, a3);
}

- (NSDictionary)screenSharingIDSStatuses
{
  return self->_screenSharingIDSStatuses;
}

- (void)setScreenSharingIDSStatuses:(id)a3
{
  objc_storeStrong((id *)&self->_screenSharingIDSStatuses, a3);
}

- (NSDictionary)modernScreenSharingCapabilities
{
  return self->_modernScreenSharingCapabilities;
}

- (void)setModernScreenSharingCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_modernScreenSharingCapabilities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modernScreenSharingCapabilities, 0);
  objc_storeStrong((id *)&self->_screenSharingIDSStatuses, 0);
  objc_storeStrong((id *)&self->_facetimeAudioIDStatuses, 0);
  objc_storeStrong((id *)&self->_facetimeIDStatuses, 0);
  objc_storeStrong((id *)&self->_serviceAvailabilityKey, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contactsViewModels, 0);
}

@end
