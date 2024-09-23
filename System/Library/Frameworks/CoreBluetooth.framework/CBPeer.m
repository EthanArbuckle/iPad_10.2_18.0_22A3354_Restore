@implementation CBPeer

- (NSUUID)identifier
{
  return self->_identifier;
}

- (CBPeer)initWithInfo:(id)a3 manager:(id)a4
{
  id v6;
  id v7;
  char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CBPeer;
  v8 = -[CBPeer init](&v15, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v8 + 2);
    *((_QWORD *)v8 + 2) = v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBMsgArgATTMTU"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v8 + 3) = objc_msgSend(v11, "unsignedIntegerValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBMsgArgPairingState"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v8 + 4) = objc_msgSend(v12, "integerValue");

    v8[8] = 0;
    *(_OWORD *)(v8 + 40) = xmmword_1A8335490;
    objc_storeWeak((id *)v8 + 7, v7);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBMsgArgConnectionTransport"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8[9] = objc_msgSend(v13, "unsignedIntegerValue");

  }
  return (CBPeer *)v8;
}

- (CBManager)manager
{
  return (CBManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (int64_t)pairingState
{
  return self->_pairingState;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)handleMsg:(int)a3 args:(id)a4
{
  id v6;
  NSObject *v7;

  v6 = a4;
  if ((a3 - 164) < 3)
  {
    objc_msgSend(self, *off_1E5401F58[a3 - 164], v6);
LABEL_3:

    return;
  }
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v7 = CBLogComponent;
  if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    goto LABEL_3;
  -[CBScalablePipeManager handleMsg:args:].cold.1(a3, v7);

}

- (id)peerStateToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("unknown");
  else
    return off_1E5401F70[a3];
}

- (void)handleMTUChanged:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgATTMTU"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBPeer setMtuLength:](self, "setMtuLength:", objc_msgSend(v4, "unsignedIntegerValue"));

}

- (void)handleHostStateUpdated:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgState"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBPeer setHostState:](self, "setHostState:", objc_msgSend(v4, "integerValue"));

}

- (void)handleLinkEncryptionChanged:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgState"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBPeer setIsLinkEncrypted:](self, "setIsLinkEncrypted:", objc_msgSend(v4, "BOOLValue"));

}

- (id)sendInternalSyncMsg:(int)a3 args:(id)a4
{
  unsigned __int16 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[CBPeer identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("kCBMsgArgDeviceUUID"));

  -[CBPeer manager](self, "manager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendSyncMsg:args:", v4, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)sendInternalMsg:(int)a3 args:(id)a4
{
  unsigned __int16 v4;
  id v6;
  void *v7;
  id WeakRetained;
  id v9;

  v4 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;
  -[CBPeer identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("kCBMsgArgDeviceUUID"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  objc_msgSend(WeakRetained, "sendMsg:args:", v4, v9);

}

- (void)tag:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", a3, CFSTR("kCBMsgArgName"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBPeer sendInternalMsg:args:](self, "sendInternalMsg:args:", 168, v4);

}

- (void)untag:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", a3, CFSTR("kCBMsgArgName"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBPeer sendInternalMsg:args:](self, "sendInternalMsg:args:", 169, v4);

}

- (BOOL)hasTag:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", a3, CFSTR("kCBMsgArgName"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBPeer sendInternalSyncMsg:args:](self, "sendInternalSyncMsg:args:", 170, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCBMsgArgData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (id)getTags
{
  void *v2;
  void *v3;

  -[CBPeer sendInternalSyncMsg:args:](self, "sendInternalSyncMsg:args:", 171, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kCBMsgArgData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setCustomProperty:(id)a3 value:(id)a4
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", a3, CFSTR("kCBMsgArgName"), a4, CFSTR("kCBMsgArgValue"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBPeer sendInternalMsg:args:](self, "sendInternalMsg:args:", 172, v5);

}

- (id)customProperty:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", a3, CFSTR("kCBMsgArgName"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBPeer sendInternalSyncMsg:args:](self, "sendInternalSyncMsg:args:", 173, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCBMsgArgCustomPropertyValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)customPropertyNames
{
  void *v2;
  void *v3;

  -[CBPeer sendInternalSyncMsg:args:](self, "sendInternalSyncMsg:args:", 174, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kCBMsgArgCustomPropertyNames"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CBPeer identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (unint64_t)mtuLength
{
  return self->_mtuLength;
}

- (void)setMtuLength:(unint64_t)a3
{
  self->_mtuLength = a3;
}

- (void)setPairingState:(int64_t)a3
{
  self->_pairingState = a3;
}

- (int64_t)hostState
{
  return self->_hostState;
}

- (void)setHostState:(int64_t)a3
{
  self->_hostState = a3;
}

- (BOOL)isLinkEncrypted
{
  return self->_isLinkEncrypted;
}

- (void)setIsLinkEncrypted:(BOOL)a3
{
  self->_isLinkEncrypted = a3;
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (unsigned)connectedTransport
{
  return self->_connectedTransport;
}

- (void)setConnectedTransport:(unsigned __int8)a3
{
  self->_connectedTransport = a3;
}

@end
