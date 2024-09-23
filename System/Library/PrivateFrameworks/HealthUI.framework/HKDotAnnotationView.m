@implementation HKDotAnnotationView

- (HKDotAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  HKDotAnnotationView *v4;
  HKDotAnnotationView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKDotAnnotationView;
  v4 = -[MKAnnotationView initWithAnnotation:reuseIdentifier:](&v7, sel_initWithAnnotation_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[HKDotAnnotationView setOpaque:](v4, "setOpaque:", 0);
  return v5;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContextRef CurrentContext;
  CGContext *v9;
  void *v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  if (CurrentContext)
  {
    v9 = CurrentContext;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFill");

    v11.origin.x = x;
    v11.origin.y = y;
    v11.size.width = width;
    v11.size.height = height;
    CGContextFillEllipseInRect(v9, v11);
    -[UIColor setFill](self->_dotColor, "setFill");
    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    v13 = CGRectInset(v12, 4.0, 4.0);
    CGContextFillEllipseInRect(v9, v13);
  }
}

- (UIColor)dotColor
{
  return self->_dotColor;
}

- (void)setDotColor:(id)a3
{
  objc_storeStrong((id *)&self->_dotColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dotColor, 0);
}

@end
