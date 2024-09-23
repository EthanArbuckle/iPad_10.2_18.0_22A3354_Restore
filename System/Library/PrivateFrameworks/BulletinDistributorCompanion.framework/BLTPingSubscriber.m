@implementation BLTPingSubscriber

- (BLTPingSubscriber)init
{
  BLTRemotePingSubscriberService *v3;
  BLTPingSubscriber *v4;

  v3 = objc_alloc_init(BLTRemotePingSubscriberService);
  v4 = -[BLTPingSubscriber initWithService:](self, "initWithService:", v3);
  if (v4)
    -[BLTRemotePingSubscriberService setDelegate:](v3, "setDelegate:", v4);

  return v4;
}

- (BLTPingSubscriber)initWithService:(id)a3
{
  id v5;
  BLTPingSubscriber *v6;
  BLTPingSubscriber *v7;
  uint64_t v8;
  NSMutableDictionary *pingHandlers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BLTPingSubscriber;
  v6 = -[BLTPingSubscriber init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_service, a3);
    pthread_mutex_init(&v7->_lock, 0);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    pingHandlers = v7->_pingHandlers;
    v7->_pingHandlers = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (void)subscribeToSectionID:(id)a3 withNotificationAckForwardHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)MEMORY[0x219A0C15C](a4);
  -[BLTPingSubscriber _subscribeToSectionID:pingHandler:ackType:forFullBulletins:forNotifications:](self, "_subscribeToSectionID:pingHandler:ackType:forFullBulletins:forNotifications:", v6, v7, 2, 1, 1);

}

- (void)_subscribeToSectionID:(id)a3 pingHandler:(id)a4 ackType:(unint64_t)a5 forFullBulletins:(BOOL)a6 forNotifications:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  BLTPingHandlerHolder *v14;

  v7 = a7;
  v8 = a6;
  v12 = a4;
  v13 = a3;
  v14 = -[BLTPingHandlerHolder initWithPingHandler:]([BLTPingHandlerHolder alloc], "initWithPingHandler:", v12);

  -[BLTPingHandlerHolder setAckType:](v14, "setAckType:", a5);
  -[BLTPingHandlerHolder setSectionID:](v14, "setSectionID:", v13);
  -[BLTPingHandlerHolder setForBulletin:](v14, "setForBulletin:", v8);
  -[BLTPingHandlerHolder setForNotification:](v14, "setForNotification:", v7);
  pthread_mutex_lock(&self->_lock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pingHandlers, "setObject:forKeyedSubscript:", v14, v13);
  -[BLTPingService subscribeToSectionID:forFullBulletins:withAck:ackAllowedOnLocalConnection:](self->_service, "subscribeToSectionID:forFullBulletins:withAck:ackAllowedOnLocalConnection:", v13, v8, -[BLTPingHandlerHolder canAck](v14, "canAck"), -[BLTPingHandlerHolder canAckOnLocalConnection](v14, "canAckOnLocalConnection"));

  pthread_mutex_unlock(&self->_lock);
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)BLTPingSubscriber;
  -[BLTPingSubscriber dealloc](&v3, sel_dealloc);
}

- (id)sectionIDs
{
  _opaque_pthread_mutex_t *p_lock;
  void *v4;
  void *v5;
  void *v6;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v4 = (void *)MEMORY[0x24BDBCEF0];
  -[NSMutableDictionary allKeys](self->_pingHandlers, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(p_lock);
  return v6;
}

- (id)subscriptionInfos
{
  _opaque_pthread_mutex_t *p_lock;
  void *v4;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[NSMutableDictionary allValues](self->_pingHandlers, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(p_lock);
  return v4;
}

- (void)unsubscribeFromSectionID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  pthread_mutex_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pingHandlers, "objectForKeyedSubscript:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_pingHandlers, "removeObjectForKey:", v5);
    -[BLTPingService unsubscribeFromSectionID:](self->_service, "unsubscribeFromSectionID:", v5);
  }
  pthread_mutex_unlock(&self->_lock);

}

- (void)_subscribeToSectionID:(id)a3 pingHandler:(id)a4 ackType:(unint64_t)a5 forFullBulletins:(BOOL)a6
{
  -[BLTPingSubscriber _subscribeToSectionID:pingHandler:ackType:forFullBulletins:forNotifications:](self, "_subscribeToSectionID:pingHandler:ackType:forFullBulletins:forNotifications:", a3, a4, a5, a6, 0);
}

