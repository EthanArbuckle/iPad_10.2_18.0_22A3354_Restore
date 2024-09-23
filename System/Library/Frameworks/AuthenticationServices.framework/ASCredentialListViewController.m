@implementation ASCredentialListViewController

void __90___ASCredentialListViewController_initWithExtension_serviceIdentifiers_requestParameters___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90___ASCredentialListViewController_initWithExtension_serviceIdentifiers_requestParameters___block_invoke_2;
  block[3] = &unk_24C94F530;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __90___ASCredentialListViewController_initWithExtension_serviceIdentifiers_requestParameters___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 127);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "credentialListViewControllerDidPrepareInterface:", v3);

    WeakRetained = v3;
  }

}

uint64_t __90___ASCredentialListViewController_initWithExtension_serviceIdentifiers_requestParameters___block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = a1[4];
  v2 = a1[5];
  v4 = a1[6];
  if (v3)
    return objc_msgSend(a2, "prepareCredentialListForServiceIdentifiers:requestParameters:completionHandler:", v2, v3, v4);
  else
    return objc_msgSend(a2, "prepareCredentialListForServiceIdentifiers:completionHandler:", v2, v4);
}

void __90___ASCredentialListViewController_initWithExtension_serviceIdentifiers_requestParameters___block_invoke_4(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "extension");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_kill:", 9);

}

void __97___ASCredentialListViewController_initOneTimeCodeCredentialListWithExtension_serviceIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __97___ASCredentialListViewController_initOneTimeCodeCredentialListWithExtension_serviceIdentifiers___block_invoke_2;
  v5[3] = &unk_24C94F530;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  objc_msgSend(v3, "prepareOneTimeCodeCredentialListForServiceIdentifiers:completionHandler:", v4, v5);
  objc_destroyWeak(&v6);

}

void __97___ASCredentialListViewController_initOneTimeCodeCredentialListWithExtension_serviceIdentifiers___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __97___ASCredentialListViewController_initOneTimeCodeCredentialListWithExtension_serviceIdentifiers___block_invoke_3;
  block[3] = &unk_24C94F530;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __97___ASCredentialListViewController_initOneTimeCodeCredentialListWithExtension_serviceIdentifiers___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
    v2 = objc_loadWeakRetained(WeakRetained + 127);
  else
    v2 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "credentialListViewControllerDidPrepareInterface:", v3);

}

void __97___ASCredentialListViewController_initOneTimeCodeCredentialListWithExtension_serviceIdentifiers___block_invoke_4(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "extension");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_kill:", 9);

}

uint64_t __88___ASCredentialListViewController_initForTextSelectingWithExtension_serviceIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "prepareInterfaceForUserChoosingTextToInsert");
}

void __88___ASCredentialListViewController_initForTextSelectingWithExtension_serviceIdentifiers___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "extension");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_kill:", 9);

}

uint64_t __97___ASCredentialListViewController_prepareToCompleteRequestWithHostContext_credential_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithCredential:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __100___ASCredentialListViewController_prepareToCompleteSelectionRequestWithHostContext_text_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "credentialListViewController:didFinishWithText:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

@end
