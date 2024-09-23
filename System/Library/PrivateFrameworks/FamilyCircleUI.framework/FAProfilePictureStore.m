@implementation FAProfilePictureStore

- (FAProfilePictureStore)initWithFamilyCircle:(id)a3
{
  id v5;
  FAProfilePictureStore *v6;
  FAProfilePictureStore *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *serialQueue;
  uint64_t v10;
  NSMutableDictionary *profileImages;
  uint64_t v12;
  NSMutableDictionary *recommendedMembersImages;
  CNContactStore *v14;
  CNContactStore *contactStore;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSArray *keysToFetch;
  NSArray *v27;
  void *v28;
  uint64_t v29;
  NSArray *v30;
  void *v31;
  void *v32;
  objc_super v34;
  _QWORD v35[20];

  v35[19] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)FAProfilePictureStore;
  v6 = -[FAProfilePictureStore init](&v34, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_familyCircle, a3);
    v8 = dispatch_queue_create("AAUIProfilePictureStorefetchProfileImagesForFamilyCircle", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    profileImages = v7->_profileImages;
    v7->_profileImages = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    recommendedMembersImages = v7->_recommendedMembersImages;
    v7->_recommendedMembersImages = (NSMutableDictionary *)v12;

    v14 = (CNContactStore *)objc_alloc_init(MEMORY[0x24BDBACF8]);
    contactStore = v7->_contactStore;
    v7->_contactStore = v14;

    v16 = *MEMORY[0x24BDBA2C8];
    v35[0] = *MEMORY[0x24BDBA318];
    v35[1] = v16;
    v17 = *MEMORY[0x24BDBA2C0];
    v35[2] = *MEMORY[0x24BDBA310];
    v35[3] = v17;
    v18 = *MEMORY[0x24BDBA320];
    v35[4] = *MEMORY[0x24BDBA380];
    v35[5] = v18;
    v19 = *MEMORY[0x24BDBA340];
    v35[6] = *MEMORY[0x24BDBA328];
    v35[7] = v19;
    v20 = *MEMORY[0x24BDBA300];
    v35[8] = *MEMORY[0x24BDBA280];
    v35[9] = v20;
    v21 = *MEMORY[0x24BDBA368];
    v35[10] = *MEMORY[0x24BDBA360];
    v35[11] = v21;
    v22 = *MEMORY[0x24BDBA370];
    v35[12] = *MEMORY[0x24BDBA358];
    v35[13] = v22;
    v23 = *MEMORY[0x24BDBA348];
    v35[14] = *MEMORY[0x24BDBA3F0];
    v35[15] = v23;
    v24 = *MEMORY[0x24BDBA3E8];
    v35[16] = *MEMORY[0x24BDBA288];
    v35[17] = v24;
    v35[18] = *MEMORY[0x24BDBA2E0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 19);
    v25 = objc_claimAutoreleasedReturnValue();
    keysToFetch = v7->_keysToFetch;
    v7->_keysToFetch = (NSArray *)v25;

    v27 = v7->_keysToFetch;
    objc_msgSend(MEMORY[0x24BDBACC0], "descriptorForRequiredKeysForStyle:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray arrayByAddingObject:](v27, "arrayByAddingObject:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v7->_keysToFetch;
    v7->_keysToFetch = (NSArray *)v29;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", v7, sel__traitCollectionDidChange_, *MEMORY[0x24BEBEB70], 0);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObserver:selector:name:object:", v7, sel__contactsDidChange, *MEMORY[0x24BDBA3D0], 0);

  return v7;
}

- (void)setFamilyCircle:(id)a3
{
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];

  objc_storeStrong((id *)&self->_familyCircle, a3);
  v6 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__FAProfilePictureStore_setFamilyCircle___block_invoke;
  block[3] = &unk_24C88B7F0;
  block[4] = self;
  dispatch_sync(serialQueue, block);

}

void __41__FAProfilePictureStore_setFamilyCircle___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

- (FAFamilyCircle)familyCircle
{
  return self->_familyCircle;
}

