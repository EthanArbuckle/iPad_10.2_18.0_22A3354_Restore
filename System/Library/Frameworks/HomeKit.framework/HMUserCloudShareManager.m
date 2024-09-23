@implementation HMUserCloudShareManager

void __36__HMUserCloudShareManager_configure__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __36__HMUserCloudShareManager_configure__block_invoke_2;
  v7 = &unk_1E3AB61D0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "registerReconnectionHandler:", &v4);

  objc_msgSend(*(id *)(a1 + 32), "__registerForMessages", v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)__registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HMUserCloudShareManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:selector:", CFSTR("HMUCSM.rs"), self, sel__handleDidReceiveShare_);

  -[HMUserCloudShareManager context](self, "context");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerForMessage:receiver:selector:", CFSTR("HMUCSM.rRep"), self, sel__handleDidReceiveRepairRequest_);

}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMUserCloudShareManager context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (_HMContext)context
{
  return self->_context;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)configure
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[HMUserCloudShareManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__HMUserCloudShareManager_configure__block_invoke;
  block[3] = &unk_1E3AB5E18;
  block[4] = self;
  dispatch_async(v4, block);

}

- (HMUserCloudShareManager)initWithDataSource:(id)a3
{
  id v4;
  _HMContext *v5;
  HMUserCloudShareManager *v6;

  v4 = a3;
  v5 = -[_HMContext initWithName:]([_HMContext alloc], "initWithName:", CFSTR("com.apple.HomeKit.UserCSManager"));
  v6 = -[HMUserCloudShareManager initWithDataSource:context:](self, "initWithDataSource:context:", v4, v5);

  return v6;
}

- (HMUserCloudShareManager)initWithDataSource:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  HMUserCloudShareManager *v8;
  HMUserCloudShareManager *v9;
  uint64_t v10;
  NSUUID *identifier;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMUserCloudShareManager;
  v8 = -[HMUserCloudShareManager init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeStrong((id *)&v9->_context, a4);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("4BEBFE01-79E8-4433-8EAA-D41948E39F02"));
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v10;

  }
  return v9;
}

