@implementation _SFCompressedBarButton

- (_SFCompressedBarButton)initWithFrame:(CGRect)a3
{
  _SFCompressedBarButton *v3;
  UIView *v4;
  UIView *highlightView;
  void *v6;
  void *v7;
  void *v8;
  _SFCompressedBarButton *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_SFCompressedBarButton;
  v3 = -[_SFCompressedBarButton initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    highlightView = v3->_highlightView;
    v3->_highlightView = v4;

    -[UIView setAlpha:](v3->_highlightView, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_highlightView, "setBackgroundColor:", v6);

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E98]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](v3->_highlightView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCompositingFilter:", v7);

    -[_SFCompressedBarButton addSubview:](v3, "addSubview:", v3->_highlightView);
    v9 = v3;
  }

  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  _QWORD v6[5];
  BOOL v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_SFCompressedBarButton;
  -[_SFCompressedBarButton setHighlighted:](&v8, sel_setHighlighted_);
  v5 = 0.2;
  if (!v3)
    v5 = 0.5;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41___SFCompressedBarButton_setHighlighted___block_invoke;
  v6[3] = &unk_1E21E2B38;
  v6[4] = self;
  v7 = v3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 50659332, v6, 0, v5, 0.0);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SFCompressedBarButton;
  -[_SFCompressedBarButton layoutSubviews](&v3, sel_layoutSubviews);
  -[_SFCompressedBarButton bounds](self, "bounds");
  -[UIView setFrame:](self->_highlightView, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightView, 0);
}

@end
