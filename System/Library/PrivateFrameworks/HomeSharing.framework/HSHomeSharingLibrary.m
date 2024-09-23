@implementation HSHomeSharingLibrary

- (HSHomeSharingLibrary)initWithName:(id)a3 uniqueIdentifier:(id)a4 version:(unsigned int)a5 baseURL:(id)a6 homeSharingGroupID:(id)a7 connectionType:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HSHomeSharingLibrary *v18;
  HSHomeSharingLibrary *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *connectionAccessQueue;
  HSConnection *v22;
  HSConnection *connection;
  HSFairPlayInfo *v24;
  uint64_t v25;
  uint64_t v26;
  NSString *name;
  uint64_t v28;
  NSString *uniqueIdentifier;
  uint64_t v30;
  NSURL *baseURL;
  uint64_t v32;
  NSString *homeSharingGroupID;
  objc_super v35;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v35.receiver = self;
  v35.super_class = (Class)HSHomeSharingLibrary;
  v18 = -[HSHomeSharingLibrary init](&v35, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_available = 1;
    v20 = dispatch_queue_create("com.apple.homesharing.HSHomeSharingLibrary.connectionAccessQueue", 0);
    connectionAccessQueue = v19->_connectionAccessQueue;
    v19->_connectionAccessQueue = (OS_dispatch_queue *)v20;

    v22 = -[HSConnection initWithBaseURL:connectionType:]([HSConnection alloc], "initWithBaseURL:connectionType:", v16, a8);
    connection = v19->_connection;
    v19->_connection = v22;

    -[HSConnection setHomeSharingGroupID:](v19->_connection, "setHomeSharingGroupID:", v17);
    v24 = objc_alloc_init(HSFairPlayInfo);
    -[HSConnection setFairPlayInfo:](v19->_connection, "setFairPlayInfo:", v24);

    if (objc_msgSend(v14, "hasSuffix:", CFSTR("_PW")))
    {
      objc_msgSend(v14, "substringWithRange:", 0, objc_msgSend(v14, "length") - 3);
      v25 = objc_claimAutoreleasedReturnValue();

      v19->_requiresPassword = 1;
    }
    else
    {
      if (objc_msgSend(v14, "rangeOfString:", CFSTR("_")) == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_7:
        v26 = objc_msgSend(v14, "copy");
        name = v19->_name;
        v19->_name = (NSString *)v26;

        v28 = objc_msgSend(v15, "copy");
        uniqueIdentifier = v19->_uniqueIdentifier;
        v19->_uniqueIdentifier = (NSString *)v28;

        v19->_version = a5;
        v30 = objc_msgSend(v16, "copy");
        baseURL = v19->_baseURL;
        v19->_baseURL = (NSURL *)v30;

        v32 = objc_msgSend(v17, "copy");
        homeSharingGroupID = v19->_homeSharingGroupID;
        v19->_homeSharingGroupID = (NSString *)v32;

        v19->_connectionType = a8;
        goto LABEL_8;
      }
      objc_msgSend(v14, "substringToIndex:", objc_msgSend(v14, "rangeOfString:", CFSTR("_")));
      v25 = objc_claimAutoreleasedReturnValue();

    }
    v14 = (id)v25;
    goto LABEL_7;
  }
LABEL_8:

  return v19;
}

- (void)connectWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *connectionAccessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectionAccessQueue = self->_connectionAccessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__HSHomeSharingLibrary_connectWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C364C98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(connectionAccessQueue, v7);

}

- (void)sendRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionAccessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionAccessQueue = self->_connectionAccessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__HSHomeSharingLibrary_sendRequest_withResponseHandler___block_invoke;
  block[3] = &unk_24C364CC0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(connectionAccessQueue, block);

}

