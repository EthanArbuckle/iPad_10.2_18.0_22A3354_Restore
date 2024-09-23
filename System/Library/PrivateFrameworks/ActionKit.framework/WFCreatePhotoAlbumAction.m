@implementation WFCreatePhotoAlbumAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v5;
  void *v6;
  WFPHAssetCollectionDescriptor *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  _QWORD *v15;
  SEL v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  id v22[2];

  v5 = a3;
  -[WFCreatePhotoAlbumAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("AlbumName"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFPHAssetCollectionDescriptor initWithLocalIdentifier:localizedTitle:]([WFPHAssetCollectionDescriptor alloc], "initWithLocalIdentifier:localizedTitle:", 0, v6);
  WFPHAssetCollectionMatchingDescriptor(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[WFSaveToCameraRollAction runAsynchronouslyWithAssetCollection:input:](self, "runAsynchronouslyWithAssetCollection:input:", v8, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE19610], "sharedLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = 0;
    objc_msgSend(v9, "systemPhotoLibraryWithError:", v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v22[0];

    if (v10)
    {
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x3032000000;
      v20[3] = __Block_byref_object_copy__41055;
      v20[4] = __Block_byref_object_dispose__41056;
      v21 = 0;
      v12 = MEMORY[0x24BDAC760];
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __55__WFCreatePhotoAlbumAction_runAsynchronouslyWithInput___block_invoke;
      v17[3] = &unk_24F8BB688;
      v18 = v6;
      v19 = v20;
      v13[0] = v12;
      v13[1] = 3221225472;
      v13[2] = __55__WFCreatePhotoAlbumAction_runAsynchronouslyWithInput___block_invoke_2;
      v13[3] = &unk_24F8B8AA0;
      v13[4] = self;
      v15 = v20;
      v16 = a2;
      v14 = v5;
      objc_msgSend(v10, "performChanges:completionHandler:", v17, v13);

      _Block_object_dispose(v20, 8);
    }
    else
    {
      -[WFCreatePhotoAlbumAction finishRunningWithError:](self, "finishRunningWithError:", v11);
    }

  }
}

void __55__WFCreatePhotoAlbumAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v2 = (void *)getPHAssetCollectionChangeRequestClass_softClass_41077;
  v13 = getPHAssetCollectionChangeRequestClass_softClass_41077;
  if (!getPHAssetCollectionChangeRequestClass_softClass_41077)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __getPHAssetCollectionChangeRequestClass_block_invoke_41078;
    v9[3] = &unk_24F8BB430;
    v9[4] = &v10;
    __getPHAssetCollectionChangeRequestClass_block_invoke_41078((uint64_t)v9);
    v2 = (void *)v11[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v10, 8);
  objc_msgSend(v3, "creationRequestForAssetCollectionWithTitle:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeholderForCreatedAssetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __55__WFCreatePhotoAlbumAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE19610], "sharedLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v5;
    objc_msgSend(v6, "fetchOptionsWithError:", &v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v15;

    objc_msgSend(v7, "setWantsIncrementalChangeDetails:", 0);
    if (v7)
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x2050000000;
      v9 = (void *)getPHAssetCollectionClass_softClass_41058;
      v20 = getPHAssetCollectionClass_softClass_41058;
      if (!getPHAssetCollectionClass_softClass_41058)
      {
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __getPHAssetCollectionClass_block_invoke_41059;
        v16[3] = &unk_24F8BB430;
        v16[4] = &v17;
        __getPHAssetCollectionClass_block_invoke_41059((uint64_t)v16);
        v9 = (void *)v18[3];
      }
      v10 = objc_retainAutorelease(v9);
      _Block_object_dispose(&v17, 8);
      v21[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fetchAssetCollectionsWithLocalIdentifiers:options:", v11, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("WFCreatePhotoAlbumAction.m"), 54, CFSTR("Album should exist after being created"));

      }
      objc_msgSend(*(id *)(a1 + 32), "runAsynchronouslyWithAssetCollection:input:", v13, *(_QWORD *)(a1 + 40));

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v8);
    }

    v5 = v8;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v5);
  }

}

@end
