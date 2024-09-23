@implementation CUIPSDLayer

- (CUIPSDLayer)init
{
  CUIPSDLayer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayer;
  result = -[CUIPSDLayer init](&v3, sel_init);
  if (result)
  {
    result->_opacity = 1.0;
    result->_blendMode = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayer;
  -[CUIPSDLayer dealloc](&v3, sel_dealloc);
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
