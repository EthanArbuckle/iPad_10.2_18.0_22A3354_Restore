@implementation CUIRenditionLayerReference

- (CUIRenditionLayerReference)init
{
  CUIRenditionLayerReference *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIRenditionLayerReference;
  result = -[CUIRenditionLayerReference init](&v3, sel_init);
  result->_opacity = 1.0;
  result->_blendMode = 0;
  *(_WORD *)&result->_fixedFrame = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIRenditionLayerReference;
  -[CUIRenditionLayerReference dealloc](&v3, sel_dealloc);
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (NSString)layerName
{
  return self->_layerName;
}

- (void)setLayerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
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

- (CUIRenditionKey)referenceKey
{
  return self->_referenceKey;
}

- (void)setReferenceKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)fixedFrame
{
  return self->_fixedFrame;
}

- (void)setFixedFrame:(BOOL)a3
{
  self->_fixedFrame = a3;
}

- (BOOL)makeOpaqueIfPossible
{
  return self->_makeOpaqueIfPossible;
}

- (void)setMakeOpaqueIfPossible:(BOOL)a3
{
  self->_makeOpaqueIfPossible = a3;
}

@end
