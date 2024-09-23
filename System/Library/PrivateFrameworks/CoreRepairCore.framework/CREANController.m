@implementation CREANController

- (BOOL)isEANSupported
{
  io_registry_entry_t v2;
  io_object_t v3;
  CFTypeRef CFProperty;
  BOOL v5;
  NSObject *v6;

  v2 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B18], "IODeviceTree:/defaults");
  if (v2)
  {
    v3 = v2;
    CFProperty = IORegistryEntryCreateCFProperty(v2, CFSTR("ean-storage-present"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    v5 = CFProperty != 0;
    if (CFProperty)
      CFRelease(CFProperty);
    IOObjectRelease(v3);
  }
  else
  {
    handleForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_2145697FC();

    return 0;
  }
  return v5;
}

- (BOOL)writeFDRDataToEANWithdataDir:(id)a3
{
  const __CFString *v4;
  const __CFAllocator *v5;
  CFURLRef v6;
  __CFDictionary *Mutable;
  const void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  const __CFData *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  const __CFData *v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  const __CFData *LocalMultiDataBlobForClass;
  NSObject *v29;
  CFIndex Length;
  void *v31;
  NSObject *v32;
  const char *v33;
  const char *v34;
  NSObject *v35;
  const char *v36;
  char FDRDataFromEANWithDataClass_outData_stripPadding;
  const char *v38;
  uint64_t v39;
  char v40;
  NSObject *v41;
  NSObject *v42;
  const char *v43;
  uint32_t v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  BOOL v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v54;
  void *v55;
  __CFString *v56;
  void *v57;
  id obj;
  _QWORD v59[6];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  char v67;
  id v68;
  void *v69;
  uint8_t buf[4];
  const __CFData *v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v4 = (const __CFString *)a3;
  v68 = 0;
  v69 = 0;
  v57 = (void *)objc_opt_new();
  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 0;
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v56 = (__CFString *)v4;
  v6 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x24BDBD240], v4, kCFURLPOSIXPathStyle, 1u);
  Mutable = CFDictionaryCreateMutable(v5, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v8 = (const void *)*MEMORY[0x24BDBD268];
  CFDictionarySetValue(Mutable, CFSTR("GetCombined"), (const void *)*MEMORY[0x24BDBD268]);
  CFDictionarySetValue(Mutable, CFSTR("StripImg4"), v8);
  CFDictionarySetValue(Mutable, CFSTR("VerifyData"), v8);
  CFDictionarySetValue(Mutable, CFSTR("DataDirectory"), v6);
  objc_msgSend__getDataClassesToWrite(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  if (!v12 || !objc_msgSend_count(v12, v13, v14, v15))
  {
    v49 = v16;
    handleForCategory(0);
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      sub_214569828();

    v19 = 0;
LABEL_55:
    v50 = 0;
    goto LABEL_60;
  }
  v55 = v16;
  handleForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v71 = (const __CFData *)v16;
    _os_log_impl(&dword_214503000, v17, OS_LOG_TYPE_DEFAULT, "Writing Following FDR Data Classes to EAN: %@", buf, 0xCu);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v16;
  v19 = 0;
  v20 = 0;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v60, (uint64_t)v74, 16);
  if (!v21)
    goto LABEL_47;
  v22 = *(_QWORD *)v61;
  while (2)
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v61 != v22)
        objc_enumerationMutation(obj);
      v24 = *(const __CFData **)(*((_QWORD *)&v60 + 1) + 8 * i);
      if (v20)
        CFRelease(v20);
      handleForCategory(0);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v71 = v24;
        _os_log_impl(&dword_214503000, v25, OS_LOG_TYPE_DEFAULT, "Copying data class: %@ to memory cache", buf, 0xCu);
      }

      if (objc_msgSend_isEqualToString_(v24, v26, (uint64_t)CFSTR("seal"), v27))
      {
        LocalMultiDataBlobForClass = (const __CFData *)AMFDRSealingMapCopyLocalDataForClass();
      }
      else if (AMFDRSealingMapEntryHasAttribute())
      {
        handleForCategory(0);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v71 = v24;
          _os_log_impl(&dword_214503000, v29, OS_LOG_TYPE_DEFAULT, "Copying multi data: %@", buf, 0xCu);
        }

        LocalMultiDataBlobForClass = (const __CFData *)AMFDRSealingMapCreateLocalMultiDataBlobForClass();
      }
      else
      {
        LocalMultiDataBlobForClass = (const __CFData *)AMFDRSealingManifestCopyLocalDataForClass();
      }
      v20 = LocalMultiDataBlobForClass;
      if (!LocalMultiDataBlobForClass || !CFDataGetLength(LocalMultiDataBlobForClass))
      {
        v31 = v69;
LABEL_29:
        if (v31)
        {

          v69 = 0;
        }
        else
        {
          v31 = v19;
        }
        handleForCategory(0);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v71 = v24;
          v72 = 2112;
          v73 = v31;
          _os_log_impl(&dword_214503000, v35, OS_LOG_TYPE_DEFAULT, "Failed to read FDR data instance for: %@ with error %@", buf, 0x16u);
        }

        FDRDataFromEANWithDataClass_outData_stripPadding = objc_msgSend_readFDRDataFromEANWithDataClass_outData_stripPadding_(self, v36, (uint64_t)v24, (uint64_t)&v68, 0);
        if (v68)
          v40 = FDRDataFromEANWithDataClass_outData_stripPadding;
        else
          v40 = 0;
        if ((v40 & 1) != 0)
        {
          if ((objc_msgSend_deleteFDRDataFromEANWithDataClass_(self, v38, (uint64_t)v24, v39) & 1) == 0)
          {
            handleForCategory(0);
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
              sub_214569880();

            v50 = 0;
            v19 = v31;
            goto LABEL_59;
          }
          handleForCategory(0);
          v41 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            goto LABEL_44;
          *(_DWORD *)buf = 138412290;
          v71 = v24;
          v42 = v41;
          v43 = "Successfully deleted %@ from EAN";
          v44 = 12;
        }
        else
        {
          handleForCategory(0);
          v41 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
LABEL_44:

            v19 = v31;
            continue;
          }
          *(_WORD *)buf = 0;
          v42 = v41;
          v43 = "Data class already absent from EAN";
          v44 = 2;
        }
        _os_log_impl(&dword_214503000, v42, OS_LOG_TYPE_DEFAULT, v43, buf, v44);
        goto LABEL_44;
      }
      Length = CFDataGetLength(v20);
      v31 = v69;
      if (Length > 10000000 || v69)
        goto LABEL_29;
      handleForCategory(0);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v71 = v20;
        _os_log_impl(&dword_214503000, v32, OS_LOG_TYPE_DEFAULT, "Got instance data %@", buf, 0xCu);
      }

      objc_msgSend_setObject_forKeyedSubscript_(v57, v33, (uint64_t)v20, (uint64_t)v24);
    }
    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v60, (uint64_t)v74, 16);
    if (v21)
      continue;
    break;
  }
LABEL_47:

  handleForCategory(0);
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v45, OS_LOG_TYPE_DEFAULT, "Write data classes from memory cache to EAN", buf, 2u);
  }

  v59[0] = MEMORY[0x24BDAC760];
  v59[1] = 3221225472;
  v59[2] = sub_214520008;
  v59[3] = &unk_24D1AA2A0;
  v59[4] = self;
  v59[5] = &v64;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v57, v46, (uint64_t)v59, v47);
  v49 = v55;
  if (*((_BYTE *)v65 + 24))
    goto LABEL_55;
  if ((objc_msgSend_verifyFDRDataFromEANUsingCache_cachedData_(self, v48, 1, (uint64_t)v57) & 1) != 0)
  {
    v50 = 1;
  }
  else
  {
    handleForCategory(0);
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      sub_214569854();

    v50 = 0;
LABEL_59:
    v49 = v55;
  }
