CFTypeRef MDCopyDecodedXattrFromData(void *a1, CFTypeRef cf)
{
  uint64_t v4;
  CFTypeRef result;
  CFTypeID v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;
  uint64_t v15;
  id *v16;
  uint64_t v17;
  char isKindOfClass;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BDBD430];
  result = cf;
  if ((CFTypeRef)*MEMORY[0x24BDBD430] == cf)
  {
LABEL_4:
    if (result)
      return result;
    goto LABEL_5;
  }
  v6 = CFGetTypeID(cf);
  if (v6 == CFDataGetTypeID())
  {
    result = (CFTypeRef)MDPropertyCopyDecodedValue();
    goto LABEL_4;
  }
LABEL_5:
  if (!objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.metadata:_kMDItemUserTags")))
    return 0;
  if (MDCopyDecodedXattrFromData_onceToken != -1)
    dispatch_once(&MDCopyDecodedXattrFromData_onceToken, &__block_literal_global_0);
  v26 = 0;
  v7 = objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", MDCopyDecodedXattrFromData_sUserTagsUnarchiveValidClasses, cf, &v26);
  v8 = v26;
  if (v26)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v8;
      v29 = 2112;
      v30 = a1;
      _os_log_impl(&dword_237593000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Decoding error: %@ for %@", buf, 0x16u);
    }
    return (CFTypeRef)v4;
  }
  v9 = (void *)v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (!objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("v")), "isEqual:", &unk_2508E25C8))return 0;
  v10 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("t"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v11 = objc_msgSend(v10, "count");
  v12 = v11;
  if (v11 > 99)
    return 0;
  v13 = 8 * v11;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v14 = (id *)((char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v14, 8 * v12);
  v15 = objc_msgSend(v10, "getObjects:range:", v14, 0, v12);
  MEMORY[0x24BDAC7A8](v15);
  v16 = v14;
  bzero(v14, 8 * v12);
  if (v12 < 1)
    return 0;
  v17 = 0;
  do
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v19 = *v14;
    if ((isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_32;
      v22 = *v14;
      goto LABEL_31;
    }
    v20 = objc_msgSend(*v14, "count");
    if (v20 == 2)
    {
      objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_32;
      v22 = (void *)objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = objc_msgSend(v23, "intValue");
        if ((v24 - 1) <= 6)
        {
          v21 = objc_msgSend(v22, "stringByAppendingFormat:", CFSTR("\n%d"), v24);
LABEL_23:
          v22 = (void *)v21;
        }
      }
      if (!v22)
        goto LABEL_32;
LABEL_31:
      v16[v17++] = v22;
      goto LABEL_32;
    }
    if (v20 == 1)
    {
      objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
        goto LABEL_23;
      }
    }
LABEL_32:
    ++v14;
    --v12;
  }
  while (v12);
  if (v17 > 0)
    return (CFTypeRef)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:count:", v16, v17);
  return 0;
}

void sub_237594798(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    if (a2 == 2)
    {
      objc_end_catch();
      JUMPOUT(0x237594734);
    }
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void *MDFSOnlyCopyExtendedAttributesFromFd(uint64_t a1)
{
  int v1;
  _BYTE *v2;
  _BYTE *v3;
  const char *v4;
  const char *v5;
  int v6;
  unsigned __int8 *v7;
  ssize_t v8;
  ssize_t v9;
  void *v10;
  const __CFAllocator *v11;
  CFDataRef v12;
  __CFString *v13;
  int v15;
  _BYTE value[4096];
  uint64_t v17;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v6 = v1;
  v17 = *MEMORY[0x24BDAC8D0];
  v7 = value;
  bzero(value, 0x1000uLL);
  v8 = fgetxattr(v6, v5, value, 0x1000uLL, 0, 0);
  if (v8 == -1)
  {
    if (*__error() != 34)
      return 0;
    v9 = fgetxattr(v6, v5, 0, 0, 0, 0);
    v7 = (unsigned __int8 *)malloc_type_malloc(v9, 0x588B3D04uLL);
    v8 = fgetxattr(v6, v5, v7, v9, 0, 0);
  }
  else
  {
    v9 = v8;
  }
  v10 = 0;
  if (v9 >= 1 && v8 == v9)
  {
    if (((char)*v7 & 0x80000000) == 0)
    {
LABEL_8:
      v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v12 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v7, v9, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
      v13 = (__CFString *)CFStringCreateWithCString(v11, v5, 0x8000100u);
      v10 = (void *)MDCopyDecodedXattrFromData(v13, v12);
      CFRelease(v12);
      CFRelease(v13);
      goto LABEL_9;
    }
    v15 = *v7;
    if ((v15 - 241) >= 2)
    {
      if (v15 != 129)
        goto LABEL_8;
      if (v9 != 9)
        goto LABEL_8;
      v10 = CFDateCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], *(CFAbsoluteTime *)(v7 + 1));
      if (!v10)
        goto LABEL_8;
    }
    else if (v3)
    {
      *v3 = 1;
      v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v7, v9);
    }
    else
    {
      v10 = 0;
    }
  }
LABEL_9:
  if (v7 != value)
    free(v7);
  return v10;
}

void _MDItemFetchPrivateAttributesForURL(const __CFURL *a1, void *a2)
{
  id v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  const void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (__CFString *)_MDItemCopyXattrsForURL(a1);
  -[__CFString objectForKey:](v4, "objectForKey:", CFSTR("_kMDItemEncryptedData"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v12[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___MDItemFetchPrivateAttributesForURL_block_invoke;
    v10[3] = &unk_2508E10C0;
    v11 = v3;
    _MDItemDecrypt((uint64_t)v7, v10);

  }
  else
  {
    v8 = objc_alloc(MEMORY[0x24BDD1540]);
    v9 = (const void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
    (*((void (**)(id, const void *, _QWORD))v3 + 2))(v3, v9, 0);
    CFRelease(v9);
  }

}

const __CFString *_MDItemCopyXattrsForURL(const __CFURL *a1)
{
  const __CFString *result;
  const __CFString *v2;
  CFIndex Length;
  CFIndex v4;
  char *v5;
  CFMutableDictionaryRef v6;

  result = CFURLCopyFileSystemPath(a1, kCFURLPOSIXPathStyle);
  if (result)
  {
    v2 = result;
    Length = CFStringGetLength(result);
    v4 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    v5 = (char *)malloc_type_malloc(v4, 0xFE6805E4uLL);
    CFStringGetCString(v2, v5, v4, 0x8000100u);
    v6 = MDFSOnlyMDCopyXattrsDictionary(v5);
    free(v5);
    CFRelease(v2);
    return (const __CFString *)v6;
  }
  return result;
}

CFMutableDictionaryRef MDFSOnlyMDCopyXattrsDictionaryForFD(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  char v4;
  char v5;
  uint64_t v6;
  char *v7;
  ssize_t v8;
  ssize_t v9;
  const __CFAllocator *v10;
  __CFDictionary *Mutable;
  void *v12;
  void *v13;
  double v14;
  char *v15;
  uint64_t *v16;
  ssize_t v17;
  CFStringRef v18;
  const void *v19;
  __CFDictionary *v20;
  const __CFString *v21;
  int v22;
  CFStringRef v23;
  CFStringRef v24;
  ssize_t v25;
  uint64_t *p_value;
  ssize_t v27;
  char *v28;
  CFNumberRef v29;
  size_t v30;
  const void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  id v36;
  uint64_t Bytes;
  void *v38;
  char *v39;
  int v41;
  id v42;
  id v43;
  char *__s1;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  CFStringEncoding encoding;
  CFStringEncoding valuePtr;
  _QWORD v51[3];
  _QWORD v52[3];
  _BYTE v53[128];
  uint64_t value;
  uint64_t v55;
  uint64_t v56;
  char namebuff[4096];
  uint64_t v58;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v6 = v1;
  v58 = *MEMORY[0x24BDAC8D0];
  v7 = namebuff;
  bzero(namebuff, 0x1000uLL);
  v8 = flistxattr(v6, namebuff, 0x1000uLL, 0);
  if (v8 < 0)
  {
    if (*__error() != 34)
      return CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v9 = flistxattr(v6, 0, 0, 0);
    v39 = (char *)malloc_type_malloc(v9, 0x87B0ECC2uLL);
    if (!v39)
      return 0;
    v7 = v39;
    if (flistxattr(v6, v39, v9, 0) < 0)
      return 0;
  }
  else
  {
    v9 = v8;
  }
  v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v9 >= 1)
  {
    v41 = v3;
    __s1 = v7;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &kMDLabelPrivateXattrUUIDBytes);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v12, 0);

    v43 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v42 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if ((unint64_t)v9 >= 3)
    {
      v14 = *MEMORY[0x24BDBD238];
      v15 = __s1;
      do
      {
        if (!*v15)
          break;
        if (!strncmp(v15, "com.apple.metadata", 0x12uLL))
        {
          v22 = v15[18];
          LOBYTE(valuePtr) = 0;
          if (v22 == 58)
            goto LABEL_20;
          if (v22 == 46)
          {
            LOBYTE(valuePtr) = 1;
LABEL_20:
            v19 = MDFSOnlyCopyExtendedAttributesFromFd(v6);
            if (!v19 || (_BYTE)valuePtr)
            {
              if ((_BYTE)valuePtr && !strncmp(v15, "com.apple.metadata:kMDLabel_", 0x1CuLL))
              {
                bzero(&value, 0x400uLL);
                snprintf((char *)&value, 0x400uLL, "%s.%s", "com.apple.metadata", v15 + 28);
                objc_msgSend(v42, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", &value));
                objc_msgSend(v43, "addObject:", v19);
              }
              if (!v19)
                goto LABEL_47;
            }
            else if ((v5 & 1) == 0)
            {
              v23 = CFStringCreateWithCString(v10, v15 + 19, 0x8000100u);
              if (v23)
              {
                v24 = v23;
                CFDictionaryAddValue(Mutable, v23, v19);
                CFRelease(v24);
              }
            }
LABEL_36:
            CFRelease(v19);
          }
        }
        else if ((v5 & 1) == 0)
        {
          if (!strcmp(v15, "com.apple.lastuseddate#PS"))
          {
            value = 0;
            v55 = 0;
            v56 = 0;
            if ((_DWORD)v6 == -1)
              goto LABEL_46;
            v25 = fgetxattr(v6, "com.apple.lastuseddate#PS", &value, 0x18uLL, 0, 0);
            if ((v25 & 0x8000000000000000) == 0)
            {
              if (v25 != 16)
              {
LABEL_46:
                *__error() = 22;
                goto LABEL_47;
              }
              if (value)
              {
                v19 = CFDateCreate(v10, (double)v55 / 1000000000.0 + (double)value - v14);
                v20 = Mutable;
                v21 = CFSTR("kMDItemLastUsedDate");
                goto LABEL_35;
              }
            }
          }
          else if (!strcmp(v15, "com.apple.TextEncoding"))
          {
            p_value = &value;
            bzero(&value, 0x400uLL);
            if (fgetxattr(v6, v15, &value, 0x400uLL, 0, 0) > 0)
              goto LABEL_40;
            if (*__error() == 34)
            {
              v27 = fgetxattr(v6, v15, 0, 0, 0, 0);
              p_value = (uint64_t *)malloc_type_calloc(1uLL, v27 + 1, 0x53B656AAuLL);
              fgetxattr(v6, v15, p_value, v27, 0, 0);
LABEL_40:
              v28 = strchr((char *)p_value, 59);
              if (v28)
              {
                encoding = 0;
                if (sscanf(v28 + 1, "%u", &encoding) == 1)
                {
                  if (CFStringIsEncodingAvailable(encoding))
                  {
                    valuePtr = encoding;
                    v29 = CFNumberCreate(v10, kCFNumberSInt32Type, &valuePtr);
                    CFDictionarySetValue(Mutable, CFSTR("--_kMDItemTextEncodingHint"), v29);
                    CFRelease(v29);
                  }
                }
              }
              if (p_value != &value)
                free(p_value);
            }
          }
          else if (!strncmp(v15, "com.apple.SharedWithYou", 0x17uLL))
          {
            v16 = &value;
            bzero(&value, 0x400uLL);
            if (fgetxattr(v6, v15, &value, 0x400uLL, 0, 0) <= 0)
            {
              if (*__error() != 34)
                goto LABEL_47;
              v17 = fgetxattr(v6, v15, 0, 0, 0, 0);
              v16 = (uint64_t *)malloc_type_calloc(1uLL, v17 + 1, 0xFCE0A9DFuLL);
              fgetxattr(v6, v15, v16, v17, 0, 0);
            }
            v18 = CFStringCreateWithCString(v10, (const char *)v16, 0x8000100u);
            if (v18)
            {
              v19 = v18;
              v20 = Mutable;
              v21 = CFSTR("com.apple.SharedWithYou");
LABEL_35:
              CFDictionarySetValue(v20, v21, v19);
              goto LABEL_36;
            }
          }
        }
LABEL_47:
        v30 = strlen(v15) + 1;
        v15 += v30;
        v9 -= v30;
      }
      while (v9 > 2);
    }
    if (objc_msgSend(v42, "count"))
    {
      if (v41)
      {
        v31 = (const void *)_MDPlistContainerCreateMutable();
        _MDPlistContainerBeginContainer();
        _MDPlistContainerBeginDictionary();
        _MDPlistContainerAddCString();
        _MDPlistContainerAddObject();
        _MDPlistContainerAddCString();
        _MDPlistContainerBeginArray();
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v32 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v33; ++i)
            {
              if (*(_QWORD *)v46 != v34)
                objc_enumerationMutation(v13);
              objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "UUIDString");
              _MDPlistContainerAddObject();
            }
            v33 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
          }
          while (v33);
        }
        _MDPlistContainerEndArray();
        _MDPlistContainerAddCString();
        _MDPlistContainerAddObject();
        _MDPlistContainerEndDictionary();
        _MDPlistContainerEndContainer();
        v36 = objc_alloc(MEMORY[0x24BDBCE50]);
        Bytes = _MDPlistContainerGetBytes();
        v38 = (void *)objc_msgSend(v36, "initWithBytes:length:", Bytes, _MDPlistContainerGetLength());
        CFDictionarySetValue(Mutable, CFSTR("_kMDItemEncryptedData"), v38);

        CFRelease(v31);
      }
      else
      {
        v51[0] = CFSTR("xids");
        v51[1] = CFSTR("uuids");
        v52[0] = v42;
        v52[1] = v13;
        v51[2] = CFSTR("datas");
        v52[2] = v43;
        CFDictionarySetValue(Mutable, CFSTR("_kMDItemEncryptedDataDictionary"), (const void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 3));
      }
    }

    if (__s1 != namebuff)
      free(__s1);
  }
  return Mutable;
}

