@implementation MTRCertificates

+ (MTRCertificateDERBytes)createRootCertificate:(id)keypair issuerID:(NSNumber *)issuerID fabricID:(NSNumber *)fabricID validityPeriod:(NSDateInterval *)validityPeriod error:(NSError *)error
{
  id v11;
  NSNumber *v12;
  NSNumber *v13;
  NSDateInterval *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  id v26;
  uint8_t buf[16];
  uint64_t v28;
  uint8_t v29[4];
  char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v11 = keypair;
  v12 = issuerID;
  v13 = fabricID;
  v14 = validityPeriod;
  sub_234117B80(0, "NotSpecified");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_233BF3000, v15, OS_LOG_TYPE_DEFAULT, "Generating root certificate", buf, 2u);
  }

  if (sub_234114844(2u))
    sub_2341147D0(0, 2);
  memset(buf, 0, sizeof(buf));
  v28 = 0;
  v26 = 0;
  sub_234037D58(v11, v12, v13, v14, &v26, buf);
  v16 = v26;
  if (error)
  {
    v24 = *(_OWORD *)buf;
    v25 = v28;
    sub_2340017F0((uint64_t)MTRError, &v24);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  if (*(_DWORD *)buf)
  {
    sub_234117B80(0, "NotSpecified");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v22 = *(_OWORD *)buf;
      v23 = v28;
      v18 = sub_2341083CC((const char **)&v22, 1);
      *(_DWORD *)v29 = 136315138;
      v30 = v18;
      _os_log_impl(&dword_233BF3000, v17, OS_LOG_TYPE_ERROR, "Generating root certificate failed: %s", v29, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v20 = *(_OWORD *)buf;
      v21 = v28;
      sub_2341083CC((const char **)&v20, 1);
      sub_2341147D0(0, 1);
    }
  }

  return (MTRCertificateDERBytes)v16;
}

+ (MTRCertificateDERBytes)createRootCertificate:(id)keypair issuerID:(NSNumber *)issuerID fabricID:(NSNumber *)fabricID error:(NSError *)error
{
  id v10;
  NSNumber *v11;
  NSNumber *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *started;
  const char *v22;
  void *v23;

  v10 = keypair;
  v11 = issuerID;
  v12 = fabricID;
  v13 = objc_alloc(MEMORY[0x24BDD1508]);
  objc_msgSend_now(MEMORY[0x24BDBCE60], v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_distantFuture(MEMORY[0x24BDBCE60], v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  started = (void *)objc_msgSend_initWithStartDate_endDate_(v13, v20, (uint64_t)v16, v19);

  objc_msgSend_createRootCertificate_issuerID_fabricID_validityPeriod_error_(a1, v22, (uint64_t)v10, v11, v12, started, error);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTRCertificateDERBytes)v23;
}

+ (MTRCertificateDERBytes)createIntermediateCertificate:(id)rootKeypair rootCertificate:(MTRCertificateDERBytes)rootCertificate intermediatePublicKey:(SecKeyRef)intermediatePublicKey issuerID:(NSNumber *)issuerID fabricID:(NSNumber *)fabricID validityPeriod:(NSDateInterval *)validityPeriod error:(NSError *)error
{
  id v14;
  NSData *v15;
  NSNumber *v16;
  NSNumber *v17;
  NSDateInterval *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  id v30;
  uint8_t buf[16];
  uint64_t v32;
  uint8_t v33[4];
  char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v14 = rootKeypair;
  v15 = rootCertificate;
  v16 = issuerID;
  v17 = fabricID;
  v18 = validityPeriod;
  sub_234117B80(0, "NotSpecified");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_233BF3000, v19, OS_LOG_TYPE_DEFAULT, "Generating intermediate certificate", buf, 2u);
  }

  if (sub_234114844(2u))
    sub_2341147D0(0, 2);
  memset(buf, 0, sizeof(buf));
  v32 = 0;
  v30 = 0;
  sub_234038234(v14, v15, intermediatePublicKey, v16, v17, v18, &v30, buf);
  v20 = v30;
  if (error)
  {
    v28 = *(_OWORD *)buf;
    v29 = v32;
    sub_2340017F0((uint64_t)MTRError, &v28);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  if (*(_DWORD *)buf)
  {
    sub_234117B80(0, "NotSpecified");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v26 = *(_OWORD *)buf;
      v27 = v32;
      v22 = sub_2341083CC((const char **)&v26, 1);
      *(_DWORD *)v33 = 136315138;
      v34 = v22;
      _os_log_impl(&dword_233BF3000, v21, OS_LOG_TYPE_ERROR, "Generating intermediate certificate failed: %s", v33, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v24 = *(_OWORD *)buf;
      v25 = v32;
      sub_2341083CC((const char **)&v24, 1);
      sub_2341147D0(0, 1);
    }
  }

  return (MTRCertificateDERBytes)v20;
}

