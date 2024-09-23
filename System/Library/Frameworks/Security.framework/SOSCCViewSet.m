@implementation SOSCCViewSet

uint64_t __SOSCCViewSet_block_invoke(_QWORD *a1)
{
  uint64_t (*v1)(_QWORD, _QWORD);
  CFTypeRef *v3;
  _QWORD v4[5];
  _QWORD v5[4];
  __int128 v6;

  if (gSecurityd)
  {
    v1 = *(uint64_t (**)(_QWORD, _QWORD))(gSecurityd + 288);
    if (v1)
      return v1(a1[5], a1[6]);
  }
  v3 = (CFTypeRef *)a1[7];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __SOSCCViewSet_block_invoke_2;
  v5[3] = &__block_descriptor_48_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
  v6 = *(_OWORD *)(a1 + 5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __SOSCCViewSet_block_invoke_3;
  v4[3] = &unk_1E1FD5DC0;
  v4[4] = a1[4];
  return securityd_send_sync_and_do(0x37u, v3, (uint64_t)v5, (uint64_t)v4);
}

BOOL __SOSCCViewSet_block_invoke_2(uint64_t a1, void *a2, CFTypeRef *a3)
{
  id v5;
  uint64_t v6;
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

  v5 = a2;
  CreateXPCObjectWithCFSetRef(*(const __CFSet **)(a1 + 32), a3, v6, v7, v8, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  CreateXPCObjectWithCFSetRef(*(const __CFSet **)(a1 + 40), a3, v13, v14, v15, v16, v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  if (v12)
    xpc_dictionary_set_value(v5, "enabledViews", (xpc_object_t)v12);
  if (v19)
    xpc_dictionary_set_value(v5, "disabledViews", (xpc_object_t)v19);

  return (v12 | v19) != 0;
}

uint64_t __SOSCCViewSet_block_invoke_3(uint64_t a1, xpc_object_t xdict)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

@end
