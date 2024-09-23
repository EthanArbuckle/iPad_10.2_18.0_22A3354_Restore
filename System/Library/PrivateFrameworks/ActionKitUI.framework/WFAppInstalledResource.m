@implementation WFAppInstalledResource

void __74__WFAppInstalledResource_UIKit__appSearchViewController_didFinishWithApp___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, uint64_t, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "recoveryCompletionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "recoveryCompletionHandler");
    v3 = (void (**)(id, uint64_t, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 1, 0);

  }
}

void __66__WFAppInstalledResource_UIKit__appSearchViewControllerDidCancel___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, uint64_t, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "recoveryCompletionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "recoveryCompletionHandler");
    v3 = (void (**)(id, uint64_t, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 1, 0);

  }
}

void __102__WFAppInstalledResource_UIKit__attemptRecoveryFromError_optionIndex_userInterface_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __102__WFAppInstalledResource_UIKit__attemptRecoveryFromError_optionIndex_userInterface_completionHandler___block_invoke_2;
    block[3] = &unk_24E342710;
    v6 = v3;
    v7 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __102__WFAppInstalledResource_UIKit__attemptRecoveryFromError_optionIndex_userInterface_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __102__WFAppInstalledResource_UIKit__attemptRecoveryFromError_optionIndex_userInterface_completionHandler___block_invoke_3;
  v5[3] = &unk_24E3426E8;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "openURL:userInterface:completionHandler:", v3, v4, v5);

}

uint64_t __102__WFAppInstalledResource_UIKit__attemptRecoveryFromError_optionIndex_userInterface_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
