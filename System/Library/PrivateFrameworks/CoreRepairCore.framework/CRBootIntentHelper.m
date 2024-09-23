@implementation CRBootIntentHelper

- (void)setBootIntentAndRebootToCheckerboardWithLocale:(id)a3 reply:(id)a4
{
  void (**v5)(id, uint64_t, id);
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  void *v21;
  id v22;
  id v23;
  const char *v24;
  void *v25;
  const char *v26;
  char v27;
  id v28;
  const char *v29;
  char v30;
  int v31;
  int v32;
  NSObject *v33;
  void *v34;
  const char *v35;
  NSObject *v36;
  const char *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[8];
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, uint64_t, id))a4;
  objc_msgSend_createEncryptedCredentialsDataWithLocale_(CRWiFiCredentials, v6, (uint64_t)a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCED8], v9, (uint64_t)&unk_24D1B8AF0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  handleForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v12, OS_LOG_TYPE_DEFAULT, "Set boot intent and reboot to Checkerboard", buf, 2u);
  }

  if (v8)
  {
    handleForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v15, OS_LOG_TYPE_DEFAULT, "Add encrypted WiFi credentials and locale", buf, 2u);
    }

    objc_msgSend_base64EncodedStringWithOptions_(v8, v16, 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v11, v19, (uint64_t)v18, (uint64_t)CFSTR("wifi-credentials"));

  }
  if (!objc_msgSend_isValidJSONObject_(MEMORY[0x24BDD1608], v13, (uint64_t)v11, v14))
  {
    v22 = 0;
    goto LABEL_20;
  }
  v49 = 0;
  objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x24BDD1608], v20, (uint64_t)v11, 0, &v49);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v49;
  if (!v21)
  {
    handleForCategory(0);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      sub_21456CB88((uint64_t)v22, v38);

    goto LABEL_20;
  }
  v23 = objc_alloc(MEMORY[0x24BDD17C8]);
  v25 = (void *)objc_msgSend_initWithData_encoding_(v23, v24, (uint64_t)v21, 4);

  if (!v25)
  {
LABEL_20:
    handleForCategory(0);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_21456CB58(v36, v39, v40, v41, v42, v43, v44, v45);
    v25 = 0;
    goto LABEL_23;
  }
  v48 = v22;
  v27 = objc_msgSend_setNVRAMValueForKey_value_error_(CRNVRAMController, v26, (uint64_t)CFSTR("diagnostic-boot-intent"), (uint64_t)v25, &v48);
  v28 = v48;

  if ((v27 & 1) == 0)
  {
    handleForCategory(0);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_21456CCD4();
LABEL_28:
    v22 = v28;
    goto LABEL_23;
  }
  v47 = v28;
  v30 = objc_msgSend_setNVRAMValueForKey_value_error_(CRNVRAMController, v29, (uint64_t)CFSTR("one-time-boot-command"), (uint64_t)CFSTR("checkerboard"), &v47);
  v22 = v47;

  if ((v30 & 1) != 0)
  {
    v31 = reboot3();
    if (!v31)
    {
      v46 = 1;
      if (!v5)
        goto LABEL_25;
      goto LABEL_24;
    }
    v32 = v31;
    handleForCategory(0);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_21456CBF8(v32, v33);

    v34 = (void *)MEMORY[0x24BDD1540];
    v51 = *MEMORY[0x24BDD0FC8];
    v52[0] = CFSTR("not supported in this mode or device");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v35, (uint64_t)v52, (uint64_t)&v51, 1);
    v36 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v34, v37, (uint64_t)CFSTR("com.apple.corerepair"), -73, v36);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_28;
  }
  handleForCategory(0);
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    sub_21456CC68();
LABEL_23:

  v46 = 0;
  if (v5)
LABEL_24:
    v5[2](v5, v46, v22);
LABEL_25:

}

- (void)getRepairTicket:(id)a3
{
  void (**v3)(id, uint64_t, id, id);
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t DefaultAMAuthInstallRef;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t RepairTicket_error;
  void *v24;
  const char *v25;
  id v26;
  id v27;

  v3 = (void (**)(id, uint64_t, id, id))a3;
  DefaultAMAuthInstallRef = objc_msgSend_getDefaultAMAuthInstallRef(CRPersonalizationManager, v4, v5, v6);
  v27 = 0;
  if (objc_msgSend_shouldPersonalizeWithSSOByDefault(CRPersonalizationManager, v8, v9, v10)
    && objc_msgSend_enableSSO_(CRPersonalizationManager, v11, DefaultAMAuthInstallRef, v12))
  {
    handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_21456CD40(v13, v14, v15, v16, v17, v18, v19, v20);

    v21 = 0;
    v22 = 0;
    RepairTicket_error = 0;
  }
  else
  {
    objc_msgSend_initWithAuthInstallObj_(CRPersonalizationManager, v11, DefaultAMAuthInstallRef, v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    RepairTicket_error = objc_msgSend_getRepairTicket_error_(v24, v25, (uint64_t)&v27, (uint64_t)&v26);
    v22 = v26;

    v21 = v27;
  }
  v3[2](v3, RepairTicket_error, v21, v22);

  AMSupportSafeRelease();
}

- (void)clearBootIntent:(id)a3
{
  void (**v3)(id, uint64_t, id);
  const char *v4;
  char v5;
  const char *v6;
  id v7;
  char v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;

  v3 = (void (**)(id, uint64_t, id))a3;
  v13 = 0;
  v5 = objc_msgSend_deleteNVRAMValueForKey_error_(CRNVRAMController, v4, (uint64_t)CFSTR("diagnostic-boot-intent"), (uint64_t)&v13);
  v7 = v13;
  if ((v5 & 1) == 0)
  {
    handleForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_21456CDDC();
    goto LABEL_9;
  }
  v12 = v7;
  v8 = objc_msgSend_deleteNVRAMValueForKey_error_(CRNVRAMController, v6, (uint64_t)CFSTR("one-time-boot-command"), (uint64_t)&v12);
  v9 = v12;

  if ((v8 & 1) == 0)
  {
    handleForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_21456CD70();
    v7 = v9;
LABEL_9:

    v10 = 0;
    v9 = v7;
    goto LABEL_10;
  }
  v10 = 1;
LABEL_10:
  v3[2](v3, v10, v9);

}

- (void)clearRepairBackup:(id)a3
{
  void (**v3)(id, uint64_t, id);
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = (void (**)(id, uint64_t, id))a3;
  objc_msgSend_sharedSingleton(CRFileSystemController, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v10 = objc_msgSend_clearRepairBackup_(v7, v8, (uint64_t)&v12, v9);
  v11 = v12;

  v3[2](v3, v10, v11);
}

@end