+ (MTRCertificateDERBytes)createIntermediateCertificate:(id)rootKeypair rootCertificate:(MTRCertificateDERBytes)rootCertificate intermediatePublicKey:(SecKeyRef)intermediatePublicKey issuerID:(NSNumber *)issuerID fabricID:(NSNumber *)fabricID error:(NSError *)error
{
  id v14;
  NSData *v15;
  NSNumber *v16;
  NSNumber *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *started;
  const char *v27;
  void *v28;

  v14 = rootKeypair;
  v15 = rootCertificate;
  v16 = issuerID;
  v17 = fabricID;
  v18 = objc_alloc(MEMORY[0x24BDD1508]);
  objc_msgSend_now(MEMORY[0x24BDBCE60], v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_distantFuture(MEMORY[0x24BDBCE60], v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  started = (void *)objc_msgSend_initWithStartDate_endDate_(v18, v25, (uint64_t)v21, v24);

  objc_msgSend_createIntermediateCertificate_rootCertificate_intermediatePublicKey_issuerID_fabricID_validityPeriod_error_(a1, v27, (uint64_t)v14, v15, intermediatePublicKey, v16, v17, started, error);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTRCertificateDERBytes)v28;
}

+ (MTRCertificateDERBytes)createOperationalCertificate:(id)signingKeypair signingCertificate:(MTRCertificateDERBytes)signingCertificate operationalPublicKey:(SecKeyRef)operationalPublicKey fabricID:(NSNumber *)fabricID nodeID:(NSNumber *)nodeID caseAuthenticatedTags:(NSSet *)caseAuthenticatedTags validityPeriod:(NSDateInterval *)validityPeriod error:(NSError *)error
{
  id v15;
  NSData *v16;
  NSNumber *v17;
  NSNumber *v18;
  NSSet *v19;
  NSDateInterval *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  char *v24;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  id v32;
  uint8_t buf[16];
  uint64_t v34;
  uint8_t v35[4];
  char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v15 = signingKeypair;
  v16 = signingCertificate;
  v17 = fabricID;
  v18 = nodeID;
  v19 = caseAuthenticatedTags;
  v20 = validityPeriod;
  sub_234117B80(0, "NotSpecified");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_233BF3000, v21, OS_LOG_TYPE_DEFAULT, "Generating operational certificate", buf, 2u);
  }

  if (sub_234114844(2u))
    sub_2341147D0(0, 2);
  memset(buf, 0, sizeof(buf));
  v34 = 0;
  v32 = 0;
  sub_2340387C8(v15, v16, operationalPublicKey, v17, v18, v19, v20, &v32, (uint64_t)buf);
  v22 = v32;
  if (error)
  {
    v30 = *(_OWORD *)buf;
    v31 = v34;
    sub_2340017F0((uint64_t)MTRError, &v30);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  if (*(_DWORD *)buf)
  {
    sub_234117B80(0, "NotSpecified");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v28 = *(_OWORD *)buf;
      v29 = v34;
      v24 = sub_2341083CC((const char **)&v28, 1);
      *(_DWORD *)v35 = 136315138;
      v36 = v24;
      _os_log_impl(&dword_233BF3000, v23, OS_LOG_TYPE_ERROR, "Generating operational certificate failed: %s", v35, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v26 = *(_OWORD *)buf;
      v27 = v34;
      sub_2341083CC((const char **)&v26, 1);
      sub_2341147D0(0, 1);
    }
  }

  return (MTRCertificateDERBytes)v22;
}