- (id)securityInfoForURL:(id)a3
{
  id v4;
  NSObject *connectionAccessQueue;
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
  v15 = __Block_byref_object_copy__1639;
  v16 = __Block_byref_object_dispose__1640;
  v17 = 0;
  connectionAccessQueue = self->_connectionAccessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__HSHomeSharingLibrary_securityInfoForURL___block_invoke;
  block[3] = &unk_24C364CE8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(connectionAccessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)signedRequestFromURLRequest:(id)a3
{
  id v4;
  NSObject *connectionAccessQueue;
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
  v15 = __Block_byref_object_copy__1639;
  v16 = __Block_byref_object_dispose__1640;
  v17 = 0;
  connectionAccessQueue = self->_connectionAccessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__HSHomeSharingLibrary_signedRequestFromURLRequest___block_invoke;
  block[3] = &unk_24C364CE8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(connectionAccessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)urlForRequest:(id)a3
{
  id v4;
  NSObject *connectionAccessQueue;
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
  v15 = __Block_byref_object_copy__1639;
  v16 = __Block_byref_object_dispose__1640;
  v17 = 0;
  connectionAccessQueue = self->_connectionAccessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__HSHomeSharingLibrary_urlForRequest___block_invoke;
  block[3] = &unk_24C364CE8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(connectionAccessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)disconnect
{
  NSObject *connectionAccessQueue;
  _QWORD block[5];

  connectionAccessQueue = self->_connectionAccessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__HSHomeSharingLibrary_disconnect__block_invoke;
  block[3] = &unk_24C364D10;
  block[4] = self;
  dispatch_async(connectionAccessQueue, block);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[HSHomeSharingLibrary uniqueIdentifier](self, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HSHomeSharingLibrary uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (unsigned)databaseID
{
  NSObject *connectionAccessQueue;
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  connectionAccessQueue = self->_connectionAccessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__HSHomeSharingLibrary_databaseID__block_invoke;
  v5[3] = &unk_24C364D38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionAccessQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)basePlaylistContainerID
{
  NSObject *connectionAccessQueue;
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  connectionAccessQueue = self->_connectionAccessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__HSHomeSharingLibrary_basePlaylistContainerID__block_invoke;
  v5[3] = &unk_24C364D38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionAccessQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)connectionState
{
  NSObject *connectionAccessQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  connectionAccessQueue = self->_connectionAccessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__HSHomeSharingLibrary_connectionState__block_invoke;
  v5[3] = &unk_24C364D38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)deviceGUID
{
  return (NSString *)(id)MGCopyAnswer();
}

- (void)_onQueue_ensureConnection
{
  HSConnection *connection;
  HSConnection *v4;
  void *v5;
  HSConnection *v6;
  HSConnection *v7;
  void *v8;
  HSFairPlayInfo *v9;
  dispatch_semaphore_t v10;
  HSConnection *v11;
  NSObject *v12;
  dispatch_time_t v13;
  _QWORD v14[5];
  NSObject *v15;

  if (self->_available)
  {
    connection = self->_connection;
    if (!connection)
    {
      v4 = [HSConnection alloc];
      -[HSHomeSharingLibrary baseURL](self, "baseURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[HSConnection initWithBaseURL:connectionType:](v4, "initWithBaseURL:connectionType:", v5, -[HSHomeSharingLibrary connectionType](self, "connectionType"));
      v7 = self->_connection;
      self->_connection = v6;

      -[HSHomeSharingLibrary homeSharingGroupID](self, "homeSharingGroupID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HSConnection setHomeSharingGroupID:](self->_connection, "setHomeSharingGroupID:", v8);

      v9 = objc_alloc_init(HSFairPlayInfo);
      -[HSConnection setFairPlayInfo:](self->_connection, "setFairPlayInfo:", v9);

      connection = self->_connection;
    }
    if (-[HSConnection connectionState](connection, "connectionState") != 2)
    {
      v10 = dispatch_semaphore_create(0);
      v11 = self->_connection;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __49__HSHomeSharingLibrary__onQueue_ensureConnection__block_invoke;
      v14[3] = &unk_24C3650D0;
      v14[4] = self;
      v12 = v10;
      v15 = v12;
      -[HSConnection connectWithCompletionHandler:](v11, "connectWithCompletionHandler:", v14);
      v13 = dispatch_time(0, 3000000000);
      if (dispatch_semaphore_wait(v12, v13))
        self->_available = 0;

    }
  }
}

- (void)_sendUpdateRequest
{
  NSObject *v3;
  NSObject *connectionAccessQueue;
  _QWORD block[5];
  uint8_t buf[16];

  if (-[HSHomeSharingLibrary _hasPendingUpdateRequest](self, "_hasPendingUpdateRequest"))
  {
    v3 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20AA9E000, v3, OS_LOG_TYPE_ERROR, "Outstanding update request when attempting to send new update request.", buf, 2u);
    }

  }
  connectionAccessQueue = self->_connectionAccessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__HSHomeSharingLibrary__sendUpdateRequest__block_invoke;
  block[3] = &unk_24C364D10;
  block[4] = self;
  dispatch_async(connectionAccessQueue, block);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (unsigned)version
{
  return self->_version;
}

- (BOOL)requiresPassword
{
  return self->_requiresPassword;
}

- (NSString)homeSharingGroupID
{
  return self->_homeSharingGroupID;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (NSNetService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

- (BOOL)_hasPendingUpdateRequest
{
  return self->__hasPendingUpdateRequest;
}

- (void)set_hasPendingUpdateRequest:(BOOL)a3
{
  self->__hasPendingUpdateRequest = a3;
}

- (HSConnection)connection
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
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_homeSharingGroupID, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_connectionAccessQueue, 0);
}

void __42__HSHomeSharingLibrary__sendUpdateRequest__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_ensureConnection");
  if (objc_msgSend(*(id *)(a1 + 32), "isAvailable"))
  {
    objc_msgSend(*(id *)(a1 + 32), "set_hasPendingUpdateRequest:", 1);
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __42__HSHomeSharingLibrary__sendUpdateRequest__block_invoke_2;
    v5[3] = &unk_24C364D60;
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v2, "checkForDatabaseUpdatesWithCompletionHandler:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v6 = CFSTR("HSHomeSharingLibraryKey");
    v7[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("HSHomeSharingLibraryDidBecomeUnavailableNotification"), v3, v4);

  }
}

uint64_t __42__HSHomeSharingLibrary__sendUpdateRequest__block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend(*(id *)(a1 + 32), "set_hasPendingUpdateRequest:", 0);
  if (!a3)
  {
    if (a2)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v10 = CFSTR("HSHomeSharingLibraryKey");
      v11[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("HSHomeSharingLibraryDidUpdateRevisionNumberNotification"), v8, v9);

    }
    return objc_msgSend(*(id *)(a1 + 32), "_sendUpdateRequest");
  }
  return result;
}

intptr_t __49__HSHomeSharingLibrary__onQueue_ensureConnection__block_invoke(uint64_t a1, int a2)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = a2;
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "_sendUpdateRequest");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __39__HSHomeSharingLibrary_connectionState__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "connectionState");

}

