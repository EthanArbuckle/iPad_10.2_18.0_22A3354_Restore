@implementation AuthorizationRemoteViewControllerHost

LARemoteViewControllerParameters *__85___AuthorizationRemoteViewControllerHost_requestViewControllerWithConnectionHandler___block_invoke()
{
  LARemoteViewControllerParameters *v0;

  v0 = objc_alloc_init(LARemoteViewControllerParameters);
  -[LARemoteViewControllerParameters setServiceBundleIdentifier:](v0, "setServiceBundleIdentifier:", CFSTR("com.apple.CoreAuthUI"));
  -[LARemoteViewControllerParameters setServiceViewControllerClassName:](v0, "setServiceViewControllerClassName:", CFSTR("AuthorizationRemoteViewController"));
  return v0;
}

void __85___AuthorizationRemoteViewControllerHost_requestViewControllerWithConnectionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  double v8;
  double v9;
  NSObject *v10;
  os_log_type_t v11;
  int v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "timeIntervalSinceNow");
  v9 = v8;
  LA_LOG_0();
  v10 = objc_claimAutoreleasedReturnValue();
  if (v9 >= -1.0)
    v11 = OS_LOG_TYPE_DEFAULT;
  else
    v11 = LALogTypeForInternalError();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = 134217984;
    v13 = -v9;
    _os_log_impl(&dword_22FE91000, v10, v11, "RemoteUI call took %.2f secs", (uint8_t *)&v12, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __59___AuthorizationRemoteViewControllerHost_exportedInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255E60940);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)exportedInterface_interface;
  exportedInterface_interface = v0;

}

void __72___AuthorizationRemoteViewControllerHost_serviceViewControllerInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255E609D0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serviceViewControllerInterface_interface;
  serviceViewControllerInterface_interface = v0;

}

void __71___AuthorizationRemoteViewControllerHost_startWithConfiguration_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  LA_LOG_0();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = LALogTypeForInternalError();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_22FE91000, v4, v5, "Could not obtain service proxy for starting (%{public}@).", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56___AuthorizationRemoteViewControllerHost_stopWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  LA_LOG_0();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = LALogTypeForInternalError();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_22FE91000, v4, v5, "Could not obtain service proxy for stoping (%{public}@).", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
