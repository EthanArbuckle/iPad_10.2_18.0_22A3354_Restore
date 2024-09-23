@implementation LSHRNSupport

+ (BOOL)deviceConfiguredForHRN
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t (*v8)();
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)();
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v26)();
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  if (MobileActivationLibrary(void)::frameworkLibrary
    || (v2 = dlopen("/System/Library/PrivateFrameworks/MobileActivation.framework/MobileActivation", 2),
        (MobileActivationLibrary(void)::frameworkLibrary = (uint64_t)v2) != 0))
  {
    if (initActivationObserver(void)::once != -1)
      dispatch_once(&initActivationObserver(void)::once, &__block_literal_global_41);
    os_unfair_lock_lock((os_unfair_lock_t)&hrnLock);
    if (checkedFeatureFlag == 1)
    {
      v3 = isHRN;
    }
    else
    {
      if (featureFlagOverride)
        v3 = featureFlagOverride == 1;
      else
        v3 = _os_feature_enabled_impl();
      isHRN = v3;
      checkedFeatureFlag = 1;
    }
    if ((checkedActivationRecord & 1) != 0 || v3)
      goto LABEL_28;
    switch(activationRecordOverride)
    {
      case -1:
        v27 = CFSTR("DeviceConfigurationFlags");
        v28 = &unk_1E1075738;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
          goto LABEL_20;
        break;
      case 0:
        v26 = 0;
        v8 = softLinkMAECopyActivationRecordWithError[0];
        if (softLinkMAECopyActivationRecordWithError[0])
        {
          ((void (*)(uint64_t))softLinkMAECopyActivationRecordWithError[0])((uint64_t)&v26);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v26;
        }
        else
        {
          v5 = 0;
        }
        v17 = v8;
        if (!v5)
        {
          _LSDefaultLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            +[LSHRNSupport deviceConfiguredForHRN].cold.2((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);

        }
LABEL_17:
        if (!v5)
          break;
LABEL_20:
        checkedActivationRecord = 1;
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DeviceConfigurationFlags"), v26);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        if (v6)
        {
          isHRN = (~objc_msgSend(v6, "integerValue") & 0x21) == 0;
        }
        else
        {
          _LSDefaultLog();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            +[LSHRNSupport deviceConfiguredForHRN].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

        }
        break;
      case 1:
        v29 = CFSTR("DeviceConfigurationFlags");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 33);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v4;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
    }
LABEL_28:
    os_unfair_lock_unlock((os_unfair_lock_t)&hrnLock);
    LOBYTE(v2) = isHRN != 0;
  }
  return (char)v2;
}

+ (void)invalidateCache
{
  os_unfair_lock_lock((os_unfair_lock_t)&hrnLock);
  checkedFeatureFlag = 0;
  checkedActivationRecord = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&hrnLock);
}

+ (void)setActivationRecordOverrideNil
{
  activationRecordOverride = -2;
}

+ (void)setActivationRecordOverride:(BOOL)a3
{
  uint64_t v3;

  v3 = 1;
  if (!a3)
    v3 = -1;
  activationRecordOverride = v3;
}

+ (void)setFeatureFlagOverride:(BOOL)a3
{
  uint64_t v3;

  v3 = 1;
  if (!a3)
    v3 = -1;
  featureFlagOverride = v3;
}

+ (id)vendorIDFromVendorName:(id)a3 seedData:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  int Hkdf;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v30[0] = 0;
  v30[1] = 0;
  v9 = objc_retainAutorelease(v7);
  objc_msgSend(v9, "UTF8String");
  v10 = objc_retainAutorelease(v9);
  strlen((const char *)objc_msgSend(v10, "UTF8String"));
  Hkdf = CCKDFParametersCreateHkdf();
  if (Hkdf)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CCStatusErrorDomain"), Hkdf, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    _LSDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[LSHRNSupport vendorIDFromVendorName:seedData:error:].cold.2(v12, v13, v14, v15, v16, v17, v18, v19);
  }
  else
  {
    v20 = objc_retainAutorelease(v8);
    objc_msgSend(v20, "bytes");
    objc_msgSend(v20, "length");
    if (!CCDeriveKey())
    {
      v28 = 0;
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v30);
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CCStatusErrorDomain"), 0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    _LSDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[LSHRNSupport vendorIDFromVendorName:seedData:error:].cold.1(v12, v13, v21, v22, v23, v24, v25, v26);
  }

  v27 = 0;
  v28 = (void *)v12;
LABEL_8:
  if (a5 && v28)
    *a5 = objc_retainAutorelease(v28);

  return v27;
}

+ (void)deviceConfiguredForHRN
{
  OUTLINED_FUNCTION_3(&dword_182882000, a2, a3, "Failed to copy activation record. Error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)vendorIDFromVendorName:(uint64_t)a3 seedData:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a2, a3, "Failed to derive vendor ID with CCDeriveKey - Error %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)vendorIDFromVendorName:(uint64_t)a3 seedData:(uint64_t)a4 error:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a2, a3, "Failed to create KDF parameters with CCKDFParametersCreateHkdf - Error %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
