uint64_t acc_userDefaults_BOOLForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", a1);

  return v3;
}

uint64_t acc_userDefaults_copyStringForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaults_copyArrayForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaults_copyDictionaryForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaults_copyIntegerForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", a1);

  return v3;
}

double acc_userDefaults_copyDoubleForKey(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", a1);
  v4 = v3;

  return v4;
}

void acc_userDefaults_setArrayForKey(uint64_t a1, uint64_t a2)
{
  id v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", a2, a1);

}

void acc_userDefaults_setIntegerForKey(uint64_t a1, uint64_t a2)
{
  id v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a2, a1);

}

void acc_userDefaults_setDoubleForKey(uint64_t a1, double a2)
{
  id v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDouble:forKey:", a1, a2);

}

uint64_t acc_userDefaultsIapd_BOOLForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", a1);

  return v3;
}

uint64_t acc_userDefaultsIapd_copyStringForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaultsIapd_copyArrayForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaultsIapd_copyDictionaryForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaultsIapd_copyIntegerForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", a1);

  return v3;
}

double acc_userDefaultsIapd_copyDoubleForKey(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", a1);
  v4 = v3;

  return v4;
}

uint64_t acc_userDefaultsLogging_BOOLForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsLogging](ACCUserDefaults, "sharedDefaultsLogging");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", a1);

  return v3;
}

uint64_t init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 1, (uint64_t)_kLoggingModuleEntries);
  return init_logging_signposts();
}

CFStringRef CFCreateUUIDString()
{
  const __CFAllocator *v0;
  const __CFUUID *v1;
  CFStringRef v2;

  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v1 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x24BDBD240]);
  v2 = CFUUIDCreateString(v0, v1);
  if (v1)
    CFRelease(v1);
  return v2;
}

CFStringRef CFArrayCreateRawValuesString(const __CFArray *a1, int a2)
{
  const __CFAllocator *v4;
  CFMutableStringRef Mutable;
  CFRange v6;
  void (__cdecl *v7)(const void *, void *);
  CFStringRef Copy;

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  CFStringAppend(Mutable, CFSTR("{\n"));
  v6.length = CFArrayGetCount(a1);
  if (a2)
    v7 = (void (__cdecl *)(const void *, void *))_CFArraySetPrintRawValuesApplierFunctionHex;
  else
    v7 = (void (__cdecl *)(const void *, void *))_CFArraySetPrintRawValuesApplierFunctionDecimal;
  v6.location = 0;
  CFArrayApplyFunction(a1, v6, v7, Mutable);
  CFStringAppend(Mutable, CFSTR("}"));
  Copy = CFStringCreateCopy(v4, Mutable);
  if (Mutable)
    CFRelease(Mutable);
  return Copy;
}

void _CFArraySetPrintRawValuesApplierFunctionHex(uint64_t a1, CFMutableStringRef theString)
{
  CFStringAppendFormat(theString, 0, CFSTR("\t%p,\n"), a1);
}

void _CFArraySetPrintRawValuesApplierFunctionDecimal(uint64_t a1, CFMutableStringRef theString)
{
  CFStringAppendFormat(theString, 0, CFSTR("\t%lu,\n"), a1);
}

CFStringRef CFSetCreateRawValuesString(const __CFSet *a1, int a2)
{
  const __CFAllocator *v4;
  CFMutableStringRef Mutable;
  void (__cdecl *v6)(const void *, void *);
  CFStringRef Copy;

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  CFStringAppend(Mutable, CFSTR("{\n"));
  if (a2)
    v6 = (void (__cdecl *)(const void *, void *))_CFArraySetPrintRawValuesApplierFunctionHex;
  else
    v6 = (void (__cdecl *)(const void *, void *))_CFArraySetPrintRawValuesApplierFunctionDecimal;
  CFSetApplyFunction(a1, v6, Mutable);
  CFStringAppend(Mutable, CFSTR("}"));
  Copy = CFStringCreateCopy(v4, Mutable);
  if (Mutable)
    CFRelease(Mutable);
  return Copy;
}

