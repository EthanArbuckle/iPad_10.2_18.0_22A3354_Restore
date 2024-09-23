@implementation SecBackupKeybagAdd

uint64_t __SecBackupKeybagAdd_block_invoke(uint64_t a1)
{
  CFTypeRef *v1;
  _QWORD v3[5];
  __int128 v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = __SecBackupKeybagAdd_block_invoke_2;
  v5[3] = &__block_descriptor_tmp_27_8566;
  v1 = *(CFTypeRef **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 48);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = __SecBackupKeybagAdd_block_invoke_3;
  v3[3] = &unk_1E1FD6620;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 56);
  return securityd_send_sync_and_do(0x6Fu, v1, (uint64_t)v5, (uint64_t)v3);
}

BOOL __SecBackupKeybagAdd_block_invoke_2(uint64_t a1, void *a2, __CFString **a3)
{
  const __CFData *v4;

  v4 = *(const __CFData **)(a1 + 32);
  return !v4 || SecXPCDictionarySetData(a2, "password", v4, a3);
}

uint64_t __SecBackupKeybagAdd_block_invoke_3(_QWORD *a1, xpc_object_t xdict, __CFString **a3)
{
  CFDataRef *v6;
  CFDataRef v7;
  CFURLRef *v8;
  const __CFData *v9;
  const __CFData *v10;
  const __CFAllocator *v11;
  const UInt8 *BytePtr;
  CFIndex v13;
  size_t length;

  v6 = (CFDataRef *)a1[5];
  length = 0;
  if (xpc_dictionary_get_data(xdict, "backupKeybagID", &length))
  {
    v7 = SecXPCDictionaryCopyData(xdict, "backupKeybagID", a3);
    *v6 = v7;
    if (!v7)
      goto LABEL_12;
  }
  else
  {
    *v6 = 0;
  }
  v8 = (CFURLRef *)a1[6];
  length = 0;
  if (!xpc_dictionary_get_data(xdict, "backupKeybagPath", &length))
  {
    *v8 = 0;
LABEL_11:
    LOBYTE(v7) = xpc_dictionary_get_BOOL(xdict, "status");
    goto LABEL_12;
  }
  v9 = SecXPCDictionaryCopyData(xdict, "backupKeybagPath", a3);
  if (v9)
  {
    v10 = v9;
    v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    BytePtr = CFDataGetBytePtr(v9);
    v13 = CFDataGetLength(v10);
    *v8 = CFURLCreateWithBytes(v11, BytePtr, v13, 0x8000100u, 0);
    CFRelease(v10);
  }
  if (*v8)
    goto LABEL_11;
  LOBYTE(v7) = 0;
LABEL_12:
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = (_BYTE)v7;
  return *(unsigned __int8 *)(*(_QWORD *)(a1[4] + 8) + 24);
}

@end
