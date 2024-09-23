@implementation CRFDRUtils

+ (__AMFDR)_createFDRLocal
{
  void *v2;
  __AMFDR *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("DataStore");
  v6[0] = CFSTR("Local");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v6, (uint64_t)&v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (__AMFDR *)AMFDRCreateWithOptions();

  return v3;
}

+ (id)getLocalSealingManifest
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];
  void *v9;
  uint64_t v10;

  objc_msgSend__createFDRLocal(a1, a2, v2, v3);
  v9 = 0;
  v10 = 0;
  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_214503000, v4, OS_LOG_TYPE_DEFAULT, "Getting local sealing manifest", v8, 2u);
  }

  if ((AMFDRSealingMapPopulateSealingManifest() & 1) != 0)
  {
    v5 = v9;
  }
  else
  {
    handleForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_21456CF24();

    v5 = 0;
  }
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v5;
}

+ (id)getStringFromCert:(id)a3 WithTag:(unint64_t)a4 AndOID:(id)a5
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  char v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  id v30;
  const char *v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  __int128 v43;
  unint64_t v44[3];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48[2];
  $203840463D15D3E17BD93E376D41ABE6 v49;
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v49 = a3;
  v6 = a5;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v48[0] = 0;
  v48[1] = 0;
  v45 = 0;
  v46 = 0;
  v47 = 0;
  memset(v44, 0, sizeof(v44));
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  while (!sub_21455E608((unint64_t *)&v49, v44))
  {
    objc_msgSend_valueWithBytes_objCType_(MEMORY[0x24BDD1968], v9, (uint64_t)v44, (uint64_t)"{?=Q{?=*Q}}");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v7, v13, (uint64_t)v12, v14);

  }
  if (objc_msgSend_count(v7, v9, v10, v11))
  {
    v19 = 0;
    *(_QWORD *)&v18 = 138412290;
    v43 = v18;
    while (1)
    {
      objc_msgSend_objectAtIndex_(v7, v15, 0, v17, v43);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_getValue_(v20, v21, (uint64_t)&v45, v22);
      v23 = objc_alloc(MEMORY[0x24BDBCE50]);
      v27 = (void *)objc_msgSend_initWithBytes_length_(v23, v24, v46, v47);
      if (v45 != a4 || (objc_msgSend_isEqual_(v6, v25, (uint64_t)v27, v26) & 1) == 0)
        break;
      v19 = 1;
LABEL_15:
      objc_msgSend_removeObjectAtIndex_(v7, v28, 0, v29);

      if (!objc_msgSend_count(v7, v35, v36, v37))
        goto LABEL_20;
    }
    if ((v19 & 1) != 0)
    {
      v30 = objc_alloc(MEMORY[0x24BDD17C8]);
      v32 = objc_msgSend_initWithData_encoding_(v30, v31, (uint64_t)v27, 4);
      objc_msgSend_addObject_(v8, v33, (uint64_t)v32, v34);
    }
    else
    {
      if (!sub_21455E5DC((unint64_t *)&v46, v48))
      {
        while (!sub_21455E608(v48, v44))
        {
          objc_msgSend_valueWithBytes_objCType_(MEMORY[0x24BDD1968], v28, (uint64_t)v44, (uint64_t)"{?=Q{?=*Q}}");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v7, v39, (uint64_t)v38, v40);

        }
        goto LABEL_14;
      }
      handleForCategory(0);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v43;
        v51 = v27;
        _os_log_error_impl(&dword_214503000, v32, OS_LOG_TYPE_ERROR, "Failed to parse node in cert chain data = %@", buf, 0xCu);
      }
    }

LABEL_14:
    v19 = 0;
    goto LABEL_15;
  }
LABEL_20:
  v41 = (void *)objc_msgSend_copy(v8, v15, v16, v17);

  return v41;
}

+ (id)getData:(id)a3 instance:(id)a4
{
  id v5;
  id v6;
  __CFDictionary *Mutable;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v13;

  v5 = a3;
  v6 = a4;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, CFSTR("VerifyData"), (const void *)*MEMORY[0x24BDBD270]);
  if (v6)
    v8 = AMFDRSealingMapCopyLocalData();
  else
    v8 = AMFDRSealingManifestCopyLocalDataForClass();
  v9 = (void *)v8;
  if (v8)
  {
    CFDictionarySetValue(Mutable, CFSTR("VerifyData"), (const void *)*MEMORY[0x24BDBD268]);
    if (v6)
      v10 = AMFDRSealingMapCopyLocalData();
    else
      v10 = AMFDRSealingManifestCopyLocalDataForClass();
    v11 = (void *)v10;

  }
  else
  {

    handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_21456CF84();

    v11 = 0;
  }
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  return v11;
}

