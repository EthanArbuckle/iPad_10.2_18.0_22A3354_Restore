@implementation IDSMPFullLegacyIdentity

+ (IDSMPFullLegacyIdentity)identityWithData:(id)a3 error:(id *)a4
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
  v10 = (const void *)objc_msgSend__createFullIdentityFromData_error_(a1, v8, (uint64_t)v6, v9, &v17);
  v11 = v17;
  if (v10)
  {
    v12 = objc_alloc((Class)a1);
    v15 = (void *)objc_msgSend_initWithFullIdentity_(v12, v13, (uint64_t)v10, v14);
    CFRelease(v10);
  }
  else
  {
    v15 = 0;
  }
  objc_autoreleasePoolPop(v7);
  if (a4 && v11)
    *a4 = objc_retainAutorelease(v11);

  return (IDSMPFullLegacyIdentity *)v15;
}

+ (IDSMPFullLegacyIdentity)identityWithError:(id *)a3
{
  double v3;
  uint64_t FullIdentityWithError;
  const void *v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;

  FullIdentityWithError = objc_msgSend__createFullIdentityWithError_(a1, a2, (uint64_t)a3, v3);
  if (FullIdentityWithError)
  {
    v6 = (const void *)FullIdentityWithError;
    v7 = objc_alloc((Class)a1);
    v10 = (void *)objc_msgSend_initWithFullIdentity_(v7, v8, (uint64_t)v6, v9);
    CFRelease(v6);
  }
  else
  {
    v10 = 0;
  }
  return (IDSMPFullLegacyIdentity *)v10;
}

+ (IDSMPFullLegacyIdentity)identityWithDataProtectionClass:(unsigned int)a3 error:(id *)a4
{
  double v4;
  uint64_t FullIdentityWithDataProtectionClass_error;
  const void *v7;
  id v8;
  const char *v9;
  double v10;
  void *v11;

  FullIdentityWithDataProtectionClass_error = objc_msgSend__createFullIdentityWithDataProtectionClass_error_(a1, a2, *(uint64_t *)&a3, v4, a4);
  if (FullIdentityWithDataProtectionClass_error)
  {
    v7 = (const void *)FullIdentityWithDataProtectionClass_error;
    v8 = objc_alloc((Class)a1);
    v11 = (void *)objc_msgSend_initWithFullIdentity_(v8, v9, (uint64_t)v7, v10);
    CFRelease(v7);
  }
  else
  {
    v11 = 0;
  }
  return (IDSMPFullLegacyIdentity *)v11;
}

- (IDSMPFullLegacyIdentity)initWithFullIdentity:(_SecMPFullIdentity *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IDSMPFullLegacyIdentity;
  return -[IDSMPIdentity initWithBackingValue:](&v4, sel_initWithBackingValue_, a3);
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
    objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, v11, CFSTR("kIDSMPFullLegacyIdentityData"));
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

