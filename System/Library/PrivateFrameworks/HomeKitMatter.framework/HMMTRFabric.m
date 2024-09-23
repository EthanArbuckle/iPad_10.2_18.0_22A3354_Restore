@implementation HMMTRFabric

- (HMMTRFabric)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  HMMTRFabric *v8;
  HMMTRFabric *v9;
  HMMTRAccessControl *v10;
  HMMTRAccessControl *accessControl;
  HMMTRFabricData *v12;
  HMMTRFabricData *fabricData;
  HMMTRControllerData *v14;
  HMMTRControllerData *currentDeviceNodeData;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HMMTRFabric;
  v8 = -[HMMTRFabric init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = objc_alloc_init(HMMTRAccessControl);
    accessControl = v9->_accessControl;
    v9->_accessControl = v10;

    -[HMMTRAccessControl setFabric:](v9->_accessControl, "setFabric:", v9);
    v12 = -[HMMTRFabricData initWithFabric:]([HMMTRFabricData alloc], "initWithFabric:", v9);
    fabricData = v9->_fabricData;
    v9->_fabricData = v12;

    v14 = -[HMMTRControllerData initWithFabric:]([HMMTRControllerData alloc], "initWithFabric:", v9);
    currentDeviceNodeData = v9->_currentDeviceNodeData;
    v9->_currentDeviceNodeData = v14;

    objc_storeStrong((id *)&v9->_workQueue, a4);
    v9->_cachedDataValid = 1;
  }

  return v9;
}

- (void)createNewFabricIdentityWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMMTRFabric workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__HMMTRFabric_createNewFabricIdentityWithCompletion___block_invoke;
  v7[3] = &unk_250F22768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)loadFabricAndControllerDataForPairing:(BOOL)a3 fetchFromResident:(BOOL)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  BOOL v13;
  BOOL v14;

  v8 = a5;
  -[HMMTRFabric workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__HMMTRFabric_loadFabricAndControllerDataForPairing_fetchFromResident_completion___block_invoke;
  block[3] = &unk_250F20DB0;
  v13 = a3;
  v14 = a4;
  block[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(v9, block);

}

- (void)invalidateCachedData
{
  -[HMMTRFabric setCachedDataValid:](self, "setCachedDataValid:", 0);
}

- (BOOL)isCachedDataValid
{
  return self->_cachedDataValid;
}

- (BOOL)isValid
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  BOOL v38;
  void *v40;
  HMMTRFabric *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  HMMTRFabric *v47;
  NSObject *v48;
  void *v49;
  HMMTRFabric *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  if (!-[HMMTRFabric isCachedDataValid](self, "isCachedDataValid"))
    return 0;
  -[HMMTRFabric fabricID](self, "fabricID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  -[HMMTRFabric fabricID](self, "fabricID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToNumber:", &unk_250F3F4C8);

  if ((v6 & 1) != 0)
    return 0;
  -[HMMTRFabric fabricData](self, "fabricData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rootCert");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_15;
  v9 = (void *)v8;
  -[HMMTRFabric currentDeviceNodeData](self, "currentDeviceNodeData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "operationalCertificate");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
LABEL_14:

LABEL_15:
    return 0;
  }
  v12 = (void *)v11;
  -[HMMTRFabric fabricData](self, "fabricData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "residentNodeID");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {

    goto LABEL_14;
  }
  v15 = (void *)v14;
  -[HMMTRFabric fabricData](self, "fabricData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ipk");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)MEMORY[0x24BDDB5B0];
    -[HMMTRFabric fabricData](self, "fabricData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "rootCert");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "convertX509Certificate:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB5A8]), "initWithTLVBytes:", v21);
    v23 = v22;
    if (v22)
    {
      objc_msgSend(v22, "subject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "fabricID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRFabric fabricID](self, "fabricID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "isEqualToNumber:", v26);

      if ((v27 & 1) != 0)
      {
        v28 = (void *)MEMORY[0x24BDDB5B0];
        -[HMMTRFabric currentDeviceNodeData](self, "currentDeviceNodeData");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "operationalCertificate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "convertX509Certificate:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB5A8]), "initWithTLVBytes:", v31);
        v33 = v32;
        if (v32)
        {
          objc_msgSend(v32, "subject");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "fabricID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMMTRFabric fabricID](self, "fabricID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v35, "isEqualToNumber:", v36);

          if ((v37 & 1) != 0)
          {
            v38 = 1;
LABEL_30:

            goto LABEL_31;
          }
          v46 = (void *)MEMORY[0x242656984]();
          v50 = self;
          HMFGetOSLogHandle();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "subject");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "fabricID");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = 138543618;
            v54 = v49;
            v55 = 2112;
            v56 = v52;
            _os_log_impl(&dword_23E95B000, v48, OS_LOG_TYPE_ERROR, "%{public}@Operational certificate fabric ID %@ doesn't match fabric ID of current fabric", (uint8_t *)&v53, 0x16u);

            goto LABEL_28;
          }
        }
        else
        {
          v46 = (void *)MEMORY[0x242656984]();
          v47 = self;
          HMFGetOSLogHandle();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = 138543362;
            v54 = v49;
            _os_log_impl(&dword_23E95B000, v48, OS_LOG_TYPE_ERROR, "%{public}@Couldn't extract certificate info", (uint8_t *)&v53, 0xCu);
LABEL_28:

          }
        }

        objc_autoreleasePoolPop(v46);
        -[HMMTRFabric setCachedDataValid:](self, "setCachedDataValid:", 0);
        v38 = 0;
        goto LABEL_30;
      }
      v40 = (void *)MEMORY[0x242656984]();
      v41 = self;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "subject");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "fabricID");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 138543618;
        v54 = v43;
        v55 = 2112;
        v56 = v45;
        _os_log_impl(&dword_23E95B000, v42, OS_LOG_TYPE_ERROR, "%{public}@Root certificate fabric ID %@ doesn't match fabric ID of current fabric", (uint8_t *)&v53, 0x16u);

        goto LABEL_22;
      }
    }
    else
    {
      v40 = (void *)MEMORY[0x242656984]();
      v41 = self;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 138543362;
        v54 = v43;
        _os_log_impl(&dword_23E95B000, v42, OS_LOG_TYPE_ERROR, "%{public}@Couldn't extract certificate info", (uint8_t *)&v53, 0xCu);
LABEL_22:

      }
    }

    objc_autoreleasePoolPop(v40);
    -[HMMTRFabric setCachedDataValid:](v41, "setCachedDataValid:", 0);
    v38 = 0;
