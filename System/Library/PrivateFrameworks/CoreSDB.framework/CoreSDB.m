uint64_t CSDBThreadedRecordStoreOwnsCurrentThread(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x24BEDD108](a1, sel_ownsCurrentThreadOtherwiseAssert_, a2);
}

void sub_20AA58CF4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFString *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t Database;
  _QWORD *v9;
  uint64_t v10;
  uid_t v11;
  gid_t v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint8_t buf[16];
  _DWORD __b[258];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    return;
  v2 = *(_QWORD *)(a1 + 40);
  if (!v2)
  {
    if (!IMOSLoggingEnabled())
      return;
    v13 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      return;
    v14 = *(_QWORD *)(a1 + 32);
    __b[0] = 138412290;
    *(_QWORD *)&__b[1] = v14;
    v15 = "No DB path block passed into CSDBThreadedRecordStore %@";
LABEL_23:
    _os_log_impl(&dword_20AA57000, v13, OS_LOG_TYPE_INFO, v15, (uint8_t *)__b, 0xCu);
    return;
  }
  v3 = (*(uint64_t (**)(void))(v2 + 16))();
  if (!v3)
  {
    if (!IMOSLoggingEnabled())
      return;
    v13 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      return;
    v16 = *(_QWORD *)(a1 + 32);
    __b[0] = 138412290;
    *(_QWORD *)&__b[1] = v16;
    v15 = "No DB path passed into CSDBThreadedRecordStore %@";
    goto LABEL_23;
  }
  v4 = (const __CFString *)v3;
  if (_IMWillLog())
    _IMAlwaysLog();
  if (_IMWillLog())
  {
    objc_msgSend_currentThread(MEMORY[0x24BDD17F0], v5, v6);
    _IMAlwaysLog();
  }
  if (_IMWillLog())
    _IMAlwaysLog();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = CSDBRecordStoreCreateWithPath(v4);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v7)
  {
    CSDBRecordStoreSetSetupHandler(v7, *(_QWORD *)(a1 + 56));
    Database = CSDBRecordStoreGetDatabase(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    if (Database)
    {
      v9 = (_QWORD *)Database;
      CSDBSqliteDatabaseSetVersion(Database, *(_DWORD *)(a1 + 88));
      CSDBSqliteDatabaseSetDataProtectionClass((uint64_t)v9, *(_DWORD *)(a1 + 92));
      CSDBSqliteDatabaseSetLookAsideConfig((uint64_t)v9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48));
      CSDBSqliteDatabaseSetConnectionInitializer((uint64_t)v9, *(_QWORD *)(a1 + 64));
      CSDBSqliteDatabaseSetMigrationHandlers(v9, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
      CSDBSqliteDatabaseSetShouldMigrateInExternalProcess((uint64_t)v9, *(_BYTE *)(a1 + 96) == 0);
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 52) = 1;
      v10 = *(_QWORD *)(a1 + 48);
      if (v10)
        (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, *(_QWORD *)(a1 + 32));
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 52) = 0;
      memset(__b, 170, 0x400uLL);
      if (CFStringGetCString(v4, (char *)__b, 1024, 0x8000100u))
      {
        v11 = CSDBGetMobileUserUID();
        v12 = CSDBGetMobileUserGID();
        chown((const char *)__b, v11, v12);
      }
      else if (IMOSLoggingEnabled())
      {
        v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20AA57000, v19, OS_LOG_TYPE_INFO, "Unable to change permissions on messages database.", buf, 2u);
        }
      }
      CSDBSqliteDatabaseSetVersion((uint64_t)v9, *(_DWORD *)(a1 + 88));
      CSDBSqliteDatabaseConnectionForWritingWithOwnership((uint64_t)v9, *(_BYTE *)(a1 + 97));
    }
    else if (IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(__b[0]) = 0;
        _os_log_impl(&dword_20AA57000, v18, OS_LOG_TYPE_INFO, "Unable to get a db reference.", (uint8_t *)__b, 2u);
      }
    }
    CFRelease(v4);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        __b[0] = 138412290;
        *(_QWORD *)&__b[1] = v4;
        _os_log_impl(&dword_20AA57000, v17, OS_LOG_TYPE_INFO, "Unable to create a CSDBRecordStore for path %@", (uint8_t *)__b, 0xCu);
      }
    }
    CFRelease(v4);
  }
}

uint64_t CSDBPerformBlock(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_performBlock_waitUntilDone_(a1, a2, (uint64_t)a2, a3);
}

void sub_20AA59170(int a1, CFDictionaryRef theDict, void *a3)
{
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_20AA5D6FC, a3);
}

void sub_20AA59180(int a1, CFDictionaryRef theDict)
{
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_20AA5D704, 0);
}

void sub_20AA59194(uint64_t a1)
{
  uint64_t v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
    CSDBRecordStoreInvalidateCachesWithStore(v2);
}

uint64_t CSDBRecordGetID(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t CSDBThreadedRecordStoreEnsureDatabaseSetupWithProtection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x24BEDD108](a1, sel_setupDatabaseWithAllowLocalMigration_pathBlock_setupStoreHandler_connectionInitializer_versionChecker_migrationHandler_schemaVersion_dataProtectionClass_registerBlock_, a2);
}

uint64_t CSDBPerformLockedSectionForRecordStoreWithoutInitialize(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = *(_QWORD *)(result + 8);
    if (v2)
      return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v2);
  }
  return result;
}

uint64_t CSDBRecordStoreProcessStatement(uint64_t a1, void *a2, _QWORD *a3, uint64_t a4, unint64_t a5)
{
  return CSDBRecordStoreProcessRecordStatementWithPropertyIndices(a1, a2, a3, a4, 0, a5, 0);
}

void sub_20AA5923C(uint64_t a1, void **key, int a3)
{
  void **v3;
  int v5;
  int v6;
  const void *v7;
  const void *v8;
  uint64_t v9;
  void **v10;
  const __CFArray *v11;
  const __CFArray *v12;
  int Count;
  CFIndex v14;
  uint64_t v15;
  const void *ValueAtIndex;
  uint64_t Property;
  const __CFDictionary *v18;
  const __CFDictionary *Value;
  __CFDictionary *v20;
  const __CFDictionary *v21;
  __CFDictionary *Mutable;
  const __CFDictionary *v23;
  __CFDictionary *v24;
  CFRange v25;

  if (!a1 || (v3 = key) == 0)
    sub_20AA66ED8();
  key[2] = (void *)a1;
  v5 = *(unsigned __int8 *)(a1 + 57);
  if ((v5 & 1) != 0)
    v6 = 3;
  else
    v6 = 2;
  v7 = (const void *)(v6 | (2 * v5) & 4u);
  v8 = (const void *)*((int *)key + 8);
  if (a3)
  {
    if ((_DWORD)v8 == -1 || (v9 = sub_20AA601F4(a1, key[3], *((_DWORD *)key + 8))) == 0)
    {
      v10 = v3;
    }
    else
    {
      v10 = (void **)v9;
      v11 = CSDBRecordCopyChangedProperties((uint64_t)v3);
      v12 = CSDBRecordCopyChangedProperties((uint64_t)v10);
      if (v11)
      {
        Count = CFArrayGetCount(v11);
        if (Count >= 1)
        {
          v14 = 0;
          v15 = Count;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v11, v14);
            if (!v12
              || (v25.length = (int)CFArrayGetCount(v12),
                  v25.location = 0,
                  !CFArrayContainsValue(v12, v25, (const void *)(int)ValueAtIndex)))
            {
              Property = CSDBRecordGetProperty((uint64_t)v3, (uint64_t)ValueAtIndex);
              CSDBRecordSetProperty((uint64_t)v10, (uint64_t)ValueAtIndex, Property);
            }
            ++v14;
          }
          while (v15 != v14);
        }
        CFRelease(v11);
      }
      if (v12)
        CFRelease(v12);
    }
    v23 = (const __CFDictionary *)v10[5];
    if (v23 && CFDictionaryGetCount(v23) >= 1)
      sub_20AA5E09C(v10, (int)v7);
    v3 = v10;
  }
  else
  {
    v18 = *(const __CFDictionary **)(a1 + 40);
    if (v18)
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(v18, key[3]);
      if (Value)
      {
        v20 = Value;
        if (CFDictionaryContainsKey(Value, (const void *)*((int *)v3 + 8)))
        {
          CFDictionaryRemoveValue(v20, (const void *)*((int *)v3 + 8));
          goto LABEL_33;
        }
      }
    }
    v21 = *(const __CFDictionary **)(a1 + 24);
    if (v21)
    {
      if (CFDictionaryContainsKey(v21, v3))
        goto LABEL_33;
      Mutable = *(__CFDictionary **)(a1 + 24);
    }
    else
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], 0);
      *(_QWORD *)(a1 + 24) = Mutable;
    }
    CFDictionarySetValue(Mutable, v3, v7);
  }
LABEL_33:
  if ((_DWORD)v8 != -1)
  {
    v24 = (__CFDictionary *)sub_20AA5A9F0(a1, v3[3]);
    if (v24)
      CFDictionaryAddValue(v24, v8, v3);
  }
}

void sub_20AA59460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  const __CFString *v8;
  _DWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  sqlite3_int64 v12;
  void (*v13)(uint64_t, uint64_t, _QWORD);
  __CFDictionary *v14;

  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)a3;
  if (*(_QWORD *)a3)
  {
    if ((*(_BYTE *)(v6 + 57) & 1) == 0
      || (*(_BYTE *)(*(_QWORD *)(v5 + 24) + 56) & 2) == 0
      || !*(_BYTE *)(a2 + 24)
      || (sub_20AA5FB24(*(_QWORD *)(a3 + 8), *(_QWORD *)(a2 + 16), 2, 0), (v6 = *(_QWORD *)a3) != 0))
    {
      if ((*(_BYTE *)(v6 + 57) & 2) != 0 && (*(_BYTE *)(*(_QWORD *)(v5 + 24) + 56) & 8) != 0 && *(_BYTE *)(a2 + 25))
        sub_20AA5FEB4(*(_QWORD *)(a3 + 8), v5, 2);
    }
  }
  v8 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("DELETE FROM %s WHERE ROWID = ?;"),
         **(_QWORD **)(a3 + 16));
  v9 = CSDBSqliteConnectionStatementForSQL(*(_QWORD *)(a3 + 8), v8);
  if (v9)
  {
    v10 = v9;
    if (*((_QWORD *)v9 + 1))
    {
      v11 = *(_QWORD *)a3;
      if (*(_QWORD *)a3)
      {
        if ((int)a1 >= -1)
        {
          v12 = (int)a1;
LABEL_17:
          CSDBSqliteBindInt64((uint64_t)v9, v12);
          CSDBSqliteStatementPerform(v10);
          CSDBSqliteStatementReset(v10);
          goto LABEL_18;
        }
        if ((a1 & 0x7FFFFFFF) < *(_DWORD *)(v11 + 104))
        {
          v12 = *(_QWORD *)(*(_QWORD *)(v11 + 112) + 8 * (a1 & 0x7FFFFFFF));
          goto LABEL_17;
        }
      }
      v12 = -1;
      goto LABEL_17;
    }
  }
LABEL_18:
  CFRelease(v8);
  v13 = *(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a3 + 16) + 32);
  if (v13)
    v13(a1, v5, *(_QWORD *)(a3 + 8));
  if (v5)
    *(_BYTE *)(v5 + 58) = 0;
  v14 = (__CFDictionary *)sub_20AA5A9F0(*(_QWORD *)a3, *(void **)(a3 + 16));
  if (v14)
    CFDictionaryRemoveValue(v14, (const void *)(int)a1);
}

uint64_t CSDBPerformLockedSectionForQueryForWriting(uint64_t result, const __CFString *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        v5 = result;
        result = *(_QWORD *)(result + 8);
        if (result)
        {
          result = CSDBRecordStoreGetDatabase(result);
          if (result)
          {
            v6 = result;
            result = (uint64_t)CSDBSqliteDatabaseStatementForWriting(result, a2);
            if (result)
            {
              v7 = result;
              if (*(_QWORD *)(result + 8))
              {
                (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(a3 + 16))(a3, *(_QWORD *)(v5 + 8), v6, result);
                return CSDBSqliteStatementReset(v7);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_20AA5968C(uint64_t a1, uint64_t a2, void *key, int a4)
{
  int v4;
  __CFDictionary *v7;
  __CFDictionary *v8;
  unsigned int v9;
  uint64_t Instance;
  _BYTE *v11;
  char v12;
  int v13;
  __CFDictionary *v14;

  if (!a1)
    sub_20AA66F28();
  v4 = a4;
  if (a2 && a4 == -1)
    v4 = *(_DWORD *)(a2 + 32);
  if (v4 == -1)
  {
    if (a2)
    {
      v14 = *(__CFDictionary **)(a1 + 24);
      if (v14)
        goto LABEL_20;
    }
    return;
  }
  if (a2 && !key)
    key = *(void **)(a2 + 24);
  if (!key)
    sub_20AA66F50();
  v7 = (__CFDictionary *)sub_20AA597D4(a1, key);
  if (!v7)
    goto LABEL_15;
  v8 = v7;
  v9 = *(unsigned __int8 *)(a1 + 57);
  pthread_once(&stru_253D84668, (void (*)(void))sub_20AA60270);
  Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    v11 = (_BYTE *)Instance;
    v12 = v9 & 1;
    v13 = (v9 >> 1) & 1;
    *(_QWORD *)(Instance + 16) = 0;
    *(_QWORD *)(Instance + 24) = 0;
    if (a2)
      *(_QWORD *)(Instance + 16) = CFRetain((CFTypeRef)a2);
    v11[24] = v12;
    v11[25] = v13;
    CFDictionarySetValue(v8, (const void *)v4, v11);
    CFRelease(v11);
LABEL_15:
    if (a2)
      goto LABEL_16;
    return;
  }
  CFDictionarySetValue(v8, (const void *)v4, 0);
  if (a2)
  {
LABEL_16:
    v14 = *(__CFDictionary **)(a1 + 32);
    if (!v14)
      return;
LABEL_20:
    CFDictionaryRemoveValue(v14, (const void *)a2);
  }
}

const void *sub_20AA597D4(uint64_t a1, void *key)
{
  const __CFDictionary *Mutable;
  const void *Value;

  if (!a1)
    sub_20AA66F78();
  Mutable = *(const __CFDictionary **)(a1 + 40);
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, MEMORY[0x24BDBD6B0]);
    *(_QWORD *)(a1 + 40) = Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, key);
  if (!Value)
  {
    Value = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, MEMORY[0x24BDBD6B0]);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), key, Value);
    CFRelease(Value);
  }
  return Value;
}

uint64_t sub_20AA59880(uint64_t a1, int a2)
{
  int v4;
  size_t v5;
  uint64_t Instance;
  uint64_t v7;
  void (*v8)(uint64_t);

  v4 = 8 * *(_DWORD *)(a1 + 72) + 72;
  pthread_once(&stru_253D84698, (void (*)(void))sub_20AA5DEE8);
  v5 = v4 - 16;
  Instance = _CFRuntimeCreateInstance();
  v7 = Instance;
  if (Instance)
  {
    bzero((void *)(Instance + 16), v5);
    *(_QWORD *)(v7 + 24) = a1;
    *(_DWORD *)(v7 + 32) = a2;
    *(_DWORD *)(v7 + 36) = -1;
    v8 = *(void (**)(uint64_t))(a1 + 8);
    if (v8)
      v8(v7);
  }
  return v7;
}

void sub_20AA59AA4(unsigned int *value, char a2, uint64_t *a3)
{
  const __CFSet *v6;
  uint64_t v7;
  void (*v8)(unsigned int *, uint64_t);
  unsigned int v9;
  const char **v10;
  const __CFString *v11;
  __CFDictionary *v12;
  sqlite3_int64 v13;
  uint64_t v14;
  signed int RecordIDForRowid;
  uint64_t v16;
  sqlite3_int64 Insert;
  const __CFDictionary *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(unsigned int *, uint64_t, uint64_t);
  char v27;
  void (*v28)(unsigned int *, uint64_t);
  const void *v29;
  const __CFDictionary *v30;
  unsigned int *context;
  uint64_t v32;
  unsigned int v33;

  v6 = *(const __CFSet **)(*((_QWORD *)value + 2) + 48);
  if (v6 && CFSetContainsValue(v6, value))
    return;
  v7 = *((_QWORD *)value + 3);
  v8 = *(void (**)(unsigned int *, uint64_t))(v7 + 48);
  if (v8)
    v8(value, a3[1]);
  v33 = -1431655766;
  v9 = value[8];
  v10 = (const char **)sub_20AA5A12C((uint64_t)value, (int *)&v33, 1);
  v11 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], *(const char **)v7, 0x8000100u);
  v12 = (__CFDictionary *)sub_20AA5A9F0(*a3, (void *)v7);
  v13 = value[8];
  if ((_DWORD)v13 == -1)
    goto LABEL_10;
  v14 = *a3;
  if (!*a3)
    goto LABEL_10;
  if ((int)v13 >= -1)
    goto LABEL_11;
  if ((v13 & 0x7FFFFFFF) >= *(_DWORD *)(v14 + 104))
LABEL_10:
    v13 = -1;
  else
    v13 = *(_QWORD *)(*(_QWORD *)(v14 + 112) + 8 * (v13 & 0x7FFFFFFF));
LABEL_11:
  CSDBSqliteConnectionAddRecordWithRowid(a3[1], v11, v13, v10, v33);
  RecordIDForRowid = value[8];
  if (RecordIDForRowid == -1)
  {
    v16 = *a3;
    Insert = CSDBSqliteConnectionRowidOfLastInsert(a3[1]);
    RecordIDForRowid = CSDBRecordStoreGetRecordIDForRowid(v16, Insert);
    value[8] = RecordIDForRowid;
  }
  if (v12)
    CFDictionarySetValue(v12, (const void *)RecordIDForRowid, value);
  CFRelease(v11);
  free(v10);
  v18 = (const __CFDictionary *)*((_QWORD *)value + 5);
  if (v18)
  {
    *((_QWORD *)value + 5) = 0;
    v19 = a3[1];
    context = value;
    v32 = v19;
    if (v9 != -1)
    {
      CFDictionaryApplyFunction(v18, (CFDictionaryApplierFunction)sub_20AA5FFB8, &context);
      goto LABEL_25;
    }
  }
  else
  {
    v20 = a3[1];
    context = value;
    v32 = v20;
    if (v9 != -1)
      goto LABEL_25;
  }
  v21 = *(unsigned int *)(*((_QWORD *)value + 3) + 72);
  if ((int)v21 >= 1)
  {
    v22 = 0;
    v23 = 0;
    v24 = 40 * v21;
    do
    {
      v25 = *(_QWORD *)(*((_QWORD *)value + 3) + 80) + v22;
      if ((*(_BYTE *)(v25 + 25) & 2) == 0)
      {
        v26 = *(void (**)(unsigned int *, uint64_t, uint64_t))(*(_QWORD *)(v25 + 16) + 32);
        if (v26)
          v26(value, v23, v32);
      }
      v23 = (v23 + 1);
      v22 += 40;
    }
    while (v24 != v22);
  }
LABEL_25:
  if (*a3)
  {
    v27 = *(_BYTE *)(*a3 + 57);
    if ((v27 & 1) == 0 || (a2 & 1) == 0 || (*(_BYTE *)(*((_QWORD *)value + 3) + 56) & 2) == 0)
    {
LABEL_31:
      if ((v27 & 2) != 0 && (a2 & 4) != 0 && (*(_BYTE *)(*((_QWORD *)value + 3) + 56) & 8) != 0)
        sub_20AA5FEB4(a3[1], (uint64_t)value, 0);
      goto LABEL_35;
    }
    sub_20AA5FB24(a3[1], (uint64_t)value, 0, 0);
    if (*a3)
    {
      v27 = *(_BYTE *)(*a3 + 57);
      goto LABEL_31;
    }
  }
LABEL_35:
  v28 = *(void (**)(unsigned int *, uint64_t))(v7 + 104);
  if (v28)
    v28(value, a3[1]);
  if (v18)
    CFRelease(v18);
  v29 = (const void *)*((_QWORD *)value + 5);
  if (v29)
  {
    CFRelease(v29);
    *((_QWORD *)value + 5) = 0;
  }
  v30 = (const __CFDictionary *)*((_QWORD *)value + 6);
  if (v30)
  {
    CFDictionaryApplyFunction(v30, (CFDictionaryApplierFunction)sub_20AA5DFB0, value);
    CFRelease(*((CFTypeRef *)value + 6));
    *((_QWORD *)value + 6) = 0;
  }
  *((_BYTE *)value + 58) = 1;
}

uint64_t CSDBRecordSaveStore(uint64_t a1)
{
  uint64_t v1;
  const __CFString *Domain;
  UInt8 *v3;
  const char *v4;
  int Code;
  CFErrorRef err;

  if (!a1)
    return 0;
  err = 0;
  v1 = CSDBRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(a1, 0, 0, 0, 1u, &err);
  if ((v1 & 1) == 0 && err)
  {
    Domain = CFErrorGetDomain(err);
    if (Domain)
      v3 = CSDBCreateUTF8StringFromCFString(Domain);
    else
      v3 = 0;
    if (v3)
      v4 = (const char *)v3;
    else
      v4 = "(no domain)";
    Code = CFErrorGetCode(err);
    syslog(3, "Error saving record store: %s/%i", v4, Code);
    if (v3)
      free(v3);
    CFRelease(err);
  }
  return v1;
}

uint64_t sub_20AA59F28(uint64_t a1, uint64_t a2)
{
  int v4;
  int RecordIDForRowid;
  sqlite3_int64 v6;
  const __CFDictionary *v7;
  const __CFDictionary *Value;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, _QWORD);
  char v11;
  uint64_t v12;
  _BYTE *v13;
  int SequenceNumber;
  uint64_t (*v15)(uint64_t, uint64_t, _QWORD);
  __CFArray *v16;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  v4 = sqlite3_column_type(*(sqlite3_stmt **)(a1 + 8), 0);
  if (v4 == 5)
  {
    RecordIDForRowid = -1;
    goto LABEL_8;
  }
  v6 = sqlite3_column_int64(*(sqlite3_stmt **)(a1 + 8), 0);
  RecordIDForRowid = CSDBRecordStoreGetRecordIDForRowid(*(_QWORD *)a2, v6);
  v7 = *(const __CFDictionary **)(*(_QWORD *)a2 + 40);
  if (v7)
  {
    Value = (const __CFDictionary *)CFDictionaryGetValue(v7, *(const void **)(a2 + 8));
    if (Value)
    {
      if (CFDictionaryContainsKey(Value, (const void *)RecordIDForRowid))
        return 0;
    }
  }
LABEL_8:
  v10 = *(uint64_t (**)(uint64_t, _QWORD))(a2 + 48);
  if (v10)
  {
    v11 = v10(a1, *(_QWORD *)(a2 + 64));
    v9 = v11 & 1;
    if ((v11 & 2) == 0)
      return v9;
  }
  else
  {
    v9 = 0;
  }
  if (v4 != 5)
  {
    v13 = CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 16), (const void *)RecordIDForRowid);
    if (v13)
    {
      v12 = (uint64_t)v13;
      if (v13[56])
      {
        CSDBSqliteStatementApplyValuesFromRecordWithNullValue(a1, *(_QWORD *)(a2 + 24), *(_DWORD *)(a2 + 40), (uint64_t)v13, *MEMORY[0x24BDBD430]);
        *(_BYTE *)(v12 + 56) = 0;
        *(_DWORD *)(v12 + 36) = CSDBRecordStoreGetSequenceNumber(*(_QWORD *)(v12 + 16));
      }
    }
    else
    {
      v12 = sub_20AA59880(*(_QWORD *)(a2 + 8), RecordIDForRowid);
      CSDBSqliteStatementApplyValuesFromRecordWithNullValue(a1, *(_QWORD *)(a2 + 24), *(_DWORD *)(a2 + 40), v12, *MEMORY[0x24BDBD430]);
      if (!v12)
      {
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a2 + 16), (const void *)RecordIDForRowid, 0);
        goto LABEL_24;
      }
      *(_QWORD *)(v12 + 16) = *(_QWORD *)a2;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a2 + 16), (const void *)RecordIDForRowid, (const void *)v12);
      CFRelease((CFTypeRef)v12);
    }
    if (*(_BYTE *)(v12 + 56))
    {
      SequenceNumber = CSDBRecordStoreGetSequenceNumber(*(_QWORD *)(v12 + 16));
    }
    else
    {
      SequenceNumber = *(_DWORD *)(a2 + 44);
      if (SequenceNumber < 0)
      {
        SequenceNumber = CSDBRecordStoreGetSequenceNumber(*(_QWORD *)a2);
        *(_DWORD *)(a2 + 44) = SequenceNumber;
      }
    }
    *(_DWORD *)(v12 + 36) = SequenceNumber;
    *(_BYTE *)(v12 + 58) = 1;
    goto LABEL_24;
  }
  v12 = *MEMORY[0x24BDBD430];
LABEL_24:
  v15 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a2 + 56);
  if (v15)
  {
    if ((v15(a1, v12, *(_QWORD *)(a2 + 64)) & 1) != 0)
      v9 = 1;
    else
      v9 = v9;
  }
  v16 = *(__CFArray **)(a2 + 32);
  if (v16)
    CFArrayAppendValue(v16, (const void *)v12);
  return v9;
}

_QWORD *sub_20AA5A12C(uint64_t a1, int *a2, int a3)
{
  uint64_t v4;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  __int16 v17;
  _BYTE *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  const __CFString *Property;

  v4 = *(_QWORD *)(a1 + 24);
  if (*(int *)(v4 + 72) < 1)
  {
    v8 = 0;
    goto LABEL_37;
  }
  v7 = 0;
  v8 = 0;
  v9 = 24;
  do
  {
    v10 = *(_DWORD *)(*(_QWORD *)(v4 + 80) + v9);
    if ((v10 & 4) != 0)
      goto LABEL_11;
    if ((v10 & 1) != 0)
    {
      if (a3 && (v10 & 0x240) != 0)
LABEL_10:
        ++v8;
    }
    else if (a3 || sub_20AA5FFE8(a1, v7))
    {
      goto LABEL_10;
    }
LABEL_11:
    ++v7;
    v4 = *(_QWORD *)(a1 + 24);
    v9 += 40;
  }
  while (v7 < *(int *)(v4 + 72));
  if (v8 < 1)
  {
LABEL_37:
    v11 = 0;
    goto LABEL_38;
  }
  v11 = malloc_type_calloc(1uLL, 24 * v8, 0x10720403E5D127AuLL);
  v12 = *(_QWORD *)(a1 + 24);
  if (*(int *)(v12 + 72) >= 1)
  {
    v13 = 0;
    v14 = 0;
    do
    {
      v15 = *(_QWORD *)(v12 + 80);
      v16 = v15 + 40 * v13;
      v19 = *(_DWORD *)(v16 + 24);
      v18 = (_BYTE *)(v16 + 24);
      v17 = v19;
      if ((v19 & 4) == 0)
      {
        if ((v17 & 1) != 0)
        {
          if (a3 && (v17 & 0x240) != 0)
          {
LABEL_22:
            v20 = 0;
            v11[3 * v14] = *(_QWORD *)(v15 + 40 * v13);
            v21 = v15 + 40 * v13;
            v24 = *(_QWORD *)(v21 + 8);
            v23 = (_QWORD *)(v21 + 8);
            v22 = v24;
            v25 = qword_20AA67A80;
            do
            {
              v26 = *v25;
              v25 += 2;
              if (v26 == v22)
                break;
              ++v20;
            }
            while (v20 != 4);
            v11[3 * v14 + 1] = qword_20AA67A80[2 * v20 + 1];
            Property = (const __CFString *)CSDBRecordGetProperty(a1, v13);
            if (!Property)
            {
              if ((*v18 & 0x40) != 0)
              {
                if (*v23 == 2)
                {
                  pthread_once(&stru_253D84698, (void (*)(void))sub_20AA5DEE8);
                  Property = (const __CFString *)qword_253D84720;
                }
                else if (*v23 == 1)
                {
                  Property = &stru_24C35A5D0;
                }
                else
                {
                  Property = 0;
                }
              }
              else
              {
                Property = 0;
              }
            }
            v11[3 * v14++ + 2] = Property;
          }
        }
        else if (a3 || sub_20AA5FFE8(a1, v13))
        {
          goto LABEL_22;
        }
      }
      ++v13;
      v12 = *(_QWORD *)(a1 + 24);
    }
    while (v13 < *(int *)(v12 + 72));
  }
LABEL_38:
  *a2 = v8;
  return v11;
}

CFStringRef CSDBSqliteStatementCopyStringResult(uint64_t a1)
{
  sqlite3_stmt *v2;
  const unsigned __int8 *v3;

  if (a1
    && (v2 = *(sqlite3_stmt **)(a1 + 8)) != 0
    && CSDBSqliteStepWithConnection(*(_QWORD *)a1, v2) == 100
    && (v3 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 8), 0)) != 0)
  {
    return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], (const char *)v3, 0x8000100u);
  }
  else
  {
    return 0;
  }
}

uint64_t CSDBThreadedRecordStoreEnsureDatabaseSetup(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, uint64_t a9, char a10)
{
  return objc_msgSend_setupDatabaseWithAllowLocalMigration_pathBlock_setupStoreHandler_connectionInitializer_versionChecker_migrationHandler_schemaVersion_dataProtectionClass_registerBlock_exclusiveOwnership_(a1, a2, (uint64_t)a2, a3, a4, a5, a6, a7, a8 | 0x200000000, a9, a10);
}

void sub_20AA5A4B0(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, sqlite3_int64 a5, int a6)
{
  sqlite3_stmt *v6;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t);
  int v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  sqlite3_int64 v18;
  const unsigned __int8 *v19;
  BOOL v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  sqlite3_int64 v24;
  const unsigned __int8 *v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  const UInt8 *v30;
  BOOL v31;
  char v32;
  unsigned int v33;
  const void *v34;
  BOOL v35;
  sqlite3_int64 v36;
  char v37;
  float v38;
  int v39;
  const __CFAllocator *v40;
  CFNumberType v41;
  int v42;
  double v43;
  CFNumberRef v44;
  const __CFAllocator *alloc;
  double valuePtr;

  if (a1)
  {
    v6 = *(sqlite3_stmt **)(a1 + 8);
    if (v6 && a3 != 0)
    {
      alloc = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v10 = a3;
      v11 = a2 + 16;
      v12 = 1;
      do
      {
        v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))v11;
        if (*(_QWORD *)v11)
        {
          v14 = *(_DWORD *)(v11 - 16);
          v15 = *(_QWORD *)(v11 + 8);
          switch(*(_QWORD *)(v11 - 8))
          {
            case 0:
              v16 = sqlite3_column_int(v6, *(_DWORD *)(v11 - 16));
              v17 = v13(a4, v15, v16);
              goto LABEL_43;
            case 1:
              v18 = sqlite3_column_int64(v6, *(_DWORD *)(v11 - 16));
              goto LABEL_25;
            case 2:
              v19 = sqlite3_column_text(v6, *(_DWORD *)(v11 - 16));
              if (v19)
                v20 = 0;
              else
                v20 = a6 == 0;
              if (v20)
                goto LABEL_58;
              if (v19)
              {
                v21 = CFStringCreateWithCString(alloc, (const char *)v19, 0x8000100u);
                v22 = a4;
                v23 = v15;
                v24 = (sqlite3_int64)v21;
                goto LABEL_66;
              }
              v27 = a4;
              v28 = v15;
              v18 = a5;
LABEL_26:
              v17 = v13(v27, v28, v18);
LABEL_43:
              v32 = v17;
              break;
            case 3:
              v25 = sqlite3_column_text(v6, *(_DWORD *)(v11 - 16));
              if (v25)
                v26 = 0;
              else
                v26 = a6 == 0;
              if (v26)
                goto LABEL_58;
              if (v25)
                v18 = (sqlite3_int64)v25;
              else
                v18 = a5;
LABEL_25:
              v27 = a4;
              v28 = v15;
              goto LABEL_26;
            case 4:
              v29 = sqlite3_column_bytes(v6, *(_DWORD *)(v11 - 16));
              v30 = (const UInt8 *)sqlite3_column_blob(v6, v14);
              if (v30)
                v31 = 0;
              else
                v31 = a6 == 0;
              if (v31)
                goto LABEL_50;
              if (!v30)
              {
                v37 = v13(a4, v15, a5);
                goto LABEL_69;
              }
              v21 = CFDataCreate(alloc, v30, v29);
              v32 = v13(a4, v15, (uint64_t)v21);
              if (!v21)
                break;
              goto LABEL_67;
            case 5:
              v33 = sqlite3_column_bytes(v6, *(_DWORD *)(v11 - 16));
              v34 = sqlite3_column_blob(v6, v14);
              if (v34)
                v35 = 0;
              else
                v35 = a6 == 0;
              if (v35)
              {
LABEL_50:
                v32 = 1;
              }
              else
              {
                if (v34)
                  v36 = (sqlite3_int64)v34;
                else
                  v36 = a5;
                v37 = ((uint64_t (*)(uint64_t, uint64_t, sqlite3_int64, _QWORD))v13)(a4, v15, v36, v33);
LABEL_69:
                v32 = v37;
              }
              break;
            case 6:
              v38 = sqlite3_column_double(v6, *(_DWORD *)(v11 - 16));
              v17 = ((uint64_t (*)(uint64_t, uint64_t, float))v13)(a4, v15, v38);
              goto LABEL_43;
            case 7:
              v39 = sqlite3_column_type(v6, *(_DWORD *)(v11 - 16));
              if (v39 == 5)
                goto LABEL_51;
              if (v39 == 2)
              {
                valuePtr = NAN;
                valuePtr = sqlite3_column_double(v6, v14);
                v40 = alloc;
                v41 = kCFNumberDoubleType;
              }
              else
              {
                valuePtr = -3.72066208e-103;
                valuePtr = COERCE_DOUBLE(sqlite3_column_int64(v6, v14));
                v40 = alloc;
                v41 = kCFNumberSInt64Type;
              }
              v44 = CFNumberCreate(v40, v41, &valuePtr);
              goto LABEL_56;
            case 8:
              v42 = sqlite3_column_type(v6, *(_DWORD *)(v11 - 16));
              if (v42 == 5)
              {
LABEL_51:
                v21 = 0;
              }
              else
              {
                if (v42 == 2)
                  v43 = sqlite3_column_double(v6, v14);
                else
                  v43 = (double)sqlite3_column_int64(v6, v14);
                v44 = CFDateCreate(0, v43);
LABEL_56:
                v21 = v44;
                if (v44)
                  goto LABEL_62;
              }
              if (!a6)
                goto LABEL_58;
LABEL_62:
              if (v21)
                v24 = (sqlite3_int64)v21;
              else
                v24 = a5;
              v22 = a4;
              v23 = v15;
LABEL_66:
              v32 = v13(v22, v23, v24);
              if (v21)
LABEL_67:
                CFRelease(v21);
              break;
            default:
              goto LABEL_58;
          }
        }
        else
        {
LABEL_58:
          v32 = 1;
        }
        if (v12 >= v10)
          break;
        v11 += 32;
        ++v12;
      }
      while ((v32 & 1) != 0);
    }
  }
}

