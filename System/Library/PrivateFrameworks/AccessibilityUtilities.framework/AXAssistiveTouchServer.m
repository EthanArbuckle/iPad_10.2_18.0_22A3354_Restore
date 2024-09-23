@implementation AXAssistiveTouchServer

+ (id)server
{
  if (server_onceToken_3 != -1)
    dispatch_once(&server_onceToken_3, &__block_literal_global_16);
  return (id)server_Server_3;
}

void __32__AXAssistiveTouchServer_server__block_invoke()
{
  AXAssistiveTouchServer *v0;
  void *v1;

  v0 = objc_alloc_init(AXAssistiveTouchServer);
  v1 = (void *)server_Server_3;
  server_Server_3 = (uint64_t)v0;

}

- (id)_serviceName
{
  return CFSTR("com.apple.accessibility.AXAssistiveTouchServer");
}

- (BOOL)_connectIfNecessary
{
  int v3;
  objc_super v5;

  if (_AXSAssistiveTouchScannerEnabled() || (v3 = _AXSAssistiveTouchEnabled()) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)AXAssistiveTouchServer;
    LOBYTE(v3) = -[AXServer _connectIfNecessary](&v5, sel__connectIfNecessary);
  }
  return v3;
}

- (void)_didConnectToClient
{
  NSObject *v3;

  ASTLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[AXSwitchControlServer _didConnectToClient].cold.1(self);

}

- (void)_wasDisconnectedFromClient
{
  NSObject *v3;

  ASTLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[AXSwitchControlServer _wasDisconnectedFromClient].cold.1(self);

}

- (void)_willClearServer
{
  NSObject *v3;

  ASTLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[AXSwitchControlServer _willClearServer].cold.1(self);

}

- (BOOL)home
{
  _BOOL4 v3;
  AXIPCMessage *v4;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = -[AXAssistiveTouchServer _connectIfNecessary](self, "_connectIfNecessary");
  if (v3)
  {
    v4 = [AXIPCMessage alloc];
    v5 = -[AXIPCMessage initWithKey:payload:](v4, "initWithKey:payload:", 6002, MEMORY[0x1E0C9AA70]);
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

- (CGPoint)getNubbitPosition
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

  v3 = -1.0;
  v4 = -1.0;
  if (-[AXAssistiveTouchServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v5 = [AXIPCMessage alloc];
    v6 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 6023, MEMORY[0x1E0C9AA70]);
    -[AXServer client](self, "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendMessage:withError:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "payload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("result"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "axCGPointValue");
    v3 = v11;
    v4 = v12;

  }
  v13 = v3;
  v14 = v4;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)setNubbitPosition:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  AXIPCMessage *v6;
  void *v7;
  void *v8;
  AXIPCMessage *v9;
  void *v10;
  id v11;
  _QWORD v12[2];
  const __CFString *v13;
  _QWORD v14[2];

  y = a3.y;
  x = a3.x;
  v14[1] = *MEMORY[0x1E0C80C00];
  if (-[AXAssistiveTouchServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v6 = [AXIPCMessage alloc];
    v13 = CFSTR("action");
    *(CGFloat *)v12 = x;
    *(CGFloat *)&v12[1] = y;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v12, "{CGPoint=dd}");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AXIPCMessage initWithKey:payload:](v6, "initWithKey:payload:", 6024, v8);

    -[AXServer client](self, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "sendMessage:withError:", v9, 0);

  }
}

- (void)openMenu
{
  AXIPCMessage *v3;
  void *v4;
  id v5;
  AXIPCMessage *v6;

  if (-[AXAssistiveTouchServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v3 = [AXIPCMessage alloc];
    v6 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 6020, MEMORY[0x1E0C9AA70]);
    -[AXServer client](self, "client");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "sendMessage:withError:", v6, 0);

  }
}

- (void)closeMenu
{
  AXIPCMessage *v3;
  void *v4;
  id v5;
  AXIPCMessage *v6;

  if (-[AXAssistiveTouchServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v3 = [AXIPCMessage alloc];
    v6 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 6021, MEMORY[0x1E0C9AA70]);
    -[AXServer client](self, "client");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "sendMessage:withError:", v6, 0);

  }
}

