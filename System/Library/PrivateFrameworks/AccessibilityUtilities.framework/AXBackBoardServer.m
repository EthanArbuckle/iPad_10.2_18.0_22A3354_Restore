@implementation AXBackBoardServer

+ (id)server
{
  id v2;

  if (_AXSIsNonUIBuild())
    goto LABEL_5;
  if (AXIsASVAssetViewer_onceToken != -1)
    dispatch_once(&AXIsASVAssetViewer_onceToken, &__block_literal_global_302);
  if (AXIsASVAssetViewer_sIsASVAssetViewer)
  {
LABEL_5:
    v2 = 0;
  }
  else
  {
    if (server_onceToken_2 != -1)
      dispatch_once(&server_onceToken_2, &__block_literal_global_10);
    v2 = (id)server_Server_2;
  }
  return v2;
}

void __27__AXBackBoardServer_server__block_invoke()
{
  AXBackBoardServer *v0;
  void *v1;

  v0 = objc_alloc_init(AXBackBoardServer);
  v1 = (void *)server_Server_2;
  server_Server_2 = (uint64_t)v0;

}

- (AXBackBoardServer)init
{
  AXBackBoardServer *v2;
  NSMutableArray *v3;
  NSMutableArray *eventListeners;
  AXBackBoardServer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXBackBoardServer;
  v2 = -[AXServer init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    eventListeners = v2->_eventListeners;
    v2->_eventListeners = v3;

    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AXServer client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPortDeathHandler:", 0);

  v4.receiver = self;
  v4.super_class = (Class)AXBackBoardServer;
  -[AXServer dealloc](&v4, sel_dealloc);
}

- (id)_serviceName
{
  return CFSTR("com.apple.accessibility.AXBackBoardServer");
}

- (void)registerGestureConflictWithZoom:(id)a3
{
  id v4;
  void *v5;
  AXIPCMessage *v6;

  v4 = a3;
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v6 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2000, v4);

  -[AXServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendSimpleMessage:", v6);

}

- (void)adjustSystemZoom:(int)a3
{
  uint64_t v3;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v3 = *(_QWORD *)&a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v5 = [AXIPCMessage alloc];
  v10 = CFSTR("adjustment");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 2024, v7);

  -[AXServer client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendSimpleMessage:", v8);

}

- (void)setLockScreenDimTimerEnabled:(BOOL)a3
{
  _BOOL8 v3;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v3 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v5 = [AXIPCMessage alloc];
  v10 = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 2019, v7);

  -[AXServer client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendSimpleMessage:", v8);

}

- (void)registerSiriViewServicePID:(int)a3
{
  uint64_t v3;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v3 = *(_QWORD *)&a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  if (-[AXServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v5 = [AXIPCMessage alloc];
    v10 = CFSTR("pid");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 2016, v7);

    -[AXServer client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendSimpleMessage:", v8);

  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __48__AXBackBoardServer_registerSiriViewServicePID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerSiriViewServicePID:", *(unsigned int *)(a1 + 40));
}

- (int)accessibilityAssistiveTouchPID
{
  AXIPCMessage *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2063, 0);
  -[AXServer client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendMessage:withError:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("pid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  return v8;
}

- (int)accessibilityFullKeyboardAccessDaemonPID
{
  AXIPCMessage *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2070, 0);
  -[AXServer client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendMessage:withError:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("pid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  return v8;
}

- (int)accessibilityUIServicePID
{
  AXIPCMessage *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2033, 0);
  -[AXServer client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendMessage:withError:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("pid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  return v8;
}

- (void)registerFullKeyboardAccessDaemonPID:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  AXIPCMessage *v6;
  void *v7;
  void *v8;
  AXIPCMessage *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v3 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (-[AXServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    FKALogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v3;
      _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_INFO, "Registering FKA pid: %d", buf, 8u);
    }

    v6 = [AXIPCMessage alloc];
    v11 = CFSTR("pid");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AXIPCMessage initWithKey:payload:](v6, "initWithKey:payload:", 2071, v8);

    -[AXServer client](self, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendSimpleMessage:", v9);

  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __57__AXBackBoardServer_registerFullKeyboardAccessDaemonPID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerAccessibilityUIServicePID:", *(unsigned int *)(a1 + 40));
}

- (void)registerAccessibilityUIServicePID:(int)a3
{
  uint64_t v3;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v3 = *(_QWORD *)&a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  if (-[AXServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v5 = [AXIPCMessage alloc];
    v10 = CFSTR("pid");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 2015, v7);

    -[AXServer client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendSimpleMessage:", v8);

  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __55__AXBackBoardServer_registerAccessibilityUIServicePID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerAccessibilityUIServicePID:", *(unsigned int *)(a1 + 40));
}

- (int)hearingAidServerPID
{
  AXIPCMessage *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2073, 0);
  -[AXServer client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendMessage:withError:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("pid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  return v8;
}

- (void)registerHearingAidServerPID:(int)a3
{
  uint64_t v3;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v3 = *(_QWORD *)&a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  if (-[AXServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v5 = [AXIPCMessage alloc];
    v10 = CFSTR("pid");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 2017, v7);

    -[AXServer client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendSimpleMessage:", v8);

  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __49__AXBackBoardServer_registerHearingAidServerPID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerHearingAidServerPID:", *(unsigned int *)(a1 + 40));
}

- (void)setInPreboardMode:(BOOL)a3
{
  _BOOL8 v3;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v3 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  if (-[AXServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v5 = [AXIPCMessage alloc];
    v10 = CFSTR("inPreboardMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 2028, v7);

    -[AXServer client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendSimpleMessage:", v8);

  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __39__AXBackBoardServer_setInPreboardMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInPreboardMode:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setInCheckerBoardMode:(BOOL)a3
{
  _BOOL8 v3;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v3 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  if (-[AXServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v5 = [AXIPCMessage alloc];
    v10 = CFSTR("inCheckerBoardMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 2064, v7);

    -[AXServer client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendSimpleMessage:", v8);

  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __43__AXBackBoardServer_setInCheckerBoardMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInCheckerBoardMode:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_shouldDispatchLocally
{
  if (_shouldDispatchLocally_onceToken_0 != -1)
    dispatch_once(&_shouldDispatchLocally_onceToken_0, &__block_literal_global_24_0);
  return _shouldDispatchLocally_IsBackboard;
}

uint64_t __43__AXBackBoardServer__shouldDispatchLocally__block_invoke()
{
  uint64_t result;

  result = AXProcessIsBackboard();
  _shouldDispatchLocally_IsBackboard = result;
  return result;
}

- (id)backboardServiceInstance
{
  void *v2;
  void *v3;
  id v4;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("AXBackBoardServerInstance")), "safeValueForKey:", CFSTR("backBoardServerInstanceIfExists"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = &unk_1EE0742D0;
  if ((objc_msgSend(v2, "conformsToProtocol:", v3) & 1) != 0)
  {
    v4 = v2;
  }
  else
  {
    protocol_getName((Protocol *)v3);
    _AXLogWithFacility();
    v4 = 0;
  }

  return v4;
}

- (BOOL)inPreboardMode
{
  AXIPCMessage *v3;
  char v4;
  BOOL v5;

  if (-[AXBackBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXBackBoardServer backboardServiceInstance](self, "backboardServiceInstance");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    v4 = -[AXIPCMessage _inPreBoardMode](v3, "_inPreBoardMode");
  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2029, 0);
    v4 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }
  v5 = v4;

  return v5;
}

- (BOOL)inCheckerBoardMode
{
  AXIPCMessage *v3;
  char v4;
  BOOL v5;

  if (-[AXBackBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXBackBoardServer backboardServiceInstance](self, "backboardServiceInstance");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    v4 = -[AXIPCMessage _inCheckerBoardMode](v3, "_inCheckerBoardMode");
  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2065, 0);
    v4 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }
  v5 = v4;

  return v5;
}

- (void)setSessionIsLoginSession:(BOOL)a3
{
  _BOOL8 v3;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v3 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  if (-[AXServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v5 = [AXIPCMessage alloc];
    v10 = CFSTR("sesionIsLoginSession");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 2044, v7);

    -[AXServer client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendSimpleMessage:", v8);

  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __46__AXBackBoardServer_setSessionIsLoginSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSessionIsLoginSession:", *(unsigned __int8 *)(a1 + 40));
}

- (void)sessionIsLoginSessionWithResult:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  uint64_t v6;
  AXIPCMessage *v7;
  _QWORD v8[4];
  void (**v9)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (-[AXBackBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXBackBoardServer backboardServiceInstance](self, "backboardServiceInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_sessionIsLoginSession");
    if (v4)
      v4[2](v4, v6);

  }
  else
  {
    v7 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2045, 0);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__AXBackBoardServer_sessionIsLoginSessionWithResult___block_invoke;
    v8[3] = &unk_1E24C5458;
    v9 = v4;
    -[AXServer sendAsynchronousMessage:replyOnQueue:handler:](self, "sendAsynchronousMessage:replyOnQueue:handler:", v7, MEMORY[0x1E0C80D38], v8);

  }
}

void __53__AXBackBoardServer_sessionIsLoginSessionWithResult___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("result"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v6;
  }
  else
  {

    v4 = 0;
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v7 = v4;
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, objc_msgSend(v4, "BOOLValue"));
    v4 = v7;
  }

}

- (void)registerAssistiveTouchPID:(int)a3
{
  uint64_t v3;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v3 = *(_QWORD *)&a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  if (-[AXServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v5 = [AXIPCMessage alloc];
    v10 = CFSTR("pid");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 2014, v7);

    -[AXServer client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendSimpleMessage:", v8);

  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __47__AXBackBoardServer_registerAssistiveTouchPID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerAssistiveTouchPID:", *(unsigned int *)(a1 + 40));
}

- (void)registerLiveCaptionsPID:(int)a3
{
  uint64_t v3;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v3 = *(_QWORD *)&a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  if (-[AXServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v5 = [AXIPCMessage alloc];
    v10 = CFSTR("pid");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 2018, v7);

    -[AXServer client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendSimpleMessage:", v8);

  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __45__AXBackBoardServer_registerLiveCaptionsPID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerLiveCaptionsPID:", *(unsigned int *)(a1 + 40));
}

- (int)accessibilityLiveCaptionsPID
{
  AXIPCMessage *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2078, 0);
  -[AXServer client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendMessage:withError:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("pid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  return v8;
}

- (BOOL)invertColorsEnabled
{
  return _AXSInvertColorsEnabled() != 0;
}

- (void)setInvertColorsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v3 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v5 = [AXIPCMessage alloc];
  v10 = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 2025, v7);

  -[AXServer client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendSimpleMessage:withError:", v8, 0);

}

- (void)postEvent:(id)a3 afterNamedTap:(id)a4 includeTaps:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  AXIPCMessage *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = v10;
  if (v14)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("record"));
  if (v9)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("namedTaps"));
  if (v8)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("afterNamedTap"));
  v12 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2009, v11);
  -[AXServer client](self, "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendSimpleMessage:", v12);

}

- (void)postEvent:(id)a3 systemEvent:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  AXIPCMessage *v9;
  void *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v6 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithObject:forKey:", v7, CFSTR("systemEvent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("record"));
  v9 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2009, v8);
  -[AXServer client](self, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendSimpleMessage:", v9);

}

- (unsigned)contextIdForPosition:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];
  NSPoint v16;

  y = a3.y;
  x = a3.x;
  v15[1] = *MEMORY[0x1E0C80C00];
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v14 = CFSTR("displayPoint");
  v16.x = x;
  v16.y = y;
  NSStringFromPoint(v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2032, v7);
  -[AXServer client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendMessage:withError:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("result"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "unsignedIntValue");

  return v9;
}

- (unsigned)contextIdHostingContextId:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  AXIPCMessage *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v3 = *(_QWORD *)&a3;
  v14[1] = *MEMORY[0x1E0C80C00];
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v13 = CFSTR("contextId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2031, v6);
  -[AXServer client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendMessage:withError:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("result"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v11, "unsignedIntValue");

  return v8;
}

- (CGRect)convertFrame:(CGRect)a3 fromContextId:(unsigned int)a4 toContextId:(unsigned int)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[AXBackBoardServer convertFrame:fromContextId:toContextId:displayId:](self, "convertFrame:fromContextId:toContextId:displayId:", *(_QWORD *)&a4, *(_QWORD *)&a5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)convertFrame:(CGRect)a3 toContextId:(unsigned int)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[AXBackBoardServer convertFrame:toContextId:displayId:](self, "convertFrame:toContextId:displayId:", *(_QWORD *)&a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)convertFrame:(CGRect)a3 fromContextId:(unsigned int)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[AXBackBoardServer convertFrame:fromContextId:displayId:](self, "convertFrame:fromContextId:displayId:", *(_QWORD *)&a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)convertFrame:(CGRect)a3 fromContextId:(unsigned int)a4 toContextId:(unsigned int)a5 displayId:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  AXIPCMessage *v19;
  void *v20;
  void *v21;
  id v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  void *v27;
  NSString *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  _QWORD v36[5];
  NSRect v37;
  NSRect v38;
  NSRect v39;
  CGRect result;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v36[4] = *MEMORY[0x1E0C80C00];
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v35[0] = CFSTR("fromContextId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v14;
  v35[1] = CFSTR("toContextId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v15;
  v35[2] = CFSTR("displayId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v16;
  v35[3] = CFSTR("frame");
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  NSStringFromRect(v37);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2042, v18);
  -[AXServer client](self, "client");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v20, "sendMessage:withError:", v19, &v34);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v34;

  if (v22)
  {
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    NSStringFromRect(v38);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    _AXLogWithFacility();

    v23 = *MEMORY[0x1E0C9D648];
    v24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    objc_msgSend(v21, "payload");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("frame"));
    v28 = (NSString *)objc_claimAutoreleasedReturnValue();
    v39 = NSRectFromString(v28);
    v23 = v39.origin.x;
    v24 = v39.origin.y;
    v25 = v39.size.width;
    v26 = v39.size.height;

  }
  v29 = v23;
  v30 = v24;
  v31 = v25;
  v32 = v26;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (CGRect)convertFrame:(CGRect)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  AXIPCMessage *v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  _QWORD v29[3];
  _QWORD v30[4];
  NSRect v31;
  NSRect v32;
  CGRect result;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v30[3] = *MEMORY[0x1E0C80C00];
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v29[0] = CFSTR("contextId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v12;
  v29[1] = CFSTR("displayId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v13;
  v29[2] = CFSTR("frame");
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  NSStringFromRect(v31);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2008, v15);
  -[AXServer client](self, "client");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendMessage:withError:", v16, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "payload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", CFSTR("frame"));
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  v32 = NSRectFromString(v20);
  v21 = v32.origin.x;
  v22 = v32.origin.y;
  v23 = v32.size.width;
  v24 = v32.size.height;

  v25 = v21;
  v26 = v22;
  v27 = v23;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)convertFrame:(CGRect)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  double height;
  double width;
  double y;
  double x;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  AXIPCMessage *v27;
  void *v28;
  void *v29;
  void *v30;
  NSString *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  _QWORD v36[3];
  _QWORD v37[4];
  NSRect v38;
  NSRect v39;
  CGRect result;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v37[3] = *MEMORY[0x1E0C80C00];
  if (-[AXBackBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXBackBoardServer backboardServiceInstance](self, "backboardServiceInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = &unk_1EE074330;
    if (objc_msgSend(v13, "conformsToProtocol:", v14))
    {
      objc_msgSend(v13, "convertFrame:fromContextId:displayId:", v6, 0, x, y, width, height);
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
    }
    else
    {
      protocol_getName((Protocol *)v14);
      _AXLogWithFacility();
      v16 = *MEMORY[0x1E0C9D628];
      v18 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v20 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v22 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    }

  }
  else
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v36[0] = CFSTR("contextId");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v23;
    v36[1] = CFSTR("displayId");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v24;
    v36[2] = CFSTR("frame");
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    NSStringFromRect(v38);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2007, v26);
    -[AXServer client](self, "client");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "sendMessage:withError:", v27, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "payload");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKey:", CFSTR("frame"));
    v31 = (NSString *)objc_claimAutoreleasedReturnValue();
    v39 = NSRectFromString(v31);
    v16 = v39.origin.x;
    v18 = v39.origin.y;
    v20 = v39.size.width;
    v22 = v39.size.height;

  }
  v32 = v16;
  v33 = v18;
  v34 = v20;
  v35 = v22;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromContextId:(unsigned int)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[AXBackBoardServer convertPoint:fromContextId:displayId:](self, "convertPoint:fromContextId:displayId:", *(_QWORD *)&a4, 0, a3.x, a3.y);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toContextId:(unsigned int)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[AXBackBoardServer convertPoint:toContextId:displayId:](self, "convertPoint:toContextId:displayId:", *(_QWORD *)&a4, 0, a3.x, a3.y);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  CGFloat y;
  CGFloat x;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  AXIPCMessage *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  NSPoint v19;
  double v20;
  double v21;
  _QWORD v22[3];
  _QWORD v23[4];
  NSPoint v24;
  CGPoint result;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  y = a3.y;
  x = a3.x;
  v23[3] = *MEMORY[0x1E0C80C00];
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v22[0] = CFSTR("contextId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v10;
  v22[1] = CFSTR("displayId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v11;
  v22[2] = CFSTR("point");
  v24.x = x;
  v24.y = y;
  NSStringFromPoint(v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2068, v13);
  -[AXServer client](self, "client");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sendMessage:withError:", v14, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "payload");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("point"));
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  v19 = NSPointFromString(v18);

  v20 = v19.x;
  v21 = v19.y;
  result.y = v21;
  result.x = v20;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  CGFloat y;
  CGFloat x;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  AXIPCMessage *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  NSPoint v19;
  double v20;
  double v21;
  _QWORD v22[3];
  _QWORD v23[4];
  NSPoint v24;
  CGPoint result;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  y = a3.y;
  x = a3.x;
  v23[3] = *MEMORY[0x1E0C80C00];
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v22[0] = CFSTR("contextId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v10;
  v22[1] = CFSTR("displayId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v11;
  v22[2] = CFSTR("point");
  v24.x = x;
  v24.y = y;
  NSStringFromPoint(v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2069, v13);
  -[AXServer client](self, "client");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sendMessage:withError:", v14, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "payload");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("point"));
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  v19 = NSPointFromString(v18);

  v20 = v19.x;
  v21 = v19.y;
  result.y = v21;
  result.x = v20;
  return result;
}

- (void)userEventOccurred
{
  void *v3;
  AXIPCMessage *v4;

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2011, 0);
  -[AXServer client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendSimpleMessage:", v4);

}

- (void)setCapsLockLightOn:(BOOL)a3
{
  _BOOL8 v3;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v3 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v5 = [AXIPCMessage alloc];
  v10 = CFSTR("on");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 2043, v7);

  -[AXServer client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendSimpleMessage:", v8);

}

- (void)setHearingAidControlIsVisible:(BOOL)a3
{
  _BOOL8 v3;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v3 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v5 = [AXIPCMessage alloc];
  v10 = CFSTR("result");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 2023, v7);

  -[AXServer client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendSimpleMessage:", v8);

}

- (void)setSwitchControlRendersDeviceUnusable:(BOOL)a3
{
  _BOOL8 v3;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v3 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v5 = [AXIPCMessage alloc];
  v10 = CFSTR("result");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 2036, v7);

  -[AXServer client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendSimpleMessage:", v8);

}

- (void)setSwitchControlHasScreenSwitch:(BOOL)a3
{
  _BOOL8 v3;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v3 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v5 = [AXIPCMessage alloc];
  v10 = CFSTR("result");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 2062, v7);

  -[AXServer client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendSimpleMessage:", v8);

}

- (id)accessibilityPreferenceAsMobile:(id)a3 domain:(id)a4
{
  id v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  dispatch_semaphore_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v28;
  _QWORD v29[4];
  NSObject *v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD aBlock[4];
  id v40;
  AXBackBoardServer *v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  _QWORD v46[2];
  _QWORD v47[3];

  v47[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  if (v6)
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v46[0] = CFSTR("preference");
    v46[1] = CFSTR("domain");
    v8 = &stru_1E24CAB08;
    if (v7)
      v8 = v7;
    v47[0] = v6;
    v47[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__AXBackBoardServer_accessibilityPreferenceAsMobile_domain___block_invoke;
    aBlock[3] = &unk_1E24C5F58;
    v11 = v9;
    v40 = v11;
    v41 = self;
    v12 = _Block_copy(aBlock);
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__5;
    v37 = __Block_byref_object_dispose__5;
    v38 = 0;
    v13 = dispatch_semaphore_create(0);
    if (-[AXBackBoardServer preferenceRetrievalRequiresValidConnection](self, "preferenceRetrievalRequiresValidConnection"))
    {
      AXLogBackboardServer();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v6;
        _os_log_impl(&dword_18C62B000, v14, OS_LOG_TYPE_DEFAULT, "Requiring valid connection before requesting preference %@", buf, 0xCu);
      }

      -[AXServer client](self, "client");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v10;
      v29[1] = 3221225472;
      v29[2] = __60__AXBackBoardServer_accessibilityPreferenceAsMobile_domain___block_invoke_166;
      v29[3] = &unk_1E24C5F80;
      v32 = &v33;
      v31 = v12;
      v16 = v13;
      v30 = v16;
      objc_msgSend(v15, "establishConnectionWithTimeout:completion:", v29, 10000.0);

      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
      AXLogBackboardServer();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)v34[5], "payload");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("value"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v43 = v19;
        _os_log_impl(&dword_18C62B000, v17, OS_LOG_TYPE_DEFAULT, "Made connection and result: %@", buf, 0xCu);

      }
      v20 = v31;
    }
    else
    {
      v28 = 0;
      (*((void (**)(void *, id *))v12 + 2))(v12, &v28);
      v22 = objc_claimAutoreleasedReturnValue();
      v20 = v28;
      v23 = (void *)v34[5];
      v34[5] = v22;

      AXLogBackboardServer();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = (void *)v34[5];
        *(_DWORD *)buf = 138412546;
        v43 = v25;
        v44 = 2112;
        v45 = v20;
        _os_log_impl(&dword_18C62B000, v24, OS_LOG_TYPE_INFO, "Fetched value: %@ with error: %@", buf, 0x16u);
      }

    }
    objc_msgSend((id)v34[5], "payload");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("value"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v33, 8);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

id __60__AXBackBoardServer_accessibilityPreferenceAsMobile_domain___block_invoke(uint64_t a1, uint64_t a2)
{
  AXIPCMessage *v4;
  void *v5;
  void *v6;

  v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2067, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:withError:", v4, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

intptr_t __60__AXBackBoardServer_accessibilityPreferenceAsMobile_domain___block_invoke_166(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  AXLogBackboardServer();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_impl(&dword_18C62B000, v4, OS_LOG_TYPE_DEFAULT, "Establish connect? %@", buf, 0xCu);

  }
  v6 = 21;
  do
  {
    if (!--v6)
      break;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v7;

    AXLogBackboardServer();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_18C62B000, v11, OS_LOG_TYPE_DEFAULT, "Fetched value: %@ with error: %@", buf, 0x16u);
    }

  }
  while (v8);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setAccessibilityPreferenceAsMobile:(id)a3 value:(id)a4 notification:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  AXIPCMessage *v13;
  void *v14;
  id v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    if (v9)
    {
      if (v10)
      {
LABEL_4:
        -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
        v16[0] = CFSTR("preference");
        v16[1] = CFSTR("value");
        v17[0] = v8;
        v17[1] = v9;
        v16[2] = CFSTR("notification");
        v17[2] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2027, v12);
        -[AXServer client](self, "client");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (id)objc_msgSend(v14, "sendMessage:withError:", v13, 0);

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v11)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
LABEL_5:

}

- (void)setZoomInitialFocusRect:(CGRect)a3 fromContext:(unsigned int)a4
{
  uint64_t v4;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v10;
  void *v11;
  void *v12;
  AXIPCMessage *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];
  NSRect v17;

  v4 = *(_QWORD *)&a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16[2] = *MEMORY[0x1E0C80C00];
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v15[0] = CFSTR("rect");
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  NSStringFromRect(v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("contextId");
  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2040, v12);
  -[AXServer client](self, "client");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sendSimpleMessage:", v13);

}

- (CGRect)zoomInitialFocusRectWithQueryingContext:(unsigned int)a3
{
  uint64_t v3;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  void *v9;
  void *v10;
  id v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v16;
  NSString *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  const __CFString *v23;
  _QWORD v24[2];
  NSRect v25;
  CGRect result;

  v3 = *(_QWORD *)&a3;
  v24[1] = *MEMORY[0x1E0C80C00];
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v5 = [AXIPCMessage alloc];
  v23 = CFSTR("contextId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 2041, v7);

  -[AXServer client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v9, "sendMessage:withError:", v8, &v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v22;

  if (v11)
  {
    _AXLogWithFacility();
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    objc_msgSend(v10, "payload");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("rect"));
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    v25 = NSRectFromString(v17);
    x = v25.origin.x;
    y = v25.origin.y;
    width = v25.size.width;
    height = v25.size.height;

  }
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (BOOL)tripleClickHomeButtonPress
{
  AXBackBoardServer *v2;
  AXIPCMessage *v3;

  v2 = self;
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2055, 0);
  LOBYTE(v2) = -[AXServer sendSimpleMessageWithResult:](v2, "sendSimpleMessageWithResult:", v3);

  return (char)v2;
}

- (void)homeClickSwallowedForGuidedAccess
{
  AXIPCMessage *v3;

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2056, 0);
  -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v3);

}

- (id)_springboardParametersForGuidedAccessAvailability
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  +[AXSpringBoardServer server](AXSpringBoardServer, "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppSwitcherVisible");
  v4 = objc_msgSend(v2, "isSystemAppFrontmostExludingSiri");
  v5 = objc_msgSend(v2, "isSyncingRestoringResettingOrUpdating");
  v11[0] = CFSTR("isSpringBoardFrontmost");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v11[1] = CFSTR("isSyncingRestoringResettingOrUpdating");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  v11[2] = CFSTR("isAppSwitcherVisible");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isGuidedAccessActive
{
  AXBackBoardServer *v2;
  AXIPCMessage *v3;

  v2 = self;
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2030, 0);
  LOBYTE(v2) = -[AXServer sendSimpleMessageWithResult:](v2, "sendSimpleMessageWithResult:", v3);

  return (char)v2;
}

- (BOOL)isGuidedAccessInWorkspace
{
  AXBackBoardServer *v2;
  AXIPCMessage *v3;

  v2 = self;
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2034, 0);
  LOBYTE(v2) = -[AXServer sendSimpleMessageWithResult:](v2, "sendSimpleMessageWithResult:", v3);

  return (char)v2;
}

- (id)guidedAccessEffectiveAppBundleIdentifier
{
  AXIPCMessage *v3;
  void *v4;
  id v5;

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2060, 0);
  -[AXServer sendSimpleMessageWithObjectResult:](self, "sendSimpleMessageWithObjectResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v5 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;

  return v5;
}

- (void)guidedAccessEffectiveAppBundleIdentifier:(id)a3
{
  id v4;
  AXIPCMessage *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v5 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2060, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__AXBackBoardServer_guidedAccessEffectiveAppBundleIdentifier___block_invoke;
  v7[3] = &unk_1E24C5458;
  v8 = v4;
  v6 = v4;
  -[AXServer sendAsynchronousMessage:replyOnQueue:handler:](self, "sendAsynchronousMessage:replyOnQueue:handler:", v5, MEMORY[0x1E0C80D38], v7);

}

void __62__AXBackBoardServer_guidedAccessEffectiveAppBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("result"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v6;
  }
  else
  {

    v4 = 0;
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v7 = v4;
    (*(void (**)(void))(v5 + 16))();
    v4 = v7;
  }

}

- (id)performGuidedAccessAutomationCommand:(id)a3 error:(id *)a4
{
  id v6;
  AXIPCMessage *v7;
  void *v8;
  AXIPCMessage *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v7 = [AXIPCMessage alloc];
  v17 = CFSTR("command");
  v18[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[AXIPCMessage initWithKey:payload:](v7, "initWithKey:payload:", 2037, v8);
  -[AXServer sendMessage:](self, "sendMessage:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    objc_msgSend(v10, "payload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("error"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_retainAutorelease(v12);
    *a4 = v13;

  }
  objc_msgSend(v10, "payload");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("result"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (unint64_t)guidedAccessAvailability
{
  AXIPCMessage *v3;
  void *v4;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  unint64_t v10;
  void *v11;
  id v13;

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v3 = [AXIPCMessage alloc];
  -[AXBackBoardServer _springboardParametersForGuidedAccessAvailability](self, "_springboardParametersForGuidedAccessAvailability");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 2020, v4);

  -[AXServer client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v6, "sendMessage:withError:", v5, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;

  if (v8)
  {
    GAXLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AXBackBoardServer guidedAccessAvailability].cold.1();
    v10 = 12;
  }
  else
  {
    objc_msgSend(v7, "payload");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v9, "objectForKey:", CFSTR("availability"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "unsignedIntegerValue");

  }
  return v10;
}

- (void)_sendRequestGuidedAccessSessionMessage:(id)a3 numberOfRetryAttempts:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  -[AXServer client](self, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__AXBackBoardServer__sendRequestGuidedAccessSessionMessage_numberOfRetryAttempts_completion___block_invoke;
  v13[3] = &unk_1E24C5FD0;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "sendAsyncMessage:withReplyHandler:", v12, v13);

}

void __93__AXBackBoardServer__sendRequestGuidedAccessSessionMessage_numberOfRetryAttempts_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    GAXLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __93__AXBackBoardServer__sendRequestGuidedAccessSessionMessage_numberOfRetryAttempts_completion___block_invoke_cold_1();

    goto LABEL_5;
  }
  objc_msgSend(v5, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("AXGuidedAccessPayloadKeyRequestingAppSetGAXEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v5, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AXGuidedAccessPayloadKeyIsTemporaryFailure"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if ((v10 & 1) != 0 || !v13 || !*(_QWORD *)(a1 + 56))
  {
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_6;
  }
  GAXLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 134217984;
    v19 = v15;
    _os_log_impl(&dword_18C62B000, v14, OS_LOG_TYPE_INFO, "Attempting to request session again after temporary failure. Attempts remaining: %lu", buf, 0xCu);
  }

  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  AXPerformBlockOnMainThreadAfterDelay();

LABEL_6:
}

uint64_t __93__AXBackBoardServer__sendRequestGuidedAccessSessionMessage_numberOfRetryAttempts_completion___block_invoke_191(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendRequestGuidedAccessSessionMessage:numberOfRetryAttempts:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56) - 1, *(_QWORD *)(a1 + 48));
}

- (void)requestGuidedAccessSessionStartWithConfigurationDictionary:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AXIPCMessage *v9;
  AXIPCMessage *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v11[0] = CFSTR("AXGuidedAccessPayloadKeyRequestingAppSetGAXEnabled");
  v11[1] = CFSTR("AXGuidedAccessPayloadKeyGAXConfiguration");
  v12[0] = MEMORY[0x1E0C9AAB0];
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [AXIPCMessage alloc];

  v10 = -[AXIPCMessage initWithKey:payload:](v9, "initWithKey:payload:", 2022, v8);
  -[AXBackBoardServer _sendRequestGuidedAccessSessionMessage:numberOfRetryAttempts:completion:](self, "_sendRequestGuidedAccessSessionMessage:numberOfRetryAttempts:completion:", v10, 5, v6);

}

- (void)requestGuidedAccessSessionEndWithCompletion:(id)a3
{
  id v4;
  void *v5;
  AXIPCMessage *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v11 = CFSTR("AXGuidedAccessPayloadKeyRequestingAppSetGAXEnabled");
  v12[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2022, v5);
  -[AXServer client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__AXBackBoardServer_requestGuidedAccessSessionEndWithCompletion___block_invoke;
  v9[3] = &unk_1E24C5458;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "sendAsyncMessage:withReplyHandler:", v6, v9);

}

void __65__AXBackBoardServer_requestGuidedAccessSessionEndWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;

  v5 = a3;
  if (v5)
  {
    GAXLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __93__AXBackBoardServer__sendRequestGuidedAccessSessionMessage_numberOfRetryAttempts_completion___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(a2, "payload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("AXGuidedAccessPayloadKeyRequestingAppSetGAXEnabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "BOOLValue");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)isGuidedAccessSelfLockedToApp:(id)a3
{
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  char v9;
  void *v10;
  id v12;

  if (!a3)
    return 0;
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2021, 0);
  -[AXServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "sendMessage:withError:", v4, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;

  if (v7)
  {
    GAXLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AXBackBoardServer isGuidedAccessSelfLockedToApp:].cold.1();
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "payload");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v8, "objectForKey:", CFSTR("AXGuidedAccessPayloadKeyRequestingAppSetGAXEnabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "BOOLValue");

  }
  return v9;
}

- (BOOL)isGuidedAccessUnmanagedSelfLocked
{
  AXIPCMessage *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  char v8;
  void *v9;
  id v11;

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2054, 0);
  -[AXServer client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v4, "sendMessage:withError:", v3, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;

  if (v6)
  {
    GAXLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AXBackBoardServer isGuidedAccessUnmanagedSelfLocked].cold.1();
    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "payload");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("result"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "BOOLValue");

  }
  return v8;
}

- (BOOL)isRestrictedForAAC
{
  AXBackBoardServer *v2;
  AXIPCMessage *v3;

  v2 = self;
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2072, 0);
  LOBYTE(v2) = -[AXServer sendSimpleMessageWithResult:](v2, "sendSimpleMessageWithResult:", v3);

  return (char)v2;
}

