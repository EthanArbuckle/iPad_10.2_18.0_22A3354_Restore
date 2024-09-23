@implementation _INUIXPCInterfaceUtilities

+ (id)extensionContextHostingInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F03577E0);
}

+ (id)extensionContextVendingInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F0357B98);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_setExtensionContextState_completion_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_configureForParameters_ofInteraction_interactiveBehavior_context_completion_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_configureForParameters_ofInteraction_interactiveBehavior_context_completion_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_configureForParameters_ofInteraction_interactiveBehavior_context_completion_, 1, 1);

  return v2;
}

@end
