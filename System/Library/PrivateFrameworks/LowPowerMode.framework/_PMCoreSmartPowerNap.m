@implementation _PMCoreSmartPowerNap

- (_PMCoreSmartPowerNap)init
{
  _PMCoreSmartPowerNap *v2;
  os_log_t v3;
  void *v4;
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  void *v8;
  NSXPCConnection *v9;
  uint64_t v10;
  NSXPCConnection *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD handler[4];
  id v33;
  uint8_t buf[8];
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id location;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)_PMCoreSmartPowerNap;
  v2 = -[_PMCoreSmartPowerNap init](&v40, sel_init);
  v3 = os_log_create("com.apple.powerd", "coresmartpowernap");
  v4 = (void *)coresmartpowernap_log;
  coresmartpowernap_log = (uint64_t)v3;

  if (!v2)
    return v2;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.powerd.coresmartpowernap"), 4096);
  connection = v2->_connection;
  v2->_connection = (NSXPCConnection *)v5;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254616C70);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v7);

  -[NSXPCConnection setExportedObject:](v2->_connection, "setExportedObject:", v2);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254616CD0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](v2->_connection, "setExportedInterface:", v8);

  objc_initWeak(&location, v2);
  v9 = v2->_connection;
  v10 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __28___PMCoreSmartPowerNap_init__block_invoke;
  v37[3] = &unk_24C37D680;
  objc_copyWeak(&v38, &location);
  -[NSXPCConnection setInterruptionHandler:](v9, "setInterruptionHandler:", v37);
  v11 = v2->_connection;
  v35[0] = v10;
  v35[1] = 3221225472;
  v35[2] = __28___PMCoreSmartPowerNap_init__block_invoke_21;
  v35[3] = &unk_24C37D680;
  objc_copyWeak(&v36, &location);
  -[NSXPCConnection setInvalidationHandler:](v11, "setInvalidationHandler:", v35);
  -[NSXPCConnection resume](v2->_connection, "resume");
  v2->_connection_interrupted = 0;
  v12 = coresmartpowernap_log;
  if (coresmartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = v12;
LABEL_7:
      _os_log_impl(&dword_20AB79000, v13, OS_LOG_TYPE_DEFAULT, "Initialized connection", buf, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v13 = MEMORY[0x24BDACB70];
    goto LABEL_7;
  }
  v14 = MEMORY[0x24BDAC9B8];
  v15 = MEMORY[0x24BDAC9B8];
  handler[0] = v10;
  handler[1] = 3221225472;
  handler[2] = __28___PMCoreSmartPowerNap_init__block_invoke_23;
  handler[3] = &unk_24C37D6A8;
  objc_copyWeak(&v33, &location);
  v16 = notify_register_dispatch("com.apple.system.powermanagement.assertionresync", (int *)&init_resync_token_0, v14, handler);

  if ((_DWORD)v16)
  {
    v17 = coresmartpowernap_log;
    if (coresmartpowernap_log)
    {
      if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_ERROR))
        -[_PMSmartPowerNap init].cold.2(v16, v17, v18, v19, v20, v21, v22, v23);
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[_PMSmartPowerNap init].cold.1(v16, v24, v25, v26, v27, v28, v29, v30);
    }
  }
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
  return v2;
}

- (void)registerWithCallback:(id)a3 callback:(id)a4
{
  OS_dispatch_queue *v6;
  id v7;
  pid_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *identifier;
  OS_dispatch_queue *callback_queue;
  OS_dispatch_queue *v15;
  void *v16;
  id callback;
  _BYTE buffer[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = (OS_dispatch_queue *)a3;
  v7 = a4;
  v8 = getpid();
  proc_name(v8, buffer, 0x80u);
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@:%s"), v11, buffer);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v12;

  -[_PMCoreSmartPowerNap registerWithIdentifier:](self, "registerWithIdentifier:", self->_identifier);
  callback_queue = self->_callback_queue;
  self->_callback_queue = v6;
  v15 = v6;

  v16 = (void *)MEMORY[0x20BD2C5D8](v7);
  callback = self->_callback;
  self->_callback = v16;

}

- (unsigned)state
{
  return self->_current_state;
}

- (void)registerWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = coresmartpowernap_log;
  if (v4)
  {
    if (coresmartpowernap_log)
    {
      if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v15 = 138412290;
        *(_QWORD *)&v15[4] = v4;
        v6 = v5;
LABEL_9:
        _os_log_impl(&dword_20AB79000, v6, OS_LOG_TYPE_DEFAULT, "registerWithIdentifier %@", v15, 0xCu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v15 = 138412290;
      *(_QWORD *)&v15[4] = v4;
      v6 = MEMORY[0x24BDACB70];
      goto LABEL_9;
    }
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_1, *(_OWORD *)v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "registerWithIdentifier:", v4);

    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_FAULT))
    -[_PMSmartPowerNap registerWithIdentifier:].cold.1(v5, v7, v8, v9, v10, v11, v12, v13);
