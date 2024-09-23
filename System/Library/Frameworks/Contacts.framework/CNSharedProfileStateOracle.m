@implementation CNSharedProfileStateOracle

id __37__CNSharedProfileStateOracle_contact__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (objc_msgSend(*(id *)(a1 + 32), "shouldContactBeRefetched"))
  {
    v2 = (void *)objc_opt_class();
    v3 = *(_QWORD **)(a1 + 32);
    v4 = v3[1];
    objc_msgSend(v3, "contactStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "refetchedContactIfNeededWithRequiredKeys:contactStore:", v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 8);
    *(_QWORD *)(v7 + 8) = v6;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  }
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

- (BOOL)shouldContactBeRefetched
{
  return self->_shouldContactBeRefetched;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

+ (id)refetchedContactIfNeededWithRequiredKeys:(id)a3 contactStore:(id)a4
{
  id v5;
  id v6;
  CNAuthorizationStatus v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "isFeatureEnabled") & 1) == 0)
  {
    v12 = v5;
    goto LABEL_24;
  }
  if (!v6)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      +[CNSharedProfileStateOracle refetchedContactIfNeededWithRequiredKeys:contactStore:].cold.1();
    goto LABEL_11;
  }
  v7 = +[CNContactStore authorizationStatusForEntityType:](CNContactStore, "authorizationStatusForEntityType:", 0);
  v8 = (void *)objc_opt_class();
  if (v7 != CNAuthorizationStatusAuthorized)
  {
    objc_msgSend(v8, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[CNSharedProfileStateOracle refetchedContactIfNeededWithRequiredKeys:contactStore:].cold.4();
LABEL_11:

    v12 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v8, "descriptorForRequiredKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "areKeysAvailable:", v10);

  if (v11)
  {
    v12 = v5;
  }
  else
  {
    objc_msgSend(v5, "availableKeyDescriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v25[0] = v9;
      objc_msgSend(v5, "availableKeyDescriptor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v6, "unifiedContactWithIdentifier:keysToFetch:error:", v17, v16, &v23);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v23;

    objc_msgSend((id)objc_opt_class(), "log");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v12)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        +[CNSharedProfileStateOracle refetchedContactIfNeededWithRequiredKeys:contactStore:].cold.3();

      v21 = v12;
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        +[CNSharedProfileStateOracle refetchedContactIfNeededWithRequiredKeys:contactStore:].cold.2(v18);

    }
  }

LABEL_24:
  return v12;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1, &__block_literal_global_40);
  return (id)descriptorForRequiredKeys_cn_once_object_1;
}

+ (unint64_t)effectiveStateForContact:(id)a3
{
  id v3;
  unint64_t v4;
  int v5;

  v3 = a3;
  if (!objc_msgSend((id)objc_opt_class(), "isFeatureEnabled"))
    goto LABEL_4;
  if (!v3)
    goto LABEL_10;
  if ((objc_msgSend((id)objc_opt_class(), "isTinker") & 1) != 0)
  {
LABEL_4:
    v4 = 2;
    goto LABEL_11;
  }
  if (!objc_msgSend(v3, "isKeyAvailable:", CFSTR("sharedPhotoDisplayPreference")))
  {
LABEL_10:
    v4 = 0;
    goto LABEL_11;
  }
  v4 = objc_msgSend(v3, "sharedPhotoDisplayPreference");
  switch(v4)
  {
    case 0uLL:
      if (objc_msgSend(v3, "isKeyAvailable:", CFSTR("imageDataAvailable"))
        && objc_msgSend(v3, "imageDataAvailable"))
      {
        v5 = objc_msgSend((id)objc_opt_class(), "shouldAutoUpdateUndeterminedWithPhoto");
      }
      else
      {
        v5 = objc_msgSend((id)objc_opt_class(), "shouldAutoUpdateUndeterminedWithoutPhoto");
      }
      if (v5)
        v4 = 3;
      else
        v4 = 2;
      break;
    case 1uLL:
    case 2uLL:
    case 3uLL:
      break;
    default:
      goto LABEL_10;
  }
LABEL_11:

  return v4;
}

+ (BOOL)isFeatureEnabled
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFeatureEnabled:", 15);

  return v4;
}

+ (BOOL)shouldAutoUpdateUndeterminedWithPhoto
{
  return objc_msgSend((id)objc_opt_class(), "globalSharedProfileUpdateState") == 1;
}

+ (BOOL)isTinker
{
  return 0;
}

+ (unint64_t)globalSharedProfileUpdateState
{
  return 1;
}

void __55__CNSharedProfileStateOracle_descriptorForRequiredKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[22];

  v5[21] = *MEMORY[0x1E0C80C00];
  +[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 0, CFSTR("identifier"), CFSTR("linkIdentifier"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[4] = CFSTR("thumbnailImageData");
  v5[5] = CFSTR("cropRect");
  v5[6] = CFSTR("memojiMetadata");
  v5[7] = CFSTR("fullscreenImageData");
  v5[8] = CFSTR("imageDataAvailable");
  v5[9] = CFSTR("imageType");
  v5[2] = v0;
  v5[3] = CFSTR("imageData");
  v5[10] = CFSTR("imageHash");
  v5[11] = CFSTR("imageData");
  v5[12] = CFSTR("sharedPhotoDisplayPreference");
  v5[13] = CFSTR("watchWallpaperImageData");
  v5[14] = CFSTR("wallpaper");
  v5[15] = CFSTR("phoneNumbers");
  v5[16] = CFSTR("emailAddresses");
  v5[17] = CFSTR("instantMessageAddresses");
  v5[18] = CFSTR("socialProfiles");
  v5[19] = CFSTR("postalAddresses");
  v5[20] = CFSTR("sensitiveContentConfiguration");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 21);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNSharedProfileStateOracle descriptorForRequiredKeys]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContact descriptorWithKeyDescriptors:description:](CNContact, "descriptorWithKeyDescriptors:description:", v1, v2);
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)descriptorForRequiredKeys_cn_once_object_1;
  descriptorForRequiredKeys_cn_once_object_1 = v3;

}

- (IMNickname)pendingNickname
{
  return self->_pendingNickname;
}

- (BOOL)currentNicknameHasValidVisualIdentityData
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_class();
  -[CNSharedProfileStateOracle currentNickname](self, "currentNickname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "nicknameHasValidVisualIdentityData:", v4);

  return (char)v3;
}

- (IMNickname)currentNickname
{
  return self->_currentNickname;
}

+ (BOOL)isAutoUpdateState:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

+ (BOOL)contactIsInAutoUpdateState:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  v4 = objc_msgSend((id)objc_opt_class(), "effectiveStateForContact:", v3);

  return objc_msgSend((id)objc_opt_class(), "isAutoUpdateState:", v4);
}

- (unint64_t)effectiveStateForContact
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_opt_class();
  -[CNSharedProfileStateOracle contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "effectiveStateForContact:", v4);

  return v5;
}

- (CNContact)contact
{
  void *v2;
  void *v3;

  -[CNSharedProfileStateOracle contactLock](self, "contactLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CNResultWithLock();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContact *)v3;
}

- (CNUnfairLock)contactLock
{
  return self->_contactLock;
}

- (CNSharedProfileStateOracle)initWithContact:(id)a3 contactStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  CNSharedProfileStateOracle *v20;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nicknameProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "imNicknameProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  v14 = 0;
  v15 = 0;
  v16 = 0;
  if ((v13 & 1) != 0)
  {
    objc_msgSend(v11, "imNicknameProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allNicknamesForContact:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412546;
      v23 = v18;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_18F8BD000, v19, OS_LOG_TYPE_DEFAULT, "Fetching all nicknames %@ for %@", (uint8_t *)&v22, 0x16u);
    }

    objc_msgSend(v18, "objectForKey:", CFSTR("pendingNickname"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("currentNickname"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("archivedNickname"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v20 = -[CNSharedProfileStateOracle initWithContact:contactStore:archivedNickname:currentNickname:pendingNickname:](self, "initWithContact:contactStore:archivedNickname:currentNickname:pendingNickname:", v6, v7, v15, v14, v16);

  return v20;
}

- (CNSharedProfileStateOracle)initWithContact:(id)a3 contactStore:(id)a4 archivedNickname:(id)a5 currentNickname:(id)a6 pendingNickname:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  CNSharedProfileStateOracle *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  CNUnfairLock *v27;
  CNUnfairLock *contactLock;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  IMNicknameProvider *nicknameProvider;
  CNSharedProfileStateOracle *v35;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id obj;
  id v45;
  objc_super v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  _QWORD v55[4];

  v55[3] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  obj = a6;
  v16 = a6;
  v45 = a7;
  v17 = a7;
  v46.receiver = self;
  v46.super_class = (Class)CNSharedProfileStateOracle;
  v18 = -[CNSharedProfileStateOracle init](&v46, sel_init);
  if (v18)
  {
    v40 = v14;
    v19 = *MEMORY[0x1E0D13878];
    v43 = v15;
    (*(void (**)(_QWORD, id))(*MEMORY[0x1E0D13878] + 16))(*MEMORY[0x1E0D13878], v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v20;
    v42 = v16;
    (*(void (**)(uint64_t, id))(v19 + 16))(v19, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v21;
    v41 = v17;
    (*(void (**)(uint64_t, id))(v19 + 16))(v19, v17);
    v22 = v13;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_cn_filter:", *MEMORY[0x1E0D13830]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v22;
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0
      && (objc_msgSend((id)objc_opt_class(), "nicknames:areValidForContact:", v25, v22) & 1) == 0)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v43, "handle");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "handle");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "handle");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478595;
        v48 = v37;
        v49 = 2113;
        v50 = v38;
        v51 = 2113;
        v52 = v39;
        v53 = 2113;
        v54 = v13;
        _os_log_error_impl(&dword_18F8BD000, v26, OS_LOG_TYPE_ERROR, "Error intializing state oracle using nicknames (%{private}@, %{private}@, %{private}@) for contact %{private}@", buf, 0x2Au);

      }
    }
    objc_storeStrong((id *)&v18->_contact, a3);
    v18->_shouldContactBeRefetched = 1;
    v27 = (CNUnfairLock *)objc_alloc_init(MEMORY[0x1E0D13BD8]);
    contactLock = v18->_contactLock;
    v18->_contactLock = v27;

    objc_storeStrong((id *)&v18->_contactStore, a4);
    objc_storeStrong((id *)&v18->_archivedNickname, a5);
    objc_storeStrong((id *)&v18->_currentNickname, obj);
    objc_storeStrong((id *)&v18->_pendingNickname, v45);
    objc_opt_class();
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "nicknameProvider");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = v30;
    else
      v31 = 0;
    v32 = v31;

    objc_msgSend(v32, "imNicknameProvider");
    v33 = objc_claimAutoreleasedReturnValue();

    nicknameProvider = v18->_nicknameProvider;
    v18->_nicknameProvider = (IMNicknameProvider *)v33;

    v35 = v18;
    v14 = v40;
    v17 = v41;
    v16 = v42;
    v15 = v43;
  }

  return v18;
}

