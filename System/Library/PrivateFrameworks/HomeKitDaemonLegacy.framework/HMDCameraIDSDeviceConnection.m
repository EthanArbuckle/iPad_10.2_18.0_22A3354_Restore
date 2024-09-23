@implementation HMDCameraIDSDeviceConnection

- (HMDCameraIDSDeviceConnection)initWithSessionID:(id)a3 workQueue:(id)a4 idsProxyStreamService:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDCameraIDSDeviceConnection *v13;
  HMDCameraIDSDeviceConnection *v14;
  id v15;
  const char *v16;
  NSObject *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *highPriorityQueue;
  id idsDeviceConnectionFactory;
  void *v22;
  HMDCameraIDSDeviceConnection *result;
  HMDCameraIDSDeviceConnection *v24;
  SEL v25;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v10)
  {
LABEL_7:
    v24 = (HMDCameraIDSDeviceConnection *)_HMFPreconditionFailure();
    -[HMDCameraIDSDeviceConnection dealloc](v24, v25);
    return result;
  }
  v12 = v11;
  v26.receiver = self;
  v26.super_class = (Class)HMDCameraIDSDeviceConnection;
  v13 = -[HMDCameraIDSDeviceConnection init](&v26, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_workQueue, a4);
    objc_storeStrong((id *)&v14->_sessionID, a3);
    HMDispatchQueueNameString();
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = (const char *)objc_msgSend(v15, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_USER_INITIATED, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create(v16, v18);
    highPriorityQueue = v14->_highPriorityQueue;
    v14->_highPriorityQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v14->_idsProxyStreamService, a5);
    -[HMDIDSService addDelegate:queue:](v14->_idsProxyStreamService, "addDelegate:queue:", v14, v14->_workQueue);
    idsDeviceConnectionFactory = v14->_idsDeviceConnectionFactory;
    v14->_idsDeviceConnectionFactory = &__block_literal_global_43287;

    +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addProxyServiceLinkPreferencesAssertionHolder:", v14);

  }
  return v14;
}

- (void)dealloc
{
  NSObject *keepAliveSocketReceiveSource;
  objc_super v4;

  -[HMDIDSService removeDelegate:](self->_idsProxyStreamService, "removeDelegate:", self);
  -[IDSDeviceConnection close](self->_watchAudioConnection, "close");
  -[IDSDeviceConnection close](self->_watchVideoConnection, "close");
  -[IDSDeviceConnection close](self->_keepAliveConnection, "close");
  keepAliveSocketReceiveSource = self->_keepAliveSocketReceiveSource;
  if (keepAliveSocketReceiveSource)
    dispatch_source_cancel(keepAliveSocketReceiveSource);
  v4.receiver = self;
  v4.super_class = (Class)HMDCameraIDSDeviceConnection;
  -[HMDCameraIDSDeviceConnection dealloc](&v4, sel_dealloc);
}

