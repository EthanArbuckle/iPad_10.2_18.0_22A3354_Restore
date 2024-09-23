@implementation ASCredentialAuthenticationViewController

uint64_t __87___ASCredentialAuthenticationViewController_initWithExtension_passkeyAssertionRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "provideCredentialWithoutUserInteractionForRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1008));
}

uint64_t __117___ASCredentialAuthenticationViewController_initWithExtension_passkeyRegistrationRequest_forConditionalRegistration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performPasskeyRegistrationWithoutUserInteractionIfPossible:", *(_QWORD *)(a1 + 32));
}

void __117___ASCredentialAuthenticationViewController_initWithExtension_passkeyRegistrationRequest_forConditionalRegistration___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD v5[4];
  _QWORD *v6;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[126];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __117___ASCredentialAuthenticationViewController_initWithExtension_passkeyRegistrationRequest_forConditionalRegistration___block_invoke_3;
  v5[3] = &unk_24C94F558;
  v6 = v3;
  objc_msgSend(a2, "prepareInterfaceForPasskeyRegistration:completionHandler:", v4, v5);

}

void __117___ASCredentialAuthenticationViewController_initWithExtension_passkeyRegistrationRequest_forConditionalRegistration___block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __117___ASCredentialAuthenticationViewController_initWithExtension_passkeyRegistrationRequest_forConditionalRegistration___block_invoke_4;
  block[3] = &unk_24C94F558;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __117___ASCredentialAuthenticationViewController_initWithExtension_passkeyRegistrationRequest_forConditionalRegistration___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1016));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "presentUIForPasswordCredentialAuthenticationViewController:", *(_QWORD *)(a1 + 32));

}

void __82___ASCredentialAuthenticationViewController_initWithExtension_credentialIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "credentialIdentityStoreIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "nonUIHostContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_auxiliaryConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SFCredentialIdentityStoreIdentifierCreateWithConnectionToExtension();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqual:", v7) & 1) != 0)
  {
    objc_msgSend(v3, "provideCredentialWithoutUserInteractionForRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1008));
  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __82___ASCredentialAuthenticationViewController_initWithExtension_credentialIdentity___block_invoke_cold_1((uint64_t)v4, (uint64_t)v7, v8);
    objc_msgSend(*(id *)(a1 + 40), "extension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_kill:", 9);

  }
}

uint64_t __92___ASCredentialAuthenticationViewController_initWithExtension_oneTimeCodeCredentialRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "provideCredentialWithoutUserInteractionForRequest:", *(_QWORD *)(a1 + 32));
}

uint64_t __83___ASCredentialAuthenticationViewController__nonUIRequestDidRequireUserInteraction__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 1008);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __83___ASCredentialAuthenticationViewController__nonUIRequestDidRequireUserInteraction__block_invoke_2;
  v5[3] = &unk_24C94F558;
  v5[4] = v2;
  return objc_msgSend(a2, "prepareInterfaceToProvideCredentialForRequest:completionHandler:", v3, v5);
}

void __83___ASCredentialAuthenticationViewController__nonUIRequestDidRequireUserInteraction__block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83___ASCredentialAuthenticationViewController__nonUIRequestDidRequireUserInteraction__block_invoke_3;
  block[3] = &unk_24C94F558;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __83___ASCredentialAuthenticationViewController__nonUIRequestDidRequireUserInteraction__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1016));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "presentUIForPasswordCredentialAuthenticationViewController:", *(_QWORD *)(a1 + 32));

}

void __81___ASCredentialAuthenticationViewController__requestDidFailWithError_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __81___ASCredentialAuthenticationViewController__requestDidFailWithError_completion___block_invoke_cold_1(v6, v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

uint64_t __107___ASCredentialAuthenticationViewController_prepareToCompleteRequestWithHostContext_credential_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithCredential:error:completion:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

uint64_t __123___ASCredentialAuthenticationViewController_prepareToCompleteRequestWithHostContext_passkeyAssertionCredential_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithPasskeyAssertionCredential:error:completion:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

uint64_t __126___ASCredentialAuthenticationViewController_prepareToCompleteRequestWithHostContext_passkeyRegistrationCredential_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithPasskeyRegistrationCredential:error:completion:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

uint64_t __118___ASCredentialAuthenticationViewController_prepareToCompleteOneTimeCodeRequestWithHostContext_credential_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithOneTimeCodeCredential:error:completion:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

void __82___ASCredentialAuthenticationViewController_initWithExtension_credentialIdentity___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_20E4D9000, log, OS_LOG_TYPE_ERROR, "Refusing to send credential identity with store identifier [%{public}@] to to extension with store identifier [%{public}@]", (uint8_t *)&v3, 0x16u);
}

void __81___ASCredentialAuthenticationViewController__requestDidFailWithError_completion___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_20E4D9000, v3, OS_LOG_TYPE_ERROR, "Failed to remove credential identity store with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
