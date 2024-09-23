@implementation AXClarityBoardServer

+ (BOOL)isAvailable
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D10780], "sharedSystemShellSwitcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isClarityBoardEnabled");

  return v3;
}

+ (id)server
{
  id v2;
  NSObject *v3;

  if ((objc_msgSend(a1, "isAvailable") & 1) != 0)
  {
    if (server_onceToken_5 != -1)
      dispatch_once(&server_onceToken_5, &__block_literal_global_21);
    v2 = (id)server_Server_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D10750], "commonLog");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      +[AXClarityBoardServer server].cold.1(v3);

    v2 = 0;
  }
  return v2;
}

void __30__AXClarityBoardServer_server__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)server_Server_5;
  server_Server_5 = v0;

}

- (int64_t)activeInterfaceOrientation
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  int64_t v7;

  if (!-[AXServer _connectIfNecessary](self, "_connectIfNecessary"))
    return 0;
  v3 = [AXIPCMessage alloc];
  v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", AXClarityBoardMessageKeyActiveInterfaceOrientation, 0);
  -[AXServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:withError:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AXClarityBoardServer _integerFromReply:](self, "_integerFromReply:", v6);
  return v7;
}

- (void)activeInterfaceOrientation:(id)a3
{
  id v4;
  AXIPCMessage *v5;
  AXIPCMessage *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[4];
  id v12;

  v4 = a3;
  if (-[AXServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v5 = [AXIPCMessage alloc];
    v6 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", AXClarityBoardMessageKeyActiveInterfaceOrientation, 0);
    -[AXServer client](self, "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__AXClarityBoardServer_activeInterfaceOrientation___block_invoke_2;
    v9[3] = &unk_1E24C7438;
    v9[4] = self;
    v10 = v4;
    v8 = v4;
    objc_msgSend(v7, "sendAsyncMessage:replyOnQueue:replyHandler:", v6, MEMORY[0x1E0C80D38], v9);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__AXClarityBoardServer_activeInterfaceOrientation___block_invoke;
    block[3] = &unk_1E24C5408;
    v12 = v4;
    v6 = (AXIPCMessage *)v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v8 = v12;
  }

}

uint64_t __51__AXClarityBoardServer_activeInterfaceOrientation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__AXClarityBoardServer_activeInterfaceOrientation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_integerFromReply:", a2));
}

- (BOOL)dismissSiri
{
  return 0;
}

- (BOOL)isAppSwitcherVisible
{
  return 0;
}

- (BOOL)isControlCenterVisible
{
  return 0;
}

- (BOOL)isDockVisible
{
  return 0;
}

- (BOOL)isLockScreenVisible
{
  return 0;
}

- (void)isMediaPlayingForApp:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (BOOL)isNonExclusiveSystemUIFocusableIncludingPIPWindow:(BOOL)a3
{
  return 0;
}

- (BOOL)isNotificationCenterVisible
{
  return 0;
}

- (BOOL)isNotificationVisible
{
  return 0;
}

- (BOOL)isNowPlayingUIVisible
{
  return 0;
}

- (BOOL)isPasscodeLockVisible
{
  return 0;
}

- (BOOL)isReceivingAirPlay
{
  return 0;
}

- (BOOL)isScreenSaverVisible
{
  return 0;
}

- (BOOL)isScreenshotWindowVisible
{
  return 0;
}

- (BOOL)isShelfSwitcherVisible
{
  return 0;
}

- (BOOL)isSiriTalkingOrListening
{
  return 0;
}

- (BOOL)isSiriVisible
{
  return 0;
}

- (BOOL)isSoftwareUpdateUIVisible
{
  return 0;
}

- (BOOL)isStageManagerSwitcherVisible
{
  return 0;
}

- (BOOL)isSystemSleeping
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (!-[AXServer _connectIfNecessary](self, "_connectIfNecessary"))
    return 0;
  v3 = [AXIPCMessage alloc];
  v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", AXClarityBoardMessageKeyIsSystemSleeping, 0);
  -[AXServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:withError:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AXClarityBoardServer _BOOLFromReply:](self, "_BOOLFromReply:", v6) != 0;
  return v7;
}

- (int)pid
{
  int result;
  AXIPCMessage *v4;
  AXIPCMessage *v5;
  void *v6;
  void *v7;

  result = _ClarityBoardPid;
  if (_ClarityBoardPid == -1)
  {
    if (-[AXServer _connectIfNecessary](self, "_connectIfNecessary"))
    {
      v4 = [AXIPCMessage alloc];
      v5 = -[AXIPCMessage initWithKey:payload:](v4, "initWithKey:payload:", AXClarityBoardMessageKeyPID, 0);
      -[AXServer client](self, "client");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sendMessage:withError:", v5, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      _ClarityBoardPid = -[AXClarityBoardServer _pidFromReply:](self, "_pidFromReply:", v7);
      return _ClarityBoardPid;
    }
    else
    {
      return -1;
    }
  }
  return result;
}

