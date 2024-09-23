@implementation AXScribbleElement

- (AXScribbleElement)initWithText:(id)a3 geometry:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  AXScribbleElement *v11;
  AXScribbleElement *v12;
  objc_super v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXScribbleElement;
  v11 = -[AXScribbleElement init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_renderedText, a3);
    v12->_geometry.origin.x = x;
    v12->_geometry.origin.y = y;
    v12->_geometry.size.width = width;
    v12->_geometry.size.height = height;
  }

  return v12;
}

- (NSString)renderedText
{
  return self->_renderedText;
}

- (void)setRenderedText:(id)a3
{
  objc_storeStrong((id *)&self->_renderedText, a3);
}

- (CGRect)geometry
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_geometry.origin.x;
  y = self->_geometry.origin.y;
  width = self->_geometry.size.width;
  height = self->_geometry.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setGeometry:(CGRect)a3
{
  self->_geometry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderedText, 0);
}

@end