LABEL_60:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  _Block_object_dispose(&v64, 8);
  return v50;
}

- (BOOL)_writeDataToEAN:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int QuerykeyFromDataClass;
  unsigned int v38;
  mach_port_t v39;
  const __CFDictionary *v40;
  io_service_t MatchingService;
  io_object_t v42;
  NSObject *v43;
  kern_return_t v44;
  NSObject *v45;
  NSObject *v46;
  BOOL v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint32_t outputCnt;
  uint64_t output;
  io_connect_t connect;
  uint8_t buf[4];
  _BYTE v67[10];
  __int16 v68;
  unsigned int v69;
  __int16 v70;
  unsigned int v71;
  __int16 v72;
  uint64_t v73;
  uint64_t input;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  connect = 0;
  v7 = a3;
  v11 = objc_msgSend_length(v7, v8, v9, v10);
  v12 = -(int)v11 & 0xFFFLL;
  input = 0;
  v75 = 0;
  v76 = 0;
  output = 0;
  outputCnt = 1;
  v13 = v12 + v11;
  objc_msgSend_dataWithLength_(MEMORY[0x24BDBCEC8], v14, v12 + v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setData_(v16, v17, (uint64_t)v7, v18);

  v19 = malloc_type_malloc(v12, 0x702650DCuLL);
  v20 = (uint64_t)v19;
  if (!v19)
  {
    handleForCategory(0);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      sub_214569940();
    goto LABEL_15;
  }
  bzero(v19, v12);
  objc_msgSend_appendBytes_length_(v16, v21, v20, v12);
  if (objc_msgSend_length(v16, v22, v23, v24) != v13)
  {
    handleForCategory(0);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      sub_214569B40();
    goto LABEL_15;
  }
  v28 = objc_msgSend_length(v16, v25, v26, v27);
  v29 = objc_retainAutorelease(v16);
  v33 = objc_msgSend_bytes(v29, v30, v31, v32);
  if ((v28 & 0xFFF) != 0)
  {
    handleForCategory(0);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      sub_214569AD4(v46, v49, v50, v51, v52, v53, v54, v55);
    goto LABEL_15;
  }
  v36 = v33;
  QuerykeyFromDataClass = objc_msgSend__getQuerykeyFromDataClass_(self, v34, (uint64_t)v6, v35);
  if (!QuerykeyFromDataClass)
  {
    handleForCategory(0);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      sub_21456996C();
    goto LABEL_15;
  }
  v38 = QuerykeyFromDataClass;
  v39 = *MEMORY[0x24BDD8B18];
  v40 = IOServiceMatching("AppleNVMeEAN");
  MatchingService = IOServiceGetMatchingService(v39, v40);
  if (!MatchingService)
  {
    handleForCategory(0);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      sub_214569998(v46, v56, v57, v58, v59, v60, v61, v62);
LABEL_15:
    v42 = 0;
LABEL_16:
    v47 = 0;
    goto LABEL_17;
  }
  v42 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, &connect))
  {
    handleForCategory(0);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      sub_214569A68();
    goto LABEL_16;
  }
  input = v38;
  v75 = v36;
  v76 = v28;
  handleForCategory(0);
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)v67 = HIBYTE(v38);
    *(_WORD *)&v67[4] = 1024;
    *(_DWORD *)&v67[6] = HIWORD(v38);
    v68 = 1024;
    v69 = v38 >> 8;
    v70 = 1024;
    v71 = v38;
    v72 = 2048;
    v73 = v28;
    _os_log_impl(&dword_214503000, v43, OS_LOG_TYPE_DEFAULT, "Writing EAN key %c%c%c%c, imageSize=%llu", buf, 0x24u);
  }

  v44 = IOConnectCallMethod(connect, 2u, &input, 3u, 0, 0, &output, &outputCnt, 0, 0);
  handleForCategory(0);
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = v45;
  if (v44)
  {
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      sub_214569A08();
    goto LABEL_16;
  }
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v67 = v6;
    _os_log_impl(&dword_214503000, v46, OS_LOG_TYPE_DEFAULT, "Successfully written %@ data to EAN", buf, 0xCu);
  }
  v47 = 1;
LABEL_17:

  if (connect)
  {
    IOServiceClose(connect);
    connect = 0;
  }
  if (v42)
    IOObjectRelease(v42);
  AMSupportSafeFree();

  return v47;
}

- (id)_getDataClassesToWrite
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  io_registry_entry_t v7;
  io_object_t v8;
  const __CFData *CFProperty;
  const __CFData *v10;
  CFIndex Length;
  const UInt8 *BytePtr;
  char *v13;
  void *v14;
  CFIndex v15;
  char v16;
  id v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  int v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (!objc_msgSend_isEANSupported(self, v4, v5, v6))
  {
LABEL_18:
    v19 = 0;
    goto LABEL_19;
  }
  v7 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B18], "IODeviceTree:/chosen");
  if (!v7)
  {
    handleForCategory(0);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_214569B6C();

    goto LABEL_18;
  }
  v8 = v7;
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v7, CFSTR("syscfg-erly-kbgs-data-class"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (!CFProperty)
  {
    handleForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_214569B98();

    IOObjectRelease(v8);
    goto LABEL_18;
  }
  v10 = CFProperty;
  Length = CFDataGetLength(CFProperty);
  BytePtr = CFDataGetBytePtr(v10);
  v13 = (char *)malloc_type_malloc(Length, 0x100004077774924uLL);
  if (v13)
  {
    v14 = v13;
    if (Length >= 1)
    {
      v15 = Length;
      do
      {
        v16 = *BytePtr++;
        v13[--v15] = v16;
      }
      while (v15);
    }
    v17 = objc_alloc(MEMORY[0x24BDD17C8]);
    v19 = (void *)objc_msgSend_initWithBytes_length_encoding_(v17, v18, (uint64_t)v14, Length, 4);
    if ((objc_msgSend_length(v19, v20, v21, v22) & 3) != 0)
    {
      handleForCategory(0);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v46 = 138412290;
        v47 = v19;
        _os_log_impl(&dword_214503000, v26, OS_LOG_TYPE_DEFAULT, "earlyKBGSDataClass %@ length is not multiple of 4", (uint8_t *)&v46, 0xCu);
      }

    }
    else
    {
      if (objc_msgSend_length(v19, v23, v24, v25))
      {
        v33 = 0;
        do
        {
          objc_msgSend_substringWithRange_(v19, v31, v33, 4);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_isDataClassSupported_(CRFDRUtils, v35, (uint64_t)v34, v36))
            objc_msgSend_addObject_(v3, v37, (uint64_t)v34, v38);

          v33 += 4;
        }
        while (objc_msgSend_length(v19, v39, v40, v41) > v33);
      }
      if ((objc_msgSend_containsObject_(v3, v31, (uint64_t)CFSTR("seal"), v32) & 1) == 0
        && objc_msgSend_isDataClassSupported_(CRFDRUtils, v42, (uint64_t)CFSTR("seal"), v43))
      {
        objc_msgSend_addObject_(v3, v44, (uint64_t)CFSTR("seal"), v45);
      }
    }
  }
  else
  {
    handleForCategory(0);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_214569BC4();

    v14 = 0;
    v19 = 0;
  }
  IOObjectRelease(v8);
  CFRelease(v10);
  if (v14)
    free(v14);
LABEL_19:

  return v3;
}

