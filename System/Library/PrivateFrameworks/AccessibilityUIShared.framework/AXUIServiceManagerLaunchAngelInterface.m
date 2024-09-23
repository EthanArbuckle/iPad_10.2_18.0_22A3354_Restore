@implementation AXUIServiceManagerLaunchAngelInterface

void __AXUIServiceManagerLaunchAngelInterface_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE0F9F8], "interfaceWithIdentifier:", CFSTR("com.apple.AccessibilityUIServer"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_254B90358);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClient:", v0);

  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_254B90358);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServer:", v1);

  objc_msgSend(v4, "setClientMessagingExpectation:", 0);
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)AXUIServiceManagerLaunchAngelInterface_Interface;
  AXUIServiceManagerLaunchAngelInterface_Interface = v2;

}

@end
