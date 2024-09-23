@implementation ILMessageFilterExtension

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  ILDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_2126D5000, v4, OS_LOG_TYPE_DEFAULT, "context: %@", (uint8_t *)&v5, 0xCu);
  }

}

@end
