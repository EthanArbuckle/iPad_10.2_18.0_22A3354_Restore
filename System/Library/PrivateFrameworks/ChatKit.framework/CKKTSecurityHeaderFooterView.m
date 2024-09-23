@implementation CKKTSecurityHeaderFooterView

+ (id)headerReuseIdentifier
{
  return CFSTR("CKDetailsKTSecurityHeaderFooterView_reuseIdentifier_header");
}

+ (id)footerReuseIdentifier
{
  return CFSTR("CKDetailsKTSecurityHeaderFooterView_reuseIdentifier_footer");
}

+ (id)reuseIdentifier
{
  return CFSTR("CKDetailsKTSecurityHeaderFooterView_reuseIdentifier");
}

+ (double)footerVerticalPadding
{
  return 8.0;
}

- (CKKTSecurityHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKKTSecurityHeaderFooterView;
  return -[CKKTSecurityHeaderFooterView initWithReuseIdentifier:](&v4, sel_initWithReuseIdentifier_, a3);
}

- (void)setKtSecurityTextView:(id)a3
{
  UITextView *v5;
  UITextView **p_ktSecurityTextView;
  UITextView *ktSecurityTextView;
  UITextView *v8;
  void *v9;
  UITextView *v10;

  v5 = (UITextView *)a3;
  p_ktSecurityTextView = &self->_ktSecurityTextView;
  ktSecurityTextView = self->_ktSecurityTextView;
  if (ktSecurityTextView != v5)
  {
    v10 = v5;
    if (!ktSecurityTextView
      || (-[UITextView removeFromSuperview](ktSecurityTextView, "removeFromSuperview"),
          v8 = *p_ktSecurityTextView,
          *p_ktSecurityTextView = 0,
          v8,
          v5 = v10,
          !*p_ktSecurityTextView))
    {
      objc_storeStrong((id *)&self->_ktSecurityTextView, a3);
      -[CKKTSecurityHeaderFooterView contentView](self, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", *p_ktSecurityTextView);
      -[CKKTSecurityHeaderFooterView setNeedsLayout](self, "setNeedsLayout");

      v5 = v10;
    }
  }

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  double v21;
  CGFloat v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;

  v23.receiver = self;
  v23.super_class = (Class)CKKTSecurityHeaderFooterView;
  -[CKKTSecurityHeaderFooterView layoutSubviews](&v23, sel_layoutSubviews);
  -[CKKTSecurityHeaderFooterView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detailsHeaderFooterContentViewBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v6);

  -[CKKTSecurityHeaderFooterView backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "theme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "detailsHeaderFooterContentViewBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v10);

  -[CKKTSecurityHeaderFooterView contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[CKKTSecurityHeaderFooterView ktSecurityTextView](self, "ktSecurityTextView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKKTSecurityHeaderFooterView footerVerticalPadding](CKKTSecurityHeaderFooterView, "footerVerticalPadding");
  v22 = v21;
  v24.origin.x = v13;
  v24.origin.y = v15;
  v24.size.width = v17;
  v24.size.height = v19;
  v25 = CGRectInset(v24, 0.0, v22);
  objc_msgSend(v20, "setFrame:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);

}

- (UITextView)ktSecurityTextView
{
  return self->_ktSecurityTextView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ktSecurityTextView, 0);
}

@end
