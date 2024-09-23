@implementation NSXPCInterface(CXProviderSupport)

+ (id)cx_providerHostInterface
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE704168);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "cx_setAllowedClassesForProviderHostProtocol");
  return v0;
}

+ (id)cx_providerVendorInterface
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7042E8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "cx_setAllowedClassesForProviderVendorProtocol");
  return v0;
}

- (id)_cx_providerAllowedClasses
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__NSXPCInterface_CXProviderSupport___cx_providerAllowedClasses__block_invoke;
  block[3] = &unk_1E4B88AE8;
  block[4] = a1;
  if (_cx_providerAllowedClasses_onceToken != -1)
    dispatch_once(&_cx_providerAllowedClasses_onceToken, block);
  return (id)_cx_providerAllowedClasses_providerAllowedClasses;
}

- (void)cx_setAllowedClassesForProviderHostProtocol
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "_cx_providerAllowedClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_reportNewIncomingCallWithUUID_update_reply_, 1, 0);

  objc_msgSend(a1, "_cx_providerAllowedClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_reportCallWithUUID_updated_, 1, 0);

  objc_msgSend(a1, "_cx_providerAllowedClasses");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_actionCompleted_completionHandler_, 0, 0);

}

- (void)cx_setAllowedClassesForProviderVendorProtocol
{
  id v2;

  objc_msgSend(a1, "_cx_providerAllowedClasses");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_commitTransaction_, 0, 0);

}

@end