void __47__HSHomeSharingLibrary_basePlaylistContainerID__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "basePlaylistContainerID");

}

void __34__HSHomeSharingLibrary_databaseID__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "databaseID");

}

uint64_t __34__HSHomeSharingLibrary_disconnect__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "disconnect");
  objc_msgSend(*(id *)(a1 + 32), "setConnection:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "set_hasPendingUpdateRequest:", 0);
}

void __38__HSHomeSharingLibrary_urlForRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "homeSharingGroupID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(*(id *)(a1 + 40), "action");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqual:", CFSTR("server-info"));

    if ((v4 & 1) != 0)
      goto LABEL_5;
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "homeSharingGroupID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forArgument:", v2, CFSTR("hsgid"));
  }

LABEL_5:
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "connectionType");

  if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "action");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", CFSTR("logout"));

    if ((v9 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "setValue:forArgument:", CFSTR("1"), CFSTR("daap-no-disconnect"));
    objc_msgSend(*(id *)(a1 + 40), "setValue:forArgument:", CFSTR("1"), CFSTR("hs-mobile-device-client"));
  }
  v10 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "baseURL");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestURLForBaseURL:sessionID:", v14, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "sessionID"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

void __52__HSHomeSharingLibrary_signedRequestFromURLRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "signedRequestFromURLRequest:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __43__HSHomeSharingLibrary_securityInfoForURL___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fairPlayInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "securityInfoForURL:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __56__HSHomeSharingLibrary_sendRequest_withResponseHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_ensureConnection");
  if (objc_msgSend(*(id *)(a1 + 32), "isAvailable"))
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sendRequest:withResponseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __53__HSHomeSharingLibrary_connectWithCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  HSConnection *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  HSFairPlayInfo *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[9])
  {
    v3 = [HSConnection alloc];
    objc_msgSend(*(id *)(a1 + 32), "baseURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[HSConnection initWithBaseURL:connectionType:](v3, "initWithBaseURL:connectionType:", v4, objc_msgSend(*(id *)(a1 + 32), "connectionType"));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 72);
    *(_QWORD *)(v6 + 72) = v5;

    objc_msgSend(*(id *)(a1 + 32), "homeSharingGroupID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setHomeSharingGroupID:", v8);

    v9 = objc_alloc_init(HSFairPlayInfo);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setFairPlayInfo:", v9);

    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__HSHomeSharingLibrary_connectWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_24C364C70;
  v11 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v11;
  objc_msgSend(v10, "connectWithCompletionHandler:", v12);

}

void __53__HSHomeSharingLibrary_connectWithCompletionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "_sendUpdateRequest");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
