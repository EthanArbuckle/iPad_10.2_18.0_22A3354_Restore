@implementation IDSMPPublicLegacyIdentity

+ (IDSMPPublicLegacyIdentity)identityWithData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  const char *v8;
  double v9;
  const void *v10;
  id v11;
  id v12;
  const char *v13;
  double v14;
  void *v15;
  id v17;

  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC8274]();
  v17 = 0;
  v10 = (const void *)objc_msgSend__createPublicIdentityFromData_error_(a1, v8, (uint64_t)v6, v9, &v17);
  v11 = v17;
  if (v10)
  {
    v12 = objc_alloc((Class)a1);
    v15 = (void *)objc_msgSend_initWithPublicIdentity_(v12, v13, (uint64_t)v10, v14);
    CFRelease(v10);
  }
  else
  {
    v15 = 0;
  }
  objc_autoreleasePoolPop(v7);
  if (a4 && v11)
    *a4 = objc_retainAutorelease(v11);

  return (IDSMPPublicLegacyIdentity *)v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSMPPublicLegacyIdentity)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  void *v8;
  void *v9;
  const char *v10;
  double v11;
  const void *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  double v16;
  void *v17;
  IDSMPPublicLegacyIdentity *v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("kIDSMPPublicLegacyIdentityData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_class();
  v21 = 0;
  v12 = (const void *)objc_msgSend__createPublicIdentityFromData_error_(v9, v10, (uint64_t)v8, v11, &v21);
  v15 = v21;
  if (v12)
  {
    v17 = (void *)objc_msgSend_initWithPublicIdentity_(self, v13, (uint64_t)v12, v16);
    CFRelease(v12);
    self = v17;
    v18 = self;
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v13, v14, v16);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      v23 = v15;
      v24 = 2113;
      v25 = v8;
      _os_log_impl(&dword_19B949000, v19, OS_LOG_TYPE_DEFAULT, "initWithCoder failed {error: %{public}@, data: %{private}@}", buf, 0x16u);
    }

    v18 = 0;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  double v11;
  NSObject *v12;
  const char *v13;
  double v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0;
  objc_msgSend_dataRepresentationWithError_(self, v5, (uint64_t)&v15, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v7)
  {
    objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, v11, CFSTR("kIDSMPPublicLegacyIdentityData"));
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v8, v9, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v10;
      _os_log_impl(&dword_19B949000, v12, OS_LOG_TYPE_DEFAULT, "Failed to encode with coder {error: %{public}@}", buf, 0xCu);
    }

    objc_msgSend_failWithError_(v4, v13, (uint64_t)v10, v14);
  }

}

- (IDSMPPublicLegacyIdentity)initWithPublicIdentity:(_SecMPPublicIdentity *)a3
{
  return (IDSMPPublicLegacyIdentity *)((uint64_t (*)(IDSMPPublicLegacyIdentity *, char *, _SecMPPublicIdentity *))MEMORY[0x1E0DE7D20])(self, sel_initWithBackingValue_, a3);
}

- (id)signAndProtectData:(id)a3 withSigner:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  IDSMPPublicLegacyIdentity *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v26 = 0;
  v14 = objc_msgSend_fullIdentity(v9, v11, v12, v13);
  v20 = objc_msgSend_publicIdentity(self, v15, v16, v17);
  if (qword_1EE40AE78 != -1)
    dispatch_once(&qword_1EE40AE78, &unk_1E3C1C230);
  if (!off_1EE40AE70)
  {
    v23 = 0;
    if (!a5)
      goto LABEL_8;
LABEL_7:
    *a5 = objc_retainAutorelease(v23);
    goto LABEL_8;
  }
  if ((off_1EE40AE70(v8, v14, v20, v10, &v26) & 1) != 0)
  {
    v22 = v10;
    goto LABEL_11;
  }
  v23 = v26;
  if (a5)
    goto LABEL_7;
LABEL_8:
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v18, v19, v21);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138478595;
    v28 = v8;
    v29 = 2113;
    v30 = v9;
    v31 = 2114;
    v32 = self;
    v33 = 2114;
    v34 = v23;
    _os_log_error_impl(&dword_19B949000, v24, OS_LOG_TYPE_ERROR, "Failed to encrypt with message protection {data: %{private}@, fullKey: %{private}@, publicKey: %{public}@, error: %{public}@}", buf, 0x2Au);
  }

  v22 = 0;
LABEL_11:

  return v22;
}

+ (_SecMPPublicIdentity)_createPublicIdentityFromData:(id)a3 error:(id *)a4
{
  const char *v5;
  uint64_t v6;
  id v7;
  double v8;
  _SecMPPublicIdentity *v9;
  id v10;
  NSObject *v11;
  id v13;

  v7 = a3;
  v13 = 0;
  if (qword_1EE40AA78 != -1)
    dispatch_once(&qword_1EE40AA78, &unk_1E3C20988);
  if (!off_1EE40AA70)
  {
    v10 = 0;
    if (!a4)
      goto LABEL_9;
LABEL_8:
    *a4 = objc_retainAutorelease(v10);
    goto LABEL_9;
  }
  v9 = (_SecMPPublicIdentity *)off_1EE40AA70(0, v7, &v13);
  if (v9)
    goto LABEL_12;
  v10 = v13;
  if (a4)
    goto LABEL_8;
LABEL_9:
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v5, v6, v8);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    sub_19BAF5FD0();

  v9 = 0;
LABEL_12:

  return v9;
}

- (id)dataRepresentationWithError:(id *)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v17;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v17 = 0;
  v11 = objc_msgSend_publicIdentity(self, v6, v7, v8);
  if (qword_1EE40AA58 != -1)
    dispatch_once(&qword_1EE40AA58, &unk_1E3C1C2B0);
  if (!off_1EE40AA50)
  {
    v14 = 0;
    if (!a3)
      goto LABEL_8;
LABEL_7:
    *a3 = objc_retainAutorelease(v14);
    goto LABEL_8;
  }
  if ((off_1EE40AA50(v11, v5, &v17) & 1) != 0)
  {
    v13 = v5;
    goto LABEL_11;
  }
  v14 = v17;
  if (a3)
    goto LABEL_7;
LABEL_8:
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v9, v10, v12);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_19BAF6034();

  v13 = 0;
LABEL_11:

  return v13;
}

@end
