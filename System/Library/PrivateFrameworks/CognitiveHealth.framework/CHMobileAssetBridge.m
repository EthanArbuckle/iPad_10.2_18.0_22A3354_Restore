@implementation CHMobileAssetBridge

- (void)autoAssetAvailableForUseForAssetType:(id)a3 assetSpecifier:(id)a4 completion:(id)a5
{
  void (**v7)(id, _QWORD, void *);
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void (**v14)(id, _QWORD, void *);
  _QWORD v15[4];
  id v16;
  id v17;

  v7 = (void (**)(id, _QWORD, void *))a5;
  v8 = a4;
  v9 = a3;
  NSLog(CFSTR("Attempting to get auto asset status. Asset Type: %@, Asset Specifier: %@"), v9, v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BD0]), "initForAssetType:withAssetSpecifier:", v9, v8);

  v17 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB8]), "initForClientName:selectingAsset:error:", CFSTR("CognitiveHealth"), v10, &v17);
  v12 = v17;
  v13 = v12;
  if (v12)
  {
    NSLog(CFSTR("Errror creating auto asset instance %@"), v12);
    v7[2](v7, 0, v13);
  }
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __86__CHMobileAssetBridge_autoAssetAvailableForUseForAssetType_assetSpecifier_completion___block_invoke;
  v15[3] = &unk_2509FEA80;
  v16 = v7;
  v14 = v7;
  objc_msgSend(v11, "currentStatus:", v15);

}

- (void)autoAssetInterestInContentForAssetType:(id)a3 assetSpecifier:(id)a4 completion:(id)a5
{
  void (**v7)(id, void *);
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(id, void *);
  id v16;

  v7 = (void (**)(id, void *))a5;
  v8 = a4;
  v9 = a3;
  NSLog(CFSTR("Interest in content. Asset Type: %@, Asset Specifier: %@"), v9, v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BD0]), "initForAssetType:withAssetSpecifier:", v9, v8);

  v16 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB8]), "initForClientName:selectingAsset:error:", CFSTR("CognitiveHealth"), v10, &v16);
  v12 = v16;
  v13 = v12;
  if (v12)
  {
    NSLog(CFSTR("Error creating auto asset instance %@"), v12);
    v7[2](v7, v13);
  }
  else
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __88__CHMobileAssetBridge_autoAssetInterestInContentForAssetType_assetSpecifier_completion___block_invoke;
    v14[3] = &unk_2509FEAA8;
    v15 = v7;
    objc_msgSend(v11, "interestInContent:completion:", CFSTR("Download Custom Categories file"), v14);

  }
}

- (void)autoAssetLockContentForAssetType:(id)a3 assetSpecifier:(id)a4 lockReason:(id)a5 completion:(id)a6
{
  id v9;
  void (**v10)(id, _QWORD, void *, void *);
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  void (**v19)(id, _QWORD, void *, void *);
  id v20;

  v9 = a5;
  v10 = (void (**)(id, _QWORD, void *, void *))a6;
  v11 = a4;
  v12 = a3;
  NSLog(CFSTR("Attempting locking content with reason %@. Asset type: %@, Asset Specifier: %@"), v9, v12, v11);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BD0]), "initForAssetType:withAssetSpecifier:", v12, v11);

  v20 = 0;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB8]), "initForClientName:selectingAsset:error:", CFSTR("CognitiveHealth"), v13, &v20);
  v15 = v20;
  if (v15)
  {
    v16 = v15;
    NSLog(CFSTR("Error creating auto asset instance %@"), v15);
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v17, v16);
  }
  else
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __93__CHMobileAssetBridge_autoAssetLockContentForAssetType_assetSpecifier_lockReason_completion___block_invoke;
    v18[3] = &unk_2509FEAD0;
    v19 = v10;
    objc_msgSend(v14, "lockContent:withTimeout:completion:", v9, -2, v18);
    v17 = 0;
    v16 = v19;
  }

}

