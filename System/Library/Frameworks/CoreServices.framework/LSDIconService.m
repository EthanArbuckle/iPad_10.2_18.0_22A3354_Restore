@implementation LSDIconService

void __31___LSDIconService_XPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDCDF8E0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)XPCInterface_interface;
  XPCInterface_interface = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v5[2] = objc_opt_class();
  v5[3] = objc_opt_class();
  v5[4] = objc_opt_class();
  v5[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)XPCInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setAlternateIconName_forIdentifier_iconsDictionary_reply_, 0, 0);
  objc_msgSend((id)XPCInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setAlternateIconName_forIdentifier_iconsDictionary_reply_, 1, 0);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_setAlternateIconName_forIdentifier_iconsDictionary_reply_, 2, 0);
  objc_msgSend((id)XPCInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setAlternateIconName_forIdentifier_iconsDictionary_reply_, 1, 1);
  objc_msgSend((id)XPCInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getAlternateIconNameForIdentifier_reply_, 0, 0);
  objc_msgSend((id)XPCInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getAlternateIconNameForIdentifier_reply_, 1, 1);

}

@end
