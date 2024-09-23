@implementation GKGameSessionServiceInterface

+ (id)interfaceProtocol
{
  return &unk_1EF4CFAE8;
}

+ (void)configureInterface:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_loadSessionsInContainer_handler_, 0, 1);

}

@end