CFStringRef CFDictCreateRawKeyValueString(const __CFDictionary *a1, int a2)
{
  const __CFAllocator *v4;
  CFMutableStringRef Mutable;
  void (__cdecl *v6)(const void *, const void *, void *);
  CFStringRef Copy;

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  CFStringAppend(Mutable, CFSTR("{\n"));
  if (a2)
    v6 = (void (__cdecl *)(const void *, const void *, void *))_CFDictPrintRawKeyValueApplierFunctionHex;
  else
    v6 = (void (__cdecl *)(const void *, const void *, void *))_CFDictPrintRawKeyValueApplierFunctionDecimal;
  CFDictionaryApplyFunction(a1, v6, Mutable);
  CFStringAppend(Mutable, CFSTR("}"));
  Copy = CFStringCreateCopy(v4, Mutable);
  if (Mutable)
    CFRelease(Mutable);
  return Copy;
}

void _CFDictPrintRawKeyValueApplierFunctionHex(uint64_t a1, uint64_t a2, CFMutableStringRef theString)
{
  CFStringAppendFormat(theString, 0, CFSTR("\t%p = %p;\n"), a1, a2);
}

void _CFDictPrintRawKeyValueApplierFunctionDecimal(uint64_t a1, uint64_t a2, CFMutableStringRef theString)
{
  CFStringAppendFormat(theString, 0, CFSTR("\t%lu = %lu;\n"), a1, a2);
}

const __CFString *CFStringCreateFromCFData(const __CFData *a1, const __CFString *a2)
{
  const UInt8 *BytePtr;
  CFIndex Length;
  const __CFAllocator *v6;
  CFMutableStringRef Mutable;
  unsigned int v8;
  CFStringRef Copy;

  if (!a1)
    return &stru_24DA3CAB0;
  BytePtr = CFDataGetBytePtr(a1);
  Length = CFDataGetLength(a1);
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (Length >= 1)
  {
    do
    {
      v8 = *BytePtr++;
      CFStringAppendFormat(Mutable, 0, a2, v8);
      --Length;
    }
    while (Length);
  }
  Copy = CFStringCreateCopy(v6, Mutable);
  if (Mutable)
    CFRelease(Mutable);
  return Copy;
}

CFStringRef CFStringCreateFromFormat(uint64_t a1, const __CFString *a2)
{
  const __CFAllocator *v4;
  CFMutableStringRef Mutable;
  CFStringRef Copy;

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  CFStringAppendFormat(Mutable, 0, a2, a1);
  Copy = CFStringCreateCopy(v4, Mutable);
  if (Mutable)
    CFRelease(Mutable);
  return Copy;
}

CFSetRef CFDictionaryGetKeys(const __CFDictionary *a1, int a2)
{
  const __CFAllocator *v3;
  const CFSetCallBacks *v4;
  CFMutableSetRef Mutable;
  const __CFSet *v6;
  CFSetRef Copy;

  if (!a1)
    return 0;
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v4 = a2 ? (const CFSetCallBacks *)MEMORY[0x24BDBD6B8] : 0;
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v4);
  if (!Mutable)
    return 0;
  v6 = Mutable;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)CFDictionaryApplierFunction_addKeyToMutableSet, Mutable);
  Copy = CFSetCreateCopy(v3, v6);
  CFRelease(v6);
  return Copy;
}

void CFDictionaryApplierFunction_addKeyToMutableSet(void *value, int a2, CFMutableSetRef theSet)
{
  if (value)
  {
    if (theSet)
      CFSetAddValue(theSet, value);
  }
}

char *createCStringFromCFString(const __CFString *a1, CFStringEncoding a2)
{
  char *v4;
  int CString;
  BOOL v6;
  CFIndex bufferSize;
  CFRange v9;

  bufferSize = 0;
  if (!a1)
    return 0;
  v9.length = CFStringGetLength(a1);
  v9.location = 0;
  CFStringGetBytes(a1, v9, 0x8000100u, 0, 0, 0, 0, &bufferSize);
  v4 = (char *)malloc_type_malloc(++bufferSize, 0x4FF45A26uLL);
  CString = CFStringGetCString(a1, v4, bufferSize, a2);
  if (v4)
    v6 = CString == 0;
  else
    v6 = 0;
  if (v6)
  {
    free(v4);
    return 0;
  }
  return v4;
}

