@implementation CSXPCClient

- (CSXPCClient)initWithType:(unint64_t)a3
{
  CSXPCClient *v4;
  void *v5;
  uint64_t v6;
  OS_dispatch_queue *xpcReplyQueue;
  uint64_t v8;
  OS_dispatch_queue *xpcClientQueue;
  uint64_t v10;
  NSMutableSet *activationAssertions;
  uint64_t v12;
  NSHashTable *audioSessionInfoObservers;
  void *v14;
  uint64_t v15;
  NSString *UUID;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CSXPCClient;
  v4 = -[CSXPCClient init](&v18, sel_init);
  if (v4)
  {
    CSLogInitIfNeeded();
    if ((objc_msgSend(MEMORY[0x1E0D19260], "supportsDispatchWorkloop") & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D19260], "rootQueueWithFixedPriority:", *MEMORY[0x1E0D192F0]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[CSXPCClient _getSerialQueueWithName:targetQueue:](v4, "_getSerialQueueWithName:targetQueue:", CFSTR("CSXPCClient Reply Queue"), v5);
    v6 = objc_claimAutoreleasedReturnValue();
    xpcReplyQueue = v4->_xpcReplyQueue;
    v4->_xpcReplyQueue = (OS_dispatch_queue *)v6;

    -[CSXPCClient _getSerialQueueWithName:targetQueue:](v4, "_getSerialQueueWithName:targetQueue:", CFSTR("CSXPCClient connection Queue"), v5);
    v8 = objc_claimAutoreleasedReturnValue();
    xpcClientQueue = v4->_xpcClientQueue;
    v4->_xpcClientQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    activationAssertions = v4->_activationAssertions;
    v4->_activationAssertions = (NSMutableSet *)v10;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v12 = objc_claimAutoreleasedReturnValue();
    audioSessionInfoObservers = v4->_audioSessionInfoObservers;
    v4->_audioSessionInfoObservers = (NSHashTable *)v12;

    v4->_xpcClientType = a3;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = objc_claimAutoreleasedReturnValue();
    UUID = v4->_UUID;
    v4->_UUID = (NSString *)v15;

  }
  return v4;
}

- (BOOL)isConnected
{
  NSObject *xpcClientQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__CSXPCClient_isConnected__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(xpcClientQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)connect
{
  NSObject *xpcClientQueue;
  _QWORD block[5];

  xpcClientQueue = self->_xpcClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__CSXPCClient_connect__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(xpcClientQueue, block);
}

- (void)disconnect
{
  NSObject *xpcClientQueue;
  _QWORD block[5];

  xpcClientQueue = self->_xpcClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__CSXPCClient_disconnect__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(xpcClientQueue, block);
}

- (void)_disconnect
{
  OS_xpc_object *xpcConnection;
  OS_xpc_object *v4;

  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    xpc_connection_set_event_handler(xpcConnection, &__block_literal_global_9764);
    xpc_connection_cancel(self->_xpcConnection);
    v4 = self->_xpcConnection;
    self->_xpcConnection = 0;

  }
}

- (void)dealloc
{
  objc_super v3;

  -[CSXPCClient _disconnect](self, "_disconnect");
  v3.receiver = self;
  v3.super_class = (Class)CSXPCClient;
  -[CSXPCClient dealloc](&v3, sel_dealloc);
}

- (id)_getSerialQueueWithName:(id)a3 targetQueue:(id)a4
{
  NSObject *v5;
  uint64_t v6;
  void *v7;

  v5 = a4;
  if (v5)
  {
    v6 = (uint64_t)dispatch_queue_create_with_target_V2((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), 0, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D19260], "getSerialQueueWithQOS:name:fixedPriority:", 33, a3, *MEMORY[0x1E0D192F0]);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (void)_sendXPCClientType
{
  NSObject *v3;
  unint64_t xpcClientType;
  xpc_object_t v5;
  id v6;
  xpc_object_t v7;
  uint64_t i;
  xpc_object_t v9[2];
  xpc_object_t values;
  char *keys;
  _BYTE buf[18];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcClientQueue);
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    xpcClientType = self->_xpcClientType;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CSXPCClient _sendXPCClientType]";
    *(_WORD *)&buf[12] = 1026;
    *(_DWORD *)&buf[14] = xpcClientType;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Sending XPCClientType : %{public}d", buf, 0x12u);
  }
  keys = "xpcClientType";
  values = xpc_int64_create(self->_xpcClientType);
  v5 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)buf = xmmword_1E7C28BF0;
  v9[0] = xpc_int64_create(15);
  v6 = v5;
  v9[1] = v6;
  v7 = xpc_dictionary_create((const char *const *)buf, v9, 2uLL);
  -[CSXPCClient _sendMessageAsync:completion:](self, "_sendMessageAsync:completion:", v7, 0, v9[0]);

  for (i = 1; i != -1; --i)
}

- (BOOL)prepareAudioProviderWithContext:(id)a3 clientType:(unint64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  xpc_object_t v10;
  id v11;
  xpc_object_t v12;
  BOOL v13;
  uint64_t i;
  uint64_t j;
  xpc_object_t v17[2];
  char *keys[2];
  xpc_object_t values[3];
  _BYTE buf[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CSXPCClient prepareAudioProviderWithContext:clientType:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Prepare Audio Provider with Context : %{public}@", buf, 0x16u);
  }
  *(_OWORD *)buf = xmmword_1E7C252C8;
  *(_QWORD *)&buf[16] = "clientType";
  values[0] = xpc_int64_create(1);
  objc_msgSend(v8, "xpcObject");
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  values[2] = xpc_uint64_create(a4);
  v10 = xpc_dictionary_create((const char *const *)buf, values, 3uLL);
  *(_OWORD *)keys = xmmword_1E7C28BF0;
  v17[0] = xpc_int64_create(13);
  v11 = v10;
  v17[1] = v11;
  v12 = xpc_dictionary_create((const char *const *)keys, v17, 2uLL);
  v13 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v12, a5, v17[0]);

  for (i = 1; i != -1; --i)
  for (j = 2; j != -1; --j)

  return v13;
}

- (void)pingpong:(id)a3
{
  id v4;
  id v5;
  void *v6;
  xpc_object_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __24__CSXPCClient_pingpong___block_invoke;
  v11 = &unk_1E7C290D8;
  v12 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1C3BC4734](&v8);
  keys[0] = "type";
  values = xpc_int64_create(1);
  v7 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v7, v6, v8, v9, v10, v11);

}

- (BOOL)prewarmAudioSessionWithError:(id *)a3
{
  xpc_object_t v5;
  id v6;
  xpc_object_t v7;
  BOOL v8;
  uint64_t i;
  xpc_object_t v11[2];
  char *v12[2];
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "type";
  values = xpc_int64_create(1);
  v5 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  *(_OWORD *)v12 = xmmword_1E7C28BF0;
  v11[0] = xpc_int64_create(2);
  v6 = v5;
  v11[1] = v6;
  v7 = xpc_dictionary_create((const char *const *)v12, v11, 2uLL);
  v8 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v7, a3, v11[0]);

  for (i = 1; i != -1; --i)
  return v8;
}

- (BOOL)activateAudioSessionWithReason:(unint64_t)a3 dynamicAttribute:(unint64_t)a4 bundleID:(id)a5 error:(id *)a6
{
  xpc_object_t v10;
  id v11;
  xpc_object_t v12;
  id v13;
  xpc_object_t v14;
  BOOL v15;
  uint64_t i;
  uint64_t j;
  xpc_object_t v19[2];
  char *v20[2];
  xpc_object_t values[4];
  char *keys[2];
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1E7C252E0;
  v23 = *(_OWORD *)&off_1E7C252F0;
  if (a5)
    v10 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(a5), "UTF8String"));
  else
    v10 = 0;
  values[0] = xpc_int64_create(2);
  values[1] = xpc_int64_create(a3);
  values[2] = xpc_int64_create(a4);
  v11 = v10;
  values[3] = v11;
  v12 = xpc_dictionary_create((const char *const *)keys, values, 4uLL);
  *(_OWORD *)v20 = xmmword_1E7C28BF0;
  v19[0] = xpc_int64_create(2);
  v13 = v12;
  v19[1] = v13;
  v14 = xpc_dictionary_create((const char *const *)v20, v19, 2uLL);
  v15 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v14, a6, v19[0]);

  for (i = 1; i != -1; --i)
  for (j = 3; j != -1; --j)

  return v15;
}

- (BOOL)deactivateAudioSession:(unint64_t)a3 error:(id *)a4
{
  xpc_object_t v7;
  id v8;
  xpc_object_t v9;
  BOOL v10;
  uint64_t i;
  uint64_t j;
  xpc_object_t v14[2];
  char *v15[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1E7C25300;
  values[0] = xpc_int64_create(3);
  values[1] = xpc_int64_create(a3);
  v7 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v15 = xmmword_1E7C28BF0;
  v14[0] = xpc_int64_create(2);
  v8 = v7;
  v14[1] = v8;
  v9 = xpc_dictionary_create((const char *const *)v15, v14, 2uLL);
  v10 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v9, a4, v14[0]);

  for (i = 1; i != -1; --i)
  for (j = 1; j != -1; --j)

  return v10;
}

- (void)setDuckOthersOption:(BOOL)a3
{
  xpc_object_t v5;
  id v6;
  xpc_object_t v7;
  uint64_t i;
  uint64_t j;
  xpc_object_t v10[2];
  char *v11[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1E7C25310;
  values[0] = xpc_int64_create(5);
  values[1] = xpc_BOOL_create(a3);
  v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v11 = xmmword_1E7C28BF0;
  v10[0] = xpc_int64_create(2);
  v6 = v5;
  v10[1] = v6;
  v7 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v7, 0, v10[0]);

  for (i = 1; i != -1; --i)
  for (j = 1; j != -1; --j)

}

- (void)enableSmartRoutingConsideration:(BOOL)a3
{
  xpc_object_t v5;
  id v6;
  xpc_object_t v7;
  uint64_t i;
  uint64_t j;
  xpc_object_t v10[2];
  char *v11[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1E7C25320;
  values[0] = xpc_int64_create(9);
  values[1] = xpc_BOOL_create(a3);
  v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v11 = xmmword_1E7C28BF0;
  v10[0] = xpc_int64_create(2);
  v6 = v5;
  v10[1] = v6;
  v7 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v7, 0, v10[0]);

  for (i = 1; i != -1; --i)
  for (j = 1; j != -1; --j)

}

- (void)enableMiniDucking:(BOOL)a3
{
  xpc_object_t v5;
  id v6;
  xpc_object_t v7;
  uint64_t i;
  uint64_t j;
  xpc_object_t v10[2];
  char *v11[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1E7C25330;
  values[0] = xpc_int64_create(6);
  values[1] = xpc_BOOL_create(a3);
  v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v11 = xmmword_1E7C28BF0;
  v10[0] = xpc_int64_create(2);
  v6 = v5;
  v10[1] = v6;
  v7 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v7, 0, v10[0]);

  for (i = 1; i != -1; --i)
  for (j = 1; j != -1; --j)

}

- (BOOL)setAlertSoundFromURL:(id)a3 forType:(int64_t)a4 force:(BOOL)a5
{
  id v8;
  xpc_object_t v9;
  void *v10;
  id v11;
  id v12;
  xpc_object_t v13;
  BOOL v14;
  uint64_t i;
  uint64_t j;
  xpc_object_t v18[2];
  char *v19[2];
  xpc_object_t values[3];
  char *keys[2];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  *(_OWORD *)keys = xmmword_1E7C25340;
  v22 = "forceSetAlert";
  values[0] = xpc_int64_create(1);
  values[1] = xpc_int64_create(a4);
  values[2] = xpc_BOOL_create(a5);
  v9 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  if (v8)
  {
    objc_msgSend(v8, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v8, "path");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v9, "soundPath", (const char *)objc_msgSend(v11, "UTF8String"));

    }
  }
  *(_OWORD *)v19 = xmmword_1E7C28BF0;
  v18[0] = xpc_int64_create(6);
  v12 = v9;
  v18[1] = v12;
  v13 = xpc_dictionary_create((const char *const *)v19, v18, 2uLL);
  v14 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v13, 0, v18[0]);

  for (i = 1; i != -1; --i)
  for (j = 2; j != -1; --j)

  return v14;
}