CFMutableDictionaryRef MDFSOnlyMDCopyXattrsDictionary(const char *a1)
{
  uint64_t v1;
  int v2;
  CFMutableDictionaryRef v3;

  v1 = open(a1, 33024);
  if ((_DWORD)v1 == -1)
    return 0;
  v2 = v1;
  v3 = MDFSOnlyMDCopyXattrsDictionaryForFD(v1);
  close(v2);
  return v3;
}

void _MDItemSetPrivateAttributesForURL(const __CFURL *a1, void *a2, void *a3)
{
  void (**v5)(id, const void *);
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  id v17;
  uint64_t v18;
  UInt8 buffer[1024];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x23B8141E0]();
  +[MDPrivateXattrServices defaultServices](MDPrivateXattrServices, "defaultServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (_MDItemSetPrivateAttributesForURL_once != -1)
    dispatch_once(&_MDItemSetPrivateAttributesForURL_once, &__block_literal_global);
  bzero(buffer, 0x400uLL);
  if (!a1 || !CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024))
  {
    NSLog(CFSTR("Invalid URL %@"), a1);
    v13 = objc_alloc(MEMORY[0x24BDD1540]);
    v14 = *MEMORY[0x24BDD1128];
    v15 = 22;
LABEL_8:
    v16 = (const void *)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, v15, 0);
    v5[2](v5, v16);
    CFRelease(v16);
    goto LABEL_9;
  }
  v8 = open((const char *)buffer, 2);
  if ((v8 & 0x80000000) != 0)
  {
    v17 = objc_alloc(MEMORY[0x24BDD1540]);
    v18 = *MEMORY[0x24BDD1128];
    v15 = *__error();
    v13 = v17;
    v14 = v18;
    goto LABEL_8;
  }
  v9 = v8;
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v10, "setObject:forKey:", _MDItemSetPrivateAttributesForURL_sMDPrivateMDAttributesXattrNSUUID, CFSTR("uuid"));
  objc_msgSend(a2, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("keys"));

  objc_msgSend(a2, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("values"));

  objc_msgSend(v7, "updatePrivateXattrParams:flags:forFileDescriptor:mergeCallback:completionHandler:", v10, 0, v9, &__block_literal_global_2, v5);
  close(v9);

LABEL_9:
  objc_autoreleasePoolPop(v6);

}

id copyConnection()
{
  uint64_t v0;
  void *v1;
  void *v2;

  os_unfair_lock_lock((os_unfair_lock_t)&sLock);
  if (!sConnectionToService)
  {
    if (sConnectionRetainCount)
      copyConnection_cold_1();
    v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.spotlight.CSExattrCryptoService"));
    v1 = (void *)sConnectionToService;
    sConnectionToService = v0;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2567FB9F0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)sConnectionToService, "setRemoteObjectInterface:", v2);

    objc_msgSend((id)sConnectionToService, "resume");
  }
  ++sConnectionRetainCount;
  os_unfair_lock_unlock((os_unfair_lock_t)&sLock);
  return (id)sConnectionToService;
}

void releaseConnection(void *a1)
{
  void *v1;
  id v2;

  v2 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&sLock);
  if ((id)sConnectionToService != v2)
    releaseConnection_cold_3();
  if (!v2)
    releaseConnection_cold_1();
  if (!sConnectionRetainCount)
    releaseConnection_cold_2();
  if (!--sConnectionRetainCount)
  {
    objc_msgSend(v2, "invalidate");
    v1 = (void *)sConnectionToService;
    sConnectionToService = 0;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sLock);

}

void _MDItemDecrypt(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v3 = a2;
  copyConnection();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = ___MDItemDecrypt_block_invoke;
  v21[3] = &unk_2508E1070;
  v6 = v3;
  v22 = v6;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = ___MDItemDecrypt_block_invoke_2;
    v18[3] = &unk_2508E1098;
    v20 = v6;
    v19 = v4;
    objc_msgSend(v7, "decryptAttributesWithData:withReply:", a1, v18);

    v8 = v20;
  }
  else
  {
    v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v9)
      ___MDItemSetPrivateAttributesForURL_block_invoke_2_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    v17 = objc_alloc(MEMORY[0x24BDD1540]);
    v8 = (void *)objc_msgSend(v17, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 61, 0);
    (*((void (**)(id, void *, _QWORD))v6 + 2))(v6, v8, 0);
    releaseConnection(v4);
  }

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t MDUtiTypeConformsToPedigree(void *a1, const char *a2)
{
  return objc_msgSend(a1, "containsObject:", a2);
}

CFMutableDictionaryRef MDFSOnlyMDDictionaryCreateMutable()
{
  return CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
}

void MDFSOnlyMDDictionaryIterate(const __CFDictionary *a1, void *context)
{
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)MDFSOnlydictionaryApplierFunction, context);
}

uint64_t MDFSOnlydictionaryApplierFunction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

CFNumberRef MDFSOnlyMDNumberCreateInt64(uint64_t a1)
{
  uint64_t valuePtr;

  valuePtr = a1;
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
}

CFNumberRef MDFSOnlyMDNumberCreateInt32(int a1)
{
  int valuePtr;

  valuePtr = a1;
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
}

const __CFNumber *MDFSOnlyMDNumberGetInt64(const __CFNumber *result)
{
  uint64_t valuePtr;

  valuePtr = 0;
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt64Type, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

const __CFNumber *MDFSOnlyMDNumberGetInt32(const __CFNumber *result)
{
  unsigned int valuePtr;

  valuePtr = 0;
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

const __CFNumber *MDFSOnlyMDNumberGetBool(const __CFNumber *result)
{
  uint64_t valuePtr;

  valuePtr = 0;
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt64Type, &valuePtr);
    return (const __CFNumber *)(valuePtr != 0);
  }
  return result;
}

void sub_23759628C(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  void *v16;

  if (a2 == 2)
  {
    objc_begin_catch(exc_buf);
    NSLog(CFSTR("%@"));

    objc_end_catch();
  }
  else
  {
    objc_begin_catch(exc_buf);
  }
  JUMPOUT(0x23759625CLL);
}

