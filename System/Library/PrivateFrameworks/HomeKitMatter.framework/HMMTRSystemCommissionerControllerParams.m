@implementation HMMTRSystemCommissionerControllerParams

- (HMMTRSystemCommissionerControllerParams)initWithQueue:(id)a3 controllerFactory:(id)a4
{
  id v7;
  id v8;
  HMMTRSystemCommissionerControllerParams *v9;
  HMMTRSystemCommissionerControllerParams *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMTRSystemCommissionerControllerParams;
  v9 = -[HMMTRSystemCommissionerControllerParams init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    objc_storeStrong((id *)&v10->_controllerFactory, a4);
  }

  return v10;
}

- (BOOL)fetchControllerParamsAllowingNew:(BOOL)a3 nocSigner:(id *)a4 controllerWrapper:(id *)a5
{
  NSObject *v9;
  uint64_t v10;
  _QWORD v12[7];
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6241;
  v24 = __Block_byref_object_dispose__6242;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6241;
  v18 = __Block_byref_object_dispose__6242;
  v19 = 0;
  -[HMMTRSystemCommissionerControllerParams workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __104__HMMTRSystemCommissionerControllerParams_fetchControllerParamsAllowingNew_nocSigner_controllerWrapper___block_invoke;
  v12[3] = &unk_250F218F0;
  v13 = a3;
  v12[4] = self;
  v12[5] = &v20;
  v12[6] = &v14;
  dispatch_sync(v9, v12);

  v10 = v15[5];
  if (v10)
  {
    *a4 = objc_retainAutorelease((id)v21[5]);
    *a5 = objc_retainAutorelease((id)v15[5]);
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10 != 0;
}

- (void)handleKeyPairDataChanged
{
  void *v3;
  HMMTRSystemCommissionerControllerParams *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Keypair data changed", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTRSystemCommissionerControllerParams workQueue](v4, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__HMMTRSystemCommissionerControllerParams_handleKeyPairDataChanged__block_invoke;
  block[3] = &unk_250F23DF0;
  block[4] = v4;
  dispatch_async(v7, block);

}

- (BOOL)shouldSkipAttestationCertificateValidation
{
  return 0;
}

- (void)issueOperationalCertificateForRequest:(id)a3 attestationInfo:(id)a4 controller:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  const __CFData *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFDictionary *v22;
  SecKeyRef v23;
  SecKeyRef v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFDictionary *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  HMMTRSystemCommissionerControllerParams *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  HMMTRSystemCommissionerControllerParams *v42;
  NSObject *v43;
  id v44;
  void *v45;
  void *v46;
  HMMTRSystemCommissionerControllerParams *v47;
  NSObject *v48;
  id v49;
  void *v50;
  const __CFData *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  CFErrorRef error;
  id v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  const __CFData *v61;
  __int16 v62;
  CFErrorRef v63;
  _QWORD v64[2];
  _QWORD v65[3];

  v65[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *, _QWORD))a6;
  -[HMMTRSystemCommissionerControllerParams commissioneeNodeID](self, "commissioneeNodeID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x24BDDB5B0];
    objc_msgSend(v10, "csr");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    objc_msgSend(v15, "publicKeyFromCSR:error:", v16, &v57);
    v17 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v18 = v57;

    if (v17)
    {
      v54 = v11;
      v19 = *MEMORY[0x24BDE9060];
      v20 = *MEMORY[0x24BDE9028];
      v64[0] = *MEMORY[0x24BDE9050];
      v64[1] = v20;
      v21 = *MEMORY[0x24BDE9038];
      v65[0] = v19;
      v65[1] = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
      v22 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      error = 0;
      v23 = SecKeyCreateWithData(v17, v22, &error);
      if (v23)
      {
        v24 = v23;
        -[HMMTRSystemCommissionerControllerParams v1keypair](self, "v1keypair");
        v53 = v10;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "rootCert");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = (void *)MEMORY[0x24BDDB5B0];
        -[HMMTRSystemCommissionerControllerParams v1keypair](self, "v1keypair");
        v52 = v12;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRSystemCommissionerControllerParams commissioningFabricID](self, "commissioningFabricID");
        v51 = v17;
        v29 = v22;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRSystemCommissionerControllerParams commissioneeNodeID](self, "commissioneeNodeID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v18;
        objc_msgSend(v27, "createOperationalCertificate:signingCertificate:operationalPublicKey:fabricID:nodeID:caseAuthenticatedTags:error:", v28, v26, v24, v30, v31, 0, &v55);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v55;

        v22 = v29;
        v17 = v51;

        v34 = objc_alloc(MEMORY[0x24BDDB7B0]);
        -[HMMTRSystemCommissionerControllerParams adminNodeID](self, "adminNodeID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_msgSend(v34, "initWithOperationalCertificate:intermediateCertificate:rootCertificate:adminSubject:", v32, 0, v26, v35);

        v12 = v52;
        v13[2](v13, v36, 0);

        v18 = v33;
        v10 = v53;
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
          v49 = v10;
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v59 = v50;
          v60 = 2112;
          v61 = v17;
          v62 = 2112;
          v63 = error;
          _os_log_impl(&dword_23E95B000, v48, OS_LOG_TYPE_ERROR, "%{public}@Failed to create SecKey from %@: %@", buf, 0x20u);

          v10 = v49;
        }

        objc_autoreleasePoolPop(v46);
        ((void (**)(id, void *, CFErrorRef))v13)[2](v13, 0, error);
      }

      v11 = v54;
    }
    else
    {
      v41 = (void *)MEMORY[0x242656984]();
      v42 = self;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v44 = v11;
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v45;
        v60 = 2112;
        v61 = (const __CFData *)v18;
        _os_log_impl(&dword_23E95B000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to extract public key from CSR: %@", buf, 0x16u);

        v11 = v44;
      }

      objc_autoreleasePoolPop(v41);
      ((void (**)(id, void *, id))v13)[2](v13, 0, v18);
    }

  }
  else
  {
    v37 = (void *)MEMORY[0x242656984]();
    v38 = self;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v59 = v40;
      _os_log_impl(&dword_23E95B000, v39, OS_LOG_TYPE_ERROR, "%{public}@No commissionee node ID assigned yet. Not issuing NOC.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v37);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 6, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, id))v13)[2](v13, 0, v18);
  }

}

