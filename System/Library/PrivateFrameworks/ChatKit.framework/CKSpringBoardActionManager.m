@implementation CKSpringBoardActionManager

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_85);
  return (id)sharedInstance_sSharedInstance;
}

void __44__CKSpringBoardActionManager_sharedInstance__block_invoke()
{
  CKSpringBoardActionManager *v0;
  void *v1;

  if (!CKIsRunningInMacCatalyst())
  {
    v0 = objc_alloc_init(CKSpringBoardActionManager);
    v1 = (void *)sharedInstance_sSharedInstance;
    sharedInstance_sSharedInstance = (uint64_t)v0;

  }
}

- (CKSpringBoardActionManager)init
{
  CKSpringBoardActionManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKSpringBoardActionManager;
  v2 = -[CKSpringBoardActionManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_chatStateChanged_, CFSTR("CKConversationJoinStateDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_chatStateChanged_, CFSTR("CKConversationParticipantsDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_chatStateChanged_, *MEMORY[0x1E0D352F0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_chatStateChanged_, CFSTR("CKConversationListFinishedLoadingNotification"), 0);

    v2->shouldHideGroupsDonations = 1;
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CKContactsSearchManager setDelegate:](self->_contactsSearchManager, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)CKSpringBoardActionManager;
  -[CKSpringBoardActionManager dealloc](&v4, sel_dealloc);
}

- (CKContactsSearchManager)contactsSearchManager
{
  CKContactsSearchManager *contactsSearchManager;
  CKContactsSearchManager *v4;
  CKContactsSearchManager *v5;

  contactsSearchManager = self->_contactsSearchManager;
  if (!contactsSearchManager)
  {
    v4 = objc_alloc_init(CKContactsSearchManager);
    v5 = self->_contactsSearchManager;
    self->_contactsSearchManager = v4;

    -[CKContactsSearchManager setBiasForOutgoingInteraction:](self->_contactsSearchManager, "setBiasForOutgoingInteraction:", 1);
    -[CKContactsSearchManager setDelegate:](self->_contactsSearchManager, "setDelegate:", self);
    -[CKContactsSearchManager setSuppressGroupSuggestions:](self->_contactsSearchManager, "setSuppressGroupSuggestions:", 1);
    contactsSearchManager = self->_contactsSearchManager;
  }
  return contactsSearchManager;
}

- (id)shortcutItemForConversation:(id)a3
{
  id v3;
  uint64_t v4;
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
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    v12 = 0;
    goto LABEL_15;
  }
  v4 = objc_msgSend(MEMORY[0x1E0C97468], "maxContactAvatars");
  objc_msgSend(v3, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", MEMORY[0x1E0C9AA60], v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isGroupConversation"))
  {
    objc_msgSend(v5, "contacts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CEA358], "iconWithContact:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v5, "groupPhoto");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageByPreparingThumbnailOfSize:", 35.0, 35.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CEA358];
  objc_msgSend(v8, "ck_imageCroppedToCircle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconWithCustomImage:isTemplate:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  if (objc_msgSend(v3, "hasDisplayName"))
    objc_msgSend(v3, "displayName");
  else
    objc_msgSend(v3, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA798]), "initWithType:localizedTitle:", CFSTR("com.apple.mobilesms.conversation"), v14);
  v12 = v15;
  if (v11)
    objc_msgSend(v15, "setIcon:", v11);
  v20 = CFSTR("CKSBActionUserInfoKeyChatGUID");
  objc_msgSend(v3, "chat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "guid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUserInfo:", v18);

LABEL_15:
  return v12;
}

- (void)updateShortcutItems
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CKSpringBoardActionManager_updateShortcutItems__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(v3, block);

}

void __49__CKSpringBoardActionManager_updateShortcutItems__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD block[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pinnedConversations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "shortcutItemForConversation:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);
        v11 = objc_msgSend(v4, "count");

        if (v11 == 3)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v7)
            goto LABEL_4;
          break;
        }
      }
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__CKSpringBoardActionManager_updateShortcutItems__block_invoke_2;
    block[3] = &unk_1E274A208;
    v14 = v4;
    v12 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "contactsSearchManager");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "searchWithText:", &stru_1E276D870);
  }

}

uint64_t __49__CKSpringBoardActionManager_updateShortcutItems__block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "setShortcutItems:", *(_QWORD *)(a1 + 32));
}

