@implementation GKAppLevelSignInVisibility

+ (void)fetchConfigsWithHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BE3A178], "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "utilityService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE3A0A8];
  v11[0] = *MEMORY[0x24BE3A0F8];
  v11[1] = v6;
  v11[2] = *MEMORY[0x24BE3A0A0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__GKAppLevelSignInVisibility_fetchConfigsWithHandler___block_invoke;
  v9[3] = &unk_24DC27A58;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v5, "getStoreBagValuesForKeys:handler:", v7, v9);

}

void __54__GKAppLevelSignInVisibility_fetchConfigsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = a2;
  if (!v3)
    v3 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  v12 = v3;
  v4 = objc_alloc_init(MEMORY[0x24BE3A290]);
  v5 = objc_alloc_init(MEMORY[0x24BE3A290]);
  v6 = objc_msgSend(v12, "integerValueFromKey:defaultValue:", *MEMORY[0x24BE3A0A8], 1);
  objc_msgSend(v5, "sheetConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLimit:", v6);

  v8 = objc_msgSend(v12, "integerValueFromKey:defaultValue:", *MEMORY[0x24BE3A0A0], 1);
  objc_msgSend(v5, "bannerConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLimit:", v8);

  v10 = objc_msgSend(v12, "integerValueFromKey:defaultValue:", *MEMORY[0x24BE3A0F8], 1);
  objc_msgSend(v4, "sheetConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLimit:", v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)fetchAppLevelVisibilityConstraintsWithHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke;
  v6[3] = &unk_24DC27B48;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "fetchConfigsWithHandler:", v6);

}

void __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD v25[3];
  char v26;
  _QWORD v27[3];
  char v28;
  _QWORD v29[3];
  char v30;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x24BE3A188];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKAppLevelSignInVisibility.m", 73, "+[GKAppLevelSignInVisibility fetchAppLevelVisibilityConstraintsWithHandler:]_block_invoke");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dispatchGroupWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v10 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke_2;
  v21[3] = &unk_24DC27AA8;
  v11 = v6;
  v22 = v11;
  v23 = v29;
  v24 = v27;
  objc_msgSend(v9, "perform:", v21);
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke_4;
  v18[3] = &unk_24DC27AF8;
  v12 = v5;
  v19 = v12;
  v20 = v25;
  objc_msgSend(v9, "perform:", v18);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke_6;
  v13[3] = &unk_24DC27B20;
  v15 = v29;
  v16 = v27;
  v17 = v25;
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v9, "notifyOnMainQueueWithBlock:", v13);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);

}

void __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE3A298], "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke_3;
  v7[3] = &unk_24DC27A80;
  v9 = *(_OWORD *)(a1 + 40);
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "promptsDisabledWithConfig:scope:handler:", v5, 2, v7);

}

uint64_t __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke_3(_QWORD *a1, char a2, char a3)
{
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

void __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE3A298], "sharedWithoutPersistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke_5;
  v8[3] = &unk_24DC27AD0;
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v7 = v3;
  objc_msgSend(v4, "loginDisabledWithConfig:scope:handler:", v6, 3, v8);

}

uint64_t __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke_5(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__GKAppLevelSignInVisibility_fetchAppLevelVisibilityConstraintsWithHandler___block_invoke_6(_QWORD *a1)
{
  GKAppLevelSignInVisibilityData *v2;

  v2 = objc_alloc_init(GKAppLevelSignInVisibilityData);
  -[GKAppLevelSignInVisibilityData setAppLevelFullscreenDisabled:](v2, "setAppLevelFullscreenDisabled:", *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24));
  -[GKAppLevelSignInVisibilityData setAppLevelBannerDisabled:](v2, "setAppLevelBannerDisabled:", *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24));
  -[GKAppLevelSignInVisibilityData setProcessLevelPromptDisabled:](v2, "setProcessLevelPromptDisabled:", *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24));
  (*(void (**)(void))(a1[4] + 16))();

}

+ (void)didShowBanner
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BE3A298], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didShowBanner");

  objc_msgSend(MEMORY[0x24BE3A298], "sharedWithoutPersistence");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didShowFullscreen");

}

+ (void)didShowFullscreen
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BE3A298], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didShowFullscreen");

  objc_msgSend(MEMORY[0x24BE3A298], "sharedWithoutPersistence");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didShowFullscreen");

}

@end
