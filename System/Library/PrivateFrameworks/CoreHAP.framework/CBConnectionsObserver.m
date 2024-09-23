@implementation CBConnectionsObserver

- (CBConnectionsObserver)initWithCentralManager:(id)a3 Queue:(id)a4 Error:(id *)a5
{
  id v8;
  id v9;
  CBConnectionsObserver *v10;
  CBConnectionsObserver *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  ATVModel *v21;
  ATVModel *model;
  char v23;
  void *v24;
  uint64_t v25;
  CBCentralManager *central;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v32;
  objc_super v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v33.receiver = self;
  v33.super_class = (Class)CBConnectionsObserver;
  v10 = -[CBConnectionsObserver init](&v33, sel_init);
  v11 = v10;
  if (a5)
    *a5 = 0;
  if (v10)
  {
    v10->_hasStarted = 1;
    objc_storeWeak((id *)&v10->_dispatchQueue, v9);
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = getprogname();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%s-%u"), v13, getpid());
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)sessionName;
    sessionName = v14;

    g_ctx = (uint64_t)sessionEventCallback;
    unk_1EFA2AF20 = serviceEventCallback;
    qword_1EFA2AF28 = (uint64_t)localDeviceCallback;
    xmmword_1EFA2AF88 = 0u;
    *(_OWORD *)&qword_1EFA2AF98 = 0u;
    xmmword_1EFA2AFA8 = 0u;
    unk_1EFA2AFB8 = 0u;
    xmmword_1EFA2AFC8 = 0u;
    *(_OWORD *)&qword_1EFA2AFD8 = 0u;
    xmmword_1EFA2AFE8 = 0u;
    *(_OWORD *)&qword_1EFA2AFF8 = 0u;
    *(_DWORD *)((char *)&qword_1EFA2B000 + 7) = 0;
    v16 = IsAppleTV();
    v17 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v19)
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v20;
        _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] running on Apple TV \n", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      v21 = objc_alloc_init(ATVModel);
      model = v11->_model;
      v11->_model = v21;

      v23 = 1;
    }
    else
    {
      if (v19)
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v24;
        _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] running on iOS device \n", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      v23 = 0;
    }
    byte_1EFA2AF50 = v23;
    qword_1EFA2AF60 = 0;
    *(_QWORD *)&dword_1EFA2AF68 = 0;
    qword_1EFA2AF58 = 18;
    *(_QWORD *)&dword_1EFA2AF74 = 0x3E4CCCCD3D4CCCCDLL;
    dword_1EFA2AF7C = 1086324736;
    dword_1EFA2AF70 = 5;
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97728]), "initWithDelegate:queue:", v11, v9);
    central = v11->_central;
    v11->_central = (CBCentralManager *)v25;

    if (-[CBCentralManager state](v11->_central, "state") == 5)
    {
      v32 = 0;
      -[CBConnectionsObserver attachSessionWithError:](v11, "attachSessionWithError:", &v32);
      v27 = v32;
      if (v27)
      {
        v28 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v35 = v30;
          v36 = 2112;
          v37 = v27;
          _os_log_impl(&dword_1CCE01000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] initWithCentralManager failed to attache MobileBluetooth session, error :%@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v28);
        if (a5)
          *a5 = objc_retainAutorelease(v27);
      }

    }
  }

  return v11;
}

- (BOOL)cleanupWithError:(id *)a3
{
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
    *a3 = 0;
  if (!-[CBConnectionsObserver hasStarted](self, "hasStarted"))
    return 1;
  -[CBConnectionsObserver setHasStarted:](self, "setHasStarted:", 0);
  -[CBConnectionsObserver setCentral:](self, "setCentral:", 0);
  if (qword_1EFA2AF48)
    qword_1EFA2AF48 = 0;
  if (!qword_1EFA2AF40)
    return 1;
  v5 = BTSessionDetachWithQueue();
  v6 = (_DWORD)v5 == 0;
  if ((_DWORD)v5)
  {
    v7 = v5;
    v8 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v10;
      v19 = 1024;
      v20 = v7;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] BTSessionDetachWithQueue failed with error %d", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v8);
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to detach session, code %d"), v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CB2D50];
      v16 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("CBConnectionsObserver"), 1, v13);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  qword_1EFA2AF40 = 0;
  return v6;
}