uint64_t CSDBRecordStoreProcessRecordStatementWithPropertyIndices(uint64_t a1, void *a2, _QWORD *a3, uint64_t a4, uint64_t a5, unint64_t a6, CFDictionaryRef theDict)
{
  __int128 v13;
  char *Columns;
  char *v15;
  uint64_t v16;
  __int128 v18;
  const void *v19;
  char *v20;
  __int128 v21;
  __int128 v22;
  unint64_t v23;

  v23 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v21 = v13;
  v22 = v13;
  v18 = v13;
  v19 = (const void *)0xAAAAAAAAAAAAAAAALL;
  Columns = CSDBRecordStoreCreateReadColumns((uint64_t)a2, (_DWORD *)&v21 + 2, theDict, 0, 0);
  v20 = Columns;
  if (!Columns)
    return 0;
  v15 = Columns;
  *(_QWORD *)&v21 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  if ((_QWORD)v21)
  {
    *(_QWORD *)&v18 = a1;
    *((_QWORD *)&v18 + 1) = a2;
    v19 = sub_20AA5A9F0(a1, a2);
    *(_QWORD *)&v22 = a4;
    *((_QWORD *)&v22 + 1) = a5;
    v23 = a6;
    HIDWORD(v21) = -1;
    CSDBSqliteStatementSendResults(a3, (unsigned int (*)(_QWORD *, uint64_t))sub_20AA59F28, (uint64_t)&v18);
    v15 = v20;
    v16 = v21;
  }
  else
  {
    v16 = 0;
  }
  free(v15);
  return v16;
}

uint64_t CSDBSqliteStatementSendResults(_QWORD *a1, unsigned int (*a2)(_QWORD *, uint64_t), uint64_t a3)
{
  sqlite3_stmt *v6;
  uint64_t v7;
  uint64_t v8;

  if (!a1 || !a1[1] || !*a1 || !*(_QWORD *)(*a1 + 8))
    return 1;
  while (1)
  {
    v6 = (sqlite3_stmt *)a1[1];
    if (!v6)
    {
      v8 = 1;
LABEL_11:
      sub_20AA63C58(*(sqlite3 **)(*a1 + 8), (uint64_t)"CSDBSqliteStatementSendResults");
      goto LABEL_13;
    }
    v7 = CSDBSqliteStepWithConnection(*a1, v6);
    if ((_DWORD)v7 != 100)
      break;
    if (a2(a1, a3))
    {
      v8 = 100;
      goto LABEL_13;
    }
  }
  v8 = v7;
  if ((v7 - 102) <= 0xFFFFFFFD)
    goto LABEL_11;
  v8 = 101;
LABEL_13:
  CSDBSqliteStatementReset(a1);
  return v8;
}

const void *sub_20AA5A9F0(uint64_t a1, void *key)
{
  const __CFDictionary *Mutable;
  const void *Value;

  if (!a1)
    sub_20AA66EB0();
  Mutable = *(const __CFDictionary **)(a1 + 16);
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, MEMORY[0x24BDBD6B0]);
    *(_QWORD *)(a1 + 16) = Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, key);
  if (!Value)
  {
    Value = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, MEMORY[0x24BDBD6B0]);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), key, Value);
    CFRelease(Value);
  }
  return Value;
}

void CSDBRecordSetProperty(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  const __CFSet *v10;
  const __CFDictionary *v11;
  __CFSet *Mutable;
  uint64_t Property;
  const void *v14;
  uint64_t (*v15)(uint64_t);
  __CFDictionary *v16;
  uint64_t v17;
  const __CFDictionary *v18;
  const __CFDictionary *v19;
  const __CFDictionary *Value;
  int v21;

  v6 = sub_20AA5ADE4(a1);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)(v6 + 24);
    if ((*(_BYTE *)(v8 + 56) & 4) != 0 && *(int *)(v8 + 136) >= 3)
    {
      v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 144);
      if (v9)
        v9(v6, a2, a3);
    }
    if (*(_BYTE *)(v7 + 58))
    {
      v10 = *(const __CFSet **)(v7 + 64);
      if (!v10 || !CFSetContainsValue(v10, (const void *)(int)a2))
      {
        v11 = *(const __CFDictionary **)(v7 + 48);
        if (!v11 || !CFDictionaryGetValue(v11, (const void *)(int)a2))
        {
          Mutable = *(__CFSet **)(v7 + 64);
          if (!Mutable)
          {
            Mutable = CFSetCreateMutable(0, *(int *)(*(_QWORD *)(v7 + 24) + 72), 0);
            *(_QWORD *)(v7 + 64) = Mutable;
          }
          CFSetAddValue(Mutable, (const void *)(int)a2);
          Property = CSDBRecordGetProperty(a1, a2);
          if (Property)
          {
            v14 = (const void *)Property;
            v15 = **(uint64_t (***)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v7 + 24) + 80) + 40 * (int)a2 + 16);
            if (v15)
              v14 = (const void *)v15(Property);
          }
          else
          {
            v14 = (const void *)*MEMORY[0x24BDBD430];
          }
          v16 = *(__CFDictionary **)(v7 + 48);
          if (!v16)
          {
            v16 = CFDictionaryCreateMutable(0, 0, 0, 0);
            *(_QWORD *)(v7 + 48) = v16;
          }
          CFDictionaryAddValue(v16, (const void *)(int)a2, v14);
          CFSetRemoveValue(*(CFMutableSetRef *)(v7 + 64), (const void *)(int)a2);
        }
      }
    }
    sub_20AA5AEBC(v7, a2, a3, 0);
    CSDBRecordMarkPropertyChanged(v7, a2);
    v17 = *(_QWORD *)(v7 + 16);
    if (v17)
    {
      v18 = *(const __CFDictionary **)(v17 + 24);
      if (v18)
      {
        if (CFDictionaryContainsKey(v18, (const void *)v7))
          return;
        v17 = *(_QWORD *)(v7 + 16);
      }
      v19 = *(const __CFDictionary **)(v17 + 40);
      if (!v19
        || (Value = (const __CFDictionary *)CFDictionaryGetValue(v19, *(const void **)(v7 + 24))) == 0
        || !CFDictionaryContainsKey(Value, (const void *)*(int *)(v7 + 32)))
      {
        v21 = 2;
        if ((*(_BYTE *)(*(_QWORD *)(v7 + 16) + 57) & 1) != 0)
        {
          if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v7 + 24) + 80) + 40 * (int)a2 + 25) & 1) != 0)
            v21 = 2;
          else
            v21 = 3;
        }
        if ((*(_BYTE *)(*(_QWORD *)(v7 + 16) + 57) & 2) != 0)
          v21 = ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 24) + 80) + 40 * (int)a2 + 24) >> 6) & 4 | v21) ^ 4;
        sub_20AA5E09C((_QWORD *)v7, v21);
      }
    }
  }
}

void CSDBRecordMarkPropertyChanged(uint64_t a1, uint64_t a2)
{
  __CFDictionary *Mutable;
  void (*v5)(uint64_t, uint64_t);

  if (!a1)
    sub_20AA66A00();
  Mutable = *(__CFDictionary **)(a1 + 40);
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, 0);
    *(_QWORD *)(a1 + 40) = Mutable;
  }
  CFDictionarySetValue(Mutable, (const void *)(int)a2, (const void *)1);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 24) + 112);
  if (v5)
    v5(a1, a2);
}

uint64_t sub_20AA5AD34(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  void (*v10)(void);
  uint64_t (*v11)(uint64_t);

  v6 = a2 + 9;
  v7 = *(_QWORD *)(a1 + 8 * v6);
  v8 = *MEMORY[0x24BDBD430];
  if (v7)
    v9 = v7 == v8;
  else
    v9 = 1;
  if (!v9)
  {
    v10 = *(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 80) + 40 * a2 + 16) + 8);
    if (v10)
      v10();
  }
  if (a3)
  {
    if (v8 != a3)
    {
      v11 = **(uint64_t (***)(uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 80) + 40 * a2 + 16);
      if (v11)
        a3 = v11(a3);
    }
  }
  *(_QWORD *)(a1 + 8 * v6) = a3;
  return 1;
}

uint64_t sub_20AA5ADE4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __CFDictionary *v4;
  __CFDictionary *v5;
  int v6;
  const void *v7;
  uint64_t v8;

  if (!a1)
    sub_20AA66A28();
  CFRetain((CFTypeRef)a1);
  v2 = *(_QWORD *)(a1 + 16);
  v3 = a1;
  if (v2)
  {
    v3 = a1;
    if (*(_BYTE *)(a1 + 56))
    {
      v4 = (__CFDictionary *)sub_20AA5A9F0(v2, *(void **)(a1 + 24));
      v5 = v4;
      v6 = *(_DWORD *)(a1 + 32);
      if (v6 != -1 && v4)
      {
        CFDictionarySetValue(v4, (const void *)v6, (const void *)a1);
        v6 = *(_DWORD *)(a1 + 32);
      }
      v7 = sub_20AA5F96C(*(_QWORD *)(a1 + 16), *(void **)(a1 + 24), v6);
      if (v7)
      {
        if (v7 != (const void *)a1)
          sub_20AA66A50();
        *(_BYTE *)(a1 + 56) = 0;
        v3 = a1;
      }
      else
      {
        if (v5)
          CFDictionaryRemoveValue(v5, (const void *)*(int *)(a1 + 32));
        v3 = 0;
        *(_BYTE *)(a1 + 57) = 1;
      }
    }
  }
  if (*(_DWORD *)(a1 + 36) == -1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      *(_DWORD *)(a1 + 36) = CSDBRecordStoreGetSequenceNumber(v8);
  }
  CFRelease((CFTypeRef)a1);
  return v3;
}

uint64_t sub_20AA5AEBC(uint64_t result, int a2, uint64_t a3, int a4)
{
  uint64_t v4;

  if (result && (!a3 || *(_QWORD *)(result + 8 * a2 + 72) != a3))
  {
    v4 = *MEMORY[0x24BDBD430];
    if (a4)
      v4 = 0;
    if (!a3)
      a3 = v4;
    return sub_20AA5AD34(result, a2, a3);
  }
  return result;
}

char *CSDBRecordStoreCreateReadColumns(uint64_t a1, _DWORD *a2, CFDictionaryRef theDict, uint64_t (*a4)(uint64_t a1), uint64_t (*(*a5)())(uint64_t a1, int a2, uint64_t a3))
{
  uint64_t (*v7)(uint64_t);
  uint64_t (*(*v8)())(uint64_t, int, uint64_t);
  int Count;
  size_t v11;
  unsigned int v12;
  size_t v13;
  const void **v14;
  const void **v15;
  unint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  _BYTE *v22;
  char v23;
  char *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  unsigned int *v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  int v39;
  _DWORD *v40;
  uint64_t (*(*v41)())(uint64_t, int, uint64_t);
  char *v42;
  uint64_t (*v43)(uint64_t);

  v7 = sub_20AA5B4E0;
  if (a4)
    v7 = a4;
  v43 = v7;
  v8 = sub_20AA5B4D4;
  if (a5)
    v8 = a5;
  v41 = v8;
  if (theDict)
  {
    Count = CFDictionaryGetCount(theDict);
    LODWORD(v11) = Count;
    if (Count >= 1)
    {
      v40 = a2;
      v42 = (char *)malloc_type_calloc(Count, 0x20uLL, 0x1080040A9F9A45FuLL);
      v39 = v11;
      if ((int)v11 >= 32)
        v12 = 32;
      else
        v12 = v11;
      v13 = 8 * v12;
      v14 = (const void **)malloc_type_malloc(v13, 0x80040B8603338uLL);
      v15 = (const void **)malloc_type_malloc(v13, 0x80040B8603338uLL);
      CFDictionaryGetKeysAndValues(theDict, v14, v15);
      v16 = 0;
      v17 = 0;
      v18 = 8 * v11;
      do
      {
        v19 = *(_QWORD *)(a1 + 80);
        v20 = v14[v16 / 8];
        v21 = v19 + 40 * v20;
        v23 = *(_BYTE *)(v21 + 24);
        v22 = (_BYTE *)(v21 + 24);
        if ((v23 & 4) == 0)
        {
          v24 = &v42[32 * v17];
          *(_DWORD *)v24 = v15[v16 / 8];
          v25 = v19 + 40 * v20;
          v27 = *(_QWORD *)(v25 + 8);
          v26 = (_QWORD *)(v25 + 8);
          *((_QWORD *)v24 + 1) = v43(v27);
          if ((*v22 & 1) != 0)
          {
            *((_QWORD *)v24 + 2) = 0;
          }
          else
          {
            *((_QWORD *)v24 + 2) = ((uint64_t (*)(_QWORD))v41)(*v26);
            *((_QWORD *)v24 + 3) = v14[v16 / 8];
          }
          ++v17;
        }
        v16 += 8;
      }
      while (v18 != v16);
      free(v14);
      free(v15);
      LODWORD(v11) = v39;
      a2 = v40;
      v28 = v42;
      goto LABEL_33;
    }
LABEL_32:
    v28 = 0;
    goto LABEL_33;
  }
  v29 = *(unsigned int *)(a1 + 72);
  if ((int)v29 < 1)
  {
    LODWORD(v11) = 0;
    goto LABEL_32;
  }
  LODWORD(v11) = 0;
  v30 = (unsigned int *)(*(_QWORD *)(a1 + 80) + 24);
  do
  {
    v31 = *v30;
    v30 += 10;
    v11 = (((v31 >> 2) & 1) == 0) + v11;
    --v29;
  }
  while (v29);
  if (!(_DWORD)v11)
    goto LABEL_32;
  v28 = (char *)malloc_type_calloc(v11, 0x20uLL, 0x1080040A9F9A45FuLL);
  if (*(int *)(a1 + 72) >= 1)
  {
    v32 = 0;
    v33 = 0;
    v34 = 0;
    do
    {
      v35 = *(_QWORD *)(a1 + 80) + v32;
      if ((*(_BYTE *)(v35 + 24) & 4) != 0)
      {
        v36 = v34;
      }
      else
      {
        v36 = (v34 + 1);
        v37 = &v28[32 * (int)v34];
        *(_DWORD *)v37 = v36;
        *((_QWORD *)v37 + 1) = v43(*(_QWORD *)(v35 + 8));
        if ((*(_BYTE *)(v35 + 24) & 1) != 0)
        {
          *((_QWORD *)v37 + 2) = 0;
        }
        else
        {
          *((_QWORD *)v37 + 2) = ((uint64_t (*)(_QWORD))v41)(*(_QWORD *)(v35 + 8));
          *((_QWORD *)v37 + 3) = v33;
        }
      }
      ++v33;
      v32 += 40;
      v34 = v36;
    }
    while (v33 < *(int *)(a1 + 72));
  }
LABEL_33:
  *a2 = v11;
  return v28;
}

uint64_t CSDBRecordGetProperty(uint64_t a1, uint64_t a2)
{
  const void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFDictionary *v8;
  uint64_t v10;
  uint64_t *v11;

  if (!a1)
    sub_20AA66A78();
  v3 = (const void *)(int)a2;
  v4 = (int)a2 + 9;
  v5 = *(_QWORD *)(a1 + 8 * v4);
  if (!v5)
  {
    v6 = sub_20AA5ADE4(a1);
    if (!v6)
      goto LABEL_8;
    v7 = v6;
    v5 = *(_QWORD *)(v6 + 8 * v4);
    if (v5)
      goto LABEL_9;
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 24) + 80) + 40 * (int)v3 + 16) + 24);
    if (!v5)
      goto LABEL_9;
    v8 = *(const __CFDictionary **)(v6 + 40);
    if (v8 && CFDictionaryContainsKey(v8, v3))
    {
LABEL_8:
      v5 = 0;
    }
    else
    {
      v10 = *(_QWORD *)(v7 + 16);
      if (v10)
        v11 = (uint64_t *)sub_20AA5D70C(v10);
      else
        v11 = 0;
      (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 24) + 80)
                                                                      + 40 * (int)v3
                                                                      + 16)
                                                          + 24))(v7, a2, v11);
      if (v11)
        CSDBSqliteDatabaseReleaseSqliteConnection(v11);
      v5 = *(_QWORD *)(v7 + 8 * v4);
    }
  }
LABEL_9:
  if (*MEMORY[0x24BDBD430] == v5)
    return 0;
  else
    return v5;
}

UInt8 *CSDBSqliteBindTextFromCFString(UInt8 *result, const __CFString *a2)
{
  UInt8 *v2;

  if (result)
  {
    v2 = result;
    if (a2 && *((_QWORD *)result + 1) && *((int *)result + 4) >= 1)
    {
      result = CSDBCreateUTF8StringFromCFString(a2);
      if (result)
        result = (UInt8 *)sqlite3_bind_text(*((sqlite3_stmt **)v2 + 1), *((_DWORD *)v2 + 4), (const char *)result, -1, (void (__cdecl *)(void *))MEMORY[0x24BDAE450]);
    }
    ++*((_DWORD *)v2 + 4);
  }
  return result;
}

UInt8 *CSDBCreateUTF8StringFromCFString(const __CFString *a1)
{
  CFIndex Length;
  int MaximumSizeForEncoding;
  UInt8 *v4;
  CFIndex usedBufLen;
  CFRange v7;

  if (!a1)
    return 0;
  Length = (int)CFStringGetLength(a1);
  MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  usedBufLen = 0xAAAAAAAAAAAAAAAALL;
  v4 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0x4A307CFDuLL);
  v7.location = 0;
  v7.length = Length;
  CFStringGetBytes(a1, v7, 0x8000100u, 0, 0, v4, MaximumSizeForEncoding, &usedBufLen);
  v4[usedBufLen] = 0;
  return v4;
}

void CSDBSqliteBindInt64(uint64_t a1, sqlite3_int64 a2)
{
  sqlite3_stmt *v3;
  int v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v3 = *(sqlite3_stmt **)(a1 + 8);
    if (v3)
    {
      v5 = *(_DWORD *)(a1 + 16);
      if (v5 >= 1)
      {
        sqlite3_bind_int64(v3, v5, a2);
LABEL_12:
        ++*(_DWORD *)(a1 + 16);
        return;
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("YES");
      if (a1)
      {
        v8 = *(_DWORD *)(a1 + 16);
      }
      else
      {
        v7 = CFSTR("NO");
        v8 = 0;
      }
      v9 = 138412546;
      v10 = v7;
      v11 = 1024;
      v12 = v8;
      _os_log_impl(&dword_20AA57000, v6, OS_LOG_TYPE_INFO, "Invalid parameters passed into CSDBSqliteBindInt64 s==NULL ? %@  bindIndex = %d", (uint8_t *)&v9, 0x12u);
    }
  }
  if (a1)
    goto LABEL_12;
}

uint64_t (*sub_20AA5B4D4())(uint64_t a1, int a2, uint64_t a3)
{
  return sub_20AA5AD34;
}

uint64_t sub_20AA5B4E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v1 = 0;
  v2 = qword_20AA67A80;
  do
  {
    v3 = *v2;
    v2 += 2;
    if (v3 == a1)
      break;
    ++v1;
  }
  while (v1 != 4);
  return qword_20AA67A80[2 * v1 + 1];
}

uint64_t CSDBSqliteStatementIntegerResult(sqlite3_stmt **a1, int *a2)
{
  sqlite3_stmt *v4;
  uint64_t v5;

  if (!a1)
    return 0;
  v4 = a1[1];
  if (!v4)
    return 0;
  if (CSDBSqliteStepWithConnection((int)*a1, v4) == 100)
  {
    v5 = sqlite3_column_int(a1[1], 0);
    if (!a2)
      return v5;
    goto LABEL_8;
  }
  v5 = 0;
  if (a2)
LABEL_8:
    *a2 = sqlite3_errcode(*((sqlite3 **)*a1 + 1));
  return v5;
}

uint64_t CSDBSqliteConnectionPerformSQL(uint64_t a1, const __CFString *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  sqlite3_stmt *v4;
  int v5;

  v2 = sub_20AA5B910(a1, a2, 0);
  if (!v2)
    return 1;
  v3 = v2;
  v4 = (sqlite3_stmt *)v2[1];
  if (v4)
  {
    v5 = CSDBSqliteStepWithConnection(*v2, v4);
    CSDBSqliteStatementReset(v3);
    if (v5 == 101)
      return 101;
  }
  else
  {
    CSDBSqliteStatementReset(v2);
  }
  return sqlite3_errcode(*(sqlite3 **)(*v3 + 8));
}

#error "20AA5B658: call analysis failed (funcsize=31)"

#error "20AA5B6CC: call analysis failed (funcsize=22)"

void CSDBCheckResultWithStatement(void **a1, sqlite3 *exc_buf, uint64_t a3, uint64_t a4, sqlite3_stmt *a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  NSObject *v22;
  uint64_t v23;
  int v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  unsigned int v29;
  uint64_t v30;
  sqlite3 *v31;
  sqlite3 *v32;
  sqlite3_stmt *v33;
  sqlite3_stmt *v34;
  uint8_t buf[16];
  uint8_t v36[16];
  uint8_t v37[16];

  if ((int)a3 > 25)
  {
    if ((a3 - 100) < 2)
      return;
    if ((_DWORD)a3 != 26)
    {
LABEL_15:
      sub_20AA631A8(exc_buf, a4, a5, a4, (int)a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
        a20,
        a21,
        a22);
      return;
    }
    goto LABEL_8;
  }
  if (!(_DWORD)a3)
    return;
  if ((_DWORD)a3 != 10)
  {
    if ((_DWORD)a3 != 11)
      goto LABEL_15;
LABEL_8:
    if (*a1)
    {
      v29 = a3;
      v30 = a4;
      v32 = exc_buf;
      v34 = a5;
      objc_msgSend_UTF8String(*a1, (const char *)exc_buf, a3);
      v24 = _sqlite3_integrity_check();
      v25 = IMOSLoggingEnabled();
      if (!v24)
      {
        if (v25)
        {
          v26 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v36 = 0;
            _os_log_impl(&dword_20AA57000, v26, OS_LOG_TYPE_INFO, "Exiting as we were handed a false negative corruption by sqlite and we want to clean up bad state in memory", v36, 2u);
          }
        }
        exit(2);
      }
      if (v25)
      {
        v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v37 = 0;
          _os_log_impl(&dword_20AA57000, v27, OS_LOG_TYPE_INFO, "SQLite confirms DB is corrupted. About to move it aside", v37, 2u);
        }
      }
      sub_20AA636B8(a1, v32, v29, v30, v34);
    }
    if (IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20AA57000, v22, OS_LOG_TYPE_INFO, "We had a corruption but had a nil DB path", buf, 2u);
      }
    }
    return;
  }
  if (qword_254613560 != -1)
  {
    v31 = exc_buf;
    v33 = a5;
    v23 = a4;
    dispatch_once(&qword_254613560, &unk_24C35A198);
    exc_buf = v31;
    a5 = v33;
    a4 = v23;
  }
  if (byte_254613568)
    goto LABEL_15;
}

_DWORD *sub_20AA5B910(uint64_t a1, const __CFString *key, int a3)
{
  const __CFDictionary *v6;
  _DWORD *Value;
  char *v8;
  sqlite3_stmt *v9;
  sqlite3_stmt *v10;
  CFDictionaryValueCallBacks valueCallBacks;

  if (!a1)
    return 0;
  v6 = *(const __CFDictionary **)(a1 + 16);
  if (!v6)
  {
    valueCallBacks.version = 0;
    valueCallBacks.retain = 0;
    valueCallBacks.copyDescription = 0;
    valueCallBacks.equal = 0;
    valueCallBacks.release = (CFDictionaryReleaseCallBack)sub_20AA658DC;
    v6 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], &valueCallBacks);
    *(_QWORD *)(a1 + 16) = v6;
  }
  Value = CFDictionaryGetValue(v6, key);
  if (!Value)
  {
    v8 = (char *)CSDBCreateUTF8StringFromCFString(key);
    v9 = CSDBSqlitePreparedStatement(*(sqlite3 **)(a1 + 8), v8, a3);
    if (v9)
    {
      v10 = v9;
      Value = malloc_type_malloc(0x18uLL, 0x1020040EDCEB4C7uLL);
      *(_QWORD *)Value = a1;
      *((_QWORD *)Value + 1) = v10;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), key, Value);
      Value[4] = 1;
    }
    else
    {
      Value = 0;
    }
    free(v8);
  }
  return Value;
}

uint64_t CSDBRecordStoreGetRecordIDForRowid(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  const __CFSet *Mutable;
  void *v5;
  const __CFAllocator *v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  int v10;
  _BYTE *v11;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
  uint64_t value;

  value = a2;
  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = a2;
  if ((unint64_t)(a2 - 0x80000000) <= 0xFFFFFFFF7FFFFFFELL)
  {
    Mutable = *(const __CFSet **)(a1 + 120);
    if (!Mutable)
    {
      v5 = malloc_type_malloc(0x400uLL, 0x100004000313F17uLL);
      *(_QWORD *)(a1 + 112) = v5;
      if (!v5)
        return 0xFFFFFFFFLL;
      v6 = CFGetAllocator((CFTypeRef)a1);
      Mutable = CFSetCreateMutable(v6, 128, &stru_24C35A0A8);
      *(_QWORD *)(a1 + 120) = Mutable;
      *(_DWORD *)(a1 + 108) = 128;
    }
    v7 = *(_BYTE **)(a1 + 112);
    v8 = CFSetGetValue(Mutable, &value);
    if (v8)
      return ((unint64_t)(v8 - v7) >> 3) | 0x80000000;
    v9 = *(unsigned int *)(a1 + 104);
    if (*(_DWORD *)(a1 + 108) != (_DWORD)v9)
    {
LABEL_16:
      v14 = &v7[8 * (int)v9];
      *v14 = value;
      *(_DWORD *)(a1 + 104) = v9 + 1;
      v2 = v9 | 0x80000000;
      CFSetSetValue(*(CFMutableSetRef *)(a1 + 120), v14);
      return v2;
    }
    v10 = (3 * (int)v9) >> 1;
    v11 = malloc_type_realloc(v7, 8 * v10, 0x474D10FDuLL);
    if (v11)
    {
      v7 = v11;
      if (v11 != *(_BYTE **)(a1 + 112))
      {
        CFSetRemoveAllValues(*(CFMutableSetRef *)(a1 + 120));
        if ((int)v9 >= 1)
        {
          v12 = v9;
          v13 = v7;
          do
          {
            CFSetSetValue(*(CFMutableSetRef *)(a1 + 120), v13);
            v13 += 8;
            --v12;
          }
          while (v12);
        }
        *(_QWORD *)(a1 + 112) = v7;
      }
      *(_DWORD *)(a1 + 108) = v10;
      goto LABEL_16;
    }
    return 0xFFFFFFFFLL;
  }
  return v2;
}

uint64_t CSDBPerformLockedSectionForQueryForReading(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        v5 = result;
        result = *(_QWORD *)(result + 8);
        if (result)
        {
          result = CSDBRecordStoreGetDatabase(result);
          if (result)
          {
            v6 = result;
            result = CSDBSqliteDatabaseStatementForReading(result, a2);
            if (result)
            {
              v7 = result;
              if (*(_QWORD *)(result + 8))
              {
                (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(a3 + 16))(a3, *(_QWORD *)(v5 + 8), v6, result);
                return CSDBSqliteStatementReset(v7);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void CSDBRecordStoreInvalidateCachesWithStore(uint64_t a1)
{
  const void *v2;

  if (a1)
  {
    CSDBRecordStoreRevert(a1);
    v2 = *(const void **)(a1 + 16);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(a1 + 16) = 0;
    }
  }
}

void CSDBRecordStoreRevert(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const __CFDictionary *v6;

  if (a1)
  {
    v2 = *(const void **)(a1 + 24);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(a1 + 24) = 0;
    }
    v3 = *(const void **)(a1 + 32);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(a1 + 32) = 0;
    }
    v4 = *(const void **)(a1 + 40);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(a1 + 40) = 0;
    }
    v5 = *(const void **)(a1 + 48);
    if (v5)
    {
      CFRelease(v5);
      *(_QWORD *)(a1 + 48) = 0;
    }
    v6 = *(const __CFDictionary **)(a1 + 16);
    if (v6)
      CFDictionaryApplyFunction(v6, (CFDictionaryApplierFunction)sub_20AA59180, 0);
    *(_DWORD *)(a1 + 96) = -1;
  }
}

uint64_t CSDBRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(uint64_t a1, void (*a2)(uint64_t, uint64_t *), void (*a3)(uint64_t, uint64_t *), int a4, unsigned int a5, CFErrorRef *a6)
{
  uint64_t Database;
  uint64_t v13;
  uint64_t *v14;
  int v15;
  int v16;
  int v17;
  const __CFDictionary *v18;
  const void *v19;
  const __CFDictionary *v20;
  int v21;
  const __CFDictionary *v22;
  int v23;
  CFErrorRef v24;
  _BOOL8 v25;
  uint64_t context;
  uint64_t *v29;
  uint64_t v30;

  if (a1
    && !a2
    && !a3
    && !*(_QWORD *)(a1 + 24)
    && !*(_QWORD *)(a1 + 32)
    && !*(_QWORD *)(a1 + 40)
    && !*(_QWORD *)(a1 + 80)
    && !*(_QWORD *)(a1 + 16))
  {
    return 1;
  }
  Database = CSDBRecordStoreGetDatabase(a1);
  v13 = CSDBSqliteDatabaseConnectionForWriting(Database);
  if (!v13)
  {
    if (!a6)
      return 0;
    v24 = CFErrorCreate(0, CFSTR("CSDBRecord"), 1, 0);
    v25 = 0;
LABEL_45:
    *a6 = v24;
    return v25;
  }
  v14 = (uint64_t *)v13;
  CSDBSqliteConnectionBeginTransactionType(v13, a5);
  v15 = CSDBSqliteConnectionIntegerForProperty((uint64_t)v14, CFSTR("__CSDBRecordSequenceNumber"));
  if (!a1)
    sub_20AA66CD0();
  v16 = v15;
  if (a4)
  {
    v17 = *(_DWORD *)(a1 + 96);
    if (v17 != -1 && v15 != v17)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s: database changed externally\n", "_Bool CSDBRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(CSDBRecordStoreRef, CSDBRecordStoreSaveCallback, CSDBRecordStoreSaveCallback, CSDBRecordConflictPolicy, CSDBSqliteTransactionType, CFErrorRef *)");
      if (a6)
        *a6 = CFErrorCreate(0, CFSTR("CSDBRecord"), 2, 0);
      CSDBSqliteDatabaseReleaseSqliteConnection(v14);
      return 0;
    }
  }
  context = a1;
  v29 = v14;
  v30 = 0;
  if (a2)
    a2(a1, v14);
  sub_20AA5CF9C(&context);
  sub_20AA5D01C(&context);
  if (context)
  {
    if (v29)
    {
      v18 = *(const __CFDictionary **)(context + 32);
      if (v18)
      {
        *(_QWORD *)(context + 32) = 0;
        CFDictionaryApplyFunction(v18, (CFDictionaryApplierFunction)sub_20AA6001C, &context);
        CFRelease(v18);
        v19 = *(const void **)(context + 32);
        if (v19)
        {
          CFRelease(v19);
          *(_QWORD *)(context + 32) = 0;
        }
      }
    }
  }
  v20 = *(const __CFDictionary **)(a1 + 80);
  if (v20)
  {
    CFDictionaryApplyFunction(v20, (CFDictionaryApplierFunction)sub_20AA5E9D0, &context);
    CFRelease(*(CFTypeRef *)(a1 + 80));
    *(_QWORD *)(a1 + 80) = 0;
  }
  v21 = v16 + 1;
  *(_DWORD *)(a1 + 96) = v16 + 1;
  v22 = *(const __CFDictionary **)(a1 + 16);
  if (v22)
  {
    CFDictionaryApplyFunction(v22, (CFDictionaryApplierFunction)sub_20AA59170, (void *)v21);
    v21 = *(_DWORD *)(a1 + 96);
  }
  CSDBSqliteConnectionSetIntegerForProperty(v14, CFSTR("__CSDBRecordSequenceNumber"), v21);
  if (a3)
    a3(a1, v14);
  if (a5 == 0xFFFF)
  {
    v23 = 101;
  }
  else
  {
    v23 = CSDBSqliteConnectionCommit((uint64_t)v14);
    CSDBSqliteConnectionCheckNoConnectionError((uint64_t)v14, v23, (uint64_t)"_Bool CSDBRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(CSDBRecordStoreRef, CSDBRecordStoreSaveCallback, CSDBRecordStoreSaveCallback, CSDBRecordConflictPolicy, CSDBSqliteTransactionType, CFErrorRef *)");
  }
  CSDBSqliteDatabaseReleaseSqliteConnection(v14);
  v25 = v23 == 101 || v23 == 0;
  if (a6 && !v25)
  {
    v24 = CFErrorCreate(0, CFSTR("CSDBRecordSQLite"), v23, 0);
    goto LABEL_45;
  }
  return v25;
}

_DWORD *CSDBSqliteDatabaseStatementForWriting(uint64_t a1, const __CFString *a2)
{
  uint64_t v3;
  uint64_t *v4;
  _DWORD *v5;
  uint64_t v6;

  v3 = CSDBSqliteDatabaseConnectionForWritingWithOwnership(a1, 1);
  if (!v3)
    return 0;
  v4 = (uint64_t *)v3;
  v5 = sub_20AA5B910(v3, a2, 0);
  v6 = *v4;
  if (*v4 && (*(_BYTE *)(v6 + 84) & 4) != 0)
    pthread_mutex_unlock((pthread_mutex_t *)(v6 + 88));
  return v5;
}

