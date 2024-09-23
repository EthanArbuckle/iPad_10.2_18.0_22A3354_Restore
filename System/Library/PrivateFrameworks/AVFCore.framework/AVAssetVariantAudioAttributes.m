@implementation AVAssetVariantAudioAttributes

- (NSArray)formatIDs
{
  return (NSArray *)objc_msgSend((id)-[FigAlternateObjC audioAttributes](self->_figAlternateObjC, "audioAttributes"), "formatIDs");
}

- (AVAssetVariantAudioRenditionSpecificAttributes)renditionSpecificAttributesForMediaOption:(AVMediaSelectionOption *)mediaSelectionOption
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v6, v7, v8, v9, v10, (uint64_t)"[mediaSelectionOption isKindOfClass:[AVMediaSelectionOption class]]"), 0);
    objc_exception_throw(v12);
  }
  return -[AVAssetVariantAudioRenditionSpecificAttributes initWithFigAlternateObjC:mediaSelectionOption:]([AVAssetVariantAudioRenditionSpecificAttributes alloc], "initWithFigAlternateObjC:mediaSelectionOption:", self->_figAlternateObjC, mediaSelectionOption);
}

- (void)dealloc
{
  objc_super v3;

  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)AVAssetVariantAudioAttributes;
  -[AVAssetVariantAudioAttributes dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, formatIDs:%@>"), NSStringFromClass(v4), self, -[AVAssetVariantAudioAttributes formatIDs](self, "formatIDs"));
}

- (AVAssetVariantAudioAttributes)initWithFigAlternateObjC:(id)a3
{
  AVAssetVariantAudioAttributes *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVAssetVariantAudioAttributes;
  v4 = -[AVAssetVariantAudioAttributes init](&v6, sel_init);
  if (v4)
  {
    v4->_figAlternateObjC = (FigAlternateObjC *)a3;
    v4->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v4;
}

@end
