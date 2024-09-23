@implementation AVAssetVariantVideoImmersiveAttributes

- (AVAssetVariantVideoImmersiveAttributes)initWithFigVideoImmersiveAttributes:(id)a3
{
  AVAssetVariantVideoImmersiveAttributes *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVAssetVariantVideoImmersiveAttributes;
  v4 = -[AVAssetVariantVideoImmersiveAttributes init](&v6, sel_init);
  if (v4)
    v4->_figVideoImmersiveAttributes = (FigAlternateObjCVideoImmersiveAttributes *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetVariantVideoImmersiveAttributes;
  -[AVAssetVariantVideoImmersiveAttributes dealloc](&v3, sel_dealloc);
}

- (int64_t)channelLayout
{
  return -[FigAlternateObjCVideoImmersiveAttributes channelLayout](self->_figVideoImmersiveAttributes, "channelLayout");
}

- (int64_t)projection
{
  return -[FigAlternateObjCVideoImmersiveAttributes projection](self->_figVideoImmersiveAttributes, "projection");
}

- (int64_t)packing
{
  return -[FigAlternateObjCVideoImmersiveAttributes packing](self->_figVideoImmersiveAttributes, "packing");
}

- (id)description
{
  const __CFString *v3;
  void *v4;
  objc_class *v5;
  NSString *v6;
  const __CFString *v7;
  int64_t v8;
  const __CFString *v9;

  if (-[AVAssetVariantVideoImmersiveAttributes packing](self, "packing") == 1)
  {
    v3 = CFSTR("Side");
  }
  else if (-[AVAssetVariantVideoImmersiveAttributes packing](self, "packing") == 2)
  {
    v3 = CFSTR("Over");
  }
  else
  {
    v3 = CFSTR("None");
  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  if (-[AVAssetVariantVideoImmersiveAttributes channelLayout](self, "channelLayout"))
    v7 = CFSTR("Stereo");
  else
    v7 = CFSTR("Mono");
  v8 = -[AVAssetVariantVideoImmersiveAttributes projection](self, "projection");
  v9 = CFSTR("Fish");
  if (!v8)
    v9 = CFSTR("Rect");
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, packing:%@ channel:%@ projection:%@>"), v6, self, v3, v7, v9);
}

@end
