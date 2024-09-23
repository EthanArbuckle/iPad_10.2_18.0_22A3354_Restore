@implementation CRComponentTsid

- (CRComponentTsid)init
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sharedSingleton);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_raise_format_(v4, v10, v5, (uint64_t)CFSTR("Use +[%@ %@] instead of -%@."), v7, v8, v9);

  return 0;
}

- (id)_init
{
  CRComponentTsid *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CRComponentTsid *v19;
  NSObject *v20;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)CRComponentTsid;
  v2 = -[CRComponentBase init](&v23, sel_init);
  v22 = 0;
  CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!AMFDRCreateWithOptions())
  {
    handleForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_21456B630(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  if (AMFDRSealingMapCopyManifestPropertiesForDevice())
    v11 = v22 == 0;
  else
    v11 = 0;
  if (v11)
  {
    handleForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = 0;
      _os_log_impl(&dword_214503000, v20, OS_LOG_TYPE_DEFAULT, "properties are:%@", buf, 0xCu);
    }

    v19 = v2;
  }
  else
  {
    handleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_21456B5C0(&v22, v12, v13, v14, v15, v16, v17, v18);

    v19 = 0;
    v22 = 0;
  }

  return v19;
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21452C01C;
  block[3] = &unk_24D1AA2E8;
  block[4] = a1;
  if (qword_253E797F0 != -1)
    dispatch_once(&qword_253E797F0, block);
  return (id)qword_253E79840;
}

- (void)challengeComponentWith:(id)a3 withReply:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(id, uint64_t, id, void *);
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  int v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  int v38;
  id v39;
  NSObject *v40;
  int v41;
  CRChallengeResponse *v42;
  NSString *identifierBase64;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  const char *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  id v76;
  unsigned int v77;
  uint8_t buf[4];
  int v79;
  __int16 v80;
  id v81;
  uint64_t v82;
  _QWORD v83[2];

  v83[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v10 = (void (**)(id, uint64_t, id, void *))a4;
  v77 = 0;
  if (!v6)
    goto LABEL_14;
  objc_msgSend_nonce(v6, v7, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11
    || (v15 = (void *)v11,
        objc_msgSend_nonce(v6, v12, v13, v14),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend_length(v16, v17, v18, v19),
        v16,
        v15,
        !v20))
  {
LABEL_14:
    handleForCategory(0);
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      sub_21456B660(v51, v52, v53, v54, v55, v56, v57, v58);

    v59 = (void *)MEMORY[0x24BDD1540];
    v82 = *MEMORY[0x24BDD0FC8];
    v83[0] = CFSTR("Invalid Params and Nonce");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v60, (uint64_t)v83, (uint64_t)&v82, 1);
    v47 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v59, v61, (uint64_t)CFSTR("com.apple.corerepair"), -39, v47);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v76 = 0;
  v22 = objc_msgSend_connectToIO_withError_(self, v21, (uint64_t)&v77, (uint64_t)&v76);
  v23 = v76;
  v27 = v23;
  if (!v22 || v23)
  {
    handleForCategory(0);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      sub_21456B6F8((uint64_t)v27, v47, v62, v63, v64, v65, v66, v67);
LABEL_17:
    v39 = 0;
LABEL_18:
    v50 = 0;
    v49 = 0;
    goto LABEL_19;
  }
  objc_msgSend_nonce(v6, v24, v25, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyIndex(v6, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend_intValue(v32, v33, v34, v35);
  v74 = 0;
  v75 = 0;
  v38 = objc_msgSend_issueChallenge_index_reponse_options_connection_withError_(self, v37, (uint64_t)v28, v36, &v75, 1, v77, &v74);
  v39 = v75;
  v27 = v74;

  handleForCategory(0);
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v79 = v38;
    v80 = 2112;
    v81 = v39;
    _os_log_impl(&dword_214503000, v40, OS_LOG_TYPE_DEFAULT, "Lightning Controller:%d:%@", buf, 0x12u);
  }

  if (v27)
    v41 = 0;
  else
    v41 = v38;
  if (v41 != 1 || !v39)
  {
    handleForCategory(0);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      sub_21456B690((uint64_t)v27, v47, v68, v69, v70, v71, v72, v73);
    goto LABEL_18;
  }
  v42 = [CRChallengeResponse alloc];
  identifierBase64 = self->identifierBase64;
  objc_msgSend_keyIndex(v6, v44, v45, v46);
  v47 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend_initWithComponentType_identifier_signedResponse_keyIndex_properties_(v42, v48, (uint64_t)CFSTR("tsid"), (uint64_t)identifierBase64, v39, v47, 0);
  v27 = 0;
  v50 = 1;
LABEL_19:

  v10[2](v10, v50, v27, v49);
}