- (IDSMPFullLegacyIdentity)initWithCoder:(id)a3
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
  IDSMPFullLegacyIdentity *v18;
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
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("kIDSMPFullLegacyIdentityData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_class();
  v21 = 0;
  v12 = (const void *)objc_msgSend__createFullIdentityFromData_error_(v9, v10, (uint64_t)v8, v11, &v21);
  v15 = v21;
  if (v12)
  {
    v17 = (void *)objc_msgSend_initWithFullIdentity_(self, v13, (uint64_t)v12, v16);
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)publicIdentityWithError:(id *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  const char *v10;
  double v11;
  uint64_t v12;
  const void *v13;
  IDSMPPublicLegacyIdentity *v14;
  const char *v15;
  double v16;
  void *v17;

  v5 = (void *)objc_opt_class();
  v9 = objc_msgSend_fullIdentity(self, v6, v7, v8);
  v12 = objc_msgSend__copyPublicIdentityFromFullIdentity_error_(v5, v10, v9, v11, a3);
  if (v12)
  {
    v13 = (const void *)v12;
    v14 = [IDSMPPublicLegacyIdentity alloc];
    v17 = (void *)objc_msgSend_initWithPublicIdentity_(v14, v15, (uint64_t)v13, v16);
    CFRelease(v13);
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (id)verifyAndExposeData:(id)a3 withSigner:(id)a4 error:(id *)a5
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
  IDSMPFullLegacyIdentity *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v26 = 0;
  v14 = objc_msgSend_publicIdentity(v9, v11, v12, v13);
  v20 = objc_msgSend_fullIdentity(self, v15, v16, v17);
  if (qword_1EE40AE88 != -1)
    dispatch_once(&qword_1EE40AE88, &unk_1E3C1B7B0);
  if (!off_1EE40AE80)
  {
    v23 = 0;
    if (!a5)
      goto LABEL_8;
LABEL_7:
    *a5 = objc_retainAutorelease(v23);
    goto LABEL_8;
  }
  if ((off_1EE40AE80(v8, v14, v20, v10, &v26) & 1) != 0)
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
    v30 = self;
    v31 = 2114;
    v32 = v9;
    v33 = 2114;
    v34 = v23;
    _os_log_error_impl(&dword_19B949000, v24, OS_LOG_TYPE_ERROR, "Failed to decrypt with message protection {data: %{private}@, fullKey: %{private}@, publicKey: %{public}@, error: %{public}@}", buf, 0x2Au);
  }

  v22 = 0;
LABEL_11:

  return v22;
}

- (id)protectedHashOfMessageData:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  IDSMPFullLegacyIdentity *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18 = 0;
  v12 = objc_msgSend_fullIdentity(self, v7, v8, v9);
  if (qword_1EE40AD58 != -1)
    dispatch_once(&qword_1EE40AD58, &unk_1E3C20908);
  if (!off_1EE40AD50)
  {
    v15 = 0;
    if (!a4)
      goto LABEL_9;
LABEL_8:
    *a4 = objc_retainAutorelease(v15);
    goto LABEL_9;
  }
  v14 = (void *)off_1EE40AD50(v6, v12, &v18);
  if (v14)
    goto LABEL_12;
  v15 = v18;
  if (a4)
    goto LABEL_8;
LABEL_9:
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v10, v11, v13);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138478339;
    v20 = v6;
    v21 = 2113;
    v22 = self;
    v23 = 2114;
    v24 = v15;
    _os_log_error_impl(&dword_19B949000, v16, OS_LOG_TYPE_ERROR, "Failed to hash message with message protection {data: %{private}@, fullKey: %{private}@, error: %{public}@}", buf, 0x20u);
  }

  v14 = 0;
LABEL_12:

  return v14;
}

- (unsigned)dataProtectionClassWithError:(id *)a3
{
  double v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  const void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  id v15;

  v15 = 0;
  v7 = objc_msgSend_fullIdentity(self, a2, (uint64_t)a3, v3);
  if (qword_1EE40AA28 != -1)
    dispatch_once(&qword_1EE40AA28, &unk_1E3C20928);
  if (off_1EE40AA20 && (v9 = off_1EE40AA20(v7, &v15)) != 0)
  {
    v10 = (const void *)v9;
    v11 = IMGetKeychainDataProtectionClassFromSecAttrDataProtectionClass();
    CFRelease(v10);
    v12 = 0;
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v5, v6, v8);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_19BAF5C64();

    v12 = v15;
    if (a3)
    {
      v12 = objc_retainAutorelease(v15);
      *a3 = v12;
    }
    v11 = 2;
  }

  return v11;
}

