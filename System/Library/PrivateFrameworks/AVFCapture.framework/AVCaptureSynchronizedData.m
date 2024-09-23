@implementation AVCaptureSynchronizedData

+ (void)initialize
{
  objc_opt_class();
}

- (id)_initWithTimestamp:(id *)a3
{
  AVCaptureSynchronizedData *v4;
  AVCaptureSynchronizedDataInternal *v5;
  __int128 v6;
  AVCaptureSynchronizedDataInternal *synchronizedDataInternal;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVCaptureSynchronizedData;
  v4 = -[AVCaptureSynchronizedData init](&v10, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(AVCaptureSynchronizedDataInternal);
    v4->_synchronizedDataInternal = v5;
    if (v5)
    {
      v6 = *(_OWORD *)&a3->var0;
      v5->timestamp.epoch = a3->var3;
      *(_OWORD *)&v5->timestamp.value = v6;
      synchronizedDataInternal = v4->_synchronizedDataInternal;
      v8 = MEMORY[0x1E0CA2E18];
      *(_OWORD *)&synchronizedDataInternal->adjustedTimestamp.value = *MEMORY[0x1E0CA2E18];
      synchronizedDataInternal->adjustedTimestamp.epoch = *(_QWORD *)(v8 + 16);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureSynchronizedData;
  -[AVCaptureSynchronizedData dealloc](&v3, sel_dealloc);
}

- (CMTime)timestamp
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)&self->timescale;
  v4 = 8;
  if ((*(_DWORD *)(v3 + 20) & 1) == 0)
    v4 = 32;
  *retstr = *(CMTime *)(v3 + v4);
  return self;
}

- (void)setTimestampOverride:(id *)a3
{
  AVCaptureSynchronizedDataInternal *synchronizedDataInternal;
  __int128 v4;

  synchronizedDataInternal = self->_synchronizedDataInternal;
  v4 = *(_OWORD *)&a3->var0;
  synchronizedDataInternal->timestamp.epoch = a3->var3;
  *(_OWORD *)&synchronizedDataInternal->timestamp.value = v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)adjustedTimestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(_QWORD *)&self->var1 + 32);
  return self;
}

- (void)setAdjustedTimestamp:(id *)a3
{
  AVCaptureSynchronizedDataInternal *synchronizedDataInternal;
  __int128 v4;

  synchronizedDataInternal = self->_synchronizedDataInternal;
  v4 = *(_OWORD *)&a3->var0;
  synchronizedDataInternal->adjustedTimestamp.epoch = a3->var3;
  *(_OWORD *)&synchronizedDataInternal->adjustedTimestamp.value = v4;
}

- (BOOL)hasCorrespondingDepthData
{
  return 0;
}

- (BOOL)hasCorrespondingVisionData
{
  return 0;
}

- (int)constituentDeviceCaptureID
{
  return -1;
}

@end
