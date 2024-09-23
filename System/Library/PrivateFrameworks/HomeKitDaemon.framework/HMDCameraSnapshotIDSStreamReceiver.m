@implementation HMDCameraSnapshotIDSStreamReceiver

- (HMDCameraSnapshotIDSStreamReceiver)initWithSessionID:(id)a3 workQueue:(id)a4 snapshotFile:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 remoteDevice:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  HMDCameraSnapshotIDSStreamReceiver *v23;
  HMDCameraSnapshotIDSStreamReceiver *v25;
  SEL v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v15)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v16)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v18)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v20 = v19;
  if (v19)
  {
    +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "proxyService");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HMDCameraSnapshotIDSStreamReceiver initWithSessionID:workQueue:proxyService:snapshotFile:delegate:delegateQueue:remoteDevice:](self, "initWithSessionID:workQueue:proxyService:snapshotFile:delegate:delegateQueue:remoteDevice:", v14, v15, v22, v16, v17, v18, v20);

    return v23;
  }
LABEL_11:
  v25 = (HMDCameraSnapshotIDSStreamReceiver *)_HMFPreconditionFailure();
  return -[HMDCameraSnapshotIDSStreamReceiver initWithSessionID:workQueue:proxyService:snapshotFile:delegate:delegateQueue:remoteDevice:](v25, v26, v27, v28, v29, v30, v31, v32, v33);
}

- (HMDCameraSnapshotIDSStreamReceiver)initWithSessionID:(id)a3 workQueue:(id)a4 proxyService:(id)a5 snapshotFile:(id)a6 delegate:(id)a7 delegateQueue:(id)a8 remoteDevice:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  HMDCameraSnapshotIDSStreamReceiver *v23;
  HMDCameraSnapshotIDSStreamReceiver *v24;
  HMDCameraSnapshotIDSStreamReceiver *result;
  HMDCameraSnapshotIDSStreamReceiver *v26;
  SEL v27;
  objc_super v28;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v16)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v17)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v18)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v20)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  v22 = v21;
  if (!v21)
  {
LABEL_15:
    v26 = (HMDCameraSnapshotIDSStreamReceiver *)_HMFPreconditionFailure();
    -[HMDCameraSnapshotIDSStreamReceiver dealloc](v26, v27);
    return result;
  }
  v28.receiver = self;
  v28.super_class = (Class)HMDCameraSnapshotIDSStreamReceiver;
  v23 = -[HMDCameraSnapshotIDSStream initWithSessionID:workQueue:proxyService:](&v28, sel_initWithSessionID_workQueue_proxyService_, v15, v16, v17);
  v24 = v23;
  if (v23)
  {
    objc_storeWeak((id *)&v23->_delegate, v19);
    objc_storeStrong((id *)&v24->_delegateQueue, a8);
    objc_storeStrong((id *)&v24->_snapshotFile, a6);
    objc_storeStrong((id *)&v24->_remoteDevice, a9);
  }

  return v24;
}

- (void)dealloc
{
  void *v3;
  HMDCameraSnapshotIDSStreamReceiver *v4;
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
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting the HMDCameraSnapshotIDSStreamReceiver", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraSnapshotIDSStreamReceiver;
  -[HMDCameraSnapshotIDSStream dealloc](&v7, sel_dealloc);
}