- (BOOL)playAlertSoundForType:(int64_t)a3
{
  xpc_object_t v5;
  id v6;
  xpc_object_t v7;
  BOOL v8;
  uint64_t i;
  uint64_t j;
  xpc_object_t v12[2];
  char *v13[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1E7C25358;
  values[0] = xpc_int64_create(2);
  values[1] = xpc_int64_create(a3);
  v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v13 = xmmword_1E7C28BF0;
  v12[0] = xpc_int64_create(6);
  v6 = v5;
  v12[1] = v6;
  v7 = xpc_dictionary_create((const char *const *)v13, v12, 2uLL);
  v8 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v7, 0, v12[0]);

  for (i = 1; i != -1; --i)
  for (j = 1; j != -1; --j)

  return v8;
}

- (BOOL)playRecordStartingAlertAndResetEndpointerWithAlertOverride:(int64_t)a3
{
  xpc_object_t v5;
  id v6;
  xpc_object_t v7;
  BOOL v8;
  uint64_t i;
  uint64_t j;
  xpc_object_t v12[2];
  char *v13[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1E7C25368;
  values[0] = xpc_int64_create(3);
  values[1] = xpc_int64_create(a3);
  v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v13 = xmmword_1E7C28BF0;
  v12[0] = xpc_int64_create(6);
  v6 = v5;
  v12[1] = v6;
  v7 = xpc_dictionary_create((const char *const *)v13, v12, 2uLL);
  v8 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v7, 0, v12[0]);

  for (i = 1; i != -1; --i)
  for (j = 1; j != -1; --j)

  return v8;
}

- (unint64_t)alertStartTime
{
  xpc_object_t v3;
  id v4;
  xpc_object_t v5;
  NSObject *xpcClientQueue;
  id v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD block[4];
  id v12;
  CSXPCClient *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  xpc_object_t v19[2];
  char *v20[2];
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "type";
  values = xpc_int64_create(4);
  v3 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  *(_OWORD *)v20 = xmmword_1E7C28BF0;
  v19[0] = xpc_int64_create(6);
  v4 = v3;
  v19[1] = v4;
  v5 = xpc_dictionary_create((const char *const *)v20, v19, 2uLL);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__CSXPCClient_alertStartTime__block_invoke;
  block[3] = &unk_1E7C277D0;
  v12 = v5;
  v13 = self;
  v14 = &v15;
  v7 = v5;
  dispatch_async_and_wait(xpcClientQueue, block);
  v8 = v16[3];

  v9 = 1;
  _Block_object_dispose(&v15, 8);
  do

  while (v9 != -1);
  return v8;
}

- (void)configureAlertBehavior:(id)a3
{
  id v4;
  xpc_object_t v5;
  id v6;
  xpc_object_t v7;
  uint64_t i;
  uint64_t j;
  xpc_object_t v10[2];
  char *v11[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  *(_OWORD *)keys = xmmword_1E7C25378;
  values[0] = xpc_int64_create(5);
  objc_msgSend(v4, "_cs_xpcObject");
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v11 = xmmword_1E7C28BF0;
  v10[0] = xpc_int64_create(6);
  v6 = v5;
  v10[1] = v6;
  v7 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v7, 0, v10[0]);

  for (i = 1; i != -1; --i)
  for (j = 1; j != -1; --j)

}

- (void)setMeteringEnabled:(BOOL)a3
{
  xpc_object_t v5;
  uint64_t v6;
  id v7;
  xpc_object_t v8;
  uint64_t i;
  xpc_object_t v10[2];
  char *v11[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1E7C25388;
  values[0] = xpc_int64_create(1);
  values[1] = xpc_BOOL_create(a3);
  v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v11 = xmmword_1E7C28BF0;
  v6 = 1;
  v10[0] = xpc_int64_create(8);
  v7 = v5;
  v10[1] = v7;
  v8 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v8, 0, v10[0]);

  do
  while (v6 != -1);

  for (i = 1; i != -1; --i)
}

- (void)updateMeters
{
  xpc_object_t v3;
  uint64_t v4;
  id v5;
  xpc_object_t v6;
  xpc_object_t v7[2];
  char *v8[2];
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "type";
  values = xpc_int64_create(2);
  v3 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  *(_OWORD *)v8 = xmmword_1E7C28BF0;
  v4 = 1;
  v7[0] = xpc_int64_create(8);
  v5 = v3;
  v7[1] = v5;
  v6 = xpc_dictionary_create((const char *const *)v8, v7, 2uLL);
  -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v6, 0, v7[0]);

  do
  while (v4 != -1);

}

- (float)peakPowerForChannel:(unint64_t)a3
{
  xpc_object_t v5;
  uint64_t v6;
  id v7;
  xpc_object_t v8;
  NSObject *xpcClientQueue;
  id v10;
  float v11;
  uint64_t i;
  _QWORD block[4];
  id v15;
  CSXPCClient *v16;
  uint64_t *v17;
  uint64_t v18;
  float *v19;
  uint64_t v20;
  int v21;
  xpc_object_t v22[2];
  char *v23[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1E7C25398;
  values[0] = xpc_int64_create(3);
  values[1] = xpc_uint64_create(a3);
  v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v23 = xmmword_1E7C28BF0;
  v6 = 1;
  v22[0] = xpc_int64_create(8);
  v7 = v5;
  v22[1] = v7;
  v8 = xpc_dictionary_create((const char *const *)v23, v22, 2uLL);
  v18 = 0;
  v19 = (float *)&v18;
  v20 = 0x2020000000;
  v21 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CSXPCClient_peakPowerForChannel___block_invoke;
  block[3] = &unk_1E7C277D0;
  v15 = v8;
  v16 = self;
  v17 = &v18;
  v10 = v8;
  dispatch_async_and_wait(xpcClientQueue, block);
  v11 = v19[6];

  _Block_object_dispose(&v18, 8);
  do

  while (v6 != -1);
  for (i = 1; i != -1; --i)

  return v11;
}

- (float)averagePowerForChannel:(unint64_t)a3
{
  xpc_object_t v5;
  uint64_t v6;
  id v7;
  xpc_object_t v8;
  NSObject *xpcClientQueue;
  id v10;
  float v11;
  uint64_t i;
  _QWORD block[4];
  id v15;
  CSXPCClient *v16;
  uint64_t *v17;
  uint64_t v18;
  float *v19;
  uint64_t v20;
  int v21;
  xpc_object_t v22[2];
  char *v23[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1E7C25398;
  values[0] = xpc_int64_create(4);
  values[1] = xpc_uint64_create(a3);
  v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v23 = xmmword_1E7C28BF0;
  v6 = 1;
  v22[0] = xpc_int64_create(8);
  v7 = v5;
  v22[1] = v7;
  v8 = xpc_dictionary_create((const char *const *)v23, v22, 2uLL);
  v18 = 0;
  v19 = (float *)&v18;
  v20 = 0x2020000000;
  v21 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CSXPCClient_averagePowerForChannel___block_invoke;
  block[3] = &unk_1E7C277D0;
  v15 = v8;
  v16 = self;
  v17 = &v18;
  v10 = v8;
  dispatch_async_and_wait(xpcClientQueue, block);
  v11 = v19[6];

  _Block_object_dispose(&v18, 8);
  do

  while (v6 != -1);
  for (i = 1; i != -1; --i)

  return v11;
}

- (id)audioMetric
{
  xpc_object_t v3;
  id v4;
  xpc_object_t v5;
  NSObject *xpcClientQueue;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD block[4];
  id v12;
  CSXPCClient *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  xpc_object_t v21[2];
  char *v22[2];
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "type";
  values = xpc_int64_create(1);
  v3 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  *(_OWORD *)v22 = xmmword_1E7C28BF0;
  v21[0] = xpc_int64_create(9);
  v4 = v3;
  v21[1] = v4;
  v5 = xpc_dictionary_create((const char *const *)v22, v21, 2uLL);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9661;
  v19 = __Block_byref_object_dispose__9662;
  v20 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__CSXPCClient_audioMetric__block_invoke;
  block[3] = &unk_1E7C277D0;
  v12 = v5;
  v13 = self;
  v14 = &v15;
  v7 = v5;
  dispatch_async_and_wait(xpcClientQueue, block);
  v8 = (id)v16[5];

  v9 = 1;
  _Block_object_dispose(&v15, 8);

  do
  while (v9 != -1);

  return v8;
}

- (BOOL)setCurrentContext:(id)a3 error:(id *)a4
{
  id v6;
  xpc_object_t v7;
  id v8;
  xpc_object_t v9;
  NSObject *xpcClientQueue;
  id v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  uint64_t i;
  uint64_t j;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(_QWORD *);
  void *v22;
  id v23;
  CSXPCClient *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  xpc_object_t v39[2];
  char *v40[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    *(_OWORD *)keys = xmmword_1E7C254A0;
    values[0] = xpc_int64_create(1);
    objc_msgSend(v6, "xpcObject");
    values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue();
    v7 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    *(_OWORD *)v40 = xmmword_1E7C28BF0;
    v39[0] = xpc_int64_create(4);
    v8 = v7;
    v39[1] = v8;
    v9 = xpc_dictionary_create((const char *const *)v40, v39, 2uLL);
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__9661;
    v37 = __Block_byref_object_dispose__9662;
    v38 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__9661;
    v31 = __Block_byref_object_dispose__9662;
    v32 = 0;
    xpcClientQueue = self->_xpcClientQueue;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __39__CSXPCClient_setCurrentContext_error___block_invoke;
    v22 = &unk_1E7C253B0;
    v11 = v9;
    v23 = v11;
    v24 = self;
    v25 = &v33;
    v26 = &v27;
    dispatch_async_and_wait(xpcClientQueue, &v19);
    v12 = (void *)v34[5];
    if (v12)
    {
      v13 = xpc_dictionary_get_BOOL(v12, "result");
      -[CSXPCClient _decodeError:](self, "_decodeError:", v34[5], v19, v20, v21, v22);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v28[5];
      v28[5] = v14;

      if (!a4)
      {
LABEL_9:

        _Block_object_dispose(&v27, 8);
        _Block_object_dispose(&v33, 8);

        for (i = 1; i != -1; --i)
        for (j = 1; j != -1; --j)

        goto LABEL_13;
      }
    }
    else
    {
      v13 = 0;
      if (!a4)
        goto LABEL_9;
    }
    *a4 = objc_retainAutorelease((id)v28[5]);
    goto LABEL_9;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, 0);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_13:

  return v13;
}

- (id)audioStreamWithRequest:(id)a3 streamName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  xpc_object_t v10;
  id v11;
  xpc_object_t v12;
  NSObject *v13;
  NSObject *xpcClientQueue;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id *p_audioStream;
  CSAudioStream *audioStream;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t i;
  uint64_t j;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  CSXPCClient *v33;
  id v34;
  _BYTE *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _BYTE buf[24];
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  xpc_object_t v47[2];
  char *v48[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    *(_OWORD *)keys = xmmword_1E7C25420;
    values[0] = xpc_int64_create(2);
    objc_msgSend(v8, "xpcObject");
    values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue();
    v10 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    *(_OWORD *)v48 = xmmword_1E7C28BF0;
    v47[0] = xpc_int64_create(4);
    v11 = v10;
    v47[1] = v11;
    v12 = xpc_dictionary_create((const char *const *)v48, v47, 2uLL);
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__9661;
    v41 = __Block_byref_object_dispose__9662;
    v42 = 0;
    if (v12)
    {
      v13 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[CSXPCClient audioStreamWithRequest:streamName:error:]";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v9;
        _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s audioStreamWithRequest for stream %{public}@", buf, 0x16u);
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v44 = __Block_byref_object_copy__9661;
      v45 = __Block_byref_object_dispose__9662;
      v46 = 0;
      xpcClientQueue = self->_xpcClientQueue;
      v29 = MEMORY[0x1E0C809B0];
      v30 = 3221225472;
      v31 = __55__CSXPCClient_audioStreamWithRequest_streamName_error___block_invoke;
      v32 = &unk_1E7C253B0;
      v33 = self;
      v35 = buf;
      v34 = v12;
      v36 = &v37;
      dispatch_async_and_wait(xpcClientQueue, &v29);
      v15 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (v15
        && (v16 = xpc_dictionary_get_BOOL(v15, "result"),
            -[CSXPCClient _decodeError:](self, "_decodeError:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v29, v30, v31, v32, v33), v17 = objc_claimAutoreleasedReturnValue(), v18 = (void *)v38[5], v38[5] = v17, v18, v16))
      {
        v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0D19040]), "initWithAudioStreamProvider:streamName:streamRequest:", self, v9, v8);
        audioStream = self->_audioStream;
        p_audioStream = (id *)&self->_audioStream;
        *p_audioStream = (id)v19;

        v22 = *p_audioStream;
      }
      else
      {
        v22 = 0;
      }

      _Block_object_dispose(buf, 8);
      if (!a5)
        goto LABEL_15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1253, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v38[5];
      v38[5] = v24;

      v22 = 0;
      if (!a5)
        goto LABEL_15;
    }
    *a5 = objc_retainAutorelease((id)v38[5]);
LABEL_15:
    v23 = v22;
    _Block_object_dispose(&v37, 8);

    for (i = 1; i != -1; --i)
    for (j = 1; j != -1; --j)

    goto LABEL_19;
  }
  if (*a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, 0);
    v23 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
LABEL_19:

  return v23;
}

- (void)audioStreamWithRequest:(id)a3 streamName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *xpcClientQueue;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __60__CSXPCClient_audioStreamWithRequest_streamName_completion___block_invoke;
  v25[3] = &unk_1E7C253D8;
  v12 = v10;
  v26 = v12;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v25);
  if (v8)
  {
    +[CSXPCClient createPrepareAudioStreamMessageWithRequest:](CSXPCClient, "createPrepareAudioStreamMessageWithRequest:", v8);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      v16 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[CSXPCClient audioStreamWithRequest:streamName:completion:]";
        v29 = 2114;
        v30 = v9;
        _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s audioStreamWithRequest for stream %{public}@", buf, 0x16u);
      }
      xpcClientQueue = self->_xpcClientQueue;
      v20[0] = v11;
      v20[1] = 3221225472;
      v20[2] = __60__CSXPCClient_audioStreamWithRequest_streamName_completion___block_invoke_42;
      v20[3] = &unk_1E7C27360;
      v20[4] = self;
      v18 = v15;
      v21 = v18;
      v22 = v9;
      v23 = v8;
      v24 = v13;
      dispatch_async(xpcClientQueue, v20);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1253, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v19);

      v18 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v13)[2](v13, 0, v18);
  }

}

