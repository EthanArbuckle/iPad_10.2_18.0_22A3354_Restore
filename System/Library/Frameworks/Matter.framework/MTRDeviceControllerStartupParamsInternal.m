@implementation MTRDeviceControllerStartupParamsInternal

- (MTRDeviceControllerStartupParamsInternal)initWithParams:(id)a3
{
  id v4;
  MTRDeviceControllerStartupParamsInternal *v5;
  MTRDeviceControllerStartupParamsInternal *v6;
  MTRDeviceControllerStorageDelegate *storageDelegate;
  OS_dispatch_queue *storageDelegateQueue;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  char v37;
  MTRDeviceControllerStartupParamsInternal *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  uint8_t v44[16];
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)MTRDeviceControllerStartupParamsInternal;
  v5 = -[MTRDeviceControllerStartupParams initWithParams:](&v45, sel_initWithParams_, v4);
  v6 = v5;
  if (!v5)
    goto LABEL_33;
  storageDelegate = v5->_storageDelegate;
  v5->_storageDelegate = 0;

  storageDelegateQueue = v6->_storageDelegateQueue;
  v6->_storageDelegateQueue = 0;

  objc_msgSend_nocSigner(v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

  }
  else
  {
    objc_msgSend_rootCertificate(v6, v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      sub_234117B80(0, "NotSpecified");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v44 = 0;
        _os_log_impl(&dword_233BF3000, v39, OS_LOG_TYPE_ERROR, "nocSigner and rootCertificate are both nil; no public key available to identify the fabric",
          v44,
          2u);
      }

      if (!sub_234114844(1u))
        goto LABEL_33;
      goto LABEL_32;
    }
  }
  objc_msgSend_operationalCertificate(v6, v14, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend_nodeID(v6, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      sub_234117B80(0, "NotSpecified");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v44 = 0;
        _os_log_impl(&dword_233BF3000, v21, OS_LOG_TYPE_ERROR, "nodeID must be nil if operationalCertificate is not nil", v44, 2u);
      }

      if (!sub_234114844(1u))
        goto LABEL_33;
      goto LABEL_32;
    }
  }
  objc_msgSend_caseAuthenticatedTags(v6, v17, v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend_nodeID(v6, v22, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      sub_234117B80(0, "NotSpecified");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v44 = 0;
        _os_log_impl(&dword_233BF3000, v40, OS_LOG_TYPE_ERROR, "caseAuthenticatedTags must be nil if nodeID is nil", v44, 2u);
      }

      if (!sub_234114844(1u))
        goto LABEL_33;
      goto LABEL_32;
    }
  }
  objc_msgSend_operationalCertificate(v6, v22, v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend_operationalKeypair(v6, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend_operationalKeypair(v6, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationalCertificate(v6, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend_keypair_matchesCertificate_(MTRCertificates, v36, (uint64_t)v32, v35);

      if ((v37 & 1) != 0)
        goto LABEL_16;
      sub_234117B80(0, "NotSpecified");
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v44 = 0;
        _os_log_impl(&dword_233BF3000, v42, OS_LOG_TYPE_ERROR, "operationalKeypair public key does not match operationalCertificate", v44, 2u);
      }

      if (!sub_234114844(1u))
        goto LABEL_33;
    }
    else
    {
      sub_234117B80(0, "NotSpecified");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v44 = 0;
        _os_log_impl(&dword_233BF3000, v41, OS_LOG_TYPE_ERROR, "Must have an operational keypair if an operational certificate is provided", v44, 2u);
      }

      if (!sub_234114844(1u))
        goto LABEL_33;
    }
LABEL_32:
    sub_2341147D0(0, 1);
LABEL_33:
    v38 = 0;
    goto LABEL_34;
  }
LABEL_16:
  v38 = v6;
LABEL_34:

  return v38;
}