- (BOOL)readFDRDataFromEANWithDataClass:(id)a3 outData:(id *)a4 stripPadding:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  unsigned int QuerykeyFromDataClass;
  unsigned int v17;
  uint64_t v18;
  mach_port_t v19;
  const __CFDictionary *v20;
  io_service_t MatchingService;
  io_object_t v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  BOOL v26;
  void *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  const char *v46;
  void *v47;
  id v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  unint64_t v58;
  uint32_t outputCnt;
  uint64_t output;
  io_connect_t connect;
  uint64_t v62[3];
  uint8_t buf[4];
  _BYTE v64[10];
  uint64_t v65;
  unsigned int v66;
  __int16 v67;
  uint64_t v68;
  uint64_t input[2];

  v5 = a5;
  input[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v12 = v8;
  connect = 0;
  output = 0;
  outputCnt = 1;
  if (!v8 || (v13 = objc_msgSend_length(v8, v9, v10, v11), !a4) || !v13)
  {
    handleForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_214569BF0();
    goto LABEL_12;
  }
  QuerykeyFromDataClass = objc_msgSend__getQuerykeyFromDataClass_(self, v14, (uint64_t)v12, v15);
  if (!QuerykeyFromDataClass)
  {
    handleForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_21456996C();
    goto LABEL_12;
  }
  v17 = QuerykeyFromDataClass;
  v18 = QuerykeyFromDataClass;
  input[0] = QuerykeyFromDataClass;
  v19 = *MEMORY[0x24BDD8B18];
  v20 = IOServiceMatching("AppleNVMeEAN");
  MatchingService = IOServiceGetMatchingService(v19, v20);
  if (!MatchingService)
  {
    handleForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_214569998(v25, v50, v51, v52, v53, v54, v55, v56);
LABEL_12:
    v22 = 0;
LABEL_13:
    v26 = 0;
    goto LABEL_14;
  }
  v22 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, &connect))
  {
    handleForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_214569A68();
    goto LABEL_13;
  }
  if (IOConnectCallScalarMethod(connect, 3u, input, 1u, &output, &outputCnt))
  {
    handleForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_214569CD4();
    goto LABEL_13;
  }
  objc_msgSend_dataWithLength_(MEMORY[0x24BDBCEC8], v23, output, v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  handleForCategory(0);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)v64 = HIBYTE(v17);
    *(_WORD *)&v64[4] = 1024;
    *(_DWORD *)&v64[6] = HIWORD(v17);
    LOWORD(v65) = 1024;
    *(_DWORD *)((char *)&v65 + 2) = v17 >> 8;
    HIWORD(v65) = 1024;
    v66 = v17;
    v67 = 2048;
    v68 = output;
    _os_log_impl(&dword_214503000, v29, OS_LOG_TYPE_DEFAULT, "Reading EAN key %c%c%c%c, imageSize=%llu", buf, 0x24u);
  }

  v62[0] = v18;
  v25 = objc_retainAutorelease(v28);
  v62[1] = objc_msgSend_mutableBytes(v25, v30, v31, v32);
  v62[2] = output;
  if (IOConnectCallScalarMethod(connect, 4u, v62, 3u, 0, 0))
  {
    handleForCategory(0);
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      sub_214569C74();
    goto LABEL_45;
  }
  if (!v5)
  {
    v47 = (void *)objc_msgSend_copy(v25, v33, v34, v35);
    goto LABEL_32;
  }
  v58 = 0;
  v36 = objc_msgSend_calculateDerLength_actualSize_(self, v33, (uint64_t)v25, (uint64_t)&v58);
  handleForCategory(0);
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v41 = objc_msgSend_length(v25, v38, v39, v40);
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v64 = v41;
    *(_WORD *)&v64[8] = 2048;
    v65 = v58;
    _os_log_impl(&dword_214503000, v37, OS_LOG_TYPE_DEFAULT, "Image size: %ld DER size: %ld", buf, 0x16u);
  }

  if ((v36 & 1) == 0)
  {
    handleForCategory(0);
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      sub_214569C48();
    goto LABEL_45;
  }
  v45 = v58;
  if (!v58 || v45 > objc_msgSend_length(v25, v42, v43, v44))
  {
    handleForCategory(0);
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      sub_214569C1C();
LABEL_45:

    goto LABEL_13;
  }
  objc_msgSend_subdataWithRange_(v25, v46, 0, v58);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:
  v48 = *a4;
  *a4 = v47;

  handleForCategory(0);
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v64 = v12;
    _os_log_impl(&dword_214503000, v49, OS_LOG_TYPE_DEFAULT, "Successfully read %@ from EAN", buf, 0xCu);
  }

  v26 = 1;
LABEL_14:

  if (connect)
  {
    IOServiceClose(connect);
    connect = 0;
  }
  if (v22)
    IOObjectRelease(v22);

  return v26;
}

- (unsigned)_getQuerykeyFromDataClass:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6) == 4)
  {
    v7 = objc_retainAutorelease(v3);
    v11 = bswap32(*(_DWORD *)objc_msgSend_UTF8String(v7, v8, v9, v10));
  }
  else
  {
    handleForCategory(0);
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
      sub_214569D34(v3, v13, v14, v15);

    v11 = 0;
  }

  return v11;
}

- (BOOL)deleteFDRDataFromEANWithDataClass:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  unsigned int QuerykeyFromDataClass;
  unsigned int v12;
  mach_port_t v13;
  const __CFDictionary *v14;
  io_service_t MatchingService;
  io_object_t v16;
  kern_return_t v17;
  NSObject *v18;
  NSObject *v19;
  BOOL v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t output;
  uint32_t outputCnt;
  io_connect_t connect;
  uint8_t buf[4];
  void *v33;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v8 = v4;
  input[0] = 0;
  outputCnt = 1;
  connect = 0;
  output = 0;
  if (!v4 || !objc_msgSend_length(v4, v5, v6, v7))
  {
    handleForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_214569BF0();
    goto LABEL_12;
  }
  QuerykeyFromDataClass = objc_msgSend__getQuerykeyFromDataClass_(self, v9, (uint64_t)v8, v10);
  if (!QuerykeyFromDataClass)
  {
    handleForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_21456996C();
    goto LABEL_12;
  }
  v12 = QuerykeyFromDataClass;
  v13 = *MEMORY[0x24BDD8B18];
  v14 = IOServiceMatching("AppleNVMeEAN");
  MatchingService = IOServiceGetMatchingService(v13, v14);
  if (!MatchingService)
  {
    handleForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_214569998(v19, v22, v23, v24, v25, v26, v27, v28);
LABEL_12:
    v16 = 0;
LABEL_13:
    v20 = 0;
    goto LABEL_14;
  }
  v16 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, &connect))
  {
    handleForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_214569A68();
    goto LABEL_13;
  }
  input[0] = v12;
  v17 = IOConnectCallMethod(connect, 5u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
  handleForCategory(0);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_214569DB8();
    goto LABEL_13;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v8;
    _os_log_impl(&dword_214503000, v19, OS_LOG_TYPE_DEFAULT, "Successfully deleted %@ from EAN", buf, 0xCu);
  }
  v20 = 1;
LABEL_14:

  if (connect)
  {
    IOServiceClose(connect);
    connect = 0;
  }
  if (v16)
    IOObjectRelease(v16);

  return v20;
}

