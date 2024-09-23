@implementation HMMTRAccessoryServerFactory

- (HMMTRAccessoryServerFactory)initWithKeystore:(id)a3 browser:(id)a4
{
  id v6;
  id v7;
  HMMTRAccessoryServerFactory *v8;
  HMMTRAccessoryServerFactory *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMMTRAccessoryServerFactory;
  v8 = -[HMMTRAccessoryServerFactory init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_keystore, v6);
    objc_storeWeak((id *)&v9->_browser, v7);
  }

  return v9;
}

- (id)vendAccessoryServerWithNodeID:(id)a3 setupCode:(id)a4 discriminator:(id)a5 category:(id)a6 vendorID:(id)a7 productID:(id)a8 serialNumber:(id)a9 firmwareRevision:(id)a10
{
  const __CFString *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  HMMTRAccessoryServerFactory *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  HMMTRAccessoryServerFactory *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  HMMTRAccessoryServerFactory *v40;
  NSObject *v41;
  void *v42;
  HMMTRAccessoryServerBuilder *v43;
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
  id v56;
  void *v57;
  void *v59;
  void *v60;
  __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  HMMTRAccessoryServerBuilder *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  __CFString *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  id v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  const __CFString *v83;
  __int16 v84;
  id v85;
  __int16 v86;
  id v87;
  __int16 v88;
  id v89;
  __int16 v90;
  id v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v16 = (const __CFString *)a3;
  v77 = a4;
  v76 = a5;
  v79 = a6;
  v17 = a7;
  v18 = a8;
  v78 = a9;
  v19 = v18;
  v72 = a10;
  v20 = (void *)MEMORY[0x242656984]();
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v81 = v23;
    v82 = 2112;
    v83 = v16;
    v84 = 2112;
    v85 = v79;
    v86 = 2112;
    v87 = v17;
    v88 = 2112;
    v89 = v19;
    v90 = 2112;
    v91 = v78;
    _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_DEBUG, "%{public}@vendAccessoryServerWithNodeID - nodeID: %@, category: %@, vid: %@, pid %@, serial %@", buf, 0x3Eu);

  }
  objc_autoreleasePoolPop(v20);
  if (!v17)
  {
    v30 = 0;
    v75 = 0;
LABEL_14:
    v39 = (void *)MEMORY[0x242656984]();
    v40 = v21;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v81 = v42;
      v82 = 2112;
      v83 = CFSTR("Matter Accessory");
      _os_log_impl(&dword_23E95B000, v41, OS_LOG_TYPE_INFO, "%{public}@No product name information available so using default name: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v39);
    v33 = CFSTR("Matter Accessory");
    goto LABEL_17;
  }
  -[HMMTRAccessoryServerFactory browser](v21, "browser");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "vendorMetadataStore");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "metadata");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "vendorWithID:", v17);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong(&vendorId, a7);
  if (!v19)
  {
    v75 = 0;
    v30 = v27;
    goto LABEL_14;
  }
  objc_storeStrong(&productId, a8);
  objc_msgSend(v27, "productWithID:", v19);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "categoryNumber");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v27;
  if (v29)
  {
    objc_msgSend(v28, "categoryNumber");
    v31 = objc_claimAutoreleasedReturnValue();

    v79 = (id)v31;
  }
  objc_msgSend(v28, "name");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = v28;
  if (!v32)
    goto LABEL_14;
  objc_msgSend(v28, "name");
  v33 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x242656984]();
  v35 = v21;
  HMFGetOSLogHandle();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "name");
    v73 = v30;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v81 = v37;
    v82 = 2112;
    v83 = v33;
    v84 = 2112;
    v85 = v38;
    _os_log_impl(&dword_23E95B000, v36, OS_LOG_TYPE_INFO, "%{public}@Using metadata product name: %@ and vendor name: %@", buf, 0x20u);

    v30 = v73;
  }

  objc_autoreleasePoolPop(v34);
  if (!v33)
    goto LABEL_14;