void CFDictionaryApplierFunction_addValueToMutableDictionary(void *key, void *value, CFMutableDictionaryRef theDict)
{
  if (key)
  {
    if (theDict)
      CFDictionaryAddValue(theDict, key, value);
  }
}

void CFDictionaryApplierFunction_setValueInMutableDictionary(void *key, void *value, CFMutableDictionaryRef theDict)
{
  if (key)
  {
    if (theDict)
      CFDictionarySetValue(theDict, key, value);
  }
}

void CFSetApplierFunction_removeValueFromMutableDictionary(void *key, CFMutableDictionaryRef theDict)
{
  CFDictionaryRemoveValue(theDict, key);
}

void executeOnMainThreadSync(uint64_t a1)
{
  _QWORD block[5];

  if (pthread_main_np())
  {
    (*(void (**)(uint64_t))(a1 + 16))(a1);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __executeOnMainThreadSync_block_invoke;
    block[3] = &unk_24DA3BCD8;
    block[4] = a1;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __executeOnMainThreadSync_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void executeOnMainThreadAsync(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __executeOnMainThreadAsync_block_invoke;
  block[3] = &unk_24DA3BD00;
  block[4] = a1;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __executeOnMainThreadAsync_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  _QWORD block[6];
  char v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_0;
  v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_modules_onceToken != -1)
    dispatch_once(&init_logging_modules_onceToken, block);
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  uint64_t (*__ptr32 *v2)();
  uint64_t v3;
  unint64_t v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  os_log_t v10;
  unint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  uint8_t v16[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = &off_218F34000;
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_218F27000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
          v7 = *(_QWORD *)(a1 + 32);
          v8 = "<Undefined>";
        }
      }
      v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v16, v4, &v17);
          v9 = "<Undefined>";
        }
      }
      v10 = os_log_create(v8, v9);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v13 = v8;
          v14 = 2080;
          v15 = v9;
          _os_log_debug_impl(&dword_218F27000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_218F27000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = &off_218F34000;
  }
  else
  {
    LODWORD(v11) = 0;
    v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((_QWORD *)v2 + 351);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_218F27000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(_QWORD *)(a1 + 40);
  gNumLogObjects = v11;
}

