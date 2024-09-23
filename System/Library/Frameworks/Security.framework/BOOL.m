@implementation BOOL

size_t __cftype_to_BOOL_cftype_error_request_block_invoke(uint64_t a1, void *a2, __CFString **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return SecXPCDictionarySetPListWithRepair(a2, "query", *(const __CFString **)(a1 + 32), a3, a5, a6, a7, a8);
}

BOOL __cftype_to_BOOL_cftype_error_request_block_invoke_2(uint64_t a1, void *a2, __CFString **a3)
{
  _QWORD *v3;

  v3 = *(_QWORD **)(a1 + 32);
  return !v3 || SecXPCDictionaryCopyPListOptional(a2, v3, a3);
}

uint64_t __simple_BOOL_error_request_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

BOOL __info_array_to_BOOL_error_request_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;

  v5 = a2;
  CreateXPCObjectWithArrayOfPeerInfo(*(const __CFArray **)(a1 + 32), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    xpc_dictionary_set_value(v5, "peer-infos", v6);

  return v6 != 0;
}

uint64_t __info_array_to_BOOL_error_request_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

uint64_t __uint64_t_to_BOOL_error_request_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_uint64(xdict, "limitMinutes", *(_QWORD *)(a1 + 32));
  return 1;
}

uint64_t __uint64_t_to_BOOL_error_request_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

BOOL __keybag_and_BOOL_to_BOOL_error_request_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v4)
  {
    xpc_dictionary_set_value(v3, "keybag", v4);

  }
  xpc_dictionary_set_BOOL(v3, "includeV0", *(_BYTE *)(a1 + 40));

  return v4 != 0;
}

BOOL __keybag_and_BOOL_to_BOOL_error_request_block_invoke_2(int a1, xpc_object_t xdict)
{
  return xpc_dictionary_get_BOOL(xdict, "status");
}

BOOL __recovery_and_BOOL_to_BOOL_error_request_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CFDataRef v5;
  UInt8 bytes;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  }
  else
  {
    bytes = 0;
    v5 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &bytes, 1);
    v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v5)
      CFRelease(v5);
  }
  if (v4)
  {
    xpc_dictionary_set_value(v3, "RecoveryPublicKey", v4);

  }
  return v4 != 0;
}

BOOL __recovery_and_BOOL_to_BOOL_error_request_block_invoke_2(int a1, xpc_object_t xdict)
{
  return xpc_dictionary_get_BOOL(xdict, "status");
}

uint64_t __label_and_password_to_BOOL_error_request_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  const __CFString *v5;
  id v6;
  const UInt8 *BytePtr;
  CFIndex Length;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v5 = *(const __CFString **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __label_and_password_to_BOOL_error_request_block_invoke_2;
  v10[3] = &unk_1E1FD4FD8;
  v11 = v3;
  v6 = v3;
  v12[0] = v4;
  v12[1] = 0x40000000;
  v12[2] = __CFStringPerformWithCString_block_invoke;
  v12[3] = &unk_1E1FDBF70;
  v12[4] = v10;
  CFStringPerformWithCStringAndLength(v5, (uint64_t)v12);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 40));
  Length = CFDataGetLength(*(CFDataRef *)(a1 + 40));
  xpc_dictionary_set_data(v6, "password", BytePtr, Length);

  return 1;
}

uint64_t __label_and_password_to_BOOL_error_request_block_invoke_3(uint64_t a1, xpc_object_t xdict)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

void __label_and_password_to_BOOL_error_request_block_invoke_2(uint64_t a1, char *string)
{
  xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 32), "userlabel", string);
}

