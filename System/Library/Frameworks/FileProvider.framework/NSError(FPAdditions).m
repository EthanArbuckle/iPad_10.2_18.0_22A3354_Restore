@implementation NSError(FPAdditions)

- (uint64_t)fp_isSyncAnchorExpiredError
{
  return objc_msgSend(a1, "fp_isFileProviderError:", -1002);
}

- (uint64_t)fp_isFileProviderError:()FPAdditions
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("NSFileProviderErrorDomain")))
  {
    v6 = objc_msgSend(a1, "code");

    if (v6 == a3)
      return 1;
  }
  else
  {

  }
  return 0;
}

+ (uint64_t)fp_errorWithPOSIXCode:()FPAdditions
{
  return objc_msgSend(a1, "_fp_errorWithPOSIXCode:itemURL:debugDescription:message:", a3, 0, 0, 0);
}

+ (id)_fp_errorWithPOSIXCode:()FPAdditions itemURL:debugDescription:message:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a1, "fp_initLocalizationStrings");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CB3308]);

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CB2938]);
  if (v10)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0C9AFB0]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], a3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (void)fp_initLocalizationStrings
{
  if (fp_initLocalizationStrings_pred != -1)
    dispatch_once(&fp_initLocalizationStrings_pred, &__block_literal_global_58);
}

+ (id)fp_errorWithPOSIXCode:()FPAdditions description:
{
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;

  v11 = (objc_class *)MEMORY[0x1E0CB3940];
  v12 = a4;
  v13 = (void *)objc_msgSend([v11 alloc], "initWithFormat:arguments:", v12, &a9);

  objc_msgSend(a1, "_fp_errorWithPOSIXCode:itemURL:debugDescription:message:", a3, 0, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (uint64_t)fp_errorWithPOSIXCode:()FPAdditions itemURL:debugDescription:
{
  return objc_msgSend(a1, "_fp_errorWithPOSIXCode:itemURL:debugDescription:message:", a3, a4, a5, 0);
}

+ (id)fp_invalidArgumentError:()FPAdditions
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend(a1, "fp_initLocalizationStrings");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v10, &a9);

  v15 = *MEMORY[0x1E0C9AFB0];
  v16[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)fp_translocatedError:()FPAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "fp_initLocalizationStrings");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The executable currently located at %@ is translocated and can't be launched."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v20[0] = *MEMORY[0x1E0CB2D50];
  FPLoc(CFSTR("ExecutableTranslocated"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0CB2938];
  v21[0] = v14;
  v21[1] = v5;
  v16 = *MEMORY[0x1E0CB3308];
  v20[1] = v15;
  v20[2] = v16;
  v21[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderErrorDomain"), -2002, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)fp_externalDomainRejectedErrorWithUnderlyingError:()FPAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "fp_initLocalizationStrings");
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB3388];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderInternalErrorDomain"), 23, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)fp_isFileProviderInternalError:()FPAdditions
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("NSFileProviderInternalErrorDomain")))
  {
    v6 = objc_msgSend(a1, "code");

    if (v6 == a3)
      return 1;
  }
  else
  {

  }
  return 0;
}

- (BOOL)fp_isCocoaErrorCode:()FPAdditions
{
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    v6 = objc_msgSend(a1, "code") == a3;
  else
    v6 = 0;

  return v6;
}

- (BOOL)fp_isPOSIXErrorCode:()FPAdditions
{
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    v6 = objc_msgSend(a1, "code") == a3;
  else
    v6 = 0;

  return v6;
}

