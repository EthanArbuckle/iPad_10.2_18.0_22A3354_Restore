@implementation AVDelegatingPlaybackCoordinatorPlaybackControlCommand

- (AVDelegatingPlaybackCoordinatorPlaybackControlCommand)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("-[AVDelegatingPlaybackCoordinatorPlaybackControlCommand init] unavailable"), v2, v3, v4, v5, v6, v8), 0);
  objc_exception_throw(v7);
}

- (id)initInternal
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVDelegatingPlaybackCoordinatorPlaybackControlCommand;
  return -[AVDelegatingPlaybackCoordinatorPlaybackControlCommand init](&v3, sel_init);
}

- (AVCoordinatedPlaybackParticipant)originator
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (NSString)expectedCurrentItemIdentifier
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

@end
