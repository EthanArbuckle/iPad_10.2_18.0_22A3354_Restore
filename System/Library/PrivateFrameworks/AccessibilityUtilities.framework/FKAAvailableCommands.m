@implementation FKAAvailableCommands

+ (FKAAvailableCommands)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__FKAAvailableCommands_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (FKAAvailableCommands *)(id)sharedInstance_SharedInstance_0;
}

void __38__FKAAvailableCommands_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_SharedInstance_0;
  sharedInstance_SharedInstance_0 = v0;

}

- (FKAAvailableCommands)init
{
  FKAAvailableCommands *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSString *siriShortcutsDidChangeObserverToken;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  id forceTouchEnabledDidChangeObserverToken;
  NSArray *cachedSiriShortcutsCommands;
  dispatch_queue_t v17;
  OS_dispatch_queue *siriShortcutsQueue;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD aBlock[4];
  id v27;
  id location;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)FKAAvailableCommands;
  v2 = -[FKAAvailableCommands init](&v29, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __28__FKAAvailableCommands_init__block_invoke;
    aBlock[3] = &unk_1E24C58C0;
    objc_copyWeak(&v27, &location);
    v4 = _Block_copy(aBlock);
    +[AXSiriShortcutsManager sharedManager](AXSiriShortcutsManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v3;
    v24[1] = 3221225472;
    v24[2] = __28__FKAAvailableCommands_init__block_invoke_2;
    v24[3] = &unk_1E24C6E18;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v5, "registerShortcutsDidChangeBlock:", v24);
    v6 = objc_claimAutoreleasedReturnValue();
    siriShortcutsDidChangeObserverToken = v2->_siriShortcutsDidChangeObserverToken;
    v2->_siriShortcutsDidChangeObserverToken = (NSString *)v6;

    +[AXSettings sharedInstance](AXSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v3;
    v22[1] = 3221225472;
    v22[2] = __28__FKAAvailableCommands_init__block_invoke_3;
    v22[3] = &unk_1E24C5408;
    v9 = v4;
    v23 = v9;
    objc_msgSend(v8, "registerUpdateBlock:forRetrieveSelector:withListener:", v22, sel_fullKeyboardAccessCommandMapData, v2);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0DDE0A8];
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v3;
    v20[1] = 3221225472;
    v20[2] = __28__FKAAvailableCommands_init__block_invoke_4;
    v20[3] = &unk_1E24C6E40;
    v13 = v9;
    v21 = v13;
    objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", v11, 0, v12, v20);
    v14 = objc_claimAutoreleasedReturnValue();
    forceTouchEnabledDidChangeObserverToken = v2->_forceTouchEnabledDidChangeObserverToken;
    v2->_forceTouchEnabledDidChangeObserverToken = (id)v14;

    cachedSiriShortcutsCommands = v2->_cachedSiriShortcutsCommands;
    v2->_cachedSiriShortcutsCommands = (NSArray *)MEMORY[0x1E0C9AA60];

    v17 = dispatch_queue_create("com.apple.Accessibility.FKAAvailableCommands.SiriShortcuts", 0);
    siriShortcutsQueue = v2->_siriShortcutsQueue;
    v2->_siriShortcutsQueue = (OS_dispatch_queue *)v17;

    -[FKAAvailableCommands _updateCachedSiriShortcutsCommands](v2, "_updateCachedSiriShortcutsCommands");
    objc_destroyWeak(&v25);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __28__FKAAvailableCommands_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(WeakRetained, "tokensToUpdateBlocks", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        objc_msgSend(WeakRetained, "tokensToUpdateBlocks");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v7);
        v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id))v9)[2](v9, WeakRetained);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __28__FKAAvailableCommands_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateCachedSiriShortcutsCommands");

}

uint64_t __28__FKAAvailableCommands_init__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __28__FKAAvailableCommands_init__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[AXSiriShortcutsManager sharedManager](AXSiriShortcutsManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterShortcutsDidChangeBlock:", self->_siriShortcutsDidChangeObserverToken);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self->_forceTouchEnabledDidChangeObserverToken);

  v5.receiver = self;
  v5.super_class = (Class)FKAAvailableCommands;
  -[FKAAvailableCommands dealloc](&v5, sel_dealloc);
}