- (id)fp_strippedError
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  objc_msgSend(MEMORY[0x1E0CB35C8], "fp_initLocalizationStrings");
  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__NSError_FPAdditions__fp_strippedError__block_invoke;
  v11[3] = &unk_1E444AAB8;
  v12 = v2;
  v4 = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v11);

  objc_msgSend(a1, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v5, *MEMORY[0x1E0CB2D50]);

  objc_msgSend(a1, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v6, *MEMORY[0x1E0CB2938]);

  v7 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(a1, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, objc_msgSend(a1, "code"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)fp_internalErrorForVendorErrorWithCallerDescription:()FPAdditions itemCreationBlock:
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB35C8], "fp_initLocalizationStrings");
  objc_msgSend(a1, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[NSError(FPAdditions) fp_internalErrorForVendorErrorWithCallerDescription:itemCreationBlock:].cold.3((uint64_t)v6, a1, v9);

  if ((objc_msgSend(a1, "fp_isFileProviderError:", -1001) & 1) != 0
    || objc_msgSend(a1, "fp_isFileProviderError:", -1006))
  {
    objc_msgSend(a1, "fp_userInfoItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      fp_current_or_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[NSError(FPAdditions) fp_internalErrorForVendorErrorWithCallerDescription:itemCreationBlock:].cold.1((uint64_t)a1, v13, v14, v15, v16, v17, v18, v19);

      objc_msgSend(a1, "fp_strippedError");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    if (v7)
    {
      v7[2](v7, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(a1, "code") == -1001)
        objc_msgSend(MEMORY[0x1E0CB35C8], "fileProviderErrorForCollisionWithItem:", v12);
      else
        objc_msgSend(MEMORY[0x1E0CB35C8], "fileProviderErrorForRejectedDeletionOfItem:", v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
      goto LABEL_21;
    }

  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("Swift.CancellationError")))
  {
    FPUserCancelledError();
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v20 = (void *)v21;
    goto LABEL_21;
  }
  +[FPXPCSanitizer permittedErrorDomains](FPXPCSanitizer, "permittedErrorDomains");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "containsObject:", v8);

  if ((v23 & 1) != 0)
  {
    objc_msgSend(a1, "fp_strippedError");
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  __FILEPROVIDER_UNSUPPORTED_ERROR__(v8, objc_msgSend(a1, "code"));
  fp_current_or_default_log();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    -[NSError(FPAdditions) fp_internalErrorForVendorErrorWithCallerDescription:itemCreationBlock:].cold.2((uint64_t)a1, v25, v26, v27, v28, v29, v30, v31);

  v32 = (void *)MEMORY[0x1E0CB35C8];
  v33 = *MEMORY[0x1E0CB28A8];
  v34 = *MEMORY[0x1E0CB2938];
  v39[0] = CFSTR("Provider returned unsupported error");
  v35 = *MEMORY[0x1E0CB3388];
  v38[0] = v34;
  v38[1] = v35;
  objc_msgSend(a1, "fp_strippedError");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v36;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, 4101, v37);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
  return v20;
}

- (id)fp_genericPreflightError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB35C8], "fp_initLocalizationStrings");
  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("NSFileProviderErrorIsGenericPreflightError"));
  v4 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, objc_msgSend(a1, "code"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)fp_isGenericPreflightError
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("NSFileProviderErrorIsGenericPreflightError"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)fp_asWarning
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB35C8], "fp_initLocalizationStrings");
  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("NSFileProviderErrorIsSoftError"));
  objc_msgSend(a1, "localizedRecoveryOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    FPLocalizedErrorStringForKey(CFSTR("Preflight-Cancel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    FPLocalizedErrorStringForKey(CFSTR("Preflight-Continue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB2D78]);

  }
  v9 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(a1, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, objc_msgSend(a1, "code"), v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (uint64_t)fp_isWarning
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("NSFileProviderErrorIsSoftError"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)fp_isRemoteCrashError
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

  if (!v3)
    return 0;
  if (objc_msgSend(a1, "code") == 4099 || objc_msgSend(a1, "code") == 4097)
    return 1;
  if (objc_msgSend(a1, "code") != 4101)
    return 0;
  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v4 = objc_msgSend(v6, "fp_isRemoteCrashError");
  else
    v4 = 1;

  return v4;
}

- (id)fp_unwrappedErrorForDomains:()FPAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v4 = a3;
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {

    goto LABEL_8;
  }
  v6 = objc_msgSend(a1, "code");

  if (v6 != 4101)
  {
LABEL_8:
    v11 = a1;
    goto LABEL_9;
  }
  objc_msgSend(a1, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "containsObject:", v9);

    if (v10)
      a1 = v8;
  }
  v11 = a1;

LABEL_9:
  return v11;
}

- (id)fp_unwrappedInternalError
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("NSFileProviderInternalErrorDomain");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fp_unwrappedErrorForDomains:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)fp_isFeatureUnsupportedError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    v3 = objc_msgSend(a1, "code") == 3328;
  else
    v3 = 0;

  return v3;
}

- (BOOL)fp_isNotPermittedError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    v3 = objc_msgSend(a1, "code") == 257;
  else
    v3 = 0;

  return v3;
}

- (BOOL)fp_isNameTooLongError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    v3 = objc_msgSend(a1, "code") == 63;
  else
    v3 = 0;

  return v3;
}

