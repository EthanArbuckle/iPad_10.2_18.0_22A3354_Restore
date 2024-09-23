@implementation MRMediaRemoteCopySystemMediaApplicationDefaultSupportedCommands

void __MRMediaRemoteCopySystemMediaApplicationDefaultSupportedCommands_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  MRCommandInfo *v3;
  void *v4;
  void *v5;
  MRCommandInfo *v6;
  MRCommandInfo *v7;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  v1 = (void *)MRMediaRemoteCopySystemMediaApplicationDefaultSupportedCommands___supportedCommands;
  MRMediaRemoteCopySystemMediaApplicationDefaultSupportedCommands___supportedCommands = v0;

  v2 = (void *)MRMediaRemoteCopySystemMediaApplicationDefaultSetPlaybackQueueCommandOptions();
  v3 = objc_alloc_init(MRCommandInfo);
  -[MRCommandInfo setCommand:](v3, "setCommand:", 122);
  -[MRCommandInfo setEnabled:](v3, "setEnabled:", 1);
  -[MRCommandInfo setOptions:](v3, "setOptions:", v2);
  objc_msgSend((id)MRMediaRemoteCopySystemMediaApplicationDefaultSupportedCommands___supportedCommands, "addObject:", v3);

  v4 = (void *)MRMediaRemoteCopySystemMediaApplicationDefaultSetPlaybackQueueCommandOptions();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E3143C50, CFSTR("kMRMediaRemoteCommandInfoSupportedInsertionPositions"));
  v6 = objc_alloc_init(MRCommandInfo);
  -[MRCommandInfo setCommand:](v6, "setCommand:", 125);
  -[MRCommandInfo setEnabled:](v6, "setEnabled:", 1);
  -[MRCommandInfo setOptions:](v6, "setOptions:", v5);
  objc_msgSend((id)MRMediaRemoteCopySystemMediaApplicationDefaultSupportedCommands___supportedCommands, "addObject:", v6);

  v7 = objc_alloc_init(MRCommandInfo);
  -[MRCommandInfo setCommand:](v7, "setCommand:", 0);
  -[MRCommandInfo setEnabled:](v7, "setEnabled:", 1);
  objc_msgSend((id)MRMediaRemoteCopySystemMediaApplicationDefaultSupportedCommands___supportedCommands, "addObject:", v7);

}

@end