- (BOOL)_checkAndUpdateValidityPeriodOfV1Keypair:(id)a3 newKeyPair:(id *)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  HMMTRSystemCommissionerControllerParams *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "rootCert");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v8 = +[HMMTRStorage checkAndUpdateExpiryOfCertificate:keyPair:newCertificate:](HMMTRStorage, "checkAndUpdateExpiryOfCertificate:keyPair:newCertificate:", v7, v6, &v20);
  v9 = v20;

  if (v8)
  {
    v10 = (void *)MEMORY[0x242656984]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v13;
      _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_ERROR, "%{public}@V1 key pair root cert is updated. This will disrupt already paired accessories.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v14 = objc_msgSend(v6, "privateKey");
    v15 = objc_msgSend(v6, "operationalKey");
    objc_msgSend(v6, "operationalCert");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ipk");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRSystemCommissionerControllerParams storeV1MatterKeypairWithPrivateKey:operationalKey:rootCert:operationalCert:ipk:](v11, "storeV1MatterKeypairWithPrivateKey:operationalKey:rootCert:operationalCert:ipk:", v14, v15, v9, v16, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v18 = *a4 != 0;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)_startWithV1Keypair:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  HMMTRSystemCommissionerControllerParams *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMMTRSystemCommissionerControllerParams controllerFactory](self, "controllerFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "usesCommonStorage");

  if (v6)
    -[HMMTRSystemCommissionerControllerParams _buildControllerParams1WithV1Keypair:](self, "_buildControllerParams1WithV1Keypair:", v4);
  else
    -[HMMTRSystemCommissionerControllerParams _buildControllerParams2WithV1Keypair:](self, "_buildControllerParams2WithV1Keypair:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HMMTRSystemCommissionerControllerParams _obtainControllerWrapperWithV1KeyPair:startupParams:](self, "_obtainControllerWrapperWithV1KeyPair:startupParams:", v4, v7);
  }
  else
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate controller parameters from V1 keypair", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (id)_buildControllerParams1WithV1Keypair:(id)a3
{
  id v4;
  HMMTRMatterKeypair *v5;
  HMMTRControllerParameters *v6;
  void *v7;
  void *v8;
  void *v9;
  HMMTRControllerParameters *v10;
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
  HMMTRControllerParameters *v21;
  void *v22;
  HMMTRSystemCommissionerControllerParams *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMMTRSystemCommissionerControllerParams *v27;
  NSObject *v28;
  void *v29;
  int v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "operationalKey"))
    v5 = -[HMMTRMatterKeypair initWithPrivateKey:]([HMMTRMatterKeypair alloc], "initWithPrivateKey:", objc_msgSend(v4, "operationalKey"));
  else
    v5 = 0;
  v6 = [HMMTRControllerParameters alloc];
  objc_msgSend(v4, "ipk");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "operationalCert");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootCert");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMMTRControllerParameters initWithIPK:operationalKeypair:operationalCertificate:intermediateCertificate:rootCertificate:](v6, "initWithIPK:operationalKeypair:operationalCertificate:intermediateCertificate:rootCertificate:", v7, v5, v8, 0, v9);

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDDB5B0];
    objc_msgSend(v4, "operationalCert");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "convertX509Certificate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB5A8]), "initWithTLVBytes:", v13);
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "subject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fabricID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRSystemCommissionerControllerParams setCommissioningFabricID:](self, "setCommissioningFabricID:", v17);

      objc_msgSend(v15, "subject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "nodeID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRSystemCommissionerControllerParams setAdminNodeID:](self, "setAdminNodeID:", v19);

      -[HMMTRControllerParameters setVendorID:](v10, "setVendorID:", &unk_250F3F8D0);
      -[HMMTRControllerParameters setOperationalCertificateIssuer:](v10, "setOperationalCertificateIssuer:", self);
      -[HMMTRSystemCommissionerControllerParams workQueue](self, "workQueue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRControllerParameters setOperationalCertificateIssuerQueue:](v10, "setOperationalCertificateIssuerQueue:", v20);

      v21 = v10;
    }
    else
    {
      v26 = (void *)MEMORY[0x242656984]();
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543362;
        v32 = v29;
        _os_log_impl(&dword_23E95B000, v28, OS_LOG_TYPE_ERROR, "%{public}@Bad NOC in V1 key", (uint8_t *)&v31, 0xCu);

      }
      objc_autoreleasePoolPop(v26);
      v21 = 0;
    }

  }
  else
  {
    v22 = (void *)MEMORY[0x242656984]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543362;
      v32 = v25;
      _os_log_impl(&dword_23E95B000, v24, OS_LOG_TYPE_ERROR, "%{public}@Bad startup parameter from V1 keypair", (uint8_t *)&v31, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    v21 = 0;
  }

  return v21;
}

- (id)_buildControllerParams2WithV1Keypair:(id)a3
{
  id v4;
  HMMTRMatterKeypair *v5;
  dispatch_queue_t v6;
  HMMTRSystemCommissionerPerControllerStorage *v7;
  HMMTRControllerParameters *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMMTRControllerParameters *v13;
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
  HMMTRControllerParameters *v26;
  void *v27;
  HMMTRSystemCommissionerControllerParams *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  HMMTRSystemCommissionerControllerParams *v32;
  NSObject *v33;
  void *v34;
  void *v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "operationalKey"))
    v5 = -[HMMTRMatterKeypair initWithPrivateKey:]([HMMTRMatterKeypair alloc], "initWithPrivateKey:", objc_msgSend(v4, "operationalKey"));
  else
    v5 = 0;
  v6 = dispatch_queue_create("HMMTRPerControllerStorage queue for System Commissioner fabric", 0);
  v7 = -[HMMTRSystemCommissionerPerControllerStorage initWithQueue:]([HMMTRSystemCommissionerPerControllerStorage alloc], "initWithQueue:", v6);
  v8 = [HMMTRControllerParameters alloc];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ipk");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "operationalCert");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootCert");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMMTRControllerParameters initWithStorageDelegate:storageDelegateQueue:uniqueIdentifier:ipk:vendorID:operationalKeypair:operationalCertificate:intermediateCertificate:rootCertificate:](v8, "initWithStorageDelegate:storageDelegateQueue:uniqueIdentifier:ipk:vendorID:operationalKeypair:operationalCertificate:intermediateCertificate:rootCertificate:", v7, v6, v9, v10, &unk_250F3F8D0, v5, v11, 0, v12);

  if (v13)
  {
    v14 = (void *)MEMORY[0x24BDDB5B0];
    objc_msgSend(v4, "operationalCert");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "convertX509Certificate:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB5A8]), "initWithTLVBytes:", v16);
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "subject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fabricID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRSystemCommissionerControllerParams setCommissioningFabricID:](self, "setCommissioningFabricID:", v20);

      objc_msgSend(v18, "subject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "nodeID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRSystemCommissionerControllerParams setAdminNodeID:](self, "setAdminNodeID:", v22);

      -[HMMTRControllerParameters setOperationalCertificateIssuer:](v13, "setOperationalCertificateIssuer:", self);
      -[HMMTRSystemCommissionerControllerParams workQueue](self, "workQueue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRControllerParameters setOperationalCertificateIssuerQueue:](v13, "setOperationalCertificateIssuerQueue:", v23);

      -[HMMTRSystemCommissionerControllerParams certificationDeclarationCertificates](self, "certificationDeclarationCertificates");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRControllerParameters setCertificationDeclarationCertificates:](v13, "setCertificationDeclarationCertificates:", v24);

      -[HMMTRSystemCommissionerControllerParams productAttestationAuthorityCertificates](self, "productAttestationAuthorityCertificates");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRControllerParameters setProductAttestationAuthorityCertificates:](v13, "setProductAttestationAuthorityCertificates:", v25);

      v26 = v13;
    }
    else
    {
      v31 = (void *)MEMORY[0x242656984]();
      v32 = self;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = v31;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v34;
        _os_log_impl(&dword_23E95B000, v33, OS_LOG_TYPE_ERROR, "%{public}@Bad NOC in V1 key", buf, 0xCu);

        v31 = v36;
      }

      objc_autoreleasePoolPop(v31);
      v26 = 0;
    }

  }
  else
  {
    v27 = (void *)MEMORY[0x242656984]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v30;
      _os_log_impl(&dword_23E95B000, v29, OS_LOG_TYPE_ERROR, "%{public}@Bad startup parameter from V1 keypair", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
    v26 = 0;
  }

  return v26;
}

