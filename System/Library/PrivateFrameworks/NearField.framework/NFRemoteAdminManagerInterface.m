@implementation NFRemoteAdminManagerInterface

+ (id)interface
{
  if (qword_1ECFF61D0 != -1)
    dispatch_once(&qword_1ECFF61D0, &__block_literal_global_2);
  return (id)_MergedGlobals_16;
}

void __42__NFRemoteAdminManagerInterface_interface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40DF38);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_16;
  _MergedGlobals_16 = v0;

  +[NFRemoteAdminManagerCallbacks interface](NFRemoteAdminManagerCallbacks, "interface");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_16, "setInterface:forSelector:argumentIndex:ofReply:", v9, sel_registerForCallbacks_, 0, 0);
  objc_msgSend((id)_MergedGlobals_16, "setInterface:forSelector:argumentIndex:ofReply:", v9, sel_unregisterForCallbacks_, 0, 0);
  v2 = (void *)_MergedGlobals_16;
  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v3, "initWithObjects:", v4, v5, v6, v7, objc_opt_class(), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getSELDInfoForBrokerWithCompletion_, 0, 1);

}

@end
