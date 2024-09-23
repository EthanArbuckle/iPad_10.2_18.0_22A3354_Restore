@implementation SCNCoreAnimationSource

- (id)textureSource
{
  SCNTextureCoreAnimationSource *v3;

  v3 = objc_alloc_init(SCNTextureCoreAnimationSource);
  -[SCNTextureCoreAnimationSource setLayer:](v3, "setLayer:", -[SCNCoreAnimationSource layer](self, "layer"));
  return v3;
}

- (BOOL)isOpaque
{
  return -[CALayer isOpaque](-[SCNCoreAnimationSource layer](self, "layer"), "isOpaque");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNCoreAnimationSource;
  -[SCNCoreAnimationSource dealloc](&v3, sel_dealloc);
}

- (void)setLayer:(id)a3
{
  CALayer *layer;

  layer = self->_layer;
  if (layer != a3)
  {

    self->_layer = (CALayer *)a3;
  }
}

- (CALayer)layer
{
  return self->_layer;
}

@end