- (id)initForNewFabric:(void *)a3 keystore:(OperationalKeystore *)a4 advertiseOperational:(BOOL)a5 params:(id)a6
{
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  id v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  id v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v43;
  uint32_t v45;
  uint32_t v46;
  const char *v47;
  const char *v48;
  void *v49;
  _BOOL4 v50;
  id v51;
  uint8_t buf[4];
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v12 = (void *)objc_msgSend_initWithParams_(self, v11, (uint64_t)v10);
  v15 = v12;
  if (!v12)
  {
LABEL_20:
    v31 = 0;
    goto LABEL_21;
  }
  objc_msgSend_nocSigner(v12, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {

  }
  else
  {
    objc_msgSend_operationalCertificate(v15, v17, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      sub_234117B80(0, "NotSpecified");
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_233BF3000, v43, OS_LOG_TYPE_ERROR, "No way to get an operational certificate: nocSigner and operationalCertificate are both nil", buf, 2u);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
      goto LABEL_20;
    }
  }
  objc_msgSend_operationalCertificate(v15, v19, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    objc_msgSend_nodeID(v15, v22, v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
      goto LABEL_8;
    v45 = arc4random();
    v46 = arc4random();
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v47, (v46 >> 1) | ((unint64_t)v45 << 31));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setNodeID_(v15, v48, (uint64_t)v24);
  }

LABEL_8:
  objc_msgSend_rootCertificate(v15, v25, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    objc_msgSend_nocSigner(v15, v29, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fabricID(v15, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    objc_msgSend_createRootCertificate_issuerID_fabricID_error_(MTRCertificates, v36, (uint64_t)v32, 0, v35, &v51);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v51;
    objc_msgSend_setRootCertificate_(v15, v39, (uint64_t)v37);

    if (v38
      || (objc_msgSend_rootCertificate(v15, v40, v41),
          v49 = (void *)objc_claimAutoreleasedReturnValue(),
          v50 = v49 == 0,
          v49,
          v50))
    {
      sub_234117B80(0, "NotSpecified");
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v38;
        _os_log_impl(&dword_233BF3000, v42, OS_LOG_TYPE_ERROR, "Failed to generate root certificate: %@", buf, 0xCu);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);

      goto LABEL_20;
    }
  }
  *((_QWORD *)v15 + 15) = a3;
  *((_QWORD *)v15 + 16) = a4;
  *((_BYTE *)v15 + 112) = a5;
  *((_BYTE *)v15 + 113) = 0;
  v31 = v15;
LABEL_21:

  return v31;
}

- (id)initForExistingFabric:(void *)a3 fabricIndex:(unsigned __int8)a4 keystore:(OperationalKeystore *)a5 advertiseOperational:(BOOL)a6 params:(id)a7
{
  int v9;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  int v25;
  const char *v26;
  NSObject *v27;
  char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  BOOL v41;
  _BOOL4 v42;
  void *v43;
  const char *v44;
  int v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  char isCertificate_equalTo;
  const char *v53;
  void *v54;
  _BOOL4 v55;
  const char *v56;
  NSObject *v57;
  char *v58;
  NSObject *v59;
  char *v60;
  void *v61;
  id v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  _BOOL4 v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  char v71;
  NSObject *v72;
  void *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  NSObject *v83;
  char *v84;
  __int128 v86;
  uint64_t v87;
  __int128 v88;
  uint64_t v89;
  __int128 v90;
  uint64_t v91;
  __int128 v92;
  uint64_t v93;
  __int128 v94;
  uint64_t v95;
  __int128 v96;
  uint64_t v97;
  _QWORD v98[2];
  int v99;
  uint64_t v100;
  __int128 v101;
  uint64_t v102;
  __int128 v103;
  uint64_t v104;
  __int128 v105;
  uint64_t v106;
  __int128 v107;
  uint64_t v108;
  __int128 v109;
  uint64_t v110;
  uint8_t v111[16];
  uint64_t v112;
  __int128 buf;
  uint8_t v114[408];
  uint64_t v115;

  v9 = a4;
  v115 = *MEMORY[0x24BDAC8D0];
  v11 = objc_msgSend_initWithParams_(self, a2, (uint64_t)a7);
  if (!v11)
    goto LABEL_80;
  v12 = sub_2341E2E70((uint64_t)a3, v9);
  objc_msgSend_vendorID((void *)v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v16, *(unsigned __int16 *)(v12 + 138));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setVendorID_((void *)v11, v19, (uint64_t)v18);

  }
  objc_msgSend_operationalCertificate((void *)v11, v16, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {

LABEL_7:
    v25 = 0;
    goto LABEL_8;
  }
  objc_msgSend_nodeID((void *)v11, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    goto LABEL_7;
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v24, *(_QWORD *)v12);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNodeID_((void *)v11, v32, (uint64_t)v31);

  *(_QWORD *)&buf = v114;
  *((_QWORD *)&buf + 1) = 400;
  v109 = 0uLL;
  v110 = 0;
  sub_2341E3340((uint64_t)a3, *(unsigned __int8 *)(v12 + 137), (uint64_t)&buf, (uint64_t)&v109);
  if ((_DWORD)v109)
  {
    sub_234117B80(0, "NotSpecified");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v107 = v109;
      v108 = v110;
      v36 = sub_2341083CC((const char **)&v107, 1);
      *(_DWORD *)v111 = 136315138;
      *(_QWORD *)&v111[4] = v36;
      _os_log_impl(&dword_233BF3000, v35, OS_LOG_TYPE_ERROR, "Failed to get existing NOC: %s", v111, 0xCu);
    }

    if (!sub_234114844(1u))
      goto LABEL_80;
    v105 = v109;
    v106 = v110;
    sub_2341083CC((const char **)&v105, 1);
    goto LABEL_21;
  }
  objc_msgSend_operationalKeypair((void *)v11, v33, v34);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54 == 0;

  if (v55)
  {
    sub_233BF7114(v111, buf, *((uint64_t *)&buf + 1));
    sub_234005004((uint64_t)v111);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOperationalCertificate_((void *)v11, v74, (uint64_t)v73);

    objc_msgSend_operationalCertificate((void *)v11, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v73) = v77 == 0;

    if ((_DWORD)v73)
    {
      sub_234117B80(0, "NotSpecified");
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      {
        v103 = v109;
        v104 = v110;
        v84 = sub_2341083CC((const char **)&v103, 1);
        *(_DWORD *)v111 = 136315138;
        *(_QWORD *)&v111[4] = v84;
        _os_log_impl(&dword_233BF3000, v83, OS_LOG_TYPE_ERROR, "Failed to convert TLV NOC to DER X.509: %s", v111, 0xCu);
      }

      if (!sub_234114844(1u))
        goto LABEL_80;
      v101 = v109;
      v102 = v110;
      sub_2341083CC((const char **)&v101, 1);
LABEL_21:
      sub_2341147D0(0, 1);
LABEL_80:
      v62 = 0;
      goto LABEL_81;
    }
    if (((*((uint64_t (**)(OperationalKeystore *, _QWORD))a5->var0 + 3))(a5, *(unsigned __int8 *)(v12 + 137)) & 1) == 0)
    {
      sub_234117B80(0, "NotSpecified");
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v111 = 0;
        _os_log_impl(&dword_233BF3000, v78, OS_LOG_TYPE_ERROR, "No existing operational key for fabric", v111, 2u);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
      goto LABEL_80;
    }
  }
  v99 = 0;
  v100 = 0;
  sub_233BF7114(v98, buf, *((uint64_t *)&buf + 1));
  sub_2341D8570((uint64_t)v98, (uint64_t)&v99, v111);
  v109 = *(_OWORD *)v111;
  v110 = v112;
  if (*(_DWORD *)v111)
  {
    sub_234117B80(0, "NotSpecified");
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      v96 = v109;
      v97 = v110;
      v58 = sub_2341083CC((const char **)&v96, 1);
      *(_DWORD *)v111 = 136315138;
      *(_QWORD *)&v111[4] = v58;
      _os_log_impl(&dword_233BF3000, v57, OS_LOG_TYPE_ERROR, "Failed to extract existing CATs: %s", v111, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v94 = v109;
      v95 = v110;
      sub_2341083CC((const char **)&v94, 1);
      sub_2341147D0(0, 1);
    }
    goto LABEL_80;
  }
  v79 = 0;
  v80 = 0;
  do
  {
    if (*(int *)((char *)&v99 + v79))
      ++v80;
    v79 += 4;
  }
  while (v79 != 12);
  if (v80)
  {
    sub_2340065F8((uint64_t)&v99);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCaseAuthenticatedTags_((void *)v11, v82, (uint64_t)v81);

  }
  else
  {
    objc_msgSend_setCaseAuthenticatedTags_((void *)v11, v56, 0);
  }
  v25 = 1;
LABEL_8:
  *(_QWORD *)v111 = v114;
  *(_QWORD *)&v111[8] = 400;
  v109 = 0uLL;
  v110 = 0;
  sub_2341E3150((uint64_t)a3, *(unsigned __int8 *)(v12 + 137), (uint64_t)v111, (uint64_t)&v109);
  if ((_DWORD)v109)
  {
    sub_234117B80(0, "NotSpecified");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v92 = v109;
      v93 = v110;
      v28 = sub_2341083CC((const char **)&v92, 1);
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v28;
      _os_log_impl(&dword_233BF3000, v27, OS_LOG_TYPE_ERROR, "Failed to get existing intermediate certificate: %s", (uint8_t *)&buf, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v90 = v109;
      v91 = v110;
      sub_2341083CC((const char **)&v90, 1);
      sub_2341147D0(0, 1);
    }
    goto LABEL_80;
  }
  v29 = *(_QWORD *)&v111[8];
  if (*(_QWORD *)&v111[8])
  {
    sub_233BF7114(&buf, *(uint64_t *)v111, *(uint64_t *)&v111[8]);
    sub_234005004((uint64_t)&buf);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30)
      goto LABEL_80;
  }
  else
  {
    v30 = 0;
  }
  objc_msgSend_nocSigner((void *)v11, v26, v29);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    objc_msgSend_intermediateCertificate((void *)v11, v37, v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40 || v30 == 0;
    v42 = !v41;

    if (v42)
    {
      objc_msgSend_nocSigner((void *)v11, v37, v38);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend_keypair_matchesCertificate_(MTRCertificates, v44, (uint64_t)v43, v30);

      if (v45)
        objc_msgSend_setIntermediateCertificate_((void *)v11, v37, (uint64_t)v30);
    }
  }
  if (!v25)
    goto LABEL_47;
  objc_msgSend_intermediateCertificate((void *)v11, v37, v38);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v46;
  if ((v30 != 0) == (v46 == 0))
  {

    goto LABEL_39;
  }
  if (!v30)
  {

    goto LABEL_47;
  }
  objc_msgSend_intermediateCertificate((void *)v11, v47, v48);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  isCertificate_equalTo = objc_msgSend_isCertificate_equalTo_(MTRCertificates, v51, (uint64_t)v30, v50);

  if ((isCertificate_equalTo & 1) == 0)
