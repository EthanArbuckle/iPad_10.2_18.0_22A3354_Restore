@implementation HMMTROperationalCertificateIssuer

- (HMMTROperationalCertificateIssuer)initWithQueue:(id)a3 rootCertificate:(id)a4 browser:(id)a5
{
  id v8;
  id v9;
  HMMTROperationalCertificateIssuer *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v8 = a4;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMMTROperationalCertificateIssuer;
  v10 = -[HMMTROperationalCertificateIssuer init](&v14, sel_init);
  if (v10)
  {
    v11 = dispatch_queue_create("HMMTROperationalCertificateIssuer", 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v10->_rootCertificate, a4);
    objc_storeWeak((id *)&v10->_browser, v9);
  }

  return v10;
}

- (BOOL)isEquivalentTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  -[HMMTROperationalCertificateIssuer rootCertificate](self, "rootCertificate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    objc_msgSend(v4, "rootCertificate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_5;
  }
  v7 = (void *)MEMORY[0x24BDDB5B0];
  -[HMMTROperationalCertificateIssuer rootCertificate](self, "rootCertificate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootCertificate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isCertificate:equalTo:", v8, v9);

  if (!(_DWORD)v7)
  {
    v12 = 0;
    goto LABEL_7;
  }
LABEL_5:
  -[HMMTROperationalCertificateIssuer browser](self, "browser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "browser");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 == v11;

LABEL_7:
  return v12;
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
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  HMMTROperationalCertificateIssuer *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x24BDDB5B0];
  objc_msgSend(v10, "csr");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v14, "publicKeyFromCSR:error:", v15, &v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v27;

  v18 = (void *)MEMORY[0x242656984]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v21;
    v30 = 2112;
    v31 = v16;
    _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Extracted Public Key from Operational Certificate %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  -[HMMTROperationalCertificateIssuer browser](v19, "browser");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTROperationalCertificateIssuer rootCertificate](v19, "rootCertificate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __113__HMMTROperationalCertificateIssuer_issueOperationalCertificateForRequest_attestationInfo_controller_completion___block_invoke;
  v25[3] = &unk_250F21960;
  v25[4] = v19;
  v26 = v13;
  v24 = v13;
  objc_msgSend(v22, "fetchCommissioningCertificatesForAccessoryWithOperationalPublicKey:rootCertificate:completionHandler:", v16, v23, v25);

}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (HMMTRAccessoryServerBrowser)browser
{
  return (HMMTRAccessoryServerBrowser *)objc_loadWeakRetained((id *)&self->_browser);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSData)rootCertificate
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootCertificate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_browser);
}

void __113__HMMTROperationalCertificateIssuer_issueOperationalCertificateForRequest_attestationInfo_controller_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x242656984]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v7 && v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v14;
      v27 = 2112;
      v28 = v7;
      v29 = 2112;
      v30 = v8;
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched Root %@ and Operational Certificate %@ for accessory getting paired", (uint8_t *)&v25, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = (void *)MEMORY[0x242656984]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v18;
      _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_INFO, "%{public}@Root certificate:", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    v19 = (void *)MEMORY[0x242656984](objc_msgSend(MEMORY[0x24BDDB5B0], "printX509Certificate:", v7));
    v20 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v22;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_INFO, "%{public}@NOC for accessory:", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x24BDDB5B0], "printX509Certificate:", v8);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB7B0]), "initWithOperationalCertificate:intermediateCertificate:rootCertificate:adminSubject:", v8, 0, v7, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v24;
      v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch Root / Operational Certificate for accessory getting paired with error %@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
