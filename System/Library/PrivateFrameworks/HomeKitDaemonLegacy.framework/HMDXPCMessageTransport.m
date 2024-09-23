@implementation HMDXPCMessageTransport

void __56__HMDXPCMessageTransport_sendMessage_completionHandler___block_invoke(id *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  char *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD block[4];
  id v55;
  char *v56;
  _QWORD v57[4];
  NSObject *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[14];
  __int128 v66;
  __int128 v67;
  _BYTE buf[22];
  __int16 v69;
  _BYTE v70[20];
  __int16 v71;
  __int128 *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  void *v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_group_create();
  v3 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(a1[4], "connections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = 0u;
  v60 = 0u;
  v61 = 0u;
  v59 = 0u;
  objc_msgSend(a1[4], "connections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v59, v79, 16);
  if (!v6)
  {

    goto LABEL_18;
  }
  v7 = v6;
  v8 = v2;
  v9 = 0;
  v10 = *(_QWORD *)v60;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v60 != v10)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
      if (objc_msgSend(v12, "canSendMessage:", a1[5]))
      {
        ++v9;
        dispatch_group_enter(v8);
        v13 = a1[5];
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __56__HMDXPCMessageTransport_sendMessage_completionHandler___block_invoke_2;
        v57[3] = &unk_1E89C2350;
        v58 = v8;
        objc_msgSend(v12, "sendMessage:completionHandler:", v13, v57);
        v14 = v58;
      }
      else
      {
        objc_msgSend(v12, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          continue;
        objc_msgSend(v12, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "addObject:", v14);
      }

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v59, v79, 16);
  }
  while (v7);

  v2 = v8;
  if (v9)
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = a1[4];
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "name");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(a1[5], "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v51 = v16;
      if (v19)
      {
        objc_msgSend(a1[5], "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
      }
      v67 = *(_OWORD *)buf;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(a1[5], "destination");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "target");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        objc_msgSend(a1[5], "destination");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "target");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
      }
      v66 = *(_OWORD *)buf;
      objc_msgSend(a1[4], "connections", v8);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "count");
      objc_msgSend(a1[5], "sendPolicy");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545410;
      *(_QWORD *)&buf[4] = v49;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v47;
      v69 = 1042;
      *(_DWORD *)v70 = 16;
      *(_WORD *)&v70[4] = 2098;
      *(_QWORD *)&v70[6] = &v67;
      *(_WORD *)&v70[14] = 1040;
      *(_DWORD *)&v70[16] = 16;
      v71 = 2096;
      v72 = &v66;
      v73 = 2050;
      v74 = v9;
      v75 = 2050;
      v76 = v37;
      v77 = 2114;
      v78 = v38;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Sent message %{public}@(%{public,uuid_t}.16P) with target %{uuid_t}.16P to %{public}lu/%{public}lu clients with message send policy %{public}@", buf, 0x54u);

      v16 = v51;
      v2 = v46;
    }

    objc_autoreleasePoolPop(v16);
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = a1[4];
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "shortDescription");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "messagePayload");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x1E0C99E60];
      v65[0] = CFSTR("kAuthorizationDataKey");
      v65[1] = CFSTR("kAccessoryPairingPasswordKey");
      v65[2] = CFSTR("kAccessoryName");
      v65[3] = CFSTR("kServiceName");
      v65[4] = CFSTR("kActionSetName");
      v65[5] = CFSTR("kTriggerName");
      v65[6] = CFSTR("kZoneName");
      v65[7] = CFSTR("kHomeName");
      v65[8] = CFSTR("kRoomName");
      v65[9] = CFSTR("kAccessoryInfoSerialNumberKey");
      v65[10] = CFSTR("kUserIDKey");
      v65[11] = CFSTR("kUserIDsKey");
      v65[12] = CFSTR("kUserDisplayNameKey");
      v65[13] = CFSTR("kUserNamesKey");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 14);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setWithArray:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "secureDescriptionWithBlacklistKeys:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v39;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v50;
      v69 = 2114;
      *(_QWORD *)v70 = v43;
      *(_WORD *)&v70[8] = 2114;
      *(_QWORD *)&v70[10] = v53;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Sent message %{public}@ with payload: %{public}@ (skipped ineligible clients: %{public}@)", buf, 0x2Au);

    }
    goto LABEL_34;
  }
