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
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (__AMFDR *)AMFDRCreateWithOptions();

  return v3;
}

+ (id)getLocalSealingManifest
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint8_t v6[16];
  void *v7;
  uint64_t v8;

  objc_msgSend(a1, "_createFDRLocal");
  v7 = 0;
  v8 = 0;
  sub_22AE246E8(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22AE1C000, v2, OS_LOG_TYPE_DEFAULT, "Getting local sealing manifest", v6, 2u);
  }

  if ((AMFDRSealingMapPopulateSealingManifest() & 1) != 0)
  {
    v3 = v7;
  }
  else
  {
    sub_22AE246E8(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_22AE25E14();

    v3 = 0;
  }
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v3;
}

+ (id)getStringFromCert:(id)a3 WithTag:(unint64_t)a4 AndOID:(id)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  __int128 v10;
  char v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  __int128 v19;
  unint64_t v20[3];
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24[2];
  $203840463D15D3E17BD93E376D41ABE6 v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v6 = a5;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v24[0] = 0;
  v24[1] = 0;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  memset(v20, 0, sizeof(v20));
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  while (!sub_22AE249DC((unint64_t *)&v25, v20))
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v20, "{?=Q{?=*Q}}");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

  }
  if (objc_msgSend(v7, "count"))
  {
    v11 = 0;
    *(_QWORD *)&v10 = 138412290;
    v19 = v10;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndex:", 0, v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "getValue:", &v21);
      v13 = objc_alloc(MEMORY[0x24BDBCE50]);
      v14 = (void *)objc_msgSend(v13, "initWithBytes:length:", v22, v23);
      if (v21 != a4 || (objc_msgSend(v6, "isEqual:", v14) & 1) == 0)
        break;
      v11 = 1;
LABEL_15:
      objc_msgSend(v7, "removeObjectAtIndex:", 0);

      if (!objc_msgSend(v7, "count"))
        goto LABEL_20;
    }
    if ((v11 & 1) != 0)
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v14, 4);
      objc_msgSend(v8, "addObject:", v15);
    }
    else
    {
      if (!sub_22AE249B0(&v22, v24))
      {
        while (!sub_22AE249DC(v24, v20))
        {
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v20, "{?=Q{?=*Q}}");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v16);

        }
        goto LABEL_14;
      }
      sub_22AE246E8(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v19;
        v27 = v14;
        _os_log_error_impl(&dword_22AE1C000, v15, OS_LOG_TYPE_ERROR, "Failed to parse node in cert chain data = %@", buf, 0xCu);
      }
    }

LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
LABEL_20:
  v17 = (void *)objc_msgSend(v8, "copy");

  return v17;
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

    sub_22AE246E8(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_22AE25E74();

    v11 = 0;
  }
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  return v11;
}

