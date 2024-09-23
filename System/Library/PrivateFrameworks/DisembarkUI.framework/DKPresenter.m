@implementation DKPresenter

+ (void)presentUsingParentViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[DKConfiguration defaultConfiguration](DKConfiguration, "defaultConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "presentUsingParentViewController:configuration:completion:", v4, v5, 0);

}

+ (void)presentUsingParentViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  +[DKConfiguration defaultConfiguration](DKConfiguration, "defaultConfiguration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "presentUsingParentViewController:configuration:completion:", v7, v8, v6);

}

+ (void)presentUsingParentViewController:(id)a3 configuration:(id)a4 completion:(id)a5
{
  objc_msgSend(a1, "presentUsingParentViewController:configuration:willPresent:completion:", a3, a4, 0, a5);
}

+ (void)presentUsingParentViewController:(id)a3 configuration:(id)a4 willPresent:(id)a5 completion:(id)a6
{
  id v9;
  void (**v10)(id, DKEraseFlow *);
  id v11;
  id v12;
  DKNavigationController *v13;
  void *v14;
  DKEraseFlow *v15;
  id v16;
  id v17;
  DKNavigationController *v18;
  DKEraseFlow *v19;
  _QWORD v20[4];
  DKEraseFlow *v21;
  DKNavigationController *v22;
  id v23;
  id v24;

  v9 = a3;
  v10 = (void (**)(id, DKEraseFlow *))a5;
  v11 = a6;
  v12 = a4;
  v13 = objc_alloc_init(DKNavigationController);
  v14 = (void *)objc_opt_new();
  -[DKNavigationController pushViewController:animated:](v13, "pushViewController:animated:", v14, 0);
  v15 = -[DKEraseFlow initWithNavigationController:configuration:]([DKEraseFlow alloc], "initWithNavigationController:configuration:", v13, v12);

  if (v10)
    v10[2](v10, v15);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __85__DKPresenter_presentUsingParentViewController_configuration_willPresent_completion___block_invoke;
  v20[3] = &unk_24F20E478;
  v21 = v15;
  v22 = v13;
  v23 = v14;
  v24 = v11;
  v16 = v11;
  v17 = v14;
  v18 = v13;
  v19 = v15;
  -[DKEraseFlow showFlowContainerFromParentViewController:completion:](v19, "showFlowContainerFromParentViewController:completion:", v9, v20);

}

void __85__DKPresenter_presentUsingParentViewController_configuration_willPresent_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __85__DKPresenter_presentUsingParentViewController_configuration_willPresent_completion___block_invoke_2;
  v3[3] = &unk_24F20E478;
  v4 = v2;
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "prepareFlow:", v3);

}

void __85__DKPresenter_presentUsingParentViewController_configuration_willPresent_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "startFlow");
  objc_msgSend(*(id *)(a1 + 40), "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "setViewControllers:animated:", v5, 0);
  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

+ (void)presentInSettings
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  _DKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_229405000, v2, OS_LOG_TYPE_DEFAULT, "Launching settings...", v5, 2u);
  }

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs://root=General&path=Reset/exitBuddy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v4, 0);

}

@end