- (void)_unconfigure
{
  void *v3;
  id v4;

  -[HMUserCloudShareManager context](self, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

}

- (void)_handleDidReceiveShare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMUserCloudShareManager *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMUserCloudShareManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMUserCloudShareManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  HMUserCloudShareManager *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  HMUserCloudShareManager *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  HMUserCloudShareManager *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  HMUserCloudShareManager *v55;
  NSObject *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  void *v66;
  HMUserCloudShareManager *v67;
  NSObject *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void (**v73)(_QWORD, _QWORD, _QWORD);
  void *v74;
  void *v75;
  void *v76;
  HMUserCloudShareInvitation *v77;
  void *v78;
  void (**v79)(_QWORD, _QWORD, _QWORD);
  void *v80;
  void *v81;
  HMUserCloudShareManager *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  id v89;
  NSObject *v90;
  void *v91;
  void *v92;
  id v93;
  NSObject *v94;
  void *v95;
  char v96;
  id v97;
  NSObject *v98;
  NSObject *v99;
  void *v100;
  void *v101;
  void *v102;
  void (**v103)(_QWORD, _QWORD, _QWORD);
  void *v104;
  void *context;
  void *contexta;
  HMUserCloudShareManager *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  id v111;
  HMUserCloudShareManager *v112;
  void *v113;
  void *v114;
  void *v115;
  _QWORD v116[5];
  id v117;
  _QWORD v118[5];
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  const __CFString *v126;
  uint64_t v127;
  uint8_t buf[4];
  void *v129;
  __int16 v130;
  void *v131;
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMUserCloudShareManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1A1AC1AAC]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v129 = v10;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Decoding share message.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = v7;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v129 = v14;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Decoding user.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v15 = (void *)MEMORY[0x1E0CB3710];
    v16 = objc_opt_class();
    objc_msgSend(v4, "messagePayload");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("HM.u.to"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = 0;
    objc_msgSend(v15, "unarchivedObjectOfClass:fromData:error:", v16, v18, &v125);
    v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v20 = v125;

    if (v20)
    {
      v111 = v20;
      v114 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v115 = 0;
    }
    else
    {
      v26 = (void *)MEMORY[0x1A1AC1AAC]();
      v27 = v12;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v129 = v29;
        _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Decoding share URL.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v26);
      v30 = (void *)MEMORY[0x1E0CB3710];
      v31 = objc_opt_class();
      objc_msgSend(v4, "messagePayload");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("HM.u.url"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = 0;
      objc_msgSend(v30, "unarchivedObjectOfClass:fromData:error:", v31, v33, &v124);
      v109 = objc_claimAutoreleasedReturnValue();
      v34 = v124;

      if (v34)
      {
        v111 = v34;
        v114 = 0;
        v22 = 0;
        v23 = 0;
        v115 = 0;
        v21 = (void *)v109;
      }
      else
      {
        v35 = (void *)MEMORY[0x1A1AC1AAC]();
        v36 = v27;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v129 = v38;
          _os_log_impl(&dword_19B1B0000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Decoding encoded share Token.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v35);
        objc_msgSend(v4, "messagePayload");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("HM.u.token"));
        v108 = objc_claimAutoreleasedReturnValue();

        v40 = (void *)MEMORY[0x1A1AC1AAC]();
        v41 = v36;
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v129 = v43;
          _os_log_impl(&dword_19B1B0000, v42, OS_LOG_TYPE_DEBUG, "%{public}@Decoding containerID.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v40);
        objc_msgSend(v4, "messagePayload");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("HM.u.container"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = (void *)MEMORY[0x1A1AC1AAC]();
        v46 = v41;
        HMFGetOSLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v129 = v48;
          _os_log_impl(&dword_19B1B0000, v47, OS_LOG_TYPE_DEBUG, "%{public}@Decoding fromUser.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v45);
        v49 = (void *)MEMORY[0x1E0CB3710];
        v50 = objc_opt_class();
        objc_msgSend(v4, "messagePayload");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("HM.u.from"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = 0;
        objc_msgSend(v49, "unarchivedObjectOfClass:fromData:error:", v50, v52, &v123);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v123;

        if (v53)
        {
          v111 = v53;
          v114 = 0;
          v21 = (void *)v109;
        }
        else
        {
          v54 = (void *)MEMORY[0x1A1AC1AAC]();
          v55 = v46;
          HMFGetOSLogHandle();
          v56 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v109;
          v112 = v55;
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v129 = v57;
            _os_log_impl(&dword_19B1B0000, v56, OS_LOG_TYPE_DEBUG, "%{public}@Decoding token.", buf, 0xCu);

            v55 = v112;
          }

          objc_autoreleasePoolPop(v54);
          v58 = objc_alloc(MEMORY[0x1E0CB3710]);
          objc_msgSend(v4, "messagePayload");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("HM.u.home"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v122 = 0;
          v61 = (void *)objc_msgSend(v58, "initForReadingFromData:error:", v60, &v122);
          v62 = v122;

          objc_msgSend(v61, "_allowDecodingCyclesInSecureMode");
          v63 = objc_opt_class();
          v64 = *MEMORY[0x1E0CB2CD0];
          v121 = v62;
          objc_msgSend(v61, "decodeTopLevelObjectOfClass:forKey:error:", v63, v64, &v121);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v121;

          if (!v65)
          {
            context = v61;
            v81 = (void *)MEMORY[0x1A1AC1AAC]();
            v82 = v112;
            HMFGetOSLogHandle();
            v83 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v129 = v84;
              _os_log_impl(&dword_19B1B0000, v83, OS_LOG_TYPE_DEBUG, "%{public}@Decoding share token.", buf, 0xCu);

            }
            v107 = v82;

            objc_autoreleasePoolPop(v81);
            v85 = (void *)MEMORY[0x1E0CB3710];
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v120 = 0;
            objc_msgSend(v85, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v86, v108, &v120);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = v120;

            v113 = v76;
            if (v87)
            {
              v88 = (void *)MEMORY[0x1A1AC1AAC]();
              v89 = v107;
              HMFGetOSLogHandle();
              v90 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v129 = v91;
                _os_log_impl(&dword_19B1B0000, v90, OS_LOG_TYPE_INFO, "%{public}@Skipping shareToken check.", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v88);

              v76 = v113;
            }

            v77 = -[HMUserCloudShareInvitation initWithUser:URL:shareToken:containerID:forHome:fromUser:]([HMUserCloudShareInvitation alloc], "initWithUser:URL:shareToken:containerID:forHome:fromUser:", v19, v109, v76, v23, v114, v115);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v92 = (void *)MEMORY[0x1A1AC1AAC]();
              v93 = v107;
              HMFGetOSLogHandle();
              v94 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v129 = v95;
                _os_log_impl(&dword_19B1B0000, v94, OS_LOG_TYPE_INFO, "%{public}@Calling share invitation delegate.", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v92);
              v118[0] = MEMORY[0x1E0C809B0];
              v118[1] = 3221225472;
              v118[2] = __50__HMUserCloudShareManager__handleDidReceiveShare___block_invoke;
              v118[3] = &unk_1E3AB4100;
              v118[4] = v93;
              v119 = v4;
              objc_msgSend(v5, "shareManager:didReceiveShareInvitation:completionHandler:", v93, v77, v118);

              v22 = (void *)v108;
              v76 = v113;
            }
            else
            {
              v96 = objc_opt_respondsToSelector();
              contexta = (void *)MEMORY[0x1A1AC1AAC]();
              v97 = v107;
              HMFGetOSLogHandle();
              v98 = objc_claimAutoreleasedReturnValue();
              v99 = v98;
              if ((v96 & 1) != 0)
              {
                if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v129 = v100;
                  _os_log_impl(&dword_19B1B0000, v99, OS_LOG_TYPE_INFO, "%{public}@Calling legacy share invitation delegate.", buf, 0xCu);

                }
                objc_autoreleasePoolPop(contexta);
                v116[0] = MEMORY[0x1E0C809B0];
                v116[1] = 3221225472;
                v116[2] = __50__HMUserCloudShareManager__handleDidReceiveShare___block_invoke_49;
                v116[3] = &unk_1E3AB4128;
                v116[4] = v97;
                v117 = v4;
                objc_msgSend(v5, "shareManager:didReceiveShareInvitation:completion:", v97, v77, v116);

              }
              else
              {
                if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v129 = v101;
                  _os_log_impl(&dword_19B1B0000, v99, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement any of the methods to accept a share", buf, 0xCu);

                }
                objc_autoreleasePoolPop(contexta);
                objc_msgSend(v4, "responseHandler");
                v102 = (void *)objc_claimAutoreleasedReturnValue();

                if (v102)
                {
                  objc_msgSend(v4, "responseHandler");
                  v103 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Delegate does implement method to accept shares"), CFSTR("Need a delegate implements method to accept shares"), 0);
                  v104 = (void *)objc_claimAutoreleasedReturnValue();
                  ((void (**)(_QWORD, void *, _QWORD))v103)[2](v103, v104, 0);

                }
              }
              v22 = (void *)v108;
            }
            goto LABEL_33;
          }
          v111 = v65;

        }
        v22 = (void *)v108;
      }
    }
    v66 = (void *)MEMORY[0x1A1AC1AAC]();
    v67 = v12;
    HMFGetOSLogHandle();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v110 = v23;
      v70 = v4;
      v71 = v5;
      v72 = v22;
      v73 = v19;
      v74 = v21;
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v129 = v69;
      v130 = 2112;
      v131 = v75;
      _os_log_impl(&dword_19B1B0000, v68, OS_LOG_TYPE_ERROR, "%{public}@Could not decode all items in payload: %@", buf, 0x16u);

      v21 = v74;
      v19 = v73;
      v22 = v72;
      v5 = v71;
      v4 = v70;
      v23 = v110;

    }
    objc_autoreleasePoolPop(v66);
    v76 = v111;
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 3, CFSTR("Unable to decode payload"), CFSTR("Could not decode all items in payload"), 0, v111);
    v77 = (HMUserCloudShareInvitation *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseHandler");
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    if (v78)
    {
      objc_msgSend(v4, "responseHandler");
      v79 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v126 = CFSTR("didAccept");
      v127 = MEMORY[0x1E0C9AAA0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, HMUserCloudShareInvitation *, void *))v79)[2](v79, v77, v80);

    }