uint64_t CSDBSqliteDatabaseConnectionForWritingWithOwnership(uint64_t result, char a2)
{
  uint64_t v3;
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v5;
  sqlite3 **v6;
  id v7;
  size_t v8;
  const char *v9;
  void *v10;
  _QWORD v11[5];
  char v12;

  if (result)
  {
    v3 = result;
    if ((*(_BYTE *)(result + 84) & 4) != 0)
      pthread_mutex_lock((pthread_mutex_t *)(result + 88));
    result = *(_QWORD *)(v3 + 8);
    if (!result)
    {
      MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(*(CFStringRef *)v3);
      v5 = (char *)malloc_type_calloc(MaximumSizeOfFileSystemRepresentation + 1, 1uLL, 0x100004077774924uLL);
      CFStringGetFileSystemRepresentation(*(CFStringRef *)v3, v5, MaximumSizeOfFileSystemRepresentation);
      v12 = 0;
      v6 = sub_20AA6122C(v3, v5, &v12, a2);
      if (v6 || v12 && (v6 = sub_20AA6122C(v3, v5, &v12, 1)) != 0)
      {
        v7 = objc_alloc(MEMORY[0x24BDD17C8]);
        v8 = strlen(v5);
        v10 = (void *)objc_msgSend_initWithBytes_length_encoding_(v7, v9, (uint64_t)v5, v8, 1);
        v11[0] = MEMORY[0x24BDAC760];
        v11[1] = 3221225472;
        v11[2] = sub_20AA616A0;
        v11[3] = &unk_24C35A130;
        v11[4] = v10;
        dispatch_async(MEMORY[0x24BDAC9B8], v11);

        *(_QWORD *)(v3 + 8) = v6;
        *v6 = (sqlite3 *)v3;
      }
      free(v5);
      return *(_QWORD *)(v3 + 8);
    }
  }
  return result;
}

uint64_t CSDBPerformLockedSectionForDatabase(uint64_t result, uint64_t a2)
{
  uint64_t v3;

  if (result)
  {
    if (a2)
    {
      v3 = result;
      result = *(_QWORD *)(result + 8);
      if (result)
      {
        result = CSDBRecordStoreGetDatabase(result);
        if (result)
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(a2 + 16))(a2, *(_QWORD *)(v3 + 8), result);
      }
    }
  }
  return result;
}

uint64_t CSDBRecordStoreGetDatabase(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;

  if (!a1)
    sub_20AA66B90();
  result = *(_QWORD *)(a1 + 8);
  if (!result)
  {
    v3 = CSDBSqliteDatabaseCreateWithPath(*(const __CFString **)a1);
    *(_QWORD *)(a1 + 8) = v3;
    if (!v3)
      sub_20AA66BB8();
    CSDBSqliteDatabaseSetSetupHandler((uint64_t)v3, (uint64_t)sub_20AA5E670, a1);
    return *(_QWORD *)(a1 + 8);
  }
  return result;
}

uint64_t CSDBSqliteConnectionIntegerForProperty(uint64_t a1, const __CFString *a2)
{
  uint64_t result;
  BOOL v3;

  v3 = 0;
  LODWORD(result) = sub_20AA5C534(a1, a2, 0, &v3);
  if (v3)
    return result;
  else
    return 0;
}

uint64_t *CSDBSqliteDatabaseReleaseSqliteConnection(uint64_t *result)
{
  uint64_t v1;

  v1 = *result;
  if (*result)
  {
    if ((*(_BYTE *)(v1 + 84) & 4) != 0)
      return (uint64_t *)pthread_mutex_unlock((pthread_mutex_t *)(v1 + 88));
  }
  return result;
}

uint64_t CSDBSqliteDatabaseConnectionForWriting(uint64_t a1)
{
  return CSDBSqliteDatabaseConnectionForWritingWithOwnership(a1, 1);
}

uint64_t CSDBSqliteConnectionSetIntegerForProperty(_QWORD *a1, const __CFString *a2, int a3)
{
  uint64_t result;
  UInt8 *v7;
  UInt8 *v8;
  sqlite3_stmt *v9;
  __CFDictionary *v10;
  UInt8 *v11;
  UInt8 *v12;
  sqlite3_stmt *v13;

  result = 1;
  if (a1 && a2 && *a1)
  {
    v7 = (UInt8 *)sub_20AA5B910((uint64_t)a1, CFSTR("INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);"),
                    0);
    if (v7)
    {
      v8 = v7;
      CSDBSqliteBindTextFromCFString(v7, a2);
      CSDBSqliteBindInt((uint64_t)v8, a3);
      v9 = (sqlite3_stmt *)*((_QWORD *)v8 + 1);
      if (v9)
        CSDBSqliteStepWithConnection(*(_QWORD *)v8, v9);
      result = CSDBSqliteStatementReset(v8);
      if ((_DWORD)result == 17)
      {
        v10 = (__CFDictionary *)a1[2];
        if (v10
          && (CFDictionaryRemoveValue(v10, CFSTR("INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);")),
              (v11 = (UInt8 *)sub_20AA5B910((uint64_t)a1, CFSTR("INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);"),
                                0)) != 0))
        {
          v12 = v11;
          CSDBSqliteBindTextFromCFString(v11, a2);
          CSDBSqliteBindInt((uint64_t)v12, a3);
          v13 = (sqlite3_stmt *)*((_QWORD *)v12 + 1);
          if (v13)
            CSDBSqliteStepWithConnection(*(_QWORD *)v12, v13);
          return CSDBSqliteStatementReset(v12);
        }
        else
        {
          return 17;
        }
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t CSDBSqliteConnectionCommit(uint64_t a1)
{
  uint64_t result;

  if (sqlite3_get_autocommit(*(sqlite3 **)(a1 + 8)))
    return 0;
  result = CSDBSqliteConnectionPerformSQL(a1, CFSTR("COMMIT;"));
  *(_DWORD *)(a1 + 40) = 0xFFFF;
  return result;
}

uint64_t CSDBSqliteConnectionCheckNoConnectionError(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4;
  sqlite3 *v7;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((a2 - 100) < 2 || a2 == 0)
    return 0;
  v7 = *(sqlite3 **)(a1 + 8);
  if (!IMOSLoggingEnabled())
    return 1;
  v9 = OSLogHandleForIMFoundationCategory();
  v4 = 1;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 136315650;
    v11 = a3;
    v12 = 2080;
    v13 = sqlite3_errmsg(v7);
    v14 = 1024;
    v15 = sqlite3_extended_errcode(v7);
    v4 = 1;
    _os_log_impl(&dword_20AA57000, v9, OS_LOG_TYPE_INFO, "sqlite3 error in %s: %s (%d)\n", (uint8_t *)&v10, 0x1Cu);
  }
  return v4;
}

uint64_t CSDBSqliteConnectionBeginTransactionType(uint64_t a1, unsigned int a2)
{
  const __CFString *v4;
  uint64_t result;
  BOOL v6;
  int v7;

  if (a2 > 2)
  {
    result = 0;
  }
  else
  {
    v4 = off_24C35A208[a2];
    result = sqlite3_get_autocommit(*(sqlite3 **)(a1 + 8));
    if ((_DWORD)result)
      result = CSDBSqliteConnectionPerformSQL(a1, v4);
  }
  if ((_DWORD)result)
    v6 = (_DWORD)result == 101;
  else
    v6 = 1;
  v7 = v6;
  if (a2 != 0xFFFF)
  {
    if (v7)
      *(_DWORD *)(a1 + 40) = a2;
  }
  return result;
}

const __CFString *sub_20AA5C520(const __CFString *theString)
{
  if (theString)
    return CFStringCreateCopy(0, theString);
  return theString;
}

uint64_t sub_20AA5C534(uint64_t a1, const __CFString *a2, int *a3, BOOL *a4)
{
  UInt8 *v8;
  sqlite3_stmt **v9;
  uint64_t v10;
  int v12;

  if (a4)
    *a4 = 0;
  if (!a1)
    return 0;
  v8 = (UInt8 *)sub_20AA5B910(a1, CFSTR("SELECT value FROM _SqliteDatabaseProperties WHERE key = ?;"), 0);
  if (!v8)
    return 0;
  v9 = (sqlite3_stmt **)v8;
  v12 = 101;
  CSDBSqliteBindTextFromCFString(v8, a2);
  v10 = CSDBSqliteStatementIntegerResult(v9, &v12);
  if (a4)
    *a4 = v12 == 100;
  CSDBSqliteStatementReset(v9);
  if (a3)
    *a3 = sqlite3_errcode(*(sqlite3 **)(a1 + 8));
  return v10;
}

uint64_t CSDBSqliteStatementPerform(_QWORD *a1)
{
  sqlite3_stmt *v1;

  if (a1 && (v1 = (sqlite3_stmt *)a1[1]) != 0)
    return CSDBSqliteStepWithConnection(*a1, v1);
  else
    return 1;
}

uint64_t CSDBSqliteDatabaseConnectionForReading(uint64_t a1)
{
  return CSDBSqliteDatabaseConnectionForWritingWithOwnership(a1, 1);
}

uint64_t CSDBRecordStoreGetSequenceNumber(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  if (!a1)
    return 0;
  v1 = sub_20AA5D70C(a1);
  if (!v1)
    return 0;
  v2 = (uint64_t *)v1;
  v3 = (int)CSDBSqliteConnectionIntegerForProperty(v1, CFSTR("__CSDBRecordSequenceNumber"));
  CSDBSqliteDatabaseReleaseSqliteConnection(v2);
  return v3;
}

_DWORD *CSDBSqliteConnectionStatementForSQL(uint64_t a1, const __CFString *a2)
{
  return sub_20AA5B910(a1, a2, 0);
}

void CSDBSqliteStatementApplyValuesFromRecordWithNullValue(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, sqlite3_int64 a5)
{
  sub_20AA5A4B0(a1, a2, a3, a4, a5, 1);
}

sqlite3_int64 CSDBSqliteConnectionRowidOfLastInsert(uint64_t a1)
{
  sqlite3 *v1;

  if (a1 && (v1 = *(sqlite3 **)(a1 + 8)) != 0)
    return sqlite3_last_insert_rowid(v1);
  else
    return -1;
}

uint64_t CSDBSqliteConnectionAddRecordWithRowid(uint64_t a1, const __CFString *a2, sqlite3_int64 a3, const char **a4, unsigned int a5)
{
  const char **v9;
  _BOOL4 v11;
  CFMutableStringRef MutableCopy;
  const char *v13;
  const __CFAllocator *v14;
  CFMutableStringRef Mutable;
  _QWORD *v16;
  sqlite3_stmt *v17;
  uint64_t v18;
  const __CFString *v19;
  const char **v20;
  uint64_t v21;
  const __CFString *v22;
  CFMutableStringRef v23;
  _DWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  CFMutableStringRef v27;
  uint64_t v28;
  sqlite3_stmt *v29;
  unsigned int v34;

  if (!a5)
  {
    MutableCopy = CFStringCreateMutableCopy(0, 0, CFSTR("INSERT INTO "));
    CFStringAppend(MutableCopy, a2);
    if (a3 == -1)
    {
      CFStringAppend(MutableCopy, CFSTR(" (ROWID) VALUES(NULL);"));
      v16 = sub_20AA5B910(a1, MutableCopy, 0);
      if (v16)
        goto LABEL_15;
    }
    else
    {
      CFStringAppend(MutableCopy, CFSTR(" (ROWID) VALUES(?);"));
      v16 = sub_20AA5B910(a1, MutableCopy, 0);
      CSDBSqliteBindInt64((uint64_t)v16, a3);
      if (v16)
      {
LABEL_15:
        v17 = (sqlite3_stmt *)v16[1];
        if (v17)
          v18 = CSDBSqliteStepWithConnection(*v16, v17);
        else
          v18 = 1;
        CSDBSqliteStatementReset(v16);
LABEL_51:
        CFRelease(MutableCopy);
        return v18;
      }
    }
    if (!MutableCopy)
      return 1;
    v27 = MutableCopy;
LABEL_47:
    CFRelease(v27);
    return 1;
  }
  v9 = a4;
  v11 = a3 == -1 && a5 < 3;
  if (v11)
  {
    if (a5 == 1)
      MutableCopy = CFSTR("?");
    else
      MutableCopy = CFSTR("?, ?");
    v13 = *a4;
    v14 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  }
  else
  {
    v14 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    MutableCopy = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    CFStringAppend(MutableCopy, CFSTR("?"));
    v13 = *v9;
    Mutable = CFStringCreateMutable(v14, 0);
    if (a3 != -1)
    {
      CFStringAppend(MutableCopy, CFSTR(", ?"));
      CFStringAppend(Mutable, CFSTR("ROWID, "));
    }
  }
  v19 = CFStringCreateWithCString(v14, v13, 0x8000100u);
  CFStringAppend(Mutable, v19);
  CFRelease(v19);
  v34 = a5;
  if (a5 >= 2)
  {
    v20 = v9 + 3;
    v21 = a5 - 1;
    do
    {
      v22 = CFStringCreateWithCString(v14, *v20, 0x8000100u);
      CFStringAppend(Mutable, CFSTR(", "));
      CFStringAppend(Mutable, v22);
      CFRelease(v22);
      if (!v11)
        CFStringAppend(MutableCopy, CFSTR(", ?"));
      v20 += 3;
      --v21;
    }
    while (v21);
  }
  v23 = CFStringCreateMutableCopy(0, 0, CFSTR("INSERT INTO "));
  CFStringAppend(v23, a2);
  CFStringAppend(v23, CFSTR(" ("));
  CFStringAppend(v23, Mutable);
  CFStringAppend(v23, CFSTR(") VALUES ("));
  CFStringAppend(v23, MutableCopy);
  CFStringAppend(v23, CFSTR(");"));
  v24 = sub_20AA5B910(a1, v23, 0);
  if (!v24)
  {
    if (MutableCopy)
      CFRelease(MutableCopy);
    if (Mutable)
      CFRelease(Mutable);
    if (!v23)
      return 1;
    v27 = v23;
    goto LABEL_47;
  }
  v25 = v24;
  if (a3 == -1)
  {
    if (*((_QWORD *)v24 + 1))
    {
      v28 = v34;
      do
      {
        CSDBSqliteBindColumnValue((uint64_t)v25, (uint64_t)v9);
        v9 += 3;
        --v28;
      }
      while (v28);
    }
  }
  else
  {
    CSDBSqliteBindInt64((uint64_t)v24, a3);
    if (v25[1])
    {
      v26 = v34;
      do
      {
        CSDBSqliteBindColumnValue((uint64_t)v25, (uint64_t)v9);
        v9 += 3;
        --v26;
      }
      while (v26);
    }
  }
  v29 = (sqlite3_stmt *)v25[1];
  if (v29)
    v18 = CSDBSqliteStepWithConnection(*v25, v29);
  else
    v18 = 1;
  CSDBSqliteStatementReset(v25);
  CFRelease(v23);
  CFRelease(Mutable);
  if (!v11)
    goto LABEL_51;
  return v18;
}

void CSDBSqliteBindColumnValue(uint64_t a1, uint64_t a2)
{
  const __CFString *v4;
  const __CFData *v5;
  double v6;
  const __CFNumber *v7;
  double valuePtr;

  if (a1 && *(_QWORD *)(a1 + 8))
  {
    switch(*(_QWORD *)(a2 + 8))
    {
      case 0:
        CSDBSqliteBindInt(a1, *(_DWORD *)(a2 + 16));
        return;
      case 1:
        CSDBSqliteBindInt64(a1, *(_QWORD *)(a2 + 16));
        return;
      case 2:
        v4 = *(const __CFString **)(a2 + 16);
        if (!v4)
          goto LABEL_19;
        CSDBSqliteBindTextFromCFString((UInt8 *)a1, v4);
        return;
      case 3:
      case 5:
        syslog(4, "%s does not handle raw data types yet.", "void CSDBSqliteBindColumnValue(CSDBSqliteStatement *, CSDBWriteColumnDescriptor *)");
        return;
      case 4:
        v5 = *(const __CFData **)(a2 + 16);
        if (!v5)
          goto LABEL_19;
        CSDBSqliteBindBlobFromCFData(a1, v5);
        return;
      case 6:
        v6 = *(float *)(a2 + 16);
        goto LABEL_18;
      case 7:
        v7 = *(const __CFNumber **)(a2 + 16);
        if (!v7)
          goto LABEL_19;
        if (CFNumberIsFloatType(v7))
        {
          valuePtr = NAN;
          CFNumberGetValue(*(CFNumberRef *)(a2 + 16), kCFNumberDoubleType, &valuePtr);
          CSDBSqliteBindDouble(a1, valuePtr);
        }
        else
        {
          valuePtr = -3.72066208e-103;
          CFNumberGetValue(*(CFNumberRef *)(a2 + 16), kCFNumberSInt64Type, &valuePtr);
          CSDBSqliteBindInt64(a1, *(sqlite3_int64 *)&valuePtr);
        }
        break;
      case 8:
        if (*(_QWORD *)(a2 + 16))
        {
          v6 = MEMORY[0x20BD2A2E4]();
LABEL_18:
          CSDBSqliteBindDouble(a1, v6);
        }
        else
        {
LABEL_19:
          CSDBSqliteBindNull(a1);
        }
        break;
      default:
        return;
    }
  }
}

void CSDBSqliteBindInt(uint64_t a1, int a2)
{
  sqlite3_stmt *v3;
  int v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v3 = *(sqlite3_stmt **)(a1 + 8);
    if (v3)
    {
      v5 = *(_DWORD *)(a1 + 16);
      if (v5 >= 1)
      {
        sqlite3_bind_int(v3, v5, a2);
LABEL_12:
        ++*(_DWORD *)(a1 + 16);
        return;
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("YES");
      if (a1)
      {
        v8 = *(_DWORD *)(a1 + 16);
      }
      else
      {
        v7 = CFSTR("NO");
        v8 = 0;
      }
      v9 = 138412546;
      v10 = v7;
      v11 = 1024;
      v12 = v8;
      _os_log_impl(&dword_20AA57000, v6, OS_LOG_TYPE_INFO, "Invalid parameters passed into CSDBSqliteBindInt s==NULL ? %@  bindIndex = %d", (uint8_t *)&v9, 0x12u);
    }
  }
  if (a1)
    goto LABEL_12;
}

void CSDBSqliteBindBlobFromCFData(uint64_t a1, CFDataRef theData)
{
  const UInt8 *BytePtr;
  int Length;
  NSObject *v6;
  const __CFString *v7;
  const __CFString *v8;
  int v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a1 && theData && *(_QWORD *)(a1 + 8) && *(int *)(a1 + 16) >= 1)
  {
    BytePtr = CFDataGetBytePtr(theData);
    Length = CFDataGetLength(theData);
    sqlite3_bind_blob(*(sqlite3_stmt **)(a1 + 8), *(_DWORD *)(a1 + 16), BytePtr, Length, 0);
LABEL_18:
    ++*(_DWORD *)(a1 + 16);
    return;
  }
  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("NO");
      if (a1)
        v8 = CFSTR("NO");
      else
        v8 = CFSTR("YES");
      if (a1)
        v9 = *(_DWORD *)(a1 + 16);
      else
        v9 = 0;
      if (!theData)
        v7 = CFSTR("YES");
      v10 = 138412802;
      v11 = v8;
      v12 = 1024;
      v13 = v9;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_20AA57000, v6, OS_LOG_TYPE_INFO, "Invalid parameters passed into CSDBSqliteBindBlobFromCFData s==NULL ? %@  bindIndex = %d  data == NULL ? %@", (uint8_t *)&v10, 0x1Cu);
    }
  }
  if (a1)
    goto LABEL_18;
}

void CSDBSqliteBindNull(uint64_t a1)
{
  sqlite3_stmt *v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = *(sqlite3_stmt **)(a1 + 8);
    if (v2)
    {
      v3 = *(_DWORD *)(a1 + 16);
      if (v3 >= 1)
      {
        sqlite3_bind_null(v2, v3);
LABEL_12:
        ++*(_DWORD *)(a1 + 16);
        return;
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = CFSTR("YES");
      if (a1)
      {
        v6 = *(_DWORD *)(a1 + 16);
      }
      else
      {
        v5 = CFSTR("NO");
        v6 = 0;
      }
      v7 = 138412546;
      v8 = v5;
      v9 = 1024;
      v10 = v6;
      _os_log_impl(&dword_20AA57000, v4, OS_LOG_TYPE_INFO, "Invalid parameters passed into CSDBSqliteBindNull s==NULL ? %@  bindIndex = %d", (uint8_t *)&v7, 0x12u);
    }
  }
  if (a1)
    goto LABEL_12;
}

void sub_20AA5CF9C(_QWORD *a1)
{
  const __CFDictionary *v2;
  const __CFDictionary *Copy;
  const void *v4;

  if (a1)
  {
    if (*a1)
    {
      if (a1[1])
      {
        v2 = *(const __CFDictionary **)(*a1 + 40);
        if (v2)
        {
          Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v2);
          CFDictionaryApplyFunction(Copy, (CFDictionaryApplierFunction)sub_20AA5DD40, a1);
          CFRelease(Copy);
          if (*a1)
          {
            v4 = *(const void **)(*a1 + 40);
            if (v4)
            {
              CFRelease(v4);
              *(_QWORD *)(*a1 + 40) = 0;
            }
          }
        }
      }
    }
  }
}

void sub_20AA5D01C(_QWORD *a1)
{
  uint64_t v2;
  const __CFDictionary *v3;
  const __CFDictionary *Copy;
  const __CFDictionary *v5;
  uint64_t v6;
  const void *v7;

  if (a1)
  {
    v2 = *a1;
    if (*a1)
    {
      if (a1[1])
      {
        v3 = *(const __CFDictionary **)(v2 + 24);
        if (v3)
        {
          *(_BYTE *)(v2 + 56) = 1;
          Copy = CFDictionaryCreateCopy(0, v3);
          if (Copy)
          {
            v5 = Copy;
            CFDictionaryApplyFunction(Copy, (CFDictionaryApplierFunction)sub_20AA59AA4, a1);
            CFRelease(v5);
          }
          v6 = *a1;
          *(_BYTE *)(v6 + 56) = 0;
          CFRelease(*(CFTypeRef *)(v6 + 24));
          v2 = *a1;
          *(_QWORD *)(*a1 + 24) = 0;
        }
        v7 = *(const void **)(v2 + 48);
        if (v7)
        {
          CFRelease(v7);
          *(_QWORD *)(*a1 + 48) = 0;
        }
      }
    }
  }
}

sqlite3_stmt *CSDBSqlitePreparedStatement(sqlite3 *db, char *zSql, int a3)
{
  int v6;
  sqlite3_stmt *v7;
  char *v8;
  char *v9;
  char *v10;
  const __CFString *v11;
  UInt8 *v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  const char *v17;
  NSObject *v18;
  int v19;
  uint8_t buf[8];
  sqlite3_stmt *ppStmt;
  int v23;
  _BYTE v24[20];
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  ppStmt = 0;
  if (!db)
    return 0;
  do
    v6 = sqlite3_prepare_v2(db, zSql, -1, &ppStmt, 0);
  while ((v6 - 5) < 2);
  v7 = ppStmt;
  if (v6 || !ppStmt)
  {
    if (a3)
    {
      if (!ppStmt)
        return v7;
    }
    else
    {
      v17 = sqlite3_errmsg(db);
      if (IMOSLoggingEnabled())
      {
        v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = sqlite3_extended_errcode(db);
          v23 = 136315906;
          *(_QWORD *)v24 = "warning: ";
          *(_WORD *)&v24[8] = 2080;
          *(_QWORD *)&v24[10] = zSql;
          *(_WORD *)&v24[18] = 2080;
          v25 = v17;
          v26 = 1024;
          v27 = v19;
          _os_log_impl(&dword_20AA57000, v18, OS_LOG_TYPE_INFO, "%s Could not compile statement %s: %s (%d)\n", (uint8_t *)&v23, 0x26u);
        }
      }
      v7 = ppStmt;
      if (!ppStmt)
        return v7;
    }
    sqlite3_finalize(v7);
    return 0;
  }
  if ((byte_253D84738 & 1) != 0)
  {
    if (!(_BYTE)dword_253D846FC)
      return v7;
  }
  else
  {
    byte_253D84738 = 1;
    v8 = getenv("CSDBSQLEXPLAIN");
    BYTE1(dword_253D846FC) = v8 != 0;
    v9 = getenv("CSDBSQLEXPLAIN_TABLES");
    HIBYTE(dword_253D846FC) = v9 != 0;
    v10 = getenv("CSDBSQLEXPLAIN_ONLY_NON_INDEXED");
    BYTE2(dword_253D846FC) = v10 != 0;
    HIBYTE(dword_253D846FC) = ((unint64_t)v9 | (unint64_t)v10) != 0;
    LOBYTE(dword_253D846FC) = ((unint64_t)v8 | (unint64_t)v9 | (unint64_t)v10) != 0;
    if (!((unint64_t)v8 | (unint64_t)v9 | (unint64_t)v10))
      return v7;
  }
  *(_QWORD *)&v24[4] = zSql;
  *(_QWORD *)&v24[12] = 2863311360;
  *(_DWORD *)v24 = -1431655766;
  v23 = dword_253D846FC;
  v11 = CFStringCreateWithFormat(0, 0, CFSTR("EXPLAIN QUERY PLAN %s"), zSql);
  v12 = CSDBCreateUTF8StringFromCFString(v11);
  sqlite3_exec(db, (const char *)v12, (int (__cdecl *)(void *, int, char **, char **))sub_20AA61DF4, &v23, 0);
  free(v12);
  if (v11)
    CFRelease(v11);
  if (*(_DWORD *)&v24[16])
  {
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20AA57000, v13, OS_LOG_TYPE_INFO, "----------------------------\n", buf, 2u);
      }
    }
    v14 = (*(_DWORD *)&v24[16])--;
    if (v14 >= 2)
    {
      do
      {
        if (IMOSLoggingEnabled())
        {
          v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20AA57000, v15, OS_LOG_TYPE_INFO, "\n", buf, 2u);
          }
        }
      }
      while ((*(_DWORD *)&v24[16])-- > 1);
    }
  }
  return ppStmt;
}

void CSDBRecordInvalidateRecord(uint64_t a1)
{
  int v2;
  int i;
  const void *v4;

  if (!a1)
    sub_20AA66CA8();
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 24) + 72);
  if (v2 >= 1)
  {
    for (i = 0; i != v2; ++i)
      CSDBRecordUnloadProperty(a1, i);
  }
  *(_BYTE *)(a1 + 56) = 1;
  *(_BYTE *)(a1 + 58) = 0;
  v4 = *(const void **)(a1 + 64);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 64) = 0;
  }
  *(_DWORD *)(a1 + 36) = -1;
}

uint64_t CSDBRecordUnloadProperty(uint64_t a1, int a2)
{
  uint64_t v2;
  __CFDictionary *v4;
  const __CFDictionary *v5;
  const void *Value;
  const void *v7;
  BOOL v8;
  void (*v9)(void);
  uint64_t result;
  BOOL v11;
  uint64_t (*v12)(void);

  LODWORD(v2) = a2;
  v4 = *(__CFDictionary **)(a1 + 40);
  if (v4)
    CFDictionaryRemoveValue(v4, (const void *)a2);
  v5 = *(const __CFDictionary **)(a1 + 48);
  if (v5)
  {
    v2 = (int)v2;
    Value = CFDictionaryGetValue(v5, (const void *)(int)v2);
    v7 = (const void *)*MEMORY[0x24BDBD430];
    if (Value)
      v8 = Value == v7;
    else
      v8 = 1;
    if (!v8)
    {
      v9 = *(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 80) + 40 * (int)v2 + 16) + 8);
      if (v9)
        v9();
    }
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 48), (const void *)(int)v2);
  }
  else
  {
    v7 = (const void *)*MEMORY[0x24BDBD430];
    v2 = (int)v2;
  }
  result = *(_QWORD *)(a1 + 8 * (v2 + 9));
  if (result)
    v11 = result == (_QWORD)v7;
  else
    v11 = 1;
  if (!v11)
  {
    v12 = *(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 80) + 40 * (int)v2 + 16) + 8);
    if (v12)
      result = v12();
  }
  *(_QWORD *)(a1 + 8 * (v2 + 9)) = 0;
  return result;
}

uint64_t CSDBPerformLockedSectionForRecordStore(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (result && a2)
  {
    v2 = *(_QWORD *)(result + 8);
    if (v2)
      return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v2);
  }
  return result;
}

void CSDBRecordStoreRemoveRecord(uint64_t a1, uint64_t a2)
{
  if (!a2)
    sub_20AA66F00();
  sub_20AA5968C(a1, a2, *(void **)(a2 + 24), *(_DWORD *)(a2 + 32));
}

uint64_t CSDBPerformBlockAfterDelay(void *a1, const char *a2)
{
  return objc_msgSend_performBlock_afterDelay_(a1, a2, (uint64_t)a2);
}

void CSDBRecordDestroy(void *context)
{
  void (*v2)(void *);
  const void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  uint64_t v9;
  const __CFDictionary *v11;
  const void *v12;

  v2 = *(void (**)(void *))(*((_QWORD *)context + 3) + 24);
  if (v2)
    v2(context);
  v3 = (const void *)*((_QWORD *)context + 5);
  if (v3)
    CFRelease(v3);
  v4 = *((_QWORD *)context + 3);
  if (*(int *)(v4 + 72) >= 1)
  {
    v5 = 0;
    v6 = *MEMORY[0x24BDBD430];
    v7 = 16;
    do
    {
      v8 = *(void (**)(void))(*(_QWORD *)(*(_QWORD *)(v4 + 80) + v7) + 8);
      if (v8)
      {
        v9 = *((_QWORD *)context + v5 + 9);
        if (v9 && v9 != v6)
        {
          v8();
          v4 = *((_QWORD *)context + 3);
        }
      }
      ++v5;
      v7 += 40;
    }
    while (v5 < *(int *)(v4 + 72));
  }
  v11 = (const __CFDictionary *)*((_QWORD *)context + 6);
  if (v11)
  {
    CFDictionaryApplyFunction(v11, (CFDictionaryApplierFunction)sub_20AA5DFB0, context);
    CFRelease(*((CFTypeRef *)context + 6));
  }
  v12 = (const void *)*((_QWORD *)context + 8);
  if (v12)
    CFRelease(v12);
}

uint64_t CSDBSqliteDatabaseFromThreadedRecordStoreRef(uint64_t a1)
{
  uint64_t v1;

  if (a1 && (v1 = *(_QWORD *)(a1 + 8)) != 0)
    return CSDBRecordStoreGetDatabase(v1);
  else
    return 0;
}

uint64_t CSDBRecordCreate(uint64_t a1)
{
  return sub_20AA59880(a1, -1);
}

void CSDBRecordStoreAddRecord(uint64_t a1, void **a2)
{
  sub_20AA5923C(a1, a2, 0);
}

void sub_20AA5D6FC(uint64_t a1, uint64_t a2, int a3)
{
  *(_DWORD *)(a2 + 36) = a3;
}

void sub_20AA5D704(uint64_t a1, uint64_t a2)
{
  CSDBRecordInvalidateRecord(a2);
}

uint64_t sub_20AA5D70C(uint64_t a1)
{
  uint64_t Database;
  uint64_t v3;
  uint64_t v4;

  if (!a1)
    sub_20AA66AC8();
  Database = CSDBRecordStoreGetDatabase(a1);
  if (!Database)
    return 0;
  v3 = CSDBSqliteDatabaseConnectionForReading(Database);
  v4 = v3;
  if (v3 && *(_DWORD *)(a1 + 96) == -1)
    *(_DWORD *)(a1 + 96) = CSDBSqliteConnectionIntegerForProperty(v3, CFSTR("__CSDBRecordSequenceNumber"));
  return v4;
}

uint64_t CSDBThreadedRecordStoreTeardownDatabase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](a1, sel_teardownDatabase, a3);
}

sqlite3_int64 CSDBSqliteStatementInteger64Result(sqlite3_stmt **a1, int *a2)
{
  sqlite3_stmt *v4;
  sqlite3_int64 v5;
  sqlite3 *v6;

  if (!a1)
    return 0;
  v4 = a1[1];
  if (!v4)
    return 0;
  if (CSDBSqliteStepWithConnection((int)*a1, v4) == 100)
    v5 = sqlite3_column_int64(a1[1], 0);
  else
    v5 = 0;
  if (*a1)
  {
    if (a2)
    {
      v6 = (sqlite3 *)*((_QWORD *)*a1 + 1);
      if (v6)
        *a2 = sqlite3_errcode(v6);
    }
  }
  return v5;
}

void CSDBSqliteDatabaseClose(uint64_t a1)
{
  uint64_t v2;
  sqlite3_stmt **v3;
  sqlite3_stmt **v4;
  sqlite3_int64 v5;
  sqlite3_int64 v6;
  uint64_t v7;
  double v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  const __CFString *v12;
  const char *CStringPtr;
  int v14;
  int v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  _QWORD *v21;
  const void *v22;
  char *errmsg;
  int v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 8))
    goto LABEL_45;
  v2 = CSDBSqliteDatabaseConnectionForWritingWithOwnership(a1, 1);
  v3 = (sqlite3_stmt **)sub_20AA5B910(v2, CFSTR("PRAGMA page_count"), 0);
  v4 = (sqlite3_stmt **)sub_20AA5B910(v2, CFSTR("PRAGMA freelist_count"), 0);
  v24 = 0;
  v5 = CSDBSqliteStatementInteger64Result(v3, &v24);
  if (v24 && v24 != 100)
  {
    if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v26 = v24;
        v10 = "SQLite error %d while attempting to get page_count.  Bailing on the incremental vacuum.";
LABEL_26:
        _os_log_impl(&dword_20AA57000, v9, OS_LOG_TYPE_INFO, v10, buf, 8u);
      }
    }
  }
  else
  {
    v24 = 0;
    v6 = CSDBSqliteStatementInteger64Result(v4, &v24);
    if (!v24 || v24 == 100)
    {
      if (_IMWillLog())
        _IMAlwaysLog();
      if (_IMWillLog())
        _IMAlwaysLog();
      if (_IMWillLog())
        _IMAlwaysLog();
      v7 = v5 - v6;
      if (_IMWillLog())
        _IMAlwaysLog();
      v8 = (double)v7 / (double)v5;
      if (_IMWillLog())
        _IMAlwaysLog();
      if (v8 > 0.85 && v6 <= 511)
      {
        if (_IMWillLog())
          _IMAlwaysLog();
        goto LABEL_43;
      }
      v11 = (uint64_t)((double)v6 * 0.2);
      if (v8 < 0.4)
        v11 = v6 - v7;
      if (v11 < 1)
        goto LABEL_43;
      errmsg = 0;
      v12 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("PRAGMA incremental_vacuum(%lld)"), v11);
      CStringPtr = CFStringGetCStringPtr(v12, 0x8000100u);
      v14 = sqlite3_exec(*(sqlite3 **)(*(_QWORD *)(a1 + 8) + 8), CStringPtr, 0, 0, &errmsg);
      v15 = v14;
      if (v14 && v14 != 101)
      {
        if (!IMOSLoggingEnabled())
          goto LABEL_39;
        v20 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          goto LABEL_39;
        *(_DWORD *)buf = 67109378;
        v26 = v15;
        v27 = 2080;
        v28 = errmsg;
        v17 = "Unable to incrementally vacuum database. SQLiteResult: %d Error Message: %s";
        v18 = v20;
        v19 = 18;
      }
      else
      {
        if (!IMOSLoggingEnabled())
          goto LABEL_39;
        v16 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          goto LABEL_39;
        *(_WORD *)buf = 0;
        v17 = "Incremental vacuum was successful.";
        v18 = v16;
        v19 = 2;
      }
      _os_log_impl(&dword_20AA57000, v18, OS_LOG_TYPE_INFO, v17, buf, v19);
LABEL_39:
      if (errmsg)
        free(errmsg);
      if (v12)
        CFRelease(v12);
      goto LABEL_43;
    }
    if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v26 = v24;
        v10 = "SQLite error %d while attempting to get freelist_count.  Bailing on the incremental vacuum.";
        goto LABEL_26;
      }
    }
  }