+ (id)getDataPayload:(id)a3 instance:(id)a4
{
  id v6;
  const char *v7;
  void *v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _OWORD v42[28];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v43 = 0;
  memset(v42, 0, sizeof(v42));
  v40 = 0;
  v41 = 0;
  objc_msgSend_getData_instance_(a1, v7, (uint64_t)v6, (uint64_t)a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    handleForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_21456D04C();

    goto LABEL_14;
  }
  v10 = objc_retainAutorelease(v8);
  v14 = objc_msgSend_bytes(v10, v11, v12, v13);
  v18 = objc_msgSend_length(v10, v15, v16, v17);
  sub_21455E088(v14, v18, (uint64_t)v42);
  if ((_DWORD)v19)
  {
    v25 = v19;
    handleForCategory(0);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_21456D110(v25, v26, v27, v28, v29, v30, v31, v32);
    goto LABEL_13;
  }
  v20 = sub_21455DCE8((uint64_t)v42, (uint64_t)&v40);
  if ((_DWORD)v20)
  {
    v33 = v20;
    handleForCategory(0);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_21456D0AC(v33, v26, v34, v35, v36, v37, v38, v39);
LABEL_13:

LABEL_14:
    v22 = 0;
    goto LABEL_5;
  }
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v21, v40, v41);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  return v22;
}

+ (BOOL)isDataClassSupported:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  AMFDRSealingMapGetEntriesForDevice();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)CFSTR("Tag"), v12, (_QWORD)v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend_isEqualToString_(v13, v14, (uint64_t)v3, v15) & 1) != 0)
          {

            v16 = 1;
            goto LABEL_14;
          }

        }
      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v11, (uint64_t)&v18, (uint64_t)v22, 16);
      if (v7)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_14:

  return v16;
}

+ (id)_getManifestForDataClass:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v12;

  v4 = a3;
  objc_msgSend__createFDRLocal(a1, v5, v6, v7);
  if (!v4)
  {
    handleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_21456D174();
    goto LABEL_12;
  }
  v8 = AMFDRSealingManifestCopyInstanceForClass();
  if (!v8)
  {
    handleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_21456D1A0();
LABEL_12:

    v9 = 0;
    goto LABEL_7;
  }
  v9 = (void *)v8;
  if ((AMFDRDataCopyManifest() & 1) == 0)
  {
    handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_21456D200();

  }
LABEL_7:
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  return 0;
}

+ (BOOL)isDcSignedSealingManifest:(id *)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  unint64_t *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  __CFString *v41;
  const __CFString *v43;
  NSObject *v44;
  const char *v45;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const __CFString *v52;
  uint8_t buf[4];
  void *v54;
  _OWORD v55[28];
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v56 = 0;
  memset(v55, 0, sizeof(v55));
  v49 = 0;
  v50 = 0;
  v4 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = (void *)objc_msgSend_initWithBytes_length_(v4, v5, (uint64_t)&unk_214575EA1, 3);
  objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v7, (uint64_t)CFSTR("SELF MATCHES %@"), v8, CFSTR("FDR-SS-DC.*"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getLocalSealingManifest(CRFDRUtils, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    v34 = 0;
    v43 = CFSTR("Cannot copy sealing manifest from device");
    goto LABEL_16;
  }
  v15 = objc_retainAutorelease(v13);
  v19 = objc_msgSend_bytes(v15, v16, v17, v18);
  v23 = objc_msgSend_length(v15, v20, v21, v22);
  v24 = sub_21455E170(v19, v23, (uint64_t)v55);
  if ((_DWORD)v24)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v25, (uint64_t)CFSTR("Failed to parse cert as img4; stat: %d"),
      v26,
      v24);
