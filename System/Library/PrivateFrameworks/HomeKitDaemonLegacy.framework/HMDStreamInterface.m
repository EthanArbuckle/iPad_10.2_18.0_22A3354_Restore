@implementation HMDStreamInterface

- (HMDStreamInterface)initWithSessionID:(id)a3 workQueue:(id)a4 delegateQueue:(id)a5 sessionHandler:(id)a6 localRTPSocket:(int)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMDStreamInterface *v17;
  HMDStreamInterface *v18;
  id socketCloseHandler;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMDStreamInterface;
  v17 = -[HMDStreamInterface init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v17->_sessionID, a3);
    objc_storeStrong((id *)&v18->_workQueue, a4);
    objc_storeStrong((id *)&v18->_delegateQueue, a5);
    objc_storeStrong((id *)&v18->_sessionHandler, a6);
    v18->_localRTPSocket = a7;
    v18->_state = 1;
    socketCloseHandler = v18->_socketCloseHandler;
    v18->_socketCloseHandler = &__block_literal_global_53844;

  }
  return v18;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDStreamInterface sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_localRTPSocket != -1)
    (*((void (**)(void))self->_socketCloseHandler + 2))();
  v3.receiver = self;
  v3.super_class = (Class)HMDStreamInterface;
  -[HMDStreamInterface dealloc](&v3, sel_dealloc);
}

- (unint64_t)state
{
  os_unfair_lock_s *p_lock;
  unint64_t state;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)setStreamInterfaceState:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_state = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)loadMiscFields:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HMDStreamInterface *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDStreamInterface *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDStreamInterface sessionHandler](self, "sessionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EFA9A3E8))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = (void *)objc_opt_class();
    v9 = objc_msgSend(v7, "remoteVideoSocket");
    objc_msgSend(v8, "extractNetworkConfig:peerNameExtractor:", v9, MEMORY[0x1E0C83748]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ipAddress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v14;
      v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@IDSDevice connection: Peer IP address: %@\n", (uint8_t *)&v29, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = v12;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "rtpPort");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v19;
      v31 = 2112;
      v32 = v20;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@IDSDevice connection: Peer port      : %@\n", (uint8_t *)&v29, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(v10, "ipAddress");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteAddress");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setIp:", v21);

    objc_msgSend(v10, "rtpPort");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v22) = objc_msgSend(v23, "unsignedIntegerValue");
    objc_msgSend(v4, "remoteAddress");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setPort:", (unsigned __int16)v22);

    v25 = objc_msgSend(v10, "ipv6");
    objc_msgSend(v4, "remoteAddress");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setIsIPv6:", v25);

    objc_msgSend(v10, "rtpPort");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRtcpRemotePort:", objc_msgSend(v27, "unsignedShortValue"));

  }
  return 1;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (HMDCameraStreamSessionID)sessionID
{
  return (HMDCameraStreamSessionID *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (HMDCameraRemoteStreamProtocol)sessionHandler
{
  return (HMDCameraRemoteStreamProtocol *)objc_getProperty(self, a2, 48, 1);
}

- (int)localRTPSocket
{
  return self->_localRTPSocket;
}

- (id)socketCloseHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setSocketCloseHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_socketCloseHandler, 0);
  objc_storeStrong((id *)&self->_sessionHandler, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

uint64_t __94__HMDStreamInterface_initWithSessionID_workQueue_delegateQueue_sessionHandler_localRTPSocket___block_invoke(int a1, int a2)
{
  return close(a2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_53861 != -1)
    dispatch_once(&logCategory__hmf_once_t0_53861, &__block_literal_global_9_53862);
  return (id)logCategory__hmf_once_v1_53863;
}

+ (int)openSocketWithNetworkConfig:(id)a3
{
  char *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  int v22;
  int v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  if (objc_msgSend(v4, "ipv6"))
  {
    v5 = (void *)socket(30, 2, 0);
    if ((v5 & 0x80000000) == 0)
    {
      v6 = v5;
      v24 = 1;
      setsockopt((int)v5, 0xFFFF, 512, &v24, 4u);
      v24 = 3200000;
      setsockopt((int)v6, 0xFFFF, 4098, &v24, 4u);
      if (bind((int)v6, (const sockaddr *)(v4 + 36), 0x1Cu) < 0)
      {
        v6 = (void *)MEMORY[0x1D17BA0A0]();
        v7 = a1;
        HMFGetOSLogHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          goto LABEL_16;
        goto LABEL_18;
      }
      goto LABEL_8;
    }
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = a1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_18;
LABEL_14:
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v18;
    v19 = "%{public}@cannot create socket";
    v20 = v8;
    v21 = 12;
LABEL_17:
    _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, v19, buf, v21);

    goto LABEL_18;
  }
  v9 = (void *)socket(2, 2, 0);
  if ((v9 & 0x80000000) != 0)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = a1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_18;
    goto LABEL_14;
  }
  v6 = v9;
  v24 = 1;
  setsockopt((int)v9, 0xFFFF, 512, &v24, 4u);
  v24 = 3200000;
  setsockopt((int)v6, 0xFFFF, 4098, &v24, 4u);
  if (bind((int)v6, (const sockaddr *)(v4 + 8), 0x10u) < 0)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = a1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_16:
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *__error();
      *(_DWORD *)buf = 138543618;
      v26 = v18;
      v27 = 1024;
      LODWORD(v28) = v22;
      v19 = "%{public}@bind failed %d";
      v20 = v8;
      v21 = 18;
      goto LABEL_17;
    }
