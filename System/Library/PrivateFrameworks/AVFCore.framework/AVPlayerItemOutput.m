@implementation AVPlayerItemOutput

CFTypeRef __35__AVPlayerItemOutput__copyTimebase__block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (CMTime)itemTimeForHostTime:(SEL)a3
{
  CMTime *result;
  CMTime v7;
  CMTime v8;

  memset(&v8, 0, sizeof(v8));
  result = CMTimeMakeWithSeconds(&v8, hostTimeInSeconds, 1000000000);
  if (self)
  {
    v7 = v8;
    return (CMTime *)-[AVPlayerItemOutput _itemTimeForHostTimeAsCMTime:](self, "_itemTimeForHostTimeAsCMTime:", &v7);
  }
  else
  {
    retstr->value = 0;
    *(_QWORD *)&retstr->timescale = 0;
    retstr->epoch = 0;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_itemTimeForHostTimeAsCMTime:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v7;
  CMClockRef HostTimeClock;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;
  CMTime v10;

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  result = -[AVPlayerItemOutput _copyTimebase](self, "_copyTimebase");
  if (result)
  {
    v7 = result;
    HostTimeClock = CMClockGetHostTimeClock();
    v9 = *a4;
    CMSyncConvertTime(&v10, (CMTime *)&v9, HostTimeClock, v7);
    *(CMTime *)retstr = v10;
    CFRelease(v7);
  }
  return result;
}

- (OpaqueCMTimebase)_copyTimebase
{
  NSObject *timebaseReadWriteQueue;
  OpaqueCMTimebase *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  timebaseReadWriteQueue = self->_outputInternal->timebaseReadWriteQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__AVPlayerItemOutput__copyTimebase__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(timebaseReadWriteQueue, v5);
  v3 = (OpaqueCMTimebase *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (AVPlayerItemOutput)init
{
  AVPlayerItemOutput *v3;
  uint64_t v4;
  AVPlayerItemOutputInternal *v5;
  void *v6;
  objc_class *v7;
  const char *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVPlayerItemOutput;
  v3 = -[AVPlayerItemOutput init](&v10, sel_init);
  if (v3)
  {
    v4 = objc_opt_class();
    AVRequireConcreteObject(v3, a2, v4);
    v5 = objc_alloc_init(AVPlayerItemOutputInternal);
    v3->_outputInternal = v5;
    if (v5
      && (CFRetain(v5),
          v6 = (void *)MEMORY[0x1E0CB3940],
          v7 = (objc_class *)objc_opt_class(),
          v8 = (const char *)objc_msgSend((id)objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p> timebase read/write queue"), NSStringFromClass(v7), v3), "UTF8String"), (v3->_outputInternal->timebaseReadWriteQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create(v8)) != 0))
    {
      v3->_outputInternal->weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v3);
    }
    else
    {

      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  AVPlayerItemOutputInternal *outputInternal;
  AVPlayerItemOutputInternal *v4;
  objc_super v5;

  outputInternal = self->_outputInternal;
  if (outputInternal)
  {

    v4 = self->_outputInternal;
    if (v4->timebaseReadWriteQueue)
    {
      dispatch_release((dispatch_object_t)v4->timebaseReadWriteQueue);
      v4 = self->_outputInternal;
    }
    if (v4->timebase)
    {
      CFRelease(v4->timebase);
      v4 = self->_outputInternal;
    }
    CFRelease(v4);

  }
  v5.receiver = self;
  v5.super_class = (Class)AVPlayerItemOutput;
  -[AVPlayerItemOutput dealloc](&v5, sel_dealloc);
}

- (CMTime)itemTimeForMachAbsoluteTime:(SEL)a3
{
  CMTime *result;
  CMTime v7;
  CMTime v8;

  memset(&v8, 0, sizeof(v8));
  result = CMClockMakeHostTimeFromSystemUnits(&v8, machAbsoluteTime);
  if (self)
  {
    v7 = v8;
    return (CMTime *)-[AVPlayerItemOutput _itemTimeForHostTimeAsCMTime:](self, "_itemTimeForHostTimeAsCMTime:", &v7);
  }
  else
  {
    retstr->value = 0;
    *(_QWORD *)&retstr->timescale = 0;
    retstr->epoch = 0;
  }
  return result;
}

- (BOOL)suppressesPlayerRendering
{
  return 0;
}

- (id)_weakReference
{
  return self->_outputInternal->weakReference;
}

- (BOOL)_attachToPlayerItem:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- (void)_detachFromPlayerItem
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
}

- (void)_setTimebase:(OpaqueCMTimebase *)a3
{
  NSObject *timebaseReadWriteQueue;
  _QWORD v6[6];

  if (a3)
    CFRetain(a3);
  timebaseReadWriteQueue = self->_outputInternal->timebaseReadWriteQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__AVPlayerItemOutput__setTimebase___block_invoke;
  v6[3] = &unk_1E302FE78;
  v6[4] = self;
  v6[5] = a3;
  av_readwrite_dispatch_queue_write_async(timebaseReadWriteQueue, v6);
}

void __35__AVPlayerItemOutput__setTimebase___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(const void **)(v2 + 24);
  if (v3)
  {
    CFRelease(v3);
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_QWORD *)(v2 + 24) = *(_QWORD *)(a1 + 40);
}

- (BOOL)isDefunct
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

@end
