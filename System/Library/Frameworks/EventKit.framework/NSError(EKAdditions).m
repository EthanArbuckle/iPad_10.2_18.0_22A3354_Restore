@implementation NSError(EKAdditions)

- (uint64_t)cal_isCertificateError
{
  void *v2;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
  {
    if (objc_msgSend(a1, "code") == -1203 || objc_msgSend(a1, "code") == -1201 || objc_msgSend(a1, "code") == -1204)
    {

      return 1;
    }
    v7 = objc_msgSend(a1, "code");

    if (v7 == -1202)
      return 1;
  }
  else
  {

  }
  objc_msgSend(a1, "domain");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 == CFSTR("kEKAccountErrorDomain"))
  {
    v6 = objc_msgSend(a1, "code");

    if (v6 == 6)
      return 1;
  }
  else
  {

  }
  return 0;
}

- (void)cal_trustInfoCopy
{
  OUTLINED_FUNCTION_7(&dword_1A2318000, a2, a3, "Deserialization of trust error [%@]", a5, a6, a7, a8, 2u);
}

+ (BOOL)_cal_serializedEntryForKey:()EKAdditions value:outKey:outValue:
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _BOOL8 v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  _QWORD v28[4];
  id v29;

  v9 = a3;
  v10 = a4;
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("NSErrorPeerCertificateChainKey")))
  {
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB32F8]))
    {
      v27 = 0;
      v15 = (void *)SecTrustSerialize();
      v16 = v15;
      v14 = v15 != 0;
      if (v15)
      {
        *a6 = objc_retainAutorelease(v15);
        *a5 = objc_retainAutorelease((id)*MEMORY[0x1E0D0BF08]);
      }
      else
      {
        v19 = EKLogHandle;
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
          +[NSError(EKAdditions) _cal_serializedEntryForKey:value:outKey:outValue:].cold.1((uint64_t)&v27, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    else
    {
      v17 = (void *)*MEMORY[0x1E0CB3388];
      if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB3388]))
      {
        v14 = 0;
        goto LABEL_14;
      }
      v16 = v10;
      objc_msgSend(v16, "cal_serializableError");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v14 = v18 != v16;
      if (v18 != v16)
      {
        *a5 = objc_retainAutorelease(v17);
        *a6 = objc_retainAutorelease(v18);
      }

    }
    goto LABEL_14;
  }
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __73__NSError_EKAdditions___cal_serializedEntryForKey_value_outKey_outValue___block_invoke;
  v28[3] = &unk_1E4785DC8;
  v29 = v11;
  v12 = v11;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v28);
  *a5 = objc_retainAutorelease(v9);
  v13 = objc_retainAutorelease(v12);
  *a6 = v13;

  v14 = 1;
LABEL_14:

  return v14;
}

- (id)cal_serializableUserInfo
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[8];

  v22[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  v21 = 0;
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = *MEMORY[0x1E0CB3300];
  v22[0] = *MEMORY[0x1E0CB32F0];
  v22[1] = v3;
  v22[2] = *MEMORY[0x1E0CB32F8];
  v22[3] = CFSTR("NSErrorPeerCertificateChainKey");
  v4 = *MEMORY[0x1E0CB2D80];
  v22[4] = *MEMORY[0x1E0CB2D50];
  v22[5] = v4;
  v22[6] = *MEMORY[0x1E0CB3388];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__NSError_EKAdditions__cal_serializableUserInfo__block_invoke;
  v12[3] = &unk_1E4785DF0;
  v7 = v6;
  v13 = v7;
  v15 = &v16;
  v8 = v1;
  v14 = v8;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);
  v9 = (void *)v17[5];
  if (!v9)
    v9 = v8;
  v10 = v9;

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)cal_serializableError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cal_serializableUserInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == v3)
  {
    v6 = a1;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(a1, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, objc_msgSend(a1, "code"), v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (void)_cal_serializedEntryForKey:()EKAdditions value:outKey:outValue:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A2318000, a2, a3, "We were unable to serialize the trust for a certificate error [%@].", a5, a6, a7, a8, 2u);
}

@end
