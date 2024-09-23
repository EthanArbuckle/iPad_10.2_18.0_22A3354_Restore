@implementation CalAttachmentUtils

+ (id)localURLForAttachmentWithRelativePath:(id)a3 baseURL:(id)a4
{
  return (id)objc_msgSend(a4, "URLByAppendingPathComponent:", a3);
}

+ (id)attachmentContainerWithBaseURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("Attachments"));
}

+ (id)attachmentContainerForSourceIdentifier:(id)a3 calendarDataContainer:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(a1, "attachmentContainerWithBaseURL:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "URLByAppendingPathComponent:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)legacyAttachmentContainerWithBaseURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("Attachments"));
}

+ (id)legacyCalendarDataContainer
{
  const __CFString *v2;
  const __CFURL *v3;
  const __CFURL *v4;
  CFURLRef v5;

  v2 = (const __CFString *)CPSharedResourcesDirectory();
  if (v2 && (v3 = CFURLCreateWithFileSystemPath(0, v2, kCFURLPOSIXPathStyle, 1u)) != 0)
  {
    v4 = v3;
    v5 = CFURLCreateCopyAppendingPathComponent(0, v3, CFSTR("Library/Calendar/"), 0);
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)getFileSizeForPath:(id)a3 fileManager:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v13;

  v7 = a3;
  v13 = 0;
  objc_msgSend(a4, "attributesOfItemAtPath:error:", v7, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (v8)
  {
    objc_msgSend(v8, "valueForKey:", *MEMORY[0x1E0CB2AF0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      +[CalAttachmentUtils getFileSizeForPath:fileManager:error:].cold.1();

    v10 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v9);
  }

  return v10;
}

+ (id)localRelativePathForLocalAbsoluteURL:(id)a3 localBaseURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  __CFString *v16;
  unint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "resolveSymlinksInURLThatMayNotFullyExist:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[CalAttachmentUtils localRelativePathForLocalAbsoluteURL:localBaseURL:].cold.1();
    goto LABEL_11;
  }
  objc_msgSend(a1, "resolveSymlinksInURLThatMayNotFullyExist:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[CalAttachmentUtils localRelativePathForLocalAbsoluteURL:localBaseURL:].cold.2();
    goto LABEL_10;
  }
  v12 = objc_msgSend(v9, "rangeOfString:", v11);
  if (v12)
  {
    v14 = v12;
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = 134218498;
      v20 = v14;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v11;
      _os_log_error_impl(&dword_18FC12000, v15, OS_LOG_TYPE_ERROR, "Could not get location of base path substring at start of local absolute path. local base path range = %lu, local absolute path = %@, local base path = %@", (uint8_t *)&v19, 0x20u);
    }
LABEL_10:

LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
  v18 = v13 + (-[NSObject hasSuffix:](v11, "hasSuffix:", CFSTR("/")) ^ 1);
  if (v18 >= objc_msgSend(v9, "length"))
  {
    v16 = &stru_1E2A86598;
  }
  else
  {
    objc_msgSend(v9, "substringFromIndex:", v18);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:

  return v16;
}

+ (id)resolveSymlinksInURLThatMayNotFullyExist:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  v7 = 0;
  if ((v6 & 1) == 0)
  {
    v8 = v3;
    do
    {
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v7)
      {
        objc_msgSend(v9, "stringByAppendingPathComponent:", v7);
        v11 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v11;
      }
      else
      {
        v7 = v9;
      }
      objc_msgSend(v8, "URLByDeletingLastPathComponent");
      v3 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v4, "fileExistsAtPath:", v12);

      v8 = v3;
    }
    while (!v13);
  }
  objc_msgSend(v3, "URLByResolvingSymlinksInPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v7)
  {
    objc_msgSend(v14, "URLByAppendingPathComponent:", v7);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = v14;
  }
  v17 = v16;

  return v17;
}

+ (BOOL)attachmentURL:(id)a3 matchesServerURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "compare:options:", v9, 1);

  if (v10)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v6, "host");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "host");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 1;
    if (objc_msgSend(v13, "compare:options:", v12, 1))
    {
      objc_msgSend(a1, "_stripSubdomain:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_stripSubdomain:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v14, "compare:options:", v15, 1) == 0;

    }
  }

  return v11;
}

+ (id)_stripSubdomain:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "_knownTLDForHostname:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = objc_msgSend(v4, "rangeOfString:options:range:", CFSTR("."), 4, 0, objc_msgSend(v4, "length") - objc_msgSend(v5, "length")), v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(v4, "substringFromIndex:", v6 + 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

+ (id)_knownTLDForHostname:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  unint64_t v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = 0;
  v6 = CFSTR(".com");
  while (1)
  {
    v7 = v6;
    v8 = -[__CFString length](v7, "length");
    if (v4 > v8 && !objc_msgSend(v3, "compare:options:range:", v7, 1, v4 - v8, v8))
      break;

    v6 = _knownTLDForHostname__knownTLDs[++v5];
    if (v5 == 8)
    {
      v7 = 0;
      break;
    }
  }

  return v7;
}

+ (void)getFileSizeForPath:fileManager:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  _os_log_debug_impl(&dword_18FC12000, v0, OS_LOG_TYPE_DEBUG, "Could not read attributes of file. error = %@, path = %@", v1, 0x16u);
  OUTLINED_FUNCTION_4();
}

+ (void)localRelativePathForLocalAbsoluteURL:localBaseURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_6(&dword_18FC12000, v0, v1, "Could not get local absolute path. local absolute url = %@, local base url = %@");
  OUTLINED_FUNCTION_4();
}

+ (void)localRelativePathForLocalAbsoluteURL:localBaseURL:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_6(&dword_18FC12000, v0, v1, "Could not get local base path. local absolute url = %@, local base url = %@");
  OUTLINED_FUNCTION_4();
}

@end
