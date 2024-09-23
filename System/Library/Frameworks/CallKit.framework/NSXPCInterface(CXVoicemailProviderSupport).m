@implementation NSXPCInterface(CXVoicemailProviderSupport)

+ (id)cx_voicemailProviderHostInterface
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE70D0D0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "cx_setAllowedClassesForVoicemailProviderHostProtocol");
  return v0;
}

+ (id)cx_voicemailProviderVendorInterface
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE70D130);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "cx_setAllowedClassesForVoicemailProviderVendorProtocol");
  return v0;
}

- (id)_cx_voicemailProviderAllowedClasses
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__NSXPCInterface_CXVoicemailProviderSupport___cx_voicemailProviderAllowedClasses__block_invoke;
  block[3] = &unk_1E4B88AE8;
  block[4] = a1;
  if (_cx_voicemailProviderAllowedClasses_onceToken != -1)
    dispatch_once(&_cx_voicemailProviderAllowedClasses_onceToken, block);
  return (id)_cx_voicemailProviderAllowedClasses_voicemailProviderAllowedClasses;
}

- (void)cx_setAllowedClassesForVoicemailProviderHostProtocol
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "_cx_providerAllowedClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_reportNewVoicemailsWithUpdates_, 0, 0);

  objc_msgSend(a1, "_cx_providerAllowedClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_reportVoicemailsUpdated_, 0, 0);

  objc_msgSend(a1, "_cx_providerAllowedClasses");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_reportVoicemailsRemovedWithUUIDs_, 0, 0);

}

- (void)cx_setAllowedClassesForVoicemailProviderVendorProtocol
{
  id v2;

  objc_msgSend(a1, "_cx_providerAllowedClasses");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_commitTransaction_, 0, 0);

}

@end
