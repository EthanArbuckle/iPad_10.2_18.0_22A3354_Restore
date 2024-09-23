@implementation NSXPCConnection(Announce)

- (uint64_t)an_isRemotePlaybackSession
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "serviceName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CF7D10]);

  return v2;
}

@end
