@implementation SecTrustEvaluateIfNecessaryFastAsync

void __SecTrustEvaluateIfNecessaryFastAsync_block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  const void *v8;
  const void *v9;
  const void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  NSObject *v35;
  char v36;
  _QWORD v37[7];
  _QWORD v38[4];
  __int128 v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD v42[3];
  os_activity_scope_state_s v43;
  _QWORD block[6];
  _QWORD v45[8];
  __int128 buf;
  size_t (*v47)(uint64_t, void *, __CFString **);
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  char v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v2 = secLogObjForScope("trust");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v30 = *(_QWORD *)(a1 + 48);
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v30;
    _os_log_debug_impl(&dword_18A900000, v2, OS_LOG_TYPE_DEBUG, "(Trust %p) Started eval block", (uint8_t *)&buf, 0xCu);
  }
  if (SecTrustIsTrustResultValid(*(_QWORD *)(a1 + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)))
  {
    v3 = secLogObjForScope("trust");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 48);
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_18A900000, v3, OS_LOG_TYPE_DEFAULT, "(Trust %p) Prior trust results valid", (uint8_t *)&buf, 0xCu);
    }
    v5 = *(_QWORD *)(a1 + 48);
    *(_BYTE *)(v5 + 160) = 0;
    v6 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = __SecTrustEvaluateIfNecessaryFastAsync_block_invoke_385;
    block[3] = &unk_1E1FDB268;
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = v5;
    dispatch_async(v6, block);
    dispatch_release(*(dispatch_object_t *)(a1 + 56));
  }
  else
  {
    dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 48) + 168));
    v7 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)(v7 + 112) = 7;
    v8 = *(const void **)(v7 + 72);
    if (v8)
    {
      *(_QWORD *)(v7 + 72) = 0;
      CFRelease(v8);
      v7 = *(_QWORD *)(a1 + 48);
    }
    v9 = *(const void **)(v7 + 88);
    if (v9)
    {
      *(_QWORD *)(v7 + 88) = 0;
      CFRelease(v9);
      v7 = *(_QWORD *)(a1 + 48);
    }
    v10 = *(const void **)(v7 + 96);
    if (v10)
    {
      *(_QWORD *)(v7 + 96) = 0;
      CFRelease(v10);
      v7 = *(_QWORD *)(a1 + 48);
    }
    v11 = *(void **)(v7 + 120);
    if (v11)
    {
      free(v11);
      *(_QWORD *)(*(_QWORD *)(a1 + 48) + 120) = 0;
      v7 = *(_QWORD *)(a1 + 48);
    }
    v12 = *(void **)(v7 + 128);
    if (v12)
    {
      free(v12);
      *(_QWORD *)(*(_QWORD *)(a1 + 48) + 128) = 0;
    }
    v13 = _os_activity_create(&dword_18A900000, "SecTrustEvaluateIfNecessaryFastAsync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x2800000000;
    v43.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
    v43.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
    os_activity_scope_enter(v13, &v43);
    os_release(v13);
    SecTrustValidateInput(*(_QWORD **)(a1 + 48));
    if (gTrustd && *(_QWORD *)(gTrustd + 40))
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 0x40000000;
      v38[2] = __SecTrustEvaluateIfNecessaryFastAsync_block_invoke_387;
      v38[3] = &unk_1E1FDB300;
      v15 = *(_QWORD *)(a1 + 48);
      v14 = *(NSObject **)(a1 + 56);
      v40 = v42;
      v41 = v15;
      v39 = *(_OWORD *)(a1 + 32);
      dispatch_async(v14, v38);
    }
    else
    {
      v16 = MEMORY[0x1E0C809B0];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 0x40000000;
      v37[2] = __SecTrustEvaluateIfNecessaryFastAsync_block_invoke_395;
      v37[3] = &unk_1E1FDB370;
      v18 = *(_QWORD *)(a1 + 48);
      v17 = *(NSObject **)(a1 + 56);
      v37[5] = v42;
      v37[6] = v18;
      v19 = *(_QWORD *)(a1 + 40);
      v37[4] = *(_QWORD *)(a1 + 32);
      v20 = *(_BYTE *)(v18 + 116);
      v21 = *(_OWORD *)(v18 + 16);
      v22 = *(_OWORD *)(v18 + 32);
      v23 = *(_OWORD *)(v18 + 48);
      v24 = *(_BYTE *)(v18 + 117);
      v25 = *(_QWORD *)(*(_QWORD *)(v19 + 8) + 24);
      if (SecTrustGetCurrentAccessGroups_onceToken != -1)
      {
        v36 = v24;
        v35 = v17;
        v34 = *(_QWORD *)(*(_QWORD *)(v19 + 8) + 24);
        v32 = v21;
        v33 = v23;
        v31 = v22;
        dispatch_once(&SecTrustGetCurrentAccessGroups_onceToken, &__block_literal_global_344);
        v22 = v31;
        v21 = v32;
        v23 = v33;
        v24 = v36;
        v25 = v34;
        v17 = v35;
      }
      v26 = *(_QWORD **)(a1 + 48);
      v27 = v26[13];
      v28 = v26[18];
      v29 = v26[19];
      *(_QWORD *)&buf = v16;
      *((_QWORD *)&buf + 1) = 0x40000000;
      v47 = __handle_trust_evaluate_xpc_async_block_invoke;
      v48 = &__block_descriptor_tmp_407;
      v56 = v20;
      v57 = v24;
      v49 = v21;
      v50 = v22;
      v51 = v23;
      v52 = v25;
      v53 = v27;
      v54 = v28;
      v55 = v29;
      v45[0] = v16;
      v45[1] = 0x40000000;
      v45[2] = __handle_trust_evaluate_xpc_async_block_invoke_2;
      v45[3] = &unk_1E1FDB408;
      v45[4] = v37;
      v45[5] = v26 + 11;
      v45[6] = v26 + 12;
      v45[7] = v26 + 9;
      securityd_send_async_and_do(8u, v17, (uint64_t)&buf, (uint64_t)v45);
    }
    dispatch_release(*(dispatch_object_t *)(a1 + 56));
    _Block_object_dispose(v42, 8);
  }
}

