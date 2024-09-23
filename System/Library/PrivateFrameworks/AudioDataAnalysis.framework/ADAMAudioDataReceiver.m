@implementation ADAMAudioDataReceiver

- (ADAMAudioDataReceiver)initWithIdentifier:(id)a3
{
  id v5;
  ADAMAudioDataReceiver *v6;
  ADAMAudioDataReceiver *v7;
  uint64_t v8;
  NSXPCConnection *connection;
  NSMutableDictionary *v10;
  NSMutableDictionary *sensorStatus;
  NSMutableDictionary *v12;
  NSMutableDictionary *callbacks;
  NSMutableDictionary *v14;
  NSMutableDictionary *configs;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ADAMAudioDataReceiver;
  v6 = -[ADAMAudioDataReceiver init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    -[ADAMAudioDataReceiver setupConnection](v7, "setupConnection");
    v8 = objc_claimAutoreleasedReturnValue();
    connection = v7->_connection;
    v7->_connection = (NSXPCConnection *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    sensorStatus = v7->_sensorStatus;
    v7->_sensorStatus = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    callbacks = v7->_callbacks;
    v7->_callbacks = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    configs = v7->_configs;
    v7->_configs = v14;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)reset
{
  NSXPCConnection *connection;
  NSString *name;
  NSXPCConnection *v5;
  NSMutableDictionary *sensorStatus;
  NSMutableDictionary *callbacks;
  NSMutableDictionary *configs;

  connection = self->_connection;
  if (connection)
    -[NSXPCConnection invalidate](connection, "invalidate");
  name = self->_name;
  self->_name = 0;

  v5 = self->_connection;
  self->_connection = 0;

  sensorStatus = self->_sensorStatus;
  self->_sensorStatus = 0;

  callbacks = self->_callbacks;
  self->_callbacks = 0;

  configs = self->_configs;
  self->_configs = 0;

}

- (BOOL)verifyInvariants
{
  return self->_connection && self->_sensorStatus && self->_callbacks && self->_configs != 0;
}

- (void)receiveAudioSample:(id)a3 type:(unsigned int)a4 metadata:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSMutableDictionary *callbacks;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  NSObject *v13;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  callbacks = self->_callbacks;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](callbacks, "objectForKey:", v11);
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  if (v12)
  {
    ((void (**)(_QWORD, id, id))v12)[2](v12, v8, v9);
  }
  else
  {
    ADAFLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ADAMAudioDataReceiver receiveAudioSample:type:metadata:].cold.1();

    -[ADAMAudioDataReceiver stopReceivingAudioSampleType:](self, "stopReceivingAudioSampleType:", v6);
  }

}

- (void)startReceivingAudioSampleType:(unsigned int)a3 withCallback:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  NSMutableDictionary *callbacks;
  void *v10;
  void *v11;
  uint64_t v12;
  NSXPCConnection *connection;
  void *v14;
  NSString *name;
  _QWORD v16[5];
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v4 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (-[ADAMAudioDataReceiver verifyInvariants](self, "verifyInvariants"))
  {
    ADAFLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      +[ADAFUtil stringFromDataType:](ADAFUtil, "stringFromDataType:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v8;
      _os_log_impl(&dword_20DC02000, v7, OS_LOG_TYPE_DEFAULT, "start receiving audio sample type: %@", buf, 0xCu);

    }
    os_unfair_lock_lock(&self->_lock);
    callbacks = self->_callbacks;
    v10 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](callbacks, "setObject:forKey:", v10, v11);

    os_unfair_lock_unlock(&self->_lock);
    v12 = MEMORY[0x24BDAC760];
    connection = self->_connection;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __68__ADAMAudioDataReceiver_startReceivingAudioSampleType_withCallback___block_invoke;
    v17[3] = &unk_24C83D990;
    v17[4] = self;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    name = self->_name;
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __68__ADAMAudioDataReceiver_startReceivingAudioSampleType_withCallback___block_invoke_6;
    v16[3] = &unk_24C83D990;
    v16[4] = self;
    objc_msgSend(v14, "startListeningToAudioSampleWithIdentifier:type:withReply:", name, v4, v16);

  }
}

void __68__ADAMAudioDataReceiver_startReceivingAudioSampleType_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  ADAFLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __68__ADAMAudioDataReceiver_startReceivingAudioSampleType_withCallback___block_invoke_cold_1();

}

uint64_t __68__ADAMAudioDataReceiver_startReceivingAudioSampleType_withCallback___block_invoke_6(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleAndLogError:", a2);
  return result;
}

