@implementation CFPrefsGetSuiteContainer

void ___CFPrefsGetSuiteContainer_block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFDictionary *Mutable;
  const __CFURL *Value;
  const void *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  CFIndex Count;
  _QWORD v15[6];
  __int128 v16;
  uint64_t v17;
  const __CFDictionary *v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  Mutable = *(const __CFDictionary **)(a2 + 16);
  if (Mutable)
  {
    Value = (const __CFURL *)CFDictionaryGetValue(Mutable, *(const void **)(a1 + 48));
    if (Value)
    {
      if (Value != (const __CFURL *)&__kCFNull)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFURLGetFileSystemRepresentation(Value, 1u, *(UInt8 **)(a1 + 56), *(_QWORD *)(a1 + 64)) != 0;
        return;
      }
      goto LABEL_12;
    }
  }
  _CFPrefsGetEntitlementForMessageWithLockedContext(*(void **)(a1 + 32), 0, a2);
  v6 = *(const void **)(a2 + 40);
  if (!v6 || (v7 = (const __CFArray *)CFRetain(v6)) == 0)
  {
LABEL_12:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    return;
  }
  v8 = v7;
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    *(_QWORD *)(a2 + 16) = Mutable;
  }
  v9 = *(unsigned __int8 *)(a1 + 80);
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = ___CFPrefsGetSuiteContainer_block_invoke_2;
  v15[3] = &unk_1E1336CE8;
  v12 = *(_QWORD *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 72);
  v15[4] = *(_QWORD *)(a1 + 32);
  v15[5] = v11;
  v16 = *(_OWORD *)(a1 + 48);
  v17 = v12;
  v18 = Mutable;
  if (!(_QWORD)v16)
    ___CFPrefsGetSuiteContainer_block_invoke_cold_1();
  if (v9)
  {
    v13 = 0;
  }
  else
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    Count = CFArrayGetCount(v8);
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = ___CFPrefsIfClientIsInSecurityApplicationGroup_block_invoke;
    v19[3] = &unk_1E1335DC8;
    v19[4] = &v20;
    v19[5] = v16;
    CFArrayApply((uint64_t)v8, 0, Count, (uint64_t)v19);
    if (v21[3])
      v13 = ___CFPrefsGetSuiteContainer_block_invoke_2((uint64_t)v15);
    else
      v13 = 0;
    _Block_object_dispose(&v20, 8);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v13;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    CFDictionarySetValue(Mutable, *(const void **)(a1 + 48), &__kCFNull);
  CFRelease(v8);
}

BOOL ___CFPrefsGetSuiteContainer_block_invoke_2(uint64_t a1)
{
  const void *v2;
  const __CFString *v3;
  void *v4;
  _xpc_connection_s *remote_connection;
  _xpc_connection_s *value;
  uint64_t v7;
  uint64_t v8;
  const __CFURL *v9;
  const __CFURL *v10;
  int v11;
  _BOOL8 v12;

  v3 = *(const __CFString **)(a1 + 40);
  v2 = *(const void **)(a1 + 48);
  v4 = *(void **)(a1 + 32);
  remote_connection = xpc_dictionary_get_remote_connection(v4);
  if (!remote_connection)
  {
    value = (_xpc_connection_s *)xpc_dictionary_get_value(v4, "connection");
    if (!value
      || (remote_connection = value, value = object_getClass(value), value != (_xpc_connection_s *)MEMORY[0x1E0C812E0]))
    {
      ___CFPrefsGetSuiteContainer_block_invoke_2_cold_1((uint64_t)value, v7, v8);
    }
  }
  xpc_connection_get_euid(remote_connection);
  v9 = _CFCreateContainerURLForSecurityApplicationIdentifierGroupIdentifierAndUser(v3, v2);
  if (!v9)
    return 0;
  v10 = v9;
  v11 = CFURLGetFileSystemRepresentation(v9, 1u, *(UInt8 **)(a1 + 56), *(_QWORD *)(a1 + 64));
  v12 = v11 != 0;
  if (v11)
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 72), *(const void **)(a1 + 48), v10);
  CFRelease(v10);
  return v12;
}

void ___CFPrefsGetSuiteContainer_block_invoke_cold_1()
{
  __assert_rtn("_CFPrefsIfClientIsInSecurityApplicationGroup", "cfprefsd.m", 297, "domain");
}

void ___CFPrefsGetSuiteContainer_block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_33("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", a3, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

@end