- (void)toggleGuidedAccess
{
  NSObject *v3;
  AXIPCMessage *v4;
  void *v5;
  uint8_t v6[16];

  GAXLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_18C62B000, v3, OS_LOG_TYPE_DEFAULT, "Toggle Guided Access", v6, 2u);
  }

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2058, 0);
  -[AXServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendSimpleMessage:", v4);

}

- (id)guidedAccessIgnoredRegions
{
  AXIPCMessage *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2035, 0);
  -[AXServer sendSimpleMessageWithObjectResult:](self, "sendSimpleMessageWithObjectResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = AX_CGPathCreateWithDataRepresentation(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10));
          if (v11)
          {
            v12 = (const void *)v11;
            objc_msgSend(v5, "addObject:", v11, (_QWORD)v14);
            CFRelease(v12);
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)currentGuidedAccessModeAndSessionApp:(id *)a3
{
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v5 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2061, 0);
  -[AXServer sendMessage:](self, "sendMessage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AXGuidedAccessPayloadKeyGAXMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (a3)
  {
    if (v9)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AXGuidedAccessPayloadKeySessionApp"));
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v10;

    }
    else
    {
      *a3 = 0;
    }
  }

  return v9;
}

- (void)jetsamThirdPartyApps
{
  void *v3;
  AXIPCMessage *v4;

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2026, 0);
  -[AXServer client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendSimpleMessage:", v4);

}