LABEL_17:
  v61 = (__CFString *)v33;
  v74 = v30;
  +[HMMTRUtilities identifierStringWithCHIPNodeID:](HMMTRUtilities, "identifierStringWithCHIPNodeID:", v16);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = [HMMTRAccessoryServerBuilder alloc];
  -[HMMTRAccessoryServerFactory keystore](v21, "keystore");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessoryServerFactory browser](v21, "browser");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = -[HMMTRAccessoryServerBuilder initWithKeystore:browser:](v43, "initWithKeystore:browser:", v68, v66);
  -[HMMTRAccessoryServerBuilder name:](v65, "name:", v33);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "nodeID:", v16);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "vendorID:", v17);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "name");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "vendorName:", v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "productID:", v19);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "name");
  v71 = v19;
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "productName:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "identifier:", v67);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "manufacturer:", 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "model:", 0);
  v70 = (__CFString *)v16;
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "serialNumber:", v78);
  v69 = v17;
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "category:", v79);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setUpPinCode:", v77);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "discriminator:", v76);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMMTRUtilities sanitizeHAPName:](HMMTRUtilities, "sanitizeHAPName:", v61);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMMTRAccessoryServerFactory createInfoService:model:manufacturer:serialNumber:instanceID:endpointID:](HMMTRAccessoryServerFactory, "createInfoService:model:manufacturer:serialNumber:instanceID:endpointID:", v54, 0, 0, 0, 1, &unk_250F3F750);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (id)objc_msgSend(v53, "addService:", v55);

  objc_msgSend(v53, "build");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  return v57;
}

- (id)logIdentifier
{
  return CFSTR("HMMTRAccessoryServerFactory");
}

- (HMMTRAccessoryServerBrowser)browser
{
  return (HMMTRAccessoryServerBrowser *)objc_loadWeakRetained((id *)&self->_browser);
}

- (void)setBrowser:(id)a3
{
  objc_storeWeak((id *)&self->_browser, a3);
}

- (HAPKeyStore)keystore
{
  return (HAPKeyStore *)objc_loadWeakRetained((id *)&self->_keystore);
}

- (void)setKeystore:(id)a3
{
  objc_storeWeak((id *)&self->_keystore, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keystore);
  objc_destroyWeak((id *)&self->_browser);
}

+ (id)createInfoService:(id)a3 model:(id)a4 manufacturer:(id)a5 serialNumber:(id)a6 instanceID:(int64_t)a7 endpointID:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = 1;
  return (id)objc_msgSend(a1, "createInfoService:model:manufacturer:serialNumber:instanceID:endpointID:nodeID:legacyInstanceIDAssignment:", a3, a4, a5, a6, a7, a8, &unk_250F3F750, v9);
}

