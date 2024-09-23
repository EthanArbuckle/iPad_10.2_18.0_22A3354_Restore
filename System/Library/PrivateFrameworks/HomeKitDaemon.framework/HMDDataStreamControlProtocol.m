@implementation HMDDataStreamControlProtocol

- (HMDDataStreamControlProtocol)initWithLogIdentifier:(id)a3
{
  id v4;
  HMDDataStreamControlProtocol *v5;
  HMDDataStreamControlProtocol *v6;
  NSNumber *pendingHelloMessageIdentifier;
  uint64_t v8;
  NSString *logIdentifier;
  NSNumber *peerDataStreamProtocolVersion;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDDataStreamControlProtocol;
  v5 = -[HMDDataStreamControlProtocol init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    pendingHelloMessageIdentifier = v5->_pendingHelloMessageIdentifier;
    v5->_pendingHelloMessageIdentifier = 0;

    *(_WORD *)&v6->_helloMessageResponseReceived = 0;
    v8 = objc_msgSend(v4, "copy");
    logIdentifier = v6->_logIdentifier;
    v6->_logIdentifier = (NSString *)v8;

    peerDataStreamProtocolVersion = v6->_peerDataStreamProtocolVersion;
    v6->_peerDataStreamProtocolVersion = (NSNumber *)&unk_24E971518;

  }
  return v6;
}

- (BOOL)isActive
{
  return 1;
}

- (void)dataStreamDidOpen:(id)a3
{
  id v4;
  void *v5;
  HMDDataStreamControlProtocol *v6;
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
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending hello control message", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDDataStreamControlProtocol _sendHelloMessageOnDataStream:](v6, "_sendHelloMessageOnDataStream:", v4);

}

- (void)dataStream:(id)a3 didReceiveRequest:(id)a4 header:(id)a5 payload:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDDataStreamControlProtocol *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  HMDDataStreamControlProtocol *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSNumber *peerDataStreamProtocolVersion;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v11, "isEqual:", CFSTR("hello")))
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543362;
      v30 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Hello control message received", (uint8_t *)&v29, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(v10, "sendResponseForRequestHeader:payload:status:completion:", v12, MEMORY[0x24BDBD1B8], 0, &__block_literal_global_248733);
  }
  else
  {
    v18 = objc_msgSend(v11, "isEqual:", CFSTR("version"));
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v18)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543362;
        v30 = v23;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Version control message received", (uint8_t *)&v29, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      objc_msgSend(v13, "objectForKey:", CFSTR("version"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(v13, "objectForKey:", CFSTR("version"));
        v25 = objc_claimAutoreleasedReturnValue();
        peerDataStreamProtocolVersion = v20->_peerDataStreamProtocolVersion;
        v20->_peerDataStreamProtocolVersion = (NSNumber *)v25;

      }
      v33 = CFSTR("version");
      v34[0] = &unk_24E971478;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sendResponseForRequestHeader:payload:status:completion:", v12, v27, 0, &__block_literal_global_2_248735);

    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543618;
        v30 = v28;
        v31 = 2112;
        v32 = v11;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Control Protocol received unexpected request '%@'", (uint8_t *)&v29, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
    }
  }

}

- (BOOL)isExpectedHelloControlMessage:(id)a3 header:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;

  v6 = a4;
  if (!objc_msgSend(a3, "isEqual:", CFSTR("hello")))
    goto LABEL_5;
  -[HMDDataStreamControlProtocol pendingHelloMessageIdentifier](self, "pendingHelloMessageIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDataStreamControlProtocol pendingHelloMessageIdentifier](self, "pendingHelloMessageIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("status"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", &unk_24E96D628);

  }
  else
  {
LABEL_5:
    v12 = 0;
  }

  return v12;
}