+ (id)log
{
  if (log_cn_once_token_0 != -1)
    dispatch_once(&log_cn_once_token_0, &__block_literal_global_0);
  return (id)log_cn_once_object_0;
}

void __33__CNSharedProfileStateOracle_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNSharedProfileStateOracle");
  v1 = (void *)log_cn_once_object_0;
  log_cn_once_object_0 = (uint64_t)v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nicknameProvider, 0);
  objc_storeStrong((id *)&self->_recentPosterStore, 0);
  objc_storeStrong((id *)&self->_recentContactImageStore, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contactLock, 0);
  objc_storeStrong((id *)&self->_pendingNickname, 0);
  objc_storeStrong((id *)&self->_currentNickname, 0);
  objc_storeStrong((id *)&self->_archivedNickname, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)setContact:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNSharedProfileStateOracle contactLock](self, "contactLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  CNRunWithLock();

}

void __41__CNSharedProfileStateOracle_setContact___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (CNContactImageStore)recentContactImageStore
{
  cn_objectResultWithObjectLock();
  return (CNContactImageStore *)(id)objc_claimAutoreleasedReturnValue();
}

id __53__CNSharedProfileStateOracle_recentContactImageStore__block_invoke(uint64_t a1)
{
  void *v2;
  CNContactImageStore *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (!v2)
  {
    v3 = objc_alloc_init(CNContactImageStore);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 64);
    *(_QWORD *)(v4 + 64) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  }
  return v2;
}

- (CNContactPosterStore)recentPosterStore
{
  cn_objectResultWithObjectLock();
  return (CNContactPosterStore *)(id)objc_claimAutoreleasedReturnValue();
}

id __47__CNSharedProfileStateOracle_recentPosterStore__block_invoke(uint64_t a1)
{
  void *v2;
  CNContactPosterStore *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if (!v2)
  {
    v3 = objc_alloc_init(CNContactPosterStore);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 72);
    *(_QWORD *)(v4 + 72) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  }
  return v2;
}

+ (BOOL)nicknames:(id)a3 areValidForContact:(id)a4
{
  id v5;
  id v6;
  CNSharedProfileContactHandleHelper *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  _BOOL4 v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(CNSharedProfileContactHandleHelper);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "handle", (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[CNSharedProfileContactHandleHelper contact:containsHandleString:](v7, "contact:containsHandleString:", v6, v13);

        if (!v14)
        {
          v15 = 0;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_11:

  return v15;
}

- (BOOL)effectiveStateForContactIsAutoUpdate
{
  return objc_msgSend((id)objc_opt_class(), "isAutoUpdateState:", -[CNSharedProfileStateOracle effectiveStateForContact](self, "effectiveStateForContact"));
}

- (id)availableActionTypesForEffectiveState
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  unint64_t v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  int v14;
  void *v15;
  NSObject *v16;
  int v18;
  _BYTE v19[10];
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)objc_opt_class(), "isFeatureEnabled"))
    return (id)MEMORY[0x1E0C9AA60];
  -[CNSharedProfileStateOracle contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return (id)MEMORY[0x1E0C9AA60];
  -[CNSharedProfileStateOracle contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasBeenPersisted");

  if ((v5 & 1) != 0)
  {
    -[CNSharedProfileStateOracle archivedNickname](self, "archivedNickname");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[CNSharedProfileStateOracle effectiveStateForContact](self, "effectiveStateForContact");
    v8 = -[CNSharedProfileStateOracle isRevertToPreviousExpired](self, "isRevertToPreviousExpired");
    -[CNSharedProfileStateOracle currentNickname](self, "currentNickname");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharedProfileStateOracle archivedNickname](self, "archivedNickname");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToNickname:options:", v10, 34);

    objc_msgSend((id)objc_opt_class(), "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 67109888;
      *(_DWORD *)v19 = v6 != 0;
      *(_WORD *)&v19[4] = 1024;
      *(_DWORD *)&v19[6] = v7 == 2;
      v20 = 1024;
      v21 = v8;
      v22 = 1024;
      v23 = v11;
      _os_log_impl(&dword_18F8BD000, v12, OS_LOG_TYPE_DEFAULT, "available action types: hasArchivedNicknameToRevertTo %d, currentlyAlwaysAsk %d, revertToPreviousExpired %d, previousDiffersFromCurrent %d", (uint8_t *)&v18, 0x1Au);
    }

    v14 = v7 == 2 || v6 == 0 || v8;
    if (v14 | v11 ^ 1)
      v15 = &unk_1E2A40608;
    else
      v15 = &unk_1E2A405F0;
    objc_msgSend((id)objc_opt_class(), "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      *(_QWORD *)v19 = v15;
      _os_log_impl(&dword_18F8BD000, v16, OS_LOG_TYPE_DEFAULT, "Available action types: %@", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_18F8BD000, v16, OS_LOG_TYPE_DEFAULT, "Cannot show photo preference actions for an unsaved contact", (uint8_t *)&v18, 2u);
    }
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

- (unint64_t)bannerActionTypeForEffectiveState
{
  void *v3;
  void *v4;
  char v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v36;
  _BYTE v37[20];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_opt_class(), "isFeatureEnabled"))
  {
    -[CNSharedProfileStateOracle contact](self, "contact");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[CNSharedProfileStateOracle contact](self, "contact");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "hasBeenPersisted");

      if ((v5 & 1) == 0)
      {
        objc_msgSend((id)objc_opt_class(), "log");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_18F8BD000, v12, OS_LOG_TYPE_DEFAULT, "Cannot show banners for an unsaved contact", (uint8_t *)&v36, 2u);
        }
        v11 = 0;
        goto LABEL_40;
      }
      v6 = -[CNSharedProfileStateOracle effectiveStateForContact](self, "effectiveStateForContact");
      objc_msgSend((id)objc_opt_class(), "log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[CNSharedProfileStateOracle contact](self, "contact");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "descriptionForUpdateState:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138543618;
        *(_QWORD *)v37 = v9;
        *(_WORD *)&v37[8] = 2112;
        *(_QWORD *)&v37[10] = v10;
        _os_log_impl(&dword_18F8BD000, v7, OS_LOG_TYPE_DEFAULT, "Looking up banner action type for contact (%{public}@) with effective state: %@", (uint8_t *)&v36, 0x16u);

      }
      if (v6 != 3)
      {
        if (v6 == 2)
        {
          -[CNSharedProfileStateOracle pendingNickname](self, "pendingNickname");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            -[CNSharedProfileStateOracle pendingNickname](self, "pendingNickname");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_opt_respondsToSelector();

            if ((v20 & 1) != 0)
            {
              -[CNSharedProfileStateOracle pendingNickname](self, "pendingNickname");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "isIgnored");

            }
            else
            {
              v22 = 0;
            }
            objc_msgSend((id)objc_opt_class(), "log");
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              -[CNSharedProfileStateOracle contact](self, "contact");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "identifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = 67109378;
              *(_DWORD *)v37 = v22;
              *(_WORD *)&v37[4] = 2114;
              *(_QWORD *)&v37[6] = v31;
              _os_log_impl(&dword_18F8BD000, v29, OS_LOG_TYPE_DEFAULT, "Looking up banner action type: pendingIsIgnored %d for contact (%{public}@)", (uint8_t *)&v36, 0x12u);

            }
            if (v22)
              v11 = 0;
            else
              v11 = 3;
            goto LABEL_38;
          }
          objc_msgSend((id)objc_opt_class(), "log");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            -[CNSharedProfileStateOracle contact](self, "contact");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "identifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = 138543362;
            *(_QWORD *)v37 = v28;
            _os_log_impl(&dword_18F8BD000, v26, OS_LOG_TYPE_DEFAULT, "Looking up banner action type: pendingNickname is nil for contact (%{public}@)", (uint8_t *)&v36, 0xCu);

          }
        }
        else if (v6 == 1)
        {
          v11 = -[CNSharedProfileStateOracle canShowRevertToPreviousBannerForEffectiveState:](self, "canShowRevertToPreviousBannerForEffectiveState:", 1);
          goto LABEL_38;
        }
        v11 = 0;
