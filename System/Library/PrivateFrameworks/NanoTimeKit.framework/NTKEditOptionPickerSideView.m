@implementation NTKEditOptionPickerSideView

- (NTKEditOptionPickerSideView)initWithFrame:(CGRect)a3
{
  char *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKEditOptionPickerSideView;
  v3 = -[NTKEditOptionPickerSideView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v4);

    v5 = MEMORY[0x1E0C9BAA8];
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)(v3 + 424) = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)(v3 + 440) = v6;
    *(_OWORD *)(v3 + 456) = *(_OWORD *)(v5 + 32);
    *((_QWORD *)v3 + 52) = 0x3FF0000000000000;
  }
  return (NTKEditOptionPickerSideView *)v3;
}

- (void)setOptionView:(id)a3
{
  UIView *v5;
  UIView **p_optionView;
  UIView *optionView;
  NTKEditOptionPickerSideView *v8;
  UIView *v9;
  __int128 v10;
  _OWORD v11[3];

  v5 = (UIView *)a3;
  p_optionView = &self->_optionView;
  optionView = self->_optionView;
  if (optionView != v5)
  {
    -[UIView superview](optionView, "superview");
    v8 = (NTKEditOptionPickerSideView *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[UIView removeFromSuperview](*p_optionView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_optionView, a3);
    if (*p_optionView)
    {
      -[NTKEditOptionPickerSideView addSubview:](self, "addSubview:");
      v9 = *p_optionView;
      v10 = *(_OWORD *)&self->_contentTransform.c;
      v11[0] = *(_OWORD *)&self->_contentTransform.a;
      v11[1] = v10;
      v11[2] = *(_OWORD *)&self->_contentTransform.tx;
      -[UIView setTransform:](v9, "setTransform:", v11);
    }
  }
  -[NTKEditOptionPickerSideView _applyContentAlpha](self, "_applyContentAlpha");

}

- (void)applyContentTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;
  UIView *optionView;
  __int128 v6;
  _OWORD v7[3];

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_contentTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_contentTransform.c = v4;
  *(_OWORD *)&self->_contentTransform.tx = v3;
  optionView = self->_optionView;
  v6 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->tx;
  -[UIView setTransform:](optionView, "setTransform:", v7);
}

- (void)setRotationFromFront:(double)a3
{
  self->_contentAlpha = fmin(fmax(a3 / 1.04719755, 0.0), 1.0) * -0.85 + 1.0;
  -[NTKEditOptionPickerSideView _applyContentAlpha](self, "_applyContentAlpha");
}

- (void)_applyContentAlpha
{
  -[UIView setAlpha:](self->_optionView, "setAlpha:", self->_contentAlpha);
}

- (UIView)optionView
{
  return self->_optionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionView, 0);
}

@end
