@implementation WFRemovePhotoFromAlbumAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFRemovePhotoFromAlbumAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFRemoveAlbumSelectedGroup"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFPHAssetCollectionMatchingDescriptor(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE19610], "sharedLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v7, "fetchOptionsWithError:", &v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v19;

    if (v8)
    {
      objc_msgSend(v8, "setWantsIncrementalChangeDetails:", 0);
      objc_msgSend(getPHAssetClass(), "fetchAssetsInAssetCollection:options:", v6, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __59__WFRemovePhotoFromAlbumAction_runAsynchronouslyWithInput___block_invoke;
      v16[3] = &unk_24F8B1AA8;
      v16[4] = self;
      v17 = v6;
      v18 = v10;
      v11 = v10;
      objc_msgSend(v4, "getObjectRepresentations:forClass:", v16, getPHAssetClass());

    }
    else
    {
      -[WFRemovePhotoFromAlbumAction finishRunningWithError:](self, "finishRunningWithError:", v9);
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BEC4270];
    v20[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("Unknown Album"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    v20[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("The photo album that was selected does not exist."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 5, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRemovePhotoFromAlbumAction finishRunningWithError:](self, "finishRunningWithError:", v15);

  }
}

void __59__WFRemovePhotoFromAlbumAction_runAsynchronouslyWithInput___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[6];
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    objc_msgSend(a1[4], "finishRunningWithError:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE19610], "sharedLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v10, "systemPhotoLibraryWithError:", &v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v22;

    if (v11)
    {
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x3032000000;
      v20[3] = __Block_byref_object_copy__9498;
      v20[4] = __Block_byref_object_dispose__9499;
      v13 = MEMORY[0x24BDAC760];
      v21 = 0;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __59__WFRemovePhotoFromAlbumAction_runAsynchronouslyWithInput___block_invoke_122;
      v15[3] = &unk_24F8B64A8;
      v16 = a1[5];
      v19 = v20;
      v17 = v7;
      v18 = a1[6];
      v14[0] = v13;
      v14[1] = 3221225472;
      v14[2] = __59__WFRemovePhotoFromAlbumAction_runAsynchronouslyWithInput___block_invoke_3;
      v14[3] = &unk_24F8BA040;
      v14[4] = a1[4];
      v14[5] = v20;
      objc_msgSend(v11, "performChanges:completionHandler:", v15, v14);

      _Block_object_dispose(v20, 8);
    }
    else
    {
      objc_msgSend(a1[4], "finishRunningWithError:", v12);
    }

  }
}

void __59__WFRemovePhotoFromAlbumAction_runAsynchronouslyWithInput___block_invoke_122(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v2 = objc_msgSend(*(id *)(a1 + 32), "canPerformEditOperation:", 2);
  v3 = MEMORY[0x24BDAC760];
  if (v2)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v4 = (void *)getPHAssetCollectionChangeRequestClass_softClass;
    v20 = getPHAssetCollectionChangeRequestClass_softClass;
    if (!getPHAssetCollectionChangeRequestClass_softClass)
    {
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __getPHAssetCollectionChangeRequestClass_block_invoke;
      v16[3] = &unk_24F8BB430;
      v16[4] = &v17;
      __getPHAssetCollectionChangeRequestClass_block_invoke((uint64_t)v16);
      v4 = (void *)v18[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v17, 8);
    objc_msgSend(v5, "changeRequestForAssetCollection:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v11 = v3;
  v12 = 3221225472;
  v13 = __59__WFRemovePhotoFromAlbumAction_runAsynchronouslyWithInput___block_invoke_2;
  v14 = &unk_24F8B1A80;
  v7 = *(void **)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  objc_msgSend(v7, "if_objectsPassingTest:", &v11);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(v6, "removeAssets:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v11, v12, v13, v14);
}

void __59__WFRemovePhotoFromAlbumAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_msgSend(*(id *)(a1 + 32), "output", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v4);
}

uint64_t __59__WFRemovePhotoFromAlbumAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

@end
