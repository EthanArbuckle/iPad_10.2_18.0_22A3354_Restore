uint64_t _block_invoke(uint64_t a1, void *a2, void *a3)
{
  return _internalFrecency(a2, a3, 0, 0, 0, 0);
}

uint64_t _internalFrecency(void *a1, void *a2, void *a3, void *a4, void *a5, int a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL4 v33;
  BOOL v34;
  _BOOL4 v35;
  unint64_t v36;
  id v38;

  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = objc_msgSend(v11, "countOfRecents");
  v17 = objc_msgSend(v12, "countOfRecents");
  if (v16 == v17)
  {
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v11, "kind");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "kind");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v18, "isEqualToString:", v19))
      {
        v36 = objc_msgSend(v13, "indexOfObject:", v18);
        if (v36 < objc_msgSend(v13, "indexOfObject:", v19))
          v22 = -1;
        else
          v22 = 1;
        goto LABEL_31;
      }

    }
    if (!v14
      || ((v20 = objc_msgSend(v11, "hasFullTextMatch:", v14), v21 = objc_msgSend(v12, "hasFullTextMatch:", v14), v20)
        ? (v22 = -1)
        : (v22 = 1),
          v20 == v21))
    {
      if (!objc_msgSend(v15, "length"))
        goto LABEL_15;
      objc_msgSend(v11, "lastSendingAddress");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v15, "isEqualToString:", v23);

      objc_msgSend(v12, "lastSendingAddress");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v15, "isEqualToString:", v25);

      v22 = v24 ? -1 : 1;
      if (v24 == v26)
      {
LABEL_15:
        objc_msgSend(v12, "leastRecentDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "leastRecentDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v18, "compare:", v19);
LABEL_31:

      }
    }
  }
  else
  {
    v27 = v17;
    if (!a6)
      goto LABEL_25;
    objc_msgSend(v11, "metadata");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKey:", CFSTR("eventIdentifier"));
    v38 = v15;
    v29 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "metadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKey:", CFSTR("eventIdentifier"));
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v29 | v31;
    v33 = v31 != 0;

    v34 = v29 == 0;
    v15 = v38;
    v35 = !v34;
    v22 = v34 ? 1 : -1;
    if (!v32 || ((v35 ^ v33) & 1) == 0)
    {
LABEL_25:
      if (v16 > v27)
        v22 = -1;
      else
        v22 = 1;
    }
  }

  return v22;
}

void sub_1A49469CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sCRRecentRecentIdentifier_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "cr_numberWithCRRecentID:", objc_msgSend(a2, "recentID"));
}

uint64_t sCRRecentSyncKeyDict_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "isGroup"))
  {
    v11[0] = CFSTR("group");
    v10[0] = CFSTR("synckeykind");
    v10[1] = CFSTR("synckeymembers");
    v3 = (void *)objc_msgSend(a2, "members");
    v11[1] = objc_msgSend(v3, "cr_map:", sCRRecentSyncKeyDict);
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = v11;
    v6 = v10;
  }
  else
  {
    v8[0] = CFSTR("synckeyaddress");
    v9[0] = objc_msgSend(a2, "address");
    v8[1] = CFSTR("synckeykind");
    v9[1] = objc_msgSend(a2, "kind");
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = v9;
    v6 = v8;
  }
  return objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v5, v6, 2);
}

uint64_t sEventDatesComparator_block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

void sub_1A4948DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sReplaceTimeoutError_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = a2;
  if (objc_msgSend(MEMORY[0x1E0D13A50], "isTimeoutError:", a2))
    v2 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CRRecentContactsErrorDomain"), 3, 0);
  return objc_msgSend(MEMORY[0x1E0D13A68], "futureWithError:", v2);
}

