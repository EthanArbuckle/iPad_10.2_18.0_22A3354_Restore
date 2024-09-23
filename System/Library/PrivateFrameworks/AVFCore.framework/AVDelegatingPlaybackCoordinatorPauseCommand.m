@implementation AVDelegatingPlaybackCoordinatorPauseCommand

- (AVDelegatingPlaybackCoordinatorPauseCommand)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("-[AVDelegatingPlaybackCoordinatorPauseCommand init] unavailable"), v2, v3, v4, v5, v6, v8), 0);
  objc_exception_throw(v7);
}

- (AVDelegatingPlaybackCoordinatorPauseCommand)initWithCoordinator:(id)a3 originator:(id)a4 expectedCurrentItemIdentifier:(id)a5 commandOrderIndex:(int64_t)a6 shouldBufferInAnticipationOfPlayback:(BOOL)a7 anticipatedPlaybackRate:(float)a8
{
  AVDelegatingPlaybackCoordinatorPauseCommand *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AVDelegatingPlaybackCoordinatorPauseCommand;
  v14 = -[AVDelegatingPlaybackCoordinatorPlaybackControlCommand initInternal](&v16, sel_initInternal);
  if (v14)
  {
    v14->_coordinator = (AVDelegatingPlaybackCoordinator *)a3;
    v14->_originator = (AVCoordinatedPlaybackParticipant *)a4;
    v14->_expectedCurrentItemIdentifier = (NSString *)objc_msgSend(a5, "copy");
    v14->_commandOrderIndex = a6;
    v14->_shouldBufferInAnticipationOfPlayback = a7;
    v14->_anticipatedPlaybackRate = a8;
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVDelegatingPlaybackCoordinatorPauseCommand;
  -[AVDelegatingPlaybackCoordinatorPauseCommand dealloc](&v3, sel_dealloc);
}

- (id)originator
{
  return self->_originator;
}

- (id)expectedCurrentItemIdentifier
{
  return self->_expectedCurrentItemIdentifier;
}

- (BOOL)shouldBufferInAnticipationOfPlayback
{
  return self->_shouldBufferInAnticipationOfPlayback;
}

- (float)anticipatedPlaybackRate
{
  return self->_anticipatedPlaybackRate;
}

@end