+ (id)getDataPayload:(id)a3 instance:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t Payload;
  void *v12;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a3;
  objc_msgSend(a1, "getData:instance:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    sub_22AE246E8(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_22AE25F3C();

    goto LABEL_14;
  }
  v9 = objc_retainAutorelease(v7);
  objc_msgSend(v9, "bytes");
  objc_msgSend(v9, "length");
  v10 = Img4DecodeInit();
  if ((_DWORD)v10)
  {
    v15 = v10;
    sub_22AE246E8(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_22AE26000(v15, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_13;
  }
  Payload = Img4DecodeGetPayload();
  if ((_DWORD)Payload)
  {
    v23 = Payload;
    sub_22AE246E8(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_22AE25F9C(v23, v16, v24, v25, v26, v27, v28, v29);
LABEL_13:

LABEL_14:
    v12 = 0;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  return v12;
}

+ (BOOL)isDataClassSupported:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  AMFDRSealingMapGetEntriesForDevice();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Tag"), (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v10, "isEqualToString:", v3) & 1) != 0)
          {

            v11 = 1;
            goto LABEL_14;
          }

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_14:

  return v11;
}

+ (id)_getManifestForDataClass:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v9;

  v4 = a3;
  objc_msgSend(a1, "_createFDRLocal");
  if (!v4)
  {
    sub_22AE246E8(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_22AE26064();
    goto LABEL_12;
  }
  v5 = AMFDRSealingManifestCopyInstanceForClass();
  if (!v5)
  {
    sub_22AE246E8(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_22AE26090();
LABEL_12:

    v6 = 0;
    goto LABEL_7;
  }
  v6 = (void *)v5;
  if ((AMFDRDataCopyManifest() & 1) == 0)
  {
    sub_22AE246E8(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_22AE260F0();

  }
LABEL_7:
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  return 0;
}

+ (BOOL)isDcSignedSealingManifest:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t inited;
  unint64_t *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  const __CFString *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  uint8_t buf[4];
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _OWORD v44[10];
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v45 = 0;
  memset(v44, 0, sizeof(v44));
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = 0;
  v21 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &unk_22AE26E15, 3);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF MATCHES %@"), CFSTR("FDR-SS-DC.*"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRFDRUtils getLocalSealingManifest](CRFDRUtils, "getLocalSealingManifest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    v12 = 0;
    v16 = CFSTR("Cannot copy sealing manifest from device");
    goto LABEL_16;
  }
  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "bytes");
  objc_msgSend(v8, "length");
  inited = Img4DecodeInitManifest();
  if ((_DWORD)inited)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to parse cert as img4; stat: %d"), inited);
LABEL_14:
    v16 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    if (!v16)
    {
      LOBYTE(a3) = 0;
      v12 = 0;
      goto LABEL_9;
    }
    v12 = 0;
    goto LABEL_16;
  }
  v10 = sub_22AE249B0((unint64_t *)v44 + 1, &v20);
  if ((_DWORD)v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to parse cert chain; stat: %d"), v10);
    goto LABEL_14;
  }
  +[CRFDRUtils getStringFromCert:WithTag:AndOID:](CRFDRUtils, "getStringFromCert:WithTag:AndOID:", v20, v21, 6, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && objc_msgSend(v11, "count"))
  {
    sub_22AE246E8(0);
    a3 = (id *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v12;
      _os_log_impl(&dword_22AE1C000, (os_log_t)a3, OS_LOG_TYPE_DEFAULT, "Parsed the following common names from cert in seal: %@", buf, 0xCu);
    }

    objc_msgSend(v12, "filteredArrayUsingPredicate:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    LOBYTE(a3) = objc_msgSend(v13, "count") != 0;
    v12 = v13;
    goto LABEL_9;
  }
  v16 = CFSTR("Failed to parse cert common name from cert chain");
LABEL_16:
  sub_22AE246E8(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    sub_22AE26150();

  if (a3)
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BDD0FC8];
    v23 = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corerepair"), -42, v19);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a3) = 0;
  }
  v14 = (__CFString *)v16;
LABEL_9:

  return (char)a3;
}

+ (BOOL)isDcSignedDataClass:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _OWORD v51[10];
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v52 = 0;
  memset(v51, 0, sizeof(v51));
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v25 = 0;
  v26 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &unk_22AE26E15, 3);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF MATCHES %@"), CFSTR("FDR-CA\\d{1,4}-ROOT-DC.*"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRFDRUtils getData:instance:](CRFDRUtils, "getData:instance:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot copy %@ data from device"), v5);
LABEL_15:
    v18 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    if (!v18)
    {
      LOBYTE(a4) = 0;
      v14 = 0;
      goto LABEL_9;
    }
    v14 = 0;
    goto LABEL_17;
  }
  v10 = objc_retainAutorelease(v8);
  objc_msgSend(v10, "bytes");
  objc_msgSend(v10, "length");
  v11 = Img4DecodeInit();
  if ((_DWORD)v11)
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    v24 = v11;
    v20 = CFSTR("Failed to parse cert as img4; stat: %d");
