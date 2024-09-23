@implementation UISplitViewController

void __74__UISplitViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  v6 = MEMORY[0x24BDAC760];
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v13 = v6;
        v14 = 3221225472;
        v15 = __74__UISplitViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_2;
        v16 = &unk_24DC275E0;
        v17 = v10;
        gk_dispatch_group_do();
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __74__UISplitViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_3;
  v11[3] = &unk_24DC275B8;
  v12 = *(id *)(a1 + 40);
  dispatch_group_notify(v3, MEMORY[0x24BDAC9B8], v11);

}

uint64_t __74__UISplitViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_gkSetContentsNeedUpdateWithHandler:", a2);
}

uint64_t __74__UISplitViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