- (BOOL)verifyFDRDataFromEANUsingCache:(BOOL)a3 cachedData:(id)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  _BOOL4 v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  int FDRDataFromEANWithDataClass_outData_stripPadding;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  BOOL v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  __CFDictionary *Mutable;
  const void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  uint64_t LocalMultiDataBlobForClass;
  const char *v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  unint64_t v55;
  NSObject *v56;
  _BOOL4 v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  NSObject *v61;
  NSObject *v64;
  id v65;
  NSObject *obj;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t v77[128];
  uint8_t buf[4];
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  _BYTE v82[128];
  uint64_t v83;

  v4 = a3;
  v83 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 || !v4)
  {
    v9 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214503000, v7, OS_LOG_TYPE_DEFAULT, "Verifying EAN FDR data from cache...", buf, 2u);
      }

      v76 = 0u;
      v74 = 0u;
      v75 = 0u;
      v73 = 0u;
      v7 = v5;
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v73, (uint64_t)v82, 16);
      if (!v11)
      {
        v8 = 1;
        goto LABEL_76;
      }
      v12 = v11;
      v65 = v5;
      v13 = *(_QWORD *)v74;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v74 != v13)
            objc_enumerationMutation(v7);
          v15 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i);
          handleForCategory(0);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v79 = v15;
            _os_log_impl(&dword_214503000, v16, OS_LOG_TYPE_DEFAULT, "Verifying data class: %@", buf, 0xCu);
          }

          v72 = 0;
          v17 = v7;
          objc_msgSend_objectForKey_(v7, v18, v15, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          FDRDataFromEANWithDataClass_outData_stripPadding = objc_msgSend_readFDRDataFromEANWithDataClass_outData_stripPadding_(self, v21, v15, (uint64_t)&v72, 1);
          v23 = v72;
          handleForCategory(0);
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (FDRDataFromEANWithDataClass_outData_stripPadding)
            v26 = v23 == 0;
          else
            v26 = 1;
          if (v26)
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              sub_214569EA4();
            v7 = v17;
            goto LABEL_72;
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v79 = v72;
            v80 = 2112;
            v81 = (uint64_t)v20;
            _os_log_impl(&dword_214503000, v25, OS_LOG_TYPE_DEFAULT, "Comparing data class: %@ : %@", buf, 0x16u);
          }

          v7 = v17;
          if ((objc_msgSend_isEqualToData_(v20, v27, v72, v28) & 1) == 0)
          {
            handleForCategory(0);
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              sub_214569E44();
LABEL_72:

            goto LABEL_5;
          }

        }
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v29, (uint64_t)&v73, (uint64_t)v82, 16);
        if (v12)
          continue;
        break;
      }
    }
    else
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214503000, v7, OS_LOG_TYPE_DEFAULT, "Verifying EAN FDR data from FDR local store...", buf, 2u);
      }

      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v31 = (const void *)*MEMORY[0x24BDBD268];
      CFDictionarySetValue(Mutable, CFSTR("GetCombined"), (const void *)*MEMORY[0x24BDBD268]);
      CFDictionarySetValue(Mutable, CFSTR("StripImg4"), v31);
      CFDictionarySetValue(Mutable, CFSTR("VerifyData"), v31);
      objc_msgSend__getDataClassesToWrite(self, v32, v33, v34);
      v7 = objc_claimAutoreleasedReturnValue();
      handleForCategory(0);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v79 = (uint64_t)v7;
        _os_log_impl(&dword_214503000, v35, OS_LOG_TYPE_DEFAULT, "EAN Data classes to verify: %@", buf, 0xCu);
      }

      if (!v7 || !objc_msgSend_count(v7, v36, v37, v38))
      {
        handleForCategory(0);
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          sub_214569ED0();

        goto LABEL_5;
      }
      v65 = v5;
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      obj = v7;
      v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v68, (uint64_t)v77, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v69;
        while (2)
        {
          for (j = 0; j != v41; ++j)
          {
            if (*(_QWORD *)v69 != v42)
              objc_enumerationMutation(obj);
            v44 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
            v45 = (void *)MEMORY[0x2199D19CC]();
            v72 = 0;
            handleForCategory(0);
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v79 = (uint64_t)v44;
              _os_log_impl(&dword_214503000, v46, OS_LOG_TYPE_DEFAULT, "Verifying data class: %@", buf, 0xCu);
            }

            if (objc_msgSend_isEqualToString_(v44, v47, (uint64_t)CFSTR("seal"), v48))
            {
              LocalMultiDataBlobForClass = AMFDRSealingMapCopyLocalDataForClass();
            }
            else if (AMFDRSealingMapEntryHasAttribute())
            {
              handleForCategory(0);
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v79 = (uint64_t)v44;
                _os_log_impl(&dword_214503000, v51, OS_LOG_TYPE_DEFAULT, "Copying multi data: %@", buf, 0xCu);
              }

              LocalMultiDataBlobForClass = AMFDRSealingMapCreateLocalMultiDataBlobForClass();
            }
            else
            {
              LocalMultiDataBlobForClass = AMFDRSealingManifestCopyLocalDataForClass();
            }
            v52 = LocalMultiDataBlobForClass;
            if (!LocalMultiDataBlobForClass)
            {
              handleForCategory(0);
              v53 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v79 = 0;
                _os_log_impl(&dword_214503000, v53, OS_LOG_TYPE_DEFAULT, "Failed to get data class from local store, error: %@", buf, 0xCu);
              }

            }
            if ((objc_msgSend_readFDRDataFromEANWithDataClass_outData_stripPadding_(self, v50, (uint64_t)v44, (uint64_t)&v72, 1) & 1) == 0)
            {
              handleForCategory(0);
              v54 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_214503000, v54, OS_LOG_TYPE_DEFAULT, "Failed to read data class from EAN", buf, 2u);
              }

            }
            v55 = v52 | v72;
            handleForCategory(0);
            v56 = objc_claimAutoreleasedReturnValue();
            v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
            if (v55)
            {
              if (v57)
              {
                *(_DWORD *)buf = 138412546;
                v79 = v72;
                v80 = 2112;
                v81 = v52;
                _os_log_impl(&dword_214503000, v56, OS_LOG_TYPE_DEFAULT, "Comparing data class: %@ : %@", buf, 0x16u);
              }

              if ((objc_msgSend_isEqualToData_((void *)v52, v58, v72, v59) & 1) == 0)
              {
                handleForCategory(0);
                v61 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                  sub_214569EFC();

                objc_autoreleasePoolPop(v45);
                v7 = obj;

                v8 = 0;
                v5 = v65;
                goto LABEL_76;
              }
            }
            else
            {
              if (v57)
              {
                *(_DWORD *)buf = 138412290;
                v79 = (uint64_t)v44;
                _os_log_impl(&dword_214503000, v56, OS_LOG_TYPE_DEFAULT, "Data class (%@) both missing in EAN and FDR local store. Continue.", buf, 0xCu);
              }

            }
            objc_autoreleasePoolPop(v45);
          }
          v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v60, (uint64_t)&v68, (uint64_t)v77, 16);
          if (v41)
            continue;
          break;
        }
      }
      v7 = obj;

    }
    v8 = 1;
    v5 = v65;
    goto LABEL_76;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_214569E18();
LABEL_5:
  v8 = 0;
LABEL_76:

  AMSupportSafeRelease();
  return v8;
}

- (BOOL)calculateDerLength:(id)a3 actualSize:(unint64_t *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD v20[2];

  v5 = objc_retainAutorelease(a3);
  v20[0] = objc_msgSend_bytes(v5, v6, v7, v8);
  v12 = objc_msgSend_length(v5, v9, v10, v11);

  v20[1] = v12;
  v18 = 0;
  v19 = 0;
  v16 = 0;
  v17 = 0;
  v13 = sub_21455E2C8((uint64_t)v20, &v16, &v19);
  if (v13)
  {
    *a4 = 0;
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_214569F5C();

  }
  else
  {
    *a4 = v17 - v20[0] + v18;
  }
  return v13 == 0;
}

