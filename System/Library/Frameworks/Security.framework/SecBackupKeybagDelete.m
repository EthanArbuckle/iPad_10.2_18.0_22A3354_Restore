@implementation SecBackupKeybagDelete

uint64_t __SecBackupKeybagDelete_block_invoke(_QWORD *a1)
{
  CFTypeRef *v1;
  _QWORD v3[5];
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = __SecBackupKeybagDelete_block_invoke_2;
  v4[3] = &__block_descriptor_tmp_30_8570;
  v1 = (CFTypeRef *)a1[5];
  v4[4] = a1[6];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = __SecBackupKeybagDelete_block_invoke_3;
  v3[3] = &unk_1E1FD6690;
  v3[4] = a1[4];
  return securityd_send_sync_and_do(0x70u, v1, (uint64_t)v4, (uint64_t)v3);
}

size_t __SecBackupKeybagDelete_block_invoke_2(uint64_t a1, void *a2, __CFString **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return SecXPCDictionarySetPListWithRepair(a2, "query", *(const __CFString **)(a1 + 32), a3, a5, a6, a7, a8);
}

uint64_t __SecBackupKeybagDelete_block_invoke_3(uint64_t a1, xpc_object_t xdict)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

@end
