@implementation HMDRemoteSendMessageOperation

- (HMDRemoteSendMessageOperation)initWithMessage:(id)a3 transport:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char isKindOfClass;
  id v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  HMDRemoteSendMessageOperation *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDRemoteSendMessageOperation *v21;
  HMDRemoteSendMessageOperation *v22;
  id *p_isa;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "destination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "destination");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v19;
      v28 = 2112;
      v29 = v20;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Invalid message destination: %@", buf, 0x16u);

LABEL_12:
    }
LABEL_13:

    objc_autoreleasePoolPop(v16);
    v21 = 0;
    goto LABEL_18;
  }
  if (!v8)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Invalid transport", buf, 0xCu);
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v11 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_msgSend(v13, "timeout");
  if (v14 <= 0.0)
    v15 = 65.0;
  else
    objc_msgSend(v13, "timeout");
  v25.receiver = self;
  v25.super_class = (Class)HMDRemoteSendMessageOperation;
  v22 = -[HMFOperation initWithTimeout:](&v25, sel_initWithTimeout_, v15);
  p_isa = (id *)&v22->super.super.super.isa;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_message, a3);
    objc_storeWeak(p_isa + 41, v8);
  }
  v17 = p_isa;

  v21 = v17;
LABEL_18:

  return v21;
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
  -[HMDRemoteSendMessageOperation message](self, "message");
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
  -[HMDRemoteSendMessageOperation message](self, "message");
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

- (void)_respondWithError:(id)a3 playload:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (-[HMDRemoteSendMessageOperation isMessageResponseHandled](self, "isMessageResponseHandled"))
  {
    v8 = 0;
  }
  else
  {
    -[HMDRemoteSendMessageOperation setMessageResponseHandled:](self, "setMessageResponseHandled:", 1);
    -[HMDRemoteSendMessageOperation message](self, "message");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v8, "respondWithPayload:error:", v6, v9);

}

- (void)main
{
  void *v3;
  HMDRemoteSendMessageOperation *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDRemoteSendMessageOperation *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteSendMessageOperation message](v4, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteSendMessageOperation message](v4, "message");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "destination");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting sending message %@ to destination: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDRemoteSendMessageOperation transport](v4, "transport");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v4;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine secure transport", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteSendMessageOperation cancelWithError:](v12, "cancelWithError:", v15);

  }
  objc_initWeak((id *)buf, v4);
  -[HMDRemoteSendMessageOperation message](v4, "message");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __37__HMDRemoteSendMessageOperation_main__block_invoke;
  v18[3] = &unk_24E798E20;
  objc_copyWeak(&v19, (id *)buf);
  objc_msgSend(v17, "setResponseHandler:", v18);
  objc_msgSend(v10, "sendMessage:completionHandler:", v17, 0);
  objc_destroyWeak(&v19);

  objc_destroyWeak((id *)buf);
}

- (void)cancelWithError:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[HMDRemoteSendMessageOperation _respondWithError:playload:](self, "_respondWithError:playload:", v4, 0);
  v5.receiver = self;
  v5.super_class = (Class)HMDRemoteSendMessageOperation;
  -[HMFOperation cancelWithError:](&v5, sel_cancelWithError_, v4);

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

- (HMFMessage)message
{
  return (HMFMessage *)objc_getProperty(self, a2, 320, 1);
}

- (HMDSecureRemoteMessageTransport)transport
{
  return (HMDSecureRemoteMessageTransport *)objc_loadWeakRetained((id *)&self->_transport);
}

- (BOOL)isMessageResponseHandled
{
  return self->_messageResponseHandled;
}

- (void)setMessageResponseHandled:(BOOL)a3
{
  self->_messageResponseHandled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transport);
  objc_storeStrong((id *)&self->_message, 0);
}

void __37__HMDRemoteSendMessageOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isCancelled"))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Operation is already cancelled, do not process response handler", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = WeakRetained;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v5)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v16;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to send message", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(v13, "cancelWithError:", v5);
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v17;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Successfully sent message", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(v13, "finish");
    }
    objc_msgSend(v13, "_respondWithError:playload:", v5, v6);
  }

}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_66808 != -1)
    dispatch_once(&logCategory__hmf_once_t9_66808, &__block_literal_global_66809);
  return (id)logCategory__hmf_once_v10_66810;
}

void __44__HMDRemoteSendMessageOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10_66810;
  logCategory__hmf_once_v10_66810 = v0;

}

@end
