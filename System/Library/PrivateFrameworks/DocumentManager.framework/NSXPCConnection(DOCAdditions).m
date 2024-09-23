@implementation NSXPCConnection(DOCAdditions)

- (BOOL)doc_hasSandboxAccessToFile:()DOCAdditions
{
  id v4;
  id v5;
  int v6;
  int v7;
  NSObject **v8;
  NSObject *v9;

  v4 = a3;
  objc_msgSend(a1, "auditToken");
  v5 = objc_retainAutorelease(v4);
  objc_msgSend(v5, "fileSystemRepresentation");

  v6 = sandbox_check_by_audit_token();
  if (v6 == -1)
  {
    v7 = *__error();
    v8 = (NSObject **)MEMORY[0x24BE2DF90];
    v9 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[NSXPCConnection(DOCAdditions) doc_hasSandboxAccessToFile:].cold.1(v7, v9);
  }
  return v6 == 0;
}

- (void)doc_hasSandboxAccessToFile:()DOCAdditions .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_209052000, a2, OS_LOG_TYPE_ERROR, "Sandbox check returned error. errno=%d", (uint8_t *)v2, 8u);
}

@end
