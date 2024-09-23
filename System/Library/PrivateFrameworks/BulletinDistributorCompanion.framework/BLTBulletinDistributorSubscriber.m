@implementation BLTBulletinDistributorSubscriber

- (BLTBulletinDistributorSubscriber)init
{
  return -[BLTBulletinDistributorSubscriber initWithClient:](self, "initWithClient:", 0);
}

- (BLTBulletinDistributorSubscriber)initWithClient:(id)a3
{
  id v5;
  BLTBulletinDistributorSubscriber *v6;
  BLTBulletinDistributorSubscriber *v7;
  uint64_t v8;
  NSMutableDictionary *subscriptions;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BLTBulletinDistributorSubscriber;
  v6 = -[BLTBulletinDistributorSubscriber init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    subscriptions = v7->_subscriptions;
    v7->_subscriptions = (NSMutableDictionary *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.bulletindistributor.subscriber", v10);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v11;

  }
  return v7;
}

- (NSSet)sectionIDs
{
  NSObject *queue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__BLTBulletinDistributorSubscriber_sectionIDs__block_invoke;
  v6[3] = &unk_24D761CF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __46__BLTBulletinDistributorSubscriber_sectionIDs__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allKeys");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)subscribeToSectionID:(id)a3 forFullBulletins:(BOOL)a4 withAck:(BOOL)a5 ackAllowedOnLocalConnection:(BOOL)a6
{
  id v10;
  NSObject *queue;
  id v12;
  _QWORD block[5];
  id v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;

  v10 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __110__BLTBulletinDistributorSubscriber_subscribeToSectionID_forFullBulletins_withAck_ackAllowedOnLocalConnection___block_invoke;
  block[3] = &unk_24D761D20;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  block[4] = self;
  v14 = v10;
  v12 = v10;
  dispatch_async(queue, block);

}

void __110__BLTBulletinDistributorSubscriber_subscribeToSectionID_forFullBulletins_withAck_ackAllowedOnLocalConnection___block_invoke(uint64_t a1)
{
  BLTBulletinDistributorSubscriptionInfo *v2;

  v2 = objc_alloc_init(BLTBulletinDistributorSubscriptionInfo);
  -[BLTBulletinDistributorSubscriptionInfo setFullBulletins:](v2, "setFullBulletins:", *(unsigned __int8 *)(a1 + 48));
  -[BLTBulletinDistributorSubscriptionInfo setAck:](v2, "setAck:", *(unsigned __int8 *)(a1 + 49));
  -[BLTBulletinDistributorSubscriptionInfo setAckAllowedOnLocalConnection:](v2, "setAckAllowedOnLocalConnection:", *(unsigned __int8 *)(a1 + 50));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

- (void)unsubscribeFromSectionID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__BLTBulletinDistributorSubscriber_unsubscribeFromSectionID___block_invoke;
  v7[3] = &unk_24D761AA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __61__BLTBulletinDistributorSubscriber_unsubscribeFromSectionID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)pingWithBulletin:(id)a3 ack:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__BLTBulletinDistributorSubscriber_pingWithBulletin_ack___block_invoke;
  block[3] = &unk_24D761D48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __57__BLTBulletinDistributorSubscriber_pingWithBulletin_ack___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "sectionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessary");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 56);
    if (v6)
    {
      objc_msgSend(v6, "remoteObjectProxy");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = *(id *)(v5 + 48);
    }
    v17 = v7;
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(*(id *)(a1 + 40), "sectionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x219A0C15C](*(_QWORD *)(a1 + 48));
    if (*(_QWORD *)(a1 + 48))
    {
      if (!objc_msgSend(v10, "ack")
        || (objc_msgSend(v10, "ackAllowedOnLocalConnection") & 1) == 0
        && (objc_msgSend(*(id *)(a1 + 32), "deviceDelegate"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v12, "isLocallyConnectedToRemote"),
            v12,
            (v13 & 1) != 0))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

        if ((objc_msgSend(v10, "fullBulletins") & 1) == 0)
          goto LABEL_18;
LABEL_17:
        objc_msgSend(v17, "pingWithBulletin:", *(_QWORD *)(a1 + 40));
LABEL_20:

        return;
      }
    }
    if ((objc_msgSend(v10, "fullBulletins") & 1) != 0)
    {
      if (!v11)
        goto LABEL_17;
      objc_msgSend(v17, "pingWithBulletin:ack:", *(_QWORD *)(a1 + 40), v11);
    }
    else
    {
      if (!v11)
      {
LABEL_18:
        objc_msgSend(*(id *)(a1 + 40), "recordID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "sectionID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "pingWithRecordID:forSectionID:", v11, v16);

        goto LABEL_19;
      }
      objc_msgSend(*(id *)(a1 + 40), "recordID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "sectionID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pingWithRecordID:forSectionID:ack:", v14, v15, v11);

    }
LABEL_19:

    goto LABEL_20;
  }
}

- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__BLTBulletinDistributorSubscriber_pingWithRecordID_forSectionID___block_invoke;
  block[3] = &unk_24D761D70;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

void __66__BLTBulletinDistributorSubscriber_pingWithRecordID_forSectionID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessary");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 56);
    if (v4)
    {
      objc_msgSend(v4, "remoteObjectProxy");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(id *)(v3 + 48);
    }
    v6 = v5;
    objc_msgSend(v5, "pingWithRecordID:forSectionID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

  }
}

- (void)getWillNanoPresentNotificationForSectionID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  BLTWorkQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__BLTBulletinDistributorSubscriber_getWillNanoPresentNotificationForSectionID_completion___block_invoke;
  block[3] = &unk_24D761D48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __90__BLTBulletinDistributorSubscriber_getWillNanoPresentNotificationForSectionID_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "deviceDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getWillNanoPresentNotificationForSectionID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)getWillNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  BLTWorkQueue();
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __104__BLTBulletinDistributorSubscriber_getWillNanoPresentNotificationForSectionID_subsectionIDs_completion___block_invoke;
  v15[3] = &unk_24D761D98;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __104__BLTBulletinDistributorSubscriber_getWillNanoPresentNotificationForSectionID_subsectionIDs_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "deviceDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getWillNanoPresentNotificationForSectionID:subsectionIDs:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)sendBulletinSummary:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  BLTWorkQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__BLTBulletinDistributorSubscriber_sendBulletinSummary___block_invoke;
  v7[3] = &unk_24D761AA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __56__BLTBulletinDistributorSubscriber_sendBulletinSummary___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "deviceDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendBulletinSummary:", *(_QWORD *)(a1 + 40));

}

- (void)subscribeWithMachServiceName:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  BLTBulletinDistributorSubscriber *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__BLTBulletinDistributorSubscriber_subscribeWithMachServiceName___block_invoke;
  v7[3] = &unk_24D761AA8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __65__BLTBulletinDistributorSubscriber_subscribeWithMachServiceName___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  blt_general_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_2173D9000, v2, OS_LOG_TYPE_INFO, "Subscriber updating machServiceName to %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "invalidate");
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = 0;

  objc_msgSend(*(id *)(a1 + 40), "setMachServiceName:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_connectIfNecessary");
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscriber:subscribedWithMachServiceName:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)_connectIfNecessary
{
  void *v3;
  id v4;
  void *v5;
  NSXPCConnection *v6;
  NSXPCConnection *connection;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  void *v11;
  NSXPCConnection *v12;
  _QWORD v13[4];
  id v14;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BLTBulletinDistributorSubscriber machServiceName](self, "machServiceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!self->_connection)
    {
      v4 = objc_alloc(MEMORY[0x24BDD1988]);
      -[BLTBulletinDistributorSubscriber machServiceName](self, "machServiceName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (NSXPCConnection *)objc_msgSend(v4, "initWithMachServiceName:options:", v5, 4096);
      connection = self->_connection;
      self->_connection = v6;

      v8 = self->_connection;
      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254EF6888);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedInterface:](v8, "setExportedInterface:", v9);

      v10 = self->_connection;
      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254EFCDA0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](v10, "setRemoteObjectInterface:", v11);

      -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
      -[NSXPCConnection resume](self->_connection, "resume");
      objc_initWeak(&location, self);
      v12 = self->_connection;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __55__BLTBulletinDistributorSubscriber__connectIfNecessary__block_invoke;
      v13[3] = &unk_24D761DC0;
      objc_copyWeak(&v14, &location);
      -[NSXPCConnection setInvalidationHandler:](v12, "setInvalidationHandler:", v13);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
}

void __55__BLTBulletinDistributorSubscriber__connectIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setConnection:", 0);

}

- (BLTBulletinDistributorSubscriberDelegate)delegate
{
  return (BLTBulletinDistributorSubscriberDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BLTBulletinDistributorSubscriberDeviceDelegate)deviceDelegate
{
  return (BLTBulletinDistributorSubscriberDeviceDelegate *)objc_loadWeakRetained((id *)&self->_deviceDelegate);
}

- (void)setDeviceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_deviceDelegate, a3);
}

- (NSString)machServiceName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMachServiceName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (BLTPingSubscribing)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_destroyWeak((id *)&self->_deviceDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
}

@end
