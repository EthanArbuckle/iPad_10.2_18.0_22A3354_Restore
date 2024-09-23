@implementation AVDelegatingPlaybackCoordinatorPlayCommand

- (AVDelegatingPlaybackCoordinatorPlayCommand)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("-[AVDelegatingPlaybackCoordinatorPlayCommand init] unavailable"), v2, v3, v4, v5, v6, v8), 0);
  objc_exception_throw(v7);
}

- (AVDelegatingPlaybackCoordinatorPlayCommand)initWithCoordinator:(id)a3 originator:(id)a4 expectedCurrentItemIdentifier:(id)a5 commandOrderIndex:(int64_t)a6 rate:(float)a7 itemTime:(id *)a8 hostClockTime:(id *)a9
{
  char *v16;
  __int128 v17;
  __int128 v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)AVDelegatingPlaybackCoordinatorPlayCommand;
  v16 = -[AVDelegatingPlaybackCoordinatorPlaybackControlCommand initInternal](&v20, sel_initInternal);
  if (v16)
  {
    *((_QWORD *)v16 + 1) = a3;
    *((_QWORD *)v16 + 2) = a4;
    *((_QWORD *)v16 + 3) = objc_msgSend(a5, "copy");
    *((_QWORD *)v16 + 4) = a6;
    *((float *)v16 + 10) = a7;
    v17 = *(_OWORD *)&a8->var0;
    *(_QWORD *)(v16 + 60) = a8->var3;
    *(_OWORD *)(v16 + 44) = v17;
    v18 = *(_OWORD *)&a9->var0;
    *(_QWORD *)(v16 + 84) = a9->var3;
    *(_OWORD *)(v16 + 68) = v18;
  }
  return (AVDelegatingPlaybackCoordinatorPlayCommand *)v16;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVDelegatingPlaybackCoordinatorPlayCommand;
  -[AVDelegatingPlaybackCoordinatorPlayCommand dealloc](&v3, sel_dealloc);
}

- (id)originator
{
  return self->_originator;
}

- (id)expectedCurrentItemIdentifier
{
  return self->_expectedCurrentItemIdentifier;
}

- (float)rate
{
  return self->_rate;
}

- (CMTime)itemTime
{
  *(_OWORD *)&retstr->value = *(_OWORD *)((char *)&self[1].epoch + 4);
  retstr->epoch = *(_QWORD *)&self[2].flags;
  return self;
}

- (CMTime)hostClockTime
{
  *(_OWORD *)&retstr->value = *(_OWORD *)((char *)&self[2].epoch + 4);
  retstr->epoch = *(_QWORD *)&self[3].flags;
  return self;
}

@end