LABEL_43:
  v21 = *(_QWORD **)(a1 + 8);
  if (v21)
  {
    sub_20AA618D8(v21);
    *(_QWORD *)(a1 + 8) = 0;
  }
LABEL_45:
  CFRelease(*(CFTypeRef *)a1);
  v22 = *(const void **)(a1 + 176);
  if (v22)
    CFRelease(v22);
  free((void *)a1);
}

void CSDBRecordStoreDestroy(void *a1)
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  const void *v4;
  uint64_t v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  void *v10;

  v2 = (const __CFDictionary *)*((_QWORD *)a1 + 2);
  if (v2)
  {
    CFDictionaryApplyFunction(v2, (CFDictionaryApplierFunction)sub_20AA5EA24, 0);
    CFRelease(*((CFTypeRef *)a1 + 2));
  }
  v3 = (const __CFDictionary *)*((_QWORD *)a1 + 3);
  if (v3)
  {
    CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)sub_20AA5EA38, 0);
    CFRelease(*((CFTypeRef *)a1 + 3));
  }
  v4 = (const void *)*((_QWORD *)a1 + 6);
  if (v4)
    CFRelease(v4);
  v5 = *((_QWORD *)a1 + 1);
  if (v5)
    CSDBSqliteDatabaseClose(v5);
  v6 = (const void *)*((_QWORD *)a1 + 4);
  if (v6)
    CFRelease(v6);
  v7 = (const void *)*((_QWORD *)a1 + 5);
  if (v7)
    CFRelease(v7);
  if (*(_QWORD *)a1)
    CFRelease(*(CFTypeRef *)a1);
  v8 = (const void *)*((_QWORD *)a1 + 9);
  if (v8)
    CFRelease(v8);
  v9 = (const void *)*((_QWORD *)a1 + 15);
  if (v9)
    CFRelease(v9);
  v10 = (void *)*((_QWORD *)a1 + 14);
  if (v10)
    free(v10);
  free(a1);
}

void sub_20AA5DD40(uint64_t a1, CFDictionaryRef theDict, _QWORD *a3)
{
  a3[2] = a1;
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_20AA59460, a3);
}

void sub_20AA5DD58(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 16);
  if (v1)
    CFRelease(v1);
}

uint64_t CSDBPerformLocked(uint64_t result, uint64_t a2)
{
  if (result && a2)
  {
    if (*(_QWORD *)(result + 8))
      return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  }
  return result;
}

uint64_t sub_20AA5DE84(int a1)
{
  return fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%d", a1);
}

uint64_t CSDBRecordGetTypeID()
{
  pthread_once(&stru_253D84698, (void (*)(void))sub_20AA5DEE8);
  return qword_253D84728;
}

CFDataRef sub_20AA5DEE8()
{
  CFDataRef result;

  qword_253D84728 = _CFRuntimeRegisterClass();
  result = CFDataCreate(0, 0, 0);
  qword_253D84720 = (uint64_t)result;
  return result;
}

uint64_t CSDBRecordGetSequenceNumber(uint64_t a1)
{
  return *(int *)(a1 + 36);
}

uint64_t CSDBRecordCreateCopy(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = sub_20AA59880(v2, *(_DWORD *)(a1 + 32));
  v4 = v3;
  if (v3)
    *(_BYTE *)(v3 + 56) = *(_BYTE *)(a1 + 56);
  v5 = *(unsigned int *)(v2 + 72);
  if ((int)v5 >= 1)
  {
    v6 = 0;
    v7 = a1 + 72;
    do
    {
      sub_20AA5AEBC(v4, v6, *(_QWORD *)(v7 + 8 * v6), 1);
      ++v6;
    }
    while (v5 != v6);
  }
  return v4;
}

uint64_t CSDBRecordGetClass(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

uint64_t sub_20AA5DFB0(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  if (*MEMORY[0x24BDBD430] != a2 && a2)
  {
    v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) + 80)
                                                       + 40 * (int)result
                                                       + 16)
                                           + 8);
    if (v3)
      return v3(a2);
  }
  return result;
}

uint64_t CSDBRecordInitializeProperty(uint64_t a1, int a2, uint64_t a3)
{
  return sub_20AA5AEBC(a1, a2, a3, 0);
}

CFArrayRef CSDBRecordCopyChangedProperties(uint64_t a1)
{
  const __CFDictionary *v2;
  CFIndex Count;
  CFIndex v4;
  const void **v5;
  CFArrayRef v6;

  if (!a1)
    sub_20AA669D8();
  v2 = *(const __CFDictionary **)(a1 + 40);
  if (!v2)
    return 0;
  Count = CFDictionaryGetCount(v2);
  if (Count < 1)
    return 0;
  v4 = Count;
  v5 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 40), v5, 0);
  v6 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v5, v4, 0);
  free(v5);
  return v6;
}

void sub_20AA5E09C(_QWORD *key, int a2)
{
  uint64_t v2;
  const __CFDictionary *Mutable;
  const void *v6;

  v2 = key[2];
  if (!v2)
    sub_20AA66AA0();
  Mutable = *(const __CFDictionary **)(v2 + 32);
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], 0);
    *(_QWORD *)(key[2] + 32) = Mutable;
  }
  v6 = (const void *)(CFDictionaryGetValue(Mutable, key) | a2);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(key[2] + 32), key, v6);
}

uint64_t CSDBRecordCopyProperty(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t (**v4)(void);

  v2 = a2;
  if (CSDBRecordGetProperty(a1, a2)
    && (v4 = *(uint64_t (***)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 80) + 40 * v2 + 16), *v4))
  {
    return (*v4)();
  }
  else
  {
    return 0;
  }
}

uint64_t CSDBRecordShow(_QWORD *a1)
{
  uint64_t v2;
  uint64_t (*v3)(_QWORD *);
  uint64_t result;
  uint64_t v5;
  FILE **v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t Property;
  uint64_t v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  CFStringRef v13;
  const __CFString *v14;
  char __b[2048];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = a1[3];
  v3 = *(uint64_t (**)(_QWORD *))(v2 + 40);
  if (v3)
    return v3(a1);
  v5 = *(unsigned int *)(v2 + 72);
  v6 = (FILE **)MEMORY[0x24BDAC8D8];
  result = fprintf((FILE *)*MEMORY[0x24BDAC8D8], "CSDBRecord/%s instance %p:\n", *(const char **)v2, a1);
  if ((int)v5 >= 1)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      Property = CSDBRecordGetProperty((uint64_t)a1, v8);
      fprintf(*v6, " %s (%d) = ", *(const char **)(*(_QWORD *)(a1[3] + 80) + v7), v8);
      v10 = *(_QWORD *)(a1[3] + 80);
      if (Property && (v11 = *(void (**)(uint64_t))(*(_QWORD *)(v10 + v7 + 16) + 16)) != 0)
      {
        v11(Property);
      }
      else
      {
        v12 = *(_QWORD *)(v10 + v7 + 8);
        if (v12 == 1)
        {
          v13 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), Property);
          if (v13)
          {
            v14 = v13;
            memset(__b, 170, sizeof(__b));
            CFStringGetCString(v14, __b, 2048, 0x8000100u);
            fputs(__b, *v6);
            CFRelease(v14);
          }
          else
          {
            fwrite("(nil)", 5uLL, 1uLL, *v6);
          }
        }
        else if (v12)
        {
          fprintf(*v6, "%p");
        }
        else
        {
          fprintf(*v6, "%d");
        }
      }
      result = fputc(10, *v6);
      v8 = (v8 + 1);
      v7 += 40;
    }
    while (40 * v5 != v7);
  }
  return result;
}

uint64_t CSDBRecordGetPropertyDescriptor(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  if ((a2 & 0x80000000) != 0)
    return 0;
  v2 = *(_QWORD *)(a1 + 24);
  if (*(_DWORD *)(v2 + 72) <= (signed int)a2)
    return 0;
  else
    return *(_QWORD *)(v2 + 80) + 40 * a2;
}

uint64_t CSDBRecordGetStore(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

void CSDBRecordMarkChanged(_QWORD *key)
{
  uint64_t v2;

  if (!key)
    sub_20AA66AF0();
  v2 = key[2];
  if (v2)
  {
    if ((*(_BYTE *)(v2 + 57) & 1) == 0
      || (*(_BYTE *)(key[3] + 56) & 2) == 0
      || (sub_20AA5E09C(key, 1), (v2 = key[2]) != 0))
    {
      if ((*(_BYTE *)(v2 + 57) & 2) != 0 && (*(_BYTE *)(key[3] + 56) & 8) != 0)
        sub_20AA5E09C(key, 4);
    }
  }
}

uint64_t CSDBRecordStoreSetContext(uint64_t result, uint64_t a2)
{
  if (result)
    *(_QWORD *)(result + 88) = a2;
  return result;
}

uint64_t CSDBRecordStoreGetContext(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 88);
  return result;
}

void CSDBRecordStoreSetValueForProperty(uint64_t a1, void *key, const void *a3)
{
  __CFDictionary *Mutable;
  const void *v7;

  if (!a1)
    sub_20AA66B18();
  Mutable = *(__CFDictionary **)(a1 + 80);
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    *(_QWORD *)(a1 + 80) = Mutable;
    if (!Mutable)
      sub_20AA66B40();
  }
  if (a3)
    v7 = a3;
  else
    v7 = (const void *)*MEMORY[0x24BDBD430];
  CFDictionarySetValue(Mutable, key, v7);
}

CFStringRef CSDBRecordStoreCopyValueForProperty(uint64_t a1, const __CFString *key)
{
  const __CFDictionary *v4;
  const __CFString *Value;
  CFStringRef v6;
  uint64_t Database;

  if (!a1)
    sub_20AA66B68();
  v4 = *(const __CFDictionary **)(a1 + 80);
  if (v4)
  {
    Value = (const __CFString *)CFDictionaryGetValue(v4, key);
    if (Value)
    {
      v6 = Value;
      CFRetain(Value);
LABEL_7:
      if ((CFStringRef)*MEMORY[0x24BDBD430] == v6)
      {
        CFRelease(v6);
        return 0;
      }
      return v6;
    }
  }
  Database = CSDBRecordStoreGetDatabase(a1);
  if (!Database)
    return 0;
  v6 = CSDBSqliteDatabaseCopyValueForProperty(Database, key);
  if (v6)
    goto LABEL_7;
  return v6;
}

uint64_t CSDBRecordIndexOfPropertyNamed(const char **a1, int a2, char *__s1)
{
  uint64_t v5;
  uint64_t v6;

  if (a2 < 1)
    return 0;
  v5 = 0;
  v6 = a2;
  while (strcmp(__s1, *a1))
  {
    ++v5;
    a1 += 5;
    if (v6 == v5)
      return v6;
  }
  return v5;
}

_DWORD *CSDBRecordStoreCreateWithPath(const __CFString *a1)
{
  _DWORD *v2;

  v2 = malloc_type_calloc(1uLL, 0x80uLL, 0x10F0040F8EA1033uLL);
  if (v2)
  {
    *(_QWORD *)v2 = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], a1);
    v2[24] = -1;
  }
  return v2;
}

uint64_t CSDBRecordStoreSetSetupHandler(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (!a1)
    sub_20AA66BE0();
  *(_QWORD *)(a1 + 64) = a2;
  result = *(_QWORD *)(a1 + 8);
  if (result)
    return CSDBSqliteDatabaseSetSetupHandler(result, (uint64_t)sub_20AA5E670, a1);
  return result;
}

void sub_20AA5E670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v5)(uint64_t, uint64_t);
  const __CFSet *v6;
  _QWORD v7[2];

  if (!a1 || !a2 || !a3)
    sub_20AA66C08();
  v5 = *(void (**)(uint64_t, uint64_t))(a3 + 64);
  if (v5)
  {
    v5(a3, a2);
  }
  else
  {
    CSDBSqliteDatabaseDefaultSetupHandler();
    v6 = *(const __CFSet **)(a3 + 72);
    if (v6)
    {
      v7[0] = a3;
      v7[1] = a2;
      CFSetApplyFunction(v6, (CFSetApplierFunction)sub_20AA5FABC, v7);
    }
  }
}

uint64_t CSDBRecordStoreLogChanges(uint64_t result, char a2)
{
  if (!result)
    sub_20AA66C30();
  *(_BYTE *)(result + 57) = *(_BYTE *)(result + 57) & 0xFE | a2;
  return result;
}

uint64_t CSDBRecordStoreLogBasicChanges(uint64_t result, int a2)
{
  char v2;

  if (!result)
    sub_20AA66C58();
  if (a2)
    v2 = 2;
  else
    v2 = 0;
  *(_BYTE *)(result + 57) = *(_BYTE *)(result + 57) & 0xFD | v2;
  return result;
}

uint64_t CSDBRecordStoreIsLoggingChanges(uint64_t a1)
{
  if (!a1)
    sub_20AA66C80();
  return *(_BYTE *)(a1 + 57) & 1;
}

uint64_t CSDBRecordStoreProcessAddedRecordsWithPolicyAndTransactionType(uint64_t a1, int a2, unsigned int a3, CFErrorRef *a4)
{
  return sub_20AA5E77C(a1, 1, a2, a3, a4);
}

uint64_t sub_20AA5E77C(uint64_t result, int a2, int a3, unsigned int a4, CFErrorRef *a5)
{
  uint64_t v9;
  uint64_t Database;
  uint64_t v11;
  int v12;
  int v13;
  CFErrorRef v14;
  _QWORD v15[3];

  if (result)
  {
    v9 = result;
    Database = CSDBRecordStoreGetDatabase(result);
    result = CSDBSqliteDatabaseConnectionForWriting(Database);
    if (result)
    {
      v11 = result;
      CSDBSqliteConnectionBeginTransactionType(result, a4);
      v12 = CSDBSqliteConnectionIntegerForProperty(v11, CFSTR("__CSDBRecordSequenceNumber"));
      if (!a3 || (v13 = *(_DWORD *)(v9 + 96), v13 == -1) || v12 == v13)
      {
        v15[1] = v11;
        v15[2] = 0;
        v15[0] = v9;
        if (a2)
          sub_20AA5D01C(v15);
        else
          sub_20AA5CF9C(v15);
        return 1;
      }
      else if (a5)
      {
        v14 = CFErrorCreate(0, CFSTR("CSDBRecord"), 2, 0);
        result = 0;
        *a5 = v14;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CSDBRecordStoreProcessDeletedRecordsWithPolicyAndTransactionType(uint64_t a1, int a2, unsigned int a3, CFErrorRef *a4)
{
  return sub_20AA5E77C(a1, 0, a2, a3, a4);
}

uint64_t CSDBRecordStoreProcessAddedRecordsWithPolicy(uint64_t a1, int a2, CFErrorRef *a3)
{
  return sub_20AA5E77C(a1, 1, a2, 0, a3);
}

uint64_t CSDBRecordStoreProcessAddedRecords(uint64_t a1, CFErrorRef *a2)
{
  return sub_20AA5E77C(a1, 1, 0, 0, a2);
}

uint64_t CSDBRecordStoreGetLastSequenceNumber(uint64_t a1)
{
  if (a1)
    return *(int *)(a1 + 96);
  else
    return -1;
}

uint64_t CSDBRecordStoreGetRowidForRecordID(uint64_t a1, int a2)
{
  if (!a1)
    return -1;
  if (a2 >= -1)
    return a2;
  if ((a2 & 0x7FFFFFFF) < *(_DWORD *)(a1 + 104))
    return *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8 * (a2 & 0x7FFFFFFF));
  else
    return -1;
}

CFArrayRef CSDBRecordStoreCopyAddedRecords(uint64_t a1)
{
  return sub_20AA5E8F0(*(const __CFDictionary **)(a1 + 24), MEMORY[0x24BDBD690]);
}

CFArrayRef sub_20AA5E8F0(const __CFDictionary *a1, const CFArrayCallBacks *a2)
{
  CFIndex Count;
  CFIndex v5;
  const void **v6;
  CFArrayRef v7;

  if (!a1)
    return 0;
  Count = CFDictionaryGetCount(a1);
  if (Count < 1)
    return 0;
  v5 = Count;
  v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues(a1, v6, 0);
  v7 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v6, v5, a2);
  free(v6);
  return v7;
}

CFArrayRef CSDBRecordStoreCopyChangedRecords(uint64_t a1)
{
  return sub_20AA5E8F0(*(const __CFDictionary **)(a1 + 32), MEMORY[0x24BDBD690]);
}

CFArrayRef CSDBRecordStoreCopyDeletedRecordIDsOfClass(uint64_t a1, const void *a2)
{
  const __CFDictionary *Value;

  Value = *(const __CFDictionary **)(a1 + 40);
  if (Value)
    Value = (const __CFDictionary *)CFDictionaryGetValue(Value, a2);
  return sub_20AA5E8F0(Value, 0);
}

uint64_t CSDBRecordStoreSaveWithCallbackAndTransactionType(uint64_t a1, void (*a2)(uint64_t, uint64_t *), int a3, unsigned int a4, CFErrorRef *a5)
{
  return CSDBRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(a1, a2, 0, a3, a4, a5);
}

uint64_t sub_20AA5E9D0(const __CFString *a1, const __CFString *a2, uint64_t a3)
{
  _QWORD *v4;
  const __CFString *v5;

  if (!a3 || !a1 || (v4 = *(_QWORD **)(a3 + 8)) == 0)
    sub_20AA66CF8();
  if ((const __CFString *)*MEMORY[0x24BDBD430] == a2)
    v5 = 0;
  else
    v5 = a2;
  return CSDBSqliteConnectionSetValueForProperty(v4, a1, v5);
}

uint64_t CSDBRecordStoreSaveWithCallback(uint64_t a1, void (*a2)(uint64_t, uint64_t *), int a3, CFErrorRef *a4)
{
  return CSDBRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(a1, a2, 0, a3, 0, a4);
}

void sub_20AA5EA24(int a1, CFDictionaryRef theDict)
{
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_20AA601EC, 0);
}

uint64_t sub_20AA5EA38(uint64_t result)
{
  *(_QWORD *)(result + 16) = 0;
  return result;
}

void CSDBRecordStoreCreateTablesForClass(uint64_t a1, uint64_t a2, int a3)
{
  char v6;
  CFMutableStringRef MutableCopy;
  uint64_t v8;
  unsigned __int8 v9;
  int *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const void *v14;
  const __CFString *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  const __CFString *v24;
  int v25;
  __CFString *Mutable;
  __CFString *v27;
  uint64_t i;
  uint64_t v29;
  uint64_t v30;
  int *v31;
  int v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  int v38;
  char v39;
  CFMutableStringRef v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  int v45;
  const __CFString *v46;
  unint64_t v47;
  CFMutableStringRef v48;
  const __CFAllocator *alloc;
  char v50;
  int v51;
  uint64_t v52;

  if (!a1)
    sub_20AA66D20();
  if (!a2)
    sub_20AA66D48();
  v6 = *(_BYTE *)(a1 + 56);
  alloc = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("CREATE TABLE IF NOT EXISTS "));
  CFStringAppendCString(MutableCopy, *(const char **)a1, 0x8000100u);
  v8 = *(unsigned int *)(a1 + 120);
  v52 = a2;
  v50 = v6;
  v51 = a3;
  if ((int)v8 < 1)
    goto LABEL_10;
  v9 = 0;
  v10 = (int *)(*(_QWORD *)(a1 + 128) + 8);
  do
  {
    if (*v10 <= 0)
      sub_20AA66D70();
    v11 = *((_QWORD *)v10 - 1);
    if (((v11 == 1) & v9) == 1)
      sub_20AA66D98();
    v9 |= v11 == 1;
    v10 += 6;
    --v8;
  }
  while (v8);
  if ((v9 & 1) != 0)
  {
    CFStringAppend(MutableCopy, CFSTR(" ("));
  }
  else
  {
LABEL_10:
    v12 = (void *)CFRetain(CFSTR("ROWID"));
    v13 = *(const char **)(a1 + 96);
    if (v13)
      v12 = (void *)CFStringCreateWithCString(0, v13, 0x600u);
    v14 = v12;
    CFStringAppendFormat(MutableCopy, 0, CFSTR(" (%@ INTEGER PRIMARY KEY"), v12, alloc);
    if ((v6 & 1) != 0)
      v15 = CFSTR(" AUTOINCREMENT, ");
    else
      v15 = CFSTR(", ");
    CFStringAppend(MutableCopy, v15);
    CFRelease(v14);
  }
  v16 = *(_DWORD *)(a1 + 72);
  if (v16 >= 1)
  {
    v17 = 0;
    v18 = 0;
    v19 = 1;
    while (1)
    {
      v20 = *(_QWORD *)(a1 + 80);
      v21 = v20 + v17;
      if ((*(_BYTE *)(v20 + v17 + 24) & 4) == 0)
        break;
LABEL_30:
      ++v18;
      v17 += 40;
      if (v18 >= v16)
        goto LABEL_36;
    }
    if ((v19 & 1) == 0)
      CFStringAppend(MutableCopy, CFSTR(", "));
    v22 = v20 + v17;
    CFStringAppendCString(MutableCopy, *(const char **)v22, 0x8000100u);
    v23 = *(_QWORD *)(v22 + 8);
    v24 = CFSTR(" TEXT");
    if (v23 <= 3)
      v24 = off_24C35A108[v23];
    CFStringAppend(MutableCopy, v24);
    v25 = *(_DWORD *)(v21 + 24);
    if ((v25 & 0xE0) == 0)
      goto LABEL_28;
    Mutable = CFStringCreateMutable(0, 0);
    v27 = Mutable;
    if ((v25 & 0x20) != 0)
    {
      CFStringAppend(Mutable, CFSTR(" UNIQUE"));
      if ((v25 & 0x40) == 0)
      {
LABEL_26:
        if ((v25 & 0x80) == 0)
          goto LABEL_27;
        goto LABEL_34;
      }
    }
    else if ((v25 & 0x40) == 0)
    {
      goto LABEL_26;
    }
    CFStringAppend(v27, CFSTR(" NOT NULL"));
    if ((v25 & 0x80) == 0)
    {
LABEL_27:
      if (v27)
      {
LABEL_29:
        CFStringAppend(MutableCopy, v27);
        CFRelease(v27);
        v19 = 0;
        v16 = *(_DWORD *)(a1 + 72);
        goto LABEL_30;
      }
LABEL_28:
      v27 = (__CFString *)CFRetain(&stru_24C35A5D0);
      goto LABEL_29;
    }
LABEL_34:
    CFStringAppend(v27, CFSTR(" DEFAULT 0"));
    if (v27)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_36:
  if (*(int *)(a1 + 120) >= 1)
  {
    for (i = 0; i < *(int *)(a1 + 120); ++i)
    {
      v29 = *(_QWORD *)(a1 + 128);
      v30 = v29 + 24 * i;
      v32 = *(_DWORD *)(v30 + 8);
      v31 = (int *)(v30 + 8);
      if (v32 <= 0)
        sub_20AA66DC0();
      v33 = *(_QWORD *)(v29 + 24 * i);
      if (v33 == 1)
      {
        v34 = CFSTR(", PRIMARY KEY (");
      }
      else
      {
        if (v33 != 2)
          goto LABEL_44;
        v34 = CFSTR(", UNIQUE (");
      }
      CFStringAppend(MutableCopy, v34);
      if (*v31 >= 1)
      {
LABEL_44:
        v35 = 0;
        v36 = (_QWORD *)(v29 + 24 * i + 16);
        do
        {
          if (v35)
            CFStringAppend(MutableCopy, CFSTR(", "));
          CFStringAppendCString(MutableCopy, *(const char **)(*(_QWORD *)(a1 + 80) + 40 * *(int *)(*v36 + 4 * v35++)), 0x8000100u);
        }
        while (v35 < *v31);
      }
      CFStringAppend(MutableCopy, CFSTR(")"));
    }
  }
  CFStringAppend(MutableCopy, CFSTR(");"));
  v37 = v52;
  CSDBSqliteConnectionPerformSQL(v52, MutableCopy);
  CFRelease(MutableCopy);
  v39 = v50;
  v38 = v51;
  if (v51 && (v50 & 2) != 0)
  {
    v40 = CFStringCreateMutableCopy(alloc, 0, CFSTR("CREATE TABLE IF NOT EXISTS "));
    CFStringAppendCString(v40, *(const char **)a1, 0x8000100u);
    CFStringAppend(v40, CFSTR("Changes (record INTEGER, type INTEGER"));
    if (*(int *)(a1 + 72) >= 1)
    {
      v41 = 0;
      v42 = 0;
      while (1)
      {
        v43 = *(_QWORD *)(a1 + 80) + v41;
        v44 = *(const char **)v43;
        v45 = *(_DWORD *)(v43 + 24);
        if ((v45 & 2) != 0)
          break;
        if ((v45 & 8) != 0)
        {
          CFStringAppend(v40, CFSTR(", "));
          CFStringAppendCString(v40, v44, 0x8000100u);
          v46 = CFSTR(" INTEGER");
LABEL_58:
          CFStringAppend(v40, v46);
        }
        ++v42;
        v41 += 40;
        if (v42 >= *(int *)(a1 + 72))
          goto LABEL_60;
      }
      v47 = *(_QWORD *)(v43 + 8);
      CFStringAppend(v40, CFSTR(", "));
      CFStringAppendCString(v40, v44, 0x8000100u);
      v46 = CFSTR(" TEXT");
      if (v47 < 4)
        v46 = off_24C35A108[v47];
      goto LABEL_58;
    }
LABEL_60:
    CFStringAppend(v40, CFSTR(");"));
    v37 = v52;
    CSDBSqliteConnectionPerformSQL(v52, v40);
    CFRelease(v40);
    v39 = v50;
    v38 = v51;
  }
  if (v38)
  {
    if ((v39 & 8) != 0)
    {
      v48 = CFStringCreateMutableCopy(alloc, 0, CFSTR("CREATE TABLE IF NOT EXISTS "));
      CFStringAppendCString(v48, *(const char **)a1, 0x8000100u);
      CFStringAppend(v48, CFSTR("BasicChanges (record INTEGER PRIMARY KEY, type INTEGER, sequenceNumber INTEGER);"));
      CSDBSqliteConnectionPerformSQL(v37, v48);
      CFRelease(v48);
    }
  }
}

void CSDBRecordStoreRegisterClass(uint64_t a1, void *value)
{
  __CFSet *Mutable;

  if (!a1 || !value)
    sub_20AA66DE8();
  Mutable = *(__CFSet **)(a1 + 72);
  if (!Mutable)
  {
    Mutable = CFSetCreateMutable(0, 0, 0);
    *(_QWORD *)(a1 + 72) = Mutable;
    if (!Mutable)
      sub_20AA66E10();
  }
  CFSetAddValue(Mutable, value);
}

CFMutableStringRef CSDBRecordStoreCreateSelectPrefixFromRecordDescriptor(uint64_t a1)
{
  return sub_20AA5F32C(a1, 0, 0, 0, 0);
}

CFMutableStringRef CSDBRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(uint64_t a1, CFArrayRef theArray)
{
  return sub_20AA5F32C(a1, 0, 0, theArray, 0);
}

CFMutableStringRef CSDBRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumn(uint64_t a1, void *a2)
{
  const __CFArray *v3;
  CFMutableStringRef v4;
  void *values;

  values = a2;
  if (!a2)
    return sub_20AA5F32C(a1, 0, 0, 0, 0);
  v3 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&values, 1, 0);
  v4 = sub_20AA5F32C(a1, 0, 0, v3, 0);
  if (v3)
    CFRelease(v3);
  return v4;
}

__CFString *CSDBRecordStoreCreateColumnListFromRecordDescriptor(uint64_t a1)
{
  return sub_20AA5F0C4(a1, 0, 0, 0, 0);
}

__CFString *sub_20AA5F0C4(uint64_t a1, int a2, CFStringRef theString, CFMutableDictionaryRef *a4, const __CFArray *a5)
{
  const __CFString *v7;
  const __CFAllocator *v10;
  __CFString *MutableCopy;
  __CFString *v12;
  uint64_t v13;
  char *v14;
  int v15;
  int v16;
  int Count;
  CFIndex v18;
  uint64_t v19;
  const __CFString *ValueAtIndex;

  v7 = theString;
  if (theString)
  {
    if (CFStringGetLength(theString) && CFStringGetLength(v7))
      v7 = CFStringCreateWithFormat(0, 0, CFSTR("%@."), v7);
    else
      v7 = 0;
  }
  v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("SELECT "));
  v12 = MutableCopy;
  if (a2)
    CFStringAppend(MutableCopy, CFSTR("DISTINCT "));
  if (v7)
    CFStringAppend(v12, v7);
  CFStringAppend(v12, CFSTR("ROWID"));
  if (a4)
    *a4 = CFDictionaryCreateMutable(v10, 0, 0, 0);
  if (*(int *)(a1 + 72) >= 1)
  {
    v13 = 0;
    v14 = 0;
    v15 = 1;
    do
    {
      v16 = *(_DWORD *)(*(_QWORD *)(a1 + 80) + v13 + 24);
      if ((v16 & 4) == 0)
      {
        if ((v16 & 1) != 0)
        {
          if (!a4)
            CFStringAppend(v12, CFSTR(", NULL"));
        }
        else
        {
          CFStringAppend(v12, CFSTR(", "));
          if (v7)
            CFStringAppend(v12, v7);
          CFStringAppendCString(v12, *(const char **)(*(_QWORD *)(a1 + 80) + v13), 0x8000100u);
          if (a4)
            CFDictionarySetValue(*a4, v14, (const void *)v15++);
        }
      }
      ++v14;
      v13 += 40;
    }
    while ((uint64_t)v14 < *(int *)(a1 + 72));
  }
  if (a5)
  {
    if (CFArrayGetCount(a5))
    {
      Count = CFArrayGetCount(a5);
      if (Count >= 1)
      {
        v18 = 0;
        if (Count <= 1uLL)
          v19 = 1;
        else
          v19 = Count;
        do
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a5, v18);
          CFStringAppend(v12, CFSTR(", "));
          CFStringAppend(v12, ValueAtIndex);
          ++v18;
        }
        while (v19 != v18);
      }
    }
  }
  if (v7)
    CFRelease(v7);
  return v12;
}

__CFString *CSDBRecordStoreCreateDistinctColumnList(uint64_t a1, int a2, CFMutableDictionaryRef *a3)
{
  return sub_20AA5F0C4(a1, a2, 0, a3, 0);
}

__CFString *CSDBRecordStoreCreateColumnList(uint64_t a1, CFMutableDictionaryRef *a2)
{
  return sub_20AA5F0C4(a1, 0, 0, a2, 0);
}

__CFString *CSDBRecordStoreCreateColumnListWithAliasAndExtraColumns(uint64_t a1, CFStringRef theString, const __CFArray *a3, CFMutableDictionaryRef *a4)
{
  return sub_20AA5F0C4(a1, 0, theString, a4, a3);
}

CFMutableStringRef sub_20AA5F32C(uint64_t a1, const __CFString *a2, CFStringRef theString, CFArrayRef theArray, CFMutableDictionaryRef *a5)
{
  const __CFString *v7;
  _BOOL4 v10;
  const __CFString *Value;
  int v12;
  __CFString *v14;
  const __CFString *v15;
  CFStringRef Copy;

  v7 = theString;
  if (theString && !CFStringGetLength(theString))
    v7 = 0;
  if ((unint64_t)a5 | (unint64_t)v7)
  {
    v10 = 1;
  }
  else if (theArray)
  {
    v10 = CFArrayGetCount(theArray) != 0;
  }
  else
  {
    v10 = 0;
  }
  if (*(_DWORD *)(a1 + 152) == 1)
  {
    if (qword_253D84700)
    {
      Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)qword_253D84700, *(const void **)a1);
      if (Value)
        v12 = v10;
      else
        v12 = 1;
      if (v12 != 1)
        return CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, Value);
    }
    else
    {
      qword_253D84700 = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, 0);
    }
  }
  v14 = sub_20AA5F0C4(a1, 0, v7, a5, theArray);
  CFStringAppend(v14, CFSTR(" FROM "));
  if (a2 && CFStringGetLength(a2))
  {
    v15 = CFStringCreateWithFormat(0, 0, CFSTR("(%@)"), a2);
    CFStringAppend(v14, v15);
    CFRelease(v15);
    if (!v7)
      goto LABEL_23;
    goto LABEL_22;
  }
  CFStringAppendCString(v14, *(const char **)a1, 0x8000100u);
  if (v7)
LABEL_22:
    CFStringAppendFormat(v14, 0, CFSTR(" AS %@"), v7);
LABEL_23:
  if (!v10 && *(_DWORD *)(a1 + 152) == 1)
  {
    Copy = CFStringCreateCopy(0, v14);
    CFDictionaryAddValue((CFMutableDictionaryRef)qword_253D84700, *(const void **)a1, Copy);
  }
  return v14;
}

CFMutableStringRef CSDBRecordStoreCreateJoinableSelectPrefixFromRecordDescriptor(uint64_t a1, CFStringRef theString)
{
  if (!theString || !CFStringGetLength(theString))
    sub_20AA66E38();
  return sub_20AA5F32C(a1, 0, theString, 0, 0);
}

CFMutableStringRef CSDBRecordStoreCreateSelectPrefixWithTableExpressionAndAlias(uint64_t a1, const __CFString *a2, CFStringRef theString)
{
  if (!theString || !CFStringGetLength(theString))
    sub_20AA66E60();
  if (!a2 || !CFStringGetLength(a2))
    sub_20AA66E88();
  return sub_20AA5F32C(a1, a2, theString, 0, 0);
}

__CFString *CSDBRecordStoreCreateSelectStatement(uint64_t a1, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  __CFString *v5;

  v5 = sub_20AA5F32C(a1, a2, a3, 0, 0);
  if (v5)
  {
    if (a4 && CFStringGetLength(a4) >= 1)
    {
      CFStringAppend(v5, CFSTR(" "));
      CFStringAppend(v5, a4);
    }
    CFStringAppend(v5, CFSTR(";"));
  }
  return v5;
}

