@implementation NFSeshatSessionInterface

+ (id)interface
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E5F8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_allocateSlot_authorizingUser_authorizingUserToken_completion_, 0, 0);

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_derive_userHash_completion_, 0, 0);

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_resetCounter_userToken_completion_, 0, 0);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_authorizeUpdate_slotIndex_userToken_completion_, 0, 0);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_allocateSlot_authorizingUser_authorizingUserToken_completion_, 0, 1);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_derive_userHash_completion_, 0, 1);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_getDataWithCompletion_, 0, 1);

  return v0;
}

@end
