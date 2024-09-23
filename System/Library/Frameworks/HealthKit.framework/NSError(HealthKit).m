@implementation NSError(HealthKit)

+ (uint64_t)hk_protectedDataInaccessibilityError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 6, CFSTR("Protected health data is inaccessible"));
}

+ (id)hk_error:()HealthKit description:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v11 = *MEMORY[0x1E0CB2D50];
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.healthkit"), a3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.healthkit"), a3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (uint64_t)hk_isDatabaseAccessibilityError
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(a1, "hk_isHealthKitError");
  if ((_DWORD)result)
  {
    v3 = objc_msgSend(a1, "code");
    return v3 == 6 || v3 == 101;
  }
  return result;
}

- (uint64_t)hk_isHealthKitError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.healthkit"));

  return v2;
}

+ (uint64_t)hk_assignError:()HealthKit code:format:
{
  objc_class *v12;
  id v13;
  void *v14;
  uint64_t v15;

  v12 = (objc_class *)MEMORY[0x1E0CB3940];
  v13 = a5;
  v14 = (void *)objc_msgSend([v12 alloc], "initWithFormat:arguments:", v13, &a9);

  v15 = objc_msgSend(a1, "hk_assignError:code:description:", a3, a4, v14);
  return v15;
}

+ (uint64_t)hk_assignError:()HealthKit code:description:
{
  id v6;
  void *v7;

  objc_msgSend(a1, "hk_error:description:", a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v6);
    else
      _HKLogDroppedError(v6);
  }

  return 1;
}

+ (id)hk_error:()HealthKit description:underlyingError:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB2D50]);
  if (v9)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB3388]);
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.healthkit"), a3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)hk_error:()HealthKit format:
{
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;

  v11 = (objc_class *)MEMORY[0x1E0CB3940];
  v12 = a4;
  v13 = (void *)objc_msgSend([v11 alloc], "initWithFormat:arguments:", v12, &a9);

  objc_msgSend(a1, "hk_error:description:", a3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (uint64_t)hk_error:()HealthKit userInfo:
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.healthkit"), a3, a4);
}

+ (id)hk_error:()HealthKit class:selector:format:
{
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v12 = (objc_class *)MEMORY[0x1E0CB3940];
  v13 = a6;
  v14 = (void *)objc_msgSend([v12 alloc], "initWithFormat:arguments:", v13, &a9);

  v15 = (void *)MEMORY[0x1E0CB35C8];
  v21[0] = CFSTR("HKErrorClass");
  NSStringFromClass(a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = CFSTR("HKErrorSelector");
  NSStringFromSelector(a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = *MEMORY[0x1E0CB2D50];
  v22[1] = v17;
  v22[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hk_error:userInfo:", a3, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)hk_errorForInvalidArgument:()HealthKit class:selector:
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v16[0] = CFSTR("HKErrorClass");
  v8 = a3;
  NSStringFromClass(a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v16[1] = CFSTR("HKErrorSelector");
  NSStringFromSelector(a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  v17[2] = v8;
  v11 = *MEMORY[0x1E0CB2D50];
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid argument: %@"), v8, CFSTR("HKErrorClass"), CFSTR("HKErrorSelector"), CFSTR("HKErrorParameter"), v11, v9, v10, v8);
  v17[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_error:userInfo:", 3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)hk_errorForInvalidArgument:()HealthKit class:selector:format:
{
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v12 = (void *)MEMORY[0x1E0CB35C8];
  v22[0] = CFSTR("HKErrorClass");
  v13 = a6;
  v14 = a3;
  NSStringFromClass(a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v22[1] = CFSTR("HKErrorSelector");
  NSStringFromSelector(a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v16;
  v23[2] = v14;
  v17 = *MEMORY[0x1E0CB2D50];
  v22[2] = CFSTR("HKErrorParameter");
  v22[3] = v17;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v13, &a9);

  v23[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hk_error:userInfo:", 3, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)hk_errorForNilArgument:()HealthKit class:selector:
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v15[0] = CFSTR("HKErrorClass");
  v8 = a3;
  NSStringFromClass(a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v15[1] = CFSTR("HKErrorSelector");
  NSStringFromSelector(a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Argument %@ must not be nil"), v8, CFSTR("HKErrorClass"), CFSTR("HKErrorSelector"), CFSTR("HKErrorParameter"), *MEMORY[0x1E0CB2D50], v9, v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_error:userInfo:", 3, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (uint64_t)hk_healthDataUnavailableError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 1, CFSTR("Health data is unavailable on this device"));
}

+ (uint64_t)hk_databaseInaccessibleBeforeFirstUnlockError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 101, CFSTR("Database inaccessible before first unlock"));
}

+ (uint64_t)hk_featureUnavailableForProfileError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Feature unavailable for profile"));
}

+ (uint64_t)hk_invalidProfileError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("The HKProfileIdentifier associated with this health store is invalid."));
}

+ (uint64_t)hk_healthStoreUnavailableError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 1500, CFSTR("The requested HKHealthStore is not available"));
}

+ (uint64_t)hk_databaseSchemaRolledBackError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 116, CFSTR("Rolling back the health database is unsupported"));
}

+ (uint64_t)hk_transactionInterruptedError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 117, CFSTR("The current transaction has been interrupted."));
}