CFMutableStringRef CSDBRecordStoreCreateSelectPrefix(uint64_t a1, CFStringRef theString, CFArrayRef theArray, CFMutableDictionaryRef *a4)
{
  return sub_20AA5F32C(a1, 0, theString, theArray, a4);
}

uint64_t CSDBRecordStoreProcessStatementWithPropertyIndices(uint64_t a1, void *a2, _QWORD *a3, uint64_t a4, unint64_t a5, CFDictionaryRef theDict)
{
  return CSDBRecordStoreProcessRecordStatementWithPropertyIndices(a1, a2, a3, a4, 0, a5, theDict);
}

uint64_t CSDBRecordStoreProcessQuery(uint64_t a1, void *a2, const __CFString *a3, uint64_t a4, unint64_t a5)
{
  uint64_t v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;

  v10 = sub_20AA5D70C(a1);
  if (!v10)
    return 0;
  v11 = (uint64_t *)v10;
  v12 = CSDBSqliteConnectionStatementForSQL(v10, a3);
  if (v12)
    v13 = CSDBRecordStoreProcessRecordStatementWithPropertyIndices(a1, a2, v12, a4, 0, a5, 0);
  else
    v13 = 0;
  CSDBSqliteDatabaseReleaseSqliteConnection(v11);
  return v13;
}

const void *CSDBRecordStoreCopyInstanceOfClassWithUID(uint64_t a1, void *a2, int a3)
{
  const void *v6;

  v6 = (const void *)sub_20AA601F4(a1, a2, a3);
  if (v6 || (v6 = sub_20AA5F96C(a1, a2, a3)) != 0)
    CFRetain(v6);
  return v6;
}

void CSDBRecordStoreAddExistingRecord(uint64_t a1, void **a2)
{
  sub_20AA5923C(a1, a2, 1);
}

void CSDBRecordStoreRemoveRecordOfClassWithUID(uint64_t a1, void *key, int a3)
{
  sub_20AA5968C(a1, 0, key, a3);
}

const __CFDictionary *CSDBRecordIsPendingAdd(_QWORD *key)
{
  uint64_t v1;
  const __CFDictionary *result;

  v1 = key[2];
  if (!v1)
    return 0;
  result = *(const __CFDictionary **)(v1 + 24);
  if (result)
    return (const __CFDictionary *)(CFDictionaryContainsKey(result, key) != 0);
  return result;
}

const __CFDictionary *CSDBRecordIsPendingChange(_QWORD *key)
{
  uint64_t v1;
  const __CFDictionary *result;

  v1 = key[2];
  if (!v1)
    return 0;
  result = *(const __CFDictionary **)(v1 + 32);
  if (result)
    return (const __CFDictionary *)(CFDictionaryContainsKey(result, key) != 0);
  return result;
}

const __CFDictionary *CSDBRecordIsPendingDelete(uint64_t a1)
{
  const __CFDictionary *result;

  result = *(const __CFDictionary **)(a1 + 16);
  if (result)
  {
    if (*((_QWORD *)result + 5))
    {
      result = (const __CFDictionary *)sub_20AA597D4((uint64_t)result, *(void **)(a1 + 24));
      if (result)
        return (const __CFDictionary *)(CFDictionaryContainsKey(result, (const void *)*(int *)(a1 + 32)) != 0);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CSDBRecordStoreHasUnsavedChanges(_QWORD *a1)
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  uint64_t result;
  uint64_t context;

  v2 = (const __CFDictionary *)a1[3];
  if (v2 && CFDictionaryGetCount(v2) > 0)
    return 1;
  v3 = (const __CFDictionary *)a1[4];
  if (v3)
  {
    if (CFDictionaryGetCount(v3) > 0)
      return 1;
  }
  result = a1[5];
  if (result)
  {
    context = 0;
    CFDictionaryApplyFunction((CFDictionaryRef)result, (CFDictionaryApplierFunction)sub_20AA5F898, &context);
    return context > 0;
  }
  return result;
}

CFIndex sub_20AA5F898(int a1, CFDictionaryRef theDict, _DWORD *a3)
{
  CFIndex result;

  result = CFDictionaryGetCount(theDict);
  *a3 += result;
  return result;
}

void *CSDBRecordIsFull(void *result, const char *a2, uint64_t a3)
{
  int v3;
  __int128 v4;
  const char *v5;
  BOOL v6;
  stat v7;

  if (result)
  {
    v3 = (int)a2;
    *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v7.st_blksize = v4;
    *(_OWORD *)v7.st_qspare = v4;
    *(_OWORD *)&v7.st_size = v4;
    v5 = (const char *)objc_msgSend_fileSystemRepresentation(result, a2, a3, v4, v4, v4, v4, v4, v4);
    if (stat(v5, &v7))
      v6 = 1;
    else
      v6 = v7.st_size <= v3;
    return (void *)!v6;
  }
  return result;
}

CFStringRef sub_20AA5F928(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("<CSDBRecord: %p %s>"), a1, **(_QWORD **)(a1 + 24));
}

const void *sub_20AA5F96C(uint64_t a1, void *a2, int a3)
{
  __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t *v9;
  _DWORD *v10;
  _QWORD *v11;
  sqlite3_int64 v12;
  const void *ValueAtIndex;
  const __CFArray *v14;

  if (CSDBRecordStoreGetDatabase(a1))
  {
    v6 = sub_20AA5F32C((uint64_t)a2, 0, 0, 0, 0);
    if (v6)
    {
      v7 = v6;
      CFStringAppend(v6, CFSTR(" WHERE ROWID = ?;"));
      v8 = sub_20AA5D70C(a1);
      if (!v8)
      {
        ValueAtIndex = 0;
LABEL_18:
        CFRelease(v7);
        return ValueAtIndex;
      }
      v9 = (uint64_t *)v8;
      v10 = CSDBSqliteConnectionStatementForSQL(v8, v7);
      if (!v10 || (v11 = v10, !*((_QWORD *)v10 + 1)))
      {
        ValueAtIndex = 0;
        goto LABEL_17;
      }
      if (a1)
      {
        if (a3 >= -1)
        {
          v12 = a3;
LABEL_14:
          CSDBSqliteBindInt64((uint64_t)v10, v12);
          v14 = (const __CFArray *)CSDBRecordStoreProcessRecordStatementWithPropertyIndices(a1, a2, v11, 0, 0, 0, 0);
          if (CFArrayGetCount(v14) < 1)
          {
            ValueAtIndex = 0;
            if (!v14)
              goto LABEL_17;
            goto LABEL_16;
          }
          ValueAtIndex = CFArrayGetValueAtIndex(v14, 0);
          if (v14)
LABEL_16:
            CFRelease(v14);
LABEL_17:
          CSDBSqliteDatabaseReleaseSqliteConnection(v9);
          goto LABEL_18;
        }
        if ((a3 & 0x7FFFFFFF) < *(_DWORD *)(a1 + 104))
        {
          v12 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8 * (a3 & 0x7FFFFFFF));
          goto LABEL_14;
        }
      }
      v12 = -1;
      goto LABEL_14;
    }
  }
  return 0;
}

void sub_20AA5FABC(uint64_t a1, uint64_t a2)
{
  CSDBRecordStoreCreateTablesForClass(a1, *(_QWORD *)(a2 + 8), 0);
}

CFStringRef sub_20AA5FAC8(_QWORD *a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%llu"), *a1);
}

BOOL sub_20AA5FB08(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_20AA5FB1C(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void sub_20AA5FB24(uint64_t a1, uint64_t a2, int a3, const __CFDictionary *a4)
{
  CFMutableStringRef Mutable;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  int v11;
  int v12;
  int v13;
  const char **v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  const char **v21;
  _QWORD *v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  const __CFDictionary *v28;
  const void *Value;
  uint64_t v30;
  const char **v31;
  const char *v32;
  int v33;
  _DWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  sqlite3_int64 v37;
  uint64_t v38;
  const void *v39;

  Mutable = CFStringCreateMutable(0, 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("INSERT INTO %sChanges (ROWID, record, type"), **(_QWORD **)(a2 + 24));
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(unsigned int *)(v7 + 72);
  if ((int)v8 < 1)
    goto LABEL_38;
  LODWORD(v9) = 0;
  v10 = (int *)(*(_QWORD *)(v7 + 80) + 24);
  do
  {
    v11 = v9;
    v12 = *v10;
    v10 += 10;
    v13 = v12 & 0xA;
    if ((v12 & 0xA) != 0)
      v9 = (v9 + 1);
    else
      v9 = v9;
    --v8;
  }
  while (v8);
  if ((_DWORD)v9)
  {
    v38 = a1;
    v14 = (const char **)malloc_type_calloc(1uLL, 24 * v9, 0x10720403E5D127AuLL);
    v15 = *(_QWORD *)(a2 + 24);
    if (*(int *)(v15 + 72) >= 1)
    {
      v16 = 0;
      v17 = 0;
      v39 = (const void *)*MEMORY[0x24BDBD430];
      do
      {
        v18 = *(_QWORD *)(v15 + 80);
        v19 = v18 + 40 * v16;
        v20 = *(_DWORD *)(v19 + 24);
        if ((v20 & 2) != 0)
        {
          v24 = 0;
          v14[3 * v17] = *(const char **)v19;
          v25 = *(_QWORD *)(v18 + 40 * v16 + 8);
          v26 = qword_20AA67A80;
          do
          {
            v27 = *v26;
            v26 += 2;
            if (v27 == v25)
              break;
            ++v24;
          }
          while (v24 != 4);
          v14[3 * v17 + 1] = (const char *)qword_20AA67A80[2 * v24 + 1];
          if (a3 == 2
            && (v28 = *(const __CFDictionary **)(a2 + 48)) != 0
            && (Value = CFDictionaryGetValue(v28, (const void *)v16)) != 0)
          {
            if (Value == v39)
              LODWORD(Value) = 0;
          }
          else
          {
            LODWORD(Value) = CSDBRecordGetProperty(a2, v16);
          }
          LODWORD(v14[3 * v17++ + 2]) = (_DWORD)Value;
        }
        else if ((v20 & 8) != 0)
        {
          v21 = &v14[3 * v17];
          *v21 = *(const char **)v19;
          v22 = v21 + 1;
          if (a3 == 1)
          {
            *v22 = 0;
            if (a4)
              v23 = CFDictionaryGetValue(a4, (const void *)v16) != 0;
            else
              v23 = 0;
            LODWORD(v14[3 * v17 + 2]) = v23;
          }
          else
          {
            *v22 = 2;
            v14[3 * v17 + 2] = 0;
          }
          ++v17;
        }
        ++v16;
        v15 = *(_QWORD *)(a2 + 24);
      }
      while (v16 < *(int *)(v15 + 72));
    }
    v30 = v9;
    v31 = v14;
    do
    {
      CFStringAppend(Mutable, CFSTR(", "));
      v32 = *v31;
      v31 += 3;
      CFStringAppendCString(Mutable, v32, 0x8000100u);
      --v30;
    }
    while (v30);
    CFStringAppendFormat(Mutable, 0, CFSTR(") VALUES(IFNULL(1 + (SELECT MAX(ROWID) FROM %sChanges), 0), ?, ?"), **(_QWORD **)(a2 + 24));
    if (v13)
      v33 = v11 + 1;
    else
      v33 = v11;
    do
    {
      CFStringAppend(Mutable, CFSTR(", ?"));
      --v33;
    }
    while (v33);
    a1 = v38;
  }
  else
  {
LABEL_38:
    CFStringAppendFormat(Mutable, 0, CFSTR(") VALUES(IFNULL(1 + (SELECT MAX(ROWID) FROM %sChanges), 0), ?, ?"), *(_QWORD *)v7);
    LODWORD(v9) = 0;
    v14 = 0;
  }
  CFStringAppend(Mutable, CFSTR(");"));
  v34 = CSDBSqliteConnectionStatementForSQL(a1, Mutable);
  if (v34)
  {
    v35 = v34;
    if (*((_QWORD *)v34 + 1))
    {
      v36 = *(_QWORD *)(a2 + 16);
      if (v36)
      {
        v37 = *(int *)(a2 + 32);
        if ((int)v37 >= -1)
        {
LABEL_45:
          CSDBSqliteBindInt64((uint64_t)v34, v37);
          CSDBSqliteBindInt((uint64_t)v35, a3);
          CSDBSqliteStatementBindValuesForColumns((uint64_t)v35, (uint64_t)v14, v9);
          CSDBSqliteStatementPerform(v35);
          CSDBSqliteStatementReset(v35);
          goto LABEL_46;
        }
        if ((v37 & 0x7FFFFFFF) < *(_DWORD *)(v36 + 104))
        {
          v37 = *(_QWORD *)(*(_QWORD *)(v36 + 112) + 8 * (v37 & 0x7FFFFFFF));
          goto LABEL_45;
        }
      }
      v37 = -1;
      goto LABEL_45;
    }
  }
LABEL_46:
  free(v14);
  CFRelease(Mutable);
}

void sub_20AA5FEB4(uint64_t a1, uint64_t a2, int a3)
{
  CFMutableStringRef Mutable;
  _DWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  sqlite3_int64 v10;

  if (a2)
  {
    Mutable = CFStringCreateMutable(0, 0);
    CFStringAppendFormat(Mutable, 0, CFSTR("INSERT OR REPLACE INTO %sBasicChanges (record, type, sequenceNumber)"), **(_QWORD **)(a2 + 24));
    CFStringAppend(Mutable, CFSTR(" VALUES(?, ?, ?);"));
    v7 = CSDBSqliteConnectionStatementForSQL(a1, Mutable);
    if (v7)
    {
      v8 = v7;
      if (*((_QWORD *)v7 + 1))
      {
        v9 = *(_QWORD *)(a2 + 16);
        if (v9)
        {
          v10 = *(int *)(a2 + 32);
          if ((int)v10 < -1)
          {
            if ((v10 & 0x7FFFFFFF) >= *(_DWORD *)(v9 + 104))
              v10 = -1;
            else
              v10 = *(_QWORD *)(*(_QWORD *)(v9 + 112) + 8 * (v10 & 0x7FFFFFFF));
          }
          CSDBSqliteBindInt64((uint64_t)v7, v10);
          CSDBSqliteBindInt((uint64_t)v8, a3);
          CSDBSqliteBindInt((uint64_t)v8, *(_DWORD *)(*(_QWORD *)(a2 + 16) + 96) + 1);
          CSDBSqliteStatementPerform(v8);
          CSDBSqliteStatementReset(v8);
        }
      }
    }
    CFRelease(Mutable);
  }
}

uint64_t sub_20AA5FFB8(int a1, uint64_t a2, uint64_t *a3)
{
  uint64_t result;
  uint64_t (*v5)(void);

  result = *a3;
  v5 = *(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*a3 + 24) + 80) + 40 * a1 + 16) + 32);
  if (v5)
    return v5();
  return result;
}

const __CFDictionary *sub_20AA5FFE8(uint64_t a1, int a2)
{
  const __CFDictionary *result;

  if (!a1)
    sub_20AA66FA0();
  result = *(const __CFDictionary **)(a1 + 40);
  if (result)
    return (const __CFDictionary *)(CFDictionaryGetValueIfPresent(result, (const void *)a2, 0) != 0);
  return result;
}

void sub_20AA6001C(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t);
  __int128 *v8;
  const __CFString *v9;
  uint64_t v10;
  sqlite3_int64 v11;
  const __CFDictionary *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  const __CFDictionary *v15;
  _QWORD context[2];
  unsigned int v17;

  if (!a1 || !a3 || !a3[1])
    sub_20AA66FC8();
  v17 = -1431655766;
  v6 = *(_QWORD *)(a1 + 24);
  v7 = *(void (**)(uint64_t))(v6 + 48);
  if (v7)
    v7(a1);
  v8 = (__int128 *)sub_20AA5A12C(a1, (int *)&v17, 0);
  v9 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], *(const char **)v6, 0x8000100u);
  v10 = *a3;
  if (!*a3)
    goto LABEL_31;
  v11 = *(int *)(a1 + 32);
  if ((int)v11 >= -1)
    goto LABEL_10;
  if ((v11 & 0x7FFFFFFF) < *(_DWORD *)(v10 + 104))
    v11 = *(_QWORD *)(*(_QWORD *)(v10 + 112) + 8 * (v11 & 0x7FFFFFFF));
  else
LABEL_31:
    v11 = -1;
LABEL_10:
  CSDBSqliteConnectionUpdateRecord(a3[1], v9, v11, v8, v17);
  CFRelease(v9);
  free(v8);
  v12 = *(const __CFDictionary **)(a1 + 40);
  if (v12)
  {
    *(_QWORD *)(a1 + 40) = 0;
    v13 = a3[1];
    context[0] = a1;
    context[1] = v13;
    CFDictionaryApplyFunction(v12, (CFDictionaryApplierFunction)sub_20AA5FFB8, context);
  }
  v14 = *(void (**)(uint64_t, uint64_t))(v6 + 104);
  if (v14)
    v14(a1, a3[1]);
  if ((a2 & 1) != 0 && *a3 && (*(_BYTE *)(*a3 + 57) & 1) != 0 && (*(_BYTE *)(*(_QWORD *)(a1 + 24) + 56) & 2) != 0)
    sub_20AA5FB24(a3[1], a1, 1, v12);
  if ((a2 & 4) != 0 && *a3 && (*(_BYTE *)(*a3 + 57) & 2) != 0 && (*(_BYTE *)(*(_QWORD *)(a1 + 24) + 56) & 8) != 0)
    sub_20AA5FEB4(a3[1], a1, 1);
  if (v12)
    CFRelease(v12);
  if (*(_QWORD *)(a1 + 40))
    sub_20AA66FF0();
  v15 = *(const __CFDictionary **)(a1 + 48);
  if (v15)
  {
    CFDictionaryApplyFunction(v15, (CFDictionaryApplierFunction)sub_20AA5DFB0, (void *)a1);
    CFRelease(*(CFTypeRef *)(a1 + 48));
    *(_QWORD *)(a1 + 48) = 0;
  }
}

void sub_20AA601EC(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a2 + 16) = 0;
}

uint64_t sub_20AA601F4(uint64_t a1, void *a2, int a3)
{
  const __CFDictionary *v6;
  const void *v7;
  const void *Value;
  uint64_t v9;
  const __CFDictionary *v10;

  v6 = (const __CFDictionary *)sub_20AA5A9F0(a1, a2);
  if (!v6)
    return 0;
  v7 = (const void *)a3;
  Value = CFDictionaryGetValue(v6, (const void *)a3);
  if (!Value)
    return 0;
  v9 = sub_20AA5ADE4((uint64_t)Value);
  if (v9)
  {
    v10 = (const __CFDictionary *)sub_20AA597D4(a1, a2);
    if (v10)
    {
      if (CFDictionaryContainsKey(v10, v7))
        return 0;
    }
  }
  return v9;
}

uint64_t sub_20AA60270()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  qword_253D846F0 = result;
  return result;
}

CFStringRef sub_20AA60294(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("<CSDBRecordDeleteInfo: %p>"), a1);
}

_QWORD *CSDBSqliteDatabaseCreateWithPath(const __CFString *a1)
{
  _QWORD *v2;

  if (!a1)
    return 0;
  v2 = malloc_type_calloc(1uLL, 0xC8uLL, 0x10E00403D130332uLL);
  *v2 = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], a1);
  return v2;
}

uint64_t CSDBSqliteDatabaseSetLookAsideConfig(uint64_t result, uint64_t a2, int a3)
{
  if (result)
  {
    *(_QWORD *)(result + 188) = a2;
    *(_DWORD *)(result + 196) = a3;
  }
  return result;
}

uint64_t CSDBSqliteDatabaseSetVersion(uint64_t result, int a2)
{
  if (result)
  {
    *(_BYTE *)(result + 84) |= 1u;
    *(_DWORD *)(result + 80) = a2;
  }
  return result;
}

uint64_t CSDBSqliteDatabaseSetDataProtectionClass(uint64_t result, int a2)
{
  if (result)
    *(_DWORD *)(result + 184) = a2;
  return result;
}

uint64_t CSDBSqliteConnectionDatabaseVersion(uint64_t a1)
{
  uint64_t result;
  BOOL v2;

  v2 = 0;
  LODWORD(result) = sub_20AA5C534(a1, CFSTR("_ClientVersion"), 0, &v2);
  if (v2)
    return result;
  else
    return 0;
}

uint64_t CSDBSqliteDatabaseSetSetupHandler(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    *(_QWORD *)(result + 16) = a2;
    *(_QWORD *)(result + 40) = a3;
  }
  return result;
}

uint64_t CSDBSqliteDatabaseSetShouldMigrateInExternalProcess(uint64_t result, char a2)
{
  if (result)
    *(_BYTE *)(result + 64) = a2;
  return result;
}

uint64_t CSDBSqliteDatabaseSetConnectionInitializer(uint64_t result, uint64_t a2)
{
  if (result)
    *(_QWORD *)(result + 32) = a2;
  return result;
}

uint64_t CSDBSqliteDatabaseVacuum(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  uint32_t v6;
  NSObject *v7;
  NSObject *v8;
  char *errmsg;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    errmsg = 0;
    v1 = sqlite3_exec(*(sqlite3 **)(a1 + 8), "vacuum;", 0, 0, &errmsg);
    v2 = v1;
    if ((_DWORD)v1 && (_DWORD)v1 != 101)
    {
      if (IMOSLoggingEnabled())
      {
        v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v12 = v2;
          v13 = 2080;
          v14 = errmsg;
          v4 = "Unable to vacuum database. SQLiteResult: %d error message: %s";
          v5 = v8;
          v6 = 18;
          goto LABEL_13;
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v4 = "SQLite vacumm was successful.";
        v5 = v3;
        v6 = 2;
LABEL_13:
        _os_log_impl(&dword_20AA57000, v5, OS_LOG_TYPE_INFO, v4, buf, v6);
      }
    }
    if (errmsg)
      free(errmsg);
    return v2;
  }
  if (!IMOSLoggingEnabled())
    return 1;
  v7 = OSLogHandleForIMFoundationCategory();
  v2 = 1;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AA57000, v7, OS_LOG_TYPE_INFO, "Unable to vaccum db, NULL connection.", buf, 2u);
  }
  return v2;
}

uint64_t CSDBSqliteDatabaseCheckpointAndVacuum(uint64_t a1)
{
  int v2;
  int v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  NSObject *v16;
  char *errmsg;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    errmsg = 0;
    v2 = sqlite3_exec(*(sqlite3 **)(a1 + 8), "vacuum;", 0, 0, &errmsg);
    v3 = v2;
    if (v2 && v2 != 101)
    {
      if (IMOSLoggingEnabled())
      {
        v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v20 = v3;
          v21 = 2080;
          v22 = errmsg;
          v5 = "Unable to vacuum database. SQLiteResult: %d error message: %s";
          v6 = v10;
          v7 = 18;
          goto LABEL_13;
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v5 = "SQLite vacumm was successful.";
        v6 = v4;
        v7 = 2;
LABEL_13:
        _os_log_impl(&dword_20AA57000, v6, OS_LOG_TYPE_INFO, v5, buf, v7);
      }
    }
    v11 = sqlite3_exec(*(sqlite3 **)(a1 + 8), "PRAGMA wal_checkpoint(RESTART);", 0, 0, &errmsg);
    v9 = v11;
    if ((_DWORD)v11 && (_DWORD)v11 != 101)
    {
      if (IMOSLoggingEnabled())
      {
        v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v20 = v9;
          v21 = 2080;
          v22 = errmsg;
          v13 = "Unable to wal_checkpoint database. SQLiteResult: %d error message: %s";
          v14 = v16;
          v15 = 18;
          goto LABEL_22;
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v13 = "SQLite wal_checkpoint was successful.";
        v14 = v12;
        v15 = 2;
LABEL_22:
        _os_log_impl(&dword_20AA57000, v14, OS_LOG_TYPE_INFO, v13, buf, v15);
      }
    }
    if (errmsg)
      free(errmsg);
    return v9;
  }
  if (!IMOSLoggingEnabled())
    return 1;
  v8 = OSLogHandleForIMFoundationCategory();
  v9 = 1;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AA57000, v8, OS_LOG_TYPE_INFO, "Unable to vaccum db, NULL connection.", buf, 2u);
  }
  return v9;
}

_QWORD *CSDBSqliteDatabaseSetMigrationHandlers(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    result[6] = a2;
    result[7] = a3;
    result[9] = a4;
  }
  return result;
}

void CSDBSqliteDatabaseCloseAllConnections(uint64_t a1)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a1 + 8);
  if (v2)
  {
    sub_20AA618D8(v2);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

uint64_t CSDBSqliteDatabasePath(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void CSDBSqliteDeleteDatabase(void *a1)
{
  id v2;
  const char *v3;
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  const char *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = objc_alloc(MEMORY[0x24BDD17C8]);
    v4 = (void *)objc_msgSend_initWithFormat_(v2, v3, (uint64_t)CFSTR("%@-shm"), a1);
    v5 = objc_alloc(MEMORY[0x24BDD17C8]);
    v7 = (void *)objc_msgSend_initWithFormat_(v5, v6, (uint64_t)CFSTR("%@-wal"), a1);
    v8 = objc_alloc(MEMORY[0x24BDD17C8]);
    v10 = (void *)objc_msgSend_initWithFormat_(v8, v9, (uint64_t)CFSTR("%@-journal"), a1);
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v21 = a1;
        _os_log_impl(&dword_20AA57000, v13, OS_LOG_TYPE_INFO, "Unlinking the source database %@.", buf, 0xCu);
      }
    }
    v14 = (const char *)objc_msgSend_UTF8String(a1, v11, v12);
    unlink(v14);
    if (v4)
    {
      v17 = (const char *)objc_msgSend_UTF8String(v4, v15, v16);
      unlink(v17);
    }
    if (v7)
    {
      v18 = (const char *)objc_msgSend_UTF8String(v7, v15, v16);
      unlink(v18);
    }
    if (v10)
    {
      v19 = (const char *)objc_msgSend_UTF8String(v10, v15, v16);
      unlink(v19);
    }

  }
}

void CSDBSqliteBackupDatabase(uint64_t a1, const __CFString *a2)
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  CFStringRef v7;
  int v8;
  int v9;
  int v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NSObject *v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  int v28;
  int v29;
  NSObject *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  NSObject *v36;
  int v37;
  int v38;
  NSObject *v39;
  const char *v40;
  const char *v41;
  NSObject *v42;
  uint32_t v43;
  NSObject *v44;
  int v45;
  int v46;
  const char *v47;
  NSObject *v48;
  sqlite3 *v49;
  sqlite3 *ppDb;
  uint8_t v51[4];
  _BYTE v52[14];
  __int16 v53;
  const char *v54;
  char buffer[1024];
  uint8_t buf[1032];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = a2;
      _os_log_impl(&dword_20AA57000, v4, OS_LOG_TYPE_INFO, "Backing up database to path %@", buf, 0xCu);
    }
  }
  memset(&buf[1], 170, 0x3FFuLL);
  memset(&buffer[1], 170, 0x3FFuLL);
  buf[0] = 0;
  buffer[0] = 0;
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v51 = 138412290;
      *(_QWORD *)v52 = a2;
      _os_log_impl(&dword_20AA57000, v5, OS_LOG_TYPE_INFO, "Destination path: %@", v51, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(CFStringRef *)a1;
      *(_DWORD *)v51 = 138412290;
      *(_QWORD *)v52 = v7;
      _os_log_impl(&dword_20AA57000, v6, OS_LOG_TYPE_INFO, "Source path: %@", v51, 0xCu);
    }
  }
  CFStringGetCString(a2, (char *)buf, 1024, 0x8000100u);
  CFStringGetCString(*(CFStringRef *)a1, buffer, 1024, 0x8000100u);
  v8 = *(_DWORD *)(a1 + 184);
  if (v8)
    v9 = 4194306;
  else
    v9 = 3145730;
  if (v8 == 1)
    v10 = 1048578;
  else
    v10 = v9;
  ppDb = 0;
  v11 = sqlite3_open_v2(buffer, &ppDb, v10, 0);
  if (!v11)
  {
    if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v51 = 0;
        _os_log_impl(&dword_20AA57000, v12, OS_LOG_TYPE_INFO, "Opened the source database to force WAL journal mode.", v51, 2u);
      }
    }
    sqlite3_exec(ppDb, "pragma JOURNAL_MODE=wal", 0, 0, 0);
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v51 = 0;
        _os_log_impl(&dword_20AA57000, v13, OS_LOG_TYPE_INFO, "Closing the source database to clean up any support files.", v51, 2u);
      }
    }
    sqlite3_close(ppDb);
    ppDb = 0;
    v11 = sqlite3_open_v2(buffer, &ppDb, v10, 0);
    if (!v11)
    {
      if (IMOSLoggingEnabled())
      {
        v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v51 = 0;
          _os_log_impl(&dword_20AA57000, v19, OS_LOG_TYPE_INFO, "Opened the source database.", v51, 2u);
        }
      }
      v20 = *(_DWORD *)(a1 + 184);
      v21 = 4194310;
      if (!v20)
        v21 = 3145734;
      if (v20 == 1)
        v22 = 1048582;
      else
        v22 = v21;
      v49 = 0;
      v23 = sqlite3_open_v2((const char *)buf, &v49, v22, 0);
      v24 = IMOSLoggingEnabled();
      if (v23)
      {
        if (!v24)
          return;
        v25 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          return;
        v26 = sqlite3_errmsg(v49);
        *(_DWORD *)v51 = 67109378;
        *(_DWORD *)v52 = v23;
        *(_WORD *)&v52[4] = 2080;
        *(_QWORD *)&v52[6] = v26;
        v16 = "Unable to open the destination database. SQLite error: [%d] %s";
        goto LABEL_65;
      }
      if (v24)
      {
        v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v51 = 0;
          _os_log_impl(&dword_20AA57000, v27, OS_LOG_TYPE_INFO, "Opened the destination database.", v51, 2u);
        }
      }
      v28 = sqlite3_file_control(v49, 0, 102, ppDb);
      v29 = IMOSLoggingEnabled();
      if (v28)
      {
        if (v29)
        {
          v30 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v31 = sqlite3_errmsg(v49);
            v32 = sqlite3_errmsg(ppDb);
            *(_DWORD *)v51 = 67109634;
            *(_DWORD *)v52 = v28;
            *(_WORD *)&v52[4] = 2080;
            *(_QWORD *)&v52[6] = v31;
            v53 = 2080;
            v54 = v32;
            v33 = "Replacing messages database from restore failed. SQLite error: [%d] Destination: %s Source: %s";
            v34 = v30;
            v35 = 28;
LABEL_52:
            _os_log_impl(&dword_20AA57000, v34, OS_LOG_TYPE_INFO, v33, v51, v35);
          }
        }
      }
      else if (v29)
      {
        v36 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v51 = 0;
          v33 = "Database replacement was successful.";
          v34 = v36;
          v35 = 2;
          goto LABEL_52;
        }
      }
      v37 = sqlite3_close(v49);
      v38 = IMOSLoggingEnabled();
      if (v37)
      {
        if (!v38)
          goto LABEL_61;
        v39 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          goto LABEL_61;
        v40 = sqlite3_errmsg(v49);
        *(_DWORD *)v51 = 67109378;
        *(_DWORD *)v52 = v37;
        *(_WORD *)&v52[4] = 2080;
        *(_QWORD *)&v52[6] = v40;
        v41 = "Unable to close the destination database. SQLite error: [%d] %s";
        v42 = v39;
        v43 = 18;
      }
      else
      {
        if (!v38)
          goto LABEL_61;
        v44 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          goto LABEL_61;
        *(_WORD *)v51 = 0;
        v41 = "Closed the destination database.";
        v42 = v44;
        v43 = 2;
      }
      _os_log_impl(&dword_20AA57000, v42, OS_LOG_TYPE_INFO, v41, v51, v43);
LABEL_61:
      v45 = sqlite3_close(ppDb);
      v46 = IMOSLoggingEnabled();
      if (!v45)
      {
        if (v46)
        {
          v48 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v51 = 0;
            v16 = "Closed the source database.";
            v17 = v48;
            v18 = 2;
            goto LABEL_28;
          }
        }
        return;
      }
      if (!v46)
        return;
      v25 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        return;
      v47 = sqlite3_errmsg(ppDb);
      *(_DWORD *)v51 = 67109378;
      *(_DWORD *)v52 = v45;
      *(_WORD *)&v52[4] = 2080;
      *(_QWORD *)&v52[6] = v47;
      v16 = "Unable to close the source database. SQLite error: [%d] %s";
LABEL_65:
      v17 = v25;
      goto LABEL_27;
    }
  }
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = sqlite3_errmsg(ppDb);
      *(_DWORD *)v51 = 67109378;
      *(_DWORD *)v52 = v11;
      *(_WORD *)&v52[4] = 2080;
      *(_QWORD *)&v52[6] = v15;
      v16 = "Unable to open the source database. SQLite error: [%d] %s";
      v17 = v14;
LABEL_27:
      v18 = 18;
LABEL_28:
      _os_log_impl(&dword_20AA57000, v17, OS_LOG_TYPE_INFO, v16, v51, v18);
    }
  }
}

void sub_20AA61138(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x20AA60D54);
  }
  _Unwind_Resume(a1);
}

