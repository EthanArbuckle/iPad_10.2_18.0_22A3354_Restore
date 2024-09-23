@implementation AXSwitchControlServer

+ (id)server
{
  if (server_onceToken_1 != -1)
    dispatch_once(&server_onceToken_1, &__block_literal_global_7);
  return (id)server_Server_1;
}

void __31__AXSwitchControlServer_server__block_invoke()
{
  AXSwitchControlServer *v0;
  void *v1;

  v0 = objc_alloc_init(AXSwitchControlServer);
  v1 = (void *)server_Server_1;
  server_Server_1 = (uint64_t)v0;

}

- (id)_serviceName
{
  return CFSTR("com.apple.accessibility.AXSwitchControlServer");
}

- (BOOL)_connectIfNecessary
{
  int v3;
  objc_super v5;

  if (_AXSAssistiveTouchScannerEnabled() || (v3 = _AXSAssistiveTouchEnabled()) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)AXSwitchControlServer;
    LOBYTE(v3) = -[AXServer _connectIfNecessary](&v5, sel__connectIfNecessary);
  }
  return v3;
}

- (void)_didConnectToClient
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "_serviceName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_18C62B000, v2, v3, "%@ did connect", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_2();
}

- (void)_wasDisconnectedFromClient
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "_serviceName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_18C62B000, v2, v3, "%@ was disconnected", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_2();
}

- (void)_willClearServer
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "_serviceName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_18C62B000, v2, v3, "%@ will clear server info", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_2();
}

- (BOOL)_triggerAutomationCommand:(int64_t)a3
{
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (!-[AXSwitchControlServer _connectIfNecessary](self, "_connectIfNecessary"))
    return 0;
  v5 = [AXIPCMessage alloc];
  v15 = CFSTR("command");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 6509, v7);

  -[AXServer client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendMessage:withError:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("result"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  return v13;
}

- (BOOL)setupAutomation
{
  return -[AXSwitchControlServer _triggerAutomationCommand:](self, "_triggerAutomationCommand:", 0);
}

- (BOOL)tearDownAutomation
{
  return -[AXSwitchControlServer _triggerAutomationCommand:](self, "_triggerAutomationCommand:", 1);
}

- (BOOL)triggerCommand:(int64_t)a3
{
  uint64_t v5;
  char v6;
  AXIPCMessage *v7;
  void *v8;
  void *v9;
  AXIPCMessage *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (!-[AXSwitchControlServer _connectIfNecessary](self, "_connectIfNecessary"))
    return 0;
  if ((unint64_t)(a3 - 1) > 0x16)
    v5 = 0;
  else
    v5 = qword_18C736808[a3 - 1];
  v7 = [AXIPCMessage alloc];
  v16 = CFSTR("action");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AXIPCMessage initWithKey:payload:](v7, "initWithKey:payload:", 6500, v9);

  -[AXServer client](self, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendMessage:withError:", v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "payload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("result"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v14, "BOOLValue");

  return v6;
}

- (id)currentFocusedElement
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[AXSwitchControlServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v3 = [AXIPCMessage alloc];
    v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 6501, MEMORY[0x1E0C9AA70]);
    -[AXServer client](self, "client");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendMessage:withError:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "payload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("result"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)lastSpokenPhrases
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[AXSwitchControlServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v3 = [AXIPCMessage alloc];
    v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 6503, MEMORY[0x1E0C9AA70]);
    -[AXServer client](self, "client");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendMessage:withError:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "payload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("result"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)clearSpokenPhrases
{
  AXIPCMessage *v3;
  void *v4;
  id v5;
  AXIPCMessage *v6;

  if (-[AXSwitchControlServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v3 = [AXIPCMessage alloc];
    v6 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 6511, MEMORY[0x1E0C9AA70]);
    -[AXServer client](self, "client");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "sendMessage:withError:", v6, 0);

  }
}

- (BOOL)isScannerActive
{
  _BOOL4 v3;
  AXIPCMessage *v4;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = -[AXSwitchControlServer _connectIfNecessary](self, "_connectIfNecessary");
  if (v3)
  {
    v4 = [AXIPCMessage alloc];
    v5 = -[AXIPCMessage initWithKey:payload:](v4, "initWithKey:payload:", 6507, MEMORY[0x1E0C9AA70]);
    -[AXServer client](self, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendMessage:withError:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "payload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("result"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    LOBYTE(v3) = v10;
  }
  return v3;
}

- (BOOL)isScannerPaused
{
  _BOOL4 v3;
  AXIPCMessage *v4;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = -[AXSwitchControlServer _connectIfNecessary](self, "_connectIfNecessary");
  if (v3)
  {
    v4 = [AXIPCMessage alloc];
    v5 = -[AXIPCMessage initWithKey:payload:](v4, "initWithKey:payload:", 6508, MEMORY[0x1E0C9AA70]);
    -[AXServer client](self, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendMessage:withError:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "payload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("result"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    LOBYTE(v3) = v10;
  }
  return v3;
}

- (BOOL)isAutoScanEnabled
{
  _BOOL4 v3;
  AXIPCMessage *v4;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = -[AXSwitchControlServer _connectIfNecessary](self, "_connectIfNecessary");
  if (v3)
  {
    v4 = [AXIPCMessage alloc];
    v5 = -[AXIPCMessage initWithKey:payload:](v4, "initWithKey:payload:", 6504, MEMORY[0x1E0C9AA70]);
    -[AXServer client](self, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendMessage:withError:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "payload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("result"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    LOBYTE(v3) = v10;
  }
  return v3;
}

- (BOOL)isManualScanEnabled
{
  _BOOL4 v3;
  AXIPCMessage *v4;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = -[AXSwitchControlServer _connectIfNecessary](self, "_connectIfNecessary");
  if (v3)
  {
    v4 = [AXIPCMessage alloc];
    v5 = -[AXIPCMessage initWithKey:payload:](v4, "initWithKey:payload:", 6505, MEMORY[0x1E0C9AA70]);
    -[AXServer client](self, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendMessage:withError:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "payload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("result"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    LOBYTE(v3) = v10;
  }
  return v3;
}

- (BOOL)isDwellEnabled
{
  _BOOL4 v3;
  AXIPCMessage *v4;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = -[AXSwitchControlServer _connectIfNecessary](self, "_connectIfNecessary");
  if (v3)
  {
    v4 = [AXIPCMessage alloc];
    v5 = -[AXIPCMessage initWithKey:payload:](v4, "initWithKey:payload:", 6506, MEMORY[0x1E0C9AA70]);
    -[AXServer client](self, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendMessage:withError:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "payload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("result"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    LOBYTE(v3) = v10;
  }
  return v3;
}

- (CGPoint)headTrackingPoint
{
  double v3;
  double v4;
  AXIPCMessage *v5;
  AXIPCMessage *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (-[AXSwitchControlServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v5 = [AXIPCMessage alloc];
    v6 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 6510, MEMORY[0x1E0C9AA70]);
    -[AXServer client](self, "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendMessage:withError:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "payload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("result"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "pointValue");
      v3 = v11;
      v4 = v12;
    }

  }
  v13 = v3;
  v14 = v4;
  result.y = v14;
  result.x = v13;
  return result;
}

@end
