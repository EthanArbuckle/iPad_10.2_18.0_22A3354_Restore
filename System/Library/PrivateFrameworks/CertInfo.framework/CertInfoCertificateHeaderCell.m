@implementation CertInfoCertificateHeaderCell

- (CertInfoCertificateHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CertInfoCertificateHeaderCell *v4;
  CertInfoCertificateHeaderCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CertInfoCertificateHeaderCell;
  v4 = -[CertInfoCertificateHeaderCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CertInfoCertificateHeaderCell imageView](v4, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertInfoCertificateHeaderCell _certificateImage](v5, "_certificateImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v7);

    -[CertInfoCertificateHeaderCell imageView](v5, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeToFit");

    -[CertInfoCertificateHeaderCell _trustedLabel](v5, "_trustedLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CertInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("NOT_TRUSTED"), &stru_24C813780, CFSTR("CertInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v11);

    objc_msgSend(v9, "sizeToFit");
    -[CertInfoCertificateHeaderCell setAutoresizesSubviews:](v5, "setAutoresizesSubviews:", 0);

  }
  return v5;
}

- (id)_certificateImage
{
  UIImage *certificateImage;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  UIImage *v10;
  UIImage *v11;

  certificateImage = self->_certificateImage;
  if (!certificateImage)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v6 = v5;

    v7 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageNamed:inBundle:", CFSTR("profile-icon"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_applicationIconImageForFormat:precomposed:scale:", 2, 1, v6);
    v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v11 = self->_certificateImage;
    self->_certificateImage = v10;

    certificateImage = self->_certificateImage;
  }
  return certificateImage;
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
    -[CertInfoCertificateHeaderCell contentView](self, "contentView");
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
    -[CertInfoCertificateHeaderCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", self->_subtitleLabel);

    subtitleLabel = self->_subtitleLabel;
  }
  return subtitleLabel;
}

- (id)_notTrustedGradient
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("NotTrustedTextGradient"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_trustedLabel
{
  CertInfoGradientLabel *trustedLabel;
  CertInfoGradientLabel *v4;
  CertInfoGradientLabel *v5;
  CertInfoGradientLabel *v6;
  CertInfoGradientLabel *v7;
  void *v8;
  CertInfoGradientLabel *v9;
  void *v10;
  void *v11;

  trustedLabel = self->_trustedLabel;
  if (!trustedLabel)
  {
    v4 = [CertInfoGradientLabel alloc];
    v5 = -[CertInfoGradientLabel initWithFrame:](v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_trustedLabel;
    self->_trustedLabel = v5;

    -[CertInfoGradientLabel setBackgroundColor:](self->_trustedLabel, "setBackgroundColor:", 0);
    -[CertInfoGradientLabel setOpaque:](self->_trustedLabel, "setOpaque:", 0);
    v7 = self->_trustedLabel;
    objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 15.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertInfoGradientLabel setFont:](v7, "setFont:", v8);

    v9 = self->_trustedLabel;
    -[CertInfoCertificateHeaderCell _notTrustedGradient](self, "_notTrustedGradient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertInfoGradientLabel setGradient:](v9, "setGradient:", v10);

    -[CertInfoCertificateHeaderCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", self->_trustedLabel);

    trustedLabel = self->_trustedLabel;
  }
  return trustedLabel;
}

- (void)setTrustTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CertInfoCertificateHeaderCell _titleLabel](self, "_titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(v5, "sizeToFit");
}

- (void)setTrustSubtitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CertInfoCertificateHeaderCell _subtitleLabel](self, "_subtitleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(v5, "sizeToFit");
}

- (void)setExpired:(BOOL)a3
{
  void *v4;
  id v5;

  -[CertInfoCertificateHeaderCell _subtitleLabel](self, "_subtitleLabel");
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

  -[CertInfoCertificateHeaderCell imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3 + 14.0 + 13.0;

  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double MinY;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  CGFloat v43;
  void *v44;
  double v45;
  double v46;
  objc_super v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v47.receiver = self;
  v47.super_class = (Class)CertInfoCertificateHeaderCell;
  -[CertInfoCertificateHeaderCell layoutSubviews](&v47, sel_layoutSubviews);
  -[CertInfoCertificateHeaderCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  -[CertInfoCertificateHeaderCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[CertInfoCertificateHeaderCell _trustedLabel](self, "_trustedLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v45 = v19;
  v46 = v18;

  -[CertInfoCertificateHeaderCell imageView](self, "imageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", 15.0, 14.0, v5, v7);

  v48.origin.x = 15.0;
  v48.origin.y = 14.0;
  v48.size.width = v5;
  v48.size.height = v7;
  v21 = CGRectGetMaxX(v48) + 10.0;
  v49.origin.x = 15.0;
  v49.origin.y = 14.0;
  v49.size.width = v5;
  v49.size.height = v7;
  MinY = CGRectGetMinY(v49);
  v50.origin.x = v10;
  v50.origin.y = v12;
  v50.size.width = v14;
  v50.size.height = v16;
  v23 = CGRectGetMaxX(v50) + -20.0;
  -[CertInfoCertificateHeaderCell _titleLabel](self, "_titleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  v26 = v25;
  v28 = v27;
  objc_msgSend(v24, "text");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    objc_msgSend(v24, "font");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_legacy_sizeWithFont:forWidth:lineBreakMode:", v30, objc_msgSend(v24, "lineBreakMode"), v23 - v21);
    v26 = v31;
    v28 = v32;

  }
  objc_msgSend(v24, "setFrame:", v21, MinY, v26, v28);
  v33 = MinY + v28;
  -[CertInfoCertificateHeaderCell _subtitleLabel](self, "_subtitleLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "frame");
  v36 = v35;
  v38 = v37;
  objc_msgSend(v34, "text");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(v34, "font");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v40, objc_msgSend(v34, "lineBreakMode"), v23 - v21, v16 - v33 - v45);
    v36 = v41;
    v38 = v42;

  }
  objc_msgSend(v34, "setFrame:", v21, v33, v36, v38);
  v51.origin.x = 15.0;
  v51.origin.y = 14.0;
  v51.size.width = v5;
  v51.size.height = v7;
  v43 = CGRectGetMaxY(v51) - v45;
  -[CertInfoCertificateHeaderCell _trustedLabel](self, "_trustedLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setFrame:", v21, v43, v46, v45);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_notTrustedGradient, 0);
  objc_storeStrong((id *)&self->_certificateImage, 0);
}

@end