sqlite3 **sub_20AA6122C(uint64_t a1, const char *a2, _BYTE *a3, char a4)
{
  sqlite3 **result;
  uint64_t v8;
  int v9;
  char v10;
  BOOL v11;
  char v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  char v20;
  NSObject *v21;
  const char *v22;
  int v23;
  char v24;
  void *v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  result = sub_20AA64128((uint64_t *)a1, a2, a4);
  v25 = result;
  if (result)
  {
    v8 = (uint64_t)result;
    v24 = 0;
    v9 = *(_DWORD *)(a1 + 80);
    if (sub_20AA5B910((uint64_t)result, CFSTR("SELECT value FROM _SqliteDatabaseProperties WHERE key = ?;"), 1))
    {
      if ((*(_BYTE *)(a1 + 84) & 1) != 0)
      {
        buf[0] = 0;
        v13 = sub_20AA5C534(v8, CFSTR("_ClientVersion"), 0, (BOOL *)buf);
        if (buf[0])
          v14 = v13;
        else
          v14 = 0;
        sub_20AA6454C((void ****)&v25, &v24);
        v15 = v25;
        if (v25 && (_DWORD)v14 != *(_DWORD *)(a1 + 80))
        {
          if (IMOSLoggingEnabled())
          {
            v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              v17 = *(_DWORD *)(a1 + 80);
              *(_DWORD *)buf = 67109376;
              v27 = v17;
              v28 = 1024;
              v29 = v14;
              _os_log_impl(&dword_20AA57000, v16, OS_LOG_TYPE_INFO, "version conflict: expected %d, got %d", buf, 0xEu);
            }
          }
          CSDBSqliteConnectionBeginTransactionType((uint64_t)v15, 0);
          sub_20AA6454C((void ****)&v25, &v24);
          if (v25)
          {
            v23 = 0;
            v14 = sub_20AA5C534((uint64_t)v25, CFSTR("_ClientVersion"), &v23, 0);
            if (IMOSLoggingEnabled())
            {
              v18 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109376;
                v27 = v14;
                v28 = 1024;
                v29 = v23;
                _os_log_impl(&dword_20AA57000, v18, OS_LOG_TYPE_INFO, "read schema version: %d error: %d", buf, 0xEu);
              }
            }
            sub_20AA6454C((void ****)&v25, &v24);
            if (v25)
            {
              if (v23 == 17)
              {
                sub_20AA618D8(v25);
                v25 = 0;
                if (a3)
                  *a3 = 1;
              }
              else
              {
                if (*(_DWORD *)(a1 + 80) == (_DWORD)v14)
                {
                  if (IMOSLoggingEnabled())
                  {
                    v19 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_20AA57000, v19, OS_LOG_TYPE_INFO, "version conflict resolved externally", buf, 2u);
                    }
                  }
                  sub_20AA646EC((uint64_t *)a1, a2, (sqlite3 ***)&v25);
                }
                else
                {
                  if (*(_BYTE *)(a1 + 64))
                    v20 = sub_20AA64754(a1, a2, (uint64_t *)&v25);
                  else
                    v20 = sub_20AA64930(a1, a2, v14, (sqlite3 ***)&v25);
                  v24 = v20;
                }
                if (v25)
                  CSDBSqliteConnectionCommit((uint64_t)v25);
              }
            }
          }
        }
        v10 = 0;
LABEL_39:
        if (*(_BYTE *)(a1 + 64))
        {
          if (!v24)
            return (sqlite3 **)v25;
          if (!IMOSLoggingEnabled())
            goto LABEL_49;
          v21 = OSLogHandleForIMFoundationCategory();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            goto LABEL_49;
          *(_WORD *)buf = 0;
          v22 = "DataMigrator did not work -- we are being forced to delete the database and create it ourselves.";
        }
        else
        {
          if (!v24)
          {
            if ((v10 & 1) == 0)
              return (sqlite3 **)v25;
            goto LABEL_50;
          }
          if (!IMOSLoggingEnabled()
            || (v21 = OSLogHandleForIMFoundationCategory(), !os_log_type_enabled(v21, OS_LOG_TYPE_INFO)))
          {
LABEL_49:
            sub_20AA64CB0(a1, a2, v9, v14, (sqlite3 ***)&v25);
LABEL_50:
            sub_20AA65590(a1, a2, (uint64_t)v25);
            return (sqlite3 **)v25;
          }
          *(_WORD *)buf = 0;
          v22 = "Migrating the database failed. We must delete this database and start fresh";
        }
        _os_log_impl(&dword_20AA57000, v21, OS_LOG_TYPE_INFO, v22, buf, 2u);
        goto LABEL_49;
      }
      v10 = 0;
    }
    else
    {
      v11 = *(_BYTE *)(a1 + 64) == 0;
      sub_20AA6454C((void ****)&v25, &v24);
      if (v11)
      {
        v10 = v25 != 0;
      }
      else if (v24 || (v10 = (char)v25, v25))
      {
        v12 = sub_20AA64754(a1, a2, (uint64_t *)&v25);
        v10 = 0;
        v24 = v12;
      }
    }
    v14 = 0xFFFFFFFFLL;
    goto LABEL_39;
  }
  return result;
}

void sub_20AA616A0(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  BOOL v9;
  const __CFString *v10;
  char v11;
  const char *v12;
  __CFNotificationCenter *DarwinNotifyCenter;

  v4 = (void *)MEMORY[0x20BD2A83C]();
  if (!qword_253D84730)
    qword_253D84730 = (uint64_t)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v5 = sub_20AA61764(*(void **)(a1 + 32), v2, v3);
  v7 = objc_msgSend_stringByAppendingString_(CFSTR("com.apple.coresdb.mandatory_db_reconnect_required."), v6, (uint64_t)v5);
  if (v5)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (!v5)
      goto LABEL_13;
  }
  else
  {
    v10 = (const __CFString *)v7;
    v11 = objc_msgSend_containsObject_((void *)qword_253D84730, v8, (uint64_t)v5);
    if ((v11 & 1) == 0)
    {
      objc_msgSend_addObject_((void *)qword_253D84730, v12, (uint64_t)v5);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_20AA61828, v10, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
  CFRelease(v5);
LABEL_13:
  objc_autoreleasePoolPop(v4);
}

void *sub_20AA61764(void *a1, const char *a2, uint64_t a3)
{
  const char *v3;
  CC_LONG v4;
  id v5;
  const char *v6;
  const char *v7;
  void *v8;
  uint64_t i;
  unsigned __int8 md[16];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (const char *)objc_msgSend_UTF8String(a1, a2, a3);
  memset(md, 170, sizeof(md));
  v4 = strlen(v3);
  CC_MD5(v3, v4, md);
  v5 = objc_alloc(MEMORY[0x24BDD16A8]);
  v8 = (void *)objc_msgSend_initWithCapacity_(v5, v6, 32);
  for (i = 0; i != 16; ++i)
    objc_msgSend_appendFormat_(v8, v7, (uint64_t)CFSTR("%02x"), md[i], *(_QWORD *)md, *(_QWORD *)&md[8]);
  return v8;
}

void sub_20AA61828(uint64_t a1, uint64_t a2, void *a3)
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  pthread_mutex_lock(&stru_254613508);
  v12 = (void *)objc_msgSend_copy((void *)qword_254613570, v4, v5);
  pthread_mutex_unlock(&stru_254613508);
  v8 = objc_msgSend_length(CFSTR("com.apple.coresdb.mandatory_db_reconnect_required."), v6, v7);
  v10 = objc_msgSend_substringFromIndex_(a3, v9, v8);
  v11 = v12;
  if (v10 && v12)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_20AA6590C;
    v13[3] = &unk_24C35A1E8;
    v13[4] = v10;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v12, (const char *)v12, (uint64_t)v13);
    v11 = v12;
  }

}

void sub_20AA618D8(_QWORD *a1)
{
  const void *v2;
  sqlite3 *v3;
  void (*v4)(_QWORD);

  if (a1)
  {
    v2 = (const void *)a1[2];
    if (v2)
    {
      CFRelease(v2);
      a1[2] = 0;
    }
    v3 = (sqlite3 *)a1[1];
    if (v3)
      sqlite3_close(v3);
    v4 = (void (*)(_QWORD))a1[4];
    if (v4)
      v4(a1[3]);
    free(a1);
  }
}

uint64_t **CSDBSqliteDatabaseReleaseSqliteStatement(uint64_t **result)
{
  uint64_t v1;

  v1 = **result;
  if (v1)
  {
    if ((*(_BYTE *)(v1 + 84) & 4) != 0)
      return (uint64_t **)pthread_mutex_unlock((pthread_mutex_t *)(v1 + 88));
  }
  return result;
}

CFStringRef CSDBSqliteDatabaseCopyValueForProperty(uint64_t a1, const __CFString *a2)
{
  uint64_t *v3;
  uint64_t *v4;
  CFStringRef v5;
  uint64_t v6;

  v3 = (uint64_t *)CSDBSqliteDatabaseConnectionForWritingWithOwnership(a1, 1);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CSDBSqliteConnectionCopyValueForProperty(v3, a2);
  v6 = *v4;
  if (*v4 && (*(_BYTE *)(v6 + 84) & 4) != 0)
    pthread_mutex_unlock((pthread_mutex_t *)(v6 + 88));
  return v5;
}

CFStringRef CSDBSqliteConnectionCopyValueForProperty(_QWORD *a1, const __CFString *a2)
{
  UInt8 *v3;
  uint64_t v4;
  CFStringRef v5;

  if (!a1)
    return 0;
  if (!*a1)
    return 0;
  v3 = (UInt8 *)sub_20AA5B910((uint64_t)a1, CFSTR("SELECT value FROM _SqliteDatabaseProperties WHERE key = ?;"), 0);
  if (!v3)
    return 0;
  v4 = (uint64_t)v3;
  CSDBSqliteBindTextFromCFString(v3, a2);
  v5 = CSDBSqliteStatementCopyStringResult(v4);
  CSDBSqliteStatementReset(v4);
  return v5;
}

uint64_t CSDBSqliteDatabaseSetValueForProperty(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;

  v5 = 1;
  v6 = (uint64_t *)CSDBSqliteDatabaseConnectionForWritingWithOwnership(a1, 1);
  if (v6)
  {
    v7 = v6;
    v5 = CSDBSqliteConnectionSetValueForProperty(v6, a2, a3);
    v8 = *v7;
    if (*v7)
    {
      if ((*(_BYTE *)(v8 + 84) & 4) != 0)
        pthread_mutex_unlock((pthread_mutex_t *)(v8 + 88));
    }
  }
  return v5;
}

uint64_t CSDBSqliteConnectionSetValueForProperty(_QWORD *a1, const __CFString *a2, const __CFString *a3)
{
  uint64_t result;
  UInt8 *v7;
  uint64_t v8;
  sqlite3_stmt *v9;
  __CFDictionary *v10;
  UInt8 *v11;
  uint64_t v12;
  sqlite3_stmt *v13;

  result = 1;
  if (a1 && a2 && *a1)
  {
    v7 = (UInt8 *)sub_20AA5B910((uint64_t)a1, CFSTR("INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);"),
                    0);
    if (v7)
    {
      v8 = (uint64_t)v7;
      CSDBSqliteBindTextFromCFString(v7, a2);
      if (a3)
        CSDBSqliteBindTextFromCFString((UInt8 *)v8, a3);
      else
        CSDBSqliteBindNull(v8);
      v9 = *(sqlite3_stmt **)(v8 + 8);
      if (v9)
        CSDBSqliteStepWithConnection(*(_QWORD *)v8, v9);
      result = CSDBSqliteStatementReset(v8);
      if ((_DWORD)result == 17)
      {
        v10 = (__CFDictionary *)a1[2];
        if (v10
          && (CFDictionaryRemoveValue(v10, CFSTR("INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);")),
              (v11 = (UInt8 *)sub_20AA5B910((uint64_t)a1, CFSTR("INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);"),
                                0)) != 0))
        {
          v12 = (uint64_t)v11;
          CSDBSqliteBindTextFromCFString(v11, a2);
          if (a3)
            CSDBSqliteBindTextFromCFString((UInt8 *)v12, a3);
          else
            CSDBSqliteBindNull(v12);
          v13 = *(sqlite3_stmt **)(v12 + 8);
          if (v13)
            CSDBSqliteStepWithConnection(*(_QWORD *)v12, v13);
          return CSDBSqliteStatementReset(v12);
        }
        else
        {
          return 17;
        }
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t CSDBSqliteDatabaseRegisterFunctionForDB(sqlite3 *a1, const char *a2, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), int nArg, void *a5)
{
  if (a1)
    return sqlite3_create_function(a1, a2, nArg, 1, a5, xFunc, 0, 0);
  else
    return 1;
}

uint64_t CSDBSqliteDatabaseSetLoggingEnabled(uint64_t a1, int a2)
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t *v8;
  int (__cdecl *v9)(unsigned int, void *, void *, void *);
  uint64_t v10;

  v4 = sub_20AA61C78();
  if (!sub_20AA65880())
  {
    pthread_mutex_lock(&stru_253D846A8);
    dword_254613578 = a2 != 0;
    pthread_mutex_unlock(&stru_253D846A8);
  }
  v5 = sub_20AA61C78();
  if (v5 != v4)
  {
    v6 = v5;
    v7 = CSDBSqliteDatabaseConnectionForWritingWithOwnership(a1, 1);
    if (v7)
    {
      v8 = (uint64_t *)v7;
      if (v6)
        v9 = (int (__cdecl *)(unsigned int, void *, void *, void *))sub_20AA61CC0;
      else
        v9 = 0;
      sqlite3_trace_v2(*(sqlite3 **)(v7 + 8), 2u, v9, 0);
      v10 = *v8;
      if (*v8 && (*(_BYTE *)(v10 + 84) & 4) != 0)
        pthread_mutex_unlock((pthread_mutex_t *)(v10 + 88));
    }
  }
  return 0;
}

BOOL sub_20AA61C78()
{
  int v0;

  pthread_mutex_lock(&stru_253D846A8);
  v0 = dword_254613578;
  pthread_mutex_unlock(&stru_253D846A8);
  return (sub_20AA65880() | v0) != 0;
}

uint64_t sub_20AA61CC0(int a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a1 == 2)
  {
    if (a4)
    {
      v5 = *a4;
      if (IMOSLoggingEnabled())
      {
        v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v8 = 136315394;
          v9 = a3;
          v10 = 2048;
          v11 = v5 >> 20;
          _os_log_impl(&dword_20AA57000, v6, OS_LOG_TYPE_INFO, "==\nCSDBSqlite: %s\nTime: %llu ms\n", (uint8_t *)&v8, 0x16u);
        }
      }
    }
  }
  return 0;
}

uint64_t CSDBSqliteSetupLoggingForDatabaseHandle(sqlite3 *a1)
{
  uint64_t result;

  result = sub_20AA61C78();
  if (a1)
  {
    if ((_DWORD)result)
      return sqlite3_trace_v2(a1, 2u, (int (__cdecl *)(unsigned int, void *, void *, void *))sub_20AA61CC0, 0);
  }
  return result;
}

uint64_t sub_20AA61DF4(uint64_t a1, int a2, char **a3, const char **a4)
{
  int v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  char *v12;
  _BOOL4 v13;
  NSObject *v14;
  const char *v15;
  char *v16;
  NSObject *v18;
  const char *v19;
  int v20;
  const char *v21;
  __int16 v22;
  char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = *(unsigned __int8 *)(a1 + 16);
  if (!*(_BYTE *)(a1 + 16))
  {
    if (*(_BYTE *)(a1 + 1))
    {
      if (IMOSLoggingEnabled())
      {
        v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = *(const char **)(a1 + 8);
          v20 = 136315138;
          v21 = v10;
          _os_log_impl(&dword_20AA57000, v9, OS_LOG_TYPE_INFO, "----- Explaining Query -----\n%s\n", (uint8_t *)&v20, 0xCu);
        }
      }
      v8 = 1;
      *(_BYTE *)(a1 + 16) = 1;
      *(_DWORD *)(a1 + 20) = 1;
    }
    else
    {
      v8 = 0;
    }
  }
  if (a2 >= 1)
  {
    v11 = a2;
    while (strcmp(*a4, "detail"))
    {
      ++a3;
      ++a4;
      if (!--v11)
        return 0;
    }
    v12 = *a3;
    if (strstr(*a3, "WITH INDEX") || strstr(v12, "USING PRIMARY KEY"))
    {
      v13 = 0;
      if (*(_BYTE *)(a1 + 2) && !v8)
        return 0;
    }
    else
    {
      v13 = *(_BYTE *)(a1 + 2) != 0;
      if (!v8 && *(_BYTE *)(a1 + 2))
      {
        if (*(_BYTE *)(a1 + 1))
        {
          v13 = 1;
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            v18 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              v19 = *(const char **)(a1 + 8);
              v20 = 136315138;
              v21 = v19;
              _os_log_impl(&dword_20AA57000, v18, OS_LOG_TYPE_INFO, "--------------------------\n !!!!! NOT INDEXED !!!!!\n--------------------------\n%s\n--------------------------\n", (uint8_t *)&v20, 0xCu);
            }
          }
          v13 = 1;
          *(_BYTE *)(a1 + 16) = 1;
          *(_DWORD *)(a1 + 20) = 2;
        }
      }
    }
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = "";
        v16 = *a3;
        if (v13)
          v15 = " ***** NO INDEX *****";
        v20 = 136315394;
        v21 = v15;
        v22 = 2080;
        v23 = v16;
        _os_log_impl(&dword_20AA57000, v14, OS_LOG_TYPE_INFO, " ==>>%s %s\n", (uint8_t *)&v20, 0x16u);
      }
    }
  }
  return 0;
}

void CSDBSqliteConnectionFlushStatementCache(uint64_t a1)
{
  const void *v2;

  if (a1)
  {
    v2 = *(const void **)(a1 + 16);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(a1 + 16) = 0;
    }
  }
}

void CSDBSqliteConnectionSetBusyTimeout(double a1)
{
  NSObject *v2;
  int v3;
  double v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  qword_254613548 = *(_QWORD *)&a1;
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = 134217984;
      v4 = a1;
      _os_log_impl(&dword_20AA57000, v2, OS_LOG_TYPE_INFO, "Set Busy timeout to %f", (uint8_t *)&v3, 0xCu);
    }
  }
}

double CSDBSqliteConnectionGetBusyTimeout()
{
  return *(double *)&qword_254613548;
}

uint64_t CSDBSqliteConnectionBegin(uint64_t a1)
{
  return CSDBSqliteConnectionBeginTransactionType(a1, 0);
}

uint64_t CSDBSqliteConnectionRollback(uint64_t a1)
{
  uint64_t result;

  if (sqlite3_get_autocommit(*(sqlite3 **)(a1 + 8)))
    return 0;
  result = CSDBSqliteConnectionPerformSQL(a1, CFSTR("ROLLBACK;"));
  *(_DWORD *)(a1 + 40) = 0xFFFF;
  return result;
}

uint64_t CSDBSqliteConnectionAddRecord(uint64_t a1, const __CFString *a2, const char **a3, unsigned int a4)
{
  return CSDBSqliteConnectionAddRecordWithRowid(a1, a2, -1, a3, a4);
}

void CSDBSqliteStatementBindValuesForColumns(uint64_t a1, uint64_t a2, unsigned int a3)
{
  BOOL v4;
  uint64_t v6;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 8))
      v4 = a3 == 0;
    else
      v4 = 1;
    if (!v4)
    {
      v6 = a3;
      do
      {
        CSDBSqliteBindColumnValue(a1, a2);
        a2 += 24;
        --v6;
      }
      while (v6);
    }
  }
}

uint64_t CSDBSqliteConnectionUpdateRecord(uint64_t a1, const __CFString *a2, sqlite3_int64 a3, __int128 *a4, unsigned int a5)
{
  const __CFAllocator *v9;
  CFMutableStringRef Mutable;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  _QWORD *v14;
  sqlite3_stmt *v15;
  uint64_t v16;
  __int128 v19;
  uint64_t v20;

  if (!a5)
    return 1;
  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  CFStringAppend(Mutable, CFSTR("UPDATE "));
  CFStringAppend(Mutable, a2);
  CFStringAppend(Mutable, CFSTR(" SET "));
  v11 = 0;
  v12 = a5;
  do
  {
    v13 = CFStringCreateWithCString(v9, *(const char **)((char *)a4 + v11), 0x8000100u);
    if (v11)
      CFStringAppend(Mutable, CFSTR(", "));
    CFStringAppend(Mutable, v13);
    CFStringAppend(Mutable, CFSTR(" = ?"));
    CFRelease(v13);
    v11 += 24;
  }
  while (24 * a5 != v11);
  CFStringAppend(Mutable, CFSTR(" WHERE ROWID = ?;"));
  v14 = sub_20AA5B910(a1, Mutable, 0);
  CFRelease(Mutable);
  if (!v14)
    return 1;
  do
  {
    v19 = *a4;
    v20 = *((_QWORD *)a4 + 2);
    CSDBSqliteBindColumnValue((uint64_t)v14, (uint64_t)&v19);
    a4 = (__int128 *)((char *)a4 + 24);
    --v12;
  }
  while (v12);
  CSDBSqliteBindInt64((uint64_t)v14, a3);
  v15 = (sqlite3_stmt *)v14[1];
  if (v15)
    v16 = CSDBSqliteStepWithConnection(*v14, v15);
  else
    v16 = 1;
  CSDBSqliteStatementReset(v14);
  return v16;
}

UInt8 *CSDBSqliteConnectionCopyValuesForPropertiesLike(UInt8 *result, const __CFString *a2, __CFArray **a3, __CFArray **a4)
{
  sqlite3_stmt **v7;
  sqlite3_stmt *v8;
  __CFArray *Mutable;
  __CFArray *v10;
  const __CFAllocator *v11;
  const void *v12;
  const CFArrayCallBacks *v13;
  int v14;
  const unsigned __int8 *v15;
  CFStringRef v16;
  const void *v17;
  const unsigned __int8 *v18;
  CFStringRef v19;
  const void *v20;
  NSObject *v21;
  const char *v22;
  int v23;
  int v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    if (*(_QWORD *)result)
    {
      result = (UInt8 *)sub_20AA5B910((uint64_t)result, CFSTR("SELECT key, value FROM _SqliteDatabaseProperties WHERE key LIKE ?;"),
                          0);
      if (result)
      {
        v7 = (sqlite3_stmt **)result;
        CSDBSqliteBindTextFromCFString(result, a2);
        v8 = v7[1];
        if (v8)
        {
          Mutable = 0;
          v10 = 0;
          v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          v12 = (const void *)*MEMORY[0x24BDBD430];
          v13 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
          while (1)
          {
            v14 = CSDBSqliteStepWithConnection((int)*v7, v8);
            if (v14 != 100)
            {
              if (v14 == 101)
                goto LABEL_39;
              goto LABEL_36;
            }
            if (!a3)
              goto LABEL_19;
            v15 = sqlite3_column_text(v7[1], 0);
            v16 = v15 ? CFStringCreateWithCString(v11, (const char *)v15, 0x8000100u) : 0;
            if ((unint64_t)a4 | (unint64_t)v16)
              break;
LABEL_31:
            v8 = v7[1];
            if (!v8)
              goto LABEL_36;
          }
          if (!Mutable)
            Mutable = CFArrayCreateMutable(v11, 0, v13);
          if (v16)
            v17 = v16;
          else
            v17 = v12;
          CFArrayAppendValue(Mutable, v17);
          if (v16)
            CFRelease(v16);
LABEL_19:
          if (a4)
          {
            v18 = sqlite3_column_text(v7[1], 1);
            v19 = v18 ? CFStringCreateWithCString(v11, (const char *)v18, 0x8000100u) : 0;
            if ((unint64_t)a3 | (unint64_t)v19)
            {
              if (!v10)
                v10 = CFArrayCreateMutable(v11, 0, v13);
              if (v19)
                v20 = v19;
              else
                v20 = v12;
              CFArrayAppendValue(v10, v20);
              if (v19)
                CFRelease(v19);
            }
          }
          goto LABEL_31;
        }
        v10 = 0;
        Mutable = 0;
LABEL_36:
        if (IMOSLoggingEnabled())
        {
          v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = sqlite3_errmsg(*((sqlite3 **)*v7 + 1));
            v23 = sqlite3_extended_errcode(*((sqlite3 **)*v7 + 1));
            v24 = 136315650;
            v25 = "CSDBSqliteConnectionCopyValuesForPropertiesLike";
            v26 = 2080;
            v27 = v22;
            v28 = 1024;
            v29 = v23;
            _os_log_impl(&dword_20AA57000, v21, OS_LOG_TYPE_INFO, "%s: %s (%d)\n", (uint8_t *)&v24, 0x1Cu);
          }
        }
LABEL_39:
        result = (UInt8 *)CSDBSqliteStatementReset(v7);
        if (a3 && Mutable)
          *a3 = Mutable;
        if (a4)
        {
          if (v10)
            *a4 = v10;
        }
      }
    }
  }
  return result;
}

uint64_t CSDBSqliteConnectionIntegerForPropertyWithDefaultValue(uint64_t a1, const __CFString *a2, unsigned int a3)
{
  uint64_t result;
  BOOL v5;

  v5 = 0;
  LODWORD(result) = sub_20AA5C534(a1, a2, 0, &v5);
  if (v5)
    return result;
  else
    return a3;
}

const char *CSDBSqliteErrMsg(const char *result)
{
  if (result)
    return sqlite3_errmsg(*((sqlite3 **)result + 1));
  return result;
}

void CSDBSetCorruptedDatabaseHandler(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  NSObject *v9;
  NSObject *v10;
  _OWORD v11[2];
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    qword_253D84678 = a1;
    if (IMOSLoggingEnabled())
    {
      v1 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11[0]) = 0;
        _os_log_impl(&dword_20AA57000, v1, OS_LOG_TYPE_INFO, "setting corruption handler", (uint8_t *)v11, 2u);
      }
    }
  }
  else
  {
    v11[0] = xmmword_24C35A150;
    v11[1] = *(_OWORD *)off_24C35A160;
    v12 = 1982;
    v2 = (void *)MEMORY[0x24BDD17C8];
    v3 = IMFileLocationTrimFileName();
    v5 = objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v4, (uint64_t)&stru_24C35A5D0);
    v7 = objc_msgSend_stringWithFormat_(v2, v6, (uint64_t)CFSTR("Unexpected nil '%@' in %s at %s:%d. %@"), CFSTR("function"), "void CSDBSetCorruptedDatabaseHandler(CSDBCorruptedDatabaseHandler)", v3, 1982, v5);
    v8 = (void (*)(uint64_t))IMGetAssertionFailureHandler();
    if (v8)
    {
      v8(v7);
    }
    else if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v13 = 138412290;
        v14 = v7;
        _os_log_impl(&dword_20AA57000, v9, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", (uint8_t *)&v13, 0xCu);
      }
    }
    if ((IMOSLoggingEnabled() & 1) != 0)
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11[0]) = 0;
        _os_log_impl(&dword_20AA57000, v10, OS_LOG_TYPE_INFO, "setting NULL corruption handler (set to default)", (uint8_t *)v11, 2u);
      }
    }
    qword_253D84678 = (uint64_t)CSDBSetAsideInPlaceCorruptedDatabaseHandler;
  }
}

void CSDBSetAsideInPlaceCorruptedDatabaseHandler(void **a1, char *a2, uint64_t a3, uint64_t a4, sqlite3_stmt *a5)
{
  int v7;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  NSObject *v29;
  const char *v30;
  const char *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  sqlite3 *ppDb;
  _BYTE buf[40];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v7 = a3;
  v38 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v10 = *a1;
    v11 = (void *)objc_msgSend_stringByDeletingPathExtension(*a1, a2, a3);
  }
  else
  {
    v10 = 0;
    v11 = (void *)objc_msgSend_stringByDeletingPathExtension(0, a2, a3);
  }
  v14 = (id)objc_msgSend_mutableCopy(v11, v12, v13);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x24BDBCE60], v15, v16);
  v18 = v17;
  v34 = objc_msgSend_pathExtension(v10, v19, v20);
  objc_msgSend_appendFormat_(v14, v21, (uint64_t)CFSTR("-corrupted-(%f).%@"));
  if (IMOSLoggingEnabled())
  {
    v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v7;
      *(_WORD *)&buf[8] = 2112;
      *(_QWORD *)&buf[10] = v10;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v14;
      *(_WORD *)&buf[28] = 2080;
      *(_QWORD *)&buf[30] = a4;
      _os_log_impl(&dword_20AA57000, v29, OS_LOG_TYPE_INFO, "encountered corruption error %d while accessing %@, attempting to set aside database here: %@. Called from: %s", buf, 0x26u);
    }
  }
  if (a5)
    sub_20AA631A8((sqlite3 *)a2, a4, a5, v24, v25, v26, v27, v28, v18, v34, v35, (uint64_t)ppDb, *(uint64_t *)buf, *(uint64_t *)&buf[8], *(uint64_t *)&buf[16], *(uint64_t *)&buf[24], *(uint64_t *)&buf[32], v38, v39,
      v40,
      v41,
      v42);
  v30 = (const char *)objc_msgSend_UTF8String(v14, v22, v23);
  v31 = v30;
  if (v30)
  {
    ppDb = 0;
    if (!sqlite3_open(v30, &ppDb))
    {
      if (!sqlite3_file_control(ppDb, 0, 102, a2) && IMOSLoggingEnabled())
      {
        v32 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v10;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = v31;
          *(_WORD *)&buf[22] = 2080;
          *(_QWORD *)&buf[24] = a4;
          _os_log_impl(&dword_20AA57000, v32, OS_LOG_TYPE_INFO, "Database at path %@ is corrupt. Copying it to %s for further investigation. Called from: %s.", buf, 0x20u);
        }
      }
      sqlite3_close(ppDb);
    }
    sub_20AA63328((sqlite3 *)a2, v10);
  }
  else if (IMOSLoggingEnabled())
  {
    v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2080;
      *(_QWORD *)&buf[24] = a4;
      _os_log_impl(&dword_20AA57000, v33, OS_LOG_TYPE_INFO, "SQLITE_CORRUPT handling code is unable to set aside the corrupt database because the path is unknown.  db=%p, path=%@. Called from: %s.", buf, 0x20u);
    }
  }
}

void (*CSDBGetCorruptDatabaseHandler())(void **a1, char *a2, uint64_t a3, uint64_t a4, sqlite3_stmt *a5)
{
  void (*result)(void **, char *, uint64_t, uint64_t, sqlite3_stmt *);
  NSObject *v1;
  uint8_t v2[16];

  if (qword_254613558 != -1)
    dispatch_once(&qword_254613558, &unk_24C35A0D8);
  if (!byte_254613550)
    return (void (*)(void **, char *, uint64_t, uint64_t, sqlite3_stmt *))CSDBDefaultCorruptedDatabaseHandler;
  result = (void (*)(void **, char *, uint64_t, uint64_t, sqlite3_stmt *))qword_253D84678;
  if (!qword_253D84678)
  {
    if (IMOSLoggingEnabled())
    {
      v1 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v2 = 0;
        _os_log_impl(&dword_20AA57000, v1, OS_LOG_TYPE_INFO, "No database corruption handler found - resetting to default handler", v2, 2u);
      }
    }
    result = CSDBSetAsideInPlaceCorruptedDatabaseHandler;
    qword_253D84678 = (uint64_t)CSDBSetAsideInPlaceCorruptedDatabaseHandler;
  }
  return result;
}

uint64_t sub_20AA62D40(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t result;

  v3 = (void *)objc_msgSend_sharedInstance(MEMORY[0x24BE508A8], a2, a3);
  result = objc_msgSend_isInternalInstall(v3, v4, v5);
  byte_254613550 = result;
  return result;
}

void CSDBDefaultCorruptedDatabaseHandler(const __CFString **a1, sqlite3 *a2, int a3, uint64_t a4, sqlite3_stmt *a5)
{
  __CFString *v10;
  UInt8 *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  NSObject *v17;
  char *v18;
  char *v19;
  size_t v20;
  const __CFURL *v21;
  const __CFURL *v22;
  const __CFString *PathComponent;
  const __CFString *v24;
  NSString *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  sqlite3 *ppDb;
  _BYTE buf[40];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v38 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v10 = 0;
    goto LABEL_5;
  }
  v10 = (__CFString *)*a1;
  if (!*a1)
  {
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v11 = CSDBCreateUTF8StringFromCFString(*a1);
LABEL_6:
  if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = a3;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = v11;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = a4;
      _os_log_impl(&dword_20AA57000, v17, OS_LOG_TYPE_INFO, "SQLITE_CORRUPT encountered error %d while accessing %s, exiting with default corruption handler! Called from: %s", buf, 0x1Cu);
    }
  }
  if (a5)
    sub_20AA631A8(a2, a4, a5, v12, v13, v14, v15, v16, v33, v34, v35, (uint64_t)ppDb, *(uint64_t *)buf, *(uint64_t *)&buf[8], *(uint64_t *)&buf[16], *(uint64_t *)&buf[24], *(uint64_t *)&buf[32], v38, v39,
      v40,
      v41,
      v42);
  if (v11)
  {
    v18 = (char *)malloc_type_calloc(1uLL, 0x400uLL, 0x72BE54EDuLL);
    v19 = (char *)malloc_type_calloc(1uLL, 0x400uLL, 0xBA0F5EEAuLL);
    ppDb = 0;
    if (v18)
    {
      v20 = strlen((const char *)v11);
      v21 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x24BDBD240], v11, v20, 0);
      v22 = v21;
      if (v21)
      {
        PathComponent = CFURLCopyLastPathComponent(v21);
        v24 = PathComponent;
        if (PathComponent)
        {
          CFStringGetCString(PathComponent, v18, 1024, 0x8000100u);
          CFRelease(v24);
        }
        CFRelease(v22);
      }
    }
    *(_QWORD *)buf = 0;
    v25 = NSTemporaryDirectory();
    v28 = (const char *)objc_msgSend_fileSystemRepresentation(v25, v26, v27);
    if (v28[strlen(v28) - 1] == 47)
      v29 = "";
    else
      v29 = "/";
    asprintf((char **)buf, "%s%s%s.XXXXXX", v28, v29, v18);
    if (*(_QWORD *)buf)
    {
      mkstemp(*(char **)buf);
      if (v19)
        __strlcpy_chk();
      free(*(void **)buf);
    }
    if (IMOSLoggingEnabled())
    {
      v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = a3;
        *(_WORD *)&buf[8] = 2112;
        *(_QWORD *)&buf[10] = v10;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = v19;
        *(_WORD *)&buf[28] = 2080;
        *(_QWORD *)&buf[30] = a4;
        _os_log_impl(&dword_20AA57000, v30, OS_LOG_TYPE_INFO, "encountered corruption error %d while accessing %@, attempting to set aside database here: %s. Called from: %s", buf, 0x26u);
      }
    }
    if (!sqlite3_open(v19, &ppDb))
    {
      if (!sqlite3_file_control(ppDb, 0, 102, a2) && IMOSLoggingEnabled())
      {
        v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = v19;
          *(_WORD *)&buf[22] = 2080;
          *(_QWORD *)&buf[24] = a4;
          _os_log_impl(&dword_20AA57000, v31, OS_LOG_TYPE_INFO, "Database at path %s is corrupt. Copied it to %s for further investigation. Called from: %s.", buf, 0x20u);
        }
      }
      sqlite3_close(ppDb);
    }
    free(v18);
    free(v19);
    sub_20AA63328(a2, v10);
    free(v11);
  }
  else if (IMOSLoggingEnabled())
  {
    v32 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      *(_QWORD *)&buf[24] = a4;
      _os_log_impl(&dword_20AA57000, v32, OS_LOG_TYPE_INFO, "SQLITE_CORRUPT handling code is unable to delete the corrupt database because the path is unknown.  db=%p, path=%s. Called from: %s", buf, 0x20u);
    }
  }
}

void sub_20AA631A8(sqlite3 *exc_buf, uint64_t a2, sqlite3_stmt *a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  NSObject *v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    if (IMOSLoggingEnabled())
    {
      v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = 136315906;
        v27 = a2;
        v28 = 2080;
        v29 = sqlite3_errmsg(exc_buf);
        v30 = 2080;
        v31 = sqlite3_sql(a3);
        v32 = 1024;
        v33 = sqlite3_extended_errcode(exc_buf);
        _os_log_impl(&dword_20AA57000, v25, OS_LOG_TYPE_INFO, "SQLite error in function: %s message: %s sql: %s (%d)", (uint8_t *)&v26, 0x26u);
      }
    }
  }
  else
  {
    sub_20AA63C58(exc_buf, a2);
  }
}

