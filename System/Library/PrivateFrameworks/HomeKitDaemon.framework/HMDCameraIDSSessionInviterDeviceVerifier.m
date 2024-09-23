@implementation HMDCameraIDSSessionInviterDeviceVerifier

- (HMDCameraIDSSessionInviterDeviceVerifier)initWithSessionID:(id)a3 expectedInviter:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDCameraIDSSessionInviterDeviceVerifier *v10;
  HMDCameraIDSSessionInviterDeviceVerifier *v11;
  HMDCameraIDSSessionInviterDeviceVerifier *v13;
  SEL v14;
  id v15;
  objc_super v16;

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
    v13 = (HMDCameraIDSSessionInviterDeviceVerifier *)_HMFPreconditionFailure();
    return (HMDCameraIDSSessionInviterDeviceVerifier *)-[HMDCameraIDSSessionInviterDeviceVerifier canAcceptInvitationFromDeviceWithHandle:](v13, v14, v15);
  }
  v16.receiver = self;
  v16.super_class = (Class)HMDCameraIDSSessionInviterDeviceVerifier;
  v10 = -[HMDCameraIDSSessionInviterDeviceVerifier init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_sessionID, a3);
    objc_storeStrong((id *)&v11->_expectedInviter, a4);
  }

  return v11;
}

- (BOOL)canAcceptInvitationFromDeviceWithHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraIDSSessionInviterDeviceVerifier expectedInviter](self, "expectedInviter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "isEqual:", v4, (_QWORD)v12) & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (BOOL)canAcceptInvitationForSessionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HMDCameraIDSSessionInviterDeviceVerifier sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraIDSSessionInviterDeviceVerifier sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (HMDDevice)expectedInviter
{
  return (HMDDevice *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedInviter, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_90046 != -1)
    dispatch_once(&logCategory__hmf_once_t0_90046, &__block_literal_global_90047);
  return (id)logCategory__hmf_once_v1_90048;
}

void __55__HMDCameraIDSSessionInviterDeviceVerifier_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_90048;
  logCategory__hmf_once_v1_90048 = v0;

}

@end