uint64_t addStandardKeychainAttributesToDictionary(void *a1)
{
  uint64_t v2;

  objc_msgSend(a1, "setObject:forKey:", CFSTR("com.apple.Spotlight.Metadata"), *MEMORY[0x24BDE8F50]);
  v2 = *MEMORY[0x24BDBD270];
  objc_msgSend(a1, "setObject:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDE9140]);
  objc_msgSend(a1, "setObject:forKey:", v2, *MEMORY[0x24BDE94C8]);
  return objc_msgSend(a1, "setObject:forKey:", *MEMORY[0x24BDE9040], *MEMORY[0x24BDE9028]);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void updateDesignatedUUIDIfNewer(uint64_t a1, void *a2, void *a3, id *a4)
{
  void *v6;

  v6 = (void *)objc_msgSend(a2, "objectForKey:", *MEMORY[0x24BDE8FE0]);
  if (!*(_QWORD *)(a1 + 8))
  {
    *(_QWORD *)(a1 + 8) = a3;
    goto LABEL_5;
  }
  if (objc_msgSend(*a4, "compare:", v6) == 1)
  {

    *(_QWORD *)(a1 + 8) = a3;
LABEL_5:
    *a4 = v6;
    return;
  }

}

void sub_2375967E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFDataRef _copyCryptedDataWithKey(CCOperation a1, const void *a2, size_t a3, void *a4, int a5, int a6)
{
  size_t dataOutAvailable;
  void *v13;
  CCCryptorStatus v14;
  int v15;
  CFDataRef v16;
  const __CFAllocator *v17;
  const UInt8 *v18;
  CFIndex length;
  _DWORD iv[2];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  dataOutAvailable = a3 + 16;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", a3 + 16);
  length = 0;
  iv[0] = a5;
  iv[1] = a6;
  v22 = 0;
  v14 = CCCrypt(a1, 0, 1u, (const void *)objc_msgSend(a4, "bytes"), objc_msgSend(a4, "length"), iv, a2, a3, (void *)objc_msgSend(v13, "bytes"), dataOutAvailable, (size_t *)&length);
  if (v14)
  {
    v15 = v14;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _copyCryptedDataWithKey_cold_1(v15);
    v16 = 0;
  }
  else
  {
    v17 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v18 = (const UInt8 *)objc_msgSend(v13, "bytes");
    v16 = CFDataCreate(v17, v18, length);
  }

  return v16;
}

uint64_t _MDLabelUUIDEncode(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t result;

  *(_BYTE *)a3 = _MDLabelUUIDEncode_encodingVector[a1 >> 3];
  *(_BYTE *)(a3 + 1) = _MDLabelUUIDEncode_encodingVector[((unsigned __int16)a1 >> 14) & 0xFFFFFFFFFFFFFFE3 | (4 * (a1 & 7))];
  *(_BYTE *)(a3 + 2) = _MDLabelUUIDEncode_encodingVector[(a1 >> 9) & 0x1F];
  *(_BYTE *)(a3 + 3) = _MDLabelUUIDEncode_encodingVector[(unint64_t)(BYTE2(a1) & 0xF0 | (a1 & 0x100)) >> 4];
  *(_BYTE *)(a3 + 4) = _MDLabelUUIDEncode_encodingVector[(a1 >> 15) & 0x1E | (a1 >> 31)];
  *(_BYTE *)(a3 + 5) = _MDLabelUUIDEncode_encodingVector[(a1 >> 26) & 0x1F];
  *(_BYTE *)(a3 + 6) = _MDLabelUUIDEncode_encodingVector[(a1 >> 21) & 0x18 | (a1 >> 37) & 7];
  *(_BYTE *)(a3 + 7) = _MDLabelUUIDEncode_encodingVector[HIDWORD(a1) & 0x1F];
  *(_BYTE *)(a3 + 8) = _MDLabelUUIDEncode_encodingVector[(a1 >> 43) & 0x1F];
  *(_BYTE *)(a3 + 9) = _MDLabelUUIDEncode_encodingVector[(a1 >> 38) & 0x1C | (a1 >> 54) & 3];
  *(_BYTE *)(a3 + 10) = _MDLabelUUIDEncode_encodingVector[(a1 >> 49) & 0x1F];
  *(_BYTE *)(a3 + 11) = _MDLabelUUIDEncode_encodingVector[(a1 >> 44) & 0x10 | (a1 >> 60)];
  *(_BYTE *)(a3 + 12) = _MDLabelUUIDEncode_encodingVector[(a1 >> 55) & 0x1E | (a2 >> 7) & 1];
  *(_BYTE *)(a3 + 13) = _MDLabelUUIDEncode_encodingVector[(a2 >> 2) & 0x1F];
  result = HIWORD(a2) & 0x1F;
  *(_BYTE *)(a3 + 14) = _MDLabelUUIDEncode_encodingVector[((unsigned __int16)a2 >> 13) & 0xFFFFFFFFFFFFFFE7 | (8 * (a2 & 3))];
  *(_BYTE *)(a3 + 15) = _MDLabelUUIDEncode_encodingVector[(a2 >> 8) & 0x1F];
  *(_BYTE *)(a3 + 16) = _MDLabelUUIDEncode_encodingVector[(a2 >> 19) & 0x1F];
  *(_BYTE *)(a3 + 17) = _MDLabelUUIDEncode_encodingVector[(a2 >> 14) & 0x1C | (a2 >> 30)];
  *(_BYTE *)(a3 + 18) = _MDLabelUUIDEncode_encodingVector[(a2 >> 25) & 0x1F];
  *(_BYTE *)(a3 + 19) = _MDLabelUUIDEncode_encodingVector[(a2 >> 20) & 0x10 | (a2 >> 36) & 0xF];
  *(_BYTE *)(a3 + 20) = _MDLabelUUIDEncode_encodingVector[(a2 >> 31) & 0x1E | (a2 >> 47) & 1];
  *(_BYTE *)(a3 + 21) = _MDLabelUUIDEncode_encodingVector[(a2 >> 42) & 0x1F];
  *(_BYTE *)(a3 + 22) = _MDLabelUUIDEncode_encodingVector[(a2 >> 37) & 0x18 | (a2 >> 53) & 7];
  *(_BYTE *)(a3 + 23) = _MDLabelUUIDEncode_encodingVector[result];
  *(_BYTE *)(a3 + 24) = _MDLabelUUIDEncode_encodingVector[a2 >> 59];
  *(_WORD *)(a3 + 25) = _MDLabelUUIDEncode_encodingVector[(a2 >> 54) & 0x1C];
  return result;
}

uint64_t _MDPrivateXattrUUIDsGetter()
{
  if (_MDPrivateXattrUUIDsGetter_once != -1)
    dispatch_once(&_MDPrivateXattrUUIDsGetter_once, &__block_literal_global_2);
  return _MDPrivateXattrUUIDsGetter_uuids;
}

CFTypeID MDLabelGetTypeID(void)
{
  if (MDLabelGetTypeID_once != -1)
    dispatch_once(&MDLabelGetTypeID_once, &__block_literal_global_10);
  return MDLabelGetTypeID_typeID;
}

CFStringRef _MDLabelCopyDescription(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("<MDLabel %p [%@]>"), a1, *(_QWORD *)(a1 + 16));
}

uint64_t copyUpdatedData(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  char v6;
  char v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  uint64_t v58;
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t k;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t m;
  uint64_t v72;
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t n;
  void *v84;
  id v85;
  void *v86;
  _QWORD *v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  int *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  size_t v117;
  int *v118;
  uint64_t UUIDBytes;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t ii;
  double v128;
  const void *v129;
  CFTypeID v130;
  uint64_t v131;
  void *v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  _BYTE *v136;
  _BYTE *v137;
  id v138;
  uint64_t v139;
  uint64_t v141;
  id v142;
  _QWORD *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  uint64_t v151;
  void *v152;
  void *v153;
  unsigned int v154;
  uint64_t v155;
  _QWORD *v156;
  int v157;
  char v158;
  void *v159;
  id v160;
  id v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  id v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  _BYTE v187[128];
  _QWORD v188[2];
  _QWORD v189[16];
  _QWORD v190[16];
  unint64_t v191;
  unint64_t v192;
  _QWORD v193[3];
  int v194;
  _BYTE v195[4];
  int v196;
  _BYTE v197[8199];

  v1 = MEMORY[0x24BDAC7A8](a1);
  v155 = v2;
  v156 = v3;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (void *)v1;
  *(_QWORD *)&v197[8183] = *MEMORY[0x24BDAC8D0];
  v15 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("keys"));
  v16 = (void *)objc_msgSend(v11, "objectForKey:", CFSTR("values"));
  v166 = 0;
  v17 = 0x24BDBC000uLL;
  if (v13)
  {
    v18 = (void *)objc_msgSend(+[MDPrivateXattrServices defaultServices](MDPrivateXattrServices, "defaultServices"), "copyPrivateXattrsFromData:decryptedXids:", v13, &v166);
    if (objc_msgSend(v18, "count"))
    {
      v19 = objc_alloc(MEMORY[0x24BDBCED8]);
      v188[0] = objc_msgSend(v18, "allKeys");
      v188[1] = objc_msgSend(v18, "allValues");
      v20 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v188, 2);
      v21 = v19;
      v17 = 0x24BDBC000;
      v22 = (id)objc_msgSend(v21, "initWithObjects:forKeys:", v20, &unk_2508E25F0);

      if (v22)
        goto LABEL_7;
    }
    else
    {

    }
  }
  v22 = objc_alloc_init(*(Class *)(v17 + 3800));
LABEL_7:
  v23 = objc_msgSend(+[MDKeyRing defaultKeyRing](MDKeyRing, "defaultKeyRing"), "copyDesignatedKeyUUID");
  v24 = (void *)objc_msgSend(v11, "objectForKey:", CFSTR("uuid"));
  v159 = (void *)v23;
  v157 = v9;
  if (!v9)
  {
    v74 = objc_msgSend(v22, "objectForKey:", CFSTR("uuid"));
    if (!v74 || !objc_msgSend(v24, "isEqual:", v74))
      goto LABEL_84;
    v25 = copyUpdatedXattrDictionary(v22, v15, v16, v7);
LABEL_83:
    if (v25)
      goto LABEL_85;
    goto LABEL_84;
  }
  v25 = copyUpdatedXattrDictionary(v22, v15, v16, v7);
  if (eligbleToThin_once != -1)
    dispatch_once(&eligbleToThin_once, &__block_literal_global_87);
  if (!objc_msgSend(v15, "count")
    || !objc_msgSend((id)eligbleToThin_sThinnableKeys, "containsObject:", objc_msgSend(v15, "objectAtIndexedSubscript:", 0)))
  {
    goto LABEL_83;
  }
  v153 = v24;
  v26 = (void *)objc_msgSend(v25, "objectForKey:", CFSTR("keys"));
  v152 = (void *)objc_msgSend(v25, "objectForKey:", CFSTR("values"));
  v151 = objc_msgSend(v25, "objectForKey:", CFSTR("mod_date"));
  if (!objc_msgSend(v15, "count"))
    goto LABEL_144;
  v27 = objc_msgSend(v26, "count");
  if (v27 != objc_msgSend(v152, "count") || !objc_msgSend(v26, "count"))
    goto LABEL_144;
  v145 = v11;
  v146 = v14;
  v160 = v25;
  v149 = v26;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjects:forKeys:", v152, v26);
  v183 = 0u;
  v184 = 0u;
  v185 = 0u;
  v186 = 0u;
  v29 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v183, v195, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v184;
    v32 = -1;