id convertNSDataToNSString(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  void *v9;

  v3 = a1;
  v4 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = objc_retainAutorelease(v3);
    v6 = objc_msgSend(v5, "bytes");
    v7 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    if (objc_msgSend(v5, "length"))
    {
      v8 = 0;
      do
        objc_msgSend(v7, "appendFormat:", v4, *(unsigned __int8 *)(v6 + v8++));
      while (v8 < objc_msgSend(v5, "length"));
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id trimBidirectionalUnicodeCharacters(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD14A8];
  v2 = a1;
  objc_msgSend(v1, "characterSetWithCharactersInString:", CFSTR("\u202A\u202B\u202C\u202D"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id removeBidirectionalUnicodeCharacters(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x24BDD14A8];
  v2 = a1;
  objc_msgSend(v1, "characterSetWithCharactersInString:", CFSTR("\u202A\u202B\u202C\u202D"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsJoinedByString:", &stru_24DA3CAB0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id convertNSStringToNSData(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  size_t v7;
  _BYTE *v8;
  unint64_t v9;
  int v10;
  uint64_t v11;
  char v12;
  char v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  char v17;
  char v18;
  unint64_t v19;
  void *v20;
  __int16 v22;

  v1 = a1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "hexadecimalCharacterSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "invertedSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "componentsSeparatedByCharactersInSet:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", &stru_24DA3CAB0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v1 = objc_retainAutorelease(v5);
    v6 = (const char *)objc_msgSend(v1, "UTF8String");
    v7 = strlen(v6) >> 1;
    v8 = malloc_type_malloc(v7, 0x71BB6ACDuLL);
    if (v6 && (unint64_t)objc_msgSend(v1, "length") >= 2)
    {
      v9 = 0;
      v10 = 0;
      do
      {
        v11 = 0;
        v22 = -21846;
        v12 = 1;
        do
        {
          v13 = v12;
          v14 = v6[v11 | (2 * v10)];
          v15 = v14 - 48;
          v16 = v14 - 65;
          if ((v14 - 97) >= 6)
            v17 = 0;
          else
            v17 = v14 - 87;
          v18 = v14 - 55;
          if (v16 > 5)
            v18 = v17;
          if (v15 < 0xA)
            v18 = v15;
          *((_BYTE *)&v22 + v11) = v18;
          v11 = 1;
          v12 = 0;
        }
        while ((v13 & 1) != 0);
        v8[v9] = HIBYTE(v22) | (16 * v22);
        v9 = (v10 + 1);
        v19 = objc_msgSend(v1, "length");
        v10 = v9;
      }
      while (v9 < v19 >> 1);
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v8, v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      free(v8);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

uint64_t classImplementsMethodsInProtocol(void *a1, void *a2, BOOL a3, BOOL a4, _QWORD *a5)
{
  Protocol *v9;
  void *v10;
  objc_method_description *v11;
  objc_method_description *v12;
  unint64_t v13;
  SEL *p_name;
  void *v15;
  uint64_t v16;
  unsigned int outCount;

  v9 = a2;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  outCount = 0;
  v11 = protocol_copyMethodDescriptionList(v9, a3, a4, &outCount);
  v12 = v11;
  if (outCount)
  {
    v13 = 0;
    p_name = &v11->name;
    do
    {
      if ((objc_msgSend(a1, "instancesRespondToSelector:", *p_name) & 1) == 0)
      {
        NSStringFromSelector(*p_name);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v15);

      }
      ++v13;
      p_name += 2;
    }
    while (v13 < outCount);
  }
  free(v12);
  if (outCount && objc_msgSend(v10, "count"))
  {
    v16 = 0;
    if (!a5)
      goto LABEL_12;
    goto LABEL_11;
  }
  v16 = 1;
  if (a5)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:

  return v16;
}

uint64_t isNSObjectNull(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;

  if (!a1)
    return 1;
  v1 = (void *)MEMORY[0x24BDBCEF8];
  v2 = a1;
  objc_msgSend(v1, "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

id NSObjectIfNotNull(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if ((isNSObjectNull(v1) & 1) != 0)
    v2 = 0;
  else
    v2 = v1;

  return v2;
}

uint64_t isNSObjectEqual(unint64_t a1, uint64_t a2)
{
  if (a1 | a2)
    return objc_msgSend((id)a1, "isEqual:", a2);
  else
    return 1;
}

id castNSObjectToType(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id readJSONFile(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v5;

  if (!a1)
  {
    v3 = 0;
    return v3;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
    goto LABEL_5;
  v5 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v1, 0, &v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v5)
  {

LABEL_5:
    v3 = 0;
  }

  return v3;
}

uint64_t writeJSONFile(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;

  v3 = a1;
  v4 = a2;
  if (!v4)
    goto LABEL_7;
  if (!v3)
    v3 = (id)MEMORY[0x24BDBD1B8];
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v3))
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v3, 1, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v9)
      v7 = 0;
    else
      v7 = objc_msgSend(v5, "writeToFile:atomically:", v4, 1);

  }
  else
  {
LABEL_7:
    v7 = 0;
  }

  return v7;
}

id base64EncodeArray(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "base64EncodedStringWithOptions:", 0, (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

id base64DecodeArray(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v9 = objc_alloc(MEMORY[0x24BDBCE50]);
        v10 = (void *)objc_msgSend(v9, "initWithBase64EncodedString:options:", v8, 0, (_QWORD)v12);
        if (v10)
          objc_msgSend(v2, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v2;
}

uint64_t ascii_to_hex(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  char v11;
  char v12;
  __int16 v13;

  if (a3 >= 2)
  {
    v3 = 0;
    v4 = a3 >> 1;
    do
    {
      v5 = 0;
      v13 = -21846;
      v6 = 1;
      do
      {
        v7 = v6;
        v8 = *(unsigned __int8 *)(a2 + (v5 | (2 * v3)));
        v9 = v8 - 48;
        v10 = v8 - 65;
        if ((v8 - 97) >= 6)
          v11 = 0;
        else
          v11 = v8 - 87;
        v12 = v8 - 55;
        if (v10 > 5)
          v12 = v11;
        if (v9 < 0xA)
          v12 = v9;
        *((_BYTE *)&v13 + v5) = v12;
        v5 = 1;
        v6 = 0;
      }
      while ((v7 & 1) != 0);
      *(_BYTE *)(result + v3++) = HIBYTE(v13) | (16 * v13);
    }
    while (v3 != v4);
  }
  return result;
}

unsigned __int8 *printBytes(unsigned __int8 *result, uint64_t a2, char *a3, int a4)
{
  uint64_t v4;
  unsigned __int8 *v7;
  unsigned int v8;

  if (result)
  {
    v4 = a2;
    if (a2)
    {
      v7 = result;
      do
      {
        v8 = *v7++;
        result = (unsigned __int8 *)printf(a3, v8);
        --v4;
      }
      while (v4);
      if (a4)
        return (unsigned __int8 *)putchar(10);
    }
  }
  return result;
}

const char *removeNewline(const char *a1)
{
  size_t v2;

  v2 = strlen(a1);
  if (v2 && a1[v2 - 1] == 10)
    a1[v2 - 1] = 0;
  return a1;
}

char *createHexString(uint64_t a1, unint64_t a2, int a3)
{
  size_t v5;
  char *result;
  char *v7;
  unint64_t v8;
  char *v9;
  char *v10;
  size_t v11;
  char *v12;
  size_t v13;
  char *v14;

  if (a1 && a2)
  {
    if ((a2 & 0x8000000000000000) == 0)
    {
      if (!a3)
      {
        v5 = (2 * a2) | 1;
LABEL_10:
        v7 = (char *)malloc_type_malloc(v5, 0xA799D077uLL);
        if (v7)
        {
          v8 = 0;
          v9 = v7;
          v14 = v7;
          v10 = v7;
          v11 = v5;
          while (a3)
          {
            if (v8 >= a2 - 1)
            {
              v12 = v10;
              v13 = v11;
              goto LABEL_17;
            }
            snprintf(v10, v11, "%02X ");
LABEL_18:
            ++v8;
            v11 -= 3;
            v10 += 3;
            v9 += 2;
            v5 -= 2;
            if (a2 == v8)
              return v14;
          }
          v12 = v9;
          v13 = v5;
LABEL_17:
          snprintf(v12, v13, "%02X");
          goto LABEL_18;
        }
        goto LABEL_21;
      }
      if (is_mul_ok(a2, 3uLL))
      {
        v5 = 3 * a2;
        goto LABEL_10;
      }
    }
    do
LABEL_21:
      result = (char *)malloc_type_malloc(0xEuLL, 0xD85E358FuLL);
    while (!result);
    strcpy(result, "<print error>");
    return result;
  }
  result = (char *)malloc_type_malloc(7uLL, 0x55AA73BCuLL);
  if (result)
    strcpy(result, "(null)");
  return result;
}

uint64_t obfuscatedPointer(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    v2 = obfuscatedPointer_salt;
    if (!obfuscatedPointer_salt)
    {
      v2 = random();
      obfuscatedPointer_salt = v2;
    }
    return v1 + v2;
  }
  return result;
}

BOOL getMemoryUse(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  __int128 v6;
  kern_return_t v7;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  int v33;

  v33 = -1431655766;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v31 = v6;
  v32 = v6;
  v29 = v6;
  v30 = v6;
  v27 = v6;
  v28 = v6;
  v25 = v6;
  v26 = v6;
  v23 = v6;
  v24 = v6;
  v21 = v6;
  v22 = v6;
  v19 = v6;
  v20 = v6;
  v18 = v6;
  v16 = v6;
  v17 = v6;
  v14 = v6;
  v15 = v6;
  v12 = v6;
  v13 = v6;
  *(_OWORD *)task_info_out = v6;
  v11 = v6;
  task_info_outCnt = 93;
  v7 = task_info(*MEMORY[0x24BDAEC58], 0x16u, task_info_out, &task_info_outCnt);
  if (!v7)
  {
    if (a1)
      *a1 = v11;
    if (a2)
      *a2 = *(_QWORD *)task_info_out;
    if (a3)
      *a3 = v19;
  }
  return v7 == 0;
}

id logObjectForModule()
{
  BOOL v0;
  id v1;
  id v2;

  if (gLogObjects)
    v0 = gNumLogObjects < 1;
  else
    v0 = 1;
  if (v0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      logObjectForModule_cold_1();
    v2 = (id)MEMORY[0x24BDACB70];
    v1 = MEMORY[0x24BDACB70];
  }
  else
  {
    v2 = *(id *)gLogObjects;
  }
  return v2;
}

void _CFNotificationCallback(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  BOOL v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v17 = 138412546;
    v18 = a3;
    v19 = 2112;
    v20 = a5;
    _os_log_impl(&dword_218F27000, v10, OS_LOG_TYPE_INFO, "CFNotification received: <name: %@, userInfo: %@>", (uint8_t *)&v17, 0x16u);
  }

  if (a2 && a3)
  {
    v11 = a2;
    v12 = a3;
    v13 = a5;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
      v14 = MEMORY[0x24BDACB70];
      v15 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      _CFNotificationCallback_cold_1();

    objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:userInfo:", v12, 0, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "commStatusDidChangeNotification:", v16);

  }
}

id _callStateDictionaryForCall(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  _QWORD v86[12];
  _QWORD v87[14];

  v87[12] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v80 = 0;
  v81 = &v80;
  v82 = 0x3032000000;
  v83 = __Block_byref_object_copy_;
  v84 = __Block_byref_object_dispose_;
  v85 = 0;
  v76 = 0;
  v77 = &v76;
  v78 = 0x2020000000;
  v79 = 0;
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 0;
  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy_;
  v70 = __Block_byref_object_dispose_;
  v71 = 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy_;
  v64 = __Block_byref_object_dispose_;
  v65 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy_;
  v58 = __Block_byref_object_dispose_;
  v59 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy_;
  v52 = __Block_byref_object_dispose_;
  v53 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = ___callStateDictionaryForCall_block_invoke;
  v19[3] = &unk_24DA3BF10;
  v21 = &v80;
  v18 = v1;
  v20 = v18;
  v22 = &v76;
  v23 = &v72;
  v24 = &v66;
  v25 = &v60;
  v26 = &v54;
  v27 = &v44;
  v28 = &v48;
  v29 = &v40;
  v30 = &v36;
  v31 = &v32;
  executeOnMainThreadSync((uint64_t)v19);
  v2 = v81[5];
  v3 = *MEMORY[0x24BE00A08];
  v86[0] = *MEMORY[0x24BE00A20];
  v86[1] = v3;
  v4 = v55[5];
  v87[0] = v2;
  v87[1] = v4;
  v86[2] = *MEMORY[0x24BE00A38];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v77 + 6));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v87[2] = v5;
  v86[3] = *MEMORY[0x24BE009F8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v73 + 6));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BE009E8];
  v8 = v67[5];
  v87[3] = v6;
  v87[4] = v8;
  v9 = *MEMORY[0x24BE009E0];
  v86[4] = v7;
  v86[5] = v9;
  v87[5] = v61[5];
  v86[6] = *MEMORY[0x24BE00A18];
  v87[6] = v49[5];
  v86[7] = *MEMORY[0x24BE00A28];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v45 + 6));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v87[7] = v10;
  v86[8] = *MEMORY[0x24BE00A10];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v41 + 24));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BE009F0];
  v87[8] = v11;
  v87[9] = &unk_24DA3DED8;
  v13 = *MEMORY[0x24BE00A00];
  v86[9] = v12;
  v86[10] = v13;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v37 + 6));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v87[10] = v14;
  v86[11] = *MEMORY[0x24BE00A30];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v33[3]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v87[11] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v87, v86, 12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v80, 8);

  return v16;
}