+ (MTRCertificateDERBytes)createOperationalCertificate:(id)signingKeypair signingCertificate:(MTRCertificateDERBytes)signingCertificate operationalPublicKey:(SecKeyRef)operationalPublicKey fabricID:(NSNumber *)fabricID nodeID:(NSNumber *)nodeID caseAuthenticatedTags:(NSSet *)caseAuthenticatedTags error:(NSError *)error
{
  NSData *v15;
  NSNumber *v16;
  NSNumber *v17;
  NSSet *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *started;
  const char *v28;
  void *v29;
  id v31;

  v31 = signingKeypair;
  v15 = signingCertificate;
  v16 = fabricID;
  v17 = nodeID;
  v18 = caseAuthenticatedTags;
  v19 = objc_alloc(MEMORY[0x24BDD1508]);
  objc_msgSend_now(MEMORY[0x24BDBCE60], v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_distantFuture(MEMORY[0x24BDBCE60], v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  started = (void *)objc_msgSend_initWithStartDate_endDate_(v19, v26, (uint64_t)v22, v25);

  objc_msgSend_createOperationalCertificate_signingCertificate_operationalPublicKey_fabricID_nodeID_caseAuthenticatedTags_validityPeriod_error_(a1, v28, (uint64_t)v31, v15, operationalPublicKey, v16, v17, v18, started, error);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTRCertificateDERBytes)v29;
}

+ (BOOL)keypair:(id)keypair matchesCertificate:(NSData *)certificate
{
  id v5;
  NSData *v6;
  const char *v7;
  uint64_t v8;
  __SecKey *v9;
  NSObject *v10;
  char *v11;
  BOOL v12;
  NSData *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  char *v21;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint8_t v35[16];
  uint64_t v36;
  uint8_t buf[88];
  uint64_t (**v38)();
  _QWORD v39[10];

  v39[9] = *MEMORY[0x24BDAC8D0];
  v5 = keypair;
  v6 = certificate;
  v38 = &off_250505A50;
  v32 = 0uLL;
  v33 = 0;
  v9 = (__SecKey *)objc_msgSend_publicKey(v5, v7, v8);
  sub_233C01A50(v9, (uint64_t)&v38, (uint64_t)&v32);
  if (!(_DWORD)v32)
  {
    *(_QWORD *)buf = &off_250505A50;
    v13 = objc_retainAutorelease(v6);
    v16 = objc_msgSend_bytes(v13, v14, v15);
    v19 = objc_msgSend_length(v13, v17, v18);
    sub_233BF7114(&v34, v16, v19);

    v27 = v34;
    sub_23413C364((uint64_t *)&v27, (uint64_t)buf, (uint64_t)v35);
    v32 = *(_OWORD *)v35;
    v33 = v36;
    if (!*(_DWORD *)v35)
    {
      v12 = memcmp(&buf[8], v39, 0x41uLL) == 0;
      goto LABEL_13;
    }
    sub_234117B80(0, "NotSpecified");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v25 = v32;
      v26 = v33;
      v21 = sub_2341083CC((const char **)&v25, 1);
      *(_DWORD *)v35 = 136315138;
      *(_QWORD *)&v35[4] = v21;
      _os_log_impl(&dword_233BF3000, v20, OS_LOG_TYPE_ERROR, "Can't extract public key from certificate: %s", v35, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v23 = v32;
      v24 = v33;
      sub_2341083CC((const char **)&v23, 1);
      sub_2341147D0(0, 1);
      v12 = 0;
      goto LABEL_13;
    }
LABEL_11:
    v12 = 0;
    goto LABEL_13;
  }
  sub_234117B80(0, "NotSpecified");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v30 = v32;
    v31 = v33;
    v11 = sub_2341083CC((const char **)&v30, 1);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v11;
    _os_log_impl(&dword_233BF3000, v10, OS_LOG_TYPE_ERROR, "Can't extract public key from keypair: %s", buf, 0xCu);
  }

  if (!sub_234114844(1u))
    goto LABEL_11;
  v28 = v32;
  v29 = v33;
  sub_2341083CC((const char **)&v28, 1);
  sub_2341147D0(0, 1);
  v12 = 0;
LABEL_13:

  return v12;
}