- (id)_siriShortcutCommands
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[AXSiriShortcutsManager sharedManager](AXSiriShortcutsManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortcuts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "identifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[FKASiriShortcutKeyboardCommand commandWithSiriShortcutIdentifier:](FKASiriShortcutKeyboardCommand, "commandWithSiriShortcutIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_updateCachedSiriShortcutsCommands
{
  NSObject *v3;
  _QWORD block[5];

  -[FKAAvailableCommands siriShortcutsQueue](self, "siriShortcutsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__FKAAvailableCommands__updateCachedSiriShortcutsCommands__block_invoke;
  block[3] = &unk_1E24C4C38;
  block[4] = self;
  dispatch_async(v3, block);

}

void __58__FKAAvailableCommands__updateCachedSiriShortcutsCommands__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_siriShortcutCommands");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v2;
  AXPerformBlockOnMainThread();

}

void __58__FKAAvailableCommands__updateCachedSiriShortcutsCommands__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD);
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setCachedSiriShortcutsCommands:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "tokensToUpdateBlocks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6));
        v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v7[2](v7, *(_QWORD *)(a1 + 32));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (NSSet)commands
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _QWORD v45[39];

  v45[38] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v4 = *MEMORY[0x1E0CF4788];
  v45[0] = *MEMORY[0x1E0CF4778];
  v45[1] = v4;
  v5 = *MEMORY[0x1E0CF47A8];
  v45[2] = *MEMORY[0x1E0CF47A0];
  v45[3] = v5;
  v6 = *MEMORY[0x1E0CF47B8];
  v45[4] = *MEMORY[0x1E0CF47B0];
  v45[5] = v6;
  v7 = *MEMORY[0x1E0CF47C8];
  v45[6] = *MEMORY[0x1E0CF47C0];
  v45[7] = v7;
  v8 = *MEMORY[0x1E0CF47E0];
  v45[8] = *MEMORY[0x1E0CF47D0];
  v45[9] = v8;
  v9 = *MEMORY[0x1E0CF4800];
  v45[10] = *MEMORY[0x1E0CF47F8];
  v45[11] = v9;
  v10 = *MEMORY[0x1E0CF47E8];
  v45[12] = *MEMORY[0x1E0CF4808];
  v45[13] = v10;
  v11 = *MEMORY[0x1E0CF4810];
  v45[14] = *MEMORY[0x1E0CF47F0];
  v45[15] = v11;
  v12 = *MEMORY[0x1E0CF4820];
  v45[16] = *MEMORY[0x1E0CF4818];
  v45[17] = v12;
  v13 = *MEMORY[0x1E0CF4830];
  v45[18] = *MEMORY[0x1E0CF4828];
  v45[19] = v13;
  v14 = *MEMORY[0x1E0CF4840];
  v45[20] = *MEMORY[0x1E0CF4838];
  v45[21] = v14;
  v15 = *MEMORY[0x1E0CF4858];
  v45[22] = *MEMORY[0x1E0CF4848];
  v45[23] = v15;
  v16 = *MEMORY[0x1E0CF4868];
  v45[24] = *MEMORY[0x1E0CF4860];
  v45[25] = v16;
  v17 = *MEMORY[0x1E0CF4878];
  v45[26] = *MEMORY[0x1E0CF4870];
  v45[27] = v17;
  v18 = *MEMORY[0x1E0CF4888];
  v45[28] = *MEMORY[0x1E0CF4880];
  v45[29] = v18;
  v19 = *MEMORY[0x1E0CF48B0];
  v45[30] = *MEMORY[0x1E0CF48A0];
  v45[31] = v19;
  v20 = *MEMORY[0x1E0CF48C8];
  v45[32] = *MEMORY[0x1E0CF48B8];
  v45[33] = v20;
  v21 = *MEMORY[0x1E0CF48D8];
  v45[34] = *MEMORY[0x1E0CF48D0];
  v45[35] = v21;
  v22 = *MEMORY[0x1E0CF48E8];
  v45[36] = *MEMORY[0x1E0CF48E0];
  v45[37] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 38, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "arrayByAddingObject:", *MEMORY[0x1E0CF4790]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "arrayByAddingObject:", *MEMORY[0x1E0CF47D8]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "arrayByAddingObject:", *MEMORY[0x1E0CF4898]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "arrayByAddingObject:", *MEMORY[0x1E0CF4850]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (AXDeviceIsPad())
  {
    objc_msgSend(v27, "arrayByAddingObject:", *MEMORY[0x1E0CF48A8]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "arrayByAddingObject:", *MEMORY[0x1E0CF4890]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "arrayByAddingObject:", *MEMORY[0x1E0CF48C0]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (AXDeviceIsSOSAvailable())
  {
    objc_msgSend(v27, "arrayByAddingObject:", *MEMORY[0x1E0CF4780]);
    v30 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v30;
  }
  if (AXDeviceCanArmApplePay())
  {
    objc_msgSend(v27, "arrayByAddingObject:", *MEMORY[0x1E0CF4798]);
    v31 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v31;
  }
  if (AXForceTouchAvailableAndEnabled())
  {
    objc_msgSend(v27, "arrayByAddingObject:", *MEMORY[0x1E0CF4770]);
    v32 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v32;
  }
  v33 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v41;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v41 != v35)
          objc_enumerationMutation(v27);
        objc_msgSend(MEMORY[0x1E0CF4908], "commandWithStandardCommandIdentifier:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v36));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v37);

        ++v36;
      }
      while (v34 != v36);
      v34 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v34);
  }

  -[FKAAvailableCommands cachedSiriShortcutsCommands](self, "cachedSiriShortcutsCommands");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v38);

  return (NSSet *)v3;
}