- (void)disableBrightnessFilters
{
  AXIPCMessage *v3;

  if (-[AXBackBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXBackBoardServer backboardServiceInstance](self, "backboardServiceInstance");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage disableBrightnessFilters](v3, "disableBrightnessFilters");
  }
  else
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2047, 0);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }

}

- (BOOL)brightnessFiltersEnabled
{
  AXIPCMessage *v3;
  char v4;
  BOOL v5;

  if (-[AXBackBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXBackBoardServer backboardServiceInstance](self, "backboardServiceInstance");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    v4 = -[AXIPCMessage brightnessFiltersEnabled](v3, "brightnessFiltersEnabled");
  }
  else
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2048, 0);
    v4 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }
  v5 = v4;

  return v5;
}

- (BOOL)blueLightStatusEnabled
{
  AXIPCMessage *v3;
  char v4;
  BOOL v5;

  if (-[AXBackBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXBackBoardServer backboardServiceInstance](self, "backboardServiceInstance");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    v4 = -[AXIPCMessage blueLightStatusEnabled](v3, "blueLightStatusEnabled");
  }
  else
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2049, 0);
    v4 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }
  v5 = v4;

  return v5;
}

- (void)restoreCachedBrightnessFilters
{
  AXIPCMessage *v3;

  if (-[AXBackBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXBackBoardServer backboardServiceInstance](self, "backboardServiceInstance");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage restoreCachedBrightnessFilters](v3, "restoreCachedBrightnessFilters");
  }
  else
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2050, 0);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }

}

