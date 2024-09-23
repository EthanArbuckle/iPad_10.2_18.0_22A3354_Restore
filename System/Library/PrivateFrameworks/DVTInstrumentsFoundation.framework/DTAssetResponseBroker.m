@implementation DTAssetResponseBroker

- (DTAssetResponseBroker)init
{
  DTAssetResponseBroker *v2;
  void *v3;
  dispatch_queue_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DTAssetResponseBroker;
  v2 = -[DTAssetResponseBroker init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[DTAssetResponseBroker setActiveHandlers:](v2, "setActiveHandlers:", v3);

    v4 = dispatch_queue_create("com.apple.dt.DTAssetResponseBroker", MEMORY[0x24BDAC9C0]);
    -[DTAssetResponseBroker setActiveHandlersQueue:](v2, "setActiveHandlersQueue:", v4);

  }
  return v2;
}

+ (id)sharedBroker
{
  if (qword_25576FC10 != -1)
    dispatch_once(&qword_25576FC10, &unk_24EB279B0);
  return (id)qword_25576FC08;
}

- (id)activeHandlerWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_222B89380;
  v16 = sub_222B89390;
  v17 = 0;
  -[DTAssetResponseBroker activeHandlersQueue](self, "activeHandlersQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B89398;
  block[3] = &unk_24EB287E0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)forwardMessage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v11, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RequestIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v11, "objectWithAllowedClasses:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
LABEL_8:
      objc_msgSend(v11, "description");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      syslog(3, "ODR: Got message not meant for any active handler: %s", (const char *)objc_msgSend(v10, "UTF8String"));
      goto LABEL_9;
    }
    objc_msgSend(v11, "objectWithAllowedClasses:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!v8)
    goto LABEL_8;
  -[DTAssetResponseBroker activeHandlerWithIdentifier:](self, "activeHandlerWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_8;
  v10 = v9;
  objc_msgSend(v9, "receivedMessage:", v11);
LABEL_9:

}

- (BOOL)canContinueServingRequestWithIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[DTAssetResponseBroker activeHandlerWithIdentifier:](self, "activeHandlerWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)registerHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[DTAssetResponseBroker activeHandlersQueue](self, "activeHandlersQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B89614;
  block[3] = &unk_24EB28350;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

}

- (void)unregisterHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[DTAssetResponseBroker activeHandlersQueue](self, "activeHandlersQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B89760;
  block[3] = &unk_24EB28350;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

}

- (NSMutableDictionary)activeHandlers
{
  return self->_activeHandlers;
}

- (void)setActiveHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_activeHandlers, a3);
}

- (OS_dispatch_queue)activeHandlersQueue
{
  return self->_activeHandlersQueue;
}

- (void)setActiveHandlersQueue:(id)a3
{
  objc_storeStrong((id *)&self->_activeHandlersQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeHandlersQueue, 0);
  objc_storeStrong((id *)&self->_activeHandlers, 0);
}

@end
