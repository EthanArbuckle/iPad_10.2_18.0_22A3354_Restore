@implementation AXSpringBoardServer

- (NSMutableArray)actionHandlers
{
  return self->_actionHandlers;
}

+ (id)server
{
  void *v3;
  int v4;
  id v5;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0D10780], "sharedSystemShellSwitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isClarityBoardEnabled");

  if (v4 && server_onceToken_0 != -1)
    dispatch_once(&server_onceToken_0, &__block_literal_global_4);
  if (objc_msgSend(a1, "isAvailable"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__AXSpringBoardServer_server__block_invoke_292;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (server_onceToken_291 != -1)
      dispatch_once(&server_onceToken_291, block);
    v5 = (id)server_Server_0;
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (BOOL)isAvailable
{
  void *v2;
  char v3;

  if ((AXProcessIsSpringBoard() & 1) == 0 && (AXInPreboardScenario() || (AXInCheckerBoardScenario() & 1) != 0)
    || _AXSMossdeepEnabled()
    || _AXSIsNonUIBuild())
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0D10780], "sharedSystemShellSwitcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isClarityBoardEnabled");

  return v3 ^ 1;
}

- (void)didPotentiallyDismissNonExclusiveSystemUI
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18C62B000, v0, v1, "Attempted to call -didPotentiallyDismissNonExclusiveSystemUI outside of SpringBoard", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (BOOL)shouldFocusNonExclusiveSystemUI
{
  return self->_shouldFocusNonExclusiveSystemUI;
}

- (void)setShouldFocusNonExclusiveSystemUI:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  if (!-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    FKALogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[AXSpringBoardServer setShouldFocusNonExclusiveSystemUI:].cold.1();

  }
  if (self->_shouldFocusNonExclusiveSystemUI != v3)
  {
    self->_shouldFocusNonExclusiveSystemUI = v3;
    FKALogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_18C62B000, v6, OS_LOG_TYPE_INFO, "Should focus non exclusive system UI: %i", (uint8_t *)v9, 8u);
    }

    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateFrontMostApplicationWithServerInstance:", v8);

  }
}

- (BOOL)_shouldDispatchLocally
{
  if (_shouldDispatchLocally_onceToken != -1)
    dispatch_once(&_shouldDispatchLocally_onceToken, &__block_literal_global_728);
  return _shouldDispatchLocally_result;
}

void __29__AXSpringBoardServer_server__block_invoke()
{
  NSObject *v0;

  CLFLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __29__AXSpringBoardServer_server__block_invoke_cold_1();

}

void __29__AXSpringBoardServer_server__block_invoke_292(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)server_Server_0;
  server_Server_0 = (uint64_t)v1;

}

- (AXSpringBoardServer)init
{
  AXSpringBoardServer *v2;
  AXSpringBoardServer *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXSpringBoardServer;
  v2 = -[AXServer init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AXServer setShouldRegisterClientCallbackSourceOnMainRunloop:](v2, "setShouldRegisterClientCallbackSourceOnMainRunloop:", 1);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF3940]), "initWithParentClass:description:appendUUIDToLabel:", objc_opt_class(), CFSTR("SpringBoardServerAccessQueue"), 0);
    -[AXSpringBoardServer setAccessQueue:](v3, "setAccessQueue:", v4);
    v5 = (void *)objc_opt_new();
    -[AXSpringBoardServer setActionHandlers:](v3, "setActionHandlers:", v5);

  }
  return v3;
}

- (id)_serviceName
{
  return CFSTR("com.apple.accessibility.AXSpringBoardServer");
}

- (id)_handleReplyResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[16];
  _QWORD v14[6];
  uint8_t buf[8];
  uint8_t *v16;
  uint64_t v17;
  void *(*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("result"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(v6, "integerValue");
    *(_QWORD *)buf = 0;
    v16 = buf;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__2;
    v19 = __Block_byref_object_dispose__2;
    v20 = 0;
    -[AXSpringBoardServer accessQueue](self, "accessQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __42__AXSpringBoardServer__handleReplyResult___block_invoke;
    v14[3] = &unk_1E24C52F0;
    v14[4] = self;
    v14[5] = buf;
    objc_msgSend(v8, "performSynchronousWritingBlock:", v14);

    v9 = *((_QWORD *)v16 + 5);
    if (v9)
    {
      (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v7);
    }
    else
    {
      AXLogSpringboardServer();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_18C62B000, v11, OS_LOG_TYPE_DEFAULT, "No handler exists to handle alert reply", v13, 2u);
      }

    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    AXLogSpringboardServer();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C62B000, v10, OS_LOG_TYPE_DEFAULT, "alert reply result was not a number", buf, 2u);
    }

  }
  return 0;
}

uint64_t __42__AXSpringBoardServer__handleReplyResult___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "currentAlertHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return objc_msgSend(*(id *)(a1 + 32), "setCurrentAlertHandler:", 0);
}

- (id)_handleMediaPlayingResult:(id)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  objc_msgSend(v17, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogSpringboardServer();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v4;
    _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_INFO, "Received is playing result: %@", buf, 0xCu);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[AXSpringBoardServer mediaPlayingHandlers](self, "mediaPlayingHandlers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[AXSpringBoardServer mediaPlayingHandlers](self, "mediaPlayingHandlers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

        buf[0] = 0;
        objc_opt_class();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("result"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (buf[0])
          abort();
        v12[2](v12, objc_msgSend(v14, "BOOLValue"));

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  -[AXSpringBoardServer mediaPlayingHandlers](self, "mediaPlayingHandlers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeAllObjects");

  return 0;
}

- (id)_handleReachabilityResult:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[AXSpringBoardServer reachabilityHandlers](self, "reachabilityHandlers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        -[AXSpringBoardServer reachabilityHandlers](self, "reachabilityHandlers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

        ((void (**)(_QWORD, void *))v12)[2](v12, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return 0;
}

- (BOOL)_shouldValidateEntitlements
{
  return 0;
}

- (void)_didConnectToServer
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXSpringBoardServer;
  -[AXServer _didConnectToServer](&v5, sel__didConnectToServer);
  -[AXServer server](self, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHandlerWithTarget:selector:forKey:", self, sel__handleReplyResult_, 5000);
  objc_msgSend(v3, "setHandlerWithTarget:selector:forKey:", self, sel__handleReachabilityResult_, 5003);
  objc_msgSend(v3, "setHandlerWithTarget:selector:forKey:", self, sel__handleMediaPlayingResult_, 5004);
  if (-[AXSpringBoardServer _shouldValidateEntitlements](self, "_shouldValidateEntitlements"))
  {
    LOBYTE(v4) = 1;
    _AXLogWithFacility();
    objc_msgSend(v3, "addPossibleRequiredEntitlement:forMessageWithKey:", CFSTR("com.apple.accessibility.SpringBoard"), 5000, v4, CFSTR("Validating SB reply messages"));
    objc_msgSend(v3, "addPossibleRequiredEntitlement:forMessageWithKey:", CFSTR("com.apple.accessibility.SpringBoard"), 5002);
    objc_msgSend(v3, "addPossibleRequiredEntitlement:forMessageWithKey:", CFSTR("com.apple.accessibility.SpringBoard"), 5003);
    objc_msgSend(v3, "addPossibleRequiredEntitlement:forMessageWithKey:", CFSTR("com.apple.accessibility.SpringBoard"), 5004);
  }

}

- (void)_willClearServer
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXSpringBoardServer;
  -[AXServer _willClearServer](&v4, sel__willClearServer);
  -[AXServer server](self, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllHandlersForTarget:", self);

}

- (void)_wasDisconnectedFromClient
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXSpringBoardServer;
  -[AXServer _wasDisconnectedFromClient](&v7, sel__wasDisconnectedFromClient);
  LOBYTE(v5) = 1;
  _AXLogWithFacility();
  SpringBoardPid = -1;
  -[AXSpringBoardServer accessQueue](self, "accessQueue", v5, CFSTR("client died, trying again"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__AXSpringBoardServer__wasDisconnectedFromClient__block_invoke;
  v6[3] = &unk_1E24C4C38;
  v6[4] = self;
  objc_msgSend(v3, "performSynchronousWritingBlock:", v6);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("AXSystemAppServerDiedNotification"), 0);

}

uint64_t __49__AXSpringBoardServer__wasDisconnectedFromClient__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentAlertHandler:", 0);
}

- (void)_didConnectToClient
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AXSpringBoardServer;
  -[AXServer _didConnectToClient](&v2, sel__didConnectToClient);
  SpringBoardPid = -1;
}

- (void)takeScreenshot
{
  AXIPCMessage *v3;

  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4009, 0);
  -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v3);

}

- (void)openAssistiveTouchCustomGestureCreation
{
  AXIPCMessage *v3;

  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4021, 0);
  -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v3);

}

- (void)openSCATCustomGestureCreation
{
  AXIPCMessage *v3;

  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4022, 0);
  -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v3);

}

- (void)openCommandAndControlSettings
{
  AXIPCMessage *v3;

  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4097, 0);
  -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v3);

}

- (void)openCommandAndControlCommands
{
  AXIPCMessage *v3;

  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4087, 0);
  -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v3);

}

- (void)openCommandAndControlVocabulary
{
  AXIPCMessage *v3;

  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4088, 0);
  -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v3);

}

- (void)setCaptionPanelContextId:(unsigned int)a3
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
  v10 = CFSTR("contextId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 4096, v7);

  -[AXServer client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendSimpleMessage:", v8);

}

- (void)setHearingAidControlVisible:(BOOL)a3
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
  v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 4023, v7);

  -[AXServer client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendSimpleMessage:", v8);

}

