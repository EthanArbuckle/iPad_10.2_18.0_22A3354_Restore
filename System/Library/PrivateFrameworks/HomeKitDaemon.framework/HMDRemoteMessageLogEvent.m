@implementation HMDRemoteMessageLogEvent

- (HMDRemoteMessageLogEvent)initWithMessageName:(id)a3 identifier:(id)a4 transactionIdentifier:(id)a5 messageType:(int64_t)a6 peerInformation:(id)a7 secure:(BOOL)a8 transportType:(int)a9 sending:(BOOL)a10 messageQoS:(int64_t)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  HMDRemoteMessageLogEvent *v22;
  HMDRemoteMessageLogEvent *v23;
  uint64_t v24;
  NSString *msgIdentifier;
  uint64_t v26;
  NSString *transactionIdentifier;
  objc_super v29;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HMDRemoteMessageLogEvent;
  v22 = -[HMMLogEvent init](&v29, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_transportType = a9;
    v22->_sending = a10;
    objc_msgSend(v19, "UUIDString");
    v24 = objc_claimAutoreleasedReturnValue();
    msgIdentifier = v23->_msgIdentifier;
    v23->_msgIdentifier = (NSString *)v24;

    objc_msgSend(v20, "UUIDString");
    v26 = objc_claimAutoreleasedReturnValue();
    transactionIdentifier = v23->_transactionIdentifier;
    v23->_transactionIdentifier = (NSString *)v26;

    v23->_secure = a8;
    objc_storeStrong((id *)&v23->_msgName, a3);
    v23->_msgType = a6;
    objc_storeStrong((id *)&v23->_peerInformation, a7);
    v23->_msgQoS = a11;
  }

  return v23;
}

- (int)transportType
{
  return self->_transportType;
}

- (BOOL)sending
{
  return self->_sending;
}

- (NSString)msgIdentifier
{
  return self->_msgIdentifier;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (BOOL)secure
{
  return self->_secure;
}

- (NSString)msgName
{
  return self->_msgName;
}

- (int64_t)msgType
{
  return self->_msgType;
}

- (NSString)peerInformation
{
  return self->_peerInformation;
}

- (int64_t)msgQoS
{
  return self->_msgQoS;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerInformation, 0);
  objc_storeStrong((id *)&self->_msgName, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_msgIdentifier, 0);
}

+ (id)peerInformationForDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "productInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productClass");
  HMFProductClassToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unable to map productClass for device %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

+ (id)peerInformationForRemoteMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  __CFString *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  unsigned __int8 isKindOfClass;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    v10 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Unable to get peer information for multiple remote device destination", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v13 = CFSTR("MultipleRemoteDevices");
  }
  else
  {
    v14 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    if (v16)
    {
      objc_msgSend(v16, "device");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDRemoteMessageLogEvent peerInformationForDevice:](HMDRemoteMessageLogEvent, "peerInformationForDevice:", v17);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = v14;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & (v18 != 0)) != 0)
        v13 = CFSTR("RemoteAccountHandle");
      else
        v13 = 0;
    }

  }
  return v13;
}

+ (id)newFromRemoteMessage:(id)a3 device:(id)a4 transportType:(int)a5 sending:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;

  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "attributedMessageName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v10, "name");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  if (objc_msgSend(v15, "isEqualToString:", CFSTR("HMDHomeCHIPSendRemoteRequestMessage")))
  {
    objc_msgSend(v10, "messagePayload");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("HMDHomeCHIPRequestMessageKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x24BE4F090]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Remote Matter: %@"), v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v19;
    }

  }
  if (v11)
    objc_msgSend(a1, "peerInformationForDevice:", v11);
  else
    objc_msgSend(a1, "peerInformationForRemoteMessage:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc((Class)a1);
  objc_msgSend(v10, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transactionIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE4(v26) = a6;
  LODWORD(v26) = a5;
  v24 = (void *)objc_msgSend(v21, "initWithMessageName:identifier:transactionIdentifier:messageType:peerInformation:secure:transportType:sending:messageQoS:", v15, v22, v23, objc_msgSend(v10, "type"), v20, objc_msgSend(v10, "isSecure"), v26, objc_msgSend(v10, "qualityOfService"));

  return v24;
}

+ (id)receivedRemoteMessage:(id)a3 transportType:(int)a4
{
  return (id)objc_msgSend(a1, "newFromRemoteMessage:device:transportType:sending:", a3, 0, *(_QWORD *)&a4, 0);
}

+ (id)sentRemoteMessage:(id)a3 device:(id)a4 transportType:(int)a5
{
  return (id)objc_msgSend(a1, "newFromRemoteMessage:device:transportType:sending:", a3, a4, *(_QWORD *)&a5, 1);
}

+ (id)sentRemoteMessage:(id)a3 transportType:(int)a4
{
  return (id)objc_msgSend(a1, "newFromRemoteMessage:device:transportType:sending:", a3, 0, *(_QWORD *)&a4, 1);
}

+ (id)sentRemoteMessageName:(id)a3 identifier:(id)a4 transactionIdentifier:(id)a5 messageType:(int64_t)a6 peerInformation:(id)a7 secure:(BOOL)a8 transportType:(int)a9 messageQoS:(int64_t)a10
{
  _BOOL8 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v22;

  v10 = a8;
  v16 = a7;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  BYTE4(v22) = 1;
  LODWORD(v22) = a9;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMessageName:identifier:transactionIdentifier:messageType:peerInformation:secure:transportType:sending:messageQoS:", v19, v18, v17, a6, v16, v10, v22, a10);

  return v20;
}

+ (id)receivedRemoteMessageName:(id)a3 identifier:(id)a4 transactionIdentifier:(id)a5 messageType:(int64_t)a6 peerInformation:(id)a7 secure:(BOOL)a8 transportType:(int)a9 messageQoS:(int64_t)a10
{
  _BOOL8 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v22;

  v10 = a8;
  v16 = a7;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  BYTE4(v22) = 0;
  LODWORD(v22) = a9;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMessageName:identifier:transactionIdentifier:messageType:peerInformation:secure:transportType:sending:messageQoS:", v19, v18, v17, a6, v16, v10, v22, a10);

  return v20;
}

@end
