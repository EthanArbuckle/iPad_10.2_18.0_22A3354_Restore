@implementation CBScalablePipeManager

- (CBScalablePipeManager)initWithDelegate:(id)a3
{
  return -[CBScalablePipeManager initWithDelegate:queue:](self, "initWithDelegate:queue:", a3, 0);
}

- (CBScalablePipeManager)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  CBScalablePipeManager *v8;
  NSMutableSet *v9;
  NSMutableSet *identifiers;
  uint64_t v11;
  NSHashTable *pipes;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CBScalablePipeManager;
  v8 = -[CBManager initInternal](&v14, sel_initInternal);
  if (v8)
  {
    -[CBScalablePipeManager addObserver:forKeyPath:options:context:](v8, "addObserver:forKeyPath:options:context:", v8, CFSTR("state"), 0, objc_opt_class());
    -[CBScalablePipeManager addObserver:forKeyPath:options:context:](v8, "addObserver:forKeyPath:options:context:", v8, CFSTR("delegate"), 0, objc_opt_class());
    -[CBScalablePipeManager addObserver:forKeyPath:options:context:](v8, "addObserver:forKeyPath:options:context:", v8, CFSTR("localName"), 0, objc_opt_class());
    -[CBScalablePipeManager setDelegate:](v8, "setDelegate:", v6);
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    identifiers = v8->_identifiers;
    v8->_identifiers = v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
    pipes = v8->_pipes;
    v8->_pipes = (NSHashTable *)v11;

    -[CBManager startWithQueue:options:sessionType:](v8, "startWithQueue:options:sessionType:", v7, 0, 2);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[CBScalablePipeManager orphanPipes](self, "orphanPipes");
  -[CBScalablePipeManager removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("state"), objc_opt_class());
  -[CBScalablePipeManager removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("delegate"), objc_opt_class());
  -[CBScalablePipeManager removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("localName"), objc_opt_class());
  v3.receiver = self;
  v3.super_class = (Class)CBScalablePipeManager;
  -[CBManager dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  char v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)objc_opt_class() == a6)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("state")))
    {
      if (-[CBManager state](self, "state") != CBManagerStatePoweredOn)
      {
        -[CBScalablePipeManager orphanPipes](self, "orphanPipes");
        if (-[CBManager state](self, "state") == CBManagerStateResetting)
          -[NSMutableSet removeAllObjects](self->_identifiers, "removeAllObjects");
      }
      -[CBScalablePipeManager delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "scalablePipeManagerDidUpdateState:", self);
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("delegate")))
        goto LABEL_20;
      -[CBScalablePipeManager delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;

      -[CBScalablePipeManager delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = 2;
      else
        v16 = 0;
      *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v16;

      -[CBScalablePipeManager delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = 4;
      else
        v18 = 0;
      *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFB | v18;

      -[CBScalablePipeManager delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v19 = 8;
      else
        v19 = 0;
      *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xF7 | v19;
    }

    goto LABEL_20;
  }
  v20.receiver = self;
  v20.super_class = (Class)CBScalablePipeManager;
  -[CBScalablePipeManager observeValueForKeyPath:ofObject:change:context:](&v20, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
LABEL_20:

}

- (id)sharedPairingAgent
{
  return 0;
}

- (id)pipeForName:(id)a3 identifier:(id)a4
{
  id v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = self->_pipes;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
LABEL_4:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqualToString:", v6) & 1) != 0)
      {
        objc_msgSend(v12, "peer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", v20);

        if ((v16 & 1) != 0)
        {
          v17 = v12;

          goto LABEL_17;
        }
      }
      else
      {

      }
      if (v9 == ++v11)
      {
        v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (!v9)
          break;
        goto LABEL_4;
      }
    }
  }

  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v18 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    -[CBScalablePipeManager pipeForName:identifier:].cold.1((uint64_t)v20, (uint64_t)v6, v18);
  v17 = 0;
LABEL_17:

  return v17;
}

- (void)orphanPipes
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_pipes;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setOrphan", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSHashTable removeAllObjects](self->_pipes, "removeAllObjects");
}

- (void)registerEndpoint:(id)a3 type:(int64_t)a4 priority:(int64_t)a5
{
  -[CBScalablePipeManager registerEndpoint:type:priority:options:](self, "registerEndpoint:type:priority:options:", a3, a4, a5, MEMORY[0x1E0C9AA70]);
}

- (void)registerEndpoint:(id)a3 type:(int64_t)a4 priority:(int64_t)a5 transport:(int64_t)a6
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v14 = CFSTR("kCBMsgArgsTransport");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a3;
  objc_msgSend(v10, "numberWithInteger:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBScalablePipeManager registerEndpoint:type:priority:options:](self, "registerEndpoint:type:priority:options:", v11, a4, a5, v13);

}