LABEL_31:

    return v38;
  }
  return 0;
}

- (BOOL)_createNewFabricData
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  HMMTRFabric *v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  HMMTRFabric *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  HMMTRFabric *v47;
  NSObject *v48;
  void *v49;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  -[HMMTRFabric workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x24BDDB5B0];
  -[HMMTRFabric storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nocSigner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRFabric storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "certificateIssuerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRFabric fabricID](self, "fabricID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  objc_msgSend(v4, "createRootCertificate:issuerID:fabricID:error:", v6, v8, v9, &v57);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v57;

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRFabric storage](self, "storage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isResidentDevice");

    v54 = v12;
    v55 = v10;
    v52 = v11;
    if (v14)
    {
      v15 = v12;
      v51 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID"));
      v21 = objc_claimAutoreleasedReturnValue();
      -[HMMTRFabric delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "accessoryAdministerPrivilegeCATID:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = (void *)MEMORY[0x24BDBCF20];
        v58 = v23;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v58, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setWithArray:", v25);
        v26 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v26 = 0;
      }
      v51 = (void *)v26;

      v15 = (id)v21;
    }
    v27 = (void *)MEMORY[0x24BDDB5B0];
    -[HMMTRFabric storage](self, "storage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "nocSigner");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRFabric storage](self, "storage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "operationalKeyPair");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "publicKey");
    -[HMMTRFabric fabricID](self, "fabricID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v52;
    v53 = v15;
    objc_msgSend(v27, "createOperationalCertificate:signingCertificate:operationalPublicKey:fabricID:nodeID:caseAuthenticatedTags:error:", v29, v55, v32, v33, v15, v51, &v56);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v56;

    if (!v34)
    {
      v42 = (void *)MEMORY[0x242656984]();
      v43 = self;
      HMFGetOSLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v45;
        v61 = 2112;
        v62 = v35;
        _os_log_impl(&dword_23E95B000, v44, OS_LOG_TYPE_INFO, "%{public}@Failed to generate operational certificate with error %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v42);
      v20 = 0;
      v37 = v54;
      v10 = v55;
      goto LABEL_23;
    }
    +[HMMTRStorage generateIPK](HMMTRStorage, "generateIPK");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v37 = v54;
      v10 = v55;
      if (v54)
      {
        -[HMMTRFabric fabricData](self, "fabricData");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setRootCert:", v55);

        -[HMMTRFabric currentDeviceNodeData](self, "currentDeviceNodeData");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setOperationalCertificate:", v34);

        -[HMMTRFabric fabricData](self, "fabricData");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setIpk:", v36);

        -[HMMTRFabric fabricData](self, "fabricData");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setResidentNodeID:", v54);

        -[HMMTRFabric setCachedDataValid:](self, "setCachedDataValid:", 1);
        v20 = -[HMMTRFabric isValid](self, "isValid");
LABEL_22:

        v15 = v53;
LABEL_23:

        v11 = v35;
        goto LABEL_24;
      }
    }
    else
    {
      v46 = (void *)MEMORY[0x242656984]();
      v47 = self;
      HMFGetOSLogHandle();
      v48 = objc_claimAutoreleasedReturnValue();
      v37 = v54;
      v10 = v55;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v60 = v49;
        _os_log_impl(&dword_23E95B000, v48, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate IPK", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v46);
    }
    v20 = 0;
    goto LABEL_22;
  }
  v16 = (void *)MEMORY[0x242656984]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v60 = v19;
    v61 = 2112;
    v62 = v11;
    _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_INFO, "%{public}@Failed to generate root certificate with error %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  v20 = 0;
LABEL_24:

  return v20;
}