BOOL sub_20AA63328(sqlite3 *a1, void *a2)
{
  NSObject *v4;
  int v5;
  NSObject *v6;
  int v7;
  const char *v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  const char *v13;
  NSObject *v14;
  int v16;
  uint8_t buf[4];
  _BYTE v18[10];
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v18 = a2;
      _os_log_impl(&dword_20AA57000, v4, OS_LOG_TYPE_INFO, "Cleaning up corrupt database: %@", buf, 0xCu);
    }
  }
  v16 = 189;
  v5 = sqlite3_file_control(a1, 0, 101, &v16);
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = sqlite3_extended_errcode(a1);
        v8 = sqlite3_errmsg(a1);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v18 = v5;
        *(_WORD *)&v18[4] = 1024;
        *(_DWORD *)&v18[6] = v7;
        v19 = 2080;
        v20 = v8;
        _os_log_impl(&dword_20AA57000, v6, OS_LOG_TYPE_INFO, "_CSDBSqliteDatabaseCloseAndDelete unable to truncate database: %d (%d); %s",
          buf,
          0x18u);
      }
    }
  }
  v9 = sqlite3_close(a1);
  v10 = IMOSLoggingEnabled();
  if (v9)
  {
    if (v10)
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = sqlite3_extended_errcode(a1);
        v13 = sqlite3_errmsg(a1);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v18 = v9;
        *(_WORD *)&v18[4] = 1024;
        *(_DWORD *)&v18[6] = v12;
        v19 = 2080;
        v20 = v13;
        _os_log_impl(&dword_20AA57000, v11, OS_LOG_TYPE_INFO, "_CSDBSqliteDatabaseCloseAndDelete unable to close the source database. SQLite error: [%d] (%d) %s", buf, 0x18u);
        if (!v5)
          return v5 == 0;
        goto LABEL_17;
      }
    }
  }
  else if (v10)
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20AA57000, v14, OS_LOG_TYPE_INFO, "_CSDBSqliteDatabaseCloseAndDelete Closed the source database after truncation.", buf, 2u);
    }
  }
  if (v5)
LABEL_17:
    CSDBSqliteDeleteDatabase(a2);
  return v5 == 0;
}

void sub_20AA6358C(_Unwind_Exception *a1, int a2)
{
  int v2;

  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    if (!v2)
      JUMPOUT(0x20AA63550);
    JUMPOUT(0x20AA63548);
  }
  _Unwind_Resume(a1);
}

BOOL CSDBDatabasePassesIntegrityCheckAtPath(void *a1, const char *a2, uint64_t a3)
{
  const char *v3;
  int v4;
  const char *v5;
  uint64_t v6;
  sqlite3 *v8;
  const char *v9;
  int v10;
  int v12;
  sqlite3_stmt *pStmt;
  sqlite3 *ppDb;

  ppDb = 0;
  v3 = (const char *)objc_msgSend_UTF8String(a1, a2, a3);
  v4 = sqlite3_open_v2(v3, &ppDb, 1, 0);
  if ((v4 - 100) >= 2 && v4 != 0)
    return 0;
  pStmt = 0;
  v8 = ppDb;
  v9 = (const char *)objc_msgSend_UTF8String(CFSTR("PRAGMA integrity_check;"), v5, v6);
  v10 = sqlite3_prepare_v2(v8, v9, -1, &pStmt, 0);
  if ((v10 - 100) >= 2 && v10 != 0)
    goto LABEL_13;
  v12 = sqlite3_step(pStmt);
  if (v12 == 100)
  {
    do
      v10 = sqlite3_step(pStmt);
    while (v10 == 100);
LABEL_13:
    v12 = v10;
  }
  if (pStmt)
  {
    sqlite3_finalize(pStmt);
    pStmt = 0;
  }
  if (ppDb)
    sqlite3_close_v2(ppDb);
  return v12 == 101 || v12 == 0;
}

void sub_20AA636B8(void **a1, sqlite3 *a2, uint64_t a3, uint64_t a4, sqlite3_stmt *a5)
{
  void (*v10)(void **, char *, uint64_t, uint64_t, sqlite3_stmt *);
  void *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  NSObject *v22;
  const __CFString *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[24];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v10 = CSDBGetCorruptDatabaseHandler();
  if (v10)
  {
    v10(a1, (char *)a2, a3, a4, a5);
  }
  else
  {
    v29 = xmmword_24C35A1B8;
    v30 = *(_OWORD *)off_24C35A1C8;
    v31 = 2116;
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = IMFileLocationTrimFileName();
    v26 = 2116;
    v27 = objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v13, (uint64_t)&stru_24C35A5D0);
    v24 = "void _CSDBHandleCorruptError(CSDBSqliteDatabase *, sqlite3 *, int, const char *, sqlite3_stmt *)";
    v25 = v12;
    v23 = CFSTR("handler");
    v15 = objc_msgSend_stringWithFormat_(v11, v14, (uint64_t)CFSTR("Unexpected nil '%@' in %s at %s:%d. %@"));
    v16 = (void (*)(uint64_t))IMGetAssertionFailureHandler();
    if (v16)
    {
      v16(v15);
    }
    else if (IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v15;
        _os_log_impl(&dword_20AA57000, v22, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }
    }
  }
  sub_20AA631A8(a2, a4, a5, v17, v18, v19, v20, v21, (uint64_t)v23, (uint64_t)v24, v25, v26, v27, v28, v29, *((uint64_t *)&v29 + 1), v30, *((uint64_t *)&v30 + 1), v31,
    v32,
    *(uint64_t *)buf,
    *(uint64_t *)&buf[8]);
  exit(2);
}

uint64_t sub_20AA63834()
{
  uint64_t result;

  result = IMGetAppBoolForKey();
  byte_254613568 = result;
  return result;
}

__CFArray *CSDBSqliteStatementCopyAllRowsStringsForColumnsAtIndices(uint64_t a1, CFArrayRef theArray)
{
  const __CFAllocator *v4;
  CFIndex Count;
  __CFArray *Mutable;
  sqlite3_stmt *v7;
  const CFArrayCallBacks *v8;
  CFIndex v9;
  __CFArray *v10;
  CFIndex v11;
  const __CFNumber *ValueAtIndex;
  const unsigned __int8 *v13;
  CFStringRef v14;
  CFStringRef v15;
  int valuePtr;

  if (!a1 || !*(_QWORD *)(a1 + 8))
    return 0;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Count = CFArrayGetCount(theArray);
  Mutable = CFArrayCreateMutable(v4, Count, MEMORY[0x24BDBD690]);
  v7 = *(sqlite3_stmt **)(a1 + 8);
  if (v7)
  {
    v8 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
    do
    {
      if (CSDBSqliteStepWithConnection(*(_QWORD *)a1, v7) != 100)
        break;
      v9 = CFArrayGetCount(theArray);
      v10 = CFArrayCreateMutable(v4, v9, v8);
      if (Mutable && CFArrayGetCount(theArray) >= 1)
      {
        v11 = 0;
        do
        {
          valuePtr = 0;
          ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(theArray, v11);
          CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr);
          v13 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 8), valuePtr);
          if (v13)
          {
            v14 = CFStringCreateWithCString(v4, (const char *)v13, 0x8000100u);
            if (v14)
            {
              v15 = v14;
              CFArrayAppendValue(v10, v14);
              CFRelease(v15);
            }
          }
          ++v11;
        }
        while (CFArrayGetCount(theArray) > v11);
      }
      CFArrayAppendValue(Mutable, v10);
      CFRelease(v10);
      v7 = *(sqlite3_stmt **)(a1 + 8);
    }
    while (v7);
  }
  return Mutable;
}

CFArrayRef CSDBSqliteStatementCopyStringsForColumnsAtIndices(uint64_t a1, const __CFArray *a2)
{
  __CFArray *v2;
  const __CFArray *v3;
  const __CFAllocator *v4;
  const __CFArray *ValueAtIndex;
  CFArrayRef Copy;

  v2 = CSDBSqliteStatementCopyAllRowsStringsForColumnsAtIndices(a1, a2);
  if (!v2)
    return 0;
  v3 = v2;
  if (CFArrayGetCount(v2) < 1)
  {
    Copy = 0;
  }
  else
  {
    v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(v3, 0);
    Copy = CFArrayCreateCopy(v4, ValueAtIndex);
  }
  CFRelease(v3);
  return Copy;
}

CFDataRef CSDBSqliteStatementCopyDataResult(uint64_t a1)
{
  sqlite3_stmt *v2;
  const UInt8 *v3;
  int v4;

  if (a1
    && (v2 = *(sqlite3_stmt **)(a1 + 8)) != 0
    && CSDBSqliteStepWithConnection(*(_QWORD *)a1, v2) == 100
    && (v3 = (const UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 8), 0),
        v4 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 8), 0),
        v3)
    && v4 >= 1)
  {
    return CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v3, v4);
  }
  else
  {
    return 0;
  }
}

sqlite3_int64 CSDBSqliteStatementInteger64ResultColumn(uint64_t a1, int a2)
{
  return sqlite3_column_int64(*(sqlite3_stmt **)(a1 + 8), a2);
}

void CSDBSqliteBindDouble(uint64_t a1, double a2)
{
  sqlite3_stmt *v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v3 = *(sqlite3_stmt **)(a1 + 8);
    if (v3)
    {
      v4 = *(_DWORD *)(a1 + 16);
      if (v4 >= 1)
      {
        sqlite3_bind_double(v3, v4, a2);
LABEL_12:
        ++*(_DWORD *)(a1 + 16);
        return;
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("YES");
      if (a1)
      {
        v7 = *(_DWORD *)(a1 + 16);
      }
      else
      {
        v6 = CFSTR("NO");
        v7 = 0;
      }
      v8 = 138412546;
      v9 = v6;
      v10 = 1024;
      v11 = v7;
      _os_log_impl(&dword_20AA57000, v5, OS_LOG_TYPE_INFO, "Invalid parameters passed into CSDBSqliteBindDouble s==NULL ? %@  bindIndex = %d", (uint8_t *)&v8, 0x12u);
    }
  }
  if (a1)
    goto LABEL_12;
}

UInt8 *CSDBSqliteBindTextFromCFArrayOfCFStrings(UInt8 *result, CFArrayRef theArray)
{
  UInt8 *v3;
  CFIndex v4;
  uint64_t v5;
  const __CFString *ValueAtIndex;

  if (theArray)
  {
    v3 = result;
    result = (UInt8 *)CFArrayGetCount(theArray);
    if ((int)result >= 1)
    {
      v4 = 0;
      if (result <= 1uLL)
        v5 = 1;
      else
        v5 = result;
      do
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v4);
        result = CSDBSqliteBindTextFromCFString(v3, ValueAtIndex);
        ++v4;
      }
      while (v5 != v4);
    }
  }
  return result;
}

void sub_20AA63C58(sqlite3 *a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 136315650;
      v6 = a2;
      v7 = 2080;
      v8 = sqlite3_errmsg(a1);
      v9 = 1024;
      v10 = sqlite3_extended_errcode(a1);
      _os_log_impl(&dword_20AA57000, v4, OS_LOG_TYPE_INFO, "SQLite error in function: %s for handle: %s (%d)", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void CSDBSqliteStatementApplyValuesFromRecord(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  sub_20AA5A4B0(a1, a2, a3, a4, 0, 0);
}

uint64_t CSDBSqliteUtilitiesGetSchemaVersionAtPathWithProtection(const __CFString *a1)
{
  UInt8 *v1;
  int v2;
  sqlite3 *v3;
  uint64_t v4;
  int v5;
  sqlite3_stmt *v6;
  sqlite3_stmt *pStmt;
  sqlite3 *ppDb;

  v1 = CSDBCreateUTF8StringFromCFString(a1);
  ppDb = 0;
  v2 = sqlite3_open_v2((const char *)v1, &ppDb, 1, 0);
  v3 = ppDb;
  if (ppDb)
  {
    if (v2)
    {
      v4 = 0xFFFFFFFFLL;
    }
    else
    {
      pStmt = 0;
      v5 = sqlite3_prepare_v2(ppDb, "SELECT value FROM _SqliteDatabaseProperties WHERE key = ?;", 58, &pStmt, 0);
      v6 = pStmt;
      if (pStmt)
      {
        if (v5)
        {
          v4 = 0xFFFFFFFFLL;
        }
        else
        {
          sqlite3_bind_text(pStmt, 1, "_ClientVersion", 14, 0);
          if (sqlite3_step(pStmt) == 100)
            v4 = sqlite3_column_int(pStmt, 0);
          else
            v4 = 0xFFFFFFFFLL;
          sqlite3_reset(pStmt);
          v6 = pStmt;
        }
        sqlite3_finalize(v6);
      }
      else
      {
        v4 = 0xFFFFFFFFLL;
      }
      v3 = ppDb;
    }
    sqlite3_close(v3);
  }
  else
  {
    v4 = 0xFFFFFFFFLL;
  }
  free(v1);
  return v4;
}

uint64_t CSDBSqliteSetDefaultPageCacheSize(uint64_t result)
{
  if ((int)result >= 1)
    dword_253D84680 = result;
  return result;
}

uint64_t CSDBSqliteDatabaseCheckIntegrity(uint64_t a1)
{
  sqlite3_stmt **v1;
  sqlite3_stmt **v2;
  sqlite3_stmt *v3;
  const __CFAllocator *v4;
  const char *v5;
  uint64_t v6;
  const unsigned __int8 *v7;
  __CFString *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  __int16 v16[8];

  v1 = (sqlite3_stmt **)sub_20AA5B910(a1, CFSTR("PRAGMA integrity_check"), 0);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = v1[1];
  if (!v3)
    return 0;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  while (1)
  {
    if (CSDBSqliteStepWithConnection((int)*v2, v3) != 100)
    {
LABEL_10:
      v13 = 0;
      goto LABEL_16;
    }
    if (sqlite3_column_text(v2[1], 0))
    {
      v7 = sqlite3_column_text(v2[1], 0);
      v8 = (__CFString *)CFStringCreateWithCString(v4, (const char *)v7, 0x8000100u);
      v11 = (void *)objc_msgSend_lowercaseString(v8, v9, v10);
    }
    else
    {
      v8 = 0;
      v11 = (void *)objc_msgSend_lowercaseString(0, v5, v6);
    }
    if (objc_msgSend_isEqualToString_(v11, v12, (uint64_t)CFSTR("ok")))
      break;

    v3 = v2[1];
    if (!v3)
      goto LABEL_10;
  }
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16[0] = 0;
      _os_log_impl(&dword_20AA57000, v14, OS_LOG_TYPE_INFO, "This DB passed its integrity check.", (uint8_t *)v16, 2u);
    }
  }

  v13 = 1;
LABEL_16:
  CSDBSqliteStatementReset(v2);
  return v13;
}

_QWORD *CSDBSqliteStep(_QWORD *result)
{
  sqlite3_stmt *v1;

  if (result)
  {
    v1 = (sqlite3_stmt *)result[1];
    if (v1)
      return (_QWORD *)(CSDBSqliteStepWithConnection(*result, v1) == 100);
    else
      return 0;
  }
  return result;
}

uint64_t CSDBRegisterReconnectBlockWithIdentifier(void *a1, uint64_t a2, void *a3)
{
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t second;
  const char *v14;

  pthread_mutex_lock(&stru_254613508);
  if (!qword_254613570)
    qword_254613570 = (uint64_t)objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (a1 && a2 && a3)
  {
    v8 = (void *)objc_msgSend_copy(a1, v6, v7);
    v11 = sub_20AA61764(a3, v9, v10);
    second = objc_msgSend_pairWithFirst_second_(MEMORY[0x24BE508B8], v12, (uint64_t)v8, v11);
    objc_msgSend_setObject_forKey_((void *)qword_254613570, v14, second, a2);
    if (v11)
      CFRelease(v11);

  }
  return pthread_mutex_unlock(&stru_254613508);
}

uint64_t CSDBDeregisterReconnectBlockWithIdentifier(uint64_t a1)
{
  const char *v2;

  pthread_mutex_lock(&stru_254613508);
  if (a1 && qword_254613570)
    objc_msgSend_removeObjectForKey_((void *)qword_254613570, v2, a1);
  return pthread_mutex_unlock(&stru_254613508);
}

uint64_t CSDBGetLastSQLCommands()
{
  return 0;
}

sqlite3 **sub_20AA64128(uint64_t *a1, const char *a2, char a3)
{
  sqlite3 **v5;
  timespec v6;
  uid_t st_uid;
  NSObject *v8;
  NSObject *v9;
  int *v10;
  char *v11;
  const __CFString *v12;
  UInt8 *v13;
  int v14;
  int v15;
  int v16;
  sqlite3 **v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  NSObject *v22;
  uint64_t v23;
  sqlite3 *v24;
  timespec v25;
  int (__cdecl *v26)(void *, int);
  void (*v27)(uint64_t *, sqlite3 **);
  int v30;
  stat v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = (sqlite3 **)malloc_type_calloc(1uLL, 0x38uLL, 0x10A004033174AE8uLL);
  if (strcmp(a2, ":memory:"))
  {
    if (access(a2, 6) == -1 && *__error() != 2)
    {
      v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      *(timespec *)v31.st_qspare = v6;
      *(timespec *)&v31.st_size = v6;
      *(timespec *)&v31.st_blksize = v6;
      v31.st_ctimespec = v6;
      v31.st_birthtimespec = v6;
      v31.st_atimespec = v6;
      v31.st_mtimespec = v6;
      *(timespec *)&v31.st_dev = v6;
      *(timespec *)&v31.st_uid = v6;
      if (!stat(a2, &v31))
      {
        st_uid = v31.st_uid;
        if (st_uid == geteuid())
        {
          if (IMOSLoggingEnabled())
          {
            v8 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            {
              v31.st_dev = 136315138;
              *(_QWORD *)&v31.st_mode = a2;
              _os_log_impl(&dword_20AA57000, v8, OS_LOG_TYPE_INFO, "Fixing permissions on %s", (uint8_t *)&v31, 0xCu);
            }
          }
          if (chmod(a2, 0x180u) < 0)
          {
            if (IMOSLoggingEnabled())
            {
              v9 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
              {
                v10 = __error();
                v11 = strerror(*v10);
                v31.st_dev = 136315394;
                *(_QWORD *)&v31.st_mode = v11;
                WORD2(v31.st_ino) = 2080;
                *(__darwin_ino64_t *)((char *)&v31.st_ino + 6) = (__darwin_ino64_t)a2;
                _os_log_impl(&dword_20AA57000, v9, OS_LOG_TYPE_INFO, "Error %s setting permissions on %s", (uint8_t *)&v31, 0x16u);
              }
            }
          }
        }
      }
    }
  }
  v12 = (const __CFString *)a1[22];
  if (v12)
    v13 = CSDBCreateUTF8StringFromCFString(v12);
  else
    v13 = 0;
  v14 = *((_DWORD *)a1 + 46);
  if (v14)
    v15 = 4194310;
  else
    v15 = 3145734;
  if (v14 == 1)
    v16 = 1048582;
  else
    v16 = v15;
  v17 = v5 + 1;
  v18 = sqlite3_open_v2(a2, v5 + 1, v16, (const char *)v13);
  if ((*((_BYTE *)a1 + 196) & 1) != 0)
  {
    v19 = *((unsigned int *)a1 + 48);
    if ((v19 & 0x80000000) == 0)
    {
      v20 = *((_DWORD *)a1 + 47);
      if ((v20 & 0x80000000) == 0)
      {
        v21 = sqlite3_db_config(*v17, 1001, 0, *((unsigned int *)a1 + 47), v19);
        v22 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = *a1;
          v31.st_dev = 67109890;
          *(_DWORD *)&v31.st_mode = v21;
          LOWORD(v31.st_ino) = 1024;
          *(_DWORD *)((char *)&v31.st_ino + 2) = v20;
          HIWORD(v31.st_ino) = 1024;
          v31.st_uid = v19;
          LOWORD(v31.st_gid) = 2112;
          *(_QWORD *)((char *)&v31.st_gid + 2) = v23;
          _os_log_impl(&dword_20AA57000, v22, OS_LOG_TYPE_DEFAULT, "sqlite3_db_config lookaside set {result: %d, size: %d, count: %d, path: %@}", (uint8_t *)&v31, 0x1Eu);
        }
      }
    }
  }
  if ((a3 & 1) == 0)
    chmod(a2, 0x1FFu);
  if (v13)
    free(v13);
  v24 = *v17;
  if (!*v17 || v18)
  {
    if (v24)
    {
      sqlite3_close(v24);
      *v17 = 0;
    }
    free(v5);
    return 0;
  }
  else
  {
    *v5 = (sqlite3 *)a1;
    *((_DWORD *)v5 + 10) = 0xFFFF;
    v30 = 1;
    sqlite3_file_control(v24, 0, 10, &v30);
    if (dword_253D84680 >= 10)
    {
      v25.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v25.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      *(timespec *)&v31.st_size = v25;
      *(timespec *)&v31.st_blksize = v25;
      v31.st_ctimespec = v25;
      v31.st_birthtimespec = v25;
      v31.st_atimespec = v25;
      v31.st_mtimespec = v25;
      *(timespec *)&v31.st_dev = v25;
      *(timespec *)&v31.st_uid = v25;
      snprintf((char *)&v31, 0x80uLL, "PRAGMA cache_size=%d;", dword_253D84680);
      sqlite3_exec(*v17, (const char *)&v31, 0, 0, 0);
    }
    v26 = (int (__cdecl *)(void *, int))a1[20];
    if (v26)
      sqlite3_busy_handler(*v17, v26, (void *)a1[21]);
    else
      sqlite3_busy_timeout(*v17, 30000);
    CSDBSqliteSetupLoggingForDatabaseHandle(*v17);
    v27 = (void (*)(uint64_t *, sqlite3 **))a1[4];
    if (v27)
      v27(a1, v5);
  }
  return v5;
}

void sub_20AA6454C(void ****a1, _BYTE *a2)
{
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = sqlite3_errcode((sqlite3 *)(*a1)[1]);
  if ((_DWORD)v4)
  {
    v8 = v4;
    CSDBCheckResultWithStatement(**a1, (sqlite3 *)(*a1)[1], v4, (uint64_t)"checkConnectionStatus", 0, v5, v6, v7, v12, v13, (uint64_t)v14, v15, v16, v17, v18, v19, v20, v21, v22,
      v23,
      v24,
      v25);
    if ((v8 - 5) > 1)
    {
      if (v8 != 1)
      {
        if (v8 == 11)
        {
          sub_20AA618D8(*a1);
          *a1 = 0;
          if (a2)
            *a2 = 1;
        }
        else if (IMOSLoggingEnabled())
        {
          v9 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            v10 = sqlite3_extended_errcode((sqlite3 *)(*a1)[1]);
            v11 = sqlite3_errmsg((sqlite3 *)(*a1)[1]);
            LODWORD(v12) = 67109634;
            HIDWORD(v12) = v8;
            LOWORD(v13) = 1024;
            *(_DWORD *)((char *)&v13 + 2) = v10;
            HIWORD(v13) = 2080;
            v14 = v11;
            _os_log_impl(&dword_20AA57000, v9, OS_LOG_TYPE_INFO, "Encountered SQLite error %d (%d): %s", (uint8_t *)&v12, 0x18u);
          }
        }
      }
    }
    else
    {
      sub_20AA618D8(*a1);
      *a1 = 0;
    }
  }
}

sqlite3 **sub_20AA646EC(uint64_t *a1, const char *a2, sqlite3 ***a3)
{
  sqlite3 **result;

  if (*a3)
  {
    sub_20AA618D8(*a3);
    *a3 = 0;
  }
  result = sub_20AA64128(a1, a2, 1);
  *a3 = result;
  if (result)
    return (sqlite3 **)CSDBSqliteConnectionBeginTransactionType((uint64_t)result, 0);
  return result;
}

uint64_t sub_20AA64754(uint64_t a1, const char *a2, uint64_t *a3)
{
  void *v6;
  void *v7;
  uint64_t (*v8)(void);
  uint64_t (*v9)(void);
  CFStringRef v10;
  sqlite3 **v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  __int16 v20;
  uint8_t buf[2];
  BOOL v22;

  if (!*(_BYTE *)(a1 + 64))
    sub_20AA67018();
  if (*a3)
  {
    sub_20AA618D8((_QWORD *)*a3);
    *a3 = 0;
  }
  v6 = dlopen("/System/Library/PrivateFrameworks/DataMigration.framework/DataMigration", 1);
  if (v6)
  {
    v7 = v6;
    v8 = (uint64_t (*)(void))dlsym(v6, "DMPerformMigration");
    if (v8)
    {
      v9 = v8;
      v10 = CFStringCreateWithFormat(0, 0, CFSTR("Database version conflict detected: %s"), a2);
      LODWORD(v9) = v9();
      CFRelease(v10);
      dlclose(v7);
      if ((_DWORD)v9)
      {
        v11 = sub_20AA64128((uint64_t *)a1, a2, 1);
        *a3 = (uint64_t)v11;
        if (!v11)
          return 0;
        CSDBSqliteConnectionBeginTransactionType((uint64_t)v11, 0);
        v12 = *a3;
        v22 = 0;
        v13 = sub_20AA5C534(v12, CFSTR("_ClientVersion"), 0, &v22);
        v14 = 0;
        if (v22)
          v15 = v13;
        else
          v15 = 0;
        if (v15 == *(_DWORD *)(a1 + 80))
          return v14;
        if (IMOSLoggingEnabled())
        {
          v16 = OSLogHandleForIMFoundationCategory();
          v14 = 1;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v20 = 0;
            v17 = "migration was performed, but the version is still wrong. deleting database file.";
            v18 = (uint8_t *)&v20;
LABEL_19:
            _os_log_impl(&dword_20AA57000, v16, OS_LOG_TYPE_INFO, v17, v18, 2u);
            return v14;
          }
          return v14;
        }
        return 1;
      }
    }
    else
    {
      dlclose(v7);
    }
  }
  if (!IMOSLoggingEnabled())
    return 1;
  v16 = OSLogHandleForIMFoundationCategory();
  v14 = 1;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v17 = "migration daemon failed to upgrade";
    v18 = buf;
    goto LABEL_19;
  }
  return v14;
}

uint64_t sub_20AA64930(uint64_t a1, const char *a2, uint64_t a3, sqlite3 ***a4)
{
  uint64_t (*v5)(uint64_t, sqlite3 **, uint64_t, _QWORD);
  int v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  BOOL v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
    sub_20AA67040();
  v5 = *(uint64_t (**)(uint64_t, sqlite3 **, uint64_t, _QWORD))(a1 + 48);
  if (v5 && *(_QWORD *)(a1 + 56))
  {
    v9 = v5(a1, *a4, a3, *(_QWORD *)(a1 + 72));
    v10 = IMOSLoggingEnabled();
    if (v9)
    {
      if (v10)
      {
        v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20AA57000, v11, OS_LOG_TYPE_INFO, "doing the migration", buf, 2u);
        }
      }
      switch((*(uint64_t (**)(uint64_t, sqlite3 **, uint64_t, _QWORD))(a1 + 56))(a1, *a4, a3, *(_QWORD *)(a1 + 72)))
      {
        case 0:
          CSDBSqliteConnectionSetIntegerForProperty(*a4, CFSTR("_ClientVersion"), *(_DWORD *)(a1 + 80));
          if (IMOSLoggingEnabled())
          {
            v12 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              v13 = *(_DWORD *)(a1 + 80);
              v14 = (uint64_t)*a4;
              v22 = 0;
              v15 = sub_20AA5C534(v14, CFSTR("_ClientVersion"), 0, &v22);
              if (v22)
                v16 = v15;
              else
                v16 = 0;
              *(_DWORD *)buf = 67109376;
              v24 = v13;
              v25 = 1024;
              v26 = v16;
              _os_log_impl(&dword_20AA57000, v12, OS_LOG_TYPE_INFO, "set schema version %d (Read: %d)", buf, 0xEu);
            }
          }
          return 0;
        case 1:
          sub_20AA646EC((uint64_t *)a1, a2, a4);
          return 0;
        case 2:
          if (!IMOSLoggingEnabled())
            return 1;
          v17 = OSLogHandleForIMFoundationCategory();
          v18 = 1;
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            return v18;
          *(_WORD *)buf = 0;
          v19 = "Migration handler failed to upgrade: moving-aside database file";
          goto LABEL_21;
        case 3:
          if (IMOSLoggingEnabled())
          {
            v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_20AA57000, v20, OS_LOG_TYPE_INFO, "Migration handler: client is upgrading database in background", buf, 2u);
            }
          }
          if (!*a4)
            return 0;
          sub_20AA618D8(*a4);
          v18 = 0;
          *a4 = 0;
          return v18;
        default:
          return 0;
      }
    }
    if (v10)
    {
      v17 = OSLogHandleForIMFoundationCategory();
      v18 = 1;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v19 = "Incompatible versions detected, but migration handler is incapable of upgrading: moving-aside database file";
        goto LABEL_21;
      }
      return v18;
    }
    return 1;
  }
  if (!IMOSLoggingEnabled())
    return 1;
  v17 = OSLogHandleForIMFoundationCategory();
  v18 = 1;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v19 = "Incompatible versions detected, but no migration handlers provided: moving-aside database file";
LABEL_21:
    _os_log_impl(&dword_20AA57000, v17, OS_LOG_TYPE_INFO, v19, buf, 2u);
  }
  return v18;
}

sqlite3 **sub_20AA64CB0(uint64_t a1, const char *a2, int a3, uint64_t a4, sqlite3 ***a5)
{
  NSObject *v10;
  __CFString *MutableCopy;
  const __CFString *v12;
  NSObject *v13;
  NSObject *v14;
  CFStringRef v15;
  int v16;
  int v17;
  int v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  const char *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  NSObject *v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  NSObject *v35;
  int v36;
  const char *v37;
  NSObject *v38;
  int v39;
  int v40;
  NSObject *v41;
  int v42;
  int v43;
  const char *v44;
  const char *v45;
  const char *v46;
  NSObject *v47;
  uint32_t v48;
  NSObject *v49;
  int v50;
  int v51;
  NSObject *v52;
  int v53;
  const char *v54;
  const char *v55;
  NSObject *v56;
  uint32_t v57;
  NSObject *v58;
  BOOL v59;
  int v60;
  NSObject *v61;
  sqlite3 *db;
  sqlite3 *ppDb;
  uint8_t v64[4];
  _BYTE v65[10];
  __int16 v66;
  _BYTE v67[14];
  __int16 v68;
  const char *v69;
  char buffer[1024];
  _BYTE buf[1040];

  *(_QWORD *)&buf[1024] = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20AA57000, v10, OS_LOG_TYPE_INFO, "Moving aside DB due to failed migration / incompatibility.", buf, 2u);
    }
  }
  memset(&buf[1], 170, 0x3FFuLL);
  memset(&buffer[1], 170, 0x3FFuLL);
  buf[0] = 0;
  buffer[0] = 0;
  MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, *(CFStringRef *)a1);
  v12 = MutableCopy;
  if ((_DWORD)a4 == -1)
    CFStringAppendFormat(MutableCopy, 0, CFSTR(".incompatible.unknownversion.sqlitedb"));
  else
    CFStringAppendFormat(MutableCopy, 0, CFSTR(".incompatible.v%i.sqlitedb"), a4);
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v64 = 138412290;
      *(_QWORD *)v65 = v12;
      _os_log_impl(&dword_20AA57000, v13, OS_LOG_TYPE_INFO, "Destination path: %@", v64, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = *(CFStringRef *)a1;
      *(_DWORD *)v64 = 138412290;
      *(_QWORD *)v65 = v15;
      _os_log_impl(&dword_20AA57000, v14, OS_LOG_TYPE_INFO, "Source path: %@", v64, 0xCu);
    }
  }
  CFStringGetCString(v12, buf, 1024, 0x8000100u);
  CFStringGetCString(*(CFStringRef *)a1, buffer, 1024, 0x8000100u);
  v16 = *(_DWORD *)(a1 + 184);
  if (v16)
    v17 = 4194306;
  else
    v17 = 3145730;
  if (v16 == 1)
    v18 = 1048578;
  else
    v18 = v17;
  ppDb = 0;
  v19 = sqlite3_open_v2(buffer, &ppDb, v18, 0);
  if (v19)
    goto LABEL_76;
  if (IMOSLoggingEnabled())
  {
    v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v64 = 0;
      _os_log_impl(&dword_20AA57000, v20, OS_LOG_TYPE_INFO, "Opened the source database to force WAL journal mode.", v64, 2u);
    }
  }
  sqlite3_exec(ppDb, "pragma JOURNAL_MODE=wal", 0, 0, 0);
  if (IMOSLoggingEnabled())
  {
    v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v64 = 0;
      _os_log_impl(&dword_20AA57000, v21, OS_LOG_TYPE_INFO, "Closing the source database to clean up any support files.", v64, 2u);
    }
  }
  sqlite3_close(ppDb);
  ppDb = 0;
  v19 = sqlite3_open_v2(buffer, &ppDb, v18, 0);
  if (v19)
  {
LABEL_76:
    if (IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = sqlite3_extended_errcode(ppDb);
        v24 = sqlite3_errmsg(ppDb);
        *(_DWORD *)v64 = 67109634;
        *(_DWORD *)v65 = v19;
        *(_WORD *)&v65[4] = 1024;
        *(_DWORD *)&v65[6] = v23;
        v66 = 2080;
        *(_QWORD *)v67 = v24;
        v25 = "Unable to open the source database. SQLite error: [%d] (%d) %s";
        v26 = v22;
LABEL_30:
        v27 = 24;
LABEL_31:
        _os_log_impl(&dword_20AA57000, v26, OS_LOG_TYPE_INFO, v25, v64, v27);
        goto LABEL_32;
      }
    }
    goto LABEL_32;
  }
  if (IMOSLoggingEnabled())
  {
    v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v64 = 0;
      _os_log_impl(&dword_20AA57000, v29, OS_LOG_TYPE_INFO, "Opened the source database.", v64, 2u);
    }
  }
  v30 = *(_DWORD *)(a1 + 184);
  v31 = 4194310;
  if (!v30)
    v31 = 3145734;
  if (v30 == 1)
    v32 = 1048582;
  else
    v32 = v31;
  db = 0;
  v33 = sqlite3_open_v2(buf, &db, v32, 0);
  v34 = IMOSLoggingEnabled();
  if (!v33)
  {
    if (v34)
    {
      v38 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v64 = 0;
        _os_log_impl(&dword_20AA57000, v38, OS_LOG_TYPE_INFO, "Opened the destination database.", v64, 2u);
      }
    }
    v39 = sqlite3_file_control(db, 0, 102, ppDb);
    v40 = IMOSLoggingEnabled();
    if (v39)
    {
      if (v40)
      {
        v41 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          v42 = sqlite3_extended_errcode(ppDb);
          v43 = sqlite3_extended_errcode(db);
          v44 = sqlite3_errmsg(db);
          v45 = sqlite3_errmsg(ppDb);
          *(_DWORD *)v64 = 67110146;
          *(_DWORD *)v65 = v39;
          *(_WORD *)&v65[4] = 1024;
          *(_DWORD *)&v65[6] = v42;
          v66 = 1024;
          *(_DWORD *)v67 = v43;
          *(_WORD *)&v67[4] = 2080;
          *(_QWORD *)&v67[6] = v44;
          v68 = 2080;
          v69 = v45;
          v46 = "Replacing messages database from restore failed. SQLite error: [%d] (source: %d, dest: %d) Destination: %s Source: %s";
          v47 = v41;
          v48 = 40;
LABEL_57:
          _os_log_impl(&dword_20AA57000, v47, OS_LOG_TYPE_INFO, v46, v64, v48);
        }
      }
    }
    else if (v40)
    {
      v49 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v64 = 0;
        v46 = "Database replacement was successful.";
        v47 = v49;
        v48 = 2;
        goto LABEL_57;
      }
    }
    v50 = sqlite3_close(db);
    v51 = IMOSLoggingEnabled();
    if (v50)
    {
      if (v51)
      {
        v52 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          v53 = sqlite3_extended_errcode(db);
          v54 = sqlite3_errmsg(db);
          *(_DWORD *)v64 = 67109634;
          *(_DWORD *)v65 = v50;
          *(_WORD *)&v65[4] = 1024;
          *(_DWORD *)&v65[6] = v53;
          v66 = 2080;
          *(_QWORD *)v67 = v54;
          v55 = "Unable to close the destination database. SQLite error: [%d] (%d) %s";
          v56 = v52;
          v57 = 24;
LABEL_65:
          _os_log_impl(&dword_20AA57000, v56, OS_LOG_TYPE_INFO, v55, v64, v57);
        }
      }
    }
    else if (v51)
    {
      v58 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v64 = 0;
        v55 = "Closed the destination database.";
        v56 = v58;
        v57 = 2;
        goto LABEL_65;
      }
    }
    v59 = sub_20AA63328(ppDb, *(void **)a1);
    v60 = IMOSLoggingEnabled();
    if (v59)
    {
      if (!v60)
        goto LABEL_32;
      v61 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        goto LABEL_32;
      *(_WORD *)v64 = 0;
      v25 = "Cleaned up the source database.";
    }
    else
    {
      if (!v60)
        goto LABEL_32;
      v61 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        goto LABEL_32;
      *(_WORD *)v64 = 0;
      v25 = "Unable to cleanup corrupt source database.";
    }
    v26 = v61;
    v27 = 2;
    goto LABEL_31;
  }
  if (v34)
  {
    v35 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = sqlite3_extended_errcode(db);
      v37 = sqlite3_errmsg(db);
      *(_DWORD *)v64 = 67109634;
      *(_DWORD *)v65 = v33;
      *(_WORD *)&v65[4] = 1024;
      *(_DWORD *)&v65[6] = v36;
      v66 = 2080;
      *(_QWORD *)v67 = v37;
      v25 = "Unable to open the destination database. SQLite error: [%d] (%d) %s";
      v26 = v35;
      goto LABEL_30;
    }
  }
