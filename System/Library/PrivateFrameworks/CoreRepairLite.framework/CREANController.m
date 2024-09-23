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
    sub_22AE246E8(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_22AE24A98();

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
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  const __CFData *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  const __CFData *v17;
  NSObject *v18;
  const __CFData *LocalMultiDataBlobForClass;
  NSObject *v20;
  CFIndex Length;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  BOOL v25;
  BOOL v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  uint32_t v30;
  NSObject *v31;
  void *v32;
  BOOL v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  id obj;
  _QWORD v42[6];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  id v51;
  void *v52;
  uint8_t buf[4];
  const __CFData *v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v4 = (const __CFString *)a3;
  v51 = 0;
  v52 = 0;
  v40 = (void *)objc_opt_new();
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v39 = (__CFString *)v4;
  v6 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x24BDBD240], v4, kCFURLPOSIXPathStyle, 1u);
  Mutable = CFDictionaryCreateMutable(v5, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v8 = (const void *)*MEMORY[0x24BDBD268];
  CFDictionarySetValue(Mutable, CFSTR("GetCombined"), (const void *)*MEMORY[0x24BDBD268]);
  CFDictionarySetValue(Mutable, CFSTR("StripImg4"), v8);
  CFDictionarySetValue(Mutable, CFSTR("VerifyData"), v8);
  CFDictionarySetValue(Mutable, CFSTR("DataDirectory"), v6);
  -[CREANController _getDataClassesToWrite](self, "_getDataClassesToWrite");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9 || !objc_msgSend(v9, "count"))
  {
    v32 = v10;
    sub_22AE246E8(0);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_22AE24AC4();

    v12 = 0;
LABEL_55:
    v33 = 0;
    goto LABEL_60;
  }
  v38 = v10;
  sub_22AE246E8(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v54 = (const __CFData *)v10;
    _os_log_impl(&dword_22AE1C000, v11, OS_LOG_TYPE_DEFAULT, "Writing Following FDR Data Classes to EAN: %@", buf, 0xCu);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v10;
  v12 = 0;
  v13 = 0;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
  if (!v14)
    goto LABEL_47;
  v15 = *(_QWORD *)v44;
  while (2)
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v44 != v15)
        objc_enumerationMutation(obj);
      v17 = *(const __CFData **)(*((_QWORD *)&v43 + 1) + 8 * i);
      if (v13)
        CFRelease(v13);
      sub_22AE246E8(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v17;
        _os_log_impl(&dword_22AE1C000, v18, OS_LOG_TYPE_DEFAULT, "Copying data class: %@ to memory cache", buf, 0xCu);
      }

      if (-[__CFData isEqualToString:](v17, "isEqualToString:", CFSTR("seal")))
      {
        LocalMultiDataBlobForClass = (const __CFData *)AMFDRSealingMapCopyLocalDataForClass();
      }
      else if (AMFDRSealingMapEntryHasAttribute())
      {
        sub_22AE246E8(0);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v17;
          _os_log_impl(&dword_22AE1C000, v20, OS_LOG_TYPE_DEFAULT, "Copying multi data: %@", buf, 0xCu);
        }

        LocalMultiDataBlobForClass = (const __CFData *)AMFDRSealingMapCreateLocalMultiDataBlobForClass();
      }
      else
      {
        LocalMultiDataBlobForClass = (const __CFData *)AMFDRSealingManifestCopyLocalDataForClass();
      }
      v13 = LocalMultiDataBlobForClass;
      if (!LocalMultiDataBlobForClass || !CFDataGetLength(LocalMultiDataBlobForClass))
      {
        v22 = v52;
LABEL_29:
        if (v22)
        {

          v52 = 0;
        }
        else
        {
          v22 = v12;
        }
        sub_22AE246E8(0);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v54 = v17;
          v55 = 2112;
          v56 = v22;
          _os_log_impl(&dword_22AE1C000, v24, OS_LOG_TYPE_DEFAULT, "Failed to read FDR data instance for: %@ with error %@", buf, 0x16u);
        }

        v25 = -[CREANController readFDRDataFromEANWithDataClass:outData:stripPadding:](self, "readFDRDataFromEANWithDataClass:outData:stripPadding:", v17, &v51, 0);
        if (v51)
          v26 = v25;
        else
          v26 = 0;
        if (v26)
        {
          if (!-[CREANController deleteFDRDataFromEANWithDataClass:](self, "deleteFDRDataFromEANWithDataClass:", v17))
          {
            sub_22AE246E8(0);
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              sub_22AE24B1C();

            v33 = 0;
            v12 = v22;
            goto LABEL_59;
          }
          sub_22AE246E8(0);
          v27 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            goto LABEL_44;
          *(_DWORD *)buf = 138412290;
          v54 = v17;
          v28 = v27;
          v29 = "Successfully deleted %@ from EAN";
          v30 = 12;
        }
        else
        {
          sub_22AE246E8(0);
          v27 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
LABEL_44:

            v12 = v22;
            continue;
          }
          *(_WORD *)buf = 0;
          v28 = v27;
          v29 = "Data class already absent from EAN";
          v30 = 2;
        }
        _os_log_impl(&dword_22AE1C000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, v30);
        goto LABEL_44;
      }
      Length = CFDataGetLength(v13);
      v22 = v52;
      if (Length > 10000000 || v52)
        goto LABEL_29;
      sub_22AE246E8(0);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v13;
        _os_log_impl(&dword_22AE1C000, v23, OS_LOG_TYPE_DEFAULT, "Got instance data %@", buf, 0xCu);
      }

      objc_msgSend(v40, "setObject:forKeyedSubscript:", v13, v17);
    }
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
    if (v14)
      continue;
    break;
  }
LABEL_47:

  sub_22AE246E8(0);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22AE1C000, v31, OS_LOG_TYPE_DEFAULT, "Write data classes from memory cache to EAN", buf, 2u);
  }

  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = sub_22AE1D88C;
  v42[3] = &unk_24F5351A0;
  v42[4] = self;
  v42[5] = &v47;
  objc_msgSend(v40, "enumerateKeysAndObjectsUsingBlock:", v42);
  v32 = v38;
  if (*((_BYTE *)v48 + 24))
    goto LABEL_55;
  if (-[CREANController verifyFDRDataFromEANUsingCache:cachedData:](self, "verifyFDRDataFromEANUsingCache:cachedData:", 1, v40))
  {
    v33 = 1;
  }
  else
  {
    sub_22AE246E8(0);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_22AE24AF0();

    v33 = 0;
LABEL_59:
    v32 = v38;
  }
LABEL_60:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  _Block_object_dispose(&v47, 8);
  return v33;
}

