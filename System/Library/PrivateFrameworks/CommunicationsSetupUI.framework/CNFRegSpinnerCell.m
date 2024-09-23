@implementation CNFRegSpinnerCell

- (CNFRegSpinnerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNFRegSpinnerCell *v4;
  uint64_t v5;
  UIActivityIndicatorView *activityIndicator;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNFRegSpinnerCell;
  v4 = -[CNFRegSpinnerCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 2);
    activityIndicator = v4->_activityIndicator;
    v4->_activityIndicator = (UIActivityIndicatorView *)v5;

    -[UIActivityIndicatorView startAnimating](v4->_activityIndicator, "startAnimating");
    -[CNFRegSpinnerCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4->_activityIndicator);

    -[CNFRegSpinnerCell setNeedsLayout](v4, "setNeedsLayout");
  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double MidX;
  CGFloat v21;
  double MidY;
  CGRect rect;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  *(_QWORD *)&rect.origin.y = self;
  *(_QWORD *)&rect.size.width = CNFRegSpinnerCell;
  -[CGFloat layoutSubviews]((objc_super *)&rect.origin.y, sel_layoutSubviews);
  -[CNFRegSpinnerCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  rect.origin.x = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIActivityIndicatorView frame](self->_activityIndicator, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  MidX = CGRectGetMidX(v24);
  v25.origin.x = v13;
  v25.origin.y = v15;
  v25.size.width = v17;
  v25.size.height = v19;
  v21 = MidX - CGRectGetWidth(v25) * 0.5;
  v26.origin.x = rect.origin.x;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  MidY = CGRectGetMidY(v26);
  v27.origin.x = v21;
  v27.origin.y = v15;
  v27.size.width = v17;
  v27.size.height = v19;
  -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", v21, MidY - CGRectGetHeight(v27) * 0.5, v17, v19);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