- (void)pid:(id)a3
{
  id v4;
  int v5;
  AXIPCMessage *v6;
  AXIPCMessage *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[4];
  AXIPCMessage *v12;
  int v13;
  _QWORD v14[4];
  AXIPCMessage *v15;

  v4 = a3;
  if (-[AXServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v5 = _ClarityBoardPid;
    if (_ClarityBoardPid == -1)
    {
      v7 = [AXIPCMessage alloc];
      v6 = -[AXIPCMessage initWithKey:payload:](v7, "initWithKey:payload:", AXClarityBoardMessageKeyPID, 0);
      -[AXServer client](self, "client");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __28__AXClarityBoardServer_pid___block_invoke_3;
      v9[3] = &unk_1E24C5930;
      v9[4] = self;
      v10 = v4;
      objc_msgSend(v8, "sendAsyncMessage:replyOnQueue:replyHandler:", v6, MEMORY[0x1E0C80D38], v9);

    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __28__AXClarityBoardServer_pid___block_invoke_2;
      block[3] = &unk_1E24C5430;
      v12 = (AXIPCMessage *)v4;
      v13 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v6 = v12;
    }
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __28__AXClarityBoardServer_pid___block_invoke;
    v14[3] = &unk_1E24C5408;
    v15 = (AXIPCMessage *)v4;
    dispatch_async(MEMORY[0x1E0C80D38], v14);
    v6 = v15;
  }

}

uint64_t __28__AXClarityBoardServer_pid___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __28__AXClarityBoardServer_pid___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

uint64_t __28__AXClarityBoardServer_pid___block_invoke_3(uint64_t a1, uint64_t a2)
{
  _ClarityBoardPid = objc_msgSend(*(id *)(a1 + 32), "_pidFromReply:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)showControlCenter:(BOOL)a3
{
  return 0;
}

- (void)wakeUpDeviceIfNecessary
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;

  v3 = [AXIPCMessage alloc];
  v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", AXClarityBoardMessageKeyWakeUpDeviceIfNecessary, 0);
  -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v4);

}

- (BOOL)toggleIncomingCall
{
  return 0;
}

- (void)setOrientation:(int64_t)a3
{
  AXIPCMessage *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  AXIPCMessage *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = [AXIPCMessage alloc];
  v6 = AXClarityBoardMessageKeySetOrientation;
  v10 = CFSTR("orientation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", v6, v8);
  -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v9);

}

- (void)goHome
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;

  v3 = [AXIPCMessage alloc];
  v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", AXClarityBoardMessageKeyGoHome, 0);
  -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v4);

}

- (void)unlockDevice
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;

  v3 = [AXIPCMessage alloc];
  v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", AXClarityBoardMessageKeyUnlockDevice, 0);
  -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v4);

}

- (void)registerActionHandler:(id)a3 withIdentifierCallback:(id)a4
{
  -[AXServer _registerActionHandler:withIdentifierCallback:retryInterval:registrationMessageKey:](self, "_registerActionHandler:withIdentifierCallback:retryInterval:registrationMessageKey:", a3, a4, AXClarityBoardMessageKeyRegisterActionHandler, 5.0);
}

- (void)removeActionHandler:(id)a3
{
  -[AXServer _removeActionHandler:registrationMessageKey:](self, "_removeActionHandler:registrationMessageKey:", a3, AXClarityBoardMessageKeyRegisterActionHandler);
}

- (int)_actionResultKey
{
  return AXClarityBoardMessageKeyActionResult;
}

- (id)_serviceName
{
  return CFSTR("com.apple.accessibility.AXClarityBoardServer");
}

- (void)_wasDisconnectedFromClient
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXClarityBoardServer;
  -[AXServer _wasDisconnectedFromClient](&v3, sel__wasDisconnectedFromClient);
  _ClarityBoardPid = -1;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("AXSystemAppServerDiedNotification"), 0);

}

- (void)_didConnectToClient
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AXClarityBoardServer;
  -[AXServer _didConnectToClient](&v2, sel__didConnectToClient);
  _ClarityBoardPid = -1;
}

- (int64_t)_BOOLFromReply:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  if (!a3)
    return 0;
  objc_msgSend(a3, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("result"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (int64_t)_integerFromReply:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  if (!a3)
    return 0;
  objc_msgSend(a3, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("result"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (int)_pidFromReply:(id)a3
{
  void *v3;
  void *v4;
  int v5;

  if (!a3)
    return -1;
  objc_msgSend(a3, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("result"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  if (v5)
    return v5;
  else
    return -1;
}

+ (void)server
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18C62B000, log, OS_LOG_TYPE_FAULT, "Incorrect attempt to use AXClarityBoardServer while ClarityBoard was not running.", v1, 2u);
}

@end