+ (BOOL)isCertificate:(MTRCertificateDERBytes)certificate1 equalTo:(MTRCertificateDERBytes)certificate2
{
  NSData *v5;
  NSData *v6;
  NSData *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  char *v15;
  BOOL v16;
  NSData *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  char *v25;
  NSData *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  char *v34;
  uint64_t v35;
  NSData *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  char *v44;
  uint64_t v45;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  __int128 v66;
  uint8_t v67[16];
  uint64_t v68;
  uint8_t v69[16];
  uint64_t v70;
  uint8_t buf[16];
  uint64_t v72;
  uint64_t (**v73)();
  _QWORD v74[11];

  v74[10] = *MEMORY[0x24BDAC8D0];
  v5 = certificate1;
  v6 = certificate2;
  v74[0] = &off_250505A50;
  v64 = 0uLL;
  v65 = 0;
  v7 = objc_retainAutorelease(v5);
  v10 = objc_msgSend_bytes(v7, v8, v9);
  v13 = objc_msgSend_length(v7, v11, v12);
  sub_233BF7114(buf, v10, v13);

  *(_OWORD *)v69 = *(_OWORD *)buf;
  sub_23413C364((uint64_t *)v69, (uint64_t)v74, (uint64_t)&v64);
  if ((_DWORD)v64)
  {
    sub_234117B80(0, "NotSpecified");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v62 = v64;
      v63 = v65;
      v15 = sub_2341083CC((const char **)&v62, 1);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v15;
      _os_log_impl(&dword_233BF3000, v14, OS_LOG_TYPE_ERROR, "Can't extract public key from first certificate: %s", buf, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v60 = v64;
      v61 = v65;
      sub_2341083CC((const char **)&v60, 1);
      sub_2341147D0(0, 1);
      v16 = 0;
      goto LABEL_29;
    }
LABEL_11:
    v16 = 0;
    goto LABEL_29;
  }
  v73 = &off_250505A50;
  v17 = objc_retainAutorelease(v6);
  v20 = objc_msgSend_bytes(v17, v18, v19);
  v23 = objc_msgSend_length(v17, v21, v22);
  sub_233BF7114(v69, v20, v23);

  *(_OWORD *)v67 = *(_OWORD *)v69;
  sub_23413C364((uint64_t *)v67, (uint64_t)&v73, (uint64_t)buf);
  v64 = *(_OWORD *)buf;
  v65 = v72;
  if (*(_DWORD *)buf)
  {
    sub_234117B80(0, "NotSpecified");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v58 = v64;
      v59 = v65;
      v25 = sub_2341083CC((const char **)&v58, 1);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v25;
      _os_log_impl(&dword_233BF3000, v24, OS_LOG_TYPE_ERROR, "Can't extract public key from second certificate: %s", buf, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v56 = v64;
      v57 = v65;
      sub_2341083CC((const char **)&v56, 1);
      sub_2341147D0(0, 1);
      v16 = 0;
      goto LABEL_29;
    }
    goto LABEL_11;
  }
  sub_2341D67D0((uint64_t)buf);
  v26 = objc_retainAutorelease(v7);
  v29 = objc_msgSend_bytes(v26, v27, v28);
  v32 = objc_msgSend_length(v26, v30, v31);
  sub_233BF7114(v67, v29, v32);

  v66 = *(_OWORD *)v67;
  sub_2341D8A94((uint64_t *)&v66, (uint64_t)buf, (uint64_t)v69);
  v64 = *(_OWORD *)v69;
  v65 = v70;
  if (*(_DWORD *)v69)
  {
    sub_234117B80(0, "NotSpecified");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v54 = v64;
      v55 = v65;
      v34 = sub_2341083CC((const char **)&v54, 1);
      *(_DWORD *)v69 = 136315138;
      *(_QWORD *)&v69[4] = v34;
      _os_log_impl(&dword_233BF3000, v33, OS_LOG_TYPE_ERROR, "Can't extract subject DN from first certificate: %s", v69, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v52 = v64;
      v53 = v65;
      sub_2341083CC((const char **)&v52, 1);
      sub_2341147D0(0, 1);
    }
    v16 = 0;
  }
  else
  {
    sub_2341D67D0((uint64_t)v69);
    v36 = objc_retainAutorelease(v17);
    v39 = objc_msgSend_bytes(v36, v37, v38);
    v42 = objc_msgSend_length(v36, v40, v41);
    sub_233BF7114(&v66, v39, v42);

    v51 = v66;
    sub_2341D8A94((uint64_t *)&v51, (uint64_t)v69, (uint64_t)v67);
    v64 = *(_OWORD *)v67;
    v65 = v68;
    if (*(_DWORD *)v67)
    {
      sub_234117B80(0, "NotSpecified");
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v49 = v64;
        v50 = v65;
        v44 = sub_2341083CC((const char **)&v49, 1);
        *(_DWORD *)v67 = 136315138;
        *(_QWORD *)&v67[4] = v44;
        _os_log_impl(&dword_233BF3000, v43, OS_LOG_TYPE_ERROR, "Can't extract subject DN from second certificate: %s", v67, 0xCu);
      }

      if (sub_234114844(1u))
      {
        v47 = v64;
        v48 = v65;
        sub_2341083CC((const char **)&v47, 1);
        sub_2341147D0(0, 1);
      }
      v16 = 0;
    }
    else
    {
      v16 = sub_2341D6674((uint64_t)buf, (uint64_t)v69);
    }
    nullsub_13(v69, v45);
  }
  nullsub_13(buf, v35);