LABEL_38:
        objc_msgSend((id)objc_opt_class(), "log");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend((id)objc_opt_class(), "descriptionForActionType:", v11);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNSharedProfileStateOracle contact](self, "contact");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "identifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = 138412546;
          *(_QWORD *)v37 = v32;
          *(_WORD *)&v37[8] = 2114;
          *(_QWORD *)&v37[10] = v34;
          _os_log_impl(&dword_18F8BD000, v12, OS_LOG_TYPE_DEFAULT, "Returning banner action type: %@ for contact (%{public}@)", (uint8_t *)&v36, 0x16u);

        }
LABEL_40:

        return v11;
      }
      -[CNSharedProfileStateOracle lastRecentContactImage](self, "lastRecentContactImage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSharedProfileStateOracle lastRecentPoster](self, "lastRecentPoster");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v13)
      {
        v16 = objc_msgSend(v13, "ignoredForRevert") ^ 1;
        if (v15)
        {
LABEL_16:
          v17 = objc_msgSend(v15, "ignoredForRevert") ^ 1;
LABEL_22:
          objc_msgSend((id)objc_opt_class(), "log");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            -[CNSharedProfileStateOracle contact](self, "contact");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = 67109634;
            *(_DWORD *)v37 = v16;
            *(_WORD *)&v37[4] = 1024;
            *(_DWORD *)&v37[6] = v17;
            *(_WORD *)&v37[10] = 2114;
            *(_QWORD *)&v37[12] = v25;
            _os_log_impl(&dword_18F8BD000, v23, OS_LOG_TYPE_DEFAULT, "Looking up banner action type: recentAvatarAvailableForRevert %d, recentPosterAvailableForRevert %d for contact (%{public}@)", (uint8_t *)&v36, 0x18u);

          }
          if (((v16 | v17) & 1) != 0)
            v11 = 2;
          else
            v11 = -[CNSharedProfileStateOracle canShowRevertToPreviousBannerForEffectiveState:](self, "canShowRevertToPreviousBannerForEffectiveState:", 3);

          goto LABEL_38;
        }
      }
      else
      {
        v16 = 0;
        if (v14)
          goto LABEL_16;
      }
      v17 = 0;
      goto LABEL_22;
    }
  }
  return 0;
}

- (BOOL)canShowRevertToPreviousBannerForEffectiveState:(unint64_t)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  int v26;
  void *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend((id)objc_opt_class(), "isAutoUpdateState:", a3);
  if (!v4)
    return v4;
  -[CNSharedProfileStateOracle archivedNickname](self, "archivedNickname");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      -[CNSharedProfileStateOracle contact](self, "contact");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v23;
      _os_log_impl(&dword_18F8BD000, v21, OS_LOG_TYPE_DEFAULT, "No archived nickname found for contact (%{public}@), cannot show revert to previous banner", (uint8_t *)&v26, 0xCu);

    }
    goto LABEL_15;
  }
  -[CNSharedProfileStateOracle archivedNickname](self, "archivedNickname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileStateOracle currentNickname](self, "currentNickname");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToNickname:options:", v7, 2);

  -[CNSharedProfileStateOracle archivedNickname](self, "archivedNickname");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileStateOracle currentNickname](self, "currentNickname");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToNickname:options:", v10, 32);

  objc_msgSend((id)objc_opt_class(), "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[CNSharedProfileStateOracle contact](self, "contact");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543874;
    v27 = v14;
    v28 = 1024;
    v29 = v8;
    v30 = 1024;
    v31 = v11;
    _os_log_impl(&dword_18F8BD000, v12, OS_LOG_TYPE_DEFAULT, "Contact (%{public}@) archived vs current: photoDiffers %d, wallpaperDiffers %d", (uint8_t *)&v26, 0x18u);

  }
  if (((v8 | v11) & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_18F8BD000, v24, OS_LOG_TYPE_DEFAULT, "Not offering revert banner, no photo or wallpaper changes from current to archived", (uint8_t *)&v26, 2u);
    }

LABEL_15:
    LOBYTE(v4) = 0;
    return v4;
  }
  -[CNSharedProfileStateOracle archivedNickname](self, "archivedNickname");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isIgnored");

  v17 = -[CNSharedProfileStateOracle isRevertBannerExpired](self, "isRevertBannerExpired");
  objc_msgSend((id)objc_opt_class(), "log");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    -[CNSharedProfileStateOracle contact](self, "contact");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543874;
    v27 = v20;
    v28 = 1024;
    v29 = v16;
    v30 = 1024;
    v31 = v17;
    _os_log_impl(&dword_18F8BD000, v18, OS_LOG_TYPE_DEFAULT, "Contact (%{public}@) archivedIsIgnored %d, archivedIsExpired %d", (uint8_t *)&v26, 0x18u);

  }
  LOBYTE(v4) = (v16 | v17) ^ 1;
  return v4;
}

- (id)targetProfileForActionType:(unint64_t)a3
{
  CNSharedProfile *v5;
  CNSharedProfile *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  CNSharedProfile *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  CNSharedProfile *v17;
  void *v18;
  CNSharedProfile *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  CNSharedProfile *v28;
  void *v29;
  NSObject *v30;
  const char *v31;
  CNSharedProfile *v32;
  void *v33;
  void *v34;
  CNSharedProfile *v35;
  void *v36;
  int v37;
  void *v38;
  CNSharedProfile *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  CNSharedProfile *v44;
  void *v45;
  void *v46;
  int v47;
  CNSharedProfile *v48;
  void *v49;
  CNSharedProfile *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  int v54;
  CNSharedProfile *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)objc_opt_class(), "isFeatureEnabled"))
    return 0;
  -[CNSharedProfileStateOracle contact](self, "contact");
  v5 = (CNSharedProfile *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return v5;
  if (!-[CNSharedProfileStateOracle contactRequiresUpdateForActionType:](self, "contactRequiresUpdateForActionType:", a3))
  {
    v17 = [CNSharedProfile alloc];
    -[CNSharedProfileStateOracle contact](self, "contact");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[CNSharedProfile initWithContact:](v17, "initWithContact:", v18);

    return v19;
  }
  switch(a3)
  {
    case 3uLL:
      if (-[CNSharedProfileStateOracle effectiveStateForContact](self, "effectiveStateForContact") == 2)
      {
        -[CNSharedProfileStateOracle pendingNickname](self, "pendingNickname");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          -[CNSharedProfileStateOracle currentNickname](self, "currentNickname");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21 == 0;

        }
        else
        {
          v22 = 0;
        }

        -[CNSharedProfileStateOracle pendingNickname](self, "pendingNickname");
        v40 = objc_claimAutoreleasedReturnValue();
        if (v40
          && ((v41 = (void *)v40,
               -[CNSharedProfileStateOracle currentNickname](self, "currentNickname"),
               v42 = (void *)objc_claimAutoreleasedReturnValue(),
               v42,
               v41,
               !v42)
            ? (v43 = 1)
            : (v43 = v22),
              v43 != 1))
        {
          -[CNSharedProfileStateOracle pendingNickname](self, "pendingNickname");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "hasObservedTransition");

          if (v47)
            goto LABEL_47;
        }
        else if (v22)
        {
LABEL_47:
          v44 = [CNSharedProfile alloc];
          -[CNSharedProfileStateOracle pendingNickname](self, "pendingNickname");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = -[CNSharedProfile initWithNickname:](v44, "initWithNickname:", v45);

          objc_msgSend((id)objc_opt_class(), "log");
          v15 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            goto LABEL_57;
          -[CNSharedProfileStateOracle contact](self, "contact");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "identifier");
          v30 = objc_claimAutoreleasedReturnValue();
          v54 = 138543362;
          v55 = (CNSharedProfile *)v30;
          v31 = "Contact (%{public}@) has a pending nickname ready, using pendingNickname as target Latest Photo";
          goto LABEL_55;
        }
        -[CNSharedProfileStateOracle currentNickname](self, "currentNickname");
        v5 = (CNSharedProfile *)objc_claimAutoreleasedReturnValue();

        if (!v5)
          goto LABEL_58;
        v48 = [CNSharedProfile alloc];
        -[CNSharedProfileStateOracle currentNickname](self, "currentNickname");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = -[CNSharedProfile initWithNickname:](v48, "initWithNickname:", v49);

        objc_msgSend((id)objc_opt_class(), "log");
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          goto LABEL_57;
        -[CNSharedProfileStateOracle contact](self, "contact");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "identifier");
        v30 = objc_claimAutoreleasedReturnValue();
        v54 = 138543362;
        v55 = (CNSharedProfile *)v30;
        v31 = "Contact (%{public}@) has a current nickname with no pending nickname ready, using currentNickname as target Latest Photo";
      }
      else
      {
        -[CNSharedProfileStateOracle currentNickname](self, "currentNickname");
        v5 = (CNSharedProfile *)objc_claimAutoreleasedReturnValue();

        if (!v5)
          goto LABEL_58;
        v28 = [CNSharedProfile alloc];
        -[CNSharedProfileStateOracle currentNickname](self, "currentNickname");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = -[CNSharedProfile initWithNickname:](v28, "initWithNickname:", v29);

        objc_msgSend((id)objc_opt_class(), "log");
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          goto LABEL_57;
        -[CNSharedProfileStateOracle contact](self, "contact");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "identifier");
        v30 = objc_claimAutoreleasedReturnValue();
        v54 = 138543362;
        v55 = (CNSharedProfile *)v30;
        v31 = "Contact (%{public}@) using currentNickname as target Latest Photo";
      }