void __SecTrustEvaluateIfNecessaryFastAsync_block_invoke_405(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 160))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    v2 = secLogObjForScope("trust");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v5 = 134217984;
      v6 = v3;
      _os_log_impl(&dword_18A900000, v2, OS_LOG_TYPE_DEFAULT, "(Trust %p) No pending evals, starting", (uint8_t *)&v5, 0xCu);
    }
    v4 = *(_QWORD *)(a1 + 40);
    *(_BYTE *)(v4 + 160) = 1;
    dispatch_group_enter(*(dispatch_group_t *)(v4 + 168));
  }
}

void __SecTrustEvaluateIfNecessaryFastAsync_block_invoke_385(uint64_t a1)
{
  NSObject *v2;
  const void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = secLogObjForScope("trust");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 134217984;
    v6 = v4;
    _os_log_debug_impl(&dword_18A900000, v2, OS_LOG_TYPE_DEBUG, "(Trust %p) Calling completion block", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
}

void __SecTrustEvaluateIfNecessaryFastAsync_block_invoke_387(uint64_t a1)
{
  uint64_t (*v2)(uint64_t, uint64_t, BOOL, BOOL, uint64_t, uint64_t, uint64_t, uint64_t, double, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD *, _QWORD *, _QWORD *, uint64_t *);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  _QWORD *v13;
  int v14;
  _QWORD v15[5];
  __int128 v16;
  uint64_t v17;

  v17 = 0;
  v2 = *(uint64_t (**)(uint64_t, uint64_t, BOOL, BOOL, uint64_t, uint64_t, uint64_t, uint64_t, double, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD *, _QWORD *, _QWORD *, uint64_t *))(gTrustd + 40);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(v3 + 16);
  v5 = *(_QWORD *)(v3 + 24);
  v6 = *(unsigned __int8 *)(v3 + 116);
  v7 = *(unsigned __int8 *)(v3 + 117);
  v8 = *(_QWORD *)(v3 + 32);
  v9 = *(_QWORD *)(v3 + 40);
  v10 = *(_QWORD *)(v3 + 48);
  v11 = *(_QWORD *)(v3 + 56);
  v12 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (SecTrustGetCurrentAccessGroups_onceToken != -1)
    dispatch_once(&SecTrustGetCurrentAccessGroups_onceToken, &__block_literal_global_344);
  v13 = *(_QWORD **)(a1 + 56);
  v14 = v2(v4, v5, v6 != 0, v7 != 0, v8, v9, v10, v11, v12, SecTrustGetCurrentAccessGroups_accessGroups, v13[13], v13[18], v13[19], v13 + 11, v13 + 12, v13 + 9, &v17);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 0x40000000;
  v15[2] = __SecTrustEvaluateIfNecessaryFastAsync_block_invoke_2;
  v15[3] = &unk_1E1FDB2D8;
  v16 = *(_OWORD *)(a1 + 48);
  v15[4] = *(_QWORD *)(a1 + 32);
  __SecTrustEvaluateIfNecessaryFastAsync_block_invoke_2(v15, v14, v17);
}

void __SecTrustEvaluateIfNecessaryFastAsync_block_invoke_395(_QWORD *a1, int a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  const void *v11;
  uint64_t v12;
  _QWORD v13[7];
  int v14;
  uint8_t v15[4];
  uint64_t v16;
  _BYTE buf[24];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = secLogObjForScope("trust");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = a1[6];
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a2;
    _os_log_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEFAULT, "(Trust %p) trustd returned %d", buf, 0x12u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2000000000;
  v18 = -67671;
  v8 = a1[6];
  v9 = *(NSObject **)(v8 + 136);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 0x40000000;
  v13[2] = __SecTrustEvaluateIfNecessaryFastAsync_block_invoke_397;
  v13[3] = &unk_1E1FDB348;
  v14 = a2;
  v13[5] = v8;
  v13[6] = a3;
  v13[4] = buf;
  dispatch_sync(v9, v13);
  v10 = secLogObjForScope("trust");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = a1[6];
    *(_DWORD *)v15 = 134217984;
    v16 = v12;
    _os_log_debug_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEBUG, "(Trust %p) Calling completion block after async xpc", v15, 0xCu);
  }
  os_activity_scope_leave((os_activity_scope_state_t)(*(_QWORD *)(a1[5] + 8) + 24));
  (*(void (**)(void))(a1[4] + 16))();
  v11 = (const void *)a1[6];
  if (v11)
    CFRelease(v11);
  _Block_object_dispose(buf, 8);
}

