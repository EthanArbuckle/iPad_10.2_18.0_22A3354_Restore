@implementation CertInfoCertificateListCellContentView

- (CertInfoCertificateListCellContentView)initWithFrame:(CGRect)a3
{
  CertInfoCertificateListCellContentView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UILabel *titleLabel;
  uint64_t v11;
  UILabel *subtitleLabel;
  uint64_t v13;
  UILabel *expirationLabel;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CertInfoCertificateListCellContentView;
  v3 = -[CertInfoCertificateListCellContentView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6B68]);
    v5 = *MEMORY[0x24BDBF090];
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], v6, v7, v8);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v9;

    -[CertInfoCertificateListCellContentView _setupLabel:isSubtitle:](v3, "_setupLabel:isSubtitle:", v3->_titleLabel, 0);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v5, v6, v7, v8);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v11;

    -[CertInfoCertificateListCellContentView _setupLabel:isSubtitle:](v3, "_setupLabel:isSubtitle:", v3->_subtitleLabel, 1);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v5, v6, v7, v8);
    expirationLabel = v3->_expirationLabel;
    v3->_expirationLabel = (UILabel *)v13;

    -[CertInfoCertificateListCellContentView _setupLabel:isSubtitle:](v3, "_setupLabel:isSubtitle:", v3->_expirationLabel, 1);
  }
  return v3;
}

- (void)setTitle:(id)a3
{
  -[CertInfoCertificateListCellContentView _setText:forLabel:withRedColor:](self, "_setText:forLabel:withRedColor:", a3, self->_titleLabel, 0);
}

- (void)setSubtitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (v4 && (objc_msgSend(v4, "isEqualToString:", &stru_24C813780) & 1) == 0)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CertInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ISSUED_BY_LABEL"), &stru_24C813780, CFSTR("CertInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v8, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  -[CertInfoCertificateListCellContentView _setText:forLabel:withRedColor:](self, "_setText:forLabel:withRedColor:", v5, self->_subtitleLabel, 0);

}

- (void)setExpiration:(id)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "timeIntervalSinceNow");
  v5 = v4;
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v13, 2, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CertInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v5 >= 0.0)
      v10 = CFSTR("EXPIRES_LABEL");
    else
      v10 = CFSTR("EXPIRED_LABEL");
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_24C813780, CFSTR("CertInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  -[CertInfoCertificateListCellContentView _setText:forLabel:withRedColor:](self, "_setText:forLabel:withRedColor:", v12, self->_expirationLabel, v5 < 0.0);

}

- (void)_setupLabel:(id)a3 isSubtitle:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHighlightedTextColor:", v5);

  objc_msgSend(v8, "setBackgroundColor:", 0);
  objc_msgSend(v8, "setOpaque:", 0);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "grayColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v6);

    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 13.0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 17.0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

}

- (void)_setText:(id)a3 forLabel:(id)a4 withRedColor:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  id v9;

  v5 = a5;
  v9 = a4;
  if (a3)
  {
    objc_msgSend(v9, "setText:", a3);
    objc_msgSend(v9, "sizeToFit");
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "redColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTextColor:", v8);

    }
    -[CertInfoCertificateListCellContentView addSubview:](self, "addSubview:", v9);
  }
  else
  {
    objc_msgSend(v9, "removeFromSuperview");
  }
  -[CertInfoCertificateListCellContentView setNeedsLayout](self, "setNeedsLayout");

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UILabel *titleLabel;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  BOOL v20;
  BOOL v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  float v31;
  double v32;
  UILabel *subtitleLabel;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  float v50;
  double v51;
  double v52;
  double v53;
  double v54;

  -[CertInfoCertificateListCellContentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel frame](titleLabel, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
  }
  else
  {
    v11 = *MEMORY[0x24BDBF090];
    v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v15 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  v16 = v6 + -8.0;
  -[UILabel superview](self->_subtitleLabel, "superview");
  v17 = objc_claimAutoreleasedReturnValue();

  -[UILabel superview](self->_expirationLabel, "superview");
  v18 = objc_claimAutoreleasedReturnValue();

  if (!(v17 | v18))
  {
    v19 = v4 + v8 * 0.5 - v15 * 0.5 + -2.0;
    v13 = roundf(v19);
    goto LABEL_19;
  }
  if (v17)
    v20 = v18 == 0;
  else
    v20 = 0;
  if (v20)
  {
    -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 2);
    -[UILabel text](self->_subtitleLabel, "text");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel font](self->_subtitleLabel, "font");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "_legacy_sizeWithFont:constrainedToSize:", v39, v16, 0.0);
    v41 = v40;
    v51 = v4;
    v43 = v42;

    -[UILabel text](self->_subtitleLabel, "text");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel font](self->_subtitleLabel, "font");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "_legacy_sizeWithFont:constrainedToSize:", v45, v41, v43 + v43);
    v47 = v46;
    v54 = v11;
    v49 = v48;

    if (v43 < v49)
    {
      v47 = v41;
      v49 = v43 + v43;
    }
    -[UILabel frame](self->_subtitleLabel, "frame", *(_QWORD *)&v51);
    v50 = v52 + v8 * 0.5 - (v15 + 2.0 + v49) * 0.5 + -2.0;
    v13 = roundf(v50);
    v35 = v15 + 2.0 + v13;
    subtitleLabel = self->_subtitleLabel;
    v36 = v47;
    v37 = v49;
    v11 = v54;
    goto LABEL_18;
  }
  if (v17)
    v21 = v18 == 0;
  else
    v21 = 1;
  if (!v21)
  {
    -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 1);
    -[UILabel frame](self->_subtitleLabel, "frame");
    v23 = v22;
    v53 = v11;
    v25 = v24;
    -[UILabel frame](self->_expirationLabel, "frame");
    v26 = v4;
    v28 = v27;
    v30 = v29;
    v31 = v26 + v8 * 0.5 - (v15 + 2.0 + v25 + 2.0 + v29) * 0.5 + -2.0;
    v13 = roundf(v31);
    v32 = v25 + 2.0 + v15 + 2.0 + v13;
    v11 = v53;
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v23);
    subtitleLabel = self->_expirationLabel;
    v34 = v28;
    v35 = v32;
    v36 = v16;
    v37 = v30;
LABEL_18:
    -[UILabel setFrame:](subtitleLabel, "setFrame:", v34, v35, v36, v37);
  }
LABEL_19:
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v11, v13, v16, v15);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
