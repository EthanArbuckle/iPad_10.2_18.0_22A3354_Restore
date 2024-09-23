@implementation HMDCameraIDSSessionReceiver

- (HMDCameraIDSSessionReceiver)initWithSessionID:(id)a3 workQueue:(id)a4 sessionInviterDeviceVerifier:(id)a5 delegate:(id)a6 delegateQueue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  HMDCameraIDSSessionReceiver *v18;
  HMDCameraIDSSessionReceiver *v19;
  HMDCameraIDSSessionReceiver *v21;
  SEL v22;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v13)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v14)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v17 = v16;
  if (!v16)
  {
LABEL_11:
    v21 = (HMDCameraIDSSessionReceiver *)_HMFPreconditionFailure();
    return (HMDCameraIDSSessionReceiver *)-[HMDCameraIDSSessionReceiver session](v21, v22);
  }
  v23.receiver = self;
  v23.super_class = (Class)HMDCameraIDSSessionReceiver;
  v18 = -[HMDCameraIDSSessionHandler initWithSessionID:workQueue:](&v23, sel_initWithSessionID_workQueue_, v12, v13);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_delegate, v15);
    objc_storeStrong((id *)&v19->_delegateQueue, a7);
    objc_storeStrong((id *)&v19->_sessionInviterDeviceVerifier, a5);
  }

  return v19;
}

- (NSString)remoteDestination
{
  void *v2;
  void *v3;

  -[HMDCameraIDSSessionHandler idsSession](self, "idsSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)dealloc
{
  void *v3;
  HMDCameraIDSSessionReceiver *v4;
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
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@ is being deallocated", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraIDSSessionReceiver;
  -[HMDCameraIDSSessionHandler dealloc](&v7, sel_dealloc);
}

- (void)_callSessionSetup:(id)a3
{
  id v4;
  void *v5;
  HMDCameraIDSSessionReceiver *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  HMDCameraIDSSessionReceiver *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling didSetup delegate with error %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraIDSSessionReceiver delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraIDSSessionReceiver delegateQueue](v6, "delegateQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__HMDCameraIDSSessionReceiver__callSessionSetup___block_invoke;
    block[3] = &unk_24E79BBD0;
    v12 = v9;
    v13 = v6;
    v14 = v4;
    dispatch_async(v10, block);

  }
}

- (void)_callSessionEndedWithError:(id)a3
{
  id v4;
  void *v5;
  HMDCameraIDSSessionReceiver *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  HMDCameraIDSSessionReceiver *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling didEndSession delegate with error %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraIDSSessionReceiver delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraIDSSessionReceiver delegateQueue](v6, "delegateQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__HMDCameraIDSSessionReceiver__callSessionEndedWithError___block_invoke;
    block[3] = &unk_24E79BBD0;
    v12 = v9;
    v13 = v6;
    v14 = v4;
    dispatch_async(v10, block);

  }
}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  HMDCameraIDSSessionReceiver *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  HMDCameraIDSSessionReceiver *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  HMDCameraIDSSessionReceiver *v40;
  NSObject *v41;
  id v42;
  void *v43;
  void *v44;
  HMDCameraIDSSessionReceiver *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)MEMORY[0x227676638]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v55 = v20;
    v56 = 2112;
    v57 = v14;
    v58 = 2112;
    v59 = v15;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Received invitation for session %@ from %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v17);
  +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v33 = (void *)MEMORY[0x227676638]();
    v34 = v18;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v36;
      v56 = 2112;
      v57 = v15;
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Could not determine device handle for fromID: %@", buf, 0x16u);

    }
    goto LABEL_17;
  }
  -[HMDCameraIDSSessionReceiver sessionInviterDeviceVerifier](v18, "sessionInviterDeviceVerifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "canAcceptInvitationFromDeviceWithHandle:", v21);

  if ((v23 & 1) == 0)
  {
    v33 = (void *)MEMORY[0x227676638]();
    v34 = v18;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v38;
      v56 = 2112;
      v57 = v21;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Ignoring invitation from %@", buf, 0x16u);

    }
LABEL_17:

    objc_autoreleasePoolPop(v33);
    goto LABEL_26;
  }
  v24 = (void *)MEMORY[0x24BDD1620];
  getIDSSessionOptionsAllowedClasses();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  objc_msgSend(v24, "unarchivedObjectOfClasses:fromData:error:", v25, v16, &v53);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v53;

  if (v26)
  {
    v49 = v12;
    v50 = v13;
    v27 = v26;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v27;
    else
      v28 = 0;
    v29 = v28;

    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("kCameraSessionID"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraIDSSessionReceiver sessionInviterDeviceVerifier](v18, "sessionInviterDeviceVerifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "canAcceptInvitationForSessionWithIdentifier:", v30);

    if ((v32 & 1) != 0)
    {
      -[HMDCameraIDSSessionReceiver _receivedIDSSession:](v18, "_receivedIDSSession:", v14);
    }
    else
    {
      v44 = (void *)MEMORY[0x227676638]();
      v45 = v18;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v48 = v44;
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v55 = v47;
        v56 = 2112;
        v57 = v30;
        _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring invitation for camera session ID: %@", buf, 0x16u);

        v44 = v48;
      }

      objc_autoreleasePoolPop(v44);
    }

    v12 = v49;
    v13 = v50;
  }
  else
  {
    v39 = (void *)MEMORY[0x227676638]();
    v40 = v18;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v51 = v13;
      v42 = v12;
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v43;
      v56 = 2112;
      v57 = v52;
      _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive request id from context: %@", buf, 0x16u);

      v12 = v42;
      v13 = v51;
    }

    objc_autoreleasePoolPop(v39);
  }

