@implementation TDSlice

- (void)setPrimitiveSliceRect:(CGRect)a3
{
  self->_sliceRect = a3;
}

- (CGRect)primitiveSliceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sliceRect.origin.x;
  y = self->_sliceRect.origin.y;
  width = self->_sliceRect.size.width;
  height = self->_sliceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSliceRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TDSlice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("sliceRect"));
  self->_sliceRect.origin.x = x;
  self->_sliceRect.origin.y = y;
  self->_sliceRect.size.width = width;
  self->_sliceRect.size.height = height;
  -[TDSlice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("sliceRect"));
  -[TDSlice setSliceRectString:](self, "setSliceRectString:", NSStringFromRect(self->_sliceRect));
}

- (CGRect)sliceRect
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

  -[TDSlice willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("sliceRect"));
  -[TDSlice primitiveSliceRect](self, "primitiveSliceRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TDSlice didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("sliceRect"));
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
  v3.super_class = (Class)TDSlice;
  -[TDSlice awakeFromFetch](&v3, sel_awakeFromFetch);
  v4 = NSRectFromString((NSString *)-[TDSlice sliceRectString](self, "sliceRectString"));
  -[TDSlice setPrimitiveSliceRect:](self, "setPrimitiveSliceRect:", v4.origin.x, v4.origin.y, v4.size.width, v4.size.height);
}

@end
