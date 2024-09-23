@implementation NSXPCInterface(CXCallDirectoryManagerSupport)

+ (id)cx_callDirectoryManagerDefaultHostInterface
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE705510);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_cx_setAllowedClassesForCallDirectoryManagerDefaultHostProtocol");
  return v0;
}

- (void)_cx_setAllowedClassesForCallDirectoryManagerDefaultHostProtocol
{
  void *v2;
  id v3;

  objc_msgSend(a1, "_cx_callDirectoryManagerAllowedClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers_cacheOnly_reply_, 0, 1);

  objc_msgSend(a1, "_cx_callDirectoryManagerAllowedClasses");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_getExtensionsWithReply_, 0, 1);

}

- (id)_cx_callDirectoryManagerAllowedClasses
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__NSXPCInterface_CXCallDirectoryManagerSupport___cx_callDirectoryManagerAllowedClasses__block_invoke;
  block[3] = &unk_1E4B88AE8;
  block[4] = a1;
  if (_cx_callDirectoryManagerAllowedClasses_onceToken != -1)
    dispatch_once(&_cx_callDirectoryManagerAllowedClasses_onceToken, block);
  return (id)_cx_callDirectoryManagerAllowedClasses_allowedClasses;
}

+ (uint64_t)cx_callDirectoryManagerMaintenanceHostInterface
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7055C8);
}

@end
