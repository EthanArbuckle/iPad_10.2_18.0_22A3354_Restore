@implementation GKMultiplayerServicePrivateInterface

+ (id)interfaceProtocol
{
  return &unk_1EF4D3430;
}

+ (void)configureInterface:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v6 = a3;
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_invitePlayersV2_toGame_handler_, 0, 0);

  objc_msgSend(v6, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_invitePlayersV2_toGame_handler_, 1, 0);
}

@end
