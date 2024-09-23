@implementation ASDEventServiceExtensionRemoteContext

- (void)didReceiveInstallationEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(15);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v6;
    v13 = 2048;
    v14 = objc_msgSend(v4, "phase");
    v15 = 2048;
    v16 = objc_msgSend(v4, "terminalPhase");
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "didReceiveInstallationEvent: %{public}@ %ld/%ld", (uint8_t *)&v11, 0x20u);

  }
  v7 = -[ASDEventServiceExtension didReceiveInstallationEvent:](self->_extensionInstance, "didReceiveInstallationEvent:", v4);
  v8 = objc_msgSend(v4, "phase");
  if (v8 == objc_msgSend(v4, "terminalPhase"))
  {
    -[ASDEventServiceExtensionRemoteContext completeRequestReturningItems:completionHandler:](self, "completeRequestReturningItems:completionHandler:", 0, 0);
  }
  else if (!v7)
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_19A03B000, v9, OS_LOG_TYPE_INFO, "Canceling request", (uint8_t *)&v11, 2u);
    }

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("ASDErrorDomain"), 908, 0);
    -[ASDEventServiceExtensionRemoteContext cancelRequestWithError:](self, "cancelRequestWithError:", v10);

  }
}

- (ASDEventServiceExtension)extensionInstance
{
  return self->_extensionInstance;
}

- (void)setExtensionInstance:(id)a3
{
  objc_storeStrong((id *)&self->_extensionInstance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionInstance, 0);
}

@end
