@implementation MTMPCAssistantGenericPlaybackQueue

- (MTMPCAssistantGenericPlaybackQueue)initWithPlaybackQueueRef:(_MRSystemAppPlaybackQueue *)a3
{
  uint64_t v3;

  return (MTMPCAssistantGenericPlaybackQueue *)objc_msgSend_initWithContextID_playbackQueueRef_(self, a2, 0, (uint64_t)a3, v3);
}

- (MTMPCAssistantGenericPlaybackQueue)initWithContextID:(id)a3 playbackQueueRef:(_MRSystemAppPlaybackQueue *)a4
{
  MTMPCAssistantGenericPlaybackQueue *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTMPCAssistantGenericPlaybackQueue;
  result = -[MPCAssistantPlaybackQueue initWithContextID:](&v6, sel_initWithContextID_, a3);
  if (result)
    result->_playbackQueueRef = a4;
  return result;
}

- (_MRSystemAppPlaybackQueue)createRemotePlaybackQueue
{
  return self->_playbackQueueRef;
}

- (_MRSystemAppPlaybackQueue)playbackQueueRef
{
  return self->_playbackQueueRef;
}

- (void)setPlaybackQueueRef:(_MRSystemAppPlaybackQueue *)a3
{
  self->_playbackQueueRef = a3;
}

@end
