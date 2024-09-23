@implementation DTTapService

+ (void)registerCapabilities:(id)a3 forDelegateClass:(Class)a4 forConnection:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  Class v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  Class v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  v9 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_222B2DC9C;
  v17[3] = &unk_24EB289F8;
  v11 = v8;
  v19 = &v21;
  v20 = a4;
  v18 = v11;
  sub_222B2DBF4(v17);
  if (!*((_BYTE *)v22 + 24))
  {
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = sub_222B2DD9C;
    v12[3] = &unk_24EB28A48;
    v13 = v11;
    v15 = a4;
    v14 = v9;
    v16 = a1;
    sub_222B2DBF4(v12);

  }
  _Block_object_dispose(&v21, 8);

}

- (DTTapService)initWithChannel:(id)a3
{
  id v4;
  DTTapService *v5;
  DTTapServiceMessageSender *v6;
  DTTapServiceMessageSender *messageSender;
  dispatch_queue_t v8;
  OS_dispatch_queue *serialQueue;
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  DTTapServiceDelegate *delegate;
  NSObject *p_super;
  unsigned int tapServiceID;
  id v20;
  uint64_t v21;
  DTTapService *v22;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v31;
  uint8_t buf[4];
  unsigned int v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)DTTapService;
  v5 = -[DTXService initWithChannel:](&v31, sel_initWithChannel_, v4);
  if (v5)
  {
    v6 = -[DTTapServiceMessageSender initWithChannel:]([DTTapServiceMessageSender alloc], "initWithChannel:", v4);
    messageSender = v5->_messageSender;
    v5->_messageSender = v6;

    v8 = dispatch_queue_create("com.apple.dt.tap_service", 0);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(v4, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v27 = 0;
      v28 = &v27;
      v29 = 0x2050000000;
      v30 = 0;
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = sub_222B2E19C;
      v24[3] = &unk_24EB28A70;
      v26 = &v27;
      v11 = v10;
      v25 = v11;
      sub_222B2DBF4(v24);
      v12 = v28;
      v13 = v28[3];
      if (v13)
      {
        do
        {
          v14 = __ldxr((unsigned int *)&unk_25576FA30);
          v15 = v14 + 1;
        }
        while (__stxr(v15, (unsigned int *)&unk_25576FA30));
        v5->_tapServiceID = v15;
        v16 = objc_msgSend(objc_alloc((Class)v12[3]), "initWithMessageSender:", v5->_messageSender);
        delegate = v5->_delegate;
        v5->_delegate = (DTTapServiceDelegate *)v16;

        sDTTapLogClient();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
        {
          tapServiceID = v5->_tapServiceID;
          NSStringFromClass((Class)v28[3]);
          v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v21 = objc_msgSend(v20, "UTF8String");
          *(_DWORD *)buf = 67109378;
          v33 = tapServiceID;
          v34 = 2080;
          v35 = v21;
          _os_log_impl(&dword_222B17000, p_super, OS_LOG_TYPE_INFO, "DTTapService: (%d) Created new Tap service with delegate %s", buf, 0x12u);

        }
      }
      else
      {
        NSLog(CFSTR("DTTapService could not locate a delegate for the channel named %@."), v11);
        p_super = &v5->super.super;
        v5 = 0;
      }

      _Block_object_dispose(&v27, 8);
      if (v13)
        goto LABEL_10;
    }
    else
    {
      NSLog(CFSTR("DTTapService requires its channels to have names."));

      v5 = 0;
    }
    v22 = 0;
    goto LABEL_12;
  }
LABEL_10:
  v5 = v5;
  v22 = v5;
LABEL_12:

  return v22;
}

- (void)messageReceived:(id)a3
{
  if (objc_msgSend(a3, "errorStatus") == 2)
    -[DTTapService stop](self, "stop");
}

- (void)setConfig:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B2E290;
  block[3] = &unk_24EB28350;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

- (void)start
{
  NSObject *serialQueue;
  void *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_222B2E5D8;
  v9 = sub_222B2E5E8;
  v10 = 0;
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_222B2E5F0;
  v4[3] = &unk_24EB28738;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(serialQueue, v4);
  v3 = (void *)v6[5];
  if (v3)
    objc_msgSend(v3, "waitUntilFinished");
  _Block_object_dispose(&v5, 8);

}