LABEL_18:
  v21 = (void *)MEMORY[0x1D17BA0A0]();
  v22 = a1[4];
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    objc_msgSend(a1[5], "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(a1[5], "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "getUUIDBytes:", buf);

    }
    else
    {
      *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
    }
    v64 = *(_OWORD *)buf;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    objc_msgSend(a1[5], "destination");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "target");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(a1[5], "destination");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "target");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "getUUIDBytes:", buf);

    }
    else
    {
      *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
    }
    v63 = *(_OWORD *)buf;
    objc_msgSend(a1[5], "sendPolicy");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    *(_QWORD *)&buf[4] = v52;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v24;
    v69 = 1042;
    *(_DWORD *)v70 = 16;
    *(_WORD *)&v70[4] = 2098;
    *(_QWORD *)&v70[6] = &v64;
    *(_WORD *)&v70[14] = 1040;
    *(_DWORD *)&v70[16] = 16;
    v71 = 2096;
    v72 = &v63;
    v73 = 2114;
    v74 = v31;
    _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Not sending message %{public}@(%{public,uuid_t}.16P) with target %{uuid_t}.16P because no clients are eligible for send policy: %{public}@", buf, 0x40u);

  }
  v9 = 0;
LABEL_34:

  objc_autoreleasePoolPop(v21);
  if (a1[6])
  {
    objc_msgSend(a1[4], "listener");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "queue");
    v45 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__HMDXPCMessageTransport_sendMessage_completionHandler___block_invoke_89;
    block[3] = &unk_1E89ADD78;
    v56 = v9;
    v55 = a1[6];
    dispatch_group_notify(v2, v45, block);

  }
}

- (NSArray)connections
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDXPCMessageTransport mutableConnections](self, "mutableConnections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (NSMutableSet)mutableConnections
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  dispatch_qos_class_t v8;
  id v9;
  id v10;
  dispatch_block_t v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "qualityOfService");
  v8 = HMFQOSClassFromQualityOfService();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HMDXPCMessageTransport_sendMessage_completionHandler___block_invoke;
  block[3] = &unk_1E89C1B48;
  block[4] = self;
  v15 = v6;
  v16 = v7;
  v9 = v7;
  v10 = v6;
  v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v8, 0, block);
  -[HMDXPCMessageTransport listener](self, "listener");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v13, v11);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_66509 != -1)
    dispatch_once(&logCategory__hmf_once_t6_66509, &__block_literal_global_95_66510);
  return (id)logCategory__hmf_once_v7_66511;
}

- (void)messageTransport:(id)a3 didReceiveMessage:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMFMessageTransport delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageTransport:didReceiveMessage:", v7, v6);

}

void __56__HMDXPCMessageTransport_sendMessage_completionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  void *v7;
  HMDXPCMessageTransport *v8;
  NSObject *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  HMDXPCMessageTransport *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  HMDXPCMessageTransport *v36;
  NSObject *v37;
  void *v38;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id from;
  id location;
  _QWORD v49[5];
  id v50;
  _OWORD v51[2];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v53 = v10;
    v54 = 2112;
    v55 = v6;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@New XPC connection requested: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDXPCMessageTransport clientConnectionFactory](v8, "clientConnectionFactory");
  v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v11)[2](v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDXPCMessageTransport configuration](v8, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "requiredEntitlements");

  v15 = objc_msgSend(v12, "entitlements");
  v16 = v15 & v14;
  if ((v15 & v14) != v14)
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = v8;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      HMXPCClientEntitlementsToComponents(v16 ^ v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v53 = v23;
      v54 = 2112;
      v55 = v24;
      v56 = 2112;
      v57 = v12;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Rejecting connection missing entitlements %@: %@", buf, 0x20u);

    }
    goto LABEL_10;
  }
  -[HMDXPCMessageTransport configuration](v8, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "requiresHomeDataAccess");

  if (!v18)
    goto LABEL_16;
  if ((objc_msgSend(v12, "isAuthorizedForHomeDataAccess") & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = v8;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "clientPid"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v26;
      v54 = 2112;
      v55 = v27;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Rejecting connection from client with PID %@ because it is not authorized for Home data access", buf, 0x16u);

    }
LABEL_10:

    objc_autoreleasePoolPop(v20);
    v25 = 0;
    goto LABEL_19;
  }
  -[HMDXPCMessageTransport appProtectionGuard](v8, "appProtectionGuard");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v6, "auditToken");
  else
    memset(v51, 0, sizeof(v51));
  v28 = *MEMORY[0x1E0CB8D08];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __61__HMDXPCMessageTransport_listener_shouldAcceptNewConnection___block_invoke;
  v49[3] = &unk_1E89B37A8;
  v49[4] = v8;
  v50 = v12;
  objc_msgSend(v19, "initiateAuthenticationForApplicationWithBundleIdentifier:onBehalfOfProcessWithAuditToken:completion:", v28, v51, v49);