void __SecTrustEvaluateIfNecessaryFastAsync_block_invoke_397(uint64_t a1)
{
  int v2;
  uint64_t v3;
  int OSStatus;
  CFIndex Count;
  CFArrayRef v6;
  uint64_t v7;
  const void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[6];
  _BYTE values[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 40);
  *(_DWORD *)(v3 + 112) = v2;
  if (!v2
    && (OSStatus = SecErrorGetOSStatus(*(_QWORD *)(a1 + 48)), v3 = *(_QWORD *)(a1 + 40), OSStatus == -25291)
    && (Count = CFArrayGetCount(*(CFArrayRef *)(v3 + 16)), v3 = *(_QWORD *)(a1 + 40), Count))
  {
    *(_QWORD *)values = CFArrayGetValueAtIndex(*(CFArrayRef *)(v3 + 16), 0);
    v6 = CFArrayCreate(0, (const void **)values, 1, MEMORY[0x1E0C9B378]);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(const void **)(v7 + 72);
    if (v8)
    {
      *(_QWORD *)(v7 + 72) = 0;
      CFRelease(v8);
      v7 = *(_QWORD *)(a1 + 40);
    }
    *(_QWORD *)(v7 + 72) = v6;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __SecTrustEvaluateIfNecessaryFastAsync_block_invoke_2_398;
    v11[3] = &__block_descriptor_tmp_399;
    v11[4] = *(_QWORD *)(a1 + 48);
    v11[5] = v3;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = SecOSStatusWith((uint64_t)v11);
    v9 = secLogObjForScope("trust");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)values = 134217984;
      *(_QWORD *)&values[4] = v10;
      _os_log_debug_impl(&dword_18A900000, v9, OS_LOG_TYPE_DEBUG, "(Trust %p) Kick off pending evals", values, 0xCu);
    }
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 168));
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 160) = 0;
  }
}