LABEL_55:
      _os_log_impl(&dword_18F8BD000, v15, OS_LOG_TYPE_DEFAULT, v31, (uint8_t *)&v54, 0xCu);
LABEL_56:

      goto LABEL_57;
    case 2uLL:
      v23 = -[CNSharedProfileStateOracle effectiveStateForContact](self, "effectiveStateForContact");
      if (v23 == 1)
        goto LABEL_22;
      if (v23 != 3)
      {
        v32 = [CNSharedProfile alloc];
        -[CNSharedProfileStateOracle contact](self, "contact");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = -[CNSharedProfile initWithContact:](v32, "initWithContact:", v33);

        objc_msgSend((id)objc_opt_class(), "log");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          -[CNSharedProfileStateOracle contact](self, "contact");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "identifier");
          v35 = (CNSharedProfile *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "descriptionForActionType:", 2);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = 138543618;
          v55 = v35;
          v56 = 2112;
          v57 = v36;
          _os_log_impl(&dword_18F8BD000, v15, OS_LOG_TYPE_DEFAULT, "Defaulting to using current contact (%{public}@) photo as target photo for action type: %@ ", (uint8_t *)&v54, 0x16u);

        }
        goto LABEL_57;
      }
      -[CNSharedProfileStateOracle contact](self, "contact");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "sharedPhotoDisplayPreference");

      if (v25)
      {
LABEL_22:
        -[CNSharedProfileStateOracle lastRecentContactImage](self, "lastRecentContactImage");
        v15 = objc_claimAutoreleasedReturnValue();
        -[CNSharedProfileStateOracle lastRecentPoster](self, "lastRecentPoster");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          v27 = -[NSObject ignoredForRevert](v15, "ignoredForRevert") ^ 1;
        else
          v27 = 0;
        if (v26)
          v37 = objc_msgSend(v26, "ignoredForRevert") ^ 1;
        else
          v37 = 0;
        if (((v27 | v37) & 1) != 0)
        {
          v5 = -[CNSharedProfile initWithRecentContactImage:recentPoster:]([CNSharedProfile alloc], "initWithRecentContactImage:recentPoster:", v15, v26);
          objc_msgSend((id)objc_opt_class(), "log");
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            -[CNSharedProfileStateOracle contact](self, "contact");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "identifier");
            v39 = (CNSharedProfile *)objc_claimAutoreleasedReturnValue();
            v54 = 138543362;
            v55 = v39;
            _os_log_impl(&dword_18F8BD000, v30, OS_LOG_TYPE_DEFAULT, "Contact (%{public}@) has a recent avatar or poster, using recent as target Custom Photo", (uint8_t *)&v54, 0xCu);

          }
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "log");
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            -[CNSharedProfileStateOracle targetProfileForActionType:].cold.2(self);
          v5 = 0;
        }
        goto LABEL_56;
      }
      v50 = [CNSharedProfile alloc];
      -[CNSharedProfileStateOracle contact](self, "contact");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[CNSharedProfile initWithContact:](v50, "initWithContact:", v51);

      objc_msgSend((id)objc_opt_class(), "log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[CNSharedProfileStateOracle contact](self, "contact");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "identifier");
        v30 = objc_claimAutoreleasedReturnValue();
        v54 = 138543362;
        v55 = (CNSharedProfile *)v30;
        v31 = "Contact (%{public}@) is in an undetermined update state, using the existing contact photo as target Custom Photo";
        goto LABEL_55;
      }
LABEL_57:

      goto LABEL_58;
    case 1uLL:
      -[CNSharedProfileStateOracle archivedNickname](self, "archivedNickname");
      v5 = (CNSharedProfile *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        goto LABEL_58;
      v6 = [CNSharedProfile alloc];
      -[CNSharedProfileStateOracle archivedNickname](self, "archivedNickname");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[CNSharedProfile initWithNickname:](v6, "initWithNickname:", v7);

      objc_msgSend((id)objc_opt_class(), "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[CNSharedProfileStateOracle contact](self, "contact");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (CNSharedProfile *)objc_claimAutoreleasedReturnValue();
        v54 = 138543362;
        v55 = v10;
        _os_log_impl(&dword_18F8BD000, v8, OS_LOG_TYPE_DEFAULT, "Contact (%{public}@) has an archived nickname, using archivedNickname as target Previous Photo", (uint8_t *)&v54, 0xCu);

      }
      -[CNSharedProfileStateOracle currentNickname](self, "currentNickname");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        goto LABEL_58;
      -[CNSharedProfileStateOracle currentNickname](self, "currentNickname");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSharedProfileStateOracle archivedNickname](self, "archivedNickname");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[CNSharedProfileStateOracle didPhotoOrWallpaperChangeFrom:to:](self, "didPhotoOrWallpaperChangeFrom:to:", v12, v13);

      if (v14)
        goto LABEL_58;
      objc_msgSend((id)objc_opt_class(), "log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[CNSharedProfileStateOracle targetProfileForActionType:].cold.1(self);
      goto LABEL_57;
  }
  v5 = 0;
LABEL_58:
  objc_msgSend((id)objc_opt_class(), "log");
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "descriptionForActionType:", a3);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 138412546;
    v55 = v5;
    v56 = 2112;
    v57 = v53;
    _os_log_impl(&dword_18F8BD000, v52, OS_LOG_TYPE_DEFAULT, "Returning target shared profile %@ for action type %@", (uint8_t *)&v54, 0x16u);

  }
  return v5;
}

- (BOOL)shouldPerformTransitionAnimation
{
  int v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  int v33;
  _DWORD v34[7];

  *(_QWORD *)&v34[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend((id)objc_opt_class(), "isFeatureEnabled");
  if (!v3)
    return v3;
  -[CNSharedProfileStateOracle contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_19;
  if ((objc_msgSend((id)objc_opt_class(), "shouldBypassPersistenceCheck") & 1) == 0)
  {
    -[CNSharedProfileStateOracle contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasBeenPersisted");

    if ((v6 & 1) == 0)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_18F8BD000, v18, OS_LOG_TYPE_DEFAULT, "Cannot show an animation for an unsaved contact", (uint8_t *)&v33, 2u);
      }

      goto LABEL_19;
    }
  }
  objc_msgSend((id)objc_opt_class(), "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[CNSharedProfileStateOracle contact](self, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138412290;
    *(_QWORD *)v34 = v9;
    _os_log_impl(&dword_18F8BD000, v7, OS_LOG_TYPE_DEFAULT, "Checking for shouldPerformTransitionAnimation for contact <%@>", (uint8_t *)&v33, 0xCu);

  }
  v10 = -[CNSharedProfileStateOracle didPendingNicknameChangePhotoOrWallpaper](self, "didPendingNicknameChangePhotoOrWallpaper");
  objc_msgSend((id)objc_opt_class(), "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v33 = 67109120;
    v34[0] = v10;
    _os_log_impl(&dword_18F8BD000, v11, OS_LOG_TYPE_DEFAULT, "Pending nickname didPendingNicknameChangePhotoOrWallpaper: %d", (uint8_t *)&v33, 8u);
  }

  if (!v10)
    goto LABEL_19;
  -[CNSharedProfileStateOracle pendingNickname](self, "pendingNickname");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v33 = 67109120;
    v34[0] = 1;
    _os_log_impl(&dword_18F8BD000, v13, OS_LOG_TYPE_DEFAULT, "shouldPerformTransitionAnimation: pendingHasChangedPhotoOrWallpaper: %d", (uint8_t *)&v33, 8u);
  }

  if (!v12)
    goto LABEL_19;
  if (!-[CNSharedProfileStateOracle effectiveStateForContactIsAutoUpdate](self, "effectiveStateForContactIsAutoUpdate"))
  {
    -[CNSharedProfileStateOracle pendingNickname](self, "pendingNickname");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[CNSharedProfileStateOracle pendingNickname](self, "pendingNickname");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "hasObservedTransition");

    }
    else
    {
      v17 = 0;
    }
    objc_msgSend((id)objc_opt_class(), "log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 67109120;
      v34[0] = v17;
      _os_log_impl(&dword_18F8BD000, v19, OS_LOG_TYPE_DEFAULT, "shouldPerformTransitionAnimation: hasObservedTransition: %d", (uint8_t *)&v33, 8u);
    }

    if ((v17 & 1) != 0)
    {
LABEL_19:
      LOBYTE(v3) = 0;
      return v3;
    }
  }
  -[CNSharedProfileStateOracle contact](self, "contact");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v20, "imageDataAvailable") & 1) != 0)
  {
    v21 = 0;
  }
  else
  {
    -[CNSharedProfileStateOracle pendingNickname](self, "pendingNickname");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "avatar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v23, "hasImage") ^ 1;

  }
  v24 = *MEMORY[0x1E0D13818];
  -[CNSharedProfileStateOracle contact](self, "contact");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "wallpaper");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "posterArchiveData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(uint64_t, void *))(v24 + 16))(v24, v27))
  {
    -[CNSharedProfileStateOracle pendingNickname](self, "pendingNickname");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "wallpaper");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "wallpaperExists") ^ 1;

  }
  else
  {
    v30 = 0;
  }

  objc_msgSend((id)objc_opt_class(), "log");
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v33 = 67109376;
    v34[0] = v30;
    LOWORD(v34[1]) = 1024;
    *(_DWORD *)((char *)&v34[1] + 2) = v21;
    _os_log_impl(&dword_18F8BD000, v31, OS_LOG_TYPE_DEFAULT, "shouldPerformTransitionAnimation: noWallpaperToTransition: %d, noAvatarToTransition :%d", (uint8_t *)&v33, 0xEu);
  }

  LOBYTE(v3) = v21 & v30 ^ 1;
  return v3;
}