LABEL_14:
    v43 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    if (!v43)
    {
      LOBYTE(a3) = 0;
      v34 = 0;
      goto LABEL_9;
    }
    v34 = 0;
    goto LABEL_16;
  }
  v27 = sub_21455E5DC((unint64_t *)&v55[18] + 1, (unint64_t *)&v49);
  if ((_DWORD)v27)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v28, (uint64_t)CFSTR("Failed to parse cert chain; stat: %d"),
      v29,
      v27);
    goto LABEL_14;
  }
  objc_msgSend_getStringFromCert_WithTag_AndOID_(CRFDRUtils, v28, v49, v50, 6, v6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v30;
  if (v30 && objc_msgSend_count(v30, v31, v32, v33))
  {
    handleForCategory(0);
    a3 = (id *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v34;
      _os_log_impl(&dword_214503000, (os_log_t)a3, OS_LOG_TYPE_DEFAULT, "Parsed the following common names from cert in seal: %@", buf, 0xCu);
    }

    objc_msgSend_filteredArrayUsingPredicate_(v34, v35, (uint64_t)v9, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0;
    LOBYTE(a3) = objc_msgSend_count(v37, v38, v39, v40) != 0;
    v34 = v37;
    goto LABEL_9;
  }
  v43 = CFSTR("Failed to parse cert common name from cert chain");
LABEL_16:
  handleForCategory(0);
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    sub_21456D260();

  if (a3)
  {
    v46 = (void *)MEMORY[0x24BDD1540];
    v51 = *MEMORY[0x24BDD0FC8];
    v52 = v43;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v45, (uint64_t)&v52, (uint64_t)&v51, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v46, v48, (uint64_t)CFSTR("com.apple.corerepair"), -42, v47);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a3) = 0;
  }
  v41 = (__CFString *)v43;
LABEL_9:

  return (char)a3;
}

+ (BOOL)isDcSignedDataClass:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  const char *v27;
  uint64_t v28;
  unint64_t *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  __CFString *v41;
  const __CFString *v43;
  void *v44;
  const __CFString *v45;
  NSObject *v46;
  const char *v47;
  void *v48;
  void *v49;
  const char *v50;
  unint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const __CFString *v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  void *v59;
  _OWORD v60[28];
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v61 = 0;
  memset(v60, 0, sizeof(v60));
  v52 = 0;
  v53 = 0;
  v6 = objc_alloc(MEMORY[0x24BDBCE50]);
  v8 = (void *)objc_msgSend_initWithBytes_length_(v6, v7, (uint64_t)&unk_214575EA1, 3);
  objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v9, (uint64_t)CFSTR("SELF MATCHES %@"), v10, CFSTR("FDR-CA\\d{1,4}-ROOT-DC.*"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getData_instance_(CRFDRUtils, v12, (uint64_t)v5, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13;
  if (!v13)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v14, (uint64_t)CFSTR("Cannot copy %@ data from device"), v15, v5);
LABEL_15:
    v43 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    if (!v43)
    {
      LOBYTE(a4) = 0;
      v34 = 0;
      goto LABEL_9;
    }
    v34 = 0;
    goto LABEL_17;
  }
  v17 = objc_retainAutorelease(v13);
  v21 = objc_msgSend_bytes(v17, v18, v19, v20);
  v25 = objc_msgSend_length(v17, v22, v23, v24);
  sub_21455E088(v21, v25, (uint64_t)v60);
  if ((_DWORD)v26)
  {
    v44 = (void *)MEMORY[0x24BDD17C8];
    v51 = v26;
    v45 = CFSTR("Failed to parse cert as img4; stat: %d");
LABEL_14:
    objc_msgSend_stringWithFormat_(v44, v27, (uint64_t)v45, v28, v51);
    goto LABEL_15;
  }
  v29 = sub_21455E5DC((unint64_t *)&v60[18] + 1, (unint64_t *)&v52);
  if ((_DWORD)v29)
  {
    v44 = (void *)MEMORY[0x24BDD17C8];
    v51 = v29;
    v45 = CFSTR("Failed to parse cert chain; stat: %d");
    goto LABEL_14;
  }
  objc_msgSend_getStringFromCert_WithTag_AndOID_(CRFDRUtils, v27, v52, v53, 6, v8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v30;
  if (v30 && objc_msgSend_count(v30, v31, v32, v33))
  {
    handleForCategory(0);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v57 = v5;
      v58 = 2112;
      v59 = v34;
      _os_log_impl(&dword_214503000, (os_log_t)a4, OS_LOG_TYPE_DEFAULT, "Parsed the following common names from cert in %@: %@", buf, 0x16u);
    }

    objc_msgSend_filteredArrayUsingPredicate_(v34, v35, (uint64_t)v11, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0;
    LOBYTE(a4) = objc_msgSend_count(v37, v38, v39, v40) != 0;
    v34 = v37;
    goto LABEL_9;
  }
  v43 = CFSTR("Failed to parse cert common name from cert chain");
LABEL_17:
  handleForCategory(0);
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    sub_21456D260();

  if (a4)
  {
    v48 = (void *)MEMORY[0x24BDD1540];
    v54 = *MEMORY[0x24BDD0FC8];
    v55 = v43;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v47, (uint64_t)&v55, (uint64_t)&v54, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v48, v50, (uint64_t)CFSTR("com.apple.corerepair"), -42, v49);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }
  v41 = (__CFString *)v43;
