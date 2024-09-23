@implementation BPSCheckMarkView

- (BPSCheckMarkView)initWithFrame:(CGRect)a3
{
  BPSCheckMarkView *v3;
  id v4;
  void *v5;
  uint64_t v6;
  UIImageView *imageView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BPSCheckMarkView;
  v3 = -[BPSCheckMarkView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6AE8]);
    -[BPSCheckMarkView uncheckedImage](v3, "uncheckedImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithImage:", v5);
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v6;

    -[BPSCheckMarkView addSubview:](v3, "addSubview:", v3->_imageView);
  }
  return v3;
}

- (void)layoutSubviews
{
  -[BPSCheckMarkView bounds](self, "bounds");
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 23.0;
  v4 = 23.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setIsChecked:(BOOL)a3
{
  UIImageView *imageView;
  id v4;

  self->_isChecked = a3;
  imageView = self->_imageView;
  if (a3)
    -[BPSCheckMarkView checkedImage](self, "checkedImage");
  else
    -[BPSCheckMarkView uncheckedImage](self, "uncheckedImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](imageView, "setImage:", v4);

}

- (id)checkedImage
{
  CGFloat width;
  CGFloat height;
  CGContext *CurrentContext;
  void *v6;
  void *v7;
  CGPath *Mutable;
  void *v9;
  CGSize v11;
  CGRect v12;

  -[BPSCheckMarkView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  width = v11.width;
  height = v11.height;
  UIGraphicsBeginImageContextWithOptions(v11, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  -[BPSCheckMarkView tintColor](self, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFill");

  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  v12.size.width = width;
  v12.size.height = height;
  CGContextFillEllipseInRect(CurrentContext, v12);
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStroke");

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 6.5, 12.0);
  CGPathAddLineToPoint(Mutable, 0, 9.5, 15.0);
  CGPathAddLineToPoint(Mutable, 0, 16.5, 8.5);
  CGContextSetLineCap(CurrentContext, kCGLineCapRound);
  CGContextSetLineWidth(CurrentContext, 1.5);
  CGContextAddPath(CurrentContext, Mutable);
  CGPathRelease(Mutable);
  CGContextStrokePath(CurrentContext);
  UIGraphicsGetImageFromCurrentImageContext();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v9;
}

- (id)uncheckedImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGContext *CurrentContext;
  void *v10;
  void *v11;
  CGSize v13;
  CGRect v14;

  v3 = *MEMORY[0x24BDBF148];
  v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  -[BPSCheckMarkView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x24BDBF148], v4);
  v6 = v5;
  v8 = v7;
  -[BPSCheckMarkView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  UIGraphicsBeginImageContextWithOptions(v13, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  -[BPSCheckMarkView tintColor](self, "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStroke");

  v14.size.width = v6 + -2.0;
  v14.size.height = v8 + -2.0;
  v14.origin.x = 1.0;
  v14.origin.y = 1.0;
  CGContextStrokeEllipseInRect(CurrentContext, v14);
  UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v11;
}

- (BOOL)isChecked
{
  return self->_isChecked;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
