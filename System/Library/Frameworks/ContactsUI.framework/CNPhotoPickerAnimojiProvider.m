@implementation CNPhotoPickerAnimojiProvider

- (CNPhotoPickerAnimojiProvider)initWithVisualIdentity:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  CNPhotoPickerAnimojiProvider *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v5 = (void *)getAVTAvatarStoreClass_softClass_15565;
  v14 = getAVTAvatarStoreClass_softClass_15565;
  if (!getAVTAvatarStoreClass_softClass_15565)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getAVTAvatarStoreClass_block_invoke_15566;
    v10[3] = &unk_1E204EBC0;
    v10[4] = &v11;
    __getAVTAvatarStoreClass_block_invoke_15566((uint64_t)v10);
    v5 = (void *)v12[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v11, 8);
  v7 = (void *)objc_msgSend([v6 alloc], "initWithDomainIdentifier:", CFSTR("CNAvatarStoreDomainContacts"));
  v8 = -[CNPhotoPickerAnimojiProvider initWithVisualIdentity:avatarStore:](self, "initWithVisualIdentity:avatarStore:", v4, v7);

  return v8;
}

- (CNPhotoPickerAnimojiProvider)initWithVisualIdentity:(id)a3 avatarStore:(id)a4
{
  id v6;
  CNPhotoPickerAnimojiProvider *v7;
  CNPhotoPickerAnimojiProvider *v8;
  void *v9;
  uint64_t v10;
  NSString *identifier;
  CNPhotoPickerAnimojiProvider *v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CNPhotoPickerAnimojiProvider;
  v7 = -[CNPhotoPickerAnimojiProvider init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_avatarStore, a4);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v8->identifier;
    v8->identifier = (NSString *)v10;

    v12 = v8;
  }

  return v8;
}

- (id)loadItemsForSize:(CGSize)a3 scale:(double)a4 RTL:(BOOL)a5 renderingQueue:(id)a6 callbackQueue:(id)a7 itemDelegate:(id)a8
{
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v34 = a6;
  v11 = a7;
  v12 = a8;
  objc_msgSend(getAVTAvatarFetchRequestClass(), "requestForPredefinedAvatars");
  v13 = objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerAnimojiProvider avatarStore](self, "avatarStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v33 = (void *)v13;
  objc_msgSend(v14, "avatarsForFetchRequest:error:", v13, &v40);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v40;

  if (+[CNPhotoPickerCapabilities allowsAvatarStoreAccess](CNPhotoPickerCapabilities, "allowsAvatarStoreAccess"))
  {
    objc_msgSend(getAVTAvatarFetchRequestClass(), "requestForCustomAvatars");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerAnimojiProvider avatarStore](self, "avatarStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v16;
    objc_msgSend(v18, "avatarsForFetchRequest:error:", v17, &v39);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v39;

    objc_msgSend(v19, "_cn_reversed");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "arrayByAddingObjectsFromArray:", v15);
    v22 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v22;
    v32 = v20;
  }
  else
  {
    v32 = v16;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc_init((Class)getAVTAvatarRecordImageProviderClass());
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v25 = v15;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v36;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v36 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend((id)objc_opt_class(), "providerItemForAvatarRecord:imageProvider:renderingQueue:callbackQueue:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v29), v24, v34, v11);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setDelegate:", v12);
        objc_msgSend(v23, "addObject:", v30);

        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v27);
  }

  return v23;
}

- (BOOL)canCreateMemoji
{
  void *v2;
  char v3;

  -[CNPhotoPickerAnimojiProvider avatarStore](self, "avatarStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canCreateAvatar");

  return v3;
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->identifier, a3);
}

- (AVTAvatarStore)avatarStore
{
  return self->_avatarStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

+ (id)providerItemForAvatarRecord:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc_init((Class)getAVTAvatarRecordImageProviderClass());
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultSchedulerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newSerialSchedulerWithName:", CFSTR("com.apple.ContactsUI.PhotoPickerAnimojiProvider.renderingQueue"));
  objc_msgSend(v7, "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "providerItemForAvatarRecord:imageProvider:renderingQueue:callbackQueue:", v4, v5, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)providerItemForAvatarRecord:(id)a3 imageProvider:(id)a4 renderingQueue:(id)a5 callbackQueue:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  CNPhotoPickerAnimojiProviderItem *v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v13 = (void *)getAVTRenderingScopeClass_softClass;
  v22 = getAVTRenderingScopeClass_softClass;
  if (!getAVTRenderingScopeClass_softClass)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __getAVTRenderingScopeClass_block_invoke;
    v18[3] = &unk_1E204EBC0;
    v18[4] = &v19;
    __getAVTRenderingScopeClass_block_invoke((uint64_t)v18);
    v13 = (void *)v20[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v19, 8);
  objc_msgSend(v14, "gridThumbnailScope");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CNPhotoPickerAnimojiProviderItem initWithAvatarRecord:imageProvider:renderingScope:renderingQueue:callbackQueue:]([CNPhotoPickerAnimojiProviderItem alloc], "initWithAvatarRecord:imageProvider:renderingScope:renderingQueue:callbackQueue:", v9, v10, v15, v11, v12);

  return v16;
}

@end