+ (uint64_t)hk_assignError:()HealthKit code:description:underlyingError:
{
  id v7;
  void *v8;

  objc_msgSend(a1, "hk_error:description:underlyingError:", a4, a5, a6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v7);
    else
      _HKLogDroppedError(v7);
  }

  return 1;
}

+ (uint64_t)hk_assignError:()HealthKit code:userInfo:
{
  id v4;
  void *v5;

  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.healthkit"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v4);
    else
      _HKLogDroppedError(v4);
  }

  return 1;
}

+ (uint64_t)hk_assignError:()HealthKit invalidArgument:class:selector:
{
  id v7;
  void *v8;

  objc_msgSend(a1, "hk_errorForInvalidArgument:class:selector:", a4, a5, a6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v7);
    else
      _HKLogDroppedError(v7);
  }

  return 1;
}

+ (uint64_t)hk_assignError:()HealthKit nilArgument:class:selector:
{
  id v7;
  void *v8;

  objc_msgSend(a1, "hk_errorForNilArgument:class:selector:", a4, a5, a6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v7);
    else
      _HKLogDroppedError(v7);
  }

  return 1;
}

- (uint64_t)hk_isHealthKitErrorWithCode:()HealthKit
{
  uint64_t result;

  result = objc_msgSend(a1, "hk_isHealthKitError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == a3;
  return result;
}

- (uint64_t)hk_isDatabaseTransactionError
{
  return objc_msgSend(a1, "hk_isHealthKitErrorWithCode:", 107);
}

- (uint64_t)hk_isHealthStoreUnavailableError
{
  return objc_msgSend(a1, "hk_isHealthKitErrorWithCode:", 1500);
}

- (uint64_t)hk_isDatabaseSchemaRolledBackError
{
  return objc_msgSend(a1, "hk_isHealthKitErrorWithCode:", 116);
}

- (uint64_t)hk_isDuplicateObjectError
{
  return objc_msgSend(a1, "hk_isHealthKitErrorWithCode:", 115);
}

- (uint64_t)hk_isObjectNotFoundError
{
  return objc_msgSend(a1, "hk_isHealthKitErrorWithCode:", 118);
}

- (uint64_t)hk_isTransactionInterruptedError
{
  return objc_msgSend(a1, "hk_isHealthKitErrorWithCode:", 117);
}

- (uint64_t)hk_isServiceDeviceNotFoundError
{
  uint64_t result;

  result = objc_msgSend(a1, "hk_isHealthKitError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 313;
  return result;
}

- (uint64_t)hk_isAuthorizationDeniedError
{
  uint64_t result;

  result = objc_msgSend(a1, "hk_isHealthKitError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 4;
  return result;
}

- (uint64_t)hk_isAuthorizationNotDeterminedError
{
  uint64_t result;

  result = objc_msgSend(a1, "hk_isHealthKitError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 5;
  return result;
}

- (uint64_t)hk_isInvalidArgumentError
{
  uint64_t result;

  result = objc_msgSend(a1, "hk_isHealthKitError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 3;
  return result;
}

- (uint64_t)hk_isInternalFailureError
{
  uint64_t result;

  result = objc_msgSend(a1, "hk_isHealthKitError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 100;
  return result;
}

- (uint64_t)hk_isFeatureDisabledError
{
  return objc_msgSend(a1, "hk_isHealthKitErrorWithCode:", 111);
}

- (uint64_t)hk_isRequiredAuthorizationError
{
  uint64_t result;

  result = objc_msgSend(a1, "hk_isHealthKitError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 10;
  return result;
}

- (uint64_t)hk_isStreamFailureError
{
  uint64_t result;

  result = objc_msgSend(a1, "hk_isHealthKitError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 104;
  return result;
}

- (uint64_t)hk_isTimeoutError
{
  uint64_t result;

  result = objc_msgSend(a1, "hk_isHealthKitError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 103;
  return result;
}

- (uint64_t)hk_isUserCanceledError
{
  uint64_t result;

  result = objc_msgSend(a1, "hk_isHealthKitError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 7;
  return result;
}

- (uint64_t)hk_isCocoaNoSuchFileError
{
  uint64_t v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;

  v2 = objc_msgSend(a1, "code");
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB28A8]);
  if ((v2 & 0xFFFFFFFFFFFFFEFFLL) == 4)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (uint64_t)hk_isCocoaFileExistsError
{
  uint64_t v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;

  v2 = objc_msgSend(a1, "code");
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB28A8]);
  if (v2 == 516)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (BOOL)hk_isXPCConnectionError
{
  void *v2;
  int v3;
  uint64_t v4;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

  if (!v3)
    return 0;
  v4 = objc_msgSend(a1, "code");
  return v4 == 4099 || (v4 & 0xFFFFFFFFFFFFFFFBLL) == 4097;
}

- (uint64_t)hk_isXPCConnectionInterruptedError
{
  return objc_msgSend(a1, "hk_isErrorInDomain:code:", *MEMORY[0x1E0CB28A8], 4097);
}

- (uint64_t)hk_isOntologyConceptNotFoundError
{
  return objc_msgSend(a1, "hk_isHealthKitErrorWithCode:", 1004);
}

- (uint64_t)hk_isHFDUnsupportedError
{
  return objc_msgSend(a1, "hk_isHealthKitErrorWithCode:", 1104);
}

- (BOOL)hk_isErrorInDomain:()HealthKit code:
{
  id v6;
  void *v7;
  int v8;
  _BOOL8 v9;

  v6 = a3;
  objc_msgSend(a1, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v6);

  if (v8)
    v9 = objc_msgSend(a1, "code") == a4;
  else
    v9 = 0;

  return v9;
}

- (id)hk_underlyingErrorWithDomain:()HealthKit
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  v5 = a1;
  if (v5)
  {
    v6 = *MEMORY[0x1E0CB3388];
    do
    {
      objc_msgSend(v5, "domain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", v4);

      if ((v8 & 1) != 0)
        break;
      objc_msgSend(v5, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v6);
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v10;
    }
    while (v10);
  }

  return v5;
}

- (uint64_t)hk_sanitizedError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("%@"), a1);
}

- (id)hk_sanitizedErrorForDomain:()HealthKit
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v4))
  {

  }
  else
  {
    objc_msgSend(a1, "hk_underlyingErrorWithDomain:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = a1;
      goto LABEL_6;
    }
  }
  objc_msgSend(a1, "hk_sanitizedError");
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v8 = v7;

  return v8;
}

- (id)hk_errorByAddingEntriesToUserInfo:()HealthKit
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_dictionaryByAddingEntriesFromDictionary:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(a1, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, objc_msgSend(a1, "code"), v6);

  return v9;
}

@end
