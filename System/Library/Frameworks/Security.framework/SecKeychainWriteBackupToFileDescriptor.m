@implementation SecKeychainWriteBackupToFileDescriptor

uint64_t ___SecKeychainWriteBackupToFileDescriptor_block_invoke(uint64_t a1)
{
  CFTypeRef *v1;
  _QWORD v3[5];
  _QWORD v4[4];
  __int128 v5;
  int v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___SecKeychainWriteBackupToFileDescriptor_block_invoke_2;
  v4[3] = &__block_descriptor_tmp_4_8470;
  v5 = *(_OWORD *)(a1 + 48);
  v6 = *(_DWORD *)(a1 + 64);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = ___SecKeychainWriteBackupToFileDescriptor_block_invoke_3;
  v3[3] = &unk_1E1FD6388;
  v1 = *(CFTypeRef **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  return securityd_send_sync_and_do(9u, v1, (uint64_t)v4, (uint64_t)v3);
}

BOOL ___SecKeychainWriteBackupToFileDescriptor_block_invoke_2(uint64_t a1, void *a2, __CFString **a3)
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
      xpc_dictionary_set_fd(a2, "fileDescriptor", *(_DWORD *)(a1 + 48));
      return 1;
    }
  }
  return result;
}

BOOL ___SecKeychainWriteBackupToFileDescriptor_block_invoke_3(uint64_t a1, xpc_object_t xdict)
{
  _BOOL8 result;

  result = xpc_dictionary_get_BOOL(xdict, "status");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
