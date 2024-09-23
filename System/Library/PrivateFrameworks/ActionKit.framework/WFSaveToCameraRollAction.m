@implementation WFSaveToCameraRollAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFSaveToCameraRollAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFCameraRollSelectedGroup"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFPHAssetCollectionMatchingDescriptor(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[WFSaveToCameraRollAction runAsynchronouslyWithAssetCollection:input:](self, "runAsynchronouslyWithAssetCollection:input:", v6, v4);
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BEC4270];
    v13[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("Unknown Album"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v13[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("The photo album that was selected does not exist."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 5, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSaveToCameraRollAction finishRunningWithError:](self, "finishRunningWithError:", v12);

  }
}

- (void)runAsynchronouslyWithAssetCollection:(id)a3 input:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[WFSaveToCameraRollAction fetchOptions](self, "fetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(getPHAssetClass_45194(), "fetchAssetsInAssetCollection:options:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  v16[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke;
  v13[3] = &unk_24F8BA500;
  v13[4] = self;
  v14 = v9;
  v15 = v6;
  v11 = v6;
  v12 = v9;
  objc_msgSend(v7, "generateCollectionByCoercingToItemClasses:completionHandler:", v10, v13);

}

- (id)fetchOptions
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v6;

  objc_msgSend(MEMORY[0x24BE19610], "sharedLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v2, "fetchOptionsWithError:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setIncludeAllBurstAssets:", 1);
  if (v3)
    v4 = v3;

  return v3;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE19390], "locationWithSystemAppBundleIdentifier:", *MEMORY[0x24BEC1728]);
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a5;
  v8 = a3;
  WFLocalizedString(CFSTR("Allow “%1$@” to save %2$@ in a photo album?"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v9, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    objc_msgSend(v6, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_2;
    v12[3] = &unk_24F8B9FA0;
    v13 = a1[5];
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_5;
    v10[3] = &unk_24F8BA068;
    v10[4] = a1[4];
    v11 = a1[6];
    objc_msgSend(v8, "if_mapAsynchronously:completionHandler:", v12, v10);

  }
  else
  {
    objc_msgSend(a1[4], "finishRunningWithError:", v7);
  }

}

void __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a2;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8))
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_3;
      v14[3] = &unk_24F8BA110;
      v15 = v7;
      objc_msgSend(v6, "getFileRepresentation:forType:", v14, 0);

    }
    else
    {
      objc_msgSend(v6, "asset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v11, 0);

    }
  }
  else
  {
    objc_msgSend(v6, "preferredFileType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "conformsToUTType:", *MEMORY[0x24BDF8580]);

    if (v10)
    {
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }
    else
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_4;
      v12[3] = &unk_24F8BA110;
      v13 = v7;
      objc_msgSend(v6, "getFileRepresentation:forType:", v12, 0);

    }
  }

}

void __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[6];
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v5 = a2;
  v6 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__45199;
  v17[4] = __Block_byref_object_dispose__45200;
  v18 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE19610], "sharedLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v7, "systemPhotoLibraryWithError:", &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;

  if (v8)
  {
    v10 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_129;
    v12[3] = &unk_24F8B9FF0;
    v13 = *(id *)(a1 + 40);
    v15 = v17;
    v14 = v5;
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_3_134;
    v11[3] = &unk_24F8BA040;
    v11[4] = *(_QWORD *)(a1 + 32);
    v11[5] = v17;
    objc_msgSend(v8, "performChanges:completionHandler:", v12, v11);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v9);
  }

  _Block_object_dispose(v17, 8);
}

void __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_129(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v2 = objc_msgSend(*(id *)(a1 + 32), "canPerformEditOperation:", 3);
  v3 = MEMORY[0x24BDAC760];
  if (v2)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2050000000;
    v4 = (void *)getPHAssetCollectionChangeRequestClass_softClass_45205;
    v18 = getPHAssetCollectionChangeRequestClass_softClass_45205;
    if (!getPHAssetCollectionChangeRequestClass_softClass_45205)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __getPHAssetCollectionChangeRequestClass_block_invoke_45206;
      v14[3] = &unk_24F8BB430;
      v14[4] = &v15;
      __getPHAssetCollectionChangeRequestClass_block_invoke_45206((uint64_t)v14);
      v4 = (void *)v16[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v15, 8);
    objc_msgSend(v5, "changeRequestForAssetCollection:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = *(void **)(a1 + 40);
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_2_130;
  v12[3] = &unk_24F8B9FC8;
  v13 = v6;
  v8 = v6;
  objc_msgSend(v7, "if_compactMap:", v12);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

void __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_3_134(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  objc_msgSend(*(id *)(a1 + 32), "fetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(getPHAssetClass_45194(), "fetchAssetsWithLocalIdentifiers:options:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_4_136;
  v21[3] = &unk_24F8BA018;
  v7 = v6;
  v22 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v21);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        objc_msgSend(*(id *)(a1 + 32), "output");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v16);
}

void __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_4_136(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "localIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

}

id __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_2_130(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  getPHAssetClass_45194();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    v26[0] = v3;
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = v3;
    objc_msgSend(v5, "arrayWithObjects:count:", v26, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAssets:", v7);

    objc_msgSend(v6, "localIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v3;
    objc_msgSend(v6, "wfType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "conformsToUTType:", *MEMORY[0x24BDF82D8]);

    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v11 = (void *)getPHAssetChangeRequestClass_softClass_45209;
    v24 = getPHAssetChangeRequestClass_softClass_45209;
    if (!getPHAssetChangeRequestClass_softClass_45209)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __getPHAssetChangeRequestClass_block_invoke_45210;
      v20[3] = &unk_24F8BB430;
      v20[4] = &v21;
      __getPHAssetChangeRequestClass_block_invoke_45210((uint64_t)v20);
      v11 = (void *)v22[3];
    }
    v12 = v11;
    _Block_object_dispose(&v21, 8);
    v13 = v12;
    objc_msgSend(v6, "fileURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v13, "creationRequestForAssetFromVideoAtFileURL:", v14);
    else
      objc_msgSend(v13, "creationRequestForAssetFromImageAtFileURL:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "placeholderForCreatedAsset");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = *(void **)(a1 + 32);
      v25 = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addAssets:", v18);

    }
    objc_msgSend(v16, "localIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  v8 = 0;
LABEL_14:

  return v8;
}

uint64_t __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__WFSaveToCameraRollAction_runAsynchronouslyWithAssetCollection_input___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
