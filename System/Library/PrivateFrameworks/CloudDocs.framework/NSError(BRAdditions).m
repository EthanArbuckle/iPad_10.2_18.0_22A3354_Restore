@implementation NSError(BRAdditions)

+ (id)brc_errorLoggedOutWithUnderlyingError:()BRAdditions
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  if (a3)
  {
    v9 = *MEMORY[0x1E0CB3388];
    v10[0] = a3;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "br_errorWithDomain:code:userInfo:description:", CFSTR("BRCloudDocsErrorDomain"), 2, v6, CFSTR("Logged out - iCloud Drive is not configured"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
    objc_msgSend(v3, "br_errorWithDomain:code:userInfo:description:", CFSTR("BRCloudDocsErrorDomain"), 2, 0, CFSTR("Logged out - iCloud Drive is not configured"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)br_errorWithDomain:()BRAdditions code:userInfo:description:
{
  id v12;
  id v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v12 = a3;
  v13 = a5;
  if (a6)
  {
    v14 = (objc_class *)MEMORY[0x1E0CB3940];
    v15 = a6;
    v16 = (void *)objc_msgSend([v14 alloc], "initWithFormat:arguments:", v15, &a9);

    if (v13)
      v17 = v13;
    else
      v17 = (void *)MEMORY[0x1E0C9AA70];
    v18 = (void *)objc_msgSend(v17, "mutableCopy");
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0C9AFB0]);

    v13 = v18;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v12, a4, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)br_errorDescription
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AFB0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(a1, "description");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (id)br_errorWithDomain:()BRAdditions code:description:
{
  id v11;
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (a5)
  {
    v17 = &a9;
    v12 = (objc_class *)MEMORY[0x1E0CB3940];
    v13 = a5;
    v14 = (void *)objc_msgSend([v12 alloc], "initWithFormat:arguments:", v13, &a9);

    v18 = *MEMORY[0x1E0C9AFB0];
    v19[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    a5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v11, a4, a5, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)br_errorWithPOSIXCode:()BRAdditions
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (__errnum < 0 || *MEMORY[0x1E0C85778] <= __errnum)
  {
    brc_bread_crumbs((uint64_t)"+[NSError(BRAdditions) br_errorWithPOSIXCode:]", 62);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      +[NSError(BRAdditions) br_errorWithPOSIXCode:].cold.1();

  }
  v10 = *MEMORY[0x1E0C9AFB0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", strerror(__errnum));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], __errnum, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)br_errorWithPOSIXCode:()BRAdditions description:
{
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v16 = &a9;
    v10 = (objc_class *)MEMORY[0x1E0CB3940];
    v11 = a4;
    v12 = (void *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

    v17 = *MEMORY[0x1E0C9AFB0];
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], a3, v13, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (uint64_t)br_errorFromErrno
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", *__error());
}

- (BOOL)br_isCKErrorCode:()BRAdditions
{
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]))
    v6 = objc_msgSend(a1, "code") == a3;
  else
    v6 = 0;

  return v6;
}

- (BOOL)br_isCKErrorCode:()BRAdditions underlyingErrorCode:
{
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  if (!objc_msgSend(a1, "br_isCKErrorCode:"))
    return 0;
  objc_msgSend(a1, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NSUnderlyingError"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C94B20]))
    v9 = objc_msgSend(v7, "code") == a4;
  else
    v9 = 0;

  return v9;
}

- (BOOL)br_isPOSIXErrorCode:()BRAdditions
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

- (BOOL)br_isCocoaErrorCode:()BRAdditions
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

- (BOOL)br_isNSXPCConnectionError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    v3 = objc_msgSend(a1, "code") == 4099 || objc_msgSend(a1, "code") == 4097;
  else
    v3 = 0;

  return v3;
}

- (BOOL)br_isCloudDocsErrorCode:()BRAdditions
{
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("BRCloudDocsErrorDomain")))
    v6 = objc_msgSend(a1, "code") == a3;
  else
    v6 = 0;

  return v6;
}

- (BOOL)br_isFileProviderErrorCode:()BRAdditions
{
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CAAB50]))
    v6 = objc_msgSend(a1, "code") == a3;
  else
    v6 = 0;

  return v6;
}

