@implementation NSXPCInterface(CXCallControllerSupport)

+ (id)cx_callControllerHostInterface
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE70E1B8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_cx_setAllowedClassesForCallControllerHostProtocol");
  return v0;
}

+ (id)cx_callControllerVendorInterface
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE70E218);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_cx_setAllowedClassesForCallControllerVendorProtocol");
  return v0;
}

- (id)_cx_callControllerAllowedClasses
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__NSXPCInterface_CXCallControllerSupport___cx_callControllerAllowedClasses__block_invoke;
  block[3] = &unk_1E4B88AE8;
  block[4] = a1;
  if (_cx_callControllerAllowedClasses_onceToken != -1)
    dispatch_once(&_cx_callControllerAllowedClasses_onceToken, block);
  return (id)_cx_callControllerAllowedClasses_providerAllowedClasses;
}

- (void)_cx_setAllowedClassesForCallControllerHostProtocol
{
  void *v2;
  id v3;

  objc_msgSend(a1, "_cx_callControllerAllowedClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_requestCalls_, 0, 1);

  objc_msgSend(a1, "_cx_callControllerAllowedClasses");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_requestTransaction_reply_, 0, 0);

}

- (void)_cx_setAllowedClassesForCallControllerVendorProtocol
{
  void *v2;
  id v3;

  objc_msgSend(a1, "_cx_callControllerAllowedClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_addOrUpdateCall_, 0, 0);

  objc_msgSend(a1, "_cx_callControllerAllowedClasses");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_removeCall_, 0, 0);

}

@end
