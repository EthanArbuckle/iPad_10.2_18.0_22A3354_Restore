@implementation FigAlternateObjC

- (FigAlternateObjC)initWithFigAlternate:(OpaqueFigAlternate *)a3
{
  FigAlternateObjC *v4;
  OpaqueFigAlternate *v5;
  int IsPeakBitRateDeclared;
  double AverageBitRate;
  double DeclaredPeakBitRate;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FigAlternateObjC;
  v4 = -[FigAlternateObjC init](&v10, sel_init);
  if (v4)
  {
    if (a3)
      v5 = (OpaqueFigAlternate *)CFRetain(a3);
    else
      v5 = 0;
    v4->_alternate = v5;
    IsPeakBitRateDeclared = FigAlternateIsPeakBitRateDeclared((uint64_t)a3);
    AverageBitRate = -1.0;
    DeclaredPeakBitRate = -1.0;
    if (IsPeakBitRateDeclared)
      DeclaredPeakBitRate = (double)(int)FigAlternateGetDeclaredPeakBitRate((uint64_t)a3);
    v4->_peakBitRate = DeclaredPeakBitRate;
    if (FigAlternateIsAverageBitRateDeclared((_BOOL8)a3))
      AverageBitRate = (double)(int)FigAlternateGetAverageBitRate((uint64_t)a3);
    v4->_averageBitRate = AverageBitRate;
    v4->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v4;
}

- (FigAlternateObjCVideoAttributes)videoAttributes
{
  MEMORY[0x19402EEEC](self->_mutex, a2);
  if (!self->_videoAttributes && FigAlternateHasVideo((uint64_t)self->_alternate))
    self->_videoAttributes = -[FigAlternateObjCVideoAttributes initWithFigAlternate:]([FigAlternateObjCVideoAttributes alloc], "initWithFigAlternate:", self->_alternate);
  MEMORY[0x19402EF04](self->_mutex);
  return self->_videoAttributes;
}

- (FigAlternateObjCAudioAttributes)audioAttributes
{
  MEMORY[0x19402EEEC](self->_mutex, a2);
  if (!self->_audioAttributes && FigAlternateHasAudio(self->_alternate))
    self->_audioAttributes = -[FigAlternateObjCAudioAttributes initWithFigAlternate:]([FigAlternateObjCAudioAttributes alloc], "initWithFigAlternate:", self->_alternate);
  MEMORY[0x19402EF04](self->_mutex);
  return self->_audioAttributes;
}

- (void)dealloc
{
  OpaqueFigAlternate *alternate;
  objc_super v4;

  alternate = self->_alternate;
  if (alternate)
    CFRelease(alternate);

  FigSimpleMutexDestroy();
  v4.receiver = self;
  v4.super_class = (Class)FigAlternateObjC;
  -[FigAlternateObjC dealloc](&v4, sel_dealloc);
}

- (double)peakBitRate
{
  return self->_peakBitRate;
}

- (double)averageBitRate
{
  return self->_averageBitRate;
}

- (OpaqueFigAlternate)figAlternate
{
  return self->_alternate;
}

+ (id)dummy
{
  return objc_alloc_init(FigAlternateObjCDummy);
}

@end