- (id)_apticketCopyDataObjectPropertyWithTag:(unint64_t)a3 property:(unint64_t)a4
{
  NSData *apTicket;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t buf[4];
  const char *v42;
  _OWORD v43[28];
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v44 = 0;
  memset(v43, 0, sizeof(v43));
  v39 = 0;
  v40 = 0;
  apTicket = self->apTicket;
  if (apTicket)
  {
    v8 = objc_msgSend_bytes(apTicket, a2, a3, a4);
    v12 = objc_msgSend_length(self->apTicket, v9, v10, v11);
    if (sub_21455E170(v8, v12, (uint64_t)v43))
    {
      handleForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v42 = "-[CREANController _apticketCopyDataObjectPropertyWithTag:property:]";
        _os_log_impl(&dword_214503000, v13, OS_LOG_TYPE_DEFAULT, "%s: failed to parse AP ticket as Img4 manifest", buf, 0xCu);
      }
    }
    else
    {
      sub_21455DF44((uint64_t)v43, a3, a4, &v40, &v39);
      if (v22)
      {
        handleForCategory(0);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_21456A09C(v13, v23, v24, v25, v26, v27, v28, v29);
      }
      else
      {
        objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v21, v40, v39);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
          return v30;
        handleForCategory(0);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_21456A02C(v13, v32, v33, v34, v35, v36, v37, v38);
      }
    }
  }
  else
  {
    handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_214569FBC(v13, v14, v15, v16, v17, v18, v19, v20);
  }

  v30 = 0;
  return v30;
}

- (id)copyCurrentFDREANValuesWithdataDir:(id)a3 error:(id *)a4
{
  void *v6;
  __CFDictionary *Mutable;
  __CFDictionary *v8;
  const void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const __CFArray *v13;
  const __CFArray *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSData *apTicket;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  id v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], a2, (uint64_t)a3, (uint64_t)a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->apTicket)
  {
    handleForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_21456A10C();
    goto LABEL_13;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    handleForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_21456A138();
LABEL_13:
    v12 = 0;
    goto LABEL_20;
  }
  v8 = Mutable;
  CFDictionaryAddValue(Mutable, CFSTR("CopyAllowUnsealed"), (const void *)*MEMORY[0x24BDBD270]);
  v9 = (const void *)*MEMORY[0x24BDBD268];
  CFDictionarySetValue(v8, CFSTR("GetCombined"), (const void *)*MEMORY[0x24BDBD268]);
  CFDictionaryAddValue(v8, CFSTR("VerifyData"), v9);
  if (!v6)
  {
    handleForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_21456A164(v29, v33, v34, v35, v36, v37, v38, v39);
    goto LABEL_33;
  }
  CFDictionaryAddValue(v8, CFSTR("DataDirectory"), v6);
  if (!AMFDRCreateTypeWithOptions())
  {
    handleForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_21456A1CC();
LABEL_33:
    v12 = 0;
    goto LABEL_20;
  }
  objc_msgSend__apticketCopyDataObjectPropertyWithTag_property_(self, v10, 1718903152, 1145525076);
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    handleForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v12 = 0;
      goto LABEL_15;
    }
    sub_21456A1F8();
    v12 = 0;
LABEL_20:
    v17 = 0;
    goto LABEL_21;
  }
  v12 = (void *)v11;
  AMFDRSetOption();
  if ((AMFDRDataCopyTrustObject() & 1) == 0)
  {
    handleForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
LABEL_15:
      v17 = 0;
      goto LABEL_21;
    }
    sub_21456A27C();
    goto LABEL_20;
  }
  v13 = (const __CFArray *)AMFDRSealingMapCopyMultiInstanceForClass();
  v14 = v13;
  if (!v13 || CFArrayGetCount(v13) < 1)
  {
    if (a4)
      *a4 = 0;
    handleForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_21456A224();
    goto LABEL_20;
  }
  CFArrayGetValueAtIndex(v14, 0);
  v15 = AMFDRSealingMapCopyLocalData();
  if (!v15)
  {
    if (a4)
      *a4 = 0;
    handleForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_21456A250();
    goto LABEL_20;
  }
  v16 = v15;
  v17 = (void *)objc_opt_new();
  apTicket = self->apTicket;
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v19, 1802793057, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v17, v22, (uint64_t)apTicket, (uint64_t)v21);

  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v23, 1953722996, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v17, v26, 0, (uint64_t)v25);

  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v27, 1818322291, v28);
  v29 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v17, v30, v16, (uint64_t)v29);
LABEL_21:

  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  v31 = v17;

  return v31;
}

- (unint64_t)sizeEAN:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  unsigned int QuerykeyFromDataClass;
  unsigned int v8;
  mach_port_t v9;
  const __CFDictionary *v10;
  io_service_t MatchingService;
  io_object_t v12;
  uint64_t v13;
  NSObject *v15;
  uint64_t output;
  uint32_t outputCnt;
  io_connect_t connect;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  memset(input, 0, 24);
  outputCnt = 1;
  connect = 0;
  output = 0;
  if (!v6)
  {
    handleForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_21456A2A8();
    goto LABEL_18;
  }
  QuerykeyFromDataClass = objc_msgSend__getQuerykeyFromDataClass_(self, v4, (uint64_t)v6, v5);
  if (!QuerykeyFromDataClass)
  {
    handleForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_21456A2D4();
    goto LABEL_18;
  }
  v8 = QuerykeyFromDataClass;
  v9 = *MEMORY[0x24BDD8B18];
  v10 = IOServiceMatching("AppleNVMeEAN");
  MatchingService = IOServiceGetMatchingService(v9, v10);
  if (!MatchingService)
  {
    handleForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_21456A300();
LABEL_18:
    v12 = 0;
    goto LABEL_25;
  }
  v12 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, &connect))
  {
    handleForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_21456A3B8();
  }
  else if (connect)
  {
    input[0] = v8;
    if (!IOConnectCallMethod(connect, 3u, input, 3u, 0, 0, &output, &outputCnt, 0, 0))
      goto LABEL_7;
    handleForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_21456A358();
  }
  else
  {
    handleForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_21456A32C();
  }
LABEL_25:

LABEL_7:
  if (connect)
  {
    IOServiceClose(connect);
    connect = 0;
  }
  if (v12)
    IOObjectRelease(v12);
  v13 = output;

  return v13;
}

- (BOOL)copyFDREANValues:(id)a3 outgenerationCount:(unsigned int *)a4 outManifesthash:(id *)a5
{
  id v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  NSObject *v14;
  const char *v15;
  unint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  _DWORD *v21;
  const char *v22;
  _DWORD *v23;
  unsigned int v24;
  BOOL v25;
  unsigned int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  int v32;
  int v33;
  id v34;
  uint8_t buf[4];
  _BYTE v36[14];
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v34 = 0;
  if ((objc_msgSend_readFDRDataFromEANWithDataClass_outData_stripPadding_(self, v9, (uint64_t)v8, (uint64_t)&v34, 0) & 1) == 0)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v36 = v8;
      v15 = "Failed to load EAN key: %@";
      goto LABEL_7;
    }
LABEL_17:
    v25 = 0;
    goto LABEL_18;
  }
  v13 = objc_msgSend_length(v34, v10, v11, v12);
  if (v13 <= 0x1F)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v36 = v8;
      v15 = "Entry too small to be versioned blob: %@";
LABEL_7:
      _os_log_impl(&dword_214503000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  v16 = v13;
  v17 = objc_retainAutorelease(v34);
  v21 = (_DWORD *)objc_msgSend_bytes(v17, v18, v19, v20);
  v23 = v21;
  if (*v21 != 1769104486)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456A560();
    goto LABEL_17;
  }
  if (v21[1] != 1)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456A4F4();
    goto LABEL_17;
  }
  v24 = v21[2];
  if (v24 + 1 <= 1)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456A4C8();
    goto LABEL_17;
  }
  v27 = v21[3];
  if (v27 <= 0x1F)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456A418();
    goto LABEL_17;
  }
  v28 = v21[4];
  if (!v28)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456A444();
    goto LABEL_17;
  }
  if (v16 <= v28 + v27)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456A49C();
    goto LABEL_17;
  }
  v29 = v21[5];
  if (!(_DWORD)v29)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456A470();
    goto LABEL_17;
  }
  v30 = 16 * v29;
  if (16 * v29 != v21[7])
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v32 = v23[5];
      v33 = v23[7];
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v36 = v32;
      *(_WORD *)&v36[4] = 2048;
      *(_QWORD *)&v36[6] = 16;
      v37 = 2048;
      v38 = v30;
      v39 = 1024;
      v40 = v33;
      _os_log_error_impl(&dword_214503000, v14, OS_LOG_TYPE_ERROR, "FDR info payload is incorrect size.\tExpect: %d * %lu = %zu\tFound: %d", buf, 0x22u);
    }
    goto LABEL_17;
  }
  if (a4)
    *a4 = v24;
  if (!a5)
  {
    v25 = 1;
    goto LABEL_19;
  }
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v22, (uint64_t)v21 + v21[3], v21[4]);
  v31 = objc_claimAutoreleasedReturnValue();
  v14 = v31;
  v25 = v31 != 0;
  if (v31)
  {
    v14 = objc_retainAutorelease(v31);
    *a5 = v14;
    v25 = 1;
  }