- (void)_clearNewFabricData
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HMMTRFabric workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMMTRFabric fabricData](self, "fabricData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRootCert:", 0);

  -[HMMTRFabric currentDeviceNodeData](self, "currentDeviceNodeData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOperationalCertificate:", 0);

  -[HMMTRFabric fabricData](self, "fabricData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIpk:", 0);

  -[HMMTRFabric fabricData](self, "fabricData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setResidentNodeID:", 0);

  -[HMMTRFabric setCachedDataValid:](self, "setCachedDataValid:", 0);
}

- (id)_getDataToPersist
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMMTRFabric *v6;
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
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  HMMTRFabric *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  id v74;
  uint8_t v75[128];
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __int16 v83;
  uint64_t v84;
  char v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  -[HMMTRFabric workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v77 = v8;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Dumping stack storage for params", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMMTRFabric fabricData](v6, "fabricData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ipk");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("IPK"));

  v11 = (void *)MEMORY[0x24BDDB5B0];
  -[HMMTRFabric fabricData](v6, "fabricData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rootCert");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertX509Certificate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("f/1/r"));

  v15 = (void *)MEMORY[0x24BDDB5B0];
  -[HMMTRFabric currentDeviceNodeData](v6, "currentDeviceNodeData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "operationalCertificate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "convertX509Certificate:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("f/1/n"));

  v84 = 0x12C1349002515;
  v85 = 24;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v84, 9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("f/1/m"));

  -[HMMTRFabric storage](v6, "storage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "operationalKeyPair");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "serialize");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("f/1/o"));

  v82 = 0x104013602002415;
  v83 = 6168;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v82, 10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("g/fidx"));

  v81 = 0x1829625600002615;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v81, 8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("g/lkgt"));

  v25 = (void *)MEMORY[0x24BDDB5B0];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("f/1/n"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "convertMatterCertificate:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("HMD.MTRPlugin.OperationalCert"));

  v28 = (void *)MEMORY[0x24BDDB5B0];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("f/1/r"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "convertMatterCertificate:", v29);
  v30 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("HMD.MTRPlugin.RootCert"));

  -[HMMTRFabric storage](v6, "storage");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v30) = objc_msgSend(v31, "isResidentDevice");

  if ((v30 & 1) != 0)
    goto LABEL_13;
  v32 = (void *)MEMORY[0x24BDDB5B0];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("f/1/r"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "convertMatterCertificate:", v33);
  v68 = objc_claimAutoreleasedReturnValue();

  -[HMMTRFabric fabricData](v6, "fabricData");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "residentNodeID");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMMTRFabric delegate](v6, "delegate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "accessoryAdministerPrivilegeCATID:", 0);
  v36 = objc_claimAutoreleasedReturnValue();

  v67 = (void *)v36;
  if (v36)
  {
    v37 = (void *)MEMORY[0x24BDBCF20];
    v80 = v36;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v80, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setWithArray:", v38);
    v39 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v39 = 0;
  }
  v40 = (void *)MEMORY[0x24BDDB5B0];
  -[HMMTRFabric storage](v6, "storage");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "nocSigner");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRFabric storage](v6, "storage");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "operationalKeyPair");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "publicKey");
  -[HMMTRFabric fabricID](v6, "fabricID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0;
  v46 = (void *)v68;
  v66 = (void *)v39;
  objc_msgSend(v40, "createOperationalCertificate:signingCertificate:operationalPublicKey:fabricID:nodeID:caseAuthenticatedTags:error:", v41, v68, v44, v45, v69, v39, &v74);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v74;

  if (v47)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v47, CFSTR("HMD.MTRPlugin.OperationalCert"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v68, CFSTR("HMD.MTRPlugin.RootCert"));
    objc_msgSend(MEMORY[0x24BDDB5B0], "convertX509Certificate:", v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v49, CFSTR("f/1/n"));

  }
  else
  {
    v50 = (void *)MEMORY[0x242656984]();
    v51 = v6;
    HMFGetOSLogHandle();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v77 = v53;
      v78 = 2112;
      v79 = v48;
      _os_log_impl(&dword_23E95B000, v52, OS_LOG_TYPE_ERROR, "%{public}@Failed to persist legacy node with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v50);
    v46 = (void *)v68;
  }

  if (v47)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v55 = v4;
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v57; ++i)
        {
          if (*(_QWORD *)v71 != v58)
            objc_enumerationMutation(v55);
          v60 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
          objc_msgSend(v55, "objectForKeyedSubscript:", v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "base64EncodedStringWithOptions:", 0);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setObject:forKeyedSubscript:", v62, v60);

        }
        v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
      }
      while (v57);
    }

    v63 = (void *)objc_msgSend(v54, "copy");
  }
  else
  {
    v63 = 0;
  }

  return v63;
}

