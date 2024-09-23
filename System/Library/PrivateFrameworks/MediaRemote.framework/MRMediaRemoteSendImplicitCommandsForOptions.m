@implementation MRMediaRemoteSendImplicitCommandsForOptions

id __MRMediaRemoteSendImplicitCommandsForOptions_block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v1, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteOptionSystemAppPlaybackQueueData"));
  v2 = MRMediaRemoteCopyCommandDescription(26);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("implicit%@Command"), v2);
  objc_msgSend(v1, "setObject:forKeyedSubscript:", v3, CFSTR("kMRMediaRemoteOptionRemoteControlInterfaceIdentifier"));

  return v1;
}

@end
