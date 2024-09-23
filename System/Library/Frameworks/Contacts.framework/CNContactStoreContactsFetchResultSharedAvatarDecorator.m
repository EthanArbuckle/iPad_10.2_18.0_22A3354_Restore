@implementation CNContactStoreContactsFetchResultSharedAvatarDecorator

- (CNContactStoreContactsFetchResultSharedAvatarDecorator)initWithContacts:(id)a3 keysToFetch:(id)a4 unifyContactsFromMainStore:(BOOL)a5
{
  id v8;
  id v9;
  CNContactStoreContactsFetchResultSharedAvatarDecorator *v10;
  uint64_t v11;
  NSArray *value;
  CNContactStoreContactsFetchResultSharedAvatarDecorator *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNContactStoreContactsFetchResultSharedAvatarDecorator;
  v10 = -[CNContactStoreContactsFetchResultSharedAvatarDecorator init](&v15, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    value = v10->_value;
    v10->_value = (NSArray *)v11;

    objc_storeStrong((id *)&v10->_keysToFetch, a4);
    v10->_unifyContactsFromMainStore = a5;
    v13 = v10;
  }

  return v10;
}

- (NSArray)decoratedValue
{
  NSArray *decoratedValue;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  decoratedValue = self->_decoratedValue;
  if (!decoratedValue)
  {
    -[CNContactStoreContactsFetchResultSharedAvatarDecorator value](self, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStoreContactsFetchResultSharedAvatarDecorator decoratedContacts:](self, "decoratedContacts:", v4);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_decoratedValue;
    self->_decoratedValue = v5;

    decoratedValue = self->_decoratedValue;
  }
  return decoratedValue;
}

- (NSArray)value
{
  return self->_value;
}

- (id)decoratedContacts:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];

  v4 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "enableSharedPhoto") & 1) != 0
    && -[CNContactStoreContactsFetchResultSharedAvatarDecorator doesKeysToFetchContainRequiredKeys](self, "doesKeysToFetchContainRequiredKeys"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __76__CNContactStoreContactsFetchResultSharedAvatarDecorator_decoratedContacts___block_invoke;
    v8[3] = &unk_1E29F88F0;
    v8[4] = self;
    objc_msgSend(v4, "_cn_map:", v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

+ (BOOL)enableSharedPhoto
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFeatureEnabled:", 13);

  return v4;
}

- (BOOL)doesKeysToFetchContainRequiredKeys
{
  CNMutableContactKeyVector *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  const __CFString *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(CNMutableContactKeyVector);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CNContactStoreContactsFetchResultSharedAvatarDecorator keysToFetch](self, "keysToFetch", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "_cn_requiredKeys");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNMutableContactKeyVector unionKeyVector:](v3, "unionKeyVector:", v10);

        objc_msgSend(v9, "_cn_optionalKeys");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNMutableContactKeyVector unionKeyVector:](v3, "unionKeyVector:", v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }

  if (-[CNContactKeyVector containsKey:](v3, "containsKey:", CFSTR("wallpaper")))
  {
    objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_cn_requiredKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = CFSTR("wallpaper");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "keyVectorByRemovingKeys:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "isSubsetOfKeyVector:", v3);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSArray)keysToFetch
{
  return self->_keysToFetch;
}

+ (CNKeyDescriptor)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_0 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_0, &__block_literal_global_112);
  return (CNKeyDescriptor *)(id)descriptorForRequiredKeys_cn_once_object_0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysToFetch, 0);
  objc_storeStrong((id *)&self->_decoratedValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

void __83__CNContactStoreContactsFetchResultSharedAvatarDecorator_descriptorForRequiredKeys__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("sharedPhotoDisplayPreference");
  v4[1] = CFSTR("wallpaper");
  v4[2] = CFSTR("phoneNumbers");
  v4[3] = CFSTR("emailAddresses");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactStoreContactsFetchResultSharedAvatarDecorator descriptorForRequiredKeys]_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContact descriptorWithKeyDescriptors:description:](CNContact, "descriptorWithKeyDescriptors:description:", v0, v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)descriptorForRequiredKeys_cn_once_object_0;
  descriptorForRequiredKeys_cn_once_object_0 = v2;

}