LABEL_33:

    goto LABEL_34;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v129 = v24;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Do not have a delegate that responds to shares", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "responseHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v4, "responseHandler");
    v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Delegate does not respond to shares"), CFSTR("Need a delegate that responds to shares"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v19)[2](v19, v21, 0);
LABEL_34:

  }
}

- (void)_handleDidReceiveRepairRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  HMUserCloudShareManager *v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  HMUserCloudShareManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_UUIDForKey:", CFSTR("HM.u.homeuuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3710];
  v8 = objc_opt_class();
  objc_msgSend(v4, "messagePayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HM.u.repairInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v7, "unarchivedObjectOfClass:fromData:error:", v8, v10, &v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v27;

  -[HMUserCloudShareManager dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "shareManager:homeWithUUID:", self, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && v11)
  {
    -[HMUserCloudShareManager delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if ((v16 & 1) != 0)
    {
      if (v20)
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v21;
        _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_INFO, "%{public}@Calling repair delegate.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(v15, "shareManager:didReceiveRepairInfo:home:", v18, v11, v14);
    }
    else
    {
      if (v20)
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v26;
        _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_INFO, "%{public}@Client does not respond to repair.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
    }

  }
  else
  {
    v22 = (void *)MEMORY[0x1A1AC1AAC]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v25;
      v30 = 2112;
      v31 = v6;
      v32 = 2112;
      v33 = v12;
      _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Did not find home %@ or repairInfo %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v22);
  }

}

