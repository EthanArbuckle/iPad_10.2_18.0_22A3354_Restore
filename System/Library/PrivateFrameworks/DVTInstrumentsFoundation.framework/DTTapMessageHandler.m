@implementation DTTapMessageHandler

- (DTTapMessageHandler)initWithConfig:(id)a3
{
  id v5;
  DTTapMessageHandler *v6;
  DTTapMessageHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTTapMessageHandler;
  v6 = -[DTTapMessageHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    if (!v5)
      sub_222BC6A04();
    objc_storeStrong((id *)&v6->_config, a3);
  }

  return v7;
}

- (id)messageReceived:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  DTTapStatusMemo *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  DTTapStatusMemo *v13;
  DTTapStatusMemo *v14;
  id v15;
  DTTapHeartbeatMemo *v16;
  uint64_t v17;

  if (a3)
  {
    v3 = (void *)MEMORY[0x24BDBCF20];
    v4 = a3;
    objc_msgSend(v3, "setWithObject:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectWithAllowedClasses:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        v8 = [DTTapStatusMemo alloc];
        v9 = objc_msgSend(v7, "status");
        objc_msgSend(v7, "notice");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "info");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v7, "timestamp");

        v13 = -[DTTapStatusMemo initWithStatus:notice:info:timestamp:](v8, "initWithStatus:notice:info:timestamp:", v9, v10, v11, v12);
LABEL_9:
        v14 = v13;

        return v14;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v6;
        v16 = [DTTapHeartbeatMemo alloc];
        v17 = objc_msgSend(v15, "heartbeatTime");

        v13 = -[DTTapHeartbeatMemo initWithTimestamp:](v16, "initWithTimestamp:", v17);
        goto LABEL_9;
      }
    }
    v13 = 0;
    goto LABEL_9;
  }
  v14 = 0;
  return v14;
}

- (DTTapConfig)config
{
  return self->_config;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
}

@end
