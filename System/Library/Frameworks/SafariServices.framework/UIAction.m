@implementation UIAction

void __67__UIAction_SafariServicesExtras__safari_actionWithTarget_selector___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained || *(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v7, "sender");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendAction:to:from:forEvent:", v5, WeakRetained, v6, 0);

  }
}

uint64_t __68__UIAction_SafariServicesExtras___sf_openInNewTabActionWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __94__UIAction_SafariServicesExtras___sf_openInNewTabActionWithTabOrder_handler_identifierSuffix___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __74__UIAction_SafariServicesExtras___sf_debugKillWebProcessActionForWebView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_killWebContentProcess");
}

@end
