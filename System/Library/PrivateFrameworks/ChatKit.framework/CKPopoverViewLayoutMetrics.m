@implementation CKPopoverViewLayoutMetrics

- (CKPopoverViewLayoutMetrics)initWithState:(unint64_t)a3 frame:(CGRect)a4 coordinateSpace:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  CKPopoverViewLayoutMetrics *v13;
  CKPopoverViewLayoutMetrics *v14;
  objc_super v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CKPopoverViewLayoutMetrics;
  v13 = -[CKPopoverViewLayoutMetrics init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_state = a3;
    v13->_frame.origin.x = x;
    v13->_frame.origin.y = y;
    v13->_frame.size.width = width;
    v13->_frame.size.height = height;
    objc_storeStrong((id *)&v13->_coordinateSpace, a5);
  }

  return v14;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
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

- (UICoordinateSpace)coordinateSpace
{
  return self->_coordinateSpace;
}

- (void)setCoordinateSpace:(id)a3
{
  objc_storeStrong((id *)&self->_coordinateSpace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinateSpace, 0);
}

@end
