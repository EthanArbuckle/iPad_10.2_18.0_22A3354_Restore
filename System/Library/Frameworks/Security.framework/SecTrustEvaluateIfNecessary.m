@implementation SecTrustEvaluateIfNecessary

uint64_t __SecTrustEvaluateIfNecessary_block_invoke_3(uint64_t a1, CFTypeRef *a2)
{
  CFTypeRef *v2;
  uint64_t (*v4)(uint64_t, uint64_t, BOOL, _BOOL8, uint64_t, uint64_t, uint64_t, uint64_t, double, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD *, _QWORD *, _QWORD *, CFTypeRef *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  _BOOL8 v15;
  _QWORD *v16;
  int v17;
  uint64_t v18;
  char v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int OSStatus;
  CFIndex Count;
  CFArrayRef v32;
  uint64_t v33;
  const void *v34;
  CFTypeRef v35;
  __int128 v37;
  __int128 v38;
  __int128 v40;
  _QWORD v41[8];
  void *values[4];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  char v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  int v55;

  v2 = a2;
  if (gTrustd
    && (v4 = *(uint64_t (**)(uint64_t, uint64_t, BOOL, _BOOL8, uint64_t, uint64_t, uint64_t, uint64_t, double, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD *, _QWORD *, _QWORD *, CFTypeRef *))(gTrustd + 40)) != 0)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(v5 + 16);
    v7 = *(_QWORD *)(v5 + 24);
    v8 = *(unsigned __int8 *)(v5 + 116);
    v9 = *(unsigned __int8 *)(v5 + 117);
    v10 = *(_QWORD *)(v5 + 32);
    v11 = *(_QWORD *)(v5 + 40);
    v12 = *(_QWORD *)(v5 + 48);
    v13 = *(_QWORD *)(v5 + 56);
    v14 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (SecTrustGetCurrentAccessGroups_onceToken != -1)
      dispatch_once(&SecTrustGetCurrentAccessGroups_onceToken, &__block_literal_global_344);
    v15 = v9 != 0;
    v16 = *(_QWORD **)(a1 + 40);
    v2 = a2;
    v17 = v4(v6, v7, v8 != 0, v15, v10, v11, v12, v13, v14, SecTrustGetCurrentAccessGroups_accessGroups, v16[13], v16[18], v16[19], v16 + 11, v16 + 12, v16 + 9, a2);
  }
  else
  {
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(_BYTE *)(v18 + 116);
    v20 = *(_BYTE *)(v18 + 117);
    v21 = *(_OWORD *)(v18 + 16);
    v22 = *(_OWORD *)(v18 + 32);
    v23 = *(_OWORD *)(v18 + 48);
    v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (SecTrustGetCurrentAccessGroups_onceToken != -1)
    {
      v38 = *(_OWORD *)(v18 + 16);
      v40 = *(_OWORD *)(v18 + 48);
      v37 = *(_OWORD *)(v18 + 32);
      dispatch_once(&SecTrustGetCurrentAccessGroups_onceToken, &__block_literal_global_344);
      v22 = v37;
      v21 = v38;
      v23 = v40;
    }
    v25 = *(_QWORD **)(a1 + 40);
    v26 = v25[13];
    v27 = v25[18];
    v28 = v25[19];
    v52 = 0;
    v53 = &v52;
    v54 = 0x2000000000;
    v55 = 0;
    values[0] = (void *)MEMORY[0x1E0C809B0];
    values[1] = (void *)0x40000000;
    values[2] = __handle_trust_evaluate_xpc_block_invoke;
    values[3] = &__block_descriptor_tmp_361;
    v50 = v19;
    v51 = v20;
    v43 = v21;
    v44 = v22;
    v45 = v23;
    v46 = v24;
    v47 = v26;
    v48 = v27;
    v49 = v28;
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 0x40000000;
    v41[2] = __handle_trust_evaluate_xpc_block_invoke_2;
    v41[3] = &unk_1E1FDB240;
    v41[6] = v25 + 12;
    v41[7] = v25 + 9;
    v41[4] = &v52;
    v41[5] = v25 + 11;
    securityd_send_sync_and_do(8u, v2, (uint64_t)values, (uint64_t)v41);
    v17 = *((_DWORD *)v53 + 6);
    _Block_object_dispose(&v52, 8);
  }
  v29 = *(_QWORD *)(a1 + 40);
  *(_DWORD *)(v29 + 112) = v17;
  if (v17)
    return *(_DWORD *)(v29 + 112) != 0;
  OSStatus = SecErrorGetOSStatus((uint64_t)*v2);
  v29 = *(_QWORD *)(a1 + 40);
  if (OSStatus != -25291)
    return *(_DWORD *)(v29 + 112) != 0;
  Count = CFArrayGetCount(*(CFArrayRef *)(v29 + 16));
  v29 = *(_QWORD *)(a1 + 40);
  if (!Count)
    return *(_DWORD *)(v29 + 112) != 0;
  values[0] = (void *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v29 + 16), 0);
  v32 = CFArrayCreate(0, (const void **)values, 1, MEMORY[0x1E0C9B378]);
  v33 = *(_QWORD *)(a1 + 40);
  v34 = *(const void **)(v33 + 72);
  if (v34)
  {
    *(_QWORD *)(v33 + 72) = 0;
    CFRelease(v34);
    v33 = *(_QWORD *)(a1 + 40);
  }
  *(_QWORD *)(v33 + 72) = v32;
  v35 = *v2;
  if (*v2)
  {
    *v2 = 0;
    CFRelease(v35);
  }
  return 1;
}