- (BOOL)br_isNSURLErrorCode:()BRAdditions
{
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
    v6 = objc_msgSend(a1, "code") == a3;
  else
    v6 = 0;

  return v6;
}

- (id)br_underlyingPOSIXError
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0CB2FE0];
  v4 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);

  if (v4)
  {
    v5 = a1;
  }
  else
  {
    objc_msgSend(a1, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "isEqualToString:", v3);

  }
  return v5;
}

+ (uint64_t)brc_errorNotSupportedInFPFS
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 66, CFSTR("SPI not supported for FPFS"));
}

+ (uint64_t)brc_errorNoBRItemService
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 65, CFSTR("BRProtocol Service was not found for item"));
}

+ (uint64_t)brc_errorLoggedOut
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorLoggedOutWithUnderlyingError:", 0);
}

+ (uint64_t)brc_errorDaemonShouldBeLoggedOut
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 3, CFSTR("Logged in - iCloud Drive should not be logged in"));
}

+ (id)brc_errorMethodNotImplemented:()BRAdditions
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  brc_bread_crumbs((uint64_t)"+[NSError(BRAdditions) brc_errorMethodNotImplemented:]", 177);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    +[NSError(BRAdditions) brc_errorMethodNotImplemented:].cold.1(a3, (uint64_t)v4, v5);

  v6 = (void *)MEMORY[0x1E0CB35C8];
  NSStringFromSelector(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 9, CFSTR("%@ not implemented"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (uint64_t)brc_errorInvalidParameter:()BRAdditions value:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 10, CFSTR("Invalid parameter '%@': %@"), a3, a4);
}

+ (id)brc_errorNotOnDisk:()BRAdditions
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 27, CFSTR("Item hasn't been made live on disk: '%@'"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB28A8];
  v9 = *MEMORY[0x1E0CB3388];
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 256, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)brc_errorNotInCloud:()BRAdditions
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0CB2AA0];
  v11[0] = *MEMORY[0x1E0C9AFB0];
  v11[1] = v4;
  v5 = CFSTR("nil");
  if (a3)
    v5 = a3;
  v12[0] = CFSTR("Document hasn't yet been synced to the server");
  v12[1] = v5;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:()BRAdditions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0C9AFB0];
  v13[0] = CFSTR("Path is outside of any CloudDocs app library, will never sync");
  v5 = *MEMORY[0x1E0CB2AA0];
  v12[0] = v4;
  v12[1] = v5;
  objc_msgSend(a3, "path");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("nil");
  if (v6)
    v8 = (const __CFString *)v6;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)brc_errorPermissionError:()BRAdditions
{
  void *v3;
  const __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  if (a3)
    v4 = a3;
  else
    v4 = &stru_1E3DA8AC8;
  v10 = *MEMORY[0x1E0C9AFB0];
  v11[0] = v4;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 8, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)brc_errorPermissionErrorAtURL:()BRAdditions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0C9AFB0];
  v13[0] = CFSTR("Permission error when trying to access path");
  v5 = *MEMORY[0x1E0CB2AA0];
  v12[0] = v4;
  v12[1] = v5;
  objc_msgSend(a3, "path");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("nil");
  if (v6)
    v8 = (const __CFString *)v6;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)brc_errorItemNotFound:()BRAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v8 = CFSTR("BRUnderlyingItemIdentifierKey");
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:userInfo:description:", CFSTR("BRCloudDocsErrorDomain"), 14, v5, CFSTR("Item not found: '%@'"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)brc_errorParentItemRemotelyDeleted:()BRAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v8 = CFSTR("BRUnderlyingItemIdentifierKey");
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:userInfo:description:", CFSTR("BRCloudDocsErrorDomain"), 144, v5, CFSTR("Parent item remotely deleted: '%@'"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)brc_errorUnexpectedItemType:()BRAdditions description:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v10 = CFSTR("BRUnderlyingItemIdentifierKey");
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:userInfo:description:", CFSTR("BRCloudDocsErrorDomain"), 123, v7, CFSTR("%@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (uint64_t)brc_errorUnknownKey:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 25, CFSTR("Unknown key: '%@'"), a3);
}