- (void)_buildV1KeyFromV0KeyAllowingNew:(BOOL)a3
{
  void *v5;
  HMMTRSystemCommissionerControllerParams *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMMTRSystemCommissionerControllerParams *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  _BOOL4 v20;
  id v21;
  void *v22;
  HMMTRSystemCommissionerControllerParams *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  HMMTRSystemCommissionerControllerParams *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  HMMTRSystemCommissionerControllerParams *v35;
  NSObject *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x242656984](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v49 = v8;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Building V1 key from V0 key", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMMTRSystemCommissionerControllerParams v0MatterKeypairFromKeychain](v6, "v0MatterKeypairFromKeychain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v46 = 0;
    v47 = 0;
    v44 = 0;
    v45 = 0;
    v10 = -[HMMTRSystemCommissionerControllerParams _findFabricRecordInMTSKeyValueStoreMatchingKeyPair:ipk:rootCert:operationalKey:operationalCert:](v6, "_findFabricRecordInMTSKeyValueStoreMatchingKeyPair:ipk:rootCert:operationalKey:operationalCert:", v9, &v47, &v46, &v45, &v44);
    v11 = v47;
    v12 = v46;
    v13 = v45;
    v14 = v44;
    v15 = (void *)MEMORY[0x242656984]();
    v16 = v6;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v18)
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v19;
        _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_INFO, "%{public}@Check if MTS stored cert has correct validity period", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      v43 = 0;
      v20 = +[HMMTRStorage checkAndUpdateExpiryOfCertificate:keyPair:newCertificate:](HMMTRStorage, "checkAndUpdateExpiryOfCertificate:keyPair:newCertificate:", v12, v9, &v43);
      v21 = v43;
      v42 = v11;
      if (v20)
      {
        v22 = (void *)MEMORY[0x242656984]();
        v23 = v16;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v49 = v25;
          _os_log_impl(&dword_23E95B000, v24, OS_LOG_TYPE_ERROR, "%{public}@V1 key will be updated using new root cert. This will disrupt all paired accessories", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v22);
        v26 = v21;

        v12 = v26;
      }
      v27 = (void *)MEMORY[0x242656984]();
      v28 = v16;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v30;
        _os_log_impl(&dword_23E95B000, v29, OS_LOG_TYPE_INFO, "%{public}@Propagating V1 key from V0 key and storage certs", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v27);
      v31 = objc_msgSend(v9, "privateKey");
      v32 = objc_msgSend(v13, "privateKey");
      v33 = v31;
      v11 = v42;
      -[HMMTRSystemCommissionerControllerParams _buildV1KeyWithPrivateKey:operationalKey:ipk:rootCert:operationalCert:updatingMTSKeyValueStore:](v28, "_buildV1KeyWithPrivateKey:operationalKey:ipk:rootCert:operationalCert:updatingMTSKeyValueStore:", v33, v32, v42, v12, v14, 0);

    }
    else if (a3)
    {
      if (v18)
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v39;
        _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_INFO, "%{public}@Propagating V1 key from V0 key and creating new fabric certs", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      -[HMMTRSystemCommissionerControllerParams _buildV1KeyWithV0KeyPair:](v16, "_buildV1KeyWithV0KeyPair:", v9);
    }
    else
    {
      if (v18)
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v41;
        _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_INFO, "%{public}@No fabric records present in MTS storage for matching V0 key pair", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
    }

  }
  else
  {
    v34 = (void *)MEMORY[0x242656984]();
    v35 = v6;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = os_log_type_enabled(v36, OS_LOG_TYPE_INFO);
    if (a3)
    {
      if (v37)
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v38;
        _os_log_impl(&dword_23E95B000, v36, OS_LOG_TYPE_INFO, "%{public}@No V0 keypair present. Building new V1 keypair.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v34);
      -[HMMTRSystemCommissionerControllerParams _buildV1KeyFromScratch](v35, "_buildV1KeyFromScratch");
    }
    else
    {
      if (v37)
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v40;
        _os_log_impl(&dword_23E95B000, v36, OS_LOG_TYPE_INFO, "%{public}@No V0 keypair present", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v34);
    }
  }

}

- (void)_buildV1KeyFromScratch
{
  void *v3;
  void *v4;
  HMMTRSystemCommissionerControllerParams *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HMMTRSystemCommissionerControllerParams storeV0MatterKeypair](self, "storeV0MatterKeypair");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x242656984]();
  v5 = self;
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
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Using new key pair for system commissioner: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  -[HMMTRSystemCommissionerControllerParams _buildV1KeyWithV0KeyPair:](v5, "_buildV1KeyWithV0KeyPair:", v3);

}

- (void)_buildV1KeyWithV0KeyPair:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMMTRSystemCommissionerControllerParams *v7;
  NSObject *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  HMMTRSystemCommissionerControllerParams *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  HMMTRSystemCommissionerControllerParams *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  HMMTRSystemCommissionerControllerParams *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  HMMTRSystemCommissionerControllerParams *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  HMMTRSystemCommissionerControllerParams *v42;
  NSObject *v43;
  void *v44;
  HMMTRSystemCommissionerControllerParams *v45;
  NSObject *v46;
  void *v47;
  void *contexta;
  void *context;
  id v50;
  id v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  _BYTE bytes[16];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x242656984]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v54 = v9;
    v55 = 2112;
    v56 = v5;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Building new fabric certs with fabricID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v10 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x24BDE94B8], 0x10uLL, bytes);
  if (v10)
  {
    v11 = v10;
    v12 = (void *)MEMORY[0x242656984]();
    v13 = v7;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v54 = v15;
      v55 = 2112;
      v56 = v5;
      v57 = 1024;
      LODWORD(v58) = v11;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_ERROR, "%{public}@FATAL Error: Failed to generate IPK for fabric ID %@. Status: %d", buf, 0x1Cu);

    }
    objc_autoreleasePoolPop(v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", bytes, 16);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRSystemCommissionerControllerParams mtsKeyValueStore](v7, "mtsKeyValueStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "base64EncodedStringWithOptions:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    objc_msgSend(v17, "setStoredValue:forKey:error:", v18, CFSTR("IPK"), &v52);
    v19 = v52;

    v20 = (void *)MEMORY[0x242656984]();
    v21 = v7;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v19)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v24;
        v55 = 2112;
        v56 = v19;
        _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_ERROR, "%{public}@FATAL Error: Failed to store IPK in system commissioner storage: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);

    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v54 = v25;
        _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_INFO, "%{public}@IPK for System Commissioner was generated and stored", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v20);

      v51 = 0;
      objc_msgSend(MEMORY[0x24BDDB5B0], "createRootCertificate:issuerID:fabricID:error:", v4, 0, v5, &v51);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v51;
      if (v26)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)MEMORY[0x242656984]();
        v30 = v21;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v54 = v32;
          v55 = 2112;
          v56 = v5;
          v57 = 2112;
          v58 = v28;
          _os_log_impl(&dword_23E95B000, v31, OS_LOG_TYPE_INFO, "%{public}@Generated RCAC for fabric %@, controller node ID: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v29);
        v33 = -[HMMTRMatterKeypair initUnassociated]([HMMTRMatterKeypair alloc], "initUnassociated");
        v34 = v33;
        if (v33)
        {
          v50 = v27;
          objc_msgSend(MEMORY[0x24BDDB5B0], "createOperationalCertificate:signingCertificate:operationalPublicKey:fabricID:nodeID:caseAuthenticatedTags:error:", v4, v26, objc_msgSend(v33, "publicKey"), v5, v28, 0, &v50);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v50;

          if (v35)
          {
            -[HMMTRSystemCommissionerControllerParams _buildV1KeyWithPrivateKey:operationalKey:ipk:rootCert:operationalCert:updatingMTSKeyValueStore:](v30, "_buildV1KeyWithPrivateKey:operationalKey:ipk:rootCert:operationalCert:updatingMTSKeyValueStore:", objc_msgSend(v4, "privateKey"), objc_msgSend(v34, "privateKey"), v16, v26, v35, 1);
          }
          else
          {
            context = (void *)MEMORY[0x242656984]();
            v45 = v30;
            HMFGetOSLogHandle();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v54 = v47;
              v55 = 2112;
              v56 = v5;
              v57 = 2112;
              v58 = v36;
              _os_log_impl(&dword_23E95B000, v46, OS_LOG_TYPE_ERROR, "%{public}@FATAL Error: Failed to generate ooperational cert for fabric ID %@. error: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(context);
          }

          v27 = v36;
        }
        else
        {
          v41 = (void *)MEMORY[0x242656984]();
          v42 = v30;
          HMFGetOSLogHandle();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            contexta = v41;
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v54 = v44;
            _os_log_impl(&dword_23E95B000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate operational key", buf, 0xCu);

            v41 = contexta;
          }

          objc_autoreleasePoolPop(v41);
        }

      }
      else
      {
        v37 = (void *)MEMORY[0x242656984]();
        v38 = v21;
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v54 = v40;
          v55 = 2112;
          v56 = v5;
          v57 = 2112;
          v58 = v27;
          _os_log_impl(&dword_23E95B000, v39, OS_LOG_TYPE_ERROR, "%{public}@FATAL Error: Failed to generate root cert for fabric ID %@. error: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v37);
      }

    }
  }

}

