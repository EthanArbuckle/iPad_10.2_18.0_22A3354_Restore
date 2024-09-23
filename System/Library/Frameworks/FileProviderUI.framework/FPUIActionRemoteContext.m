@implementation FPUIActionRemoteContext

void __58__FPUIActionRemoteContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255918F88);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol___hostInterface;
  _extensionAuxiliaryHostProtocol___hostInterface = v0;

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_50);
  return (id)_extensionAuxiliaryVendorProtocol___vendorInterface;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_0);
  return (id)_extensionAuxiliaryHostProtocol___hostInterface;
}

void __60__FPUIActionRemoteContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255922D90);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol___vendorInterface;
  _extensionAuxiliaryVendorProtocol___vendorInterface = v0;

}

- (void)_openExtensionURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__FPUIActionRemoteContext__openExtensionURL_completionHandler___block_invoke;
  v10[3] = &unk_24EFEE0F8;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __63__FPUIActionRemoteContext__openExtensionURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  char v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  char v10;
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v12 = *MEMORY[0x24BE382E0];
  v13[0] = CFSTR("FPUIAppLaunchOrigin");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v11 = 0;
  v5 = objc_msgSend(v3, "openSensitiveURL:withOptions:error:", v4, v2, &v11);
  v6 = v11;

  if ((v5 & 1) == 0)
  {
    v7 = fpuiLogHandle;
    if (!fpuiLogHandle)
    {
      FPUIInitLogging();
      v7 = fpuiLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __63__FPUIActionRemoteContext__openExtensionURL_completionHandler___block_invoke_cold_1((uint64_t *)(a1 + 32), (uint64_t)v6, v7);
  }
  if (*(_QWORD *)(a1 + 40))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __63__FPUIActionRemoteContext__openExtensionURL_completionHandler___block_invoke_54;
    v8[3] = &unk_24EFEE0D0;
    v9 = *(id *)(a1 + 40);
    v10 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);

  }
}

uint64_t __63__FPUIActionRemoteContext__openExtensionURL_completionHandler___block_invoke_54(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_completeRequestWithUserInfo:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__FPUIActionRemoteContext__completeRequestWithUserInfo_error___block_invoke;
  block[3] = &unk_24EFEE120;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __62__FPUIActionRemoteContext__completeRequestWithUserInfo_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteActionContextDidFinishAction:userInfo:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_didEncounterError:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__FPUIActionRemoteContext__didEncounterError_completionHandler___block_invoke;
  block[3] = &unk_24EFEDFC8;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __64__FPUIActionRemoteContext__didEncounterError_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteActionContext:didEncounterError:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (FPUIActionRemoteContextDelegate)delegate
{
  return (FPUIActionRemoteContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __63__FPUIActionRemoteContext__openExtensionURL_completionHandler___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_2278C8000, log, OS_LOG_TYPE_ERROR, "FPUIActionExtensionContext failed to open URL %@ with error %@", (uint8_t *)&v4, 0x16u);
}

@end
