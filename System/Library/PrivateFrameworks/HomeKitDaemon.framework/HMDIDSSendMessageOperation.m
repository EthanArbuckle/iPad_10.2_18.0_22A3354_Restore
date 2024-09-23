@implementation HMDIDSSendMessageOperation

- (HMDIDSSendMessageOperation)initWithMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDIDSSendMessageOperation *v7;

  v4 = a3;
  +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDIDSSendMessageOperation initWithMessage:service:](self, "initWithMessage:service:", v4, v6);

  return v7;
}

- (HMDIDSSendMessageOperation)initWithMessage:(id)a3 service:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char isKindOfClass;
  id v11;
  void *v12;
  __objc2_class *v13;
  double v14;
  __objc2_class *v15;
  double v16;
  double v17;
  HMDIDSSendMessageOperation *v18;
  HMDIDSSendMessageOperation *v19;
  uint64_t v20;
  HMDRemoteMessageDestination *destination;
  HMDIDSService *service;
  void *v23;
  HMDIDSSendMessageOperation *v24;
  HMDIDSSendMessageOperation *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "destination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v26 = (void *)MEMORY[0x227676638]();
    v24 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "destination");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v28;
      v34 = 2112;
      v35 = v29;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Invalid message destination: %@", buf, 0x16u);

LABEL_16:
    }