- (void)registerEndpoint:(id)a3 type:(int64_t)a4 priority:(int64_t)a5 transport:(int64_t)a6 requireEncryption:(BOOL)a7
{
  _BOOL8 v7;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v7 = a7;
  v18[2] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("kCBMsgArgsTransport");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = a3;
  objc_msgSend(v12, "numberWithInteger:", a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("kCBMsgArgRequiresEncryption");
  v18[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBScalablePipeManager registerEndpoint:type:priority:options:](self, "registerEndpoint:type:priority:options:", v13, a4, a5, v16);

}

- (void)registerEndpoint:(id)a3 type:(int64_t)a4 priority:(int64_t)a5 options:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v36;
  unsigned int v37;
  uint64_t v38;
  unsigned int v39;
  CBScalablePipeManager *v40;
  _QWORD v41[8];
  _QWORD v42[10];

  v42[8] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBMsgArgRequiresEncryption"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBMsgArgRequiresEncryption"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v13, "BOOLValue");

  }
  else
  {
    v39 = 1;
  }

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBMsgArgsTransport"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBMsgArgsTransport"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (int)objc_msgSend(v15, "intValue");

  }
  else
  {
    v38 = 0;
  }

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBDisableBluetoothReliability"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBDisableBluetoothReliability"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

  }
  else
  {
    v18 = 0;
  }
  v40 = self;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBOptionStayConnectedWhenIdle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBOptionStayConnectedWhenIdle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "BOOLValue");

  }
  else
  {
    v21 = 0;
  }

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBLePipeOptionTrace"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBLePipeOptionTrace"));
    v23 = a5;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v24, "intValue");

    a5 = v23;
    if (objc_msgSend(v10, "length"))
      goto LABEL_15;
  }
  else
  {
    v37 = 0;

    if (objc_msgSend(v10, "length"))
      goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, v40, CFSTR("CBScalablePipeManager.m"), 158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier.length"));

LABEL_15:
  v42[0] = v10;
  v41[0] = CFSTR("kCBMsgArgName");
  v41[1] = CFSTR("kCBMsgArgType");
  v34 = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v36;
  v41[2] = CFSTR("kCBLePipeMsgArgPriority");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v25;
  v41[3] = CFSTR("kCBMsgArgOptions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v38);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v26;
  v41[4] = CFSTR("kCBMsgArgRequiresEncryption");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v39);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v27;
  v41[5] = CFSTR("kCBDisableBluetoothReliability");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v28;
  v41[6] = CFSTR("kCBOptionStayConnectedWhenIdle");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v29;
  v41[7] = CFSTR("kCBLePipeOptionTrace");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v37);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42[7] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[CBManager sendMsg:args:](v40, "sendMsg:args:", 8, v31);

  if (v32)
    -[NSMutableSet addObject:](v40->_identifiers, "addObject:", v34);

}

- (void)unregisterEndpoint:(id)a3
{
  id v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBScalablePipeManager.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier.length"));

  }
  v9 = CFSTR("kCBMsgArgName");
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 9, v6);

  if (v7)
    -[NSMutableSet removeObject:](self->_identifiers, "removeObject:", v5);

}

- (void)unregisterAllEndpoints
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  const __CFString *v14;
  uint64_t v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_identifiers;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        v14 = CFSTR("kCBMsgArgName");
        v15 = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1, (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBManager sendMsg:args:](self, "sendMsg:args:", 9, v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    }
    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_identifiers, "removeAllObjects");
}

- (void)setLinkRequirementsForPeer:(id)a3 packetsPerSecond:(unsigned int)a4 inputBytesPerSecond:(unsigned int)a5 outputBytesPerSecond:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v17[4] = *MEMORY[0x1E0C80C00];
  v17[0] = a3;
  v16[0] = CFSTR("kCBMsgArgDeviceUUID");
  v16[1] = CFSTR("kCBMsgArgPacketsPerSecond");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a3;
  objc_msgSend(v10, "numberWithUnsignedInt:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  v16[2] = CFSTR("kCBMsgArgInputBytesPerSecond");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v13;
  v16[3] = CFSTR("kCBMsgArgOutputBytesPerSecond");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 10, v15);
}

- (void)setLinkRequirementsForPeer:(id)a3 withClientName:(id)a4 packetsPerSecond:(unsigned int)a5 inputBytesPerSecond:(unsigned int)a6 outputBytesPerSecond:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[6];

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v20[5] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("kCBMsgArgDeviceUUID");
  v19[1] = CFSTR("kCBMsgArgClientName");
  v20[0] = a3;
  v20[1] = a4;
  v19[2] = CFSTR("kCBMsgArgPacketsPerSecond");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = a4;
  v14 = a3;
  objc_msgSend(v12, "numberWithUnsignedInt:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v15;
  v19[3] = CFSTR("kCBMsgArgInputBytesPerSecond");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v16;
  v19[4] = CFSTR("kCBMsgArgOutputBytesPerSecond");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 10, v18);
}

- (void)setLinkRequirementsForPeerWithLatency:(id)a3 latencyInMs:(unsigned int)a4 inputBytesPerSecond:(unsigned int)a5 outputBytesPerSecond:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v17[4] = *MEMORY[0x1E0C80C00];
  v17[0] = a3;
  v16[0] = CFSTR("kCBMsgArgDeviceUUID");
  v16[1] = CFSTR("kCBMsgArgLatencyInMs");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a3;
  objc_msgSend(v10, "numberWithUnsignedInt:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  v16[2] = CFSTR("kCBMsgArgInputBytesPerSecond");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v13;
  v16[3] = CFSTR("kCBMsgArgOutputBytesPerSecond");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 11, v15);
}