+ (uint64_t)brc_errorAppLibraryNotFound:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 12, CFSTR("App library not found: '%@'"), a3);
}

+ (uint64_t)brc_errorNoAppLibraryForBundle:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 13, CFSTR("No app library for bundle '%@'"), a3);
}

+ (uint64_t)brc_errorClientZoneNotFound:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 30, CFSTR("Client zone not found: '%@'"), a3);
}

+ (uint64_t)brc_errorSyncDisabled:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 28, CFSTR("Sync is disabled for container: '%@'"), a3);
}

+ (uint64_t)brc_errorNoSuitableClientApp
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 29, CFSTR("No suitable client app was found to open the document"));
}

+ (uint64_t)brc_errorMDMRestrictsCrossPersonaClientApp
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 138, CFSTR("No suitable client app was found to open the document"));
}

+ (id)brc_errorNoDocumentAtURL:()BRAdditions underlyingError:
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0C9AFB0];
  v16[0] = CFSTR("No document at URL");
  v7 = *MEMORY[0x1E0CB2AA0];
  v15[0] = v6;
  v15[1] = v7;
  v8 = a4;
  objc_msgSend(a3, "path");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("nil");
  if (v9)
    v11 = (const __CFString *)v9;
  v15[2] = *MEMORY[0x1E0CB3388];
  v16[1] = v11;
  v16[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)brc_errorNoDocument:()BRAdditions underlyingPOSIXError:
{
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB2AA0];
  v13[0] = *MEMORY[0x1E0C9AFB0];
  v13[1] = v6;
  v7 = CFSTR("nil");
  if (a3)
    v7 = a3;
  v14[0] = CFSTR("No document at path");
  v14[1] = v7;
  v13[2] = *MEMORY[0x1E0CB3388];
  v8 = a3;
  objc_msgSend(v5, "br_errorWithPOSIXCode:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)brc_errorDocumentAtURL:()BRAdditions isNotExternalToAppLibrary:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Document is not external to app library %@"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0C9AFB0];
  v17[0] = v7;
  v10 = *MEMORY[0x1E0CB2AA0];
  v16[0] = v9;
  v16[1] = v10;
  objc_msgSend(v6, "path");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v12 = CFSTR("nil");
  if (v11)
    v12 = v11;
  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (uint64_t)brc_errorDocumentIsNotShared
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 20, CFSTR("document is not shared"));
}

+ (uint64_t)brc_errorDocumentIsNotSharedAtIdentifier:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 20, CFSTR("document is not shared at '%@'"), a3);
}

+ (uint64_t)brc_errorDocumentIsNoLongerSharedAtIdentifier:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 24, CFSTR("document is no longer shared at '%@'"), a3);
}

+ (uint64_t)brc_errorDocumentEvicted
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 61, CFSTR("document evicted"));
}

+ (uint64_t)brc_errorAccountMismatch
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 4, CFSTR("Account mismatch"));
}

+ (uint64_t)brc_errorDocumentWithFilename:()BRAdditions size:isTooLargeToUpload:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 19, CFSTR("document '%@' of size:%lli is too large to upload (max size: %lli)"), a3, a4, a5);
}

+ (uint64_t)brc_errorOperationCancelled
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 23, CFSTR("operation was cancelled"));
}

+ (uint64_t)brc_errorDownloadCancelled
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0CB28A8], 3072, CFSTR("download was cancelled"));
}

+ (uint64_t)brc_errorCompatibilityIssue
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 31, CFSTR("Compatibility issue prevent action"));
}

+ (uint64_t)brc_errorAcceptAlreadyInProgressForURL:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 33, CFSTR("accept operation already in progress for %@"), a3);
}

+ (uint64_t)brc_errorDriveDisabledOrAppLibraryDisabled
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 35, CFSTR("iCloud drive disabled or app library disabled"));
}

+ (uint64_t)brc_errorSyncBlocked
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 36, CFSTR("Synchronization is blocked"));
}

+ (uint64_t)brc_errorItemAlreadyPartOfAShare
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 37, CFSTR("Item is already part of a folder share"));
}