- (void)dataStream:(id)a3 didReceiveResponse:(id)a4 header:(id)a5 payload:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDDataStreamControlProtocol *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  HMDDataStreamControlProtocol *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSNumber *peerDataStreamProtocolVersion;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[HMDDataStreamControlProtocol isExpectedHelloControlMessage:header:](self, "isExpectedHelloControlMessage:header:", v11, v12))
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543362;
      v30 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Hello control message reply received", (uint8_t *)&v29, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    if (!-[HMDDataStreamControlProtocol helloMessageResponseReceived](v15, "helloMessageResponseReceived"))
    {
      objc_msgSend(v13, "objectForKey:", CFSTR("capability-version"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        -[HMDDataStreamControlProtocol _sendVersionRequestOnDataStream:](v15, "_sendVersionRequestOnDataStream:", v10);
      else
        v15->_controlHandshakeComplete = 1;
    }
    -[HMDDataStreamControlProtocol setHelloMessageResponseReceived:](v15, "setHelloMessageResponseReceived:", 1);
    -[HMDDataStreamControlProtocol setPendingHelloMessageIdentifier:](v15, "setPendingHelloMessageIdentifier:", 0);
  }
  else
  {
    v19 = objc_msgSend(v11, "isEqual:", CFSTR("version"));
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
    if (v19)
    {
      if (v23)
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543618;
        v30 = v24;
        v31 = 2112;
        v32 = v13;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Received Peer Request Version Response %@", (uint8_t *)&v29, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(v13, "objectForKey:", CFSTR("version"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v13, "objectForKey:", CFSTR("version"));
        v26 = objc_claimAutoreleasedReturnValue();
        peerDataStreamProtocolVersion = v21->_peerDataStreamProtocolVersion;
        v21->_peerDataStreamProtocolVersion = (NSNumber *)v26;

      }
      v21->_controlHandshakeComplete = 1;
    }
    else
    {
      if (v23)
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543362;
        v30 = v28;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Expected hello reply or Version but got something else", (uint8_t *)&v29, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
    }
  }

}

- (void)_sendHelloMessageOnDataStream:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  v5 = HMFRandomUInt32();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", v5);
  -[HMDDataStreamControlProtocol setPendingHelloMessageIdentifier:](self, "setPendingHelloMessageIdentifier:", v6);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__HMDDataStreamControlProtocol__sendHelloMessageOnDataStream___block_invoke;
  v7[3] = &unk_24E79BD80;
  v7[4] = self;
  objc_msgSend(v4, "sendRequestForProtocol:topic:identifier:payload:completion:", CFSTR("control"), CFSTR("hello"), v5, MEMORY[0x24BDBD1B8], v7);

}

- (void)_sendVersionRequestOnDataStream:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = HMFRandomUInt32();
  v8 = CFSTR("version");
  v9[0] = &unk_24E971478;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__HMDDataStreamControlProtocol__sendVersionRequestOnDataStream___block_invoke;
  v7[3] = &unk_24E79BD80;
  v7[4] = self;
  objc_msgSend(v4, "sendRequestForProtocol:topic:identifier:payload:completion:", CFSTR("control"), CFSTR("version"), v5, v6, v7);

}

- (BOOL)helloMessageResponseReceived
{
  return self->_helloMessageResponseReceived;
}

- (void)setHelloMessageResponseReceived:(BOOL)a3
{
  self->_helloMessageResponseReceived = a3;
}

- (NSNumber)peerDataStreamProtocolVersion
{
  return self->_peerDataStreamProtocolVersion;
}

- (void)setPeerDataStreamProtocolVersion:(id)a3
{
  objc_storeStrong((id *)&self->_peerDataStreamProtocolVersion, a3);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)pendingHelloMessageIdentifier
{
  return self->_pendingHelloMessageIdentifier;
}

- (void)setPendingHelloMessageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pendingHelloMessageIdentifier, a3);
}

- (BOOL)controlHandshakeComplete
{
  return self->_controlHandshakeComplete;
}

- (void)setControlHandshakeComplete:(BOOL)a3
{
  self->_controlHandshakeComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingHelloMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_peerDataStreamProtocolVersion, 0);
}

void __64__HMDDataStreamControlProtocol__sendVersionRequestOnDataStream___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to send version control message (%@)", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __62__HMDDataStreamControlProtocol__sendHelloMessageOnDataStream___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to send hello control message (%@)", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

@end
