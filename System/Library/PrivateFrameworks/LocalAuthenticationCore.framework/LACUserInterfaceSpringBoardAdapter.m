@implementation LACUserInterfaceSpringBoardAdapter

- (LACUserInterfaceSpringBoardAdapter)initWithBundleId:(id)a3 configurationId:(id)a4
{
  id v7;
  id v8;
  LACUserInterfaceSpringBoardAdapter *v9;
  LACUserInterfaceSpringBoardAdapter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACUserInterfaceSpringBoardAdapter;
  v9 = -[LACUserInterfaceSpringBoardAdapter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleId, a3);
    objc_storeStrong((id *)&v10->_configurationId, a4);
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ instance was deallocated"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUserInterfaceSpringBoardAdapter _finishWithError:](self, "_finishWithError:", v4);

  if (-[SBSRemoteAlertHandle isValid](self->_alertHandle, "isValid"))
    -[SBSRemoteAlertHandle invalidate](self->_alertHandle, "invalidate");

  v5.receiver = self;
  v5.super_class = (Class)LACUserInterfaceSpringBoardAdapter;
  -[LACUserInterfaceSpringBoardAdapter dealloc](&v5, sel_dealloc);
}

- (void)terminateWithReason:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  LACLogUI();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[LACUserInterfaceSpringBoardAdapter terminateWithReason:].cold.1();

  -[SBSRemoteAlertHandle invalidate](self->_alertHandle, "invalidate");
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  SBSRemoteAlertHandle *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (SBSRemoteAlertHandle *)a3;
  LACLogUI();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[LACUserInterfaceSpringBoardAdapter remoteAlertHandleDidActivate:]";
    _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  if (self->_alertHandle != v4)
  {
    LACLogUI();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[LACUserInterfaceSpringBoardAdapter remoteAlertHandleDidActivate:].cold.1();

  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  SBSRemoteAlertHandle *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (SBSRemoteAlertHandle *)a3;
  LACLogUI();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[LACUserInterfaceSpringBoardAdapter remoteAlertHandleDidDeactivate:]";
    _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  if (self->_alertHandle == v4)
  {
    -[LACUserInterfaceSpringBoardAdapter _finishWithError:](self, "_finishWithError:", 0);
  }
  else
  {
    LACLogUI();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[LACUserInterfaceSpringBoardAdapter remoteAlertHandleDidActivate:].cold.1();

  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  SBSRemoteAlertHandle *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = (SBSRemoteAlertHandle *)a3;
  LACLogUI();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[LACUserInterfaceSpringBoardAdapter remoteAlertHandle:didInvalidateWithError:]";
    _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  if (self->_alertHandle == v5)
  {
    -[LACUserInterfaceSpringBoardAdapter _finishWithError:](self, "_finishWithError:", 0);
  }
  else
  {
    LACLogUI();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[LACUserInterfaceSpringBoardAdapter remoteAlertHandleDidActivate:].cold.1();

  }
}

+ (id)activationContextWithAuditToken:(id)a3 isAuditTokenApplicationIdentity:(BOOL)a4 isForSiri:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;

  v5 = a5;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setActivatingForSiri:", v5);
  if (v8)
  {
    if (a4)
      objc_msgSend(a1, "_targetPredicateWithLSApplicationInfoData:", v8);
    else
      objc_msgSend(a1, "_targetPredicateWithAuditTokenData:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0B00]), "initWithTargetPredicate:", v10);
    objc_msgSend(v11, "setShouldDismissOnUILock:", 1);
    if (objc_opt_class())
      v12 = +[LACMobileGestalt isIdiomPad](LACMobileGestalt, "isIdiomPad");
    else
      v12 = 0;
    objc_msgSend(v11, "setRequiresFullscreenPresentation:", v12);
    objc_msgSend(v9, "setPresentationTarget:", v11);

  }
  return v9;
}

+ (id)_targetPredicateWithAuditTokenData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", objc_msgSend(objc_retainAutorelease(a3), "bytes"), "{?=[8I]}");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(v3, "getValue:size:", &v10, 32);
    v9[0] = v10;
    v9[1] = v11;
    objc_msgSend(MEMORY[0x24BE0BDB0], "tokenFromAuditToken:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE0BE80], "processHandleForAuditToken:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEB0B18], "predicateForProcess:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_targetPredicateWithLSApplicationInfoData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v10;

  v3 = (void *)MEMORY[0x24BDD1620];
  v4 = a3;
  v10 = 0;
  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v10;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEB0B18], "predicateForLaunchingApplicationIdentity:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LACLogUI();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[LACUserInterfaceSpringBoardAdapter _targetPredicateWithLSApplicationInfoData:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (id)_activationContextForRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "clientAuditTokenData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isAuditTokenApplicationIdentity");
  v7 = objc_msgSend(v3, "isForSiri");

  objc_msgSend(v4, "activationContextWithAuditToken:isAuditTokenApplicationIdentity:isForSiri:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_processRequest:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id handler;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v16 = a3;
  if (self->_handler)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ instance is already in use"), self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACUserInterfaceSpringBoardAdapter _finishWithError:](self, "_finishWithError:", v7);
  }
  else
  {
    v8 = _Block_copy(a4);
    handler = self->_handler;
    self->_handler = v8;

    objc_msgSend(MEMORY[0x24BE80CA0], "identityForApplicationJobLabel:", self->_bundleId);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0AE0]), "initWithSceneProvidingProcess:configurationIdentifier:", v6, self->_configurationId);
    v10 = objc_alloc_init(MEMORY[0x24BEB0AD8]);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __65__LACUserInterfaceSpringBoardAdapter__processRequest_completion___block_invoke;
    v17[3] = &unk_2510C2068;
    v11 = v16;
    v18 = v11;
    __65__LACUserInterfaceSpringBoardAdapter__processRequest_completion___block_invoke((uint64_t)v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUserInfo:", v12);

    -[LACUserInterfaceSpringBoardAdapter _activationContextForRequest:](self, "_activationContextForRequest:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(MEMORY[0x24BEB0AF0], "newHandleWithDefinition:configurationContext:", v7, v10);
    if (v14)
    {
      objc_storeStrong((id *)&self->_alertHandle, v14);
      -[SBSRemoteAlertHandle registerObserver:](self->_alertHandle, "registerObserver:", self);
      -[SBSRemoteAlertHandle activateWithContext:](self->_alertHandle, "activateWithContext:", v13);
    }
    else
    {
      +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -4, CFSTR("Could not start remote alert"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACUserInterfaceSpringBoardAdapter _finishWithError:](self, "_finishWithError:", v15);

    }
  }

}