uint64_t __label_and_password_and_dsid_to_BOOL_error_request_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const __CFString *v4;
  uint64_t v5;
  id v6;
  const __CFString *v7;
  id v8;
  const UInt8 *BytePtr;
  CFIndex Length;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  _QWORD *v20;

  v3 = a2;
  v4 = *(const __CFString **)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __label_and_password_and_dsid_to_BOOL_error_request_block_invoke_2;
  v14[3] = &unk_1E1FD4FD8;
  v6 = v3;
  v15 = v6;
  v16 = v5;
  v17 = 0x40000000;
  v18 = __CFStringPerformWithCString_block_invoke;
  v19 = &unk_1E1FDBF70;
  v20 = v14;
  CFStringPerformWithCStringAndLength(v4, (uint64_t)&v16);
  v7 = *(const __CFString **)(a1 + 40);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __label_and_password_and_dsid_to_BOOL_error_request_block_invoke_3;
  v12[3] = &unk_1E1FD4FD8;
  v13 = v6;
  v8 = v6;
  v16 = v5;
  v17 = 0x40000000;
  v18 = __CFStringPerformWithCString_block_invoke;
  v19 = &unk_1E1FDBF70;
  v20 = v12;
  CFStringPerformWithCStringAndLength(v7, (uint64_t)&v16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  xpc_dictionary_set_data(v8, "password", BytePtr, Length);

  return 1;
}

uint64_t __label_and_password_and_dsid_to_BOOL_error_request_block_invoke_4(uint64_t a1, xpc_object_t xdict)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

void __label_and_password_and_dsid_to_BOOL_error_request_block_invoke_2(uint64_t a1, char *string)
{
  xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 32), "userlabel", string);
}

void __label_and_password_and_dsid_to_BOOL_error_request_block_invoke_3(uint64_t a1, char *string)
{
  xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 32), "dsid", string);
}

BOOL __cfdata_and_int_error_request_returns_BOOL_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v4)
  {
    xpc_dictionary_set_value(v3, "data", v4);
    xpc_dictionary_set_uint64(v3, "version", *(unsigned int *)(a1 + 40));

  }
  return v4 != 0;
}

uint64_t __cfdata_and_int_error_request_returns_BOOL_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return 1;
}

BOOL __peer_info_to_BOOL_error_request_block_invoke(uint64_t a1, void *a2, CFTypeRef *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFData *v12;
  __CFData *v13;
  _BOOL8 v14;

  v5 = a2;
  v12 = SOSPeerInfoCopyEncodedData(*(_QWORD *)(a1 + 32), v6, a3, v7, v8, v9, v10, v11);
  if (v12)
  {
    v13 = v12;
    v14 = SecXPCDictionarySetData(v5, "peer-info", v12, (__CFString **)a3);
    CFRelease(v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __peer_info_to_BOOL_error_request_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

uint64_t __BOOL_and_error_request_returns_BOOL_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, "sosCompatibilityMode", *(_BYTE *)(a1 + 32));
  return 1;
}

uint64_t __BOOL_and_error_request_returns_BOOL_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return 1;
}

uint64_t __data_data_array_to_BOOL_error_request_block_invoke(uint64_t a1, void *a2, __CFString **a3)
{
  const __CFData *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(const __CFData **)(a1 + 32);
  v6 = a2;
  SecXPCDictionarySetData(v6, "normIssuer", v5, a3);
  SecXPCDictionarySetData(v6, "serialNum", *(CFDataRef *)(a1 + 40), a3);
  SecXPCDictionarySetPListWithRepair(v6, "accessGroups", *(const __CFString **)(a1 + 48), a3, v7, v8, v9, v10);

  return 1;
}

uint64_t __data_data_array_to_BOOL_error_request_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

BOOL __client_data_data_BOOL_to_data_error_request_block_invoke(uint64_t a1, void *a2, __CFString **a3)
{
  const __CFData *v6;
  _BOOL8 result;
  const __CFData *v8;

  v6 = *(const __CFData **)(a1 + 32);
  if (!v6 || (result = SecXPCDictionarySetData(a2, "keybag", v6, a3)))
  {
    v8 = *(const __CFData **)(a1 + 40);
    if (!v8 || (result = SecXPCDictionarySetData(a2, "password", v8, a3)))
    {
      xpc_dictionary_set_BOOL(a2, "emcsbackup", *(_BYTE *)(a1 + 48));
      return 1;
    }
  }
  return result;
}

