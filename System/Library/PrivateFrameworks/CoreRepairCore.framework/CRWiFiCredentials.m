@implementation CRWiFiCredentials

+ (id)readAccessPointInfo
{
  const void *v2;
  NSObject *v3;
  const __CFArray *v4;
  const __CFArray *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  uint64_t v29;
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = (const void *)WiFiManagerClientCreate();
  handleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v3, OS_LOG_TYPE_DEFAULT, "Read WiFi access point info", buf, 2u);
  }

  if (v2)
  {
    v4 = (const __CFArray *)WiFiManagerClientCopyInterfaces();
    v5 = v4;
    if (v4 && CFArrayGetCount(v4) >= 1)
    {
      CFArrayGetValueAtIndex(v5, 0);
      v6 = (const void *)WiFiDeviceClientCopyCurrentNetwork();
      WiFiNetworkGetSSID();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = WiFiNetworkCopyPassword();
      v10 = (void *)v8;
      if (v7)
      {
        v11 = (void *)MEMORY[0x24BDBCED8];
        v28 = CFSTR("AccessPoint");
        v29 = v7;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v9, (uint64_t)&v29, (uint64_t)&v28, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dictionaryWithDictionary_(v11, v13, (uint64_t)v12, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          goto LABEL_9;
      }
      else
      {
        v15 = 0;
        if (!v8)
        {
LABEL_9:
          CFRelease(v2);
          if (v6)
            CFRelease(v6);
LABEL_14:
          CFRelease(v5);
          v20 = v15;
          v21 = v10;
          v22 = (void *)v7;
          goto LABEL_18;
        }
      }
      v26 = CFSTR("AccessPointPwd");
      v27 = v10;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v9, (uint64_t)&v27, (uint64_t)&v26, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addEntriesFromDictionary_(v15, v17, (uint64_t)v16, v18);

      goto LABEL_9;
    }
    handleForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v19, OS_LOG_TYPE_DEFAULT, "Unable to get wiFi interface information", buf, 2u);
    }

    CFRelease(v2);
    v15 = 0;
    v10 = 0;
    v7 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    if (v5)
      goto LABEL_14;
  }
  else
  {
    handleForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "+[CRWiFiCredentials readAccessPointInfo]";
      _os_log_impl(&dword_214503000, v23, OS_LOG_TYPE_DEFAULT, "%s :Failed to create WiFiManagerClient", buf, 0xCu);
    }

    v20 = 0;
    v21 = 0;
    v22 = 0;
  }
LABEL_18:
  v24 = v20;

  return v24;
}

+ (id)createEncryptedCredentialsDataWithLocale:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFAllocator *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const __SCNetworkReachability *v19;
  const char *v20;
  uint64_t v21;
  const __SCNetworkReachability *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  void *v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  id v44;
  SCNetworkReachabilityFlags flags;

  v4 = a3;
  objc_msgSend_readAccessPointInfo(a1, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v13 = v9;
  if (v4)
    objc_msgSend_setObject_forKeyedSubscript_(v9, v10, (uint64_t)v4, (uint64_t)CFSTR("ActiveLocale"));
  if (v8)
  {
    objc_msgSend_addEntriesFromDictionary_(v13, v10, (uint64_t)v8, v12);
    v14 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v18 = (const char *)objc_msgSend_UTF8String(CFSTR("gs.apple.com"), v15, v16, v17);
    v19 = SCNetworkReachabilityCreateWithName(v14, v18);
    if (v19)
    {
      v22 = v19;
      flags = 0;
      if (SCNetworkReachabilityGetFlags(v19, &flags))
        v23 = (flags >> 1) & 1;
      else
        v23 = 0;
      CFRelease(v22);
    }
    else
    {
      v23 = 0;
    }
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v20, v23, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v13, v25, (uint64_t)v24, (uint64_t)CFSTR("HasConnectivityData"));

  }
  v26 = (void *)MEMORY[0x24BDD1608];
  v27 = (void *)objc_msgSend_copy(v13, v10, v11, v12);
  LODWORD(v26) = objc_msgSend_isValidJSONObject_(v26, v28, (uint64_t)v27, v29);

  if (!(_DWORD)v26)
  {
    v37 = 0;
    goto LABEL_16;
  }
  v33 = (void *)MEMORY[0x24BDD1608];
  v34 = (void *)objc_msgSend_copy(v13, v30, v31, v32);
  v44 = 0;
  objc_msgSend_dataWithJSONObject_options_error_(v33, v35, (uint64_t)v34, 0, &v44);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v44;

  if (!v36)
  {
LABEL_16:
    handleForCategory(0);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      sub_21456DB24();
    v36 = 0;
    goto LABEL_19;
  }
  objc_msgSend_encryptUserData_(CRWiFiCredEncryption, v38, (uint64_t)v36, v39);
  v40 = objc_claimAutoreleasedReturnValue();
  if (!v40)
  {
    handleForCategory(0);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      sub_21456DB50();
LABEL_19:

    v41 = 0;
    goto LABEL_20;
  }
  v41 = (void *)v40;
LABEL_20:

  return v41;
}

+ (id)decryptWiFiCredDictFromCredentialsData:(id)a3
{
  const char *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v13;

  v5 = a3;
  if (!v5)
  {
    handleForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_21456DB7C();
    goto LABEL_10;
  }
  objc_msgSend_decryptUserData_(CRWiFiCredEncryption, v3, (uint64_t)v5, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    handleForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_21456DBA8();
LABEL_10:
    v10 = 0;
    v9 = 0;
    v8 = 0;
    goto LABEL_5;
  }
  v8 = (void *)v6;
  v13 = 0;
  objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x24BDD1608], v7, v6, 0, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;
  handleForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_21456DBD4((uint64_t)v9, v11);
LABEL_5:

  return v9;
}

@end