- (void)contactsSearchManager:(id)a3 finishedSearchingWithResults:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  CKSpringBoardActionManager *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v7 = v5;
  v33 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v33)
  {
    v8 = *(_QWORD *)v39;
    v31 = v7;
    v32 = self;
    v30 = *(_QWORD *)v39;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v7);
        v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "conversationGUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "conversationForExistingChatWithGUID:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 0;
        }
        else
        {
          if (objc_msgSend(v10, "isGroup"))
          {
            objc_msgSend(v10, "children");
          }
          else
          {
            v43 = v10;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
          }
          v15 = (id)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            v14 = 0;
            goto LABEL_29;
          }
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D35910], "iMessageService");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "__ck_defaultAccountForService:", v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          v15 = v15;
          v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v35;
            while (2)
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v35 != v20)
                  objc_enumerationMutation(v15);
                objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "rawAddress", v30, v31, v32);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                IMStripFormattingFromAddress();
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                if (v23)
                {
                  objc_msgSend(v12, "imHandleWithID:alreadyCanonical:", v23, 0);
                  v24 = objc_claimAutoreleasedReturnValue();
                  if (!v24)
                  {

                    v14 = 0;
                    v13 = v15;
                    goto LABEL_26;
                  }
                  v25 = (void *)v24;
                  objc_msgSend(v13, "addObject:", v24);

                }
              }
              v19 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
              if (v19)
                continue;
              break;
            }
          }

          if (!v13)
          {
            v14 = 0;
            v7 = v31;
            self = v32;
            v8 = v30;
            goto LABEL_28;
          }
          +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "conversationForHandles:displayName:joinedChatsOnly:create:", v13, 0, 1, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_26:
          v7 = v31;
          self = v32;
          v8 = v30;
        }

LABEL_28:
LABEL_29:
        -[CKSpringBoardActionManager shortcutItemForConversation:](self, "shortcutItemForConversation:", v14, v30, v31, v32);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
          objc_msgSend(v6, "addObject:", v27);
        v28 = objc_msgSend(v6, "count");

        if (v28 == 3)
          goto LABEL_36;
        ++v9;
      }
      while (v9 != v33);
      v29 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      v33 = v29;
    }
    while (v29);
  }
LABEL_36:

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "setShortcutItems:", v6);
}

- (NSArray)conversationCache
{
  NSArray *conversationCache;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  NSArray *v26;
  CKSpringBoardActionManager *v28;
  uint64_t v29;
  NSArray *v30;
  uint64_t v31;
  id obj;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  conversationCache = self->_conversationCache;
  if (!conversationCache)
  {
    v28 = self;
    v30 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v5;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v39;
      v29 = *(_QWORD *)v39;
      do
      {
        v9 = 0;
        v31 = v7;
        do
        {
          if (*(_QWORD *)v39 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v9);
          if (((objc_msgSend(v10, "isGroupConversation") & 1) != 0
             || objc_msgSend(v10, "isBusinessConversation"))
            && (objc_msgSend(v10, "hasLeft") & 1) == 0)
          {
            v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v10, "chat");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "guid");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "copy");

            v33 = (void *)v14;
            objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("CKConversationGUIDKey"));
            objc_msgSend(v10, "displayName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)objc_msgSend(v15, "copy");

            if (objc_msgSend(v16, "length"))
              objc_msgSend(v11, "setObject:forKey:", v16, CFSTR("CKConversationDisplayNameKey"));
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = 0u;
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            objc_msgSend(v10, "chat");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "participants");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v35;
              do
              {
                for (i = 0; i != v21; ++i)
                {
                  if (*(_QWORD *)v35 != v22)
                    objc_enumerationMutation(v19);
                  objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "name");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = (void *)objc_msgSend(v24, "copy");

                  objc_msgSend(v17, "addObject:", v25);
                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
              }
              while (v21);
            }

            objc_msgSend(v11, "setObject:forKey:", v17, CFSTR("CKConversationEntityNamesKey"));
            -[NSArray addObject:](v30, "addObject:", v11);

            v8 = v29;
            v7 = v31;
          }
          ++v9;
        }
        while (v9 != v7);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v7);
    }

    v26 = v28->_conversationCache;
    v28->_conversationCache = v30;

    conversationCache = v28->_conversationCache;
  }
  return conversationCache;
}

- (void)_refreshConversationCache
{
  id v3;

  -[CKSpringBoardActionManager setConversationCache:](self, "setConversationCache:", 0);
  v3 = -[CKSpringBoardActionManager conversationCache](self, "conversationCache");
}

- (void)chatStateChanged:(id)a3
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__refreshConversationCache, 0);
  -[CKSpringBoardActionManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__refreshConversationCache, 0, 1.0);
}

- (BOOL)shouldHideGroupsDonations
{
  return self->shouldHideGroupsDonations;
}

- (void)setShouldHideGroupsDonations:(BOOL)a3
{
  self->shouldHideGroupsDonations = a3;
}

- (void)setContactsSearchManager:(id)a3
{
  objc_storeStrong((id *)&self->_contactsSearchManager, a3);
}

- (void)setConversationCache:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationCache, 0);
  objc_storeStrong((id *)&self->_contactsSearchManager, 0);
}

@end