- (BOOL)connectToIO:(unsigned int *)a3 withError:(id *)a4
{
  io_service_t ServiceWithPrimaryPort;
  const char *v7;
  uint64_t v8;
  io_object_t v9;
  kern_return_t v10;
  BOOL v11;
  mach_error_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort();
  if (ServiceWithPrimaryPort)
  {
    v9 = ServiceWithPrimaryPort;
    v10 = IOServiceOpen(ServiceWithPrimaryPort, *MEMORY[0x24BDAEC58], 0, a3);
    v11 = v10 == 0;
    if (v10)
    {
      v12 = v10;
      handleForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_21456B7D8(v12, v13);

      v14 = (void *)MEMORY[0x24BDD1540];
      v31 = *MEMORY[0x24BDD0FC8];
      v15 = (void *)MEMORY[0x24BDD17C8];
      v16 = mach_error_string(v12);
      objc_msgSend_stringWithFormat_(v15, v17, (uint64_t)CFSTR("could not open IOAccessoryManager service: %s\n"), v18, v16, v31);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v19;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v20, (uint64_t)&v32, (uint64_t)&v31, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v14, v22, (uint64_t)CFSTR("com.apple.corerepair"), -36, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = 0;
    }
    IOObjectRelease(v9);
    if (a4)
LABEL_12:
      *a4 = objc_retainAutorelease(v23);
  }
  else
  {
    v24 = (void *)MEMORY[0x24BDD1540];
    v33 = *MEMORY[0x24BDD0FC8];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v7, (uint64_t)CFSTR("Could not find IOAccessoryManager service for port %d\n"), v8, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v25;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v26, (uint64_t)v34, (uint64_t)&v33, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v24, v28, (uint64_t)CFSTR("com.apple.corerepair"), -36, v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    handleForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_21456B760(v29);

    v11 = 0;
    if (a4)
      goto LABEL_12;
  }

  return v11;
}

- (BOOL)issueChallenge:(id)a3 index:(int)a4 reponse:(id *)a5 options:(unint64_t)a6 connection:(unsigned int)a7 withError:(id *)a8
{
  char v9;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  mach_error_t v19;
  const char *v20;
  mach_error_t v21;
  void *v22;
  void *v23;
  char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  NSObject *v32;
  char *v33;
  uint8_t buf[4];
  char *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE v41[16];
  uint64_t v42;

  v9 = a6;
  v42 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v40 = 0;
  memset(v41, 0, 15);
  v39 = 0;
  objc_msgSend_data(MEMORY[0x24BDBCEC8], v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  handleForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v36) = a4;
    _os_log_impl(&dword_214503000, v17, OS_LOG_TYPE_DEFAULT, "TSID KeyIndex is:%d", buf, 8u);
  }

  if (v12)
    objc_msgSend_getBytes_length_(v12, v18, (uint64_t)v41, 8);
  v19 = IOAccessoryManagerChallengeCryptoDock();
  v21 = v19;
  if (v19)
  {
    v22 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0FC8];
    v23 = (void *)MEMORY[0x24BDD17C8];
    v24 = mach_error_string(v19);
    objc_msgSend_stringWithFormat_(v23, v25, (uint64_t)CFSTR("Challenge encountered an error: %s"), v26, v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v27;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v28, (uint64_t)&v38, (uint64_t)&v37, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v22, v30, (uint64_t)CFSTR("com.apple.corerepair"), -37, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    handleForCategory(0);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = mach_error_string(v21);
      *(_DWORD *)buf = 136315138;
      v36 = v33;
      _os_log_impl(&dword_214503000, v32, OS_LOG_TYPE_DEFAULT, "Challenge encountered an error: %s", buf, 0xCu);
    }

    if (a5)
LABEL_9:
      *a5 = objc_retainAutorelease(v16);
  }
  else
  {
    if ((v9 & 1) != 0)
      objc_msgSend_appendBytes_length_(v16, v20, (uint64_t)&v39, 8);
    if ((v9 & 2) != 0)
      objc_msgSend_appendBytes_length_(v16, v20, (uint64_t)&v40, 8);
    v31 = 0;
    if (a5)
      goto LABEL_9;
  }
  if (a8)
    *a8 = objc_retainAutorelease(v31);

  return v21 == 0;
}

- (id)identifierBase64
{
  return self->identifierBase64;
}

- (void)setIdentifierBase64:(id)a3
{
  objc_storeStrong((id *)&self->identifierBase64, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->identifierBase64, 0);
}

@end
