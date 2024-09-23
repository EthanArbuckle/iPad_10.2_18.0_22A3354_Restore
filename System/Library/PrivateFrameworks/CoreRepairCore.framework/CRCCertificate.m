@implementation CRCCertificate

- (CRCCertificate)initWithRefKey:(__SecKey *)a3 certificates:(id)a4 certType:(int64_t)a5
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CRCCertificate *v14;
  CRCCertificate *v15;
  CRCCertificate *v16;
  NSObject *v17;
  objc_super v19;

  v9 = a4;
  v13 = v9;
  if (a3 && v9 && objc_msgSend_count(v9, v10, v11, v12) == 2)
  {
    v19.receiver = self;
    v19.super_class = (Class)CRCCertificate;
    v14 = -[CRCCertificate init](&v19, sel_init);
    v15 = v14;
    if (v14)
    {
      v14->referenceKey = a3;
      objc_storeStrong((id *)&v14->certificates, a4);
      v15->certifcateType = a5;
    }
    self = v15;
    v16 = self;
  }
  else
  {
    handleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_21456C4FC();

    v16 = 0;
  }

  return v16;
}

- (CRCCertificate)init
{
  objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], (uint64_t)CFSTR("Please use initWithRefKey"));

  return 0;
}

- (id)extractCAAAttestationOIDDataWithError:(id *)a3
{
  uint64_t v3;
  __SecCertificate *v6;
  CFDataRef v7;
  const __CFData *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  unint64_t *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  __int128 v48;
  unint64_t v49[2];
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  uint8_t buf[4];
  uint64_t v55;
  _OWORD v56[3];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v49[0] = 0;
  v49[1] = 0;
  v48 = 0uLL;
  memset(v56, 0, sizeof(v56));
  v47 = 0;
  objc_msgSend_objectAtIndexedSubscript_(self->certificates, a2, 0, v3);
  v6 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
  v7 = SecCertificateCopyData(v6);

  v8 = objc_retainAutorelease(v7);
  v12 = objc_msgSend_bytes(v8, v9, v10, v11);
  v16 = v12 + objc_msgSend_length(v8, v13, v14, v15);
  handleForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v55 = objc_msgSend_length(v8, v18, v19, v20);
    _os_log_impl(&dword_214503000, v17, OS_LOG_TYPE_DEFAULT, "cert der length:%ld", buf, 0xCu);
  }

  handleForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v21, OS_LOG_TYPE_DEFAULT, "Calling CTParseCertificateSet", buf, 2u);
  }

  v22 = sub_2145612BC(v12, v16, v56, 3, &v47);
  if ((_DWORD)v22 || !*(_QWORD *)&v56[0] || !*((_QWORD *)&v56[0] + 1))
  {
    handleForCategory(0);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_21456C598();

    v36 = (void *)MEMORY[0x24BDD1540];
    v52 = *MEMORY[0x24BDD0FC8];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v37, (uint64_t)CFSTR("CTParseCertificateSet parse failed %d"), v38, v22);
    v30 = objc_claimAutoreleasedReturnValue();
    v53 = v30;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v39, (uint64_t)&v53, (uint64_t)&v52, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v36, v41, (uint64_t)CFSTR("com.apple.corerepair"), -41, v40);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  v48 = v56[0];
  handleForCategory(0);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v23, OS_LOG_TYPE_DEFAULT, "CTParseCertificateSet successful", buf, 2u);
  }

  v24 = sub_21455E5DC((unint64_t *)&v48, v49);
  handleForCategory(0);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if ((_DWORD)v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_21456C528((int)v24, v26);

    v27 = (void *)MEMORY[0x24BDD1540];
    v50 = *MEMORY[0x24BDD0FC8];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v28, (uint64_t)CFSTR("Failed to parse cert chain; stat: %d"),
      v29,
      v24);
    v30 = objc_claimAutoreleasedReturnValue();
    v51 = v30;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v31, (uint64_t)&v51, (uint64_t)&v50, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v27, v33, (uint64_t)CFSTR("com.apple.corerepair"), -41, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
    v42 = 0;
    goto LABEL_18;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v26, OS_LOG_TYPE_DEFAULT, "DERDecodeSeqContentInit successful", buf, 2u);
  }

  objc_msgSend_objectAtIndexedSubscript_(self->certificates, v44, 0, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)SecCertificateCopyExtensionValue();

  handleForCategory(0);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v55 = (uint64_t)v42;
    _os_log_impl(&dword_214503000, v30, OS_LOG_TYPE_DEFAULT, "caaOIDDer:%@", buf, 0xCu);
  }
  v34 = 0;
