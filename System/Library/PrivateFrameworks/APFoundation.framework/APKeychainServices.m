@implementation APKeychainServices

+ (id)objectForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v34 = 0;
  objc_msgSend__readDataFromKeychain_error_(a1, v7, (uint64_t)v6, (uint64_t)&v34);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v34;
  APLogForCategory(0x14uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138478083;
      v36 = v12;
      v37 = 2114;
      v38 = v6;
      v13 = v12;
      _os_log_impl(&dword_1CF251000, v11, OS_LOG_TYPE_INFO, "[%{private}@]: Successfully read key: %{public}@", buf, 0x16u);

    }
    objc_msgSend_classes(APSupportedSecureEncodedClass, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x1E0CB3710], v18, (uint64_t)v17, (uint64_t)v8, &v33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v33;
    v21 = v20;
    if (!v19 || v20)
    {
      APLogForCategory(0x14uLL);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (void *)objc_opt_class();
        v32 = v26;
        objc_msgSend_description(v21, v27, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v36 = v26;
        v37 = 2112;
        v38 = v8;
        v39 = 2112;
        v40 = v30;
        _os_log_impl(&dword_1CF251000, v25, OS_LOG_TYPE_ERROR, "[%@]: Error unarchiving data: %@. Error: %@", buf, 0x20u);

      }
      v22 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v21);
    }
    else
    {
      v22 = v19;
    }

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v23 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138478083;
      v36 = v23;
      v37 = 2114;
      v38 = v6;
      v24 = v23;
      _os_log_impl(&dword_1CF251000, v11, OS_LOG_TYPE_ERROR, "[%{private}@]: Unable to find key: %{public}@", buf, 0x16u);

    }
    v22 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }

  return v22;
}

+ (void)setObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v10 = a4;
  if (v8)
  {
    v22 = 0;
    objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v9, (uint64_t)v8, 1, &v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v22;
    v13 = v12;
    if (v12)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v12);
      APLogForCategory(0x14uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (void *)objc_opt_class();
        v16 = v15;
        objc_msgSend_description(v13, v17, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478595;
        v24 = v15;
        v25 = 2114;
        v26 = v10;
        v27 = 2113;
        v28 = v8;
        v29 = 2114;
        v30 = v20;
        _os_log_impl(&dword_1CF251000, v14, OS_LOG_TYPE_ERROR, "[%{private}@]: Error archiving data for key: %{public}@ and value: %{private}@. Error: %{public}@", buf, 0x2Au);

      }
    }
    else
    {
      v14 = a1;
      objc_sync_enter(v14);
      objc_msgSend__writeDataToKeychain_andData_error_(APKeychainServices, v21, (uint64_t)v10, (uint64_t)v11, a5);
      objc_sync_exit(v14);
    }

  }
  else
  {
    objc_msgSend__removeObjectForKey_error_(APKeychainServices, v9, (uint64_t)v10, (uint64_t)a5);
  }

}

