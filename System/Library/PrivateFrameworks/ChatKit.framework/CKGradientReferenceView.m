@implementation CKGradientReferenceView

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKGradientReferenceView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)CKGradientReferenceView;
  -[CKGradientReferenceView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height)
    -[UIView setGradientViewsNeedLayout](self, "setGradientViewsNeedLayout");
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKGradientReferenceView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)CKGradientReferenceView;
  -[CKGradientReferenceView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height)
    -[UIView setGradientViewsNeedLayout](self, "setGradientViewsNeedLayout");
}

- (void)setGradientFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_gradientFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_gradientFrame = &self->_gradientFrame;
  if (!CGRectEqualToRect(self->_gradientFrame, a3))
  {
    p_gradientFrame->origin.x = x;
    p_gradientFrame->origin.y = y;
    p_gradientFrame->size.width = width;
    p_gradientFrame->size.height = height;
    -[UIView setGradientViewsNeedLayout](self, "setGradientViewsNeedLayout");
  }
}

- (CGRect)gradientFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_gradientFrame.origin.x;
  y = self->_gradientFrame.origin.y;
  width = self->_gradientFrame.size.width;
  height = self->_gradientFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