- (id)fp_annotatedErrorWithItems:()FPAdditions variant:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB35C8], "fp_initLocalizationStrings");
  objc_msgSend(a1, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NSFileProviderErrorNonExistentItemIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__NSError_FPAdditions__fp_annotatedErrorWithItems_variant___block_invoke;
    v14[3] = &unk_1E444FD00;
    v15 = v9;
    v10 = objc_msgSend(v6, "indexOfObjectPassingTest:", v14);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(a1, "fp_annotatedErrorWithItem:variant:", 0, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "objectAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "fp_annotatedErrorWithItem:variant:", v12, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(a1, "fp_annotatedErrorWithItem:variant:", 0, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)fp_annotatedErrorWithName:()FPAdditions path:variant:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB35C8], "fp_initLocalizationStrings");
  objc_msgSend(a1, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("NSFileProviderErrorDomain")))
  {

  }
  else
  {
    objc_msgSend(a1, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

    if ((v13 & 1) == 0)
    {
      v18 = a1;
      goto LABEL_6;
    }
  }
  objc_msgSend(a1, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_msgSend(v15, "setValue:forKey:", v8, CFSTR("NSFileProviderErrorItemName"));
  objc_msgSend(v15, "setValue:forKey:", v10, CFSTR("NSUserStringVariant"));
  objc_msgSend(v15, "setValue:forKey:", v9, *MEMORY[0x1E0CB2AA0]);
  v16 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(a1, "domain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, objc_msgSend(a1, "code"), v15);
  v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v18;
}

- (uint64_t)fp_annotatedErrorWithName:()FPAdditions
{
  return objc_msgSend(a1, "fp_annotatedErrorWithName:path:variant:", a3, 0, 0);
}

- (id)fp_annotatedErrorWithURL:()FPAdditions variant:
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v13;

  v13 = 0;
  v6 = *MEMORY[0x1E0C99A70];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "getPromisedItemResourceValue:forKey:error:", &v13, v6, 0);
  v9 = v13;
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fp_annotatedErrorWithName:path:variant:", v9, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)fp_annotatedErrorWithItem:()FPAdditions variant:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filename");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fp_annotatedErrorWithName:path:variant:", v8, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)fp_annotatedErrorWithRecoveryAttempter:()FPAdditions fpProviderDomainId:
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = a3;
  objc_msgSend(v4, "fp_initLocalizationStrings");
  objc_msgSend(a1, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setValue:forKey:", v5, *MEMORY[0x1E0CB3148]);
  v8 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(a1, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, objc_msgSend(a1, "code"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)fp_recoverableErrorWithBlock:()FPAdditions fpProviderDomainId:operationService:
{
  void *v8;
  id v9;
  id v10;
  id v11;
  FPBlockRecoveryAttempter *v12;
  void *v13;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "fp_initLocalizationStrings");
  v12 = -[FPBlockRecoveryAttempter initWithBlock:operationService:]([FPBlockRecoveryAttempter alloc], "initWithBlock:operationService:", v11, v9);

  objc_msgSend(a1, "fp_annotatedErrorWithRecoveryAttempter:fpProviderDomainId:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[FPBlockRecoveryAttempter setExpectedError:](v12, "setExpectedError:", v13);
  return v13;
}

- (id)fp_annotatedErrorWithOperationItem:()FPAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = a3;
  objc_msgSend(v4, "fp_initLocalizationStrings");
  objc_msgSend(a1, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setValue:forKey:", v5, CFSTR("NSFileProviderErrorOperationItemKey"));
  v8 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(a1, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, objc_msgSend(a1, "code"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)fp_userInfoValueForKey:()FPAdditions
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  __CFString *v40;
  uint64_t v41;
  __CFString *v42;
  void *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[4];

  v57[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("NSFileProviderErrorDomain"));

  if (v6)
  {
    objc_msgSend(a1, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NSUserStringVariant"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("NSFileProviderErrorItemName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "fp_userInfoItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("NSFileProviderErrorOperationItemKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB2D50]) & 1) != 0)
    {
      v14 = &stru_1E4450B40;
      goto LABEL_9;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB2D68]) & 1) != 0)
    {
      v14 = CFSTR("-C");
      goto LABEL_9;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB2D80]) & 1) != 0)
    {
      v14 = CFSTR("-R");
LABEL_9:
      v16 = objc_msgSend(a1, "code");
      switch(v16)
      {
        case -1006:
          v20 = CFSTR("DeletionRejected");
          goto LABEL_33;
        case -1005:
          v20 = CFSTR("NoSuchItem");
          goto LABEL_33;
        case -1004:
          v20 = CFSTR("ServerUnreachable");
          goto LABEL_33;
        case -1003:
          v20 = CFSTR("InsufficientQuota");
          goto LABEL_33;
        case -1002:
          goto LABEL_13;
        case -1001:
          objc_msgSend(a1, "recoveryAttempter");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
            v36 = CFSTR("Recovery-");
          else
            v36 = 0;
          objc_msgSend(v11, "contentModificationDate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "contentModificationDate");
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = (void *)v38;
          v40 = CFSTR("ItemExists");
          v54 = v13;
          if (!v37 || !v38)
            goto LABEL_41;
          v41 = objc_msgSend(v37, "compare:", v38);
          if (v41 == -1)
          {
            v42 = CFSTR("Older");
          }
          else
          {
            if (v41 != 1)
              goto LABEL_41;
            v42 = CFSTR("Newer");
          }
          -[__CFString stringByAppendingString:](v42, "stringByAppendingString:", CFSTR("ItemExists"));
          v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_41:
          objc_msgSend(v11, "filename");
          v46 = objc_claimAutoreleasedReturnValue();
          v50 = v37;
          v51 = (void *)v46;
          if (v46)
            v52 = (void *)v46;
          else
            v52 = v10;
          FPLocalizedStringWithKeyAndVariant(v36, v40, v14, v8, v52, v47, v48, v49, v53);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = v54;
          goto LABEL_35;
        case -1000:
          v20 = CFSTR("NotAuthenticated");
LABEL_33:
          v29 = 0;
          v30 = v14;
          v31 = v8;
          goto LABEL_34;
        default:
          if (v16 == -2011)
          {
            objc_msgSend(a1, "userInfo");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("NSFileProviderProviderDisplayName"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            FPLocalizedStringWithKeyAndVariantLiteral(v23, v24, v14, v8, v10, v25, v26, v27, (uint64_t)v22);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_35;
          }
LABEL_13:
          if (objc_msgSend(a1, "code") != -5007)
            goto LABEL_49;
          objc_msgSend(a1, "recoveryAttempter");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
            v29 = CFSTR("Recovery-");
          else
            v29 = 0;
          v20 = CFSTR("UnsafeDisconnect");
          v30 = v14;
          v31 = 0;
LABEL_34:
          FPLocalizedStringWithKeyAndVariant(v29, v20, v30, v31, v10, v17, v18, v19, v53);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          break;
      }
      goto LABEL_35;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB2D78]))
    {
      if (objc_msgSend(a1, "code") == -1001)
      {
        FPLocalizedErrorStringForKey(CFSTR("Copy-Stop"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = v32;
        FPLocalizedErrorStringForKey(CFSTR("Copy-Replace"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v57[1] = v33;
        FPLocalizedErrorStringForKey(CFSTR("Copy-Keep Both"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v57[2] = v34;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_48:
LABEL_35:

        goto LABEL_36;
      }
      if (objc_msgSend(a1, "code") == -5007)
      {
        FPLocalizedErrorStringForKey(CFSTR("Disconnect-Cancel"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = v32;
        FPLocalizedErrorStringForKey(CFSTR("Disconnect-Force"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v56[1] = v33;
        v44 = (void *)MEMORY[0x1E0C99D20];
        v45 = v56;
LABEL_47:
        objc_msgSend(v44, "arrayWithObjects:count:", v45, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      }
      if (objc_msgSend(a1, "fp_isGenericPreflightError"))
      {
        FPLocalizedErrorStringForKey(CFSTR("Preflight-Cancel"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = v32;
        FPLocalizedErrorStringForKey(CFSTR("Preflight-Continue"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v55[1] = v33;
        v44 = (void *)MEMORY[0x1E0C99D20];
        v45 = v55;
        goto LABEL_47;
      }
    }
LABEL_49:
    v15 = 0;
    goto LABEL_35;
  }
  v15 = 0;
LABEL_36:

  return v15;
}

- (id)fp_userInfoItem
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  if ((objc_msgSend(a1, "fp_isFileProviderError:", -1001) & 1) != 0
    || objc_msgSend(a1, "fp_isFileProviderError:", -1006))
  {
    objc_msgSend(a1, "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NSFileProviderErrorItem"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      objc_msgSend(a1, "userInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NSFileProviderErrorCollidingItem"));
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)fp_userInfoFPItem
{
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "fp_userInfoItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSError+FPAdditions.m"), 807, CFSTR("we shouldn't have requested an FPItem from the error, it's doesn't contain the right type"));

LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v5 = v4;
LABEL_6:

  return v5;
}

- (uint64_t)fp_prettyDescription
{
  return objc_msgSend(a1, "fp_prettyDescription:", 0);
}

- (FPErrorRedactionHelper)fp_prettyDescription:()FPAdditions
{
  return -[FPErrorRedactionHelper initWithError:depth:]([FPErrorRedactionHelper alloc], "initWithError:depth:", a1, a3);
}

- (void)fp_internalErrorForVendorErrorWithCallerDescription:()FPAdditions itemCreationBlock:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, a2, a3, "[ERROR] collision error %{public}@ doesn't indicate colliding item", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)fp_internalErrorForVendorErrorWithCallerDescription:()FPAdditions itemCreationBlock:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, a2, a3, "[ERROR] Unsupported error was %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)fp_internalErrorForVendorErrorWithCallerDescription:()FPAdditions itemCreationBlock:.cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Creating internal error for \"%@\", original error was: %@", (uint8_t *)&v6, 0x16u);

}

@end