LABEL_18:

  if (a3)
    *a3 = objc_retainAutorelease(v34);

  return v42;
}

- (id)extractRepairHistoryWithError:(id *)a3
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  __SecCertificate *v21;
  CFDataRef v22;
  const __CFData *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  const char *v56;
  void *v57;
  id v58;
  const char *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  const char *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  BOOL v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  void *v81;
  id v82;
  const char *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  double v96;
  double v97;
  id v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  BOOL v105;
  void *v106;
  const char *v107;
  void *v108;
  NSObject *v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  void *v115;
  const char *v116;
  NSObject *v117;
  void *v118;
  const char *v119;
  const char *v120;
  void *v121;
  void *v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133[2];
  unint64_t v134[2];
  uint64_t v135;
  const __CFString *v136;
  uint64_t v137;
  void *v138;
  uint8_t buf[4];
  uint64_t v140;
  _OWORD v141[3];
  uint64_t v142;

  v142 = *MEMORY[0x24BDAC8D0];
  v134[0] = 0;
  v134[1] = 0;
  v133[0] = 0;
  v133[1] = 0;
  v131 = 0;
  v132 = 0;
  memset(v141, 0, sizeof(v141));
  v129 = 0;
  v130 = 0;
  v127 = 0;
  v128 = 0;
  v124 = 0;
  v125 = 0;
  v126 = 0;
  v5 = (void *)objc_opt_new();
  v6 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend_currentLocale(MEMORY[0x24BDBCEA0], v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocale_(v6, v11, (uint64_t)v10, v12);

  objc_msgSend_setDateStyle_(v6, v13, 3, v14);
  objc_msgSend_setTimeStyle_(v6, v15, 0, v16);
  objc_msgSend_setFormattingContext_(v6, v17, 5, v18);
  objc_msgSend_objectAtIndexedSubscript_(self->certificates, v19, 0, v20);
  v21 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
  v22 = SecCertificateCopyData(v21);

  v23 = objc_retainAutorelease(v22);
  v27 = objc_msgSend_bytes(v23, v24, v25, v26);
  v31 = v27 + objc_msgSend_length(v23, v28, v29, v30);
  handleForCategory(0);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v140 = objc_msgSend_length(v23, v33, v34, v35);
    _os_log_impl(&dword_214503000, v32, OS_LOG_TYPE_DEFAULT, "cert der length:%ld", buf, 0xCu);
  }

  handleForCategory(0);
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v36, OS_LOG_TYPE_DEFAULT, "Calling CTParseCertificateSet", buf, 2u);
  }

  v39 = sub_2145612BC(v27, v31, v141, 3, &v130);
  if ((_DWORD)v39 || !*(_QWORD *)&v141[0] || !*((_QWORD *)&v141[0] + 1))
  {
    handleForCategory(0);
    v109 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
      sub_21456C598();

    v110 = (void *)MEMORY[0x24BDD1540];
    v137 = *MEMORY[0x24BDD0FC8];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v111, (uint64_t)CFSTR("CTParseCertificateSet parse failed %d"), v112, v39);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = v113;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v114, (uint64_t)&v138, (uint64_t)&v137, 1);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v110, v116, (uint64_t)CFSTR("com.apple.corerepair"), -41, v115);
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0;
LABEL_50:

    if (!a3)
      goto LABEL_52;
