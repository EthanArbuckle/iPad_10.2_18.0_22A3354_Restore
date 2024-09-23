@implementation CRRepairStatusLite

+ (BOOL)isVeridianFWUpdateRequired
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  int isFirstAuthComplete;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  BOOL v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int updated;
  void *v31;
  id v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v34 = 0;
  v2 = (void *)objc_opt_new();
  isFirstAuthComplete = objc_msgSend_isFirstAuthComplete(v2, v3, v4, v5);

  if (isFirstAuthComplete)
  {
    objc_msgSend_sharedDataAccessor(MEMORY[0x24BE63540], v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v12 = (void *)objc_msgSend_copyPathForPersonalizedData_error_(v10, v11, 0, (uint64_t)&v33);
    v13 = v33;

    if (v12)
      v16 = v13 == 0;
    else
      v16 = 0;
    if (v16)
    {
      objc_msgSend_componentsSeparatedByString_(v12, v14, (uint64_t)CFSTR("usr/standalone/firmware"), v15);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v26;
      if (!MEMORY[0x24BEE7C58])
      {
        v13 = 0;
        v25 = 1;
        goto LABEL_16;
      }
      objc_msgSend_firstObject(v26, v27, v28, v29);
      updated = isVeridianUpdateRequired();
      v25 = updated != 0;
      handleForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v31 = v34;
        *(_DWORD *)buf = 138412546;
        v36 = v34;
        v37 = 1024;
        v38 = updated != 0;
        _os_log_impl(&dword_214503000, v17, OS_LOG_TYPE_DEFAULT, "isVeridianUpdateRequired :%@:%d", buf, 0x12u);

      }
      v13 = 0;
    }
    else
    {
      handleForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_214568B70((uint64_t)v13, v17, v18, v19, v20, v21, v22, v23);
      v24 = 0;
      v25 = 1;
    }

  }
  else
  {
    v24 = 0;
    v12 = 0;
    v13 = 0;
    v25 = 0;
  }
LABEL_16:

  return v25;
}

+ (BOOL)isVeridianFWUpdateRequiredLite
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int updated;
  BOOL v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  _BOOL4 v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v32 = 0;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%s/active"), v2, "/private/preboot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend_stringWithContentsOfFile_encoding_error_(MEMORY[0x24BDD17C8], v4, (uint64_t)v3, 1, &v31);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v31;
  if (!v5)
  {
    handleForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_214568BD4((uint64_t)v3, (uint64_t)v8, v20);
    goto LABEL_12;
  }
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v6, (uint64_t)CFSTR("/private/preboot/%@"), v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  handleForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v9;
    _os_log_impl(&dword_214503000, v10, OS_LOG_TYPE_DEFAULT, "completeFWPath :%@", buf, 0xCu);
  }

  if (!v9)
  {
    handleForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_214568C4C(v20, v23, v24, v25, v26, v27, v28, v29);
LABEL_12:
    v17 = 0;
    v9 = 0;
    v19 = 1;
    goto LABEL_13;
  }
  objc_msgSend_componentsSeparatedByString_(v9, v11, (uint64_t)CFSTR("usr/standalone/firmware"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v13;
  if (!MEMORY[0x24BEE7C58])
  {
    v19 = 1;
    goto LABEL_14;
  }
  objc_msgSend_firstObject(v13, v14, v15, v16);
  updated = isVeridianUpdateRequired();
  v19 = updated != 0;
  handleForCategory(0);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = updated != 0;
    v22 = v32;
    *(_DWORD *)buf = 138412546;
    v34 = v32;
    v35 = 1024;
    v36 = v21;
    _os_log_impl(&dword_214503000, v20, OS_LOG_TYPE_DEFAULT, "isVeridianUpdateRequired :%@:%d", buf, 0x12u);

  }
LABEL_13:

LABEL_14:
  return v19;
}

+ (id)getData:(id)a3 instance:(id)a4
{
  return (id)objc_msgSend_getData_instance_(CRFDRUtils, a2, (uint64_t)a3, (uint64_t)a4);
}