LABEL_17:
    v33 = 0;
    while (1)
    {
      if (*(_QWORD *)v184 != v31)
        objc_enumerationMutation(v15);
      v34 = (void *)objc_msgSend(v28, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v183 + 1) + 8 * v33));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_143;
      v35 = objc_msgSend(v34, "count");
      if (v32 == -1)
      {
        v32 = v35;
        if (!v35)
          goto LABEL_143;
      }
      else if (v32 != v35)
      {
        goto LABEL_143;
      }
      if (v30 == ++v33)
      {
        v30 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v183, v195, 16);
        if (v30)
          goto LABEL_17;
        break;
      }
    }
  }
  v36 = (void *)objc_msgSend(v28, "objectForKeyedSubscript:", objc_msgSend(v15, "objectAtIndexedSubscript:", 0));
  v179 = 0u;
  v180 = 0u;
  v181 = 0u;
  v182 = 0u;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v179, v193, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v180;
LABEL_29:
    v40 = 0;
    while (1)
    {
      if (*(_QWORD *)v180 != v39)
        objc_enumerationMutation(v36);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      if (v38 == ++v40)
      {
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v179, v193, 16);
        if (v38)
          goto LABEL_29;
        goto LABEL_35;
      }
    }
LABEL_143:

    v23 = (uint64_t)v159;
    v25 = v160;
    v11 = v145;
    v14 = v146;
    goto LABEL_144;
  }
LABEL_35:
  v142 = v22;
  v143 = v5;
  v144 = (void *)objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
  v41 = objc_msgSend(v36, "count");
  v148 = (void *)objc_msgSend(v36, "lastObject");
  v150 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v42 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if (v41)
  {
    v147 = v36;
    do
    {
      v43 = objc_msgSend(v36, "objectAtIndexedSubscript:", --v41);
      objc_msgSend(v148, "timeIntervalSinceDate:", v43);
      if (v44 > 0.0)
      {
        if (v44 >= *(double *)"")
        {
          if (v44 >= 2678400.0)
          {
            if (v44 >= 94867200.0)
              v45 = 4;
            else
              v45 = 12;
          }
          else
          {
            v45 = 28;
          }
        }
        else
        {
          v45 = 60;
        }
        v43 = objc_msgSend(v144, "dateFromComponents:", objc_msgSend(v144, "components:fromDate:", v45, v43));
      }
      v46 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v175 = 0u;
      v176 = 0u;
      v177 = 0u;
      v178 = 0u;
      v47 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v175, &v191, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v176;
        do
        {
          for (i = 0; i != v48; ++i)
          {
            if (*(_QWORD *)v176 != v49)
              objc_enumerationMutation(v15);
            v51 = *(_QWORD *)(*((_QWORD *)&v175 + 1) + 8 * i);
            v52 = objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
            v53 = v43;
            if (v51 != v52)
              v53 = objc_msgSend((id)objc_msgSend(v28, "objectForKeyedSubscript:", v51), "objectAtIndexedSubscript:", v41);
            objc_msgSend(v46, "setObject:forKeyedSubscript:", v53, v51);
          }
          v48 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v175, &v191, 16);
        }
        while (v48);
      }
      if ((objc_msgSend(v150, "containsObject:", v46) & 1) == 0)
      {
        objc_msgSend(v150, "addObject:", v46);
        v173 = 0u;
        v174 = 0u;
        v171 = 0u;
        v172 = 0u;
        v54 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v171, v190, 16);
        if (v54)
        {
          v55 = v54;
          v56 = *(_QWORD *)v172;
          do
          {
            for (j = 0; j != v55; ++j)
            {
              if (*(_QWORD *)v172 != v56)
                objc_enumerationMutation(v15);
              v58 = *(_QWORD *)(*((_QWORD *)&v171 + 1) + 8 * j);
              v59 = (void *)objc_msgSend(v42, "objectForKeyedSubscript:", v58);
              if (!v59)
              {
                v59 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                objc_msgSend(v42, "setObject:forKeyedSubscript:", v59, v58);
              }
              objc_msgSend(v59, "addObject:", objc_msgSend(v46, "objectForKeyedSubscript:", v58));
            }
            v55 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v171, v190, 16);
          }
          while (v55);
        }
      }
      v36 = v147;
    }
    while (v41);
  }
  v60 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v61 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v167 = 0u;
  v168 = 0u;
  v169 = 0u;
  v170 = 0u;
  v62 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v167, v189, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v168;
    do
    {
      for (k = 0; k != v63; ++k)
      {
        if (*(_QWORD *)v168 != v64)
          objc_enumerationMutation(v15);
        v66 = *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * k);
        v67 = (void *)objc_msgSend(v42, "objectForKeyedSubscript:", v66);
        objc_msgSend(v60, "addObject:", v66);
        objc_msgSend(v61, "addObject:", objc_msgSend((id)objc_msgSend(v67, "reverseObjectEnumerator"), "allObjects"));
      }
      v63 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v167, v189, 16);
    }
    while (v63);
  }
  v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v15);
  v69 = objc_msgSend(v149, "count");
  v9 = v157;
  v22 = v142;
  if (v69)
  {
    v70 = v69;
    for (m = 0; m != v70; ++m)
    {
      v72 = objc_msgSend(v149, "objectAtIndexedSubscript:", m);
      if ((objc_msgSend(v68, "containsObject:", v72) & 1) == 0)
      {
        objc_msgSend(v60, "addObject:", v72);
        objc_msgSend(v61, "addObject:", objc_msgSend(v152, "objectAtIndexedSubscript:", m));
      }
    }
  }
  v73 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v73, "setObject:forKeyedSubscript:", v60, CFSTR("keys"));
  objc_msgSend(v73, "setObject:forKeyedSubscript:", v61, CFSTR("values"));

  v23 = (uint64_t)v159;
  v25 = v160;
  v5 = v143;
  v11 = v145;
  v14 = v146;
  if (v73)
  {
    objc_msgSend(v73, "setObject:forKey:", v151, CFSTR("mod_date"));
    goto LABEL_145;
  }
LABEL_144:
  v73 = (id)objc_msgSend(v25, "copy");
LABEL_145:

  v25 = v73;
  v24 = v153;
  if (!v25)
  {
LABEL_84:
    v25 = (id)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v25, "removeObjectForKey:", CFSTR("uuid"));
    objc_msgSend(v25, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE60], "date"), CFSTR("mod_date"));
  }
LABEL_85:
  v161 = v25;

  memset(v193, 0, sizeof(v193));
  v194 = 0;
  if (v9)
    v75 = (void *)v23;
  else
    v75 = v24;
  v192 = 0;
  v191 = 0;
  objc_msgSend(v14, "digestUUIDBytesWithKey:forUUID:uuidBytes:", v23, v75, &v191);
  _MDLabelUUIDEncode(v191, v192, (uint64_t)v193);
  v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s%s"), "com.apple.metadata:kMDLabel_", v193);
  *v5 = v76;
  objc_msgSend(v76, "UTF8String");
  v77 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v78 = (void *)objc_msgSend(v77, "initWithCapacity:", objc_msgSend(v166, "count"));
  v162 = 0u;
  v163 = 0u;
  v164 = 0u;
  v165 = 0u;
  v79 = v166;
  v80 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v162, v187, 16);
  if (v80)
  {
    v81 = v80;
    v82 = *(_QWORD *)v163;
    do
    {
      for (n = 0; n != v81; ++n)
      {
        if (*(_QWORD *)v163 != v82)
          objc_enumerationMutation(v79);
        v84 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * n);
        if (objc_msgSend(v84, "hasPrefix:", CFSTR("com.apple.metadata:kMDLabel_")))
        {
          v85 = v84;
LABEL_97:
          v90 = v85;
          goto LABEL_99;
        }
        if (objc_msgSend(v84, "hasPrefix:", CFSTR("com.apple.metadata")))
        {
          v86 = v78;
          v87 = v5;
          v88 = objc_alloc(MEMORY[0x24BDD17C8]);
          v141 = objc_msgSend(v84, "substringFromIndex:", 19);
          v89 = v88;
          v5 = v87;
          v78 = v86;
          v85 = (id)objc_msgSend(v89, "initWithFormat:", CFSTR("%s%@"), "com.apple.metadata:kMDLabel_", v141);
          goto LABEL_97;
        }
        v90 = 0;
LABEL_99:
        if ((objc_msgSend(v90, "isEqual:", *v5) & 1) == 0)
          objc_msgSend(v78, "addObject:", v90);

      }
      v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v162, v187, 16);
    }
    while (v81);
  }

  v91 = v25;
  if (!objc_msgSend((id)objc_msgSend(v25, "objectForKey:", CFSTR("keys")), "count"))
  {
    objc_msgSend(v78, "addObject:", *v5);
    v110 = 0;
    v106 = v159;
    goto LABEL_139;
  }
  bzero(v195, 0x2000uLL);
  if (v157)
    v92 = -14;
  else
    v92 = -15;
  v93 = arc4random();
  v94 = arc4random();
  v95 = v94;
  v189[0] = 0;
  if ((v157 & 1) != 0)
  {
    v96 = (int *)storePrivateMDAttributeData(v25, (uint64_t)v195, 0x2000uLL, v189);
    if (!v96)
    {
      v97 = malloc_type_malloc(0x10000uLL, 0xEB9CD638uLL);
      v96 = (int *)storePrivateMDAttributeData(v25, (uint64_t)v97, 0x10000uLL, v189);
      if (!v96)
        copyUpdatedData_cold_1(0, v98, v99, v100, v101, v102, v103, v104);
    }
    v105 = v189[0];
    v106 = v159;
    if (v189[0])
      goto LABEL_111;
LABEL_127:
    if (v96 != (int *)v195)
      free(v96);
    goto LABEL_133;
  }
  v154 = v94;
  v158 = v92;
  v111 = v93;
  v112 = (void *)objc_msgSend(v25, "objectForKey:", CFSTR("uuid"));
  v113 = (void *)objc_msgSend(v25, "objectForKey:", CFSTR("keys"));
  v114 = (void *)objc_msgSend(v25, "objectForKey:", CFSTR("values"));
  v115 = objc_msgSend(v113, "count");
  v116 = objc_msgSend(v114, "count");
  v117 = 24 * v115 + 20;
  if (v117 <= 0x2000)
  {
    v118 = &v196;
    v96 = (int *)v195;
  }
  else
  {
    v96 = (int *)malloc_type_malloc(v117, 0xCB951BACuLL);
    v118 = v96 + 1;
  }
  *v96 = 1279345228;
  v190[0] = v118;
  UUIDBytes = getUUIDBytes(v112, v190);
  if (!(_DWORD)UUIDBytes)
    copyUpdatedData_cold_2(UUIDBytes, v120, v121, v122, v123, v124, v125, v126);
  if (v115 >= 1)
  {
    for (ii = 0; ii != v115; ++ii)
    {
      if (getUUIDBytes((void *)objc_msgSend(v113, "objectAtIndex:", ii), v190))
      {
        v128 = 0.0;
        if (ii < v116)
        {
          v129 = (const void *)objc_msgSend(v114, "objectAtIndex:", ii);
          v130 = CFGetTypeID(v129);
          if (v130 == CFDateGetTypeID())
            v128 = MEMORY[0x23B813DB4](v129);
        }
        v131 = v190[0];
        *(double *)v190[0] = v128;
        v190[0] = v131 + 8;
      }
    }
  }
  v105 = v190[0] - (_QWORD)v96;
  v189[0] = v190[0] - (_QWORD)v96;
  v106 = v159;
  v91 = v161;
  v93 = v111;
  v92 = v158;
  v95 = v154;
  if (v190[0] == (_QWORD)v96)
    goto LABEL_127;