- (void)_buildV1KeyWithPrivateKey:(__SecKey *)a3 operationalKey:(__SecKey *)a4 ipk:(id)a5 rootCert:(id)a6 operationalCert:(id)a7 updatingMTSKeyValueStore:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  void *v17;
  HMMTRMatterKeypair *v18;
  HMMTRControllerParameters *v19;
  HMMTRControllerParameters *v20;
  void *v21;
  void *v22;
  void *v23;
  HMMTRSystemCommissionerControllerParams *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMMTRSystemCommissionerControllerParams *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  HMMTRSystemCommissionerControllerParams *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  HMMTRSystemCommissionerControllerParams *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  HMMTRSystemCommissionerControllerParams *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *context;
  void *contexta;
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v8 = a8;
  v48 = *MEMORY[0x24BDAC8D0];
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[HMMTRSystemCommissionerControllerParams storeV1MatterKeypairWithPrivateKey:operationalKey:rootCert:operationalCert:ipk:](self, "storeV1MatterKeypairWithPrivateKey:operationalKey:rootCert:operationalCert:ipk:", a3, a4, v15, v16, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = -[HMMTRMatterKeypair initWithPrivateKey:]([HMMTRMatterKeypair alloc], "initWithPrivateKey:", a4);
    if (v18)
    {
      v19 = -[HMMTRControllerParameters initWithIPK:operationalKeypair:operationalCertificate:intermediateCertificate:rootCertificate:]([HMMTRControllerParameters alloc], "initWithIPK:operationalKeypair:operationalCertificate:intermediateCertificate:rootCertificate:", v14, v18, v16, 0, v15);
      v20 = v19;
      if (v19)
      {
        -[HMMTRControllerParameters setVendorID:](v19, "setVendorID:", &unk_250F3F8D0);
        if (v8)
        {
          -[HMMTRMatterKeypair serialize](v18, "serialize");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            -[HMMTRSystemCommissionerControllerParams setGeneratingKeyPair:](self, "setGeneratingKeyPair:", 1);
            -[HMMTRSystemCommissionerControllerParams controllerFactory](self, "controllerFactory");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "stackStorageWithStartupParams:operationalKeyPairTLV:", v20, v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            context = (void *)MEMORY[0x242656984]();
            v24 = self;
            HMFGetOSLogHandle();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v43 = v23;
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v47 = v26;
              _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_INFO, "%{public}@Dumping storage content to MTSKeyValueStore for backward compatibility", buf, 0xCu);

              v23 = v43;
            }

            objc_autoreleasePoolPop(context);
            -[HMMTRSystemCommissionerControllerParams _updateMTSKeyValueStore:](v24, "_updateMTSKeyValueStore:", v23);
            -[HMMTRSystemCommissionerControllerParams _startWithV1Keypair:](v24, "_startWithV1Keypair:", v17);
            -[HMMTRSystemCommissionerControllerParams setGeneratingKeyPair:](v24, "setGeneratingKeyPair:", 0);

          }
          else
          {
            v39 = (void *)MEMORY[0x242656984]();
            v40 = self;
            HMFGetOSLogHandle();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              contexta = v39;
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v47 = v42;
              _os_log_impl(&dword_23E95B000, v41, OS_LOG_TYPE_ERROR, "%{public}@Could not serialize operational key pair", buf, 0xCu);

              v39 = contexta;
            }

            objc_autoreleasePoolPop(v39);
          }

        }
        else
        {
          -[HMMTRSystemCommissionerControllerParams _startWithV1Keypair:](self, "_startWithV1Keypair:", v17);
        }
      }
      else
      {
        v35 = (void *)MEMORY[0x242656984]();
        v36 = self;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v47 = v38;
          _os_log_impl(&dword_23E95B000, v37, OS_LOG_TYPE_ERROR, "%{public}@Bad startup parameter", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v35);
      }

    }
    else
    {
      v31 = (void *)MEMORY[0x242656984]();
      v32 = self;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = v34;
        _os_log_impl(&dword_23E95B000, v33, OS_LOG_TYPE_ERROR, "%{public}@Could not build operational key pair from V1 Key. System commissioner won't be functional.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v31);
    }

  }
  else
  {
    v27 = (void *)MEMORY[0x242656984]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v30;
      _os_log_impl(&dword_23E95B000, v29, OS_LOG_TYPE_ERROR, "%{public}@Could not build V1 key. System commissioner won't be functional.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
  }

}

- (void)_obtainControllerWrapperWithV1KeyPair:(id)a3 startupParams:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMMTRSystemCommissionerControllerParams *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMMTRSystemCommissionerControllerParams controllerWrapper](self, "controllerWrapper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remove");

  -[HMMTRSystemCommissionerControllerParams setV1keypair:](self, "setV1keypair:", v6);
  -[HMMTRSystemCommissionerControllerParams controllerFactory](self, "controllerFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "wrapperWithName:startupParams:", CFSTR("System Commissioner Controller"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSystemCommissionerControllerParams setControllerWrapper:](self, "setControllerWrapper:", v10);

  v11 = (void *)MEMORY[0x242656984]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRSystemCommissionerControllerParams controllerWrapper](v12, "controllerWrapper");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fabricID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v14;
    v19 = 2112;
    v20 = v15;
    v21 = 2112;
    v22 = v16;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@Obtained controller wrapper %@ for fabric ID %@", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v11);

}