- (void)_callFileReceivedWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  HMDCameraSnapshotIDSStreamReceiver *v9;
  id v10;

  v4 = a3;
  -[HMDCameraSnapshotIDSStreamReceiver delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraSnapshotIDSStreamReceiver delegateQueue](self, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__HMDCameraSnapshotIDSStreamReceiver__callFileReceivedWithError___block_invoke;
    block[3] = &unk_24E79BBD0;
    v8 = v5;
    v9 = self;
    v10 = v4;
    dispatch_async(v6, block);

  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraSnapshotIDSStream sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  HMDCameraSnapshotIDSStreamReceiver *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  HMDCameraSnapshotIDSStreamReceiver *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  HMDCameraSnapshotIDSStreamReceiver *v44;
  NSObject *v45;
  id v46;
  void *v47;
  void *v48;
  HMDCameraSnapshotIDSStreamReceiver *v49;
  NSObject *v50;
  void *v51;
  HMDCameraSnapshotIDSStreamReceiver *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v56 = a8;
  objc_msgSend(v17, "hmf_stringForKey:", CFSTR("kCameraSessionID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotIDSStream sessionID](self, "sessionID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sessionID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v19, "isEqualToString:", v21);

  if ((v22 & 1) != 0)
  {
    +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v53 = v14;
      v54 = v15;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      -[HMDCameraSnapshotIDSStreamReceiver remoteDevice](self, "remoteDevice");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handles");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v58;
        while (2)
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v58 != v28)
              objc_enumerationMutation(v25);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "isEqual:", v23) & 1) != 0)
            {

              objc_msgSend(v17, "hmf_dateForKey:", *MEMORY[0x24BDD7E20]);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if (v38)
              {
                -[HMDCameraSnapshotIDSStreamReceiver snapshotFile](self, "snapshotFile");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "path");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = (void *)objc_msgSend(v39, "copyFileAtPath:snapshotTimestamp:", v40, v38);

                -[HMDCameraSnapshotIDSStream sessionID](self, "sessionID");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "markMilestoneFor:", CFSTR("IDSTransferReceivedImage"));

              }
              else
              {
                v48 = (void *)MEMORY[0x227676638]();
                v49 = self;
                HMFGetOSLogHandle();
                v50 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v52 = v49;
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v62 = v51;
                  _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_ERROR, "%{public}@Did not receive the snapshot timestamp in the IDS delegate callback", buf, 0xCu);

                  v49 = v52;
                }

                objc_autoreleasePoolPop(v48);
                objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1035);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v14 = v53;
              -[HMDCameraSnapshotIDSStreamReceiver _callFileReceivedWithError:](self, "_callFileReceivedWithError:", v41, v52);

              goto LABEL_26;
            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
          if (v27)
            continue;
          break;
        }
      }

      v30 = (void *)MEMORY[0x227676638]();
      v31 = self;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v62 = v33;
        v63 = 2112;
        v64 = v23;
        v65 = 2112;
        v66 = v18;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Ignoring incoming snapshot resource from unexpected device handle: %@ fromID: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v30);
      v14 = v53;
LABEL_26:
      v15 = v54;
    }
    else
    {
      v43 = (void *)MEMORY[0x227676638]();
      v44 = self;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v55 = v16;
        v46 = v15;
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v47;
        v63 = 2112;
        v64 = v18;
        _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_ERROR, "%{public}@Could not determine device handle for fromID: %@", buf, 0x16u);

        v15 = v46;
        v16 = v55;
      }

      objc_autoreleasePoolPop(v43);
    }

  }
  else
  {
    v34 = (void *)MEMORY[0x227676638]();
    v35 = self;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v62 = v37;
      v63 = 2112;
      v64 = v19;
      _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring incoming snapshot resource with unexpected request identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v34);
  }

}

- (HMDSnapshotFile)snapshotFile
{
  return (HMDSnapshotFile *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (HMDDevice)remoteDevice
{
  return (HMDDevice *)objc_getProperty(self, a2, 56, 1);
}

- (HMDCameraSnapshotIDSStreamReceiverDelegate)delegate
{
  return (HMDCameraSnapshotIDSStreamReceiverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_snapshotFile, 0);
}

uint64_t __65__HMDCameraSnapshotIDSStreamReceiver__callFileReceivedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamReceiver:didReceiveFileWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_193799 != -1)
    dispatch_once(&logCategory__hmf_once_t1_193799, &__block_literal_global_193800);
  return (id)logCategory__hmf_once_v2_193801;
}

void __49__HMDCameraSnapshotIDSStreamReceiver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_193801;
  logCategory__hmf_once_v2_193801 = v0;

}

@end