LABEL_111:
  v107 = objc_alloc(MEMORY[0x24BDBCE50]);
  v108 = v105 + 9;
  if (v96 == (int *)v195)
    v109 = objc_msgSend(v107, "initWithBytes:length:", v195, v108);
  else
    v109 = objc_msgSend(v107, "initWithBytesNoCopy:length:freeWhenDone:", v96, v108, 1);
  v132 = (void *)v109;
  v133 = (void *)(*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v155 + 16))(v155, v106, v93, v95, v109, 1);

  if (!v133)
  {
LABEL_133:
    v110 = 0;
    goto LABEL_139;
  }
  v134 = objc_msgSend(v133, "length");
  v135 = v134 + 9;
  if ((unint64_t)(v134 + 9) <= 0x2000)
  {
    v137 = v197;
    v136 = v195;
  }
  else
  {
    v136 = malloc_type_malloc(v134 + 9, 0x6D1169EFuLL);
    v137 = v136 + 9;
  }
  *v136 = v92;
  *(_DWORD *)(v136 + 1) = v93;
  *(_DWORD *)(v136 + 5) = v95;
  memcpy(v137, (const void *)objc_msgSend(v133, "bytes"), objc_msgSend(v133, "length"));
  v138 = objc_alloc(MEMORY[0x24BDBCE50]);
  if (v136 == v195)
    v139 = objc_msgSend(v138, "initWithBytes:length:", v195, v135);
  else
    v139 = objc_msgSend(v138, "initWithBytesNoCopy:length:freeWhenDone:", v136, v135, 1);
  v110 = v139;
  v106 = v159;
  v91 = v161;

LABEL_139:
  if (objc_msgSend(v78, "count"))
    *v156 = v78;
  else

  return v110;
}

id copyUpdatedXattrDictionary(void *a1, void *a2, void *a3, char a4)
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[7];
  _QWORD v18[9];
  char v19;

  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v9 = (void *)objc_msgSend(a1, "objectForKey:", CFSTR("keys"));
  v10 = objc_msgSend(a1, "objectForKey:", CFSTR("values"));
  v11 = objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v12 = objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v13 = (void *)objc_msgSend(a2, "mutableCopy");
  v14 = (void *)objc_msgSend(a3, "mutableCopy");
  v15 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __copyUpdatedXattrDictionary_block_invoke;
  v18[3] = &unk_2508E1448;
  v18[4] = v13;
  v18[5] = v14;
  v19 = a4;
  v18[6] = v10;
  v18[7] = v11;
  v18[8] = v12;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v18);
  v17[0] = v15;
  v17[1] = 3221225472;
  v17[2] = __copyUpdatedXattrDictionary_block_invoke_2;
  v17[3] = &unk_2508E1470;
  v17[4] = v14;
  v17[5] = v11;
  v17[6] = v12;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v17);

  objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("keys"));
  objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("values"));
  objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE60], "date"), CFSTR("mod_date"));
  return v8;
}

uint64_t digestOneInternal(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  unint64_t v7;
  unint64_t v8;
  _QWORD v9[3];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  memset(v9, 0, sizeof(v9));
  v10 = 0;
  v7 = 0;
  v8 = 0;
  objc_msgSend(a1, "digestUUIDBytesWithKey:forUUID:uuidBytes:", a2, a3, &v7);
  _MDLabelUUIDEncode(v7, v8, (uint64_t)v9);
  return objc_msgSend(a4, "setObject:forKey:", a2, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.metadata.%s"), v9));
}

uint64_t __copyUpdatedXattrDictionary_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", a2);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    result = objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", a3);
    if (result != *MEMORY[0x24BDBD430])
    {
      v8 = result;
      objc_msgSend(*(id *)(a1 + 56), "addObject:", a2);
      return objc_msgSend(*(id *)(a1 + 64), "addObject:", v8);
    }
  }
  else
  {
    v9 = v6;
    v10 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v6);
    if (v10 != *MEMORY[0x24BDBD430])
    {
      v11 = v10;
      if (*(_BYTE *)(a1 + 72))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", a3);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = (void *)v12;
          }
          else
          {
            v14[0] = v12;
            v13 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
          }
          v11 = objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v11);
        }
      }
      objc_msgSend(*(id *)(a1 + 56), "addObject:", a2);
      objc_msgSend(*(id *)(a1 + 64), "addObject:", v11);
    }
    objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v9);
    return objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", v9);
  }
  return result;
}

uint64_t __copyUpdatedXattrDictionary_block_invoke_2(id *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = objc_msgSend(a1[4], "objectAtIndex:");
  if (result != *MEMORY[0x24BDBD430])
  {
    v5 = result;
    objc_msgSend(a1[5], "addObject:", a2);
    return objc_msgSend(a1[6], "addObject:", v5);
  }
  return result;
}

uint64_t __eligbleToThin_block_invoke()
{
  id v0;
  uint64_t result;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc(MEMORY[0x24BDBCF20]);
  v2[0] = CFSTR("kMDItemUserSharedSentDate");
  v2[1] = CFSTR("kMDItemUserSharedReceivedDate");
  v2[2] = CFSTR("kMDItemUserPrintedDate");
  v2[3] = CFSTR("kMDItemUserDownloadedDate");
  v2[4] = CFSTR("kMDItemUserModifiedDate");
  v2[5] = CFSTR("kMDItemUserCreatedDate");
  result = objc_msgSend(v0, "initWithArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 6));
  eligbleToThin_sThinnableKeys = result;
  return result;
}

uint64_t storePrivateMDAttributeData(void *a1, uint64_t a2, unint64_t a3, _QWORD *a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  const __CFString *v20;
  unint64_t v21;

  if (_init_private_attributes_once != -1)
    dispatch_once(&_init_private_attributes_once, &__block_literal_global_97);
  v7 = (void *)objc_msgSend(a1, "objectForKey:", CFSTR("keys"));
  v8 = (void *)objc_msgSend(a1, "objectForKey:", CFSTR("values"));
  v20 = (const __CFString *)objc_msgSend(a1, "objectForKey:", CFSTR("mod_date"));
  v9 = objc_msgSend(v7, "count");
  v10 = objc_msgSend(v7, "count");
  if (v9 >= v10)
    v11 = v10;
  else
    v11 = v9;
  v21 = 0;
  if (v11 >= 1)
  {
    v12 = 0;
    v13 = *MEMORY[0x24BDBD430];
    do
    {
      v14 = (const __CFString *)objc_msgSend(v7, "objectAtIndex:", v12);
      v15 = sStringTypeId;
      if (v15 == CFGetTypeID(v14))
      {
        v16 = objc_msgSend(v8, "objectAtIndex:", v12);
        if (v16 != v13)
        {
          v17 = (const __CFString *)v16;
          if (!serializeCFString(a2, &v21, a3, v14) || !serializeCFType(a2, &v21, a3, v17))
            return 0;
        }
      }
    }
    while (v11 != ++v12);
  }
  if (!serializeCFString(a2, &v21, a3, CFSTR("mod_date"))
    || !serializeCFType(a2, &v21, a3, v20))
  {
    return 0;
  }
  *a4 = v21;
  return a2;
}

void __message_assert(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  void *v9[2];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9[0] = 0;
  v9[1] = &a9;
  vasprintf((char **)v9, "%s:%u: failed assertion '%s' %s ", &a9);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v11 = v9[0];
    _os_log_error_impl(&dword_237593000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
  }
  free(v9[0]);
}

uint64_t getUUIDBytes(void *a1, _QWORD *a2)
{
  CFTypeID v4;
  uint64_t v5;
  CFUUIDBytes v6;

  v4 = CFGetTypeID(a1);
  if (v4 == CFUUIDGetTypeID())
  {
    v6 = CFUUIDGetUUIDBytes((CFUUIDRef)a1);
    v5 = *(_QWORD *)&v6.byte0;
    *(CFUUIDBytes *)a2 = v6;
LABEL_5:
    *a2 = v5 + 16;
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "getUUIDBytes:", *a2);
    v5 = *a2;
    goto LABEL_5;
  }
  return 0;
}