void sub_218F2C614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  char a67;
  char a71;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Unwind_Resume(a1);
}

uint64_t _convertCTGradedSignalToCommSignal(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (!v1 || (objc_msgSend(v1, "intValue") & 0x80000000) != 0)
  {
    v3 = 0;
  }
  else if ((int)objc_msgSend(v2, "intValue") <= 5)
  {
    v3 = objc_msgSend(v2, "intValue");
  }
  else
  {
    v3 = 5;
  }

  return v3;
}

uint64_t _convertCTRegStatusToCommRegStatus(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1 && (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDC2C78]) & 1) == 0)
  {
    if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDC2C58]) & 1) != 0)
    {
      v3 = 1;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDC2C70]) & 1) != 0)
    {
      v3 = 2;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDC2C48]) & 1) != 0)
    {
      v3 = 3;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDC2C60]) & 1) != 0)
    {
      v3 = 4;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDC2C68]) & 1) != 0)
    {
      v3 = 5;
    }
    else if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDC2C50]))
    {
      v3 = 6;
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_218F2E19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_218F2E2AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218F2E474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218F2E768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218F2E890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218F2E97C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218F2EB60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218F2ED44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218F2FBEC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_218F30670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_218F30C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218F30DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218F31010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218F313F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_218F31998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218F31B88(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id _recentCallsPredicate()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE14948], "predicateForCallsWithAnyMediaTypes:", &unk_24DA3DF58);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v0;
  v1 = (void *)MEMORY[0x24BE14948];
  v2 = *MEMORY[0x24BE149C8];
  v9[0] = *MEMORY[0x24BE149D0];
  v9[1] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "predicateForCallsWithAnyServiceProviders:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x24BE14948], "predicateForCallsWithRemoteParticipantCount:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

