@implementation CKDetailsLocationShareHeaderFooterView

+ (id)reuseIdentifier
{
  return CFSTR("CKDetailsLocationShareHeaderFooterView_reuseIdentifier");
}

- (void)setLocationSharingTextView:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (self->_locationSharingTextView)
  {
    -[CKDetailsLocationShareHeaderFooterView locationSharingTextView](self, "locationSharingTextView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

  }
  objc_storeStrong((id *)&self->_locationSharingTextView, a3);
  -[CKDetailsLocationShareHeaderFooterView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_locationSharingTextView);

  -[CKDetailsLocationShareHeaderFooterView setNeedsLayout](self, "setNeedsLayout");
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
  CGRect rect;
  CGRect v31;
  CGRect v32;

  *(_QWORD *)&rect.origin.y = self;
  *(_QWORD *)&rect.size.width = CKDetailsLocationShareHeaderFooterView;
  -[CGFloat layoutSubviews]((objc_super *)&rect.origin.y, sel_layoutSubviews);
  -[CKDetailsLocationShareHeaderFooterView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detailsHeaderFooterContentViewBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v6);

  -[CKDetailsLocationShareHeaderFooterView backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "theme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "detailsHeaderFooterContentViewBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v10);

  -[CKDetailsLocationShareHeaderFooterView contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[CKDetailsLocationShareHeaderFooterView locationSharingTextView](self, "locationSharingTextView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsLocationShareHeaderFooterView contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layoutMargins");
  v23 = v22;
  v25 = v24;

  v31.origin.x = v13;
  v31.origin.y = v15;
  v31.size.width = v17;
  v31.size.height = v19;
  objc_msgSend(v20, "sizeThatFits:", CGRectGetWidth(v31) - (v23 + v25), 1.79769313e308);
  v27 = v26;
  v29 = v28;
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection"))
  {
    v32.origin.x = v13;
    v32.origin.y = v15;
    v32.size.width = v17;
    v32.size.height = v19;
    v27 = CGRectGetWidth(v32) - (v23 + v25);
    v23 = v25;
  }
  objc_msgSend(v20, "setFrame:", v23, 8.0, v27, v29);

}

- (UITextView)locationSharingTextView
{
  return self->_locationSharingTextView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationSharingTextView, 0);
}

@end
