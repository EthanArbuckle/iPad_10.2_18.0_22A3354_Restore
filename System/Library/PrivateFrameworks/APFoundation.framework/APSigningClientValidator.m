@implementation APSigningClientValidator

+ (id)mockXPCObject
{
  id v2;
  id v3;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (id)qword_1EFB8D408;
  objc_sync_exit(v2);

  return v3;
}

+ (void)setMockXPCObject:(id)a3
{
  id v4;
  void *v5;
  id obj;

  v4 = a3;
  obj = a1;
  objc_sync_enter(obj);
  v5 = (void *)qword_1EFB8D408;
  qword_1EFB8D408 = (uint64_t)v4;

  objc_sync_exit(obj);
}

+ (BOOL)isAllowedClient
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleIdentifier(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (objc_msgSend_isEqualToString_(v8, v9, (uint64_t)&stru_1E8C4E328, v10) & 1) == 0
    && objc_msgSend__validateAllowListingForPoolCreation_(APSigningClientValidator, v9, (uint64_t)v8, v10)&& (objc_msgSend_hasEntitlement_(APSigningClientValidator, v9, (uint64_t)CFSTR("com.apple.ap.signingservice.client"), v10) & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v9, (uint64_t)CFSTR("Client bundle id %@ is nil, not allow listed or not entitled to use signing service."), v10, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    APLogForCategory(0x2AuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_1CF251000, v13, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    APSimulateCrash((const char *)5, v12, 0);
    v11 = 0;
  }

  return v11;
}

+ (BOOL)hasEntitlement:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;

  v3 = objc_retainAutorelease(a3);
  objc_msgSend_UTF8String(v3, v4, v5, v6);
  v10 = (void *)xpc_copy_entitlement_for_self();
  if (v10)
    goto LABEL_4;
  objc_msgSend_mockXPCObject(APSigningClientValidator, v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_retainAutorelease(v3);
    v16 = (const char *)objc_msgSend_UTF8String(v12, v13, v14, v15);
    xpc_dictionary_get_value(v11, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_4:
    LOBYTE(v11) = xpc_BOOL_get_value(v10);

  }
  return (char)v11;
}

+ (BOOL)_validateAllowListingForPoolCreation:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_sha256hash(CFSTR("com.apple.ap.promotedcontentd"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sha256hash(v3, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend_containsObject_(v9, v14, (uint64_t)v13, v15);
  return (char)v7;
}

@end
