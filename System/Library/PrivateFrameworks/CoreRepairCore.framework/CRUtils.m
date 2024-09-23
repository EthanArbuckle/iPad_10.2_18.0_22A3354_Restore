@implementation CRUtils

- (id)getAPTicket
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  BOOL v10;
  const char *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sharedDataAccessor(MEMORY[0x24BE63540], a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v6 = (void *)objc_msgSend_copyPathForPersonalizedData_error_(v4, v5, 2, (uint64_t)&v29);
  v7 = v29;

  handleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
    v10 = v7 == 0;
  else
    v10 = 0;
  if (!v10)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_21456AB4C((uint64_t)v7, v9, v22, v23, v24, v25, v26, v27);
LABEL_13:

    v9 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v6;
    _os_log_impl(&dword_214503000, v9, OS_LOG_TYPE_DEFAULT, "APTicket path: %@", buf, 0xCu);
  }

  v28 = 0;
  objc_msgSend_dataWithContentsOfFile_options_error_(MEMORY[0x24BDBCE50], v11, (uint64_t)v6, 2, &v28);
  v9 = objc_claimAutoreleasedReturnValue();
  v12 = v28;
  v7 = v12;
  if (!v9 || v12)
  {
    handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_21456ABB0((uint64_t)v7, v13, v14, v15, v16, v17, v18, v19);

    goto LABEL_13;
  }
LABEL_14:

  return v9;
}

- (BOOL)hasEntitlementBoolForTag:(unsigned int)a3 inAPTicket:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v34;
  _OWORD v35[28];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = v6;
  v34 = 0;
  v36 = 0;
  memset(v35, 0, sizeof(v35));
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_21456ACA4();

    objc_msgSend_getAPTicket(self, v10, v11, v12);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v23 = 0;
      goto LABEL_17;
    }
  }
  v13 = objc_retainAutorelease(v8);
  v17 = objc_msgSend_bytes(v13, v14, v15, v16);
  v21 = objc_msgSend_length(v13, v18, v19, v20);
  if (sub_21455E170(v17, v21, (uint64_t)v35))
  {
    handleForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_21456AC78();

    v23 = 0;
  }
  else
  {
    v24 = sub_21455DDB4((uint64_t)v35, 0, a3, &v34);
    if ((_DWORD)v24)
    {
      v25 = v24;
      handleForCategory(0);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_21456AC14(v25, v26, v27, v28, v29, v30, v31, v32);

      v23 = 0;
      v34 = 0;
    }
    else
    {
      v23 = v34;
    }
  }

LABEL_17:
  return v23;
}

- (BOOL)currentProcessHasEntitlement:(id)a3
{
  __CFString *v3;
  __SecTask *v4;
  __SecTask *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  NSObject *v20;
  CFErrorRef error;

  v3 = (__CFString *)a3;
  error = 0;
  v4 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x24BDBD240]);
  if (v4)
  {
    v5 = v4;
    v6 = SecTaskCopyValueForEntitlement(v4, v3, &error);
    v10 = v6;
    if (error)
    {
      handleForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_21456AD74((uint64_t)&error, v11, v12, v13, v14, v15, v16, v17);

      CFRelease(error);
    }
    else
    {
      if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v18 = objc_msgSend_BOOLValue(v10, v7, v8, v9);
        goto LABEL_13;
      }
      handleForCategory(0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_21456ACFC((uint64_t)v10, (uint64_t)v3, v20);

    }
    v18 = 0;
LABEL_13:
    CFRelease(v5);
    goto LABEL_14;
  }
  handleForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_21456ACD0();
  v18 = 0;
LABEL_14:

  return v18;
}

