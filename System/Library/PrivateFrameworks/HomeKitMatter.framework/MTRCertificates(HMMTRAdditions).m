@implementation MTRCertificates(HMMTRAdditions)

+ (void)printMatterCertificate:()HMMTRAdditions
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
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
  NSObject *v25;
  _BOOL4 v26;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB5A8]), "initWithTLVBytes:", v3);
  v5 = (void *)MEMORY[0x242656984]();
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notBefore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notAfter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v47 = v7;
    v48 = 2112;
    v49 = v8;
    v50 = 2112;
    v51 = v9;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Certificate valid between %@ and %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "issuer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x242656984]();
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v13)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "issuer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "nodeID");
      v40 = v11;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "issuer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "fabricID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "issuer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "rootCACertificateID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "issuer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "intermediateCACertificateID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "issuer");
      v44 = v3;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "caseAuthenticatedTags");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v47 = v14;
      v48 = 2112;
      v49 = v15;
      v50 = 2112;
      v51 = v16;
      v52 = 2112;
      v53 = v17;
      v54 = 2112;
      v55 = v19;
      v56 = 2112;
      v57 = v21;
      _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@Certificate issuer node ID = %@, fabricID = %@, root certificate ID = %@, intermediate certificate ID = %@, CATs = %@", buf, 0x3Eu);

      v3 = v44;
      v11 = v40;

    }
  }
  else if (v13)
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v47 = v22;
    _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@Certificate issuer = nil", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v4, "subject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x242656984]();
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
  if (v23)
  {
    if (v26)
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "subject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "nodeID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "subject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "fabricID");
      v39 = v24;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "subject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "rootCACertificateID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "subject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "intermediateCACertificateID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "subject");
      v45 = v3;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "caseAuthenticatedTags");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v47 = v27;
      v48 = 2112;
      v49 = v28;
      v50 = 2112;
      v51 = v29;
      v52 = 2112;
      v53 = v30;
      v54 = 2112;
      v55 = v32;
      v56 = 2112;
      v57 = v34;
      _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_INFO, "%{public}@Certificate subject node ID = %@, fabricID = %@, root certificate ID = %@, intermediate certificate ID = %@, CATs = %@", buf, 0x3Eu);

      v3 = v45;
      v24 = v39;

    }
  }
  else if (v26)
  {
    HMFGetLogIdentifier();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v47 = v35;
    _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_INFO, "%{public}@Certificate subject = nil", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v24);

}

+ (void)printX509Certificate:()HMMTRAdditions
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDDB5B0], "convertX509Certificate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "printMatterCertificate:", v5);
  }
  else
  {
    v6 = (void *)MEMORY[0x242656984]();
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Failed to convert X509 certificate", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }

}

+ (id)describeMatterCertificate:()HMMTRAdditions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = a3;
  objc_msgSend(v3, "string");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB5A8]), "initWithTLVBytes:", v4);

  objc_msgSend(v5, "notBefore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notAfter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "appendFormat:", CFSTR("\nValidity: [%@ - %@]"), v7, v9);

  objc_msgSend(v5, "issuer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "nodeID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "issuer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fabricID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "issuer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rootCACertificateID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "issuer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "intermediateCACertificateID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "issuer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "caseAuthenticatedTags");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "appendFormat:", CFSTR("\nIssuer: [node ID = %@, fabricID = %@, root certificate ID = %@, intermediate certificate ID = %@, CATs = %@]"), v10, v12, v14, v16, v18);

  objc_msgSend(v5, "subject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "nodeID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "fabricID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rootCACertificateID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "intermediateCACertificateID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "caseAuthenticatedTags");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "appendFormat:", CFSTR("\nSubject: [node ID = %@, fabricID = %@, root certificate ID = %@, intermediate certificate ID = %@, CATs = %@]\n"), v19, v20, v22, v24, v26);

  return v31;
}

+ (__CFString)describeX509Certificate:()HMMTRAdditions
{
  void *v2;
  __CFString *v3;

  objc_msgSend(MEMORY[0x24BDDB5B0], "convertX509Certificate:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "describeMatterCertificate:", v2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("(invalid X509 certificate)");
  }

  return v3;
}

+ (id)shortDescriptionForMatterCertificate:()HMMTRAdditions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = a3;
  objc_msgSend(v3, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB5A8]), "initWithTLVBytes:", v4);

  objc_msgSend(v6, "subject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nodeID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "subject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nodeID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("NodeID = %@, "), v10);

  }
  objc_msgSend(v6, "subject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fabricID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "subject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fabricID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("FabricID = %@, "), v14);

  }
  objc_msgSend(v6, "subject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "caseAuthenticatedTags");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    objc_msgSend(v6, "subject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "caseAuthenticatedTags");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR(","));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("CATs = %@, "), v21);

  }
  return v5;
}

+ (__CFString)shortDescriptionForX509Certificate:()HMMTRAdditions
{
  void *v2;
  __CFString *v3;

  objc_msgSend(MEMORY[0x24BDDB5B0], "convertX509Certificate:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "shortDescriptionForMatterCertificate:", v2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("(invalid X509 certificate)");
  }

  return v3;
}

+ (id)fabricIDFromCertificate:()HMMTRAdditions
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDDB5B0], "convertX509Certificate:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = v3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB5A8]), "initWithTLVBytes:", v4);
  objc_msgSend(v5, "issuer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fabricID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