LABEL_14:
    objc_msgSend(v19, "stringWithFormat:", v20, v24);
    goto LABEL_15;
  }
  v12 = sub_22AE249B0((unint64_t *)v51 + 1, &v25);
  if ((_DWORD)v12)
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    v24 = (uint64_t)v12;
    v20 = CFSTR("Failed to parse cert chain; stat: %d");
    goto LABEL_14;
  }
  +[CRFDRUtils getStringFromCert:WithTag:AndOID:](CRFDRUtils, "getStringFromCert:WithTag:AndOID:", v25, v26, 6, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 && objc_msgSend(v13, "count"))
  {
    sub_22AE246E8(0);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v5;
      v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_22AE1C000, (os_log_t)a4, OS_LOG_TYPE_DEFAULT, "Parsed the following common names from cert in %@: %@", buf, 0x16u);
    }

    objc_msgSend(v14, "filteredArrayUsingPredicate:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0;
    LOBYTE(a4) = objc_msgSend(v15, "count") != 0;
    v14 = v15;
    goto LABEL_9;
  }
  v18 = CFSTR("Failed to parse cert common name from cert chain");
LABEL_17:
  sub_22AE246E8(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    sub_22AE26150();

  if (a4)
  {
    v22 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BDD0FC8];
    v28 = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corerepair"), -42, v23);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }
  v16 = (__CFString *)v18;
LABEL_9:

  return (char)a4;
}

+ (BOOL)isDcSignedCombinedDataClass:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t inited;
  unint64_t *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _OWORD v52[10];
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v53 = 0;
  memset(v52, 0, sizeof(v52));
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v26 = 0;
  v27 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &unk_22AE26E15, 3);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF MATCHES %@"), CFSTR("FDR-CA\\d{1,4}-ROOT-DC.*"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_getManifestForDataClass:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot copy %@ manifest from device"), v6);
LABEL_15:
    v19 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    if (!v19)
    {
      LOBYTE(a4) = 0;
      v15 = 0;
      goto LABEL_9;
    }
    v15 = 0;
    goto LABEL_17;
  }
  v11 = objc_retainAutorelease(v9);
  objc_msgSend(v11, "bytes");
  objc_msgSend(v11, "length");
  inited = Img4DecodeInitManifest();
  if ((_DWORD)inited)
  {
    v20 = (void *)MEMORY[0x24BDD17C8];
    v25 = inited;
    v21 = CFSTR("Failed to parse cert as img4; stat: %d");
LABEL_14:
    objc_msgSend(v20, "stringWithFormat:", v21, v25);
    goto LABEL_15;
  }
  v13 = sub_22AE249B0((unint64_t *)v52 + 1, &v26);
  if ((_DWORD)v13)
  {
    v20 = (void *)MEMORY[0x24BDD17C8];
    v25 = (uint64_t)v13;
    v21 = CFSTR("Failed to parse cert chain; stat: %d");
    goto LABEL_14;
  }
  +[CRFDRUtils getStringFromCert:WithTag:AndOID:](CRFDRUtils, "getStringFromCert:WithTag:AndOID:", v26, v27, 6, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14 && objc_msgSend(v14, "count"))
  {
    sub_22AE246E8(0);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v6;
      v32 = 2112;
      v33 = v15;
      _os_log_impl(&dword_22AE1C000, (os_log_t)a4, OS_LOG_TYPE_DEFAULT, "Parsed the following common names from cert in %@: %@", buf, 0x16u);
    }

    objc_msgSend(v15, "filteredArrayUsingPredicate:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0;
    LOBYTE(a4) = objc_msgSend(v16, "count") != 0;
    v15 = v16;
    goto LABEL_9;
  }
  v19 = CFSTR("Failed to parse cert common name from cert chain");
LABEL_17:
  sub_22AE246E8(0);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    sub_22AE26150();

  if (a4)
  {
    v23 = (void *)MEMORY[0x24BDD1540];
    v28 = *MEMORY[0x24BDD0FC8];
    v29 = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corerepair"), -42, v24);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }
  v17 = (__CFString *)v19;
LABEL_9:

  return (char)a4;
}

