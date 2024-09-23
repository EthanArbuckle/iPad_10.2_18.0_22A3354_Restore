@implementation HMDSiriRemoteInputServer

- (HMDSiriRemoteInputServer)initWithQueue:(id)a3
{
  NSObject *v5;
  HMDSiriRemoteInputServer *v6;
  HMDSiriRemoteInputServer *v7;
  xpc_connection_t mach_service;
  OS_xpc_object *xpcServer;
  OS_xpc_object *xpcConnection;
  uint64_t v11;
  NSHashTable *siriSessions;
  _xpc_connection_s *v13;
  HMDSiriRemoteInputServer *v14;
  _xpc_connection_s *v15;
  uint32_t v16;
  uint32_t v17;
  uint32_t v18;
  uint32_t v19;
  uint32_t v21;
  uint32_t v22;
  _QWORD handler[4];
  HMDSiriRemoteInputServer *v24;
  objc_super v25;
  uint8_t buf[4];
  uint32_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HMDSiriRemoteInputServer;
  v6 = -[HMDSiriRemoteInputServer init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    mach_service = xpc_connection_create_mach_service("com.apple.homekit.audio.xpc", v5, 1uLL);
    xpcServer = v7->_xpcServer;
    v7->_xpcServer = mach_service;

    xpcConnection = v7->_xpcConnection;
    v7->_xpcConnection = 0;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    siriSessions = v7->_siriSessions;
    v7->_siriSessions = (NSHashTable *)v11;

    -[HMDSiriRemoteInputServer xpcServer](v7, "xpcServer");
    v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __42__HMDSiriRemoteInputServer_initWithQueue___block_invoke;
    handler[3] = &unk_24E785EC8;
    v14 = v7;
    v24 = v14;
    xpc_connection_set_event_handler(v13, handler);

    -[HMDSiriRemoteInputServer xpcServer](v14, "xpcServer");
    v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_resume(v15);

    if (xpcServerNotifyToken == -1)
    {
      v21 = notify_register_check("com.apple.homekit.audio.running", &xpcServerNotifyToken);
      if (v21)
      {
        v22 = v21;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v27 = v22;
          _os_log_impl(&dword_2218F0000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[Siri Server] Notify: failed to retrieve token (%d)", buf, 8u);
        }
      }
    }
    v16 = notify_set_state(xpcServerNotifyToken, 1uLL);
    if (v16)
    {
      v17 = v16;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v27 = v17;
        _os_log_impl(&dword_2218F0000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[Siri Server] Notify: failed to set state to ready (%d)", buf, 8u);
      }
    }
    v18 = notify_post("com.apple.homekit.audio.running");
    if (v18)
    {
      v19 = v18;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v27 = v19;
        _os_log_impl(&dword_2218F0000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[Siri Server] Notify: failed to post (%d)", buf, 8u);
      }
    }

  }
  return v7;
}

- (void)dealloc
{
  uint32_t v3;
  uint32_t v4;
  uint32_t v5;
  uint32_t v6;
  objc_super v7;
  uint8_t buf[4];
  uint32_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = notify_set_state(xpcServerNotifyToken, 0);
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v9 = v4;
      _os_log_impl(&dword_2218F0000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[Siri Server] Notify: failed to set state to stopped (%d)", buf, 8u);
    }
  }
  v5 = notify_post("com.apple.homekit.audio.running");
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v9 = v6;
      _os_log_impl(&dword_2218F0000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[Siri Server] Notify: failed to post (%d)", buf, 8u);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)HMDSiriRemoteInputServer;
  -[HMDSiriRemoteInputServer dealloc](&v7, sel_dealloc);
}

- (BOOL)registerSiriSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDSiriRemoteInputServer *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSiriRemoteInputServer sessionForIdentifier:](self, "sessionForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Session with identifier %@ already exists!", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v13;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Registering session %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v4, "setServer:", v8);
    -[HMDSiriRemoteInputServer siriSessions](v8, "siriSessions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v4);

    objc_msgSend(v4, "publish");
  }

  return v6 == 0;
}