LABEL_39:
    objc_msgSend_setOperationalCertificate_((void *)v11, v53, 0);
LABEL_47:
  *(_QWORD *)v111 = v114;
  *(_QWORD *)&v111[8] = 400;
  v109 = 0uLL;
  v110 = 0;
  sub_2341E2AB4((uint64_t)a3, *(unsigned __int8 *)(v12 + 137), (uint64_t)v111, (uint64_t)&v109);
  if ((_DWORD)v109)
  {
    sub_234117B80(0, "NotSpecified");
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v88 = v109;
      v89 = v110;
      v60 = sub_2341083CC((const char **)&v88, 1);
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v60;
      _os_log_impl(&dword_233BF3000, v59, OS_LOG_TYPE_ERROR, "Failed to get existing root certificate: %s", (uint8_t *)&buf, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v86 = v109;
      v87 = v110;
      sub_2341083CC((const char **)&v86, 1);
      sub_2341147D0(0, 1);
    }
    v61 = 0;
  }
  else
  {
    sub_233BF7114(&buf, *(uint64_t *)v111, *(uint64_t *)&v111[8]);
    sub_234005004((uint64_t)&buf);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (v61)
    {
      objc_msgSend_rootCertificate((void *)v11, v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v65 == 0;

      if (v66)
      {
        objc_msgSend_setRootCertificate_((void *)v11, v67, (uint64_t)v61);
      }
      else
      {
        objc_msgSend_rootCertificate((void *)v11, v67, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend_isCertificate_equalTo_(MTRCertificates, v70, (uint64_t)v61, v69);

        if ((v71 & 1) == 0)
        {
          sub_234117B80(0, "NotSpecified");
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v114 = 0;
            _os_log_impl(&dword_233BF3000, v72, OS_LOG_TYPE_ERROR, "Root certificate identity does not match existing root certificate", v114, 2u);
          }

          if (sub_234114844(1u))
            sub_2341147D0(0, 1);
          goto LABEL_53;
        }
      }
      *(_QWORD *)(v11 + 120) = a3;
      *(_BYTE *)(v11 + 114) = 1;
      *(_BYTE *)(v11 + 115) = v9;
      *(_QWORD *)(v11 + 128) = a5;
      *(_BYTE *)(v11 + 112) = a6;
      *(_BYTE *)(v11 + 113) = 0;
      v62 = (id)v11;
      goto LABEL_54;
    }
  }
LABEL_53:
  v62 = 0;
LABEL_54:

LABEL_81:
  return v62;
}