- (NSArray)categories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = (void *)MEMORY[0x1E0CF4910];
  -[FKAAvailableCommands commands](self, "commands");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allCategoriesForAvailableCommands:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FKAAvailableCommands cachedSiriShortcutsCommands](self, "cachedSiriShortcutsCommands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_alloc(MEMORY[0x1E0CF4910]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SIRI_SHORTCUTS_CATEGORY_NAME"), &stru_1E24CAB08, CFSTR("FullKeyboardAccess"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithCommands:localizedName:", v6, v9);

    objc_msgSend(v5, "arrayByAddingObject:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
  }

  return (NSArray *)v5;
}

- (AXSSKeyboardCommandMap)commandMap
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint8_t v18[8];
  id v19;

  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fullKeyboardAccessCommandMapData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v19);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v19;
    v7 = v6;
    if (v5)
    {

      goto LABEL_10;
    }
    FKALogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FKAAvailableCommands commandMap].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

  }
  FKALogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_18C62B000, v15, OS_LOG_TYPE_INFO, "Creating new command map because none was saved in preferences", v18, 2u);
  }

  v5 = (void *)objc_opt_new();
LABEL_10:
  -[FKAAvailableCommands commands](self, "commands");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAvailableCommands:", v16);

  return (AXSSKeyboardCommandMap *)v5;
}

- (void)setCommandMap:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  if (a3)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v13);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v13;
    if (!v3)
    {
      FKALogCommon();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[FKAAvailableCommands setCommandMap:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

    }
  }
  else
  {
    v3 = 0;
  }
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFullKeyboardAccessCommandMapData:", v3);

}

- (id)registerUpdateBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FKAAvailableCommands tokensToUpdateBlocks](self, "tokensToUpdateBlocks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FKAAvailableCommands setTokensToUpdateBlocks:](self, "setTokensToUpdateBlocks:", v7);

  }
  v8 = _Block_copy(v4);
  -[FKAAvailableCommands tokensToUpdateBlocks](self, "tokensToUpdateBlocks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v5);

  return v5;
}

- (void)unregisterUpdateBlockWithToken:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FKAAvailableCommands tokensToUpdateBlocks](self, "tokensToUpdateBlocks");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v4);

}

- (NSString)siriShortcutsDidChangeObserverToken
{
  return self->_siriShortcutsDidChangeObserverToken;
}

- (void)setSiriShortcutsDidChangeObserverToken:(id)a3
{
  objc_storeStrong((id *)&self->_siriShortcutsDidChangeObserverToken, a3);
}

- (id)forceTouchEnabledDidChangeObserverToken
{
  return self->_forceTouchEnabledDidChangeObserverToken;
}

- (void)setForceTouchEnabledDidChangeObserverToken:(id)a3
{
  objc_storeStrong(&self->_forceTouchEnabledDidChangeObserverToken, a3);
}

- (NSMutableDictionary)tokensToUpdateBlocks
{
  return self->_tokensToUpdateBlocks;
}

- (void)setTokensToUpdateBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_tokensToUpdateBlocks, a3);
}

- (NSArray)cachedSiriShortcutsCommands
{
  return self->_cachedSiriShortcutsCommands;
}

- (void)setCachedSiriShortcutsCommands:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSiriShortcutsCommands, a3);
}

- (OS_dispatch_queue)siriShortcutsQueue
{
  return self->_siriShortcutsQueue;
}

- (void)setSiriShortcutsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_siriShortcutsQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriShortcutsQueue, 0);
  objc_storeStrong((id *)&self->_cachedSiriShortcutsCommands, 0);
  objc_storeStrong((id *)&self->_tokensToUpdateBlocks, 0);
  objc_storeStrong(&self->_forceTouchEnabledDidChangeObserverToken, 0);
  objc_storeStrong((id *)&self->_siriShortcutsDidChangeObserverToken, 0);
}

- (void)commandMap
{
  OUTLINED_FUNCTION_0_3(&dword_18C62B000, a2, a3, "Error unarchiving command map: %@", a5, a6, a7, a8, 2u);
}

- (void)setCommandMap:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_18C62B000, a2, a3, "Unable to encode command map: %@", a5, a6, a7, a8, 2u);
}

@end
