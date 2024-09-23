@implementation AVAssetVariant

- (double)peakBitRate
{
  double result;

  -[FigAlternateObjC peakBitRate](self->_figAlternateObjC, "peakBitRate");
  return result;
}

- (double)averageBitRate
{
  double result;

  -[FigAlternateObjC averageBitRate](self->_figAlternateObjC, "averageBitRate");
  return result;
}

- (AVAssetVariantVideoAttributes)videoAttributes
{
  MEMORY[0x194033BF8](self->_mutex, a2);
  if (!self->_videoAttributes && -[FigAlternateObjC videoAttributes](self->_figAlternateObjC, "videoAttributes"))
    self->_videoAttributes = -[AVAssetVariantVideoAttributes initWithFigAlternateObjC:]([AVAssetVariantVideoAttributes alloc], "initWithFigAlternateObjC:", self->_figAlternateObjC);
  MEMORY[0x194033C04](self->_mutex);
  return self->_videoAttributes;
}

- (AVAssetVariantAudioAttributes)audioAttributes
{
  MEMORY[0x194033BF8](self->_mutex, a2);
  if (!self->_audioAttributes && -[FigAlternateObjC audioAttributes](self->_figAlternateObjC, "audioAttributes"))
    self->_audioAttributes = -[AVAssetVariantAudioAttributes initWithFigAlternateObjC:]([AVAssetVariantAudioAttributes alloc], "initWithFigAlternateObjC:", self->_figAlternateObjC);
  MEMORY[0x194033C04](self->_mutex);
  return self->_audioAttributes;
}

- (void)dealloc
{
  objc_super v3;

  FigSimpleMutexDestroy();

  v3.receiver = self;
  v3.super_class = (Class)AVAssetVariant;
  -[AVAssetVariant dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  double v6;
  uint64_t v7;
  double v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  -[AVAssetVariant peakBitRate](self, "peakBitRate");
  v7 = (int)v6;
  -[AVAssetVariant averageBitRate](self, "averageBitRate");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, peakBitRate:%d averageBitRate:%d video:%@ audio:%@>"), v5, self, v7, (int)v8, -[AVAssetVariant videoAttributes](self, "videoAttributes"), -[AVAssetVariant audioAttributes](self, "audioAttributes"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = CFSTR("supports only keyed archivers");
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = CFSTR("supports only NSXPCCoder");
LABEL_6:
    v13 = (void *)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v12, v5, v6, v7, v8, v9, v14), 0);
    objc_exception_throw(v13);
  }
  -[AVAssetVariant _figAlternate](self, "_figAlternate");
  FigAlternateCopyAsXPCObjectWithContext();
}

- (AVAssetVariant)initWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AVAssetVariant *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v12 = self;
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = CFSTR("supports only keyed archivers");
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = CFSTR("supports only NSXPCCoder");
LABEL_8:
    v16 = (void *)objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v15, v6, v7, v8, v9, v10, v17), 0);
    objc_exception_throw(v16);
  }
  if (objc_msgSend(a3, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("variant")))
    FigAlternateCreateWithXPCObject();
  return 0;
}

- (AVAssetVariant)initWithFigAlternate:(OpaqueFigAlternate *)a3
{
  AVAssetVariant *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVAssetVariant;
  v4 = -[AVAssetVariant init](&v6, sel_init);
  if (v4)
  {
    v4->_figAlternateObjC = (FigAlternateObjC *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC3208]), "initWithFigAlternate:", a3);
    v4->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v4;
}

- (OpaqueFigAlternate)_figAlternate
{
  return (OpaqueFigAlternate *)-[FigAlternateObjC figAlternate](self->_figAlternateObjC, "figAlternate");
}

@end
