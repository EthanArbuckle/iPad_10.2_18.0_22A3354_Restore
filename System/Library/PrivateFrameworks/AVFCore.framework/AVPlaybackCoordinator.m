@implementation AVPlaybackCoordinator

- (id)initInternal
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPlaybackCoordinator;
  return -[AVPlaybackCoordinator init](&v3, sel_init);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (AVPlaybackCoordinator)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("-[AVPlaybackCoordinator init] unavailable"), v2, v3, v4, v5, v6, v8), 0);
  objc_exception_throw(v7);
}

- (NSArray)suspensionReasons
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (NSArray)otherParticipants
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (AVCoordinatedPlaybackSuspension)beginSuspensionForReason:(AVCoordinatedPlaybackSuspensionReason)suspensionReason
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- (void)_endSuspension:(OpaqueFigTimelineCoordinatorSuspension *)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
}

- (void)_endSuspension:(OpaqueFigTimelineCoordinatorSuspension *)a3 proposingNewTime:(id *)a4
{
  objc_class *v6;

  v6 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v6);
}

- (CMTime)expectedItemTimeAtHostTime:(SEL)a3
{
  objc_class *v7;
  CMTime *result;

  v7 = (objc_class *)objc_opt_class();
  result = (CMTime *)AVRequestConcreteImplementation((objc_class *)self, a3, v7);
  *retstr = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return result;
}

- (void)setParticipantLimit:(NSInteger)participantLimit forWaitingOutSuspensionsWithReason:(AVCoordinatedPlaybackSuspensionReason)reason
{
  objc_class *v6;

  v6 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v6);
}

- (NSInteger)participantLimitForWaitingOutSuspensionsWithReason:(AVCoordinatedPlaybackSuspensionReason)reason
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- (void)setSuspensionReasonsThatTriggerWaiting:(NSArray *)suspensionReasonsThatTriggerWaiting
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
}

- (NSArray)suspensionReasonsThatTriggerWaiting
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (void)setPauseSnapsToMediaTimeOfOriginator:(BOOL)pauseSnapsToMediaTimeOfOriginator
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
}

- (BOOL)pauseSnapsToMediaTimeOfOriginator
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (id)_currentWaitingPoliciesArray
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (BOOL)isDefunct
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

@end