id __65__LACUserInterfaceSpringBoardAdapter__processRequest_completion___block_invoke(uint64_t a1)
{
  LACUserInterfaceRequestCoder *v2;
  void *v3;

  v2 = objc_alloc_init(LACUserInterfaceRequestCoder);
  -[LACUserInterfaceRequestCoder encode:](v2, "encode:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_finishWithError:(id)a3
{
  id v4;
  id handler;
  void (**v6)(_QWORD, _QWORD);
  id v7;
  NSObject *v8;

  v4 = a3;
  handler = self->_handler;
  if (handler)
  {
    v6 = (void (**)(_QWORD, _QWORD))objc_msgSend(handler, "copy");
    v7 = self->_handler;
    self->_handler = 0;

    ((void (**)(_QWORD, id))v6)[2](v6, v4);
  }
  else
  {
    LACLogDTOSensor();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[LACUserInterfaceSpringBoardAdapter _finishWithError:].cold.1();

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_alertHandle, 0);
  objc_storeStrong((id *)&self->_configurationId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)terminateWithReason:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "Terminating user interface with reason: '%{public}@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)remoteAlertHandleDidActivate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "Ignoring activation callback from unknown handle: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_targetPredicateWithLSApplicationInfoData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "Failed to decode LSApplicationIdentity: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_finishWithError:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  _os_log_debug_impl(&dword_2409DC000, v0, OS_LOG_TYPE_DEBUG, "Ignoring redundant finish request (%{public}@)", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
