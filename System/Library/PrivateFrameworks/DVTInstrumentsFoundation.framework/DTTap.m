@implementation DTTap

- (DTTap)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  NSLog(CFSTR("The %@ class cannot be initialized by calling -init."), v2);
  __assert_rtn("-[DTTap init]", "DTTap.m", 26, "0");
}

- (DTTap)initWithConfig:(id)a3
{
  return (DTTap *)MEMORY[0x24BEDD108](self, sel_initWithConfig_memoHandler_);
}

- (DTTap)initWithConfig:(id)a3 memoHandler:(id)a4
{
  id v7;
  id v8;
  DTTap *v9;
  DTTap *v10;
  unsigned int v11;
  unsigned int v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *serialQueue;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)DTTap;
  v9 = -[DTTap init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    if (!v7)
      sub_222BC711C();
    do
    {
      v11 = __ldxr(&dword_25576FB2C);
      v12 = v11 + 1;
    }
    while (__stxr(v12, &dword_25576FB2C));
    v9->_tapID = v12;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.dt.tap", v13);
    serialQueue = v10->_serialQueue;
    v10->_serialQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v10->_config, a3);
    objc_storeStrong((id *)&v10->_memoHandler, a4);
  }

  return v10;
}

- (NSString)uuid
{
  return -[DTTapConfig uuid](self->_config, "uuid");
}

- (id)start
{
  NSObject *v3;
  unsigned int tapID;
  uint64_t v5;
  void *v6;
  NSObject *serialQueue;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  uint8_t buf[4];
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  sDTTapLogClient();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    tapID = self->_tapID;
    *(_DWORD *)buf = 67109120;
    v14 = tapID;
    _os_log_impl(&dword_222B17000, v3, OS_LOG_TYPE_INFO, "DTTap: (%d) Called start API", buf, 8u);
  }

  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_222B71C50;
  v12[3] = &unk_24EB27E30;
  v12[4] = self;
  objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  serialQueue = self->_serialQueue;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = sub_222B71D94;
  v10[3] = &unk_24EB27E30;
  v8 = v6;
  v11 = v8;
  dispatch_async(serialQueue, v10);

  return v8;
}

- (id)stop
{
  NSObject *v3;
  unsigned int tapID;
  uint64_t v5;
  void *v6;
  NSObject *serialQueue;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  uint8_t buf[4];
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  sDTTapLogClient();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    tapID = self->_tapID;
    *(_DWORD *)buf = 67109120;
    v14 = tapID;
    _os_log_impl(&dword_222B17000, v3, OS_LOG_TYPE_INFO, "DTTap: (%d) Called stop API", buf, 8u);
  }

  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_222B71ED0;
  v12[3] = &unk_24EB27E30;
  v12[4] = self;
  objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  serialQueue = self->_serialQueue;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = sub_222B72008;
  v10[3] = &unk_24EB27E30;
  v8 = v6;
  v11 = v8;
  dispatch_async(serialQueue, v10);

  return v8;
}

- (id)pause
{
  NSObject *v3;
  unsigned int tapID;
  uint64_t v5;
  void *v6;
  NSObject *serialQueue;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  uint8_t buf[4];
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  sDTTapLogClient();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    tapID = self->_tapID;
    *(_DWORD *)buf = 67109120;
    v14 = tapID;
    _os_log_impl(&dword_222B17000, v3, OS_LOG_TYPE_INFO, "DTTap: (%d) Called pause API", buf, 8u);
  }

  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_222B72144;
  v12[3] = &unk_24EB27E30;
  v12[4] = self;
  objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  serialQueue = self->_serialQueue;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = sub_222B72250;
  v10[3] = &unk_24EB27E30;
  v8 = v6;
  v11 = v8;
  dispatch_async(serialQueue, v10);

  return v8;
}

- (id)unpause
{
  NSObject *v3;
  unsigned int tapID;
  uint64_t v5;
  void *v6;
  NSObject *serialQueue;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  uint8_t buf[4];
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  sDTTapLogClient();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    tapID = self->_tapID;
    *(_DWORD *)buf = 67109120;
    v14 = tapID;
    _os_log_impl(&dword_222B17000, v3, OS_LOG_TYPE_INFO, "DTTap: (%d) Called unpause API", buf, 8u);
  }

  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_222B7238C;
  v12[3] = &unk_24EB27E30;
  v12[4] = self;
  objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  serialQueue = self->_serialQueue;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = sub_222B72498;
  v10[3] = &unk_24EB27E30;
  v8 = v6;
  v11 = v8;
  dispatch_async(serialQueue, v10);

  return v8;
}

- (id)fetchDataNow
{
  NSObject *v3;
  unsigned int tapID;
  void *v5;
  NSObject *serialQueue;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  sDTTapLogClient();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    tapID = self->_tapID;
    *(_DWORD *)buf = 67109120;
    v14 = tapID;
    _os_log_impl(&dword_222B17000, v3, OS_LOG_TYPE_INFO, "DTTap: (%d) Called fetchDataNow API", buf, 8u);
  }

  v5 = (void *)objc_opt_new();
  serialQueue = self->_serialQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_222B725B8;
  v11[3] = &unk_24EB28350;
  v11[4] = self;
  v7 = v5;
  v12 = v7;
  dispatch_async(serialQueue, v11);
  v8 = v12;
  v9 = v7;

  return v9;
}

- (void)suspendDataProcessing
{
  NSObject *v3;
  unsigned int tapID;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  sDTTapLogClient();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    tapID = self->_tapID;
    v5[0] = 67109120;
    v5[1] = tapID;
    _os_log_impl(&dword_222B17000, v3, OS_LOG_TYPE_INFO, "DTTap: (%d) Called suspendDataProcessing API", (uint8_t *)v5, 8u);
  }

  -[DTTapMemoHandler suspend](self->_memoHandler, "suspend");
}

- (void)resumeDataProcessing
{
  NSObject *v3;
  unsigned int tapID;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  sDTTapLogClient();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    tapID = self->_tapID;
    v5[0] = 67109120;
    v5[1] = tapID;
    _os_log_impl(&dword_222B17000, v3, OS_LOG_TYPE_INFO, "DTTap: (%d) Called resumeDataProcessing API", (uint8_t *)v5, 8u);
  }

  -[DTTapMemoHandler resume](self->_memoHandler, "resume");
}

- (void)_start
{
  __assert_rtn("-[DTTap _start]", "DTTap.m", 176, "0");
}

- (void)_stop
{
  __assert_rtn("-[DTTap _stop]", "DTTap.m", 180, "0");
}

- (void)_pause
{
  __assert_rtn("-[DTTap _pause]", "DTTap.m", 184, "0");
}

- (void)_unpause
{
  __assert_rtn("-[DTTap _unpause]", "DTTap.m", 188, "0");
}

- (BOOL)_canFetchWhileArchiving
{
  return 0;
}

- (id)_fetchDataForReason:(unint64_t)a3
{
  __assert_rtn("-[DTTap _fetchDataForReason:]", "DTTap.m", 196, "0");
}

- (unsigned)tapID
{
  return self->_tapID;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (DTTapMemoHandler)memoHandler
{
  return self->_memoHandler;
}

- (DTTapConfig)config
{
  return self->_config;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_memoHandler, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end
