@implementation AXVoiceOverServer

+ (id)server
{
  if (server_onceToken_4 != -1)
    dispatch_once(&server_onceToken_4, &__block_literal_global_20);
  return (id)server_Server_4;
}

void __27__AXVoiceOverServer_server__block_invoke()
{
  AXVoiceOverServer *v0;
  void *v1;

  v0 = objc_alloc_init(AXVoiceOverServer);
  v1 = (void *)server_Server_4;
  server_Server_4 = (uint64_t)v0;

}

- (id)_serviceName
{
  return CFSTR("com.apple.accessibility.AXVoiceOverServer");
}

- (BOOL)_connectIfNecessary
{
  int v3;
  objc_super v5;

  v3 = _AXSVoiceOverTouchEnabled();
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AXVoiceOverServer;
    LOBYTE(v3) = -[AXServer _connectIfNecessary](&v5, sel__connectIfNecessary);
  }
  return v3;
}

- (id)lastSpokenPhrases
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[AXVoiceOverServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v3 = [AXIPCMessage alloc];
    v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 7002, MEMORY[0x1E0C9AA70]);
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

- (void)clearLastSpokenPhrases:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__AXVoiceOverServer_clearLastSpokenPhrases___block_invoke;
  v6[3] = &unk_1E24C73E8;
  v7 = v4;
  v5 = v4;
  -[AXVoiceOverServer performAutomationTestingCommand:userInfo:timeout:completion:](self, "performAutomationTestingCommand:userInfo:timeout:completion:", &unk_1E24F7970, 0, v6, 10.0);

}

uint64_t __44__AXVoiceOverServer_clearLastSpokenPhrases___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (id)lastSpokenContents
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[AXVoiceOverServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v3 = [AXIPCMessage alloc];
    v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 7008, MEMORY[0x1E0C9AA70]);
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

- (id)lastSoundsPlayed
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[AXVoiceOverServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v3 = [AXIPCMessage alloc];
    v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 7005, MEMORY[0x1E0C9AA70]);
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

- (void)clearLastSoundsPlayed:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__AXVoiceOverServer_clearLastSoundsPlayed___block_invoke;
  v6[3] = &unk_1E24C73E8;
  v7 = v4;
  v5 = v4;
  -[AXVoiceOverServer performAutomationTestingCommand:userInfo:timeout:completion:](self, "performAutomationTestingCommand:userInfo:timeout:completion:", &unk_1E24F7988, 0, v6, 10.0);

}

uint64_t __43__AXVoiceOverServer_clearLastSoundsPlayed___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (id)currentRotorName
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[AXVoiceOverServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v3 = [AXIPCMessage alloc];
    v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 7003, MEMORY[0x1E0C9AA70]);
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

- (CGRect)currentCursorFrame
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v13;
  double v14;
  double v15;
  double v16;
  NSRect v17;
  CGRect result;

  if (-[AXVoiceOverServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v3 = [AXIPCMessage alloc];
    v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 7016, MEMORY[0x1E0C9AA70]);
    -[AXServer client](self, "client");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendMessage:withError:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "payload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("result"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v17 = NSRectFromString(v8);
    x = v17.origin.x;
    y = v17.origin.y;
    width = v17.size.width;
    height = v17.size.height;

  }
  else
  {
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)lastScreenChange
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[AXVoiceOverServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v3 = [AXIPCMessage alloc];
    v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 7004, MEMORY[0x1E0C9AA70]);
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

- (id)currentFocusedElement
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[AXVoiceOverServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v3 = [AXIPCMessage alloc];
    v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 7001, MEMORY[0x1E0C9AA70]);
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