LABEL_16:
  objc_msgSend(v12, "setDelegate:", v8);
  objc_msgSend(v6, "setExportedObject:", v12);
  -[HMDXPCMessageTransport exportedInterface](v8, "exportedInterface");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v29);

  -[HMDXPCMessageTransport remoteObjectInterface](v8, "remoteObjectInterface");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemoteObjectInterface:", v30);

  -[HMDXPCMessageTransport processMonitor](v8, "processMonitor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "processInfoForConnection:", v12);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setProcessInfo:", v32);
  objc_msgSend(v32, "addConnection:", v12);
  os_unfair_lock_lock_with_options();
  -[HMDXPCMessageTransport mutableConnections](v8, "mutableConnections");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v12);

  os_unfair_lock_unlock(&v8->_lock);
  objc_initWeak(&location, v8);
  objc_initWeak(&from, v12);
  v34 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __61__HMDXPCMessageTransport_listener_shouldAcceptNewConnection___block_invoke_100;
  v44[3] = &unk_1E89B8458;
  objc_copyWeak(&v45, &location);
  objc_copyWeak(&v46, &from);
  objc_msgSend(v6, "setInterruptionHandler:", v44);
  v41[0] = v34;
  v41[1] = 3221225472;
  v41[2] = __61__HMDXPCMessageTransport_listener_shouldAcceptNewConnection___block_invoke_101;
  v41[3] = &unk_1E89B8458;
  objc_copyWeak(&v42, &location);
  objc_copyWeak(&v43, &from);
  v35 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v6, "setInvalidationHandler:", v41));
  v36 = v8;
  HMFGetOSLogHandle();
  v37 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v53 = v38;
    v54 = 2112;
    v55 = v12;
    _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@Resuming new XPC connection: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v35);
  objc_msgSend(v6, "resume");
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&v45);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  v25 = 1;
LABEL_19:

  return v25;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDXPCMessageTransport configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "machServiceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMXPCMessageTransportConfiguration)configuration
{
  return (HMXPCMessageTransportConfiguration *)objc_getProperty(self, a2, 32, 1);
}

void __61__HMDXPCMessageTransport_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v17 = 138543618;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v12 = "%{public}@Successfully initiated authentication for app protection for connection: %@";
      v13 = v9;
      v14 = OS_LOG_TYPE_DEBUG;
      v15 = 22;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v13, v14, v12, (uint8_t *)&v17, v15);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 40);
    v17 = 138543874;
    v18 = v10;
    v19 = 2112;
    v20 = v16;
    v21 = 2112;
    v22 = v5;
    v12 = "%{public}@Failed to initiate authentication for app protection for connection %@: %@";
    v13 = v9;
    v14 = OS_LOG_TYPE_ERROR;
    v15 = 32;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v6);
}

- (NSXPCInterface)remoteObjectInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 72, 1);
}

- (HMDProcessMonitor)processMonitor
{
  return (HMDProcessMonitor *)objc_getProperty(self, a2, 24, 1);
}

- (NSXPCInterface)exportedInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 64, 1);
}

- (id)clientConnectionFactory
{
  return objc_getProperty(self, a2, 80, 1);
}

+ (HMDXPCMessageTransport)defaultTransport
{
  if (defaultTransport_onceToken != -1)
    dispatch_once(&defaultTransport_onceToken, &__block_literal_global_66517);
  return (HMDXPCMessageTransport *)(id)defaultTransport_defaultTransport;
}

- (HMDAppProtectionGuard)appProtectionGuard
{
  return (HMDAppProtectionGuard *)objc_getProperty(self, a2, 48, 1);
}

