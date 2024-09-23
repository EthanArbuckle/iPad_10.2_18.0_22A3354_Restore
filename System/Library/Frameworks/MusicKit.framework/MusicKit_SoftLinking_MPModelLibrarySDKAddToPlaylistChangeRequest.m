@implementation MusicKit_SoftLinking_MPModelLibrarySDKAddToPlaylistChangeRequest

+ (void)addProductID:(id)a3 playlist:(id)a4 isCloudID:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v7 = a5;
  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v10, "_underlyingModelObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v13 = (void *)getMPModelLibrarySDKAddToPlaylistChangeRequestClass_softClass;
  v22 = getMPModelLibrarySDKAddToPlaylistChangeRequestClass_softClass;
  if (!getMPModelLibrarySDKAddToPlaylistChangeRequestClass_softClass)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __getMPModelLibrarySDKAddToPlaylistChangeRequestClass_block_invoke;
    v18[3] = &unk_24CD1CC68;
    v18[4] = &v19;
    __getMPModelLibrarySDKAddToPlaylistChangeRequestClass_block_invoke((uint64_t)v18);
    v13 = (void *)v20[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v19, 8);
  v15 = (void *)objc_msgSend([v14 alloc], "initWithProductID:isCloudID:playlist:completionHandler:", v9, v7, v12, v11);
  v16 = (void *)objc_msgSend(v15, "newOperationWithResponseHandler:", v11);
  +[MusicKit_SoftLinking_MPMediaLibrary deviceLibrary](MusicKit_SoftLinking_MPMediaLibrary, "deviceLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "performOperation:", v16);

}

@end