- (unint64_t)avatarViewAnimationTypeForEffectiveState
{
  void *v3;
  unint64_t v4;

  if (objc_msgSend((id)objc_opt_class(), "isFeatureEnabled")
    && (-[CNSharedProfileStateOracle contact](self, "contact"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3)
    && -[CNSharedProfileStateOracle shouldPerformTransitionAnimation](self, "shouldPerformTransitionAnimation")
    && (v4 = -[CNSharedProfileStateOracle effectiveStateForContact](self, "effectiveStateForContact"), v4 <= 3))
  {
    return qword_18FA409C8[v4];
  }
  else
  {
    return 2;
  }
}

- (BOOL)contactRequiresUpdateForActionType:(unint64_t)a3
{
  int v5;
  BOOL v6;
  char v7;

  v5 = objc_msgSend((id)objc_opt_class(), "isFeatureEnabled");
  if (v5)
  {
    v6 = -[CNSharedProfileStateOracle effectiveStateForContact](self, "effectiveStateForContact") != 1;
    v7 = a3 != 3 || v6;
    if (a3)
      LOBYTE(v5) = v7;
    else
      LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)updateContactForActionType:(unint64_t)a3 error:(id *)a4
{
  int v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v20;
  BOOL v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend((id)objc_opt_class(), "isFeatureEnabled");
  -[CNSharedProfileStateOracle contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7)
    return v9;

  if (!v9)
    return v9;
  -[CNSharedProfileStateOracle contact](self, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasBeenPersisted");

  if ((v11 & 1) != 0)
  {
    if (!-[CNSharedProfileStateOracle contactRequiresUpdateForActionType:](self, "contactRequiresUpdateForActionType:", a3))
    {
      -[CNSharedProfileStateOracle contact](self, "contact");
      return (id)objc_claimAutoreleasedReturnValue();
    }
    -[CNSharedProfileStateOracle targetProfileForActionType:](self, "targetProfileForActionType:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharedProfileStateOracle contact](self, "contact");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    switch(a3)
    {
      case 0uLL:
        objc_msgSend((id)objc_opt_class(), "log");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_18F8BD000, v20, OS_LOG_TYPE_DEFAULT, "Trying to update contact for action type None", (uint8_t *)&v27, 2u);
        }

        break;
      case 1uLL:
      case 2uLL:
        objc_msgSend(v14, "updateWithSharedProfile:", v12);
        v15 = v14;
        v16 = 2;
        goto LABEL_15;
      case 3uLL:
        objc_msgSend(v14, "updateWithSharedProfile:", v12);
        v15 = v14;
        v16 = 1;
LABEL_15:
        objc_msgSend(v15, "setSharedPhotoDisplayPreference:", v16);
        break;
      default:
        break;
    }
    v21 = -[CNSharedProfileStateOracle saveUpdatedContact:error:](self, "saveUpdatedContact:error:", v14, a4);
    objc_msgSend((id)objc_opt_class(), "log");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        -[CNSharedProfileStateOracle contact](self, "contact");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "descriptionForActionType:", a3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543618;
        v28 = v25;
        v29 = 2112;
        v30 = v26;
        _os_log_impl(&dword_18F8BD000, v23, OS_LOG_TYPE_DEFAULT, "Saved updated contact: %{public}@ for actionType %@", (uint8_t *)&v27, 0x16u);

      }
      objc_msgSend(v14, "freeze");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[CNSharedProfileStateOracle updateContactForActionType:error:].cold.1((uint64_t)self, a3);

      v9 = 0;
    }

    return v9;
  }
  objc_msgSend((id)objc_opt_class(), "log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "descriptionForActionType:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138412290;
    v28 = v18;
    _os_log_impl(&dword_18F8BD000, v17, OS_LOG_TYPE_DEFAULT, "Cannot update an unsaved contact for actionType %@", (uint8_t *)&v27, 0xCu);

  }
  return 0;
}

