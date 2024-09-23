@implementation BWFencedAnimationInfo

- (FigCaptureMachPortSendRight)fencePortSendRight
{
  return self->_fencePortSendRight;
}

- (int64_t)fencePortGenerationCount
{
  return self->_fencePortGenerationCount;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWFencedAnimationInfo;
  -[BWFencedAnimationInfo dealloc](&v3, sel_dealloc);
}

- (BWFencedAnimationInfo)initWithFencePortSendRight:(id)a3
{
  BWFencedAnimationInfo *v4;
  FigCaptureMachPortSendRight *v5;
  unint64_t v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BWFencedAnimationInfo;
  v4 = -[BWFencedAnimationInfo init](&v9, sel_init);
  if (v4)
  {
    v5 = (FigCaptureMachPortSendRight *)a3;
    v4->_fencePortSendRight = v5;
    if (v5)
    {
      do
      {
        v6 = __ldxr(&sFencedAnimationFencePortGenerationCount);
        v7 = v6 + 1;
      }
      while (__stxr(v7, &sFencedAnimationFencePortGenerationCount));
      v4->_fencePortGenerationCount = v7;
    }
  }
  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fencePort=%@, generationCount=%lld"), self->_fencePortSendRight, self->_fencePortGenerationCount);
}

@end
