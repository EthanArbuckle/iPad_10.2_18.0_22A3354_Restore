@implementation HKXPCConnection

void __64___HKXPCConnection_resumeWithExportedInterface_remoteInterface___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  void (**v6)(_QWORD);
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 138412546;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_19A0E6000, v2, OS_LOG_TYPE_DEFAULT, "%@Connection to \"%@\" interrupted", (uint8_t *)&v7, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "interruptionHandler");
  v6 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  if (v6)
    v6[2](v6);

}

void __64___HKXPCConnection_resumeWithExportedInterface_remoteInterface___block_invoke_19(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  void (**v6)(_QWORD);
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 138412546;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_19A0E6000, v2, OS_LOG_TYPE_DEFAULT, "%@Connection to \"%@\" invalidated", (uint8_t *)&v7, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "invalidationHandler");
  v6 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  if (v6)
    v6[2](v6);

}

void __43___HKXPCConnection_setInterruptionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  id v3;
  id v4;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "exportedObject");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, (id)v2);

  v3 = objc_loadWeakRetained(&location);
  LOBYTE(v2) = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v4 = objc_loadWeakRetained(&location);
    objc_msgSend(v4, "connectionInterrupted");

  }
  objc_destroyWeak(&location);
}

void __43___HKXPCConnection_setInvalidationHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "exportedObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "connectionInvalidated");

}

@end
