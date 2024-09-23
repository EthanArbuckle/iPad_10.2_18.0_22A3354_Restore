@implementation PasscodeEmbeddedRemoteViewControllerHost

void __62___PasscodeEmbeddedRemoteViewControllerHost_exportedInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545C70B8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)exportedInterface_interface;
  exportedInterface_interface = v0;

}

void __75___PasscodeEmbeddedRemoteViewControllerHost_serviceViewControllerInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545C7148);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serviceViewControllerInterface_interface;
  serviceViewControllerInterface_interface = v0;

}

void __56___PasscodeEmbeddedRemoteViewControllerHost_setContext___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __56___PasscodeEmbeddedRemoteViewControllerHost_setContext___block_invoke_cold_1();
}

void __57___PasscodeEmbeddedRemoteViewControllerHost_startEditing__block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __56___PasscodeEmbeddedRemoteViewControllerHost_setContext___block_invoke_cold_1();
}

void __55___PasscodeEmbeddedRemoteViewControllerHost_endEditing__block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __56___PasscodeEmbeddedRemoteViewControllerHost_setContext___block_invoke_cold_1();
}

void __56___PasscodeEmbeddedRemoteViewControllerHost_setContext___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_209E00000, MEMORY[0x24BDACB70], v0, "Could not obtain service proxy. Failed setting context (%@).", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

@end