- (BOOL)attachSessionWithError:(id *)a3
{
  BOOL v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v8;
  int v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = qword_1EFA2AF48 != 0;
  if (qword_1EFA2AF48)
  {
    v4 = (void *)MEMORY[0x1D17B7244](self, a2, a3);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] BTSessionAttachWithQueue already attached\n", (uint8_t *)&v12, 0xCu);

    }
  }
  else
  {
    objc_msgSend((id)sessionName, "UTF8String", a3);
    -[CBConnectionsObserver dispatchQueue](self, "dispatchQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = BTSessionAttachWithQueue();

    if (!v9)
      return 1;
    v4 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 1024;
      v15 = v9;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] BTSessionAttachWithQueue with error %d \n", (uint8_t *)&v12, 0x12u);

    }
  }

  objc_autoreleasePoolPop(v4);
  return v3;
}

- (int)getAvailableHAPConnections
{
  int ModulePower;
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  float v25;
  void *v26;
  NSObject *v27;
  void *v28;
  float v29;
  void *v30;
  NSObject *v31;
  void *v32;
  float v33;
  float v34;
  float v35;
  unint64_t v36;
  void *v37;
  NSObject *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  float v49;
  double v50;
  int v51;
  int v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  uint8_t v60[4];
  void *v61;
  __int16 v62;
  double v63;
  __int16 v64;
  int v65;
  _BYTE buf[32];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  if (!-[CBConnectionsObserver hasStarted](self, "hasStarted"))
    return 0;
  *(_DWORD *)((char *)&qword_1EFA2B000 + 7) = 0;
  xmmword_1EFA2AFE8 = 0u;
  *(_OWORD *)&qword_1EFA2AFF8 = 0u;
  xmmword_1EFA2AFC8 = 0u;
  *(_OWORD *)&qword_1EFA2AFD8 = 0u;
  xmmword_1EFA2AFA8 = 0u;
  unk_1EFA2AFB8 = 0u;
  xmmword_1EFA2AF88 = 0u;
  *(_OWORD *)&qword_1EFA2AF98 = 0u;
  -[CBConnectionsObserver updateBleStatus:](self, "updateBleStatus:", &g_ctx);
  if (qword_1EFA2AF48)
  {
    ModulePower = BTLocalDeviceGetModulePower();
    if (ModulePower)
    {
      v4 = ModulePower;
      v5 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v7;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v4;
        _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] updateClassicStatus: BTLocalDeviceGetModulePower failed with error %d", buf, 0x12u);

      }
      goto LABEL_12;
    }
    v5 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 0;
      v10 = "%{public}@[CBConnectionsObserver] updateClassicStatus: not powered on, power status %d";
      v11 = v6;
      v12 = 18;
      goto LABEL_11;
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v9;
      v10 = "%{public}@[CBConnectionsObserver] updateClassicStatus: no local device found, has initialization failed?";
      v11 = v6;
      v12 = 12;
LABEL_11:
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);

    }
  }
