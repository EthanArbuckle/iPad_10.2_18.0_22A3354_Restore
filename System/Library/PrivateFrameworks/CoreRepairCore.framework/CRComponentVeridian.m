@implementation CRComponentVeridian

- (CRComponentVeridian)init
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
  CRComponentVeridian *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *identifierBase64;
  NSObject *v15;
  CRComponentVeridian *v16;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CRComponentVeridian;
  v2 = -[CRComponentBase init](&v19, sel_init);
  v18 = 0;
  if (!v2)
  {
    v7 = 0;
    goto LABEL_9;
  }
  v3 = (void *)AMFDRSealingMapCopyInstanceForClass();
  v7 = v3;
  if (v3 && objc_msgSend_length(v3, v4, v5, v6))
  {
    objc_msgSend_dataUsingEncoding_(v7, v8, 4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_base64EncodedStringWithOptions_(v10, v11, 0, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    identifierBase64 = v2->identifierBase64;
    v2->identifierBase64 = (NSString *)v13;

LABEL_9:
    v16 = v2;
    goto LABEL_10;
  }
  handleForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_21456CE48(&v18, v15);

  v16 = 0;
  v18 = 0;
LABEL_10:

  return v16;
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21453AA18;
  block[3] = &unk_24D1AA2E8;
  block[4] = a1;
  if (qword_253E79800 != -1)
    dispatch_once(&qword_253E79800, block);
  return (id)qword_253E79850;
}

- (void)challengeComponentWith:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *, void *);
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  int v28;
  id v29;
  const char *v30;
  void *v31;
  CRChallengeResponse *v32;
  const char *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  id v46;
  _QWORD v47[7];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  const __CFString *v65;
  uint64_t v66;
  const __CFString *v67;
  uint64_t v68;
  _QWORD v69[2];

  v69[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *, void *))a4;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = sub_21453AE90;
  v58 = sub_21453AEA0;
  v59 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = sub_21453AE90;
  v52 = sub_21453AEA0;
  v53 = 0;
  v11 = (void *)objc_opt_new();
  if (!v6
    || (objc_msgSend_nonce(v6, v8, v9, v10), (v15 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
    || (objc_msgSend_nonce(v6, v12, v13, v14),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend_length(v16, v17, v18, v19) == 0,
        v16,
        v15,
        v20))
  {
    handleForCategory(0);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_21456CECC();

    *((_BYTE *)v61 + 24) = 0;
    v37 = (void *)MEMORY[0x24BDD1540];
    v68 = *MEMORY[0x24BDD0FC8];
    v69[0] = CFSTR("Invalid Params and Nonce");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v38, (uint64_t)v69, (uint64_t)&v68, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v37, v40, (uint64_t)CFSTR("com.apple.corerepair"), -39, v39);
    v41 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_msgSend_nonce(v6, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = sub_21453AEA8;
  v47[3] = &unk_24D1AA4B0;
  v47[4] = &v60;
  v47[5] = &v54;
  v47[6] = &v48;
  objc_msgSend_signVeridianWith_withReply_(self, v25, (uint64_t)v24, (uint64_t)v47);

  if (!*((_BYTE *)v61 + 24) || (v27 = v55[5]) == 0 || !v49[5])
  {
    *((_BYTE *)v61 + 24) = 0;
    v42 = (void *)MEMORY[0x24BDD1540];
    v66 = *MEMORY[0x24BDD0FC8];
    v67 = CFSTR("Challenge Veridian failed");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v26, (uint64_t)&v67, (uint64_t)&v66, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v42, v43, (uint64_t)CFSTR("com.apple.corerepair"), -37, v39);
    v41 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v35 = (void *)v41;
    v31 = 0;
LABEL_14:

    v34 = 0;
    goto LABEL_15;
  }
  v46 = 0;
  v28 = objc_msgSend_CRCreateECDSADerData_responseDer_(self, v26, v27, (uint64_t)&v46);
  v29 = v46;
  v31 = v29;
  if (v28 || !v29)
  {
    *((_BYTE *)v61 + 24) = 0;
    v44 = (void *)MEMORY[0x24BDD1540];
    v64 = *MEMORY[0x24BDD0FC8];
    v65 = CFSTR("CRCreateECDSADerData failed");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v30, (uint64_t)&v65, (uint64_t)&v64, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v44, v45, (uint64_t)CFSTR("com.apple.corerepair"), -37, v39);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  *((_BYTE *)v61 + 24) = 1;
  objc_msgSend_setObject_forKeyedSubscript_(v11, v30, v49[5], (uint64_t)CFSTR("deviceNonce"));
  v32 = [CRChallengeResponse alloc];
  v34 = (void *)objc_msgSend_initWithComponentType_identifier_signedResponse_keyIndex_properties_(v32, v33, (uint64_t)CFSTR("vcrt"), (uint64_t)self->identifierBase64, v31, 0, v11);
  v35 = 0;
LABEL_15:
  v7[2](v7, *((unsigned __int8 *)v61 + 24), v35, v34);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v60, 8);
}

- (void)signVeridianWith:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t, uint64_t);
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  dispatch_time_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v22[8];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  dispatch_semaphore_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;
  uint8_t buf[4];
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t, uint64_t))a4;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = -1;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_21453AE90;
  v39 = sub_21453AEA0;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_21453AE90;
  v33 = sub_21453AEA0;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_21453AE90;
  v27 = sub_21453AEA0;
  v28 = dispatch_semaphore_create(0);
  objc_msgSend_sha256_(self, v8, (uint64_t)v6, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    handleForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_21456CEF8();
    goto LABEL_10;
  }
  objc_msgSend_sharedManager(MEMORY[0x24BE1A0C8], v10, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_21453B2A8;
  v22[3] = &unk_24D1A9EE8;
  v22[4] = &v41;
  v22[5] = &v35;
  v22[6] = &v29;
  v22[7] = &v23;
  objc_msgSend_signVeridianChallenge_completionHandler_(v14, v15, (uint64_t)v13, (uint64_t)v22);

  v16 = v24[5];
  v17 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v16, v17))
  {
    handleForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_214566830();
    goto LABEL_10;
  }
  handleForCategory(0);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v36[5];
    *(_DWORD *)buf = 138412290;
    v46 = v19;
    _os_log_impl(&dword_214503000, v18, OS_LOG_TYPE_DEFAULT, "Vcrt Signature is:%@", buf, 0xCu);
  }

  if (*((_DWORD *)v42 + 6))
  {
    handleForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_214566804();
    goto LABEL_10;
  }
  if (!v36[5])
  {
    handleForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_2145666B8();
LABEL_10:

    v20 = 0;
    goto LABEL_11;
  }
  v20 = 1;
LABEL_11:
  v7[2](v7, v20, v36[5], v30[5]);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

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
