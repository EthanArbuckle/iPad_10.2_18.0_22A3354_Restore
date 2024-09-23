@implementation HMDSnapshotSession

- (HMDSnapshotSession)initWithSessionID:(id)a3 accessory:(id)a4 snapshotGetter:(id)a5 message:(id)a6 waitPeriod:(double)a7 streamingTierType:(unint64_t)a8 cameraLocallyReachable:(BOOL)a9 snapshotForNotification:(BOOL)a10
{
  _BOOL8 v10;
  id v18;
  id v19;
  id v20;
  id v21;
  HMDSnapshotSession *v22;
  HMDSnapshotSession *v23;
  void *v24;
  uint64_t v25;
  NSMutableArray *sessionMessages;
  HMDSnapshotCompletionTimer *v27;
  HMDSnapshotCompletionTimer *snapshotCompletionTimer;
  HMDCameraSnapshotMetrics *v29;
  HMDCameraSnapshotMetrics *snapshotMetrics;
  objc_super v32;
  _QWORD v33[2];

  v10 = a9;
  v33[1] = *MEMORY[0x24BDAC8D0];
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v32.receiver = self;
  v32.super_class = (Class)HMDSnapshotSession;
  v22 = -[HMDSnapshotSession init](&v32, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_sessionID, a3);
    objc_storeStrong((id *)&v23->_snapshotGetter, a5);
    v33[0] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "mutableCopy");
    sessionMessages = v23->_sessionMessages;
    v23->_sessionMessages = (NSMutableArray *)v25;

    v27 = -[HMDSnapshotCompletionTimer initWithSnapshotSession:timer:]([HMDSnapshotCompletionTimer alloc], "initWithSnapshotSession:timer:", v23, a7);
    snapshotCompletionTimer = v23->_snapshotCompletionTimer;
    v23->_snapshotCompletionTimer = v27;

    v23->_streamingTierType = a8;
    v29 = -[HMDCameraSnapshotMetrics initWithSessionID:cameraAccessory:isLocal:snapshotForNotification:]([HMDCameraSnapshotMetrics alloc], "initWithSessionID:cameraAccessory:isLocal:snapshotForNotification:", v18, v19, v10, a10);
    snapshotMetrics = v23->_snapshotMetrics;
    v23->_snapshotMetrics = v29;

  }
  return v23;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDSnapshotSession sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1039);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSnapshotSession respond:payload:](self, "respond:payload:", v3, 0);

  v4.receiver = self;
  v4.super_class = (Class)HMDSnapshotSession;
  -[HMDSnapshotSession dealloc](&v4, sel_dealloc);
}

- (void)respond:(id)a3 payload:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  HMDSnapshotSession *v17;
  NSObject *v18;
  uint64_t v19;
  HMDSnapshotSession *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  void *v26;
  uint64_t v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v29 = a4;
  -[HMDSnapshotSession sessionMessages](self, "sessionMessages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[HMDSnapshotSession sessionID](self, "sessionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "markMilestoneFor:", CFSTR("SentSnapshotResponse"));

    -[HMDSnapshotSession snapshotMetrics](self, "snapshotMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setError:", v6);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[HMDSnapshotSession sessionMessages](self, "sessionMessages");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v31;
      do
      {
        v14 = 0;
        v27 = v12;
        do
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v14);
          v16 = (void *)MEMORY[0x227676638]();
          v17 = self;
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v19 = v13;
            v20 = self;
            v21 = v6;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringForKey:", CFSTR("kCameraSessionID"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v35 = v22;
            v36 = 2112;
            v37 = v23;
            v38 = 2112;
            v39 = v21;
            v40 = 2112;
            v41 = v29;
            _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Responding to %@ with error %@ payload %@", buf, 0x2Au);

            v6 = v21;
            self = v20;
            v13 = v19;
            v12 = v27;
          }

          objc_autoreleasePoolPop(v16);
          objc_msgSend(v15, "responseHandler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend(v15, "responseHandler");
            v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, id, id))v25)[2](v25, v6, v29);

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      }
      while (v12);
    }

    -[HMDSnapshotSession sessionMessages](self, "sessionMessages");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeAllObjects");

  }
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMDSnapshotSession sessionID](self, "sessionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("ID %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (HMDCameraSnapshotSessionID)sessionID
{
  return self->_sessionID;
}

- (HMDCameraGetSnapshotProtocol)snapshotGetter
{
  return self->_snapshotGetter;
}

- (HMDSnapshotCompletionTimer)snapshotCompletionTimer
{
  return self->_snapshotCompletionTimer;
}

- (NSMutableArray)sessionMessages
{
  return self->_sessionMessages;
}

- (unint64_t)streamingTierType
{
  return self->_streamingTierType;
}

- (HMDCameraSnapshotMetrics)snapshotMetrics
{
  return self->_snapshotMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotMetrics, 0);
  objc_storeStrong((id *)&self->_sessionMessages, 0);
  objc_storeStrong((id *)&self->_snapshotCompletionTimer, 0);
  objc_storeStrong((id *)&self->_snapshotGetter, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_158555 != -1)
    dispatch_once(&logCategory__hmf_once_t0_158555, &__block_literal_global_158556);
  return (id)logCategory__hmf_once_v1_158557;
}

void __33__HMDSnapshotSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_158557;
  logCategory__hmf_once_v1_158557 = v0;

}

@end
