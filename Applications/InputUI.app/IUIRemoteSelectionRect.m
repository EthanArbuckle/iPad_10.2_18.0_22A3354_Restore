@implementation IUIRemoteSelectionRect

- (IUIRemoteSelectionRect)initWithCGRect:(CGRect)a3 isVertical:(BOOL)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  IUIRemoteSelectionRect *result;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)IUIRemoteSelectionRect;
  result = -[IUIRemoteSelectionRect init](&v10, "init");
  if (result)
  {
    result->_rect.origin.x = x;
    result->_rect.origin.y = y;
    result->_rect.size.width = width;
    result->_rect.size.height = height;
    result->_isVertical = a4;
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

- (BOOL)isVertical
{
  return self->_isVertical;
}

+ (id)rectWithCGRect:(CGRect)a3 isVertical:(BOOL)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCGRect:isVertical:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end