- (void)_createStreamSocketWithDevice:(id)a3
{
  id v4;
  void *v5;
  HMDCameraIDSDeviceConnection *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDCameraIDSDeviceConnection *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDHomeKitVersion *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
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
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  HMDCameraIDSDeviceConnection *v44;
  NSObject *v45;
  void *v46;
  void (**v47)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v48;
  void *v49;
  HMDCameraIDSDeviceConnection *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  HMDCameraIDSDeviceConnection *v57;
  NSObject *v58;
  void *v59;
  void (**v60)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v61;
  void *v62;
  id v63;
  HMDCameraIDSDeviceConnection *v64;
  NSObject *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  HMDCameraIDSDeviceConnection *v71;
  NSObject *v72;
  void *v73;
  void (**v74)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v75;
  void *v76;
  void *v77;
  HMDCameraIDSDeviceConnection *v78;
  NSObject *v79;
  void *v80;
  uint64_t v81;
  NSObject *v82;
  id v83;
  void *v84;
  HMDCameraIDSDeviceConnection *v85;
  NSObject *v86;
  void *v87;
  void *context;
  id v89;
  uint64_t v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  dispatch_group_t group;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  _QWORD block[4];
  id v102;
  id v103;
  id v104;
  _QWORD *v105;
  _BYTE *v106;
  _QWORD *v107;
  id v108;
  _QWORD v109[4];
  id v110;
  NSObject *v111;
  _QWORD *v112;
  id v113;
  _QWORD v114[4];
  id v115;
  NSObject *v116;
  _QWORD *v117;
  id v118;
  _QWORD v119[4];
  id v120;
  dispatch_group_t v121;
  _BYTE *v122;
  id v123;
  _QWORD v124[3];
  char v125;
  _QWORD v126[3];
  char v127;
  id location;
  _QWORD v129[4];
  id v130;
  _QWORD v131[2];
  _QWORD v132[3];
  _QWORD v133[3];
  _QWORD v134[2];
  _QWORD v135[3];
  _QWORD v136[3];
  uint8_t v137[4];
  void *v138;
  __int16 v139;
  void *v140;
  _QWORD v141[2];
  _QWORD v142[3];
  _QWORD v143[3];
  _BYTE buf[24];
  void *v145;
  uint64_t v146;

  v146 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating stream sockets with device: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraIDSDeviceConnection idsProxyStreamService](v6, "idsProxyStreamService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "devices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v129[0] = MEMORY[0x1E0C809B0];
  v129[1] = 3221225472;
  v129[2] = __62__HMDCameraIDSDeviceConnection__createStreamSocketWithDevice___block_invoke;
  v129[3] = &unk_1E89AA4F0;
  v99 = v4;
  v130 = v99;
  objc_msgSend(v10, "hmf_objectPassingTest:", v129);
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = v6;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v100)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v100;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Mapped HMDDevice to IDSDevice: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v99, "version");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("8.0"));
    v18 = objc_msgSend(v16, "isAtLeastVersion:", v17);

    v19 = (void *)MEMORY[0x1E0CB3940];
    -[HMDCameraIDSDeviceConnection sessionID](v12, "sessionID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v18)
    {
      objc_msgSend(v20, "sessionID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("kIDSStreamVideoSocketName"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)MEMORY[0x1E0CB3940];
      -[HMDCameraIDSDeviceConnection sessionID](v12, "sessionID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sessionID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("kIDSStreamAudioSocketName"), v26);
      v97 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)MEMORY[0x1E0CB3940];
      -[HMDCameraIDSDeviceConnection sessionID](v12, "sessionID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sessionID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("kIDSStreamKeepAliveSocketName"), v29);
      v95 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("kIDSStreamVideoSocketName"), v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = (void *)MEMORY[0x1E0CB3940];
      -[HMDCameraIDSDeviceConnection sessionID](v12, "sessionID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("kIDSStreamAudioSocketName"), v36);
      v97 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = (void *)MEMORY[0x1E0CB3940];
      -[HMDCameraIDSDeviceConnection sessionID](v12, "sessionID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("kIDSStreamKeepAliveSocketName"), v28);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_initWeak(&location, v12);
    v38 = dispatch_group_create();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v145) = 0;
    v126[0] = 0;
    v126[1] = v126;
    v126[2] = 0x2020000000;
    v127 = 0;
    v124[0] = 0;
    v124[1] = v124;
    v124[2] = 0x2020000000;
    v125 = 0;
    v91 = (void *)*MEMORY[0x1E0D34098];
    v39 = *MEMORY[0x1E0D34098];
    v93 = *MEMORY[0x1E0D340A8];
    v142[0] = *MEMORY[0x1E0D340A8];
    v142[1] = v39;
    v143[0] = &unk_1E8B32E38;
    v143[1] = &unk_1E8B32E50;
    v90 = *MEMORY[0x1E0D340A0];
    v142[2] = *MEMORY[0x1E0D340A0];
    v143[2] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v143, v142, 3);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v38);
    -[HMDCameraIDSDeviceConnection sessionID](v12, "sessionID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v141[0] = CFSTR("IDSSetupVideoConnection");
    v141[1] = CFSTR("IDSSetupConnectionRequested");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v141, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "markMilestoneForPath:", v42);

    v43 = (void *)MEMORY[0x1D17BA0A0]();
    v44 = v12;
    HMFGetOSLogHandle();
    v45 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v137 = 138543618;
      v138 = v46;
      v139 = 2112;
      v140 = v23;
      _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_INFO, "%{public}@Creating watch video connection with name: %@", v137, 0x16u);

    }
    objc_autoreleasePoolPop(v43);
    -[HMDCameraIDSDeviceConnection idsDeviceConnectionFactory](v44, "idsDeviceConnectionFactory");
    v47 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v119[0] = MEMORY[0x1E0C809B0];
    v119[1] = 3221225472;
    v119[2] = __62__HMDCameraIDSDeviceConnection__createStreamSocketWithDevice___block_invoke_27;
    v119[3] = &unk_1E89AA518;
    objc_copyWeak(&v123, &location);
    v89 = v23;
    v120 = v89;
    v122 = buf;
    group = v38;
    v121 = group;
    -[HMDCameraIDSDeviceConnection workQueue](v44, "workQueue");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, _QWORD *, void *))v47)[2](v47, v100, v40, v119, v48);
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    if (v98)
    {
      v34 = 0;
    }
    else
    {
      v49 = (void *)MEMORY[0x1D17BA0A0]();
      v50 = v44;
      HMFGetOSLogHandle();
      v51 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v137 = 138543362;
        v138 = v52;
        _os_log_impl(&dword_1CD062000, v51, OS_LOG_TYPE_ERROR, "%{public}@Failed to create video IDSDeviceConnection", v137, 0xCu);

      }
      objc_autoreleasePoolPop(v49);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1021);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_destroyWeak(&v123);
    if (!v98)
      goto LABEL_35;
    v135[0] = v93;
    v135[1] = v91;
    v136[0] = &unk_1E8B32E38;
    v136[1] = &unk_1E8B32E68;
    v135[2] = v90;
    v136[2] = v97;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v136, v135, 3);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(group);
    -[HMDCameraIDSDeviceConnection sessionID](v44, "sessionID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v134[0] = CFSTR("IDSSetupAudioConnection");
    v134[1] = CFSTR("IDSSetupConnectionRequested");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "markMilestoneForPath:", v55);

    v56 = (void *)MEMORY[0x1D17BA0A0]();
    v57 = v44;
    HMFGetOSLogHandle();
    v58 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v137 = 138543618;
      v138 = v59;
      v139 = 2112;
      v140 = v97;
      _os_log_impl(&dword_1CD062000, v58, OS_LOG_TYPE_INFO, "%{public}@Creating watch audio connection with name: %@", v137, 0x16u);

    }
    objc_autoreleasePoolPop(v56);
    -[HMDCameraIDSDeviceConnection idsDeviceConnectionFactory](v57, "idsDeviceConnectionFactory");
    v60 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v114[0] = MEMORY[0x1E0C809B0];
    v114[1] = 3221225472;
    v114[2] = __62__HMDCameraIDSDeviceConnection__createStreamSocketWithDevice___block_invoke_30;
    v114[3] = &unk_1E89AA518;
    objc_copyWeak(&v118, &location);
    v115 = v97;
    v117 = v126;
    v61 = group;
    v116 = v61;
    -[HMDCameraIDSDeviceConnection workQueue](v57, "workQueue");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, _QWORD *, void *))v60)[2](v60, v100, v53, v114, v62);
    v63 = (id)objc_claimAutoreleasedReturnValue();

    if (!v63)
    {
      context = (void *)MEMORY[0x1D17BA0A0]();
      v64 = v57;
      HMFGetOSLogHandle();
      v65 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v137 = 138543362;
        v138 = v66;
        _os_log_impl(&dword_1CD062000, v65, OS_LOG_TYPE_ERROR, "%{public}@Failed to create audio IDSDeviceConnection", v137, 0xCu);

      }
      objc_autoreleasePoolPop(context);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1022);
      v67 = objc_claimAutoreleasedReturnValue();

      v34 = (void *)v67;
    }

    objc_destroyWeak(&v118);
    if (v63)
    {
      v132[0] = v93;
      v132[1] = v91;
      v133[0] = &unk_1E8B32E80;
      v133[1] = &unk_1E8B32E68;
      v132[2] = v90;
      v133[2] = v95;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v133, v132, 3);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v61);
      -[HMDCameraIDSDeviceConnection sessionID](v57, "sessionID");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v131[0] = CFSTR("IDSSetupKeepAlive");
      v131[1] = CFSTR("IDSSetupConnectionRequested");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 2);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "markMilestoneForPath:", v69);

      v70 = (void *)MEMORY[0x1D17BA0A0]();
      v71 = v57;
      HMFGetOSLogHandle();
      v72 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v137 = 138543618;
        v138 = v73;
        v139 = 2112;
        v140 = v95;
        _os_log_impl(&dword_1CD062000, v72, OS_LOG_TYPE_INFO, "%{public}@Creating keep alive connection with name: %@", v137, 0x16u);

      }
      objc_autoreleasePoolPop(v70);
      -[HMDCameraIDSDeviceConnection idsDeviceConnectionFactory](v71, "idsDeviceConnectionFactory");
      v74 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v109[0] = MEMORY[0x1E0C809B0];
      v109[1] = 3221225472;
      v109[2] = __62__HMDCameraIDSDeviceConnection__createStreamSocketWithDevice___block_invoke_32;
      v109[3] = &unk_1E89AA518;
      objc_copyWeak(&v113, &location);
      v110 = v95;
      v112 = v124;
      v75 = v61;
      v111 = v75;
      -[HMDCameraIDSDeviceConnection workQueue](v71, "workQueue");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *, _QWORD *, void *))v74)[2](v74, v100, v94, v109, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v77)
      {
        v92 = (void *)MEMORY[0x1D17BA0A0]();
        v78 = v71;
        HMFGetOSLogHandle();
        v79 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v137 = 138543362;
          v138 = v80;
          _os_log_impl(&dword_1CD062000, v79, OS_LOG_TYPE_ERROR, "%{public}@Failed to create keep alive IDSDeviceConnection", v137, 0xCu);

        }
        objc_autoreleasePoolPop(v92);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1023);
        v81 = objc_claimAutoreleasedReturnValue();

        v34 = (void *)v81;
      }

      objc_destroyWeak(&v113);
      if (v77)
      {
        -[HMDCameraIDSDeviceConnection workQueue](v71, "workQueue");
        v82 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __62__HMDCameraIDSDeviceConnection__createStreamSocketWithDevice___block_invoke_33;
        block[3] = &unk_1E89AA540;
        objc_copyWeak(&v108, &location);
        v105 = v126;
        v106 = buf;
        v107 = v124;
        v102 = v98;
        v63 = v63;
        v103 = v63;
        v104 = v77;
        v83 = v77;
        dispatch_group_notify(v75, v82, block);

        objc_destroyWeak(&v108);
      }
    }
    else
    {
LABEL_35:
      v63 = 0;
    }

    _Block_object_dispose(v124, 8);
    _Block_object_dispose(v126, 8);
    _Block_object_dispose(buf, 8);

    objc_destroyWeak(&location);
    if (v34)
    {
      v84 = (void *)MEMORY[0x1D17BA0A0]();
      v85 = v44;
      HMFGetOSLogHandle();
      v86 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v87;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v34;
        _os_log_impl(&dword_1CD062000, v86, OS_LOG_TYPE_ERROR, "%{public}@Failed to create IDS connections: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v84);
      -[HMDCameraIDSDeviceConnection _socketOpenedWithError:](v85, "_socketOpenedWithError:", v34);
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "idsIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraIDSDeviceConnection idsProxyStreamService](v12, "idsProxyStreamService");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "devices");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v30;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v31;
      *(_WORD *)&buf[22] = 2112;
      v145 = v33;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not find IDSDevice matching IDS identifier %@. All devices: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1020);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraIDSDeviceConnection _socketOpenedWithError:](v12, "_socketOpenedWithError:", v34);
  }

}