+ (id)brc_errorFolderHasSharedSubitemsWithSharedByMeURLs:()BRAdditions sharedToMeURLs:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v12[0] = CFSTR("BRFailedURLsKey");
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = v7;
  v12[1] = CFSTR("BRSharedByMeURLsKey");
  v12[2] = CFSTR("BRSharedToMeURLsKey");
  v13[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "br_errorWithDomain:code:userInfo:description:", CFSTR("BRCloudDocsErrorDomain"), 38, v9, CFSTR("Folder has shared subitems"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (uint64_t)brc_errorFolderHasSharedSubitems
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 38, CFSTR("Folder has shared subitems"));
}

+ (uint64_t)brc_errorFolderHierarchyTooDeep
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 44, CFSTR("Folder hierarchy is too deep"));
}

+ (uint64_t)brc_errorItemNotShareable
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 45, CFSTR("Item is not eligible to be shared"));
}

+ (uint64_t)brc_errorItemInTrash
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 39, CFSTR("Item is in the trash"));
}

+ (id)brc_errorItemIneligibleFromSyncForInode:()BRAdditions
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  if (a3)
  {
    v9 = CFSTR("inode");
    v10[0] = a3;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "br_errorWithDomain:code:userInfo:description:", CFSTR("BRCloudDocsErrorDomain"), 43, v6, CFSTR("Item isn't eligible to sync"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
    objc_msgSend(v3, "br_errorWithDomain:code:userInfo:description:", CFSTR("BRCloudDocsErrorDomain"), 43, 0, CFSTR("Item isn't eligible to sync"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)brc_errorItemAlreadyPausedFromSyncByBundleID:()BRAdditions
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  if (a3)
  {
    v9 = CFSTR("bundleID");
    v10[0] = a3;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "br_errorWithDomain:code:userInfo:description:", CFSTR("BRCloudDocsErrorDomain"), 59, v6, CFSTR("Item is already paused from sync by another bundleID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
    objc_msgSend(v3, "br_errorWithDomain:code:userInfo:description:", CFSTR("BRCloudDocsErrorDomain"), 59, 0, CFSTR("Item is already paused from sync by another bundleID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (uint64_t)brc_errorItemNotPausedFromSync
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 60, CFSTR("Item isn't paused from sync"));
}

+ (id)brc_addPartialError:()BRAdditions forURL:toError:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  NSObject *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v9)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v19 = CFSTR("BRPartialErrorsByURLKey");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 21, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

    goto LABEL_7;
  }
  v10 = v9;
  if (objc_msgSend(v9, "code") != 21)
  {
    brc_bread_crumbs((uint64_t)"+[NSError(BRAdditions) brc_addPartialError:forURL:toError:]", 449);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      +[NSError(BRAdditions) brc_addPartialError:forURL:toError:].cold.2();
    goto LABEL_6;
  }
LABEL_7:
  objc_msgSend(v10, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("BRPartialErrorsByURLKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    brc_bread_crumbs((uint64_t)"+[NSError(BRAdditions) brc_addPartialError:forURL:toError:]", 453);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      +[NSError(BRAdditions) brc_addPartialError:forURL:toError:].cold.1();

  }
  objc_msgSend(v15, "setObject:forKey:", v7, v8);

  return v10;
}

+ (uint64_t)brc_errorItemChanged
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 40, CFSTR("Item changed"));
}

+ (uint64_t)brc_errorCoreAnalyticsErrorCountMismatchWithExpected:()BRAdditions actual:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 58, CFSTR("Error count mismatch.  Expected %@ actual %@"), a3, a4);
}

+ (id)brc_errorCollisionWithItem:()BRAdditions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v9 = CFSTR("BRUnderlyingItemKey");
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 63, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)brc_errorForRejectedDeletionOfItem:()BRAdditions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v9 = CFSTR("BRUnderlyingItemKey");
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 64, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)brc_errorAccountSessionOpenFailed
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 84, CFSTR("Failed to open account session"));
}

+ (uint64_t)brc_errorCorruptedDB
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 79, CFSTR("Corrupted DB"));
}

+ (uint64_t)brc_errorBuddyFlowNeedsToRun
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 110, CFSTR("Device is not set up yet"));
}

