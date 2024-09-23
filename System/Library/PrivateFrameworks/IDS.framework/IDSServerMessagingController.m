@implementation IDSServerMessagingController

- (IDSServerMessagingController)initWithTopic:(id)a3 commands:(id)a4 daemonController:(id)a5
{
  id v9;
  id v10;
  id v11;
  IDSServerMessagingController *v12;
  IDSServerMessagingController *v13;
  uint64_t v14;
  NSHashTable *delegateMap;
  uint64_t v16;
  NSString *uuid;
  NSMutableDictionary *v18;
  NSMutableDictionary *inFlightRequests;
  NSObject *v20;
  NSString *v21;
  objc_super v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  NSString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)IDSServerMessagingController;
  v12 = -[IDSServerMessagingController init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_topic, a3);
    objc_storeStrong((id *)&v13->_commands, a4);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v14 = objc_claimAutoreleasedReturnValue();
    delegateMap = v13->_delegateMap;
    v13->_delegateMap = (NSHashTable *)v14;

    objc_storeStrong((id *)&v13->_daemonController, a5);
    v13->_daemonControllerLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v16 = objc_claimAutoreleasedReturnValue();
    uuid = v13->_uuid;
    v13->_uuid = (NSString *)v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    inFlightRequests = v13->_inFlightRequests;
    v13->_inFlightRequests = v18;

    v13->_inFlightLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v13->_uuid;
      *(_DWORD *)buf = 138412546;
      v25 = v9;
      v26 = 2112;
      v27 = v21;
      _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "Client initialized IDSServerMessagingController with topic: %@ uuid: %@", buf, 0x16u);
    }

    -[IDSServerMessagingController _setupInterruptionHandler](v13, "_setupInterruptionHandler");
    -[IDSServerMessagingController _setupXPC](v13, "_setupXPC");
  }

  return v13;
}

- (IDSServerMessagingController)initWithTopic:(id)a3
{
  return (IDSServerMessagingController *)MEMORY[0x1E0DE7D20](self, sel_initWithTopic_commands_daemonController_);
}

- (IDSServerMessagingController)initWithTopic:(id)a3 commands:(id)a4
{
  return (IDSServerMessagingController *)MEMORY[0x1E0DE7D20](self, sel_initWithTopic_commands_daemonController_);
}

- (void)_setupInterruptionHandler
{
  uint64_t v3;
  void *v4;
  IDSXPCDaemonController *daemonController;
  _QWORD v6[5];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1907170B0;
  v8[3] = &unk_1E2C60B88;
  objc_copyWeak(&v9, &location);
  v4 = (void *)MEMORY[0x19400FE1C](v8);
  os_unfair_lock_lock(&self->_daemonControllerLock);
  daemonController = self->_daemonController;
  if (daemonController)
  {
    -[IDSXPCDaemonController addInterruptionHandler:forTarget:](daemonController, "addInterruptionHandler:forTarget:", v4, self);
  }
  else
  {
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = sub_190717190;
    v6[3] = &unk_1E2C61618;
    v6[4] = self;
    v7 = v4;
    +[IDSXPCDaemonController asyncWeakSharedInstance:](IDSXPCDaemonController, "asyncWeakSharedInstance:", v6);

  }
  os_unfair_lock_unlock(&self->_daemonControllerLock);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_setupXPC
{
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _BYTE buf[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[IDSServerMessagingController uuid](self, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "Setting up xpc for client %@", buf, 0xCu);

  }
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_190717360;
  v5[3] = &unk_1E2C60DD8;
  objc_copyWeak(&v6, (id *)buf);
  -[IDSServerMessagingController performXPC:](self, "performXPC:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

- (void)performXPC:(id)a3
{
  os_unfair_lock_s *p_daemonControllerLock;
  id v5;
  IDSXPCDaemonController *daemonController;

  p_daemonControllerLock = &self->_daemonControllerLock;
  v5 = a3;
  os_unfair_lock_lock(p_daemonControllerLock);
  daemonController = self->_daemonController;
  if (daemonController)
    -[IDSXPCDaemonController performTask:](daemonController, "performTask:", v5);
  else
    +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", v5);

  os_unfair_lock_unlock(p_daemonControllerLock);
}

- (void)_failMessages
{
  os_unfair_lock_s *p_inFlightLock;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  IDSServerMessagingOutgoingContext *v15;
  void *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  p_inFlightLock = &self->_inFlightLock;
  os_unfair_lock_lock(&self->_inFlightLock);
  -[IDSServerMessagingController inFlightRequests](self, "inFlightRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  -[IDSServerMessagingController inFlightRequests](self, "inFlightRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  os_unfair_lock_unlock(p_inFlightLock);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v20;
    *(_QWORD *)&v9 = 138412546;
    v18 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v13, v18, (_QWORD)v19);
        v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v15 = -[IDSServerMessagingOutgoingContext initWithIdentifier:]([IDSServerMessagingOutgoingContext alloc], "initWithIdentifier:", v13);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSServerMessagingErrorDomain"), 2, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v18;
          v24 = v13;
          v25 = 2112;
          v26 = v16;
          _os_log_error_impl(&dword_1906E0000, v17, OS_LOG_TYPE_ERROR, "Failing message due to xpc interruption {guid: %@, error: %@}", buf, 0x16u);
        }

        ((void (**)(_QWORD, _QWORD, void *, IDSServerMessagingOutgoingContext *))v14)[2](v14, 0, v16, v15);
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v10);
  }

}

