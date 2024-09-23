@implementation MSMessageAppExtensionContext

void __84___MSMessageAppExtensionContext__extensionContextHostProtocolAllowedClassesForItems__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS____MSMessageAppExtensionContext;
  objc_msgSendSuper2(&v7, sel__extensionContextHostProtocolAllowedClassesForItems);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C99E20];
  v8[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "unionSet:", v1);
  v5 = objc_msgSend(v4, "copy");
  v6 = (void *)_extensionContextHostProtocolAllowedClassesForItems_allowedClasses;
  _extensionContextHostProtocolAllowedClassesForItems_allowedClasses = v5;

}

void __81___MSMessageAppExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(a1 + 40))
  {
    +[_MSExtensionGlobalState sharedInstance](_MSExtensionGlobalState, "sharedInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setActiveExtensionContext:", *(_QWORD *)(a1 + 32));

  }
}

void __81___MSMessageAppExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14[16];

  if (*(_BYTE *)(a1 + 40)
    && (+[_MSExtensionGlobalState sharedInstance](_MSExtensionGlobalState, "sharedInstance"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "activeExtensionContext"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = *(void **)(a1 + 32),
        v3,
        v2,
        v3 == v4))
  {
    +[_MSExtensionGlobalState sharedInstance](_MSExtensionGlobalState, "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject setActiveExtensionContext:](v5, "setActiveExtensionContext:", 0);
  }
  else
  {
    ms_defaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1DB1A9000, v5, OS_LOG_TYPE_DEFAULT, "_MSExtensionGlobalState: not clearing active extension context because either it is not the primary or a new extension context has already been created.", v14, 2u);
    }
  }

  ms_traceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __81___MSMessageAppExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke_2_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);

}

void __59___MSMessageAppExtensionContext_openURL_completionHandler___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59___MSMessageAppExtensionContext_openURL_completionHandler___block_invoke_2;
  v3[3] = &unk_1EA25C7E8;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __59___MSMessageAppExtensionContext_openURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

uint64_t __59___MSMessageAppExtensionContext_openURL_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __62___MSMessageAppExtensionContext__hostDidBeginDeferredTeardown__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62___MSMessageAppExtensionContext__hostDidBeginDeferredTeardown__block_invoke_2;
  v3[3] = &unk_1EA25C838;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "updateSnapshotWithCompletionBlock:", v3);

}

void __62___MSMessageAppExtensionContext__hostDidBeginDeferredTeardown__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = a2;
    objc_msgSend(v2, "remoteProxy");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_updateSnapshotForNextLaunch:", v3);

  }
}

void __62___MSMessageAppExtensionContext_beginDisablingUserInteraction__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_principalObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disableUserInteraction");

  }
}

void __60___MSMessageAppExtensionContext_endDisablingUserInteraction__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_principalObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enableUserInteraction");

  }
}

void __81___MSMessageAppExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DB1A9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