- (void)startHearingAidServer
{
  void *v3;
  AXIPCMessage *v4;

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4035, 0);
  -[AXServer client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendSimpleMessage:", v4);

}

- (int)topEventPidOverride
{
  AXIPCMessage *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4006, 0);
  -[AXServer client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendMessage:withError:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("pid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  return v8;
}

- (BOOL)isOrientationLocked
{
  AXIPCMessage *v3;

  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4018, 0);
  LOBYTE(self) = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);

  return (char)self;
}

- (void)setOrientation:(int64_t)a3
{
  void *v4;
  void *v5;
  AXIPCMessage *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("orientation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4107, v5);
  -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v6);

}

- (void)setOrientationLocked:(BOOL)a3
{
  void *v4;
  void *v5;
  AXIPCMessage *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("locked");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4059, v5);
  -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v6);

}

- (void)resetDimTimer
{
  AXIPCMessage *v3;

  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4026, 0);
  -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v3);

}

- (BOOL)isSideSwitchUsedForOrientation
{
  AXIPCMessage *v3;

  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4019, 0);
  LOBYTE(self) = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);

  return (char)self;
}

- (BOOL)isRingerMuted
{
  AXIPCMessage *v3;

  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4020, 0);
  LOBYTE(self) = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);

  return (char)self;
}

- (double)reachabilityOffset
{
  AXIPCMessage *v3;
  void *v4;
  double v5;
  double v6;

  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4055, 0);
  -[AXServer sendSimpleMessageWithObjectResult:](self, "sendSimpleMessageWithObjectResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (double)volumeLevel
{
  AXIPCMessage *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  double v9;

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4017, 0);
  -[AXServer client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendMessage:withError:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("result"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  return v9;
}

- (void)cleanupAlertHandler
{
  void *v3;
  uint64_t v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *(*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  -[AXSpringBoardServer accessQueue](self, "accessQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__AXSpringBoardServer_cleanupAlertHandler__block_invoke;
  v5[3] = &unk_1E24C52F0;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "performSynchronousWritingBlock:", v5);

  v4 = v7[5];
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 0x7FFFFFFFFFFFFFFFLL);
  _Block_object_dispose(&v6, 8);

}

uint64_t __42__AXSpringBoardServer_cleanupAlertHandler__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "currentAlertHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return objc_msgSend(*(id *)(a1 + 32), "setCurrentAlertHandler:", 0);
}

- (void)hideAlert
{
  AXIPCMessage *v3;

  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4003, 0);
  -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v3);

  AXPerformBlockOnMainThreadAfterDelay();
}

void __32__AXSpringBoardServer_hideAlert__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[16];
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_msgSend(*(id *)(a1 + 32), "accessQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__AXSpringBoardServer_hideAlert__block_invoke_2;
  v5[3] = &unk_1E24C52F0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = &v6;
  objc_msgSend(v2, "performSynchronousReadingBlock:", v5);

  if (*((_BYTE *)v7 + 24))
  {
    AXLogSpringboardServer();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18C62B000, v3, OS_LOG_TYPE_DEFAULT, "didn't get a call back from asking to hide the alert", v4, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "cleanupAlertHandler");
  }
  _Block_object_dispose(&v6, 8);
}

void __32__AXSpringBoardServer_hideAlert__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "currentAlertHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != 0;

}

- (BOOL)isShowingAXAlert
{
  AXSpringBoardServer *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[AXSpringBoardServer accessQueue](self, "accessQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__AXSpringBoardServer_isShowingAXAlert__block_invoke;
  v5[3] = &unk_1E24C52F0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performSynchronousReadingBlock:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __39__AXSpringBoardServer_isShowingAXAlert__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "currentAlertHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != 0;

}

- (void)showAlert:(int)a3 withHandler:(id)a4
{
  -[AXSpringBoardServer showAlert:withHandler:withData:](self, "showAlert:withHandler:withData:", *(_QWORD *)&a3, a4, 0);
}

- (void)showAlert:(int)a3 withHandler:(id)a4 withData:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  AXIPCMessage *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  AXSpringBoardServer *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  AXSpringBoardServer *v28;
  id v29;
  id v30;
  int v31;
  uint8_t buf[16];

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  if (-[AXSpringBoardServer isShowingAXAlert](self, "isShowingAXAlert"))
  {
    AXLogSpringboardServer();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C62B000, v10, OS_LOG_TYPE_DEFAULT, "Another alert is showing already!", buf, 2u);
    }

  }
  else
  {
    if (-[AXServer _connectIfNecessary](self, "_connectIfNecessary"))
    {
      -[AXServer _connectServerIfNecessary](self, "_connectServerIfNecessary");
      -[AXSpringBoardServer accessQueue](self, "accessQueue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __54__AXSpringBoardServer_showAlert_withHandler_withData___block_invoke_2;
      v21 = &unk_1E24C5340;
      v22 = self;
      v23 = v8;
      objc_msgSend(v11, "performSynchronousWritingBlock:", &v18);

      v12 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6, v18, v19, v20, v21, v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dictionaryWithObject:forKey:", v13, CFSTR("alertType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(v14, "setObject:forKey:", v9, CFSTR("data"));
      v15 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4002, v14);
      -[AXServer client](self, "client");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sendSimpleMessage:", v15);

      v17 = v23;
    }
    else
    {
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __54__AXSpringBoardServer_showAlert_withHandler_withData___block_invoke;
      v27 = &unk_1E24C5318;
      v28 = self;
      v31 = v6;
      v30 = v8;
      v29 = v9;
      AXPerformBlockOnMainThreadAfterDelay();

      v17 = v30;
    }

  }
}

uint64_t __54__AXSpringBoardServer_showAlert_withHandler_withData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showAlert:withHandler:withData:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __54__AXSpringBoardServer_showAlert_withHandler_withData___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentAlertHandler:", *(_QWORD *)(a1 + 40));
}

- (void)showRemoteView:(int64_t)a3 withData:(id)a4
{
  -[AXSpringBoardServer _sendRemoteViewIPCMessage:withRemoteViewType:withData:](self, "_sendRemoteViewIPCMessage:withRemoteViewType:withData:", 4085, a3, a4);
}

- (void)hideRemoteView:(int64_t)a3
{
  -[AXSpringBoardServer _sendRemoteViewIPCMessage:withRemoteViewType:withData:](self, "_sendRemoteViewIPCMessage:withRemoteViewType:withData:", 4086, a3, 0);
}

- (BOOL)isShowingRemoteView:(int64_t)a3
{
  AXIPCMessage *v5;
  void *v6;
  AXIPCMessage *v7;

  v5 = [AXIPCMessage alloc];
  -[AXSpringBoardServer _payloadForRemoteViewType:data:](self, "_payloadForRemoteViewType:data:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 4095, v6);
  LOBYTE(self) = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v7);

  return (char)self;
}

- (id)_payloadForRemoteViewType:(int64_t)a3 data:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithObject:forKey:", v7, CFSTR("remoteViewType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("data"));

  return v8;
}

- (void)_sendRemoteViewIPCMessage:(int)a3 withRemoteViewType:(int64_t)a4 withData:(id)a5
{
  uint64_t v6;
  id v8;
  AXIPCMessage *v9;
  void *v10;
  AXIPCMessage *v11;
  void *v12;
  id v13;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  if (-[AXServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    -[AXServer _connectServerIfNecessary](self, "_connectServerIfNecessary");
    v9 = [AXIPCMessage alloc];
    -[AXSpringBoardServer _payloadForRemoteViewType:data:](self, "_payloadForRemoteViewType:data:", a4, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AXIPCMessage initWithKey:payload:](v9, "initWithKey:payload:", v6, v10);

    -[AXServer client](self, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendSimpleMessage:", v11);

  }
  else
  {
    v13 = v8;
    AXPerformBlockOnMainThreadAfterDelay();

  }
}

uint64_t __77__AXSpringBoardServer__sendRemoteViewIPCMessage_withRemoteViewType_withData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendRemoteViewIPCMessage:withRemoteViewType:withData:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)setShowSpeechPlaybackControls:(BOOL)a3
{
  void *v4;
  void *v5;
  AXIPCMessage *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("show");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4040, v5);
  -[AXServer client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendSimpleMessage:", v6);

}

- (int)_actionResultKey
{
  return 5002;
}

- (void)removeActionHandler:(id)a3
{
  -[AXServer _removeActionHandler:registrationMessageKey:](self, "_removeActionHandler:registrationMessageKey:", a3, 4012);
}

- (void)registerSpringBoardActionHandler:(id)a3 withIdentifierCallback:(id)a4
{
  -[AXServer _registerActionHandler:withIdentifierCallback:retryInterval:registrationMessageKey:](self, "_registerActionHandler:withIdentifierCallback:retryInterval:registrationMessageKey:", a3, a4, 4012, 5.0);
}

- (void)setCancelGestureActivation:(unint64_t)a3 cancelEnabled:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  AXIPCMessage *v10;
  void *v11;
  id v12;

  v4 = a4;
  if (-[AXServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v7 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, CFSTR("type"), v9, CFSTR("cancelEnabled"), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v10 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4008, v12);
    -[AXServer client](self, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendSimpleMessage:", v10);

  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __64__AXSpringBoardServer_setCancelGestureActivation_cancelEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCancelGestureActivation:cancelEnabled:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)cancelReachabilityDetection
{
  void *v3;
  AXIPCMessage *v4;

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4058, &unk_1E24F8EB8);
  -[AXServer client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendSimpleMessage:", v4);

}

- (void)registerReachabilityHandler:(id)a3 withIdentifierCallback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AXIPCMessage *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  AXSpringBoardServer *v25;
  id v26;
  id v27;

  v6 = a3;
  v7 = a4;
  if (-[AXServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    -[AXServer _connectServerIfNecessary](self, "_connectServerIfNecessary");
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXSpringBoardServer reachabilityHandlers](self, "reachabilityHandlers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSpringBoardServer setReachabilityHandlers:](self, "setReachabilityHandlers:", v11);

    }
    v12 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4056, &unk_1E24F8EE0);
    -[AXServer client](self, "client");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __74__AXSpringBoardServer_registerReachabilityHandler_withIdentifierCallback___block_invoke_2;
    v17[3] = &unk_1E24C53E0;
    v17[4] = self;
    v18 = v9;
    v19 = v6;
    v20 = v7;
    v14 = v7;
    v15 = v6;
    v16 = v9;
    objc_msgSend(v13, "sendAsyncMessage:withReplyHandler:", v12, v17);

  }
  else
  {
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __74__AXSpringBoardServer_registerReachabilityHandler_withIdentifierCallback___block_invoke;
    v24 = &unk_1E24C53B8;
    v25 = self;
    v26 = v6;
    v27 = v7;
    v16 = v7;
    v12 = (AXIPCMessage *)v6;
    AXPerformBlockOnMainThreadAfterDelay();

  }
}