LABEL_26:
}

- (void)_receivedIDSSession:(id)a3
{
  id v4;
  void *v5;
  HMDCameraIDSSessionReceiver *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDCameraIDSSessionReceiver *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDCameraIDSSessionReceiver *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = v8;
    v35 = 2112;
    v36 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received invitation for session %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraIDSSessionHandler setIdsSession:](v6, "setIdsSession:", v4);
  -[HMDCameraIDSSessionHandler idsSession](v6, "idsSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraIDSSessionHandler workQueue](v6, "workQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:queue:", v6, v10);

  +[HMDApplicationVendorIDStore sharedStore](HMDApplicationVendorIDStore, "sharedStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraIDSSessionHandler sessionID](v6, "sessionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hostProcessBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "machUUIDsForApplication:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDCameraIDSSessionHandler idsSession](v6, "idsSession");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *MEMORY[0x24BE4FB80];
    v32 = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPreferences:", v18);

  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v6;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraIDSSessionHandler sessionID](v20, "sessionID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v22;
      v35 = 2112;
      v36 = v23;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Could not find any mach UUIDs for session %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
  }
  v24 = (void *)MEMORY[0x227676638]();
  v25 = v6;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraIDSSessionHandler idsSession](v25, "idsSession");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = v27;
    v35 = 2112;
    v36 = v28;
    _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Accepting invitation for session %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
  -[HMDCameraIDSSessionHandler idsSession](v25, "idsSession");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "acceptInvitation");

  -[HMDCameraIDSSessionHandler sessionID](v25, "sessionID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "markMilestoneFor:", CFSTR("IDSSessionInvitationReceived"));

}

- (void)sessionStarted:(id)a3
{
  id v4;
  void *v5;
  HMDCameraIDSSessionReceiver *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Session %{public}@ has started", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraIDSSessionHandler sessionID](v6, "sessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "markMilestoneFor:", CFSTR("IDSSessionStartedOnReceiver"));

  -[HMDCameraIDSSessionReceiver _callSessionSetup:](v6, "_callSessionSetup:", 0);
}

- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMDCameraIDSSessionReceiver *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138544130;
      v21 = v14;
      v22 = 2112;
      v23 = v8;
      v24 = 1024;
      v25 = a4;
      v26 = 2112;
      v27 = v9;
      v15 = "%{public}@Session %@ has failed with reason: %u and error: %@";
      v16 = v13;
      v17 = OS_LOG_TYPE_ERROR;
      v18 = 38;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v16, v17, v15, (uint8_t *)&v20, v18);

    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543874;
    v21 = v14;
    v22 = 2112;
    v23 = v8;
    v24 = 1024;
    v25 = a4;
    v15 = "%{public}@Session %@ has ended with reason: %u";
    v16 = v13;
    v17 = OS_LOG_TYPE_INFO;
    v18 = 28;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v10);
  objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:underlyingError:", 1030, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraIDSSessionReceiver _callSessionEndedWithError:](v11, "_callSessionEndedWithError:", v19);

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

- (HMDCameraIDSSessionReceiverDelegate)delegate
{
  return (HMDCameraIDSSessionReceiverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (HMDCameraIDSSessionInviterDeviceVerifier)sessionInviterDeviceVerifier
{
  return self->_sessionInviterDeviceVerifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionInviterDeviceVerifier, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __58__HMDCameraIDSSessionReceiver__callSessionEndedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionReceiver:didEndSessionWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __49__HMDCameraIDSSessionReceiver__callSessionSetup___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionReceiver:didSetUpWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t15_181172 != -1)
    dispatch_once(&logCategory__hmf_once_t15_181172, &__block_literal_global_181173);
  return (id)logCategory__hmf_once_v16_181174;
}

void __42__HMDCameraIDSSessionReceiver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v16_181174;
  logCategory__hmf_once_v16_181174 = v0;

}

@end
