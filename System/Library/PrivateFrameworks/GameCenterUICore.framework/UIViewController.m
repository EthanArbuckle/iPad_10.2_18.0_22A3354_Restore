@implementation UIViewController

void __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke(id *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;

  v3 = a2;
  objc_msgSend(a1[4], "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x24BDAC760];
  if (v4)
  {
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_2;
    v20 = &unk_24DC275E0;
    v21 = a1[4];
    gk_dispatch_group_do();
  }
  v11 = v5;
  v12 = 3221225472;
  v13 = __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_4;
  v14 = &unk_24DC276A8;
  v6 = a1[5];
  v7 = a1[4];
  v15 = v6;
  v16 = v7;
  gk_dispatch_group_do();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_3_24;
  v9[3] = &unk_24DC275B8;
  v8 = a1[5];
  v10 = a1[6];
  dispatch_group_notify(v3, v8, v9);

}

void __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_3;
  v6[3] = &unk_24DC275B8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_gkSetContentsNeedUpdateWithHandler:", v6);

}

uint64_t __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  int8x16_t v7;
  _QWORD block[4];
  int8x16_t v9;
  id v10;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_5;
  block[3] = &unk_24DC27680;
  v10 = v3;
  v7 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v7.i64[0];
  v9 = vextq_s8(v7, v7, 8uLL);
  v6 = v3;
  dispatch_async(v4, block);

}

void __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_5(id *a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _QWORD block[5];
  id v30;
  id v31;

  v2 = (uint64_t)(a1 + 4);
  objc_getAssociatedObject(a1[4], CFSTR("_gkContentRecentlyUpdated"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    if (!*MEMORY[0x24BE3A308])
      v5 = (id)GKOSLoggers();
    v6 = *MEMORY[0x24BE3A318];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A318], OS_LOG_TYPE_DEBUG))
      __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_5_cold_1(v2, v6, v7, v8, v9, v10, v11, v12);
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v13 = (void *)objc_msgSend(a1[6], "copy");
    objc_getAssociatedObject(a1[4], CFSTR("_gkContentUpdateHandlers"));
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (id)v14;
      v16 = (void *)MEMORY[0x220737704](v13);
      objc_msgSend(v15, "addObject:", v16);

      if (!*MEMORY[0x24BE3A308])
        v17 = (id)GKOSLoggers();
      v18 = *MEMORY[0x24BE3A318];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A318], OS_LOG_TYPE_DEBUG))
        __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_5_cold_2(v2, v18, v19, v20, v21, v22, v23, v24);
    }
    else
    {
      v25 = (void *)MEMORY[0x24BDBCEB8];
      v26 = (void *)MEMORY[0x220737704](v13);
      objc_msgSend(v25, "arrayWithObjects:", v26, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_setAssociatedObject(a1[4], CFSTR("_gkContentUpdateHandlers"), v27, (void *)0x301);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_19;
      block[3] = &unk_24DC27658;
      v28 = a1[5];
      block[4] = a1[4];
      v15 = v27;
      v30 = v15;
      v31 = a1[5];
      dispatch_async(v28, block);

    }
  }
}

void __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_19(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  dispatch_time_t v15;
  NSObject *v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;

  v2 = a1 + 32;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v3, CFSTR("_gkContentRecentlyUpdated"), v4, (void *)0x301);

  if (!*MEMORY[0x24BE3A308])
    v5 = (id)GKOSLoggers();
  v6 = *MEMORY[0x24BE3A318];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A318], OS_LOG_TYPE_DEBUG))
    __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_19_cold_1(v2, v6, v7, v8, v9, v10, v11, v12);
  v13 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_21;
  v18[3] = &unk_24DC27608;
  v14 = *(void **)(a1 + 32);
  v19 = *(id *)(a1 + 40);
  objc_msgSend(v14, "_gkUpdateContentsWithCompletionHandlerAndError:", v18);
  objc_setAssociatedObject(*(id *)(a1 + 32), CFSTR("_gkContentUpdateHandlers"), 0, (void *)0x301);
  v15 = dispatch_time(0, 1000000000);
  v16 = *(NSObject **)(a1 + 48);
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_2_23;
  v17[3] = &unk_24DC27630;
  v17[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v15, v16, v17);

}

void __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_21(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_2_23(uint64_t a1)
{
  objc_setAssociatedObject(*(id *)(a1 + 32), CFSTR("_gkContentRecentlyUpdated"), 0, (void *)0x301);
}

uint64_t __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_3_24(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __113__UIViewController_GKAdditions___gkPresentActivityViewControllerForActivityItems_fromView_withCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v9 = a4;
  v10 = a5;
  if ((_DWORD)a3)
    objc_msgSend(*(id *)(a1 + 32), "_gkDismissActivityViewControllerAnimated:", 1);
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id, uint64_t))(v11 + 16))(v11, v12, a3);

}

uint64_t __120__UIViewController_GKAlerts___gkPresentAlertWithTitle_message_buttonTitle_dismissHandler_presentationCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __106__UIViewController_GKAlerts___gkPresentConfirmationAlertWithTitle_message_buttonTitle_block_cancelAction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __103__UIViewController_GKRestrictionAlerts___gkInGameUIUnavailableAlertWithRestrictionMode_dismissHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_5_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219F71000, a2, a3, "Skipped content update due to recent load %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_5_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219F71000, a2, a3, "Coalesced content update %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_19_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219F71000, a2, a3, "Updating contents for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