+ (id)getDataForDataClass:(id)a3
{
  return (id)objc_msgSend_getData_instance_(CRFDRUtils, a2, (uint64_t)a3, 0);
}

+ (id)getDataPayload:(id)a3 instance:(id)a4
{
  return (id)MEMORY[0x24BEDD108](CRFDRUtils, sel_getDataPayload_instance_, a3, a4);
}

+ (id)getDataPayloadForDataClass:(id)a3
{
  return (id)MEMORY[0x24BEDD108](CRFDRUtils, sel_getDataPayload_instance_, a3, 0);
}

+ (id)getSsrBootIntentWithError:(id *)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v42 = 0;
  objc_msgSend_readNVRAMValueForKey_error_(CRNVRAMController, a2, (uint64_t)CFSTR("diagnostic-boot-intent"), (uint64_t)&v42);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v42;
  handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    v8 = v5 == 0;
  else
    v8 = 0;
  if (!v8)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_214568CB4((uint64_t)v5, v7, v9);
LABEL_7:
    v10 = 0;
    v11 = 0;
    v12 = 0;
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v4;
    _os_log_impl(&dword_214503000, v7, OS_LOG_TYPE_DEFAULT, "readNVRAMValueForKey value: %@", buf, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41 = 0;
    objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x24BDD1608], v17, (uint64_t)v4, 0, &v41);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v41;
    if (!v12)
    {
      handleForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_214568D30((uint64_t)v5, v7, v35, v36, v37, v38, v39, v40);
      goto LABEL_7;
    }
    objc_msgSend_objectForKeyedSubscript_(v12, v18, (uint64_t)CFSTR("purpose"), v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_msgSend_isEqual_(v10, v20, (uint64_t)CFSTR("self-service-repair"), v21) & 1) != 0)
        {
          v13 = (void *)objc_opt_new();
          objc_msgSend_setObject_forKeyedSubscript_(v13, v22, (uint64_t)v10, (uint64_t)CFSTR("purpose"));
          objc_msgSend_objectForKeyedSubscript_(v12, v23, (uint64_t)CFSTR("wifi-credentials"), v24);
          v25 = objc_claimAutoreleasedReturnValue();

          if (!v25)
          {
            v11 = 0;
            v4 = 0;
            if (!a3)
              goto LABEL_27;
LABEL_10:
            if (v5)
            {
              v5 = objc_retainAutorelease(v5);
              *a3 = v5;
            }
            goto LABEL_27;
          }
          v26 = objc_alloc(MEMORY[0x24BDBCE50]);
          v7 = objc_msgSend_initWithBase64EncodedString_options_(v26, v27, v25, 0);
          objc_msgSend_decryptWiFiCredDictFromCredentialsData_(CRWiFiCredentials, v28, (uint64_t)v7, v29);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend_addEntriesFromDictionary_(v13, v30, (uint64_t)v11, v31);
          }
          v4 = (void *)v25;
LABEL_9:

          if (!a3)
            goto LABEL_27;
          goto LABEL_10;
        }
        handleForCategory(0);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          sub_214568DC0();
      }
      else
      {
        handleForCategory(0);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          sub_214568DEC();
      }
    }
    else
    {
      handleForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v11 = 0;
        v13 = 0;
        goto LABEL_9;
      }
      sub_214568D94();
      v10 = 0;
    }
    v11 = 0;
    goto LABEL_8;
  }
  handleForCategory(0);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    sub_214568E18();

  v13 = 0;
  v5 = 0;
  v12 = 0;
  v11 = 0;
  v10 = 0;
LABEL_27:
  v33 = (void *)objc_msgSend_copy(v13, v14, v15, v16);

  return v33;
}

+ (BOOL)isDeviceStagedSealed
{
  return objc_msgSend_queryDeviceStagedSealedFromEAN_error_(CRFDRUtils, a2, 0, 0);
}

@end