- (BOOL)adaptationEnabled
{
  AXIPCMessage *v3;
  char v4;
  BOOL v5;

  if (-[AXBackBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXBackBoardServer backboardServiceInstance](self, "backboardServiceInstance");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    v4 = -[AXIPCMessage adaptationEnabled](v3, "adaptationEnabled");
  }
  else
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2051, 0);
    v4 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }
  v5 = v4;

  return v5;
}

- (BOOL)supportsAdaptation
{
  AXIPCMessage *v3;
  char v4;
  BOOL v5;

  if (-[AXBackBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXBackBoardServer backboardServiceInstance](self, "backboardServiceInstance");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    v4 = -[AXIPCMessage supportsAdaptation](v3, "supportsAdaptation");
  }
  else
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2052, 0);
    v4 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }
  v5 = v4;

  return v5;
}

- (BOOL)supportsAccessibilityDisplayFilters
{
  void *v2;
  char v3;

  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsAdvancedDisplayFilters");

  return v3;
}

- (BOOL)loadGAXBundleForUnmanagedASAM
{
  void *v3;
  BOOL v4;
  AXIPCMessage *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v10;

  if (-[AXBackBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXBackBoardServer backboardServiceInstance](self, "backboardServiceInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "forceLoadGAXBundle");

    return 1;
  }
  else
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v5 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2053, 0);
    -[AXServer client](self, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v7 = (id)objc_msgSend(v6, "sendMessage:withError:", v5, &v10);
    v8 = v10;

    v4 = v8 == 0;
  }
  return v4;
}