- (void)startReceivingAudioSampleType:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  NSMutableDictionary *callbacks;
  void *v8;
  uint64_t v9;
  NSXPCConnection *connection;
  void *v11;
  NSString *name;
  _QWORD v13[5];
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v3 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x24BDAC8D0];
  if (-[ADAMAudioDataReceiver verifyInvariants](self, "verifyInvariants"))
  {
    ADAFLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      +[ADAFUtil stringFromDataType:](ADAFUtil, "stringFromDataType:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_20DC02000, v5, OS_LOG_TYPE_DEFAULT, "start receiving audio sample type: %@", buf, 0xCu);

    }
    os_unfair_lock_lock(&self->_lock);
    callbacks = self->_callbacks;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](callbacks, "setObject:forKey:", &__block_literal_global_8, v8);

    os_unfair_lock_unlock(&self->_lock);
    v9 = MEMORY[0x24BDAC760];
    connection = self->_connection;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __55__ADAMAudioDataReceiver_startReceivingAudioSampleType___block_invoke_2;
    v14[3] = &unk_24C83D990;
    v14[4] = self;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    name = self->_name;
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __55__ADAMAudioDataReceiver_startReceivingAudioSampleType___block_invoke_9;
    v13[3] = &unk_24C83D990;
    v13[4] = self;
    objc_msgSend(v11, "startListeningToAudioSampleWithIdentifier:type:withReply:", name, v3, v13);

  }
}

void __55__ADAMAudioDataReceiver_startReceivingAudioSampleType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  ADAFLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __68__ADAMAudioDataReceiver_startReceivingAudioSampleType_withCallback___block_invoke_cold_1();

}

uint64_t __55__ADAMAudioDataReceiver_startReceivingAudioSampleType___block_invoke_9(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleAndLogError:", a2);
  return result;
}

- (void)stopReceivingAudioSampleType:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  NSMutableDictionary *callbacks;
  void *v8;
  uint64_t v9;
  NSXPCConnection *connection;
  void *v11;
  NSString *name;
  _QWORD v13[5];
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v3 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x24BDAC8D0];
  if (-[ADAMAudioDataReceiver verifyInvariants](self, "verifyInvariants"))
  {
    ADAFLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      +[ADAFUtil stringFromDataType:](ADAFUtil, "stringFromDataType:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_20DC02000, v5, OS_LOG_TYPE_DEFAULT, "stop receiving audio sample type: %@", buf, 0xCu);

    }
    os_unfair_lock_lock(&self->_lock);
    callbacks = self->_callbacks;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](callbacks, "removeObjectForKey:", v8);

    os_unfair_lock_unlock(&self->_lock);
    v9 = MEMORY[0x24BDAC760];
    connection = self->_connection;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __54__ADAMAudioDataReceiver_stopReceivingAudioSampleType___block_invoke;
    v14[3] = &unk_24C83D990;
    v14[4] = self;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    name = self->_name;
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __54__ADAMAudioDataReceiver_stopReceivingAudioSampleType___block_invoke_10;
    v13[3] = &unk_24C83D990;
    v13[4] = self;
    objc_msgSend(v11, "stopListeningToAudioSampleTypeWithIdentifier:type:withReply:", name, v3, v13);

  }
}

void __54__ADAMAudioDataReceiver_stopReceivingAudioSampleType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  ADAFLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __54__ADAMAudioDataReceiver_stopReceivingAudioSampleType___block_invoke_cold_1();

}

uint64_t __54__ADAMAudioDataReceiver_stopReceivingAudioSampleType___block_invoke_10(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleAndLogError:", a2);
  return result;
}

