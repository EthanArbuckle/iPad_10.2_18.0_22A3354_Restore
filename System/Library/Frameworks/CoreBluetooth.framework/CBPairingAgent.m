@implementation CBPairingAgent

- (BOOL)isPeerPaired:(id)a3
{
  return objc_msgSend(a3, "pairingState") != 0;
}

- (CBPairingAgent)initWithParentManager:(id)a3
{
  id v4;
  CBPairingAgent *v5;
  CBPairingAgent *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CBPairingAgent;
  v5 = -[CBPairingAgent init](&v25, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CBPairingAgent setParentManager:](v5, "setParentManager:", v4);
    -[CBPairingAgent parentManager](v6, "parentManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendMsg:args:", 8, MEMORY[0x1E0C9AA70]);

    -[CBPairingAgent parentManager](v6, "parentManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendSyncMsg:args:", 10, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = v9;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDevices"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v14);
          -[CBPairingAgent parentManager](v6, "parentManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "peerWithInfo:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("kCBMsgArgPairingState"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setPairingState:", objc_msgSend(v18, "integerValue"));

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v12);
    }

    -[CBPairingAgent addObserver:forKeyPath:options:context:](v6, "addObserver:forKeyPath:options:context:", v6, CFSTR("delegate"), 0, objc_opt_class());
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[CBPairingAgent removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("delegate"), objc_opt_class());
  v3.receiver = self;
  v3.super_class = (Class)CBPairingAgent;
  -[CBPairingAgent dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  objc_super v14;

  v10 = a4;
  v11 = a5;
  v12 = a3;
  if ((void *)objc_opt_class() == a6)
  {
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("delegate"));

    if (v13)
      -[CBPairingAgent updateRegistration](self, "updateRegistration");
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CBPairingAgent;
    -[CBPairingAgent observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v12, v10, v11, a6);

  }
}

- (void)updateRegistration
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[CBPairingAgent delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CBPairingAgent delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    -[CBPairingAgent parentManager](self, "parentManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("kCBMsgArgProgrammaticPairing");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5 & 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendMsg:args:", 8, v8);

  }
  else
  {
    -[CBPairingAgent parentManager](self, "parentManager");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendMsg:args:", 8, MEMORY[0x1E0C9AA70]);

  }
}

- (BOOL)isPeerCloudPaired:(id)a3
{
  return objc_msgSend(a3, "pairingState") == 2;
}

- (BOOL)isPeerMagicPaired:(id)a3
{
  return objc_msgSend(a3, "pairingState") == 3;
}

- (id)retrievePairedPeers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[CBPairingAgent parentManager](self, "parentManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendSyncMsg:args:", 10, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDevices"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        -[CBPairingAgent parentManager](self, "parentManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "peerWithInfo:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v13);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)pairPeer:(id)a3
{
  -[CBPairingAgent pairPeer:options:](self, "pairPeer:options:", a3, &unk_1E54240A8);
}

- (void)pairPeer:(id)a3 useMITM:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v4 = a4;
  v12[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPairingAgent.m"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peer"));

  }
  v11[0] = CFSTR("kCBMsgArgPairingOptionsUseMITMAuthentication");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("kCBMsgArgPairingOptionsDistributeIRK");
  v12[0] = v8;
  v12[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBPairingAgent pairPeer:options:](self, "pairPeer:options:", v7, v9);

}

- (void)pairPeer:(id)a3 options:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPairingAgent.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peer"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("kCBMsgArgDeviceUUID"));

  -[CBPairingAgent parentManager](self, "parentManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendMsg:args:", 11, v8);

}

- (void)unpairPeer:(id)a3 options:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithDictionary:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("kCBMsgArgDeviceUUID"));
  -[CBPairingAgent parentManager](self, "parentManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendMsg:args:", 13, v10);

}

- (void)unpairPeer:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPairingAgent.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peer"));

    v5 = 0;
  }
  -[CBPairingAgent unpairPeer:options:](self, "unpairPeer:options:", v5, MEMORY[0x1E0C9AA70]);

}

- (void)respondToPairingRequest:(id)a3 type:(int64_t)a4 accept:(BOOL)a5 data:(id)a6
{
  _BOOL8 v7;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v7 = a5;
  v18 = a3;
  v11 = a6;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPairingAgent.m"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peer"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("kCBMsgArgDeviceUUID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("kCBMsgArgPairingType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("kCBMsgArgPairingAccept"));

  -[CBPairingAgent parentManager](self, "parentManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendMsg:args:", 12, v12);

}

- (void)setUseOOBMode:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (self->_useOOBMode != a3)
  {
    self->_useOOBMode = a3;
    -[CBPairingAgent parentManager](self, "parentManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("kCBMsgArgUseOOBPairing");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useOOBMode);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendMsg:args:", 14, v6);

  }
}

- (id)retrieveOOBDataForPeer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CBPairingAgent parentManager](self, "parentManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v12 = CFSTR("kCBMsgArgDeviceUUID");
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendSyncMsg:args:", 15, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "sendSyncMsg:args:", 15, MEMORY[0x1E0C9AA70]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCBMsgArgPairingData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setOOBPairingEnabled:(BOOL)a3 forPeer:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v11 = a4;
  v6 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithObject:forKey:", v7, CFSTR("kCBMsgArgUseOOBPairing"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("kCBMsgArgDeviceUUID"));

  }
  -[CBPairingAgent parentManager](self, "parentManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendMsg:args:", 14, v8);

}

- (void)handlePairingRequested:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v4 = a3;
  -[CBPairingAgent parentManager](self, "parentManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "peerWithInfo:", v4);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgPairingType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgPairingPasskey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBPairingAgent delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[CBPairingAgent delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pairingAgent:peerDidRequestPairing:type:passkey:", self, v12, v7, v8);

  }
}

- (void)handlePairingCompleted:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  v13 = a3;
  -[CBPairingAgent parentManager](self, "parentManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peerWithInfo:", v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CBPairingAgent delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[CBPairingAgent delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pairingAgent:peerDidFailToCompletePairing:error:", self, v5, v6);
LABEL_6:

    }
  }
  else
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("kCBMsgArgPairingState"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPairingState:", objc_msgSend(v10, "integerValue"));

    -[CBPairingAgent delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[CBPairingAgent delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pairingAgent:peerDidCompletePairing:", self, v5);
      goto LABEL_6;
    }
  }

}

- (void)handleUnpaired:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CBPairingAgent parentManager](self, "parentManager");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "peerWithInfo:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPairingState:", 0);
  -[CBPairingAgent delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CBPairingAgent delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pairingAgent:peerDidUnpair:", self, v8);

  }
}

- (void)handlePairingMessage:(unsigned __int16)a3 args:(id)a4
{
  int v4;
  id v6;
  NSObject *v7;

  v4 = a3;
  v6 = a4;
  if ((v4 - 16) < 3)
  {
    objc_msgSend(self, *off_1E5403808[(__int16)(v4 - 16)], v6);
LABEL_3:

    return;
  }
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v7 = CBLogComponent;
  if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    goto LABEL_3;
  -[CBScalablePipeManager handleMsg:args:].cold.1(v4, v7);

}

- (CBPairingAgentDelegate)delegate
{
  return (CBPairingAgentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)useOOBMode
{
  return self->_useOOBMode;
}

- (CBPairingAgentParentDelegate)parentManager
{
  return (CBPairingAgentParentDelegate *)objc_loadWeakRetained((id *)&self->_parentManager);
}

- (void)setParentManager:(id)a3
{
  objc_storeWeak((id *)&self->_parentManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentManager);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
