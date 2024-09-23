@implementation NNMKSyncEndpoint

- (NNMKSyncEndpoint)initWithQueue:(id)a3
{
  id v5;
  NNMKSyncEndpoint *v6;
  NNMKSyncEndpoint *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *resendingQueue;
  uint64_t v10;
  NSMutableDictionary *datesForIDSIdentifiersScheduledToBeResent;
  uint64_t v12;
  NSMutableDictionary *lastResendIntervalByIDSIdentifier;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NNMKSyncEndpoint;
  v6 = -[NNMKSyncEndpoint init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpointQueue, a3);
    v8 = dispatch_queue_create("com.apple.NanoMail.resendingQueue", MEMORY[0x24BDAC9C0]);
    resendingQueue = v7->_resendingQueue;
    v7->_resendingQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    datesForIDSIdentifiersScheduledToBeResent = v7->_datesForIDSIdentifiersScheduledToBeResent;
    v7->_datesForIDSIdentifiersScheduledToBeResent = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    lastResendIntervalByIDSIdentifier = v7->_lastResendIntervalByIDSIdentifier;
    v7->_lastResendIntervalByIDSIdentifier = (NSMutableDictionary *)v12;

  }
  return v7;
}

- (void)dealloc
{
  NSObject *resendingQueue;
  objc_super v4;
  _QWORD block[5];

  resendingQueue = self->_resendingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__NNMKSyncEndpoint_dealloc__block_invoke;
  block[3] = &unk_24F9F6270;
  block[4] = self;
  dispatch_sync(resendingQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)NNMKSyncEndpoint;
  -[NNMKSyncEndpoint dealloc](&v4, sel_dealloc);
}

uint64_t __27__NNMKSyncEndpoint_dealloc__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
}

- (void)enqueueIDSIdentifiersForResend:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *datesForIDSIdentifiersScheduledToBeResent;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
    datesForIDSIdentifiersScheduledToBeResent = self->_datesForIDSIdentifiersScheduledToBeResent;
    self->_datesForIDSIdentifiersScheduledToBeResent = v4;

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[NSMutableDictionary allKeys](self->_datesForIDSIdentifiersScheduledToBeResent, "allKeys", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_datesForIDSIdentifiersScheduledToBeResent, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKSyncEndpoint enqueueIDSIdentifierForResend:atDate:silent:](self, "enqueueIDSIdentifierForResend:atDate:silent:", v11, v12, 0);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (void)enqueueIDSIdentifierForResend:(id)a3 atDate:(id)a4 silent:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  double v13;
  dispatch_time_t v14;
  NSObject *resendingQueue;
  _QWORD block[4];
  void (**v17)(_QWORD);
  _QWORD v18[5];
  id v19;

  v8 = a3;
  v9 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_datesForIDSIdentifiersScheduledToBeResent, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (a5)
      goto LABEL_9;
  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_datesForIDSIdentifiersScheduledToBeResent, "setObject:forKeyedSubscript:", v9, v8);
    if (a5)
      goto LABEL_9;
  }
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __64__NNMKSyncEndpoint_enqueueIDSIdentifierForResend_atDate_silent___block_invoke;
  v18[3] = &unk_24F9F6298;
  v18[4] = self;
  v19 = v8;
  v12 = (void (**)(_QWORD))MEMORY[0x22E327EE4](v18);
  objc_msgSend(v9, "timeIntervalSinceNow");
  if (v13 <= 0.0)
  {
    v12[2](v12);
  }
  else
  {
    v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
    resendingQueue = self->_resendingQueue;
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __64__NNMKSyncEndpoint_enqueueIDSIdentifierForResend_atDate_silent___block_invoke_3;
    block[3] = &unk_24F9F62C0;
    v17 = v12;
    dispatch_after(v14, resendingQueue, block);

  }
LABEL_9:

}

void __64__NNMKSyncEndpoint_enqueueIDSIdentifierForResend_atDate_silent___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 8);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64__NNMKSyncEndpoint_enqueueIDSIdentifierForResend_atDate_silent___block_invoke_2;
  v4[3] = &unk_24F9F6298;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __64__NNMKSyncEndpoint_enqueueIDSIdentifierForResend_atDate_silent___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5 = v2;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "compare:", v3);

    v2 = v5;
    if (v4 != 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "resendObjectsForIDSIdentifier:", *(_QWORD *)(a1 + 40));
      v2 = v5;
    }
  }

}

uint64_t __64__NNMKSyncEndpoint_enqueueIDSIdentifierForResend_atDate_silent___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resendReadyIDSIdentifiers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allKeys](self->_datesForIDSIdentifiersScheduledToBeResent, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_datesForIDSIdentifiersScheduledToBeResent, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceNow");
        if (v10 <= 0.0)
          -[NNMKSyncEndpoint resendObjectsForIDSIdentifier:](self, "resendObjectsForIDSIdentifier:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)resendAllIDSIdentifiers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allKeys](self->_datesForIDSIdentifiersScheduledToBeResent, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[NNMKSyncEndpoint resendObjectsForIDSIdentifier:](self, "resendObjectsForIDSIdentifier:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (unint64_t)newResendIntervalForPreviousResendInterval:(unint64_t)a3 errorCode:(int64_t)a4
{
  if (a4 == 27)
    return 0xFFFFFFFFLL;
  if (!a3)
    return 1;
  if (5 * a3 >= 0xE10)
    return 3600;
  return 5 * a3;
}

- (void)dequeueIDSIdentifierForResend:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_datesForIDSIdentifiersScheduledToBeResent, "removeObjectForKey:", a3);
}

- (NSMutableDictionary)datesForIDSIdentifiersScheduledToBeResent
{
  return 0;
}

- (OS_dispatch_queue)endpointQueue
{
  return self->_endpointQueue;
}

- (void)setEndpointQueue:(id)a3
{
  objc_storeStrong((id *)&self->_endpointQueue, a3);
}

- (OS_dispatch_queue)resendingQueue
{
  return self->_resendingQueue;
}

- (void)setResendingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resendingQueue, a3);
}

- (void)setDatesForIDSIdentifiersScheduledToBeResent:(id)a3
{
  objc_storeStrong((id *)&self->_datesForIDSIdentifiersScheduledToBeResent, a3);
}

- (NSMutableDictionary)lastResendIntervalByIDSIdentifier
{
  return self->_lastResendIntervalByIDSIdentifier;
}

- (void)setLastResendIntervalByIDSIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lastResendIntervalByIDSIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastResendIntervalByIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_datesForIDSIdentifiersScheduledToBeResent, 0);
  objc_storeStrong((id *)&self->_resendingQueue, 0);
  objc_storeStrong((id *)&self->_endpointQueue, 0);
}

@end