LABEL_18:

LABEL_19:
  return v25;
}

- (unsigned)nextEANGenerationCount
{
  const char *v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v10;

  v10 = 0;
  if (objc_msgSend_copyFDREANValues_outgenerationCount_outManifesthash_(self, a2, (uint64_t)CFSTR("fdr1"), (uint64_t)&v10, 0))v4 = v10;
  else
    v4 = 0;
  v5 = objc_msgSend_copyFDREANValues_outgenerationCount_outManifesthash_(self, v3, (uint64_t)CFSTR("fdr2"), (uint64_t)&v10, 0);
  v6 = v10;
  if (!v5)
    v6 = 0;
  if (v4 <= v6)
    v7 = v6;
  else
    v7 = v4;
  if (v4 < v6)
    v6 = v4;
  if (v6 == 1)
    v8 = 2;
  else
    v8 = 1;
  if (v7 == -2)
    return v8;
  else
    return v7 + 1;
}

- (id)copyStagedFDREanDataWithdataDir:(id)a3 error:(id *)a4
{
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  size_t Count;
  int64_t v8;
  const void **v9;
  const void **v10;
  const __CFAllocator *v11;
  CFNumberRef v12;
  const __CFData *Value;
  const __CFData *v14;
  const UInt8 *BytePtr;
  CC_LONG Length;
  const __CFData *v17;
  CFIndex v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  CFIndex v22;
  uint64_t v23;
  uint64_t v24;
  int EANGenerationCount;
  NSObject *v26;
  CFIndex v27;
  _DWORD *v28;
  const __CFData **v29;
  const __CFNumber **v30;
  int64_t v31;
  const __CFData *v32;
  CFIndex v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  const __CFNumber *v37;
  __CFData *Mutable;
  NSObject *v39;
  const UInt8 *v40;
  CFIndex v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t i;
  uint64_t v45;
  const UInt8 *v46;
  uint64_t v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v52;
  const __CFAllocator *allocator;
  const void **v54;
  const __CFData *theData;
  UInt8 *v56;
  uint64_t v57;
  UInt8 bytes[16];
  __int128 v59;
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  unsigned __int8 md[16];
  __int128 v65;
  __int128 v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v65 = 0u;
  v66 = 0u;
  *(_OWORD *)md = 0u;
  *(_OWORD *)bytes = 0u;
  v59 = 0u;
  v5 = (const __CFDictionary *)objc_msgSend_copyCurrentFDREANValuesWithdataDir_error_(self, a2, (uint64_t)a3, (uint64_t)a4);
  v6 = v5;
  if (!v5)
  {
    handleForCategory(0);
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      sub_21456A5D0();
    goto LABEL_49;
  }
  Count = CFDictionaryGetCount(v5);
  if (!Count)
  {
    handleForCategory(0);
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      sub_21456A5FC();
LABEL_49:

    Mutable = 0;
    goto LABEL_50;
  }
  v8 = Count;
  v9 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
  v10 = (const void **)malloc_type_calloc(v8, 8uLL, 0x6004044C4A2DFuLL);
  v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v12 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, "aptk");
  Value = (const __CFData *)CFDictionaryGetValue(v6, v12);
  if (Value)
  {
    v14 = Value;
    BytePtr = CFDataGetBytePtr(Value);
    Length = CFDataGetLength(v14);
    CC_SHA384(BytePtr, Length, md);
    allocator = v11;
    v17 = CFDataCreate(v11, md, 48);
    CFDictionaryGetKeysAndValues(v6, v9, v10);
    v56 = (UInt8 *)malloc_type_calloc(v8, 0x10uLL, 0x1000040451B5BE8uLL);
    v18 = CFDataGetLength(v17);
    v22 = v18;
    v23 = v18 & 3;
    if (v18 <= 0)
      v23 = -(-v18 & 3);
    if (v23)
      v24 = v18 - v23 + 4;
    else
      v24 = v18;
    v57 = v24;
    *(_QWORD *)bytes = 0x169726466;
    EANGenerationCount = objc_msgSend_nextEANGenerationCount(self, v19, v20, v21);
    *(_DWORD *)&bytes[8] = EANGenerationCount;
    handleForCategory(0);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v61) = EANGenerationCount;
      _os_log_impl(&dword_214503000, v26, OS_LOG_TYPE_DEFAULT, "Will use generation count: %u", buf, 8u);
    }

    *(_DWORD *)&bytes[12] = 32;
    theData = v17;
    LODWORD(v59) = CFDataGetLength(v17);
    DWORD1(v59) = v8;
    DWORD2(v59) = v57 + 32;
    HIDWORD(v59) = 16 * v8;
    v54 = v9;
    v27 = v57 + 32 + 16 * v8;
    if (v8 >= 1)
    {
      v28 = v56 + 8;
      v29 = (const __CFData **)v10;
      v30 = (const __CFNumber **)v9;
      v31 = v8;
      do
      {
        v32 = *v29++;
        v33 = CFDataGetLength(v32);
        v34 = v33;
        if (v33 <= 0)
          v35 = -(-v33 & 3);
        else
          v35 = v33 & 3;
        if (v35)
          v36 = v33 - v35 + 4;
        else
          v36 = v33;
        v37 = *v30++;
        *(_DWORD *)buf = 0;
        CFNumberGetValue(v37, kCFNumberSInt32Type, buf);
        *(v28 - 2) = *(_DWORD *)buf;
        *(v28 - 1) = v27;
        *v28 = v34;
        v28 += 4;
        v27 += v36;
        --v31;
      }
      while (v31);
    }
    Mutable = CFDataCreateMutable(allocator, v27);
    CFDataAppendBytes(Mutable, bytes, 32);
    handleForCategory(0);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v39, OS_LOG_TYPE_DEFAULT, "Added header.", buf, 2u);
    }

    v40 = CFDataGetBytePtr(theData);
    v41 = CFDataGetLength(theData);
    CFDataAppendBytes(Mutable, v40, v41);
    if (v57 != v22)
      CFDataIncreaseLength(Mutable, v57 - v22);
    handleForCategory(0);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v42, OS_LOG_TYPE_DEFAULT, "Added hash.", buf, 2u);
    }

    CFDataAppendBytes(Mutable, v56, 16 * v8);
    handleForCategory(0);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v43, OS_LOG_TYPE_DEFAULT, "Added payload table.", buf, 2u);
    }

    if (v8 >= 1)
    {
      for (i = 0; i != v8; ++i)
      {
        v45 = CFDataGetLength((CFDataRef)v10[i]);
        v46 = CFDataGetBytePtr((CFDataRef)v10[i]);
        CFDataAppendBytes(Mutable, v46, v45);
        v47 = v45 & 3;
        if (v45 <= 0)
          v47 = -(-v45 & 3);
        if (v47)
          CFDataIncreaseLength(Mutable, 4 - v47);
        handleForCategory(0);
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v61 = i;
          v62 = 2048;
          v63 = v45;
          _os_log_impl(&dword_214503000, v48, OS_LOG_TYPE_DEFAULT, "Added element %ld. Size: %ld", buf, 0x16u);
        }

      }
    }
    handleForCategory(0);
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v49, OS_LOG_TYPE_DEFAULT, "Success.", buf, 2u);
    }

    v9 = v54;
    if (v56)
      free(v56);
    if (!v54)
      goto LABEL_43;
  }
  else
  {
    handleForCategory(0);
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      sub_21456A628();

    Mutable = 0;
    if (!v9)
      goto LABEL_43;
  }
  free(v9);
