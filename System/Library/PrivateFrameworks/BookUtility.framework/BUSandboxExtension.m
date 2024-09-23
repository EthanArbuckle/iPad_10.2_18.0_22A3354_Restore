@implementation BUSandboxExtension

- (BUSandboxExtension)initWithExtensionToken:(const char *)a3
{
  BUSandboxExtension *v3;
  uint64_t v4;
  BUSandboxExtension *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BUSandboxExtension;
  v3 = -[BUSandboxExtension init](&v7, sel_init);
  if (v3 && (v4 = sandbox_extension_consume(), v3->_extensionHandle = v4, v4 < 0))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_212E6C38C();
    v5 = 0;
  }
  else
  {
    v5 = v3;
  }

  return v5;
}

- (void)close
{
  sandbox_extension_release();
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_close(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)BUSandboxExtension;
  -[BUSandboxExtension dealloc](&v4, sel_dealloc);
}

@end