uint64_t __74__AXSpringBoardServer_registerReachabilityHandler_withIdentifierCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerReachabilityHandler:withIdentifierCallback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __74__AXSpringBoardServer_registerReachabilityHandler_withIdentifierCallback___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("result"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    v8 = (id)objc_msgSend(*(id *)(a1 + 48), "copy");
    v6 = _Block_copy(v8);
    objc_msgSend(*(id *)(a1 + 32), "reachabilityHandlers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v9 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 56);
    AXPerformBlockOnMainThreadAfterDelay();

  }
}

uint64_t __74__AXSpringBoardServer_registerReachabilityHandler_withIdentifierCallback___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerReachabilityHandler:withIdentifierCallback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)toggleIncomingCall
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v3 = [AXIPCMessage alloc];
  v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 4061, MEMORY[0x1E0C9AA70]);
  -[AXServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:withError:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("result"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  return v9;
}

- (void)toggleReachability
{
  double v3;

  -[AXSpringBoardServer reachabilityOffset](self, "reachabilityOffset");
  -[AXSpringBoardServer setReachabilityActive:](self, "setReachabilityActive:", v3 == 0.0);
}

- (void)setReachabilityActive:(BOOL)a3
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
  v10 = CFSTR("active");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 4060, v7);

  -[AXServer client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendSimpleMessage:", v8);

}

- (void)setReachabilityEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  AXIPCMessage *v6;
  void *v7;
  void *v8;
  AXIPCMessage *v9;
  void *v10;
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v3 = a3;
  v13[1] = *MEMORY[0x1E0C80C00];
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serverInstance:setReachabilityEnabled:", v5, v3);

  }
  else
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v6 = [AXIPCMessage alloc];
    v12 = CFSTR("enabled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AXIPCMessage initWithKey:payload:](v6, "initWithKey:payload:", 4083, v8);

    -[AXServer client](self, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendSimpleMessage:", v9);

  }
}

- (void)removeReachabilityHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  AXIPCMessage *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (v11)
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    -[AXSpringBoardServer reachabilityHandlers](self, "reachabilityHandlers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      -[AXSpringBoardServer reachabilityHandlers](self, "reachabilityHandlers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObjectForKey:", v11);

      -[AXSpringBoardServer reachabilityHandlers](self, "reachabilityHandlers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (!v8)
      {
        v9 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4056, &unk_1E24F8F08);
        -[AXServer client](self, "client");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sendSimpleMessage:", v9);

      }
    }
  }
  else
  {
    _AXAssert();
  }

}

- (BOOL)isInspectorMinimized
{
  _BOOL4 v3;
  AXIPCMessage *v4;
  BOOL v5;

  v3 = -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  if (v3)
  {
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4052, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v4);

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isPointInsideAccessibilityInspector:(id)a3
{
  return 0;
}

- (int)pid
{
  int result;
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (!-[AXServer _connectIfNecessary](self, "_connectIfNecessary"))
    return -1;
  result = SpringBoardPid;
  if (SpringBoardPid == -1)
  {
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4001, 0);
    -[AXServer client](self, "client");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendMessage:withError:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "payload");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("pid"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      SpringBoardPid = objc_msgSend(v8, "intValue");

      if (!SpringBoardPid)
        SpringBoardPid = -1;
    }

    return SpringBoardPid;
  }
  return result;
}

- (void)pid:(id)a3
{
  id v4;
  int v5;
  AXIPCMessage *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD block[4];
  AXIPCMessage *v11;
  int v12;
  _QWORD v13[4];
  AXIPCMessage *v14;

  v4 = a3;
  if (-[AXServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v5 = SpringBoardPid;
    if (SpringBoardPid == -1)
    {
      v6 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4001, 0);
      -[AXServer client](self, "client");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __27__AXSpringBoardServer_pid___block_invoke_3;
      v8[3] = &unk_1E24C5458;
      v9 = v4;
      objc_msgSend(v7, "sendAsyncMessage:replyOnQueue:replyHandler:", v6, MEMORY[0x1E0C80D38], v8);

    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __27__AXSpringBoardServer_pid___block_invoke_2;
      block[3] = &unk_1E24C5430;
      v11 = (AXIPCMessage *)v4;
      v12 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v6 = v11;
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __27__AXSpringBoardServer_pid___block_invoke;
    v13[3] = &unk_1E24C5408;
    v14 = (AXIPCMessage *)v4;
    dispatch_async(MEMORY[0x1E0C80D38], v13);
    v6 = v14;
  }

}

uint64_t __27__AXSpringBoardServer_pid___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __27__AXSpringBoardServer_pid___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

uint64_t __27__AXSpringBoardServer_pid___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  int v6;

  if (a2)
  {
    objc_msgSend(a2, "payload");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("pid"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "intValue");

    if (v5)
      v6 = v5;
    else
      v6 = -1;
  }
  else
  {
    v6 = -1;
  }
  SpringBoardPid = v6;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int64_t)activeApplicationOrientation
{
  AXIPCMessage *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4000, 0);
  -[AXServer client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendMessage:withError:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("orientation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (int)objc_msgSend(v7, "intValue");

  return v8;
}

- (int64_t)activeInterfaceOrientation
{
  AXIPCMessage *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4030, 0);
  -[AXServer client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendMessage:withError:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("orientation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  return v8;
}

- (void)activeInterfaceOrientation:(id)a3
{
  id v4;
  AXIPCMessage *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4030, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__AXSpringBoardServer_activeInterfaceOrientation___block_invoke;
  v7[3] = &unk_1E24C5458;
  v8 = v4;
  v6 = v4;
  -[AXServer sendAsynchronousMessage:replyOnQueue:handler:](self, "sendAsynchronousMessage:replyOnQueue:handler:", v5, MEMORY[0x1E0C80D38], v7);

}

void __50__AXSpringBoardServer_activeInterfaceOrientation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "payload");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("orientation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(v3, "integerValue"));

}

- (void)copyStringToPasteboard:(id)a3
{
  id v4;
  AXIPCMessage *v5;
  void *v6;
  AXIPCMessage *v7;
  id v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v5 = [AXIPCMessage alloc];
    v9 = CFSTR("string");
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 4036, v6);

    v8 = -[AXServer sendMessage:](self, "sendMessage:", v7);
  }

}

- (BOOL)isScreenSaverVisible
{
  return 0;
}

- (BOOL)isNowPlayingUIVisible
{
  return 0;
}

- (BOOL)isSoftwareUpdateUIVisible
{
  return 0;
}

- (void)activateSOSMode
{
  AXIPCMessage *v3;

  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4074, 0);
  -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v3);

}

- (id)splashImageForAppWithBundleIdentifier:(id)a3
{
  id v4;
  AXIPCMessage *v5;
  void *v6;
  AXIPCMessage *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = a3;
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v5 = [AXIPCMessage alloc];
  v13 = CFSTR("bundleIdentifier");
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 4089, v6);
  -[AXServer client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendMessage:withError:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("splashData"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)connectedDevicesRequireAssistiveTouch
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v3 = [AXIPCMessage alloc];
  v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 4101, MEMORY[0x1E0C9AA70]);
  -[AXServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:withError:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("result"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  return v9;
}

- (BOOL)currentDevicesHaveAssistiveTouchCustomActions
{
  void *v3;
  int v4;
  AXIPCMessage *v5;
  AXIPCMessage *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "laserEnabled");

  if (!v4)
    return 0;
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v5 = [AXIPCMessage alloc];
  v6 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 4109, MEMORY[0x1E0C9AA70]);
  -[AXServer client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendMessage:withError:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("result"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  return v11;
}

- (void)cancelSiriDismissalForAssistiveTouch
{
  AXIPCMessage *v3;

  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4103, 0);
  -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v3);

}

- (void)toggleTorch
{
  AXIPCMessage *v3;

  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4106, 0);
  -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v3);

}