- (BOOL)prepareAudioStreamSync:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  xpc_object_t v14;
  id v15;
  xpc_object_t v16;
  NSObject *xpcClientQueue;
  id v18;
  void *v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  uint64_t i;
  uint64_t j;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(_QWORD *);
  void *v29;
  id v30;
  CSXPCClient *v31;
  _BYTE *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _BYTE buf[24];
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  xpc_object_t v44[2];
  char *v45[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = *MEMORY[0x1E0D18F60];
  if (!v8 || !v9)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[CSXPCClient prepareAudioStreamSync:request:error:]";
      _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s Invalid message: stream is nil or request is nil", buf, 0xCu);
      if (a5)
        goto LABEL_10;
    }
    else if (a5)
    {
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, 0);
      v20 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    v20 = 0;
    goto LABEL_20;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    objc_msgSend(v8, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CSXPCClient prepareAudioStreamSync:request:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s PrepareAudioStream %{public}@", buf, 0x16u);

  }
  *(_OWORD *)keys = xmmword_1E7C25420;
  values[0] = xpc_int64_create(3);
  objc_msgSend(v10, "xpcObject");
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  v14 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v45 = xmmword_1E7C28BF0;
  v44[0] = xpc_int64_create(4);
  v15 = v14;
  v44[1] = v15;
  v16 = xpc_dictionary_create((const char *const *)v45, v44, 2uLL);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v41 = __Block_byref_object_copy__9661;
  v42 = __Block_byref_object_dispose__9662;
  v43 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__9661;
  v38 = __Block_byref_object_dispose__9662;
  v39 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __52__CSXPCClient_prepareAudioStreamSync_request_error___block_invoke;
  v29 = &unk_1E7C253B0;
  v18 = v16;
  v30 = v18;
  v31 = self;
  v32 = buf;
  v33 = &v34;
  dispatch_async_and_wait(xpcClientQueue, &v26);
  v19 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (!v19)
  {
    v20 = 0;
    if (!a5)
      goto LABEL_13;
    goto LABEL_12;
  }
  v20 = xpc_dictionary_get_BOOL(v19, "result");
  -[CSXPCClient _decodeError:](self, "_decodeError:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v26, v27, v28, v29);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v35[5];
  v35[5] = v21;

  if (a5)
LABEL_12:
    *a5 = objc_retainAutorelease((id)v35[5]);
LABEL_13:

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(buf, 8);

  for (i = 1; i != -1; --i)
  for (j = 1; j != -1; --j)

LABEL_20:
  return v20;
}

- (void)prepareAudioStream:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __53__CSXPCClient_prepareAudioStream_request_completion___block_invoke;
  v17[3] = &unk_1E7C290D8;
  v11 = v10;
  v18 = v11;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v17);
  v13 = *MEMORY[0x1E0D18F60];
  if (v8 && v9)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      objc_msgSend(v8, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v20 = "-[CSXPCClient prepareAudioStream:request:completion:]";
      v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s PrepareAudioStream %{public}@", buf, 0x16u);

    }
    +[CSXPCClient createPrepareAudioStreamMessageWithRequest:](CSXPCClient, "createPrepareAudioStreamMessageWithRequest:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v16, v12);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[CSXPCClient prepareAudioStream:request:completion:]";
      _os_log_error_impl(&dword_1C2614000, v13, OS_LOG_TYPE_ERROR, "%s Invalid message: stream is nil or request is nil", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v12)[2](v12, 0, v16);
  }

}

- (BOOL)supportsDuckingOnCurrentRouteWithError:(id *)a3
{
  xpc_object_t v5;
  id v6;
  xpc_object_t v7;
  BOOL v8;
  uint64_t i;
  xpc_object_t v11[2];
  char *v12[2];
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "type";
  values = xpc_int64_create(102);
  v5 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  *(_OWORD *)v12 = xmmword_1E7C28BF0;
  v11[0] = xpc_int64_create(4);
  v6 = v5;
  v11[1] = v6;
  v7 = xpc_dictionary_create((const char *const *)v12, v11, 2uLL);
  v8 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v7, a3, v11[0]);

  for (i = 1; i != -1; --i)
  return v8;
}

- (void)startAudioStream:(id)a3 option:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a4;
  v9 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__CSXPCClient_startAudioStream_option_completion___block_invoke;
  v13[3] = &unk_1E7C290D8;
  v10 = v9;
  v14 = v10;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v13);
  if (a3 && v8)
  {
    +[CSXPCClient createStartAudioStreamMessageWithOption:](CSXPCClient, "createStartAudioStreamMessageWithOption:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v12, v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v12);
  }

}

- (void)stopAudioStream:(id)a3 option:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a4;
  v9 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__CSXPCClient_stopAudioStream_option_completion___block_invoke;
  v13[3] = &unk_1E7C290D8;
  v10 = v9;
  v14 = v10;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v13);
  if (a3)
  {
    +[CSXPCClient createStopAudioStreamMessageWithOption:](CSXPCClient, "createStopAudioStreamMessageWithOption:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSXPCClient sendMessageAsync:completion:](self, "sendMessageAsync:completion:", v12, v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v12);
  }

}

- (void)acousticSLResultForContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  xpc_object_t v11;
  id v12;
  xpc_object_t v13;
  NSObject *v14;
  NSObject *xpcClientQueue;
  uint64_t i;
  uint64_t j;
  _QWORD block[5];
  id v19;
  id v20;
  void (**v21)(_QWORD, _QWORD);
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  xpc_object_t v26[2];
  __int128 v27;
  xpc_object_t values[2];
  char *keys[4];

  keys[3] = *(char **)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __53__CSXPCClient_acousticSLResultForContext_completion___block_invoke;
  v22[3] = &unk_1E7C25458;
  v9 = v7;
  v23 = v9;
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x1C3BC4734](v22);
  *(_OWORD *)keys = xmmword_1E7C254A0;
  values[0] = xpc_int64_create(101);
  objc_msgSend(v6, "xpcObject");
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  v11 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  v27 = xmmword_1E7C28BF0;
  v26[0] = xpc_int64_create(4);
  v12 = v11;
  v26[1] = v12;
  v13 = xpc_dictionary_create((const char *const *)&v27, v26, 2uLL);
  v14 = *MEMORY[0x1E0D18F60];
  if (v13)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[CSXPCClient acousticSLResultForContext:completion:]";
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s Sending AcousticSLResult request", buf, 0xCu);
    }
    xpcClientQueue = self->_xpcClientQueue;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __53__CSXPCClient_acousticSLResultForContext_completion___block_invoke_46;
    block[3] = &unk_1E7C27310;
    block[4] = self;
    v19 = v13;
    v21 = v10;
    v20 = v6;
    dispatch_async(xpcClientQueue, block);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[CSXPCClient acousticSLResultForContext:completion:]";
      _os_log_error_impl(&dword_1C2614000, v14, OS_LOG_TYPE_ERROR, "%s Message not valid", buf, 0xCu);
    }
    v10[2](v10, 0);
  }

  for (i = 1; i != -1; --i)
  for (j = 1; j != -1; --j)

}

- (void)triggerInfoForContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  xpc_object_t v11;
  id v12;
  xpc_object_t v13;
  os_log_t *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *xpcClientQueue;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t i;
  uint64_t j;
  void *v31;
  _QWORD block[5];
  id v33;
  __int128 *p_buf;
  _QWORD v35[4];
  id v36;
  uint8_t v37[4];
  const char *v38;
  __int16 v39;
  void *v40;
  __int128 buf;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  xpc_object_t v46[2];
  char *v47[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __48__CSXPCClient_triggerInfoForContext_completion___block_invoke;
  v35[3] = &unk_1E7C25480;
  v9 = v7;
  v36 = v9;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v35);
  *(_OWORD *)keys = xmmword_1E7C254A0;
  values[0] = xpc_int64_create(100);
  objc_msgSend(v6, "xpcObject");
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  v11 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v47 = xmmword_1E7C28BF0;
  v46[0] = xpc_int64_create(4);
  v12 = v11;
  v46[1] = v12;
  v13 = xpc_dictionary_create((const char *const *)v47, v46, 2uLL);
  v14 = (os_log_t *)MEMORY[0x1E0D18F60];
  v15 = *MEMORY[0x1E0D18F60];
  v16 = *MEMORY[0x1E0D18F60];
  if (v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[CSXPCClient triggerInfoForContext:completion:]";
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s Sending VoiceTriggerInfo request", (uint8_t *)&buf, 0xCu);
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__9661;
    v44 = __Block_byref_object_dispose__9662;
    v45 = 0;
    xpcClientQueue = self->_xpcClientQueue;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __48__CSXPCClient_triggerInfoForContext_completion___block_invoke_50;
    block[3] = &unk_1E7C277D0;
    block[4] = self;
    p_buf = &buf;
    v33 = v13;
    dispatch_async_and_wait(xpcClientQueue, block);
    v18 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (!v18 || !xpc_dictionary_get_BOOL(v18, "result"))
    {
      v26 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v37 = 136315138;
        v38 = "-[CSXPCClient triggerInfoForContext:completion:]";
        _os_log_error_impl(&dword_1C2614000, v26, OS_LOG_TYPE_ERROR, "%s Failed to get VoiceTriggerInfo request", v37, 0xCu);
      }
      v10[2](v10, 0, 0);
      goto LABEL_27;
    }
    xpc_dictionary_get_dictionary(*(xpc_object_t *)(*((_QWORD *)&buf + 1) + 40), "voiceTriggerInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_dictionary(*(xpc_object_t *)(*((_QWORD *)&buf + 1) + 40), "rtsTriggerInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v20 = objc_alloc(MEMORY[0x1E0C99D80]);
      objc_msgSend(v20, "_cs_initWithXPCObject:", v31);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v37 = 136315394;
        v38 = "-[CSXPCClient triggerInfoForContext:completion:]";
        v39 = 2114;
        v40 = v21;
        _os_log_impl(&dword_1C2614000, v22, OS_LOG_TYPE_DEFAULT, "%s Received VoiceTriggerInfo %{public}@", v37, 0x16u);
      }
      if (v19)
      {
LABEL_10:
        v23 = objc_alloc(MEMORY[0x1E0C99D80]);
        objc_msgSend(v23, "_cs_initWithXPCObject:", v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v37 = 136315394;
          v38 = "-[CSXPCClient triggerInfoForContext:completion:]";
          v39 = 2114;
          v40 = v24;
          _os_log_impl(&dword_1C2614000, v25, OS_LOG_TYPE_DEFAULT, "%s Received rtsTriggerInfo %{public}@", v37, 0x16u);
        }
LABEL_26:
        ((void (**)(_QWORD, void *, void *))v10)[2](v10, v21, v24);

LABEL_27:
        _Block_object_dispose(&buf, 8);

        goto LABEL_28;
      }
    }
    else
    {
      if (objc_msgSend(v6, "isVoiceTriggered"))
      {
        v27 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v37 = 136315138;
          v38 = "-[CSXPCClient triggerInfoForContext:completion:]";
          _os_log_error_impl(&dword_1C2614000, v27, OS_LOG_TYPE_ERROR, "%s Failed to parse VoiceTriggerInfo from raw data", v37, 0xCu);
        }
      }
      v21 = 0;
      if (v19)
        goto LABEL_10;
    }
    if (objc_msgSend(v6, "isRTSTriggered"))
    {
      v28 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v37 = 136315138;
        v38 = "-[CSXPCClient triggerInfoForContext:completion:]";
        _os_log_error_impl(&dword_1C2614000, v28, OS_LOG_TYPE_ERROR, "%s Failed to parse rtsTriggerInfo from raw data", v37, 0xCu);
      }
    }
    v24 = 0;
    goto LABEL_26;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CSXPCClient triggerInfoForContext:completion:]";
    _os_log_error_impl(&dword_1C2614000, v15, OS_LOG_TYPE_ERROR, "%s Message not valid", (uint8_t *)&buf, 0xCu);
  }
  v10[2](v10, 0, 0);