LABEL_9:

  return (char)a4;
}

+ (BOOL)isDcSignedCombinedDataClass:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  unint64_t *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  __CFString *v43;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  NSObject *v48;
  const char *v49;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const __CFString *v57;
  uint8_t buf[4];
  id v59;
  __int16 v60;
  void *v61;
  _OWORD v62[28];
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v63 = 0;
  memset(v62, 0, sizeof(v62));
  v54 = 0;
  v55 = 0;
  v7 = objc_alloc(MEMORY[0x24BDBCE50]);
  v9 = (void *)objc_msgSend_initWithBytes_length_(v7, v8, (uint64_t)&unk_214575EA1, 3);
  objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v10, (uint64_t)CFSTR("SELF MATCHES %@"), v11, CFSTR("FDR-CA\\d{1,4}-ROOT-DC.*"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__getManifestForDataClass_(a1, v13, (uint64_t)v6, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v15;
  if (!v15)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v16, (uint64_t)CFSTR("Cannot copy %@ manifest from device"), v17, v6);
LABEL_15:
    v45 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    if (!v45)
    {
      LOBYTE(a4) = 0;
      v36 = 0;
      goto LABEL_9;
    }
    v36 = 0;
    goto LABEL_17;
  }
  v19 = objc_retainAutorelease(v15);
  v23 = objc_msgSend_bytes(v19, v20, v21, v22);
  v27 = objc_msgSend_length(v19, v24, v25, v26);
  v28 = sub_21455E170(v23, v27, (uint64_t)v62);
  if ((_DWORD)v28)
  {
    v46 = (void *)MEMORY[0x24BDD17C8];
    v53 = v28;
    v47 = CFSTR("Failed to parse cert as img4; stat: %d");
LABEL_14:
    objc_msgSend_stringWithFormat_(v46, v29, (uint64_t)v47, v30, v53);
    goto LABEL_15;
  }
  v31 = sub_21455E5DC((unint64_t *)&v62[18] + 1, (unint64_t *)&v54);
  if ((_DWORD)v31)
  {
    v46 = (void *)MEMORY[0x24BDD17C8];
    v53 = (uint64_t)v31;
    v47 = CFSTR("Failed to parse cert chain; stat: %d");
    goto LABEL_14;
  }
  objc_msgSend_getStringFromCert_WithTag_AndOID_(CRFDRUtils, v29, v54, v55, 6, v9);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v32;
  if (v32 && objc_msgSend_count(v32, v33, v34, v35))
  {
    handleForCategory(0);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v59 = v6;
      v60 = 2112;
      v61 = v36;
      _os_log_impl(&dword_214503000, (os_log_t)a4, OS_LOG_TYPE_DEFAULT, "Parsed the following common names from cert in %@: %@", buf, 0x16u);
    }

    objc_msgSend_filteredArrayUsingPredicate_(v36, v37, (uint64_t)v12, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = 0;
    LOBYTE(a4) = objc_msgSend_count(v39, v40, v41, v42) != 0;
    v36 = v39;
    goto LABEL_9;
  }
  v45 = CFSTR("Failed to parse cert common name from cert chain");
LABEL_17:
  handleForCategory(0);
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    sub_21456D260();

  if (a4)
  {
    v50 = (void *)MEMORY[0x24BDD1540];
    v56 = *MEMORY[0x24BDD0FC8];
    v57 = v45;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v49, (uint64_t)&v57, (uint64_t)&v56, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v50, v52, (uint64_t)CFSTR("com.apple.corerepair"), -42, v51);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }
  v43 = (__CFString *)v45;
LABEL_9:

  return (char)a4;
}