- (id)updateContactAndNicknamesForActionType:(unint64_t)a3 error:(id *)a4
{
  int v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  char v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend((id)objc_opt_class(), "isFeatureEnabled");
  -[CNSharedProfileStateOracle contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7)
    return v9;

  if (!v9)
    return v9;
  -[CNSharedProfileStateOracle contact](self, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasBeenPersisted");

  objc_msgSend((id)objc_opt_class(), "log");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if ((v11 & 1) != 0)
  {
    if (v13)
    {
      -[CNSharedProfileStateOracle contact](self, "contact");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "descriptionForActionType:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138543618;
      v37 = v15;
      v38 = 2112;
      v39 = v16;
      _os_log_impl(&dword_18F8BD000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to update contact (%{public}@) and nicknames for actionType: %@", (uint8_t *)&v36, 0x16u);

    }
    -[CNSharedProfileStateOracle updateContactForActionType:error:](self, "updateContactForActionType:error:", a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 3)
    {
      -[CNSharedProfileStateOracle contact](self, "contact");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "sharedPhotoDisplayPreference");

      v29 = -[CNSharedProfileStateOracle effectiveStateForContact](self, "effectiveStateForContact");
      if (!v28 || v29 == 2)
        -[CNSharedProfileStateOracle saveCurrentAvatarPosterPairToRecents](self, "saveCurrentAvatarPosterPairToRecents");
      -[CNSharedProfileStateOracle nicknameProvider](self, "nicknameProvider");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_opt_respondsToSelector();

      if ((v31 & 1) == 0)
        goto LABEL_21;
      -[CNSharedProfileStateOracle nicknameProvider](self, "nicknameProvider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSharedProfileStateOracle pendingNickname](self, "pendingNickname");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v19;
      v23 = v21;
      v24 = 1;
    }
    else
    {
      if (a3 != 1)
        goto LABEL_21;
      if (-[CNSharedProfileStateOracle effectiveStateForContact](self, "effectiveStateForContact") == 2)
        -[CNSharedProfileStateOracle saveCurrentAvatarPosterPairToRecents](self, "saveCurrentAvatarPosterPairToRecents");
      -[CNSharedProfileStateOracle nicknameProvider](self, "nicknameProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) == 0)
        goto LABEL_21;
      -[CNSharedProfileStateOracle nicknameProvider](self, "nicknameProvider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSharedProfileStateOracle archivedNickname](self, "archivedNickname");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v19;
      v23 = v21;
      v24 = 2;
    }
    objc_msgSend(v22, "bannerActionTapped:IMNicknameBannerAction:", v23, v24);

LABEL_21:
    -[CNSharedProfileStateOracle updateOracleContactAndNicknamesWithUpdatedContact:](self, "updateOracleContactAndNicknamesWithUpdatedContact:", v9);
    objc_msgSend((id)objc_opt_class(), "log");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      -[CNSharedProfileStateOracle contact](self, "contact");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "identifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "descriptionForActionType:", a3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138543618;
      v37 = v34;
      v38 = 2112;
      v39 = v35;
      _os_log_impl(&dword_18F8BD000, v32, OS_LOG_TYPE_DEFAULT, "Updated contact (%{public}@) and nicknames for actionType: %@", (uint8_t *)&v36, 0x16u);

    }
    return v9;
  }
  if (v13)
  {
    objc_msgSend((id)objc_opt_class(), "descriptionForActionType:", a3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 138412290;
    v37 = v25;
    _os_log_impl(&dword_18F8BD000, v12, OS_LOG_TYPE_DEFAULT, "Cannot update an unsaved contact for actionType %@", (uint8_t *)&v36, 0xCu);

  }
  -[CNSharedProfileStateOracle contact](self, "contact");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)updateContactForAutoUpdateWithError:(id *)a3
{
  int v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  CNSharedProfile *v22;
  uint64_t v23;
  CNSharedProfile *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_opt_class(), "isFeatureEnabled");
  -[CNSharedProfileStateOracle contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5)
    return v7;

  if (!v7)
    return v7;
  -[CNSharedProfileStateOracle contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasBeenPersisted");

  if ((v9 & 1) != 0)
  {
    -[CNSharedProfileStateOracle contact](self, "contact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    -[CNSharedProfileStateOracle contact](self, "contact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "sharedPhotoDisplayPreference");

    if (v13)
    {
LABEL_14:
      v22 = [CNSharedProfile alloc];
      -[CNSharedProfileStateOracle pendingNickname](self, "pendingNickname");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = -[CNSharedProfile initWithNickname:](v22, "initWithNickname:", v23);

      objc_msgSend(v11, "updateWithSharedProfile:", v24);
      LOBYTE(v23) = -[CNSharedProfileStateOracle saveUpdatedContact:error:](self, "saveUpdatedContact:error:", v11, a3);
      objc_msgSend((id)objc_opt_class(), "log");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if ((v23 & 1) != 0)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          -[CNSharedProfileStateOracle contact](self, "contact");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "identifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138543362;
          v30 = v28;
          _os_log_impl(&dword_18F8BD000, v26, OS_LOG_TYPE_DEFAULT, "Saved updated contact: %{public}@ for auto-update", (uint8_t *)&v29, 0xCu);

        }
        objc_msgSend(v11, "freeze");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[CNSharedProfileStateOracle updateContactForAutoUpdateWithError:].cold.1();

        v7 = 0;
      }

      return v7;
    }
    -[CNSharedProfileStateOracle contact](self, "contact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "imageDataAvailable"))
    {

    }
    else
    {
      v17 = *MEMORY[0x1E0D13818];
      -[CNSharedProfileStateOracle contact](self, "contact");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "wallpaper");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "posterArchiveData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v17) = (*(uint64_t (**)(uint64_t, void *))(v17 + 16))(v17, v20);

      if ((v17 & 1) != 0)
      {
        v21 = 1;
LABEL_13:
        objc_msgSend(v11, "setSharedPhotoDisplayPreference:", v21);
        -[CNSharedProfileStateOracle saveCurrentAvatarPosterPairToRecents](self, "saveCurrentAvatarPosterPairToRecents");
        goto LABEL_14;
      }
    }
    v21 = 3;
    goto LABEL_13;
  }
  objc_msgSend((id)objc_opt_class(), "log");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl(&dword_18F8BD000, v15, OS_LOG_TYPE_DEFAULT, "Cannot update an unsaved contact for autoupdate", (uint8_t *)&v29, 2u);
  }

  -[CNSharedProfileStateOracle contact](self, "contact");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)updateContactAndNicknamesForAutoUpdateWithError:(id *)a3
{
  int v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_opt_class(), "isFeatureEnabled");
  -[CNSharedProfileStateOracle contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {

    if (v7)
    {
      -[CNSharedProfileStateOracle contact](self, "contact");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "hasBeenPersisted");

      objc_msgSend((id)objc_opt_class(), "log");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if ((v9 & 1) != 0)
      {
        if (v11)
        {
          -[CNSharedProfileStateOracle contact](self, "contact");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138543362;
          v23 = v13;
          _os_log_impl(&dword_18F8BD000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to update contact (%{public}@) and nicknames for auto-update", (uint8_t *)&v22, 0xCu);

        }
        if (!-[CNSharedProfileStateOracle effectiveStateForContactIsAutoUpdate](self, "effectiveStateForContactIsAutoUpdate"))
        {
          objc_msgSend((id)objc_opt_class(), "log");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[CNSharedProfileStateOracle updateContactAndNicknamesForAutoUpdateWithError:].cold.1(self);

          v7 = 0;
          return v7;
        }
        if (-[CNSharedProfileStateOracle didPendingNicknameChangePhotoOrWallpaper](self, "didPendingNicknameChangePhotoOrWallpaper"))
        {
          -[CNSharedProfileStateOracle updateContactForAutoUpdateWithError:](self, "updateContactForAutoUpdateWithError:", a3);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNSharedProfileStateOracle nicknameProvider](self, "nicknameProvider");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_opt_respondsToSelector();

          if ((v15 & 1) != 0)
          {
            -[CNSharedProfileStateOracle nicknameProvider](self, "nicknameProvider");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNSharedProfileStateOracle pendingNickname](self, "pendingNickname");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "handle");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "markTransitionAsObservedForHandleID:isAutoUpdate:", v18, 1);

          }
          -[CNSharedProfileStateOracle updateOracleContactAndNicknamesWithUpdatedContact:](self, "updateOracleContactAndNicknamesWithUpdatedContact:", v7);
          objc_msgSend((id)objc_opt_class(), "log");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v22 = 138412290;
            v23 = v7;
            _os_log_impl(&dword_18F8BD000, v19, OS_LOG_TYPE_DEFAULT, "Updated contact and nicknames for auto-update, with result: %@", (uint8_t *)&v22, 0xCu);
          }

          return v7;
        }
      }
      else
      {
        if (v11)
        {
          LOWORD(v22) = 0;
          _os_log_impl(&dword_18F8BD000, v10, OS_LOG_TYPE_DEFAULT, "Cannot update an unsaved contact for autoupdate", (uint8_t *)&v22, 2u);
        }

      }
      -[CNSharedProfileStateOracle contact](self, "contact");
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v7;
}

