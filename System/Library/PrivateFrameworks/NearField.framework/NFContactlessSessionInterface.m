@implementation NFContactlessSessionInterface

+ (id)interface
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = (void *)objc_msgSend(v2, "initWithObjects:", v3, v4, objc_opt_class(), 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E058);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_setActiveApplet_completion_, 0, 0);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_setActiveApplet_completion_, 0, 1);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getAppletsWithCompletion_, 0, 1);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_getAppletsWithCompletion_, 1, 1);

  return v7;
}

@end
