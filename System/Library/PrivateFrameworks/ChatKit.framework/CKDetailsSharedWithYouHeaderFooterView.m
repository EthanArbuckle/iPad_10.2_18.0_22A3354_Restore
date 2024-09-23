@implementation CKDetailsSharedWithYouHeaderFooterView

+ (id)reuseIdentifier
{
  return CFSTR("CKDetailsSharedWithYouHeaderFooterView_reuseIdentifier");
}

- (void)setSharedWithYouTextView:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  if (!self->_sharedWithYouTextView)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_sharedWithYouTextView, a3);
    -[CKDetailsSharedWithYouHeaderFooterView contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_sharedWithYouTextView);

    -[CKDetailsSharedWithYouHeaderFooterView setNeedsLayout](self, "setNeedsLayout");
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
  CGFloat v28;
  double v29;
  double v30;
  CGRect rect;
  CGRect v32;
  CGRect v33;

  *(_QWORD *)&rect.size.width = self;
  *(_QWORD *)&rect.size.height = CKDetailsSharedWithYouHeaderFooterView;
  -[CGSize layoutSubviews]((objc_super *)&rect.size, sel_layoutSubviews);
  -[CKDetailsSharedWithYouHeaderFooterView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detailsHeaderFooterContentViewBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v6);

  -[CKDetailsSharedWithYouHeaderFooterView backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "theme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "detailsHeaderFooterContentViewBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v10);

  -[CKDetailsSharedWithYouHeaderFooterView contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[CKDetailsSharedWithYouHeaderFooterView sharedWithYouTextView](self, "sharedWithYouTextView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsSharedWithYouHeaderFooterView contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layoutMargins");
  v23 = v22;
  v25 = v24;

  v32.origin.x = v13;
  v32.origin.y = v15;
  v32.size.width = v17;
  v32.size.height = v19;
  objc_msgSend(v20, "sizeThatFits:", CGRectGetWidth(v32) - (v23 + v25), 1.79769313e308);
  v27 = v26;
  rect.origin.y = v28;
  objc_msgSend((id)objc_opt_class(), "topPadding");
  v30 = v29;
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection"))
  {
    v33.origin.x = v13;
    v33.origin.y = v15;
    v33.size.width = v17;
    v33.size.height = v19;
    v27 = CGRectGetWidth(v33) - (v23 + v25);
    v23 = v25;
  }
  objc_msgSend(v20, "setFrame:", v23, v30, v27, rect.origin.y, *(_QWORD *)&v13);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CKDetailsSharedWithYouHeaderFooterView sharedWithYouTextView](self, "sharedWithYouTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  objc_msgSend((id)objc_opt_class(), "topPadding");
  v11 = v10;
  objc_msgSend((id)objc_opt_class(), "bottomPadding");
  v13 = v9 + v11 + v12;
  v14 = v7;
  result.height = v13;
  result.width = v14;
  return result;
}

+ (double)topPadding
{
  return 8.0;
}

+ (double)bottomPadding
{
  void *v2;
  double v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isAccessibilityPreferredContentSizeCategory"))
    v3 = 16.0;
  else
    v3 = 8.0;

  return v3;
}

- (UITextView)sharedWithYouTextView
{
  return self->_sharedWithYouTextView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedWithYouTextView, 0);
}

@end