LABEL_28:

  for (i = 1; i != -1; --i)
  for (j = 1; j != -1; --j)

}

- (id)recordRoute
{
  xpc_object_t v3;
  id v4;
  xpc_object_t v5;
  NSObject *xpcClientQueue;
  id v7;
  void *v8;
  void *v9;
  uint64_t i;
  _QWORD block[4];
  id v13;
  CSXPCClient *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  xpc_object_t v22[2];
  char *v23[2];
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "type";
  values = xpc_int64_create(7);
  v3 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  *(_OWORD *)v23 = xmmword_1E7C28BF0;
  v22[0] = xpc_int64_create(4);
  v4 = v3;
  v22[1] = v4;
  v5 = xpc_dictionary_create((const char *const *)v23, v22, 2uLL);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__9661;
  v20 = __Block_byref_object_dispose__9662;
  v21 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__CSXPCClient_recordRoute__block_invoke;
  block[3] = &unk_1E7C277D0;
  v7 = v5;
  v13 = v7;
  v14 = self;
  v15 = &v16;
  dispatch_async_and_wait(xpcClientQueue, block);
  v8 = (void *)v17[5];
  if (v8)
  {
    xpc_dictionary_get_value(v8, "recordRoute");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string((xpc_object_t)v17[5], "recordRoute"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = 0;
  }

  _Block_object_dispose(&v16, 8);
  for (i = 1; i != -1; --i)

  return v9;
}

- (id)recordDeviceInfo
{
  xpc_object_t v3;
  id v4;
  xpc_object_t v5;
  NSObject *xpcClientQueue;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t i;
  _QWORD block[4];
  id v14;
  CSXPCClient *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  xpc_object_t v23[2];
  char *v24[2];
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "type";
  values = xpc_int64_create(8);
  v3 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  *(_OWORD *)v24 = xmmword_1E7C28BF0;
  v23[0] = xpc_int64_create(4);
  v4 = v3;
  v23[1] = v4;
  v5 = xpc_dictionary_create((const char *const *)v24, v23, 2uLL);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9661;
  v21 = __Block_byref_object_dispose__9662;
  v22 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__CSXPCClient_recordDeviceInfo__block_invoke;
  block[3] = &unk_1E7C277D0;
  v7 = v5;
  v14 = v7;
  v15 = self;
  v16 = &v17;
  dispatch_async_and_wait(xpcClientQueue, block);
  v8 = (void *)v18[5];
  if (!v8)
    goto LABEL_5;
  xpc_dictionary_get_value(v8, "recordDeviceInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    xpc_dictionary_get_value((xpc_object_t)v18[5], "recordDeviceInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D190F0]), "initWithXPCObject:", v10);

      goto LABEL_6;
    }
LABEL_5:
    v9 = 0;
  }
LABEL_6:

  _Block_object_dispose(&v17, 8);
  for (i = 1; i != -1; --i)

  return v9;
}

- (id)audioDeviceInfo
{
  xpc_object_t v3;
  id v4;
  xpc_object_t v5;
  NSObject *xpcClientQueue;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD block[4];
  id v12;
  CSXPCClient *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  xpc_object_t v21[2];
  char *v22[2];
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "type";
  values = xpc_int64_create(12);
  v3 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  *(_OWORD *)v22 = xmmword_1E7C28BF0;
  v21[0] = xpc_int64_create(4);
  v4 = v3;
  v21[1] = v4;
  v5 = xpc_dictionary_create((const char *const *)v22, v21, 2uLL);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9661;
  v19 = __Block_byref_object_dispose__9662;
  v20 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CSXPCClient_audioDeviceInfo__block_invoke;
  block[3] = &unk_1E7C277D0;
  v12 = v5;
  v13 = self;
  v14 = &v15;
  v7 = v5;
  dispatch_async_and_wait(xpcClientQueue, block);
  v8 = (id)v16[5];

  v9 = 1;
  _Block_object_dispose(&v15, 8);

  do
  while (v9 != -1);

  return v8;
}

- (id)recordSettings
{
  xpc_object_t v3;
  id v4;
  xpc_object_t v5;
  NSObject *xpcClientQueue;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t i;
  _QWORD block[4];
  id v15;
  CSXPCClient *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  xpc_object_t v24[2];
  char *v25[2];
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "type";
  values = xpc_int64_create(9);
  v3 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  *(_OWORD *)v25 = xmmword_1E7C28BF0;
  v24[0] = xpc_int64_create(4);
  v4 = v3;
  v24[1] = v4;
  v5 = xpc_dictionary_create((const char *const *)v25, v24, 2uLL);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__9661;
  v22 = __Block_byref_object_dispose__9662;
  v23 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__CSXPCClient_recordSettings__block_invoke;
  block[3] = &unk_1E7C277D0;
  v7 = v5;
  v15 = v7;
  v16 = self;
  v17 = &v18;
  dispatch_async_and_wait(xpcClientQueue, block);
  v8 = (void *)v19[5];
  if (!v8)
    goto LABEL_5;
  xpc_dictionary_get_value(v8, "recordSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    xpc_dictionary_get_value((xpc_object_t)v19[5], "recordSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0C99D80]);
      objc_msgSend(v11, "_cs_initWithXPCObject:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
LABEL_5:
    v9 = 0;
  }
LABEL_6:

  _Block_object_dispose(&v18, 8);
  for (i = 1; i != -1; --i)

  return v9;
}

- (BOOL)isNarrowBand
{
  xpc_object_t v3;
  id v4;
  xpc_object_t v5;
  NSObject *xpcClientQueue;
  id v7;
  void *v8;
  BOOL v9;
  uint64_t i;
  _QWORD block[4];
  id v13;
  CSXPCClient *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  xpc_object_t v22[2];
  char *v23[2];
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "type";
  values = xpc_int64_create(10);
  v3 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  *(_OWORD *)v23 = xmmword_1E7C28BF0;
  v22[0] = xpc_int64_create(4);
  v4 = v3;
  v22[1] = v4;
  v5 = xpc_dictionary_create((const char *const *)v23, v22, 2uLL);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__9661;
  v20 = __Block_byref_object_dispose__9662;
  v21 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__CSXPCClient_isNarrowBand__block_invoke;
  block[3] = &unk_1E7C277D0;
  v7 = v5;
  v13 = v7;
  v14 = self;
  v15 = &v16;
  dispatch_async_and_wait(xpcClientQueue, block);
  v8 = (void *)v17[5];
  if (v8)
    v9 = xpc_dictionary_get_BOOL(v8, "result");
  else
    v9 = 0;

  _Block_object_dispose(&v16, 8);
  for (i = 1; i != -1; --i)

  return v9;
}

- (id)playbackRoute
{
  xpc_object_t v3;
  id v4;
  xpc_object_t v5;
  NSObject *xpcClientQueue;
  id v7;
  void *v8;
  void *v9;
  uint64_t i;
  _QWORD block[4];
  id v13;
  CSXPCClient *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  xpc_object_t v22[2];
  char *v23[2];
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "type";
  values = xpc_int64_create(11);
  v3 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  *(_OWORD *)v23 = xmmword_1E7C28BF0;
  v22[0] = xpc_int64_create(4);
  v4 = v3;
  v22[1] = v4;
  v5 = xpc_dictionary_create((const char *const *)v23, v22, 2uLL);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__9661;
  v20 = __Block_byref_object_dispose__9662;
  v21 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__CSXPCClient_playbackRoute__block_invoke;
  block[3] = &unk_1E7C277D0;
  v7 = v5;
  v13 = v7;
  v14 = self;
  v15 = &v16;
  dispatch_async_and_wait(xpcClientQueue, block);
  v8 = (void *)v17[5];
  if (v8)
  {
    xpc_dictionary_get_value(v8, "playbackRoute");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string((xpc_object_t)v17[5], "playbackRoute"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = 0;
  }

  _Block_object_dispose(&v16, 8);
  for (i = 1; i != -1; --i)

  return v9;
}

- (unint64_t)audioStreamId
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_FAULT))
  {
    v4 = 136315138;
    v5 = "-[CSXPCClient audioStreamId]";
    _os_log_fault_impl(&dword_1C2614000, v2, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v4, 0xCu);
  }
  return 0;
}

- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4
{
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_FAULT))
  {
    v6 = 136315138;
    v7 = "-[CSXPCClient audioChunkFrom:to:]";
    _os_log_fault_impl(&dword_1C2614000, v4, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4 channelIdx:(unint64_t)a5
{
  NSObject *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_FAULT))
  {
    v7 = 136315138;
    v8 = "-[CSXPCClient audioChunkFrom:to:channelIdx:]";
    _os_log_fault_impl(&dword_1C2614000, v5, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (id)audioChunkToEndFrom:(unint64_t)a3
{
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_FAULT))
  {
    v5 = 136315138;
    v6 = "-[CSXPCClient audioChunkToEndFrom:]";
    _os_log_fault_impl(&dword_1C2614000, v3, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

- (id)audioChunkToEndFrom:(unint64_t)a3 channelIdx:(unint64_t)a4
{
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_FAULT))
  {
    v6 = 136315138;
    v7 = "-[CSXPCClient audioChunkToEndFrom:channelIdx:]";
    _os_log_fault_impl(&dword_1C2614000, v4, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

- (void)saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5
{
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_FAULT))
  {
    v6 = 136315138;
    v7 = "-[CSXPCClient saveRecordingBufferFrom:to:toURL:]";
    _os_log_fault_impl(&dword_1C2614000, v5, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v6, 0xCu);
  }
}

- (void)saveRecordingBufferToEndFrom:(unint64_t)a3 toURL:(id)a4
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_FAULT))
  {
    v5 = 136315138;
    v6 = "-[CSXPCClient saveRecordingBufferToEndFrom:toURL:]";
    _os_log_fault_impl(&dword_1C2614000, v4, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v5, 0xCu);
  }
}

- (id)holdAudioStreamWithDescription:(id)a3 option:(id)a4
{
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_FAULT))
  {
    v6 = 136315138;
    v7 = "-[CSXPCClient holdAudioStreamWithDescription:option:]";
    _os_log_fault_impl(&dword_1C2614000, v4, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

- (void)cancelAudioStreamHold:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_FAULT))
  {
    v4 = 136315138;
    v5 = "-[CSXPCClient cancelAudioStreamHold:]";
    _os_log_fault_impl(&dword_1C2614000, v3, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)isRecording
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_FAULT))
  {
    v4 = 136315138;
    v5 = "-[CSXPCClient isRecording]";
    _os_log_fault_impl(&dword_1C2614000, v2, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v4, 0xCu);
  }
  return 0;
}

- (void)setAnnounceCallsEnabled:(BOOL)a3 withStreamHandleID:(unint64_t)a4
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_FAULT))
  {
    v5 = 136315138;
    v6 = "-[CSXPCClient setAnnounceCallsEnabled:withStreamHandleID:]";
    _os_log_fault_impl(&dword_1C2614000, v4, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v5, 0xCu);
  }
}

- (void)attachTandemStream:(id)a3 toPrimaryStream:(id)a4 completion:(id)a5
{
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_FAULT))
  {
    v6 = 136315138;
    v7 = "-[CSXPCClient attachTandemStream:toPrimaryStream:completion:]";
    _os_log_fault_impl(&dword_1C2614000, v5, OS_LOG_TYPE_FAULT, "%s Not implemented", (uint8_t *)&v6, 0xCu);
  }
}

- (void)registerObserver:(id)a3
{
  if (a3)
    -[NSHashTable addObject:](self->_audioSessionInfoObservers, "addObject:");
}

- (void)unregisterObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_audioSessionInfoObservers, "removeObject:");
}

