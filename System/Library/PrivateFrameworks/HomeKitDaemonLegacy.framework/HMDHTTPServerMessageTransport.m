@implementation HMDHTTPServerMessageTransport

- (HMDHTTPServerMessageTransport)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDHTTPServerMessageTransport)initWithServerIdentifier:(id)a3
{
  id v4;
  HMDHTTPServerMessageTransport *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  NSMutableArray *clientConnections;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HMFHTTPServer *server;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDHTTPServerMessageTransport *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v30.receiver = self;
    v30.super_class = (Class)HMDHTTPServerMessageTransport;
    v5 = -[HMDHTTPServerMessageTransport init](&v30, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v6;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = objc_claimAutoreleasedReturnValue();
      clientConnections = v5->_clientConnections;
      v5->_clientConnections = (NSMutableArray *)v8;

      v10 = objc_alloc(MEMORY[0x1E0D285A8]);
      -[HMDHTTPServerMessageTransport identifier](v5, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "initWithServiceType:name:port:options:", CFSTR("_homekit._tcp."), v12, 0, 7);
      server = v5->_server;
      v5->_server = (HMFHTTPServer *)v13;

      -[HMDHTTPServerMessageTransport server](v5, "server");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDelegate:", v5);

      -[HMDHTTPServerMessageTransport server](v5, "server");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setConnectionIdleTimeout:", 3600.0);

      if (isInternalBuild())
      {
        -[HMDHTTPServerMessageTransport server](v5, "server");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "netService");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        deviceName();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "dataUsingEncoding:", 4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setTXTRecordValue:forKey:", v20, CFSTR("Name"));

        +[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "versionString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "dataUsingEncoding:", 4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setTXTRecordValue:forKey:", v23, CFSTR("sw"));

      }
      -[HMDHTTPServerMessageTransport __registerReceiveMessageHandler](v5, "__registerReceiveMessageHandler");
      -[HMDHTTPServerMessageTransport __registerSendResponseHandler](v5, "__registerSendResponseHandler");
      -[HMDHTTPServerMessageTransport __registerSendMessageHandler](v5, "__registerSendMessageHandler");
      -[HMDHTTPServerMessageTransport __registerPingHandler](v5, "__registerPingHandler");
    }
    self = v5;
    v24 = self;
  }
  else
  {
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDHTTPServerMessageTransport description](HMDHTTPServerMessageTransport, "description");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v27;
      v33 = 2112;
      v34 = v28;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@[%@] A valid identifier is required", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    v24 = 0;
  }

  return v24;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHTTPServerMessageTransport identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)descriptionWithPointer:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHTTPServerMessageTransport identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %@, Identifier = %@>"), v6, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %@, Identifier = %@>"), v6, v8, &stru_1E89C3E38);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (NSString)debugDescription
{
  return (NSString *)-[HMDHTTPServerMessageTransport descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (NSString)description
{
  return (NSString *)-[HMDHTTPServerMessageTransport descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (NSArray)devices
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HMDHTTPServerMessageTransport clientConnections](self, "clientConnections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isConnected", (_QWORD)v13))
        {
          objc_msgSend(v9, "device");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v11;
}

- (NSArray)clientConnections
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_clientConnections, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)addClientConnection:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    os_unfair_lock_lock_with_options();
    -[NSMutableArray addObject:](self->_clientConnections, "addObject:", v6);
    objc_msgSend(v6, "lostConnectionTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);

    os_unfair_lock_unlock(&self->_lock);
    v4 = v6;
  }

}

- (void)removeClientConnection:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    -[NSMutableArray removeObject:](self->_clientConnections, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v4, "invalidate");
  }

}

- (void)removeAllClientConnections
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_clientConnections, "copy");
  -[NSMutableArray removeAllObjects](self->_clientConnections, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "invalidate", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (NSDictionary)TXTRecord
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDHTTPServerMessageTransport server](self, "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "netService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "TXTRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (void)setTXTRecordValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[HMDHTTPServerMessageTransport server](self, "server");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "netService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTXTRecordValue:forKey:", v7, v6);

}

- (void)removeTXTRecordValueForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDHTTPServerMessageTransport server](self, "server");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "netService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTXTRecordValueForKey:", v4);

}

- (void)startWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDHTTPServerMessageTransport *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Starting with session identifier: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDHTTPServerMessageTransport server](v7, "server");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "netService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dataUsingEncoding:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTXTRecordValue:forKey:", v14, CFSTR("si"));

  -[HMDHTTPServerMessageTransport server](v7, "server");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startWithCompletionHandler:", v4);

}