- (void)_loadFromRemoteWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMMTRFabric *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMMTRFabric *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMMTRFabric workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x242656984]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v9;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Loading certificate data from remote source", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMMTRFabric accessControl](v7, "accessControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "currentUserPrivilege");

  if (v11 == 1)
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __45__HMMTRFabric__loadFromRemoteWithCompletion___block_invoke;
    v23[3] = &unk_250F23CD0;
    v23[4] = v7;
    v24 = v4;
    -[HMMTRFabric _loadFromStorageWithCompletion:](v7, "_loadFromStorageWithCompletion:", v23);
    v12 = v24;
LABEL_9:

    goto LABEL_10;
  }
  -[HMMTRFabric accessControl](v7, "accessControl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "currentUserPrivilege") == 2)
  {

LABEL_8:
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __45__HMMTRFabric__loadFromRemoteWithCompletion___block_invoke_33;
    v21[3] = &unk_250F23CD0;
    v21[4] = v7;
    v22 = v4;
    -[HMMTRFabric _loadFromResidentWithCompletion:](v7, "_loadFromResidentWithCompletion:", v21);
    v12 = v22;
    goto LABEL_9;
  }
  -[HMMTRFabric accessControl](v7, "accessControl");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "currentUserPrivilege");

  if (v15 == 3)
    goto LABEL_8;
  v16 = (void *)MEMORY[0x242656984]();
  v17 = v7;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v19;
    _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_INFO, "%{public}@Unexpected user privilege for user", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v16);
  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v4 + 2))(v4, v20);

LABEL_10:
}

- (void)_loadFromDiskWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  HMMTRFabric *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMMTRFabric *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint32_t v25;
  void *v26;
  _QWORD v27[5];
  void (**v28)(id, void *);
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  HMMTRFabric *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  -[HMMTRFabric workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x242656984]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v9;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Loading certificate data from disk", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  if (!-[HMMTRFabric isCachedDataValid](v7, "isCachedDataValid"))
  {
    v13 = (void *)MEMORY[0x242656984]();
    v14 = v7;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v21;
      v22 = "%{public}@Cached data is not valid";
LABEL_13:
      v23 = v16;
      v24 = OS_LOG_TYPE_INFO;
      v25 = 12;
LABEL_14:
      _os_log_impl(&dword_23E95B000, v23, v24, v22, buf, v25);

    }
