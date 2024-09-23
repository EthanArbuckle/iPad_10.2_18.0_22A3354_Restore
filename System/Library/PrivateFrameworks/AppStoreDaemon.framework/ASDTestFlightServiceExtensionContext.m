@implementation ASDTestFlightServiceExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_MergedGlobals_40 != -1)
    dispatch_once(&_MergedGlobals_40, &__block_literal_global_15);
  return (id)qword_1ECFFAAB8;
}

void __71__ASDTestFlightServiceExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3877D0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECFFAAB8;
  qword_1ECFFAAB8 = v0;

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_1ECFFAAC0 != -1)
    dispatch_once(&qword_1ECFFAAC0, &__block_literal_global_42_0);
  return (id)qword_1ECFFAAC8;
}

void __73__ASDTestFlightServiceExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE387268);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECFFAAC8;
  qword_1ECFFAAC8 = v0;

  v2 = (void *)qword_1ECFFAAC8;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_didReceivePushMessages_reply_, 0, 0);

}

@end