- (void)resetAccessibilityFeatures
{
  AXIPCMessage *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;

  if (-[AXBackBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXBackBoardServer backboardServiceInstance](self, "backboardServiceInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resetAccessibilityFeatures");

  }
  else
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2057, 0);
    -[AXServer client](self, "client");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v5 = (id)objc_msgSend(v4, "sendMessage:withError:", v3, &v8);
    v6 = v8;

    if (v6)
      _AXLogWithFacility();

  }
}

- (AXBColorFilterDescription)colorFilterFromLastUpdate
{
  void *v5;
  AXBColorFilterDescription *result;
  AXIPCMessage *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  NSObject *v18;
  void *v19;
  id v20;

  if (-[AXBackBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXBackBoardServer backboardServiceInstance](self, "backboardServiceInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v19 = v5;
      objc_msgSend(v5, "colorFilterFromLastUpdate");

    }
    else
    {
      retstr->var0[2][2] = 0.0;
      *(_OWORD *)&retstr->var0[1][1] = 0u;
      *(_OWORD *)&retstr->var0[2][0] = 0u;
      *(_OWORD *)&retstr->var0[0][0] = 0u;
      *(_OWORD *)&retstr->var0[0][2] = 0u;

    }
  }
  else
  {
    retstr->var0[2][2] = 0.0;
    *(_OWORD *)&retstr->var0[1][1] = 0u;
    *(_OWORD *)&retstr->var0[2][0] = 0u;
    *(_OWORD *)&retstr->var0[0][0] = 0u;
    *(_OWORD *)&retstr->var0[0][2] = 0u;
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v7 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 2066, 0);
    -[AXServer client](self, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v8, "sendMessage:withError:", v7, &v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v20;

    if (v10)
    {
      AXLogBackboardServer();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[AXBackBoardServer colorFilterFromLastUpdate].cold.2();

    }
    objc_msgSend(v9, "payload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("filterData"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "length") == 72)
    {
      v14 = objc_msgSend(objc_retainAutorelease(v13), "bytes");
      *(_OWORD *)&retstr->var0[0][0] = *(_OWORD *)v14;
      v16 = *(_OWORD *)(v14 + 32);
      v15 = *(_OWORD *)(v14 + 48);
      v17 = *(_OWORD *)(v14 + 16);
      retstr->var0[2][2] = *(double *)(v14 + 64);
      *(_OWORD *)&retstr->var0[1][1] = v16;
      *(_OWORD *)&retstr->var0[2][0] = v15;
      *(_OWORD *)&retstr->var0[0][2] = v17;
    }
    else
    {
      AXLogBackboardServer();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[AXBackBoardServer colorFilterFromLastUpdate].cold.1(v13, v18);

    }
  }
  return result;
}

- (void)setIsSpeakScreenHighlightVisible:(BOOL)a3
{
  _BOOL8 v3;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v3 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v5 = [AXIPCMessage alloc];
  v10 = CFSTR("visible");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 2074, v7);

  -[AXServer client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendSimpleMessage:withError:", v8, 0);

}

- (void)setDeviceOrientation:(int64_t)a3
{
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v5 = [AXIPCMessage alloc];
  v10 = CFSTR("deviceOrientation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 2075, v7);

  -[AXServer client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendSimpleMessage:withError:", v8, 0);

}

- (void)setClarityUIAdminPasscode:(id)a3
{
  id v4;
  AXIPCMessage *v5;
  void *v6;
  AXIPCMessage *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v5 = [AXIPCMessage alloc];
  v9 = CFSTR("passcode");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 2076, v6);
  -[AXServer client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendSimpleMessage:withError:", v7, 0);

}

- (void)validateClarityUIAdminPasscode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AXIPCMessage *v8;
  void *v9;
  AXIPCMessage *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v8 = [AXIPCMessage alloc];
  v14 = CFSTR("passcode");
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AXIPCMessage initWithKey:payload:](v8, "initWithKey:payload:", 2077, v9);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__AXBackBoardServer_validateClarityUIAdminPasscode_completion___block_invoke;
  v12[3] = &unk_1E24C5FF8;
  v13 = v6;
  v11 = v6;
  -[AXServer sendAsynchronousMessage:replyOnQueue:BOOLResultHandler:](self, "sendAsynchronousMessage:replyOnQueue:BOOLResultHandler:", v10, MEMORY[0x1E0C80D38], v12);

}

uint64_t __63__AXBackBoardServer_validateClarityUIAdminPasscode_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)preferenceRetrievalRequiresValidConnection
{
  return self->_preferenceRetrievalRequiresValidConnection;
}

- (void)setPreferenceRetrievalRequiresValidConnection:(BOOL)a3
{
  self->_preferenceRetrievalRequiresValidConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomAttributeListeners, 0);
  objc_storeStrong((id *)&self->_eventListeners, 0);
}

- (void)guidedAccessAvailability
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3(&dword_18C62B000, v0, v1, "Could not ask backboard server about GAX Availability: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __93__AXBackBoardServer__sendRequestGuidedAccessSessionMessage_numberOfRetryAttempts_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3(&dword_18C62B000, v0, v1, "Could not ask backboard server to set Guided Access enabled by requesting app: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)isGuidedAccessSelfLockedToApp:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3(&dword_18C62B000, v0, v1, "Could not ask backboard server if GAX is self locked to app. %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)isGuidedAccessUnmanagedSelfLocked
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3(&dword_18C62B000, v0, v1, "Could not ask if GAX self lock is active and unmanaged: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)colorFilterFromLastUpdate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_3(&dword_18C62B000, v0, v1, "Could not get last set color filter: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
