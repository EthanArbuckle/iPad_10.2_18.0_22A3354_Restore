@implementation TDAbstractLayerReference

- (void)setPrimitiveFrameRect:(CGRect)a3
{
  self->_frameRect = a3;
}

- (CGRect)primitiveFrameRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frameRect.origin.x;
  y = self->_frameRect.origin.y;
  width = self->_frameRect.size.width;
  height = self->_frameRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrameRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TDAbstractLayerReference willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("frameRect"));
  self->_frameRect.origin.x = x;
  self->_frameRect.origin.y = y;
  self->_frameRect.size.width = width;
  self->_frameRect.size.height = height;
  -[TDAbstractLayerReference didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("frameRect"));
  -[TDAbstractLayerReference setFrameRectString:](self, "setFrameRectString:", NSStringFromRect(self->_frameRect));
}

- (CGRect)frameRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[TDAbstractLayerReference willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("frameRect"));
  -[TDAbstractLayerReference primitiveFrameRect](self, "primitiveFrameRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TDAbstractLayerReference didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("frameRect"));
  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)awakeFromFetch
{
  objc_super v3;
  NSRect v4;

  v3.receiver = self;
  v3.super_class = (Class)TDAbstractLayerReference;
  -[TDAbstractLayerReference awakeFromFetch](&v3, sel_awakeFromFetch);
  v4 = NSRectFromString((NSString *)-[TDAbstractLayerReference frameRectString](self, "frameRectString"));
  -[TDAbstractLayerReference setPrimitiveFrameRect:](self, "setPrimitiveFrameRect:", v4.origin.x, v4.origin.y, v4.size.width, v4.size.height);
}

@end