- (void)startMeasuringAudioSampleType:(unsigned int)a3 withConfiguration:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSMutableDictionary *sensorStatus;
  void *v15;
  void *v16;
  NSMutableDictionary *configs;
  void *v18;
  void *v19;
  void *v20;
  NSString *name;
  _QWORD v22[5];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v4 = *(_QWORD *)&a3;
  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (-[ADAMAudioDataReceiver verifyInvariants](self, "verifyInvariants"))
  {
    ADAFLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      +[ADAFUtil stringFromDataType:](ADAFUtil, "stringFromDataType:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_log_impl(&dword_20DC02000, v7, OS_LOG_TYPE_DEFAULT, "attempting to start measuring %@ with configuration", buf, 0xCu);

    }
    if ((_DWORD)v4 == 1702260324)
    {
      ADAFLog();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v10)
        {
          *(_DWORD *)buf = 138412290;
          v24 = v6;
          v11 = "%@";
          v12 = v9;
          v13 = 12;
LABEL_10:
          _os_log_impl(&dword_20DC02000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
        }
      }
      else if (v10)
      {
        *(_WORD *)buf = 0;
        v11 = "configuration empty";
        v12 = v9;
        v13 = 2;
        goto LABEL_10;
      }

      os_unfair_lock_lock(&self->_lock);
      sensorStatus = self->_sensorStatus;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1702260324);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](sensorStatus, "setObject:forKey:", v15, v16);

      if (v6)
      {
        configs = self->_configs;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1702260324);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](configs, "setObject:forKey:", v18, v19);

      }
      os_unfair_lock_unlock(&self->_lock);
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      name = self->_name;
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __73__ADAMAudioDataReceiver_startMeasuringAudioSampleType_withConfiguration___block_invoke_13;
      v22[3] = &unk_24C83D990;
      v22[4] = self;
      objc_msgSend(v20, "startMeasuringAudioSampleTypeWithIdentifier:type:withConfiguration:andReply:", name, 1702260324, v6, v22);

    }
  }

}

void __73__ADAMAudioDataReceiver_startMeasuringAudioSampleType_withConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  ADAFLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __73__ADAMAudioDataReceiver_startMeasuringAudioSampleType_withConfiguration___block_invoke_cold_1();

}

uint64_t __73__ADAMAudioDataReceiver_startMeasuringAudioSampleType_withConfiguration___block_invoke_13(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleAndLogError:", a2);
  return result;
}

- (void)stopMeasuringAudioSampleType:(unsigned int)a3
{
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  NSMutableDictionary *sensorStatus;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *name;
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = -[ADAMAudioDataReceiver verifyInvariants](self, "verifyInvariants");
  if (a3 == 1702260324 && v5)
  {
    ADAFLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      +[ADAFUtil stringFromDataType:](ADAFUtil, "stringFromDataType:", 1702260324);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_impl(&dword_20DC02000, v6, OS_LOG_TYPE_DEFAULT, "attempting to stop measuring %@", buf, 0xCu);

    }
    os_unfair_lock_lock(&self->_lock);
    sensorStatus = self->_sensorStatus;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1702260324);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](sensorStatus, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = self->_sensorStatus;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1702260324);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v12, v13);

    }
    os_unfair_lock_unlock(&self->_lock);
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_14);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    name = self->_name;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __54__ADAMAudioDataReceiver_stopMeasuringAudioSampleType___block_invoke_15;
    v16[3] = &unk_24C83D990;
    v16[4] = self;
    objc_msgSend(v14, "stopMeasuringAudioSampleTypeWithIdentifier:type:andReply:", name, 1702260324, v16);

  }
}

void __54__ADAMAudioDataReceiver_stopMeasuringAudioSampleType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  ADAFLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __73__ADAMAudioDataReceiver_startMeasuringAudioSampleType_withConfiguration___block_invoke_cold_1();

}

uint64_t __54__ADAMAudioDataReceiver_stopMeasuringAudioSampleType___block_invoke_15(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleAndLogError:", a2);
  return result;
}

- (void)configureAudioSampleType:(unsigned int)a3 configuration:(id)a4
{
  uint64_t v4;
  id v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  NSMutableDictionary *configs;
  void *v11;
  void *v12;
  void *v13;
  NSString *name;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v4 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = -[ADAMAudioDataReceiver verifyInvariants](self, "verifyInvariants");
  if (v6 && v7)
  {
    ADAFLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      +[ADAFUtil stringFromDataType:](ADAFUtil, "stringFromDataType:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_20DC02000, v8, OS_LOG_TYPE_DEFAULT, "configuring %@ with configs: %@", buf, 0x16u);

    }
    os_unfair_lock_lock(&self->_lock);
    configs = self->_configs;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:copyItems:", v6, 1);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](configs, "setObject:forKey:", v11, v12);

    os_unfair_lock_unlock(&self->_lock);
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    name = self->_name;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __64__ADAMAudioDataReceiver_configureAudioSampleType_configuration___block_invoke_17;
    v15[3] = &unk_24C83D990;
    v15[4] = self;
    objc_msgSend(v13, "configureAudioSampleTypeWithIdentifier:type:configuration:withReply:", name, v4, v6, v15);

  }
}

void __64__ADAMAudioDataReceiver_configureAudioSampleType_configuration___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  ADAFLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __73__ADAMAudioDataReceiver_startMeasuringAudioSampleType_withConfiguration___block_invoke_cold_1();

}