LABEL_11:

}

- (void)reRegister
{
  uint64_t v3;
  NSString *identifier;
  NSObject *v5;
  NSString *v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = coresmartpowernap_log;
  if (coresmartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      *(_DWORD *)v7 = 138412290;
      *(_QWORD *)&v7[4] = identifier;
      v5 = v3;
LABEL_6:
      _os_log_impl(&dword_20AB79000, v5, OS_LOG_TYPE_DEFAULT, "re-register with powerd with identifier: %@", v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = self->_identifier;
    *(_DWORD *)v7 = 138412290;
    *(_QWORD *)&v7[4] = v6;
    v5 = MEMORY[0x24BDACB70];
    goto LABEL_6;
  }
  -[_PMCoreSmartPowerNap registerWithIdentifier:](self, "registerWithIdentifier:", self->_identifier, *(_OWORD *)v7);
}

- (void)unregister
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (self->_identifier)
  {
    -[_PMCoreSmartPowerNap unregisterWithIdentifier:](self, "unregisterWithIdentifier:");
  }
  else
  {
    v2 = coresmartpowernap_log;
    if (coresmartpowernap_log)
    {
      if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_ERROR))
        -[_PMSmartPowerNap unregister].cold.3(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    else
    {
      v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v10)
        -[_PMSmartPowerNap unregister].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    v18 = coresmartpowernap_log;
    if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_FAULT))
      -[_PMSmartPowerNap unregister].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
  }
}

- (void)unregisterWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = coresmartpowernap_log;
  if (coresmartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v8 = 138412290;
      *(_QWORD *)&v8[4] = v4;
      v6 = v5;
LABEL_6:
      _os_log_impl(&dword_20AB79000, v6, OS_LOG_TYPE_DEFAULT, "unregisterWithIdentifier %@", v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v8 = 138412290;
    *(_QWORD *)&v8[4] = v4;
    v6 = MEMORY[0x24BDACB70];
    goto LABEL_6;
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_30, *(_OWORD *)v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unregisterWithIdentifier:", v4);

}

- (void)updateState:(unsigned __int8)a3
{
  void *v5;
  void *v6;
  NSObject *callback_queue;
  _QWORD block[4];
  id v9;
  _PMCoreSmartPowerNap *v10;
  unsigned __int8 v11;

  self->_current_state = a3;
  v5 = (void *)os_transaction_create();
  v6 = v5;
  if (self->_callback)
  {
    callback_queue = self->_callback_queue;
    if (callback_queue)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __36___PMCoreSmartPowerNap_updateState___block_invoke;
      block[3] = &unk_24C37D6F0;
      v9 = v5;
      v10 = self;
      v11 = a3;
      dispatch_async(callback_queue, block);

    }
  }

}

- (void)setState:(unsigned __int8)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  v5 = coresmartpowernap_log;
  if (coresmartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v8) = 67109120;
      HIDWORD(v8) = v3;
      v6 = v5;
LABEL_6:
      _os_log_impl(&dword_20AB79000, v6, OS_LOG_TYPE_DEFAULT, "Updating CSPN state to %d", (uint8_t *)&v8, 8u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v8) = 67109120;
    HIDWORD(v8) = v3;
    v6 = MEMORY[0x24BDACB70];
    goto LABEL_6;
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_32_0, v8, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setState:", v3);

}