uint64_t __SecTrustEvaluateIfNecessary_block_invoke_2(uint64_t a1)
{
  uint64_t result;
  _QWORD v3[4];
  __int128 v4;

  SecTrustValidateInput(*(_QWORD **)(a1 + 48));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = __SecTrustEvaluateIfNecessary_block_invoke_3;
  v3[3] = &unk_1E1FDB050;
  v4 = *(_OWORD *)(a1 + 40);
  result = SecOSStatusWith((uint64_t)v3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __SecTrustEvaluateIfNecessary_block_invoke(int8x16_t *a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  const void *v5;
  void *v6;
  void *v7;
  _QWORD activity_block[4];
  int8x16_t v9;
  uint64_t v10;

  if (SecTrustIsTrustResultValid(a1[3].i64[0], *(double *)(*(_QWORD *)(a1[2].i64[0] + 8) + 24)))
  {
    *(_DWORD *)(*(_QWORD *)(a1[2].i64[1] + 8) + 24) = 0;
  }
  else
  {
    v2 = a1[3].i64[0];
    *(_DWORD *)(v2 + 112) = 7;
    v3 = *(const void **)(v2 + 72);
    if (v3)
    {
      *(_QWORD *)(v2 + 72) = 0;
      CFRelease(v3);
      v2 = a1[3].i64[0];
    }
    v4 = *(const void **)(v2 + 88);
    if (v4)
    {
      *(_QWORD *)(v2 + 88) = 0;
      CFRelease(v4);
      v2 = a1[3].i64[0];
    }
    v5 = *(const void **)(v2 + 96);
    if (v5)
    {
      *(_QWORD *)(v2 + 96) = 0;
      CFRelease(v5);
      v2 = a1[3].i64[0];
    }
    v6 = *(void **)(v2 + 120);
    if (v6)
    {
      free(v6);
      *(_QWORD *)(a1[3].i64[0] + 120) = 0;
      v2 = a1[3].i64[0];
    }
    v7 = *(void **)(v2 + 128);
    if (v7)
    {
      free(v7);
      *(_QWORD *)(a1[3].i64[0] + 128) = 0;
      v2 = a1[3].i64[0];
    }
    activity_block[0] = MEMORY[0x1E0C809B0];
    activity_block[1] = 0x40000000;
    activity_block[2] = __SecTrustEvaluateIfNecessary_block_invoke_2;
    activity_block[3] = &unk_1E1FDB078;
    v10 = v2;
    v9 = vextq_s8(a1[2], a1[2], 8uLL);
    _os_activity_initiate(&dword_18A900000, "SecTrustEvaluateIfNecessary", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

@end
