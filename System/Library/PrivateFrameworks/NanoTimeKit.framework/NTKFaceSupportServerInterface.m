@implementation NTKFaceSupportServerInterface

void __NTKFaceSupportServerInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F8E2EC98);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKFaceSupportServerInterface_interface;
  NTKFaceSupportServerInterface_interface = v0;

  v2 = (void *)NTKFaceSupportServerInterface_interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_displayUserNotificationForKeyDescriptor_completion_, 0, 0);

  v4 = (void *)NTKFaceSupportServerInterface_interface;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_knownKeyDescriptors_, 0, 1);

}

@end