+ (BOOL)isDcSignedComponent:(int)a3 error:(id *)a4
{
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v5 = *(_QWORD *)&a3;
  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("SrvP");
  switch(a3)
  {
    case 1024:
      v6 = CFSTR("vcrt");
      if (+[CRFDRUtils isDataClassSupported:](CRFDRUtils, "isDataClassSupported:", CFSTR("vcrt")))
        goto LABEL_15;
      v6 = CFSTR("bcrt");
      goto LABEL_14;
    case 1025:
      v6 = CFSTR("tcrt");
      goto LABEL_14;
    case 1026:
      v6 = CFSTR("CmCl");
      goto LABEL_14;
    case 1027:
      v6 = CFSTR("psd2");
      if (+[CRFDRUtils isDataClassSupported:](CRFDRUtils, "isDataClassSupported:", CFSTR("psd2")))
        goto LABEL_15;
      v6 = CFSTR("prpc");
LABEL_14:
      if (+[CRFDRUtils isDataClassSupported:](CRFDRUtils, "isDataClassSupported:", v6))
      {
LABEL_15:
        if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("CmCl")))
        {
          v12 = +[CRFDRUtils isDcSignedCombinedDataClass:error:](CRFDRUtils, "isDcSignedCombinedDataClass:error:", v6, a4);
        }
        else
        {
          if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("SrvP")))
          {
            +[CRFDRUtils isServicePartWithError:](CRFDRUtils, "isServicePartWithError:", a4);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (v13)
              v11 = objc_msgSend(v13, "isEqual:", CFSTR("0"));
            else
              v11 = 0;

            goto LABEL_24;
          }
          v12 = +[CRFDRUtils isDcSignedDataClass:error:](CRFDRUtils, "isDcSignedDataClass:error:", v6, a4);
        }
        v11 = v12;
LABEL_24:
        v10 = 0;
        goto LABEL_25;
      }
LABEL_10:
      v7 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Component %d is not supported for authorized repair for this device"), v5, *MEMORY[0x24BDD0FC8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corerepair"), -72, v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v11 = 0;
      if (a4 && v10)
      {
        v10 = objc_retainAutorelease(v10);
        v11 = 0;
        *a4 = v10;
      }
LABEL_25:

      return v11;
    case 1028:
      v6 = CFSTR("hop0");
      goto LABEL_14;
    case 1029:
      goto LABEL_15;
    case 1030:
      v6 = CFSTR("bCfg");
      if (!+[CRFDRUtils isDataClassSupported:](CRFDRUtils, "isDataClassSupported:", CFSTR("bCfg")))
        goto LABEL_10;
      goto LABEL_15;
    case 1032:
      v6 = CFSTR("NBCl");
      goto LABEL_14;
    default:
      goto LABEL_10;
  }
}

+ (id)isServicePartWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t v23[16];
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v27 = 0;
  v28 = 0;
  v25 = 0;
  v26 = 0;
  v24 = 0;
  v4 = (void *)objc_opt_new();
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  if (objc_msgSend(v4, "isEANSupported"))
  {
    if ((objc_msgSend(v4, "readFDRDataFromEANWithDataClass:outData:stripPadding:", CFSTR("seal"), &v28, 1) & 1) != 0)
    {
      if (v28)
      {
        sub_22AE246E8(0);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_22AE1C000, v10, OS_LOG_TYPE_DEFAULT, "Local Sealing manifest fetch sucessful", v23, 2u);
        }

        v11 = AMFDRSealingManifestCopyDataClassesInstancesAndProperties();
        v8 = 0;
        v5 = v24;
        if (v11 && (v12 = v27) != 0 && v26)
        {
          v7 = 0;
          v6 = 0;
          if (v25)
          {
            v7 = v25;
            v8 = v26;
            v13 = objc_msgSend(v26, "count");
            if (v13 == objc_msgSend(v7, "count") && objc_msgSend(v12, "count"))
            {
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("SrvP"));
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v6 = v12;
              goto LABEL_27;
            }
            v6 = v12;
          }
        }
        else
        {
          v7 = 0;
          v6 = 0;
        }
        sub_22AE246E8(1uLL);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_22AE261DC();

        if (!v5)
        {
          v19 = (void *)MEMORY[0x24BDD1540];
          v29 = *MEMORY[0x24BDD0FC8];
          v30 = CFSTR("DataInstances and Classes count mismatch");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corerepair"), -28, v20);
          v5 = (void *)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_26;
      }
      sub_22AE246E8(1uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_22AE261B0();

      v16 = (void *)MEMORY[0x24BDD1540];
      v31 = *MEMORY[0x24BDD0FC8];
      v32[0] = CFSTR("Local Sealing manifest fetch failed");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corerepair"), -28, v17);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      sub_22AE246E8(1uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_22AE26208();

      v5 = 0;
    }
    v6 = 0;
    v7 = 0;
    v8 = 0;