- (NSDictionary)profileImages
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__FAProfilePictureStore_profileImages__block_invoke;
  v5[3] = &unk_24C88D1F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __38__FAProfilePictureStore_profileImages__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)profilePictureForFamilyMember:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAProfilePictureStore profileImages](self, "profileImages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[FAProfilePictureStore profilePictureForContact:serverImageData:firstName:lastName:diameter:](FAProfilePictureStore, "profilePictureForContact:serverImageData:firstName:lastName:diameter:", v5, v7, v8, v9, 80.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)profilePictureForContact:(id)a3 serverImageData:(id)a4 firstName:(id)a5 lastName:(id)a6 diameter:(double)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  id v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  void *v27;
  void *v29;
  double v30;
  void *v31;
  double v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void *)MEMORY[0x212BB90F4]();
  objc_msgSend(v12, "thumbnailImageData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v12, "thumbnailImageData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "screenScale");
    objc_msgSend(v18, "_faCircularImageDataWithDiameter:", v19 * a7);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(a1, "screenScale");
  objc_msgSend(v13, "_faCircularImageDataWithDiameter:cropRect:", v21 * a7, *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length"))
  {
    v20 = v18;
    v18 = v20;
    goto LABEL_9;
  }
  objc_msgSend(v12, "givenName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "length"))
  {

LABEL_8:
    v25 = (void *)MEMORY[0x24BE30AC0];
    objc_msgSend(a1, "screenScale");
    objc_msgSend(v25, "monogramForContact:diameter:scale:", v12, a7, v26);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v12, "familyName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (v24)
    goto LABEL_8;
  if (objc_msgSend(v14, "length") || objc_msgSend(v15, "length"))
  {
    v29 = (void *)MEMORY[0x24BE30AC0];
    objc_msgSend(a1, "screenScale");
    objc_msgSend(v29, "monogramWithFirstName:lastName:diameter:scale:", v14, v15, a7, v30);
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = (void *)MEMORY[0x24BE30AC0];
    objc_msgSend(a1, "screenScale");
    objc_msgSend(v31, "silhouetteMonogramWithDiameter:scale:", a7, v32);
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:
  v27 = v20;

  objc_autoreleasePoolPop(v16);
  return v27;
}

+ (id)_dataForImage:(id)a3
{
  return UIImagePNGRepresentation((UIImage *)a3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FAProfilePictureStore;
  -[FAProfilePictureStore dealloc](&v4, sel_dealloc);
}

+ (double)screenScale
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  return v4;
}

- (void)_fetchProfileImages:(BOOL)a3 withCompletion:(id)a4
{
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  id v17;
  _QWORD block[5];
  id v19;
  _QWORD *v20;
  _QWORD v21[6];
  NSObject *v22;
  _QWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v17 = a4;
  -[FAProfilePictureStore profileImages](self, "profileImages");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 || !objc_msgSend(v16, "count"))
  {
    v6 = dispatch_group_create();
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__4;
    v28[4] = __Block_byref_object_dispose__4;
    v29 = 0;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[FAFamilyCircle members](self->_familyCircle, "members");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v25;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
          dispatch_group_enter(v6);
          v12 = objc_alloc(MEMORY[0x24BE30A90]);
          objc_msgSend(v11, "dsid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v12, "initWithFamilyMemberDSID:size:localFallback:", v13, 1, 1);

          objc_msgSend(v14, "setUseMonogramAsLastResort:", 0);
          +[FAProfilePictureStore screenScale](FAProfilePictureStore, "screenScale");
          objc_msgSend(v14, "setMonogramDiameter:", v15 * 80.0);
          v21[0] = MEMORY[0x24BDAC760];
          v21[1] = 3221225472;
          v21[2] = __60__FAProfilePictureStore__fetchProfileImages_withCompletion___block_invoke;
          v21[3] = &unk_24C88D240;
          v21[4] = self;
          v21[5] = v11;
          v23 = v28;
          v22 = v6;
          objc_msgSend(v14, "startRequestWithCompletionHandler:", v21);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v8);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__FAProfilePictureStore__fetchProfileImages_withCompletion___block_invoke_34;
    block[3] = &unk_24C88D268;
    block[4] = self;
    v19 = v17;
    v20 = v28;
    dispatch_group_notify(v6, MEMORY[0x24BDAC9B8], block);

    _Block_object_dispose(v28, 8);
  }
  else
  {
    (*((void (**)(id, void *, _QWORD))v17 + 2))(v17, v16, 0);
  }

}

void __60__FAProfilePictureStore__fetchProfileImages_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  __int128 v14;
  id v15;
  uint64_t v16;

  v6 = a2;
  v7 = a4;
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__FAProfilePictureStore__fetchProfileImages_withCompletion___block_invoke_2;
  block[3] = &unk_24C88D218;
  v13 = v6;
  v14 = *(_OWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 56);
  v15 = v7;
  v16 = v9;
  v10 = v7;
  v11 = v6;
  dispatch_sync(v8, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __60__FAProfilePictureStore__fetchProfileImages_withCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  id *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v2 = a1[4];
  if (v2)
  {
    objc_msgSend(*(id *)(a1[5] + 24), "setObject:forKeyedSubscript:", v2, a1[6]);
  }
  else
  {
    v3 = *(_QWORD *)(a1[8] + 8);
    v6 = *(void **)(v3 + 40);
    v4 = (id *)(v3 + 40);
    v5 = v6;
    if (!v6)
      v5 = (void *)a1[7];
    objc_storeStrong(v4, v5);
    _FALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__FAProfilePictureStore__fetchProfileImages_withCompletion___block_invoke_2_cold_1((uint64_t)a1, v7);

  }
}

void __60__FAProfilePictureStore__fetchProfileImages_withCompletion___block_invoke_34(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", FAProfilePictureStoreDidReloadImagesNotification, *(_QWORD *)(a1 + 32));

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "profileImages");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

- (void)fetchProfileImagesWithCompletion:(id)a3
{
  -[FAProfilePictureStore _fetchProfileImages:withCompletion:](self, "_fetchProfileImages:withCompletion:", 0, a3);
}

- (id)profilePicturesWithDiameter:(double)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  id obj;
  _QWORD block[4];
  id v26;
  uint64_t v27;
  FAProfilePictureStore *v28;
  id v29;
  NSObject *v30;
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = dispatch_group_create();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[FAFamilyCircle members](self->_familyCircle, "members");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDBCE50], "data");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v12);

        dispatch_group_enter(v6);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v9);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[FAFamilyCircle members](self->_familyCircle, "members");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
        -[FAProfilePictureStore profilePictureForFamilyMember:](self, "profilePictureForFamilyMember:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_get_global_queue(33, 0);
        v20 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __53__FAProfilePictureStore_profilePicturesWithDiameter___block_invoke;
        block[3] = &unk_24C88D290;
        v26 = v5;
        v27 = v18;
        v28 = self;
        v29 = v19;
        v31 = a3;
        v30 = v6;
        v21 = v19;
        dispatch_async(v20, block);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v15);
  }

  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v22 = (void *)objc_msgSend(v5, "copy");

  return v22;
}