- (void)subscribeToSectionID:(id)a3 withPingHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)MEMORY[0x219A0C15C](a4);
  -[BLTPingSubscriber _subscribeToSectionID:pingHandler:ackType:forFullBulletins:](self, "_subscribeToSectionID:pingHandler:ackType:forFullBulletins:", v6, v7, 0, 0);

}

- (void)subscribeToSectionID:(id)a3 withPingAckHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)MEMORY[0x219A0C15C](a4);
  -[BLTPingSubscriber _subscribeToSectionID:pingHandler:ackType:forFullBulletins:](self, "_subscribeToSectionID:pingHandler:ackType:forFullBulletins:", v6, v7, 1, 0);

}

- (void)subscribeToSectionID:(id)a3 withPingAckForwardHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)MEMORY[0x219A0C15C](a4);
  -[BLTPingSubscriber _subscribeToSectionID:pingHandler:ackType:forFullBulletins:](self, "_subscribeToSectionID:pingHandler:ackType:forFullBulletins:", v6, v7, 2, 0);

}

- (void)subscribeToSectionID:(id)a3 withBulletinHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)MEMORY[0x219A0C15C](a4);
  -[BLTPingSubscriber _subscribeToSectionID:pingHandler:ackType:forFullBulletins:](self, "_subscribeToSectionID:pingHandler:ackType:forFullBulletins:", v6, v7, 0, 1);

}

- (void)subscribeToSectionID:(id)a3 withBulletinAckHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)MEMORY[0x219A0C15C](a4);
  -[BLTPingSubscriber _subscribeToSectionID:pingHandler:ackType:forFullBulletins:](self, "_subscribeToSectionID:pingHandler:ackType:forFullBulletins:", v6, v7, 1, 1);

}

- (void)subscribeToSectionID:(id)a3 withBulletinAckForwardHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)MEMORY[0x219A0C15C](a4);
  -[BLTPingSubscriber _subscribeToSectionID:pingHandler:ackType:forFullBulletins:](self, "_subscribeToSectionID:pingHandler:ackType:forFullBulletins:", v6, v7, 2, 1);

}

- (void)subscribeToSectionID:(id)a3 withBulletinAckForwardForAnyConnectionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)MEMORY[0x219A0C15C](a4);
  -[BLTPingSubscriber _subscribeToSectionID:pingHandler:ackType:forFullBulletins:](self, "_subscribeToSectionID:pingHandler:ackType:forFullBulletins:", v6, v7, 3, 1);

}

- (void)subscribeToSectionID:(id)a3 withNotificationHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)MEMORY[0x219A0C15C](a4);
  -[BLTPingSubscriber _subscribeToSectionID:pingHandler:ackType:forFullBulletins:forNotifications:](self, "_subscribeToSectionID:pingHandler:ackType:forFullBulletins:forNotifications:", v6, v7, 0, 1, 1);

}

- (void)subscribeToSectionID:(id)a3 withNotificationAckHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)MEMORY[0x219A0C15C](a4);
  -[BLTPingSubscriber _subscribeToSectionID:pingHandler:ackType:forFullBulletins:forNotifications:](self, "_subscribeToSectionID:pingHandler:ackType:forFullBulletins:forNotifications:", v6, v7, 1, 1, 1);

}

- (void)subscribeToSectionID:(id)a3 withNotificationAckForwardForAnyConnectionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)MEMORY[0x219A0C15C](a4);
  -[BLTPingSubscriber _subscribeToSectionID:pingHandler:ackType:forFullBulletins:forNotifications:](self, "_subscribeToSectionID:pingHandler:ackType:forFullBulletins:forNotifications:", v6, v7, 3, 1, 1);

}

- (void)pingWithBulletin:(id)a3
{
  -[BLTPingSubscriber pingWithBulletin:ack:](self, "pingWithBulletin:ack:", a3, 0);
}

