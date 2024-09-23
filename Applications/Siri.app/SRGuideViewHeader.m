@implementation SRGuideViewHeader

- (SRGuideViewHeader)initWithFrame:(CGRect)a3
{
  SRGuideViewHeader *v3;
  UIView *v4;
  UIView *contentView;
  uint64_t v6;
  UILabel *headerLabel;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  uint64_t v11;
  double v12;
  id v13;
  void *v14;
  uint64_t v15;
  double v16;
  id v17;
  id v18;
  uint64_t v19;
  UIView *v20;
  UILabel *v21;
  CGAffineTransform v23;
  CGAffineTransform v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SRGuideViewHeader;
  v3 = -[SRGuideViewHeader initWithFrame:](&v25, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    contentView = v3->_contentView;
    v3->_contentView = v4;

    v6 = objc_claimAutoreleasedReturnValue(+[SiriSharedUIContentLabel label](SiriSharedUIContentLabel, "label"));
    headerLabel = v3->_headerLabel;
    v3->_headerLabel = (UILabel *)v6;

    v8 = v3->_headerLabel;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_lightTextColor](UIColor, "siriui_lightTextColor"));
    -[UILabel setTextColor:](v8, "setTextColor:", v9);

    v10 = v3->_headerLabel;
    *(_QWORD *)&v12 = objc_opt_class(v3, v11).n128_u64[0];
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_font", v12));
    -[UILabel setFont:](v10, "setFont:", v14);

    -[UILabel setNumberOfLines:](v3->_headerLabel, "setNumberOfLines:", 0);
    *(_QWORD *)&v16 = objc_opt_class(v3, v15).n128_u64[0];
    objc_msgSend(v17, "_edgeInsets", v16);
    -[SRGuideViewHeader setEdgeInsets:](v3, "setEdgeInsets:");
    -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_headerLabel);
    v18 = -[SRGuideViewHeader addSubview:](v3, "addSubview:", v3->_contentView);
    if (SiriLanguageIsRTL(v18, v19))
    {
      v20 = v3->_contentView;
      CGAffineTransformMakeScale(&v24, -1.0, 1.0);
      -[UIView setTransform:](v20, "setTransform:", &v24);
      v21 = v3->_headerLabel;
      CGAffineTransformMakeScale(&v23, -1.0, 1.0);
      -[UILabel setTransform:](v21, "setTransform:", &v23);
    }
  }
  return v3;
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;

  v24.receiver = self;
  v24.super_class = (Class)SRGuideViewHeader;
  -[SRGuideViewHeader layoutSubviews](&v24, "layoutSubviews");
  -[SRGuideViewHeader bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SRGuideViewHeader edgeInsets](self, "edgeInsets");
  v23 = v11;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", CGRectGetWidth(v25) - v13 - v17, 1.79769313e308);
  v19 = v18;
  v21 = v20;
  if (v15 <= 0.0)
  {
    v22 = v23;
  }
  else
  {
    v26.origin.x = v4;
    v26.origin.y = v6;
    v26.size.width = v8;
    v26.size.height = v10;
    v22 = CGRectGetMaxY(v26) - v21 - v15;
  }
  -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10);
  -[UILabel setFrame:](self->_headerLabel, "setFrame:", v13, v22, v19, v21);
}

+ (double)defaultHeight
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  CGRect v12;

  v2 = SiriUIIsLargePhoneLayout(a1, a2);
  if ((_DWORD)v2)
  {
    v2 = SiriUIIsCompactWidth(v2, v3);
    if (!(_DWORD)v2)
      return 116.0;
  }
  if ((SiriUIIsCompactWidth(v2, v3) & 1) != 0)
    return 157.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "scale");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v8, "bounds");
  v9 = CGRectGetHeight(v12) * 0.11328125 + 57.5;
  v10 = ceil(v9);
  if (v7 < 2.0)
    v4 = v10;
  else
    v4 = v9;

  return v4;
}

+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4 edgeInsets:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  double width;
  id v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  double MaxY;
  double v24;
  double v25;
  NSAttributedStringKey v26;
  void *v27;
  CGSize result;
  CGRect v29;
  CGRect v30;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  width = a3.width;
  v26 = NSFontAttributeName;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_font"));
  v27 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));

  objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", 3, v13, 0, width - left - right, 1.79769313e308);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v29.origin.x = v15;
  v29.origin.y = v17;
  v29.size.width = v19;
  v29.size.height = v21;
  v22 = CGRectGetWidth(v29);
  v30.origin.x = v15;
  v30.origin.y = v17;
  v30.size.width = v19;
  v30.size.height = v21;
  MaxY = CGRectGetMaxY(v30);

  v24 = bottom + top + MaxY;
  v25 = v22;
  result.height = v24;
  result.width = v25;
  return result;
}

+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  objc_msgSend(a1, "_edgeInsets");
  objc_msgSend(a1, "sizeThatFits:text:edgeInsets:", v7, width, height, v8, v9, v10, v11);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

+ (double)firstLineBaselineOffsetFromTop
{
  double v2;
  id v3;
  void *v4;
  double v5;
  double v6;

  *(_QWORD *)&v2 = objc_opt_class(a1, a2).n128_u64[0];
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_font", v2));
  objc_msgSend(v4, "ascender");
  v6 = v5;

  return v6;
}

- (void)setTitle:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    -[UILabel setText:](self->_headerLabel, "setText:", v5);
  }

}

+ (id)reuseIdentifier
{
  Class v2;
  NSString *v3;
  void *v4;
  void *v5;

  objc_opt_class(a1, a2);
  v3 = NSStringFromClass(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("ReuseIdentifier")));

  return v5;
}

+ (id)elementKind
{
  return UICollectionElementKindSectionHeader;
}

+ (UIEdgeInsets)_edgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if ((SiriUIIsCompactWidth(a1, a2) & 1) != 0)
  {
    v2 = 21.5;
  }
  else if (SiriUIIsLargePhoneLayout())
  {
    v2 = 21.5;
  }
  else
  {
    v2 = 45.5;
  }
  v3 = 36.0;
  v4 = 0.0;
  v5 = 24.0;
  result.right = v3;
  result.bottom = v2;
  result.left = v5;
  result.top = v4;
  return result;
}

+ (id)_font
{
  return +[UIFont siriui_dynamicTitle0Font](UIFont, "siriui_dynamicTitle0Font");
}

- (NSString)title
{
  return self->_title;
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
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