__CFString *_overrideLabelForFaceTime(void *a1, int a2)
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  const __CFString *v7;
  __CFString *v8;
  __CFString *v9;

  v3 = a1;
  v4 = v3;
  if (a2 == 3)
  {
    TUBundle();
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("DIAL_CALL_FACETIME");
    goto LABEL_5;
  }
  if (a2 == 2)
  {
    TUBundle();
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("DIAL_CALL_FACETIME_AUDIO");
LABEL_5:
    -[__CFString localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", v7, &stru_24DA3CAB0, CFSTR("TelephonyUtilities"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v4 = v6;
    goto LABEL_9;
  }
  v9 = &stru_24DA3CAB0;
  if (v3)
    v9 = v3;
  v8 = v9;
LABEL_9:

  return v8;
}

void ___callStateDictionaryForCall_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  __CFString *v33;
  id v34;
  void *v35;
  int v36;
  int v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  int v44;
  int v45;
  void *v46;
  void *v47;
  double v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "handle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (__CFString *)v3;
  else
    v5 = &stru_24DA3CAB0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);

  v6 = *(id *)(a1 + 32);
  v7 = v6;
  if (v6)
  {
    switch(objc_msgSend(v6, "status"))
    {
      case 1u:
        if ((objc_msgSend(v7, "isScreening") & 1) != 0)
          goto LABEL_7;
        if (objc_msgSend(v7, "isConnected"))
          v8 = 4;
        else
          v8 = 3;
        break;
      case 2u:
        v8 = 5;
        break;
      case 3u:
        v8 = 1;
        break;
      case 4u:
        v8 = 2;
        break;
      case 5u:
        v8 = 6;
        break;
      default:
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    v8 = 0;
  }

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;
  if (objc_msgSend(*(id *)(a1 + 32), "isOutgoing"))
    v9 = 2;
  else
    v9 = 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v9;
  objc_msgSend(*(id *)(a1 + 32), "callUUID");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (__CFString *)v10;
  else
    v12 = &stru_24DA3CAB0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v12);

  objc_msgSend(*(id *)(a1 + 32), "contactIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (__CFString *)v13;
  else
    v15 = &stru_24DA3CAB0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v15);

  v16 = *(id *)(a1 + 32);
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "displayName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isConferenced"))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v19 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
        v19 = MEMORY[0x24BDACB70];
        v20 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        ___callStateDictionaryForCall_block_invoke_cold_1(v17, v19);

      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "currentCallGroups");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v50 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            objc_msgSend(v27, "calls");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "containsObject:", v17);

            if (v29)
            {
              objc_msgSend(v27, "displayName");
              v30 = objc_claimAutoreleasedReturnValue();

              v18 = (void *)v30;
            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
        }
        while (v24);
      }

    }
  }
  else
  {
    v18 = 0;
  }

  removeBidirectionalUnicodeCharacters(v18);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v31;
  if (v31)
    v33 = (__CFString *)v31;
  else
    v33 = &stru_24DA3CAB0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v33);

  v34 = *(id *)(a1 + 32);
  v35 = v34;
  if (v34)
  {
    v36 = objc_msgSend(v34, "service");
    if ((v36 - 1) >= 3)
      v37 = 0;
    else
      v37 = v36;
  }
  else
  {
    v37 = 0;
  }

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v37;
  objc_msgSend(*(id *)(a1 + 32), "localizedLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  _overrideLabelForFaceTime(v38, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24));
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v41 = *(void **)(v40 + 40);
  *(_QWORD *)(v40 + 40) = v39;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "isConferenced");
  v42 = *(id *)(a1 + 32);
  v43 = v42;
  if (v42)
  {
    v44 = objc_msgSend(v42, "disconnectedReason");
    if ((v44 - 2) < 3)
    {
      v45 = 1;
      goto LABEL_51;
    }
    v45 = 2;
    if (v44 == 8 || v44 == 14)
      goto LABEL_51;
  }
  v45 = 0;