+ (BOOL)isDcSignedComponent:(int)a3 error:(id *)a4
{
  uint64_t v5;
  __CFString *v6;
  char isDataClassSupported;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  id v13;
  char isEqual;
  const char *v15;
  uint64_t v16;
  char isDcSignedCombinedDataClass_error;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v25;
  _QWORD v26[2];

  v5 = *(_QWORD *)&a3;
  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("SrvP");
  switch(a3)
  {
    case 1024:
      v6 = CFSTR("vcrt");
      if ((objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, (uint64_t)CFSTR("vcrt"), (uint64_t)a4) & 1) != 0)
        goto LABEL_15;
      v6 = CFSTR("bcrt");
      isDataClassSupported = objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, (uint64_t)CFSTR("bcrt"), (uint64_t)a4);
      goto LABEL_14;
    case 1025:
      v6 = CFSTR("tcrt");
      isDataClassSupported = objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, (uint64_t)CFSTR("tcrt"), (uint64_t)a4);
      goto LABEL_14;
    case 1026:
      v6 = CFSTR("CmCl");
      isDataClassSupported = objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, (uint64_t)CFSTR("CmCl"), (uint64_t)a4);
      goto LABEL_14;
    case 1027:
      v6 = CFSTR("psd2");
      if ((objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, (uint64_t)CFSTR("psd2"), (uint64_t)a4) & 1) != 0)
        goto LABEL_15;
      v6 = CFSTR("prpc");
      isDataClassSupported = objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, (uint64_t)CFSTR("prpc"), (uint64_t)a4);
LABEL_14:
      if ((isDataClassSupported & 1) != 0)
      {
LABEL_15:
        if (objc_msgSend_isEqualToString_(v6, a2, (uint64_t)CFSTR("CmCl"), (uint64_t)a4))
        {
          isDcSignedCombinedDataClass_error = objc_msgSend_isDcSignedCombinedDataClass_error_(CRFDRUtils, v15, (uint64_t)v6, (uint64_t)a4);
        }
        else
        {
          if (objc_msgSend_isEqualToString_(v6, v15, (uint64_t)CFSTR("SrvP"), v16))
          {
            objc_msgSend_isServicePartWithError_(CRFDRUtils, v18, (uint64_t)a4, v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v20;
            if (v20)
              isEqual = objc_msgSend_isEqual_(v20, v21, (uint64_t)CFSTR("0"), v22);
            else
              isEqual = 0;

            goto LABEL_24;
          }
          isDcSignedCombinedDataClass_error = objc_msgSend_isDcSignedDataClass_error_(CRFDRUtils, v18, (uint64_t)v6, (uint64_t)a4);
        }
        isEqual = isDcSignedCombinedDataClass_error;
LABEL_24:
        v13 = 0;
        goto LABEL_25;
      }
LABEL_10:
      v8 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("Component %d is not supported for authorized repair for this device"), (uint64_t)a4, v5, *MEMORY[0x24BDD0FC8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v9;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v10, (uint64_t)v26, (uint64_t)&v25, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v8, v12, (uint64_t)CFSTR("com.apple.corerepair"), -72, v11);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      isEqual = 0;
      if (a4 && v13)
      {
        v13 = objc_retainAutorelease(v13);
        isEqual = 0;
        *a4 = v13;
      }
LABEL_25:

      return isEqual;
    case 1028:
      v6 = CFSTR("hop0");
      isDataClassSupported = objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, (uint64_t)CFSTR("hop0"), (uint64_t)a4);
      goto LABEL_14;
    case 1029:
      goto LABEL_15;
    case 1030:
      v6 = CFSTR("bCfg");
      if (!objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, (uint64_t)CFSTR("bCfg"), (uint64_t)a4))goto LABEL_10;
      goto LABEL_15;
    case 1032:
      v6 = CFSTR("NBCl");
      isDataClassSupported = objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, (uint64_t)CFSTR("NBCl"), (uint64_t)a4);
      goto LABEL_14;
    default:
      goto LABEL_10;
  }
}

