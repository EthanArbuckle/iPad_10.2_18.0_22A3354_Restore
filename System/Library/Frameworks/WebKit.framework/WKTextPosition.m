@implementation WKTextPosition

+ (id)textPositionWithRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  WKTextPosition *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = objc_alloc_init(WKTextPosition);
  -[WKTextPosition setPositionRect:](v7, "setPositionRect:", x, y, width, height);
  return (id)(id)CFMakeCollectable(v7);
}

- (BOOL)isEqual:(id)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGRect v18;
  CGRect v19;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  -[WKTextPosition positionRect](self, "positionRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(a3, "positionRect");
  v19.origin.x = v13;
  v19.origin.y = v14;
  v19.size.width = v15;
  v19.size.height = v16;
  v18.origin.x = v6;
  v18.origin.y = v8;
  v18.size.width = v10;
  v18.size.height = v12;
  return CGRectEqualToRect(v18, v19);
}

- (id)description
{
  void *v3;
  CGRect v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WKTextPosition positionRect](self, "positionRect");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<WKTextPosition: %p, {%@}>"), self, NSStringFromCGRect(v5));
}

- (CGRect)positionRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_positionRect.origin.x;
  y = self->_positionRect.origin.y;
  width = self->_positionRect.size.width;
  height = self->_positionRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPositionRect:(CGRect)a3
{
  self->_positionRect = a3;
}

- (OptionSet<WebKit::TextPositionAnchor>)anchors
{
  return self->_anchors;
}

- (void)setAnchors:(OptionSet<WebKit::TextPositionAnchor>)a3
{
  self->_anchors = a3;
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  return self;
}

@end
