@implementation UARPSandboxExtension

+ (id)readWriteTokenStringWithURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if ((v6 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[UARPSandboxExtension readWriteTokenStringWithURL:].cold.1((uint64_t)v3);
    goto LABEL_8;
  }
  objc_msgSend(v3, "path");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "UTF8String");
  v8 = (void *)sandbox_extension_issue_file();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "+[UARPSandboxExtension readWriteTokenStringWithURL:]";
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_212D08000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: Generating Read-Write Sandbox Extension Token for %@ ", (uint8_t *)&v11, 0x16u);
  }
  if (!v8)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  free(v8);
LABEL_9:

  return v9;
}

- (UARPSandboxExtension)initWithTokenString:(id)a3
{
  id v4;
  UARPSandboxExtension *v5;
  uint64_t v6;
  UARPSandboxExtension *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UARPSandboxExtension;
  v5 = -[UARPSandboxExtension init](&v9, sel_init);
  if (v5
    && (objc_msgSend(objc_retainAutorelease(v4), "UTF8String"),
        v6 = sandbox_extension_consume(),
        v5->_sandboxExtensionHandle = v6,
        v6 == -1))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[UARPSandboxExtension initWithTokenString:].cold.1();
    v7 = 0;
  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_sandboxExtensionHandle != -1)
  {
    sandbox_extension_release();
    self->_sandboxExtensionHandle = -1;
  }
  v3.receiver = self;
  v3.super_class = (Class)UARPSandboxExtension;
  -[UARPSandboxExtension dealloc](&v3, sel_dealloc);
}

+ (void)readWriteTokenStringWithURL:(uint64_t)a1 .cold.1(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "+[UARPSandboxExtension readWriteTokenStringWithURL:]";
  v3 = 2112;
  v4 = a1;
  _os_log_error_impl(&dword_212D08000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Cannot Generate Sandbox Extension Token for %@ ", (uint8_t *)&v1, 0x16u);
}

- (void)initWithTokenString:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = 136315138;
  v1 = "-[UARPSandboxExtension initWithTokenString:]";
  _os_log_error_impl(&dword_212D08000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: failed to cosume sandbox token", (uint8_t *)&v0, 0xCu);
}

@end