LABEL_29:

  return v16;
}

+ (MTRCSRDERBytes)createCertificateSigningRequest:(id)keypair error:(NSError *)error
{
  id v5;
  int v6;
  void *v7;
  const char *v8;
  int v10;
  __int128 v11;
  int v12;
  uint64_t v13[2];
  int v14;
  __int128 v15;
  int v16;
  int *v17;
  uint64_t v18;
  int v19;
  __int128 v20;
  int v21;
  __int128 v22;
  int v23;
  _QWORD v24[75];
  char v25;
  id v26;
  uint64_t (**v27)();
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = keypair;
  v25 = 0;
  v24[0] = &unk_2504EE700;
  v24[1] = &off_250505A50;
  v26 = 0;
  v27 = &off_250505A50;
  sub_233C01198((uint64_t)v24, v5, (uint64_t)&v19);
  v6 = v19;
  v22 = v20;
  v23 = v21;
  if (v19
    || (v17 = &v19,
        v18 = 255,
        sub_234134F90((uint64_t)v24, (uint64_t *)&v17, (uint64_t)&v14),
        v6 = v14,
        v22 = v15,
        v23 = v16,
        v14))
  {
    if (error)
    {
      v10 = v6;
      v11 = v22;
      v12 = v23;
      sub_2340017F0((uint64_t)MTRError, (__int128 *)&v10);
      v7 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    sub_233BF7114(v13, (uint64_t)v17, v18);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v8, v13[0], v13[1]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  sub_23413AE04((uint64_t)v24);
  return (MTRCSRDERBytes)v7;
}

+ (MTRCertificateTLVBytes)convertX509Certificate:(MTRCertificateDERBytes)x509Certificate
{
  NSData *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  char *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v16[2];
  __int128 v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint8_t v21[16];
  uint64_t v22;
  uint8_t buf[4];
  char *v24;
  uint64_t v25[51];

  v25[50] = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(x509Certificate);
  v6 = objc_msgSend_bytes(v3, v4, v5);
  v9 = objc_msgSend_length(v3, v7, v8);
  sub_233BF7114(v25, v6, v9);

  v19 = v25;
  v20 = 400;
  v17 = 0uLL;
  v18 = 0;
  sub_2341D9834(v25[0], v25[1], (uint64_t)&v19, (uint64_t)&v17);
  if ((_DWORD)v17)
  {
    sub_234117B80(0, "NotSpecified");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_OWORD *)v21 = v17;
      v22 = v18;
      v11 = sub_2341083CC((const char **)v21, 1);
      *(_DWORD *)buf = 136315138;
      v24 = v11;
      _os_log_impl(&dword_233BF3000, v10, OS_LOG_TYPE_ERROR, "convertX509Certificate: %s", buf, 0xCu);
    }

    if (sub_234114844(1u))
    {
      *(_OWORD *)v21 = v17;
      v22 = v18;
      sub_2341083CC((const char **)v21, 1);
      sub_2341147D0(0, 1);
    }
    v12 = 0;
  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_233BF3000, v13, OS_LOG_TYPE_INFO, "convertX509Certificate: Success", v21, 2u);
    }

    if (sub_234114844(3u))
      sub_2341147D0(0, 3);
    sub_233BF7114(v16, (uint64_t)v19, v20);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v14, v16[0], v16[1]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (MTRCertificateTLVBytes)v12;
}