- (void)_updateMTSKeyValueStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  id v14;
  void *v15;
  HMMTRSystemCommissionerControllerParams *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  void *v29;
  HMMTRSystemCommissionerControllerParams *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMMTRSystemCommissionerControllerParams *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  HMMTRSystemCommissionerControllerParams *v39;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMMTRSystemCommissionerControllerParams mtsKeyValueStore](self, "mtsKeyValueStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v39 = self;
    v37 = v4;
    objc_msgSend(v5, "storedValuesByKey");
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    v40 = v6;
    v38 = v7;
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v48 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          if (objc_msgSend(v12, "hasPrefix:", CFSTR("f/")))
          {
            v46 = 0;
            v13 = objc_msgSend(v6, "removeStoredValueForKey:error:", v12, &v46);
            v14 = v46;
            if ((v13 & 1) == 0)
            {
              v15 = (void *)MEMORY[0x242656984]();
              v16 = v39;
              HMFGetOSLogHandle();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v53 = v18;
                v54 = 2112;
                v55 = v12;
                _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_ERROR, "%{public}@Could not remove key '%@' from MTSKeyValueStore", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v15);
              v6 = v40;
              v7 = v38;
            }

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
      }
      while (v9);
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v19 = v37;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v43 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          objc_msgSend(v19, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "base64EncodedStringWithOptions:", 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 0;
          v27 = objc_msgSend(v6, "setStoredValue:forKey:error:", v26, v24, &v41);
          v28 = v41;

          if ((v27 & 1) == 0)
          {
            v29 = (void *)MEMORY[0x242656984]();
            v30 = v39;
            HMFGetOSLogHandle();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v53 = v32;
              v54 = 2112;
              v55 = v24;
              _os_log_impl(&dword_23E95B000, v31, OS_LOG_TYPE_ERROR, "%{public}@Could not store key '%@' into MTSKeyValueStore", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v29);
            v6 = v40;
          }

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      }
      while (v21);
    }

    v4 = v37;
  }
  else
  {
    v33 = (void *)MEMORY[0x242656984]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v36;
      _os_log_impl(&dword_23E95B000, v35, OS_LOG_TYPE_ERROR, "%{public}@Could not retrieve MTSKeyValueStore to update", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v33);
  }

}