- (unsigned)audioSessionIdForDeviceId:(id)a3
{
  id v4;
  xpc_object_t v5;
  id v6;
  xpc_object_t v7;
  void *v8;
  NSObject *xpcClientQueue;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t i;
  _QWORD block[5];
  id v16;
  __int128 *p_buf;
  uint8_t v18[4];
  const char *v19;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  xpc_object_t v25[2];
  char *v26[2];
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  v4 = a3;
  keys[0] = "type";
  values = xpc_int64_create(1);
  v5 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  if (v4)
    xpc_dictionary_set_string(v5, "deviceID", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  *(_OWORD *)v26 = xmmword_1E7C28BF0;
  v25[0] = xpc_int64_create(10);
  v6 = v5;
  v25[1] = v6;
  v7 = xpc_dictionary_create((const char *const *)v26, v25, 2uLL);
  v8 = v7;
  if (!v7)
  {
    v11 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[CSXPCClient audioSessionIdForDeviceId:]";
      _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s No message!!", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_11;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__9661;
  v23 = __Block_byref_object_dispose__9662;
  v24 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CSXPCClient_audioSessionIdForDeviceId___block_invoke;
  block[3] = &unk_1E7C277D0;
  block[4] = self;
  p_buf = &buf;
  v16 = v7;
  dispatch_async_and_wait(xpcClientQueue, block);
  v10 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
  if (v10)
  {
    LODWORD(self) = xpc_dictionary_get_uint64(*(xpc_object_t *)(*((_QWORD *)&buf + 1) + 40), "sessionID");
  }
  else
  {
    v12 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v18 = 136315138;
      v19 = "-[CSXPCClient audioSessionIdForDeviceId:]";
      _os_log_error_impl(&dword_1C2614000, v12, OS_LOG_TYPE_ERROR, "%s NO reply!!!", v18, 0xCu);
    }
  }

  _Block_object_dispose(&buf, 8);
  if (!v10)
LABEL_11:
    LODWORD(self) = 0;

  for (i = 1; i != -1; --i)
  return self;
}

- (unint64_t)hostTimeFromSampleCount:(unint64_t)uint64
{
  xpc_object_t v5;
  id v6;
  xpc_object_t v7;
  void *v8;
  NSObject *xpcClientQueue;
  uint64_t v10;
  NSObject *v11;
  uint64_t i;
  uint64_t j;
  _QWORD v15[5];
  id v16;
  _BYTE *v17;
  unint64_t v18;
  _BYTE buf[24];
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  xpc_object_t v23[2];
  char *v24[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1E7C254B0;
  values[0] = xpc_int64_create(1);
  values[1] = xpc_uint64_create(uint64);
  v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v24 = xmmword_1E7C28BF0;
  v23[0] = xpc_int64_create(14);
  v6 = v5;
  v23[1] = v6;
  v7 = xpc_dictionary_create((const char *const *)v24, v23, 2uLL);
  v8 = v7;
  if (!v7)
  {
    v11 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CSXPCClient hostTimeFromSampleCount:]";
      *(_WORD *)&buf[12] = 2050;
      *(_QWORD *)&buf[14] = uint64;
      _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s No message for hostTimeFromSampleCount request with sampleCount %{public}llu", buf, 0x16u);
    }
    goto LABEL_7;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v20 = __Block_byref_object_copy__9661;
  v21 = __Block_byref_object_dispose__9662;
  v22 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __39__CSXPCClient_hostTimeFromSampleCount___block_invoke;
  v15[3] = &unk_1E7C26290;
  v15[4] = self;
  v17 = buf;
  v16 = v7;
  v18 = uint64;
  dispatch_async_and_wait(xpcClientQueue, v15);
  v10 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  if (v10)
    uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(*(_QWORD *)&buf[8] + 40), "replyHostTime");

  _Block_object_dispose(buf, 8);
  if (!v10)
LABEL_7:
    uint64 = 0;

  for (i = 1; i != -1; --i)
  for (j = 1; j != -1; --j)

  return uint64;
}

- (unint64_t)sampleCountFromHostTime:(unint64_t)uint64
{
  xpc_object_t v5;
  id v6;
  xpc_object_t v7;
  void *v8;
  NSObject *xpcClientQueue;
  uint64_t v10;
  NSObject *v11;
  uint64_t i;
  uint64_t j;
  _QWORD v15[5];
  id v16;
  _BYTE *v17;
  unint64_t v18;
  _BYTE buf[24];
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  xpc_object_t v23[2];
  char *v24[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1E7C254C0;
  values[0] = xpc_int64_create(2);
  values[1] = xpc_uint64_create(uint64);
  v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v24 = xmmword_1E7C28BF0;
  v23[0] = xpc_int64_create(14);
  v6 = v5;
  v23[1] = v6;
  v7 = xpc_dictionary_create((const char *const *)v24, v23, 2uLL);
  v8 = v7;
  if (!v7)
  {
    v11 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CSXPCClient sampleCountFromHostTime:]";
      *(_WORD *)&buf[12] = 2050;
      *(_QWORD *)&buf[14] = uint64;
      _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s No message for sampleCountFromHostTime request with hostTime %{public}llu", buf, 0x16u);
    }
    goto LABEL_7;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v20 = __Block_byref_object_copy__9661;
  v21 = __Block_byref_object_dispose__9662;
  v22 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __39__CSXPCClient_sampleCountFromHostTime___block_invoke;
  v15[3] = &unk_1E7C26290;
  v15[4] = self;
  v17 = buf;
  v16 = v7;
  v18 = uint64;
  dispatch_async_and_wait(xpcClientQueue, v15);
  v10 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  if (v10)
    uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(*(_QWORD *)&buf[8] + 40), "replySampleCount");

  _Block_object_dispose(buf, 8);
  if (!v10)
LABEL_7:
    uint64 = 0;

  for (i = 1; i != -1; --i)
  for (j = 1; j != -1; --j)

  return uint64;
}

- (BOOL)fallbackDeactivateAudioSession:(unint64_t)a3 error:(id *)a4
{
  xpc_object_t v7;
  id v8;
  xpc_object_t v9;
  BOOL v10;
  uint64_t i;
  uint64_t j;
  xpc_object_t v14[2];
  char *v15[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1E7C254D0;
  values[0] = xpc_int64_create(1);
  values[1] = xpc_int64_create(a3);
  v7 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v15 = xmmword_1E7C28BF0;
  v14[0] = xpc_int64_create(17);
  v8 = v7;
  v14[1] = v8;
  v9 = xpc_dictionary_create((const char *const *)v15, v14, 2uLL);
  v10 = -[CSXPCClient sendMessageAndReplySync:error:](self, "sendMessageAndReplySync:error:", v9, a4, v14[0]);

  for (i = 1; i != -1; --i)
  for (j = 1; j != -1; --j)

  return v10;
}

- (void)sendMessageAsync:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *xpcClientQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  xpcClientQueue = self->_xpcClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CSXPCClient_sendMessageAsync_completion___block_invoke;
  block[3] = &unk_1E7C28EC8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(xpcClientQueue, block);

}

- (void)_sendMessageAsync:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  OS_xpc_object *xpcConnection;
  NSObject *xpcReplyQueue;
  void *v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcClientQueue);
  if (v6 && (xpcConnection = self->_xpcConnection) != 0)
  {
    xpcReplyQueue = self->_xpcReplyQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __44__CSXPCClient__sendMessageAsync_completion___block_invoke;
    v11[3] = &unk_1E7C254E8;
    v11[4] = self;
    v12 = v7;
    xpc_connection_send_message_with_reply(xpcConnection, v6, xpcReplyQueue, v11);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1252, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v10);

  }
}

- (id)_decodeError:(id)a3
{
  id v3;
  void *v4;
  void *string;
  int64_t int64;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    string = (void *)xpc_dictionary_get_string(v3, "resultErrorDomain");
    if (string)
    {
      int64 = xpc_dictionary_get_int64(v4, "resultErrorCode");
      v7 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, int64, 0);
      string = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    string = 0;
  }

  return string;
}

- (BOOL)sendMessageAndReplySync:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *xpcClientQueue;
  id v8;
  char v9;
  _QWORD v11[4];
  id v12;
  CSXPCClient *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__9661;
  v20 = __Block_byref_object_dispose__9662;
  v21 = 0;
  xpcClientQueue = self->_xpcClientQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__CSXPCClient_sendMessageAndReplySync_error___block_invoke;
  v11[3] = &unk_1E7C253B0;
  v8 = v6;
  v12 = v8;
  v13 = self;
  v14 = &v22;
  v15 = &v16;
  dispatch_async_and_wait(xpcClientQueue, v11);
  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  v9 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

- (void)_handleListenerEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1C3BC4CBC](v4);
    if (v6 == MEMORY[0x1E0C812F8])
    {
      -[CSXPCClient _handleListenerMessage:](self, "_handleListenerMessage:", v5);
      goto LABEL_11;
    }
    if (v6 == MEMORY[0x1E0C81310])
    {
      -[CSXPCClient _handleListenerError:](self, "_handleListenerError:", v5);
      goto LABEL_11;
    }
    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v12 = 136315138;
      v13 = "-[CSXPCClient _handleListenerEvent:]";
      v8 = "%s ignore unknown types of message ";
      v9 = v7;
      v10 = 12;
LABEL_8:
      _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v12, v10);
    }
  }
  else
  {
    v11 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[CSXPCClient _handleListenerEvent:]";
      v14 = 2050;
      v15 = 0;
      v8 = "%s cannot handle event : event = %{public}p";
      v9 = v11;
      v10 = 22;
      goto LABEL_8;
    }
  }
LABEL_11:

}

- (void)_handleListenerMessage:(id)a3
{
  id v4;
  void *v5;
  int64_t int64;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    int64 = xpc_dictionary_get_int64(v4, "type");
    xpc_dictionary_get_dictionary(v5, "body");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    switch(int64)
    {
      case 3:
        -[CSXPCClient _handleSessionProvidingDelegateMessageBody:](self, "_handleSessionProvidingDelegateMessageBody:", v7);
        break;
      case 5:
        -[CSXPCClient _handleStreamProvidingDelegateMessageBody:](self, "_handleStreamProvidingDelegateMessageBody:", v7);
        break;
      case 7:
        -[CSXPCClient _handleAlertProvidingDelegateMessageBody:](self, "_handleAlertProvidingDelegateMessageBody:", v7);
        break;
      case 11:
        -[CSXPCClient _handleSessionInfoProvidingDelegateMessageBody:](self, "_handleSessionInfoProvidingDelegateMessageBody:", v7);
        break;
      default:
        v9 = *MEMORY[0x1E0D18F60];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
        {
          v10 = 136315394;
          v11 = "-[CSXPCClient _handleListenerMessage:]";
          v12 = 2050;
          v13 = int64;
          _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Unexpected message type : %{public}lld", (uint8_t *)&v10, 0x16u);
        }
        break;
    }

  }
  else
  {
    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[CSXPCClient _handleListenerMessage:]";
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s Cannot handle nil message", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (void)_handleListenerError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v7;
  const char *v8;
  const char *string;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v10 = *MEMORY[0x1E0D18F60];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v12 = 136315394;
    v13 = "-[CSXPCClient _handleListenerError:]";
    v14 = 2050;
    v15 = 0;
    v8 = "%s cannot handle error : error = %{public}p";
    goto LABEL_15;
  }
  if (v4 != (id)MEMORY[0x1E0C81260] && v4 != (id)MEMORY[0x1E0C81258])
  {
    string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81270]);
    v10 = *MEMORY[0x1E0D18F60];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v12 = 136315394;
    v13 = "-[CSXPCClient _handleListenerError:]";
    v14 = 2082;
    v15 = string;
    v8 = "%s connection error: %{public}s";
LABEL_15:
    _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v12, 0x16u);
    goto LABEL_13;
  }
  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[CSXPCClient _handleListenerError:]";
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Listener connection disconnected", (uint8_t *)&v12, 0xCu);
  }
  -[CSXPCClient _handleListenerDisconnectedError:](self, "_handleListenerDisconnectedError:", v5);
LABEL_13:

}

- (void)_handleListenerDisconnectedError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  id WeakRetained;

  -[CSXPCClient audioStream](self, "audioStream", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CSXPCClient audioStream](self, "audioStream");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "audioStreamProvider:didStopStreamUnexpectedly:", self, 1);

  }
  -[CSXPCClient delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "CSXPCClient:didDisconnect:", self, 1);

  }
}