BOOL __client_data_data_BOOL_to_data_error_request_block_invoke_2(uint64_t a1, void *a2, __CFString **a3)
{
  CFDataRef v4;

  v4 = SecXPCDictionaryCopyData(a2, "status", a3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return v4 != 0;
}

BOOL __string_data_data_to_BOOL_error_request_block_invoke(uint64_t a1, void *a2, __CFString **a3)
{
  _BOOL8 result;
  const __CFData *v7;
  const __CFData *v8;

  result = SecXPCDictionarySetString((uint64_t)a2, (uint64_t)"backup", *(const __CFString **)(a1 + 32), a3);
  if (result)
  {
    v7 = *(const __CFData **)(a1 + 40);
    if (!v7 || (result = SecXPCDictionarySetData(a2, "keybag", v7, a3)))
    {
      v8 = *(const __CFData **)(a1 + 48);
      return !v8 || SecXPCDictionarySetData(a2, "data", v8, a3);
    }
  }
  return result;
}

BOOL __string_data_data_to_BOOL_error_request_block_invoke_2(int a1, xpc_object_t xdict)
{
  return xpc_dictionary_get_BOOL(xdict, "status");
}

BOOL __string_string_data_data_data_to_BOOL_error_request_block_invoke(uint64_t a1, void *a2, __CFString **a3)
{
  const __CFString *v6;

  return SecXPCDictionarySetString((uint64_t)a2, (uint64_t)"backup", *(const __CFString **)(a1 + 32), a3)
      && ((v6 = *(const __CFString **)(a1 + 40)) == 0
       || SecXPCDictionarySetString((uint64_t)a2, (uint64_t)"digest", v6, a3))
      && SecXPCDictionarySetData(a2, "keybag", *(CFDataRef *)(a1 + 48), a3)
      && SecXPCDictionarySetData(a2, "password", *(CFDataRef *)(a1 + 56), a3)
      && SecXPCDictionarySetData(a2, "data", *(CFDataRef *)(a1 + 64), a3);
}

BOOL __string_string_data_data_data_to_BOOL_error_request_block_invoke_2(int a1, xpc_object_t xdict)
{
  return xpc_dictionary_get_BOOL(xdict, "status");
}

BOOL __data_data_to_data_data_BOOL_error_request_block_invoke(uint64_t a1, void *a2, __CFString **a3)
{
  const __CFData *v6;
  _BOOL8 result;
  const __CFData *v8;

  v6 = *(const __CFData **)(a1 + 32);
  if (!v6 || (result = SecXPCDictionarySetData(a2, "otrsess", v6, a3)))
  {
    v8 = *(const __CFData **)(a1 + 40);
    return !v8 || SecXPCDictionarySetData(a2, "data", v8, a3);
  }
  return result;
}

BOOL __data_data_to_data_data_BOOL_error_request_block_invoke_2(_QWORD *a1, xpc_object_t xdict, __CFString **a3)
{
  _BOOL8 v6;

  v6 = xpc_dictionary_get_BOOL(xdict, "status");
  if (v6)
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = SecXPCDictionaryCopyData(xdict, "otrsess", a3);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = SecXPCDictionaryCopyData(xdict, "data", a3);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "otrrdy");
  }
  return v6;
}

uint64_t __int_to_BOOL_error_request_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_uint64(xdict, "flags", *(unsigned int *)(a1 + 32));
  return 1;
}

uint64_t __int_to_BOOL_error_request_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

uint64_t __to_BOOL_error_request_block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  BOOL v3;

  if (a3)
    v3 = *a3 == 0;
  else
    v3 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  return 1;
}

BOOL __string_cert_to_BOOL_BOOL_error_block_invoke(uint64_t a1, void *a2, __CFString **a3)
{
  _BOOL8 result;

  result = SecXPCDictionarySetString((uint64_t)a2, (uint64_t)"domain", *(const __CFString **)(a1 + 32), a3);
  if ((_DWORD)result)
    return SecXPCDictionarySetCertificate(a2, *(_QWORD *)(a1 + 40), a3);
  return result;
}

uint64_t __string_cert_to_BOOL_BOOL_error_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  if (*(_QWORD *)(a1 + 32))
    **(_BYTE **)(a1 + 32) = xpc_dictionary_get_BOOL(xdict, "status");
  return 1;
}

BOOL __string_cert_to_BOOL_error_block_invoke(uint64_t a1, void *a2, __CFString **a3)
{
  _BOOL8 result;

  result = SecXPCDictionarySetString((uint64_t)a2, (uint64_t)"domain", *(const __CFString **)(a1 + 32), a3);
  if ((_DWORD)result)
    return SecXPCDictionarySetCertificate(a2, *(_QWORD *)(a1 + 40), a3);
  return result;
}

@end
