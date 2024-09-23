@implementation DDMoreCallActionsAction

+ (BOOL)isAvailable
{
  void *v2;
  BOOL v3;

  +[DDCallKitAction callKitProviders](DDCallKitAction, "callKitProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (id)callProviderActions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_opt_new();
  +[DDCallKitAction callKitProviders](DDCallKitAction, "callKitProviders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__DDMoreCallActionsAction_callProviderActions__block_invoke;
  v9[3] = &unk_1E4258AA8;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void __46__DDMoreCallActionsAction_callProviderActions__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[1];
  v6 = v3[7];
  v5 = v3[8];
  v7 = a2;
  +[DDAction actionWithURL:result:context:](DDCallKitAction, "actionWithURL:result:context:", v5, v4, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCallProvider:", v7);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
}

- (id)iconName
{
  return CFSTR("chevron.forward");
}

- (id)variantIconName
{
  return 0;
}

- (id)alertActions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_opt_new();
  +[DDCallKitAction callKitProviders](DDCallKitAction, "callKitProviders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__DDMoreCallActionsAction_alertActions__block_invoke;
  v9[3] = &unk_1E4258AA8;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void __39__DDMoreCallActionsAction_alertActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(v3, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __39__DDMoreCallActionsAction_alertActions__block_invoke_2;
  v11 = &unk_1E4258AD0;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v3;
  v6 = v3;
  objc_msgSend(v4, "actionWithTitle:style:handler:", v5, 0, &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7, v8, v9, v10, v11, v12);
}

void __39__DDMoreCallActionsAction_alertActions__block_invoke_2(uint64_t a1)
{
  id v2;

  +[DDAction actionWithURL:result:context:](DDCallKitAction, "actionWithURL:result:context:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCallProvider:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "performFromView:", 0);

}

@end