- (void)deregisterSiriSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDSiriRemoteInputServer *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSiriRemoteInputServer sessionForIdentifier:](self, "sessionForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Deregistering session %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v4, "invalidate");
    -[HMDSiriRemoteInputServer siriSessions](v8, "siriSessions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v4);

    objc_msgSend(v4, "setServer:", 0);
  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Session deregistration with identifier %@ but was not registered!", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void)invalidate
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HMDSiriRemoteInputServer siriSessions](self, "siriSessions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSiriRemoteInputServer setSiriSessions:](self, "setSiriSessions:", v4);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[HMDSiriRemoteInputServer deregisterSiriSession:](self, "deregisterSiriSession:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)handleServerEvent:(id)a3
{
  id v4;
  void *v5;
  HMDSiriRemoteInputServer *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (MEMORY[0x227677370]() == MEMORY[0x24BDACF88])
  {
    -[HMDSiriRemoteInputServer handleConnection:](self, "handleConnection:", v4);
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unexpected Siri XPC server event: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }

}

- (void)handleConnection:(id)a3
{
  _xpc_connection_s *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDSiriRemoteInputServer *v8;
  NSObject *v9;
  void *v10;
  _xpc_connection_s *v11;
  _xpc_connection_s *v12;
  _xpc_connection_s *v13;
  NSObject *v14;
  _xpc_connection_s *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  HMDSiriRemoteInputServer *v22;
  NSObject *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD handler[5];
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  _xpc_connection_s *v34;
  __int16 v35;
  _xpc_connection_s *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = (_xpc_connection_s *)a3;
  v5 = (void *)xpc_connection_copy_entitlement_value();
  v6 = v5;
  if (v5 && xpc_BOOL_get_value(v5))
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v10;
      v33 = 2048;
      v34 = v4;
      v35 = 2112;
      v36 = v4;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Siri received incoming XPC connection: %p %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDSiriRemoteInputServer xpcServer](v8, "xpcServer");
    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_suspend(v11);

    -[HMDSiriRemoteInputServer setXpcConnection:](v8, "setXpcConnection:", v4);
    -[HMDSiriRemoteInputServer xpcConnection](v8, "xpcConnection");
    v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __45__HMDSiriRemoteInputServer_handleConnection___block_invoke;
    handler[3] = &unk_24E785EC8;
    handler[4] = v8;
    xpc_connection_set_event_handler(v12, handler);

    -[HMDSiriRemoteInputServer xpcConnection](v8, "xpcConnection");
    v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    -[HMDSiriRemoteInputServer queue](v8, "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    xpc_connection_set_target_queue(v13, v14);

    -[HMDSiriRemoteInputServer xpcConnection](v8, "xpcConnection");
    v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_resume(v15);

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[HMDSiriRemoteInputServer siriSessions](v8, "siriSessions", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v26;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v20++), "publish");
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v18);
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v24;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Siri received incoming XPC connection but was not entitled; closing.",
        buf,
        0xCu);

    }
    objc_autoreleasePoolPop(v21);
    xpc_connection_cancel(v4);
  }

}

- (void)handleDisconnection
{
  void *v3;
  HMDSiriRemoteInputServer *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _xpc_connection_s *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSiriRemoteInputServer xpcConnection](v4, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Siri received disconnect on XPC connection: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDSiriRemoteInputServer siriSessions](v4, "siriSessions", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "handleResetStream");
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  -[HMDSiriRemoteInputServer setXpcConnection:](v4, "setXpcConnection:", 0);
  -[HMDSiriRemoteInputServer xpcServer](v4, "xpcServer");
  v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_resume(v13);

}

- (void)handleConnectionEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  HMDSiriRemoteInputServer *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = MEMORY[0x227677370]();
  if (v5 != MEMORY[0x24BDACFA0])
  {
    if (v5 == MEMORY[0x24BDACFB8])
    {
      if (v4 == (id)MEMORY[0x24BDACF38])
      {
        -[HMDSiriRemoteInputServer handleDisconnection](self, "handleDisconnection");
        goto LABEL_11;
      }
      v6 = (void *)MEMORY[0x227676638]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v4;
      v10 = "%{public}@Siri XPC connection error: %@";
    }
    else
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_10:

        objc_autoreleasePoolPop(v6);
        goto LABEL_11;
      }
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v4;
      v10 = "%{public}@Unexpected Siri XPC connection event: %@";
    }
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v11, 0x16u);

    goto LABEL_10;
  }
  -[HMDSiriRemoteInputServer handleMsg:](self, "handleMsg:", v4);