LABEL_51:
    *a3 = objc_retainAutorelease(v108);
    goto LABEL_52;
  }
  objc_msgSend_objectAtIndexedSubscript_(self->certificates, v37, 0, v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (id)SecCertificateCopyExtensionValue();

  handleForCategory(0);
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v140 = (uint64_t)v41;
    _os_log_impl(&dword_214503000, v42, OS_LOG_TYPE_DEFAULT, "caaOIDDer:%@", buf, 0xCu);
  }

  if (!v41 || !objc_msgSend_length(v41, v43, v44, v45))
  {
    handleForCategory(0);
    v117 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v117, OS_LOG_TYPE_DEFAULT, "CAA oid missing from the cert", buf, 2u);
    }

    v118 = (void *)MEMORY[0x24BDD1540];
    v135 = *MEMORY[0x24BDD0FC8];
    v136 = CFSTR("CAA oid missing from the cert");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v119, (uint64_t)&v136, (uint64_t)&v135, 1);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v118, v120, (uint64_t)CFSTR("com.apple.corerepair"), -41, v113);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_50;
  }
  v41 = objc_retainAutorelease(v41);
  v131 = objc_msgSend_bytes(v41, v46, v47, v48);
  v132 = objc_msgSend_length(v41, v49, v50, v51);
  if (!sub_21455E5DC((unint64_t *)&v131, v134) && !sub_21455E608(v134, &v127))
  {
    v131 = v128;
    v132 = v129;
    sub_21455E5DC((unint64_t *)&v131, v133);
    while (!sub_21455E608(v133, &v124))
    {
      v131 = v125;
      v132 = v126;
      sub_21455E5DC((unint64_t *)&v131, v134);
      if (!sub_21455E608(v134, &v127))
      {
        v55 = objc_alloc(MEMORY[0x24BDBCE50]);
        v57 = (void *)objc_msgSend_initWithBytes_length_(v55, v56, v128, v129);
        if (v127 == 0xA0000000000005DCLL)
        {
          v58 = objc_alloc(MEMORY[0x24BDD17C8]);
          v60 = (void *)objc_msgSend_initWithData_encoding_(v58, v59, (uint64_t)v57, 4);
          v64 = v60;
          if (v60 && (unint64_t)objc_msgSend_length(v60, v61, v62, v63) >= 3)
          {
            objc_msgSend_substringFromIndex_(v64, v65, 2, v66);
            v67 = objc_claimAutoreleasedReturnValue();

            v64 = (void *)v67;
          }
          if (!sub_21455E608(v134, &v127))
          {
            v123 = v57;
            do
            {
              v68 = objc_alloc(MEMORY[0x24BDBCE50]);
              v70 = (void *)objc_msgSend_initWithBytes_length_(v68, v69, v128, v129);
              v74 = v70;
              v75 = v127 != 0xA0000000000005E3 || v70 == 0;
              if (v75 || (unint64_t)objc_msgSend_length(v70, v71, v72, v73) < 3)
              {
                v81 = v74;
              }
              else
              {
                v79 = objc_msgSend_length(v74, v76, v77, v78);
                objc_msgSend_subdataWithRange_(v74, v80, 2, v79 - 2);
                v81 = (void *)objc_claimAutoreleasedReturnValue();

                v82 = objc_alloc(MEMORY[0x24BDD17C8]);
                v84 = (void *)objc_msgSend_initWithData_encoding_(v82, v83, (uint64_t)v81, 4);
                v88 = objc_msgSend_longLongValue(v84, v85, v86, v87) % 10000000000000;

                if (v88 >= 0xDC6ACFAC01)
                {
                  objc_msgSend_date(MEMORY[0x24BDBCE60], v89, v90, v91);
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_timeIntervalSince1970(v92, v93, v94, v95);
                  v97 = v96 * 1000.0;

                  if (v97 > (double)v88)
                  {
                    v98 = objc_alloc(MEMORY[0x24BDBCE60]);
                    v104 = (void *)objc_msgSend_initWithTimeIntervalSince1970_(v98, v99, v100, v101, (double)v88 / 1000.0);
                    if (v104)
                      v105 = v64 == 0;
                    else
                      v105 = 1;
                    if (!v105)
                    {
                      objc_msgSend_stringFromDate_(v6, v102, (uint64_t)v104, v103);
                      v106 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_setObject_forKeyedSubscript_(v5, v107, (uint64_t)v106, (uint64_t)v64);

                    }
                  }
                }
              }

            }
            while (!sub_21455E608(v134, &v127));
            v57 = v123;
          }
        }
        else
        {
          v64 = 0;
        }

      }
    }
  }
  v108 = 0;
  if (a3)
    goto LABEL_51;
