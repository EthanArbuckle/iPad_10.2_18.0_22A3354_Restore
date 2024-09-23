@implementation ASSettingsHelper

+ (void)openCredentialProviderAppSettingsWithCompletionHandler:(void *)completionHandler
{
  void *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = completionHandler;
  v4 = objc_alloc_init(MEMORY[0x24BE0B1F8]);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__ASSettingsHelper_openCredentialProviderAppSettingsWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C951450;
  v8 = v4;
  v9 = v3;
  v5 = v3;
  v6 = v4;
  objc_msgSend(v6, "openCredentialProviderAppSettingsWithCompletionHandler:", v7);

}

uint64_t __75__ASSettingsHelper_openCredentialProviderAppSettingsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)openVerificationCodeAppSettingsWithCompletionHandler:(void *)completionHandler
{
  void *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = completionHandler;
  v4 = objc_alloc_init(MEMORY[0x24BE0B1F8]);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__ASSettingsHelper_openVerificationCodeAppSettingsWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C951450;
  v8 = v4;
  v9 = v3;
  v5 = v3;
  v6 = v4;
  objc_msgSend(v6, "openVerificationCodeAppSettingsWithCompletionHandler:", v7);

}

uint64_t __73__ASSettingsHelper_openVerificationCodeAppSettingsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)requestToTurnOnCredentialProviderExtensionWithCompletionHandler:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE0B1F8]);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __84__ASSettingsHelper_requestToTurnOnCredentialProviderExtensionWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C951F88;
  v8 = v4;
  v9 = v3;
  v5 = v3;
  v6 = v4;
  objc_msgSend(v6, "requestToTurnOnCredentialProviderExtensionWithCompletionHandler:", v7);

}

uint64_t __84__ASSettingsHelper_requestToTurnOnCredentialProviderExtensionWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
