@implementation DTTapLocal

- (DTTapLocal)initWithConfig:(id)a3 memoHandler:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  DTTapLocal *v11;
  DTTapLocal *v12;
  id *p_delegate;
  void *v14;
  char v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DTTapLocal;
  v11 = -[DTTap initWithConfig:memoHandler:](&v17, sel_initWithConfig_memoHandler_, v8, v9);
  v12 = v11;
  if (v11)
  {
    if (!v10)
      sub_222BC6E8C();
    p_delegate = (id *)&v11->_delegate;
    objc_storeStrong((id *)&v11->_delegate, a5);
    objc_msgSend(*p_delegate, "setTap:", v12);
    objc_msgSend(*p_delegate, "validateConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[DTTapLocal _handleStatusMemo:](v12, "_handleStatusMemo:", v14);
      v15 = 0;
    }
    else
    {
      v15 = 1;
    }
    v12->_validConfig = v15;

  }
  return v12;
}

- (void)_start
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *pollTimer;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  void *v12;
  void *v13;
  _QWORD handler[5];

  if (self->_validConfig)
  {
    -[DTTap config](self, "config");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "pollingInterval");

    if (v5)
    {
      -[DTTap serialQueue](self, "serialQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      if (self->_pollTimer)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DTTapLocal.m"), 57, CFSTR("Seems like the timer is still running"));

      }
      v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v6);
      pollTimer = self->_pollTimer;
      self->_pollTimer = v7;

      v9 = self->_pollTimer;
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = sub_222B6FC44;
      handler[3] = &unk_24EB27E30;
      handler[4] = self;
      dispatch_source_set_event_handler(v9, handler);
      v10 = self->_pollTimer;
      v11 = dispatch_time(0, v5);
      dispatch_source_set_timer(v10, v11, v5, 0x4C4B40uLL);
      dispatch_resume((dispatch_object_t)self->_pollTimer);

    }
    -[DTTapLocal delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "start");

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      sub_222BC6EB4(self);
  }
}

- (void)_stop
{
  NSObject *pollTimer;
  OS_dispatch_source *v4;
  void *v5;

  if (self->_validConfig)
  {
    pollTimer = self->_pollTimer;
    if (pollTimer)
    {
      dispatch_source_cancel(pollTimer);
      v4 = self->_pollTimer;
      self->_pollTimer = 0;

    }
    -[DTTapLocal delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stop");

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      sub_222BC6F30(self);
  }
}

- (void)_pause
{
  void *v3;

  if (self->_validConfig)
  {
    -[DTTapLocal delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pause");

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      sub_222BC6FAC(self);
  }
}

- (void)_unpause
{
  void *v3;

  if (self->_validConfig)
  {
    -[DTTapLocal delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unpause");

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      sub_222BC7028(self);
  }
}

- (BOOL)_canFetchWhileArchiving
{
  void *v2;
  char v3;

  -[DTTapLocal delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canFetchWhileArchiving");

  return v3;
}

- (id)_fetchDataForReason:(unint64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[9];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  _QWORD v13[3];
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  if (self->_validConfig)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = sub_222B6FF80;
    v19 = sub_222B6FF90;
    v20 = 0;
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v14 = 0;
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    -[DTTapLocal delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = sub_222B6FF98;
    v8[3] = &unk_24EB2A2A0;
    v8[7] = &v15;
    v8[8] = a3;
    v8[4] = self;
    v8[5] = v13;
    v8[6] = &v9;
    objc_msgSend(v5, "fetchDataForReason:block:", a3, v8);

    if (!*((_BYTE *)v10 + 24))
      __assert_rtn("-[DTTapLocal _fetchDataForReason:]", "DTTapLocal.m", 157, "sawLastMemo");
    v6 = (id)v16[5];
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(v13, 8);
    _Block_object_dispose(&v15, 8);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_handleStatusMemo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  -[DTTap config](self, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DTTap memoHandler](self, "memoHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "handleMemo:", v8);

  }
}

- (DTTapLocalDelegate)delegate
{
  return (DTTapLocalDelegate *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_pollTimer, 0);
}

@end