- (void)pingWithBulletin:(id)a3 ack:(id)a4
{
  id v6;
  _opaque_pthread_mutex_t *p_lock;
  NSMutableDictionary *pingHandlers;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  pingHandlers = self->_pingHandlers;
  objc_msgSend(v11, "sectionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](pingHandlers, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(p_lock);
  if (v10)
    objc_msgSend(v10, "pingWithBulletin:ack:", v11, v6);

}

- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4
{
  -[BLTPingSubscriber pingWithRecordID:forSectionID:ack:](self, "pingWithRecordID:forSectionID:ack:", a3, a4, 0);
}

- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4 ack:(id)a5
{
  id v8;
  id v9;
  _opaque_pthread_mutex_t *p_lock;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pingHandlers, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(p_lock);
  if (v11)
    objc_msgSend(v11, "pingWithRecordID:forSectionID:ack:", v12, v8, v9);

}

- (void)sendBulletinSummary:(id)a3 forBulletin:(id)a4 destinations:(unint64_t)a5
{
  id v7;
  id v8;
  BLTPBBulletinSummary *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  BLTPBBulletinSummaryKey *v19;
  void *v20;
  int v21;
  int v22;
  id *v23;
  void *v24;
  id v25;
  id v26;
  void *v28;
  BLTPBBulletinSummary *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(BLTPBBulletinSummary);
  objc_msgSend(v8, "recordID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletinSummary setRecordID:](v9, "setRecordID:", v10);

  objc_msgSend(v8, "publisherBulletinID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletinSummary setPublisherBulletinID:](v9, "setPublisherBulletinID:", v11);

  v28 = v8;
  objc_msgSend(v8, "sectionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletinSummary setSectionID:](v9, "setSectionID:", v12);

  v29 = v9;
  -[BLTPBBulletinSummary setDestinations:](v9, "setDestinations:", a5);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        v19 = objc_alloc_init(BLTPBBulletinSummaryKey);
        -[BLTPBBulletinSummaryKey setKey:](v19, "setKey:", v18);
        objc_msgSend(v13, "objectForKeyedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsNSNullPListExtenion");
        v22 = v21;
        if (v21)
          v23 = &v31;
        else
          v23 = 0;
        if (v21)
          v31 = 0;
        v30 = 0;
        +[BLTObjectSerializer serializeObject:nulls:error:](BLTObjectSerializer, "serializeObject:nulls:error:", v20, v23, &v30);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        if (v22)
          v25 = v31;
        v26 = v30;
        -[BLTPBBulletinSummaryKey setValue:](v19, "setValue:", v24);

        -[BLTPBBulletinSummaryKey setValueNulls:](v19, "setValueNulls:", v25);
        if (!v26)
          -[BLTPBBulletinSummary addKey:](v29, "addKey:", v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v15);
  }

  pthread_mutex_lock(&self->_lock);
  -[BLTPingService sendBulletinSummary:](self->_service, "sendBulletinSummary:", v29);
  pthread_mutex_unlock(&self->_lock);

}

- (void)getWillNanoPresentNotificationForSectionID:(id)a3 completion:(id)a4
{
  _opaque_pthread_mutex_t *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  pthread_mutex_lock(p_lock);
  -[BLTPingService getWillNanoPresentNotificationForSectionID:subsectionIDs:completion:](self->_service, "getWillNanoPresentNotificationForSectionID:subsectionIDs:completion:", v8, 0, v7);

  pthread_mutex_unlock(p_lock);
}

- (void)getWillNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 completion:(id)a5
{
  _opaque_pthread_mutex_t *p_lock;
  id v9;
  id v10;
  id v11;

  p_lock = &self->_lock;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  pthread_mutex_lock(p_lock);
  -[BLTPingService getWillNanoPresentNotificationForSectionID:subsectionIDs:completion:](self->_service, "getWillNanoPresentNotificationForSectionID:subsectionIDs:completion:", v11, v10, v9);

  pthread_mutex_unlock(p_lock);
}

- (void)subscribeWithMachServiceName:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  pthread_mutex_lock(p_lock);
  -[BLTPingService subscribeWithMachServiceName:](self->_service, "subscribeWithMachServiceName:", v5);

  pthread_mutex_unlock(p_lock);
}

- (NSMutableDictionary)pingHandlers
{
  return self->_pingHandlers;
}

- (void)setPingHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_pingHandlers, a3);
}

- (BLTPingService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_pingHandlers, 0);
}

@end