LABEL_15:

    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v26);

    goto LABEL_16;
  }
  -[HMMTRFabric fabricID](v7, "fabricID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v13 = (void *)MEMORY[0x242656984]();
    v14 = v7;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v21;
      v22 = "%{public}@Cannot read from disk when fabric ID is not valid";
      goto LABEL_13;
    }
    goto LABEL_15;
  }
  -[HMMTRFabric storage](v7, "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x242656984]();
  v14 = v7;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v12)
  {
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v21;
    v31 = 2112;
    v32 = v14;
    v22 = "%{public}@fabric storage is not set %@";
    v23 = v16;
    v24 = OS_LOG_TYPE_ERROR;
    v25 = 22;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v17;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@Reading disk data for current fabric", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v13);
  -[HMMTRFabric storage](v14, "storage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRFabric fabricID](v14, "fabricID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __43__HMMTRFabric__loadFromDiskWithCompletion___block_invoke;
  v27[3] = &unk_250F20DD8;
  v27[4] = v14;
  v28 = v4;
  objc_msgSend(v19, "fetchCachedOperationalCertificateForFabricID:completionHandler:", v20, v27);

LABEL_16:
}

- (void)_loadFromResidentWithCompletion:(id)a3
{
  -[HMMTRFabric _loadForPairingWithFetchFromResident:completion:](self, "_loadForPairingWithFetchFromResident:completion:", 1, a3);
}

- (void)_loadForPairingWithFetchFromResident:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  HMMTRFabric *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMMTRFabric *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  HMMTRFabric *v31;
  NSObject *v32;
  void *v33;
  CFErrorRef v34;
  void *v35;
  HMMTRFabric *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  id v41;
  CFErrorRef error;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v4 = a3;
  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[HMMTRFabric workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = "current device";
    if (v4)
      v13 = "resident";
    *(_DWORD *)buf = 138543618;
    v44 = v11;
    v45 = 2080;
    v46 = (void *)v13;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Loading certificate data for pairing from %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMMTRFabric storage](v9, "storage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "operationalKeyPair");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "publicKey");

  if (v16)
  {
    error = 0;
    -[HMMTRFabric storage](v9, "storage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "operationalKeyPair");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "publicKey");

    if (v19)
    {
      -[HMMTRFabric storage](v9, "storage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "operationalKeyPair");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = SecKeyCopyExternalRepresentation((SecKeyRef)objc_msgSend(v21, "publicKey"), &error);

      if (v22)
      {
        -[HMMTRFabric delegate](v9, "delegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRFabric fabricID](v9, "fabricID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = MEMORY[0x24BDAC760];
        v40[1] = 3221225472;
        v40[2] = __63__HMMTRFabric__loadForPairingWithFetchFromResident_completion___block_invoke;
        v40[3] = &unk_250F220F8;
        v40[4] = v9;
        v41 = v6;
        objc_msgSend(v23, "fetchOperationalCertificatesForNewFabricWithFabricID:publicKey:fetchFromResident:completion:", v24, v22, v4, v40);

      }
      else
      {
        v34 = error;
        v35 = (void *)MEMORY[0x242656984]();
        v36 = v9;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v44 = (uint64_t)v38;
          v45 = 2112;
          v46 = v34;
          _os_log_impl(&dword_23E95B000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert public key to NSData for transmission with error %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v35);
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v6 + 2))(v6, v39);

        v22 = 0;
      }
    }
    else
    {
      v30 = (void *)MEMORY[0x242656984]();
      v31 = v9;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v44 = (uint64_t)v33;
        _os_log_impl(&dword_23E95B000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to load certs from resident without operational key", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v30);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v6 + 2))(v6, v22);
    }

  }
  else
  {
    v25 = (void *)MEMORY[0x242656984]();
    v26 = v9;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = (uint64_t)v28;
      _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_ERROR, "%{public}@No operational key created yet. Aborting fabric cert loading.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v29);

  }
}

- (void)_loadFromStorageWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  HMMTRFabric *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  HMMTRFabric *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMMTRFabric *v29;
  NSObject *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  -[HMMTRFabric workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x242656984]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v9;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Loading certificate data from storage", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMMTRFabric fabricID](v7, "fabricID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMMTRFabric storage](v7, "storage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRFabric fabricID](v7, "fabricID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRFabric delegate](v7, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentDeviceControllerNodeID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v35 = 0;
    v32 = 0;
    v33 = 0;
    objc_msgSend(v11, "fetchCertificatesFromStorageForFabricID:controllerNodeID:rootCert:operationalCert:residentNodeID:ipk:", v12, v14, &v35, &v34, &v33, &v32);
    v15 = v35;
    v16 = v34;
    v17 = v33;
    v18 = v32;

    v19 = (void *)MEMORY[0x242656984]();
    v20 = v7;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v37 = v22;
      v38 = 2112;
      v39 = v15;
      v40 = 2112;
      v41 = v16;
      v42 = 2112;
      v43 = v17;
      v44 = 2112;
      v45 = v18;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_INFO, "%{public}@tempRootCert %@ && tempOperationalCert %@ && tempResidentNodeID %@ && tempOwnerIPK %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v19);
    if (v15 && v16 && v17 && v18)
    {
      -[HMMTRFabric fabricData](v20, "fabricData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setRootCert:", v15);

      -[HMMTRFabric currentDeviceNodeData](v20, "currentDeviceNodeData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setOperationalCertificate:", v16);

      -[HMMTRFabric fabricData](v20, "fabricData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setResidentNodeID:", v17);

      -[HMMTRFabric fabricData](v20, "fabricData");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setIpk:", v18);

      -[HMMTRFabric setCachedDataValid:](v20, "setCachedDataValid:", 1);
      v27 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v4[2](v4, v27);

  }
  else
  {
    v28 = (void *)MEMORY[0x242656984]();
    v29 = v7;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v31;
      _os_log_impl(&dword_23E95B000, v30, OS_LOG_TYPE_INFO, "%{public}@Cannot read from storage when fabric ID is not valid", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v15);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMMTRFabric fabricID](self, "fabricID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRFabric fabricID](self, "fabricID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Fabric ID"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRFabric isSystemCommissionerFabric](self, "isSystemCommissionerFabric");
  HMFBooleanToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("System Commissioner"), v8);
  objc_msgSend(v3, "addObject:", v9);

  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRFabric accessControl](self, "accessControl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Access Control"), v11);
  objc_msgSend(v3, "addObject:", v12);

  v13 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRFabric storage](self, "storage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Storage"), v14);
  objc_msgSend(v3, "addObject:", v15);

  v16 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRFabric fabricData](self, "fabricData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("Fabric Data"), v17);
  objc_msgSend(v3, "addObject:", v18);

  v19 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRFabric currentDeviceNodeData](self, "currentDeviceNodeData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithName:value:", CFSTR("Controller Data"), v20);
  objc_msgSend(v3, "addObject:", v21);

  v22 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRFabric isCachedDataValid](self, "isCachedDataValid");
  HMFBooleanToString();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithName:value:", CFSTR("Is Cached Data Valid"), v23);
  objc_msgSend(v3, "addObject:", v24);

  v25 = (void *)objc_msgSend(v3, "copy");
  return v25;
}

- (NSNumber)fabricID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFabricID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (BOOL)isSystemCommissionerFabric
{
  return self->_systemCommissionerFabric;
}

- (HMMTRAccessControl)accessControl
{
  return self->_accessControl;
}

- (void)setAccessControl:(id)a3
{
  objc_storeStrong((id *)&self->_accessControl, a3);
}

