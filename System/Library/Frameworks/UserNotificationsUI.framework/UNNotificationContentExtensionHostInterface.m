@implementation UNNotificationContentExtensionHostInterface

void ___UNNotificationContentExtensionHostInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E64F10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_UNNotificationContentExtensionHostInterface___interface;
  _UNNotificationContentExtensionHostInterface___interface = v0;

}

@end