- (HMDXPCMessageTransport)initWithConfiguration:(id)a3 listener:(id)a4 processMonitor:(id)a5 appProtectionGuard:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDXPCMessageTransport *v15;
  uint64_t v16;
  HMXPCMessageTransportConfiguration *configuration;
  NSMutableSet *v18;
  NSMutableSet *mutableConnections;
  uint64_t v20;
  NSXPCInterface *exportedInterface;
  uint64_t v22;
  NSXPCInterface *remoteObjectInterface;
  id clientConnectionFactory;
  HMDXPCMessageTransport *v26;
  SEL v27;
  id v28;
  objc_super v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v11)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v12)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v14 = v13;
  if (!v13)
  {
LABEL_11:
    v26 = (HMDXPCMessageTransport *)_HMFPreconditionFailure();
    return -[HMDXPCMessageTransport initWithConfiguration:](v26, v27, v28);
  }
  v29.receiver = self;
  v29.super_class = (Class)HMDXPCMessageTransport;
  v15 = -[HMDXPCMessageTransport init](&v29, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v10, "copy");
    configuration = v15->_configuration;
    v15->_configuration = (HMXPCMessageTransportConfiguration *)v16;

    objc_storeStrong((id *)&v15->_listener, a4);
    objc_storeStrong((id *)&v15->_processMonitor, a5);
    objc_storeStrong((id *)&v15->_appProtectionGuard, a6);
    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    mutableConnections = v15->_mutableConnections;
    v15->_mutableConnections = v18;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFAABA48);
    v20 = objc_claimAutoreleasedReturnValue();
    exportedInterface = v15->_exportedInterface;
    v15->_exportedInterface = (NSXPCInterface *)v20;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFB9F6F0);
    v22 = objc_claimAutoreleasedReturnValue();
    remoteObjectInterface = v15->_remoteObjectInterface;
    v15->_remoteObjectInterface = (NSXPCInterface *)v22;

    clientConnectionFactory = v15->_clientConnectionFactory;
    v15->_clientConnectionFactory = &__block_literal_global_68_66495;

  }
  return v15;
}

- (HMDXPCMessageTransport)initWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  HMDXPCListener *v6;
  id v7;
  void *v8;
  void *v9;
  HMDXPCListener *v10;
  HMDProcessMonitor *v11;
  void *v12;
  HMDProcessMonitor *v13;
  HMDAppProtectionGuard *v14;
  HMDXPCMessageTransport *v15;
  HMDXPCMessageTransport *result;
  HMDXPCMessageTransport *v17;
  SEL v18;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = [HMDXPCListener alloc];
    v7 = objc_alloc(MEMORY[0x1E0CB3B58]);
    objc_msgSend(v5, "machServiceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithMachServiceName:", v8);
    v10 = -[HMDXPCListener initWithXPCListener:](v6, "initWithXPCListener:", v9);

    v11 = [HMDProcessMonitor alloc];
    objc_msgSend(v5, "queue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMDProcessMonitor initWithQueue:](v11, "initWithQueue:", v12);

    v14 = objc_alloc_init(HMDAppProtectionGuard);
    v15 = -[HMDXPCMessageTransport initWithConfiguration:listener:processMonitor:appProtectionGuard:](self, "initWithConfiguration:listener:processMonitor:appProtectionGuard:", v5, v10, v13, v14);

    return v15;
  }
  else
  {
    v17 = (HMDXPCMessageTransport *)_HMFPreconditionFailure();
    -[HMDXPCMessageTransport start](v17, v18);
  }
  return result;
}

- (void)start
{
  void *v3;
  HMDXPCMessageTransport *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting XPC message transport", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDXPCMessageTransport listener](v4, "listener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", v4);

  -[HMDXPCMessageTransport configuration](v4, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDXPCMessageTransport listener](v4, "listener");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setQueue:", v9);

  -[HMDXPCMessageTransport listener](v4, "listener");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "start");

  -[HMDXPCMessageTransport configuration](v4, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "serverStartNotification");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  notify_post((const char *)objc_msgSend(v13, "UTF8String"));

}

- (void)stop
{
  void *v3;
  HMDXPCMessageTransport *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping XPC message transport", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDXPCMessageTransport listener](v4, "listener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stop");

}

- (NSDictionary)stateDump
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[HMDXPCMessageTransport connections](self, "connections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_75);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[HMDXPCMessageTransport processMonitor](self, "processMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v28 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v35;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(obj);
        v29 = v7;
        v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v7);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v8, "connections");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v31 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
              objc_msgSend(v14, "activeRequests");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "count");

              if (v16)
              {
                v17 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v14, "applicationBundleIdentifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "stringWithFormat:", CFSTR("%@:%d"), v18, objc_msgSend(v8, "identifier"));
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v14, "activeRequests");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = (void *)objc_msgSend(v20, "copy");
                objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, v19);

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
          }
          while (v11);
        }

        v7 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    }
    while (v28);
  }

  v38[0] = CFSTR("Connections");
  v38[1] = CFSTR("Active Requests");
  v39[0] = v25;
  v22 = (void *)objc_msgSend(v4, "copy");
  v39[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v23;
}