LABEL_12:

  objc_autoreleasePoolPop(v5);
  v71 = xmmword_1EFA2AFE8;
  v72 = *(_OWORD *)&qword_1EFA2AFF8;
  v73 = qword_1EFA2B008;
  v67 = xmmword_1EFA2AFA8;
  v68 = unk_1EFA2AFB8;
  v69 = xmmword_1EFA2AFC8;
  v70 = *(_OWORD *)&qword_1EFA2AFD8;
  *(_OWORD *)buf = xmmword_1EFA2AF88;
  *(_OWORD *)&buf[16] = *(_OWORD *)&qword_1EFA2AF98;
  if (byte_1EFA2AF50)
  {
    v13 = +[ATVModel atvStateFromState:](ATVModel, "atvStateFromState:", buf);
    -[CBConnectionsObserver model](self, "model");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "findTupleForATVState:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  v16 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v60 = 138543618;
    v61 = v18;
    v62 = 2112;
    v63 = *(double *)&v15;
    _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] tuple is %@", v60, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  if (!v15)
  {
    v19 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v60 = 138543362;
      v61 = v21;
      _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] updateBandwidth: work-in-progress", v60, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    v22 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v60 = 138543362;
      v61 = v24;
      _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] updateBandwidth: TODO this is work-in-progress", v60, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    v25 = (float)(*(float *)&dword_1EFA2AF7C * (float)(unint64_t)v71) / (float)(unint64_t)qword_1EFA2AF58;
    v26 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v60 = 138543618;
      v61 = v28;
      v62 = 2048;
      v63 = *(double *)&buf[24];
      _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] updateBandwidth: A2DPActive: %ld\n", v60, 0x16u);

    }
    v29 = v25 + 0.0;

    objc_autoreleasePoolPop(v26);
    if (*(_QWORD *)&buf[24])
    {
      v30 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v60 = 138543362;
        v61 = v32;
        _os_log_impl(&dword_1CCE01000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] updateBandwidth: TODO add formula for A2DP bandwidth", v60, 0xCu);

      }
      objc_autoreleasePoolPop(v30);
    }
    v33 = (float)(v29
                + (float)((float)((float)((float)(unint64_t)v70 + (float)(unint64_t)v70)
                                + (float)((float)*((unint64_t *)&v70 + 1) * 4.0))
                        / (float)(unint64_t)qword_1EFA2AF58))
        + (float)((float)(unint64_t)v69 * *(float *)&dword_1EFA2AF78);
    if ((_BYTE)v73)
    {
      v34 = *(float *)&dword_1EFA2AF68;
      if (*(float *)&dword_1EFA2AF68 < unk_1EFA2AF6C)
        v34 = unk_1EFA2AF6C;
      v33 = (float)((float)(v33 + *(float *)&qword_1EFA2AF60) + *((float *)&qword_1EFA2AF60 + 1)) + v34;
    }
    v35 = *(float *)&dword_1EFA2AF74;
    v36 = *((_QWORD *)&v68 + 1);
    v37 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v60 = 138543362;
      v61 = v39;
      _os_log_impl(&dword_1CCE01000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] updateBandwidth: TODO add formula for shared antenna\n", v60, 0xCu);

    }
    objc_autoreleasePoolPop(v37);
    *(float *)&v40 = fminf((float)(v33 + (float)(v35 * (float)v36)) * 100.0, 100.0);
    LODWORD(v41) = LODWORD(v40);
    +[HAPBTLETuple makeTupleWithState:MaxHAPConnections:MinBandwidth:MaxBandwidth:](HAPBTLETuple, "makeTupleWithState:MaxHAPConnections:MinBandwidth:MaxBandwidth:", buf, (dword_1EFA2AF70 + v68 - DWORD2(v68)), v40, v41);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[HAPBTLETuple state2String:](HAPBTLETuple, "state2String:", buf);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v60 = 138543618;
    v61 = v44;
    v62 = 2112;
    v63 = *(double *)&v45;
    _os_log_impl(&dword_1CCE01000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] status\n%@", v60, 0x16u);

  }
  objc_autoreleasePoolPop(v42);
  v46 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "maxBandwidth");
    v50 = v49;
    v51 = objc_msgSend(v15, "maxHAPConnections");
    *(_DWORD *)v60 = 138543874;
    v61 = v48;
    v62 = 2048;
    v63 = v50;
    v64 = 1024;
    v65 = v51;
    _os_log_impl(&dword_1CCE01000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] max bandwidth: %f%% maxHAPConnections %d \n", v60, 0x1Cu);

  }
  objc_autoreleasePoolPop(v46);
  v52 = objc_msgSend(v15, "maxHAPConnections");
  v8 = v52 & ~(v52 >> 31);
  if (byte_1EFA2AF50)
  {
    if (v8 <= 1)
      v8 = 1;
    v53 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v60 = 138543618;
      v61 = v55;
      v62 = 1024;
      LODWORD(v63) = v8;
      _os_log_impl(&dword_1CCE01000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] adjusted for ATV maxHAPConnections: %d \n", v60, 0x12u);

    }
    objc_autoreleasePoolPop(v53);
  }
  v56 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v57 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v60 = 138543618;
    v61 = v58;
    v62 = 1024;
    LODWORD(v63) = v8;
    _os_log_impl(&dword_1CCE01000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] returning maxHAPConnections: %d \n", v60, 0x12u);

  }
  objc_autoreleasePoolPop(v56);

  return v8;
}

- (id)getStatus
{
  return 0;
}