- (HMMTRFabricDelegate)delegate
{
  return (HMMTRFabricDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HMMTRStorage)storage
{
  return (HMMTRStorage *)objc_loadWeakRetained((id *)&self->_storage);
}

- (void)setStorage:(id)a3
{
  objc_storeWeak((id *)&self->_storage, a3);
}

- (HMMTRFabricData)fabricData
{
  return self->_fabricData;
}

- (HMMTRControllerData)currentDeviceNodeData
{
  return self->_currentDeviceNodeData;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (BOOL)cachedDataValid
{
  return self->_cachedDataValid;
}

- (void)setCachedDataValid:(BOOL)a3
{
  self->_cachedDataValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_currentDeviceNodeData, 0);
  objc_storeStrong((id *)&self->_fabricData, 0);
  objc_destroyWeak((id *)&self->_storage);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessControl, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);
}

void __63__HMMTRFabric__loadForPairingWithFetchFromResident_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  HMMTRCachedFabricCertificateData *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  HMMTRCachedFabricCertificateData *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *context;
  void *contexta;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v15)
  {
    v16 = (void *)MEMORY[0x242656984]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v59 = v19;
      v60 = 2112;
      v61 = (uint64_t)v15;
      _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_INFO, "%{public}@Failed to create operational certificates from owner with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (v11 && v12 && v13 && v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "fabricID");
      v20 = objc_claimAutoreleasedReturnValue();
      if (!v20
        || (v21 = (void *)v20,
            objc_msgSend(*(id *)(a1 + 32), "fabricID"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = objc_msgSend(v22, "isEqualToNumber:", &unk_250F3F4C8),
            v22,
            v21,
            v23))
      {
        objc_msgSend(MEMORY[0x24BDDB5B0], "convertX509Certificate:", v11);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB5A8]), "initWithTLVBytes:", v24);
        context = (void *)MEMORY[0x242656984]();
        v26 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v25)
        {
          v54 = v24;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "subject");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "fabricID");
            *(_DWORD *)buf = 138543618;
            v59 = v52;
            v60 = 2112;
            v61 = objc_claimAutoreleasedReturnValue();
            v29 = (void *)v61;
            _os_log_impl(&dword_23E95B000, v28, OS_LOG_TYPE_INFO, "%{public}@Updating fabric ID to %@ for Shared Home", buf, 0x16u);

          }
          objc_autoreleasePoolPop(context);
          objc_msgSend(v25, "subject");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "fabricID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setFabricID:", v31);

          v24 = v54;
        }
        else
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v59 = v55;
            _os_log_impl(&dword_23E95B000, v28, OS_LOG_TYPE_ERROR, "%{public}@Couldn't extract certificate info", buf, 0xCu);

          }
          objc_autoreleasePoolPop(context);
        }

      }
      v38 = (void *)MEMORY[0x242656984]();
      v39 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "fabricID");
        contexta = v38;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v59 = v41;
        v60 = 2112;
        v61 = (uint64_t)v42;
        v62 = 2112;
        v63 = v11;
        v64 = 2112;
        v65 = v12;
        v66 = 2112;
        v67 = v13;
        _os_log_impl(&dword_23E95B000, v40, OS_LOG_TYPE_INFO, "%{public}@Successfully created operational certificates from owner for fabric ID %@. Root Certificate %@, Operational certificate %@, Owner NodeID %@", buf, 0x34u);

        v38 = contexta;
      }

      objc_autoreleasePoolPop(v38);
      v43 = [HMMTRCachedFabricCertificateData alloc];
      objc_msgSend(*(id *)(a1 + 32), "fabricID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[HMMTRCachedFabricCertificateData initWithFabricID:rootCert:operationalCert:ownerNode:ipk:](v43, "initWithFabricID:rootCert:operationalCert:ownerNode:ipk:", v44, v11, v12, v13, v14);

      objc_msgSend(*(id *)(a1 + 32), "storage");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "delegate");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "fabricID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "cacheOperationalCertificate:fabricID:", v37, v47);

      objc_msgSend(*(id *)(a1 + 32), "fabricData");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setRootCert:", v11);

      objc_msgSend(*(id *)(a1 + 32), "currentDeviceNodeData");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setOperationalCertificate:", v12);

      objc_msgSend(*(id *)(a1 + 32), "fabricData");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setResidentNodeID:", v13);

      objc_msgSend(*(id *)(a1 + 32), "fabricData");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setIpk:", v14);

      objc_msgSend(*(id *)(a1 + 32), "setCachedDataValid:", 1);
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
    }
    else
    {
      v32 = (void *)MEMORY[0x242656984]();
      v33 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v59 = v35;
        _os_log_impl(&dword_23E95B000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch Certificates OR Owner Node ID required for pairing", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v32);
      v36 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
      v37 = (HMMTRCachedFabricCertificateData *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, HMMTRCachedFabricCertificateData *))(v36 + 16))(v36, v37);
    }

  }
}

void __43__HMMTRFabric__loadFromDiskWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__HMMTRFabric__loadFromDiskWithCompletion___block_invoke_2;
  block[3] = &unk_250F240D8;
  v8 = v3;
  v5 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v6 = v3;
  dispatch_async(v4, block);

}