- (BOOL)isMenuOpen
{
  _BOOL4 v3;
  AXIPCMessage *v4;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = -[AXAssistiveTouchServer _connectIfNecessary](self, "_connectIfNecessary");
  if (v3)
  {
    v4 = [AXIPCMessage alloc];
    v5 = -[AXIPCMessage initWithKey:payload:](v4, "initWithKey:payload:", 6022, MEMORY[0x1E0C9AA70]);
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

- (id)menuItems
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[AXAssistiveTouchServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v3 = [AXIPCMessage alloc];
    v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 6025, MEMORY[0x1E0C9AA70]);
    -[AXServer client](self, "client");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendMessage:withError:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "payload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("result"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("|"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (BOOL)tapMenuItem:(id)a3
{
  id v4;
  AXIPCMessage *v5;
  void *v6;
  AXIPCMessage *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[AXAssistiveTouchServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v5 = [AXIPCMessage alloc];
    v14 = CFSTR("action");
    v15[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 6026, v6);

    -[AXServer client](self, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendMessage:withError:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "payload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("result"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)menuAction:(id)a3
{
  id v4;
  AXIPCMessage *v5;
  void *v6;
  AXIPCMessage *v7;
  void *v8;
  id v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[AXAssistiveTouchServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v5 = [AXIPCMessage alloc];
    v10 = CFSTR("action");
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 6027, v6);

    -[AXServer client](self, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "sendMessage:withError:", v7, 0);

  }
}

- (CGPoint)getMenuItemPosition:(id)a3
{
  id v4;
  double v5;
  double v6;
  AXIPCMessage *v7;
  void *v8;
  AXIPCMessage *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  const __CFString *v18;
  _QWORD v19[2];
  CGPoint result;

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -1.0;
  v6 = -1.0;
  if (-[AXAssistiveTouchServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v7 = [AXIPCMessage alloc];
    v18 = CFSTR("action");
    v19[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AXIPCMessage initWithKey:payload:](v7, "initWithKey:payload:", 6033, v8);

    -[AXServer client](self, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendMessage:withError:", v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "payload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("result"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "axCGPointValue");
    v5 = v14;
    v6 = v15;

  }
  v16 = v5;
  v17 = v6;
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)virtualPointer:(BOOL)a3
{
  _BOOL8 v3;
  AXIPCMessage *v5;
  void *v6;
  void *v7;
  AXIPCMessage *v8;
  void *v9;
  id v10;
  const __CFString *v11;
  _QWORD v12[2];

  v3 = a3;
  v12[1] = *MEMORY[0x1E0C80C00];
  if (-[AXAssistiveTouchServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v5 = [AXIPCMessage alloc];
    v11 = CFSTR("action");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 6028, v7);

    -[AXServer client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "sendMessage:withError:", v8, 0);

  }
}

- (CGPoint)getPointerPosition
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

  v3 = -1.0;
  v4 = -1.0;
  if (-[AXAssistiveTouchServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v5 = [AXIPCMessage alloc];
    v6 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 6029, MEMORY[0x1E0C9AA70]);
    -[AXServer client](self, "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendMessage:withError:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "payload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("result"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "axCGPointValue");
    v3 = v11;
    v4 = v12;

  }
  v13 = v3;
  v14 = v4;
  result.y = v14;
  result.x = v13;
  return result;
}

- (BOOL)setPointerPosition:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  AXIPCMessage *v6;
  void *v7;
  void *v8;
  AXIPCMessage *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  _QWORD v16[2];
  const __CFString *v17;
  _QWORD v18[2];

  y = a3.y;
  x = a3.x;
  v18[1] = *MEMORY[0x1E0C80C00];
  if (!-[AXAssistiveTouchServer _connectIfNecessary](self, "_connectIfNecessary"))
    return 0;
  v6 = [AXIPCMessage alloc];
  v17 = CFSTR("action");
  *(CGFloat *)v16 = x;
  *(CGFloat *)&v16[1] = y;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v16, "{CGPoint=dd}");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AXIPCMessage initWithKey:payload:](v6, "initWithKey:payload:", 6030, v8);

  -[AXServer client](self, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendMessage:withError:", v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("result"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  return v14;
}

- (void)pointerClick
{
  AXIPCMessage *v3;
  void *v4;
  id v5;
  AXIPCMessage *v6;

  if (-[AXAssistiveTouchServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v3 = [AXIPCMessage alloc];
    v6 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 6032, MEMORY[0x1E0C9AA70]);
    -[AXServer client](self, "client");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "sendMessage:withError:", v6, 0);

  }
}

- (id)currentBubbleElement
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[AXAssistiveTouchServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v3 = [AXIPCMessage alloc];
    v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 6031, MEMORY[0x1E0C9AA70]);
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

@end
