@implementation MFMessageContentProgressLayer

- (MFMessageContentProgressLayer)initWithFrame:(CGRect)a3
{
  MFMessageContentProgressLayer *v3;
  void *v4;
  uint64_t v5;
  UIActivityIndicatorView *progressIndicator;
  UILabel *v7;
  UILabel *loadingText;
  UILabel *v9;
  void *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  __int128 v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MFMessageContentProgressLayer;
  v3 = -[MFMessageContentProgressLayer initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageContentProgressLayer setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    progressIndicator = v3->_progressIndicator;
    v3->_progressIndicator = (UIActivityIndicatorView *)v5;

    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    loadingText = v3->_loadingText;
    v3->_loadingText = v7;

    v9 = v3->_loadingText;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("LOADING"), &stru_1E5A6A588, CFSTR("Main"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v9, "setText:", v11);

    v12 = v3->_loadingText;
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    -[UILabel sizeToFit](v3->_loadingText, "sizeToFit");
    v14 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)&v3->_edgeInsets.top = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)&v3->_edgeInsets.bottom = v14;
    -[MFMessageContentProgressLayer addSubview:](v3, "addSubview:", v3->_progressIndicator);
    -[UIActivityIndicatorView startAnimating](v3->_progressIndicator, "startAnimating");
    -[MFMessageContentProgressLayer addSubview:](v3, "addSubview:", v3->_loadingText);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[UIActivityIndicatorView stopAnimating](self->_progressIndicator, "stopAnimating");
  v3.receiver = self;
  v3.super_class = (Class)MFMessageContentProgressLayer;
  -[MFMessageContentProgressLayer dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;

  -[MFMessageContentProgressLayer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIActivityIndicatorView frame](self->_progressIndicator, "frame");
  v8 = v7;
  v10 = v9;
  -[UILabel frame](self->_loadingText, "frame");
  v12 = round(self->_edgeInsets.left * 0.5) + round((v4 - (v8 + 5.0 + v11)) * 0.5);
  v14 = round((v6 - v13) * 0.5) + round((self->_edgeInsets.top + self->_edgeInsets.bottom) * 0.5);
  -[UIActivityIndicatorView setFrame:](self->_progressIndicator, "setFrame:", v12, v14, v8, v10);
  -[UILabel frame](self->_loadingText, "frame");
  v16 = v15;
  v18 = v17;
  v19.origin.x = v12;
  v19.origin.y = v14;
  v19.size.width = v8;
  v19.size.height = v10;
  -[UILabel setFrame:](self->_loadingText, "setFrame:", CGRectGetMaxX(v19) + 5.0, v14 + round((v10 - v18) * 0.5), v16, v18);
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingText, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);
}

@end