- (void)stop
{
  -[HMDHTTPServerMessageTransport _stopWithError:](self, "_stopWithError:", 0);
}

- (void)_stopWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDHTTPServerMessageTransport server](self, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stop");

  -[HMDHTTPServerMessageTransport removeAllClientConnections](self, "removeAllClientConnections");
  -[HMDHTTPServerMessageTransport delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "server:didStopWithError:", self, v4);

}

- (void)confirmDevice:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDHTTPServerMessageTransport *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDHTTPServerMessageTransport _clientConnectionForDevice:](self, "_clientConnectionForDevice:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__HMDHTTPServerMessageTransport_confirmDevice_completionHandler___block_invoke;
    v13[3] = &unk_1E89B2600;
    v14 = v7;
    objc_msgSend(v8, "sendMessage:timeout:completionHandler:", MEMORY[0x1E0C9AA70], v13, 10.0);

  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@The device, %@, is not currently connected", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)sendMessage:(id)a3 toDevices:(id)a4 timeout:(double)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, void *))a6;
  objc_msgSend(v11, "anyObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHTTPServerMessageTransport _clientConnectionForDevice:](self, "_clientConnectionForDevice:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = 60.0;
    if (a5 > 0.0)
      v16 = a5;
    objc_msgSend(v14, "sendMessage:timeout:completionHandler:", v10, v12, v16);
  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHTTPServerMessageTransport shortDescription](self, "shortDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v19;
      v24 = 2112;
      v25 = v20;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@[%@] Unable to send message to device, %@, the device is not currently connected", (uint8_t *)&v22, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 54, CFSTR("Communication Failure."), CFSTR("The device is not currently connected."), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v21);

    }
  }

}

- (id)_clientConnectionForDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDHTTPServerMessageTransport clientConnections](self, "clientConnections", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "device");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)__registerReceiveMessageHandler
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  id v11;
  id location;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF MATCHES 'GET'"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("path == '/receiveMessage'"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285A0]), "initWithMethodPredicate:URLPredicate:matchBlock:", v3, v4, 0);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __64__HMDHTTPServerMessageTransport___registerReceiveMessageHandler__block_invoke;
  v10 = &unk_1E89B2628;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "setRequestBlock:", &v7);
  -[HMDHTTPServerMessageTransport server](self, "server", v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerRequestHandler:", v5);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)__registerSendResponseHandler
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  id v11;
  id location;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF MATCHES 'PUT'"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("path == '/sendResponse'"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285A0]), "initWithMethodPredicate:URLPredicate:matchBlock:", v3, v4, 0);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __62__HMDHTTPServerMessageTransport___registerSendResponseHandler__block_invoke;
  v10 = &unk_1E89B2628;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "setRequestBlock:", &v7);
  -[HMDHTTPServerMessageTransport server](self, "server", v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerRequestHandler:", v5);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)__registerSendMessageHandler
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  id v11;
  id location;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF MATCHES 'POST'"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("path == '/sendMessage'"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285A0]), "initWithMethodPredicate:URLPredicate:matchBlock:", v3, v4, 0);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __61__HMDHTTPServerMessageTransport___registerSendMessageHandler__block_invoke;
  v10 = &unk_1E89B2628;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "setRequestBlock:", &v7);
  -[HMDHTTPServerMessageTransport server](self, "server", v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerRequestHandler:", v5);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)__registerPingHandler
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  id v11;
  id location;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF MATCHES 'GET'"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("path == '/ping'"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285A0]), "initWithMethodPredicate:URLPredicate:matchBlock:", v3, v4, 0);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __54__HMDHTTPServerMessageTransport___registerPingHandler__block_invoke;
  v10 = &unk_1E89B2628;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "setRequestBlock:", &v7);
  -[HMDHTTPServerMessageTransport server](self, "server", v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerRequestHandler:", v5);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)server:(id)a3 didStopWithError:(id)a4
{
  -[HMDHTTPServerMessageTransport _stopWithError:](self, "_stopWithError:", a4);
}

- (BOOL)server:(id)a3 shouldAcceptConnection:(id)a4
{
  return 1;
}

- (void)server:(id)a3 didOpenConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHTTPServerMessageTransport shortDescription](self, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Received new connection: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)server:(id)a3 didCloseConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HMDHTTPServerMessageTransport clientConnections](self, "clientConnections", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "connection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v7);

        if (v15)
        {
          v16 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDHTTPServerMessageTransport shortDescription](self, "shortDescription");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "device");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v26 = v18;
            v27 = 2112;
            v28 = v19;
            v29 = 2112;
            v30 = v7;
            v31 = 2112;
            v32 = v20;
            _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Removing closed connection, %@, from device: %@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v16);
          objc_msgSend(v13, "setConnection:", 0);
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[HMDHTTPServerMessageTransport clientConnections](self, "clientConnections", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "lostConnectionTimer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if (v13)
        {
          v14 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDHTTPServerMessageTransport shortDescription](self, "shortDescription");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v25 = v16;
            v26 = 2112;
            v27 = v17;
            v28 = 2112;
            v29 = v11;
            _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Removing unreachable client connection: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v14);
          -[HMDHTTPServerMessageTransport removeClientConnection:](self, "removeClientConnection:", v11);
          -[HMDHTTPServerMessageTransport delegate](self, "delegate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "device");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "server:didRemoveDevice:", self, v19);

          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHTTPServerMessageTransport debugDescription](self, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D27EE0]);

  -[HMDHTTPServerMessageTransport clientConnections](self, "clientConnections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "debugDescription", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("clientConnectionStates"));
  -[HMDHTTPServerMessageTransport server](self, "server");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dumpState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("server"));

  return v3;
}