- (void)startKeepAlive
{
  HMDCameraIDSDeviceConnection *v2;
  _QWORD block[5];

  v2 = self;
  if (self)
    self = (HMDCameraIDSDeviceConnection *)objc_getProperty(self, a2, 64, 1);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__HMDCameraIDSDeviceConnection_startKeepAlive__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = v2;
  dispatch_async(&self->super.super, block);
}

- (void)timerDidFire:(id)a3
{
  const char *v4;
  NSObject *Property;
  SEL v6;
  BOOL v7;
  char *v8;
  void *v9;
  void *v10;
  ssize_t v11;
  void *v12;
  HMDCameraIDSDeviceConnection *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDCameraIDSDeviceConnection *v18;
  NSObject *v19;
  void *v20;
  const char *_cmd;
  unsigned __int8 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  ssize_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  _cmd = (const char *)a3;
  if (self)
  {
    Property = objc_getProperty(self, v4, 64, 1);
    dispatch_assert_queue_V2(Property);
    if (objc_getProperty(self, v6, 80, 1) == _cmd)
    {
      v22 = ++self->_keepAliveCounter;
      -[HMDCameraIDSDeviceConnection keepAliveConnection](self, "keepAliveConnection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = send(objc_msgSend(v10, "socket"), &v22, 1uLL, 0);

      if (v11 == -1)
      {
        v12 = (void *)MEMORY[0x1D17BA0A0]();
        v13 = self;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v24 = v15;
          v25 = 1024;
          v26 = v22;
          _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Failed to send the sample data %d", buf, 0x12u);

        }
        objc_autoreleasePoolPop(v12);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1025);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraIDSDeviceConnection callSessionEnded:](v13, v16);

      }
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v24 = v20;
        v25 = 1024;
        v26 = v22;
        v27 = 2048;
        v28 = v11;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Data %u transfer is complete with total transferred bytes: %lu", buf, 0x1Cu);

      }
      objc_autoreleasePoolPop(v17);
    }
    else
    {
      v7 = objc_getProperty(self, _cmd, 88, 1) == _cmd;
      v8 = (char *)_cmd;
      if (!v7)
        goto LABEL_14;
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1026);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraIDSDeviceConnection callSessionEnded:](self, v9);

    }
  }
  else
  {
    dispatch_assert_queue_V2(0);
  }
  v8 = (char *)_cmd;
