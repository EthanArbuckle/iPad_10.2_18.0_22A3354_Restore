@implementation WFGetLatestPhotosAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  void *v25;
  int v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[5];
  _QWORD v54[2];

  v54[1] = *MEMORY[0x24BDAC8D0];
  -[WFGetLatestPhotosAction definition](self, "definition", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("WFGetLatestPhotosActionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  v7 = (void *)MEMORY[0x24BE195C0];
  WFImagePropertyNameAlbum();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "propertyForName:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BE195C0];
  WFImagePropertyNameMediaType();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "propertyForName:", v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BE195C0];
  WFImagePropertyNamePhotoType();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "propertyForName:", v14);
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BE195C0];
  WFImagePropertyNameDateTaken();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "propertyForName:", v17);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BE195C0];
  WFImagePropertyNameIsScreenshot();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "propertyForName:", v19);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Video")) & 1) != 0)
    WFPhotoLibraryMediaTypeVideo();
  else
    WFPhotoLibraryMediaTypeImage();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)v12;
  objc_msgSend(MEMORY[0x24BE19440], "predicateWithValue:forProperty:comparisonType:", v48, v12, 4);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:");
  objc_msgSend((id)objc_opt_class(), "cameraRollAlbumName");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(MEMORY[0x24BE19440], "predicateWithValue:forProperty:comparisonType:", v20, v9, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v21);

  }
  v51 = (void *)v9;
  v22 = objc_msgSend(v5, "isEqualToString:", CFSTR("Live Photo"), v20);
  v23 = objc_msgSend(v5, "isEqualToString:", CFSTR("Burst"));
  v24 = objc_msgSend(v5, "isEqualToString:", CFSTR("Screenshot"));
  -[WFGetLatestPhotosAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFGetLatestPhotosActionIncludeScreenshots"), objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "BOOLValue");

  v27 = objc_msgSend(v5, "isEqualToString:", CFSTR("Photo"));
  if (v23)
  {
    v28 = (void *)MEMORY[0x24BE19440];
    WFPhotoLibraryPhotoTypeBurst();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v28;
    v31 = v29;
    v32 = (void *)v15;
    v33 = v15;
LABEL_10:
    objc_msgSend(v30, "predicateWithValue:forProperty:comparisonType:", v31, v33, 4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v35);

LABEL_16:
    goto LABEL_17;
  }
  v32 = (void *)v15;
  if (v22)
  {
    v34 = (void *)MEMORY[0x24BE19440];
    WFPhotoLibraryPhotoTypeLivePhoto();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v34;
    v31 = v29;
    v33 = v15;
    goto LABEL_10;
  }
  if (v24)
  {
    v36 = (void *)MEMORY[0x24BE19440];
    v37 = MEMORY[0x24BDBD1C8];
LABEL_15:
    objc_msgSend(v36, "predicateWithValue:forProperty:comparisonType:", v37, v52, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v29);
    goto LABEL_16;
  }
  if (((v27 ^ 1 | v26) & 1) == 0)
  {
    v36 = (void *)MEMORY[0x24BE19440];
    v37 = MEMORY[0x24BDBD1C0];
    goto LABEL_15;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x24BE19448], "andPredicateWithSubpredicates:", v6);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19498]), "initWithPredicate:", v38);
  objc_msgSend(MEMORY[0x24BE194A0], "sortDescriptorWithProperty:ascending:comparator:", v49, 0, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v40;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setSortDescriptors:", v41);

  -[WFGetLatestPhotosAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFGetLatestPhotoCount"), objc_opt_class());
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "integerValue");

  objc_msgSend(v39, "setSlice:", 0x7FFFFFFFFFFFFFFFLL, v43);
  v44 = (void *)MEMORY[0x24BE195C0];
  -[WFGetLatestPhotosAction contentPermissionRequestor](self, "contentPermissionRequestor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __54__WFGetLatestPhotosAction_runAsynchronouslyWithInput___block_invoke;
  v53[3] = &unk_24F8BB6B0;
  v53[4] = self;
  objc_msgSend(v44, "runQuery:withItems:permissionRequestor:completionHandler:", v39, 0, v45, v53);

}

- (int64_t)initialSuggestionBehavior
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int64_t v7;
  objc_super v9;

  -[WFGetLatestPhotosAction definition](self, "definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("WFGetLatestPhotosActionType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Live Photo"))
    && (objc_msgSend(MEMORY[0x24BEC1440], "currentDevice"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "hasCapability:", *MEMORY[0x24BEC1858]),
        v5,
        !v6))
  {
    v7 = 2;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFGetLatestPhotosAction;
    v7 = -[WFGetLatestPhotosAction initialSuggestionBehavior](&v9, sel_initialSuggestionBehavior);
  }

  return v7;
}

void __54__WFGetLatestPhotosAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11);
          objc_msgSend(*(id *)(a1 + 32), "output", (_QWORD)v22);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addItem:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    v14 = *(void **)(a1 + 32);
    v15 = 0;
  }
  else
  {
    v16 = *(void **)(a1 + 32);
    if (!v6)
    {
      v17 = (void *)MEMORY[0x24BDD1540];
      v18 = *MEMORY[0x24BDD0B88];
      v27 = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("Shortcuts couldn’t find the requested items in your photo library."));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 260, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "finishRunningWithError:", v21);

      goto LABEL_13;
    }
    v14 = v16;
    v15 = v6;
  }
  objc_msgSend(v14, "finishRunningWithError:", v15, (_QWORD)v22);
LABEL_13:

}

+ (id)cameraRollAlbumName
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend(MEMORY[0x24BE19610], "sharedLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v2, "fetchOptionsWithError:", &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;

  if (v3)
  {
    objc_msgSend(v3, "setWantsIncrementalChangeDetails:", 0);
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v5 = (void *)getPHAssetCollectionClass_softClass_27338;
    v16 = getPHAssetCollectionClass_softClass_27338;
    if (!getPHAssetCollectionClass_softClass_27338)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __getPHAssetCollectionClass_block_invoke_27339;
      v12[3] = &unk_24F8BB430;
      v12[4] = &v13;
      __getPHAssetCollectionClass_block_invoke_27339((uint64_t)v12);
      v5 = (void *)v14[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v13, 8);
    objc_msgSend(v6, "fetchAssetCollectionsWithType:subtype:options:", 2, 209, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