- (void)_sendData:(id)a3 withOptions:(id)a4 identifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_190717850;
  v18[3] = &unk_1E2C61688;
  objc_copyWeak(&v23, &location);
  v14 = v10;
  v19 = v14;
  v15 = v11;
  v20 = v15;
  v16 = v12;
  v21 = v16;
  v17 = v13;
  v22 = v17;
  -[IDSServerMessagingController performXPC:](self, "performXPC:", v18);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (void)addDelegate:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IDSServerMessagingController delegateMap](self, "delegateMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    -[IDSServerMessagingController delegateMap](self, "delegateMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v4);

    objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[IDSServerMessagingController uuid](self, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSServerMessagingController delegateMap](self, "delegateMap");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v9;
      v13 = 2048;
      v14 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Client added delegate to listen for incoming messages from server { uuid: %@, delegate count: %lu }", (uint8_t *)&v11, 0x16u);

    }
  }

}

- (void)sendMessageData:(id)a3 withOptions:(id)a4 identifier:(id *)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (*a5)
  {
    v13 = *a5;
LABEL_5:
    v14 = v13;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *a5 = v14;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[IDSServerMessagingController uuid](self, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412802;
    v20 = v16;
    v21 = 2112;
    v22 = v14;
    v23 = 2112;
    v24 = v11;
    _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "Client requested send { clientUUID: %@, guid: %@, options: %@ }", (uint8_t *)&v19, 0x20u);

  }
  os_unfair_lock_lock(&self->_inFlightLock);
  v17 = (void *)MEMORY[0x19400FE1C](v12);
  -[IDSServerMessagingController inFlightRequests](self, "inFlightRequests");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v14);

  os_unfair_lock_unlock(&self->_inFlightLock);
  -[IDSServerMessagingController _sendData:withOptions:identifier:completion:](self, "_sendData:withOptions:identifier:completion:", v10, v11, v14, v12);

}

- (void)sendCertifiedDeliveryReceipt:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[IDSServerMessagingController uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalGUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "Client requested certified delivery receipt { clientUUID: %@, guid: %@, context: %@ }", buf, 0x20u);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_190717F9C;
  v9[3] = &unk_1E2C616B0;
  v10 = v4;
  v8 = v4;
  -[IDSServerMessagingController performXPC:](self, "performXPC:", v9);

}

- (void)sendServerStorageFetchWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_190718114;
  v6[3] = &unk_1E2C61700;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[IDSServerMessagingController performXPC:](self, "performXPC:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)cancelMessageWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_190718444;
  v10[3] = &unk_1E2C61728;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v11 = v8;
  v9 = v7;
  v12 = v9;
  -[IDSServerMessagingController performXPC:](self, "performXPC:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)handleReceivedIncomingMessageData:(id)a3 identifier:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSObject *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v23 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[IDSServerMessagingController uuid](self, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v30 = v11;
    v31 = 2112;
    v32 = v23;
    v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "Client received incoming data { clientUUID: %@, guid: %@, context: %@ }", buf, 0x20u);

  }
  -[IDSServerMessagingController delegateMap](self, "delegateMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    -[IDSServerMessagingController delegateMap](self, "delegateMap");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v16 = v15;
    v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v30 = v23;
              v31 = 2048;
              v32 = v21;
              _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "Forwarding server message to delegate { guid: %@, delegate: %p }", buf, 0x16u);
            }

            objc_msgSend(v21, "controller:receivedIncomingMessageData:context:", self, v8, v9);
          }
        }
        v18 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v18);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1907E92BC();
  }

}

- (void)handleReceivedFinalStorageIndication
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[IDSServerMessagingController uuid](self, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v4;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "Client received final storage indication { clientUUID: %@ }", buf, 0xCu);

  }
  -[IDSServerMessagingController delegateMap](self, "delegateMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[IDSServerMessagingController delegateMap](self, "delegateMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v8;
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              v22 = v14;
              _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "Forwarding server message to delegate { delegate: %p }", buf, 0xCu);
            }

            objc_msgSend(v14, "receivedIndicationOfEmptyServerStorageForController:", self);
          }
        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "IDSServerMessaging");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907E931C(v9);
  }

}

- (NSString)topic
{
  return self->_topic;
}

- (NSSet)commands
{
  return self->_commands;
}

- (NSHashTable)delegateMap
{
  return self->_delegateMap;
}

- (void)setDelegateMap:(id)a3
{
  objc_storeStrong((id *)&self->_delegateMap, a3);
}

- (IDSXPCDaemonController)daemonController
{
  return self->_daemonController;
}

- (void)setDaemonController:(id)a3
{
  objc_storeStrong((id *)&self->_daemonController, a3);
}

- (os_unfair_lock_s)daemonControllerLock
{
  return self->_daemonControllerLock;
}

- (void)setDaemonControllerLock:(os_unfair_lock_s)a3
{
  self->_daemonControllerLock = a3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSMutableDictionary)inFlightRequests
{
  return self->_inFlightRequests;
}

- (void)setInFlightRequests:(id)a3
{
  objc_storeStrong((id *)&self->_inFlightRequests, a3);
}

- (os_unfair_lock_s)inFlightLock
{
  return self->_inFlightLock;
}

- (void)setInFlightLock:(os_unfair_lock_s)a3
{
  self->_inFlightLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inFlightRequests, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_daemonController, 0);
  objc_storeStrong((id *)&self->_delegateMap, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

@end