- (void)registerForContainerIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMUserCloudShareManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMUserCloudShareManager *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMUserCloudShareManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMUserCloudShareManager registerForContainerIDs:completion:]", CFSTR("completion"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2112;
      v28 = (const char *)v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__HMUserCloudShareManager_registerForContainerIDs_completion___block_invoke;
    block[3] = &unk_1E3AB5C58;
    block[4] = self;
    v24 = v7;
    v23 = v6;
    dispatch_async(v10, block);

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      v27 = 2080;
      v28 = "-[HMUserCloudShareManager registerForContainerIDs:completion:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v15);

  }
}

- (void)reconnect
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  HMUserCloudShareManager *v7;
  NSObject *v8;
  void *v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HMUserCloudShareManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__HMUserCloudShareManager_reconnect__block_invoke;
    block[3] = &unk_1E3AB5E18;
    block[4] = self;
    dispatch_async(v5, block);

  }
  else
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v9;
      v13 = 2080;
      v14 = "-[HMUserCloudShareManager reconnect]";
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)_registerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  HMUserCloudShareManager *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  const __CFString *v21;
  void *v22;
  _BYTE location[12];
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMUserCloudShareManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D285F8];
    -[HMUserCloudShareManager messageDestination](self, "messageDestination");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = CFSTR("containerIds");
    -[HMUserCloudShareManager containerIDs](self, "containerIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageWithName:destination:payload:", CFSTR("HMUCSM.reg"), v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)location, self);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __51__HMUserCloudShareManager__registerWithCompletion___block_invoke;
    v17[3] = &unk_1E3AB4B30;
    objc_copyWeak(&v20, (id *)location);
    v11 = v5;
    v18 = v11;
    v19 = v4;
    objc_msgSend(v10, "setResponseHandler:", v17);
    objc_msgSend(v11, "messageDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendMessage:completionHandler:", v10, 0);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)location);

  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v16;
      v24 = 2080;
      v25 = "-[HMUserCloudShareManager _registerWithCompletion:]";
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMUserCloudShareManager messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (HMUserCloudShareManagerDelegate)delegate
{
  return (HMUserCloudShareManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMUserCloudShareManagerDataSource)dataSource
{
  return (HMUserCloudShareManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (BOOL)isRegistered
{
  return self->_registered;
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (NSArray)containerIDs
{
  return self->_containerIDs;
}

- (void)setContainerIDs:(id)a3
{
  objc_storeStrong((id *)&self->_containerIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIDs, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __51__HMUserCloudShareManager__registerWithCompletion___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__HMUserCloudShareManager__registerWithCompletion___block_invoke_2;
    block[3] = &unk_1E3AB5C58;
    v7 = v3;
    v8 = WeakRetained;
    v9 = a1[5];
    dispatch_async(v5, block);

  }
}

void __51__HMUserCloudShareManager__registerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1A1AC1AAC]();
  v4 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v2)
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v15 = 138543618;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    v9 = "%{public}@Failed to start with error: %@";
    v10 = v6;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v7;
    v9 = "%{public}@Registered Successfully";
    v10 = v6;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 12;
  }
  _os_log_impl(&dword_19B1B0000, v10, v11, v9, (uint8_t *)&v15, v12);

LABEL_7:
  objc_autoreleasePoolPop(v3);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegateCaller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "callCompletion:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

  }
}