uint64_t serializeCFString(uint64_t a1, unint64_t *a2, unint64_t a3, const __CFString *key)
{
  unint64_t v4;
  const void *Value;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  CFIndex v15;
  char *v16;
  unint64_t v17;
  size_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v23;
  _BYTE v24[1024];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = *a2;
  if (*a2 >= a3)
    return 0;
  Value = CFDictionaryGetValue((CFDictionaryRef)sStringIDMappings, key);
  if (!Value)
  {
    *(_BYTE *)(a1 + v4) = 1;
    Length = CFStringGetLength(key);
    MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    v15 = MaximumSizeForEncoding + 1;
    if (MaximumSizeForEncoding < 1024)
      v16 = v24;
    else
      v16 = (char *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0x8BA2A102uLL);
    v17 = v4 + 1;
    bzero(v24, 0x400uLL);
    if (!CFStringGetCString(key, v16, v15, 0x8000100u))
      *v16 = 0;
    v18 = strlen(v16) + 1;
    v19 = v18 + v17;
    if (v18 + v17 < a3)
    {
      memcpy((void *)(a1 + v17), v16, v18);
      if (v16 != v24)
        free(v16);
      *a2 = v19;
      return 1;
    }
    if (v16 != v24)
      free(v16);
    return 0;
  }
  v10 = *a2;
  if (*a2 >= a3)
    return 0;
  v11 = v10 + 1;
  *(_BYTE *)(a1 + v10) = 4;
  if (Value >= 0x80)
  {
    if (Value >= 0x4000)
    {
      v20 = 4;
      if (Value >> 28)
        v20 = 5;
      if (Value < 0x200000)
        v20 = 3;
      if (v11 + v20 < a3)
      {
        if (Value >> 21)
        {
          if (Value >> 28)
          {
            *(_BYTE *)(a1 + v11) = -16;
            *(_DWORD *)(v10 + a1 + 2) = (_DWORD)Value;
            v12 = v10 + 6;
          }
          else
          {
            *(_BYTE *)(a1 + v11) = BYTE3(Value) | 0xE0;
            v23 = (_BYTE *)(v10 + a1);
            v23[2] = BYTE2(Value);
            v23[3] = BYTE1(Value);
            v12 = v10 + 5;
            v23[4] = (_BYTE)Value;
          }
        }
        else
        {
          *(_BYTE *)(a1 + v11) = BYTE2(Value) | 0xC0;
          v21 = v10 + a1;
          *(_BYTE *)(v21 + 2) = BYTE1(Value);
          v12 = v10 + 4;
          *(_BYTE *)(v21 + 3) = (_BYTE)Value;
        }
        goto LABEL_32;
      }
    }
    else
    {
      v12 = v10 + 3;
      if (v10 + 3 < a3)
      {
        *(_BYTE *)(a1 + v11) = BYTE1(Value) | 0x80;
        *(_BYTE *)(v10 + a1 + 2) = (_BYTE)Value;
        goto LABEL_32;
      }
    }
    return 0;
  }
  v12 = v10 + 2;
  if (v10 + 2 >= a3)
    return 0;
  *(_BYTE *)(a1 + v11) = (_BYTE)Value;
LABEL_32:
  *a2 = v12;
  return 1;
}

uint64_t serializeCFType(uint64_t a1, unint64_t *a2, unint64_t a3, const __CFString *a4)
{
  CFTypeID v8;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _BOOL8 v13;
  unint64_t v14;
  unint64_t v15;
  unsigned int Count;
  unint64_t v17;
  unint64_t Length;
  size_t v19;
  unint64_t v20;
  _BYTE *v21;
  unint64_t v22;
  int IsFloatType;
  char v24;
  const __CFNumber *v25;
  CFNumberType v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  unint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  unint64_t v33;
  _BYTE *v34;
  _BYTE *v35;
  CFIndex v36;
  uint64_t v37;
  const void *ValueAtIndex;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  _BYTE *v45;
  uint64x2_t v46;
  int16x8_t v47;
  unint64_t v48;
  uint64x2_t v49;
  int32x2_t v50;
  int16x8_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64x2_t v54;
  int16x8_t v55;
  _BYTE *v56;
  const UInt8 *BytePtr;
  uint64_t valuePtr;

  v8 = CFGetTypeID(a4);
  if (sStringTypeId == v8)
    return serializeCFString(a1, a2, a3, a4);
  if (sDateTypeId != v8)
  {
    if (sArrayTypeId == v8)
    {
      v14 = *a2;
      if (*a2 < a3)
      {
        v15 = v14 + 1;
        *(_BYTE *)(a1 + v14) = 2;
        *a2 = v14 + 1;
        Count = CFArrayGetCount((CFArrayRef)a4);
        if (Count >= 0x80)
        {
          if (Count >= 0x4000)
          {
            v29 = 4;
            if (Count >> 28)
              v29 = 5;
            if (Count < 0x200000)
              v29 = 3;
            if (v29 + v15 >= a3)
              return 0;
            if (Count >> 21)
            {
              if (Count >> 28)
              {
                *(_BYTE *)(a1 + v15) = -16;
                *(_DWORD *)(v14 + a1 + 2) = Count;
                v27 = v14 + 6;
              }
              else
              {
                *(_BYTE *)(a1 + v15) = HIBYTE(Count) | 0xE0;
                v34 = (_BYTE *)(v14 + a1);
                v34[2] = BYTE2(Count);
                v34[3] = BYTE1(Count);
                v27 = v14 + 5;
                v34[4] = Count;
              }
            }
            else
            {
              *(_BYTE *)(a1 + v15) = BYTE2(Count) | 0xC0;
              v30 = v14 + a1;
              *(_BYTE *)(v30 + 2) = BYTE1(Count);
              v27 = v14 + 4;
              *(_BYTE *)(v30 + 3) = Count;
            }
          }
          else
          {
            v27 = v14 + 3;
            if (v14 + 3 >= a3)
              return 0;
            *(_BYTE *)(a1 + v15) = BYTE1(Count) | 0x80;
            *(_BYTE *)(v14 + a1 + 2) = Count;
          }
          valuePtr = v27;
LABEL_50:
          v36 = 0;
          v37 = Count;
          while (1)
          {
            ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a4, v36);
            if ((serializeCFType(a1, &valuePtr, a3, ValueAtIndex) & 1) == 0)
              return 0;
            if (v37 == ++v36)
            {
              v12 = valuePtr;
              goto LABEL_7;
            }
          }
        }
        v12 = v14 + 2;
        if (v14 + 2 < a3)
        {
          *(_BYTE *)(a1 + v15) = Count;
          valuePtr = v14 + 2;
          if (!Count)
            goto LABEL_7;
          goto LABEL_50;
        }
      }
    }
    else if (sDataTypeId == v8)
    {
      v17 = *a2;
      if (*a2 < a3)
      {
        Length = CFDataGetLength((CFDataRef)a4);
        v19 = Length;
        if (Length >= 0x80)
        {
          if (Length >= 0x4000)
          {
            if (Length >= 0x200000)
            {
              if (Length >> 28)
              {
                v39 = Length >> 35;
                v40 = Length >> 42;
                v41 = 7;
                v42 = Length >> 49;
                v43 = 8;
                if (HIBYTE(Length))
                  v43 = 9;
                if (v42)
                  v41 = v43;
                if (!v40)
                  v41 = 6;
                if (!v39)
                  v41 = 5;
                v44 = v17 + 1;
                if (Length + v41 + v17 + 1 >= a3)
                  return 0;
                *(_BYTE *)(a1 + v17) = 6;
                if (v39)
                {
                  if (v40)
                  {
                    if (v42)
                    {
                      v53 = v17 + 2;
                      if (HIBYTE(Length))
                      {
                        *(_BYTE *)(a1 + v44) = -1;
                        *(_QWORD *)(a1 + v53) = Length;
                        v20 = v17 + 10;
                      }
                      else
                      {
                        *(_BYTE *)(a1 + v44) = -2;
                        v54 = (uint64x2_t)vdupq_n_s64(Length);
                        v55 = (int16x8_t)vshlq_u64(v54, (uint64x2_t)xmmword_23759D0A0);
                        *(int32x2_t *)v54.i8 = vmovn_s64((int64x2_t)vshlq_u64(v54, (uint64x2_t)xmmword_23759D0B0));
                        *(int32x2_t *)v55.i8 = vmovn_s64((int64x2_t)v55);
                        v55.i16[1] = v55.i16[2];
                        v55.i16[2] = v54.i16[0];
                        v55.i16[3] = v54.i16[2];
                        *(_DWORD *)(a1 + v53) = vmovn_s16(v55).u32[0];
                        v56 = (_BYTE *)(v17 + a1);
                        v56[6] = BYTE2(Length);
                        v56[7] = BYTE1(Length);
                        v20 = v17 + 9;
                        v56[8] = Length;
                      }
                    }
                    else
                    {
                      *(_BYTE *)(a1 + v44) = BYTE6(Length) | 0xFC;
                      v49 = (uint64x2_t)vdupq_n_s64(Length);
                      v50 = vmovn_s64((int64x2_t)vshlq_u64(v49, (uint64x2_t)xmmword_23759D0D0));
                      v51 = (int16x8_t)vshlq_u64(v49, (uint64x2_t)xmmword_23759D0C0);
                      *(int32x2_t *)v51.i8 = vmovn_s64((int64x2_t)v51);
                      v51.i16[1] = v51.i16[2];
                      v51.i16[2] = v50.i16[0];
                      v51.i16[3] = v50.i16[2];
                      v52 = v17 + a1;
                      *(_DWORD *)(v52 + 2) = vmovn_s16(v51).u32[0];
                      *(_BYTE *)(v52 + 6) = BYTE1(Length);
                      v20 = v17 + 8;
                      *(_BYTE *)(v52 + 7) = Length;
                    }
                  }
                  else
                  {
                    *(_BYTE *)(a1 + v44) = BYTE5(Length) | 0xF8;
                    v46 = (uint64x2_t)vdupq_n_s64(Length);
                    v47 = (int16x8_t)vshlq_u64(v46, (uint64x2_t)xmmword_23759D0B0);
                    v48 = v17 + a1;
                    *(int32x2_t *)v46.i8 = vmovn_s64((int64x2_t)vshlq_u64(v46, (uint64x2_t)xmmword_23759D0E0));
                    *(int32x2_t *)v47.i8 = vmovn_s64((int64x2_t)v47);
                    v47.i16[1] = v47.i16[2];
                    v47.i16[2] = v46.i16[0];
                    v47.i16[3] = v46.i16[2];
                    *(_DWORD *)(v48 + 2) = vmovn_s16(v47).u32[0];
                    v20 = v17 + 7;
                    *(_BYTE *)(v48 + 6) = Length;
                  }
                }
                else
                {
                  *(_BYTE *)(a1 + v44) = BYTE4(Length) | 0xF0;
                  v45 = (_BYTE *)(v17 + a1);
                  v45[2] = BYTE3(Length);
                  v45[3] = BYTE2(Length);
                  v45[4] = BYTE1(Length);
                  v20 = v17 + 6;
                  v45[5] = Length;
                }
              }
              else
              {
                if (Length + v17 + 1 + 4 >= a3)
                  return 0;
                v35 = (_BYTE *)(a1 + v17);
                *v35 = 6;
                *(_BYTE *)(a1 + v17 + 1) = BYTE3(Length) | 0xE0;
                v35[2] = BYTE2(Length);
                v35[3] = BYTE1(Length);
                v20 = v17 + 5;
                v35[4] = Length;
              }
            }
            else
            {
              v20 = v17 + 4;
              if (v17 + 4 + Length >= a3)
                return 0;
              v31 = (_BYTE *)(a1 + v17);
              *v31 = 6;
              v31[1] = BYTE2(Length) | 0xC0;
              v31[2] = BYTE1(Length);
              v31[3] = Length;
            }
          }
          else
          {
            v20 = v17 + 3;
            if (v17 + 3 + Length >= a3)
              return 0;
            v28 = (_BYTE *)(a1 + v17);
            *v28 = 6;
            v28[1] = BYTE1(Length) | 0x80;
            v28[2] = Length;
          }
        }
        else
        {
          v20 = v17 + 2;
          if (Length + v17 + 2 >= a3)
            return 0;
          v21 = (_BYTE *)(a1 + v17);
          *v21 = 6;
          v21[1] = Length;
        }
        BytePtr = CFDataGetBytePtr((CFDataRef)a4);
        memcpy((void *)(a1 + v20), BytePtr, v19);
        v12 = v20 + v19;
        goto LABEL_7;
      }
    }
    else
    {
      v22 = *a2;
      if (sNumberTypeId == v8)
      {
        v13 = v22 + 10 < a3;
        if (v22 + 10 < a3)
        {
          IsFloatType = CFNumberIsFloatType((CFNumberRef)a4);
          v24 = IsFloatType;
          if (IsFloatType)
          {
            valuePtr = 0x7FF8000000000000;
            v25 = (const __CFNumber *)a4;
            v26 = kCFNumberFloat64Type;
          }
          else
          {
            valuePtr = 0;
            v25 = (const __CFNumber *)a4;
            v26 = kCFNumberSInt64Type;
          }
          CFNumberGetValue(v25, v26, &valuePtr);
          v32 = valuePtr;
          v33 = a1 + v22;
          *(_BYTE *)v33 = 7;
          *(_BYTE *)(v33 + 1) = v24;
          *(_QWORD *)(v33 + 2) = v32;
          *a2 = v22 + 10;
        }
        return v13;
      }
      if (v22 < a3)
      {
        v12 = v22 + 1;
        *(_BYTE *)(a1 + v22) = 3;
        goto LABEL_7;
      }
    }
    return 0;
  }
  v10 = *a2;
  if (*a2 >= a3)
    return 0;
  *(_BYTE *)(a1 + v10) = 5;
  MEMORY[0x23B813DB4](a4);
  v12 = v10 + 9;
  if (v10 + 9 >= a3)
    return 0;
  *(_QWORD *)(v10 + a1 + 1) = v11;
