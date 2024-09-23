@implementation ASAccountAuthenticationModificationHostViewController

uint64_t __102___ASAccountAuthenticationModificationHostViewController_upgradeCredentialToSignInWithApple_userInfo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "upgradeCredentialToSignInWithApple:serviceIdentifier:userInfo:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1016), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1008), *(_QWORD *)(a1 + 40));
}

uint64_t __100___ASAccountAuthenticationModificationHostViewController_updateCredential_withNewPassword_userInfo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updatePasswordForServiceIdentifier:existingCredential:newPassword:userInfo:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1008), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1016), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1024), *(_QWORD *)(a1 + 40));
}

void __96___ASAccountAuthenticationModificationHostViewController__nonUIRequestDidRequireUserInteraction__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v4 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __96___ASAccountAuthenticationModificationHostViewController__nonUIRequestDidRequireUserInteraction__block_invoke_2;
  v8[3] = &unk_24C94F530;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v5 = (void *)MEMORY[0x212BBEFEC](v8);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1048), a2);
  v6 = *(_QWORD **)(a1 + 32);
  v7 = v6[129];
  if (v7 == 1)
  {
    objc_msgSend(v4, "prepareInterfaceToUpgradeCredentialToSignInWithApple:serviceIdentifier:userInfo:completion:", v6[127], v6[126], v6[132], v5);
  }
  else if (!v7)
  {
    objc_msgSend(v4, "prepareInterfaceToUpdatePasswordForServiceIdentifier:existingCredential:newPassword:userInfo:completion:", v6[126], v6[127], v6[128], v6[132], v5);
  }

  objc_destroyWeak(&v9);
}

void __96___ASAccountAuthenticationModificationHostViewController__nonUIRequestDidRequireUserInteraction__block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96___ASAccountAuthenticationModificationHostViewController__nonUIRequestDidRequireUserInteraction__block_invoke_3;
  block[3] = &unk_24C94F530;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __96___ASAccountAuthenticationModificationHostViewController__nonUIRequestDidRequireUserInteraction__block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 133);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "presentUIForAccountModificationHostViewController:", v3);

    WeakRetained = v3;
  }

}

void __142___ASAccountAuthenticationModificationHostViewController_prepareToCompleteUpgradeToSignInWithAppleRequestWithHostContext_userInfo_completion___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 1064));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountModificationHostViewControllerDidCompleteUpgradeToSignInWithApple:userInfo:completion:", a1[4], a1[5], a1[6]);
  else
    (*(void (**)(void))(a1[6] + 16))();

}

void __136___ASAccountAuthenticationModificationHostViewController_prepareToCompleteRequestWithHostContext_updatedCredential_userInfo_completion___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 1064));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountModificationHostViewController:didFinishWithCredential:userInfo:completion:", a1[4], a1[5], a1[6], a1[7]);
  else
    (*(void (**)(void))(a1[7] + 16))();

}

void __113___ASAccountAuthenticationModificationHostViewController_prepareToCancelRequestWithHostContext_error_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  uint8_t buf[16];

  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20E4D9000, v7, OS_LOG_TYPE_DEFAULT, "Authorization controller successfully revoked the upgrade authorization.", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __113___ASAccountAuthenticationModificationHostViewController_prepareToCancelRequestWithHostContext_error_completion___block_invoke_cold_1(v7, v5);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v10.receiver = *(id *)(a1 + 40);
  v10.super_class = (Class)_ASAccountAuthenticationModificationHostViewController;
  objc_msgSendSuper2(&v10, sel_prepareToCancelRequestWithHostContext_error_completion_, v8, v5, v9);

}

void __116___ASAccountAuthenticationModificationHostViewController_getSignInWithAppleAuthorizationWithState_nonce_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *WeakRetained;
  id *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      objc_storeStrong(WeakRetained + 130, a2);
      objc_msgSend(v6, "credential");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "authenticationServicesCredential");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(_QWORD, void *, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v11, v7);
    }
    else
    {
      if (v7)
      {
        v16 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          __116___ASAccountAuthenticationModificationHostViewController_getSignInWithAppleAuthorizationWithState_nonce_completion___block_invoke_cold_1(v16, v7);
      }
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *MEMORY[0x24BE0AB28];
      v19 = v7;
      v20 = objc_msgSend(v19, "safari_matchesErrorDomain:andCode:", v18, -7003);
      v21 = (void *)MEMORY[0x24BDD1540];
      if (v20)
      {
        v22 = *MEMORY[0x24BDD1398];
        v28[0] = *MEMORY[0x24BDD0FD8];
        v28[1] = v22;
        v29[0] = CFSTR("User tapped cancel on Sign in with Apple sheet.");
        v29[1] = v19;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v21;
        v25 = 1;
      }
      else
      {
        v28[0] = *MEMORY[0x24BDD1398];
        v29[0] = v19;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v21;
        v25 = 0;
      }
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("ASExtensionErrorDomain"), v25, v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v11);
    }

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD0FD8];
    v27 = CFSTR("Host view controller deallocated.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("ASExtensionErrorDomain"), 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v15);

  }
}

void __113___ASAccountAuthenticationModificationHostViewController_prepareToCancelRequestWithHostContext_error_completion___block_invoke_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_2_0(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v5, v6, "Authorization controller attempted to revoke upgrade authorization and failed with error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_0();
}

void __116___ASAccountAuthenticationModificationHostViewController_getSignInWithAppleAuthorizationWithState_nonce_completion___block_invoke_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_2_0(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v5, v6, "Error when creating Sign in with Apple Authorization: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_0();
}

@end