- (BOOL)_writeDataToEAN:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  size_t v9;
  size_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  mach_port_t v19;
  const __CFDictionary *v20;
  io_service_t MatchingService;
  io_object_t v22;
  NSObject *v23;
  kern_return_t v24;
  NSObject *v25;
  NSObject *v26;
  BOOL v27;
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
  uint64_t v42;
  uint32_t outputCnt;
  uint64_t output;
  io_connect_t connect;
  uint8_t buf[4];
  _BYTE v47[10];
  __int16 v48;
  unsigned int v49;
  __int16 v50;
  unsigned int v51;
  __int16 v52;
  uint64_t v53;
  uint64_t input;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  connect = 0;
  v7 = a3;
  v8 = objc_msgSend(v7, "length");
  v9 = -(int)v8 & 0xFFFLL;
  input = 0;
  v55 = 0;
  v56 = 0;
  output = 0;
  outputCnt = 1;
  v10 = v9 + v8;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v9 + v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setData:", v7);

  v12 = malloc_type_malloc(v9, 0x702650DCuLL);
  v13 = v12;
  if (!v12)
  {
    sub_22AE246E8(0);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_22AE24BDC();
    goto LABEL_15;
  }
  bzero(v12, v9);
  objc_msgSend(v11, "appendBytes:length:", v13, v9);
  if (objc_msgSend(v11, "length") != v10)
  {
    sub_22AE246E8(0);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_22AE24DDC();
    goto LABEL_15;
  }
  v14 = objc_msgSend(v11, "length");
  v15 = objc_msgSend(objc_retainAutorelease(v11), "bytes");
  if ((v14 & 0xFFF) != 0)
  {
    sub_22AE246E8(0);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_22AE24D70(v26, v29, v30, v31, v32, v33, v34, v35);
    goto LABEL_15;
  }
  v16 = v15;
  v17 = -[CREANController _getQuerykeyFromDataClass:](self, "_getQuerykeyFromDataClass:", v6);
  if (!v17)
  {
    sub_22AE246E8(0);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_22AE24C08();
    goto LABEL_15;
  }
  v18 = v17;
  v19 = *MEMORY[0x24BDD8B18];
  v20 = IOServiceMatching("AppleNVMeEAN");
  MatchingService = IOServiceGetMatchingService(v19, v20);
  if (!MatchingService)
  {
    sub_22AE246E8(0);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_22AE24C34(v26, v36, v37, v38, v39, v40, v41, v42);
LABEL_15:
    v22 = 0;
LABEL_16:
    v27 = 0;
    goto LABEL_17;
  }
  v22 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, &connect))
  {
    sub_22AE246E8(0);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_22AE24D04();
    goto LABEL_16;
  }
  input = v18;
  v55 = v16;
  v56 = v14;
  sub_22AE246E8(0);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)v47 = HIBYTE(v18);
    *(_WORD *)&v47[4] = 1024;
    *(_DWORD *)&v47[6] = HIWORD(v18);
    v48 = 1024;
    v49 = v18 >> 8;
    v50 = 1024;
    v51 = v18;
    v52 = 2048;
    v53 = v14;
    _os_log_impl(&dword_22AE1C000, v23, OS_LOG_TYPE_DEFAULT, "Writing EAN key %c%c%c%c, imageSize=%llu", buf, 0x24u);
  }

  v24 = IOConnectCallMethod(connect, 2u, &input, 3u, 0, 0, &output, &outputCnt, 0, 0);
  sub_22AE246E8(0);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_22AE24CA4();
    goto LABEL_16;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v47 = v6;
    _os_log_impl(&dword_22AE1C000, v26, OS_LOG_TYPE_DEFAULT, "Successfully written %@ data to EAN", buf, 0xCu);
  }
  v27 = 1;
LABEL_17:

  if (connect)
  {
    IOServiceClose(connect);
    connect = 0;
  }
  if (v22)
    IOObjectRelease(v22);
  AMSupportSafeFree();

  return v27;
}

