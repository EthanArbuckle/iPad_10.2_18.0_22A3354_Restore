@implementation HMDDataStreamStreamProtocol

- (HMDDataStreamStreamProtocol)initWithDataStream:(id)a3
{
  id v4;
  HMDDataStreamStreamProtocol *v5;
  uint64_t v6;
  NSMapTable *sockets;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDDataStreamStreamProtocol;
  v5 = -[HMDDataStreamStreamProtocol init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    sockets = v5->_sockets;
    v5->_sockets = (NSMapTable *)v6;

    objc_storeWeak((id *)&v5->_dataStream, v4);
  }

  return v5;
}

- (void)registerSocket:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = -[HMDDataStreamStreamProtocol isActive](self, "isActive");
  -[HMDDataStreamStreamProtocol sockets](self, "sockets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationProtocolName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "closeWithError:", v8);

  -[HMDDataStreamStreamProtocol sockets](self, "sockets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationProtocolName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v4, v10);

  -[HMDDataStreamStreamProtocol _notifyActiveStatusChangedFromPreviousValue:](self, "_notifyActiveStatusChangedFromPreviousValue:", v5);
}

- (void)unregisterSocket:(id)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = -[HMDDataStreamStreamProtocol isActive](self, "isActive");
  -[HMDDataStreamStreamProtocol sockets](self, "sockets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applicationProtocolName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v10)
  {
    -[HMDDataStreamStreamProtocol sockets](self, "sockets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applicationProtocolName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v9);

    -[HMDDataStreamStreamProtocol _notifyActiveStatusChangedFromPreviousValue:](self, "_notifyActiveStatusChangedFromPreviousValue:", v4);
    -[HMDDataStreamStreamProtocol _reevaluateTrafficClassForDataStream](self, "_reevaluateTrafficClassForDataStream");
  }

}

- (void)_reevaluateTrafficClassForDataStream
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  HMDDataStreamStreamProtocol *v15;
  NSObject *v16;
  void *v17;
  HMDDataStreamStreamProtocol *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[NSMapTable objectEnumerator](self->_sockets, "objectEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "trafficClass");
        if (v11 > v7)
        {
          v12 = v11;
          objc_msgSend(v10, "applicationProtocolName");
          v13 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v13;
          v7 = v12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v5);

    if (v6)
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v26 = v17;
        v27 = 2048;
        v28 = v7;
        v29 = 2112;
        v30 = v6;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Setting data stream's traffic class to %lu (requested by: '%@')", buf, 0x20u);

      }
      goto LABEL_17;
    }
  }
  else
  {

    v7 = 0;
  }
  v14 = (void *)MEMORY[0x227676638]();
  v18 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v19;
    v27 = 2048;
    v28 = v7;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Setting data stream's traffic class to %lu (reset)", buf, 0x16u);

  }
  v6 = 0;
LABEL_17:

  objc_autoreleasePoolPop(v14);
  -[HMDDataStreamStreamProtocol dataStream](self, "dataStream");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTrafficClass:", v7);

}

- (void)_notifyActiveStatusChangedFromPreviousValue:(BOOL)a3
{
  void *v4;
  HMDDataStreamStreamProtocol *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[HMDDataStreamStreamProtocol isActive](self, "isActive") != a3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDataStreamStreamProtocol isActive](v5, "isActive");
      HMFBooleanToString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Stream protocol changes active to %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDDataStreamStreamProtocol dataStream](v5, "dataStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "protocolDidUpdateActiveStatus:", v5);

  }
}

- (void)sendData:(id)a3 socket:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HMDDataStreamStreamProtocol dataStream](self, "dataStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applicationProtocolName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = CFSTR("data");
  v18[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __58__HMDDataStreamStreamProtocol_sendData_socket_completion___block_invoke;
  v15[3] = &unk_24E79A050;
  v16 = v8;
  v14 = v8;
  objc_msgSend(v11, "sendEventForProtocol:topic:payload:completion:", CFSTR("stream"), v12, v13, v15);

}

- (BOOL)isActive
{
  void *v2;
  BOOL v3;

  -[HMDDataStreamStreamProtocol sockets](self, "sockets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)dataStreamInitiatedClose:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HMDDataStreamStreamProtocol sockets](self, "sockets", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "closeInitiated");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)dataStreamDidClose:(id)a3
{
  -[HMDDataStreamStreamProtocol _closeAllSocketsWithError:](self, "_closeAllSocketsWithError:", 0);
}

- (void)dataStream:(id)a3 didFailWithError:(id)a4
{
  -[HMDDataStreamStreamProtocol _closeAllSocketsWithError:](self, "_closeAllSocketsWithError:", a4);
}

- (void)dataStream:(id)a3 didReceiveEvent:(id)a4 header:(id)a5 payload:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDDataStreamStreamProtocol *v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDDataStreamStreamProtocol sockets](self, "sockets");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v21;
      v27 = 2112;
      v28 = v11;
      v29 = 2112;
      v30 = v13;
      v22 = "%{public}@No active socket, dropping packet with topic=%@ payload=%@";
      v23 = v20;
      v24 = OS_LOG_TYPE_DEBUG;
LABEL_8:
      _os_log_impl(&dword_2218F0000, v23, v24, v22, (uint8_t *)&v25, 0x20u);

    }
LABEL_9:

    objc_autoreleasePoolPop(v18);
    goto LABEL_10;
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("data"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v21;
      v27 = 2112;
      v28 = v11;
      v29 = 2112;
      v30 = v13;
      v22 = "%{public}@No data field in payload, dropping packet with topic=%@ payload=%@";
      v23 = v20;
      v24 = OS_LOG_TYPE_ERROR;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("data"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleIncomingData:", v17);

LABEL_10:
}

- (void)dataStream:(id)a3 didReceiveRequest:(id)a4 header:(id)a5 payload:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDDataStreamStreamProtocol *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138544130;
    v19 = v17;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v13;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Stream protocol does not support request message with topic=%@, header=%@, payload=%@", (uint8_t *)&v18, 0x2Au);

  }
  objc_autoreleasePoolPop(v14);

}

- (void)dataStream:(id)a3 didReceiveResponse:(id)a4 header:(id)a5 payload:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDDataStreamStreamProtocol *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138544130;
    v19 = v17;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v13;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Stream protocol does not support response message with topic=%@, header=%@, payload=%@", (uint8_t *)&v18, 0x2Au);

  }
  objc_autoreleasePoolPop(v14);

}

- (void)_closeAllSocketsWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
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
  -[HMDDataStreamStreamProtocol sockets](self, "sockets", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        if (v11)
          objc_msgSend(v11, "closeWithError:", v4);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[HMDDataStreamStreamProtocol sockets](self, "sockets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

}

- (NSMapTable)sockets
{
  return (NSMapTable *)objc_getProperty(self, a2, 8, 1);
}

- (HMDDataStreamProtocolDelegate)dataStream
{
  return (HMDDataStreamProtocolDelegate *)objc_loadWeakRetained((id *)&self->_dataStream);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataStream);
  objc_storeStrong((id *)&self->_sockets, 0);
}

uint64_t __58__HMDDataStreamStreamProtocol_sendData_socket_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)protocolName
{
  __CFString *v2;

  v2 = CFSTR("stream");
  return CFSTR("stream");
}

@end