LABEL_52:
  v121 = (void *)objc_msgSend_copy(v5, v52, v53, v54);

  return v121;
}

- (id)copyCertificatePEMWithError:(id *)a3
{
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  __SecCertificate *v9;
  CFDataRef v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  __SecCertificate *v25;
  CFDataRef v26;
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
  uint64_t v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  const char *v42;
  NSObject *v43;
  const char *v44;
  const char *v45;
  id v46;
  uint8_t buf[8];
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_objectAtIndexedSubscript_(self->certificates, v7, 0, v8);
  v9 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
  v10 = SecCertificateCopyData(v9);
  objc_msgSend_base64EncodedStringWithOptions_(v10, v11, 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v14, (uint64_t)CFSTR("-----BEGIN CERTIFICATE-----\n%@\n-----END CERTIFICATE-----\n"), v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataUsingEncoding_(v16, v17, 4, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    handleForCategory(0);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      sub_21456C5C4();

    v41 = (void *)MEMORY[0x24BDD1540];
    v51 = *MEMORY[0x24BDD0FC8];
    v52[0] = CFSTR("Failed to create certificatePEM");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v42, (uint64_t)v52, (uint64_t)&v51, 1);
    goto LABEL_12;
  }
  objc_msgSend_appendData_(v5, v20, (uint64_t)v19, v21);
  v22 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_objectAtIndexedSubscript_(self->certificates, v23, 1, v24);
  v25 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
  v26 = SecCertificateCopyData(v25);
  objc_msgSend_base64EncodedStringWithOptions_(v26, v27, 1, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v22, v30, (uint64_t)CFSTR("-----BEGIN CERTIFICATE-----\n%@\n-----END CERTIFICATE-----\n"), v31, v29);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataUsingEncoding_(v32, v33, 4, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
  {
    handleForCategory(0);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      sub_21456C5C4();

    v41 = (void *)MEMORY[0x24BDD1540];
    v49 = *MEMORY[0x24BDD0FC8];
    v50 = CFSTR("Failed to create certificatePEM");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v44, (uint64_t)&v50, (uint64_t)&v49, 1);
LABEL_12:
    v38 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v41, v45, (uint64_t)CFSTR("com.apple.corerepair"), -43, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v5 = 0;
    goto LABEL_13;
  }
  objc_msgSend_appendData_(v5, v36, (uint64_t)v35, v37);
  handleForCategory(0);
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v38, OS_LOG_TYPE_DEFAULT, "Successfully created PEM", buf, 2u);
  }
  v39 = 0;
LABEL_13:

  if (a3)
    *a3 = objc_retainAutorelease(v39);
  v46 = v5;

  return v46;
}

- (__SecKey)referenceKey
{
  return self->referenceKey;
}

- (void)setReferenceKey:(__SecKey *)a3
{
  self->referenceKey = a3;
}

- (NSArray)certificates
{
  return self->certificates;
}

- (void)setCertificates:(id)a3
{
  objc_storeStrong((id *)&self->certificates, a3);
}

- (int64_t)certifcateType
{
  return self->certifcateType;
}

- (void)setCertifcateType:(int64_t)a3
{
  self->certifcateType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->certificates, 0);
}

@end