- (id)_getDataClassesToWrite
{
  id v3;
  io_registry_entry_t v4;
  io_object_t v5;
  const __CFData *CFProperty;
  const __CFData *v7;
  int64_t Length;
  const UInt8 *BytePtr;
  char *v10;
  char *v11;
  int64_t v12;
  char v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v19;
  unint64_t v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (!-[CREANController isEANSupported](self, "isEANSupported"))
  {
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
  v4 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B18], "IODeviceTree:/chosen");
  if (!v4)
  {
    sub_22AE246E8(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_22AE24E08();

    goto LABEL_18;
  }
  v5 = v4;
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v4, CFSTR("syscfg-erly-kbgs-data-class"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (!CFProperty)
  {
    sub_22AE246E8(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_22AE24E34();

    IOObjectRelease(v5);
    goto LABEL_18;
  }
  v7 = CFProperty;
  Length = CFDataGetLength(CFProperty);
  BytePtr = CFDataGetBytePtr(v7);
  v10 = (char *)malloc_type_malloc(Length, 0x100004077774924uLL);
  if (v10)
  {
    v11 = v10;
    if (Length >= 1)
    {
      v12 = Length;
      do
      {
        v13 = *BytePtr++;
        v10[--v12] = v13;
      }
      while (v12);
    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v10, Length, 4);
    if ((objc_msgSend(v14, "length") & 3) != 0)
    {
      sub_22AE246E8(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 138412290;
        v23 = v14;
        _os_log_impl(&dword_22AE1C000, v15, OS_LOG_TYPE_DEFAULT, "earlyKBGSDataClass %@ length is not multiple of 4", (uint8_t *)&v22, 0xCu);
      }

    }
    else
    {
      if (objc_msgSend(v14, "length"))
      {
        v20 = 0;
        do
        {
          objc_msgSend(v14, "substringWithRange:", v20, 4);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (+[CRFDRUtils isDataClassSupported:](CRFDRUtils, "isDataClassSupported:", v21))
            objc_msgSend(v3, "addObject:", v21);

          v20 += 4;
        }
        while (objc_msgSend(v14, "length") > v20);
      }
      if ((objc_msgSend(v3, "containsObject:", CFSTR("seal")) & 1) == 0
        && +[CRFDRUtils isDataClassSupported:](CRFDRUtils, "isDataClassSupported:", CFSTR("seal")))
      {
        objc_msgSend(v3, "addObject:", CFSTR("seal"));
      }
    }
  }
  else
  {
    sub_22AE246E8(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_22AE24E60();

    v11 = 0;
    v14 = 0;
  }
  IOObjectRelease(v5);
  CFRelease(v7);
  if (v11)
    free(v11);
LABEL_19:

  return v3;
}

- (BOOL)readFDRDataFromEANWithDataClass:(id)a3 outData:(id *)a4 stripPadding:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  mach_port_t v14;
  const __CFDictionary *v15;
  io_service_t MatchingService;
  io_object_t v17;
  NSObject *v18;
  BOOL v19;
  void *v21;
  NSObject *v22;
  BOOL v23;
  NSObject *v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  unint64_t v38;
  uint32_t outputCnt;
  uint64_t output;
  io_connect_t connect;
  uint64_t v42[3];
  uint8_t buf[4];
  _BYTE v44[10];
  unint64_t v45;
  unsigned int v46;
  __int16 v47;
  uint64_t v48;
  uint64_t input[2];

  v5 = a5;
  input[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = v8;
  connect = 0;
  output = 0;
  outputCnt = 1;
  if (!v8 || (v10 = objc_msgSend(v8, "length"), !a4) || !v10)
  {
    sub_22AE246E8(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_22AE24E8C();
    goto LABEL_12;
  }
  v11 = -[CREANController _getQuerykeyFromDataClass:](self, "_getQuerykeyFromDataClass:", v9);
  if (!v11)
  {
    sub_22AE246E8(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_22AE24C08();
    goto LABEL_12;
  }
  v12 = v11;
  v13 = v11;
  input[0] = v11;
  v14 = *MEMORY[0x24BDD8B18];
  v15 = IOServiceMatching("AppleNVMeEAN");
  MatchingService = IOServiceGetMatchingService(v14, v15);
  if (!MatchingService)
  {
    sub_22AE246E8(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_22AE24C34(v18, v30, v31, v32, v33, v34, v35, v36);
LABEL_12:
    v17 = 0;
LABEL_13:
    v19 = 0;
    goto LABEL_14;
  }
  v17 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, &connect))
  {
    sub_22AE246E8(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_22AE24D04();
    goto LABEL_13;
  }
  if (IOConnectCallScalarMethod(connect, 3u, input, 1u, &output, &outputCnt))
  {
    sub_22AE246E8(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_22AE24F70();
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", output);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AE246E8(0);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)v44 = HIBYTE(v12);
    *(_WORD *)&v44[4] = 1024;
    *(_DWORD *)&v44[6] = HIWORD(v12);
    LOWORD(v45) = 1024;
    *(_DWORD *)((char *)&v45 + 2) = v12 >> 8;
    HIWORD(v45) = 1024;
    v46 = v12;
    v47 = 2048;
    v48 = output;
    _os_log_impl(&dword_22AE1C000, v22, OS_LOG_TYPE_DEFAULT, "Reading EAN key %c%c%c%c, imageSize=%llu", buf, 0x24u);
  }

  v42[0] = v13;
  v18 = objc_retainAutorelease(v21);
  v42[1] = -[NSObject mutableBytes](v18, "mutableBytes");
  v42[2] = output;
  if (IOConnectCallScalarMethod(connect, 4u, v42, 3u, 0, 0))
  {
    sub_22AE246E8(0);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_22AE24F10();
    goto LABEL_45;
  }
  if (!v5)
  {
    v27 = -[NSObject copy](v18, "copy");
    goto LABEL_32;
  }
  v38 = 0;
  v23 = -[CREANController calculateDerLength:actualSize:](self, "calculateDerLength:actualSize:", v18, &v38);
  sub_22AE246E8(0);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = -[NSObject length](v18, "length");
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v44 = v25;
    *(_WORD *)&v44[8] = 2048;
    v45 = v38;
    _os_log_impl(&dword_22AE1C000, v24, OS_LOG_TYPE_DEFAULT, "Image size: %ld DER size: %ld", buf, 0x16u);
  }

  if (!v23)
  {
    sub_22AE246E8(0);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_22AE24EE4();
    goto LABEL_45;
  }
  v26 = v38;
  if (!v38 || v26 > -[NSObject length](v18, "length"))
  {
    sub_22AE246E8(0);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_22AE24EB8();
LABEL_45:

    goto LABEL_13;
  }
  -[NSObject subdataWithRange:](v18, "subdataWithRange:", 0, v38);
  v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:
  v28 = *a4;
  *a4 = v27;

  sub_22AE246E8(0);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v44 = v9;
    _os_log_impl(&dword_22AE1C000, v29, OS_LOG_TYPE_DEFAULT, "Successfully read %@ from EAN", buf, 0xCu);
  }

  v19 = 1;
LABEL_14:

  if (connect)
  {
    IOServiceClose(connect);
    connect = 0;
  }
  if (v17)
    IOObjectRelease(v17);

  return v19;
}

- (unsigned)_getQuerykeyFromDataClass:(id)a3
{
  id v3;
  unsigned int v4;
  NSObject *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 4)
  {
    v4 = bswap32(*(_DWORD *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
  }
  else
  {
    sub_22AE246E8(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_22AE24FD0(v3, v6);

    v4 = 0;
  }

  return v4;
}

- (BOOL)deleteFDRDataFromEANWithDataClass:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  mach_port_t v8;
  const __CFDictionary *v9;
  io_service_t MatchingService;
  io_object_t v11;
  kern_return_t v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t output;
  uint32_t outputCnt;
  io_connect_t connect;
  uint8_t buf[4];
  void *v28;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  input[0] = 0;
  outputCnt = 1;
  connect = 0;
  output = 0;
  if (!v4 || !objc_msgSend(v4, "length"))
  {
    sub_22AE246E8(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_22AE24E8C();
    goto LABEL_12;
  }
  v6 = -[CREANController _getQuerykeyFromDataClass:](self, "_getQuerykeyFromDataClass:", v5);
  if (!v6)
  {
    sub_22AE246E8(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_22AE24C08();
    goto LABEL_12;
  }
  v7 = v6;
  v8 = *MEMORY[0x24BDD8B18];
  v9 = IOServiceMatching("AppleNVMeEAN");
  MatchingService = IOServiceGetMatchingService(v8, v9);
  if (!MatchingService)
  {
    sub_22AE246E8(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_22AE24C34(v14, v17, v18, v19, v20, v21, v22, v23);
LABEL_12:
    v11 = 0;
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  v11 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, &connect))
  {
    sub_22AE246E8(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_22AE24D04();
    goto LABEL_13;
  }
  input[0] = v7;
  v12 = IOConnectCallMethod(connect, 5u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
  sub_22AE246E8(0);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_22AE25054();
    goto LABEL_13;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v5;
    _os_log_impl(&dword_22AE1C000, v14, OS_LOG_TYPE_DEFAULT, "Successfully deleted %@ from EAN", buf, 0xCu);
  }
  v15 = 1;
LABEL_14:

  if (connect)
  {
    IOServiceClose(connect);
    connect = 0;
  }
  if (v11)
    IOObjectRelease(v11);

  return v15;
}

- (BOOL)verifyFDRDataFromEANUsingCache:(BOOL)a3 cachedData:(id)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  _BOOL4 v18;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  __CFDictionary *Mutable;
  const void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t LocalMultiDataBlobForClass;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  unint64_t v38;
  NSObject *v39;
  _BOOL4 v40;
  NSObject *v41;
  NSObject *v44;
  id v45;
  NSObject *obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  unint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  unint64_t v59;
  __int16 v60;
  uint64_t v61;
  _BYTE v62[128];
  uint64_t v63;

  v4 = a3;
  v63 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  sub_22AE246E8(0);
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
        _os_log_impl(&dword_22AE1C000, v7, OS_LOG_TYPE_DEFAULT, "Verifying EAN FDR data from cache...", buf, 2u);
      }

      v56 = 0u;
      v54 = 0u;
      v55 = 0u;
      v53 = 0u;
      v7 = v5;
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      if (!v10)
      {
        v8 = 1;
        goto LABEL_76;
      }
      v11 = v10;
      v45 = v5;
      v12 = *(_QWORD *)v54;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v54 != v12)
            objc_enumerationMutation(v7);
          v14 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
          sub_22AE246E8(0);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v59 = v14;
            _os_log_impl(&dword_22AE1C000, v15, OS_LOG_TYPE_DEFAULT, "Verifying data class: %@", buf, 0xCu);
          }

          v52 = 0;
          v16 = v7;
          -[NSObject objectForKey:](v7, "objectForKey:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[CREANController readFDRDataFromEANWithDataClass:outData:stripPadding:](self, "readFDRDataFromEANWithDataClass:outData:stripPadding:", v14, &v52, 1);
          v19 = v52;
          sub_22AE246E8(0);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (!v18 || v19 == 0)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              sub_22AE25140();
            v7 = v16;
            goto LABEL_72;
          }
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v59 = v52;
            v60 = 2112;
            v61 = (uint64_t)v17;
            _os_log_impl(&dword_22AE1C000, v21, OS_LOG_TYPE_DEFAULT, "Comparing data class: %@ : %@", buf, 0x16u);
          }

          v7 = v16;
          if ((objc_msgSend(v17, "isEqualToData:", v52) & 1) == 0)
          {
            sub_22AE246E8(0);
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              sub_22AE250E0();
LABEL_72:

            goto LABEL_5;
          }

        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
        if (v11)
          continue;
        break;
      }
    }
    else
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22AE1C000, v7, OS_LOG_TYPE_DEFAULT, "Verifying EAN FDR data from FDR local store...", buf, 2u);
      }

      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v24 = (const void *)*MEMORY[0x24BDBD268];
      CFDictionarySetValue(Mutable, CFSTR("GetCombined"), (const void *)*MEMORY[0x24BDBD268]);
      CFDictionarySetValue(Mutable, CFSTR("StripImg4"), v24);
      CFDictionarySetValue(Mutable, CFSTR("VerifyData"), v24);
      -[CREANController _getDataClassesToWrite](self, "_getDataClassesToWrite");
      v7 = objc_claimAutoreleasedReturnValue();
      sub_22AE246E8(0);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v59 = (unint64_t)v7;
        _os_log_impl(&dword_22AE1C000, v25, OS_LOG_TYPE_DEFAULT, "EAN Data classes to verify: %@", buf, 0xCu);
      }

      if (!v7 || !-[NSObject count](v7, "count"))
      {
        sub_22AE246E8(0);
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          sub_22AE2516C();

        goto LABEL_5;
      }
      v45 = v5;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      obj = v7;
      v26 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v49;
        while (2)
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v49 != v28)
              objc_enumerationMutation(obj);
            v30 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
            v31 = (void *)MEMORY[0x22E2E833C]();
            v52 = 0;
            sub_22AE246E8(0);
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v59 = (unint64_t)v30;
              _os_log_impl(&dword_22AE1C000, v32, OS_LOG_TYPE_DEFAULT, "Verifying data class: %@", buf, 0xCu);
            }

            if (objc_msgSend(v30, "isEqualToString:", CFSTR("seal")))
            {
              LocalMultiDataBlobForClass = AMFDRSealingMapCopyLocalDataForClass();
            }
            else if (AMFDRSealingMapEntryHasAttribute())
            {
              sub_22AE246E8(0);
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v59 = (unint64_t)v30;
                _os_log_impl(&dword_22AE1C000, v34, OS_LOG_TYPE_DEFAULT, "Copying multi data: %@", buf, 0xCu);
              }

              LocalMultiDataBlobForClass = AMFDRSealingMapCreateLocalMultiDataBlobForClass();
            }
            else
            {
              LocalMultiDataBlobForClass = AMFDRSealingManifestCopyLocalDataForClass();
            }
            v35 = LocalMultiDataBlobForClass;
            if (!LocalMultiDataBlobForClass)
            {
              sub_22AE246E8(0);
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v59 = 0;
                _os_log_impl(&dword_22AE1C000, v36, OS_LOG_TYPE_DEFAULT, "Failed to get data class from local store, error: %@", buf, 0xCu);
              }

            }
            if (!-[CREANController readFDRDataFromEANWithDataClass:outData:stripPadding:](self, "readFDRDataFromEANWithDataClass:outData:stripPadding:", v30, &v52, 1))
            {
              sub_22AE246E8(0);
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22AE1C000, v37, OS_LOG_TYPE_DEFAULT, "Failed to read data class from EAN", buf, 2u);
              }

            }
            v38 = v35 | v52;
            sub_22AE246E8(0);
            v39 = objc_claimAutoreleasedReturnValue();
            v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
            if (v38)
            {
              if (v40)
              {
                *(_DWORD *)buf = 138412546;
                v59 = v52;
                v60 = 2112;
                v61 = v35;
                _os_log_impl(&dword_22AE1C000, v39, OS_LOG_TYPE_DEFAULT, "Comparing data class: %@ : %@", buf, 0x16u);
              }

              if ((objc_msgSend((id)v35, "isEqualToData:", v52) & 1) == 0)
              {
                sub_22AE246E8(0);
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                  sub_22AE25198();

                objc_autoreleasePoolPop(v31);
                v7 = obj;

                v8 = 0;
                v5 = v45;
                goto LABEL_76;
              }
            }
            else
            {
              if (v40)
              {
                *(_DWORD *)buf = 138412290;
                v59 = (unint64_t)v30;
                _os_log_impl(&dword_22AE1C000, v39, OS_LOG_TYPE_DEFAULT, "Data class (%@) both missing in EAN and FDR local store. Continue.", buf, 0xCu);
              }

            }
            objc_autoreleasePoolPop(v31);
          }
          v27 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
          if (v27)
            continue;
          break;
        }
      }
      v7 = obj;

    }
    v8 = 1;
    v5 = v45;
    goto LABEL_76;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_22AE250B4();