LABEL_32:
  if (v12)
    CFRelease(v12);
  *(_BYTE *)(a1 + 84) |= 1u;
  *(_DWORD *)(a1 + 80) = a3;
  return sub_20AA646EC((uint64_t *)a1, a2, a5);
}

void sub_20AA654A0(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x20AA65404);
  }
  _Unwind_Resume(a1);
}

void sub_20AA65590(uint64_t a1, const char *a2, uint64_t a3)
{
  int v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  const char *v18;
  NSObject *v19;
  void (*v20)(uint64_t, uint64_t, _QWORD);
  int v21;
  id v22;
  size_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const __CFString *v30;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = IMOSLoggingEnabled();
  if (a3)
  {
    if (v6)
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LODWORD(v40) = 136315138;
        *(_QWORD *)((char *)&v40 + 4) = a2;
        _os_log_impl(&dword_20AA57000, v7, OS_LOG_TYPE_INFO, "Setting up a new database at path %s.", (uint8_t *)&v40, 0xCu);
      }
    }
    CSDBSqliteConnectionBeginTransactionType(a3, 0);
    v8 = sqlite3_exec(*(sqlite3 **)(a3 + 8), "pragma legacy_file_format = 0;", 0, 0, 0);
    CSDBCheckResultWithStatement((void **)a1, *(sqlite3 **)(a3 + 8), v8, (uint64_t)"CSDBSqliteDatabaseSetNewFileFormatPragma", 0, v9, v10, v11, v32, v34, v36, v38, v40, *((uint64_t *)&v40 + 1), v41, v42, v43, v44, v45,
      v46,
      v47,
      v48);
    v12 = *(void (**)(uint64_t, uint64_t))(a1 + 24);
    if (v12)
      v12(a1, a3);
    v13 = sqlite3_exec(*(sqlite3 **)(a3 + 8), "CREATE TABLE IF NOT EXISTS _SqliteDatabaseProperties (key TEXT, value TEXT, UNIQUE(key));",
            0,
            0,
            0);
    CSDBCheckResultWithStatement((void **)a1, *(sqlite3 **)(a3 + 8), v13, (uint64_t)"createAndSetupNewDatabase", 0, v14, v15, v16, v33, v35, v37, v39, v40, *((uint64_t *)&v40 + 1), v41, v42, v43, v44, v45,
      v46,
      v47,
      v48);
    if ((_DWORD)v13)
    {
      v17 = sqlite3_extended_errcode(*(sqlite3 **)(a3 + 8));
      v18 = sqlite3_errmsg(*(sqlite3 **)(a3 + 8));
      printf("error %d (%d) creating properties table: %s\n", v13, v17, v18);
      *(_QWORD *)(a1 + 8) = 0;
    }
    else
    {
      v20 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + 16);
      if (v20)
        v20(a1, a3, *(_QWORD *)(a1 + 40));
      if ((*(_BYTE *)(a1 + 84) & 1) != 0)
        CSDBSqliteConnectionSetIntegerForProperty((_QWORD *)a3, CFSTR("_ClientVersion"), *(_DWORD *)(a1 + 80));
      v21 = CSDBSqliteConnectionCommit(a3);
      if (v21 == 101 || !v21)
      {
        v22 = objc_alloc(MEMORY[0x24BDD17C8]);
        v23 = strlen(a2);
        v25 = (void *)objc_msgSend_initWithBytes_length_encoding_(v22, v24, (uint64_t)a2, v23, 1);
        v28 = sub_20AA61764(v25, v26, v27);
        v30 = (const __CFString *)objc_msgSend_stringByAppendingString_(CFSTR("com.apple.coresdb.mandatory_db_reconnect_required."), v29, (uint64_t)v28);
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, v30, 0, 0, 1uLL);
        if (v28)
          CFRelease(v28);

      }
    }
  }
  else if (v6)
  {
    v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v40) = 0;
      _os_log_impl(&dword_20AA57000, v19, OS_LOG_TYPE_INFO, "Could not set up new messages database -- unable to create database connection", (uint8_t *)&v40, 2u);
    }
  }
}

uint64_t sub_20AA65880()
{
  uint64_t v0;

  pthread_mutex_lock(&stru_253D846A8);
  v0 = dword_253D846E8;
  if (dword_253D846E8 == -1)
  {
    v0 = getenv("CSDBSQLDEBUG") != 0;
    dword_253D846E8 = v0;
  }
  pthread_mutex_unlock(&stru_253D846A8);
  return v0;
}

void sub_20AA658DC(int a1, _QWORD *a2)
{
  sqlite3_stmt *v3;

  if (a2)
  {
    v3 = (sqlite3_stmt *)a2[1];
    if (v3)
      sqlite3_finalize(v3);
  }
  free(a2);
}

void *sub_20AA6590C(uint64_t a1, const char *a2, void *a3)
{
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *result;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend_first(a3, a2, (uint64_t)a3);
  result = (void *)objc_msgSend_second(a3, v7, v8);
  if (result)
  {
    v11 = (uint64_t)result;
    result = *(void **)(a1 + 32);
    if (result)
    {
      result = (void *)objc_msgSend_isEqualToString_(result, v10, v11);
      if ((_DWORD)result)
      {
        if (IMOSLoggingEnabled())
        {
          v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            v13 = 138412290;
            v14 = a2;
            _os_log_impl(&dword_20AA57000, v12, OS_LOG_TYPE_INFO, "Calling reconnect block for identifier: %@", (uint8_t *)&v13, 0xCu);
          }
        }
        return (void *)(*(uint64_t (**)(uint64_t))(v6 + 16))(v6);
      }
    }
  }
  return result;
}

uint64_t CSDBCreateDirectoriesToPathWithOwnership(const char *a1, uid_t a2, gid_t a3, int a4)
{
  timespec v8;
  uint64_t result;
  int v10;
  unint64_t v11;
  const char *v12;
  mode_t v13;
  stat v14;
  char v15[1024];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v8.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v14.st_blksize = v8;
  *(timespec *)v14.st_qspare = v8;
  v14.st_birthtimespec = v8;
  *(timespec *)&v14.st_size = v8;
  v14.st_mtimespec = v8;
  v14.st_ctimespec = v8;
  *(timespec *)&v14.st_uid = v8;
  v14.st_atimespec = v8;
  *(timespec *)&v14.st_dev = v8;
  result = stat(a1, &v14);
  if ((_DWORD)result)
  {
    bzero(v15, 0x400uLL);
    v10 = *(unsigned __int8 *)a1;
    if (!*a1)
      return 0;
    v11 = 0;
    v12 = a1 + 1;
    while (1)
    {
      v15[v11] = v10;
      if (v10 == 47 && stat(v15, &v14))
      {
        if (mkdir(v15, 0x1FFu))
          return *__error();
        if (a4)
        {
          chown(v15, a2, a3);
          v13 = 448;
        }
        else
        {
          v13 = 511;
        }
        chmod(v15, v13);
      }
      result = 0;
      if (v11 <= 0x3FD)
      {
        v10 = v12[v11++];
        if (v10)
          continue;
      }
      return result;
    }
  }
  return result;
}

uint64_t CSDBCreateDirectoriesToPath(const char *a1, uid_t a2, gid_t a3)
{
  return CSDBCreateDirectoriesToPathWithOwnership(a1, a2, a3, 1);
}

uint64_t CSDBGetMobileUserDirectory()
{
  pthread_once(&stru_253D84688, sub_20AA65B80);
  return qword_253D84708;
}

void sub_20AA65B80()
{
  const void *v0;
  __int128 v1;
  const __CFURL *v2;
  const __CFAllocator **v3;
  const __CFURL *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFAllocator *v7;
  const char *v8;
  char *v9;
  passwd *v10;
  int pw_gid;
  CFIndex v12;
  char buffer[16];
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v0 = (const void *)MEMORY[0x20BD2A3A4]();
  qword_253D84718 = (uint64_t)v0;
  if (v0)
  {
    *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buffer = v1;
    v14 = v1;
    v12 = 32;
    CFRetain(v0);
    v2 = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
    v3 = (const __CFAllocator **)MEMORY[0x24BDBD240];
    if (v2)
    {
      v4 = v2;
      v5 = CFURLCopyFileSystemPath(v2, kCFURLPOSIXPathStyle);
      if (v5)
      {
        v6 = v5;
        qword_253D84708 = (uint64_t)sub_20AA65D78(*v3, v5, 0, 0);
        CFRelease(v6);
      }
      CFRelease(v4);
    }
    v7 = *v3;
    v8 = sub_20AA65D78(*v3, (CFStringRef)qword_253D84718, buffer, &v12);
    if (v8)
    {
      v9 = (char *)v8;
      v10 = getpwnam(v8);
      if (v10)
      {
        pw_gid = v10->pw_gid;
        dword_253D84710 = v10->pw_uid;
        dword_253D84714 = pw_gid;
      }
      if (v9 != buffer)
        CFAllocatorDeallocate(v7, v9);
    }
  }
}

uint64_t CSDBGetMobileUserUID()
{
  pthread_once(&stru_253D84688, sub_20AA65B80);
  return dword_253D84710;
}

uint64_t CSDBGetMobileUserGID()
{
  pthread_once(&stru_253D84688, sub_20AA65B80);
  return dword_253D84714;
}

void *CSDBGenerateInClauseForCount(int a1, const char *a2)
{
  const char *v3;
  void *v4;
  int v5;

  v4 = (void *)objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], a2, (uint64_t)CFSTR("IN ("));
  if (a1 >= 1)
  {
    v5 = 0;
    do
    {
      if (v5 >= a1 - 1)
        objc_msgSend_appendFormat_(v4, v3, (uint64_t)CFSTR("?) "));
      else
        objc_msgSend_appendFormat_(v4, v3, (uint64_t)CFSTR("?, "));
      ++v5;
    }
    while (a1 != v5);
  }
  return v4;
}

const char *sub_20AA65D78(const __CFAllocator *a1, CFStringRef theString, char *buffer, CFIndex *a4)
{
  const char *v4;
  CFIndex *usedBufLen;
  CFIndex Length;
  UInt8 *v9;
  UInt8 *v10;
  uint64_t v12;
  CFRange v13;
  CFRange v14;

  v4 = buffer;
  v12 = 0;
  if (a4)
    usedBufLen = a4;
  else
    usedBufLen = &v12;
  if (buffer && *usedBufLen && CFStringGetCString(theString, buffer, *usedBufLen, 0x8000100u))
  {
    *usedBufLen = strlen(v4);
  }
  else
  {
    Length = CFStringGetLength(theString);
    v13.location = 0;
    v13.length = Length;
    CFStringGetBytes(theString, v13, 0x8000100u, 0, 0, 0, 0, usedBufLen);
    v9 = (UInt8 *)CFAllocatorAllocate(a1, *usedBufLen + 1, 0);
    if (v9)
    {
      v10 = v9;
      v14.location = 0;
      v14.length = Length;
      CFStringGetBytes(theString, v14, 0x8000100u, 0, 0, v9, *usedBufLen, usedBufLen);
      v10[*usedBufLen] = 0;
      return (const char *)v10;
    }
    else
    {
      *usedBufLen = 0;
      if (v4)
        *v4 = 0;
    }
  }
  return v4;
}

uint64_t CSDBCreateThreadedRecordStore(uint64_t a1)
{
  CSDBThreadedRecordStore *v2;

  v2 = [CSDBThreadedRecordStore alloc];
  return MEMORY[0x24BEDD108](v2, sel_initWithIdentifier_qosClass_lookAsideConfig_, a1);
}

uint64_t CSDBCreateThreadedRecordStoreWithQOSClass(uint64_t a1)
{
  CSDBThreadedRecordStore *v2;

  v2 = [CSDBThreadedRecordStore alloc];
  return MEMORY[0x24BEDD108](v2, sel_initWithIdentifier_qosClass_lookAsideConfig_, a1);
}

uint64_t CSDBCreateThreadedRecordStoreWithQOSClassAndLookAsideBufferConfig(uint64_t a1)
{
  CSDBThreadedRecordStore *v2;

  v2 = [CSDBThreadedRecordStore alloc];
  return MEMORY[0x24BEDD108](v2, sel_initWithIdentifier_qosClass_lookAsideConfig_, a1);
}

uint64_t CSDBThreadedRecordStoreRegisterClass(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x24BEDD108](a1, sel_registerClass_, a2);
}

void CSDBPerformLockedSectionUsingUnfairLock(uint64_t a1, os_unfair_lock_t lock, uint64_t a3)
{
  if (lock)
  {
    os_unfair_lock_lock(lock);
    if (a1 && a3)
    {
      if (*(_QWORD *)(a1 + 8))
        (*(void (**)(uint64_t))(a3 + 16))(a3);
    }
    os_unfair_lock_unlock(lock);
  }
  else if (a1 && a3 && *(_QWORD *)(a1 + 8))
  {
    (*(void (**)(uint64_t))(a3 + 16))(a3);
  }
}

uint64_t CSDBPerformLockedSectionUsingSpinLock(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = result;
  if (a2)
  {
    _os_nospin_lock_lock();
    if (v4 && a3)
    {
      if (*(_QWORD *)(v4 + 8))
        (*(void (**)(uint64_t))(a3 + 16))(a3);
    }
    return _os_nospin_lock_unlock();
  }
  else if (result && a3 && *(_QWORD *)(result + 8))
  {
    return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
  }
  return result;
}

uint64_t *CSDBPerformLockedSectionForConnectionForReading(uint64_t *result, uint64_t a2)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;

  if (result)
  {
    if (a2)
    {
      v3 = result;
      result = (uint64_t *)result[1];
      if (result)
      {
        result = (uint64_t *)CSDBRecordStoreGetDatabase((uint64_t)result);
        if (result)
        {
          v4 = result;
          result = (uint64_t *)CSDBSqliteDatabaseConnectionForReading((uint64_t)result);
          if (result)
          {
            v5 = result;
            (*(void (**)(uint64_t, uint64_t, uint64_t *, uint64_t *))(a2 + 16))(a2, v3[1], v4, result);
            return CSDBSqliteDatabaseReleaseSqliteConnection(v5);
          }
        }
      }
    }
  }
  return result;
}

uint64_t *CSDBPerformLockedSectionForConnectionForWriting(uint64_t *result, uint64_t a2)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;

  if (result)
  {
    if (a2)
    {
      v3 = result;
      result = (uint64_t *)result[1];
      if (result)
      {
        result = (uint64_t *)CSDBRecordStoreGetDatabase((uint64_t)result);
        if (result)
        {
          v4 = result;
          result = (uint64_t *)CSDBSqliteDatabaseConnectionForWriting((uint64_t)result);
          if (result)
          {
            v5 = result;
            (*(void (**)(uint64_t, uint64_t, uint64_t *, uint64_t *))(a2 + 16))(a2, v3[1], v4, result);
            return CSDBSqliteDatabaseReleaseSqliteConnection(v5);
          }
        }
      }
    }
  }
  return result;
}

uint64_t CSDBPerformUnlocked(uint64_t result, uint64_t a2)
{
  if (result && a2)
  {
    if (*(_QWORD *)(result + 8))
      return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  }
  return result;
}

uint64_t CSDBPerformUnlockedSectionForRecordStore(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (result && a2)
  {
    v2 = *(_QWORD *)(result + 8);
    if (v2)
      return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v2);
  }
  return result;
}

uint64_t CSDBPerformUnlockedSectionForDatabase(uint64_t result, uint64_t a2)
{
  uint64_t v3;

  if (result)
  {
    if (a2)
    {
      v3 = result;
      result = *(_QWORD *)(result + 8);
      if (result)
      {
        result = CSDBRecordStoreGetDatabase(result);
        if (result)
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(a2 + 16))(a2, *(_QWORD *)(v3 + 8), result);
      }
    }
  }
  return result;
}

uint64_t *CSDBPerformUnlockedSectionForConnectionForReading(uint64_t *result, uint64_t a2)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;

  if (result)
  {
    if (a2)
    {
      v3 = result;
      result = (uint64_t *)result[1];
      if (result)
      {
        result = (uint64_t *)CSDBRecordStoreGetDatabase((uint64_t)result);
        if (result)
        {
          v4 = result;
          result = (uint64_t *)CSDBSqliteDatabaseConnectionForReading((uint64_t)result);
          if (result)
          {
            v5 = result;
            (*(void (**)(uint64_t, uint64_t, uint64_t *, uint64_t *))(a2 + 16))(a2, v3[1], v4, result);
            return CSDBSqliteDatabaseReleaseSqliteConnection(v5);
          }
        }
      }
    }
  }
  return result;
}

uint64_t *CSDBPerformUnlockedSectionForConnectionForWriting(uint64_t *result, uint64_t a2)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;

  if (result)
  {
    if (a2)
    {
      v3 = result;
      result = (uint64_t *)result[1];
      if (result)
      {
        result = (uint64_t *)CSDBRecordStoreGetDatabase((uint64_t)result);
        if (result)
        {
          v4 = result;
          result = (uint64_t *)CSDBSqliteDatabaseConnectionForWriting((uint64_t)result);
          if (result)
          {
            v5 = result;
            (*(void (**)(uint64_t, uint64_t, uint64_t *, uint64_t *))(a2 + 16))(a2, v3[1], v4, result);
            return CSDBSqliteDatabaseReleaseSqliteConnection(v5);
          }
        }
      }
    }
  }
  return result;
}

uint64_t CSDBPerformUnlockedSectionForQueryForReading(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        v5 = result;
        result = *(_QWORD *)(result + 8);
        if (result)
        {
          result = CSDBRecordStoreGetDatabase(result);
          if (result)
          {
            v6 = result;
            result = CSDBSqliteDatabaseStatementForReading(result, a2);
            if (result)
            {
              v7 = result;
              if (*(_QWORD *)(result + 8))
              {
                (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(a3 + 16))(a3, *(_QWORD *)(v5 + 8), v6, result);
                return CSDBSqliteStatementReset(v7);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t CSDBPerformUnlockedSectionForQueryForWriting(uint64_t result, const __CFString *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        v5 = result;
        result = *(_QWORD *)(result + 8);
        if (result)
        {
          result = CSDBRecordStoreGetDatabase(result);
          if (result)
          {
            v6 = result;
            result = (uint64_t)CSDBSqliteDatabaseStatementForWriting(result, a2);
            if (result)
            {
              v7 = result;
              if (*(_QWORD *)(result + 8))
              {
                (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(a3 + 16))(a3, *(_QWORD *)(v5 + 8), v6, result);
                return CSDBSqliteStatementReset(v7);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void CSDBRecordStoreInvalidateCaches(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1)
    CSDBRecordStoreInvalidateCachesWithStore(v1);
}

void CSDBRecordStoreSaveAndInvalidateCaches(uint64_t a1)
{
  uint64_t v1;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 8);
    if (v1)
    {
      CSDBRecordSaveStore(*(_QWORD *)(a1 + 8));
      CSDBRecordStoreInvalidateCachesWithStore(v1);
    }
  }
}

void CSDBRecordStoreRecordCommitChangesAndReleaseUnlocked(uint64_t a1, CFTypeRef cf)
{
  uint64_t v3;

  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 8);
    if (v3)
      CSDBRecordSaveStore(v3);
  }
  CFRelease(cf);
}

void CSDBRecordStoreRecordCommitChangesAndRelease(uint64_t a1, CFTypeRef cf)
{
  uint64_t v3;

  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 8);
    if (v3)
      CSDBRecordSaveStore(v3);
  }
  CFRelease(cf);
}

uint64_t CSDBRecordStoreSave(uint64_t result)
{
  if (result)
  {
    result = *(_QWORD *)(result + 8);
    if (result)
      return CSDBRecordSaveStore(result);
  }
  return result;
}

uint64_t CSDBThreadedRecordStoreGetSequenceNumber(uint64_t a1)
{
  uint64_t v1;
  uint64_t SequenceNumber;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  if (a1 && (v1 = *(_QWORD *)(a1 + 8)) != 0)
  {
    SequenceNumber = CSDBRecordStoreGetSequenceNumber(v1);
    *((_DWORD *)v5 + 6) = SequenceNumber;
  }
  else
  {
    SequenceNumber = 0;
  }
  _Block_object_dispose(&v4, 8);
  return SequenceNumber;
}

void sub_20AA667B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20AA6696C(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__teardownDatabaseOnQueue(*(void **)(a1 + 32), a2, a3);
}

void sub_20AA6698C(uint64_t a1)
{
  uint64_t v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
    CSDBRecordStoreInvalidateCachesWithStore(v2);
}

uint64_t CSDBRecordStoreRefFromThreadedRecordStoreRef(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

void sub_20AA669D8()
{
  __assert_rtn("CSDBRecordCopyChangedProperties", "CSDBRecord.m", 375, "record");
}

void sub_20AA66A00()
{
  __assert_rtn("CSDBRecordMarkPropertyChanged", "CSDBRecord.m", 400, "record");
}

void sub_20AA66A28()
{
  __assert_rtn("_updateDetachedRecord", "CSDBRecord.m", 324, "record");
}

void sub_20AA66A50()
{
  __assert_rtn("_updateDetachedRecord", "CSDBRecord.m", 339, "result == record");
}

void sub_20AA66A78()
{
  __assert_rtn("CSDBRecordGetProperty", "CSDBRecord.m", 489, "record");
}

void sub_20AA66AA0()
{
  __assert_rtn("_addChangeActions", "CSDBRecord.m", 312, "record->store");
}

void sub_20AA66AC8()
{
  __assert_rtn("_getReaderConnection", "CSDBRecord.m", 747, "store");
}

void sub_20AA66AF0()
{
  __assert_rtn("CSDBRecordMarkChanged", "CSDBRecord.m", 636, "record");
}

void sub_20AA66B18()
{
  __assert_rtn("CSDBRecordStoreSetValueForProperty", "CSDBRecord.m", 650, "store");
}

void sub_20AA66B40()
{
  __assert_rtn("CSDBRecordStoreSetValueForProperty", "CSDBRecord.m", 652, "store->properties");
}

void sub_20AA66B68()
{
  __assert_rtn("CSDBRecordStoreCopyValueForProperty", "CSDBRecord.m", 657, "store");
}

void sub_20AA66B90()
{
  __assert_rtn("CSDBRecordStoreGetDatabase", "CSDBRecord.m", 731, "store");
}

void sub_20AA66BB8()
{
  __assert_rtn("CSDBRecordStoreGetDatabase", "CSDBRecord.m", 738, "store->database");
}

void sub_20AA66BE0()
{
  __assert_rtn("CSDBRecordStoreSetSetupHandler", "CSDBRecord.m", 725, "store");
}

void sub_20AA66C08()
{
  __assert_rtn("_sqliteDatabaseSetupHandler", "CSDBRecord.m", 709, "db && c && store");
}

void sub_20AA66C30()
{
  __assert_rtn("CSDBRecordStoreLogChanges", "CSDBRecord.m", 1258, "store");
}

void sub_20AA66C58()
{
  __assert_rtn("CSDBRecordStoreLogBasicChanges", "CSDBRecord.m", 1264, "store");
}

void sub_20AA66C80()
{
  __assert_rtn("CSDBRecordStoreIsLoggingChanges", "CSDBRecord.m", 1269, "store");
}

void sub_20AA66CA8()
{
  __assert_rtn("CSDBRecordInvalidateRecord", "CSDBRecord.m", 1487, "recordRef");
}

void sub_20AA66CD0()
{
  __assert_rtn("CSDBRecordStoreSaveWithPreAndPostCallbacksAndTransactionType", "CSDBRecord.m", 1548, "store");
}

void sub_20AA66CF8()
{
  __assert_rtn("_saveProperty", "CSDBRecord.m", 1482, "c && c->connection && key");
}

void sub_20AA66D20()
{
  __assert_rtn("CSDBRecordStoreCreateTablesForClass", "CSDBRecord.m", 1698, "classDescriptor");
}

void sub_20AA66D48()
{
  __assert_rtn("CSDBRecordStoreCreateTablesForClass", "CSDBRecord.m", 1699, "c");
}

void sub_20AA66D70()
{
  __assert_rtn("CSDBRecordStoreCreateTablesForClass", "CSDBRecord.m", 1710, "constraint->propertyCount > 0");
}

void sub_20AA66D98()
{
  __assert_rtn("CSDBRecordStoreCreateTablesForClass", "CSDBRecord.m", 1713, "hasPrimaryKeyConstraint == false");
}

void sub_20AA66DC0()
{
  __assert_rtn("CSDBRecordStoreCreateTablesForClass", "CSDBRecord.m", 1754, "constraint->propertyCount > 0");
}

void sub_20AA66DE8()
{
  __assert_rtn("CSDBRecordStoreRegisterClass", "CSDBRecord.m", 1842, "store && classDescriptor");
}

void sub_20AA66E10()
{
  __assert_rtn("CSDBRecordStoreRegisterClass", "CSDBRecord.m", 1846, "store->classes");
}

void sub_20AA66E38()
{
  __assert_rtn("CSDBRecordStoreCreateJoinableSelectPrefixFromRecordDescriptor", "CSDBRecord.m", 2154, "tableAlias!=NULL && CFStringGetLength(tableAlias)");
}

void sub_20AA66E60()
{
  __assert_rtn("CSDBRecordStoreCreateSelectPrefixWithTableExpressionAndAlias", "CSDBRecord.m", 2159, "tableAlias!=NULL && CFStringGetLength(tableAlias)");
}

void sub_20AA66E88()
{
  __assert_rtn("CSDBRecordStoreCreateSelectPrefixWithTableExpressionAndAlias", "CSDBRecord.m", 2160, "tableExpression!=NULL && CFStringGetLength(tableExpression)");
}

void sub_20AA66EB0()
{
  __assert_rtn("CSDBRecordStoreGetCache", "CSDBRecord.m", 762, "store");
}

void sub_20AA66ED8()
{
  __assert_rtn("_CSDBRecordStoreAddRecord", "CSDBRecord.m", 2319, "record && store");
}

void sub_20AA66F00()
{
  __assert_rtn("CSDBRecordStoreRemoveRecord", "CSDBRecord.m", 2422, "record");
}

void sub_20AA66F28()
{
  __assert_rtn("CSDBRecordStoreRemoveRecordInternal", "CSDBRecord.m", 2399, "store");
}

void sub_20AA66F50()
{
  __assert_rtn("CSDBRecordStoreRemoveRecordInternal", "CSDBRecord.m", 2404, "classDescriptor");
}

void sub_20AA66F78()
{
  __assert_rtn("CSDBRecordStoreGetDeletedRecords", "CSDBRecord.m", 777, "store");
}

void sub_20AA66FA0()
{
  __assert_rtn("CSDBRecordWasPropertyMarkedAsChanged", "CSDBRecord.m", 414, "record");
}

void sub_20AA66FC8()
{
  __assert_rtn("CSDBRecordStoreUpdateRecord", "CSDBRecord.m", 1097, "record && context && context->connection");
}

void sub_20AA66FF0()
{
  __assert_rtn("CSDBRecordStoreUpdateRecord", "CSDBRecord.m", 1135, "record->changes==NULL");
}

void sub_20AA67018()
{
  __assert_rtn("invokeDataMigrator", "CSDBSqliteUtilities.m", 853, "db->migrationShouldLaunchDaemon");
}

void sub_20AA67040()
{
  __assert_rtn("runMigration", "CSDBSqliteUtilities.m", 803, "!(db->migrationShouldLaunchDaemon)");
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC300](data, *(_QWORD *)&len, md);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x24BDBB790](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x24BDBB7A0](allocator, ptr);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB7E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F8](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x24BDBBC68]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
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

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDE0](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x24BDBBE88](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x24BDBBEA0](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x24BDBBEE0](cf);
}

uint64_t CFGetUserName()
{
  return MEMORY[0x24BDBBF00]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotificationWithOptions(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, CFOptionFlags options)
{
  MEMORY[0x24BDBC078](center, name, object, userInfo, options);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
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

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

void CFRunLoopRun(void)
{
  MEMORY[0x24BDBC358]();
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC370](allocator, order, context);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC3C0](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x24BDBC3C8](theSet, applier, context);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x24BDBC3D0](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x24BDBC408](theSet, value);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
  MEMORY[0x24BDBC420](theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC428](theSet, value);
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC430](theSet, value);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x24BDBC4B0](theString, cStr, *(_QWORD *)&encoding);
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

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x24BDBC640](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x24BDBC668](string);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x24BDBC798](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x24BDBC7A8](url);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC828](allocator, buffer, bufLen, isDirectory);
}

uint64_t IMFileLocationTrimFileName()
{
  return MEMORY[0x24BE50688]();
}

uint64_t IMGetAppBoolForKey()
{
  return MEMORY[0x24BE50698]();
}

uint64_t IMGetAssertionFailureHandler()
{
  return MEMORY[0x24BE506A0]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x24BE50790]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t OSLogHandleForIDSCategory()
{
  return MEMORY[0x24BE508F8]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x24BE50908]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

uint64_t _IMAlwaysLog()
{
  return MEMORY[0x24BE50920]();
}

uint64_t _IMWillLog()
{
  return MEMORY[0x24BE509C0]();
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

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_nospin_lock_lock()
{
  return MEMORY[0x24BDACBB8]();
}

uint64_t _os_nospin_lock_unlock()
{
  return MEMORY[0x24BDACBC8]();
}

uint64_t _sqlite3_integrity_check()
{
  return MEMORY[0x24BEDDF00]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x24BDAD038](a1, *(_QWORD *)&a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAD990](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x24BDAD998](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x24BDADDB0](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x24BDADF00](queue, key, context, destructor);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x24BDAE060](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x24BDAE438](*(_QWORD *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x24BDAE5F8]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x24BDAE710](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

int mkstemp(char *a1)
{
  return MEMORY[0x24BDAEF70](a1);
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

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
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

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF48](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x24BEDDF58](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x24BEDDF60](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x24BEDDF68](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x24BEDDF70](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF98](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_busy_handler(sqlite3 *a1, int (__cdecl *a2)(void *, int), void *a3)
{
  return MEMORY[0x24BEDDFE8](a1, a2, a3);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x24BEDDFF0](a1, *(_QWORD *)&ms);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE008](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x24BEDE010](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x24BEDE018](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x24BEDE020](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE028](a1, *(_QWORD *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x24BEDE048](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE050](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE058](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE078](a1, *(_QWORD *)&iCol);
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return MEMORY[0x24BEDE0A8](db, zFunctionName, *(_QWORD *)&nArg, *(_QWORD *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_db_config(sqlite3 *a1, int op, ...)
{
  return MEMORY[0x24BEDE0C8](a1, *(_QWORD *)&op);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x24BEDE100](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x24BEDE108](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x24BEDE118](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x24BEDE128](db);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x24BEDE138](a1, zDbName, *(_QWORD *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

int sqlite3_get_autocommit(sqlite3 *a1)
{
  return MEMORY[0x24BEDE150](a1);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x24BEDE180](a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x24BEDE1B8](filename, ppDb);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE1E0](pStmt);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x24BEDE2A0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

int sqlite3_trace_v2(sqlite3 *a1, unsigned int uMask, int (__cdecl *xCallback)(unsigned int, void *, void *, void *), void *pCtx)
{
  return MEMORY[0x24BEDE2E8](a1, *(_QWORD *)&uMask, xCallback, pCtx);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