- (void)stop
{
  NSObject *serialQueue;
  void *v4;
  NSObject *v5;
  unsigned int tapServiceID;
  void *v7;
  DTTapServiceMessageSender *messageSender;
  void *v9;
  NSObject *v10;
  unsigned int v11;
  _QWORD block[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_222B2E5D8;
  v23 = sub_222B2E5E8;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_222B2E5D8;
  v17 = sub_222B2E5E8;
  v18 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B2EA38;
  block[3] = &unk_24EB28AC0;
  block[4] = self;
  block[5] = &v19;
  block[6] = &v13;
  dispatch_sync(serialQueue, block);
  v4 = (void *)v20[5];
  if (v4 || v14[5])
  {
    objc_msgSend(v4, "waitUntilFinished");
    objc_msgSend((id)v14[5], "waitUntilFinished");
    sDTTapLogClient();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      tapServiceID = self->_tapServiceID;
      *(_DWORD *)buf = 67109120;
      v26 = tapServiceID;
      _os_log_impl(&dword_222B17000, v5, OS_LOG_TYPE_DEBUG, "DTTapService: (%d) Tap has been stopped and fully fetched from.", buf, 8u);
    }

    -[DTTapServiceDelegate didStop](self->_delegate, "didStop");
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setKind:", 5);
    messageSender = self->_messageSender;
    objc_msgSend(MEMORY[0x24BE2A960], "messageWithObject:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DTTapServiceMessageSender sendMessage:](messageSender, "sendMessage:", v9);

    -[DTTapServiceMessageSender sendBarrierMessage](self->_messageSender, "sendBarrierMessage");
    sDTTapLogClient();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = self->_tapServiceID;
      *(_DWORD *)buf = 67109120;
      v26 = v11;
      _os_log_impl(&dword_222B17000, v10, OS_LOG_TYPE_INFO, "DTTapService: (%d) All stop related messages have been sent. Stop complete", buf, 8u);
    }

  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
}

- (void)pause
{
  NSObject *serialQueue;
  void *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_222B2E5D8;
  v9 = sub_222B2E5E8;
  v10 = 0;
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_222B2EC3C;
  v4[3] = &unk_24EB28738;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(serialQueue, v4);
  v3 = (void *)v6[5];
  if (v3)
    objc_msgSend(v3, "waitUntilFinished");
  _Block_object_dispose(&v5, 8);

}

- (void)unpause
{
  NSObject *serialQueue;
  void *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_222B2E5D8;
  v9 = sub_222B2E5E8;
  v10 = 0;
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_222B2EDE8;
  v4[3] = &unk_24EB28738;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(serialQueue, v4);
  v3 = (void *)v6[5];
  if (v3)
    objc_msgSend(v3, "waitUntilFinished");
  _Block_object_dispose(&v5, 8);

}

- (void)fetchDataNow
{
  NSObject *serialQueue;
  void *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_222B2E5D8;
  v9 = sub_222B2E5E8;
  v10 = 0;
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_222B2EF94;
  v4[3] = &unk_24EB28738;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(serialQueue, v4);
  v3 = (void *)v6[5];
  if (v3)
    objc_msgSend(v3, "waitUntilFinished");
  _Block_object_dispose(&v5, 8);

}

- (void)handleBulkData:(const void *)a3 size:(unint64_t)a4 destructor:(id)a5
{
  id v6;

  objc_msgSend(MEMORY[0x24BE2A960], "messageReferencingBuffer:length:destructor:", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapServiceMessageSender sendMessage:](self->_messageSender, "sendMessage:", v6);

}

- (void)handleBulkData:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BE2A960], "messageWithData:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapServiceMessageSender sendMessage:](self->_messageSender, "sendMessage:", v4);

}

- (void)sendFrameMessage:(id)a3
{
  DTTapServiceMessageSender *messageSender;
  id v4;

  messageSender = self->_messageSender;
  objc_msgSend(MEMORY[0x24BE2A960], "messageWithObject:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapServiceMessageSender sendMessage:](messageSender, "sendMessage:", v4);

}

- (void)sendHeartbeatTime:(unint64_t)a3
{
  DTTapServiceMessageSender *messageSender;
  void *v6;
  id v7;

  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "setHeartbeatTime:", a3);
  messageSender = self->_messageSender;
  objc_msgSend(MEMORY[0x24BE2A960], "messageWithObject:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTTapServiceMessageSender sendMessage:](messageSender, "sendMessage:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSender, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_tap, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
