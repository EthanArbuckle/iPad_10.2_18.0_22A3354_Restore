@implementation IMSandboxedFileURL

- (IMSandboxedFileURL)initWithFileURL:(id)a3
{
  IMSandboxedFileURL *v4;
  IMSandboxedFileURL *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMSandboxedFileURL;
  v4 = -[IMSandboxedFileURL init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[IMSandboxedResource setResource:](v4, "setResource:", a3);
  return v5;
}

- (IMSandboxedFileURL)initWithFileURL:(id)a3 destinationProcessPID:(int)a4
{
  uint64_t v4;
  IMSandboxedFileURL *v6;
  IMSandboxedFileURL *v7;
  objc_super v9;

  v4 = *(_QWORD *)&a4;
  v9.receiver = self;
  v9.super_class = (Class)IMSandboxedFileURL;
  v6 = -[IMSandboxedFileURL init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[IMSandboxedResource setResource:](v6, "setResource:", a3);
    -[IMSandboxedResource authorizeForPID:](v7, "authorizeForPID:", v4);
  }
  return v7;
}

+ (Class)resourceClass
{
  return (Class)objc_opt_class();
}

- (char)_sandboxExtensionForPID:(int)a3
{
  id v4;
  uint64_t v5;
  char *result;
  NSObject *v7;
  int v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  int v13;
  IMSandboxedFileURL *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = -[IMSandboxedResource resource](self, "resource");
  if (!v4)
  {
    if (!IMOSLoggingEnabled())
      return 0;
    v12 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      return 0;
    v13 = 138412290;
    v14 = self;
    v9 = "Unable to authorize protected resource (resource is nil) for %@";
    v10 = v12;
    v11 = 12;
    goto LABEL_9;
  }
  v5 = objc_msgSend((id)objc_msgSend(v4, "path"), "UTF8String");
  result = (char *)sandbox_extension_issue_file_to_process_by_pid();
  if (result)
    return result;
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *__error();
      v13 = 138412802;
      v14 = self;
      v15 = 2080;
      v16 = v5;
      v17 = 1024;
      v18 = v8;
      v9 = "Unable to authorize protected resource (sandbox extension is NULL) %@ (file path: %s) errno %d";
      v10 = v7;
      v11 = 28;
LABEL_9:
      _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v13, v11);
    }
  }
  return 0;
}

- (char)_sandboxExtensionForAuditToken:(id *)a3
{
  id v5;
  uint64_t v6;
  __int128 v7;
  char *result;
  NSObject *v9;
  int v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  _BYTE v15[32];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = -[IMSandboxedResource resource](self, "resource");
  if (!v5)
  {
    if (!IMOSLoggingEnabled())
      return 0;
    v14 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      return 0;
    *(_DWORD *)v15 = 138412290;
    *(_QWORD *)&v15[4] = self;
    v11 = "Unable to authorize protected resource (resource is nil) for %@";
    v12 = v14;
    v13 = 12;
    goto LABEL_9;
  }
  v6 = objc_msgSend((id)objc_msgSend(v5, "path"), "UTF8String");
  v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v15 = *(_OWORD *)a3->var0;
  *(_OWORD *)&v15[16] = v7;
  result = (char *)sandbox_extension_issue_file_to_process();
  if (result)
    return result;
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *__error();
      *(_DWORD *)v15 = 138412802;
      *(_QWORD *)&v15[4] = self;
      *(_WORD *)&v15[12] = 2080;
      *(_QWORD *)&v15[14] = v6;
      *(_WORD *)&v15[22] = 1024;
      *(_DWORD *)&v15[24] = v10;
      v11 = "Unable to authorize protected resource (sandbox extension is NULL) %@ (file path: %s) errno %d";
      v12 = v9;
      v13 = 28;
LABEL_9:
      _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, v11, v15, v13);
    }
  }
  return 0;
}

@end