void __43__HMMTRFabric__loadFromDiskWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "rootCert");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "fabricData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRootCert:", v3);

    objc_msgSend(*(id *)(a1 + 32), "operationalCert");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "currentDeviceNodeData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOperationalCertificate:", v5);

    objc_msgSend(*(id *)(a1 + 32), "ownerNode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "fabricData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setResidentNodeID:", v7);

    objc_msgSend(*(id *)(a1 + 32), "ipk");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "fabricData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIpk:", v9);

    v11 = (void *)MEMORY[0x242656984]();
    v12 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "fabricData");
      v41 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "rootCert");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "currentDeviceNodeData");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "operationalCertificate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "fabricData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "residentNodeID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "fabricData");
      v40 = v11;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "ipk");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v44 = v14;
      v45 = 2112;
      v46 = v15;
      v47 = 2112;
      v48 = v16;
      v49 = 2112;
      v50 = v18;
      v51 = 2112;
      v52 = v20;
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@Read cached operational cert data from disk self.rootCert %@, self.operationalCert %@ self.residentNodeID %@ self.ownerIPK %@", buf, 0x34u);

      v11 = v40;
    }

    objc_autoreleasePoolPop(v11);
    v21 = (void *)MEMORY[0x24BDDB5B0];
    objc_msgSend(*(id *)(a1 + 40), "storage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "nocSigner");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "fabricData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "rootCert");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "keypair:matchesCertificate:", v23, v25);

    v26 = (void *)MEMORY[0x242656984]();
    v27 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)MEMORY[0x24BDDB5B0];
      objc_msgSend(*(id *)(a1 + 40), "fabricData");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "rootCert");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "shortDescriptionForX509Certificate:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v29;
      v45 = 2112;
      v46 = v33;
      v47 = 2112;
      v48 = v34;
      _os_log_impl(&dword_23E95B000, v28, OS_LOG_TYPE_INFO, "%{public}@Cached root certificate: %@, matches: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v26);
    v35 = (void *)MEMORY[0x24BDDB5B0];
    objc_msgSend(*(id *)(a1 + 40), "fabricData");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "rootCert");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "printX509Certificate:", v37);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v38 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v38 + 16))(v38);

  }
}

void __45__HMMTRFabric__loadFromRemoteWithCompletion___block_invoke(uint64_t a1, void *a2)
{
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

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
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
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Loading from storage completed with error %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __45__HMMTRFabric__loadFromRemoteWithCompletion___block_invoke_33(uint64_t a1, void *a2)
{
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

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
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
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Loading from resident completed with error %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __82__HMMTRFabric_loadFabricAndControllerDataForPairing_fetchFromResident_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v43 = v5;
    v44 = 2112;
    v45 = v6;
    v46 = 2112;
    v47 = v7;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Loading certificate data, pairing: %@, resident fetch: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  if (*(_BYTE *)(a1 + 48) || !objc_msgSend(*(id *)(a1 + 32), "isValid"))
  {
    objc_msgSend(*(id *)(a1 + 32), "fabricData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rootCert");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "currentDeviceNodeData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "operationalCertificate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "fabricData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "residentNodeID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "fabricData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ipk");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "fabricData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setRootCert:", 0);

    objc_msgSend(*(id *)(a1 + 32), "currentDeviceNodeData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setOperationalCertificate:", 0);

    objc_msgSend(*(id *)(a1 + 32), "fabricData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setResidentNodeID:", 0);

    objc_msgSend(*(id *)(a1 + 32), "fabricData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setIpk:", 0);

    v24 = MEMORY[0x24BDAC760];
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __82__HMMTRFabric_loadFabricAndControllerDataForPairing_fetchFromResident_completion___block_invoke_5;
    v36[3] = &unk_250F21D18;
    v36[4] = *(_QWORD *)(a1 + 32);
    v25 = v13;
    v37 = v25;
    v26 = v15;
    v38 = v26;
    v27 = v17;
    v39 = v27;
    v28 = v19;
    v40 = v28;
    v41 = *(id *)(a1 + 40);
    v29 = (void *)MEMORY[0x242656B10](v36);
    v30 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(v30, "_loadForPairingWithFetchFromResident:completion:", *(unsigned __int8 *)(a1 + 49), v29);
    }
    else
    {
      objc_msgSend(v30, "accessControl");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "currentUserPrivilege");

      v33 = *(void **)(a1 + 32);
      if (v32 == 1)
      {
        objc_msgSend(v33, "_loadFromRemoteWithCompletion:", v29);
      }
      else
      {
        v34[0] = v24;
        v34[1] = 3221225472;
        v34[2] = __82__HMMTRFabric_loadFabricAndControllerDataForPairing_fetchFromResident_completion___block_invoke_3;
        v34[3] = &unk_250F23CD0;
        v34[4] = v33;
        v35 = v29;
        objc_msgSend(v33, "_loadFromDiskWithCompletion:", v34);

      }
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v11;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Certificate data is valid", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __82__HMMTRFabric_loadFabricAndControllerDataForPairing_fetchFromResident_completion___block_invoke_5(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(a1[4], "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__HMMTRFabric_loadFabricAndControllerDataForPairing_fetchFromResident_completion___block_invoke_2;
  block[3] = &unk_250F20D88;
  v9 = v3;
  v5 = a1[5];
  v6 = a1[4];
  v10 = v5;
  v11 = v6;
  v12 = a1[6];
  v13 = a1[7];
  v14 = a1[8];
  v15 = a1[9];
  v7 = v3;
  dispatch_async(v4, block);

}

