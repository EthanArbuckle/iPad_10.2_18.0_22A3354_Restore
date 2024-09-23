@implementation WKUITextSelectionRect

+ (id)selectionRectWithCGRect:(CGRect)a3
{
  return -[WKUITextSelectionRect initWithCGRect:]([WKUITextSelectionRect alloc], "initWithCGRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (WKUITextSelectionRect)initWithCGRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  WKUITextSelectionRect *result;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)WKUITextSelectionRect;
  result = -[WKUITextSelectionRect init](&v8, sel_init);
  if (result)
  {
    result->_selectionRect.origin.x = x;
    result->_selectionRect.origin.y = y;
    result->_selectionRect.size.width = width;
    result->_selectionRect.size.height = height;
  }
  return result;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_selectionRect.origin.x;
  y = self->_selectionRect.origin.y;
  width = self->_selectionRect.size.width;
  height = self->_selectionRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
