@implementation CUIKViewEntityAnnotation

- (CUIKViewEntityAnnotation)initWithEvent:(id)a3 rect:(CGRect)a4 state:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  CUIKViewEntityAnnotation *v13;
  CUIKViewEntityAnnotation *v14;
  objc_super v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CUIKViewEntityAnnotation;
  v13 = -[CUIKViewEntityAnnotation init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_event, a3);
    v14->_rect.origin.x = x;
    v14->_rect.origin.y = y;
    v14->_rect.size.width = width;
    v14->_rect.size.height = height;
    v14->_state = a5;
  }

  return v14;
}

- (EKEvent)event
{
  return self->_event;
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

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

@end