- (HMFHTTPServer)server
{
  return self->_server;
}

- (HMDHTTPServerMessageTransportDelegate)delegate
{
  return (HMDHTTPServerMessageTransportDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
}

void __54__HMDHTTPServerMessageTransport___registerPingHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Received /ping request from connection: %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v5, "responseWithStatusCode:", 200);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(CFSTR("success"), "dataUsingEncoding:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBody:", v14);

  objc_msgSend(v6, "sendResponse:completionHandler:", v13, 0);
}

void __61__HMDHTTPServerMessageTransport___registerSendMessageHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  HMDHTTPDevice *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "shortDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v46 = v11;
    v47 = 2112;
    v48 = v12;
    v49 = 2112;
    v50 = v5;
    v51 = 2112;
    v52 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Received /sendMessage request, %@, from connection: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v9);
  v44 = 0;
  v13 = _validateClientRequest(v5, &v44);
  v14 = v44;
  if ((v13 & 1) != 0)
  {
    objc_msgSend(v5, "body");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length") == 0;

    if (v16)
    {
      v26 = (void *)MEMORY[0x1D17BA0A0]();
      v27 = WeakRetained;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "shortDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v29;
        v47 = 2112;
        v48 = v30;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Received invalid request body payload", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      objc_msgSend(v5, "responseWithStatusCode:", 400);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sendResponse:completionHandler:", v18, 0);
    }
    else
    {
      objc_msgSend(v5, "headerFields");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hmf_UUIDForKey:", CFSTR("Client-Identifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = -[HMDHTTPDevice initWithIdentifier:]([HMDHTTPDevice alloc], "initWithIdentifier:", v18);
      objc_msgSend(v5, "headerFields");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "hmf_stringForKey:", CFSTR("Protocol-Version"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithVersionString:", v20);
      else
        v21 = 0;

      v31 = (void *)MEMORY[0x1E0CB38B0];
      objc_msgSend(v5, "body");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "propertyListWithData:options:format:error:", v32, 0, 0, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v34 = v33;
      else
        v34 = 0;
      v35 = v34;

      objc_msgSend(WeakRetained, "delegate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __61__HMDHTTPServerMessageTransport___registerSendMessageHandler__block_invoke_140;
      v39[3] = &unk_1E89B2650;
      objc_copyWeak(&v43, v7);
      v37 = v21;
      v40 = v37;
      v41 = v5;
      v42 = v6;
      objc_msgSend(v36, "server:didReceiveMessage:fromDevice:completionHandler:", WeakRetained, v35, v38, v39);

      objc_destroyWeak(&v43);
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "shortDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v46 = v24;
      v47 = 2112;
      v48 = v25;
      v49 = 2112;
      v50 = v14;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@[%@] %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(v5, "responseWithStatusCode:", 400);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendResponse:completionHandler:", v18, 0);
  }

}

void __61__HMDHTTPServerMessageTransport___registerSendMessageHandler__block_invoke_140(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id WeakRetained;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (+[HMDHTTPMessageTransport protocolVersionSupportsExtendedMessages:](HMDHTTPMessageTransport, "protocolVersionSupportsExtendedMessages:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("p"));
    if (v6)
    {
      objc_msgSend(v6, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.HomeKit.Messaging.HTTP"));

      if (v9)
        v10 = objc_msgSend(v6, "code");
      else
        v10 = 200;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("s"));

    v11 = (id)objc_msgSend(v7, "copy");
    if (!v11)
      goto LABEL_15;
  }
  else
  {
    v11 = v5;
    if (!v11)
    {
LABEL_15:
      v12 = 0;
      v14 = 200;
      goto LABEL_16;
    }
  }
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v11, 100, 0, &v31);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v31;
  if (v12)
  {
    v14 = 200;
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "shortDescription");
      v29 = v15;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v17;
      v34 = 2112;
      v35 = v18;
      v36 = 2112;
      v37 = v13;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to serialize response message with error: %@", buf, 0x20u);

      v15 = v29;
    }

    objc_autoreleasePoolPop(v15);
    v14 = 400;
  }

LABEL_16:
  objc_msgSend(*(id *)(a1 + 40), "responseWithStatusCode:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  +[HMDHTTPMessageTransport protocolVersion](HMDHTTPMessageTransport, "protocolVersion");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "versionString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHeaderValue:forHeaderKey:", v23, CFSTR("Protocol-Version"));

  if (v14 == 200)
    v24 = objc_msgSend(v21, "setBody:", v12);
  v25 = (void *)MEMORY[0x1D17BA0A0](v24);
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "shortDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v33 = v27;
    v34 = 2112;
    v35 = v28;
    v36 = 2112;
    v37 = v21;
    _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Sending response: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v25);
  objc_msgSend(*(id *)(a1 + 48), "sendResponse:completionHandler:", v21, 0);

}

