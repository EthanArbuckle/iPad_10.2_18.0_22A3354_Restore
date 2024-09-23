@implementation HMFMessageInternal

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_logEventSession, 0);
  objc_storeStrong((id *)&self->_messagePayload, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_destroyWeak((id *)&self->_transport);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setMessagePayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setQualityOfService:(int64_t)a3
{
  int64_t v3;
  void *v6;
  HMFMessageInternal *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 + 1) > 0x22 || ((1 << (a3 + 1)) & 0x404040401) == 0)
  {
    v6 = (void *)MEMORY[0x1A1AC355C](self, a2);
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2048;
      v13 = v3;
      _os_log_impl(&dword_19B546000, v8, OS_LOG_TYPE_INFO, "%{public}@Overriding unknown QoS '%tu' to NSQualityOfServiceDefault", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v3 = -1;
  }
  self->_qualityOfService = v3;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    -[HMFMessageInternal identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copyWithZone:", a3);
    v8 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = v7;

    -[HMFMessageInternal name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v10;

    -[HMFMessageInternal timeout](self, "timeout");
    *(_QWORD *)(v5 + 24) = v12;
    *(_QWORD *)(v5 + 32) = -[HMFMessageInternal qualityOfService](self, "qualityOfService");
    -[HMFMessageInternal destination](self, "destination");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v13;

    -[HMFMessageInternal transport](self, "transport");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)(v5 + 48), v15);

    -[HMFMessageInternal activity](self, "activity");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v16;

    -[HMFMessageInternal userInfo](self, "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copyWithZone:", a3);
    v20 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v19;

    -[HMFMessageInternal headers](self, "headers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copyWithZone:", a3);
    v23 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v22;

    -[HMFMessageInternal messagePayload](self, "messagePayload");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copyWithZone:", a3);
    v26 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v25;

    -[HMFMessageInternal logEventSession](self, "logEventSession");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v27;

    -[HMFMessageInternal responseHandler](self, "responseHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "copyWithZone:", a3);
    v31 = *(void **)(v5 + 96);
    *(_QWORD *)(v5 + 96) = v30;

  }
  return (id)v5;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HMFMessageTransport)transport
{
  return (HMFMessageTransport *)objc_loadWeakRetained((id *)&self->_transport);
}

- (HMFMessageDestination)destination
{
  return self->_destination;
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (NSDictionary)messagePayload
{
  return self->_messagePayload;
}

- (HMFMessageInternal)init
{
  HMFMessageInternal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMFMessageInternal;
  result = -[HMFMessageInternal init](&v3, sel_init);
  if (result)
    result->_qualityOfService = -1;
  return result;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (double)timeout
{
  return self->_timeout;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (HMFActivity)activity
{
  return self->_activity;
}

- (HMFLogEventSession)logEventSession
{
  return self->_logEventSession;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setTransport:(id)a3
{
  objc_storeWeak((id *)&self->_transport, a3);
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (void)setLogEventSession:(id)a3
{
  objc_storeStrong((id *)&self->_logEventSession, a3);
}

@end
