@implementation WFDeletePhotosIntentHandler

- (void)handleDeletePhotos:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  WFDeletePhotosIntentResponse *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE19610], "sharedLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v7, "systemPhotoLibraryWithError:", &v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v21;

  if (v8)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v10 = (void *)getPHAssetClass_softClass_23232;
    v26 = getPHAssetClass_softClass_23232;
    v11 = MEMORY[0x24BDAC760];
    if (!getPHAssetClass_softClass_23232)
    {
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __getPHAssetClass_block_invoke_23233;
      v22[3] = &unk_24F8BB430;
      v22[4] = &v23;
      __getPHAssetClass_block_invoke_23233((uint64_t)v22);
      v10 = (void *)v24[3];
    }
    v12 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v23, 8);
    objc_msgSend(v5, "assetIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "librarySpecificFetchOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchAssetsWithLocalIdentifiers:options:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __61__WFDeletePhotosIntentHandler_handleDeletePhotos_completion___block_invoke;
    v19[3] = &unk_24F8BB638;
    v20 = v15;
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __61__WFDeletePhotosIntentHandler_handleDeletePhotos_completion___block_invoke_2;
    v17[3] = &unk_24F8B4CD0;
    v18 = v6;
    v16 = v15;
    objc_msgSend(v8, "performChanges:completionHandler:", v19, v17);

  }
  else
  {
    v16 = -[WFDeletePhotosIntentResponse initWithCode:userActivity:]([WFDeletePhotosIntentResponse alloc], "initWithCode:userActivity:", 5, 0);
    (*((void (**)(id, WFDeletePhotosIntentResponse *))v6 + 2))(v6, v16);
  }

}

void __61__WFDeletePhotosIntentHandler_handleDeletePhotos_completion___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v19, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v10;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v10 != v3)
          objc_enumerationMutation(v1);
        v5 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v4);
        v14 = 0;
        v15 = &v14;
        v16 = 0x2050000000;
        v6 = (void *)getPHAssetChangeRequestClass_softClass;
        v17 = getPHAssetChangeRequestClass_softClass;
        if (!getPHAssetChangeRequestClass_softClass)
        {
          v13[0] = MEMORY[0x24BDAC760];
          v13[1] = 3221225472;
          v13[2] = __getPHAssetChangeRequestClass_block_invoke;
          v13[3] = &unk_24F8BB430;
          v13[4] = &v14;
          __getPHAssetChangeRequestClass_block_invoke((uint64_t)v13);
          v6 = (void *)v15[3];
        }
        v7 = objc_retainAutorelease(v6);
        _Block_object_dispose(&v14, 8);
        v18 = v5;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1, (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "deleteAssets:", v8);

        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v19, 16);
    }
    while (v2);
  }

}

void __61__WFDeletePhotosIntentHandler_handleDeletePhotos_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  WFDeletePhotosIntentResponse *v11;
  uint64_t v12;
  WFDeletePhotosIntentResponse *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD0B88]) && objc_msgSend(v4, "code") == -1)
    goto LABEL_9;
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v7 = (_QWORD *)getPHPhotosErrorDomainSymbolLoc_ptr;
  v19 = getPHPhotosErrorDomainSymbolLoc_ptr;
  if (!getPHPhotosErrorDomainSymbolLoc_ptr)
  {
    v8 = PhotosLibrary_23234();
    v7 = dlsym(v8, "PHPhotosErrorDomain");
    v17[3] = (uint64_t)v7;
    getPHPhotosErrorDomainSymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v16, 8);
  if (v7)
  {
    if ((objc_msgSend(v6, "isEqualToString:", *v7) & 1) != 0)
    {
      if (objc_msgSend(v4, "code") == 4101)
      {

LABEL_9:
LABEL_12:
        v10 = *(_QWORD *)(a1 + 32);
        v11 = [WFDeletePhotosIntentResponse alloc];
        v12 = 5;
LABEL_14:
        v13 = -[WFDeletePhotosIntentResponse initWithCode:userActivity:](v11, "initWithCode:userActivity:", v12, 0);
        (*(void (**)(uint64_t, WFDeletePhotosIntentResponse *))(v10 + 16))(v10, v13);

        return;
      }
      v9 = objc_msgSend(v4, "code");

      if (v9 == 3072)
        goto LABEL_12;
    }
    else
    {

    }
    v10 = *(_QWORD *)(a1 + 32);
    v11 = [WFDeletePhotosIntentResponse alloc];
    v12 = 4;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSErrorDomain getPHPhotosErrorDomain(void)");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("WFDeletePhotosIntentHandler.m"), 21, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