- (void)_handleAlertProvidingDelegateMessageBody:(id)a3
{
  id v4;
  int64_t int64;
  os_log_t *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  int64 = xpc_dictionary_get_int64(v4, "type");
  v6 = (os_log_t *)MEMORY[0x1E0D18F60];
  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[CSXPCClient _handleAlertProvidingDelegateMessageBody:]";
    v11 = 2050;
    v12 = int64;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s AlertProvidingDelegate messageType : %{public}lld", (uint8_t *)&v9, 0x16u);
  }
  if (int64 == 1)
  {
    -[CSXPCClient _handleAlertProvidingDelegateDidFinishAlertPlayback:](self, "_handleAlertProvidingDelegateDidFinishAlertPlayback:", v4);
  }
  else
  {
    v8 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[CSXPCClient _handleAlertProvidingDelegateMessageBody:]";
      v11 = 2050;
      v12 = int64;
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s Unexpected type : %{public}lld", (uint8_t *)&v9, 0x16u);
    }
  }

}

- (void)_handleAlertProvidingDelegateDidFinishAlertPlayback:(id)a3
{
  int int64;
  const char *string;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  xpc_object_t xdict;

  xdict = a3;
  int64 = xpc_dictionary_get_int64(xdict, "didFinishAlertPlayback");
  if (xpc_dictionary_get_string(xdict, "errorDomain"))
  {
    string = xpc_dictionary_get_string(xdict, "errorDomain");
    v6 = xpc_dictionary_get_int64(xdict, "errorCode");
    v7 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  -[CSXPCClient audioAlertProvidingDelegate](self, "audioAlertProvidingDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[CSXPCClient audioAlertProvidingDelegate](self, "audioAlertProvidingDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "audioAlertProvidingDidFinishAlertPlayback:ofType:error:", self, int64, v9);

  }
}

- (void)_handleSessionProvidingDelegateMessageBody:(id)a3
{
  id v4;
  int64_t int64;
  os_log_t *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  int64 = xpc_dictionary_get_int64(v4, "type");
  v6 = (os_log_t *)MEMORY[0x1E0D18F60];
  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[CSXPCClient _handleSessionProvidingDelegateMessageBody:]";
    v11 = 2050;
    v12 = int64;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s SessionProvidingDelegate messageType : %{public}lld", (uint8_t *)&v9, 0x16u);
  }
  switch(int64)
  {
    case 1:
      -[CSXPCClient _handleSessionProvidingDelegateWillSetAudioSession:](self, "_handleSessionProvidingDelegateWillSetAudioSession:", v4);
      break;
    case 2:
      -[CSXPCClient _handleSessionProvidingDelegateBeginInterruption:](self, "_handleSessionProvidingDelegateBeginInterruption:", v4);
      break;
    case 3:
      -[CSXPCClient _handleSessionProvidingDelegateBeginInterruptionWithContext:](self, "_handleSessionProvidingDelegateBeginInterruptionWithContext:", v4);
      break;
    case 4:
      -[CSXPCClient _handleSessionProvidingDelegateEndInterruption:](self, "_handleSessionProvidingDelegateEndInterruption:", v4);
      break;
    case 5:
      -[CSXPCClient _handleSessionProvidingDelegateDidSetAudioSession:](self, "_handleSessionProvidingDelegateDidSetAudioSession:", v4);
      break;
    case 10:
      -[CSXPCClient _handleSessionProvidingDelegateStreamHandleIdInvalidation:](self, "_handleSessionProvidingDelegateStreamHandleIdInvalidation:", v4);
      break;
    case 11:
      -[CSXPCClient _handleSessionProvidingDelegateDidChangeContext:](self, "_handleSessionProvidingDelegateDidChangeContext:", v4);
      break;
    default:
      v8 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
      {
        v9 = 136315394;
        v10 = "-[CSXPCClient _handleSessionProvidingDelegateMessageBody:]";
        v11 = 2050;
        v12 = int64;
        _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s Unexpected type : %{public}lld", (uint8_t *)&v9, 0x16u);
      }
      break;
  }

}

- (void)_handleSessionProvidingDelegateBeginInterruption:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "audioSessionProviderBeginInterruption:", self);

  }
}

- (void)_handleSessionProvidingDelegateBeginInterruptionWithContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  xpc_dictionary_get_dictionary(a3, "interruptionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(v5, "_cs_initWithXPCObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315394;
      v13 = "-[CSXPCClient _handleSessionProvidingDelegateBeginInterruptionWithContext:]";
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s context : %{public}@", (uint8_t *)&v12, 0x16u);
    }
    -[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "audioSessionProviderBeginInterruption:withContext:", self, v6);

    }
  }
  else
  {
    v11 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v12 = 136315138;
      v13 = "-[CSXPCClient _handleSessionProvidingDelegateBeginInterruptionWithContext:]";
      _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s invalid context", (uint8_t *)&v12, 0xCu);
    }
  }

}

- (void)_handleSessionProvidingDelegateEndInterruption:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "audioSessionProviderEndInterruption:", self);

  }
}

- (void)_handleSessionProvidingDelegateWillSetAudioSession:(id)a3
{
  _BOOL8 v4;
  void *v5;
  char v6;
  id v7;

  v4 = xpc_dictionary_get_BOOL(a3, "willSetAudioSessionActive");
  -[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "audioSessionProvider:willSetAudioSessionActive:", self, v4);

  }
}

- (void)_handleSessionProvidingDelegateDidSetAudioSession:(id)a3
{
  _BOOL8 v4;
  void *v5;
  char v6;
  id v7;

  v4 = xpc_dictionary_get_BOOL(a3, "didSetAudioSessionActive");
  -[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "audioSessionProvider:didSetAudioSessionActive:", self, v4);

  }
}

- (void)_handleSessionProvidingDelegateStreamHandleIdInvalidation:(id)a3
{
  _BOOL8 v4;
  void *v5;
  char v6;
  id v7;

  v4 = xpc_dictionary_get_BOOL(a3, "streamHandleIdInvalidationflag");
  -[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "audioSessionProvider:providerInvalidated:", self, v4);

  }
}

- (void)_handleSessionProvidingDelegateDidChangeContext:(id)a3
{
  _BOOL8 v4;
  void *v5;
  char v6;
  id v7;

  v4 = xpc_dictionary_get_BOOL(a3, "didChangeContextFlag");
  -[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CSXPCClient audioSessionProvidingDelegate](self, "audioSessionProvidingDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "audioSessionProvider:didChangeContext:", self, v4);

  }
}

- (void)_handleSessionInfoProvidingDelegateMessageBody:(id)a3
{
  id v4;
  int64_t int64;
  os_log_t *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  int64 = xpc_dictionary_get_int64(v4, "type");
  v6 = (os_log_t *)MEMORY[0x1E0D18F60];
  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[CSXPCClient _handleSessionInfoProvidingDelegateMessageBody:]";
    v11 = 2050;
    v12 = int64;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s SessionInfoProvidingDelegate messageType : %{public}lld", (uint8_t *)&v9, 0x16u);
  }
  switch(int64)
  {
    case 1:
      -[CSXPCClient _handleSessionInfoProvidingDelegateInterruptionNotification:](self, "_handleSessionInfoProvidingDelegateInterruptionNotification:", v4);
      break;
    case 2:
      -[CSXPCClient _handleSessionInfoProvidingDelegateRouteChangeNotification:](self, "_handleSessionInfoProvidingDelegateRouteChangeNotification:", v4);
      break;
    case 3:
      -[CSXPCClient _handleSessionInfoProvidingDelegateMediaServicesWereLostNotification:](self, "_handleSessionInfoProvidingDelegateMediaServicesWereLostNotification:", v4);
      break;
    case 4:
      -[CSXPCClient _handleSessionInfoProvidingDelegateMediaServicesWereResetNotification:](self, "_handleSessionInfoProvidingDelegateMediaServicesWereResetNotification:", v4);
      break;
    default:
      v8 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
      {
        v9 = 136315394;
        v10 = "-[CSXPCClient _handleSessionInfoProvidingDelegateMessageBody:]";
        v11 = 2050;
        v12 = int64;
        _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s Unexpected type : %{public}lld", (uint8_t *)&v9, 0x16u);
      }
      break;
  }

}

- (void)_handleSessionInfoProvidingDelegateInterruptionNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSHashTable *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  xpc_dictionary_get_dictionary(a3, "notificationInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(v5, "_cs_initWithXPCObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSXPCClient _handleSessionInfoProvidingDelegateInterruptionNotification:]";
      v22 = 2114;
      v23 = v6;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Received notificationInfo %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CSXPCClient _handleSessionInfoProvidingDelegateInterruptionNotification:]";
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s Failed to parse notificationInfo from raw data", buf, 0xCu);
    }
    v6 = 0;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = self->_audioSessionInfoObservers;
  v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "audioSessionInfoProvider:didReceiveAudioSessionInterruptionNotificationWithUserInfo:", self, v6, (_QWORD)v15);
      }
      v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (void)_handleSessionInfoProvidingDelegateRouteChangeNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSHashTable *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  xpc_dictionary_get_dictionary(a3, "notificationInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(v5, "_cs_initWithXPCObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSXPCClient _handleSessionInfoProvidingDelegateRouteChangeNotification:]";
      v22 = 2114;
      v23 = v6;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Received notificationInfo %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CSXPCClient _handleSessionInfoProvidingDelegateRouteChangeNotification:]";
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s Failed to parse notificationInfo from raw data", buf, 0xCu);
    }
    v6 = 0;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = self->_audioSessionInfoObservers;
  v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "audioSessionInfoProvider:didReceiveAudioSessionRouteChangeNotificationWithUserInfo:", self, v6, (_QWORD)v15);
      }
      v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (void)_handleSessionInfoProvidingDelegateMediaServicesWereLostNotification:(id)a3
{
  id v4;
  NSObject *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[CSXPCClient _handleSessionInfoProvidingDelegateMediaServicesWereLostNotification:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_audioSessionInfoObservers;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "audioSessionInfoProvider:didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:", self, 0, (_QWORD)v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)_handleSessionInfoProvidingDelegateMediaServicesWereResetNotification:(id)a3
{
  id v4;
  NSObject *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[CSXPCClient _handleSessionInfoProvidingDelegateMediaServicesWereResetNotification:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_audioSessionInfoObservers;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "audioSessionInfoProvider:didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:", self, 0, (_QWORD)v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)_handleStreamProvidingDelegateMessageBody:(id)a3
{
  id v4;
  int64_t int64;
  int64_t v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  int64 = xpc_dictionary_get_int64(v4, "type");
  switch(int64)
  {
    case 1:
      -[CSXPCClient _handleStreamProvidingDelegateDidStopUnexpectedly:](self, "_handleStreamProvidingDelegateDidStopUnexpectedly:", v4);
      break;
    case 2:
      -[CSXPCClient _handleStreamProvidingDelegateChunkAvailable:](self, "_handleStreamProvidingDelegateChunkAvailable:", v4);
      break;
    case 3:
      -[CSXPCClient _handleStreamProvidingDelegateChunkForTVAvailable:](self, "_handleStreamProvidingDelegateChunkForTVAvailable:", v4);
      break;
    case 4:
      -[CSXPCClient _handleStreamProvidingDelegateHardwareConfigChange:](self, "_handleStreamProvidingDelegateHardwareConfigChange:", v4);
      break;
    default:
      v6 = int64;
      v7 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        v8 = 136315394;
        v9 = "-[CSXPCClient _handleStreamProvidingDelegateMessageBody:]";
        v10 = 2050;
        v11 = v6;
        _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s Unexpected type : %{public}lld", (uint8_t *)&v8, 0x16u);
      }
      break;
  }

}

- (void)_handleStreamProvidingDelegateDidStopUnexpectedly:(id)a3
{
  int64_t int64;
  void *v5;
  char v6;
  id v7;

  int64 = xpc_dictionary_get_int64(a3, "stopReason");
  -[CSXPCClient audioStream](self, "audioStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CSXPCClient audioStream](self, "audioStream");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "audioStreamProvider:didStopStreamUnexpectedly:", self, int64);

  }
}

- (void)_handleStreamProvidingDelegateChunkAvailable:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  xpc_dictionary_get_dictionary(a3, "chunk");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v9 = v4;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18FC8]), "initWithXPCObject:", v4);
    -[CSXPCClient audioStream](self, "audioStream");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[CSXPCClient audioStream](self, "audioStream");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "audioStreamProvider:audioBufferAvailable:", self, v5);

    }
    v4 = v9;
  }

}

- (void)_handleStreamProvidingDelegateChunkForTVAvailable:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  xpc_dictionary_get_dictionary(a3, "chunk");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v9 = v4;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18FD0]), "initWithXPCObject:", v4);
    -[CSXPCClient audioStream](self, "audioStream");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[CSXPCClient audioStream](self, "audioStream");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "audioStreamProvider:audioChunkForTVAvailable:", self, v5);

    }
    v4 = v9;
  }

}

