@implementation AVAssetVariantVideoLayoutAttributes

- (AVAssetVariantVideoLayoutAttributes)initWithFigVideoImmersiveAttributes:(id)a3
{
  AVAssetVariantVideoLayoutAttributes *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVAssetVariantVideoLayoutAttributes;
  v4 = -[AVAssetVariantVideoLayoutAttributes init](&v6, sel_init);
  if (v4)
    v4->_figVideoLayoutAttributes = (FigAlternateObjCVideoLayoutAttributes *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetVariantVideoLayoutAttributes;
  -[AVAssetVariantVideoLayoutAttributes dealloc](&v3, sel_dealloc);
}

- (CMStereoViewComponents)stereoViewComponents
{
  return -[FigAlternateObjCVideoLayoutAttributes stereoViewComponents](self->_figVideoLayoutAttributes, "stereoViewComponents");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  CMStereoViewComponents v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[AVAssetVariantVideoLayoutAttributes stereoViewComponents](self, "stereoViewComponents");
  v7 = CFSTR("Mono");
  if (v6 == 3)
    v7 = CFSTR("Stereo");
  v8 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, stereoView:%@"), v5, self, v7);
  objc_msgSend(v8, "appendFormat:", CFSTR(">"));
  return v8;
}

- (unint64_t)packingType
{
  return -[FigAlternateObjCVideoLayoutAttributes packingType](self->_figVideoLayoutAttributes, "packingType");
}

- (unint64_t)projectionType
{
  return -[FigAlternateObjCVideoLayoutAttributes projectionType](self->_figVideoLayoutAttributes, "projectionType");
}

@end