LABEL_51:

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = v45;
  objc_msgSend(*(id *)(a1 + 32), "dateConnected");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    objc_msgSend(*(id *)(a1 + 32), "dateConnected");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "timeIntervalSince1970");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = (unint64_t)v48;

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = 0;
  }

}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_10(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_218F27000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

void logObjectForModule_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_218F27000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void _CFNotificationCallback_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_218F27000, v0, v1, "Converting CFNotification to NSNotification...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void ___callStateDictionaryForCall_block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "callUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_3(&dword_218F27000, a2, v4, "Call is conferenced, trying to find name of call group... (callUUID: %@)", (uint8_t *)&v5);

  OUTLINED_FUNCTION_9();
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x24BDBB7D8](theArray, range.location, range.length, applier, context);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC3C0](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x24BDBC3C8](theSet, applier, context);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x24BDBC3E0](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D0](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

uint64_t CTIndicatorsGetSignalStrength()
{
  return MEMORY[0x24BDC25D0]();
}

uint64_t CTRegistrationCopyOperatorName()
{
  return MEMORY[0x24BDC2660]();
}

uint64_t CTRegistrationGetStatus()
{
  return MEMORY[0x24BDC2678]();
}

uint64_t CTSIMSupportGetSIMStatus()
{
  return MEMORY[0x24BDC26A0]();
}

uint64_t CTTelephonyCenterAddObserver()
{
  return MEMORY[0x24BDC26D8]();
}

uint64_t CTTelephonyCenterGetDefault()
{
  return MEMORY[0x24BDC26E0]();
}

uint64_t CTTelephonyCenterRemoveObserver()
{
  return MEMORY[0x24BDC26E8]();
}

uint64_t CTTelephonyCenterSetDefaultDispatchQueue()
{
  return MEMORY[0x24BDC26F0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t TUBundle()
{
  return MEMORY[0x24BEB4A60]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t acc_strings_bundle()
{
  return MEMORY[0x24BE1A0E0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t init_logging_signposts()
{
  return MEMORY[0x24BE009D8]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x24BEDD4D0](p, isRequiredMethod, isInstanceMethod, outCount);
}

int pthread_main_np(void)
{
  return MEMORY[0x24BDAF8B0]();
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

uint64_t random(void)
{
  return MEMORY[0x24BDAFA48]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x24BDB0180](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