double __defaultDecayer_block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (!a4)
    return 0.0;
  objc_msgSend(a3, "timeIntervalSinceDate:", a2);
  v6 = fabs(v5) / 2592000.0;
  v7 = pow(1.0 - v6, 3.0) + v6 * 3.3555 * ((1.0 - v6) * (1.0 - v6)) + v6 * (v6 * 1.9776) * (1.0 - v6);
  objc_msgSend(a4, "doubleValue");
  if (v7 <= 1.0)
    v9 = v7;
  else
    v9 = 1.0;
  return fmax(v8 * v9, 0.0);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

BOOL CRIsInternalDevice()
{
  return CPIsInternalDevice() != 0;
}

void *_createStringByApplyingIDNATranslationWithRange(void *a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(char *, unint64_t, UniChar *, uint64_t, uint64_t, _QWORD, int *))
{
  CFAllocatorRef *v8;
  char *v9;
  int v10;
  __CFString *v11;
  int v13;
  uint64_t v14;
  const __CFAllocator *v15;
  UniChar *v16;
  int v17;
  UniChar *v18;
  void *v19;
  int v21;
  char v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3 >> 31)
    return 0;
  v8 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  if (a3 < 0x101)
    v9 = &v22;
  else
    v9 = (char *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 2 * a3, 0);
  objc_msgSend(a1, "getCharacters:range:", v9, a2, a3);
  v21 = 0;
  v10 = a4(v9, a3, 0, 0, 1, 0, &v21);
  v11 = 0;
  if (v21 < 1 || v21 == 15)
  {
    v13 = v10;
    v14 = (v10 + 1);
    v15 = *v8;
    v16 = (UniChar *)CFAllocatorAllocate(*v8, 2 * (int)v14, 0);
    if (v16)
      v17 = 0;
    else
      v17 = 7;
    v21 = v17;
    if (v16)
    {
      v18 = v16;
      a4(v9, a3, v16, v14, 1, 0, &v21);
      if (v21 <= 0)
      {
        v11 = (__CFString *)CFStringCreateWithCharactersNoCopy(v15, v18, v13, v15);
        goto LABEL_18;
      }
      CFAllocatorDeallocate(v15, v18);
    }
    v11 = 0;
  }
LABEL_18:
  if (a3 >= 0x101)
    CFAllocatorDeallocate(*v8, v9);
  if (!v11)
    return 0;
  v19 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v19, "replaceCharactersInRange:withString:", a2, a3, v11);

  return v19;
}

char *sCRSQLite3MPrintTransform_block_invoke(uint64_t a1, void *a2)
{
  char *result;
  char *v4;
  uint64_t v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    result = sqlite3_mprintf("%q", objc_msgSend(a2, "UTF8String"));
    if (result)
    {
      v4 = result;
      v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", result);
      sqlite3_free(v4);
      return (char *)v5;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return (char *)a2;
    else
      return 0;
  }
  return result;
}

uint64_t ___posixLocale_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  _posixLocale__locale = result;
  return result;
}

uint64_t ___unsafeDomainNameCharacterSet_block_invoke()
{
  void *v0;
  uint64_t result;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3780], "characterSetWithRange:", 48, 10);
  objc_msgSend(v0, "addCharactersInRange:", 65, 26);
  objc_msgSend(v0, "addCharactersInRange:", 97, 26);
  objc_msgSend(v0, "addCharactersInString:", CFSTR("-."));
  objc_msgSend(v0, "invert");
  result = objc_msgSend(v0, "copy");
  _unsafeDomainNameCharacterSet_unsafeDomainNameCharacterSet = result;
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1E0C97C98](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x1E0C97CB0](allocator, ptr);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FF8](alloc, chars, numChars, contentsDeallocator);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1E0C99208](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0C99230](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
  MEMORY[0x1E0C99240](tokenizer, string, range.location, range.length);
}

uint64_t CNAbstractMethodException()
{
  return MEMORY[0x1E0D136F0]();
}

uint64_t CPIsInternalDevice()
{
  return MEMORY[0x1E0CFA2C8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x1E0DE87D0](a1);
}

char *sqlite3_mprintf(const char *a1, ...)
{
  return (char *)MEMORY[0x1E0DE8848](a1);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