+ (id)isServicePartWithError:(id *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  NSObject *v35;
  const char *v36;
  void *v37;
  void *v38;
  const char *v39;
  id v40;
  uint8_t v42[16];
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  const __CFString *v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v46 = 0;
  v47 = 0;
  v44 = 0;
  v45 = 0;
  v43 = 0;
  v4 = (void *)objc_opt_new();
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  if (objc_msgSend_isEANSupported(v4, v5, v6, v7))
  {
    if ((objc_msgSend_readFDRDataFromEANWithDataClass_outData_stripPadding_(v4, v8, (uint64_t)CFSTR("seal"), (uint64_t)&v47, 1) & 1) != 0)
    {
      if (v47)
      {
        handleForCategory(0);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v42 = 0;
          _os_log_impl(&dword_214503000, v14, OS_LOG_TYPE_DEFAULT, "Local Sealing manifest fetch sucessful", v42, 2u);
        }

        v15 = AMFDRSealingManifestCopyDataClassesInstancesAndProperties();
        v12 = 0;
        v9 = v43;
        if (v15 && (v19 = v46) != 0 && v45)
        {
          v11 = 0;
          v10 = 0;
          if (v44)
          {
            v11 = v44;
            v12 = v45;
            v20 = objc_msgSend_count(v45, v16, v17, v18);
            if (v20 == objc_msgSend_count(v11, v21, v22, v23) && objc_msgSend_count(v19, v24, v25, v26))
            {
              objc_msgSend_objectForKeyedSubscript_(v19, v27, (uint64_t)CFSTR("SrvP"), v28);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = v19;
              goto LABEL_27;
            }
            v10 = v19;
          }
        }
        else
        {
          v11 = 0;
          v10 = 0;
        }
        handleForCategory(1uLL);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          sub_21456D2EC();

        if (!v9)
        {
          v37 = (void *)MEMORY[0x24BDD1540];
          v48 = *MEMORY[0x24BDD0FC8];
          v49 = CFSTR("DataInstances and Classes count mismatch");
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v36, (uint64_t)&v49, (uint64_t)&v48, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v37, v39, (uint64_t)CFSTR("com.apple.corerepair"), -28, v38);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_26;
      }
      handleForCategory(1uLL);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        sub_21456D2C0();

      v31 = (void *)MEMORY[0x24BDD1540];
      v50 = *MEMORY[0x24BDD0FC8];
      v51[0] = CFSTR("Local Sealing manifest fetch failed");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v32, (uint64_t)v51, (uint64_t)&v50, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v31, v34, (uint64_t)CFSTR("com.apple.corerepair"), -28, v33);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      handleForCategory(1uLL);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_21456D318();

      v9 = 0;
    }
    v10 = 0;
    v11 = 0;
    v12 = 0;
LABEL_26:
    v13 = 0;
  }
LABEL_27:
  if (a3)
    *a3 = objc_retainAutorelease(v9);
  v40 = v13;

  return v40;
}

+ (id)findUnsealedDataWithError:(id *)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  void *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  id v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  void *v41;
  id v42;
  uint8_t buf[4];
  id v44;
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  _QWORD v50[4];

  v50[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend__createFDRLocal(a1, a2, (uint64_t)a3, v3);
  objc_msgSend_set(MEMORY[0x24BDBCEF0], v6, v7, v8);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v9, v10, v11);
  v42 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isDataClassSupported_(CRFDRUtils, v12, (uint64_t)CFSTR("FSCl"), v13))
  {
    v17 = (void *)ZhuGeCopyValue();
    objc_msgSend_isEqualToString_(v17, v18, (uint64_t)CFSTR("ProvisionedUnknownKey"), v19);

  }
  objc_msgSend_getLocalSealingManifest(a1, v14, v15, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v24 = 0;
    if (AMFDRSealingManifestCopyDataClassesInstancesAndProperties())
    {
      v33 = (void *)MEMORY[0x24BDD1540];
      v45 = *MEMORY[0x24BDD0FC8];
      v46 = CFSTR("Number of data classes and instances mismatches");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v22, (uint64_t)&v46, (uint64_t)&v45, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v33, v34, (uint64_t)CFSTR("com.apple.corerepair"), -42, v24);
      v35 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = (void *)MEMORY[0x24BDD1540];
      v47 = *MEMORY[0x24BDD0FC8];
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v22, (uint64_t)CFSTR("Failed to decode sealing manifest: %@"), v23, 0);
      v28 = v21;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v29;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v30, (uint64_t)&v48, (uint64_t)&v47, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v27, v32, (uint64_t)CFSTR("com.apple.corerepair"), -28, v31);
      v35 = (id)objc_claimAutoreleasedReturnValue();

      v21 = v28;
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x24BDD1540];
    v49 = *MEMORY[0x24BDD0FC8];
    v50[0] = CFSTR("Failed to get local sealing manifest");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v20, (uint64_t)v50, (uint64_t)&v49, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v25, v26, (uint64_t)CFSTR("com.apple.corerepair"), -28, v24);
    v35 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v35)
  {
    handleForCategory(0);
    v36 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
      sub_21456D344(v35, v36, v37, v38);

    if (a3)
    {
      v35 = objc_retainAutorelease(v35);
      *a3 = v35;
    }
  }
  handleForCategory(0);
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v42;
    _os_log_impl(&dword_214503000, v39, OS_LOG_TYPE_DEFAULT, "Unsealed: %@", buf, 0xCu);
  }

  AMSupportSafeRelease();
  return v42;
}