LABEL_43:
  if (v10)
    free(v10);
LABEL_50:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return Mutable;
}

- (BOOL)writeEAN:(id)a3 isImg4:(BOOL)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  mach_port_t v10;
  const __CFDictionary *v11;
  io_service_t MatchingService;
  io_object_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  const char *v24;
  char v25;
  NSObject *v26;
  NSObject *v27;
  BOOL v28;
  io_object_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  io_connect_t connect;
  uint8_t buf[4];
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v9 = v5;
  connect = 0;
  if (!v5)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456A654();
    goto LABEL_32;
  }
  if (!objc_msgSend_count(v5, v6, v7, v8))
  {
    v28 = 1;
    goto LABEL_27;
  }
  v10 = *MEMORY[0x24BDD8B18];
  v11 = IOServiceMatching("AppleNVMeEAN");
  MatchingService = IOServiceGetMatchingService(v10, v11);
  if (!MatchingService)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456A680();
LABEL_32:
    v13 = 0;
    goto LABEL_37;
  }
  v13 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, &connect))
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456A6D8();
  }
  else
  {
    if (connect)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v14 = v9;
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v32, (uint64_t)v39, 16);
      if (v16)
      {
        v19 = v16;
        v30 = v13;
        v31 = v9;
        v20 = *(_QWORD *)v33;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v33 != v20)
              objc_enumerationMutation(v14);
            v22 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_msgSend_objectForKeyedSubscript_(v14, v17, v22, v18);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend__writeDataToEAN_withKey_(self, v24, (uint64_t)v23, v22);

            handleForCategory(0);
            v26 = objc_claimAutoreleasedReturnValue();
            v27 = v26;
            if ((v25 & 1) == 0)
            {
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                sub_2145698E0();

              v28 = 0;
              goto LABEL_20;
            }
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v38 = v22;
              _os_log_impl(&dword_214503000, v27, OS_LOG_TYPE_DEFAULT, "EAN write success :%@", buf, 0xCu);
            }

          }
          v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v32, (uint64_t)v39, 16);
          if (v19)
            continue;
          break;
        }
        v28 = 1;
LABEL_20:
        v9 = v31;
        v13 = v30;
      }
      else
      {
        v28 = 1;
      }
      goto LABEL_23;
    }
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456A6AC();
  }
LABEL_37:
  v28 = 0;
LABEL_23:

  if (connect)
  {
    IOServiceClose(connect);
    connect = 0;
  }
  if (v13)
    IOObjectRelease(v13);
LABEL_27:

  return v28;
}

- (BOOL)stageVersionedFDREANWithdataDir:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  const char *v15;
  id v16;
  char v17;
  NSObject *v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v30;
  uint8_t buf[4];
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v8 = objc_msgSend_sizeEAN_(self, v6, (uint64_t)CFSTR("fdr1"), v7);
  v11 = v8 | objc_msgSend_sizeEAN_(self, v9, (uint64_t)CFSTR("fdr2"), v10);
  handleForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v12, OS_LOG_TYPE_DEFAULT, "Preparing to write staged FDR EAN key.", buf, 2u);
    }

    v30 = 0;
    v12 = objc_msgSend_copyStagedFDREanDataWithdataDir_error_(self, v14, (uint64_t)v5, (uint64_t)&v30);
    v16 = v30;
    if (v16 || !v12)
    {
      handleForCategory(0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_21456A738();

    }
    else
    {
      v17 = objc_msgSend__writeDataToEAN_withKey_(self, v15, (uint64_t)v12, (uint64_t)CFSTR("fdr2"));
      handleForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if ((v17 & 1) != 0)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v32 = CFSTR("fdr2");
          _os_log_impl(&dword_214503000, v19, OS_LOG_TYPE_DEFAULT, "EAN write success :%@", buf, 0xCu);
        }

        goto LABEL_12;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_21456A7B4(v19, v22, v23, v24, v25, v26, v27, v28);

    }
    v20 = 0;
    goto LABEL_20;
  }
  if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v12, OS_LOG_TYPE_DEFAULT, "fdr1 & fdr2 are blank returning.", buf, 2u);
  }
LABEL_12:
  v20 = 1;
LABEL_20:

  return v20;
}

- (BOOL)swapEAN:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  unsigned int QuerykeyFromDataClass;
  const char *v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  mach_port_t v17;
  const __CFDictionary *v18;
  io_service_t MatchingService;
  io_object_t v20;
  NSObject *v21;
  kern_return_t v22;
  NSObject *v23;
  NSObject *v24;
  BOOL v25;
  uint32_t outputCnt;
  uint64_t output;
  io_connect_t connect;
  uint8_t buf[4];
  unsigned int v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  unsigned int v37;
  __int16 v38;
  unsigned int v39;
  __int16 v40;
  unsigned int v41;
  __int16 v42;
  unsigned int v43;
  __int16 v44;
  unsigned int v45;
  uint64_t input;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v10 = v7;
  connect = 0;
  input = 0;
  v47 = 0;
  output = 0;
  outputCnt = 1;
  if (!v6)
  {
    handleForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_21456A824();
    goto LABEL_29;
  }
  if (!v7)
  {
    handleForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_21456A850();
    goto LABEL_29;
  }
  QuerykeyFromDataClass = objc_msgSend__getQuerykeyFromDataClass_(self, v8, (uint64_t)v6, v9);
  if (!QuerykeyFromDataClass)
  {
    handleForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_21456A87C();
    goto LABEL_29;
  }
  v14 = QuerykeyFromDataClass;
  v15 = objc_msgSend__getQuerykeyFromDataClass_(self, v12, (uint64_t)v10, v13);
  if (!v15)
  {
    handleForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_21456A8A8();
    goto LABEL_29;
  }
  v16 = v15;
  v17 = *MEMORY[0x24BDD8B18];
  v18 = IOServiceMatching("AppleNVMeEAN");
  MatchingService = IOServiceGetMatchingService(v17, v18);
  if (!MatchingService)
  {
    handleForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_21456A680();
LABEL_29:
    v20 = 0;
LABEL_30:
    v25 = 0;
    goto LABEL_14;
  }
  v20 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, &connect))
  {
    handleForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_21456A3B8();
    goto LABEL_30;
  }
  if (!connect)
  {
    handleForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_21456A32C();
    goto LABEL_30;
  }
  input = v14;
  v47 = v16;
  handleForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110912;
    v31 = HIBYTE(v14);
    v32 = 1024;
    v33 = HIWORD(v14);
    v34 = 1024;
    v35 = v14 >> 8;
    v36 = 1024;
    v37 = v14;
    v38 = 1024;
    v39 = HIBYTE(v16);
    v40 = 1024;
    v41 = HIWORD(v16);
    v42 = 1024;
    v43 = v16 >> 8;
    v44 = 1024;
    v45 = v16;
    _os_log_impl(&dword_214503000, v21, OS_LOG_TYPE_DEFAULT, "Swapping EAN key %c%c%c%c and %c%c%c%c", buf, 0x32u);
  }

  v22 = IOConnectCallMethod(connect, 6u, &input, 2u, 0, 0, &output, &outputCnt, 0, 0);
  handleForCategory(0);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_21456A8D4();
    goto LABEL_30;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v24, OS_LOG_TYPE_DEFAULT, "EAN key Swap success", buf, 2u);
  }
  v25 = 1;
