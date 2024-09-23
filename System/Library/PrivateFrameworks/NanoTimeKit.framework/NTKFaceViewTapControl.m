@implementation NTKFaceViewTapControl

- (BOOL)shouldCancelTouchesInScrollview
{
  return 1;
}

- (NTKFaceViewTapControl)initWithFrame:(CGRect)a3
{
  NTKFaceViewTapControl *v3;
  id v4;
  uint64_t v5;
  UIImageView *highlightImageView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKFaceViewTapControl;
  v3 = -[NTKFaceViewTapControl initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[NTKFaceViewTapControl bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    highlightImageView = v3->_highlightImageView;
    v3->_highlightImageView = (UIImageView *)v5;

    -[UIImageView setHidden:](v3->_highlightImageView, "setHidden:", 1);
    -[UIImageView setAlpha:](v3->_highlightImageView, "setAlpha:", 0.0);
    -[NTKFaceViewTapControl addSubview:](v3, "addSubview:", v3->_highlightImageView);
  }
  return v3;
}

- (void)layoutSubviews
{
  UIImageView *highlightImageView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKFaceViewTapControl;
  -[NTKFaceViewTapControl layoutSubviews](&v4, sel_layoutSubviews);
  highlightImageView = self->_highlightImageView;
  -[NTKFaceViewTapControl bounds](self, "bounds");
  -[UIImageView setFrame:](highlightImageView, "setFrame:");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  double v6;
  _QWORD v7[5];
  BOOL v8;
  _QWORD v9[5];
  BOOL v10;
  objc_super v11;
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKFaceViewTapControl;
  v5 = -[NTKFaceViewTapControl isHighlighted](&v12, sel_isHighlighted);
  v11.receiver = self;
  v11.super_class = (Class)NTKFaceViewTapControl;
  -[NTKFaceViewTapControl setHighlighted:](&v11, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    -[UIImageView setHidden:](self->_highlightImageView, "setHidden:", 0);
    v6 = 0.2;
    if (v3)
      v6 = 0.0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__NTKFaceViewTapControl_setHighlighted___block_invoke;
    v9[3] = &unk_1E6BCF930;
    v9[4] = self;
    v10 = v3;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__NTKFaceViewTapControl_setHighlighted___block_invoke_2;
    v7[3] = &unk_1E6BD4228;
    v7[4] = self;
    v8 = v3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v9, v7, v6);
  }
}

uint64_t __40__NTKFaceViewTapControl_setHighlighted___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", (double)*(unint64_t *)&a2);
}

uint64_t __40__NTKFaceViewTapControl_setHighlighted___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setHidden:", *(_BYTE *)(a1 + 40) == 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIImageView sizeThatFits:](self->_highlightImageView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIImageView)highlightImageView
{
  return self->_highlightImageView;
}

- (void)setHighlightImageView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightImageView, 0);
}

@end