uint64_t __64__ADAMAudioDataReceiver_configureAudioSampleType_configuration___block_invoke_17(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleAndLogError:", a2);
  return result;
}

- (id)getCurrentConfigurationForAudioSampleType:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  dispatch_semaphore_t v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v3 = *(_QWORD *)&a3;
  v26 = *MEMORY[0x24BDAC8D0];
  if (-[ADAMAudioDataReceiver verifyInvariants](self, "verifyInvariants"))
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    v23 = dispatch_semaphore_create(0);
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    v17 = 0;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __67__ADAMAudioDataReceiver_getCurrentConfigurationForAudioSampleType___block_invoke_19;
    v11[3] = &unk_24C83DA78;
    v11[4] = &v12;
    v11[5] = &v18;
    objc_msgSend(v5, "getCurrentConfigurationForAudioSampleType:withReply:", v3, v11);

    v6 = v19[5];
    v7 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 2000000000);
    if (dispatch_semaphore_wait(v6, v7))
    {
      ADAFLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[ADAMAudioDataReceiver getCurrentConfigurationForAudioSampleType:]";
        _os_log_impl(&dword_20DC02000, v8, OS_LOG_TYPE_DEFAULT, "connection timeout: %s", buf, 0xCu);
      }

    }
    v9 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

void __67__ADAMAudioDataReceiver_getCurrentConfigurationForAudioSampleType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  ADAFLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __73__ADAMAudioDataReceiver_startMeasuringAudioSampleType_withConfiguration___block_invoke_cold_1();

}

intptr_t __67__ADAMAudioDataReceiver_getCurrentConfigurationForAudioSampleType___block_invoke_19(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (BOOL)isMeasurementOnForAudioSampleType:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  BOOL v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  dispatch_semaphore_t v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v3 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x24BDAC8D0];
  if (!-[ADAMAudioDataReceiver verifyInvariants](self, "verifyInvariants"))
    return 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = dispatch_semaphore_create(0);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__ADAMAudioDataReceiver_isMeasurementOnForAudioSampleType___block_invoke_22;
  v11[3] = &unk_24C83DAC0;
  v11[4] = &v12;
  v11[5] = &v16;
  objc_msgSend(v5, "isMeasurementOnForAudioSampleType:withReply:", v3, v11);

  v6 = v17[5];
  v7 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 2000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    ADAFLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[ADAMAudioDataReceiver isMeasurementOnForAudioSampleType:]";
      _os_log_impl(&dword_20DC02000, v8, OS_LOG_TYPE_DEFAULT, "connection timeout: %s", buf, 0xCu);
    }

  }
  v9 = *((_BYTE *)v13 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __59__ADAMAudioDataReceiver_isMeasurementOnForAudioSampleType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  ADAFLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __73__ADAMAudioDataReceiver_startMeasuringAudioSampleType_withConfiguration___block_invoke_cold_1();

}

intptr_t __59__ADAMAudioDataReceiver_isMeasurementOnForAudioSampleType___block_invoke_22(uint64_t a1, int a2)
{
  NSObject *v4;
  const char *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  ADAFLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "OFF";
    if (a2)
      v5 = "ON";
    v7 = 136315138;
    v8 = v5;
    _os_log_impl(&dword_20DC02000, v4, OS_LOG_TYPE_DEFAULT, "measurement is %s", (uint8_t *)&v7, 0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)receiveAudioSample:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ADAFLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_20DC02000, v5, OS_LOG_TYPE_INFO, "receieved audio data analysis sample %@", (uint8_t *)&v11, 0xCu);
  }

  -[ADAMAudioDataReceiver delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    ADAFLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = WeakRetained;
      _os_log_impl(&dword_20DC02000, v7, OS_LOG_TYPE_INFO, "sending sample [%@] to delegate %@", (uint8_t *)&v11, 0x16u);

    }
    -[ADAMAudioDataReceiver delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "receiveAudioSample:", v4);

  }
}

- (id)setupConnection
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.audio.adam.xpc"), 4096);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549DEBC0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549DD6A0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExportedInterface:", v5);

  objc_msgSend(v3, "setExportedObject:", self);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __40__ADAMAudioDataReceiver_setupConnection__block_invoke;
  v11[3] = &unk_24C83DAE8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v11);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __40__ADAMAudioDataReceiver_setupConnection__block_invoke_91;
  v9[3] = &unk_24C83DAE8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v9);
  v7 = objc_loadWeakRetained(&location);
  objc_msgSend(v7, "setConnectionDidInvalidate:", 0);

  objc_msgSend(v3, "resume");
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v3;
}