- (BOOL)updateIdentityToDataProtectionClass:(unsigned int)a3 error:(id *)a4
{
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  NSObject *v15;
  id v16;
  BOOL v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  IDSMPFullLegacyIdentity *v22;
  __int16 v23;
  unsigned int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = IMGetSecAttrDataProtectionClassFromKeychainDataProtectionClass();
  v20 = 0;
  v13 = objc_msgSend_fullIdentity(self, v8, v9, v10);
  if (qword_1EE40AA38 != -1)
    dispatch_once(&qword_1EE40AA38, &unk_1E3C1C050);
  if (off_1EE40AA30 && off_1EE40AA30(v13, v7, &v20))
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v11, v12, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      v22 = self;
      v23 = 1024;
      v24 = a3;
      _os_log_impl(&dword_19B949000, v15, OS_LOG_TYPE_DEFAULT, "Updated identity data protectionClass {identity: %{private}@, dataProtectionClass: %d}", buf, 0x12u);
    }

    v16 = 0;
    v17 = 1;
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v11, v12, v14);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_19BAF5CC8();

    v16 = v20;
    if (a4)
    {
      v16 = objc_retainAutorelease(v20);
      v17 = 0;
      *a4 = v16;
    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (BOOL)purgeFromKeychain:(id *)a3
{
  double v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  void *v18;

  objc_msgSend_description(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v12 = objc_msgSend_fullIdentity(self, v7, v8, v9);
  if (qword_1EE40B228 != -1)
    dispatch_once(&qword_1EE40B228, &unk_1E3C20948);
  if (!off_1EE40B220)
  {
    v15 = 0;
    if (!a3)
      goto LABEL_8;
LABEL_7:
    *a3 = objc_retainAutorelease(v15);
    goto LABEL_8;
  }
  if ((off_1EE40B220(v12, &v18) & 1) != 0)
  {
    v14 = 1;
    goto LABEL_11;
  }
  v15 = v18;
  if (a3)
    goto LABEL_7;
LABEL_8:
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v10, v11, v13);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    sub_19BAF5D48();

  v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)didDataRepresentationFormatChangeFromDataRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  double v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  double v12;
  int isEqualToData;
  char v14;
  const char *v15;
  uint64_t v16;
  double v17;
  NSObject *v18;
  const __CFString *v19;
  const __CFString *v21;
  int v22;
  const __CFString *v23;
  __int16 v24;
  IDSMPFullLegacyIdentity *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_dataRepresentationWithError_(self, v7, (uint64_t)a4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    isEqualToData = objc_msgSend_isEqualToData_(v6, v9, (uint64_t)v11, v12);
    v14 = isEqualToData ^ 1;
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v15, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = CFSTR("YES");
      if (isEqualToData)
        v19 = CFSTR("NO");
      v22 = 138412290;
      v23 = v19;
      _os_log_impl(&dword_19B949000, v18, OS_LOG_TYPE_DEFAULT, "Serialization of message protection identity completed for updated check {dataIsDifferent: %@}", (uint8_t *)&v22, 0xCu);
    }
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v9, v10, v12);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      if (a4)
        v21 = (const __CFString *)*a4;
      else
        v21 = 0;
      v22 = 138543875;
      v23 = v21;
      v24 = 2113;
      v25 = self;
      v26 = 2113;
      v27 = v6;
      _os_log_error_impl(&dword_19B949000, v18, OS_LOG_TYPE_ERROR, "Failed to serialize IDSMPFullLegacyIdentity - Failed to determine didDataRepresentationFormatChangeFromDataRepresentation {error: %{public}@, fullIdentity: %{private}@, originalDataRepresentation: %{private}@}", (uint8_t *)&v22, 0x20u);
    }
    v14 = 0;
  }

  return v14;
}

+ (_SecMPFullIdentity)_createFullIdentityFromData:(id)a3 error:(id *)a4
{
  const char *v5;
  uint64_t v6;
  id v7;
  double v8;
  _SecMPFullIdentity *v9;
  id v10;
  NSObject *v11;
  id v13;

  v7 = a3;
  v13 = 0;
  if (qword_1EE40AA48 != -1)
    dispatch_once(&qword_1EE40AA48, &unk_1E3C20968);
  if (!off_1EE40AA40)
  {
    v10 = 0;
    if (!a4)
      goto LABEL_9;
LABEL_8:
    *a4 = objc_retainAutorelease(v10);
    goto LABEL_9;
  }
  v9 = (_SecMPFullIdentity *)off_1EE40AA40(0, v7, &v13);
  if (v9)
    goto LABEL_12;
  v10 = v13;
  if (a4)
    goto LABEL_8;
LABEL_9:
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v5, v6, v8);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    sub_19BAF5DB0();

  v9 = 0;