LABEL_5:
  v8 = 0;
LABEL_76:

  AMSupportSafeRelease();
  return v8;
}

- (BOOL)calculateDerLength:(id)a3 actualSize:(unint64_t *)a4
{
  id v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD v14[2];

  v5 = objc_retainAutorelease(a3);
  v14[0] = objc_msgSend(v5, "bytes");
  v6 = objc_msgSend(v5, "length");

  v14[1] = v6;
  v12 = 0;
  v13 = 0;
  v10 = 0;
  v11 = 0;
  v7 = sub_22AE247C0((uint64_t)v14, &v10, &v13);
  if (v7)
  {
    *a4 = 0;
    sub_22AE246E8(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_22AE251F8();

  }
  else
  {
    *a4 = v11 - v14[0] + v12;
  }
  return v7 == 0;
}

- (id)_apticketCopyDataObjectPropertyWithTag:(unint64_t)a3 property:(unint64_t)a4
{
  NSData *apTicket;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  const char *v31;
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
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v60 = 0;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
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
  v32 = 0u;
  v33 = 0u;
  apTicket = self->apTicket;
  if (apTicket)
  {
    -[NSData bytes](apTicket, "bytes");
    -[NSData length](self->apTicket, "length");
    if (Img4DecodeInitManifest())
    {
      sub_22AE246E8(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v31 = "-[CREANController _apticketCopyDataObjectPropertyWithTag:property:]";
        _os_log_impl(&dword_22AE1C000, v6, OS_LOG_TYPE_DEFAULT, "%s: failed to parse AP ticket as Img4 manifest", buf, 0xCu);
      }
    }
    else if (Img4DecodeGetObjectPropertyData())
    {
      sub_22AE246E8(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_22AE25338(v6, v14, v15, v16, v17, v18, v19, v20);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
        return v21;
      sub_22AE246E8(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_22AE252C8(v6, v23, v24, v25, v26, v27, v28, v29);
    }
  }
  else
  {
    sub_22AE246E8(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_22AE25258(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  v21 = 0;
  return v21;
}

- (id)copyCurrentFDREANValuesWithdataDir:(id)a3 error:(id *)a4
{
  void *v6;
  __CFDictionary *Mutable;
  __CFDictionary *v8;
  const void *v9;
  uint64_t v10;
  void *v11;
  const __CFArray *v12;
  const __CFArray *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSData *apTicket;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->apTicket)
  {
    sub_22AE246E8(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_22AE253A8();
    goto LABEL_13;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    sub_22AE246E8(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_22AE253D4();
LABEL_13:
    v11 = 0;
    goto LABEL_20;
  }
  v8 = Mutable;
  CFDictionaryAddValue(Mutable, CFSTR("CopyAllowUnsealed"), (const void *)*MEMORY[0x24BDBD270]);
  v9 = (const void *)*MEMORY[0x24BDBD268];
  CFDictionarySetValue(v8, CFSTR("GetCombined"), (const void *)*MEMORY[0x24BDBD268]);
  CFDictionaryAddValue(v8, CFSTR("VerifyData"), v9);
  if (!v6)
  {
    sub_22AE246E8(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_22AE25400(v20, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_33;
  }
  CFDictionaryAddValue(v8, CFSTR("DataDirectory"), v6);
  if (!AMFDRCreateTypeWithOptions())
  {
    sub_22AE246E8(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_22AE25468();
LABEL_33:
    v11 = 0;
    goto LABEL_20;
  }
  -[CREANController _apticketCopyDataObjectPropertyWithTag:property:](self, "_apticketCopyDataObjectPropertyWithTag:property:", 1718903152, 1145525076);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    sub_22AE246E8(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v11 = 0;
      goto LABEL_15;
    }
    sub_22AE25494();
    v11 = 0;
LABEL_20:
    v16 = 0;
    goto LABEL_21;
  }
  v11 = (void *)v10;
  AMFDRSetOption();
  if ((AMFDRDataCopyTrustObject() & 1) == 0)
  {
    sub_22AE246E8(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
LABEL_15:
      v16 = 0;
      goto LABEL_21;
    }
    sub_22AE25518();
    goto LABEL_20;
  }
  v12 = (const __CFArray *)AMFDRSealingMapCopyMultiInstanceForClass();
  v13 = v12;
  if (!v12 || CFArrayGetCount(v12) < 1)
  {
    if (a4)
      *a4 = 0;
    sub_22AE246E8(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_22AE254C0();
    goto LABEL_20;
  }
  CFArrayGetValueAtIndex(v13, 0);
  v14 = AMFDRSealingMapCopyLocalData();
  if (!v14)
  {
    if (a4)
      *a4 = 0;
    sub_22AE246E8(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_22AE254EC();
    goto LABEL_20;
  }
  v15 = v14;
  v16 = (void *)objc_opt_new();
  apTicket = self->apTicket;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1802793057);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", apTicket, v18);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1953722996);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, v19);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1818322291);
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v20);
LABEL_21:

  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  v21 = v16;

  return v21;
}

- (unint64_t)sizeEAN:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  mach_port_t v7;
  const __CFDictionary *v8;
  io_service_t MatchingService;
  io_object_t v10;
  uint64_t v11;
  NSObject *v13;
  uint64_t output;
  uint32_t outputCnt;
  io_connect_t connect;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  memset(input, 0, 24);
  outputCnt = 1;
  connect = 0;
  output = 0;
  if (!v4)
  {
    sub_22AE246E8(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_22AE25544();
    goto LABEL_18;
  }
  v5 = -[CREANController _getQuerykeyFromDataClass:](self, "_getQuerykeyFromDataClass:", v4);
  if (!v5)
  {
    sub_22AE246E8(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_22AE25570();
    goto LABEL_18;
  }
  v6 = v5;
  v7 = *MEMORY[0x24BDD8B18];
  v8 = IOServiceMatching("AppleNVMeEAN");
  MatchingService = IOServiceGetMatchingService(v7, v8);
  if (!MatchingService)
  {
    sub_22AE246E8(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_22AE2559C();
LABEL_18:
    v10 = 0;
    goto LABEL_25;
  }
  v10 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, &connect))
  {
    sub_22AE246E8(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_22AE25654();
  }
  else if (connect)
  {
    input[0] = v6;
    if (!IOConnectCallMethod(connect, 3u, input, 3u, 0, 0, &output, &outputCnt, 0, 0))
      goto LABEL_7;
    sub_22AE246E8(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_22AE255F4();
  }
  else
  {
    sub_22AE246E8(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_22AE255C8();
  }
LABEL_25:

LABEL_7:
  if (connect)
  {
    IOServiceClose(connect);
    connect = 0;
  }
  if (v10)
    IOObjectRelease(v10);
  v11 = output;

  return v11;
}

- (BOOL)copyFDREANValues:(id)a3 outgenerationCount:(unsigned int *)a4 outManifesthash:(id *)a5
{
  id v8;
  unint64_t v9;
  NSObject *v10;
  const char *v11;
  unint64_t v12;
  _DWORD *v13;
  _DWORD *v14;
  unsigned int v15;
  BOOL v16;
  unsigned int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  int v24;
  id v25;
  uint8_t buf[4];
  _BYTE v27[14];
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v25 = 0;
  if (!-[CREANController readFDRDataFromEANWithDataClass:outData:stripPadding:](self, "readFDRDataFromEANWithDataClass:outData:stripPadding:", v8, &v25, 0))
  {
    sub_22AE246E8(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v27 = v8;
      v11 = "Failed to load EAN key: %@";
      goto LABEL_7;
    }
LABEL_17:
    v16 = 0;
    goto LABEL_18;
  }
  v9 = objc_msgSend(v25, "length");
  if (v9 <= 0x1F)
  {
    sub_22AE246E8(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v27 = v8;
      v11 = "Entry too small to be versioned blob: %@";
LABEL_7:
      _os_log_impl(&dword_22AE1C000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  v12 = v9;
  v13 = (_DWORD *)objc_msgSend(objc_retainAutorelease(v25), "bytes");
  v14 = v13;
  if (*v13 != 1769104486)
  {
    sub_22AE246E8(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_22AE257FC();
    goto LABEL_17;
  }
  if (v13[1] != 1)
  {
    sub_22AE246E8(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_22AE25790();
    goto LABEL_17;
  }
  v15 = v13[2];
  if (v15 + 1 <= 1)
  {
    sub_22AE246E8(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_22AE25764();
    goto LABEL_17;
  }
  v18 = v13[3];
  if (v18 <= 0x1F)
  {
    sub_22AE246E8(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_22AE256B4();
    goto LABEL_17;
  }
  v19 = v13[4];
  if (!v19)
  {
    sub_22AE246E8(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_22AE256E0();
    goto LABEL_17;
  }
  if (v12 <= v19 + v18)
  {
    sub_22AE246E8(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_22AE25738();
    goto LABEL_17;
  }
  v20 = v13[5];
  if (!(_DWORD)v20)
  {
    sub_22AE246E8(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_22AE2570C();
    goto LABEL_17;
  }
  v21 = 16 * v20;
  if (16 * v20 != v13[7])
  {
    sub_22AE246E8(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v23 = v14[5];
      v24 = v14[7];
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v27 = v23;
      *(_WORD *)&v27[4] = 2048;
      *(_QWORD *)&v27[6] = 16;
      v28 = 2048;
      v29 = v21;
      v30 = 1024;
      v31 = v24;
      _os_log_error_impl(&dword_22AE1C000, v10, OS_LOG_TYPE_ERROR, "FDR info payload is incorrect size.\tExpect: %d * %lu = %zu\tFound: %d", buf, 0x22u);
    }
    goto LABEL_17;
  }
  if (a4)
    *a4 = v15;
  if (!a5)
  {
    v16 = 1;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", (char *)v13 + v13[3], v13[4]);
  v22 = objc_claimAutoreleasedReturnValue();
  v10 = v22;
  v16 = v22 != 0;
  if (v22)
  {
    v10 = objc_retainAutorelease(v22);
    *a5 = v10;
    v16 = 1;
  }
LABEL_18:

LABEL_19:
  return v16;
}

- (unsigned)nextEANGenerationCount
{
  unsigned int v3;
  _BOOL4 v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v9;

  v9 = 0;
  if (-[CREANController copyFDREANValues:outgenerationCount:outManifesthash:](self, "copyFDREANValues:outgenerationCount:outManifesthash:", CFSTR("fdr1"), &v9, 0))
  {
    v3 = v9;
  }
  else
  {
    v3 = 0;
  }
  v4 = -[CREANController copyFDREANValues:outgenerationCount:outManifesthash:](self, "copyFDREANValues:outgenerationCount:outManifesthash:", CFSTR("fdr2"), &v9, 0);
  v5 = v9;
  if (!v4)
    v5 = 0;
  if (v3 <= v5)
    v6 = v5;
  else
    v6 = v3;
  if (v3 < v5)
    v5 = v3;
  if (v5 == 1)
    v7 = 2;
  else
    v7 = 1;
  if (v6 == -2)
    return v7;
  else
    return v6 + 1;
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
  CFIndex v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  NSObject *v23;
  CFIndex v24;
  _DWORD *v25;
  const __CFData **v26;
  const __CFNumber **v27;
  int64_t v28;
  const __CFData *v29;
  CFIndex v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  const __CFNumber *v34;
  __CFData *Mutable;
  NSObject *v36;
  const UInt8 *v37;
  CFIndex v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t i;
  uint64_t v42;
  const UInt8 *v43;
  uint64_t v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v49;
  const __CFAllocator *allocator;
  const void **v51;
  const __CFData *theData;
  UInt8 *v53;
  uint64_t v54;
  UInt8 bytes[16];
  __int128 v56;
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  unsigned __int8 md[16];
  __int128 v62;
  __int128 v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v62 = 0u;
  v63 = 0u;
  *(_OWORD *)md = 0u;
  *(_OWORD *)bytes = 0u;
  v56 = 0u;
  v5 = -[CREANController copyCurrentFDREANValuesWithdataDir:error:](self, "copyCurrentFDREANValuesWithdataDir:error:", a3, a4);
  v6 = v5;
  if (!v5)
  {
    sub_22AE246E8(0);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      sub_22AE2586C();
    goto LABEL_49;
  }
  Count = CFDictionaryGetCount(v5);
  if (!Count)
  {
    sub_22AE246E8(0);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      sub_22AE25898();
LABEL_49:

    Mutable = 0;
    goto LABEL_50;
  }
  v8 = Count;
  v9 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
  v10 = (const void **)malloc_type_calloc(v8, 8uLL, 0x6004044C4A2DFuLL);
  v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v12 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &unk_22AE26E08);
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
    v53 = (UInt8 *)malloc_type_calloc(v8, 0x10uLL, 0x1000040451B5BE8uLL);
    v18 = CFDataGetLength(v17);
    v19 = v18;
    v20 = v18 & 3;
    if (v18 <= 0)
      v20 = -(-v18 & 3);
    if (v20)
      v21 = v18 - v20 + 4;
    else
      v21 = v18;
    v54 = v21;
    *(_QWORD *)bytes = 0x169726466;
    v22 = -[CREANController nextEANGenerationCount](self, "nextEANGenerationCount");
    *(_DWORD *)&bytes[8] = v22;
    sub_22AE246E8(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v58) = v22;
      _os_log_impl(&dword_22AE1C000, v23, OS_LOG_TYPE_DEFAULT, "Will use generation count: %u", buf, 8u);
    }

    *(_DWORD *)&bytes[12] = 32;
    theData = v17;
    LODWORD(v56) = CFDataGetLength(v17);
    DWORD1(v56) = v8;
    DWORD2(v56) = v54 + 32;
    HIDWORD(v56) = 16 * v8;
    v51 = v9;
    v24 = v54 + 32 + 16 * v8;
    if (v8 >= 1)
    {
      v25 = v53 + 8;
      v26 = (const __CFData **)v10;
      v27 = (const __CFNumber **)v9;
      v28 = v8;
      do
      {
        v29 = *v26++;
        v30 = CFDataGetLength(v29);
        v31 = v30;
        if (v30 <= 0)
          v32 = -(-v30 & 3);
        else
          v32 = v30 & 3;
        if (v32)
          v33 = v30 - v32 + 4;
        else
          v33 = v30;
        v34 = *v27++;
        *(_DWORD *)buf = 0;
        CFNumberGetValue(v34, kCFNumberSInt32Type, buf);
        *(v25 - 2) = *(_DWORD *)buf;
        *(v25 - 1) = v24;
        *v25 = v31;
        v25 += 4;
        v24 += v33;
        --v28;
      }
      while (v28);
    }
    Mutable = CFDataCreateMutable(allocator, v24);
    CFDataAppendBytes(Mutable, bytes, 32);
    sub_22AE246E8(0);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22AE1C000, v36, OS_LOG_TYPE_DEFAULT, "Added header.", buf, 2u);
    }

    v37 = CFDataGetBytePtr(theData);
    v38 = CFDataGetLength(theData);
    CFDataAppendBytes(Mutable, v37, v38);
    if (v54 != v19)
      CFDataIncreaseLength(Mutable, v54 - v19);
    sub_22AE246E8(0);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22AE1C000, v39, OS_LOG_TYPE_DEFAULT, "Added hash.", buf, 2u);
    }

    CFDataAppendBytes(Mutable, v53, 16 * v8);
    sub_22AE246E8(0);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22AE1C000, v40, OS_LOG_TYPE_DEFAULT, "Added payload table.", buf, 2u);
    }

    if (v8 >= 1)
    {
      for (i = 0; i != v8; ++i)
      {
        v42 = CFDataGetLength((CFDataRef)v10[i]);
        v43 = CFDataGetBytePtr((CFDataRef)v10[i]);
        CFDataAppendBytes(Mutable, v43, v42);
        v44 = v42 & 3;
        if (v42 <= 0)
          v44 = -(-v42 & 3);
        if (v44)
          CFDataIncreaseLength(Mutable, 4 - v44);
        sub_22AE246E8(0);
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v58 = i;
          v59 = 2048;
          v60 = v42;
          _os_log_impl(&dword_22AE1C000, v45, OS_LOG_TYPE_DEFAULT, "Added element %ld. Size: %ld", buf, 0x16u);
        }

      }
    }
    sub_22AE246E8(0);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22AE1C000, v46, OS_LOG_TYPE_DEFAULT, "Success.", buf, 2u);
    }

    v9 = v51;
    if (v53)
      free(v53);
    if (!v51)
      goto LABEL_43;
  }
  else
  {
    sub_22AE246E8(0);
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      sub_22AE258C4();

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
  void *v6;
  mach_port_t v7;
  const __CFDictionary *v8;
  io_service_t MatchingService;
  io_object_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  BOOL v21;
  io_object_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  io_connect_t connect;
  uint8_t buf[4];
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  connect = 0;
  if (!v5)
  {
    sub_22AE246E8(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_22AE258F0();
    goto LABEL_32;
  }
  if (!objc_msgSend(v5, "count"))
  {
    v21 = 1;
    goto LABEL_27;
  }
  v7 = *MEMORY[0x24BDD8B18];
  v8 = IOServiceMatching("AppleNVMeEAN");
  MatchingService = IOServiceGetMatchingService(v7, v8);
  if (!MatchingService)
  {
    sub_22AE246E8(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_22AE2591C();
LABEL_32:
    v10 = 0;
    goto LABEL_37;
  }
  v10 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, &connect))
  {
    sub_22AE246E8(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_22AE25974();
  }
  else
  {
    if (connect)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v11 = v6;
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
      if (v12)
      {
        v13 = v12;
        v23 = v10;
        v24 = v6;
        v14 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v26 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
            -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = -[CREANController _writeDataToEAN:withKey:](self, "_writeDataToEAN:withKey:", v17, v16);

            sub_22AE246E8(0);
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (!v18)
            {
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                sub_22AE24B7C();

              v21 = 0;
              goto LABEL_20;
            }
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v31 = v16;
              _os_log_impl(&dword_22AE1C000, v20, OS_LOG_TYPE_DEFAULT, "EAN write success :%@", buf, 0xCu);
            }

          }
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
          if (v13)
            continue;
          break;
        }
        v21 = 1;
LABEL_20:
        v6 = v24;
        v10 = v23;
      }
      else
      {
        v21 = 1;
      }
      goto LABEL_23;
    }
    sub_22AE246E8(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_22AE25948();
  }
LABEL_37:
  v21 = 0;
LABEL_23:

  if (connect)
  {
    IOServiceClose(connect);
    connect = 0;
  }
  if (v10)
    IOObjectRelease(v10);
LABEL_27:

  return v21;
}

- (BOOL)stageVersionedFDREANWithdataDir:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;
  uint8_t buf[4];
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = -[CREANController sizeEAN:](self, "sizeEAN:", CFSTR("fdr1"));
  v7 = v6 | -[CREANController sizeEAN:](self, "sizeEAN:", CFSTR("fdr2"));
  sub_22AE246E8(0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22AE1C000, v8, OS_LOG_TYPE_DEFAULT, "Preparing to write staged FDR EAN key.", buf, 2u);
    }

    v24 = 0;
    v8 = -[CREANController copyStagedFDREanDataWithdataDir:error:](self, "copyStagedFDREanDataWithdataDir:error:", v5, &v24);
    v10 = v24;
    if (v10 || !v8)
    {
      sub_22AE246E8(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_22AE259D4();

    }
    else
    {
      v11 = -[CREANController _writeDataToEAN:withKey:](self, "_writeDataToEAN:withKey:", v8, CFSTR("fdr2"));
      sub_22AE246E8(0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v26 = CFSTR("fdr2");
          _os_log_impl(&dword_22AE1C000, v13, OS_LOG_TYPE_DEFAULT, "EAN write success :%@", buf, 0xCu);
        }

        goto LABEL_12;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_22AE25A50(v13, v16, v17, v18, v19, v20, v21, v22);

    }
    v14 = 0;
    goto LABEL_20;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22AE1C000, v8, OS_LOG_TYPE_DEFAULT, "fdr1 & fdr2 are blank returning.", buf, 2u);
  }
LABEL_12:
  v14 = 1;
LABEL_20:

  return v14;
}

- (BOOL)swapEAN:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  mach_port_t v13;
  const __CFDictionary *v14;
  io_service_t MatchingService;
  io_object_t v16;
  NSObject *v17;
  kern_return_t v18;
  NSObject *v19;
  NSObject *v20;
  BOOL v21;
  uint32_t outputCnt;
  uint64_t output;
  io_connect_t connect;
  uint8_t buf[4];
  unsigned int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
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
  uint64_t input;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  connect = 0;
  input = 0;
  v43 = 0;
  output = 0;
  outputCnt = 1;
  if (!v6)
  {
    sub_22AE246E8(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_22AE25AC0();
    goto LABEL_29;
  }
  if (!v7)
  {
    sub_22AE246E8(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_22AE25AEC();
    goto LABEL_29;
  }
  v9 = -[CREANController _getQuerykeyFromDataClass:](self, "_getQuerykeyFromDataClass:", v6);
  if (!v9)
  {
    sub_22AE246E8(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_22AE25B18();
    goto LABEL_29;
  }
  v10 = v9;
  v11 = -[CREANController _getQuerykeyFromDataClass:](self, "_getQuerykeyFromDataClass:", v8);
  if (!v11)
  {
    sub_22AE246E8(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_22AE25B44();
    goto LABEL_29;
  }
  v12 = v11;
  v13 = *MEMORY[0x24BDD8B18];
  v14 = IOServiceMatching("AppleNVMeEAN");
  MatchingService = IOServiceGetMatchingService(v13, v14);
  if (!MatchingService)
  {
    sub_22AE246E8(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_22AE2591C();
LABEL_29:
    v16 = 0;
LABEL_30:
    v21 = 0;
    goto LABEL_14;
  }
  v16 = MatchingService;
  if (IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, &connect))
  {
    sub_22AE246E8(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_22AE25654();
    goto LABEL_30;
  }
  if (!connect)
  {
    sub_22AE246E8(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_22AE25B70();
    goto LABEL_30;
  }
  input = v10;
  v43 = v12;
  sub_22AE246E8(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110912;
    v27 = HIBYTE(v10);
    v28 = 1024;
    v29 = HIWORD(v10);
    v30 = 1024;
    v31 = v10 >> 8;
    v32 = 1024;
    v33 = v10;
    v34 = 1024;
    v35 = HIBYTE(v12);
    v36 = 1024;
    v37 = HIWORD(v12);
    v38 = 1024;
    v39 = v12 >> 8;
    v40 = 1024;
    v41 = v12;
    _os_log_impl(&dword_22AE1C000, v17, OS_LOG_TYPE_DEFAULT, "Swapping EAN key %c%c%c%c and %c%c%c%c", buf, 0x32u);
  }

  v18 = IOConnectCallMethod(connect, 6u, &input, 2u, 0, 0, &output, &outputCnt, 0, 0);
  sub_22AE246E8(0);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_22AE25B9C();
    goto LABEL_30;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22AE1C000, v20, OS_LOG_TYPE_DEFAULT, "EAN key Swap success", buf, 2u);
  }
  v21 = 1;
LABEL_14:

  if (connect)
  {
    IOServiceClose(connect);
    connect = 0;
  }
  if (v16)
    IOObjectRelease(v16);

  return v21;
}

- (BOOL)swapVersionedFDR
{
  unint64_t v3;
  unint64_t v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  BOOL v8;
  NSObject *v9;
  BOOL v10;
  __int16 v12;
  __int16 v13;

  v3 = -[CREANController sizeEAN:](self, "sizeEAN:", CFSTR("fdr1"));
  v4 = -[CREANController sizeEAN:](self, "sizeEAN:", CFSTR("fdr2"));
  if (!(v3 | v4))
  {
    sub_22AE246E8(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 0;
      v6 = "Versioned FDR is empty. NO OP";
      v7 = (uint8_t *)&v13;
LABEL_9:
      _os_log_impl(&dword_22AE1C000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (!v3 || !v4)
  {
    sub_22AE246E8(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_22AE25BFC();
    goto LABEL_15;
  }
  v8 = -[CREANController swapEAN:withKey:](self, "swapEAN:withKey:", CFSTR("fdr1"), CFSTR("fdr2"));
  sub_22AE246E8(0);
  v9 = objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_22AE25C28();
LABEL_15:
    v10 = 0;
    goto LABEL_16;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 0;
    v6 = "FDR1 is now active.";
    v7 = (uint8_t *)&v12;
    goto LABEL_9;
  }
LABEL_10:
  v10 = 1;
LABEL_16:

  return v10;
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
  uint64_t v14;
  NSObject *v15;
  uint8_t v16[56];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(a3, CFSTR("crypto-hash-method"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    v5 = CFProperty;
    if (CFProperty)
    {
      if (*(_DWORD *)CFDataGetBytePtr(CFProperty) != 828467315)
      {
        v6 = *(_QWORD *)CFDataGetBytePtr(v5);
        sub_22AE246E8(0);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v6 != 0x3438332D32616873)
        {
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            sub_22AE25CAC();

          v9 = 0;
LABEL_22:
          CFRelease(v5);
          return v9;
        }
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl(&dword_22AE1C000, v8, OS_LOG_TYPE_DEFAULT, "crypto-hash-method found. Using SHA2-384\n", v16, 2u);
        }

        CC_SHA384(-[NSData bytes](self->apTicket, "bytes"), -[NSData length](self->apTicket, "length"), v16);
        v14 = 48;
LABEL_17:
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v16, v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          sub_22AE246E8(0);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            sub_22AE25C80();

        }
        if (!v5)
          return v9;
        goto LABEL_22;
      }
      sub_22AE246E8(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        v13 = "crypto-hash-method found. Using SHA1\n";
        goto LABEL_15;
      }
    }
    else
    {
      sub_22AE246E8(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        v13 = "crypto-hash-method not found, defaulting to SHA1\n";
LABEL_15:
        _os_log_impl(&dword_22AE1C000, v12, OS_LOG_TYPE_DEFAULT, v13, v16, 2u);
      }
    }

    CC_SHA1(-[NSData bytes](self->apTicket, "bytes"), -[NSData length](self->apTicket, "length"), v16);
    v14 = 20;
    goto LABEL_17;
  }
  sub_22AE246E8(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_22AE25C54();

  return 0;
}

- (id)apticketCopyHashData
{
  NSObject *v3;
  uint64_t v4;
  io_object_t v5;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  sub_22AE246E8(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[CREANController apticketCopyHashData]";
    _os_log_impl(&dword_22AE1C000, v3, OS_LOG_TYPE_DEFAULT, "entering %s\n", (uint8_t *)&v9, 0xCu);
  }

  if (!self->apTicket)
  {
    sub_22AE246E8(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_22AE25D0C();
    goto LABEL_10;
  }
  v4 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B18], "IODeviceTree:/chosen");
  if (!(_DWORD)v4)
  {
    sub_22AE246E8(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_22AE25C54();
LABEL_10:

    v6 = 0;
    return v6;
  }
  v5 = v4;
  -[CREANController _ticketCopyHashDataWithNode:](self, "_ticketCopyHashDataWithNode:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  IOObjectRelease(v5);
  return v6;
}

- (BOOL)setupVersionedFDRWithApTicket:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  BOOL v12;
  NSObject *v13;
  uint64_t v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  id v23;
  uint8_t buf[4];
  NSObject *v25;
  __int16 v26;
  id v27;
  _BYTE v28[4096];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = -[CREANController sizeEAN:](self, "sizeEAN:", CFSTR("fdr1"));
  v7 = -[CREANController sizeEAN:](self, "sizeEAN:", CFSTR("fdr2"));
  bzero(v28, 0x1000uLL);
  if (!(v6 | v7))
  {
    sub_22AE246E8(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22AE1C000, v8, OS_LOG_TYPE_DEFAULT, "fdr1 & fdr2 are blank returning.", buf, 2u);
    }
    v9 = 0;
    v10 = 0;
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    sub_22AE246E8(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_22AE25DE8();
    goto LABEL_40;
  }
  objc_storeStrong((id *)&self->apTicket, a3);
  sub_22AE246E8(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22AE1C000, v13, OS_LOG_TYPE_DEFAULT, "Ensuring FDR1 is valid and active.", buf, 2u);
  }

  if (!self->apTicket)
  {
    sub_22AE246E8(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_22AE25D38();
    goto LABEL_40;
  }
  -[CREANController apticketCopyHashData](self, "apticketCopyHashData");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    sub_22AE246E8(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_22AE25D64();
    goto LABEL_40;
  }
  v10 = v14;
  v23 = 0;
  v15 = -[CREANController copyFDREANValues:outgenerationCount:outManifesthash:](self, "copyFDREANValues:outgenerationCount:outManifesthash:", CFSTR("fdr1"), 0, &v23);
  v9 = v23;
  if (v15)
  {
    sub_22AE246E8(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "convertToHexString");
      v17 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_impl(&dword_22AE1C000, v16, OS_LOG_TYPE_DEFAULT, "FDR1 has hash: %@", buf, 0xCu);

    }
    v18 = -[NSObject isEqualToData:](v10, "isEqualToData:", v9);
    sub_22AE246E8(0);
    v8 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v19)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22AE1C000, v8, OS_LOG_TYPE_DEFAULT, "FDR1 appears to be active.", buf, 2u);
      }
      goto LABEL_5;
    }
    if (v19)
    {
      *(_DWORD *)buf = 138412546;
      v25 = v10;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_22AE1C000, v8, OS_LOG_TYPE_DEFAULT, "FDR1 boot hash mismatch:%@::%@", buf, 0x16u);
    }

  }
  sub_22AE246E8(0);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22AE1C000, v20, OS_LOG_TYPE_DEFAULT, "FDR1 is not written / valid.", buf, 2u);
  }

  if (v6 || !v7)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:", v28, 4096);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!-[CREANController _writeDataToEAN:withKey:](self, "_writeDataToEAN:withKey:", v8, CFSTR("fdr1")))
  {
    sub_22AE246E8(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_22AE25DBC();
    goto LABEL_39;
  }
  if (!-[CREANController swapVersionedFDR](self, "swapVersionedFDR"))
  {
    sub_22AE246E8(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_22AE25D90();
LABEL_39:

LABEL_40:
    v12 = 0;
    goto LABEL_41;
  }
LABEL_5:

LABEL_6:
  sub_22AE246E8(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22AE1C000, v11, OS_LOG_TYPE_DEFAULT, "setupVersionedFDRWithApTicket success", buf, 2u);
  }

  v12 = 1;
LABEL_41:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->apTicket, 0);
}

@end
