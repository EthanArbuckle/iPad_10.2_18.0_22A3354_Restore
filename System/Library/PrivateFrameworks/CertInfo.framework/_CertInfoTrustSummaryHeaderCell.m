@implementation _CertInfoTrustSummaryHeaderCell

- (_CertInfoTrustSummaryHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  _CertInfoTrustSummaryHeaderCell *v4;
  _CertInfoTrustSummaryHeaderCell *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_CertInfoTrustSummaryHeaderCell;
  v4 = -[_CertInfoTrustSummaryHeaderCell initWithStyle:reuseIdentifier:](&v15, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[_CertInfoTrustSummaryHeaderCell imageView](v4, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v9 = v8;

    v10 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageNamed:inBundle:", CFSTR("profile-icon"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_applicationIconImageForFormat:precomposed:scale:", 2, 1, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setImage:", v13);
    objc_msgSend(v6, "sizeToFit");
    -[_CertInfoTrustSummaryHeaderCell setAutoresizesSubviews:](v5, "setAutoresizesSubviews:", 0);

  }
  return v5;
}

- (_CertInfoActionButton)actionButton
{
  _CertInfoActionButton *actionButton;
  _CertInfoActionButton *v4;
  _CertInfoActionButton *v5;
  void *v6;

  actionButton = self->_actionButton;
  if (!actionButton)
  {
    v4 = -[_CertInfoActionButton initWithTitle:isDestructive:]([_CertInfoActionButton alloc], "initWithTitle:isDestructive:", 0, 0);
    v5 = self->_actionButton;
    self->_actionButton = v4;

    -[_CertInfoActionButton setHidden:](self->_actionButton, "setHidden:", 1);
    -[_CertInfoTrustSummaryHeaderCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_actionButton);

    actionButton = self->_actionButton;
  }
  return actionButton;
}

- (void)setTrustTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CertInfoTrustSummaryHeaderCell _titleLabel](self, "_titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(v5, "sizeToFit");
}

