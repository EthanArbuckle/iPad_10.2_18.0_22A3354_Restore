@implementation CKDetailsExpanseActivityHeaderView

+ (id)reuseIdentifier
{
  return CFSTR("CKDetailsExpanseActivityHeaderView_reuseIdentifier");
}

- (void)setExpanseActivityTextView:(id)a3
{
  UITextView *v5;
  void *v6;
  UITextView *v7;

  v5 = (UITextView *)a3;
  if (self->_expanseActivityTextView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_expanseActivityTextView, a3);
    -[CKDetailsExpanseActivityHeaderView contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_expanseActivityTextView);

    -[CKDetailsExpanseActivityHeaderView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
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
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  objc_super v36;
  CGRect v37;
  CGRect v38;

  v36.receiver = self;
  v36.super_class = (Class)CKDetailsExpanseActivityHeaderView;
  -[CKDetailsExpanseActivityHeaderView layoutSubviews](&v36, sel_layoutSubviews);
  -[CKDetailsExpanseActivityHeaderView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detailsHeaderFooterContentViewBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v6);

  -[CKDetailsExpanseActivityHeaderView backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "theme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "detailsHeaderFooterContentViewBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v10);

  -[CKDetailsExpanseActivityHeaderView contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[CKDetailsExpanseActivityHeaderView expanseActivityTextView](self, "expanseActivityTextView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[CKDetailsExpanseActivityHeaderView contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layoutMargins");
  v23 = v22;
  v25 = v24;

  v33 = v15;
  v34 = v13;
  v37.origin.x = v13;
  v37.origin.y = v15;
  v37.size.width = v17;
  v37.size.height = v19;
  objc_msgSend(v20, "sizeThatFits:", CGRectGetWidth(v37) - (v23 + v25), 1.79769313e308);
  v27 = v26;
  v29 = v28;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "detailsExpanseActivityDescriptionVerticalPadding");
  v32 = v31;

  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection"))
  {
    v38.origin.y = v33;
    v38.origin.x = v34;
    v38.size.width = v17;
    v38.size.height = v19;
    v27 = CGRectGetWidth(v38) - (v23 + v25);
    v23 = v25;
  }
  objc_msgSend(v20, "setFrame:", v23, v35, v27, v29 + v32);

}

- (UITextView)expanseActivityTextView
{
  return self->_expanseActivityTextView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expanseActivityTextView, 0);
}

@end