- (void)updateBleStatus:(BTRemoteContext *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  unint64_t lowEnergyConnections;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  unint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  a3->var6.lowEnergyConnections = 0;
  -[CBConnectionsObserver central](self, "central");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[CBConnectionsObserver central](self, "central");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "state");

    if (v8 == 5)
    {
      -[CBConnectionsObserver central](self, "central");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "retrieveConnectedPeripheralsWithServices:allowAll:", MEMORY[0x1E0C9AA60], 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      a3->var6.lowEnergyConnections = (int)objc_msgSend(v10, "count");
      if (a3->var5.var0)
      {
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v27 = v10;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v29 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              v17 = (void *)MEMORY[0x1D17B7244]();
              HMFGetOSLogHandle();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                HMFGetLogIdentifier();
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v33 = v19;
                v34 = 2112;
                v35 = (unint64_t)v16;
                _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] updateBleStatus device %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v17);
              if (objc_msgSend(v16, "hasTag:", CFSTR("FastConnection")))
              {
                ++a3->var6.leRemote;
                v20 = (void *)MEMORY[0x1D17B7244]();
                HMFGetOSLogHandle();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v33 = v22;
                  _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] updateBleStatus found a LE Remote", buf, 0xCu);

                }
                objc_autoreleasePoolPop(v20);
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v13);
        }

        v10 = v27;
      }
      v23 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        lowEnergyConnections = a3->var6.lowEnergyConnections;
        *(_DWORD *)buf = 138543618;
        v33 = v25;
        v34 = 2048;
        v35 = lowEnergyConnections;
        _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] updateBleStatus found connected BLE devices: %ld", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v23);

    }
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)cbManagerState2String;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v4, "state"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v7;
    v21 = 2112;
    v22 = v10;
    v23 = 2048;
    v24 = objc_msgSend(v4, "state");
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] centralManagerDidUpdateState state %@ (%ld)", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  if (objc_msgSend(v4, "state") == 5)
  {
    v11 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v13;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] centralManagerDidUpdateState trying to (re)attach MobileBluetooth session", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v18 = 0;
    -[CBConnectionsObserver attachSessionWithError:](self, "attachSessionWithError:", &v18);
    v14 = v18;
    if (v14)
    {
      v15 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v17;
        v21 = 2112;
        v22 = v14;
        _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] centralManagerDidUpdateState failed to (re)attach MobileBluetooth session, error :%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
    }

  }
}

- (CBCentralManager)central
{
  return (CBCentralManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCentral:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_dispatchQueue);
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeWeak((id *)&self->_dispatchQueue, a3);
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (ATVModel)model
{
  return (ATVModel *)objc_getProperty(self, a2, 32, 1);
}

- (void)setModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_dispatchQueue);
  objc_storeStrong((id *)&self->_central, 0);
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[3];
  _QWORD v10[9];
  _QWORD v11[9];
  _QWORD v12[6];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  v12[0] = &unk_1E89896C8;
  v12[1] = &unk_1E89896E0;
  v13[0] = CFSTR("Unknown");
  v13[1] = CFSTR("Resetting");
  v12[2] = &unk_1E89896F8;
  v12[3] = &unk_1E8989710;
  v13[2] = CFSTR("Unsupported");
  v13[3] = CFSTR("Unauthorized");
  v12[4] = &unk_1E8989728;
  v12[5] = &unk_1E8989740;
  v13[4] = CFSTR("Powered Off");
  v13[5] = CFSTR("Powered On");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 6);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)cbManagerState2String;
  cbManagerState2String = v2;

  v10[0] = &unk_1E8989758;
  v10[1] = &unk_1E8989770;
  v11[0] = CFSTR("Power State Changed");
  v11[1] = CFSTR("Discoverability Changed");
  v10[2] = &unk_1E8989788;
  v10[3] = &unk_1E89897A0;
  v11[2] = CFSTR("Connectability Changed");
  v11[3] = CFSTR("Pairing status Changed");
  v10[4] = &unk_1E89897B8;
  v10[5] = &unk_1E89897D0;
  v11[4] = CFSTR("Connection status Changed");
  v11[5] = CFSTR("Discovery Started");
  v10[6] = &unk_1E89897E8;
  v10[7] = &unk_1E8989800;
  v11[6] = CFSTR("Discovery Stopped");
  v11[7] = CFSTR("Advertising Status Changed");
  v10[8] = &unk_1E8989818;
  v11[8] = CFSTR("Name Changed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 9);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)btLocalDeviceState2String;
  btLocalDeviceState2String = v4;

  v8[0] = &unk_1E8989758;
  v8[1] = &unk_1E8989818;
  v9[0] = CFSTR("Service Connect");
  v9[1] = CFSTR("Service Disconnect");
  v8[2] = &unk_1E8989770;
  v9[2] = CFSTR("Service Dependent Event");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)btServiceEvent2String;
  btServiceEvent2String = v6;

}

@end