- (void)_handleStreamProvidingDelegateHardwareConfigChange:(id)a3
{
  int64_t int64;
  void *v5;
  char v6;
  id v7;

  int64 = xpc_dictionary_get_int64(a3, "hardwareConfig");
  -[CSXPCClient audioStream](self, "audioStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CSXPCClient audioStream](self, "audioStream");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "audioStreamProvider:didHardwareConfigurationChange:", self, int64);

  }
}

- (CSAudioSessionProvidingDelegate)audioSessionProvidingDelegate
{
  return (CSAudioSessionProvidingDelegate *)objc_loadWeakRetained((id *)&self->_audioSessionProvidingDelegate);
}

- (void)setAudioSessionProvidingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_audioSessionProvidingDelegate, a3);
}

- (CSAudioStreamProvidingDelegate)audioStreamProvidingDelegate
{
  return (CSAudioStreamProvidingDelegate *)objc_loadWeakRetained((id *)&self->_audioStreamProvidingDelegate);
}

- (void)setAudioStreamProvidingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_audioStreamProvidingDelegate, a3);
}

- (CSAudioAlertProvidingDelegate)audioAlertProvidingDelegate
{
  return (CSAudioAlertProvidingDelegate *)objc_loadWeakRetained((id *)&self->_audioAlertProvidingDelegate);
}

- (void)setAudioAlertProvidingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_audioAlertProvidingDelegate, a3);
}

- (CSXPCClientDelegate)delegate
{
  return (CSXPCClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)UUID
{
  return self->_UUID;
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (OS_dispatch_queue)xpcReplyQueue
{
  return self->_xpcReplyQueue;
}

- (void)setXpcReplyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_xpcReplyQueue, a3);
}

- (OS_dispatch_queue)xpcClientQueue
{
  return self->_xpcClientQueue;
}

- (void)setXpcClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_xpcClientQueue, a3);
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
  objc_storeStrong((id *)&self->_audioStream, a3);
}

- (NSMutableSet)activationAssertions
{
  return self->_activationAssertions;
}

- (void)setActivationAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_activationAssertions, a3);
}

- (NSHashTable)audioSessionInfoObservers
{
  return self->_audioSessionInfoObservers;
}

- (void)setAudioSessionInfoObservers:(id)a3
{
  objc_storeStrong((id *)&self->_audioSessionInfoObservers, a3);
}

- (unint64_t)xpcClientType
{
  return self->_xpcClientType;
}

- (void)setXpcClientType:(unint64_t)a3
{
  self->_xpcClientType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSessionInfoObservers, 0);
  objc_storeStrong((id *)&self->_activationAssertions, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_xpcClientQueue, 0);
  objc_storeStrong((id *)&self->_xpcReplyQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_audioAlertProvidingDelegate);
  objc_destroyWeak((id *)&self->_audioStreamProvidingDelegate);
  objc_destroyWeak((id *)&self->_audioSessionProvidingDelegate);
}

void __45__CSXPCClient_sendMessageAndReplySync_error___block_invoke(uint64_t a1)
{
  void *v2;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  xpc_object_t v11;

  v2 = *(void **)(a1 + 32);
  if (v2 && (v3 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 40) + 48)) != 0)
  {
    v4 = xpc_connection_send_message_with_reply_sync(v3, v2);
    v11 = v4;
    if (v4)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = xpc_dictionary_get_BOOL(v4, "result");
      objc_msgSend(*(id *)(a1 + 40), "_decodeError:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1251, 0);
    }
    v5 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v5;

    v8 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1252, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }

}

void __44__CSXPCClient__sendMessageAsync_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    v8 = v3;
    v4 = xpc_dictionary_get_BOOL(v3, "result");
    objc_msgSend(*(id *)(a1 + 32), "_decodeError:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, _BOOL8, void *))(v6 + 16))(v6, v4, v5);
    goto LABEL_6;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1251, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v5);
LABEL_6:

    v3 = v8;
  }

}

uint64_t __43__CSXPCClient_sendMessageAsync_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessageAsync:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __39__CSXPCClient_sampleCountFromHostTime___block_invoke(uint64_t a1)
{
  _xpc_connection_s *v2;
  xpc_object_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 48);
  if (v2)
  {
    v3 = xpc_connection_send_message_with_reply_sync(v2, *(xpc_object_t *)(a1 + 40));
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v6 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 56);
        v12 = 136315394;
        v13 = "-[CSXPCClient sampleCountFromHostTime:]_block_invoke";
        v14 = 2050;
        v15 = v7;
        v8 = "%s No reply for sampleCountFromHostTime request with hostTime %{public}llu";
        v9 = v6;
        v10 = 22;
LABEL_8:
        _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v12, v10);
      }
    }
  }
  else
  {
    v11 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v12 = 136315138;
      v13 = "-[CSXPCClient sampleCountFromHostTime:]_block_invoke";
      v8 = "%s xpcConnection not existing";
      v9 = v11;
      v10 = 12;
      goto LABEL_8;
    }
  }
}

void __39__CSXPCClient_hostTimeFromSampleCount___block_invoke(uint64_t a1)
{
  _xpc_connection_s *v2;
  xpc_object_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 48);
  if (v2)
  {
    v3 = xpc_connection_send_message_with_reply_sync(v2, *(xpc_object_t *)(a1 + 40));
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v6 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 56);
        v12 = 136315394;
        v13 = "-[CSXPCClient hostTimeFromSampleCount:]_block_invoke";
        v14 = 2050;
        v15 = v7;
        v8 = "%s No reply for hostTimeFromSampleCount request with sampleCount %{public}llu";
        v9 = v6;
        v10 = 22;
LABEL_8:
        _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v12, v10);
      }
    }
  }
  else
  {
    v11 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v12 = 136315138;
      v13 = "-[CSXPCClient hostTimeFromSampleCount:]_block_invoke";
      v8 = "%s xpcConnection not existing";
      v9 = v11;
      v10 = 12;
      goto LABEL_8;
    }
  }
}

void __41__CSXPCClient_audioSessionIdForDeviceId___block_invoke(uint64_t a1)
{
  _xpc_connection_s *v2;
  xpc_object_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 48);
  if (v2)
  {
    v3 = xpc_connection_send_message_with_reply_sync(v2, *(xpc_object_t *)(a1 + 40));
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void __28__CSXPCClient_playbackRoute__block_invoke(_QWORD *a1)
{
  void *v1;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  uint64_t v5;
  void *v6;

  v1 = (void *)a1[4];
  if (v1)
  {
    v3 = *(_xpc_connection_s **)(a1[5] + 48);
    if (v3)
    {
      v4 = xpc_connection_send_message_with_reply_sync(v3, v1);
      v5 = *(_QWORD *)(a1[6] + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

    }
  }
}

void __27__CSXPCClient_isNarrowBand__block_invoke(_QWORD *a1)
{
  void *v1;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  uint64_t v5;
  void *v6;

  v1 = (void *)a1[4];
  if (v1)
  {
    v3 = *(_xpc_connection_s **)(a1[5] + 48);
    if (v3)
    {
      v4 = xpc_connection_send_message_with_reply_sync(v3, v1);
      v5 = *(_QWORD *)(a1[6] + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

    }
  }
}

void __29__CSXPCClient_recordSettings__block_invoke(_QWORD *a1)
{
  void *v1;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  uint64_t v5;
  void *v6;

  v1 = (void *)a1[4];
  if (v1)
  {
    v3 = *(_xpc_connection_s **)(a1[5] + 48);
    if (v3)
    {
      v4 = xpc_connection_send_message_with_reply_sync(v3, v1);
      v5 = *(_QWORD *)(a1[6] + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

    }
  }
}

void __30__CSXPCClient_audioDeviceInfo__block_invoke(_QWORD *a1)
{
  void *v1;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  xpc_object_t xdict;

  v1 = (void *)a1[4];
  if (v1)
  {
    v3 = *(_xpc_connection_s **)(a1[5] + 48);
    if (v3)
    {
      v4 = xpc_connection_send_message_with_reply_sync(v3, v1);
      if (v4)
      {
        xdict = v4;
        xpc_dictionary_get_value(v4, "audioDeviceInfo");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = xdict;
        if (v5)
        {
          xpc_dictionary_get_value(xdict, "audioDeviceInfo");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6)
          {
            v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D190E0]), "initWithXPCObject:", v6);
            v8 = *(_QWORD *)(a1[6] + 8);
            v9 = *(void **)(v8 + 40);
            *(_QWORD *)(v8 + 40) = v7;

          }
          v4 = xdict;
        }
      }

    }
  }
}

void __31__CSXPCClient_recordDeviceInfo__block_invoke(_QWORD *a1)
{
  void *v1;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  uint64_t v5;
  void *v6;

  v1 = (void *)a1[4];
  if (v1)
  {
    v3 = *(_xpc_connection_s **)(a1[5] + 48);
    if (v3)
    {
      v4 = xpc_connection_send_message_with_reply_sync(v3, v1);
      v5 = *(_QWORD *)(a1[6] + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

    }
  }
}

void __26__CSXPCClient_recordRoute__block_invoke(_QWORD *a1)
{
  void *v1;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  uint64_t v5;
  void *v6;

  v1 = (void *)a1[4];
  if (v1)
  {
    v3 = *(_xpc_connection_s **)(a1[5] + 48);
    if (v3)
    {
      v4 = xpc_connection_send_message_with_reply_sync(v3, v1);
      v5 = *(_QWORD *)(a1[6] + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

    }
  }
}

uint64_t __48__CSXPCClient_triggerInfoForContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __48__CSXPCClient_triggerInfoForContext_completion___block_invoke_50(uint64_t a1)
{
  _xpc_connection_s *v2;
  xpc_object_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 48);
  if (v2)
  {
    v3 = xpc_connection_send_message_with_reply_sync(v2, *(xpc_object_t *)(a1 + 40));
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

uint64_t __53__CSXPCClient_acousticSLResultForContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __53__CSXPCClient_acousticSLResultForContext_completion___block_invoke_46(uint64_t a1)
{
  _xpc_connection_s *v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 48);
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __53__CSXPCClient_acousticSLResultForContext_completion___block_invoke_2;
    v5[3] = &unk_1E7C254E8;
    v7 = *(id *)(a1 + 56);
    v6 = *(id *)(a1 + 48);
    xpc_connection_send_message_with_reply(v2, v3, 0, v5);

  }
  else
  {
    v4 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSXPCClient acousticSLResultForContext:completion:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s xpcConnection not exist", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __53__CSXPCClient_acousticSLResultForContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (xpc_dictionary_get_BOOL(v3, "result"))
    {
      xpc_dictionary_get_dictionary(v4, "acousticSLResult");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = objc_alloc(MEMORY[0x1E0C99D80]);
        objc_msgSend(v6, "_cs_initWithXPCObject:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = *MEMORY[0x1E0D18F60];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
        {
          v11 = 136315394;
          v12 = "-[CSXPCClient acousticSLResultForContext:completion:]_block_invoke";
          v13 = 2114;
          v14 = v7;
          _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Received AcousticSLResult %{public}@", (uint8_t *)&v11, 0x16u);
        }
      }
      else
      {
        if (objc_msgSend(*(id *)(a1 + 32), "isVoiceTriggered"))
        {
          v10 = *MEMORY[0x1E0D18F60];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
          {
            v11 = 136315138;
            v12 = "-[CSXPCClient acousticSLResultForContext:completion:]_block_invoke";
            _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s Failed to parse AcousticSLResult from raw data", (uint8_t *)&v11, 0xCu);
          }
        }
        v7 = 0;
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    else
    {
      v9 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        v11 = 136315138;
        v12 = "-[CSXPCClient acousticSLResultForContext:completion:]_block_invoke_2";
        _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Failed to get AcousticSLResult reply", (uint8_t *)&v11, 0xCu);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }

}

uint64_t __49__CSXPCClient_stopAudioStream_option_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __50__CSXPCClient_startAudioStream_option_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __53__CSXPCClient_prepareAudioStream_request_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __52__CSXPCClient_prepareAudioStreamSync_request_error___block_invoke(_QWORD *a1)
{
  void *v2;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v2 = (void *)a1[4];
  if (!v2 || (v3 = *(_xpc_connection_s **)(a1[5] + 48)) == 0)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0D18E80];
    v9 = 1252;
LABEL_7:
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, v9, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[7] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    return;
  }
  v4 = xpc_connection_send_message_with_reply_sync(v3, v2);
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0D18E80];
    v9 = 1251;
    goto LABEL_7;
  }
}

uint64_t __60__CSXPCClient_audioStreamWithRequest_streamName_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __60__CSXPCClient_audioStreamWithRequest_streamName_completion___block_invoke_42(uint64_t a1)
{
  uint64_t v2;
  _xpc_connection_s *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_xpc_connection_s **)(v2 + 48);
  if (v3)
  {
    v4 = *(NSObject **)(v2 + 56);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__CSXPCClient_audioStreamWithRequest_streamName_completion___block_invoke_2;
    v9[3] = &unk_1E7C25400;
    v9[4] = v2;
    v5 = *(void **)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 64);
    xpc_connection_send_message_with_reply(v3, v5, v4, v9);

  }
  else
  {
    v6 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[CSXPCClient audioStreamWithRequest:streamName:completion:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s xpcConnection not exist", buf, 0xCu);
    }
    v7 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1252, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

  }
}