+ (MTRCertificateDERBytes)convertMatterCertificate:(MTRCertificateTLVBytes)matterCertificate
{
  NSData *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  char *v11;
  void *v12;
  const char *v13;
  uint64_t v15[2];
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint8_t buf[4];
  char *v25;
  uint64_t v26[76];

  v26[75] = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(matterCertificate);
  v6 = objc_msgSend_bytes(v3, v4, v5);
  v9 = objc_msgSend_length(v3, v7, v8);
  sub_233BF7114(v26, v6, v9);

  v22 = v26;
  v23 = 600;
  v20 = 0uLL;
  v21 = 0;
  sub_2341DB278(v26[0], v26[1], (uint64_t *)&v22, &v20);
  if ((_DWORD)v20)
  {
    sub_234117B80(0, "NotSpecified");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v18 = v20;
      v19 = v21;
      v11 = sub_2341083CC((const char **)&v18, 1);
      *(_DWORD *)buf = 136315138;
      v25 = v11;
      _os_log_impl(&dword_233BF3000, v10, OS_LOG_TYPE_ERROR, "convertMatterCertificate: %s", buf, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v16 = v20;
      v17 = v21;
      sub_2341083CC((const char **)&v16, 1);
      sub_2341147D0(0, 1);
    }
    v12 = 0;
  }
  else
  {
    sub_233BF7114(v15, (uint64_t)v22, v23);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v13, v15[0], v15[1]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (MTRCertificateDERBytes)v12;
}

+ (NSData)publicKeyFromCSR:(MTRCSRDERBytes)csr error:(NSError *)error
{
  NSData *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  char *v15;
  void *v16;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint8_t buf[4];
  char *v27;
  uint64_t (**v28)();
  uint64_t v29[10];

  v29[9] = *MEMORY[0x24BDAC8D0];
  v5 = objc_retainAutorelease(csr);
  v8 = objc_msgSend_bytes(v5, v6, v7);
  v11 = objc_msgSend_length(v5, v9, v10);
  sub_233BF7114(&v28, v8, v11);

  v12 = (uint64_t)v28;
  v28 = &off_250505A50;
  v24 = 0uLL;
  v25 = 0;
  sub_23413B1A8(v12, v29[0], (uint64_t)&v28, &v24);
  if ((_DWORD)v24)
  {
    sub_234117B80(0, "NotSpecified");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v22 = v24;
      v23 = v25;
      v15 = sub_2341083CC((const char **)&v22, 1);
      *(_DWORD *)buf = 136315138;
      v27 = v15;
      _os_log_impl(&dword_233BF3000, v14, OS_LOG_TYPE_ERROR, "publicKeyFromCSR: %s", buf, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v20 = v24;
      v21 = v25;
      sub_2341083CC((const char **)&v20, 1);
      sub_2341147D0(0, 1);
    }
    if (error)
    {
      v18 = v24;
      v19 = v25;
      sub_2340017F0((uint64_t)MTRError, &v18);
      v16 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v13, (uint64_t)v29, 65);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSData *)v16;
}

+ (NSData)generateRootCertificate:(id)keypair issuerId:(NSNumber *)issuerId fabricId:(NSNumber *)fabricId error:(NSError *)error
{
  objc_msgSend_createRootCertificate_issuerID_fabricID_error_(MTRCertificates, a2, (uint64_t)keypair, issuerId, fabricId, error);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

+ (NSData)generateIntermediateCertificate:(id)rootKeypair rootCertificate:(NSData *)rootCertificate intermediatePublicKey:(SecKeyRef)intermediatePublicKey issuerId:(NSNumber *)issuerId fabricId:(NSNumber *)fabricId error:(NSError *)error
{
  objc_msgSend_createIntermediateCertificate_rootCertificate_intermediatePublicKey_issuerID_fabricID_error_(MTRCertificates, a2, (uint64_t)rootKeypair, rootCertificate, intermediatePublicKey, issuerId, fabricId, error);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

+ (NSData)generateOperationalCertificate:(id)signingKeypair signingCertificate:(NSData *)signingCertificate operationalPublicKey:(SecKeyRef)operationalPublicKey fabricId:(NSNumber *)fabricId nodeId:(NSNumber *)nodeId caseAuthenticatedTags:(NSArray *)caseAuthenticatedTags error:(NSError *)error
{
  id v14;
  NSData *v15;
  NSNumber *v16;
  NSNumber *v17;
  const char *v18;
  NSArray *v19;
  void *v20;
  const char *v21;
  void *v22;

  v14 = signingKeypair;
  v15 = signingCertificate;
  v16 = fabricId;
  v17 = nodeId;
  v19 = caseAuthenticatedTags;
  if (v19)
  {
    objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v18, (uint64_t)v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_createOperationalCertificate_signingCertificate_operationalPublicKey_fabricID_nodeID_caseAuthenticatedTags_error_(MTRCertificates, v21, (uint64_t)v14, v15, operationalPublicKey, v16, v17, v20, error);
  }
  else
  {
    v20 = 0;
    objc_msgSend_createOperationalCertificate_signingCertificate_operationalPublicKey_fabricID_nodeID_caseAuthenticatedTags_error_(MTRCertificates, v18, (uint64_t)v14, v15, operationalPublicKey, v16, v17, 0, error);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v22;
}

+ (NSData)generateCertificateSigningRequest:(id)keypair error:(NSError *)error
{
  objc_msgSend_createCertificateSigningRequest_error_(MTRCertificates, a2, (uint64_t)keypair, error);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

@end
