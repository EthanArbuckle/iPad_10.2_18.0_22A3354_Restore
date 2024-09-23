@implementation FPSimulatorSupportInterface

void __FPSimulatorSupportInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5F82E0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)FPSimulatorSupportInterface_interface;
  FPSimulatorSupportInterface_interface = v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5F8340);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)FPSimulatorSupportInterface_interface, "setInterface:forSelector:argumentIndex:ofReply:", v2, sel_sim_registerMaterializationHandler_forURL_completionHandler_, 0, 0);

}

@end