LABEL_11:

}

- (void)handleMsg:(id)a3
{
  id v4;
  void *v5;
  HMDSiriRemoteInputServer *v6;
  NSObject *v7;
  void *v8;
  char *v9;
  const char *string;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  HMDSiriRemoteInputServer *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSiriRemoteInputServer xpcConnection](v6, "xpcConnection");
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v8;
    v21 = 2048;
    v22 = v9;
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received Siri XPC message to %p: %@", (uint8_t *)&v19, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  string = xpc_dictionary_get_string(v4, "kMsgId");
  xpc_dictionary_get_value(v4, "kMsgArgs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (!strcmp(string, "CheckIn"))
  {
    -[HMDSiriRemoteInputServer handleCheckInMsg:](v6, "handleCheckInMsg:", v14);
  }
  else if (!strcmp(string, "StartStream"))
  {
    -[HMDSiriRemoteInputServer handleStartStreamMsg:args:](v6, "handleStartStreamMsg:args:", v4, v14);
  }
  else if (!strcmp(string, "StopStream"))
  {
    -[HMDSiriRemoteInputServer handleStopStreamMsg:](v6, "handleStopStreamMsg:", v14);
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v6;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v18;
      v21 = 2080;
      v22 = string;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unexpected message: '%s'", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)sendMsgIfCheckedIn:(id)a3 args:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDSiriRemoteInputServer *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDSiriRemoteInputServer xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDSiriRemoteInputServer sendMsg:args:](self, "sendMsg:args:", v6, v7);
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Cannot send; no XPC client is checked in yet",
        (uint8_t *)&v13,
        0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)sendMsg:(id)a3 args:(id)a4
{
  id v6;
  id v7;
  xpc_object_t v8;
  id v9;
  void *v10;
  void *v11;
  HMDSiriRemoteInputServer *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _xpc_connection_s *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  xpc_object_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = xpc_dictionary_create(0, 0, 0);
  v9 = objc_retainAutorelease(v6);
  xpc_dictionary_set_string(v8, "kMsgId", (const char *)objc_msgSend(v9, "UTF8String"));
  if (v7)
  {
    v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(v8, "kMsgArgs", v10);

  }
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSiriRemoteInputServer xpcConnection](v12, "xpcConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v14;
    v19 = 2048;
    v20 = v15;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Sending Siri XPC message to %p: %@", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDSiriRemoteInputServer xpcConnection](v12, "xpcConnection");
  v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v16, v8);

}

- (void)handleCheckInMsg:(id)a3
{
  id v4;
  void *v5;
  HMDSiriRemoteInputServer *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Siri checked in", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)handleStartStreamMsg:(id)a3 args:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("kMsgArgIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  -[HMDSiriRemoteInputServer sessionForIdentifier:](self, "sessionForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "handleStartStream");
    objc_msgSend(v9, "setBoostMessage:", v10);
  }

}

- (void)handleStopStreamMsg:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kMsgArgIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  -[HMDSiriRemoteInputServer sessionForIdentifier:](self, "sessionForIdentifier:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v8)
  {
    objc_msgSend(v8, "handleStopStream");
    v7 = v8;
  }

}

- (id)sessionForIdentifier:(id)a3
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

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDSiriRemoteInputServer siriSessions](self, "siriSessions", 0);
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
        objc_msgSend(v9, "identifier");
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

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_xpc_object)xpcServer
{
  return self->_xpcServer;
}

- (void)setXpcServer:(id)a3
{
  objc_storeStrong((id *)&self->_xpcServer, a3);
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (NSHashTable)siriSessions
{
  return self->_siriSessions;
}

- (void)setSiriSessions:(id)a3
{
  objc_storeStrong((id *)&self->_siriSessions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriSessions, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_xpcServer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __45__HMDSiriRemoteInputServer_handleConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleConnectionEvent:", a2);
}

uint64_t __42__HMDSiriRemoteInputServer_initWithQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleServerEvent:", a2);
}

@end