- (id)nicknameForContact:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE buf[24];
  void *v14;
  uint64_t *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "allNicknamesForContact:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v3;
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_INFO, "Fetching all nicknames %@ for %@", buf, 0x16u);
  }

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v6 = (_QWORD *)getIMNicknameCurrentSymbolLoc_ptr;
  v12 = getIMNicknameCurrentSymbolLoc_ptr;
  if (!getIMNicknameCurrentSymbolLoc_ptr)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getIMNicknameCurrentSymbolLoc_block_invoke;
    v14 = &unk_1E29F98A8;
    v15 = &v9;
    __getIMNicknameCurrentSymbolLoc_block_invoke((uint64_t)buf);
    v6 = (_QWORD *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v6)
  {
    -[CNGeminiManager channelIdentifierForMostRecentSMSFromPhoneNumbers:fromChannelIdentifiers:].cold.1();
    __break(1u);
  }
  objc_msgSend(v4, "objectForKey:", *v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __76__CNContactStoreContactsFetchResultSharedAvatarDecorator_decoratedContacts___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  CNWallpaper *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  CNMutableContact *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  int v23;
  id v24;
  __int16 v25;
  void *v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (+[CNSharedProfileStateOracle contactIsInAutoUpdateState:](CNSharedProfileStateOracle, "contactIsInAutoUpdateState:", v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "nicknameForContact:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "sharedWatchWallpaperImageDataForContact:withNickname:", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sharedWallpaperForContact:withNickname:", v3, v4);
      v6 = (CNWallpaper *)objc_claimAutoreleasedReturnValue();
      v7 = *MEMORY[0x1E0D13818];
      if ((*(unsigned int (**)(_QWORD, void *))(*MEMORY[0x1E0D13818] + 16))(*MEMORY[0x1E0D13818], v5)
        && (-[CNWallpaper posterArchiveData](v6, "posterArchiveData"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8),
            v8,
            v9))
      {
        v10 = v3;
      }
      else
      {
        v11 = objc_alloc_init(CNMutableContact);
        -[CNMutableContact setImplicitAugmentation:](v11, "setImplicitAugmentation:", 1);
        objc_msgSend(v4, "wallpaper");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "metadata");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          if (!v6)
            v6 = objc_alloc_init(CNWallpaper);
          -[CNWallpaper wallpaperIncludingIMWallpaperMetadata:](v6, "wallpaperIncludingIMWallpaperMetadata:", v13);
          v14 = objc_claimAutoreleasedReturnValue();

          v6 = (CNWallpaper *)v14;
        }
        -[CNMutableContact setWatchWallpaperImageData:](v11, "setWatchWallpaperImageData:", v5);
        -[CNMutableContact setWallpaper:](v11, "setWallpaper:", v6);
        -[CNMutableContact setIsUsingSharedPhoto:](v11, "setIsUsingSharedPhoto:", 1);

        objc_msgSend(v3, "keyVector");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNMutableContact setAvailableKeyDescriptor:](v11, "setAvailableKeyDescriptor:", v15);

        if (objc_msgSend(v3, "isUnified"))
        {
          objc_msgSend(v3, "linkedContacts");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNMutableContact freeze](v11, "freeze");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "arrayByAddingObject:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v27[0] = v3;
          -[CNMutableContact freeze](v11, "freeze");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v27[1] = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend((id)objc_opt_class(), "log");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v3, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138412546;
          v24 = v4;
          v25 = 2112;
          v26 = v21;
          _os_log_impl(&dword_18F8BD000, v20, OS_LOG_TYPE_DEFAULT, "Applying nickname %@ to contact <%@>", (uint8_t *)&v23, 0x16u);

        }
        +[CN contactUnifyingContacts:includingMainStoreContacts:allowMutableContactFreeze:](CN, "contactUnifyingContacts:includingMainStoreContacts:allowMutableContactFreeze:", v18, objc_msgSend(*(id *)(a1 + 32), "unifyContactsFromMainStore"), 1);
        v10 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 138412290;
        v24 = v3;
        _os_log_impl(&dword_18F8BD000, v19, OS_LOG_TYPE_DEFAULT, "No nickname found for auto-updating contact %@", (uint8_t *)&v23, 0xCu);
      }

      v10 = v3;
    }

  }
  else
  {
    v10 = v3;
  }

  return v10;
}

+ (id)log
{
  if (log_cn_once_token_1_0 != -1)
    dispatch_once(&log_cn_once_token_1_0, &__block_literal_global_26_3);
  return (id)log_cn_once_object_1_0;
}

+ (id)allNicknamesForContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nicknameProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "imNicknameProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allNicknamesForContact:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __61__CNContactStoreContactsFetchResultSharedAvatarDecorator_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "avatar-decorator");
  v1 = (void *)log_cn_once_object_1_0;
  log_cn_once_object_1_0 = (uint64_t)v0;

}

- (CNContactStoreContactsFetchResultSharedAvatarDecorator)initWithContactsFetchResult:(id)a3 keysToFetch:(id)a4 unifyContactsFromMainStore:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  CNContactStoreContactsFetchResultSharedAvatarDecorator *v10;

  v5 = a5;
  v8 = a4;
  objc_msgSend(a3, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNContactStoreContactsFetchResultSharedAvatarDecorator initWithContacts:keysToFetch:unifyContactsFromMainStore:](self, "initWithContacts:keysToFetch:unifyContactsFromMainStore:", v9, v8, v5);

  return v10;
}

- (void)setValue:(id)a3
{
  NSArray *v5;
  NSArray *decoratedValue;
  NSArray *v7;

  v5 = (NSArray *)a3;
  if (self->_value != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_value, a3);
    decoratedValue = self->_decoratedValue;
    self->_decoratedValue = 0;

    v5 = v7;
  }

}

- (id)sharedWallpaperForContact:(id)a3 withNickname:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  if (+[CNSharedProfileStateOracle contactIsInAutoUpdateState:](CNSharedProfileStateOracle, "contactIsInAutoUpdateState:", a3))
  {
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nicknameProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sharedWallpaperForNickname:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)sharedWatchWallpaperImageDataForContact:(id)a3 withNickname:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  if (+[CNSharedProfileStateOracle contactIsInAutoUpdateState:](CNSharedProfileStateOracle, "contactIsInAutoUpdateState:", a3))
  {
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nicknameProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sharedWatchWallpaperImageDataForNickname:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setDecoratedValue:(id)a3
{
  objc_storeStrong((id *)&self->_decoratedValue, a3);
}

- (void)setKeysToFetch:(id)a3
{
  objc_storeStrong((id *)&self->_keysToFetch, a3);
}

- (BOOL)unifyContactsFromMainStore
{
  return self->_unifyContactsFromMainStore;
}

- (void)setUnifyContactsFromMainStore:(BOOL)a3
{
  self->_unifyContactsFromMainStore = a3;
}

@end
