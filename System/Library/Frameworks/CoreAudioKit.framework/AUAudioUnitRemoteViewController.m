@implementation AUAudioUnitRemoteViewController

+ (void)_fetchViewControllerForExtension:(id)a3 inputItems:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __90__AUAudioUnitRemoteViewController__fetchViewControllerForExtension_inputItems_completion___block_invoke;
  v9[3] = &unk_24CF54F38;
  v10 = v7;
  v8 = v7;
  objc_msgSend(a3, "instantiateViewControllerWithInputItems:listenerEndpoint:connectionHandler:", a4, 0, v9);

}

void __90__AUAudioUnitRemoteViewController__fetchViewControllerForExtension_inputItems_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (*v9)(void);
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      __90__AUAudioUnitRemoteViewController__fetchViewControllerForExtension_inputItems_completion___block_invoke_cold_2();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      __90__AUAudioUnitRemoteViewController__fetchViewControllerForExtension_inputItems_completion___block_invoke_cold_1();
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v9();

}

+ (void)_fetchViewController:(id)a3 requestIdentifier:(id)a4 completion:(id)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t aBlock;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;

  v6 = a5;
  aBlock = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __85__AUAudioUnitRemoteViewController__fetchViewController_requestIdentifier_completion___block_invoke;
  v18 = &unk_24CF54F60;
  v19 = v6;
  v7 = v6;
  v8 = a3;
  v9 = _Block_copy(&aBlock);
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v8, "_plugIn");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.viewbridge"), v12, aBlock, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](AUAudioUnitRemoteViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("AUAudioUnitViewService"), v13, v9);
}

void __85__AUAudioUnitRemoteViewController__fetchViewController_requestIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void (*v7)(uint64_t, id, _QWORD);
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (v5)
  {
    NSLog(CFSTR("Error: Failed to connect to remote view because of %@"), v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      __85__AUAudioUnitRemoteViewController__fetchViewController_requestIdentifier_completion___block_invoke_cold_1();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void (**)(uint64_t, id, _QWORD))(v6 + 16);
    v8 = v9;
    v7(v6, v8, 0);

  }
}

void __90__AUAudioUnitRemoteViewController__fetchViewControllerForExtension_inputItems_completion___block_invoke_cold_1()
{
  __assert_rtn("+[AUAudioUnitRemoteViewController _fetchViewControllerForExtension:inputItems:completion:]_block_invoke", "AUAudioUnitRemoteViewController.m", 150, "[remoteViewController isKindOfClass:AUAudioUnitRemoteViewController.class]");
}

void __90__AUAudioUnitRemoteViewController__fetchViewControllerForExtension_inputItems_completion___block_invoke_cold_2()
{
  __assert_rtn("+[AUAudioUnitRemoteViewController _fetchViewControllerForExtension:inputItems:completion:]_block_invoke", "AUAudioUnitRemoteViewController.m", 149, "[requestIdentifier isKindOfClass:NSUUID.class]");
}

void __85__AUAudioUnitRemoteViewController__fetchViewController_requestIdentifier_completion___block_invoke_cold_1()
{
  __assert_rtn("+[AUAudioUnitRemoteViewController _fetchViewController:requestIdentifier:completion:]_block_invoke", "AUAudioUnitRemoteViewController.m", 200, "[readyController isKindOfClass:AUAudioUnitRemoteViewController.class]");
}

@end