void __40__ADAMAudioDataReceiver_setupConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  ADAFLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__ADAMAudioDataReceiver_setupConnection__block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reconnect");

}

void __40__ADAMAudioDataReceiver_setupConnection__block_invoke_91(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  ADAFLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__ADAMAudioDataReceiver_setupConnection__block_invoke_91_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setConnectionDidInvalidate:", 1);

}

- (void)reconnect
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_20DC02000, v0, v1, "re-connection to AudioDataAnalysisManager(ADAM) aborted due to invalid connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __34__ADAMAudioDataReceiver_reconnect__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "unsignedIntegerValue");
  v8 = objc_msgSend(v6, "BOOLValue");

  if (v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ADAFLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      +[ADAFUtil stringFromDataType:](ADAFUtil, "stringFromDataType:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v11;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_20DC02000, v10, OS_LOG_TYPE_DEFAULT, "*restart* measuring '%@' with cfg: %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_93);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(v13 + 8);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __34__ADAMAudioDataReceiver_reconnect__block_invoke_94;
    v15[3] = &unk_24C83D990;
    v15[4] = v13;
    objc_msgSend(v12, "startMeasuringAudioSampleTypeWithIdentifier:type:withConfiguration:andReply:", v14, v7, v9, v15);

  }
}

void __34__ADAMAudioDataReceiver_reconnect__block_invoke_92(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  ADAFLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __73__ADAMAudioDataReceiver_startMeasuringAudioSampleType_withConfiguration___block_invoke_cold_1();

}

uint64_t __34__ADAMAudioDataReceiver_reconnect__block_invoke_94(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleAndLogError:", a2);
  return result;
}

void __34__ADAMAudioDataReceiver_reconnect__block_invoke_96(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  ADAFLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __73__ADAMAudioDataReceiver_startMeasuringAudioSampleType_withConfiguration___block_invoke_cold_1();

}

uint64_t __34__ADAMAudioDataReceiver_reconnect__block_invoke_98(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleAndLogError:", a2);
  return result;
}

- (void)handleAndLogError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_12;
  v6 = objc_msgSend(v4, "code");
  if (v6 == 560164457)
  {
LABEL_5:
    -[ADAMAudioDataReceiver reset](self, "reset");
    goto LABEL_9;
  }
  if (v6 != 1969974894)
  {
    if (v6 != 560295540)
    {
      ADAFLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[ADAMAudioDataReceiver handleAndLogError:].cold.2();

      goto LABEL_9;
    }
    goto LABEL_5;
  }
LABEL_9:
  ADAFLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[ADAMAudioDataReceiver handleAndLogError:].cold.1();

LABEL_12:
}

- (void)dealloc
{
  objc_super v3;

  -[ADAMAudioDataReceiver reset](self, "reset");
  v3.receiver = self;
  v3.super_class = (Class)ADAMAudioDataReceiver;
  -[ADAMAudioDataReceiver dealloc](&v3, sel_dealloc);
}

- (ADAMAudioDataReceiverDelegate)delegate
{
  return (ADAMAudioDataReceiverDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (BOOL)connectionDidInvalidate
{
  return self->_connectionDidInvalidate;
}

- (void)setConnectionDidInvalidate:(BOOL)a3
{
  self->_connectionDidInvalidate = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_configs, 0);
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_sensorStatus, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)receiveAudioSample:type:metadata:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_20DC02000, v0, v1, "failed to fetch callback function", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __68__ADAMAudioDataReceiver_startReceivingAudioSampleType_withCallback___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_20DC02000, v0, v1, "%@ : connection error %@");
  OUTLINED_FUNCTION_2();
}

void __54__ADAMAudioDataReceiver_stopReceivingAudioSampleType___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_20DC02000, v0, v1, "%@ : connection error: %@");
  OUTLINED_FUNCTION_2();
}

void __73__ADAMAudioDataReceiver_startMeasuringAudioSampleType_withConfiguration___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_20DC02000, v0, v1, "connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __40__ADAMAudioDataReceiver_setupConnection__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_20DC02000, v0, v1, "Connection to AudioDataAnalysisManager(ADAM) interrupted, will attempt to reconnect", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __40__ADAMAudioDataReceiver_setupConnection__block_invoke_91_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_20DC02000, v0, v1, "Connection to AudioDataAnalysisManager(ADAM) invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)handleAndLogError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_20DC02000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)handleAndLogError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_20DC02000, v0, v1, "Unexpected Error!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
