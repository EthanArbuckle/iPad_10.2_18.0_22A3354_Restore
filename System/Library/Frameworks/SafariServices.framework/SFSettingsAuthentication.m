@implementation SFSettingsAuthentication

uint64_t __96___SFSettingsAuthentication_authenticateForSettings_allowAuthenticationReuse_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHasBeenAuthenticated:", objc_msgSend(*(id *)(a1 + 40), "code") == -5);
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "hasBeenAuthenticated"), 0, *(_QWORD *)(a1 + 40));
}

void __96___SFSettingsAuthentication_authenticateForSettings_allowAuthenticationReuse_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96___SFSettingsAuthentication_authenticateForSettings_allowAuthenticationReuse_completionHandler___block_invoke_3;
  block[3] = &unk_1E4AC5CB0;
  v7 = v4;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __96___SFSettingsAuthentication_authenticateForSettings_allowAuthenticationReuse_completionHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "setHasBeenAuthenticated:", *(_QWORD *)(a1 + 32) == 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __123___SFSettingsAuthentication_pushSettingsAfterAuthentication_onBehalfOfViewController_resourceDictionary_completionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t IsPad;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a4;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "addObject:", *(_QWORD *)(a1 + 40));
    if (!*(_QWORD *)(a1 + 48))
      goto LABEL_10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "additionalViewControllersToPushHandlingURLResourceDictionary:didAuthenticate:", *(_QWORD *)(a1 + 48), a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_msgSend(v9, "addObjectsFromArray:", v10);

    }
    v11 = *(void **)(a1 + 48);
    if (v11)
    {
      if ((_DWORD)a3)
        IsPad = objc_msgSend(v11, "safari_BOOLForKey:", CFSTR("animate"));
      else
        IsPad = _SFDeviceIsPad();
      v13 = IsPad;
    }
    else
    {
LABEL_10:
      v13 = 1;
    }
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setViewControllers:animated:", v9, v13);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

@end