- (void)getStatistics:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__CBScalablePipeManager_getStatistics___block_invoke;
  v6[3] = &unk_1E53FF618;
  v7 = v4;
  v5 = v4;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 12, MEMORY[0x1E0C9AA70], v6);

}

uint64_t __39__CBScalablePipeManager_getStatistics___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleEndpointAdded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgName"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet member:](self->_identifiers, "member:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v5)
      -[NSMutableSet removeObject:](self->_identifiers, "removeObject:", v8);
    if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
    {
      -[CBScalablePipeManager delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scalablePipeManager:didRegisterEndpoint:error:", self, v8, v5);

    }
  }

}

- (void)handleEndpointRemoved:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgName"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](self->_identifiers, "removeObject:");
  if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
  {
    -[CBScalablePipeManager delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scalablePipeManager:didUnregisterEndpoint:", self, v5);

  }
}

- (void)handlePipeConnected:(id)a3
{
  id v4;
  void *v5;
  CBScalablePipe *v6;

  v4 = a3;
  v6 = -[CBScalablePipe initWithPipeManager:info:]([CBScalablePipe alloc], "initWithPipeManager:info:", self, v4);

  -[NSHashTable addObject:](self->_pipes, "addObject:", v6);
  if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
  {
    -[CBScalablePipeManager delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scalablePipeManager:pipeDidConnect:", self, v6);

  }
}

- (void)handlePipeDisconnected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgName"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBScalablePipeManager pipeForName:identifier:](self, "pipeForName:identifier:", v9, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if ((*(_BYTE *)&self->_delegateFlags & 8) != 0)
    {
      -[CBScalablePipeManager delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scalablePipeManager:pipeDidDisconnect:error:", self, v7, v6);

    }
    -[NSHashTable removeObject:](self->_pipes, "removeObject:", v7);
  }

}

- (void)handleHostStateUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgName"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBScalablePipeManager pipeForName:identifier:](self, "pipeForName:identifier:", v10, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "integerValue");
  objc_msgSend(v6, "peer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHostState:", v8);

}

- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3
{
  return (a3 & 0xFFFE) == 8;
}

- (void)handleMsg:(unsigned __int16)a3 args:(id)a4
{
  int v4;
  id v6;
  char v7;
  char **v8;
  const char *v9;
  NSObject *v10;
  CBManagerState v11;
  NSObject *v12;

  v4 = a3;
  v6 = a4;
  v7 = 1;
  v8 = &selRef_handleEndpointAdded_;
  switch(v4)
  {
    case 13:
      goto LABEL_9;
    case 14:
      v9 = sel_handleEndpointRemoved_;
      -[CBManager state](self, "state");
      goto LABEL_16;
    case 15:
      v9 = sel_handlePipeConnected_;
      v11 = -[CBManager state](self, "state");
      goto LABEL_10;
    case 16:
      v7 = 0;
      v8 = &selRef_handlePipeDisconnected_;
LABEL_9:
      v9 = *v8;
      v11 = -[CBManager state](self, "state");
      if ((v7 & 1) == 0)
        goto LABEL_10;
      goto LABEL_16;
    case 17:
      v9 = sel_handleHostStateUpdated_;
      v11 = -[CBManager state](self, "state");
LABEL_10:
      if (v11 == CBManagerStatePoweredOn)
      {
LABEL_16:
        objc_msgSend(self, v9, v6);

      }
      else
      {
        if (CBLogInitOnce != -1)
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        v12 = CBLogComponent;
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
        {
          -[CBScalablePipeManager handleMsg:args:].cold.2((uint64_t)self, v4, v12);

        }
        else
        {
LABEL_6:

        }
      }
      break;
    default:
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v10 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_6;
      -[CBScalablePipeManager handleMsg:args:].cold.1(v4, v10);

      break;
  }
}

- (NSSet)identifiers
{
  return &self->_identifiers->super;
}

- (CBScalablePipeManagerDelegate)delegate
{
  return (CBScalablePipeManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSHashTable)pipes
{
  return self->_pipes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

- (void)pipeForName:(os_log_t)log identifier:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1A82A2000, log, OS_LOG_TYPE_ERROR, "Unable to locate pipe to device %@ on endpoint \"%@\", (uint8_t *)&v3, 0x16u);
}

- (void)handleMsg:(int)a1 args:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A82A2000, a2, OS_LOG_TYPE_ERROR, "Unhandled XPC message: %u", (uint8_t *)v2, 8u);
}

- (void)handleMsg:(os_log_t)log args:.cold.2(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_debug_impl(&dword_1A82A2000, log, OS_LOG_TYPE_DEBUG, "%@ is not powered on, ignoring message: %u", (uint8_t *)&v3, 0x12u);
}

@end
