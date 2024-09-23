@implementation BRCXPCSharingOperationInterface

void __BRCXPCSharingOperationInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void **v2;

  v0 = objc_opt_new();
  v1 = (void *)BRCXPCSharingOperationInterface_iface;
  BRCXPCSharingOperationInterface_iface = v0;

  if (FPIsCloudDocsWithFPFSEnabled())
    v2 = (void **)&protocolRef_BRShareOperationFPFSProtocol;
  else
    v2 = (void **)&protocolRef_BRShareOperationLegacyProtocol;
  objc_msgSend((id)BRCXPCSharingOperationInterface_iface, "setProtocol:", *v2);
  BRCSetupGenericOperations(*v2, (void *)BRCXPCSharingOperationInterface_iface);
  BRCSetupGenericOperations(&unk_1EE450E30, (void *)BRCXPCSharingOperationInterface_iface);
}

@end
