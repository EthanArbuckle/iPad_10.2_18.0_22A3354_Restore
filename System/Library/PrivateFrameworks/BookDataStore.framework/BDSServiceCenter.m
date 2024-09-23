@implementation BDSServiceCenter

+ (void)addStoreID:(id)a3 toCollectionID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  BCMutableStoreItem *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  const char *v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [BCMutableStoreItem alloc];
  v15 = (void *)objc_msgSend_initWithStoreID_(v11, v12, (uint64_t)v8, v13, v14);
  objc_msgSend_sharedManager(BCCloudAssetManager, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_storeAssetManager(v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = sub_227D8FD70;
  v31[3] = &unk_24F08A320;
  v34 = v10;
  v35 = a1;
  v32 = v8;
  v33 = v9;
  v26 = v9;
  v27 = v10;
  v28 = v8;
  objc_msgSend_addStoreItem_completion_(v25, v29, (uint64_t)v15, (uint64_t)v31, v30);

}

+ (void)fetchIsAssetID:(id)a3 inCollectionID:(id)a4 completion:(id)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;

  v7 = a5;
  objc_msgSend_collectionMemberIDWithCollectionID_assetID_(BCCollectionMember, v8, (uint64_t)a4, (uint64_t)a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedManager(BCCloudCollectionsManager, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_collectionMemberManager(v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_227D900D4;
  v24[3] = &unk_24F08A348;
  v25 = v7;
  v21 = v7;
  objc_msgSend_collectionMemberForCollectionMemberID_completion_(v20, v22, (uint64_t)v10, (uint64_t)v24, v23);

}

+ (void)_nextSortOrderForCollectionMemberManager:(id)a3 collectionID:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    if (v7 && v8)
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_227D90240;
      v13[3] = &unk_24F08A370;
      v14 = v9;
      objc_msgSend_fetchMaxSortOrderInCollectionID_completion_(v7, v11, (uint64_t)v8, (uint64_t)v13, v12);

    }
    else
    {
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    }
  }

}

@end
