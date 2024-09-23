@implementation BWDockKitFocusDetection

- (BWDockKitFocusDetection)initWithIdentifier:(int64_t)a3 rect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  BWDockKitFocusDetection *result;
  objc_super v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)BWDockKitFocusDetection;
  result = -[BWDockKitFocusDetection init](&v10, sel_init);
  if (result)
  {
    result->_identifier = a3;
    result->_rect.origin.x = x;
    result->_rect.origin.y = y;
    result->_rect.size.width = width;
    result->_rect.size.height = height;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  int64_t v5;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[BWDockKitFocusDetection identifier](self, "identifier");
  -[BWDockKitFocusDetection rect](self, "rect");
  return (id)objc_msgSend(v4, "initWithIdentifier:rect:", v5);
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

@end
