@implementation DMTSharingBackedRemoteSetupBroadcaster

- (void)dealloc
{
  objc_super v3;

  -[DMTSharingBackedRemoteSetupBroadcaster endObservingTerminal](self, "endObservingTerminal");
  v3.receiver = self;
  v3.super_class = (Class)DMTSharingBackedRemoteSetupBroadcaster;
  -[DMTSharingBackedRemoteSetupBroadcaster dealloc](&v3, sel_dealloc);
}

- (DMTSharingBackedRemoteSetupBroadcaster)initWithPrimitives:(id)a3
{
  id v4;
  DMTSharingBackedRemoteSetupBroadcaster *v5;
  uint64_t v6;
  CATOperationQueue *delegateQueue;
  uint64_t v8;
  CATSharingBroadcastTerminal *terminal;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMTSharingBackedRemoteSetupBroadcaster;
  v5 = -[DMTSharingBackedRemoteSetupBroadcaster init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    delegateQueue = v5->_delegateQueue;
    v5->_delegateQueue = (CATOperationQueue *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE15760]), "initWithBroadcastPrimitives:delegate:delegationQueue:", v4, v5, v5->_delegateQueue);
    terminal = v5->_terminal;
    v5->_terminal = (CATSharingBroadcastTerminal *)v8;

  }
  return v5;
}

- (void)startBroadcasting
{
  OUTLINED_FUNCTION_0_1(&dword_21FD69000, a1, a3, "Already broadcasting, bailing.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)invalidate
{
  id v3;

  if (-[DMTSharingBackedRemoteSetupBroadcaster isBroadcasting](self, "isBroadcasting"))
  {
    if (!-[DMTSharingBackedRemoteSetupBroadcaster isInvalidated](self, "isInvalidated"))
    {
      -[DMTSharingBackedRemoteSetupBroadcaster terminal](self, "terminal");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "invalidate");

    }
  }
}

- (void)broadcastTerminal:(id)a3 didActivateWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  _DMTLogGeneral_3();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[DMTSharingBackedRemoteSetupBroadcaster broadcastTerminal:didActivateWithError:].cold.2();

    -[DMTSharingBackedRemoteSetupBroadcaster performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_invalidateWithError_, v7, 0);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[DMTSharingBackedRemoteSetupBroadcaster broadcastTerminal:didActivateWithError:].cold.1();

  }
}

- (void)broadcastTerminal:(id)a3 hasError:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_hasError___block_invoke;
  v7[3] = &unk_24E5A05E8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __69__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_hasError___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  if ((objc_msgSend(*(id *)(a1 + 32), "isInvalidated") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "showErrorHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "showErrorHandler");
      v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
      v3[2](v3, *(_QWORD *)(a1 + 40));

    }
  }
}

- (void)broadcastTerminal:(id)a3 stoppedWithError:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_stoppedWithError___block_invoke;
  v7[3] = &unk_24E5A05E8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __77__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_stoppedWithError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isInvalidated");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "invalidateWithError:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)broadcastTerminal:(id)a3 hasPairedDeviceConnection:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  _DMTLogGeneral_3();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[DMTSharingBackedRemoteSetupBroadcaster broadcastTerminal:hasPairedDeviceConnection:].cold.1(v5, v6);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __86__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_hasPairedDeviceConnection___block_invoke;
  v8[3] = &unk_24E5A05E8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

void __86__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_hasPairedDeviceConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (objc_msgSend(*(id *)(a1 + 32), "isInvalidated"))
  {
    _DMTLogGeneral_3();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __86__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_hasPairedDeviceConnection___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  else
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BE15770]), "initWithConnection:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "pairedTransportHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "pairedTransportHandler");
      v11 = objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, NSObject *))(v11 + 16))(v11, v2);
    }
    else
    {
      _DMTLogGeneral_3();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG))
        __86__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_hasPairedDeviceConnection___block_invoke_cold_2(v11, v12, v13, v14, v15, v16, v17, v18);
    }

  }
}

- (void)broadcastTerminal:(id)a3 needsToDisplayPin:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_needsToDisplayPin___block_invoke;
  v7[3] = &unk_24E5A05E8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __78__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_needsToDisplayPin___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void (**v5)(id, void *);

  if ((objc_msgSend(*(id *)(a1 + 32), "isInvalidated") & 1) == 0)
  {
    v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(*(id *)(a1 + 32), "setDisplayedPin:", v2);

    objc_msgSend(*(id *)(a1 + 32), "showPinHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "showPinHandler");
      v5 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "displayedPin");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v4);

    }
  }
}