LABEL_26:
    v9 = 0;
  }
LABEL_27:
  if (a3)
    *a3 = objc_retainAutorelease(v5);
  v21 = v9;

  return v21;
}

+ (id)findUnsealedDataWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[4];

  v27[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_createFDRLocal");
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (+[CRFDRUtils isDataClassSupported:](CRFDRUtils, "isDataClassSupported:", CFSTR("FSCl")))
  {
    v5 = (void *)ZhuGeCopyValue();
    objc_msgSend(v5, "isEqualToString:", CFSTR("ProvisionedUnknownKey"));

  }
  objc_msgSend(a1, "getLocalSealingManifest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = 0;
    if (AMFDRSealingManifestCopyDataClassesInstancesAndProperties())
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v22 = *MEMORY[0x24BDD0FC8];
      v23 = CFSTR("Number of data classes and instances mismatches");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corerepair"), -42, v7);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      v24 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to decode sealing manifest: %@"), 0);
      v10 = v6;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corerepair"), -28, v12);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      v6 = v10;
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD0FC8];
    v27[0] = CFSTR("Failed to get local sealing manifest");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corerepair"), -28, v7);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v14)
  {
    sub_22AE246E8(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_22AE26234(v14, v15);

    if (a3)
    {
      v14 = objc_retainAutorelease(v14);
      *a3 = v14;
    }
  }
  sub_22AE246E8(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v19;
    _os_log_impl(&dword_22AE1C000, v16, OS_LOG_TYPE_DEFAULT, "Unsealed: %@", buf, 0xCu);
  }

  AMSupportSafeRelease();
  return v19;
}

+ (id)findUnsealedDataWithKey:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_createFDRLocal");
  if (objc_msgSend(&unk_24F535DF8, "containsObject:", v5))
  {
    v7 = (void *)AMFDRSealingMapCopyPropertyWithTag();
    if (v7)
    {
      objc_msgSend(a1, "localManifestProperties");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)MEMORY[0x24BDBCEF0];
        v25[0] = v7;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setWithArray:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x24BDBCEF0];
        v24 = v9;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setWithArray:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
      sub_22AE246E8(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_22AE262BC();

    }
    else
    {
      sub_22AE246E8(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_22AE26324();
    }
LABEL_22:

    v12 = 0;
    v15 = 0;
LABEL_23:

    goto LABEL_24;
  }
  v7 = (void *)AMFDRSealingMapCopyMultiInstanceForClass();
  if (!v7)
  {
    sub_22AE246E8(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_22AE263F4();
    goto LABEL_22;
  }
  v8 = AMFDRSealingManifestCopyMultiInstanceForClass();
  if (!v8)
  {
    sub_22AE246E8(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_22AE2638C();

    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  objc_msgSend(v12, "minusSet:", v15);
  if (objc_msgSend(v12, "count"))
  {
    sub_22AE246E8(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v5;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_22AE1C000, v16, OS_LOG_TYPE_DEFAULT, "Unsealed %@: %@", buf, 0x16u);
    }

    objc_msgSend(v12, "allObjects");
    v7 = v6;
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
LABEL_24:

  return v6;
}

+ (BOOL)_isLegacyMesaDataClass:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NvMR")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("FSCl")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("hop0"));
  }

  return v4;
}