LABEL_17:

    objc_autoreleasePoolPop(v26);
    v25 = 0;
    goto LABEL_18;
  }
  if (!v8)
  {
    v26 = (void *)MEMORY[0x227676638]();
    v24 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v28;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Invalid service", buf, 0xCu);
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v11 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  -[__objc2_class timeout](v13, "timeout");
  if (v14 <= 0.0)
    v15 = HMDIDSSendMessageOperation;
  else
    v15 = v13;
  -[__objc2_class timeout](v15, "timeout");
  v17 = v16;
  v31.receiver = self;
  v31.super_class = (Class)HMDIDSSendMessageOperation;
  v18 = -[HMFOperation initWithTimeout:](&v31, sel_initWithTimeout_);
  v19 = v18;
  if (v18)
  {
    v18->_timeout = v17;
    objc_storeStrong((id *)&v18->_message, a3);
    objc_msgSend(v11, "destination");
    v20 = objc_claimAutoreleasedReturnValue();
    destination = v19->_destination;
    v19->_destination = (HMDRemoteMessageDestination *)v20;

    objc_storeStrong((id *)&v19->_service, a4);
    service = v19->_service;
    -[HMFOperation underlyingQueue](v19, "underlyingQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDIDSService addDelegate:queue:](service, "addDelegate:queue:", v19, v23);

  }
  v24 = v19;

  v25 = v24;
LABEL_18:

  return v25;
}

- (NSString)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDIDSSendMessageOperation message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, Message = %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)privateDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDIDSSendMessageOperation message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "privateDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, Message = %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSArray)attributeDescriptions
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F140]), "initWithName:value:options:formatter:", CFSTR("Message"), self->_message, 1, 0);
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)main
{
  void *v3;
  HMDIDSSendMessageOperation *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  HMDRemoteMessageDestination *v13;
  HMDRemoteMessageDestination *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDIDSService *service;
  void *v19;
  char v20;
  HMDRemoteMessageDestination *v21;
  HMDRemoteMessageDestination *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDIDSSendMessageOperation *v26;
  NSObject *v27;
  void *v28;
  NSString *v29;
  void *messageIdentifier;
  void *v31;
  HMDIDSSendMessageOperation *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  HMDIDSSendMessageOperation *v36;
  NSObject *v37;
  void *v38;
  HMDRemoteMessageDestination *destination;
  void *v40;
  void *v41;
  void *v42;
  HMDIDSSendMessageOperation *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  HMDRemoteMessageDestination *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v54 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDIDSSendMessageOperation message](v4, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDIDSSendMessageOperation message](v4, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSecureRemote");
  +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessageTransport remoteMessageFromMessage:secure:accountRegistry:](HMDRemoteMessageTransport, "remoteMessageFromMessage:secure:accountRegistry:", v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setResponseRestriction:", 1);
  v50 = 0;
  +[HMDRemoteMessageSerialization dictionaryForMessage:isHH2Payload:error:](HMDRemoteMessageSerialization, "dictionaryForMessage:isHH2Payload:error:", v11, 1, &v50);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (HMDRemoteMessageDestination *)v50;
  v14 = v13;
  if (v12)
  {

    v51 = *MEMORY[0x24BE4FB30];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4->_timeout);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
    v14 = (HMDRemoteMessageDestination *)objc_claimAutoreleasedReturnValue();

    +[HMDRemoteDestinationFormatter defaultFormatter](HMDRemoteDestinationFormatter, "defaultFormatter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringForObjectValue:", v4->_destination);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      service = v4->_service;
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0;
      v49 = 0;
      v20 = -[HMDIDSService sendMessage:toDestinations:priority:options:identifier:error:](service, "sendMessage:toDestinations:priority:options:identifier:error:", v12, v19, 300, v14, &v49, &v48);
      v21 = (HMDRemoteMessageDestination *)v49;
      v22 = (HMDRemoteMessageDestination *)v48;

      if ((v20 & 1) != 0)
      {
        +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDRemoteMessageLogEvent sentRemoteMessage:transportType:](HMDRemoteMessageLogEvent, "sentRemoteMessage:transportType:", v11, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "submitLogEvent:", v24);

        v25 = (void *)MEMORY[0x227676638]();
        v26 = v4;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v54 = v28;
          v55 = 2112;
          v56 = v21;
          _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Sent message with identifier: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v25);
        v29 = v21;
        messageIdentifier = v26->_messageIdentifier;
        v26->_messageIdentifier = v29;
      }
      else
      {
        v42 = (void *)MEMORY[0x227676638]();
        v43 = v4;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v54 = v45;
          v55 = 2112;
          v56 = v22;
          _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@Failed to send message with error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v42);
        v46 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:underlyingError:", 3203, v22);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "hmErrorWithCode:description:reason:suggestion:underlyingError:", 54, 0, 0, 0, v47);
        messageIdentifier = (void *)objc_claimAutoreleasedReturnValue();

        -[HMFOperation cancelWithError:](v43, "cancelWithError:", messageIdentifier);
      }

    }
    else
    {
      v35 = (void *)MEMORY[0x227676638]();
      v36 = v4;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        destination = v4->_destination;
        *(_DWORD *)buf = 138543618;
        v54 = v38;
        v55 = 2112;
        v56 = destination;
        _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate destination for: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v35);
      v40 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 3203);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "hmErrorWithCode:description:reason:suggestion:underlyingError:", 54, 0, CFSTR("Failed to generate destination."), 0, v41);
      v22 = (HMDRemoteMessageDestination *)objc_claimAutoreleasedReturnValue();

      -[HMFOperation cancelWithError:](v36, "cancelWithError:", v22);
    }

  }
  else
  {
    v31 = (void *)MEMORY[0x227676638]();
    v32 = v4;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v34;
      v55 = 2112;
      v56 = v14;
      _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize message with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v31);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:underlyingError:", -1, 0, 0, 0, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFOperation cancelWithError:](v32, "cancelWithError:", v17);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMFMessage identifier](self->_message, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  HMDIDSSendMessageOperation *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v10 = a6;
  v32 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (-[HMFOperation isExecuting](self, "isExecuting")
    && -[NSString isEqualToString:](self->_messageIdentifier, "isEqualToString:", v16))
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v10)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543362;
        v29 = v23;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Successfully sent message", (uint8_t *)&v28, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      -[HMFOperation finish](v20, "finish");
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543618;
        v29 = v24;
        v30 = 2112;
        v31 = v17;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send message with error: %@", (uint8_t *)&v28, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      v25 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:underlyingError:", 3203, v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "hmErrorWithCode:description:reason:suggestion:underlyingError:", 54, 0, 0, 0, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMFOperation cancelWithError:](v20, "cancelWithError:", v27);
    }
  }

}

- (HMDIDSService)service
{
  return (HMDIDSService *)objc_getProperty(self, a2, 336, 1);
}

- (HMFMessage)message
{
  return (HMFMessage *)objc_getProperty(self, a2, 344, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

+ (double)timeout
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("defaultIDSMessageTimeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "numberValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

  }
  else
  {
    v7 = 65.0;
  }

  return v7;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_61427 != -1)
    dispatch_once(&logCategory__hmf_once_t8_61427, &__block_literal_global_61428);
  return (id)logCategory__hmf_once_v9_61429;
}

void __41__HMDIDSSendMessageOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v9_61429;
  logCategory__hmf_once_v9_61429 = v0;

}

@end
