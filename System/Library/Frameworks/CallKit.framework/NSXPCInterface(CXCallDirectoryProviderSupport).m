@implementation NSXPCInterface(CXCallDirectoryProviderSupport)

+ (id)cx_callDirectoryProviderHostInterface
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7096B0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_cx_setAllowedClassesForCallDirectoryProviderHostProtocol");
  return v0;
}

+ (uint64_t)cx_callDirectoryProviderVendorInterface
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE710320);
}

- (void)_cx_setAllowedClassesForCallDirectoryProviderHostProtocol
{
  void *v2;
  id v3;

  objc_msgSend(a1, "_cx_callDirectoryProviderAllowedClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_addBlockingEntriesWithData_reply_, 0, 0);

  objc_msgSend(a1, "_cx_callDirectoryProviderAllowedClasses");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_addIdentificationEntriesWithData_reply_, 0, 0);

}

- (id)_cx_callDirectoryProviderAllowedClasses
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__NSXPCInterface_CXCallDirectoryProviderSupport___cx_callDirectoryProviderAllowedClasses__block_invoke;
  block[3] = &unk_1E4B88AE8;
  block[4] = a1;
  if (_cx_callDirectoryProviderAllowedClasses_onceToken != -1)
    dispatch_once(&_cx_callDirectoryProviderAllowedClasses_onceToken, block);
  return (id)_cx_callDirectoryProviderAllowedClasses_allowedClasses;
}

@end