- (id)updateContactForDeclinedActionType:(unint64_t)a3 error:(id *)a4
{
  int v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  unint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend((id)objc_opt_class(), "isFeatureEnabled");
  -[CNSharedProfileStateOracle contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7)
    return v9;

  if (!v9)
    return v9;
  -[CNSharedProfileStateOracle contact](self, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasBeenPersisted");

  if ((v11 & 1) != 0)
  {
    v12 = -[CNSharedProfileStateOracle effectiveStateForContact](self, "effectiveStateForContact");
    -[CNSharedProfileStateOracle contact](self, "contact");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    if (a3 == 2 && v12 == 3)
    {
      objc_msgSend(v14, "setSharedPhotoDisplayPreference:", 1);
      v15 = -[CNSharedProfileStateOracle saveUpdatedContact:error:](self, "saveUpdatedContact:error:", v14, a4);
      objc_msgSend((id)objc_opt_class(), "log");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (!v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[CNSharedProfileStateOracle updateContactForDeclinedActionType:error:].cold.1();

        v9 = 0;
        goto LABEL_17;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[CNSharedProfileStateOracle contact](self, "contact");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "descriptionForActionType:", 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543618;
        v25 = v19;
        v26 = 2112;
        v27 = v20;
        _os_log_impl(&dword_18F8BD000, v17, OS_LOG_TYPE_DEFAULT, "Saved updated contact: %{public}@ for declined actionType %@", (uint8_t *)&v24, 0x16u);

      }
    }
    objc_msgSend(v14, "freeze");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

    return v9;
  }
  objc_msgSend((id)objc_opt_class(), "log");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "descriptionForActionType:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412290;
    v25 = v22;
    _os_log_impl(&dword_18F8BD000, v21, OS_LOG_TYPE_DEFAULT, "Cannot update an unsaved contact for declined actionType %@", (uint8_t *)&v24, 0xCu);

  }
  -[CNSharedProfileStateOracle contact](self, "contact");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)updateContactAndNicknamesForDeclinedActionType:(unint64_t)a3 error:(id *)a4
{
  int v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend((id)objc_opt_class(), "isFeatureEnabled");
  -[CNSharedProfileStateOracle contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7)
    return v9;

  if (!v9)
    return v9;
  -[CNSharedProfileStateOracle contact](self, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasBeenPersisted");

  objc_msgSend((id)objc_opt_class(), "log");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if ((v11 & 1) != 0)
  {
    if (v13)
    {
      -[CNSharedProfileStateOracle contact](self, "contact");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "descriptionForActionType:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v15;
      v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_18F8BD000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to decline update for contact (%{public}@) and nicknames for actionType: %@", (uint8_t *)&v26, 0x16u);

    }
    -[CNSharedProfileStateOracle updateContactForDeclinedActionType:error:](self, "updateContactForDeclinedActionType:error:", a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 3)
    {
      -[CNSharedProfileStateOracle nicknameProvider](self, "nicknameProvider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSharedProfileStateOracle pendingNickname](self, "pendingNickname");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bannerActionTapped:IMNicknameBannerAction:", v21, 3);

    }
    else
    {
      if (a3 != 2)
      {
        if (a3 == 1)
          -[CNSharedProfileStateOracle markArchivedNicknameAsIgnored](self, "markArchivedNicknameAsIgnored");
        goto LABEL_16;
      }
      -[CNSharedProfileStateOracle lastRecentContactImage](self, "lastRecentContactImage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setIgnoredForRevert:", 1);
      -[CNSharedProfileStateOracle saveContactImage:](self, "saveContactImage:", v19);
      -[CNSharedProfileStateOracle lastRecentPoster](self, "lastRecentPoster");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setIgnoredForRevert:", 1);
      -[CNSharedProfileStateOracle saveContactPoster:](self, "saveContactPoster:", v20);
      -[CNSharedProfileStateOracle markArchivedNicknameAsIgnored](self, "markArchivedNicknameAsIgnored");
    }

LABEL_16:
    -[CNSharedProfileStateOracle updateOracleContactAndNicknamesWithUpdatedContact:](self, "updateOracleContactAndNicknamesWithUpdatedContact:", v9);
    objc_msgSend((id)objc_opt_class(), "log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[CNSharedProfileStateOracle contact](self, "contact");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "descriptionForActionType:", a3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v24;
      v28 = 2112;
      v29 = v25;
      _os_log_impl(&dword_18F8BD000, v22, OS_LOG_TYPE_DEFAULT, "Updated contact (%{public}@) and nicknames for declined actionType: %@", (uint8_t *)&v26, 0x16u);

    }
    return v9;
  }
  if (v13)
  {
    objc_msgSend((id)objc_opt_class(), "descriptionForActionType:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138412290;
    v27 = v17;
    _os_log_impl(&dword_18F8BD000, v12, OS_LOG_TYPE_DEFAULT, "Cannot update an unsaved contact for declined actionType %@", (uint8_t *)&v26, 0xCu);

  }
  -[CNSharedProfileStateOracle contact](self, "contact");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)markArchivedNicknameAsIgnored
{
  void *v3;
  void *v4;
  id v5;

  -[CNSharedProfileStateOracle nicknameProvider](self, "nicknameProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileStateOracle archivedNickname](self, "archivedNickname");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bannerActionTapped:IMNicknameBannerAction:", v4, 4);

}

- (BOOL)saveUpdatedContact:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  CNSaveRequest *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isFeatureEnabled"))
  {
    -[CNSharedProfileStateOracle contact](self, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasBeenPersisted");

    if ((v8 & 1) == 0)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v9 = (CNSaveRequest *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_18F8BD000, &v9->super, OS_LOG_TYPE_DEFAULT, "Cannot update an unsaved contact", (uint8_t *)&v17, 2u);
      }
      v14 = 0;
      goto LABEL_16;
    }
    v9 = objc_alloc_init(CNSaveRequest);
    -[CNSaveRequest updateContact:](v9, "updateContact:", v6);
    objc_msgSend((id)objc_opt_class(), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[CNSharedProfileStateOracle contact](self, "contact");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v12;
      _os_log_impl(&dword_18F8BD000, v10, OS_LOG_TYPE_DEFAULT, "Saving contact with identifier %{public}@", (uint8_t *)&v17, 0xCu);

    }
    -[CNSharedProfileStateOracle contactStore](self, "contactStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "executeSaveRequest:error:", v9, a4);

    if ((v14 & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_18F8BD000, v15, OS_LOG_TYPE_DEFAULT, "Updated oracle contact and nicknames following a contact save", (uint8_t *)&v17, 2u);
      }
    }
    else
    {
      if (!a4)
      {
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend((id)objc_opt_class(), "log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[CNSharedProfileStateOracle saveUpdatedContact:error:].cold.1(a4);
    }

    goto LABEL_16;
  }
  v14 = 0;
LABEL_17:

  return v14;
}

- (void)updateOracleContactAndNicknamesWithUpdatedContact:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isFeatureEnabled"))
  {
    -[CNSharedProfileStateOracle setContact:](self, "setContact:", v11);
    -[CNSharedProfileStateOracle nicknameProvider](self, "nicknameProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[CNSharedProfileStateOracle nicknameProvider](self, "nicknameProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allNicknamesForContact:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectForKey:", CFSTR("pendingNickname"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSharedProfileStateOracle setPendingNickname:](self, "setPendingNickname:", v8);

      objc_msgSend(v7, "objectForKey:", CFSTR("currentNickname"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSharedProfileStateOracle setCurrentNickname:](self, "setCurrentNickname:", v9);

      objc_msgSend(v7, "objectForKey:", CFSTR("archivedNickname"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSharedProfileStateOracle setArchivedNickname:](self, "setArchivedNickname:", v10);

    }
  }

}

+ (id)descriptionForActionType:(unint64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;

  if (descriptionForActionType__cn_once_token_61 != -1)
    dispatch_once(&descriptionForActionType__cn_once_token_61, &__block_literal_global_70);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = (id)descriptionForActionType__cn_once_object_61;
  objc_msgSend(v4, "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
    v8 = v7;
  else
    v8 = CFSTR("UnknownAction");

  return v8;
}

void __55__CNSharedProfileStateOracle_descriptionForActionType___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = &unk_1E2A3FE88;
  v3[1] = &unk_1E2A3FE58;
  v4[0] = CFSTR("None");
  v4[1] = CFSTR("RevertToPrevious");
  v3[2] = &unk_1E2A3FE70;
  v3[3] = &unk_1E2A3FE40;
  v4[2] = CFSTR("RevertToCustom");
  v4[3] = CFSTR("UpdateToLatest");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)descriptionForActionType__cn_once_object_61;
  descriptionForActionType__cn_once_object_61 = v1;

}

+ (id)descriptionForUpdateState:(unint64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;

  if (descriptionForUpdateState__cn_once_token_62 != -1)
    dispatch_once(&descriptionForUpdateState__cn_once_token_62, &__block_literal_global_84);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = (id)descriptionForUpdateState__cn_once_object_62;
  objc_msgSend(v4, "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
    v8 = v7;
  else
    v8 = CFSTR("UnknownState");

  return v8;
}

void __56__CNSharedProfileStateOracle_descriptionForUpdateState___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = &unk_1E2A3FE88;
  v3[1] = &unk_1E2A3FE58;
  v4[0] = CFSTR("Undetermined");
  v4[1] = CFSTR("ExplicitAutoUpdate");
  v3[2] = &unk_1E2A3FE70;
  v3[3] = &unk_1E2A3FE40;
  v4[2] = CFSTR("AlwaysAsk");
  v4[3] = CFSTR("ImplicitAutoUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)descriptionForUpdateState__cn_once_object_62;
  descriptionForUpdateState__cn_once_object_62 = v1;

}

+ (BOOL)shouldBypassPersistenceCheck
{
  return 0;
}

+ (BOOL)shouldAutoUpdateUndeterminedWithoutPhoto
{
  return 1;
}

- (BOOL)didPendingNicknameChangePhotoOrWallpaper
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CNSharedProfileStateOracle pendingNickname](self, "pendingNickname");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[CNSharedProfileStateOracle pendingNickname](self, "pendingNickname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileStateOracle currentNickname](self, "currentNickname");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNSharedProfileStateOracle didPhotoOrWallpaperChangeFrom:to:](self, "didPhotoOrWallpaperChangeFrom:to:", v4, v5);

  return v6;
}

- (BOOL)didPhotoOrWallpaperChangeFrom:(id)a3 to:(id)a4
{
  return objc_msgSend(a3, "isEqualToNickname:options:", a4, 34);
}

- (BOOL)isRevertBannerExpired
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileStateOracle archivedNickname](self, "archivedNickname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "archivedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v5);
  v7 = v6;
  -[CNSharedProfileStateOracle revertBannerMaxDisplayInterval](self, "revertBannerMaxDisplayInterval");
  LOBYTE(self) = v7 > v8;

  return (char)self;
}

- (double)revertBannerMaxDisplayInterval
{
  void *v2;
  double v3;
  double v4;
  NSObject *v5;
  int v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("CNSharedProfileRevertBannerDisplayIntervalOverride"));
  v4 = v3;

  if (v4 <= 0.0)
    return 86400.0;
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = v4;
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_DEFAULT, "Using override revert banner display interval: %.2f", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (BOOL)isRevertToPreviousExpired
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileStateOracle archivedNickname](self, "archivedNickname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "archivedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v5);
  v7 = v6;
  -[CNSharedProfileStateOracle revertToPreviousMaxDisplayInterval](self, "revertToPreviousMaxDisplayInterval");
  LOBYTE(self) = v7 > v8;

  return (char)self;
}

- (double)revertToPreviousMaxDisplayInterval
{
  void *v2;
  double v3;
  double v4;
  NSObject *v5;
  int v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("CNSharedProfilePreviousPhotoDisplayIntervalOverride"));
  v4 = v3;

  if (v4 <= 0.0)
    return 691200.0;
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = v4;
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_DEFAULT, "Using override Revert to Previous display interval: %.2f", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (BOOL)pendingNicknameHasValidVisualIdentityData
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_class();
  -[CNSharedProfileStateOracle pendingNickname](self, "pendingNickname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "nicknameHasValidVisualIdentityData:", v4);

  return (char)v3;
}