- (HMDXPCListener)listener
{
  return (HMDXPCListener *)objc_getProperty(self, a2, 40, 1);
}

- (void)setClientConnectionFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientConnectionFactory, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_mutableConnections, 0);
  objc_storeStrong((id *)&self->_appProtectionGuard, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
}

void __61__HMDXPCMessageTransport_listener_shouldAcceptNewConnection___block_invoke_100(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = WeakRetained;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Daemon received interruption for %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __61__HMDXPCMessageTransport_listener_shouldAcceptNewConnection___block_invoke_101(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  os_unfair_lock_s *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = (os_unfair_lock_s *)WeakRetained;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v7;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Daemon received invalidation for %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  if (v5 && v3)
  {
    os_unfair_lock_lock_with_options();
    -[os_unfair_lock_s mutableConnections](v5, "mutableConnections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v3);

    os_unfair_lock_unlock(v5 + 4);
    objc_msgSend(v3, "deactivate");
    objc_msgSend(v3, "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeConnection:", v3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("HMDXPCClientConnectionInvalidatedNotification"), v3, 0);

    if ((objc_msgSend(v9, "isActive") & 1) == 0 && (objc_msgSend(v9, "shouldMonitor") & 1) == 0)
    {
      -[os_unfair_lock_s processMonitor](v5, "processMonitor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeProcess:", v9);

    }
  }

}

void __56__HMDXPCMessageTransport_sendMessage_completionHandler___block_invoke_89(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (*(_QWORD *)(a1 + 40))
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 54, CFSTR("Failed to send message."), CFSTR("No eligible clients"), 0);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  v3 = (id)v2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __35__HMDXPCMessageTransport_stateDump__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stateDump");
}

HMDXPCClientConnection *__91__HMDXPCMessageTransport_initWithConfiguration_listener_processMonitor_appProtectionGuard___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMDXPCClientConnection *v3;

  v2 = a2;
  v3 = -[HMDXPCClientConnection initWithConnection:]([HMDXPCClientConnection alloc], "initWithConnection:", v2);

  return v3;
}

+ (HMDXPCMessageTransport)accessorySetupTransport
{
  if (accessorySetupTransport_onceToken != -1)
    dispatch_once(&accessorySetupTransport_onceToken, &__block_literal_global_5_66514);
  return (HMDXPCMessageTransport *)(id)accessorySetupTransport_accessorySetupTransport;
}

void __37__HMDXPCMessageTransport_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_66511;
  logCategory__hmf_once_v7_66511 = v0;

}

void __49__HMDXPCMessageTransport_accessorySetupTransport__block_invoke()
{
  id v0;
  HMDXPCMessageTransport *v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0CBA708]);
  v3 = (id)objc_msgSend(v0, "initWithMachServiceName:", *MEMORY[0x1E0CBA108]);
  objc_msgSend(v3, "setRequiredEntitlements:", 1);
  objc_msgSend(v3, "setRequiresHomeDataAccess:", 0);
  v1 = -[HMDXPCMessageTransport initWithConfiguration:]([HMDXPCMessageTransport alloc], "initWithConfiguration:", v3);
  v2 = (void *)accessorySetupTransport_accessorySetupTransport;
  accessorySetupTransport_accessorySetupTransport = (uint64_t)v1;

}

void __42__HMDXPCMessageTransport_defaultTransport__block_invoke()
{
  id v0;
  HMDXPCMessageTransport *v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0CBA708]);
  v3 = (id)objc_msgSend(v0, "initWithMachServiceName:", *MEMORY[0x1E0CBA138]);
  objc_msgSend(v3, "setRequiredEntitlements:", 1);
  objc_msgSend(v3, "setRequiresHomeDataAccess:", 1);
  v1 = -[HMDXPCMessageTransport initWithConfiguration:]([HMDXPCMessageTransport alloc], "initWithConfiguration:", v3);
  v2 = (void *)defaultTransport_defaultTransport;
  defaultTransport_defaultTransport = (uint64_t)v1;

}

@end
