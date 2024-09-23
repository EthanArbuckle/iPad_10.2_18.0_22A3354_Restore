@implementation CKWalletItemSearchResultsCell

+ (id)reuseIdentifier
{
  return CFSTR("PassSearchCell");
}

- (double)editModeHorizontalOffset
{
  return 7.0;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKWalletItemSearchResultsCell;
  -[CKAttachmentSearchResultCell layoutSubviews](&v17, sel_layoutSubviews);
  -[CKEditableSearchResultCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setBorderColor:", 0);
  objc_msgSend(v4, "setBorderWidth:", 0.0);
  objc_msgSend(v4, "setCornerRadius:", 0.0);
  -[CKAttachmentSearchResultCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[CKAttachmentSearchResultCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;

  -[CKAttachmentSearchResultCell dateLabel](self, "dateLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[CKAttachmentSearchResultCell dateLabel](self, "dateLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v11, v8, v13, v15);

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  double x;
  double y;
  double width;
  CGFloat height;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  CGRect v15;
  CGRect v16;

  v4 = a3;
  objc_msgSend(v4, "frame");
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  v9 = CGRectGetWidth(v15);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v10 = CGRectGetWidth(v16);
  -[CKAttachmentSearchResultCell dateLabel](self, "dateLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", v9, 1.79769313e308);
  v13 = v12;

  objc_msgSend(v4, "setFrame:", x, y, width, v10 + v13 + 4.0);
  return v4;
}

- (CGPoint)avatarOffsetLTR
{
  double v2;
  double v3;
  CGPoint result;

  v2 = -8.0;
  v3 = 6.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)avatarOffsetRTL
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 8.0;
  v3 = 6.0;
  result.y = v3;
  result.x = v2;
  return result;
}

@end
