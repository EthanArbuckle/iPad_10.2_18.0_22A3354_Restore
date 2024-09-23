@implementation ITKAutoFadeOutLayer

- (void)setPosition:(CGPoint)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ITKAutoFadeOutLayer;
  -[ITKAutoFadeOutLayer setPosition:](&v5, sel_setPosition_, a3.x, a3.y);
  -[ITKAutoFadeOutLayer superlayer](self, "superlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsDisplay");

}

@end
