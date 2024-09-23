@implementation NSXPCInterface(CXVoicemailControllerSupport)

+ (id)cx_voicemailControllerHostInterface
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE70EBE0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_cx_setAllowedClassesForVoicemailControllerHostProtocol");
  return v0;
}

+ (id)cx_voicemailControllerVendorInterface
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE70EC40);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_cx_setAllowedClassesForVoicemailControllerVendorProtocol");
  return v0;
}

- (id)_cx_voicemailControllerAllowedClasses
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__NSXPCInterface_CXVoicemailControllerSupport___cx_voicemailControllerAllowedClasses__block_invoke;
  block[3] = &unk_1E4B88AE8;
  block[4] = a1;
  if (_cx_voicemailControllerAllowedClasses_onceToken != -1)
    dispatch_once(&_cx_voicemailControllerAllowedClasses_onceToken, block);
  return (id)_cx_voicemailControllerAllowedClasses_voicemailControllerAllowedClasses;
}

- (void)_cx_setAllowedClassesForVoicemailControllerHostProtocol
{
  void *v2;
  id v3;

  objc_msgSend(a1, "_cx_voicemailControllerAllowedClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_requestVoicemails_, 0, 1);

  objc_msgSend(a1, "_cx_voicemailControllerAllowedClasses");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_requestTransaction_reply_, 0, 0);

}

- (void)_cx_setAllowedClassesForVoicemailControllerVendorProtocol
{
  void *v2;
  id v3;

  objc_msgSend(a1, "_cx_voicemailControllerAllowedClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_addOrUpdateVoicemails_, 0, 0);

  objc_msgSend(a1, "_cx_voicemailControllerAllowedClasses");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_removeVoicemails_, 0, 0);

}

@end
