@implementation AVCoordinatedPlaybackSuspension

- (AVCoordinatedPlaybackSuspension)initWithCoordinator:(id)a3 reason:(id)a4
{
  AVCoordinatedPlaybackSuspension *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVCoordinatedPlaybackSuspension;
  v6 = -[AVCoordinatedPlaybackSuspension init](&v8, sel_init);
  if (v6)
  {
    if (!a4)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot initialize AVCoordinatedPlaybackSuspension with nil reason."), 0));
    v6->_reason = (NSString *)objc_msgSend(a4, "copy");
    v6->_coordinator = (AVPlaybackCoordinator *)a3;
    v6->_beginDate = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    AVPlaybackCoordinatorFigSuspensionReasonForAVFReason(a4);
    if (FigTimelineCoordinatorSuspensionCreate() || !v6->_figSuspension)
    {

      return 0;
    }
    else
    {
      v6->_iVarMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    }
  }
  return v6;
}

- (void)dealloc
{
  OpaqueFigTimelineCoordinatorSuspension *figSuspension;
  objc_super v4;

  if (self->_figSuspension)
    -[AVPlaybackCoordinator _endSuspension:](self->_coordinator, "_endSuspension:");

  FigSimpleMutexDestroy();
  figSuspension = self->_figSuspension;
  if (figSuspension)
    CFRelease(figSuspension);
  v4.receiver = self;
  v4.super_class = (Class)AVCoordinatedPlaybackSuspension;
  -[AVCoordinatedPlaybackSuspension dealloc](&v4, sel_dealloc);
}

- (OpaqueFigTimelineCoordinatorSuspension)_figSuspension
{
  OpaqueFigTimelineCoordinatorSuspension *figSuspension;

  MEMORY[0x194033BF8](self->_iVarMutex, a2);
  figSuspension = self->_figSuspension;
  MEMORY[0x194033C04](self->_iVarMutex);
  return figSuspension;
}

- (void)end
{
  OpaqueFigTimelineCoordinatorSuspension *figSuspension;

  MEMORY[0x194033BF8](self->_iVarMutex, a2);
  figSuspension = self->_figSuspension;
  self->_figSuspension = 0;
  MEMORY[0x194033C04](self->_iVarMutex);
  if (figSuspension)
  {
    -[AVPlaybackCoordinator _endSuspension:](self->_coordinator, "_endSuspension:", figSuspension);
    CFRelease(figSuspension);
  }
}

- (void)endProposingNewTime:(CMTime *)time
{
  OpaqueFigTimelineCoordinatorSuspension *figSuspension;
  AVPlaybackCoordinator *coordinator;
  __int128 v7;
  CMTimeEpoch epoch;

  MEMORY[0x194033BF8](self->_iVarMutex, a2);
  figSuspension = self->_figSuspension;
  self->_figSuspension = 0;
  MEMORY[0x194033C04](self->_iVarMutex);
  if (figSuspension)
  {
    coordinator = self->_coordinator;
    v7 = *(_OWORD *)&time->value;
    epoch = time->epoch;
    -[AVPlaybackCoordinator _endSuspension:proposingNewTime:](coordinator, "_endSuspension:proposingNewTime:", figSuspension, &v7);
    CFRelease(figSuspension);
  }
}

- (AVCoordinatedPlaybackSuspensionReason)reason
{
  return self->_reason;
}

- (NSDate)beginDate
{
  return self->_beginDate;
}

@end
