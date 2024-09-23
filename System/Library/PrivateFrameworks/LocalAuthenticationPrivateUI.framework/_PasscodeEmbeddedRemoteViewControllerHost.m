@implementation _PasscodeEmbeddedRemoteViewControllerHost

+ (id)exportedInterface
{
  if (exportedInterface_onceToken != -1)
    dispatch_once(&exportedInterface_onceToken, &__block_literal_global_0);
  return (id)exportedInterface_interface;
}

+ (id)serviceViewControllerInterface
{
  if (serviceViewControllerInterface_onceToken != -1)
    dispatch_once(&serviceViewControllerInterface_onceToken, &__block_literal_global_98);
  return (id)serviceViewControllerInterface_interface;
}

- (void)passcodeVerificationFinished:(id)a3
{
  id v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[_PasscodeEmbeddedRemoteViewControllerHost passcodeVerificationFinished:]";
    _os_log_impl(&dword_209E00000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }
  if (v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[_PasscodeEmbeddedRemoteViewControllerHost passcodeVerificationFinished:].cold.1();

}

- (void)setContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_100_0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContext:", v4);

}

- (void)startEditing
{
  id v2;

  -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_101);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startEditing");

}

- (void)endEditing
{
  id v2;

  -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_102);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEditing");

}

- (void)passcodeVerificationFinished:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_209E00000, MEMORY[0x24BDACB70], v0, "Passcode verification failed (%@).", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

@end
