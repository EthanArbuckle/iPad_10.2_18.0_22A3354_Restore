@implementation ASCURLLaunchServiceGetInterface

void __ASCURLLaunchServiceGetInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF4CF570);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ASCURLLaunchServiceGetInterface_interface;
  ASCURLLaunchServiceGetInterface_interface = v0;

  v2 = (void *)ASCURLLaunchServiceGetInterface_interface;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_openURL_withReplyHandler_, 0, 0);

  v4 = (void *)ASCURLLaunchServiceGetInterface_interface;
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_openURL_withReplyHandler_, 0, 1);

}

@end