- (id)convertDataToHexInDictionary:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v7 = v3;
  if (!v3)
  {
    v37 = 0;
    goto LABEL_21;
  }
  v8 = (void *)objc_msgSend_mutableCopy(v3, v4, v5, v6);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v39 = v7;
  v9 = v7;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v41, (uint64_t)v45, 16);
  if (!v11)
    goto LABEL_19;
  v14 = v11;
  v15 = *(_QWORD *)v42;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v42 != v15)
        objc_enumerationMutation(v9);
      v17 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
      objc_msgSend_objectForKey_(v9, v12, v17, v13, v39);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_convertToHexString(v18, v19, v20, v21);
        v22 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_convertDataToHexInDictionary_(self, v26, (uint64_t)v18, v27);
          v22 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_17;
          objc_msgSend_stringValue(v18, v28, v29, v30);
          v22 = objc_claimAutoreleasedReturnValue();
        }
      }
      v31 = (void *)v22;
      if (v22)
      {
        objc_msgSend_setObject_forKeyedSubscript_(v8, v23, v22, v17);
      }
      else
      {
        objc_msgSend_null(MEMORY[0x24BDBCEF8], v23, v24, v25);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v8, v33, (uint64_t)v32, v17);

      }
LABEL_17:

    }
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v41, (uint64_t)v45, 16);
  }
  while (v14);
LABEL_19:

  v37 = (void *)objc_msgSend_copy(v8, v34, v35, v36);
  v7 = v39;
LABEL_21:

  return v37;
}

- (id)base64Preprocess:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v7 = v3;
  if (v3)
  {
    v33 = v3;
    v34 = (void *)objc_msgSend_mutableCopy(v3, v4, v5, v6);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v8 = v7;
    v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v36, (uint64_t)v40, 16);
    if (v10)
    {
      v13 = v10;
      v14 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v37 != v14)
            objc_enumerationMutation(v8);
          v16 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend_objectForKey_(v8, v11, v16, v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v35 = 0;
            v35 = objc_msgSend_unsignedIntegerValue(v17, v18, v19, v20);
            objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v21, (uint64_t)&v35, 8);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              objc_msgSend_setObject_forKeyedSubscript_(v34, v22, (uint64_t)v25, v16);
            }
            else
            {
              objc_msgSend_null(MEMORY[0x24BDBCEF8], v22, v23, v24);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v34, v27, (uint64_t)v26, v16);

            }
          }

        }
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v36, (uint64_t)v40, 16);
      }
      while (v13);
    }

    v31 = (void *)objc_msgSend_copy(v34, v28, v29, v30);
    v7 = v33;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