+ (void)_writeDataToKeychain:(id)a3 andData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  OSStatus v15;
  const char *v16;
  uint64_t v17;
  OSStatus v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const __CFDictionary *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  void *v79;
  uint64_t v80;
  const char *v81;
  const char *v82;
  NSObject *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const __CFString *v103;
  uint8_t buf[4];
  _BYTE v105[14];
  uint64_t v106;
  const __CFString *v107;
  _QWORD v108[2];
  _QWORD v109[2];
  uint64_t v110;
  _QWORD v111[2];

  v111[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend__keychainQuery_(a1, v10, (uint64_t)v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v12, v13, *MEMORY[0x1E0CD68A0], v14);
  v15 = SecItemDelete((CFDictionaryRef)v12);
  if (v9)
  {
    v18 = v15;
    objc_msgSend__keychainQuery_(a1, v16, (uint64_t)v8, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x1E0CD70D8];
    objc_msgSend_setObject_forKeyedSubscript_(v19, v21, (uint64_t)v9, *MEMORY[0x1E0CD70D8]);
    v22 = SecItemAdd((CFDictionaryRef)v19, 0);
    if ((_DWORD)v22)
    {
      v25 = v22;
      if ((_DWORD)v22 == -25299)
      {
        objc_msgSend__keychainQuery_(a1, v23, (uint64_t)v8, v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObjectForKey_(v26, v27, *MEMORY[0x1E0CD6C98], v28);
        objc_msgSend_setObject_forKeyedSubscript_(v26, v29, (uint64_t)v9, v20);
        objc_msgSend__keychainQuery_(a1, v30, (uint64_t)v8, v31);
        v32 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

        v33 = SecItemUpdate(v32, (CFDictionaryRef)v26);
        if ((_DWORD)v33)
        {
          v35 = v33;
          if (a5)
          {
            if (v18 != -25300 && v18)
            {
              v75 = (void *)MEMORY[0x1E0CB35C8];
              v101 = v18;
              v110 = *MEMORY[0x1E0CB2D50];
              v76 = v110;
              v111[0] = CFSTR("Error deleting keychain item");
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v34, (uint64_t)v111, (uint64_t)&v110, 1);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_errorWithDomain_code_userInfo_(v75, v78, (uint64_t)CFSTR("APPCControllerRequesterErrorDomain"), v101, v77);
              v79 = (void *)objc_claimAutoreleasedReturnValue();

              v80 = *MEMORY[0x1E0CB3388];
              v108[0] = v76;
              v108[1] = v80;
              v109[0] = CFSTR("Error updating keychain in write");
              v109[1] = v79;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v81, (uint64_t)v109, (uint64_t)v108, 2);
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v82, (uint64_t)CFSTR("APPCControllerRequesterErrorDomain"), (int)v35, v36);
            }
            else
            {
              v106 = *MEMORY[0x1E0CB2D50];
              v107 = CFSTR("Error updating keychain in write");
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v34, (uint64_t)&v107, (uint64_t)&v106, 1);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v37, (uint64_t)CFSTR("APPCControllerRequesterErrorDomain"), (int)v35, v36);
            }
            *a5 = (id)objc_claimAutoreleasedReturnValue();

          }
          APLogForCategory(0x14uLL);
          v83 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)v105 = v8;
            *(_WORD *)&v105[8] = 1024;
            *(_DWORD *)&v105[10] = v35;
            _os_log_impl(&dword_1CF251000, v83, OS_LOG_TYPE_ERROR, "Failed to update keychain item %{public}@. Error %d", buf, 0x12u);
          }

          objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v84, v85, v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_bundleIdentifier(v87, v88, v89, v90);
          v91 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_sendKeychainAnalytics_keyName_readCount_writeCount_bundleID_(APKeychainAnalytics, v92, v35, (uint64_t)v8, dword_1ED2BC648, dword_1ED2BC774, v91);
          sub_1CF26DA60();
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_lock(v93, v94, v95, v96);

          dword_1ED2BC774 = 0;
          sub_1CF26DA60();
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_unlock(v97, v98, v99, v100);

        }
        else
        {
          sub_1CF26DA60();
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_lock(v67, v68, v69, v70);

          ++dword_1ED2BC774;
          sub_1CF26DA60();
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_unlock(v71, v72, v73, v74);

        }
        v12 = v32;
      }
      else
      {
        if (a5)
        {
          v46 = (void *)MEMORY[0x1E0CB35C8];
          v102 = *MEMORY[0x1E0CB2D50];
          v103 = CFSTR("Error adding to keychain in write");
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v23, (uint64_t)&v103, (uint64_t)&v102, 1);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v46, v48, (uint64_t)CFSTR("APPCControllerRequesterErrorDomain"), (int)v25, v47);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        APLogForCategory(0x14uLL);
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v105 = v25;
          *(_WORD *)&v105[4] = 2114;
          *(_QWORD *)&v105[6] = v8;
          _os_log_impl(&dword_1CF251000, v49, OS_LOG_TYPE_ERROR, "Error %d checking for existence of keychain item %{public}@", buf, 0x12u);
        }

        objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v50, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_bundleIdentifier(v53, v54, v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_sendKeychainAnalytics_keyName_readCount_writeCount_bundleID_(APKeychainAnalytics, v58, v25, (uint64_t)v8, dword_1ED2BC648, dword_1ED2BC774, v57);
        sub_1CF26DA60();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lock(v59, v60, v61, v62);

        dword_1ED2BC774 = 0;
        sub_1CF26DA60();
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_unlock(v63, v64, v65, v66);

      }
    }
    else
    {
      sub_1CF26DA60();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lock(v38, v39, v40, v41);

      ++dword_1ED2BC774;
      sub_1CF26DA60();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_unlock(v42, v43, v44, v45);

    }
  }

}

