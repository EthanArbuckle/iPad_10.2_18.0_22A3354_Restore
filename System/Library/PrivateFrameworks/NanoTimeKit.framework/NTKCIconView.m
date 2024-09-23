@implementation NTKCIconView

+ (double)size
{
  if (size_onceToken != -1)
    dispatch_once(&size_onceToken, &__block_literal_global_44);
  return *(double *)&size_size;
}

uint64_t __20__NTKCIconView_size__block_invoke()
{
  uint64_t result;
  double v1;

  result = NTKCScreenStyle();
  v1 = 26.6666667;
  if (result != 1)
    v1 = 24.0;
  size_size = *(_QWORD *)&v1;
  return result;
}

- (NTKCIconView)initWithFrame:(CGRect)a3
{
  double y;
  double x;
  double v6;
  NTKCIconView *v7;
  objc_super v9;

  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend((id)objc_opt_class(), "size");
  v9.receiver = self;
  v9.super_class = (Class)NTKCIconView;
  v7 = -[NTKCIconView initWithFrame:](&v9, sel_initWithFrame_, x, y, v6, v6);
  -[NTKCIconView setClipsToBounds:](v7, "setClipsToBounds:", 1);
  return v7;
}

- (NTKCIconView)initWithImage:(id)a3
{
  NTKCIconView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKCIconView;
  v3 = -[NTKCIconView initWithImage:](&v5, sel_initWithImage_, a3);
  -[NTKCIconView setClipsToBounds:](v3, "setClipsToBounds:", 1);
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "size");
  v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKCIconView;
  -[NTKCIconView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[NTKCIconView _resizeCornerRadius](self, "_resizeCornerRadius");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKCIconView;
  -[NTKCIconView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[NTKCIconView _resizeCornerRadius](self, "_resizeCornerRadius");
}

- (void)_resizeCornerRadius
{
  double v3;
  double v4;
  id v5;
  CGRect v6;

  -[NTKCIconView bounds](self, "bounds");
  CGRectGetWidth(v6);
  UIFloorToViewScale();
  v4 = v3;
  -[NTKCIconView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

}

@end
