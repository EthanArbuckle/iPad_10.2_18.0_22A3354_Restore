@implementation NTKComplicationStoreServerInterface

void __NTKComplicationStoreServerInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F8EBD3C0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKComplicationStoreServerInterface_interface;
  NTKComplicationStoreServerInterface_interface = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)NTKComplicationStoreServerInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_updateComplicationDescriptors_forClientIdentifier_, 0, 0);

}

@end