- (BOOL)_findFabricRecordInMTSKeyValueStoreMatchingKeyPair:(id)a3 ipk:(id *)a4 rootCert:(id *)a5 operationalKey:(id *)a6 operationalCert:(id *)a7
{
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  HMMTRSystemCommissionerControllerParams *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  id v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  _BOOL4 v54;
  void *v55;
  int v56;
  uint64_t v57;
  id v58;
  id v59;
  HMMTRMatterKeypair *v60;
  void *v61;
  void *v62;
  void *v63;
  HMMTRSystemCommissionerControllerParams *v64;
  NSObject *v65;
  void *v66;
  int v67;
  void *v68;
  HMMTRSystemCommissionerControllerParams *v69;
  NSObject *v70;
  void *v71;
  int v72;
  void *v73;
  HMMTRSystemCommissionerControllerParams *v74;
  NSObject *v75;
  void *v76;
  int v77;
  HMMTRSystemCommissionerControllerParams *v78;
  NSObject *v79;
  void *v80;
  int v81;
  void *v82;
  HMMTRSystemCommissionerControllerParams *v83;
  NSObject *v84;
  void *v85;
  int v86;
  HMMTRSystemCommissionerControllerParams *v87;
  NSObject *v88;
  void *v89;
  int v90;
  int v91;
  void *v92;
  int v93;
  void *v94;
  HMMTRSystemCommissionerControllerParams *v95;
  NSObject *v96;
  void *v97;
  void *v98;
  id v99;
  id v100;
  HMMTRMatterKeypair *v101;
  BOOL v102;
  void *v103;
  void *v104;
  void *v105;
  HMMTRSystemCommissionerControllerParams *v106;
  NSObject *v107;
  void *v108;
  void *v109;
  HMMTRSystemCommissionerControllerParams *v110;
  NSObject *v111;
  void *v112;
  void *v113;
  HMMTRSystemCommissionerControllerParams *v114;
  NSObject *v115;
  void *v116;
  void *v117;
  HMMTRSystemCommissionerControllerParams *v118;
  NSObject *v119;
  void *v120;
  void *v121;
  id *v123;
  void *v124;
  id v125;
  id v126;
  id *v127;
  id *v128;
  void *v129;
  void *context;
  NSObject *log;
  HMMTRSystemCommissionerControllerParams *v132;
  id v133;
  void *v134;
  id v135;
  HMMTRMatterKeypair *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  void *v150;
  HMMTRMatterKeypair *v151;
  void *v152;
  void *v153;
  void *v154;
  uint64_t v155;
  id v156;
  id v157;
  uint64_t v158;
  HMMTRSystemCommissionerControllerParams *v159;
  uint64_t v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  uint8_t buf[4];
  void *v166;
  __int16 v167;
  _BYTE v168[10];
  void *v169;
  _BYTE v170[128];
  uint64_t v171;

  v171 = *MEMORY[0x24BDAC8D0];
  v156 = a3;
  -[HMMTRSystemCommissionerControllerParams mtsKeyValueStore](self, "mtsKeyValueStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    v105 = (void *)MEMORY[0x242656984]();
    v106 = self;
    HMFGetOSLogHandle();
    v107 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v166 = v108;
      _os_log_impl(&dword_23E95B000, v107, OS_LOG_TYPE_ERROR, "%{public}@Couldn't access MatterSupport key store", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v105);
    v102 = 0;
    goto LABEL_102;
  }
  objc_msgSend(v12, "storedValueForKey:", CFSTR("IPK"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0x24BDD1000uLL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v14;
  else
    v16 = 0;
  v17 = v16;

  if (!v17)
  {
    *a4 = 0;
    goto LABEL_83;
  }
  v18 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v17, 0));
  *a4 = v18;

  if (!*a4)
  {
LABEL_83:
    v109 = (void *)MEMORY[0x242656984]();
    v110 = self;
    HMFGetOSLogHandle();
    v111 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v166 = v112;
      _os_log_impl(&dword_23E95B000, v111, OS_LOG_TYPE_INFO, "%{public}@No IPK in MatterSupport storage", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v109);
    v102 = 0;
    goto LABEL_101;
  }
  v128 = a5;
  v19 = (void *)MEMORY[0x242656984]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v166 = v22;
    _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_DEBUG, "%{public}@IPK retrieved from MatterSupport storage", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v19);
  objc_msgSend(v13, "storedValueForKey:", CFSTR("g/fidx"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v23;
  else
    v24 = 0;
  v25 = v24;

  if (!v25)
  {
    v113 = (void *)MEMORY[0x242656984]();
    v114 = v20;
    HMFGetOSLogHandle();
    v115 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v166 = v116;
      _os_log_impl(&dword_23E95B000, v115, OS_LOG_TYPE_INFO, "%{public}@No fabric index info in MatterSupport storage", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v113);
    v102 = 0;
    goto LABEL_100;
  }
  v127 = a7;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v25, 0);
  if (!v26)
  {
    v117 = (void *)MEMORY[0x242656984]();
    v118 = v20;
    HMFGetOSLogHandle();
    v119 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v166 = v120;
      _os_log_impl(&dword_23E95B000, v119, OS_LOG_TYPE_ERROR, "%{public}@Fabric index info wasn't base64 encoded in MatterSupport storage", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v117);
    v102 = 0;
    goto LABEL_99;
  }
  +[HMMTRTLVParser fabricIndicesFromTLV:](HMMTRTLVParser, "fabricIndicesFromTLV:", v26);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x242656984]();
  v159 = v20;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v29;
  v129 = (void *)v27;
  if (!v27)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v166 = v121;
      _os_log_impl(&dword_23E95B000, v30, OS_LOG_TYPE_ERROR, "%{public}@Fabric index info wasn't parsed successfully", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v28);
    v102 = 0;
    goto LABEL_98;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v166 = v31;
    v167 = 2112;
    *(_QWORD *)v168 = v129;
    _os_log_impl(&dword_23E95B000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Fabric indices in the MatterSupport storage: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v28);
  v163 = 0u;
  v164 = 0u;
  v161 = 0u;
  v162 = 0u;
  v32 = v129;
  v160 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v161, v170, 16);
  if (!v160)
  {

    v102 = 0;
    v97 = 0;
    v104 = 0;
    v103 = 0;
    v99 = 0;
    v100 = 0;
    v101 = 0;
    goto LABEL_97;
  }
  v123 = a6;
  v124 = v26;
  v125 = v25;
  v126 = v17;
  v135 = 0;
  v136 = 0;
  v134 = 0;
  v139 = 0;
  v140 = 0;
  v137 = 0;
  v158 = *(_QWORD *)v162;
  v152 = v13;
  v157 = v32;
  do
  {
    for (i = 0; i != v160; ++i)
    {
      if (*(_QWORD *)v162 != v158)
        objc_enumerationMutation(v32);
      v34 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * i);
      objc_msgSend(*(id *)(v15 + 1992), "stringWithFormat:", CFSTR("f/%x/r"), objc_msgSend(v34, "unsignedIntValue"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "storedValueForKey:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v37 = v36;
      else
        v37 = 0;
      v38 = v37;

      if (v38)
      {
        v39 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v38, 0);
        if (v39)
        {
          v40 = (void *)v39;
          objc_msgSend(MEMORY[0x24BDDB5B0], "convertMatterCertificate:", v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(MEMORY[0x24BDDB5B0], "keypair:matchesCertificate:", v156, v41) & 1) != 0)
          {
            v153 = v41;
            objc_msgSend(*(id *)(v15 + 1992), "stringWithFormat:", CFSTR("f/%x/o"), objc_msgSend(v34, "unsignedIntValue"));
            v42 = v13;
            v155 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "storedValueForKey:");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v44 = v43;
            else
              v44 = 0;
            v45 = v44;

            v154 = v45;
            if (v45
              && (v46 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v45, 0)) != 0)
            {
              v150 = (void *)v46;
              v151 = -[HMMTRMatterKeypair initWithTLVData:]([HMMTRMatterKeypair alloc], "initWithTLVData:", v46);
              if (v151)
              {
                objc_msgSend(*(id *)(v15 + 1992), "stringWithFormat:", CFSTR("f/%x/n"), objc_msgSend(v34, "unsignedIntValue"));
                v13 = v42;
                v147 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "storedValueForKey:");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v48 = v47;
                else
                  v48 = 0;
                v49 = v48;

                v148 = v49;
                if (v49
                  && (v50 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v49, 0)) != 0)
                {
                  v51 = (void *)v50;
                  objc_msgSend(MEMORY[0x24BDDB5B0], "convertMatterCertificate:", v50);
                  v145 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = v153;
                  v144 = v51;
                  if ((objc_msgSend(MEMORY[0x24BDDB5B0], "keypair:matchesCertificate:", v151) & 1) != 0)
                  {
                    v142 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB5A8]), "initWithTLVBytes:", v51);
                    objc_msgSend(v142, "subject");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v52, "fabricID");
                    v138 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v140)
                      goto LABEL_45;
                    objc_msgSend(v142, "notBefore");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();

                    context = (void *)MEMORY[0x242656984]();
                    v132 = v159;
                    HMFGetOSLogHandle();
                    log = objc_claimAutoreleasedReturnValue();
                    v54 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
                    if (v53 >= v139)
                    {
                      if (v54)
                      {
                        HMFGetLogIdentifier();
                        v92 = (void *)objc_claimAutoreleasedReturnValue();
                        v93 = objc_msgSend(v34, "unsignedIntValue");
                        *(_DWORD *)buf = 138543874;
                        v166 = v92;
                        v167 = 2112;
                        *(_QWORD *)v168 = v138;
                        *(_WORD *)&v168[8] = 1024;
                        LODWORD(v169) = v93;
                        _os_log_impl(&dword_23E95B000, log, OS_LOG_TYPE_INFO, "%{public}@Redundant system commissioner NOC present in MatterSupport storage with fabricID %@, index: 0x%x", buf, 0x1Cu);

                      }
                      objc_autoreleasePoolPop(context);
                      v62 = (void *)v155;
                      v61 = v138;
                    }
                    else
                    {
                      if (v54)
                      {
                        HMFGetLogIdentifier();
                        v55 = (void *)objc_claimAutoreleasedReturnValue();
                        v56 = objc_msgSend(v137, "unsignedIntValue");
                        *(_DWORD *)buf = 138543874;
                        v166 = v55;
                        v167 = 2112;
                        *(_QWORD *)v168 = v140;
                        *(_WORD *)&v168[8] = 1024;
                        LODWORD(v169) = v56;
                        _os_log_impl(&dword_23E95B000, log, OS_LOG_TYPE_INFO, "%{public}@Redundant system commissioner NOC present in MatterSupport storage with fabricID %@, index: 0x%x", buf, 0x1Cu);

                      }
                      objc_autoreleasePoolPop(context);
LABEL_45:
                      v133 = v138;

                      v141 = v34;
                      objc_msgSend(v142, "notBefore");
                      v57 = objc_claimAutoreleasedReturnValue();

                      v58 = v153;
                      v59 = v145;

                      v60 = v151;
                      v61 = v138;
                      v135 = v59;
                      v136 = v60;
                      v32 = v157;
                      v13 = v152;
                      v134 = v58;
                      v15 = 0x24BDD1000;
                      v137 = v141;
                      v139 = (void *)v57;
                      v140 = v133;
                      v62 = (void *)v155;
                    }

                  }
                  else
                  {
                    v143 = (void *)MEMORY[0x242656984]();
                    v87 = v159;
                    HMFGetOSLogHandle();
                    v88 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
                    {
                      HMFGetLogIdentifier();
                      v89 = (void *)objc_claimAutoreleasedReturnValue();
                      v90 = objc_msgSend(v34, "unsignedIntValue");
                      v91 = objc_msgSend(v34, "unsignedIntValue");
                      *(_DWORD *)buf = 138543874;
                      v166 = v89;
                      v167 = 1024;
                      *(_DWORD *)v168 = v90;
                      v13 = v152;
                      *(_WORD *)&v168[4] = 1024;
                      *(_DWORD *)&v168[6] = v91;
                      _os_log_impl(&dword_23E95B000, v88, OS_LOG_TYPE_ERROR, "%{public}@f/%x/n doesn't match f/%x/o", buf, 0x18u);

                      v15 = 0x24BDD1000;
                    }

                    objc_autoreleasePoolPop(v143);
                    v32 = v157;
                    v62 = (void *)v155;
                  }
                  v82 = (void *)v147;

                }
                else
                {
                  v146 = (void *)MEMORY[0x242656984]();
                  v78 = v159;
                  HMFGetOSLogHandle();
                  v79 = objc_claimAutoreleasedReturnValue();
                  v41 = v153;
                  if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    v81 = objc_msgSend(v34, "unsignedIntValue");
                    *(_DWORD *)buf = 138543618;
                    v166 = v80;
                    v167 = 1024;
                    *(_DWORD *)v168 = v81;
                    _os_log_impl(&dword_23E95B000, v79, OS_LOG_TYPE_ERROR, "%{public}@No f/%x/n in storage", buf, 0x12u);

                    v15 = 0x24BDD1000;
                  }

                  objc_autoreleasePoolPop(v146);
                  v32 = v157;
                  v62 = (void *)v155;
                  v82 = (void *)v147;
                }

              }
              else
              {
                v149 = (void *)MEMORY[0x242656984]();
                v83 = v159;
                HMFGetOSLogHandle();
                v84 = objc_claimAutoreleasedReturnValue();
                v13 = v42;
                if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  v86 = objc_msgSend(v34, "unsignedIntValue");
                  *(_DWORD *)buf = 138543618;
                  v166 = v85;
                  v167 = 1024;
                  *(_DWORD *)v168 = v86;
                  _os_log_impl(&dword_23E95B000, v84, OS_LOG_TYPE_ERROR, "%{public}@f/%x/o format mismatch", buf, 0x12u);

                  v15 = 0x24BDD1000;
                }

                objc_autoreleasePoolPop(v149);
                v32 = v157;
                v62 = (void *)v155;
                v41 = v153;
              }

            }
            else
            {
              v73 = (void *)MEMORY[0x242656984]();
              v74 = v159;
              HMFGetOSLogHandle();
              v75 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                v77 = objc_msgSend(v34, "unsignedIntValue");
                *(_DWORD *)buf = 138543618;
                v166 = v76;
                v167 = 1024;
                *(_DWORD *)v168 = v77;
                _os_log_impl(&dword_23E95B000, v75, OS_LOG_TYPE_ERROR, "%{public}@No f/%x/o in storage", buf, 0x12u);

                v15 = 0x24BDD1000;
              }

              objc_autoreleasePoolPop(v73);
              v13 = v152;
              v41 = v153;
              v32 = v157;
              v62 = (void *)v155;
            }

          }
          else
          {
            v68 = (void *)MEMORY[0x242656984]();
            v69 = v159;
            HMFGetOSLogHandle();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = objc_msgSend(v34, "unsignedIntValue");
              *(_DWORD *)buf = 138543618;
              v166 = v71;
              v167 = 1024;
              *(_DWORD *)v168 = v72;
              _os_log_impl(&dword_23E95B000, v70, OS_LOG_TYPE_INFO, "%{public}@Ignoring incompatible system commissioner fabric in MatterSupport storage with index: 0x%x", buf, 0x12u);

              v13 = v152;
            }

            objc_autoreleasePoolPop(v68);
            v15 = 0x24BDD1000;
            v32 = v157;
          }

          goto LABEL_73;
        }
      }
      v63 = (void *)MEMORY[0x242656984]();
      v64 = v159;
      HMFGetOSLogHandle();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v34, "unsignedIntValue");
        *(_DWORD *)buf = 138543618;
        v166 = v66;
        v167 = 1024;
        *(_DWORD *)v168 = v67;
        _os_log_impl(&dword_23E95B000, v65, OS_LOG_TYPE_ERROR, "%{public}@f/%x/r isn't base 64 encoded", buf, 0x12u);

      }
      objc_autoreleasePoolPop(v63);
      v32 = v157;