+ (id)getInnermostNSError:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;

  v3 = a3;
  if (v3)
  {
    v7 = v3;
    objc_msgSend_userInfo(v3, v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v8, v9, (uint64_t)CFSTR("NSUnderlyingError"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      do
      {
        v12 = v11;

        objc_msgSend_userInfo(v12, v13, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v16, v17, (uint64_t)CFSTR("NSUnderlyingError"), v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v12;
      }
      while (v11);
    }
    else
    {
      v12 = v7;
    }
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

+ (int)getInnermostNSErrorCode:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  objc_msgSend_getInnermostNSError_(a1, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_code(v4, v5, v6, v7);

  return v8;
}

+ (BOOL)foundInMultiRequestError:(id)a3 dataClass:(id)a4 dataInstance:(id)a5
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *FullKey;
  void *v26;
  NSObject *v27;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v13 = v9;
  v14 = 0;
  if (v7 && v8 && v9)
  {
    if (objc_msgSend_code(v7, v10, v11, v12) == 21)
    {
      objc_msgSend_userInfo(v7, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v18;
      if (v18)
      {
        objc_msgSend_objectForKey_(v18, v19, (uint64_t)CFSTR("MultiRequestErrors"), v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          FullKey = (void *)AMFDRDataLocalCreateFullKey();
          if (FullKey)
          {
            objc_msgSend_objectForKey_(v22, v23, (uint64_t)FullKey, v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v26 != 0;
            if (v26)
            {
              handleForCategory(0);
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                v29 = 138412546;
                v30 = FullKey;
                v31 = 2112;
                v32 = v26;
                _os_log_impl(&dword_214503000, v27, OS_LOG_TYPE_DEFAULT, "Found error in multi request errors: %@ : %@", (uint8_t *)&v29, 0x16u);
              }

            }
          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (id)getPathForApTicketWithError:(id *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  objc_msgSend_stringWithContentsOfFile_encoding_error_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("/private/preboot/active"), 1, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v4)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v5, (uint64_t)CFSTR("%s/%@/System/Library/Caches/apticket.der"), v6, "/private/preboot", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_214503000, v9, OS_LOG_TYPE_DEFAULT, "APTicket Path: %@", buf, 0xCu);
    }
  }
  else
  {
    handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_21456ADDC();
    v8 = 0;
  }

  if (a3)
    *a3 = objc_retainAutorelease(v7);

  return v8;
}

- (id)getPathForSavageFirmwareWithError:(id *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  objc_msgSend_stringWithContentsOfFile_encoding_error_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("/private/preboot/active"), 1, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v4)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v5, (uint64_t)CFSTR("%s/%@/usr/standalone/firmware/Savage/"), v6, "/private/preboot", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_214503000, v9, OS_LOG_TYPE_DEFAULT, "Savage Firmware Path: %@", buf, 0xCu);
    }
  }
  else
  {
    handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_21456ADDC();
    v8 = 0;
  }

  if (a3)
    *a3 = objc_retainAutorelease(v7);

  return v8;
}

- (id)getPathForYonkersFirmwareWithError:(id *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  objc_msgSend_stringWithContentsOfFile_encoding_error_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("/private/preboot/active"), 1, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v4)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v5, (uint64_t)CFSTR("%s/%@/usr/standalone/firmware/Yonkers/"), v6, "/private/preboot", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_214503000, v9, OS_LOG_TYPE_DEFAULT, "Yonkers Firmware Path: %@", buf, 0xCu);
    }
  }
  else
  {
    handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_21456ADDC();
    v8 = 0;
  }

  if (a3)
    *a3 = objc_retainAutorelease(v7);

  return v8;
}

- (BOOL)isHorizonRamdiskBootInApticket:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  int v26;
  uint8_t buf[4];
  int v28;
  _OWORD v29[28];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  v30 = 0;
  memset(v29, 0, sizeof(v29));
  v26 = 0;
  if (!v3)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456AE4C();
    goto LABEL_10;
  }
  v5 = objc_retainAutorelease(v3);
  v9 = objc_msgSend_bytes(v5, v6, v7, v8);
  v13 = objc_msgSend_length(v5, v10, v11, v12);
  if (sub_21455E170(v9, v13, (uint64_t)v29))
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456AC78();
LABEL_10:

    v24 = 0;
    goto LABEL_11;
  }
  sub_21455DE20((uint64_t)v29, 0, 1869833590, &v26);
  v16 = v15;
  handleForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue();
  v14 = v17;
  if ((_DWORD)v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_21456AC14(v16, v14, v18, v19, v20, v21, v22, v23);
    goto LABEL_10;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v28 = v26;
    _os_log_impl(&dword_214503000, v14, OS_LOG_TYPE_DEFAULT, "OS environment is %d", buf, 8u);
  }

  v24 = v26 == 2;
LABEL_11:

  return v24;
}

+ (BOOL)powerCycleSensor:(id *)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "+[CRUtils powerCycleSensor:]";
    _os_log_impl(&dword_214503000, v4, OS_LOG_TYPE_DEFAULT, "%s: SavageCamInterfaceOpen", buf, 0xCu);
  }

  v5 = SavageCamInterfaceOpen();
  v6 = (void *)MEMORY[0x24BDD1540];
  v15 = *MEMORY[0x24BDD0FC8];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v7, (uint64_t)CFSTR("SavageCamInterfaceOpen failed: %d"), v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v9;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v10, (uint64_t)&v16, (uint64_t)&v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v6, v12, (uint64_t)CFSTR("com.apple.corerepair"), -42, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    *a3 = objc_retainAutorelease(v13);

  return 0;
}

@end