void __82__HMMTRFabric_loadFabricAndControllerDataForPairing_fetchFromResident_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3 || !objc_msgSend(*(id *)(a1 + 32), "isValid"))
    objc_msgSend(*(id *)(a1 + 32), "_loadFromRemoteWithCompletion:", *(_QWORD *)(a1 + 40));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __82__HMMTRFabric_loadFabricAndControllerDataForPairing_fetchFromResident_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 48), "fabricData");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setRootCert:", v2);

      v4 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 48), "currentDeviceNodeData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setOperationalCertificate:", v4);

      v6 = *(_QWORD *)(a1 + 64);
      objc_msgSend(*(id *)(a1 + 48), "fabricData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setResidentNodeID:", v6);

      v8 = *(_QWORD *)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 48), "fabricData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setIpk:", v8);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
}

void __53__HMMTRFabric_createNewFabricIdentityWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  int v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "isValid"))
  {
    v2 = (void *)MEMORY[0x242656984]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 138543362;
      v47 = v5;
      _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Failed to create fabric data as existing data is already valid", (uint8_t *)&v46, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = 1;
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "accessControl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "currentUserPrivilege");

  if (v10 != 1)
  {
    v15 = (void *)MEMORY[0x242656984]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 138543362;
      v47 = v18;
      _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to create fabric data by non-owner user", (uint8_t *)&v46, 0xCu);
      goto LABEL_12;
    }
LABEL_13:

    objc_autoreleasePoolPop(v15);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = 5;
LABEL_14:
    objc_msgSend(v7, "hmfErrorWithCode:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v20);
    goto LABEL_15;
  }
  objc_msgSend(*(id *)(a1 + 32), "fabricID");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11
    || (v12 = (void *)v11,
        objc_msgSend(*(id *)(a1 + 32), "fabricID"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "isEqualToNumber:", &unk_250F3F4C8),
        v13,
        v12,
        v14))
  {
    v15 = (void *)MEMORY[0x242656984]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "fabricID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 138543618;
      v47 = v18;
      v48 = 2112;
      v49 = v19;
      _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to create fabric data due to incorrect fabric ID %@", (uint8_t *)&v46, 0x16u);

LABEL_12:
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "_createNewFabricData") & 1) == 0)
  {
    v39 = (void *)MEMORY[0x242656984]();
    v40 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 138543362;
      v47 = v42;
      _os_log_impl(&dword_23E95B000, v41, OS_LOG_TYPE_ERROR, "%{public}@Newly generated fabric data is invalid", (uint8_t *)&v46, 0xCu);

    }
    objc_autoreleasePoolPop(v39);
    objc_msgSend(*(id *)(a1 + 32), "_clearNewFabricData");
    v6 = *(_QWORD *)(a1 + 40);
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = 11;
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "_getDataToPersist");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x242656984]();
  v22 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 138543618;
    v47 = v24;
    v48 = 2112;
    v49 = v20;
    _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_INFO, "%{public}@Attempting to persist %@", (uint8_t *)&v46, 0x16u);

  }
  objc_autoreleasePoolPop(v21);
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "syncDataSourceDictionary:forFabric:", v20, *(_QWORD *)(a1 + 32));

  v27 = (void *)MEMORY[0x242656984]();
  v28 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v26)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "fabricData");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "currentDeviceNodeData");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 138543874;
      v47 = v31;
      v48 = 2112;
      v49 = v32;
      v50 = 2112;
      v51 = v33;
      _os_log_impl(&dword_23E95B000, v30, OS_LOG_TYPE_INFO, "%{public}@Successfully persisted new fabric with %@ and created new controller with %@", (uint8_t *)&v46, 0x20u);

    }
    objc_autoreleasePoolPop(v27);
    v34 = (void *)MEMORY[0x242656984]();
    v35 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = *(void **)(a1 + 32);
      v46 = 138543618;
      v47 = v37;
      v48 = 2112;
      v49 = v38;
      _os_log_impl(&dword_23E95B000, v36, OS_LOG_TYPE_INFO, "%{public}@New fabric %@", (uint8_t *)&v46, 0x16u);

    }
    objc_autoreleasePoolPop(v34);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 138543362;
      v47 = v43;
      _os_log_impl(&dword_23E95B000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to persist new fabric data", (uint8_t *)&v46, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(*(id *)(a1 + 32), "_clearNewFabricData");
    v44 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 11);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v44 + 16))(v44, v45);

  }
LABEL_15:

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t42 != -1)
    dispatch_once(&logCategory__hmf_once_t42, &__block_literal_global_2489);
  return (id)logCategory__hmf_once_v43;
}

void __26__HMMTRFabric_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v43;
  logCategory__hmf_once_v43 = v0;

}

@end
