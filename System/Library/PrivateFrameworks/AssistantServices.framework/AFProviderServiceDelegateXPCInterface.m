@implementation AFProviderServiceDelegateXPCInterface

void __AFProviderServiceDelegateXPCInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE432018);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AFProviderServiceDelegateXPCInterface_cachedXPCInterface;
  AFProviderServiceDelegateXPCInterface_cachedXPCInterface = v0;

  v2 = (void *)AFProviderServiceDelegateXPCInterface_cachedXPCInterface;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_fetchContextsForKeys_forRequestID_includesNearbyDevices_completion_, 0, 0);

  v6 = (void *)AFProviderServiceDelegateXPCInterface_cachedXPCInterface;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_fetchContextsForKeys_forRequestID_includesNearbyDevices_completion_, 0, 1);

}

@end