- (id)initForNewController:(id)a3 fabricTable:(void *)a4 keystore:(OperationalKeystore *)a5 advertiseOperational:(BOOL)a6 params:(id)a7 error:(ChipError *)a8
{
  id v14;
  id v15;
  MTRDeviceControllerStartupParamsInternal *v16;
  const char *v17;
  uint64_t v18;
  MTRDeviceControllerStartupParamsInternal *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  char *v30;
  MTRDeviceControllerStartupParamsInternal *v31;
  void *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  id v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  char *v60;
  const char *v61;
  uint64_t v62;
  NSObject *v63;
  char *v64;
  void *v65;
  const char *v66;
  void *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  NSObject *v71;
  char *v72;
  uint64_t v73;
  NSObject *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  MTRDeviceControllerStorageDelegate *storageDelegate;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  OS_dispatch_queue *storageDelegateQueue;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  NSArray *productAttestationAuthorityCertificates;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  NSArray *certificationDeclarationCertificates;
  int v95;
  uint64_t v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  __int128 v102;
  objc_super v103;
  uint8_t v104[16];
  uint64_t v105;
  uint8_t v106[4];
  char *v107;
  __int128 v108;
  uint8_t buf[16];
  uint64_t v110;
  _QWORD v111[13];

  v111[10] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a7;
  v103.receiver = self;
  v103.super_class = (Class)MTRDeviceControllerStartupParamsInternal;
  v16 = -[MTRDeviceControllerStartupParams initWithParameters:error:](&v103, sel_initWithParameters_error_, v15, a8);
  v19 = v16;
  if (v16)
  {
    v111[0] = &off_250505A50;
    objc_msgSend_rootCertificate(v16, v17, v18);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = objc_msgSend_bytes(v20, v21, v22);
    v26 = objc_msgSend_length(v20, v24, v25);
    sub_233BF7114(buf, v23, v26);

    v102 = *(_OWORD *)buf;
    sub_23413C364((uint64_t *)&v102, (uint64_t)v111, (uint64_t)v104);
    *(_OWORD *)&a8->mError = *(_OWORD *)v104;
    *(_QWORD *)&a8->mLine = v105;

    if (a8->mError)
    {
      sub_234117B80(0, "NotSpecified");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_OWORD *)v104 = *(_OWORD *)&a8->mError;
        v105 = *(_QWORD *)&a8->mLine;
        v30 = sub_2341083CC((const char **)v104, 1);
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v30;
        _os_log_impl(&dword_233BF3000, v29, OS_LOG_TYPE_ERROR, "Can't extract public key from root certificate: %s", buf, 0xCu);
      }

      if (sub_234114844(1u))
      {
        *(_OWORD *)v104 = *(_OWORD *)&a8->mError;
        v105 = *(_QWORD *)&a8->mLine;
        sub_2341083CC((const char **)v104, 1);
        sub_2341147D0(0, 1);
      }
      goto LABEL_7;
    }
    objc_msgSend_operationalCertificate(v19, v27, v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = 0;
    sub_234005ECC((uint64_t)v32, (char *)&v101, buf, (uint64_t)v104);
    v33 = v101;
    *(_OWORD *)&a8->mError = *(_OWORD *)v104;
    *(_QWORD *)&a8->mLine = v105;

    if (a8->mError)
    {
      v31 = 0;
LABEL_45:

      goto LABEL_46;
    }
    objc_msgSend_fabricID(v19, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend_unsignedLongLongValue(v36, v37, v38);
    v42 = objc_msgSend_unsignedLongLongValue(v33, v40, v41);
    LOBYTE(v39) = sub_2341E2DE8((uint64_t)a4, (uint64_t)v111, v39, v42) == 0;

    if ((v39 & 1) == 0)
    {
      sub_234117B80(0, "NotSpecified");
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v104 = 0;
        _os_log_impl(&dword_233BF3000, v45, OS_LOG_TYPE_ERROR, "Trying to start a controller identity that is already running", v104, 2u);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
      v31 = 0;
      a8->mError = 47;
      a8->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDevic"
                  "eControllerStartupParams.mm";
      a8->mLine = 577;
      goto LABEL_45;
    }
    objc_msgSend_controllerDataStore(v14, v43, v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fetchLastLocallyUsedNOC(v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      v52 = objc_retainAutorelease(v49);
      v55 = objc_msgSend_bytes(v52, v53, v54);
      v58 = objc_msgSend_length(v52, v56, v57);
      sub_233BF7114(v104, v55, v58);

      v102 = *(_OWORD *)v104;
      v99 = 0;
      v100 = 0;
      memset(buf, 0, sizeof(buf));
      v110 = 0;
      sub_2341D83F0((uint64_t)&v102, &v99, &v100, buf);
      if (*(_DWORD *)buf)
      {
        sub_234117B80(0, "NotSpecified");
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          *(_OWORD *)v104 = *(_OWORD *)buf;
          v105 = v110;
          v60 = sub_2341083CC((const char **)v104, 1);
          LODWORD(v108) = 136315138;
          *(_QWORD *)((char *)&v108 + 4) = v60;
          _os_log_impl(&dword_233BF3000, v59, OS_LOG_TYPE_ERROR, "Unable to extract node ID and fabric ID from old operational certificate: %s", (uint8_t *)&v108, 0xCu);
        }

        if (sub_234114844(1u))
        {
          *(_OWORD *)v104 = *(_OWORD *)buf;
          v105 = v110;
          sub_2341083CC((const char **)v104, 1);
          sub_2341147D0(0, 1);
        }
        goto LABEL_34;
      }
      v97 = 0;
      v98 = 0;
      sub_2341D8570((uint64_t)&v102, (uint64_t)&v97, v104);
      *(_OWORD *)buf = *(_OWORD *)v104;
      v110 = v105;
      if (*(_DWORD *)v104)
      {
        sub_234117B80(0, "NotSpecified");
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          *(_OWORD *)v104 = *(_OWORD *)buf;
          v105 = v110;
          v64 = sub_2341083CC((const char **)v104, 1);
          LODWORD(v108) = 136315138;
          *(_QWORD *)((char *)&v108 + 4) = v64;
          _os_log_impl(&dword_233BF3000, v63, OS_LOG_TYPE_ERROR, "Failed to extract CATs from old operational certificate: %s", (uint8_t *)&v108, 0xCu);
        }

        if (sub_234114844(1u))
        {
          *(_OWORD *)v104 = *(_OWORD *)buf;
          v105 = v110;
          sub_2341083CC((const char **)v104, 1);
          sub_2341147D0(0, 1);
        }
        goto LABEL_34;
      }
      objc_msgSend_operationalCertificate(v19, v61, v62);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_convertX509Certificate_(MTRCertificates, v66, (uint64_t)v65);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v67)
      {
LABEL_34:
        v31 = 0;
LABEL_44:

        goto LABEL_45;
      }
      *(_QWORD *)&v108 = sub_233D4B4C4(v67);
      *((_QWORD *)&v108 + 1) = v68;
      v95 = 0;
      v96 = 0;
      sub_2341D8570((uint64_t)&v108, (uint64_t)&v95, v104);
      *(_OWORD *)buf = *(_OWORD *)v104;
      v110 = v105;
      if (*(_DWORD *)v104)
      {
        sub_234117B80(0, "NotSpecified");
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          *(_OWORD *)v104 = *(_OWORD *)buf;
          v105 = v110;
          v72 = sub_2341083CC((const char **)v104, 1);
          *(_DWORD *)v106 = 136315138;
          v107 = v72;
          _os_log_impl(&dword_233BF3000, v71, OS_LOG_TYPE_ERROR, "Failed to extract CATs from new operational certificate: %s", v106, 0xCu);
        }

        if (sub_234114844(1u))
        {
          *(_OWORD *)v104 = *(_OWORD *)buf;
          v105 = v110;
          sub_2341083CC((const char **)v104, 1);
          sub_2341147D0(0, 1);
        }

        goto LABEL_34;
      }
      v73 = objc_msgSend_unsignedLongLongValue(v33, v69, v70);
      if (v73 != v99 || !sub_23400611C((uint64_t)&v97, (uint64_t)&v95))
      {
        sub_234117B80(0, "NotSpecified");
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v104 = 0;
          _os_log_impl(&dword_233BF3000, v74, OS_LOG_TYPE_DEFAULT, "Node ID or CATs changed.  Clearing CASE resumption storage.", v104, 2u);
        }

        if (sub_234114844(2u))
          sub_2341147D0(0, 2);
        objc_msgSend_controllerDataStore(v14, v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_clearAllResumptionInfo(v77, v78, v79);

      }
    }
    v19->_fabricTable = a4;
    v19->_keystore = a5;
    v19->_advertiseOperational = a6;
    v19->_allowMultipleControllersPerFabric = 1;
    objc_msgSend_storageDelegate(v15, v50, v51);
    v80 = objc_claimAutoreleasedReturnValue();
    storageDelegate = v19->_storageDelegate;
    v19->_storageDelegate = (MTRDeviceControllerStorageDelegate *)v80;

    objc_msgSend_storageDelegateQueue(v15, v82, v83);
    v84 = objc_claimAutoreleasedReturnValue();
    storageDelegateQueue = v19->_storageDelegateQueue;
    v19->_storageDelegateQueue = (OS_dispatch_queue *)v84;

    objc_msgSend_productAttestationAuthorityCertificates(v15, v86, v87);
    v88 = objc_claimAutoreleasedReturnValue();
    productAttestationAuthorityCertificates = v19->_productAttestationAuthorityCertificates;
    v19->_productAttestationAuthorityCertificates = (NSArray *)v88;

    objc_msgSend_certificationDeclarationCertificates(v15, v90, v91);
    v92 = objc_claimAutoreleasedReturnValue();
    certificationDeclarationCertificates = v19->_certificationDeclarationCertificates;
    v19->_certificationDeclarationCertificates = (NSArray *)v92;

    v31 = v19;
    goto LABEL_44;
  }