void __53__FAProfilePictureStore_profilePicturesWithDiameter___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 48), "resizedPictureWithData:diameter:", *(_QWORD *)(a1 + 56), *(double *)(a1 + 72));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

- (id)profilePictureForFamilyMemberWithAltDSID:(id)a3 pictureDiameter:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[FAFamilyCircle members](self->_familyCircle, "members", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "altDSID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v6);

        if ((v14 & 1) != 0)
        {
          -[FAProfilePictureStore profilePictureForFamilyMember:pictureDiameter:](self, "profilePictureForFamilyMember:pictureDiameter:", v12, a4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (id)profilePictureForFamilyMember:(id)a3 pictureDiameter:(double)a4
{
  void *v6;
  void *v7;

  -[FAProfilePictureStore profilePictureForFamilyMember:](self, "profilePictureForFamilyMember:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAProfilePictureStore resizedPictureWithData:diameter:](self, "resizedPictureWithData:diameter:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)fetchProfilePicturesForRecommendedFamilyMembers:(id)a3
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *recommendedMembersImages;
  void *v16;
  __int128 v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v20;
    *(_QWORD *)&v5 = 138412290;
    v17 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[FAProfilePictureStore contactFor:](self, "contactFor:", v9, v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "givenName");
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "familyName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[FAProfilePictureStore profilePictureForContact:serverImageData:firstName:lastName:diameter:](FAProfilePictureStore, "profilePictureForContact:serverImageData:firstName:lastName:diameter:", v10, 0, v12, v13, 40.0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          recommendedMembersImages = self->_recommendedMembersImages;
          objc_msgSend(v10, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](recommendedMembersImages, "setObject:forKeyedSubscript:", v14, v16);

        }
        else
        {
          _FALogSystem();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v24 = v9;
            _os_log_error_impl(&dword_20DE41000, v12, OS_LOG_TYPE_ERROR, "contact.identifier was nil. Skipping fetching profile image for recommended family member: %@", buf, 0xCu);
          }
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v6);
  }

}

- (id)profilePictureForRecommendedFamilyMember:(id)a3
{
  id v4;
  NSMutableDictionary *recommendedMembersImages;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  recommendedMembersImages = self->_recommendedMembersImages;
  objc_msgSend(v4, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](recommendedMembersImages, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v15[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAProfilePictureStore fetchProfilePicturesForRecommendedFamilyMembers:](self, "fetchProfilePicturesForRecommendedFamilyMembers:", v9);

  }
  v10 = self->_recommendedMembersImages;
  objc_msgSend(v4, "contact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)contactFor:(id)a3
{
  CNContactStore *contactStore;
  void *v5;
  void *v6;
  void *v7;

  contactStore = self->_contactStore;
  objc_msgSend(a3, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactStore unifiedContactWithIdentifier:keysToFetch:error:](contactStore, "unifiedContactWithIdentifier:keysToFetch:error:", v6, self->_keysToFetch, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)resizedPictureWithData:(id)a3 diameter:(double)a4
{
  id v5;
  double v6;
  void *v7;

  v5 = a3;
  +[FAProfilePictureStore screenScale](FAProfilePictureStore, "screenScale");
  objc_msgSend(v5, "_faCircularImageDataWithDiameter:", v6 * a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)recommendedMembersImages
{
  return &self->_recommendedMembersImages->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysToFetch, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_recommendedMembersImages, 0);
  objc_storeStrong((id *)&self->_profileImages, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_familyCircle, 0);
}

- (void)notifyObservable
{
  FAProfilePictureStore *v2;

  v2 = self;
  FAProfilePictureStore.notifyObservable()();

}

void __60__FAProfilePictureStore__fetchProfileImages_withCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = 138412546;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_20DE41000, a2, OS_LOG_TYPE_ERROR, "Unable to get image data for member: %@ error: %@", (uint8_t *)&v4, 0x16u);
}

@end