+ (id)findUnsealedDataWithKey:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  NSObject *v49;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  void *v54;
  void *v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend_array(MEMORY[0x24BDBCE30], v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__createFDRLocal(a1, v10, v11, v12);
  if (objc_msgSend_containsObject_(&unk_24D1B8980, v13, (uint64_t)v5, v14))
  {
    v18 = (void *)AMFDRSealingMapCopyPropertyWithTag();
    if (v18)
    {
      objc_msgSend_localManifestProperties(a1, v15, v16, v17);
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)v5, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = (void *)MEMORY[0x24BDBCEF0];
        v56[0] = v18;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v22, (uint64_t)v56, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setWithArray_(v24, v26, (uint64_t)v25, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = (void *)MEMORY[0x24BDBCEF0];
        v55 = v23;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v30, (uint64_t)&v55, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setWithArray_(v29, v32, (uint64_t)v31, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
      handleForCategory(0);
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        sub_21456D3CC();

    }
    else
    {
      handleForCategory(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_21456D434();
    }
LABEL_22:

    v28 = 0;
    v34 = 0;
LABEL_23:

    goto LABEL_24;
  }
  v18 = (void *)AMFDRSealingMapCopyMultiInstanceForClass();
  if (!v18)
  {
    handleForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_21456D504();
    goto LABEL_22;
  }
  v19 = AMFDRSealingManifestCopyMultiInstanceForClass();
  if (!v19)
  {
    handleForCategory(0);
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      sub_21456D49C();

    goto LABEL_22;
  }
  objc_msgSend_setWithArray_(MEMORY[0x24BDBCEF0], v35, (uint64_t)v18, v36);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(MEMORY[0x24BDBCEF0], v37, (uint64_t)v19, v38);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  objc_msgSend_minusSet_(v28, v39, (uint64_t)v34, v40);
  if (objc_msgSend_count(v28, v41, v42, v43))
  {
    handleForCategory(0);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v52 = v5;
      v53 = 2112;
      v54 = v28;
      _os_log_impl(&dword_214503000, v44, OS_LOG_TYPE_DEFAULT, "Unsealed %@: %@", buf, 0x16u);
    }

    objc_msgSend_allObjects(v28, v45, v46, v47);
    v18 = v9;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
LABEL_24:

  return v9;
}

+ (BOOL)_isLegacyMesaDataClass:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  char isEqualToString;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("NvMR"), v5) & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("FSCl"), v7) & 1) != 0)
  {
    isEqualToString = 1;
  }
  else
  {
    isEqualToString = objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("hop0"), v9);
  }

  return isEqualToString;
}

+ (void)fixUpPseudoMSRk:(id)a3 missingLiveData:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27[2];
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!objc_msgSend_isDataClassSupported_(CRFDRUtils, v7, (uint64_t)CFSTR("FSCl"), v8))
    goto LABEL_15;
  if (objc_msgSend_containsObject_(v6, v9, (uint64_t)CFSTR("FSCl"), v10))
  {
    handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    LOWORD(v27[0]) = 0;
    v14 = "missing mesa SN";
  }
  else
  {
    objc_msgSend_objectForKey_(v5, v11, (uint64_t)CFSTR("FSCl"), v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_15;
    handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    LOWORD(v27[0]) = 0;
    v14 = "mesa unsealed";
  }
  _os_log_impl(&dword_214503000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)v27, 2u);
LABEL_9:

  v27[0] = 0;
  v16 = ZhuGeCopyValue();
  v18 = (void *)v16;
  if (!v16 || v27[0])
  {
    handleForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_21456D56C(v27, v19, v21, v22, v23, v24, v25, v26);
  }
  else
  {
    v28[0] = v16;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v17, (uint64_t)v28, 1);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v5, v20, (uint64_t)v19, (uint64_t)CFSTR("MSRk"));
  }

LABEL_15:
}