- (BOOL)isScreenLockedWithPasscode:(BOOL *)a3
{
  BOOL isUILocked;

  isUILocked = _isUILocked();
  if (a3)
    *a3 = _isDeviceLockedWithPasscode();
  return isUILocked;
}

- (void)screenLockStatus:(id)a3 passcodeStatusRequired:(BOOL)a4
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  _isUILocked();
  _isDeviceLockedWithPasscode();
  v6 = v4;
  v5 = v4;
  AXPerformBlockAsynchronouslyOnMainThread();

}

uint64_t __63__AXSpringBoardServer_screenLockStatus_passcodeStatusRequired___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

- (BOOL)isSystemSleeping
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isSystemSleepingWithServerInstance:](v3, "isSystemSleepingWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4016, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (void)isSystemSleeping:(id)a3
{
  id v4;
  AXIPCMessage *v5;

  if (a3)
  {
    v4 = a3;
    v5 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4016, 0);
    -[AXServer sendAsynchronousMessage:replyOnQueue:BOOLResultHandler:](self, "sendAsynchronousMessage:replyOnQueue:BOOLResultHandler:", v5, MEMORY[0x1E0C80D38], v4);

  }
}

- (BOOL)isSyncingRestoringResettingOrUpdating
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isSyncingRestoringResettingOrUpdatingWithServerInstance:](v3, "isSyncingRestoringResettingOrUpdatingWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4039, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)areSystemGesturesDisabledNatively
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage areSystemGesturesDisabledNativelyWithServerInstance:](v3, "areSystemGesturesDisabledNativelyWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4043, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)areSystemGesturesDisabledByAccessibility
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage areSystemGesturesDisabledByAccessibilityWithServerInstance:](v3, "areSystemGesturesDisabledByAccessibilityWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4044, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (id)installedApps
{
  void *v3;
  void *v4;
  AXIPCMessage *v5;
  void *v6;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "installedAppsWithServerInstance:", v4);
  }
  else
  {
    v5 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4046, 0);
    -[AXServer sendMessage:](self, "sendMessage:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "payload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("result"));
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)internalApps
{
  void *v3;
  void *v4;
  AXIPCMessage *v5;
  void *v6;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "internalAppsWithServerInstance:", v4);
  }
  else
  {
    v5 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4093, 0);
    -[AXServer sendMessage:](self, "sendMessage:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "payload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("result"));
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)wakeUpDeviceIfNecessary
{
  void *v3;
  AXIPCMessage *v4;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage wakeUpDeviceIfNecessaryWithServerInstance:](v4, "wakeUpDeviceIfNecessaryWithServerInstance:", v3);

  }
  else
  {
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4068, 0);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }

}

- (void)unlockDevice
{
  void *v3;
  AXIPCMessage *v4;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage unlockDeviceWithServerInstance:](v4, "unlockDeviceWithServerInstance:", v3);

  }
  else
  {
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4048, 0);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }

}

- (void)rebootDevice
{
  void *v3;
  AXIPCMessage *v4;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage rebootDeviceWithServerInstance:](v4, "rebootDeviceWithServerInstance:", v3);

  }
  else
  {
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4075, 0);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }

}

- (void)isMediaPlayingForApp:(id)a3 completionHandler:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  NSObject *v17;
  AXIPCMessage *v18;
  int v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = a4;
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "isMediaPlayingWithServerInstance:forBundleId:completion:", v9, v6, v7);

  }
  else
  {
    -[AXSpringBoardServer mediaPlayingHandlers](self, "mediaPlayingHandlers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSpringBoardServer setMediaPlayingHandlers:](self, "setMediaPlayingHandlers:", v11);

    }
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    -[AXServer _connectServerIfNecessary](self, "_connectServerIfNecessary");
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXSpringBoardServer mediaPlayingHandlers](self, "mediaPlayingHandlers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = _Block_copy(v7);

    objc_msgSend(v13, "setObject:forKey:", v14, v8);
    v15 = &stru_1E24CAB08;
    if (v6)
      v15 = v6;
    v21[0] = CFSTR("bundleId");
    v21[1] = CFSTR("uuidString");
    v22[0] = v15;
    v22[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogSpringboardServer();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v19 = 138412290;
      v20 = v16;
      _os_log_impl(&dword_18C62B000, v17, OS_LOG_TYPE_INFO, "Asking for media playing status: %@", (uint8_t *)&v19, 0xCu);
    }

    v18 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4025, v16);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v18);

  }
}

- (void)pauseMedia
{
  -[AXSpringBoardServer pauseMediaForApp:](self, "pauseMediaForApp:", 0);
}

- (void)pauseMediaForApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AXIPCMessage *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverInstance:pauseMedia:forBundleId:", v6, 1, v4);

  }
  else
  {
    if (v4)
    {
      v8 = CFSTR("bundleId");
      v9[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    v7 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4053, v5);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v7);

  }
}

- (void)resumeMedia
{
  -[AXSpringBoardServer resumeMediaForApp:](self, "resumeMediaForApp:", 0);
}

- (void)resumeMediaForApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AXIPCMessage *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverInstance:pauseMedia:forBundleId:", v6, 0, v4);

  }
  else
  {
    if (v4)
    {
      v8 = CFSTR("bundleId");
      v9[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    v7 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4054, v5);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v7);

  }
}

- (BOOL)hasActiveCall
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage hasActiveCallWithServerInstance:](v3, "hasActiveCallWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4027, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)hasActiveEndpointCall
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage hasActiveEndpointCallWithServerInstance:](v3, "hasActiveEndpointCallWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4081, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)hasActiveOrPendingCall
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage hasActiveOrPendingCallWithServerInstance:](v3, "hasActiveOrPendingCallWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4051, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)hasActiveOrPendingCallOrFaceTime
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage hasActiveOrPendingCallOrFaceTimeWithServerInstance:](v3, "hasActiveOrPendingCallOrFaceTimeWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4057, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)isMakingEmergencyCall
{
  AXIPCMessage *v3;
  void *v4;
  BOOL v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage isMakingEmergencyCallWithServerInstance:](v3, "isMakingEmergencyCallWithServerInstance:", v4);

    v5 = 0;
  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4005, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)isNotificationCenterVisible
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isNotificationCenterVisibleWithServerInstance:](v3, "isNotificationCenterVisibleWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4033, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)isScreenshotWindowVisible
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally");
  if (v3)
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isScreenshotWindowVisibleWithServerInstance:", v5);

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)isNotificationVisible
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally");
  if (v3)
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isNotificationVisibleWithServerInstance:", v5);

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)isShowingLongLookNotification
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isLongLookNotificationVisibleWithServerInstance:](v3, "isLongLookNotificationVisibleWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4111, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)isBannerVisible
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally");
  if (v3)
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isBannerVisibleWithServerInstance:", v5);

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)isRemoteAlertVisible
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally");
  if (v3)
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isRemoteTransientOverlayVisibleWithServerInstance:", v5);

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (void)toggleNotificationCenter
{
  void *v3;
  AXIPCMessage *v4;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage toggleNotificationCenterWithServerInstance:](v4, "toggleNotificationCenterWithServerInstance:", v3);

  }
  else
  {
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4034, 0);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }

}

- (void)showNotificationCenter
{
  if (!-[AXSpringBoardServer isNotificationCenterVisible](self, "isNotificationCenterVisible"))
    -[AXSpringBoardServer toggleNotificationCenter](self, "toggleNotificationCenter");
}

- (void)hideNotificationCenter
{
  if (-[AXSpringBoardServer isNotificationCenterVisible](self, "isNotificationCenterVisible"))
    -[AXSpringBoardServer toggleNotificationCenter](self, "toggleNotificationCenter");
}

- (BOOL)isControlCenterVisible
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isControlCenterVisibleWithServerInstance:](v3, "isControlCenterVisibleWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4031, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)showNotificationCenter:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char v7;
  AXIPCMessage *v8;
  void *v9;
  void *v10;
  AXIPCMessage *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v3 = a3;
  v14[1] = *MEMORY[0x1E0C80C00];
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "serverInstance:showNotificationCenter:", v6, v3);

  }
  else
  {
    v8 = [AXIPCMessage alloc];
    v13 = CFSTR("show");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AXIPCMessage initWithKey:payload:](v8, "initWithKey:payload:", 4050, v10);
    v7 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v11);

  }
  return v7;
}

- (BOOL)showControlCenter:(BOOL)a3
{
  _BOOL8 v3;
  AXIPCMessage *v5;
  void *v6;
  char v7;
  AXIPCMessage *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v3 = a3;
  v13[1] = *MEMORY[0x1E0C80C00];
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v5 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AXIPCMessage serverInstance:showControlCenter:](v5, "serverInstance:showControlCenter:", v6, v3);

  }
  else
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v8 = [AXIPCMessage alloc];
    v12 = CFSTR("show");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage initWithKey:payload:](v8, "initWithKey:payload:", 4032, v10);

    v7 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v5);
  }

  return v7;
}

- (void)armApplePay
{
  void *v3;
  AXIPCMessage *v4;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage armApplePayWithServerInstance:](v4, "armApplePayWithServerInstance:", v3);

  }
  else
  {
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4078, 0);
    -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:");
  }

}

- (void)toggleDock
{
  void *v3;
  id v4;
  AXIPCMessage *v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v5 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage toggleDockWithServerInstance:](v5, "toggleDockWithServerInstance:", v3);

  }
  else
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v5 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4077, 0);
    v4 = -[AXServer sendMessage:](self, "sendMessage:");
  }

}

