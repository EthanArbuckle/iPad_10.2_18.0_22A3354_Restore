@implementation BRCXPCTokenInterface

uint64_t __BRCXPCTokenInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)BRCXPCTokenInterface_iface;
  BRCXPCTokenInterface_iface = v0;

  return objc_msgSend((id)BRCXPCTokenInterface_iface, "setProtocol:", &unk_1EE457480);
}

@end