LABEL_14:

  if (connect)
  {
    IOServiceClose(connect);
    connect = 0;
  }
  if (v20)
    IOObjectRelease(v20);

  return v25;
}

- (BOOL)swapVersionedFDR
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  char v12;
  NSObject *v13;
  BOOL v14;
  __int16 v16;
  __int16 v17;

  v4 = objc_msgSend_sizeEAN_(self, a2, (uint64_t)CFSTR("fdr1"), v2);
  v7 = objc_msgSend_sizeEAN_(self, v5, (uint64_t)CFSTR("fdr2"), v6);
  if (!(v4 | v7))
  {
    handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 0;
      v10 = "Versioned FDR is empty. NO OP";
      v11 = (uint8_t *)&v17;
LABEL_9:
      _os_log_impl(&dword_214503000, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (!v4 || !v7)
  {
    handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_21456A934();
    goto LABEL_15;
  }
  v12 = objc_msgSend_swapEAN_withKey_(self, v8, (uint64_t)CFSTR("fdr1"), (uint64_t)CFSTR("fdr2"));
  handleForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_21456A960();
LABEL_15:
    v14 = 0;
    goto LABEL_16;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 0;
    v10 = "FDR1 is now active.";
    v11 = (uint8_t *)&v16;
    goto LABEL_9;
  }
LABEL_10:
  v14 = 1;
LABEL_16:

  return v14;
}

- (id)_ticketCopyHashDataWithNode:(unsigned int)a3
{
  const __CFData *CFProperty;
  const __CFData *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  CC_LONG v21;
  const char *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  CC_LONG v31;
  const char *v32;
  uint8_t v33[56];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(a3, CFSTR("crypto-hash-method"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    v5 = CFProperty;
    if (CFProperty)
    {
      if (*(_DWORD *)CFDataGetBytePtr(CFProperty) != 828467315)
      {
        v6 = *(_QWORD *)CFDataGetBytePtr(v5);
        handleForCategory(0);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v6 != 0x3438332D32616873)
        {
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            sub_21456A9E4();

          v9 = 0;
LABEL_22:
          CFRelease(v5);
          return v9;
        }
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v33 = 0;
          _os_log_impl(&dword_214503000, v8, OS_LOG_TYPE_DEFAULT, "crypto-hash-method found. Using SHA2-384\n", v33, 2u);
        }

        v27 = (const void *)objc_msgSend_bytes(self->apTicket, v24, v25, v26);
        v31 = objc_msgSend_length(self->apTicket, v28, v29, v30);
        CC_SHA384(v27, v31, v33);
        objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v32, (uint64_t)v33, 48);
LABEL_17:
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          handleForCategory(0);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            sub_21456A9B8();

        }
        if (!v5)
          return v9;
        goto LABEL_22;
      }
      handleForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v33 = 0;
        v13 = "crypto-hash-method found. Using SHA1\n";
        goto LABEL_15;
      }
    }
    else
    {
      handleForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v33 = 0;
        v13 = "crypto-hash-method not found, defaulting to SHA1\n";
LABEL_15:
        _os_log_impl(&dword_214503000, v12, OS_LOG_TYPE_DEFAULT, v13, v33, 2u);
      }
    }

    v17 = (const void *)objc_msgSend_bytes(self->apTicket, v14, v15, v16);
    v21 = objc_msgSend_length(self->apTicket, v18, v19, v20);
    CC_SHA1(v17, v21, v33);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v22, (uint64_t)v33, 20);
    goto LABEL_17;
  }
  handleForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_21456A98C();

  return 0;
}

- (id)apticketCopyHashData
{
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  io_object_t v7;
  void *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[CREANController apticketCopyHashData]";
    _os_log_impl(&dword_214503000, v3, OS_LOG_TYPE_DEFAULT, "entering %s\n", (uint8_t *)&v11, 0xCu);
  }

  if (!self->apTicket)
  {
    handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_21456AA44();
    goto LABEL_10;
  }
  v4 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B18], "IODeviceTree:/chosen");
  if (!(_DWORD)v4)
  {
    handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_21456A98C();
LABEL_10:

    v8 = 0;
    return v8;
  }
  v7 = v4;
  objc_msgSend__ticketCopyHashDataWithNode_(self, v5, v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IOObjectRelease(v7);
  return v8;
}

- (BOOL)setupVersionedFDRWithApTicket:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  BOOL v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  int v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  int isEqualToData;
  _BOOL4 v32;
  NSObject *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  id v41;
  uint8_t buf[4];
  NSObject *v43;
  __int16 v44;
  id v45;
  _BYTE v46[4096];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v8 = objc_msgSend_sizeEAN_(self, v6, (uint64_t)CFSTR("fdr1"), v7);
  v11 = objc_msgSend_sizeEAN_(self, v9, (uint64_t)CFSTR("fdr2"), v10);
  bzero(v46, 0x1000uLL);
  if (!(v8 | v11))
  {
    handleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v12, OS_LOG_TYPE_DEFAULT, "fdr1 & fdr2 are blank returning.", buf, 2u);
    }
    v13 = 0;
    v14 = 0;
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456AB20();
    goto LABEL_40;
  }
  objc_storeStrong((id *)&self->apTicket, a3);
  handleForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v17, OS_LOG_TYPE_DEFAULT, "Ensuring FDR1 is valid and active.", buf, 2u);
  }

  if (!self->apTicket)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456AA70();
    goto LABEL_40;
  }
  objc_msgSend_apticketCopyHashData(self, v18, v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456AA9C();
    goto LABEL_40;
  }
  v14 = v21;
  v41 = 0;
  v23 = objc_msgSend_copyFDREANValues_outgenerationCount_outManifesthash_(self, v22, (uint64_t)CFSTR("fdr1"), 0, &v41);
  v13 = v41;
  if (v23)
  {
    handleForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_convertToHexString(v13, v25, v26, v27);
      v28 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = v28;
      _os_log_impl(&dword_214503000, v24, OS_LOG_TYPE_DEFAULT, "FDR1 has hash: %@", buf, 0xCu);

    }
    isEqualToData = objc_msgSend_isEqualToData_(v14, v29, (uint64_t)v13, v30);
    handleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (isEqualToData)
    {
      if (v32)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214503000, v12, OS_LOG_TYPE_DEFAULT, "FDR1 appears to be active.", buf, 2u);
      }
      goto LABEL_5;
    }
    if (v32)
    {
      *(_DWORD *)buf = 138412546;
      v43 = v14;
      v44 = 2112;
      v45 = v13;
      _os_log_impl(&dword_214503000, v12, OS_LOG_TYPE_DEFAULT, "FDR1 boot hash mismatch:%@::%@", buf, 0x16u);
    }

  }
  handleForCategory(0);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v33, OS_LOG_TYPE_DEFAULT, "FDR1 is not written / valid.", buf, 2u);
  }

  if (v8 || !v11)
    goto LABEL_6;
  objc_msgSend_dataWithBytesNoCopy_length_(MEMORY[0x24BDBCE50], v34, (uint64_t)v46, 4096);
  v12 = objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend__writeDataToEAN_withKey_(self, v35, (uint64_t)v12, (uint64_t)CFSTR("fdr1")) & 1) == 0)
  {
    handleForCategory(0);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_21456AAF4();
    goto LABEL_39;
  }
  if ((objc_msgSend_swapVersionedFDR(self, v36, v37, v38) & 1) == 0)
  {
    handleForCategory(0);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_21456AAC8();
LABEL_39:

LABEL_40:
    v16 = 0;
    goto LABEL_41;
  }
LABEL_5:

LABEL_6:
  handleForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v15, OS_LOG_TYPE_DEFAULT, "setupVersionedFDRWithApTicket success", buf, 2u);
  }

  v16 = 1;
LABEL_41:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->apTicket, 0);
}

@end