LABEL_7:
  v31 = 0;
LABEL_46:

  return v31;
}

- (BOOL)keypairsMatchCertificates
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  char v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  char v25;
  _BOOL4 v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  uint8_t v31[16];
  uint8_t buf[16];
  uint8_t v33[16];

  objc_msgSend_nocSigner(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_intermediateCertificate(self, v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 || (objc_msgSend_rootCertificate(self, v7, v8), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend_nocSigner(self, v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend_keypair_matchesCertificate_(MTRCertificates, v11, (uint64_t)v10, v9);

      if ((v12 & 1) != 0)
      {

        goto LABEL_6;
      }
      sub_234117B80(0, "NotSpecified");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_233BF3000, v27, OS_LOG_TYPE_ERROR, "Provided nocSigner does not match certificates", buf, 2u);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
    }
    else
    {
      sub_234117B80(0, "NotSpecified");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_233BF3000, v29, OS_LOG_TYPE_ERROR, "No certificate to match nocSigner", v33, 2u);
      }

      v9 = 0;
      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
    }

    goto LABEL_23;
  }
LABEL_6:
  objc_msgSend_operationalCertificate(self, v5, v6);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_9;
  v16 = (void *)v13;
  objc_msgSend_operationalKeypair(self, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17
    || (objc_msgSend_operationalKeypair(self, v18, v19),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_operationalCertificate(self, v21, v22),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = objc_msgSend_keypair_matchesCertificate_(MTRCertificates, v24, (uint64_t)v20, v23),
        v23,
        v20,
        (v25 & 1) != 0))
  {
LABEL_9:
    LOBYTE(v26) = 1;
    return v26;
  }
  sub_234117B80(0, "NotSpecified");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v31 = 0;
    _os_log_impl(&dword_233BF3000, v28, OS_LOG_TYPE_ERROR, "Provided operationalKeypair does not match operationalCertificate", v31, 2u);
  }

  v26 = sub_234114844(1u);
  if (v26)
  {
    sub_2341147D0(0, 1);
LABEL_23:
    LOBYTE(v26) = 0;
  }
  return v26;
}