uint64_t __36__HMUserCloudShareManager_reconnect__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "isRegistered");
  if ((_DWORD)result)
  {
    v3 = (void *)MEMORY[0x1A1AC1AAC]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Re-registering", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    return objc_msgSend(*(id *)(a1 + 32), "_registerWithCompletion:", 0);
  }
  return result;
}

void __62__HMUserCloudShareManager_registerForContainerIDs_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isRegistered"))
  {
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 1, CFSTR("Already registered"), CFSTR("Cannot register more than once"), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v2 + 16))(v2);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setRegistered:", 1);
    v3 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(*(id *)(a1 + 32), "setContainerIDs:", *(_QWORD *)(a1 + 40)));
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v9 = v6;
      _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "_registerWithCompletion:", *(_QWORD *)(a1 + 48));
  }
}

void __50__HMUserCloudShareManager__handleDidReceiveShare___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  void *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((_DWORD)a2)
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v12;
      v13 = "%{public}@Client accepted share";
LABEL_7:
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, v13, buf, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v11 = v14;
  if (v8)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v12;
      v13 = "%{public}@Client rejected share.";
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v9);
    goto LABEL_9;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = v24;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Client did not accept share but no error specified.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Required error not specified"), CFSTR("Need error when share is not accepted"), 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  objc_msgSend(*(id *)(a1 + 40), "responseHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("didAccept"));

    if (v7)
    {
      v18 = (void *)MEMORY[0x1A1AC1AAC]();
      v19 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v34 = v21;
        _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Forwarding received clientInfo.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v18);
      v32 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v32);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v32;
      if (v22)
      {
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, CFSTR("clientInfo"));
      }
      else
      {
        v25 = (void *)MEMORY[0x1A1AC1AAC]();
        v26 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v34 = v28;
          v35 = 2112;
          v36 = v23;
          _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Error encoding client Info. %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v25);

        v29 = v23;
        v16 = 0;
        v8 = v29;
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "responseHandler");
    v30 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v16, "copy");
    ((void (**)(_QWORD, id, void *))v30)[2](v30, v8, v31);

  }
}

void __50__HMUserCloudShareManager__handleDidReceiveShare___block_invoke_49(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((_DWORD)a2)
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v9;
      v10 = "%{public}@Client accepted share";
LABEL_7:
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, v10, buf, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v6 = (void *)MEMORY[0x1A1AC1AAC]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (v5)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v9;
      v10 = "%{public}@Client rejected share.";
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v6);
    goto LABEL_9;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v16;
    _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Client did not accept share but no error specified.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Required error not specified"), CFSTR("Need error when share is not accepted"), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  objc_msgSend(*(id *)(a1 + 40), "responseHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "responseHandler");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2, CFSTR("didAccept"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v13)[2](v13, v5, v15);

  }
}

void __36__HMUserCloudShareManager_configure__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reconnect");

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t33 != -1)
    dispatch_once(&logCategory__hmf_once_t33, &__block_literal_global_42471);
  return (id)logCategory__hmf_once_v34;
}

void __38__HMUserCloudShareManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v34;
  logCategory__hmf_once_v34 = v0;

}

@end
