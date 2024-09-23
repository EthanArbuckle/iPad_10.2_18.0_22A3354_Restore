@implementation FigAlternateObjCVideoAttributes

- (FigAlternateObjCVideoAttributes)initWithFigAlternate:(OpaqueFigAlternate *)a3
{
  FigAlternateObjCVideoAttributes *v4;
  OpaqueFigAlternate *v5;
  CGFloat v6;
  double FrameRate;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FigAlternateObjCVideoAttributes;
  v4 = -[FigAlternateObjCVideoAttributes init](&v9, sel_init);
  if (v4)
  {
    if (a3)
      v5 = (OpaqueFigAlternate *)CFRetain(a3);
    else
      v5 = 0;
    v4->_alternate = v5;
    v4->_presentationSize.width = FigAlternateGetResolution((uint64_t)a3);
    v4->_presentationSize.height = v6;
    if (FigAlternateIsFrameRateDeclared((_BOOL8)a3))
      FrameRate = FigAlternateGetFrameRate((uint64_t)a3);
    else
      FrameRate = -1.0;
    v4->_nominalFrameRate = FrameRate;
    v4->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v4;
}

- (NSString)videoRange
{
  int VideoRange;
  const __CFString *v3;

  VideoRange = FigAlternateGetVideoRange((uint64_t)self->_alternate);
  v3 = CFSTR("AVVideoRangeSDR");
  if (VideoRange == 2)
    v3 = CFSTR("AVVideoRangeHLG");
  if (VideoRange == 3)
    return (NSString *)CFSTR("AVVideoRangePQ");
  else
    return &v3->isa;
}

- (double)presentationWidth
{
  return self->_presentationSize.width;
}

- (double)presentationHeight
{
  return self->_presentationSize.height;
}

- (NSArray)codecTypes
{
  NSArray *VideoCodecs;
  NSArray *v4;

  MEMORY[0x19402EEEC](self->_mutex, a2);
  if (!self->_videoCodecTypes)
  {
    VideoCodecs = (NSArray *)FigAlternateGetVideoCodecs((uint64_t)self->_alternate);
    self->_videoCodecTypes = VideoCodecs;
    if (!VideoCodecs)
    {
      VideoCodecs = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
      self->_videoCodecTypes = VideoCodecs;
    }
    v4 = VideoCodecs;
  }
  MEMORY[0x19402EF04](self->_mutex);
  return self->_videoCodecTypes;
}

- (NSArray)immersiveAttributes
{
  __CFArray *VideoLayoutTags;
  void *v4;
  CFIndex v5;
  CFIndex i;
  FigAlternateObjCVideoImmersiveAttributes *v7;

  MEMORY[0x19402EEEC](self->_mutex, a2);
  if (!self->_allImmersiveAttributes)
  {
    VideoLayoutTags = FigAlternateGetVideoLayoutTags((__CFArray *)self->_alternate);
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = 0;
    if (!VideoLayoutTags)
      goto LABEL_4;
LABEL_3:
    for (i = CFArrayGetCount(VideoLayoutTags); v5 < i; i = 0)
    {
      v7 = -[FigAlternateObjCVideoImmersiveAttributes initWithTagCollection:]([FigAlternateObjCVideoImmersiveAttributes alloc], "initWithTagCollection:", CFArrayGetValueAtIndex(VideoLayoutTags, v5));
      objc_msgSend(v4, "addObject:", v7);

      ++v5;
      if (VideoLayoutTags)
        goto LABEL_3;
LABEL_4:
      ;
    }
    self->_allImmersiveAttributes = (NSArray *)objc_msgSend(v4, "copy");
  }
  MEMORY[0x19402EF04](self->_mutex);
  return self->_allImmersiveAttributes;
}

- (NSArray)videoLayoutAttributes
{
  __CFArray *VideoLayoutTags;
  void *v4;
  CFIndex v5;
  CFIndex i;
  FigAlternateObjCVideoLayoutAttributes *v7;

  MEMORY[0x19402EEEC](self->_mutex, a2);
  if (!self->_videoLayoutAttributes)
  {
    VideoLayoutTags = FigAlternateGetVideoLayoutTags((__CFArray *)self->_alternate);
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = 0;
    if (!VideoLayoutTags)
      goto LABEL_4;
LABEL_3:
    for (i = CFArrayGetCount(VideoLayoutTags); v5 < i; i = 0)
    {
      v7 = -[FigAlternateObjCVideoLayoutAttributes initWithTagCollection:]([FigAlternateObjCVideoLayoutAttributes alloc], "initWithTagCollection:", CFArrayGetValueAtIndex(VideoLayoutTags, v5));
      objc_msgSend(v4, "addObject:", v7);

      ++v5;
      if (VideoLayoutTags)
        goto LABEL_3;
LABEL_4:
      ;
    }
    self->_videoLayoutAttributes = (NSArray *)v4;
  }
  MEMORY[0x19402EF04](self->_mutex);
  return self->_videoLayoutAttributes;
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
  v4.super_class = (Class)FigAlternateObjCVideoAttributes;
  -[FigAlternateObjCVideoAttributes dealloc](&v4, sel_dealloc);
}

- (CGSize)presentationSize
{
  double width;
  double height;
  CGSize result;

  width = self->_presentationSize.width;
  height = self->_presentationSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)nominalFrameRate
{
  return self->_nominalFrameRate;
}

@end