void __60__CSXPCClient_audioStreamWithRequest_streamName_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (*v9)(void);
  uint64_t v10;
  id v11;

  v3 = a2;
  v11 = v3;
  if (v3)
  {
    v4 = xpc_dictionary_get_BOOL(v3, "result");
    objc_msgSend(*(id *)(a1 + 32), "_decodeError:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D19040]), "initWithAudioStreamProvider:streamName:streamRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 72);
      *(_QWORD *)(v7 + 72) = v6;

    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1251, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void (**)(void))(v10 + 16);
  }
  v9();

}

void __55__CSXPCClient_audioStreamWithRequest_streamName_error___block_invoke(uint64_t a1)
{
  _xpc_connection_s *v2;
  xpc_object_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v2)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D18E80];
    v8 = 1252;
LABEL_6:
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, v8, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    return;
  }
  v3 = xpc_connection_send_message_with_reply_sync(v2, *(xpc_object_t *)(a1 + 40));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D18E80];
    v8 = 1251;
    goto LABEL_6;
  }
}

void __39__CSXPCClient_setCurrentContext_error___block_invoke(_QWORD *a1)
{
  void *v2;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v2 = (void *)a1[4];
  if (!v2 || (v3 = *(_xpc_connection_s **)(a1[5] + 48)) == 0)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0D18E80];
    v9 = 1252;
LABEL_7:
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, v9, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[7] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    return;
  }
  v4 = xpc_connection_send_message_with_reply_sync(v3, v2);
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0D18E80];
    v9 = 1251;
    goto LABEL_7;
  }
}

void __26__CSXPCClient_audioMetric__block_invoke(_QWORD *a1)
{
  void *v2;
  _xpc_connection_s *v3;
  os_log_t *v4;
  NSObject *v5;
  xpc_object_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  if (v2 && (v3 = *(_xpc_connection_s **)(a1[5] + 48)) != 0)
  {
    v4 = (os_log_t *)MEMORY[0x1E0D18F60];
    v5 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315138;
      v21 = "-[CSXPCClient audioMetric]_block_invoke";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Sending audioMetric request", (uint8_t *)&v20, 0xCu);
      v2 = (void *)a1[4];
      v3 = *(_xpc_connection_s **)(a1[5] + 48);
    }
    v6 = xpc_connection_send_message_with_reply_sync(v3, v2);
    v7 = v6;
    if (v6 && xpc_dictionary_get_BOOL(v6, "result"))
    {
      xpc_dictionary_get_dictionary(v7, "audioMetric");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = objc_alloc(MEMORY[0x1E0C99D80]);
        objc_msgSend(v9, "_cs_initWithXPCObject:", v8);
        v10 = objc_claimAutoreleasedReturnValue();

        v11 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 136315394;
          v21 = "-[CSXPCClient audioMetric]_block_invoke";
          v22 = 2114;
          v23 = v10;
          _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s audioMetric : %{public}@", (uint8_t *)&v20, 0x16u);
        }
        v12 = *(_QWORD *)(a1[6] + 8);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v10;
      }
      else
      {
        v18 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        {
          v20 = 136315138;
          v21 = "-[CSXPCClient audioMetric]_block_invoke";
          _os_log_error_impl(&dword_1C2614000, v18, OS_LOG_TYPE_ERROR, "%s Received invalid audioMetric", (uint8_t *)&v20, 0xCu);
        }
        v19 = *(_QWORD *)(a1[6] + 8);
        v13 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = 0;
      }

    }
    else
    {
      v16 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      {
        v20 = 136315138;
        v21 = "-[CSXPCClient audioMetric]_block_invoke";
        _os_log_error_impl(&dword_1C2614000, v16, OS_LOG_TYPE_ERROR, "%s Failed to get audioMetric reply", (uint8_t *)&v20, 0xCu);
      }
      v17 = *(_QWORD *)(a1[6] + 8);
      v8 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = 0;
    }

  }
  else
  {
    v14 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v20 = 136315138;
      v21 = "-[CSXPCClient audioMetric]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v14, OS_LOG_TYPE_ERROR, "%s Error creating message", (uint8_t *)&v20, 0xCu);
    }
    v15 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = 0;
  }

}

double __38__CSXPCClient_averagePowerForChannel___block_invoke(_QWORD *a1)
{
  void *v2;
  os_log_t *v3;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  void *v6;
  float v7;
  NSObject *v8;
  NSObject *v9;
  double result;
  double v11;
  int v12;
  const char *v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = (os_log_t *)MEMORY[0x1E0D18F60];
  if (v2)
  {
    v4 = *(_xpc_connection_s **)(a1[5] + 48);
    if (v4)
    {
      v5 = xpc_connection_send_message_with_reply_sync(v4, v2);
      v6 = v5;
      if (v5 && xpc_dictionary_get_BOOL(v5, "result"))
      {
        v7 = xpc_dictionary_get_double(v6, "power");
        *(float *)(*(_QWORD *)(a1[6] + 8) + 24) = v7;
      }
      else
      {
        v8 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        {
          v12 = 136315138;
          v13 = "-[CSXPCClient averagePowerForChannel:]_block_invoke";
          _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s Failed to get reply result correctly", (uint8_t *)&v12, 0xCu);
        }
      }

    }
  }
  v9 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(float *)(*(_QWORD *)(a1[6] + 8) + 24);
    v12 = 136315394;
    v13 = "-[CSXPCClient averagePowerForChannel:]_block_invoke";
    v14 = 2050;
    v15 = v11;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Received averagePower = %{public}f", (uint8_t *)&v12, 0x16u);
  }
  return result;
}

double __35__CSXPCClient_peakPowerForChannel___block_invoke(_QWORD *a1)
{
  void *v2;
  os_log_t *v3;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  void *v6;
  float v7;
  NSObject *v8;
  NSObject *v9;
  double result;
  double v11;
  int v12;
  const char *v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = (os_log_t *)MEMORY[0x1E0D18F60];
  if (v2)
  {
    v4 = *(_xpc_connection_s **)(a1[5] + 48);
    if (v4)
    {
      v5 = xpc_connection_send_message_with_reply_sync(v4, v2);
      v6 = v5;
      if (v5 && xpc_dictionary_get_BOOL(v5, "result"))
      {
        v7 = xpc_dictionary_get_double(v6, "power");
        *(float *)(*(_QWORD *)(a1[6] + 8) + 24) = v7;
      }
      else
      {
        v8 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        {
          v12 = 136315138;
          v13 = "-[CSXPCClient peakPowerForChannel:]_block_invoke";
          _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s Failed to get reply result correctly", (uint8_t *)&v12, 0xCu);
        }
      }

    }
  }
  v9 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(float *)(*(_QWORD *)(a1[6] + 8) + 24);
    v12 = 136315394;
    v13 = "-[CSXPCClient peakPowerForChannel:]_block_invoke";
    v14 = 2050;
    v15 = v11;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Received peakPower = %{public}f", (uint8_t *)&v12, 0x16u);
  }
  return result;
}

void __29__CSXPCClient_alertStartTime__block_invoke(_QWORD *a1)
{
  void *v2;
  os_log_t *v3;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = (os_log_t *)MEMORY[0x1E0D18F60];
  if (v2)
  {
    v4 = *(_xpc_connection_s **)(a1[5] + 48);
    if (v4)
    {
      v5 = xpc_connection_send_message_with_reply_sync(v4, v2);
      v6 = v5;
      if (v5 && xpc_dictionary_get_BOOL(v5, "result"))
      {
        *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = xpc_dictionary_get_uint64(v6, "alertStartTime");
      }
      else
      {
        v7 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        {
          v10 = 136315138;
          v11 = "-[CSXPCClient alertStartTime]_block_invoke";
          _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s Failed to get reply result correctly", (uint8_t *)&v10, 0xCu);
        }
      }

    }
  }
  v8 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    v10 = 136315394;
    v11 = "-[CSXPCClient alertStartTime]_block_invoke";
    v12 = 2050;
    v13 = v9;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Received alertStartTime = %{public}llu", (uint8_t *)&v10, 0x16u);
  }
}

uint64_t __24__CSXPCClient_pingpong___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __25__CSXPCClient_disconnect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_disconnect");
}

void __22__CSXPCClient_connect__block_invoke(uint64_t a1)
{
  NSObject *v2;
  xpc_connection_t mach_service;
  uint64_t v4;
  void *v5;
  _xpc_connection_s *v6;
  _QWORD handler[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[CSXPCClient connect]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Initializing new xpcConnection", buf, 0xCu);
    }
    mach_service = xpc_connection_create_mach_service("com.apple.corespeech.corespeechd.xpc", 0, 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = mach_service;

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v6 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 48);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __22__CSXPCClient_connect__block_invoke_8;
    handler[3] = &unk_1E7C28B80;
    objc_copyWeak(&v8, (id *)buf);
    xpc_connection_set_event_handler(v6, handler);
    xpc_connection_activate(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 48));
    objc_msgSend(*(id *)(a1 + 32), "_sendXPCClientType");
    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

void __22__CSXPCClient_connect__block_invoke_8(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleListenerEvent:", v3);

}

uint64_t __26__CSXPCClient_isConnected__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 48) != 0;
  return result;
}

+ (id)createAudioStreamMessageWithRequest:(id)a3
{
  id v3;
  xpc_object_t v4;
  id v5;
  xpc_object_t v6;
  uint64_t i;
  uint64_t j;
  xpc_object_t v10[2];
  char *v11[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  *(_OWORD *)keys = xmmword_1E7C25420;
  values[0] = xpc_int64_create(2);
  objc_msgSend(v3, "xpcObject");
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  v4 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v11 = xmmword_1E7C28BF0;
  v10[0] = xpc_int64_create(4);
  v5 = v4;
  v10[1] = v5;
  v6 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  for (i = 1; i != -1; --i)

  for (j = 1; j != -1; --j)
  return v6;
}

+ (id)createPrepareAudioStreamMessageWithRequest:(id)a3
{
  id v3;
  xpc_object_t v4;
  id v5;
  xpc_object_t v6;
  uint64_t i;
  uint64_t j;
  xpc_object_t v10[2];
  char *v11[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  *(_OWORD *)keys = xmmword_1E7C25420;
  values[0] = xpc_int64_create(3);
  objc_msgSend(v3, "xpcObject");
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  v4 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v11 = xmmword_1E7C28BF0;
  v10[0] = xpc_int64_create(4);
  v5 = v4;
  v10[1] = v5;
  v6 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  for (i = 1; i != -1; --i)

  for (j = 1; j != -1; --j)
  return v6;
}

+ (id)createStartAudioStreamMessageWithOption:(id)a3
{
  id v3;
  xpc_object_t v4;
  id v5;
  xpc_object_t v6;
  uint64_t i;
  uint64_t j;
  xpc_object_t v10[2];
  char *v11[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  *(_OWORD *)keys = xmmword_1E7C25430;
  values[0] = xpc_int64_create(4);
  objc_msgSend(v3, "xpcObject");
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  v4 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v11 = xmmword_1E7C28BF0;
  v10[0] = xpc_int64_create(4);
  v5 = v4;
  v10[1] = v5;
  v6 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  for (i = 1; i != -1; --i)

  for (j = 1; j != -1; --j)
  return v6;
}

+ (id)createStopAudioStreamMessageWithOption:(id)a3
{
  id v3;
  xpc_object_t v4;
  id v5;
  xpc_object_t v6;
  uint64_t i;
  uint64_t j;
  xpc_object_t v10[2];
  char *v11[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  *(_OWORD *)keys = xmmword_1E7C25440;
  values[0] = xpc_int64_create(5);
  objc_msgSend(v3, "xpcObject");
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  v4 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  *(_OWORD *)v11 = xmmword_1E7C28BF0;
  v10[0] = xpc_int64_create(4);
  v5 = v4;
  v10[1] = v5;
  v6 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  for (i = 1; i != -1; --i)

  for (j = 1; j != -1; --j)
  return v6;
}

@end