LABEL_7:
  *a2 = v12;
  return 1;
}

CFTypeID ___init_private_attributes_block_invoke()
{
  const __CFAllocator *v0;
  CFTypeID result;

  sStringTypeId = CFStringGetTypeID();
  sDateTypeId = CFDateGetTypeID();
  sArrayTypeId = CFArrayGetTypeID();
  CFNullGetTypeID();
  sNumberTypeId = CFNumberGetTypeID();
  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  sStringIDMappings = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], 0);
  sIDStringMappings = (uint64_t)CFDictionaryCreateMutable(v0, 0, 0, MEMORY[0x24BDBD6B0]);
  CFDictionaryAddValue((CFMutableDictionaryRef)sStringIDMappings, CFSTR("kMDItemOriginApplicationIdentifier"), (const void *)1);
  CFDictionaryAddValue((CFMutableDictionaryRef)sIDStringMappings, (const void *)1, CFSTR("kMDItemOriginApplicationIdentifier"));
  CFDictionaryAddValue((CFMutableDictionaryRef)sStringIDMappings, CFSTR("kMDItemOriginSenderHandle"), (const void *)2);
  CFDictionaryAddValue((CFMutableDictionaryRef)sIDStringMappings, (const void *)2, CFSTR("kMDItemOriginSenderHandle"));
  CFDictionaryAddValue((CFMutableDictionaryRef)sStringIDMappings, CFSTR("kMDItemOriginSenderDisplayName"), (const void *)3);
  CFDictionaryAddValue((CFMutableDictionaryRef)sIDStringMappings, (const void *)3, CFSTR("kMDItemOriginSenderDisplayName"));
  CFDictionaryAddValue((CFMutableDictionaryRef)sStringIDMappings, CFSTR("kMDItemOriginSubject"), (const void *)4);
  CFDictionaryAddValue((CFMutableDictionaryRef)sIDStringMappings, (const void *)4, CFSTR("kMDItemOriginSubject"));
  CFDictionaryAddValue((CFMutableDictionaryRef)sStringIDMappings, CFSTR("kMDItemDestinationRecipients"), (const void *)5);
  CFDictionaryAddValue((CFMutableDictionaryRef)sIDStringMappings, (const void *)5, CFSTR("kMDItemDestinationRecipients"));
  CFDictionaryAddValue((CFMutableDictionaryRef)sStringIDMappings, CFSTR("kMDItemOriginMessageID"), (const void *)6);
  CFDictionaryAddValue((CFMutableDictionaryRef)sIDStringMappings, (const void *)6, CFSTR("kMDItemOriginMessageID"));
  result = CFDataGetTypeID();
  sDataTypeId = result;
  return result;
}

uint64_t copyDecryptedData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  uint64_t v9;

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a4 + 9, a5 - 9, 0);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD, void *, _QWORD))(a1 + 16))(a1, a3, *(unsigned int *)(a2 + 1), *(unsigned int *)(a2 + 5), v8, 0);

  return v9;
}

__CFArray *copyCFTypeFromBuffer(uint64_t a1, unint64_t *a2, unint64_t a3)
{
  unint64_t v4;
  unint64_t v6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  __CFArray *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  unsigned int v16;
  int v17;
  uint64_t v18;
  __CFArray *Mutable;
  uint64_t v20;
  CFNumberType v21;
  CFDateRef v22;
  unsigned int v23;
  unsigned int v24;
  BOOL v25;
  int VInt32;
  int v27;
  const void *v28;
  const void *v29;
  BOOL v30;
  CFIndex VInt64;
  unint64_t v33;

  v4 = *a2;
  v33 = v4;
  if (v4 >= a3)
  {
LABEL_67:
    Mutable = 0;
  }
  else
  {
    v6 = v4 + 1;
    v33 = v4 + 1;
    switch(*(_BYTE *)(a1 + v4))
    {
      case 1:
        v8 = (const char *)(a1 + v6);
        if (v6 <= a3)
          v9 = a3;
        else
          v9 = v4 + 1;
        break;
      case 2:
        if (v6 >= a3)
          goto LABEL_67;
        if (*(char *)(a1 + v6) < 0)
        {
          v23 = *(unsigned __int8 *)(a1 + v6);
          if (v23 >= 0xC0)
          {
            if (v23 >= 0xE0)
            {
              v25 = v23 >= 0xF0;
              v13 = 4;
              if (v25)
                v13 = 5;
            }
            else
            {
              v13 = 3;
            }
          }
          else
          {
            v13 = 2;
          }
        }
        else
        {
          v13 = 1;
        }
        if (v13 + v6 >= a3)
          goto LABEL_67;
        Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
        VInt32 = v2_readVInt32(a1, (uint64_t *)&v33);
        if (VInt32)
        {
          v27 = VInt32;
          do
          {
            v28 = (const void *)copyCFTypeFromBuffer(a1, &v33, a3);
            if (v28)
            {
              v29 = v28;
              CFArrayAppendValue(Mutable, v28);
              CFRelease(v29);
            }
            --v27;
          }
          while (v27);
        }
        goto LABEL_68;
      case 3:
        goto LABEL_52;
      case 4:
        v14 = v4 + 2;
        v15 = *(char *)(a1 + v6);
        v16 = *(unsigned __int8 *)(a1 + v6);
        if (v15 < 0)
        {
          if (v16 > 0xBF)
          {
            if (v16 > 0xDF)
            {
              if (v16 > 0xEF)
              {
                v16 = *(_DWORD *)(a1 + v14);
                v14 = v4 + 6;
              }
              else
              {
                v16 = ((v16 & 0xF) << 24) | (*(unsigned __int8 *)(a1 + v14) << 16) | (*(unsigned __int8 *)(v4 + a1 + 3) << 8) | *(unsigned __int8 *)(v4 + a1 + 4);
                v14 = v4 + 5;
              }
            }
            else
            {
              v16 = ((v16 & 0x1F) << 16) | (*(unsigned __int8 *)(a1 + v14) << 8) | *(unsigned __int8 *)(v4 + a1 + 3);
              v14 = v4 + 4;
            }
          }
          else
          {
            v17 = *(unsigned __int8 *)(a1 + v14) | ((v16 & 0x3F) << 8);
            v14 = v4 + 3;
            v16 = v17;
          }
        }
        v33 = v14;
        Mutable = (__CFArray *)CFDictionaryGetValue((CFDictionaryRef)sIDStringMappings, (const void *)v16);
        if (Mutable)
          goto LABEL_68;
LABEL_52:
        v12 = (__CFArray *)CFRetain((CFTypeRef)*MEMORY[0x24BDBD430]);
        goto LABEL_53;
      case 5:
        v18 = v4 + 9;
        if (v4 + 9 <= a3)
        {
          v22 = CFDateCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], *(CFAbsoluteTime *)(a1 + v6));
LABEL_27:
          Mutable = v22;
        }
        else
        {
          Mutable = 0;
        }
        v33 = v18;
        goto LABEL_68;
      case 6:
        if (v6 >= a3)
          goto LABEL_67;
        if (*(char *)(a1 + v6) < 0)
        {
          v24 = *(unsigned __int8 *)(a1 + v6);
          if (v24 >= 0xC0)
          {
            if (v24 >= 0xE0)
            {
              if (v24 >= 0xF0)
              {
                if (v24 >= 0xF8)
                {
                  if (v24 >= 0xFC)
                  {
                    if (v24 >= 0xFE)
                    {
                      v30 = v24 == 255;
                      v20 = 8;
                      if (v30)
                        v20 = 9;
                    }
                    else
                    {
                      v20 = 7;
                    }
                  }
                  else
                  {
                    v20 = 6;
                  }
                }
                else
                {
                  v20 = 5;
                }
              }
              else
              {
                v20 = 4;
              }
            }
            else
            {
              v20 = 3;
            }
          }
          else
          {
            v20 = 2;
          }
        }
        else
        {
          v20 = 1;
        }
        if (v20 + v6 >= a3)
          goto LABEL_67;
        VInt64 = v2_readVInt64(a1, (uint64_t *)&v33);
        v18 = v33 + VInt64;
        if (v33 + VInt64 >= a3)
          goto LABEL_67;
        v22 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)(a1 + v33), VInt64);
        goto LABEL_27;
      case 7:
        v18 = v4 + 10;
        if (v4 + 10 >= a3)
          goto LABEL_67;
        if (*(_BYTE *)(a1 + v6))
          v21 = kCFNumberFloat64Type;
        else
          v21 = kCFNumberSInt64Type;
        v22 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v21, (const void *)(v4 + a1 + 2));
        goto LABEL_27;
      default:
        goto LABEL_67;
    }
    do
    {
      if (v9 == v6)
      {
        Mutable = 0;
        v33 = v9;
        goto LABEL_68;
      }
      v10 = v6 + 1;
    }
    while (*(unsigned __int8 *)(a1 + v6++));
    v33 = v10;
    v12 = (__CFArray *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], v8, 0x8000100u);