+ (id)createInfoService:(id)a3 model:(id)a4 manufacturer:(id)a5 serialNumber:(id)a6 instanceID:(unint64_t)a7 endpointID:(id)a8 nodeID:(id)a9 legacyInstanceIDAssignment:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  unint64_t v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  unint64_t v72;
  void *v73;
  id v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  HMMTRHAPService *v81;
  void *v82;
  HMMTRHAPService *v83;
  unint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  id v95;
  id v96;
  void *v97;
  void *v98;
  uint8_t buf[4];
  void *v100;
  __int16 v101;
  unint64_t v102;
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v95 = a4;
  v94 = a5;
  v93 = a6;
  v17 = a8;
  v18 = a9;
  objc_msgSend(MEMORY[0x24BE1BB20], "getSharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "getDefaultCharacteristicMetadata:", CFSTR("00000023-0000-1000-8000-0026BB765291"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "getDefaultCharacteristicProperties:", CFSTR("00000023-0000-1000-8000-0026BB765291"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "integerValue");

  v96 = a1;
  v97 = v17;
  v98 = v18;
  v85 = a7;
  if (a10)
  {
    v23 = a7 + 1;
  }
  else
  {
    objc_msgSend(a1, "instanceIDForCharacteristicType:serviceType:endpointID:nodeID:", CFSTR("00000023-0000-1000-8000-0026BB765291"), CFSTR("0000003E-0000-1000-8000-0026BB765291"), v17, v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v24, "unsignedLongLongValue");

  }
  v25 = objc_alloc(MEMORY[0x24BE1BA00]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v25, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:metadata:", CFSTR("00000023-0000-1000-8000-0026BB765291"), v26, v16, 0, v22, 1, v20);

  objc_msgSend(v19, "getDefaultCharacteristicMetadata:", CFSTR("00000021-0000-1000-8000-0026BB765291"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "getDefaultCharacteristicProperties:", CFSTR("00000021-0000-1000-8000-0026BB765291"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "integerValue");

  if (a10)
  {
    v31 = v23 + 1;
  }
  else
  {
    objc_msgSend(v96, "instanceIDForCharacteristicType:serviceType:endpointID:nodeID:", CFSTR("00000021-0000-1000-8000-0026BB765291"), CFSTR("0000003E-0000-1000-8000-0026BB765291"), v97, v98);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v32, "unsignedLongLongValue");

  }
  v33 = objc_alloc(MEMORY[0x24BE1BA00]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v31);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v33, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:metadata:", CFSTR("00000021-0000-1000-8000-0026BB765291"), v34, v95, 0, v30, 1, v28);

  objc_msgSend(v19, "getDefaultCharacteristicMetadata:", CFSTR("00000020-0000-1000-8000-0026BB765291"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "getDefaultCharacteristicProperties:", CFSTR("00000020-0000-1000-8000-0026BB765291"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "integerValue");

  if (a10)
  {
    v38 = v31 + 1;
  }
  else
  {
    objc_msgSend(v96, "instanceIDForCharacteristicType:serviceType:endpointID:nodeID:", CFSTR("00000020-0000-1000-8000-0026BB765291"), CFSTR("0000003E-0000-1000-8000-0026BB765291"), v97, v98);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v39, "unsignedLongLongValue");

  }
  v40 = objc_alloc(MEMORY[0x24BE1BA00]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v38);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = (void *)objc_msgSend(v40, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:metadata:", CFSTR("00000020-0000-1000-8000-0026BB765291"), v41, v94, 0, v37, 1, v35);

  objc_msgSend(v19, "getDefaultCharacteristicMetadata:", CFSTR("00000014-0000-1000-8000-0026BB765291"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "getDefaultCharacteristicProperties:", CFSTR("00000014-0000-1000-8000-0026BB765291"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "integerValue");

  if (a10)
  {
    v45 = v38 + 1;
  }
  else
  {
    objc_msgSend(v96, "instanceIDForCharacteristicType:serviceType:endpointID:nodeID:", CFSTR("00000014-0000-1000-8000-0026BB765291"), CFSTR("0000003E-0000-1000-8000-0026BB765291"), v97, v98);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v46, "unsignedLongLongValue");

  }
  v47 = objc_alloc(MEMORY[0x24BE1BA00]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v45);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = (void *)objc_msgSend(v47, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:metadata:", CFSTR("00000014-0000-1000-8000-0026BB765291"), v48, CFSTR("false"), 0, v44, 1, v42);

  objc_msgSend(v19, "getDefaultCharacteristicMetadata:", CFSTR("00000030-0000-1000-8000-0026BB765291"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "getDefaultCharacteristicProperties:", CFSTR("00000030-0000-1000-8000-0026BB765291"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "integerValue");

  v86 = v16;
  if (a10)
  {
    v52 = v45 + 1;
  }
  else
  {
    objc_msgSend(v96, "instanceIDForCharacteristicType:serviceType:endpointID:nodeID:", CFSTR("00000030-0000-1000-8000-0026BB765291"), CFSTR("0000003E-0000-1000-8000-0026BB765291"), v97, v98);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v53, "unsignedLongLongValue");

  }
  v54 = objc_alloc(MEMORY[0x24BE1BA00]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v52);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (void *)objc_msgSend(v54, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:metadata:", CFSTR("00000030-0000-1000-8000-0026BB765291"), v55, v93, 0, v51, 1, v49);

  objc_msgSend(v19, "getDefaultCharacteristicMetadata:", CFSTR("00000052-0000-1000-8000-0026BB765291"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "getDefaultCharacteristicProperties:", CFSTR("00000052-0000-1000-8000-0026BB765291"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "integerValue");

  if (a10)
  {
    v59 = v52 + 1;
    v60 = v96;
  }
  else
  {
    v60 = v96;
    objc_msgSend(v96, "instanceIDForCharacteristicType:serviceType:endpointID:nodeID:", CFSTR("00000052-0000-1000-8000-0026BB765291"), CFSTR("0000003E-0000-1000-8000-0026BB765291"), v97, v98);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v61, "unsignedLongLongValue");

  }
  v62 = objc_alloc(MEMORY[0x24BE1BA00]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v59);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (void *)objc_msgSend(v62, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:metadata:", CFSTR("00000052-0000-1000-8000-0026BB765291"), v63, 0, 0, v58, 1, v56);

  objc_msgSend(v19, "getDefaultCharacteristicMetadata:", CFSTR("0000026D-0000-1000-8000-0026BB765291"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "getDefaultCharacteristicProperties:", CFSTR("0000026D-0000-1000-8000-0026BB765291"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "integerValue");

  if (a10)
  {
    v66 = v59 + 1;
  }
  else
  {
    objc_msgSend(v60, "instanceIDForCharacteristicType:serviceType:endpointID:nodeID:", CFSTR("0000026D-0000-1000-8000-0026BB765291"), CFSTR("0000003E-0000-1000-8000-0026BB765291"), v97, v98);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v67, "unsignedLongLongValue");

  }
  v68 = (void *)v87;
  v69 = objc_alloc(MEMORY[0x24BE1BA00]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v66);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (void *)objc_msgSend(v69, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:metadata:", CFSTR("0000026D-0000-1000-8000-0026BB765291"), v70, &unk_250F3F750, 0, v65, 1, v89);

  v72 = a7;
  if (a10 && v66 >= a7 + 9)
  {
    v73 = (void *)MEMORY[0x242656984]();
    v74 = v60;
    HMFGetOSLogHandle();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v100 = v76;
      v101 = 2048;
      v102 = v66;
      _os_log_impl(&dword_23E95B000, v75, OS_LOG_TYPE_ERROR, "%{public}@Instance ID overflowed into next range: %lu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v73);
    v72 = v85;
    v68 = (void *)v87;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v27, v68, v92, v91, v90, v88, v71, 0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "getDefaultServiceProperties:", CFSTR("0000003E-0000-1000-8000-0026BB765291"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v78, "integerValue");

  if (!a10)
  {
    objc_msgSend(v96, "instanceIDForCharacteristicType:serviceType:endpointID:nodeID:", 0, CFSTR("0000003E-0000-1000-8000-0026BB765291"), v97, v98);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v80, "unsignedLongLongValue");

  }
  v81 = [HMMTRHAPService alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v72);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = -[HMMTRHAPService initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:endpoint:](v81, "initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:endpoint:", CFSTR("0000003E-0000-1000-8000-0026BB765291"), v82, v77, v79, MEMORY[0x24BDBD1A8], v97);

  return v83;
}

+ (id)createHMMTRHAPServiceCommon:(id)a3 characteristics:(id)a4 serviceLabelIndex:(id)a5 serviceInstanceID:(id)a6 endpointID:(id)a7 nodeID:(id)a8 topology:(id)a9 clusterIDCharacteristicMap:(id)a10 linkedServices:(id)a11
{
  id v16;
  id v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  unint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  HMMTRHAPService *v45;
  id v47;
  id v48;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  id v56;

  v51 = a3;
  v16 = a4;
  v48 = a5;
  v17 = a6;
  v56 = a7;
  v50 = a8;
  v54 = a9;
  v53 = a10;
  v47 = a11;
  objc_msgSend(MEMORY[0x24BE1BB20], "getSharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v17;
  if (objc_msgSend(v16, "count"))
  {
    v19 = 0;
    do
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "getDefaultCharacteristicMetadata:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMMTRProtocolMap protocolMap](HMMTRProtocolMap, "protocolMap");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "updateMetadataForCharacteristic:metadata:endpointID:topology:clusterIDCharacteristicMap:", v20, v21, v56, v54, v53);

      objc_msgSend(v18, "getDefaultCharacteristicProperties:", v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "integerValue");

      if (v17)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", ++v19 + objc_msgSend(v17, "unsignedLongLongValue"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v51, "hap_validatedAndNormalizedUUIDString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "instanceIDForCharacteristicType:serviceType:endpointID:nodeID:", v20, v26, v56, v50);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        ++v19;
      }
      v27 = v24 & 0xFFFFFFFFFFFFFFEFLL;
      v28 = objc_alloc(MEMORY[0x24BE1BA00]);
      objc_msgSend(v21, "constraints");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "minimumValue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v28, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:metadata:", v20, v25, v30, 0, v27, 1, v21);

      objc_msgSend(v55, "addObject:", v31);
      v17 = v52;
    }
    while (v19 < objc_msgSend(v16, "count"));
  }
  if (v48)
  {
    objc_msgSend(v18, "getDefaultCharacteristicProperties:", CFSTR("000000CB-0000-1000-8000-0026BB765291"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "integerValue") & 0xFFFFFFFFFFFFFFEFLL;

    objc_msgSend(v18, "getDefaultCharacteristicMetadata:", CFSTR("000000CB-0000-1000-8000-0026BB765291"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "hap_validatedAndNormalizedUUIDString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "instanceIDForCharacteristicType:serviceType:endpointID:nodeID:", CFSTR("000000CB-0000-1000-8000-0026BB765291"), v35, v56, v50);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_alloc(MEMORY[0x24BE1BA00]);
    v38 = v33;
    v17 = v52;
    v39 = (void *)objc_msgSend(v37, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:metadata:", CFSTR("000000CB-0000-1000-8000-0026BB765291"), v36, v48, 0, v38, 0, v34);
    objc_msgSend(v55, "addObject:", v39);

  }
  objc_msgSend(v18, "getDefaultServiceProperties:", v51);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "integerValue");

  if (v17)
  {
    v42 = v17;
    v43 = v56;
  }
  else
  {
    objc_msgSend(v51, "hap_validatedAndNormalizedUUIDString");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v56;
    objc_msgSend(a1, "instanceIDForCharacteristicType:serviceType:endpointID:nodeID:", 0, v44, v56, v50);
    v42 = (id)objc_claimAutoreleasedReturnValue();

  }
  v45 = -[HMMTRHAPService initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:endpoint:]([HMMTRHAPService alloc], "initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:endpoint:", v51, v42, v55, v41, v47, v43);

  return v45;
}

+ (id)createHMMTRHAPServiceLabelServiceWithEndpointID:(id)a3 nodeID:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMMTRHAPService *v19;
  void *v20;
  HMMTRHAPService *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BE1BB20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "getSharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getDefaultCharacteristicProperties:", CFSTR("000000CD-0000-1000-8000-0026BB765291"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue") & 0xFFFFFFFFFFFFFFEFLL;

  objc_msgSend(v9, "getDefaultCharacteristicMetadata:", CFSTR("000000CD-0000-1000-8000-0026BB765291"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("000000CC-0000-1000-8000-0026BB765291"), "hap_validatedAndNormalizedUUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "instanceIDForCharacteristicType:serviceType:endpointID:nodeID:", CFSTR("000000CD-0000-1000-8000-0026BB765291"), v13, v8, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BA00]), "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:metadata:", CFSTR("000000CD-0000-1000-8000-0026BB765291"), v14, &unk_250F3F738, 0, v11, 0, v12);
  objc_msgSend(v9, "getDefaultServiceProperties:", CFSTR("000000CC-0000-1000-8000-0026BB765291"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "integerValue");

  objc_msgSend(a1, "instanceIDForCharacteristicType:serviceType:endpointID:nodeID:", 0, v13, v8, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = [HMMTRHAPService alloc];
  v23[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HMMTRHAPService initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:endpoint:](v19, "initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:endpoint:", CFSTR("000000CC-0000-1000-8000-0026BB765291"), v18, v20, v17, MEMORY[0x24BDBD1A8], v8);

  return v21;
}

+ (id)instanceIDForCharacteristicType:(id)a3 serviceType:(id)a4 endpointID:(id)a5 nodeID:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  CC_SHA256_CTX c;
  _OWORD data[2];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  memset(data, 0, sizeof(data));
  if (v9)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v9);
    if (!v13)
      goto LABEL_10;
    v14 = v13;
    objc_msgSend(v13, "getUUIDBytes:", data);

  }
  else
  {
    *(_QWORD *)&data[0] = 0xFEFEFEFEFEFEFEFELL;
    *((_QWORD *)&data[0] + 1) = 0xFEFEFEFEFEFEFEFELL;
  }
  CC_SHA256_Update(&c, data, 0x10u);
  if (!v10)
  {
    *(_QWORD *)&data[0] = 0xEFEFEFEFEFEFEFEFLL;
    *((_QWORD *)&data[0] + 1) = 0xEFEFEFEFEFEFEFEFLL;
    goto LABEL_9;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v10);
  if (!v15)
LABEL_10:
    _HMFPreconditionFailure();
  v16 = v15;
  objc_msgSend(v15, "getUUIDBytes:", data);

LABEL_9:
  CC_SHA256_Update(&c, data, 0x10u);
  v19 = objc_msgSend(v11, "unsignedLongLongValue");
  CC_SHA256_Update(&c, &v19, 8u);
  v19 = objc_msgSend(v12, "unsignedLongLongValue");
  CC_SHA256_Update(&c, &v19, 8u);
  CC_SHA256_Final((unsigned __int8 *)data, &c);
  v19 = *(_QWORD *)&data[0] & 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_5703 != -1)
    dispatch_once(&logCategory__hmf_once_t4_5703, &__block_literal_global_5704);
  return (id)logCategory__hmf_once_v5_5705;
}

void __42__HMMTRAccessoryServerFactory_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_5705;
  logCategory__hmf_once_v5_5705 = v0;

}

@end
