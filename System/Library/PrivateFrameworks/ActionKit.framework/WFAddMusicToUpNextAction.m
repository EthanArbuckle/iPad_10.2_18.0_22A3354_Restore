@implementation WFAddMusicToUpNextAction

- (id)disabledOnPlatforms
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFAddMusicToUpNextAction;
  -[WFAddMusicToUpNextAction disabledOnPlatforms](&v5, sel_disabledOnPlatforms);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *MEMORY[0x24BEC43E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__WFAddMusicToUpNextAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8BA0E8;
  v6[4] = self;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClasses:completionHandler:", v5, v6);

}

- (unint64_t)queueAdditionMode
{
  void *v2;
  unint64_t v3;

  -[WFAddMusicToUpNextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFWhenToPlay"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Next")) & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Later"));

  return v3;
}

void __55__WFAddMusicToUpNextAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  WFMediaPlaybackController *v13;
  uint64_t v14;
  WFMediaPlaybackController *v15;
  _QWORD v16[5];
  _QWORD v17[4];
  WFMediaPlaybackController *v18;
  uint64_t v19;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  if (a4)
  {
    objc_msgSend(v7, "finishRunningWithError:", a4);
  }
  else
  {
    v8 = objc_msgSend(v7, "queueAdditionMode");
    objc_msgSend(v6, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v8)
    {
      objc_msgSend(v9, "reverseObjectEnumerator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allObjects");
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }
    v13 = objc_alloc_init(WFMediaPlaybackController);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __55__WFAddMusicToUpNextAction_runAsynchronouslyWithInput___block_invoke_2;
    v17[3] = &unk_24F8B6320;
    v14 = *(_QWORD *)(a1 + 32);
    v18 = v13;
    v19 = v14;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __55__WFAddMusicToUpNextAction_runAsynchronouslyWithInput___block_invoke_6;
    v16[3] = &unk_24F8BB050;
    v16[4] = v14;
    v15 = v13;
    objc_msgSend(v10, "if_enumerateAsynchronouslyInSequence:completionHandler:", v17, v16);

  }
}

void __55__WFAddMusicToUpNextAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id *v12;
  id *v13;
  id v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  _QWORD v21[2];
  id v22;
  _QWORD v23[4];
  _QWORD v24[2];
  id v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v6 = a2;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __55__WFAddMusicToUpNextAction_runAsynchronouslyWithInput___block_invoke_3;
    v23[3] = &unk_24F8B3BB0;
    v25 = v7;
    v9 = *(id *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v24[0] = v9;
    v24[1] = v10;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v11 = (void *)getMPMediaItemClass_softClass_17607;
    v30 = getMPMediaItemClass_softClass_17607;
    if (!getMPMediaItemClass_softClass_17607)
    {
      v26[0] = v8;
      v26[1] = 3221225472;
      v26[2] = __getMPMediaItemClass_block_invoke_17608;
      v26[3] = &unk_24F8BB430;
      v26[4] = &v27;
      __getMPMediaItemClass_block_invoke_17608((uint64_t)v26);
      v11 = (void *)v28[3];
    }
    v12 = &v25;
    v13 = (id *)v24;
    v14 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v27, 8);
    v15 = v23;
    v16 = v6;
    v17 = (uint64_t)v14;
  }
  else
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __55__WFAddMusicToUpNextAction_runAsynchronouslyWithInput___block_invoke_4;
    v20[3] = &unk_24F8B3BB0;
    v12 = &v22;
    v22 = v7;
    v13 = (id *)v21;
    v18 = *(id *)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 40);
    v21[0] = v18;
    v21[1] = v19;
    v17 = objc_opt_class();
    v15 = v20;
    v16 = v6;
  }
  objc_msgSend(v16, "getObjectRepresentations:forClass:", v15, v17);

}

uint64_t __55__WFAddMusicToUpNextAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __55__WFAddMusicToUpNextAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "queueMediaItems:inAdditionMode:completion:", v3, objc_msgSend(*(id *)(a1 + 40), "queueAdditionMode"), *(_QWORD *)(a1 + 48));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __55__WFAddMusicToUpNextAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "if_map:", &__block_literal_global_17610);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "queueiTunesStoreItems:inAdditionMode:completion:", v3, objc_msgSend(*(id *)(a1 + 40), "queueAdditionMode"), *(_QWORD *)(a1 + 48));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

id __55__WFAddMusicToUpNextAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
