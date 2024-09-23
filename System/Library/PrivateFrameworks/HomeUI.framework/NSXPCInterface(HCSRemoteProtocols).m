@implementation NSXPCInterface(HCSRemoteProtocols)

+ (id)hu_homeControlServiceXPCInterface
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "interfaceWithProtocol:", &unk_1EF347F10);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2, v5, v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_getTransitionSubviewFramesWithCompletion_, 0, 1);

  return v1;
}

+ (uint64_t)hu_homeControlXPCInterface
{
  return objc_msgSend(a1, "interfaceWithProtocol:", &unk_1EF347F70);
}

@end