LABEL_18:

    objc_autoreleasePoolPop(v6);
    LODWORD(v6) = -1;
    goto LABEL_19;
  }
LABEL_8:
  objc_msgSend(a1, "extractNetworkConfig:peerNameExtractor:", v6, MEMORY[0x1E0C83810]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rtpPort");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRtpPort:", v11);

  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = a1;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ipAddress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rtpPort");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = v15;
    v27 = 2112;
    v28 = v16;
    v29 = 2112;
    v30 = v17;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Opened socket at address %@ and port %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v12);

LABEL_19:
  return (int)v6;
}

+ (id)extractNetworkConfig:(int)a3 peerNameExtractor:(void *)a4
{
  uint64_t v5;
  HMDCameraNetworkConfig *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  HMDCameraNetworkConfig *v14;
  void *v15;
  void *v16;
  int v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  int v22;
  char v23[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  int v29;
  _WORD v30[68];
  uint64_t v31;

  v5 = *(_QWORD *)&a3;
  v31 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(HMDCameraNetworkConfig);
  memset(v30, 0, 128);
  v29 = 0;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  *(_OWORD *)v23 = 0u;
  v24 = 0u;
  v18 = 128;
  if ((((uint64_t (*)(uint64_t, _WORD *, int *))a4)(v5, v30, &v18) & 0x80000000) != 0)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = a1;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *__error();
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      v21 = 1024;
      v22 = v13;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Failed to get the peer name %d", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v9);
    v14 = 0;
  }
  else
  {
    v8 = bswap32(v30[1]) >> 16;
    if (HIBYTE(v30[0]) == 2)
    {
      inet_ntop(2, &v30[2], v23, 0x64u);
    }
    else
    {
      inet_ntop(30, &v30[4], v23, 0x64u);
      -[HMDCameraNetworkConfig setIpv6:](v7, "setIpv6:", 1);
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraNetworkConfig setIpAddress:](v7, "setIpAddress:", v15);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraNetworkConfig setRtpPort:](v7, "setRtpPort:", v16);

    v14 = v7;
  }

  return v14;
}

void __33__HMDStreamInterface_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_53863;
  logCategory__hmf_once_v1_53863 = v0;

}

@end
