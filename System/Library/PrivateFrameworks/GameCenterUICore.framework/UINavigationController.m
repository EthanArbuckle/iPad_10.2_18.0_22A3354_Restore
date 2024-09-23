@implementation UINavigationController

void __75__UINavigationController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  uint64_t v27;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = MEMORY[0x24BDAC760];
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "topViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
    {
      v18 = v6;
      v19 = 3221225472;
      v20 = __75__UINavigationController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_3;
      v21 = &unk_24DC275E0;
      v22 = v8;
      gk_dispatch_group_do();
      v12 = v6;
      v13 = 3221225472;
      v14 = __75__UINavigationController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_4;
      v15 = &unk_24DC276A8;
      v16 = *(_QWORD *)(a1 + 32);
      v17 = v22;
      gk_dispatch_group_do();

    }
    else
    {
      v23 = v6;
      v24 = 3221225472;
      v25 = __75__UINavigationController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_2;
      v26 = &unk_24DC275E0;
      v27 = *(_QWORD *)(a1 + 32);
      gk_dispatch_group_do();
    }

  }
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __75__UINavigationController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_5;
  block[3] = &unk_24DC275B8;
  v11 = *(id *)(a1 + 40);
  dispatch_group_notify(v3, MEMORY[0x24BDAC9B8], block);

}

void __75__UINavigationController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "topViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_gkSetContentsNeedUpdateWithHandler:", v3);

}

uint64_t __75__UINavigationController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_gkSetContentsNeedUpdateWithHandler:", a2);
}

void __75__UINavigationController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 != *(void **)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "topViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_gkSetContentsNeedUpdateWithHandler:", v5);

  }
}

uint64_t __75__UINavigationController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