LABEL_14:

}

- (void)_socketOpenedWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)_callSessionEndedWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraIDSDeviceConnection sessionID](self, "sessionID");
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

- (HMDIDSService)idsProxyStreamService
{
  return self->_idsProxyStreamService;
}

- (IDSDeviceConnection)watchVideoConnection
{
  return (IDSDeviceConnection *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWatchVideoConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (IDSDeviceConnection)watchAudioConnection
{
  return (IDSDeviceConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWatchAudioConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (IDSDeviceConnection)keepAliveConnection
{
  return (IDSDeviceConnection *)objc_getProperty(self, a2, 56, 1);
}

- (void)setKeepAliveConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (id)idsDeviceConnectionFactory
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setIdsDeviceConnectionFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_idsDeviceConnectionFactory, 0);
  objc_storeStrong((id *)&self->_keepAliveByteReceiveTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_keepAliveByteSendTimer, 0);
  objc_storeStrong((id *)&self->_keepAliveSocketReceiveSource, 0);
  objc_storeStrong((id *)&self->_highPriorityQueue, 0);
  objc_storeStrong((id *)&self->_keepAliveConnection, 0);
  objc_storeStrong((id *)&self->_watchAudioConnection, 0);
  objc_storeStrong((id *)&self->_watchVideoConnection, 0);
  objc_storeStrong((id *)&self->_idsProxyStreamService, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)callSessionEnded:(void *)a1
{
  id v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __49__HMDCameraIDSDeviceConnection_callSessionEnded___block_invoke;
    v5[3] = &unk_1E89C2328;
    v5[4] = a1;
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __49__HMDCameraIDSDeviceConnection_callSessionEnded___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callSessionEndedWithError:", *(_QWORD *)(a1 + 40));
}

void __46__HMDCameraIDSDeviceConnection_startKeepAlive__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  SEL v5;
  SEL v6;
  SEL v7;
  id v8;
  SEL v9;
  SEL v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uintptr_t v14;
  SEL v15;
  NSObject *Property;
  dispatch_source_t v17;
  SEL v18;
  SEL v19;
  id v20;
  NSObject *v21;
  SEL v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  id location;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D286C8]);
    v4 = (void *)objc_msgSend(v3, "initWithTimeInterval:options:", 20, (double)(unint64_t)deviceConnectionKeepAliveTimerPeriod);
    objc_setProperty_atomic(v2, v5, v4, 80);

    objc_msgSend(objc_getProperty(v2, v6, 80, 1), "setDelegate:", v2);
    v8 = objc_getProperty(v2, v7, 64, 1);
    objc_msgSend(objc_getProperty(v2, v9, 80, 1), "setDelegateQueue:", v8);

    objc_msgSend(objc_getProperty(v2, v10, 80, 1), "resume");
    v11 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v11 = 0;
  }
  -[HMDCameraIDSDeviceConnection _startKeepAliveTimeoutTimer](v11);
  v12 = *(void **)(a1 + 32);
  if (v12)
  {
    objc_msgSend(v12, "keepAliveConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (int)objc_msgSend(v13, "socket");
    Property = objc_getProperty(v12, v15, 64, 1);
    v17 = dispatch_source_create(MEMORY[0x1E0C80DB8], v14, 0, Property);
    objc_setProperty_atomic(v12, v18, v17, 72);

    objc_initWeak(&location, v12);
    v20 = objc_getProperty(v12, v19, 72, 1);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __54__HMDCameraIDSDeviceConnection__setReceiveByteHandler__block_invoke;
    v24[3] = &unk_1E89BE3F8;
    v21 = v20;
    objc_copyWeak(&v25, &location);
    dispatch_source_set_event_handler(v21, v24);

    v23 = objc_getProperty(v12, v22, 72, 1);
    dispatch_resume(v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
}

- (uint64_t)_startKeepAliveTimeoutTimer
{
  void *v1;
  id v2;
  void *v3;
  SEL v4;
  SEL v5;
  SEL v6;
  id v7;
  SEL v8;
  SEL v9;

  if (result)
  {
    v1 = (void *)result;
    v2 = objc_alloc(MEMORY[0x1E0D286C8]);
    v3 = (void *)objc_msgSend(v2, "initWithTimeInterval:options:", 16, (double)(unint64_t)deviceConnectionKeepAliveResponseTimeoutPeriod);
    objc_setProperty_atomic(v1, v4, v3, 88);

    objc_msgSend(objc_getProperty(v1, v5, 88, 1), "setDelegate:", v1);
    v7 = objc_getProperty(v1, v6, 64, 1);
    objc_msgSend(objc_getProperty(v1, v8, 88, 1), "setDelegateQueue:", v7);

    return objc_msgSend(objc_getProperty(v1, v9, 88, 1), "resume");
  }
  return result;
}

void __54__HMDCameraIDSDeviceConnection__setReceiveByteHandler__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  ssize_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *Property;
  SEL v15;
  unsigned __int8 v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  ssize_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v16 = 0;
  objc_msgSend(WeakRetained, "keepAliveConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = recvfrom(objc_msgSend(v2, "socket"), &v16, 1uLL, 0, 0, 0);

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = WeakRetained;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v7;
    v19 = 1024;
    v20 = v16;
    v21 = 2048;
    v22 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Received keep-alive byte number %u with length %zd", buf, 0x1Cu);

  }
  objc_autoreleasePoolPop(v4);
  if (v3 < 0)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = v5;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Recv from socket returned error, marking the stream as failure", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1027);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraIDSDeviceConnection callSessionEnded:](v10, v13);

  }
  else if (v3)
  {
    -[HMDCameraIDSDeviceConnection _startKeepAliveTimeoutTimer]((uint64_t)v5);
  }
  else if (v5)
  {
    Property = objc_getProperty(v5, v8, 72, 1);
    dispatch_source_cancel(Property);
    objc_setProperty_atomic(v5, v15, 0, 72);
  }
  else
  {
    dispatch_source_cancel(0);
  }

}

