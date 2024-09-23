@implementation SecTrustStoreContains

uint64_t __SecTrustStoreContains_block_invoke(_QWORD *a1, CFTypeRef *a2)
{
  uint64_t (*v3)(_QWORD, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  __int128 v8;
  _QWORD v9[5];
  _QWORD v10[4];
  __int128 v11;
  os_activity_scope_state_s state;

  if (gTrustd)
  {
    v3 = *(uint64_t (**)(_QWORD, _QWORD, uint64_t, CFTypeRef *))(gTrustd + 8);
    if (v3)
      return v3(a1[5], a1[6], *(_QWORD *)(a1[4] + 8) + 24, a2);
  }
  v5 = *(_QWORD *)(a1[4] + 8) + 24;
  v8 = *(_OWORD *)(a1 + 5);
  v6 = _os_activity_create(&dword_18A900000, "SecTrustStoreContains", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v6, &state);
  v9[4] = v5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 0x40000000;
  v10[2] = __string_cert_to_BOOL_BOOL_error_block_invoke;
  v10[3] = &__block_descriptor_tmp_46_11769;
  v11 = v8;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = __string_cert_to_BOOL_BOOL_error_block_invoke_2;
  v9[3] = &__block_descriptor_tmp_47_11770;
  v7 = securityd_send_sync_and_do(4u, a2, (uint64_t)v10, (uint64_t)v9);
  os_release(v6);
  os_activity_scope_leave(&state);
  return v7;
}

@end
