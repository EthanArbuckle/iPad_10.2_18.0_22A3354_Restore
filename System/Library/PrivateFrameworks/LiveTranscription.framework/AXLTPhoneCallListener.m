@implementation AXLTPhoneCallListener

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_phoneCallObserver;
}

void __39__AXLTPhoneCallListener_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_phoneCallObserver;
  sharedInstance_phoneCallObserver = v0;

}

- (AXLTPhoneCallListener)init
{
  AXLTPhoneCallListener *v2;
  AXLTPhoneCallListener *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXLTPhoneCallListener;
  v2 = -[AXLTPhoneCallListener init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AXLTPhoneCallListener _startObserving](v2, "_startObserving");
  return v3;
}

- (void)setUtilityType:(int64_t)a3
{
  CXCallObserver *callObserver;
  TUCallCenter *v5;
  TUCallCenter *callCenter;
  TUCallCenter *v7;
  CXCallObserver *v8;
  CXCallObserver *v9;
  id v10;

  if (self->_utilityType != a3)
  {
    self->_utilityType = a3;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (self->_utilityType)
    {
      -[CXCallObserver setDelegate:queue:](self->_callObserver, "setDelegate:queue:", 0, 0);
      callObserver = self->_callObserver;
      self->_callObserver = 0;

      objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
      v5 = (TUCallCenter *)objc_claimAutoreleasedReturnValue();
      callCenter = self->_callCenter;
      self->_callCenter = v5;

      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_callStatusChanged_, *MEMORY[0x24BEB4AB8], 0);
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_callStatusChanged_, *MEMORY[0x24BEB4AD0], 0);
    }
    else
    {
      v7 = self->_callCenter;
      self->_callCenter = 0;

      objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x24BEB4AB8], 0);
      objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x24BEB4AD0], 0);
      v8 = (CXCallObserver *)objc_opt_new();
      v9 = self->_callObserver;
      self->_callObserver = v8;

      -[CXCallObserver setDelegate:queue:](self->_callObserver, "setDelegate:queue:", self, 0);
    }

  }
}

- (BOOL)isCallActive
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (self->_utilityType)
  {
    -[TUCallCenter currentCalls](self->_callCenter, "currentCalls");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      v4 = 1;
    }
    else
    {
      -[TUCallCenter currentVideoCalls](self->_callCenter, "currentVideoCalls");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v12, "count") != 0;

    }
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[AXLTPhoneCallListener callObserver](self, "callObserver", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "calls");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v11, "hasConnected") && !objc_msgSend(v11, "hasEnded"))
          {

            return 1;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }

    return 0;
  }
  return v4;
}

- (void)_startObserving
{
  void *v3;
  id v4;

  v3 = (void *)objc_opt_new();
  -[AXLTPhoneCallListener setCallObserver:](self, "setCallObserver:", v3);

  -[AXLTPhoneCallListener callObserver](self, "callObserver");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:queue:", self, 0);

}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  id v13;

  v13 = a4;
  if ((objc_msgSend(v13, "hasConnected") & 1) != 0 || (objc_msgSend(v13, "hasEnded") & 1) != 0)
  {
    if (objc_msgSend(v13, "hasConnected") && (objc_msgSend(v13, "hasEnded") & 1) == 0)
    {
      -[AXLTPhoneCallListener delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        -[AXLTPhoneCallListener delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "phoneCallListenerCallConnected:callID:", self, v8);
        goto LABEL_12;
      }
    }
    else if (objc_msgSend(v13, "hasEnded"))
    {
      -[AXLTPhoneCallListener delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        -[AXLTPhoneCallListener delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "phoneCallListenerCallEnded:callID:", self, v8);
LABEL_12:

        goto LABEL_13;
      }
    }
  }
  else
  {
    -[AXLTPhoneCallListener delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[AXLTPhoneCallListener delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "phoneCallListenerCallDialing:", self);
LABEL_13:

    }
  }

}

- (void)callStatusChanged:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v17, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend(v6, "callUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);

  if (objc_msgSend(v6, "status") == 4)
  {
    -[AXLTPhoneCallListener delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[AXLTPhoneCallListener delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "phoneCallListenerCallDialing:", self);
LABEL_13:

    }
  }
  else if (objc_msgSend(v6, "status") == 1)
  {
    -[AXLTPhoneCallListener delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[AXLTPhoneCallListener delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "phoneCallListenerCallConnected:callID:", self, v9);
      goto LABEL_13;
    }
  }
  else if (objc_msgSend(v6, "status") == 6)
  {
    -[AXLTPhoneCallListener delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[AXLTPhoneCallListener delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "phoneCallListenerCallEnded:callID:", self, v9);
      goto LABEL_13;
    }
  }

}

- (AXLTPhoneCallListenerDelegate)delegate
{
  return (AXLTPhoneCallListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)utilityType
{
  return self->_utilityType;
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
  objc_storeStrong((id *)&self->_callObserver, a3);
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void)setCallCenter:(id)a3
{
  objc_storeStrong((id *)&self->_callCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
