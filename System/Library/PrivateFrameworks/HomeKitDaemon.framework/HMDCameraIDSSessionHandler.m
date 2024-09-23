@implementation HMDCameraIDSSessionHandler

- (HMDCameraIDSSessionHandler)initWithSessionID:(id)a3 workQueue:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDCameraIDSSessionHandler *v10;
  HMDCameraIDSSessionHandler *v11;
  void *v12;
  uint64_t v13;
  HMDIDSService *idsStreamService;
  HMDCameraIDSSessionHandler *result;
  HMDCameraIDSSessionHandler *v16;
  SEL v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v16 = (HMDCameraIDSSessionHandler *)_HMFPreconditionFailure();
    -[HMDCameraIDSSessionHandler dealloc](v16, v17);
    return result;
  }
  v18.receiver = self;
  v18.super_class = (Class)HMDCameraIDSSessionHandler;
  v10 = -[HMDCameraIDSSessionHandler init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_workQueue, a4);
    objc_storeStrong((id *)&v11->_sessionID, a3);
    +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "streamService");
    v13 = objc_claimAutoreleasedReturnValue();
    idsStreamService = v11->_idsStreamService;
    v11->_idsStreamService = (HMDIDSService *)v13;

    -[HMDIDSService addDelegate:queue:](v11->_idsStreamService, "addDelegate:queue:", v11, v11->_workQueue);
  }

  return v11;
}

- (void)dealloc
{
  void *v3;
  HMDCameraIDSSessionHandler *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting the IDS session handler", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[IDSSession endSession](v4->_idsSession, "endSession");
  -[HMDIDSService removeDelegate:](v4->_idsStreamService, "removeDelegate:", v4);
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraIDSSessionHandler;
  -[HMDCameraIDSSessionHandler dealloc](&v7, sel_dealloc);
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraIDSSessionHandler sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDCameraStreamSessionID)sessionID
{
  return self->_sessionID;
}

- (HMDIDSService)idsStreamService
{
  return self->_idsStreamService;
}

- (IDSSession)idsSession
{
  return self->_idsSession;
}

- (void)setIdsSession:(id)a3
{
  objc_storeStrong((id *)&self->_idsSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsSession, 0);
  objc_storeStrong((id *)&self->_idsStreamService, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_143116 != -1)
    dispatch_once(&logCategory__hmf_once_t1_143116, &__block_literal_global_143117);
  return (id)logCategory__hmf_once_v2_143118;
}

void __41__HMDCameraIDSSessionHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_143118;
  logCategory__hmf_once_v2_143118 = v0;

}

@end