- (NSString)trustTitle
{
  void *v2;
  void *v3;

  -[_CertInfoTrustSummaryHeaderCell _titleLabel](self, "_titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTrustSubtitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CertInfoTrustSummaryHeaderCell _subtitleLabel](self, "_subtitleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(v5, "sizeToFit");
}

- (NSString)trustSubtitle
{
  void *v2;
  void *v3;

  -[_CertInfoTrustSummaryHeaderCell _subtitleLabel](self, "_subtitleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setExpired:(BOOL)a3
{
  void *v4;
  id v5;

  -[_CertInfoTrustSummaryHeaderCell _subtitleLabel](self, "_subtitleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
    objc_msgSend(MEMORY[0x24BDF6950], "redColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "grayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

}

- (double)rowHeight
{
  void *v2;
  double v3;
  double v4;

  -[_CertInfoTrustSummaryHeaderCell imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3 + 5.0 + 6.0;

  return v4;
}

- (void)setActionButtonTitle:(id)a3 destructive:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  BOOL v19;
  _QWORD v20[7];

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[_CertInfoTrustSummaryHeaderCell actionButton](self, "actionButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "setHidden:", 0);
    objc_msgSend(v10, "setTitle:destructive:", v8, v6);
    if (v5)
    {
      objc_msgSend(v10, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
      v12 = v11;
      v14 = v13;
      objc_msgSend(v10, "setTitle:destructive:", &stru_24C813780, v6);
      v15 = (void *)MEMORY[0x24BDF6F90];
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __77___CertInfoTrustSummaryHeaderCell_setActionButtonTitle_destructive_animated___block_invoke;
      v20[3] = &unk_24C813658;
      v20[4] = self;
      v20[5] = v12;
      v20[6] = v14;
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __77___CertInfoTrustSummaryHeaderCell_setActionButtonTitle_destructive_animated___block_invoke_2;
      v16[3] = &unk_24C813680;
      v17 = v10;
      v18 = v8;
      v19 = v6;
      objc_msgSend(v15, "animateWithDuration:animations:completion:", v20, v16, 0.200000003);

    }
    else
    {
      -[_CertInfoTrustSummaryHeaderCell setNeedsLayout](self, "setNeedsLayout");
    }
  }
  else
  {
    objc_msgSend(v9, "setHidden:", 1);
  }

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[_CertInfoTrustSummaryHeaderCell actionButton](self, "actionButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  v5 = v4;
  v7 = v6;

  -[_CertInfoTrustSummaryHeaderCell _layoutSubviewsWithActionButtonSize:](self, "_layoutSubviewsWithActionButtonSize:", v5, v7);
}

- (void)_layoutSubviewsWithActionButtonSize:(CGSize)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MinY;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double MaxY;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  double Height;
  float v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  double v63;
  double width;
  double v65;
  CGFloat rect;
  CGFloat rect_8;
  CGFloat rect_16;
  double rect_24;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  objc_super v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;

  rect_24 = a3.height;
  width = a3.width;
  v73.receiver = self;
  v73.super_class = (Class)_CertInfoTrustSummaryHeaderCell;
  -[_CertInfoTrustSummaryHeaderCell layoutSubviews](&v73, sel_layoutSubviews);
  -[_CertInfoTrustSummaryHeaderCell imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CertInfoTrustSummaryHeaderCell _trustedLabel](self, "_trustedLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CertInfoTrustSummaryHeaderCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v4, "frame");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v5, "frame");
  rect = v19;
  v71 = v20;
  v72 = v21;
  v70 = v22;
  objc_msgSend(v4, "setFrame:", 5.0, 5.0, v16, v18);
  v74.origin.x = 5.0;
  v74.origin.y = 5.0;
  v74.size.width = v16;
  v74.size.height = v18;
  v23 = CGRectGetMaxX(v74) + 10.0;
  v61 = v10;
  v62 = v8;
  v75.origin.x = v8;
  v75.origin.y = v10;
  v60 = v12;
  v75.size.width = v12;
  v24 = v14;
  v75.size.height = v14;
  v25 = CGRectGetMaxX(v75) + -20.0;
  -[_CertInfoTrustSummaryHeaderCell _titleLabel](self, "_titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "frame");
  v28 = v27;
  v30 = v29;
  v76.origin.x = 5.0;
  v76.origin.y = 5.0;
  v76.size.width = v16;
  v76.size.height = v18;
  MinY = CGRectGetMinY(v76);
  objc_msgSend(v26, "text");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v25;
  if (v32)
  {
    objc_msgSend(v26, "font");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_legacy_sizeWithFont:forWidth:lineBreakMode:", v33, objc_msgSend(v26, "lineBreakMode"), v25 - v23);
    v28 = v34;
    v30 = v35;

  }
  rect_8 = v30;
  rect_16 = v28;
  objc_msgSend(v26, "setFrame:", v23, MinY, v28, v30);
  -[_CertInfoTrustSummaryHeaderCell actionButton](self, "actionButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v36, "isHidden") & 1) != 0)
  {
    v77.origin.x = 5.0;
    v77.origin.y = 5.0;
    v77.size.width = v16;
    v77.size.height = v18;
    MaxY = CGRectGetMaxY(v77);
    v78.origin.x = rect;
    v78.origin.y = v71;
    v38 = v72;
    v78.size.width = v72;
    v39 = v70;
    v78.size.height = v70;
    v40 = MaxY - CGRectGetHeight(v78);
  }
  else
  {
    v59 = MinY;
    objc_msgSend(v36, "frame");
    v79.origin.x = v62;
    v79.origin.y = v61;
    v79.size.width = v60;
    v79.size.height = v24;
    v41 = CGRectGetWidth(v79) + -5.0 - width;
    v80.origin.x = v62;
    v80.origin.y = v61;
    v80.size.width = v60;
    v80.size.height = v24;
    v42 = CGRectGetHeight(v80) + -6.0 - rect_24;
    objc_msgSend(v36, "setFrame:", v41, v42, width, rect_24);
    v81.origin.x = rect;
    v81.origin.y = v71;
    v81.size.width = v72;
    v81.size.height = v70;
    v43 = CGRectGetWidth(v81);
    v82.origin.x = v41;
    v82.origin.y = v42;
    v82.size.width = width;
    v82.size.height = rect_24;
    v44 = CGRectGetMinX(v82) - v23 + -5.0;
    v83.origin.x = v41;
    v83.origin.y = v42;
    v83.size.width = width;
    v83.size.height = rect_24;
    v63 = CGRectGetMinY(v83);
    if (v43 >= v44)
    {
      v86.origin.x = rect;
      v86.origin.y = v71;
      v38 = v72;
      v86.size.width = v72;
      v86.size.height = v70;
      v40 = v63 - CGRectGetHeight(v86) + -4.0;
    }
    else
    {
      v84.origin.x = v41;
      v84.origin.y = v42;
      v84.size.width = width;
      v84.size.height = rect_24;
      Height = CGRectGetHeight(v84);
      v85.origin.x = rect;
      v85.origin.y = v71;
      v38 = v72;
      v85.size.width = v72;
      v85.size.height = v70;
      v46 = (Height - CGRectGetHeight(v85)) * 0.5;
      v40 = v63 + floorf(v46);
    }
    v39 = v70;
    MinY = v59;
  }
  objc_msgSend(v5, "setFrame:", v23, v40, v38, v39);
  -[_CertInfoTrustSummaryHeaderCell _subtitleLabel](self, "_subtitleLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v47, "frame");
  v49 = v48;
  v51 = v50;
  v87.origin.x = v23;
  v87.origin.y = MinY;
  v87.size.height = rect_8;
  v87.size.width = rect_16;
  v52 = CGRectGetMaxY(v87);
  objc_msgSend(v47, "text");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    v88.size.height = v39;
    v88.origin.x = v23;
    v88.origin.y = v40;
    v88.size.width = v38;
    v54 = CGRectGetMinY(v88);
    v89.origin.x = v23;
    v89.origin.y = v52;
    v89.size.width = v49;
    v89.size.height = v51;
    v55 = v54 - CGRectGetMinY(v89);
    objc_msgSend(v47, "font");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v56, objc_msgSend(v47, "lineBreakMode"), v65 - v23, v55);
    v49 = v57;
    v51 = v58;

  }
  objc_msgSend(v47, "setFrame:", v23, v52, v49, v51);

}

- (id)_titleLabel
{
  UILabel *titleLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  void *v9;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6B68]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_titleLabel;
    self->_titleLabel = v5;

    -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", 0);
    -[UILabel setOpaque:](self->_titleLabel, "setOpaque:", 0);
    v7 = self->_titleLabel;
    objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 18.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
    -[_CertInfoTrustSummaryHeaderCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_titleLabel);

    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (id)_subtitleLabel
{
  UILabel *subtitleLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  void *v11;

  subtitleLabel = self->_subtitleLabel;
  if (!subtitleLabel)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6B68]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_subtitleLabel;
    self->_subtitleLabel = v5;

    -[UILabel setBackgroundColor:](self->_subtitleLabel, "setBackgroundColor:", 0);
    -[UILabel setOpaque:](self->_subtitleLabel, "setOpaque:", 0);
    v7 = self->_subtitleLabel;
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 14.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    v9 = self->_subtitleLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "grayColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9, "setTextColor:", v10);

    -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 2);
    -[_CertInfoTrustSummaryHeaderCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", self->_subtitleLabel);

    subtitleLabel = self->_subtitleLabel;
  }
  return subtitleLabel;
}

- (id)_trustedLabel
{
  _CertInfoGradientLabel *trustedLabel;
  _CertInfoGradientLabel *v4;
  _CertInfoGradientLabel *v5;
  void *v6;

  trustedLabel = self->_trustedLabel;
  if (!trustedLabel)
  {
    v4 = -[_CertInfoGradientLabel initWithTrusted:]([_CertInfoGradientLabel alloc], "initWithTrusted:", self->_trusted);
    v5 = self->_trustedLabel;
    self->_trustedLabel = v4;

    -[_CertInfoGradientLabel sizeToFit](self->_trustedLabel, "sizeToFit");
    -[_CertInfoTrustSummaryHeaderCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_trustedLabel);

    trustedLabel = self->_trustedLabel;
  }
  return trustedLabel;
}

- (BOOL)isTrusted
{
  return self->_trusted;
}

- (void)setTrusted:(BOOL)a3
{
  self->_trusted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedLabel, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_notTrustedGradient, 0);
  objc_storeStrong((id *)&self->_certificateImage, 0);
}

@end