BOOL __SecTrustEvaluateIfNecessaryFastAsync_block_invoke_2_398(uint64_t a1, _QWORD *a2)
{
  if (a2)
    *a2 = *(_QWORD *)(a1 + 32);
  return *(_DWORD *)(*(_QWORD *)(a1 + 40) + 112) != 0;
}

void __SecTrustEvaluateIfNecessaryFastAsync_block_invoke_2(_QWORD *a1, int a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  const void *v11;
  uint64_t v12;
  _QWORD v13[7];
  int v14;
  uint8_t v15[4];
  uint64_t v16;
  _BYTE buf[24];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = secLogObjForScope("trust");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = a1[6];
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a2;
    _os_log_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEFAULT, "(Trust %p) trustd returned %d", buf, 0x12u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2000000000;
  v18 = -67671;
  v8 = a1[6];
  v9 = *(NSObject **)(v8 + 136);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 0x40000000;
  v13[2] = __SecTrustEvaluateIfNecessaryFastAsync_block_invoke_388;
  v13[3] = &unk_1E1FDB2B0;
  v14 = a2;
  v13[5] = v8;
  v13[6] = a3;
  v13[4] = buf;
  dispatch_sync(v9, v13);
  v10 = secLogObjForScope("trust");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = a1[6];
    *(_DWORD *)v15 = 134217984;
    v16 = v12;
    _os_log_debug_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEBUG, "(Trust %p) Calling completion block after async xpc", v15, 0xCu);
  }
  os_activity_scope_leave((os_activity_scope_state_t)(*(_QWORD *)(a1[5] + 8) + 24));
  (*(void (**)(void))(a1[4] + 16))();
  v11 = (const void *)a1[6];
  if (v11)
    CFRelease(v11);
  _Block_object_dispose(buf, 8);
}

void __SecTrustEvaluateIfNecessaryFastAsync_block_invoke_388(uint64_t a1)
{
  int v2;
  uint64_t v3;
  int OSStatus;
  CFIndex Count;
  CFArrayRef v6;
  uint64_t v7;
  const void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[6];
  _BYTE values[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 40);
  *(_DWORD *)(v3 + 112) = v2;
  if (!v2
    && (OSStatus = SecErrorGetOSStatus(*(_QWORD *)(a1 + 48)), v3 = *(_QWORD *)(a1 + 40), OSStatus == -25291)
    && (Count = CFArrayGetCount(*(CFArrayRef *)(v3 + 16)), v3 = *(_QWORD *)(a1 + 40), Count))
  {
    *(_QWORD *)values = CFArrayGetValueAtIndex(*(CFArrayRef *)(v3 + 16), 0);
    v6 = CFArrayCreate(0, (const void **)values, 1, MEMORY[0x1E0C9B378]);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(const void **)(v7 + 72);
    if (v8)
    {
      *(_QWORD *)(v7 + 72) = 0;
      CFRelease(v8);
      v7 = *(_QWORD *)(a1 + 40);
    }
    *(_QWORD *)(v7 + 72) = v6;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __SecTrustEvaluateIfNecessaryFastAsync_block_invoke_2_389;
    v11[3] = &__block_descriptor_tmp_390;
    v11[4] = *(_QWORD *)(a1 + 48);
    v11[5] = v3;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = SecOSStatusWith((uint64_t)v11);
    v9 = secLogObjForScope("trust");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)values = 134217984;
      *(_QWORD *)&values[4] = v10;
      _os_log_debug_impl(&dword_18A900000, v9, OS_LOG_TYPE_DEBUG, "(Trust %p) Kick off pending evals", values, 0xCu);
    }
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 168));
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 160) = 0;
  }
}

BOOL __SecTrustEvaluateIfNecessaryFastAsync_block_invoke_2_389(uint64_t a1, _QWORD *a2)
{
  if (a2)
    *a2 = *(_QWORD *)(a1 + 32);
  return *(_DWORD *)(*(_QWORD *)(a1 + 40) + 112) != 0;
}

@end
