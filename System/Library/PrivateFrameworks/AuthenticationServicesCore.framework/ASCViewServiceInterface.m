@implementation ASCViewServiceInterface

+ (id)xpcInterface
{
  if (xpcInterface_onceToken_1 != -1)
    dispatch_once(&xpcInterface_onceToken_1, &__block_literal_global_10);
  return (id)xpcInterface_interface_1;
}

void __39__ASCViewServiceInterface_xpcInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A4D318);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)xpcInterface_interface_1;
  xpcInterface_interface_1 = v0;

  ASAllLoginChoiceClasses();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)xpcInterface_interface_1, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_updateInterfaceWithLoginChoices_, 0, 0);
}

@end
