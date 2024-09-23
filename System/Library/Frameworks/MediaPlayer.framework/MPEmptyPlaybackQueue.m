@implementation MPEmptyPlaybackQueue

- (MPEmptyPlaybackQueue)init
{
  return -[MPRemotePlaybackQueue initWithMediaRemotePlaybackQueue:options:](self, "initWithMediaRemotePlaybackQueue:options:", MRSystemAppPlaybackQueueCreate(), 0);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p EmptyQueue>"), objc_opt_class(), self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
