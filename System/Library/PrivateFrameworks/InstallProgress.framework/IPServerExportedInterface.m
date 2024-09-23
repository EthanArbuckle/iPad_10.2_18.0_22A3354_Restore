@implementation IPServerExportedInterface

uint64_t __IPServerExportedInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256DFED68);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)IPServerExportedInterface_interface;
  IPServerExportedInterface_interface = v0;

  objc_msgSend((id)IPServerExportedInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_actionBarrier_, 0, 1);
  objc_msgSend((id)IPServerExportedInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_registerAsProgressObserver_, 0, 1);
  v2 = (void *)IPServerExportedInterface_interface;
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getActiveInstallations_, 0, 1);

  objc_msgSend((id)IPServerExportedInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getActiveInstallations_, 1, 1);
  v6 = (void *)IPServerExportedInterface_interface;
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_getAllInstallableStates_, 0, 1);

  objc_msgSend((id)IPServerExportedInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getAllInstallableStates_, 1, 1);
  objc_msgSend((id)IPServerExportedInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getProgressForIdentity_completion_, 0, 0);
  objc_msgSend((id)IPServerExportedInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getProgressForIdentity_completion_, 0, 1);
  return objc_msgSend((id)IPServerExportedInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getProgressForIdentity_completion_, 1, 1);
}

@end
