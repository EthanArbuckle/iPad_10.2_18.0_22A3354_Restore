@implementation CMContinuityCaptureTransportDeviceSidecarStream

- (CMContinuityCaptureTransportDeviceSidecarStream)initWithSidecarStream:(id)a3 entity:(int64_t)a4 messageDelegate:(id)a5
{
  id v9;
  id v10;
  CMContinuityCaptureTransportDeviceSidecarStream *v11;
  CMContinuityCaptureTransportDeviceSidecarStream *v12;
  SidecarStream *stream;
  const __CFAllocator *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFUUID *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  NSUUID *streamUUID;
  CMContinuityCaptureTransportDeviceSidecarStream *v23;
  objc_super v25;
  CFUUIDBytes v26;

  v9 = a3;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CMContinuityCaptureTransportDeviceSidecarStream;
  v11 = -[CMContinuityCaptureTransportDeviceSidecarStream init](&v25, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_messageDelegate, v10);
    objc_storeStrong((id *)&v12->_stream, a3);
    v12->_entity = a4;
    stream = v12->_stream;
    if (stream)
    {
      v14 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v15 = -[SidecarStream nwClientID](stream, "nwClientID");
      v17 = v16;
      *(_QWORD *)&v26.byte0 = v15;
      *(_QWORD *)&v26.byte8 = v17;
      v18 = CFUUIDCreateFromUUIDBytes(v14, v26);
      v19 = (__CFString *)CFUUIDCreateString(v14, v18);
      v20 = v19;
      if (v19)
        v19 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v19);
      v21 = v19;

    }
    else
    {
      v21 = 0;
    }
    streamUUID = v12->_streamUUID;
    v12->_streamUUID = (NSUUID *)v21;

    v12->_active = -1;
    v23 = v12;
  }

  return v12;
}

- (SidecarStream)stream
{
  return self->_stream;
}

- (int64_t)entity
{
  return self->_entity;
}

- (NSString)streamIdentifier
{
  return (NSString *)-[SidecarStream identifier](self->_stream, "identifier");
}

- (NSUUID)streamUUID
{
  return self->_streamUUID;
}

- (id)cipherKeyforSessionID:(id)a3
{
  SidecarStream *stream;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  stream = self->_stream;
  v4 = a3;
  -[SidecarStream rapportStream](stream, "rapportStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "streamKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CMContinuityCaptureCreateCipherKey(v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureTransportDeviceSidecarStream streamIdentifier](self, "streamIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ entity:%u [%p]"), v5, v6, self->_entity, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isMediaStream
{
  return (unint64_t)(self->_entity - 1) < 3;
}

- (void)activate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  uint64_t v9;
  SidecarStream *stream;
  SidecarStream *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureTransportDeviceSidecarStream *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureTransportDeviceSidecarStream streamIdentifier](self, "streamIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_active == -1)
  {
    self->_active = 0;
    CMContinuityCaptureLog(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = self;
      _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Activate", buf, 0xCu);
    }

    v8 = -[CMContinuityCaptureTransportDeviceSidecarStream isMediaStream](self, "isMediaStream");
    v9 = MEMORY[0x24BDAC760];
    if (!v8)
    {
      stream = self->_stream;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __60__CMContinuityCaptureTransportDeviceSidecarStream_activate___block_invoke;
      v15[3] = &unk_24F06C570;
      objc_copyWeak(&v17, &location);
      v16 = v5;
      -[SidecarStream setHandler:](stream, "setHandler:", v15);

      objc_destroyWeak(&v17);
    }
    v11 = self->_stream;
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __60__CMContinuityCaptureTransportDeviceSidecarStream_activate___block_invoke_5;
    v12[3] = &unk_24F06B040;
    objc_copyWeak(&v14, &location);
    v13 = v4;
    -[SidecarStream activateWithCompletion:](v11, "activateWithCompletion:", v12);

    objc_destroyWeak(&v14);
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -536870911, 0);
    (*((void (**)(id, void *))v4 + 2))(v4, v6);

  }
  objc_destroyWeak(&location);

}

void __60__CMContinuityCaptureTransportDeviceSidecarStream_activate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  NSObject *v5;
  id v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      CMContinuityCaptureLog(2);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = objc_loadWeakRetained((id *)(a1 + 40));
        v8 = 138543618;
        v9 = v6;
        v10 = 2112;
        v11 = v3;
        _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ got message %@", (uint8_t *)&v8, 0x16u);

      }
      v7 = objc_loadWeakRetained(WeakRetained + 4);
      objc_msgSend(v7, "enqueueResponse:identifier:", v3, *(_QWORD *)(a1 + 32));

    }
  }

}

void __60__CMContinuityCaptureTransportDeviceSidecarStream_activate___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  _DWORD *WeakRetained;
  _BOOL4 v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
      v5 = objc_msgSend(v3, "code") == 0;
    else
      v5 = 1;
    WeakRetained[10] = v5;
    CMContinuityCaptureLog(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_loadWeakRetained((id *)(a1 + 40));
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v3;
      _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Activation complete Error %{public}@", (uint8_t *)&v8, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)sendMessage:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  dispatch_time_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v9);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", CMContinuityCaptureGetMessageGenerationID());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("ContinuityCaptureGID"));

  v13 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__CMContinuityCaptureTransportDeviceSidecarStream_sendMessage_message_completion___block_invoke;
  block[3] = &unk_24F06B2D0;
  objc_copyWeak(&v36, location);
  v14 = v8;
  v34 = v14;
  v15 = v10;
  v35 = v15;
  v16 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
  v24 = v13;
  v25 = 3221225472;
  v26 = __82__CMContinuityCaptureTransportDeviceSidecarStream_sendMessage_message_completion___block_invoke_10;
  v27 = &unk_24F06C598;
  objc_copyWeak(&v32, location);
  v17 = v16;
  v30 = v17;
  v18 = v11;
  v28 = v18;
  v19 = v14;
  v29 = v19;
  v20 = v15;
  v31 = v20;
  v21 = (void *)MEMORY[0x22E2A7CB0](&v24);
  -[SidecarStream sendOPACK:completion:](self->_stream, "sendOPACK:completion:", v18, v21, v24, v25, v26, v27);
  v22 = dispatch_time(0, 10000000000);
  dispatch_get_global_queue(2, 0);
  v23 = objc_claimAutoreleasedReturnValue();
  dispatch_after(v22, v23, v17);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v36);

  objc_destroyWeak(location);
}

void __82__CMContinuityCaptureTransportDeviceSidecarStream_sendMessage_message_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_loadWeakRetained(v2);
      v6 = *(_QWORD *)(a1 + 32);
      v9 = 138543618;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Message send timeout for %@", (uint8_t *)&v9, 0x16u);

    }
    v7 = *(_QWORD *)(a1 + 40);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -536870186, 0);
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
}

void __82__CMContinuityCaptureTransportDeviceSidecarStream_sendMessage_message_completion___block_invoke_10(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    dispatch_block_cancel(*(dispatch_block_t *)(a1 + 48));
    CMContinuityCaptureLog(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ContinuityCaptureGID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ContinuityCaptureSelector"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138544386;
      v10 = WeakRetained;
      v11 = 2114;
      v12 = v6;
      v13 = 2114;
      v14 = v7;
      v15 = 2114;
      v16 = v8;
      v17 = 2112;
      v18 = a2;
      _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Message GID %{public}@ indentifier %{public}@ selector %{public}@ send error %@", (uint8_t *)&v9, 0x34u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messageDelegate);
  objc_storeStrong((id *)&self->_streamUUID, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