+ (void)fixUpPseudoMSRk:(id)a3 missingLiveData:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19[2];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!+[CRFDRUtils isDataClassSupported:](CRFDRUtils, "isDataClassSupported:", CFSTR("FSCl")))
    goto LABEL_15;
  if (objc_msgSend(v6, "containsObject:", CFSTR("FSCl")))
  {
    sub_22AE246E8(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    LOWORD(v19[0]) = 0;
    v8 = "missing mesa SN";
  }
  else
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("FSCl"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_15;
    sub_22AE246E8(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    LOWORD(v19[0]) = 0;
    v8 = "mesa unsealed";
  }
  _os_log_impl(&dword_22AE1C000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)v19, 2u);
LABEL_9:

  v19[0] = 0;
  v10 = ZhuGeCopyValue();
  v11 = (void *)v10;
  if (!v10 || v19[0])
  {
    sub_22AE246E8(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_22AE2645C(v19, v12, v13, v14, v15, v16, v17, v18);
  }
  else
  {
    v20[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("MSRk"));
  }

LABEL_15:
}

+ (BOOL)queryDeviceStagedSealedFromEAN:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  char v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v5 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v6 = (void *)objc_opt_new();
  v7 = v6;
  if (v5)
  {
    if ((objc_msgSend(v6, "isEANSupported") & 1) == 0)
    {
      sub_22AE246E8(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_22AE2657C();
      goto LABEL_25;
    }
    if (objc_msgSend(v7, "readFDRDataFromEANWithDataClass:outData:stripPadding:", CFSTR("seal"), &v15, 1))v8 = v15 == 0;
    else
      v8 = 1;
    if (v8)
    {
      sub_22AE246E8(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_22AE26550();
      goto LABEL_25;
    }
  }
  else
  {
    +[CRFDRUtils getLocalSealingManifest](CRFDRUtils, "getLocalSealingManifest");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      sub_22AE246E8(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_22AE26550();
      goto LABEL_25;
    }
  }
  if (AMFDRCreateTypeWithOptions())
  {
    AMFDRSetOption();
    v10 = AMFDRDataCopySealingManifestProperty();
    sub_22AE246E8(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v9 = v11;
    if ((v10 & 1) != 0)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = 0;
        _os_log_impl(&dword_22AE1C000, v9, OS_LOG_TYPE_DEFAULT, "SrvT: %@", buf, 0xCu);
      }

      goto LABEL_27;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_22AE26524();
  }
  else
  {
    sub_22AE246E8(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_22AE264CC();
  }
LABEL_25:

  if (a4)
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD0FC8];
    v17 = CFSTR("Query staged state failed");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corerepair"), -42, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_27:
  AMSupportSafeRelease();

  return 0;
}

+ (id)localManifestProperties
{
  void *v2;
  NSObject *v3;

  if (!objc_msgSend(a1, "_createFDRLocal"))
  {
    sub_22AE246E8(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_22AE265A8();
    v2 = 0;
    goto LABEL_8;
  }
  v2 = (void *)AMFDRSealingMapCopyManifestProperties();
  if (!v2)
  {
    sub_22AE246E8(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_22AE265D4();
LABEL_8:

  }
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v2;
}

+ (id)extractComponentsAndIdentifiers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v28 = (id)objc_opt_new();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("([a-zA-Z0-9#]{4})-(.*$)"), 0, 0);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    v27 = v4;
    do
    {
      v9 = 0;
      v29 = v7;
      do
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v9);
        objc_msgSend(v4, "firstMatchInString:options:range:", v10, 0, 0, objc_msgSend(v10, "length"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        sub_22AE246E8(0);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = objc_msgSend(v11, "numberOfRanges");
          *(_DWORD *)buf = 134217984;
          v35 = v13;
          _os_log_impl(&dword_22AE1C000, v12, OS_LOG_TYPE_DEFAULT, "number of ranges:%ld", buf, 0xCu);
        }

        if (v11 && (unint64_t)objc_msgSend(v11, "numberOfRanges") >= 2)
        {
          v14 = objc_msgSend(v11, "rangeAtIndex:", 1);
          objc_msgSend(v10, "substringWithRange:", v14, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v11, "rangeAtIndex:", 2);
          objc_msgSend(v10, "substringWithRange:", v17, v18);
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v19;
          if (v16)
            v21 = v19 == 0;
          else
            v21 = 1;
          if (!v21)
          {
            v22 = v16;
            v23 = (void *)objc_opt_new();
            objc_msgSend(v28, "objectForKeyedSubscript:", v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObjectsFromArray:", v24);

            objc_msgSend(v23, "addObject:", v20);
            v25 = (void *)objc_msgSend(v23, "copy");
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v25, v22);

            v4 = v27;
            v7 = v29;

          }
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v7);
  }

  return v28;
}

@end