+ (id)_readDataFromKeychain:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  CFTypeRef result;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend__keychainQuery_(a1, v7, (uint64_t)v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v9, v10, *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD7018]);
  result = 0;
  v11 = SecItemCopyMatching((CFDictionaryRef)v9, &result);
  if (!(_DWORD)v11 && result)
  {
    sub_1CF26DA60();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v12, v13, v14, v15);

    ++dword_1ED2BC648;
    sub_1CF26DA60();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unlock(v16, v17, v18, v19);

    a4 = (id *)result;
    goto LABEL_13;
  }
  APLogForCategory(0x14uLL);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if ((_DWORD)v11 == -25300)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v50 = v6;
      _os_log_impl(&dword_1CF251000, v21, OS_LOG_TYPE_INFO, "No previous keychain records found for key %{public}@.", buf, 0xCu);
    }

    sub_1CF26DA60();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v22, v23, v24, v25);

    ++dword_1ED2BC648;
    sub_1CF26DA60();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unlock(v26, v27, v28, v29);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    v50 = (id)(int)v11;
    v51 = 2114;
    v52 = v6;
    _os_log_impl(&dword_1CF251000, v21, OS_LOG_TYPE_ERROR, "Error %ld retrieving secure data for key %{public}@", buf, 0x16u);
  }

  if (a4)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v30, (uint64_t)CFSTR("APPCControllerRequesterErrorDomain"), (int)v11, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bundleIdentifier(v34, v35, v36, v37);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_sendKeychainAnalytics_keyName_readCount_writeCount_bundleID_(APKeychainAnalytics, v38, v11, (uint64_t)v6, dword_1ED2BC648, dword_1ED2BC774, v26);
    sub_1CF26DA60();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v39, v40, v41, v42);

    dword_1ED2BC648 = 0;
    sub_1CF26DA60();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unlock(v43, v44, v45, v46);

LABEL_12:
    a4 = 0;
  }
LABEL_13:

  return a4;
}

+ (id)_keychainQuery:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v6, (uint64_t)CFSTR("apple"), *MEMORY[0x1E0CD6898]);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v7, *MEMORY[0x1E0CD6CA8], *MEMORY[0x1E0CD6C98]);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v8, (uint64_t)CFSTR("com.apple.iAdIDRecords"), *MEMORY[0x1E0CD6B58]);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v9, *MEMORY[0x1E0CD68A8], *MEMORY[0x1E0CD68A0]);
  objc_msgSend_dataUsingEncoding_(v4, v10, 4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v5, v13, (uint64_t)v12, *MEMORY[0x1E0CD69B0]);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v14, (uint64_t)v12, *MEMORY[0x1E0CD68F8]);

  return v5;
}

+ (void)setObject:(id)a3 forKey:(id)a4
{
  objc_msgSend_setObject_forKey_error_(APKeychainServices, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

+ (void)setPropertyListObject:(id)a3 forKey:(id)a4
{
  MEMORY[0x1E0DE7D20](APKeychainServices, sel_setPropertyListObject_forKey_error_, a3, a4);
}

+ (void)setPropertyListObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  const char *v8;
  id v9;
  id v10;
  const char *v11;
  id v12;

  v12 = a3;
  v9 = a4;
  if (v12)
  {
    v10 = a1;
    objc_sync_enter(v10);
    objc_msgSend__writeDataToKeychain_andData_error_(APKeychainServices, v11, (uint64_t)v9, (uint64_t)v12, a5);
    objc_sync_exit(v10);

  }
  else
  {
    objc_msgSend__removeObjectForKey_error_(APKeychainServices, v8, (uint64_t)v9, (uint64_t)a5);
  }

}

+ (id)objectForPropertyListKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  id v12;
  id v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend__readDataFromKeychain_error_(a1, v7, (uint64_t)v6, (uint64_t)a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  APLogForCategory(0x14uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      v15 = 138478083;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v6;
      v11 = v16;
      _os_log_impl(&dword_1CF251000, v9, OS_LOG_TYPE_INFO, "[%{private}@]: Successfully read key: %{public}@", (uint8_t *)&v15, 0x16u);

    }
    v12 = v8;
  }
  else
  {
    if (v10)
    {
      v15 = 138478083;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v6;
      v13 = v16;
      _os_log_impl(&dword_1CF251000, v9, OS_LOG_TYPE_INFO, "[%{private}@]: Unable to find key: %{public}@", (uint8_t *)&v15, 0x16u);

    }
  }

  return v8;
}

+ (void)_removeObjectForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  OSStatus v12;
  OSStatus v13;
  NSObject *v14;
  const char *v15;
  _DWORD v16[2];
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend__keychainQuery_(a1, v7, (uint64_t)v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v9, v10, *MEMORY[0x1E0CD68A0], v11);
  v12 = SecItemDelete((CFDictionaryRef)v9);
  if (a4)
  {
    v13 = v12;
    if (v12)
    {
      APLogForCategory(0x14uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v16[0] = 67109378;
        v16[1] = v13;
        v17 = 2114;
        v18 = v6;
        _os_log_impl(&dword_1CF251000, v14, OS_LOG_TYPE_ERROR, "Error %d removing object from keychain item %{public}@", (uint8_t *)v16, 0x12u);
      }

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v15, (uint64_t)CFSTR("APPCControllerRequesterErrorDomain"), v13, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

}

@end