+ (BOOL)queryDeviceStagedSealedFromEAN:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  BOOL v12;
  NSObject *v13;
  char v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  void *v18;
  const char *v19;
  id v21;
  uint64_t v22;
  const __CFString *v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v5 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  v6 = (void *)objc_opt_new();
  v10 = v6;
  if (v5)
  {
    if ((objc_msgSend_isEANSupported(v6, v7, v8, v9) & 1) == 0)
    {
      handleForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_21456D68C();
      goto LABEL_25;
    }
    if (objc_msgSend_readFDRDataFromEANWithDataClass_outData_stripPadding_(v10, v11, (uint64_t)CFSTR("seal"), (uint64_t)&v21, 1))v12 = v21 == 0;
    else
      v12 = 1;
    if (v12)
    {
      handleForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_21456D660();
      goto LABEL_25;
    }
  }
  else
  {
    objc_msgSend_getLocalSealingManifest(CRFDRUtils, v7, v8, v9);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      handleForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_21456D660();
      goto LABEL_25;
    }
  }
  if (AMFDRCreateTypeWithOptions())
  {
    AMFDRSetOption();
    v14 = AMFDRDataCopySealingManifestProperty();
    handleForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    v13 = v15;
    if ((v14 & 1) != 0)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = 0;
        _os_log_impl(&dword_214503000, v13, OS_LOG_TYPE_DEFAULT, "SrvT: %@", buf, 0xCu);
      }

      goto LABEL_27;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_21456D634();
  }
  else
  {
    handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_21456D5DC();
  }
LABEL_25:

  if (a4)
  {
    v17 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BDD0FC8];
    v23 = CFSTR("Query staged state failed");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v16, (uint64_t)&v23, (uint64_t)&v22, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v17, v19, (uint64_t)CFSTR("com.apple.corerepair"), -42, v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_27:
  AMSupportSafeRelease();

  return 0;
}

+ (id)localManifestProperties
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;

  if (!objc_msgSend__createFDRLocal(a1, a2, v2, v3))
  {
    handleForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_21456D6B8();
    v4 = 0;
    goto LABEL_8;
  }
  v4 = (void *)AMFDRSealingMapCopyManifestProperties();
  if (!v4)
  {
    handleForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_21456D6E4();
LABEL_8:

  }
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v4;
}

+ (id)extractComponentsAndIdentifiers:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  BOOL v39;
  id v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  void *v55;
  id v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  uint64_t v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v56 = (id)objc_opt_new();
  v4 = objc_alloc(MEMORY[0x24BDD1798]);
  v6 = (void *)objc_msgSend_initWithPattern_options_error_(v4, v5, (uint64_t)CFSTR("([a-zA-Z0-9#]{4})-(.*$)"), 0, 0);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v7 = v3;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v58, (uint64_t)v64, 16);
  if (v9)
  {
    v13 = v9;
    v14 = *(_QWORD *)v59;
    v55 = v6;
    do
    {
      v15 = 0;
      v57 = v13;
      do
      {
        if (*(_QWORD *)v59 != v14)
          objc_enumerationMutation(v7);
        v16 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v15);
        v17 = objc_msgSend_length(v16, v10, v11, v12);
        objc_msgSend_firstMatchInString_options_range_(v6, v18, (uint64_t)v16, 0, 0, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        handleForCategory(0);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v24 = objc_msgSend_numberOfRanges(v19, v21, v22, v23);
          *(_DWORD *)buf = 134217984;
          v63 = v24;
          _os_log_impl(&dword_214503000, v20, OS_LOG_TYPE_DEFAULT, "number of ranges:%ld", buf, 0xCu);
        }

        if (v19 && (unint64_t)objc_msgSend_numberOfRanges(v19, v25, v26, v27) >= 2)
        {
          v30 = objc_msgSend_rangeAtIndex_(v19, v28, 1, v29);
          objc_msgSend_substringWithRange_(v16, v31, v30, (uint64_t)v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend_rangeAtIndex_(v19, v33, 2, v34);
          objc_msgSend_substringWithRange_(v16, v36, v35, (uint64_t)v36);
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = (void *)v37;
          if (v32)
            v39 = v37 == 0;
          else
            v39 = 1;
          if (!v39)
          {
            v40 = v32;
            v41 = (void *)objc_opt_new();
            objc_msgSend_objectForKeyedSubscript_(v56, v42, (uint64_t)v40, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObjectsFromArray_(v41, v45, (uint64_t)v44, v46);

            objc_msgSend_addObject_(v41, v47, (uint64_t)v38, v48);
            v52 = (void *)objc_msgSend_copy(v41, v49, v50, v51);
            objc_msgSend_setObject_forKeyedSubscript_(v56, v53, (uint64_t)v52, (uint64_t)v40);

            v6 = v55;
            v13 = v57;

          }
        }

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v58, (uint64_t)v64, 16);
    }
    while (v13);
  }

  return v56;
}

@end
