@implementation NTKCSeparatorView

- (NTKCSeparatorView)init
{
  double v3;
  NTKCSeparatorView *v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  objc_msgSend((id)objc_opt_class(), "intrinsicHeight");
  v8.receiver = self;
  v8.super_class = (Class)NTKCSeparatorView;
  v4 = -[NTKCSeparatorView initWithFrame:](&v8, sel_initWithFrame_, 0.0, 0.0, 0.0, v3);
  if (v4)
  {
    NTKCSeparatorColor();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7.receiver = v4;
    v7.super_class = (Class)NTKCSeparatorView;
    -[NTKCSeparatorView setBackgroundColor:](&v7, sel_setBackgroundColor_, v5);

  }
  return v4;
}

+ (double)intrinsicHeight
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = 1.0 / v3;

  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  v2 = *MEMORY[0x1E0DC55F0];
  objc_msgSend((id)objc_opt_class(), "intrinsicHeight");
  v4 = v3;
  v5 = v2;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  -[NTKCSeparatorView setHidden:](self, "setHidden:");
}

- (BOOL)selected
{
  return self->_selected;
}

@end