- (BOOL)isStageManagerSwitcherVisible
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally");
  if (v3)
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isStageManagerSwitcherVisibleWithServerInstance:", v5);

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)isDockVisible
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isDockVisibleWithServerInstance:](v3, "isDockVisibleWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4076, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)isStatusBarNativeFocusable
{
  return -[AXSpringBoardServer isStatusBarNativeFocusableIncludingNonDismissableElements:](self, "isStatusBarNativeFocusableIncludingNonDismissableElements:", 1);
}

- (BOOL)isStatusBarNativeFocusableIncludingNonDismissableElements:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char v7;
  NSObject *v9;

  v3 = a3;
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isStatusBarNativeFocusableWithServerInstance:includingNonDismissableElements:", v6, v3);

    return v7;
  }
  else
  {
    FKALogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AXSpringBoardServer isStatusBarNativeFocusableIncludingNonDismissableElements:].cold.1();

    return 0;
  }
}

- (BOOL)isShowingNonSystemApp
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isShowingNonSystemAppWithServerInstance:](v3, "isShowingNonSystemAppWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4090, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)isShowingHomescreen
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isShowingHomescreenWithServerInstance:](v3, "isShowingHomescreenWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4079, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)isContinuitySessionActive
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isContinuitySessionActiveWithServerInstance:](v3, "isContinuitySessionActiveWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4131, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (void)launchApplication:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "launchApplication:", v5);

  }
}

- (void)launchPinnedApplication:(id)a3 onLeadingSide:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "launchPinnedApplication:onLeadingSide:", v7, v4);

  }
}

- (void)launchFloatingApplication:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "launchFloatingApplication:", v5);

  }
}

- (BOOL)canLaunchAsPinnedApplicationForIconView:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "canLaunchAsPinnedApplicationForIconView:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)canLaunchAsFloatingApplicationForIconView:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "canLaunchAsFloatingApplicationForIconView:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isAppSwitcherVisible
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isAppSwitcherVisibleWithServerInstance:](v3, "isAppSwitcherVisibleWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4011, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)isShelfSwitcherVisible
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isShelfSwitcherVisibleWithServerInstance:](v3, "isShelfSwitcherVisibleWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4007, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (void)openAppSwitcher
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  AXIPCMessage *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally");
  AXLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_18C62B000, v4, OS_LOG_TYPE_DEFAULT, "Requesting SB openAppSwitcher. dispatchLocal=%@", (uint8_t *)&v8, 0xCu);

  }
  if (v3)
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v6 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage openAppSwitcherWithServerInstance:](v6, "openAppSwitcherWithServerInstance:", v7);

  }
  else
  {
    v6 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4010, 0);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v6);
  }

}

- (void)dismissAppSwitcher
{
  void *v3;
  AXIPCMessage *v4;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage dismissAppSwitcherWithServerInstance:](v4, "dismissAppSwitcherWithServerInstance:", v3);

  }
  else
  {
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4047, 0);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }

}

- (void)dismissShelfSwitcher
{
  void *v3;
  AXIPCMessage *v4;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage dismissShelfSwitcherWithServerInstance:](v4, "dismissShelfSwitcherWithServerInstance:", v3);

  }
  else
  {
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4004, 0);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }

}

- (void)simulateEdgePressHaptics
{
  void *v3;
  AXIPCMessage *v4;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage simulateEdgePressHaptics:](v4, "simulateEdgePressHaptics:", v3);

  }
  else
  {
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4067, 0);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }

}

- (void)toggleAppLibrary
{
  void *v3;
  AXIPCMessage *v4;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage toggleAppLibraryWithServerInstance:](v4, "toggleAppLibraryWithServerInstance:", v3);

  }
  else
  {
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4112, 0);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }

}

- (void)toggleQuickNote
{
  void *v3;
  AXIPCMessage *v4;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage toggleQuickNoteWithServerInstance:](v4, "toggleQuickNoteWithServerInstance:", v3);

  }
  else
  {
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4113, 0);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }

}

- (void)toggleSpotlight
{
  void *v3;
  AXIPCMessage *v4;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage toggleSpotlightWithServerInstance:](v4, "toggleSpotlightWithServerInstance:", v3);

  }
  else
  {
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4065, 0);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }

}

- (void)revealSpotlight
{
  void *v3;
  AXIPCMessage *v4;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage revealSpotlightWithServerInstance:](v4, "revealSpotlightWithServerInstance:", v3);

  }
  else
  {
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4066, 0);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }

}

- (BOOL)isDarkModeActive
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isDarkModeActiveWithServiceInstance:](v3, "isDarkModeActiveWithServiceInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4099, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)toggleDarkMode
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage toggleDarkModeWithServerInstance:](v3, "toggleDarkModeWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4100, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)isGuidedAccessActive
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isGuidedAccessActiveWithServerInstance:](v3, "isGuidedAccessActiveWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4038, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)isSpotlightVisible
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isSpotlightVisibleWithServerInstance:](v3, "isSpotlightVisibleWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4098, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)isPIPWindowVisible
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isPIPWindowVisibleWithServerInstance:](v3, "isPIPWindowVisibleWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4102, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)dismissSiri
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage dismissSiriWithServerInstance:](v3, "dismissSiriWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4049, 0);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v3);
    v5 = 1;
  }

  return v5;
}

- (BOOL)isSiriVisible
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isSiriVisibleWithServerInstance:](v3, "isSiriVisibleWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4037, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)isSiriTalkingOrListening
{
  _AXAssert();
  return 0;
}

- (BOOL)isReceivingAirPlay
{
  return 0;
}

- (BOOL)isPasscodeLockVisible
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isPasscodeLockVisibleWithServerInstance:](v3, "isPasscodeLockVisibleWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4082, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)isLockScreenVisible
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isLockScreenVisibleWithServerInstance:](v3, "isLockScreenVisibleWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4104, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (void)openVoiceControl
{
  void *v3;
  AXIPCMessage *v4;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage openVoiceControlWithServerInstance:](v4, "openVoiceControlWithServerInstance:", v3);

  }
  else
  {
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4029, 0);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }

}

- (BOOL)isTypeToSiriVisible
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isTypeToSiriVisibleWithServerInstance:](v3, "isTypeToSiriVisibleWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4133, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (void)openTypeToSiri
{
  void *v3;
  AXIPCMessage *v4;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage openTypeToSiriWithServerInstance:](v4, "openTypeToSiriWithServerInstance:", v3);

  }
  else
  {
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4132, 0);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }

}

- (BOOL)isVoiceControlRunning
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isVoiceControlRunningWithServerInstance:](v3, "isVoiceControlRunningWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4013, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)isSpeakThisTemporarilyDisabled
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isSpeakThisTemporarilyDisabledWithServerInstance:](v3, "isSpeakThisTemporarilyDisabledWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4042, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (id)allowedMedusaGestures
{
  AXIPCMessage *v3;
  void *v4;
  void *v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage allowedMedusaGesturesWithServerInstance:](v3, "allowedMedusaGesturesWithServerInstance:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!AXDeviceSupportsSideApp())
    {
      v5 = (void *)MEMORY[0x1E0C9AA60];
      return v5;
    }
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4063, 0);
    -[AXServer sendSimpleMessageWithObjectResult:](self, "sendSimpleMessageWithObjectResult:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)toggleBackgroundSounds
{
  void *v3;
  AXIPCMessage *v4;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage toggleBackgroundSoundsWithServerInstance:](v4, "toggleBackgroundSoundsWithServerInstance:", v3);

  }
  else
  {
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4110, 0);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }

}

- (BOOL)performMedusaGesture:(unint64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  AXIPCMessage *v8;
  void *v9;
  void *v10;
  AXIPCMessage *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "serverInstance:performMedusaGesture:", v6, a3);

  }
  else
  {
    v8 = [AXIPCMessage alloc];
    v13 = CFSTR("gesture");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AXIPCMessage initWithKey:payload:](v8, "initWithKey:payload:", 4064, v10);
    v7 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v11);

  }
  return v7;
}

- (id)medusaApps
{
  AXIPCMessage *v3;
  void *v4;
  void *v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage medusaAppsWithServerInstance:](v3, "medusaAppsWithServerInstance:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4080, 0);
    -[AXServer sendSimpleMessageWithObjectResult:](self, "sendSimpleMessageWithObjectResult:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)setDockIconActivationMode:(unint64_t)a3
{
  void *v5;
  AXIPCMessage *v6;
  void *v7;
  void *v8;
  AXIPCMessage *v9;
  id v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serverInstance:setDockIconActivationMode:", v5, a3);

  }
  else
  {
    v6 = [AXIPCMessage alloc];
    v11 = CFSTR("mode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AXIPCMessage initWithKey:payload:](v6, "initWithKey:payload:", 4091, v8);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v9);

  }
}

- (BOOL)canSetDockIconActivationMode
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage canSetDockIconActivationModeForServerInstance:](v3, "canSetDockIconActivationModeForServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4092, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (void)systemAppInfoWithQuery:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  id v11;
  AXIPCMessage *v12;
  AXIPCMessage *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  _QWORD v18[5];
  id v19;
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serverInstance:springBoardSystemInfoQuery:", v8, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v18[1] = MEMORY[0x1E0C809B0];
    v18[2] = 3221225472;
    v18[3] = __57__AXSpringBoardServer_systemAppInfoWithQuery_completion___block_invoke;
    v18[4] = &unk_1E24C54A8;
    v10 = &v20;
    v19 = v9;
    v20 = v6;
    v11 = v6;
    v12 = v9;
    AXPerformBlockAsynchronouslyOnMainThread();

  }
  else
  {
    v13 = [AXIPCMessage alloc];
    v21 = CFSTR("query");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[AXIPCMessage initWithKey:payload:](v13, "initWithKey:payload:", 4045, v15);

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __57__AXSpringBoardServer_systemAppInfoWithQuery_completion___block_invoke_2;
    v17[3] = &unk_1E24C54D0;
    v10 = (id *)v18;
    v18[0] = v6;
    v16 = v6;
    -[AXServer sendAsynchronousMessage:replyOnQueue:objectResultHandler:](self, "sendAsynchronousMessage:replyOnQueue:objectResultHandler:", v12, MEMORY[0x1E0C80D38], v17);
  }

}