- (BOOL)triggerGesture:(id)a3
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
  if (-[AXVoiceOverServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v5 = [AXIPCMessage alloc];
    v14 = CFSTR("gesture");
    v15[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 7010, v6);

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

- (BOOL)triggerCommand:(int64_t)a3
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
  if (!-[AXVoiceOverServer _connectIfNecessary](self, "_connectIfNecessary"))
    return 0;
  v5 = [AXIPCMessage alloc];
  v15 = CFSTR("command");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 7000, v7);

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

- (BOOL)triggerCommand:(int64_t)a3 withArgument:(id)a4
{
  id v6;
  AXIPCMessage *v7;
  void *v8;
  void *v9;
  AXIPCMessage *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[AXVoiceOverServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v7 = [AXIPCMessage alloc];
    v17[0] = CFSTR("command");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = CFSTR("argument");
    v18[0] = v8;
    v18[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[AXIPCMessage initWithKey:payload:](v7, "initWithKey:payload:", 7000, v9);

    -[AXServer client](self, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendMessage:withError:", v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "payload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("result"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)triggerEventCommand:(id)a3
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
  if (-[AXVoiceOverServer _connectIfNecessary](self, "_connectIfNecessary") && objc_msgSend(v4, "length"))
  {
    v5 = [AXIPCMessage alloc];
    v14 = CFSTR("eventCommand");
    v15[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 7013, v6);

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

- (BOOL)isBrailleInputUIShowing
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v11;

  if (!-[AXVoiceOverServer _connectIfNecessary](self, "_connectIfNecessary"))
    return 0;
  v3 = [AXIPCMessage alloc];
  v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 7006, MEMORY[0x1E0C9AA70]);
  -[AXServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "sendMessage:withError:", v4, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("result"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  return v9;
}

- (BOOL)isHandwritingInputUIShowing
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v11;

  if (!-[AXVoiceOverServer _connectIfNecessary](self, "_connectIfNecessary"))
    return 0;
  v3 = [AXIPCMessage alloc];
  v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 7009, MEMORY[0x1E0C9AA70]);
  -[AXServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "sendMessage:withError:", v4, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("result"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  return v9;
}

- (BOOL)isBluetoothBrailleDisplayConnected
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v11;

  if (!-[AXVoiceOverServer _connectIfNecessary](self, "_connectIfNecessary"))
    return 0;
  v3 = [AXIPCMessage alloc];
  v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 7011, MEMORY[0x1E0C9AA70]);
  -[AXServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "sendMessage:withError:", v4, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("result"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  return v9;
}

- (BOOL)isScreenCurtainEnabled
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v11;

  if (!-[AXVoiceOverServer _connectIfNecessary](self, "_connectIfNecessary"))
    return 0;
  v3 = [AXIPCMessage alloc];
  v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 7012, MEMORY[0x1E0C9AA70]);
  -[AXServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "sendMessage:withError:", v4, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("result"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  return v9;
}

- (BOOL)isBrailleScreenInputInScreenAwayMode
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v11;

  if (!-[AXVoiceOverServer _connectIfNecessary](self, "_connectIfNecessary"))
    return 0;
  v3 = [AXIPCMessage alloc];
  v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 7015, MEMORY[0x1E0C9AA70]);
  -[AXServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "sendMessage:withError:", v4, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("result"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  return v9;
}

- (id)recognizedGestureForTutorial
{
  AXIPCMessage *v3;
  AXIPCMessage *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v12;
  id v13;

  if (!-[AXVoiceOverServer _connectIfNecessary](self, "_connectIfNecessary"))
    return 0;
  v3 = [AXIPCMessage alloc];
  v4 = -[AXIPCMessage initWithKey:payload:](v3, "initWithKey:payload:", 7014, MEMORY[0x1E0C9AA70]);
  -[AXServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v5, "sendMessage:withError:", v4, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;

  objc_msgSend(v6, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("result"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AXLogIPC();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[AXVoiceOverServer recognizedGestureForTutorial].cold.1((uint64_t)v7, v12);

    v10 = 0;
  }

  return v10;
}

- (void)performAutomationTestingCommand:(id)a3 userInfo:(id)a4 timeout:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  AXIPCMessage *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[AXVoiceOverServer _connectIfNecessary](self, "_connectIfNecessary"))
  {
    v20[0] = CFSTR("command");
    v20[1] = CFSTR("userInfo");
    v13 = (id)MEMORY[0x1E0C9AA70];
    if (v11)
      v13 = v11;
    v21[0] = v10;
    v21[1] = v13;
    v20[2] = CFSTR("timeout");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 7007, v15);
    -[AXServer client](self, "client");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __81__AXVoiceOverServer_performAutomationTestingCommand_userInfo_timeout_completion___block_invoke;
    v18[3] = &unk_1E24C5458;
    v19 = v12;
    objc_msgSend(v17, "sendAsyncMessage:replyOnQueue:replyHandler:", v16, MEMORY[0x1E0C80D38], v18);

  }
}

void __81__AXVoiceOverServer_performAutomationTestingCommand_userInfo_timeout_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v11 = v5;
  if (a3)
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(a3, "ax_nonRedundantDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);
  }
  else
  {
    objc_msgSend(v5, "payload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("error"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v8);
    }
    else
    {
      objc_msgSend(v11, "payload");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);

    }
  }

}

- (void)recognizedGestureForTutorial
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18C62B000, a2, OS_LOG_TYPE_ERROR, "Could not connect VoiceOver for tutorial message: %@", (uint8_t *)&v2, 0xCu);
}

@end