LABEL_53:
    Mutable = v12;
  }
LABEL_68:
  *a2 = v33;
  return Mutable;
}

uint64_t v2_readVInt32(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a2;
  v4 = *a2 + 1;
  v5 = *(char *)(a1 + *a2);
  result = *(unsigned __int8 *)(a1 + *a2);
  if (v5 < 0)
  {
    if (result > 0xBF)
    {
      if (result > 0xDF)
      {
        if (result > 0xEF)
        {
          result = *(unsigned int *)(a1 + v4);
          v4 = v3 + 5;
        }
        else
        {
          result = ((result & 0xF) << 24) | (*(unsigned __int8 *)(a1 + v4) << 16) | (*(unsigned __int8 *)(v3 + a1 + 2) << 8) | *(unsigned __int8 *)(v3 + a1 + 3);
          v4 = v3 + 4;
        }
      }
      else
      {
        result = ((result & 0x1F) << 16) | (*(unsigned __int8 *)(a1 + v4) << 8) | *(unsigned __int8 *)(v3 + a1 + 2);
        v4 = v3 + 3;
      }
    }
    else
    {
      v7 = *(unsigned __int8 *)(a1 + v4) | ((result & 0x3F) << 8);
      v4 = v3 + 2;
      result = v7;
    }
  }
  *a2 = v4;
  return result;
}

unint64_t v2_readVInt64(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  unint64_t result;
  unint64_t v7;
  unsigned __int8 *v8;
  unint64_t v9;
  unsigned __int8 *v10;

  v3 = *a2;
  v4 = *a2 + 1;
  v5 = *(char *)(a1 + *a2);
  result = *(unsigned __int8 *)(a1 + *a2);
  if (v5 < 0)
  {
    if (v5 > 0xBFu)
    {
      if (v5 > 0xDFu)
      {
        if (v5 > 0xEFu)
        {
          if (v5 > 0xF7u)
          {
            if (v5 > 0xFBu)
            {
              if (v5 > 0xFDu)
              {
                if (v5 == 255)
                {
                  result = *(_QWORD *)(a1 + v4);
                  v4 = v3 + 9;
                }
                else
                {
                  v9 = (unint64_t)*(unsigned __int8 *)(a1 + v4) << 48;
                  v10 = (unsigned __int8 *)(v3 + a1);
                  result = v9 | ((unint64_t)v10[2] << 40) | ((unint64_t)v10[3] << 32) | ((unint64_t)v10[4] << 24) | ((unint64_t)v10[5] << 16) | ((unint64_t)v10[6] << 8) | v10[7];
                  v4 = v3 + 8;
                }
              }
              else
              {
                v7 = ((result & 1) << 48) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 40);
                v8 = (unsigned __int8 *)(v3 + a1);
                result = v7 | ((unint64_t)v8[2] << 32) | ((unint64_t)v8[3] << 24) | ((unint64_t)v8[4] << 16) | ((unint64_t)v8[5] << 8) | v8[6];
                v4 = v3 + 7;
              }
            }
            else
            {
              result = ((result & 3) << 40) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 32) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 2) << 24) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 3) << 16) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 4) << 8) | *(unsigned __int8 *)(v3 + a1 + 5);
              v4 = v3 + 6;
            }
          }
          else
          {
            result = ((result & 7) << 32) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 24) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 2) << 16) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 3) << 8) | *(unsigned __int8 *)(v3 + a1 + 4);
            v4 = v3 + 5;
          }
        }
        else
        {
          result = ((result & 0xF) << 24) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 16) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 2) << 8) | *(unsigned __int8 *)(v3 + a1 + 3);
          v4 = v3 + 4;
        }
      }
      else
      {
        result = ((result & 0x1F) << 16) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 8) | *(unsigned __int8 *)(v3 + a1 + 2);
        v4 = v3 + 3;
      }
    }
    else
    {
      result = *(unsigned __int8 *)(a1 + v4) | ((result & 0x3F) << 8);
      v4 = v3 + 2;
    }
  }
  *a2 = v4;
  return result;
}

void OUTLINED_FUNCTION_0_0()
{
  MEMORY[0xBAD] = -559038737;
  abort();
}

void copyConnection_cold_1()
{
  __assert_rtn("copyConnection", "CSExattrCrypto.m", 34, "sConnectionRetainCount==0");
}

void releaseConnection_cold_1()
{
  __assert_rtn("releaseConnection", "CSExattrCrypto.m", 52, "sConnectionToService");
}

void releaseConnection_cold_2()
{
  __assert_rtn("releaseConnection", "CSExattrCrypto.m", 53, "sConnectionRetainCount");
}

void releaseConnection_cold_3()
{
  __assert_rtn("releaseConnection", "CSExattrCrypto.m", 51, "connection == sConnectionToService");
}

void _copyCryptedDataWithKey_cold_1(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_237593000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "_copyCryptedDataWithKey() failed. CCCrypt() returned %d.", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_1();
}

void copyUpdatedData_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __message_assert(a1, a2, a3, a4, a5, a6, a7, a8, (char)"MDPrivateXattrServices.m");
  OUTLINED_FUNCTION_0_0();
}

void copyUpdatedData_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __message_assert(a1, a2, a3, a4, a5, a6, a7, a8, (char)"MDPrivateXattrServices.m");
  OUTLINED_FUNCTION_0_0();
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x24BDAC0E8](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, dataIn, dataInLength);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC308](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC310](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC318](c, data, *(_QWORD *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBBD98](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x24BDBBDA8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x24BDBBF10](cf);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBBFE8](cf);
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x24BDBC090]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x24BDBC138](number);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

Boolean CFStringIsEncodingAvailable(CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC6C0](*(_QWORD *)&encoding);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x24BDBC798](anURL, pathStyle);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x24BDBC898](url, resolveAgainstBase, buffer, maxBufLen);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8E0](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8F8](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFTypeID CFUUIDGetTypeID(void)
{
  return MEMORY[0x24BDBC900]();
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x24BDBC908](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

uint64_t MDPropertyCopyDecodedValue()
{
  return MEMORY[0x24BE66700]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

CFStringRef SecCreateSharedWebCredentialPassword(void)
{
  return (CFStringRef)MEMORY[0x24BDE8A08]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x24BDE8A88](query, attributesToUpdate);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

uint64_t _MDPlistContainerAddCString()
{
  return MEMORY[0x24BE66760]();
}

uint64_t _MDPlistContainerAddObject()
{
  return MEMORY[0x24BE66768]();
}

uint64_t _MDPlistContainerBeginArray()
{
  return MEMORY[0x24BE66770]();
}

uint64_t _MDPlistContainerBeginContainer()
{
  return MEMORY[0x24BE66778]();
}

uint64_t _MDPlistContainerBeginDictionary()
{
  return MEMORY[0x24BE66780]();
}

uint64_t _MDPlistContainerCopyObject()
{
  return MEMORY[0x24BE66788]();
}

uint64_t _MDPlistContainerCreateMutable()
{
  return MEMORY[0x24BE66798]();
}

uint64_t _MDPlistContainerEndArray()
{
  return MEMORY[0x24BE667B0]();
}

uint64_t _MDPlistContainerEndContainer()
{
  return MEMORY[0x24BE667B8]();
}

uint64_t _MDPlistContainerEndDictionary()
{
  return MEMORY[0x24BE667C0]();
}

uint64_t _MDPlistContainerGetBytes()
{
  return MEMORY[0x24BE667C8]();
}

uint64_t _MDPlistContainerGetLength()
{
  return MEMORY[0x24BE667D0]();
}

uint64_t _MDPlistDictionaryGetPlistObjectForKey()
{
  return MEMORY[0x24BE667F0]();
}

uint64_t _MDPlistGetPlistObjectType()
{
  return MEMORY[0x24BE66800]();
}

uint64_t _MDPlistGetRootPlistObjectFromBytes()
{
  return MEMORY[0x24BE66808]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

int dup(int a1)
{
  return MEMORY[0x24BDAE0B8](*(_QWORD *)&a1);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE388](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x24BDAE3A8](*(_QWORD *)&fd, namebuff, size, *(_QWORD *)&options);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x24BDAE478](*(_QWORD *)&fd, name, *(_QWORD *)&options);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE4F8](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x24BDAFA10]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0358](a1, a2, a3);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x24BDB0638](xarray, applier);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x24BDB0688](xarray, index);
}

const uint8_t *__cdecl xpc_array_get_uuid(xpc_object_t xarray, size_t index)
{
  return (const uint8_t *)MEMORY[0x24BDB0698](xarray, index);
}

uint64_t xpc_create_with_format()
{
  return MEMORY[0x24BDB0860]();
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x24BDB0C00](xuuid);
}