- (void)autoAssetEndLockContentForAssetType:(id)a3 assetSpecifier:(id)a4 endLockReason:(id)a5 completion:(id)a6
{
  id v9;
  void (**v10)(id, void *);
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  void (**v18)(id, void *);
  id v19;

  v9 = a5;
  v10 = (void (**)(id, void *))a6;
  v11 = a4;
  v12 = a3;
  NSLog(CFSTR("Attempting ending lock content with reason %@. Asset type: %@, Asset Specifier: %@"), v9, v12, v11);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BD0]), "initForAssetType:withAssetSpecifier:", v12, v11);

  v19 = 0;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB8]), "initForClientName:selectingAsset:error:", CFSTR("CognitiveHealth"), v13, &v19);
  v15 = v19;
  v16 = v15;
  if (v15)
  {
    NSLog(CFSTR("Error creating auto asset instance %@"), v15);
    v10[2](v10, v16);
  }
  else
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __99__CHMobileAssetBridge_autoAssetEndLockContentForAssetType_assetSpecifier_endLockReason_completion___block_invoke;
    v17[3] = &unk_2509FEAA8;
    v18 = v10;
    objc_msgSend(v14, "endLockUsage:completion:", v9, v17);

  }
}

- (void)autoAssetEndAllLocksForAssetType:(id)a3 assetSpecifier:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  NSLog(CFSTR("Attempting ending all locks. Asset type: %@, Asset Specifier: %@"), v9, v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BD0]), "initForAssetType:withAssetSpecifier:", v9, v8);

  v11 = (void *)MEMORY[0x24BE66BB8];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82__CHMobileAssetBridge_autoAssetEndAllLocksForAssetType_assetSpecifier_completion___block_invoke;
  v13[3] = &unk_2509FEAA8;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "endAllPreviousLocksOfSelector:forClientName:completion:", v10, CFSTR("CognitiveHealth"), v13);

}

void __82__CHMobileAssetBridge_autoAssetEndAllLocksForAssetType_assetSpecifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a2, "summary");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (a3)
    NSLog(CFSTR("Error ending all locks; Asset selector: %@, Operation Error: %@"), v6, v8);
  else
    NSLog(CFSTR("Success ending all locks; Asset selector: %@"), v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __99__CHMobileAssetBridge_autoAssetEndLockContentForAssetType_assetSpecifier_endLockReason_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a2, "summary");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (a3)
    NSLog(CFSTR("Error unlocking asset; Asset selector: %@, Operation Error: %@"), v6, v8);
  else
    NSLog(CFSTR("Success unlocking asset; Asset selector: %@"), v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __93__CHMobileAssetBridge_autoAssetLockContentForAssetType_assetSpecifier_lockReason_completion___block_invoke(uint64_t a1, void *a2, int a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (a3)
  {
    objc_msgSend(a2, "summary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Auto-asset content locked and ready to use. Asset selector: %@, local content URL: %@"), v15, v11);

    if (v12)
    {
      objc_msgSend(v12, "summary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Content locked but newer version in progress %@"), v16);

    }
    else
    {
      NSLog(CFSTR("Content locked; no newer version download in progress"));
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    objc_msgSend(v19, "contentsOfDirectoryAtPath:error:", v20, &v46);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v46;

    if (v22)
    {
      NSLog(CFSTR("Error getting contents of asset directory %@"), v22);
      v23 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v11, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *, id))(v23 + 16))(v23, v24, v25, v22);
    }
    else
    {
      v39 = a1;
      v40 = v14;
      v41 = v12;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v38 = v21;
      v26 = v21;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v43 != v29)
              objc_enumerationMutation(v26);
            v31 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
            objc_msgSend(v11, "path");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "stringByAppendingPathComponent:", v31);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v33);

            objc_msgSend(v25, "addObject:", v31);
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        }
        while (v28);
      }

      objc_msgSend(v25, "componentsJoinedByString:", CFSTR(", "));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Locked and found asset files %@ in directory %@"), v34, v35);

      v36 = *(_QWORD *)(v39 + 32);
      objc_msgSend(v11, "path");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *, _QWORD))(v36 + 16))(v36, v37, v24, 0);

      v14 = v40;
      v12 = v41;
      v22 = 0;
      v21 = v38;
    }

  }
  else
  {
    NSLog(CFSTR("Auto-asset content lock error %@"), v13);
    v17 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *, void *))(v17 + 16))(v17, 0, v18, v14);

  }
}

void __88__CHMobileAssetBridge_autoAssetInterestInContentForAssetType_assetSpecifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a2, "summary");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (a3)
    NSLog(CFSTR("Error indicating interest in content; assetSelector:%@, error:%@"), v6, v8);
  else
    NSLog(CFSTR("Success locking asset; Asset selector: %@"), v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__CHMobileAssetBridge_autoAssetAvailableForUseForAssetType_assetSpecifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  NSLog(CFSTR("Successfully received auto asset status with error %@"), v5);
  objc_msgSend(v8, "newerVersionError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    NSLog(CFSTR("Error retrieving status %@"), v5);
    objc_msgSend(v8, "newerVersionError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "code");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