LABEL_12:

  return v9;
}

+ (_SecMPFullIdentity)_createFullIdentityWithError:(id *)a3
{
  double v3;
  _SecMPFullIdentity *result;
  id v6;
  NSObject *v7;
  id v8;

  v8 = 0;
  if (qword_1EE40B238 != -1)
    dispatch_once(&qword_1EE40B238, &unk_1E3C1C110);
  if (!off_1EE40B230)
  {
    v6 = 0;
    if (!a3)
      goto LABEL_9;
LABEL_8:
    *a3 = objc_retainAutorelease(v6);
    goto LABEL_9;
  }
  result = (_SecMPFullIdentity *)off_1EE40B230(0, &v8);
  if (result)
    return result;
  v6 = v8;
  if (a3)
    goto LABEL_8;
LABEL_9:
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_19BAF5E14((uint64_t)v6, v7);

  return 0;
}

+ (_SecMPFullIdentity)_createFullIdentityWithDataProtectionClass:(unsigned int)a3 error:(id *)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  _SecMPFullIdentity *result;
  id v11;
  NSObject *v12;
  id v13;

  v13 = 0;
  v8 = IMGetSecAttrDataProtectionClassFromKeychainDataProtectionClass();
  if (qword_1EE40B248 != -1)
    dispatch_once(&qword_1EE40B248, &unk_1E3C1C130);
  if (!off_1EE40B240)
  {
    v11 = 0;
    if (!a4)
      goto LABEL_9;
LABEL_8:
    *a4 = objc_retainAutorelease(v11);
    goto LABEL_9;
  }
  result = (_SecMPFullIdentity *)off_1EE40B240(0, v8, &v13);
  if (result)
    return result;
  v11 = v13;
  if (a4)
    goto LABEL_8;
LABEL_9:
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v6, v7, v9);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    sub_19BAF5E84((uint64_t)v11, a3, v12);

  return 0;
}

+ (_SecMPPublicIdentity)_copyPublicIdentityFromFullIdentity:(_SecMPFullIdentity *)a3 error:(id *)a4
{
  double v4;
  _SecMPPublicIdentity *result;
  id v8;
  NSObject *v9;
  id v10;

  v10 = 0;
  if (qword_1EE40AA68 != -1)
    dispatch_once(&qword_1EE40AA68, &unk_1E3C1C190);
  if (!off_1EE40AA60)
  {
    v8 = 0;
    if (!a4)
      goto LABEL_9;
LABEL_8:
    *a4 = objc_retainAutorelease(v8);
    goto LABEL_9;
  }
  result = (_SecMPPublicIdentity *)off_1EE40AA60(0, a3, &v10);
  if (result)
    return result;
  v8 = v10;
  if (a4)
    goto LABEL_8;
LABEL_9:
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_19BAF5F04();

  return 0;
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
  v11 = objc_msgSend_fullIdentity(self, v6, v7, v8);
  if (qword_1EE40AA18 != -1)
    dispatch_once(&qword_1EE40AA18, &unk_1E3C1C210);
  if (!off_1EE40AA10)
  {
    v14 = 0;
    if (!a3)
      goto LABEL_8;
LABEL_7:
    *a3 = objc_retainAutorelease(v14);
    goto LABEL_8;
  }
  if ((off_1EE40AA10(v11, v5, &v17) & 1) != 0)
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
    sub_19BAF5F68();

  v13 = 0;
LABEL_11:

  return v13;
}

@end
