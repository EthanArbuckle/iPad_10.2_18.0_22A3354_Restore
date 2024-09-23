@implementation CKDetailsBusinessInfoHeaderFooterView

+ (id)reuseIdentifier
{
  return CFSTR("CKDetailsBusinessInfoHeaderFooterView_reuseIdentifier");
}

- (CKDetailsBusinessInfoHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  CKDetailsBusinessInfoHeaderFooterView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKDetailsBusinessInfoHeaderFooterView;
  v3 = -[CKDetailsBusinessInfoHeaderFooterView initWithReuseIdentifier:](&v9, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    if (CKIsRunningInMacCatalyst())
    {
      objc_msgSend(MEMORY[0x1E0CEA370], "clearConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsBusinessInfoHeaderFooterView setBackgroundConfiguration:](v3, "setBackgroundConfiguration:", v4);
    }
    else
    {
      -[CKDetailsBusinessInfoHeaderFooterView contentView](v3, "contentView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "theme");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "detailsHeaderFooterContentViewBackgroundColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setBackgroundColor:", v7);

    }
  }
  return v3;
}

- (void)setBusinessInfoView:(id)a3
{
  CKBusinessInfoView *v5;
  void *v6;
  CKBusinessInfoView *v7;

  v5 = (CKBusinessInfoView *)a3;
  if (self->_businessInfoView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_businessInfoView, a3);
    -[CKDetailsBusinessInfoHeaderFooterView contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_businessInfoView);

    -[CKDetailsBusinessInfoHeaderFooterView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CKDetailsBusinessInfoHeaderFooterView;
  -[CKDetailsBusinessInfoHeaderFooterView layoutSubviews](&v14, sel_layoutSubviews);
  -[CKDetailsBusinessInfoHeaderFooterView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CKDetailsBusinessInfoHeaderFooterView businessInfoView](self, "businessInfoView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[CKDetailsBusinessInfoHeaderFooterView businessInfoView](self, "businessInfoView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNeedsLayout");

}

- (CKBusinessInfoView)businessInfoView
{
  return self->_businessInfoView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessInfoView, 0);
}

@end