uint64_t __57__AXSpringBoardServer_systemAppInfoWithQuery_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __57__AXSpringBoardServer_systemAppInfoWithQuery_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isSystemAppShowingAnAlert
{
  void *v3;
  void *v4;
  char v5;
  AXIPCMessage *v6;
  void *v7;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isSystemAppShowingAnAlertWithServerInstance:", v4);
  }
  else
  {
    v6 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4501, 0);
    -[AXServer sendMessage:](self, "sendMessage:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "payload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("result"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "BOOLValue");

  }
  return v5;
}

- (void)setBluetoothPowerEnabled:(BOOL)a3
{
  _BOOL8 v3;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  id v9;
  const __CFString *v10;
  _QWORD v11[2];

  v3 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = [AXIPCMessage alloc];
  v10 = CFSTR("result");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 4128, v7);
  v9 = -[AXServer sendMessage:](self, "sendMessage:", v8);

}

- (BOOL)bluetoothPowerEnabled
{
  AXIPCMessage *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4129, 0);
  -[AXServer sendMessage:](self, "sendMessage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("result"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)setVoiceOverEnabled:(BOOL)a3
{
  _BOOL8 v3;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  id v9;
  const __CFString *v10;
  _QWORD v11[2];

  v3 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = [AXIPCMessage alloc];
  v10 = CFSTR("result");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 4126, v7);
  v9 = -[AXServer sendMessage:](self, "sendMessage:", v8);

}

- (BOOL)voiceOverEnabled
{
  AXIPCMessage *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4127, 0);
  -[AXServer sendMessage:](self, "sendMessage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("result"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)setZoomEnabled:(BOOL)a3
{
  _BOOL8 v3;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  id v9;
  const __CFString *v10;
  _QWORD v11[2];

  v3 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = [AXIPCMessage alloc];
  v10 = CFSTR("result");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 4124, v7);
  v9 = -[AXServer sendMessage:](self, "sendMessage:", v8);

}

- (BOOL)zoomEnabled
{
  AXIPCMessage *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4125, 0);
  -[AXServer sendMessage:](self, "sendMessage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("result"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (id)focusedAppPID
{
  void *v3;
  void *v4;
  AXIPCMessage *v5;
  void *v6;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "focusedAppPIDWithServerInstance:", v4);
  }
  else
  {
    v5 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4503, 0);
    -[AXServer sendMessage:](self, "sendMessage:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "payload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("result"));
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)purpleBuddyPID
{
  void *v3;
  void *v4;
  int v5;
  AXIPCMessage *v6;
  void *v7;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "purpleBuddyPIDWithServerInstance:", v4);
  }
  else
  {
    v6 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4507, 0);
    -[AXServer sendMessage:](self, "sendMessage:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "payload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("result"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "integerValue");

  }
  return v5;
}

- (void)purpleBuddyPID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  AXIPCMessage *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD block[5];
  id v12;

  v4 = a3;
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__AXSpringBoardServer_purpleBuddyPID___block_invoke;
    block[3] = &unk_1E24C5340;
    block[4] = self;
    v12 = v4;
    v5 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v6 = v12;
  }
  else
  {
    v7 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4507, 0);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __38__AXSpringBoardServer_purpleBuddyPID___block_invoke_2;
    v9[3] = &unk_1E24C5458;
    v10 = v4;
    v8 = v4;
    -[AXServer sendAsynchronousMessage:replyOnQueue:handler:](self, "sendAsynchronousMessage:replyOnQueue:handler:", v7, MEMORY[0x1E0C80D38], v9);

    v6 = v10;
  }

}

uint64_t __38__AXSpringBoardServer_purpleBuddyPID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_axSpringBoardServerInstanceDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_axSpringBoardServerInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "purpleBuddyPIDWithServerInstance:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __38__AXSpringBoardServer_purpleBuddyPID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "payload");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("result"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(v3, "integerValue"));

}

- (id)runningAppPIDs
{
  void *v3;
  void *v4;
  AXIPCMessage *v5;
  void *v6;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "runningAppPIDsWithServerInstance:", v4);
  }
  else
  {
    v5 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4504, 0);
    -[AXServer sendMessage:](self, "sendMessage:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "payload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("result"));
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isSystemAppFrontmost
{
  return -[AXSpringBoardServer _isSystemAppFrontmostExcludingSiri:](self, "_isSystemAppFrontmostExcludingSiri:", 0);
}

- (void)isSystemAppFrontmost:(id)a3
{
  -[AXSpringBoardServer _isSystemAppFrontmostExcludingSiri:completion:](self, "_isSystemAppFrontmostExcludingSiri:completion:", 0, a3);
}

- (BOOL)isSystemAppFrontmostExludingSiri
{
  return -[AXSpringBoardServer _isSystemAppFrontmostExcludingSiri:](self, "_isSystemAppFrontmostExcludingSiri:", 1);
}

- (void)_isSystemAppFrontmostExcludingSiri:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  AXIPCMessage *v10;
  void *v11;
  AXIPCMessage *v12;
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v4 = a3;
  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "isSystemAppFrontmostExcludingSiri:withServerInstance:", v4, v8);

    v13 = v6;
    AXPerformBlockAsynchronouslyOnMainThread();
    v9 = v13;
  }
  else
  {
    v10 = [AXIPCMessage alloc];
    v14 = CFSTR("excludeSiri");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[AXIPCMessage initWithKey:payload:](v10, "initWithKey:payload:", 4500, v11);
    -[AXServer sendAsynchronousMessage:replyOnQueue:BOOLResultHandler:](self, "sendAsynchronousMessage:replyOnQueue:BOOLResultHandler:", v12, MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __69__AXSpringBoardServer__isSystemAppFrontmostExcludingSiri_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_isSystemAppFrontmostExcludingSiri:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char v7;
  AXIPCMessage *v8;
  void *v9;
  void *v10;
  AXIPCMessage *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v3 = a3;
  v14[1] = *MEMORY[0x1E0C80C00];
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isSystemAppFrontmostExcludingSiri:withServerInstance:", v3, v6);

  }
  else
  {
    v8 = [AXIPCMessage alloc];
    v13 = CFSTR("excludeSiri");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AXIPCMessage initWithKey:payload:](v8, "initWithKey:payload:", 4500, v10);
    v7 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v11);

  }
  return v7;
}

- (BOOL)isPurpleBuddyAppFrontmost
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isPurpleBuddyAppFrontmostWithServerInstance:](v3, "isPurpleBuddyAppFrontmostWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4506, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (BOOL)dismissBuddyIfNecessary
{
  int v3;
  char v4;
  int v5;
  BOOL v6;
  _BOOL4 v7;
  char v8;
  const void *AppElementWithPid;
  void *v11;
  void *v12;
  char v13;

  if ((AXDeviceHasHomeButton() & 1) != 0)
    return 0;
  v3 = AXIsBuddyCompleted();
  v4 = v3;
  v5 = dismissBuddyIfNecessary_hasSeenNonBuddyFrontMostApp;
  if (dismissBuddyIfNecessary_hasSeenNonBuddyFrontMostApp)
    v6 = 1;
  else
    v6 = v3 == 0;
  if (!v6)
  {
    v7 = -[AXSpringBoardServer isPurpleBuddyAppFrontmost](self, "isPurpleBuddyAppFrontmost");
    v5 = !v7;
    dismissBuddyIfNecessary_hasSeenNonBuddyFrontMostApp = !v7;
  }
  v8 = v5 ? v4 : 0;
  if ((v8 & 1) != 0)
    return 0;
  -[AXSpringBoardServer purpleBuddyPID](self, "purpleBuddyPID");
  AppElementWithPid = (const void *)_AXUIElementCreateAppElementWithPid();
  objc_msgSend(MEMORY[0x1E0CF40C8], "elementWithAXUIElement:", AppElementWithPid);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (AppElementWithPid)
    CFRelease(AppElementWithPid);
  objc_msgSend(v11, "uiElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "performAXAction:", 4019);

  return v13;
}

- (BOOL)isSettingsAppFrontmost
{
  AXIPCMessage *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXIPCMessage isSettingsAppFrontmostWithServerInstance:](v3, "isSettingsAppFrontmostWithServerInstance:", v4);

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4505, 0);
    v5 = -[AXServer sendSimpleMessageWithResult:](self, "sendSimpleMessageWithResult:", v3);
  }

  return v5;
}

- (id)focusedApps
{
  void *v3;
  void *v4;
  uint64_t v5;
  AXIPCMessage *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "focusedAppsWithServerInstance:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4509, 0);
    -[AXServer sendSimpleMessageWithObjectResult:](self, "sendSimpleMessageWithObjectResult:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v7 = (void *)MEMORY[0x1E0CB3710];
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v4, v3, 0);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v5;

LABEL_7:
  return v10;
}

