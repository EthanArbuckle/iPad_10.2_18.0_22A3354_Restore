@implementation LNDaemonSuggestionsXPCInterface

void __LNDaemonSuggestionsXPCInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE662868);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)LNDaemonSuggestionsXPCInterface_interface;
  LNDaemonSuggestionsXPCInterface_interface = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)LNDaemonSuggestionsXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_suggestedActionsForSuggestionsRequests_reply_, 0, 0);
  objc_msgSend((id)LNDaemonSuggestionsXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_suggestedActionsForSuggestionsRequests_reply_, 0, 1);
  objc_msgSend((id)LNDaemonSuggestionsXPCInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_suggestedActionsForSuggestionsRequests_reply_, 1, 1);

}

@end
