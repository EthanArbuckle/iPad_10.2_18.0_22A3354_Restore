@implementation SecRequestSharedWebCredential

void __SecRequestSharedWebCredential_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;

  v2 = a1[4];
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
  v3 = *(const void **)(*(_QWORD *)(a1[6] + 8) + 24);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v4)
    CFRelease(v4);
}

void __SecRequestSharedWebCredential_block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  SharedCredentialController *v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  const void *v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  __CFString **v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD block[7];
  void *v25;
  _QWORD v26[3];
  uint8_t buf[8];
  void *v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(_QWORD *)(a1[8] + 8);
  v5 = objc_alloc_init(SharedCredentialController);
  -[SharedCredentialController passwordCredential](v5, "passwordCredential");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SharedCredentialController result](v5, "result");
  if (v7)
  {
    v8 = v7;
    secLogObjForScope("swcagent");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v8;
      _os_log_debug_impl(&dword_18A900000, v9, OS_LOG_TYPE_DEBUG, "SecCopySharedWebCredentialSync received result %d", buf, 8u);
    }

    -[SharedCredentialController error](v5, "error");
    *(_QWORD *)(v4 + 24) = objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  else if (v6)
  {
    *(_QWORD *)buf = v2;
    v26[0] = CFSTR("srvr");
    v26[1] = CFSTR("acct");
    objc_msgSend(v6, "user");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v11;
    v26[2] = CFSTR("spwd");
    objc_msgSend(v6, "password");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v26, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0;
  }
  else
  {
    secLogObjForScope("swcagent");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18A900000, v14, OS_LOG_TYPE_DEBUG, "SecCopySharedWebCredentialSync found no credential", buf, 2u);
    }

    v10 = (void *)MEMORY[0x1E0C9AA60];
    v8 = -25300;
  }
  v15 = v10;
  *(_QWORD *)(v3 + 24) = v15;

  v16 = *(const void **)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v16)
    CFRelease(v16);
  v17 = *(const void **)(*(_QWORD *)(a1[6] + 8) + 24);
  if (v17)
    CFRelease(v17);
  v18 = a1[8];
  if (v8)
  {
    v19 = *(_QWORD *)(v18 + 8);
    v21 = *(_QWORD *)(v19 + 24);
    v20 = (__CFString **)(v19 + 24);
    if (!v21)
    {
      SecError(v8, v20, CFSTR("Error copying shared password"));
      v18 = a1[8];
    }
  }
  v22 = *(NSObject **)(*(_QWORD *)(a1[9] + 8) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __SecRequestSharedWebCredential_block_invoke_3;
  block[3] = &unk_1E1FD9DB8;
  v23 = a1[7];
  block[4] = a1[4];
  block[5] = v23;
  block[6] = v18;
  dispatch_async(v22, block);
}

void __SecRequestSharedWebCredential_block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;

  v2 = a1[4];
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
  v3 = *(const void **)(*(_QWORD *)(a1[6] + 8) + 24);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v4)
    CFRelease(v4);
}

@end