- (id)displayIdentifierForSceneIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  void *v9;
  AXIPCMessage *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayIdentifierForSceneIdentifier:serverInstance:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = [AXIPCMessage alloc];
    v17 = CFSTR("sceneIdentifier");
    v18[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[AXIPCMessage initWithKey:payload:](v8, "initWithKey:payload:", 4120, v9);
    -[AXServer sendSimpleMessageWithObjectResult:](self, "sendSimpleMessageWithObjectResult:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB3710];
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      objc_msgSend(v12, "unarchivedObjectOfClasses:fromData:error:", v13, v11, &v16);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v16;

      if (v14)
        _AXLogWithFacility();

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)focusedOccludedAppScenes
{
  void *v3;
  void *v4;
  void *v5;
  AXIPCMessage *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "focusedOccludedAppScenesWithServerInstance:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4510, 0);
    -[AXServer sendSimpleMessageWithObjectResult:](self, "sendSimpleMessageWithObjectResult:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3710];
      v10 = (void *)MEMORY[0x1E0C99E60];
      v11 = objc_opt_class();
      objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v12, v8, &v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v15;

      if (v14)
        _AXLogWithFacility();

    }
    else
    {
      v13 = 0;
    }

    return v13;
  }
}

- (void)acquireAssertionWithType:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "acquireAssertionWithType:identifier:clientPort:", v6, v7, 0);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AXSpringBoardServer;
    -[AXServer acquireAssertionWithType:identifier:](&v9, sel_acquireAssertionWithType_identifier_, v6, v7);
  }

}

- (void)relinquishAssertionWithType:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "relinquishAssertionWithType:identifier:clientPort:", v6, v7, 0);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AXSpringBoardServer;
    -[AXServer relinquishAssertionWithType:identifier:](&v9, sel_relinquishAssertionWithType_identifier_, v6, v7);
  }

}

- (BOOL)loadGAXBundleForUnmanagedASAM
{
  void *v3;
  void *v4;
  BOOL v5;
  AXIPCMessage *v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "forceLoadGAXBundleWithServerInstance:", v4);

    return 1;
  }
  else
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v6 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4069, 0);
    -[AXServer client](self, "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v7, "sendSimpleMessage:withError:", v6, &v10);
    v8 = v10;

    v5 = v8 == 0;
  }
  return v5;
}

- (void)reactivateInCallService
{
  void *v3;
  AXIPCMessage *v4;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage reactivateInCallServiceWithServerInstance:](v4, "reactivateInCallServiceWithServerInstance:", v3);
  }
  else
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4084, 0);
    -[AXServer client](self, "client");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sendSimpleMessage:", v4);
  }

}

- (void)launchMagnifierApp
{
  void *v3;
  AXIPCMessage *v4;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage launchMagnifierAppWithServerInstance:](v4, "launchMagnifierAppWithServerInstance:", v3);
  }
  else
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4070, 0);
    -[AXServer client](self, "client");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sendSimpleMessage:", v4);
  }

}

- (void)isMagnifierVisibleWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  AXIPCMessage *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  char v17;

  v4 = a3;
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isMagnifierVisibleWithServerInstance:", v6);

    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __56__AXSpringBoardServer_isMagnifierVisibleWithCompletion___block_invoke;
    v15 = &unk_1E24C54F8;
    v16 = v4;
    v17 = v7;
    v8 = (AXIPCMessage *)v4;
    AXPerformBlockOnMainThread();
  }
  else
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v8 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4071, 0);
    -[AXServer client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__AXSpringBoardServer_isMagnifierVisibleWithCompletion___block_invoke_2;
    v10[3] = &unk_1E24C5458;
    v11 = v4;
    v4 = v4;
    objc_msgSend(v9, "sendAsyncMessage:withReplyHandler:", v8, v10);

  }
}

uint64_t __56__AXSpringBoardServer_isMagnifierVisibleWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __56__AXSpringBoardServer_isMagnifierVisibleWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v6 = a3;
  if (v6)
  {
    _AXLogWithFacility();
  }
  else if (v10)
  {
    objc_msgSend(v10, "payload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("result"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "BOOLValue");

    goto LABEL_6;
  }
  v7 = 0;
LABEL_6:
  (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v7, v5);

}

- (void)launchOnboardingViewService:(id)a3
{
  id v4;
  void *v5;
  AXIPCMessage *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = CFSTR("type");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v6 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage launchOnboardingViewServiceWithServerInstance:data:](v6, "launchOnboardingViewServiceWithServerInstance:data:", v7, v5);
  }
  else
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v6 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4122, v5);
    -[AXServer client](self, "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendSimpleMessage:", v6);
  }

}

- (void)launchVoiceOverQuickSettingsViewService:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  AXIPCMessage *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v9 = CFSTR("data");
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
    {
      -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
      v7 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
      -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXIPCMessage launchVoiceOverQuickSettingsViewServiceWithServerInstance:data:](v7, "launchVoiceOverQuickSettingsViewServiceWithServerInstance:data:", v8, v6);
    }
    else
    {
      -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
      v7 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4094, v6);
      -[AXServer client](self, "client");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sendSimpleMessage:", v7);
    }

  }
}

- (void)launchVoiceOverImageExplorerViewServiceForResult:(id)a3 withData:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  AXIPCMessage *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3)
  {
    v28 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v28);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v28;
    v27 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v27);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v27;
    v11 = v10;
    if (v8 || !v7)
    {
      AXLogSpringboardServer();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[AXSpringBoardServer launchVoiceOverImageExplorerViewServiceForResult:withData:].cold.2((uint64_t)v8, v12, v15, v16, v17, v18, v19, v20);
    }
    else if (v10 || !v9)
    {
      AXLogSpringboardServer();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[AXSpringBoardServer launchVoiceOverImageExplorerViewServiceForResult:withData:].cold.3((uint64_t)v11, v12, v21, v22, v23, v24, v25, v26);
    }
    else
    {
      v29[0] = CFSTR("VoiceOverImageExplorerVisionResultData");
      v29[1] = CFSTR("VoiceOverImageExplorerElementInfo");
      v30[0] = v7;
      v30[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
      v12 = objc_claimAutoreleasedReturnValue();
      if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
      {
        -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
        v13 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
        -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXIPCMessage launchVoiceOverImageExplorerViewServiceWithServerInstance:forData:](v13, "launchVoiceOverImageExplorerViewServiceWithServerInstance:forData:", v14, v12);
      }
      else
      {
        -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
        v13 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4105, v12);
        -[AXServer client](self, "client");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sendSimpleMessage:", v13);
      }

    }
  }
  else
  {
    AXLogSpringboardServer();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[AXSpringBoardServer launchVoiceOverImageExplorerViewServiceForResult:withData:].cold.1();
  }

}

- (id)visibleTripleClickItems
{
  AXIPCMessage *v3;
  void *v4;
  void *v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage visibleTripleClickItemsWithServerInstance:](v3, "visibleTripleClickItemsWithServerInstance:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4108, 0);
    -[AXServer sendSimpleMessageWithObjectResult:](self, "sendSimpleMessageWithObjectResult:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)isAppleWatchRemoteScreenActive
{
  int v2;
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = _AXSTwiceRemoteScreenEnabled();
  if (v2)
  {
    AXLogTwiceRemoteScreen();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[AXSpringBoardServer isAppleWatchRemoteScreenActive]";
      _os_log_impl(&dword_18C62B000, v3, OS_LOG_TYPE_DEFAULT, "[TWICE] %s", (uint8_t *)&v5, 0xCu);
    }

  }
  return v2 != 0;
}

- (BOOL)isNonExclusiveSystemUIFocusableIncludingPIPWindow:(BOOL)a3
{
  return -[AXSpringBoardServer isNonExclusiveSystemUIFocusableIncludingPIPWindow:includingNonDismissableElements:](self, "isNonExclusiveSystemUIFocusableIncludingPIPWindow:includingNonDismissableElements:", a3, 1);
}

- (BOOL)isNonExclusiveSystemUIFocusableIncludingPIPWindow:(BOOL)a3 includingNonDismissableElements:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;

  v4 = a4;
  v5 = a3;
  if (-[AXSpringBoardServer isNotificationVisible](self, "isNotificationVisible")
    || -[AXSpringBoardServer isDockVisible](self, "isDockVisible")
    || -[AXSpringBoardServer isScreenshotWindowVisible](self, "isScreenshotWindowVisible")
    || -[AXSpringBoardServer isSiriVisible](self, "isSiriVisible")
    || v5 && -[AXSpringBoardServer isPIPWindowVisible](self, "isPIPWindowVisible")
    || -[AXSpringBoardServer isBannerVisible](self, "isBannerVisible")
    || -[AXSpringBoardServer isStageManagerSwitcherVisible](self, "isStageManagerSwitcherVisible"))
  {
    return 1;
  }
  if (AXDoesRequestingClientDeserveAutomation())
    return 0;
  return -[AXSpringBoardServer isStatusBarNativeFocusableIncludingNonDismissableElements:](self, "isStatusBarNativeFocusableIncludingNonDismissableElements:", v4);
}

- (void)freezeClarityUILoadingScreenWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AXIPCMessage *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;

  v4 = a3;
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "freezeClarityUILoadingScreenWithServerInstance:", v6);

    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __66__AXSpringBoardServer_freezeClarityUILoadingScreenWithCompletion___block_invoke;
    v14 = &unk_1E24C5408;
    v15 = v4;
    v7 = (AXIPCMessage *)v4;
    AXPerformBlockOnMainThread();
  }
  else
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v7 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4116, 0);
    -[AXServer client](self, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__AXSpringBoardServer_freezeClarityUILoadingScreenWithCompletion___block_invoke_2;
    v9[3] = &unk_1E24C5458;
    v10 = v4;
    v4 = v4;
    objc_msgSend(v8, "sendAsyncMessage:withReplyHandler:", v7, v9);

  }
}

uint64_t __66__AXSpringBoardServer_freezeClarityUILoadingScreenWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__AXSpringBoardServer_freezeClarityUILoadingScreenWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;

  if (a3)
  {
    CLFLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __66__AXSpringBoardServer_freezeClarityUILoadingScreenWithCompletion___block_invoke_2_cold_1();

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)presentNearbyDeviceControlPicker
{
  void *v3;
  AXIPCMessage *v4;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage presentNearbyDeviceControlPickerWithServerInstance:](v4, "presentNearbyDeviceControlPickerWithServerInstance:", v3);
  }
  else
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4117, 0);
    -[AXServer client](self, "client");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sendAsyncMessage:withReplyHandler:", v4, &__block_literal_global_409);
  }

}

void __55__AXSpringBoardServer_presentNearbyDeviceControlPicker__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    AXLogSpringboardServer();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __55__AXSpringBoardServer_presentNearbyDeviceControlPicker__block_invoke_cold_1((uint64_t)v3, v4);

  }
}

- (void)requestDismissJindo
{
  void *v3;
  AXIPCMessage *v4;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage diminishJindoWithServerInstance:](v4, "diminishJindoWithServerInstance:", v3);

  }
  else
  {
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4118, 0);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }

}

- (id)jindoAppBundleIndentifiers
{
  AXIPCMessage *v3;
  void *v4;
  void *v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage jindoAppBundleIndentifiersWithServerInstance:](v3, "jindoAppBundleIndentifiersWithServerInstance:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4121, 0);
    -[AXServer sendSimpleMessageWithObjectResult:](self, "sendSimpleMessageWithObjectResult:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)toggleDetectionMode
{
  void *v3;
  AXIPCMessage *v4;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage toggleDetectionModeWithServerInstance:](v4, "toggleDetectionModeWithServerInstance:", v3);

  }
  else
  {
    -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4119, 0);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }

}

- (BOOL)isMagnifierVisible
{
  void *v3;
  void *v4;
  char v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isMagnifierVisibleWithServerInstance:", v4);

    return v5;
  }
  else
  {
    _AXAssert();
    return 0;
  }
}

- (id)applicationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverInstance:appWithIdentifier:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _AXAssert();
    v7 = 0;
  }

  return v7;
}

- (id)focusedAppProcess
{
  void *v3;
  void *v4;
  void *v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "focusedAppProcessWithServerInstance:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _AXAssert();
    v5 = 0;
  }
  return v5;
}

- (id)runningAppProcesses
{
  void *v3;
  void *v4;
  void *v5;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "runningAppProcessesWithServerInstance:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _AXAssert();
    v5 = 0;
  }
  return v5;
}

- (id)appNameFromPid:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v9;
  void *v10;
  void *v11;
  AXIPCMessage *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v3 = *(_QWORD *)&a3;
  v15[1] = *MEMORY[0x1E0C80C00];
  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appNameFromPid:withServerInstance:", v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    v9 = [AXIPCMessage alloc];
    v14 = CFSTR("pid");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[AXIPCMessage initWithKey:payload:](v9, "initWithKey:payload:", 4114, v11);
    -[AXServer sendSimpleMessageWithObjectResult:](self, "sendSimpleMessageWithObjectResult:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
}

- (void)toggleLiveTranscription
{
  void *v3;
  AXIPCMessage *v4;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage toggleLiveTranscriptionWithServerInstance:](v4, "toggleLiveTranscriptionWithServerInstance:", v3);

  }
  else
  {
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4115, 0);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }

}

- (void)toggleConversationBoost
{
  void *v3;
  AXIPCMessage *v4;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v4 = (AXIPCMessage *)objc_claimAutoreleasedReturnValue();
    -[AXSpringBoardServer _axSpringBoardServerInstance](self, "_axSpringBoardServerInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCMessage toggleConversationBoostWithServerInstance:](v4, "toggleConversationBoostWithServerInstance:", v3);

  }
  else
  {
    v4 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4130, 0);
    -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:");
  }

}

- (int)nativeFocusedApplication
{
  void *v3;
  int v4;
  AXIPCMessage *v5;
  void *v6;
  int v7;

  if (-[AXSpringBoardServer _shouldDispatchLocally](self, "_shouldDispatchLocally"))
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "nativeFocusedApplication");
  }
  else
  {
    objc_opt_class();
    v5 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 4123, 0);
    -[AXServer sendSimpleMessageWithObjectResult:](self, "sendSimpleMessageWithObjectResult:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v3, "intValue");
  }
  v7 = v4;

  return v7;
}

- (AXAccessQueue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (id)currentAlertHandler
{
  return self->_currentAlertHandler;
}

- (void)setCurrentAlertHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setActionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_actionHandlers, a3);
}

- (NSMutableDictionary)reachabilityHandlers
{
  return self->_reachabilityHandlers;
}

- (void)setReachabilityHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_reachabilityHandlers, a3);
}

- (NSMutableDictionary)mediaPlayingHandlers
{
  return self->_mediaPlayingHandlers;
}

- (void)setMediaPlayingHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_mediaPlayingHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaPlayingHandlers, 0);
  objc_storeStrong((id *)&self->_reachabilityHandlers, 0);
  objc_storeStrong((id *)&self->_actionHandlers, 0);
  objc_storeStrong(&self->_currentAlertHandler, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (id)_axSpringBoardServerInstance
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)_axSpringBoardServerInstance_AXSBServerInstance;
  if (!_axSpringBoardServerInstance_AXSBServerInstance)
  {
    -[AXSpringBoardServer _axSpringBoardServerInstanceIfExists](self, "_axSpringBoardServerInstanceIfExists");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)_axSpringBoardServerInstance_AXSBServerInstance;
    _axSpringBoardServerInstance_AXSBServerInstance = v4;

    v3 = (void *)_axSpringBoardServerInstance_AXSBServerInstance;
    if (!_axSpringBoardServerInstance_AXSBServerInstance)
    {
      v6 = -[AXSpringBoardServer _axSpringBoardServerInstanceDelegate](self, "_axSpringBoardServerInstanceDelegate");
      -[AXSpringBoardServer _axSpringBoardServerInstanceIfExists](self, "_axSpringBoardServerInstanceIfExists");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)_axSpringBoardServerInstance_AXSBServerInstance;
      _axSpringBoardServerInstance_AXSBServerInstance = v7;

      v3 = (void *)_axSpringBoardServerInstance_AXSBServerInstance;
    }
  }
  return v3;
}

- (id)_axSpringBoardServerInstanceIfExists
{
  return (id)-[objc_class safeValueForKey:](NSClassFromString(CFSTR("_AXSpringBoardServerInstance")), "safeValueForKey:", CFSTR("springBoardServerInstanceIfExists"));
}

- (id)_axSpringBoardServerInstanceDelegate
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)_axSpringBoardServerInstanceDelegate_delegate;
  if (!_axSpringBoardServerInstanceDelegate_delegate)
  {
    -[objc_class initialize](NSClassFromString(CFSTR("AXSpringBoardServerHelper")), "initialize");
    -[AXSpringBoardServer _axSpringBoardServerInstanceIfExists](self, "_axSpringBoardServerInstanceIfExists");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("delegate"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)_axSpringBoardServerInstanceDelegate_delegate;
    _axSpringBoardServerInstanceDelegate_delegate = v5;

    v3 = (void *)_axSpringBoardServerInstanceDelegate_delegate;
  }
  return v3;
}

uint64_t __74__AXSpringBoardServer_AXSpringBoardServer_Private___shouldDispatchLocally__block_invoke()
{
  uint64_t result;

  result = AXProcessIsSpringBoard();
  _shouldDispatchLocally_result = result;
  return result;
}

void __29__AXSpringBoardServer_server__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18C62B000, v0, v1, "Incorrect attempt to use AXSpringBoardServer while ClarityBoard was running.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)isStatusBarNativeFocusableIncludingNonDismissableElements:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C62B000, v0, v1, "Unexpectedly attempted to check focusability of status bar outside of SpringBoard.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)launchVoiceOverImageExplorerViewServiceForResult:withData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18C62B000, v0, v1, "Image Explorer : visionResult is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)launchVoiceOverImageExplorerViewServiceForResult:(uint64_t)a3 withData:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_18C62B000, a2, a3, "Failed to archive AXMVisionResult. error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)launchVoiceOverImageExplorerViewServiceForResult:(uint64_t)a3 withData:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_18C62B000, a2, a3, "Failed to archive AXSBImageExplorerData. error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)setShouldFocusNonExclusiveSystemUI:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18C62B000, v0, v1, "Attempted to call -setShouldFocusNonExclusiveSystemUI: outside of SpringBoard", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __66__AXSpringBoardServer_freezeClarityUILoadingScreenWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C62B000, v0, v1, "Unable to freeze ClarityUI loading screen.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __55__AXSpringBoardServer_presentNearbyDeviceControlPicker__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18C62B000, a2, OS_LOG_TYPE_ERROR, "failed to present nearby device control picker with error: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5();
}

@end