void __62__HMDHTTPServerMessageTransport___registerSendResponseHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  void *v19;
  id v20;
  void *v21;
  void *v22;
  char isKindOfClass;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  HMDHTTPDevice *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "shortDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v62 = v11;
    v63 = 2112;
    v64 = v12;
    v65 = 2112;
    v66 = v5;
    v67 = 2112;
    v68 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Received /sendResponse request, %@, from connection: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v9);
  v60 = 0;
  v13 = _validateClientRequest(v5, &v60);
  v14 = v60;
  if ((v13 & 1) == 0)
  {
    v28 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "shortDescription");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v62 = v30;
      v63 = 2112;
      v64 = v31;
      v65 = 2112;
      v66 = v14;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@[%@] %@", buf, 0x20u);

    }
    goto LABEL_20;
  }
  objc_msgSend(v5, "headerFields");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hmf_UUIDForKey:", CFSTR("Transaction-Identifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v28 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "shortDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v62 = v32;
      v63 = 2112;
      v64 = v33;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@[%@] Missing the message transaction identifier", buf, 0x16u);

    }
LABEL_20:

    objc_autoreleasePoolPop(v28);
    v18 = 0;
    v26 = 400;
LABEL_34:

    goto LABEL_35;
  }
  objc_msgSend(v5, "headerFields");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hmf_UUIDForKey:", CFSTR("Client-Identifier"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    v54 = -[HMDHTTPDevice initWithIdentifier:]([HMDHTTPDevice alloc], "initWithIdentifier:", v55);
    objc_msgSend(WeakRetained, "_clientConnectionForDevice:", v54);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "removeCompletionHandlerForTransactionIdentifier:", v16);
    v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "body");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v19, "length");

    if (v20)
    {
      v21 = (void *)MEMORY[0x1E0CB38B0];
      objc_msgSend(v5, "body");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = 0;
      objc_msgSend(v21, "propertyListWithData:options:format:error:", v22, 0, 0, &v59);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v59;

      if (v52)
      {
        v20 = v52;
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0)
          v24 = v20;
        else
          v24 = 0;
        v25 = v24;

        if ((isKindOfClass & 1) != 0)
        {

          goto LABEL_13;
        }
        v38 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "shortDescription");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v62 = v50;
          v63 = 2112;
          v64 = v48;
          v65 = 2112;
          v66 = v41;
          v42 = v38;
          v43 = v41;
          _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@[%@ Invalid message class type: %@", buf, 0x20u);

          v38 = v42;
        }
      }
      else
      {
        v38 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "shortDescription");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v62 = v49;
          v63 = 2112;
          v64 = v40;
          v65 = 2112;
          v66 = v51;
          _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to deserialize message payload with error: %@", buf, 0x20u);

        }
      }

      objc_autoreleasePoolPop(v38);
      v20 = 0;
      v26 = 400;
      v27 = v51;
      goto LABEL_30;
    }
LABEL_13:
    if (!v18)
    {
      v26 = 200;
LABEL_31:

      goto LABEL_32;
    }
    ((void (**)(_QWORD, id, _QWORD))v18)[2](v18, v20, 0);
    v26 = 200;
    v27 = v18;
    v18 = 0;