- (void)broadcastTerminalNeedsToDismissPin:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminalNeedsToDismissPin___block_invoke;
  block[3] = &unk_24E59FCE0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __77__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminalNeedsToDismissPin___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  if ((objc_msgSend(*(id *)(a1 + 32), "isInvalidated") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDisplayedPin:", 0);
    objc_msgSend(*(id *)(a1 + 32), "showPinHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "showPinHandler");
      v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
      v3[2](v3, 0);

    }
  }
}

- (void)invalidateWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DMTSharingBackedRemoteSetupBroadcaster setIsInvalidated:](self, "setIsInvalidated:", 1);
  -[DMTSharingBackedRemoteSetupBroadcaster setDisplayedPin:](self, "setDisplayedPin:", 0);
  _DMTLogGeneral_3();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[DMTSharingBackedRemoteSetupBroadcaster invalidateWithError:].cold.1();

  -[DMTSharingBackedRemoteSetupBroadcaster showErrorHandler](self, "showErrorHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DMTSharingBackedRemoteSetupBroadcaster showErrorHandler](self, "showErrorHandler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x24BDD1398];
    v11[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    DMTErrorWithCodeAndUserInfo(40, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v9);

  }
}

- (void)beginObservingTerminal
{
  id v3;

  -[DMTSharingBackedRemoteSetupBroadcaster terminal](self, "terminal");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("broadcasting"), 4, CFSTR("TerminalObservationContext"));

}

- (void)endObservingTerminal
{
  id v3;

  -[DMTSharingBackedRemoteSetupBroadcaster terminal](self, "terminal");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("broadcasting"), CFSTR("TerminalObservationContext"));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  int v8;
  int v9;
  id v10;
  objc_super v11;

  if (a6 == CFSTR("TerminalObservationContext"))
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("broadcasting"), a4, a5))
    {
      -[DMTSharingBackedRemoteSetupBroadcaster terminal](self, "terminal");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isBroadcasting");
      v9 = -[DMTSharingBackedRemoteSetupBroadcaster isBroadcasting](self, "isBroadcasting");

      if (v8 != v9)
      {
        -[DMTSharingBackedRemoteSetupBroadcaster terminal](self, "terminal");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        -[DMTSharingBackedRemoteSetupBroadcaster setIsBroadcasting:](self, "setIsBroadcasting:", objc_msgSend(v10, "isBroadcasting"));

      }
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)DMTSharingBackedRemoteSetupBroadcaster;
    -[DMTSharingBackedRemoteSetupBroadcaster observeValueForKeyPath:ofObject:change:context:](&v11, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (id)showPinHandler
{
  return self->_showPinHandler;
}

- (void)setShowPinHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)showErrorHandler
{
  return self->_showErrorHandler;
}

- (void)setShowErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)pairedTransportHandler
{
  return self->_pairedTransportHandler;
}

- (void)setPairedTransportHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CATSharingBroadcastTerminal)terminal
{
  return self->_terminal;
}

- (CATOperationQueue)delegateQueue
{
  return self->_delegateQueue;
}

- (NSString)displayedPin
{
  return self->_displayedPin;
}

- (void)setDisplayedPin:(id)a3
{
  objc_storeStrong((id *)&self->_displayedPin, a3);
}

- (BOOL)isBroadcasting
{
  return self->_isBroadcasting;
}

- (void)setIsBroadcasting:(BOOL)a3
{
  self->_isBroadcasting = a3;
}

- (BOOL)isInvalidated
{
  return self->_isInvalidated;
}

- (void)setIsInvalidated:(BOOL)a3
{
  self->_isInvalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedPin, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_terminal, 0);
  objc_storeStrong(&self->_pairedTransportHandler, 0);
  objc_storeStrong(&self->_showErrorHandler, 0);
  objc_storeStrong(&self->_showPinHandler, 0);
}

- (void)broadcastTerminal:didActivateWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_21FD69000, v0, v1, "%{public}@ didActivate", v2);
  OUTLINED_FUNCTION_1();
}

- (void)broadcastTerminal:didActivateWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_21FD69000, v0, v1, "Activation of terminal failed, invalidating: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)broadcastTerminal:(void *)a1 hasPairedDeviceConnection:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "remoteDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_21FD69000, a2, v5, "Paired connection vended for: %{public}@", v6);

}

void __86__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_hasPairedDeviceConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21FD69000, a1, a3, "Invalidated before paired connection could be vended.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __86__DMTSharingBackedRemoteSetupBroadcaster_broadcastTerminal_hasPairedDeviceConnection___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21FD69000, a1, a3, "Attempted to vend paired transport, but handler was not set.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)invalidateWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_21FD69000, v0, v1, "Broadcaster invalidated due to: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