- (void)fabricTable
{
  return self->_fabricTable;
}

- (Optional<unsigned)fabricIndex
{
  _BYTE *v2;
  _BOOL4 mHasValue;

  mHasValue = self->_fabricIndex.mHasValue;
  *v2 = mHasValue;
  if (mHasValue)
    v2[1] = self->_fabricIndex.mValue.mData;
  return (Optional<unsigned char>)self;
}

- (OperationalKeystore)keystore
{
  return self->_keystore;
}

- (BOOL)advertiseOperational
{
  return self->_advertiseOperational;
}

- (BOOL)allowMultipleControllersPerFabric
{
  return self->_allowMultipleControllersPerFabric;
}

- (NSArray)productAttestationAuthorityCertificates
{
  return self->_productAttestationAuthorityCertificates;
}

- (void)setProductAttestationAuthorityCertificates:(id)a3
{
  objc_storeStrong((id *)&self->_productAttestationAuthorityCertificates, a3);
}

- (NSArray)certificationDeclarationCertificates
{
  return self->_certificationDeclarationCertificates;
}

- (void)setCertificationDeclarationCertificates:(id)a3
{
  objc_storeStrong((id *)&self->_certificationDeclarationCertificates, a3);
}

- (MTRDeviceControllerStorageDelegate)storageDelegate
{
  return self->_storageDelegate;
}

- (OS_dispatch_queue)storageDelegateQueue
{
  return self->_storageDelegateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageDelegateQueue, 0);
  objc_storeStrong((id *)&self->_storageDelegate, 0);
  objc_storeStrong((id *)&self->_certificationDeclarationCertificates, 0);
  objc_storeStrong((id *)&self->_productAttestationAuthorityCertificates, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 114) = 0;
  return self;
}

@end
