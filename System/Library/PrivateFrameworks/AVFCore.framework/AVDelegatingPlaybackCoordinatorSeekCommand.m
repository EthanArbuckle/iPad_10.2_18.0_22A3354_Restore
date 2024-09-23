@implementation AVDelegatingPlaybackCoordinatorSeekCommand

- (AVDelegatingPlaybackCoordinatorSeekCommand)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("-[AVDelegatingPlaybackCoordinatorSeekCommand init] unavailable"), v2, v3, v4, v5, v6, v8), 0);
  objc_exception_throw(v7);
}

- (AVDelegatingPlaybackCoordinatorSeekCommand)initWithCoordinator:(id)a3 originator:(id)a4 expectedCurrentItemIdentifier:(id)a5 commandOrderIndex:(int64_t)a6 itemTime:(id *)a7 shouldPause:(BOOL)a8 shouldBufferInAnticipationOfPlayback:(BOOL)a9 anticipatedPlaybackRate:(float)a10 completionDueDate:(id)a11
{
  char *v18;
  __int128 v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)AVDelegatingPlaybackCoordinatorSeekCommand;
  v18 = -[AVDelegatingPlaybackCoordinatorPlaybackControlCommand initInternal](&v21, sel_initInternal);
  if (v18)
  {
    *((_QWORD *)v18 + 1) = a3;
    *((_QWORD *)v18 + 2) = a4;
    *((_QWORD *)v18 + 3) = objc_msgSend(a5, "copy");
    *((_QWORD *)v18 + 4) = a6;
    v19 = *(_OWORD *)&a7->var0;
    *((_QWORD *)v18 + 7) = a7->var3;
    *(_OWORD *)(v18 + 40) = v19;
    v18[64] = a8;
    v18[65] = a9;
    *((float *)v18 + 17) = a10;
    *((_QWORD *)v18 + 9) = a11;
  }
  return (AVDelegatingPlaybackCoordinatorSeekCommand *)v18;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVDelegatingPlaybackCoordinatorSeekCommand;
  -[AVDelegatingPlaybackCoordinatorSeekCommand dealloc](&v3, sel_dealloc);
}

- (id)originator
{
  return self->_originator;
}

- (id)expectedCurrentItemIdentifier
{
  return self->_expectedCurrentItemIdentifier;
}

- (CMTime)itemTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (BOOL)shouldBufferInAnticipationOfPlayback
{
  return self->_shouldBufferInAnticipationOfPlayback;
}

- (float)anticipatedPlaybackRate
{
  return self->_anticipatedPlaybackRate;
}

- (NSDate)completionDueDate
{
  return self->_completionDueDate;
}

@end
