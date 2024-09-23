@implementation WFGetLatestPhotoImportAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t);
  void *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE v45[128];
  void *v46;
  uint64_t v47;
  void *v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  objc_msgSend(MEMORY[0x24BE19610], "sharedLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v4, "fetchOptionsWithError:", &v35);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v35;

  if (v5)
  {
    objc_msgSend(v5, "setWantsIncrementalChangeDetails:", 0);
    objc_msgSend(v5, "setFetchLimit:", 1);
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSortDescriptors:", v8);

    v41 = 0;
    v42 = &v41;
    v43 = 0x2050000000;
    v9 = (void *)getPHImportSessionClass_softClass;
    v44 = getPHImportSessionClass_softClass;
    if (!getPHImportSessionClass_softClass)
    {
      v36 = MEMORY[0x24BDAC760];
      v37 = 3221225472;
      v38 = __getPHImportSessionClass_block_invoke;
      v39 = &unk_24F8BB430;
      v40 = &v41;
      __getPHImportSessionClass_block_invoke((uint64_t)&v36);
      v9 = (void *)v42[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v41, 8);
    objc_msgSend(v10, "fetchImportSessionsWithOptions:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(MEMORY[0x24BE19610], "sharedLibrary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v6;
      objc_msgSend(v12, "fetchOptionsWithError:", &v34);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v34;

      if (v13)
      {
        objc_msgSend(v13, "setWantsIncrementalChangeDetails:", 0);
        objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v14;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setSortDescriptors:", v15);

        objc_msgSend(v11, "firstObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0;
        v42 = &v41;
        v43 = 0x2050000000;
        v16 = (void *)getPHAssetClass_softClass_24372;
        v44 = getPHAssetClass_softClass_24372;
        if (!getPHAssetClass_softClass_24372)
        {
          v36 = MEMORY[0x24BDAC760];
          v37 = 3221225472;
          v38 = __getPHAssetClass_block_invoke_24373;
          v39 = &unk_24F8BB430;
          v40 = &v41;
          __getPHAssetClass_block_invoke_24373((uint64_t)&v36);
          v16 = (void *)v42[3];
        }
        v17 = objc_retainAutorelease(v16);
        _Block_object_dispose(&v41, 8);
        objc_msgSend(v17, "fetchAssetsInAssetCollection:options:", v27, v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v31;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v31 != v20)
                objc_enumerationMutation(v18);
              v22 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v21);
              -[WFGetLatestPhotoImportAction output](self, "output");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "addObject:", v22);

              ++v21;
            }
            while (v19 != v21);
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
          }
          while (v19);
        }
        -[WFGetLatestPhotoImportAction finishRunningWithError:](self, "finishRunningWithError:", 0);

      }
      else
      {
        -[WFGetLatestPhotoImportAction finishRunningWithError:](self, "finishRunningWithError:", v28);
        v13 = 0;
      }
      v6 = v28;
    }
    else
    {
      v24 = (void *)MEMORY[0x24BDD1540];
      v47 = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("Shortcuts couldn’t find any imports in your photo library."));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 260, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGetLatestPhotoImportAction finishRunningWithError:](self, "finishRunningWithError:", v26);

    }
  }
  else
  {
    -[WFGetLatestPhotoImportAction finishRunningWithError:](self, "finishRunningWithError:", v6);
  }

}

@end
