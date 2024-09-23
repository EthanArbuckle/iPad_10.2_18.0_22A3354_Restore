@implementation WFSelectMusicAction

+ (id)userInterfaceProtocol
{
  return &unk_255DFD8F0;
}

+ (id)userInterfaceXPCInterface
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___WFSelectMusicAction;
  objc_msgSendSuper2(&v8, sel_userInterfaceXPCInterface);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v4 = (void *)getMPMediaItemCollectionClass_softClass_37673;
  v13 = getMPMediaItemCollectionClass_softClass_37673;
  if (!getMPMediaItemCollectionClass_softClass_37673)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __getMPMediaItemCollectionClass_block_invoke_37674;
    v9[3] = &unk_24F8BB430;
    v9[4] = &v10;
    __getMPMediaItemCollectionClass_block_invoke_37674((uint64_t)v9);
    v4 = (void *)v11[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v10, 8);
  objc_msgSend(v3, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_showWithSelectMultiple_completionHandler_, 0, 1);

  return v2;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v5;
  _BOOL8 v6;
  _QWORD v7[5];

  v5 = a3;
  v6 = -[WFSelectMusicAction selectMultiple](self, "selectMultiple");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__WFSelectMusicAction_runWithRemoteUserInterface_input___block_invoke;
  v7[3] = &unk_24F8B7C68;
  v7[4] = self;
  objc_msgSend(v5, "showWithSelectMultiple:completionHandler:", v6, v7);

}

- (BOOL)selectMultiple
{
  void *v2;
  char v3;

  -[WFSelectMusicAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFExportSongActionSelectMultiple"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)disabledOnPlatforms
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFSelectMusicAction;
  -[WFSelectMusicAction disabledOnPlatforms](&v5, sel_disabledOnPlatforms);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *MEMORY[0x24BEC43E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __56__WFSelectMusicAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a2, "items", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 32), "output");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v5);
}

@end