LABEL_30:

    goto LABEL_31;
  }
  v34 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "shortDescription");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v62 = v36;
    v63 = 2112;
    v64 = v37;
    _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@[%@] Missing the message client identifier", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v34);
  v18 = 0;
  v26 = 400;
LABEL_32:

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 54, CFSTR("Communication Failure"), CFSTR("The response message was invalid."), 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v18)[2](v18, 0, v14);
    goto LABEL_34;
  }
LABEL_35:
  objc_msgSend(v5, "responseWithStatusCode:", v26);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v44, "mutableCopy");

  objc_msgSend(CFSTR("Dummy Body"), "dataUsingEncoding:", 4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setBody:", v46);

  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __62__HMDHTTPServerMessageTransport___registerSendResponseHandler__block_invoke_135;
  v56[3] = &unk_1E89BF250;
  objc_copyWeak(&v58, v7);
  v47 = v5;
  v57 = v47;
  objc_msgSend(v6, "sendResponse:completionHandler:", v45, v56);

  objc_destroyWeak(&v58);
}

void __62__HMDHTTPServerMessageTransport___registerSendResponseHandler__block_invoke_135(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "shortDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v16 = 138544130;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v3;
      v11 = "%{public}@[%@] Failed to response to /sendResponse request, %@, with error: %@";
      v12 = v7;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 42;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v12, v13, v11, (uint8_t *)&v16, v14);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    v16 = 138543874;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v15;
    v11 = "%{public}@[%@] Successfully sent response to /sendResponse request: %@";
    v12 = v7;
    v13 = OS_LOG_TYPE_DEBUG;
    v14 = 32;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v5);
}

void __64__HMDHTTPServerMessageTransport___registerReceiveMessageHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  HMDHTTPDevice *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  HMDHTTPDevice *v13;
  void *v14;
  void *v15;
  HMDHTTPDevice *v16;
  _HMDHTTPServerClientConnection *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  HMDHTTPDevice *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v10;
    v31 = 2112;
    v32 = v11;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Received /receiveMessage request from connection: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v28 = 0;
  v12 = _validateClientRequest(v5, &v28);
  v13 = (HMDHTTPDevice *)v28;
  if ((v12 & 1) != 0)
  {
    objc_msgSend(v5, "headerFields");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hmf_UUIDForKey:", CFSTR("Client-Identifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = -[HMDHTTPDevice initWithIdentifier:]([HMDHTTPDevice alloc], "initWithIdentifier:", v15);
    objc_msgSend(WeakRetained, "_clientConnectionForDevice:", v16);
    v17 = (_HMDHTTPServerClientConnection *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v17 = -[_HMDHTTPServerClientConnection initWithDevice:]([_HMDHTTPServerClientConnection alloc], "initWithDevice:", v16);
      if (v17)
      {
        v18 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "shortDescription");
          v27 = v18;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v30 = v20;
          v31 = 2112;
          v32 = v21;
          v33 = 2112;
          v34 = v16;
          _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Received new connection from device: %@", buf, 0x20u);

          v18 = v27;
        }

        objc_autoreleasePoolPop(v18);
        -[_HMDHTTPServerClientConnection setConnection:](v17, "setConnection:", v6);
        objc_msgSend(WeakRetained, "addClientConnection:", v17);
        objc_msgSend(WeakRetained, "delegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "server:didAddDevice:", WeakRetained, v16);

      }
    }
    -[_HMDHTTPServerClientConnection setConnection:](v17, "setConnection:", v6, v27);
    -[_HMDHTTPServerClientConnection queueRequest:](v17, "queueRequest:", v5);

  }
  else
  {
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "shortDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v25;
      v31 = 2112;
      v32 = v26;
      v33 = 2112;
      v34 = v13;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@[%@] %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(v5, "responseWithStatusCode:", 400);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHTTPDevice sendResponse:completionHandler:](v6, "sendResponse:completionHandler:", v15, 0);
  }

}

uint64_t __65__HMDHTTPServerMessageTransport_confirmDevice_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

+ (id)maximumSupportedProtocolVersion
{
  if (maximumSupportedProtocolVersion_onceToken != -1)
    dispatch_once(&maximumSupportedProtocolVersion_onceToken, &__block_literal_global_101050);
  return (id)maximumSupportedProtocolVersion_maximumSupportedProtocolVersion;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

void __64__HMDHTTPServerMessageTransport_maximumSupportedProtocolVersion__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithMajorVersion:minorVersion:updateVersion:", 2, 0, 0);
  v1 = (void *)maximumSupportedProtocolVersion_maximumSupportedProtocolVersion;
  maximumSupportedProtocolVersion_maximumSupportedProtocolVersion = v0;

}

@end