uint64_t __62__HMDCameraIDSDeviceConnection__createStreamSocketWithDevice___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "uniqueIDOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "idsIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  return v6;
}

void __62__HMDCameraIDSDeviceConnection__createStreamSocketWithDevice___block_invoke_27(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = WeakRetained;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a2 == -1)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to create video connection: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 1024;
      v22 = a2;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Created watch video connection with name: %@ socket: %d", buf, 0x1Cu);

    }
    objc_autoreleasePoolPop(v7);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(v8, "sessionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = CFSTR("IDSSetupVideoConnection");
    v16[1] = CFSTR("IDSSetupConnectionComplete");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "markMilestoneForPath:", v14);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __62__HMDCameraIDSDeviceConnection__createStreamSocketWithDevice___block_invoke_30(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = WeakRetained;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a2 == -1)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to create audio connection: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 1024;
      v22 = a2;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Created watch audio connection with name: %@ socket: %d", buf, 0x1Cu);

    }
    objc_autoreleasePoolPop(v7);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(v8, "sessionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = CFSTR("IDSSetupAudioConnection");
    v16[1] = CFSTR("IDSSetupConnectionComplete");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "markMilestoneForPath:", v14);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __62__HMDCameraIDSDeviceConnection__createStreamSocketWithDevice___block_invoke_32(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = WeakRetained;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a2 == -1)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to create keep alive connection: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 1024;
      v22 = a2;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Created watch keep alive connection with name: %@ socket: %d", buf, 0x1Cu);

    }
    objc_autoreleasePoolPop(v7);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(v8, "sessionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = CFSTR("IDSSetupKeepAlive");
    v16[1] = CFSTR("IDSSetupConnectionComplete");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "markMilestoneForPath:", v14);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __62__HMDCameraIDSDeviceConnection__createStreamSocketWithDevice___block_invoke_33(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      {
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
        {
          objc_msgSend(WeakRetained, "setWatchVideoConnection:", *(_QWORD *)(a1 + 32));
          objc_msgSend(v3, "setWatchAudioConnection:", *(_QWORD *)(a1 + 40));
          v4 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v3, "setKeepAliveConnection:", *(_QWORD *)(a1 + 48)));
          v5 = v3;
          HMFGetOSLogHandle();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = 138543362;
            v25 = v7;
            _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully created stream sockets", (uint8_t *)&v24, 0xCu);

          }
          objc_autoreleasePoolPop(v4);
          objc_msgSend(v5, "_socketOpenedWithError:", 0);
          goto LABEL_21;
        }
        v20 = (void *)MEMORY[0x1D17BA0A0]();
        v12 = v3;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 138543362;
          v25 = v22;
          _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to open keep alive socket", (uint8_t *)&v24, 0xCu);

        }
        objc_autoreleasePoolPop(v20);
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = 1023;
      }
      else
      {
        v17 = (void *)MEMORY[0x1D17BA0A0]();
        v12 = v3;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 138543362;
          v25 = v19;
          _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to open video socket", (uint8_t *)&v24, 0xCu);

        }
        objc_autoreleasePoolPop(v17);
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = 1021;
      }
    }
    else
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = v3;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543362;
        v25 = v14;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to open audio socket", (uint8_t *)&v24, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = 1022;
    }
    objc_msgSend(v15, "hmInternalErrorWithCode:", v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_socketOpenedWithError:", v23);

    goto LABEL_21;
  }
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543362;
    v25 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Lost self while creating sockets", (uint8_t *)&v24, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
LABEL_21:

}

id __82__HMDCameraIDSDeviceConnection_initWithSessionID_workQueue_idsProxyStreamService___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v8 = (objc_class *)MEMORY[0x1E0D342C8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = a2;
  v13 = (void *)objc_msgSend([v8 alloc], "initSocketWithDevice:options:completionHandler:queue:", v12, v11, v10, v9);

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t25_43296 != -1)
    dispatch_once(&logCategory__hmf_once_t25_43296, &__block_literal_global_39_43297);
  return (id)logCategory__hmf_once_v26_43298;
}

void __43__HMDCameraIDSDeviceConnection_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v26_43298;
  logCategory__hmf_once_v26_43298 = v0;

}

@end
