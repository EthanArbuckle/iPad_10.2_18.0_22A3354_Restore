@implementation CRComponentBatteryRoswell

- (CRComponentBatteryRoswell)init
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
  CRComponentBatteryRoswell *v2;
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
  CRComponentBatteryRoswell *v16;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CRComponentBatteryRoswell;
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
    sub_21456B474(&v18, v15);

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
  block[2] = sub_21452B388;
  block[3] = &unk_24D1AA2E8;
  block[4] = a1;
  if (qword_253E797E8 != -1)
    dispatch_once(&qword_253E797E8, block);
  return (id)qword_253E79838;
}

- (void)challengeComponentWith:(id)a3 withReply:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(id, _QWORD, void *, void *);
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  int v27;
  id v28;
  const char *v29;
  void *v30;
  CRChallengeResponse *v31;
  const char *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  id v45;
  _QWORD v46[6];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  const __CFString *v58;
  uint64_t v59;
  const __CFString *v60;
  uint64_t v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v10 = (void (**)(id, _QWORD, void *, void *))a4;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = sub_21452B788;
  v51 = sub_21452B798;
  v52 = 0;
  if (!v6
    || (objc_msgSend_nonce(v6, v7, v8, v9), (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
    || (objc_msgSend_nonce(v6, v11, v12, v13),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend_length(v15, v16, v17, v18) == 0,
        v15,
        v14,
        v19))
  {
    handleForCategory(0);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_21456B4F8();

    *((_BYTE *)v54 + 24) = 0;
    v36 = (void *)MEMORY[0x24BDD1540];
    v61 = *MEMORY[0x24BDD0FC8];
    v62[0] = CFSTR("Invalid Params and Nonce");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v37, (uint64_t)v62, (uint64_t)&v61, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v36, v39, (uint64_t)CFSTR("com.apple.corerepair"), -39, v38);
    v40 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend_nonce(v6, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = sub_21452B7A0;
  v46[3] = &unk_24D1AA3D8;
  v46[4] = &v53;
  v46[5] = &v47;
  objc_msgSend_signbatteryRoswellWith_withReply_(self, v24, (uint64_t)v23, (uint64_t)v46);

  if (!*((_BYTE *)v54 + 24) || (v26 = v48[5]) == 0)
  {
    *((_BYTE *)v54 + 24) = 0;
    v41 = (void *)MEMORY[0x24BDD1540];
    v59 = *MEMORY[0x24BDD0FC8];
    v60 = CFSTR("Challenge Roswell failed");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v25, (uint64_t)&v60, (uint64_t)&v59, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v41, v42, (uint64_t)CFSTR("com.apple.corerepair"), -37, v38);
    v40 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v34 = (void *)v40;
    v30 = 0;
LABEL_13:

    v33 = 0;
    goto LABEL_14;
  }
  v45 = 0;
  v27 = objc_msgSend_CRCreateECDSADerData_responseDer_(self, v25, v26, (uint64_t)&v45);
  v28 = v45;
  v30 = v28;
  if (v27 || !v28)
  {
    *((_BYTE *)v54 + 24) = 0;
    v43 = (void *)MEMORY[0x24BDD1540];
    v57 = *MEMORY[0x24BDD0FC8];
    v58 = CFSTR("CRCreateECDSADerData failed");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v29, (uint64_t)&v58, (uint64_t)&v57, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v43, v44, (uint64_t)CFSTR("com.apple.corerepair"), -37, v38);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  *((_BYTE *)v54 + 24) = 1;
  v31 = [CRChallengeResponse alloc];
  v33 = (void *)objc_msgSend_initWithComponentType_identifier_signedResponse_keyIndex_properties_(v31, v32, (uint64_t)CFSTR("bcrt"), (uint64_t)self->identifierBase64, v30, 0, 0);
  v34 = 0;
LABEL_14:
  v10[2](v10, *((unsigned __int8 *)v54 + 24), v34, v33);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

}

- (void)signbatteryRoswellWith:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
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
  _QWORD v22[7];
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
  int v38;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = -1;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_21452B788;
  v33 = sub_21452B798;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_21452B788;
  v27 = sub_21452B798;
  v28 = dispatch_semaphore_create(0);
  objc_msgSend_sha256_(self, v8, (uint64_t)v6, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    handleForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_21456B524();
    goto LABEL_10;
  }
  objc_msgSend_sharedManager(MEMORY[0x24BE1A0C8], v10, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_21452BAFC;
  v22[3] = &unk_24D1A9EC0;
  v22[4] = &v35;
  v22[5] = &v29;
  v22[6] = &v23;
  objc_msgSend_authenticateBatteryWithChallenge_completionHandler_(v14, v15, (uint64_t)v13, (uint64_t)v22);

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
    v19 = v30[5];
    *(_DWORD *)buf = 138412290;
    v40 = v19;
    _os_log_impl(&dword_214503000, v18, OS_LOG_TYPE_DEFAULT, "Signature is:%@", buf, 0xCu);
  }

  if (*((_DWORD *)v36 + 6))
  {
    handleForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_214566804();
    goto LABEL_10;
  }
  if (!v30[5])
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
  v7[2](v7, v20, v30[5]);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
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