+ (BOOL)nicknameHasValidVisualIdentityData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  char v17;
  char v18;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "avatar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (uint64_t *)MEMORY[0x1E0D13818];
    if (!v5)
      goto LABEL_7;
    v7 = *MEMORY[0x1E0D13818];
    objc_msgSend(v4, "avatar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v9);

    if ((_DWORD)v7)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[CNSharedProfileStateOracle nicknameHasValidVisualIdentityData:].cold.2();

      v11 = 1;
    }
    else
    {
LABEL_7:
      v11 = 0;
    }
    objc_msgSend(v4, "wallpaper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_13;
    v13 = *v6;
    objc_msgSend(v4, "wallpaper");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "wallpaperData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v15);

    if ((_DWORD)v13)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[CNSharedProfileStateOracle nicknameHasValidVisualIdentityData:].cold.1();

      v17 = 1;
    }
    else
    {
LABEL_13:
      v17 = 0;
    }
    v18 = v11 & v17 ^ 1;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)lastRecentContactImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[CNSharedProfileStateOracle recentContactImageStore](self, "recentContactImageStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileStateOracle contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactImageFetchRequest recentImagesRequestForContactIdenfitiers:](CNContactImageFetchRequest, "recentImagesRequestForContactIdenfitiers:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "performFetchRequest:error:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)lastRecentPoster
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[CNSharedProfileStateOracle recentPosterStore](self, "recentPosterStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileStateOracle contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactPosterFetchRequest recentPostersRequestForContactIdenfitiers:](CNContactPosterFetchRequest, "recentPostersRequestForContactIdenfitiers:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "performFetchRequest:error:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)shouldSaveCurrentPoster:(id)a3 toRecentsForContact:(id)a4
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  _DWORD v16[2];
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "contentIsSensitive");
  v8 = *MEMORY[0x1E0D13818];
  objc_msgSend(v6, "posterData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  objc_msgSend(v5, "sensitiveContentConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "override");
  if (v12 == 1)
    v13 = 1;
  else
    v13 = (v7 | v10) ^ 1;
  objc_msgSend((id)objc_opt_class(), "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v16[0] = 67109888;
    v16[1] = v13;
    v17 = 1024;
    v18 = v7;
    v19 = 1024;
    v20 = v7;
    v21 = 1024;
    v22 = v12 == 1;
    _os_log_impl(&dword_18F8BD000, v14, OS_LOG_TYPE_INFO, "Poster should be saved to recents: %d | sensitive: %d, emptyData: %d, override: %d", (uint8_t *)v16, 0x1Au);
  }

  return v13;
}

- (void)saveCurrentAvatarPosterPairToRecents
{
  void *v3;
  void *v4;
  CNContactImage *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  CNContactPoster *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileStateOracle contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [CNContactImage alloc];
    -[CNSharedProfileStateOracle contact](self, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cropRect");
    v7 = -[CNContactImage initWithImageData:cropRect:lastUsedDate:](v5, "initWithImageData:cropRect:lastUsedDate:", v4, v14);

  }
  else
  {
    v7 = 0;
  }
  -[CNSharedProfileStateOracle contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wallpaper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "posterArchiveData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = -[CNContactPoster initWithPosterData:lastUsedDate:]([CNContactPoster alloc], "initWithPosterData:lastUsedDate:", v10, v14);
  else
    v11 = 0;
  -[CNSharedProfileStateOracle contact](self, "contact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "wallpaper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPoster setContentIsSensitive:](v11, "setContentIsSensitive:", objc_msgSend(v13, "contentIsSensitive"));

  if ((unint64_t)v11 | v7)
  {
    if (v7)
      -[CNSharedProfileStateOracle saveContactImage:withPairedPoster:](self, "saveContactImage:withPairedPoster:", v7, v11);
    else
      -[CNSharedProfileStateOracle saveContactPoster:](self, "saveContactPoster:", v11);
  }

}

- (void)saveContactImage:(id)a3
{
  -[CNSharedProfileStateOracle saveContactImage:withPairedPoster:](self, "saveContactImage:withPairedPoster:", a3, 0);
}

- (void)saveContactImage:(id)a3 withPairedPoster:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "setPairedPoster:", v7);
  }
  else
  {
    objc_msgSend(v6, "pairedPoster");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPairedPoster:", v8);

  }
  -[CNSharedProfileStateOracle recentContactImageStore](self, "recentContactImageStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileStateOracle contact](self, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = objc_claimAutoreleasedReturnValue();
  +[CNContactImageSaveRequest saveRequestToCreateImage:forContactIdentifier:](CNContactImageSaveRequest, "saveRequestToCreateImage:forContactIdentifier:", v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  LOBYTE(v11) = objc_msgSend(v9, "performSaveRequest:error:", v12, &v15);
  v13 = v15;
  if ((v11 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CNSharedProfileStateOracle saveContactImage:withPairedPoster:].cold.1(v13);

  }
}

- (void)saveContactPoster:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;

  v4 = a3;
  -[CNSharedProfileStateOracle recentPosterStore](self, "recentPosterStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileStateOracle contact](self, "contact");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactPosterSaveRequest saveRequestToCreatePoster:forContactIdentifier:](CNContactPosterSaveRequest, "saveRequestToCreatePoster:forContactIdentifier:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  LOBYTE(v6) = objc_msgSend(v5, "performSaveRequest:error:", v8, &v11);
  v9 = v11;
  if ((v6 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CNSharedProfileStateOracle saveContactPoster:].cold.1(v9);

  }
}

- (IMNickname)archivedNickname
{
  return self->_archivedNickname;
}

- (void)setArchivedNickname:(id)a3
{
  objc_storeStrong((id *)&self->_archivedNickname, a3);
}

- (void)setCurrentNickname:(id)a3
{
  objc_storeStrong((id *)&self->_currentNickname, a3);
}

- (void)setPendingNickname:(id)a3
{
  objc_storeStrong((id *)&self->_pendingNickname, a3);
}

- (void)setShouldContactBeRefetched:(BOOL)a3
{
  self->_shouldContactBeRefetched = a3;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void)setRecentContactImageStore:(id)a3
{
  objc_storeStrong((id *)&self->_recentContactImageStore, a3);
}

- (void)setRecentPosterStore:(id)a3
{
  objc_storeStrong((id *)&self->_recentPosterStore, a3);
}

- (IMNicknameProvider)nicknameProvider
{
  return self->_nicknameProvider;
}

- (void)setNicknameProvider:(id)a3
{
  objc_storeStrong((id *)&self->_nicknameProvider, a3);
}

+ (void)refetchedContactIfNeededWithRequiredKeys:contactStore:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_18F8BD000, v0, OS_LOG_TYPE_FAULT, "Contact store cannot be nil for shared profile state oracle", v1, 2u);
  OUTLINED_FUNCTION_4();
}

+ (void)refetchedContactIfNeededWithRequiredKeys:(void *)a1 contactStore:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_18F8BD000, v2, v3, "Failed to find matching contact with error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)refetchedContactIfNeededWithRequiredKeys:contactStore:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_18F8BD000, v1, OS_LOG_TYPE_DEBUG, "Fetched contact %@ matching %@", v2, 0x16u);
}

+ (void)refetchedContactIfNeededWithRequiredKeys:contactStore:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_18F8BD000, v0, v1, "Unable to refetch contact, not authorized", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)targetProfileForActionType:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "contact");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_18F8BD000, v3, v4, "Contact (%{public}@) has an archived and current nickname containing the same photo and wallpaper, this will result in an action that shows no change", v5, v6, v7, v8, v9);

}

- (void)targetProfileForActionType:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "contact");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_18F8BD000, v2, v3, "No recent avatar or poster available for contact %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)updateContactForActionType:(uint64_t)a1 error:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)objc_opt_class(), "descriptionForActionType:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_18F8BD000, v3, v4, "Error updating contact for actionType %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

- (void)updateContactForAutoUpdateWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_18F8BD000, v0, v1, "Error updating contact for auto-update", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)updateContactAndNicknamesForAutoUpdateWithError:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "contact");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_18F8BD000, v2, v3, "Attempting to auto-update a contact %@ without auto-update enabled", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)updateContactForDeclinedActionType:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)objc_opt_class(), "descriptionForActionType:", 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_18F8BD000, v1, v2, "Error updating contact for declined actionType %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)saveUpdatedContact:(id *)a1 error:.cold.1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_18F8BD000, v2, v3, "Error saving contact: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)nicknameHasValidVisualIdentityData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_18F8BD000, v0, v1, "Nickname contains a wallpaper object containing no data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)nicknameHasValidVisualIdentityData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_18F8BD000, v0, v1, "Nickname contains an avatar image object containing no data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)saveContactImage:(void *)a1 withPairedPoster:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_18F8BD000, v2, v3, "Failed to save contact image to recents, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)saveContactPoster:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_18F8BD000, v2, v3, "Failed to save contact poster to recents, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