- (void)setCSPNQueryDelta:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  __int16 v10;

  v3 = *(_QWORD *)&a3;
  v5 = coresmartpowernap_log;
  if (coresmartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 0;
      v6 = (uint8_t *)&v10;
      v7 = v5;
LABEL_6:
      _os_log_impl(&dword_20AB79000, v7, OS_LOG_TYPE_DEFAULT, "Updating CSPN Query delay", v6, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    v7 = MEMORY[0x24BDACB70];
    v6 = (uint8_t *)&v9;
    goto LABEL_6;
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_33, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCSPNQueryDelta:", v3);

}

- (void)setCSPNRequeryDelta:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  __int16 v10;

  v3 = *(_QWORD *)&a3;
  v5 = coresmartpowernap_log;
  if (coresmartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 0;
      v6 = (uint8_t *)&v10;
      v7 = v5;
LABEL_6:
      _os_log_impl(&dword_20AB79000, v7, OS_LOG_TYPE_DEFAULT, "Updating CSPN Re-query delay", v6, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    v7 = MEMORY[0x24BDACB70];
    v6 = (uint8_t *)&v9;
    goto LABEL_6;
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_34_0, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCSPNRequeryDelta:", v3);

}

- (void)setCSPNIgnoreRemoteClient:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)&a3;
  v9 = *MEMORY[0x24BDAC8D0];
  v5 = coresmartpowernap_log;
  if (coresmartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v8) = 67109120;
      HIDWORD(v8) = v3;
      v6 = v5;
LABEL_6:
      _os_log_impl(&dword_20AB79000, v6, OS_LOG_TYPE_DEFAULT, "Updating setCSPNIgnoreRemoteClient state to %d", (uint8_t *)&v8, 8u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v8) = 67109120;
    HIDWORD(v8) = v3;
    v6 = MEMORY[0x24BDACB70];
    goto LABEL_6;
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_35_0, v8, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCSPNIgnoreRemoteClient:", v3);

}

- (void)setCSPNMotionAlarmThreshold:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  __int16 v10;

  v3 = *(_QWORD *)&a3;
  v5 = coresmartpowernap_log;
  if (coresmartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 0;
      v6 = (uint8_t *)&v10;
      v7 = v5;
LABEL_6:
      _os_log_impl(&dword_20AB79000, v7, OS_LOG_TYPE_DEFAULT, "Updating CSPN motion alarm threshold", v6, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    v7 = MEMORY[0x24BDACB70];
    v6 = (uint8_t *)&v9;
    goto LABEL_6;
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_36_0, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCSPNMotionAlarmThreshold:", v3);

}

- (void)setCSPNMotionAlarmStartThreshold:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  __int16 v10;

  v3 = *(_QWORD *)&a3;
  v5 = coresmartpowernap_log;
  if (coresmartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)coresmartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 0;
      v6 = (uint8_t *)&v10;
      v7 = v5;
LABEL_6:
      _os_log_impl(&dword_20AB79000, v7, OS_LOG_TYPE_DEFAULT, "Updating CSPN motion alarm start threshold", v6, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    v7 = MEMORY[0x24BDACB70];
    v6 = (uint8_t *)&v9;
    goto LABEL_6;
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_37_0, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCSPNMotionAlarmStartThreshold:", v3);

}

- (void)syncStateWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_38_0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncStateWithHandler:", v4);

}

- (unsigned)syncState
{
  _PMCoreSmartPowerNap *v2;
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
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_39_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33___PMCoreSmartPowerNap_syncState__block_invoke_40;
  v5[3] = &unk_24C37D718;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "syncStateWithHandler:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_dispatch_queue)callback_queue
{
  return self->_callback_queue;
}

- (void)setCallback_queue:(id)a3
{
  objc_storeStrong((id *)&self->_callback_queue, a3);
}

- (unsigned)current_state
{
  return self->_current_state;
}

- (void)setCurrent_state:(unsigned __int8)a3
{
  self->_current_state = a3;
}

- (BOOL)connection_interrupted
{
  return self->_connection_interrupted;
}

- (void)setConnection_interrupted:(BOOL)a3
{
  self->_connection_interrupted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callback_queue, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