LABEL_73:

    }
    v160 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v161, v170, 16);
  }
  while (v160);

  if (v137)
  {
    v94 = (void *)MEMORY[0x242656984]();
    v95 = v159;
    HMFGetOSLogHandle();
    v96 = objc_claimAutoreleasedReturnValue();
    v25 = v125;
    v17 = v126;
    v26 = v124;
    v97 = v140;
    if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v166 = v98;
      v167 = 2112;
      *(_QWORD *)v168 = v137;
      *(_WORD *)&v168[8] = 2112;
      v169 = v140;
      _os_log_impl(&dword_23E95B000, v96, OS_LOG_TYPE_INFO, "%{public}@Picked fabric index %@ with fabric ID %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v94);
    v99 = objc_retainAutorelease(v134);
    *v128 = v99;
    v100 = objc_retainAutorelease(v135);
    *v127 = v100;
    v101 = objc_retainAutorelease(v136);
    *v123 = v101;
    v102 = 1;
    v103 = v139;
    v104 = v137;
  }
  else
  {
    v102 = 0;
    v104 = 0;
    v25 = v125;
    v17 = v126;
    v26 = v124;
    v100 = v135;
    v101 = v136;
    v99 = v134;
    v103 = v139;
    v97 = v140;
  }
LABEL_97:

LABEL_98:
LABEL_99:

LABEL_100:
LABEL_101:

LABEL_102:
  return v102;
}

- (void)_handleKeychainDataChanged
{
  void *v3;
  void *v4;
  HMMTRSystemCommissionerControllerParams *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  HMMTRSystemCommissionerControllerParams *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HMMTRSystemCommissionerControllerParams v1MatterKeypairFromKeychain](self, "v1MatterKeypairFromKeychain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (-[HMMTRSystemCommissionerControllerParams v1KeypairIsEquivalentTo:](self, "v1KeypairIsEquivalentTo:", v3))
    {
      v4 = (void *)MEMORY[0x242656984]();
      v5 = self;
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v7;
        _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@V1 keypair remains the same", (uint8_t *)&v13, 0xCu);

      }
      objc_autoreleasePoolPop(v4);
    }
    else
    {
      -[HMMTRSystemCommissionerControllerParams _startWithV1Keypair:](self, "_startWithV1Keypair:", v3);
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@V1 keypair disappeared from keychain", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMMTRSystemCommissionerControllerParams controllerWrapper](v9, "controllerWrapper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "remove");

    -[HMMTRSystemCommissionerControllerParams setControllerWrapper:](v9, "setControllerWrapper:", 0);
  }

}