+ (uint64_t)brc_errorDocumentIsNotGreedy
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 101, CFSTR("Document is not greedy"));
}

+ (uint64_t)brc_unkownErrorWithDescription:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 25, CFSTR("%@"), a3);
}

+ (uint64_t)brc_errorItemProcessingDisabled
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 86, CFSTR("Item Processing Disabled"));
}

+ (uint64_t)brc_errorDeletingNonEmptyDirectoryNonRecursively
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 87, CFSTR("Deleting Non Empty Directory Non Recursively"));
}

+ (uint64_t)brc_errorExcludedFromSyncUnderRoot
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 82, CFSTR("Excluded From Sync Under Root"));
}

+ (uint64_t)brc_errorExcludedFromSyncDueToFilename
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 83, CFSTR("Excluded From Sync Due To Filename"));
}

+ (uint64_t)brc_errorNoEtagInContentSignature
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 88, CFSTR("No etag"));
}

+ (uint64_t)brc_errorRequestedVersionHasLocalEdits
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 89, CFSTR("Requested Version for download has local edits"));
}

+ (uint64_t)brc_errorNoEtagAvailableForDownloadOfItemWithIdentifier:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0CB28A8], 256, CFSTR("Etag is nil for %@"), a3);
}

+ (uint64_t)brc_errorCantCallFPInSyncBubble
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 114, CFSTR("cant call fp in sync bubble"));
}

+ (uint64_t)brc_errorRescheduleDownloadForMoreRecentServerVersion
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 115, CFSTR("reschedule download"));
}

+ (uint64_t)brc_errorItemBusy
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 120, 0);
}

+ (uint64_t)brc_errorPostponeUpload
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 140, 0);
}

+ (uint64_t)brc_errorAcceptShareFailedForItem:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 130, CFSTR("Accept share failed for item %@"), a3);
}

+ (id)brc_errorAcceptShareFailedWithUnderlyingError:()BRAdditions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB3388];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 130, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)brc_errorCantCreateAsset
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 124, 0);
}

+ (uint64_t)brc_errorThrottled
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 132, 0);
}

+ (uint64_t)brc_errorThumbnailGenerationOperationTimedOut
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 133, 0);
}

+ (uint64_t)brc_errorStuckFPFSMigration
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 134, 0);
}

+ (uint64_t)brc_errorNotSupportedInCustomerBuild
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 102, 0);
}

+ (uint64_t)brc_errorZoneReset
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 103, 0);
}

+ (uint64_t)brc_errorOperationAlreadyRunning:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 136, CFSTR("operation %@ already running"), a3);
}

+ (uint64_t)brc_errorTCCAccessDenied
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 141, CFSTR("Access denied"));
}

+ (id)brc_errorFromException:()BRAdditions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 143, CFSTR("%@ - %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)brc_errorInitialScanItemBouncedByServer
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 145, CFSTR("Initial scan item got bounced by server"));
}

+ (uint64_t)brc_errorInitialScanItemTypeMismatch
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 148, CFSTR("Initial scan item has a mismatch type"));
}

+ (uint64_t)brc_errorRecordBouncedByServer
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 146, CFSTR("Server bounced CK record"));
}

+ (uint64_t)brc_errorBouncedItemNotKnownByServer
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 147, CFSTR("Server bounced CK record"));
}

+ (uint64_t)brc_errorRecordValidation
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 150, 0);
}

+ (uint64_t)brc_errorDamagedDocumentOnDisk
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", CFSTR("BRCloudDocsErrorDomain"), 151, CFSTR("The current document on disk is damaged and needs recovery"));
}

+ (void)br_errorWithPOSIXCode:()BRAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: code >= 0 && code < sys_nerr%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)brc_errorMethodNotImplemented:()BRAdditions .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_19CBF0000, a3, (os_log_type_t)0x90u, "[ERROR] method not implemented: %@%@", v6, 0x16u);

}

+ (void)brc_addPartialError:()BRAdditions forURL:toError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: dict && [dict isKindOfClass:[NSMutableDictionary class]]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)brc_addPartialError:()BRAdditions forURL:toError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: existingError.code == BRErrorPartialFailure%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