- (BOOL)v1KeypairIsEquivalentTo:(id)a3
{
  id v4;
  void *v5;
  HMMTRMatterKeypair *v6;
  void *v7;
  HMMTRMatterKeypair *v8;
  HMMTRMatterKeypair *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  -[HMMTRSystemCommissionerControllerParams v1keypair](self, "v1keypair");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "operationalKey"))
  {
    v6 = [HMMTRMatterKeypair alloc];
    -[HMMTRSystemCommissionerControllerParams v1keypair](self, "v1keypair");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMMTRMatterKeypair initWithPrivateKey:](v6, "initWithPrivateKey:", objc_msgSend(v7, "operationalKey"));

  }
  else
  {
    v8 = 0;
  }

  if (objc_msgSend(v4, "operationalKey"))
    v9 = -[HMMTRMatterKeypair initWithPrivateKey:]([HMMTRMatterKeypair alloc], "initWithPrivateKey:", objc_msgSend(v4, "operationalKey"));
  else
    v9 = 0;
  -[HMMTRSystemCommissionerControllerParams v1keypair](self, "v1keypair");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serialize");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serialize");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqual:", v12))
  {
    -[HMMTRMatterKeypair serialize](v8, "serialize");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRMatterKeypair serialize](v9, "serialize");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqual:", v14))
    {
      -[HMMTRSystemCommissionerControllerParams v1keypair](self, "v1keypair");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "rootCert");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "rootCert");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v15;
      if (objc_msgSend(v15, "isEqual:", v27))
      {
        -[HMMTRSystemCommissionerControllerParams v1keypair](self, "v1keypair");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "operationalCert");
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "operationalCert");
        v17 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v16;
        v18 = (void *)v16;
        v19 = (void *)v17;
        if (objc_msgSend(v18, "isEqual:", v17))
        {
          -[HMMTRSystemCommissionerControllerParams v1keypair](self, "v1keypair");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "ipk");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "ipk");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v23, "isEqual:", v22);

        }
        else
        {
          v20 = 0;
        }

      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)v0MatterKeypairFromKeychain
{
  return -[HMMTRMatterKeypair initWithV0Account:]([HMMTRMatterKeypair alloc], "initWithV0Account:", CFSTR("CHIPPlugin.systemCommissioner.nodeopcerts.CA:0"));
}

- (id)v1MatterKeypairFromKeychain
{
  return -[HMMTRMatterKeypair initWithV1Account:]([HMMTRMatterKeypair alloc], "initWithV1Account:", CFSTR("CHIPPlugin.systemCommissioner.nodeopcerts.CA:1"));
}

- (id)storeV0MatterKeypair
{
  return -[HMMTRMatterKeypair initWithAccount:]([HMMTRMatterKeypair alloc], "initWithAccount:", CFSTR("CHIPPlugin.systemCommissioner.nodeopcerts.CA:0"));
}

- (id)storeV0MatterKeypairWithPrivateKey:(__SecKey *)a3
{
  return -[HMMTRMatterKeypair initWithV0Account:privateKey:]([HMMTRMatterKeypair alloc], "initWithV0Account:privateKey:", CFSTR("CHIPPlugin.systemCommissioner.nodeopcerts.CA:0"), a3);
}

- (id)storeV1MatterKeypairWithPrivateKey:(__SecKey *)a3 operationalKey:(__SecKey *)a4 rootCert:(id)a5 operationalCert:(id)a6 ipk:(id)a7
{
  id v11;
  id v12;
  id v13;
  HMMTRMatterKeypair *v14;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = -[HMMTRMatterKeypair initWithV1Account:privateKey:operationalKey:rootCert:operationalCert:ipk:]([HMMTRMatterKeypair alloc], "initWithV1Account:privateKey:operationalKey:rootCert:operationalCert:ipk:", CFSTR("CHIPPlugin.systemCommissioner.nodeopcerts.CA:1"), a3, a4, v13, v12, v11);

  return v14;
}

- (id)mtsKeyValueStore
{
  return objc_alloc_init(MEMORY[0x24BDDB880]);
}

- (NSNumber)commissioneeNodeID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCommissioneeNodeID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)productAttestationAuthorityCertificates
{
  return self->_productAttestationAuthorityCertificates;
}

- (void)setProductAttestationAuthorityCertificates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)certificationDeclarationCertificates
{
  return self->_certificationDeclarationCertificates;
}

- (void)setCertificationDeclarationCertificates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (HMMTRControllerFactory)controllerFactory
{
  return self->_controllerFactory;
}

- (HMMTRControllerWrapper)controllerWrapper
{
  return self->_controllerWrapper;
}

- (void)setControllerWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_controllerWrapper, a3);
}

- (HMMTRMatterKeypair)v1keypair
{
  return self->_v1keypair;
}

- (void)setV1keypair:(id)a3
{
  objc_storeStrong((id *)&self->_v1keypair, a3);
}

- (NSNumber)commissioningFabricID
{
  return self->_commissioningFabricID;
}

- (void)setCommissioningFabricID:(id)a3
{
  objc_storeStrong((id *)&self->_commissioningFabricID, a3);
}

- (NSNumber)adminNodeID
{
  return self->_adminNodeID;
}

- (void)setAdminNodeID:(id)a3
{
  objc_storeStrong((id *)&self->_adminNodeID, a3);
}

- (BOOL)generatingKeyPair
{
  return self->_generatingKeyPair;
}

- (void)setGeneratingKeyPair:(BOOL)a3
{
  self->_generatingKeyPair = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adminNodeID, 0);
  objc_storeStrong((id *)&self->_commissioningFabricID, 0);
  objc_storeStrong((id *)&self->_v1keypair, 0);
  objc_storeStrong((id *)&self->_controllerWrapper, 0);
  objc_storeStrong((id *)&self->_controllerFactory, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_certificationDeclarationCertificates, 0);
  objc_storeStrong((id *)&self->_productAttestationAuthorityCertificates, 0);
  objc_storeStrong((id *)&self->_commissioneeNodeID, 0);
}

void __67__HMMTRSystemCommissionerControllerParams_handleKeyPairDataChanged__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "generatingKeyPair"))
  {
    v2 = (void *)MEMORY[0x242656984]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Currently generating key pair. Will ignore the keypair data change.", (uint8_t *)&v6, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleKeychainDataChanged");
  }
}

void __104__HMMTRSystemCommissionerControllerParams_fetchControllerParamsAllowingNew_nocSigner_controllerWrapper___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "controllerWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x242656984]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v6;
      _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_DEBUG, "%{public}@No new fabric created. Returning previous controller wrapper.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "v1MatterKeypairFromKeychain");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      if (*(_BYTE *)(a1 + 56))
      {
        v9 = *(void **)(a1 + 32);
        v24 = 0;
        v10 = objc_msgSend(v9, "_checkAndUpdateValidityPeriodOfV1Keypair:newKeyPair:", v8, &v24);
        v11 = v24;
        v12 = v11;
        if (v10)
        {
          v13 = v11;

          v8 = v13;
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "_startWithV1Keypair:", v8);

    }
    else
    {
      v14 = (void *)MEMORY[0x242656984]();
      v15 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v26 = v17;
        _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@No V1 keypair present", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(*(id *)(a1 + 32), "_buildV1KeyFromV0KeyAllowingNew:", *(unsigned __int8 *)(a1 + 56));
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "v1keypair");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v18;

  objc_msgSend(*(id *)(a1 + 32), "controllerWrapper");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v21;

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t62 != -1)
    dispatch_once(&logCategory__hmf_once_t62, &__block_literal_global_6250);
  return (id)logCategory__hmf_once_v63;
}

void __54__HMMTRSystemCommissionerControllerParams_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v63;
  logCategory__hmf_once_v63 = v0;

}

@end
