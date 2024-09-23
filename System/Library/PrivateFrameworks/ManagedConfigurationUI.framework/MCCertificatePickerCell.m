@implementation MCCertificatePickerCell

- (id)_checkmarkView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                 + (int)*MEMORY[0x1E0D805F0]));
}

+ (float)defaultCellHeight
{
  return 67.0;
}

+ (id)_attributeFont
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 14.0);
}

+ (float)_attributeLabelSpace
{
  double v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;

  LODWORD(v2) = __ExpiresWidth;
  if (*(float *)&__ExpiresWidth == 0.0)
  {
    objc_msgSend(a1, "_attributeFont", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    MCUILocalizedString(CFSTR("EXPIRES"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_legacy_sizeWithFont:forWidth:lineBreakMode:", v3, 4, 150.0);
    *(float *)&v5 = v5;
    __ExpiresWidth = LODWORD(v5);

    MCUILocalizedString(CFSTR("ISSUED_BY"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_legacy_sizeWithFont:forWidth:lineBreakMode:", v3, 4, 150.0);
    *(float *)&v7 = v7;
    __IssuedByWidth = LODWORD(v7);

    LODWORD(v2) = __ExpiresWidth;
  }
  if (*(float *)&v2 < *(float *)&__IssuedByWidth)
    LODWORD(v2) = __IssuedByWidth;
  return *(float *)&v2 + 9.0;
}

+ (id)_dateFormatter
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)_dateFormatter_sFormatter_0;
  if (!_dateFormatter_sFormatter_0)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = (void *)_dateFormatter_sFormatter_0;
    _dateFormatter_sFormatter_0 = (uint64_t)v3;

    objc_msgSend((id)_dateFormatter_sFormatter_0, "setDateStyle:", 3);
    objc_msgSend((id)_dateFormatter_sFormatter_0, "setTimeStyle:", 0);
    v2 = (void *)_dateFormatter_sFormatter_0;
  }
  return v2;
}

- (MCCertificatePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  MCCertificatePickerCell *v5;
  MCCertificatePickerCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MCCertificatePickerCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v8, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
    -[MCCertificatePickerCell setAccessoryType:](v5, "setAccessoryType:", 2);
  return v6;
}

- (id)_labelColor
{
  void *v3;
  void *v4;

  if (-[PSTableCell isChecked](self, "isChecked"))
  {
    -[PSTableCell titleLabel](self, "titleLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_attributeLabelCopy
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  objc_msgSend((id)objc_opt_class(), "_attributeFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  -[MCCertificatePickerCell _labelColor](self, "_labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v5);

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHighlightedTextColor:", v6);

  objc_msgSend(v3, "setBackgroundColor:", 0);
  objc_msgSend(v3, "setOpaque:", 0);
  return v3;
}

- (void)setIssuer:(id)a3
{
  uint64_t v4;
  UILabel *issuedByLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  void *v10;
  UILabel *issuerLabel;
  UILabel *v12;
  UILabel *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = objc_msgSend(v15, "length");
  issuedByLabel = self->_issuedByLabel;
  if (v4)
  {
    if (!issuedByLabel)
    {
      -[MCCertificatePickerCell _attributeLabelCopy](self, "_attributeLabelCopy");
      v6 = (UILabel *)objc_claimAutoreleasedReturnValue();
      v7 = self->_issuedByLabel;
      self->_issuedByLabel = v6;

      v8 = self->_issuedByLabel;
      MCUILocalizedString(CFSTR("ISSUED_BY"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v8, "setText:", v9);

      -[MCCertificatePickerCell contentView](self, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", self->_issuedByLabel);

    }
    issuerLabel = self->_issuerLabel;
    if (!issuerLabel)
    {
      -[MCCertificatePickerCell _attributeLabelCopy](self, "_attributeLabelCopy");
      v12 = (UILabel *)objc_claimAutoreleasedReturnValue();
      v13 = self->_issuerLabel;
      self->_issuerLabel = v12;

      -[MCCertificatePickerCell contentView](self, "contentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSubview:", self->_issuerLabel);

      issuerLabel = self->_issuerLabel;
    }
    -[UILabel setText:](issuerLabel, "setText:", v15);
  }
  else
  {
    -[UILabel removeFromSuperview](issuedByLabel, "removeFromSuperview");
    -[UILabel removeFromSuperview](self->_issuerLabel, "removeFromSuperview");
  }
  -[MCCertificatePickerCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)setExpirationDate:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  UILabel *expiresByLabel;
  UILabel *v8;
  UILabel *v9;
  UILabel *v10;
  void *v11;
  void *v12;
  UILabel *expiryDateLabel;
  UILabel *v14;
  UILabel *v15;
  void *v16;
  id v17;

  v17 = a3;
  if (v17)
  {
    +[MCCertificatePickerCell _dateFormatter](MCCertificatePickerCell, "_dateFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate:", v17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  v6 = objc_msgSend(v5, "length");
  expiresByLabel = self->_expiresByLabel;
  if (v6)
  {
    if (!expiresByLabel)
    {
      -[MCCertificatePickerCell _attributeLabelCopy](self, "_attributeLabelCopy");
      v8 = (UILabel *)objc_claimAutoreleasedReturnValue();
      v9 = self->_expiresByLabel;
      self->_expiresByLabel = v8;

      v10 = self->_expiresByLabel;
      MCUILocalizedString(CFSTR("EXPIRES"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v10, "setText:", v11);

      -[MCCertificatePickerCell contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", self->_expiresByLabel);

    }
    expiryDateLabel = self->_expiryDateLabel;
    if (!expiryDateLabel)
    {
      -[MCCertificatePickerCell _attributeLabelCopy](self, "_attributeLabelCopy");
      v14 = (UILabel *)objc_claimAutoreleasedReturnValue();
      v15 = self->_expiryDateLabel;
      self->_expiryDateLabel = v14;

      -[MCCertificatePickerCell contentView](self, "contentView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addSubview:", self->_expiryDateLabel);

      expiryDateLabel = self->_expiryDateLabel;
    }
    -[UILabel setText:](expiryDateLabel, "setText:", v5);
  }
  else
  {
    -[UILabel removeFromSuperview](expiresByLabel, "removeFromSuperview");
    -[UILabel removeFromSuperview](self->_expiryDateLabel, "removeFromSuperview");
  }
  -[MCCertificatePickerCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)setChecked:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v5 = -[PSTableCell isChecked](self, "isChecked");
  v7.receiver = self;
  v7.super_class = (Class)MCCertificatePickerCell;
  -[PSTableCell setChecked:](&v7, sel_setChecked_, v3);
  if (v5 != v3)
  {
    -[MCCertificatePickerCell _labelColor](self, "_labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_issuerLabel, "setTextColor:", v6);
    -[UILabel setTextColor:](self->_issuedByLabel, "setTextColor:", v6);
    -[UILabel setTextColor:](self->_expiryDateLabel, "setTextColor:", v6);
    -[UILabel setTextColor:](self->_expiresByLabel, "setTextColor:", v6);

  }
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  float v8;
  float v9;
  double v10;
  float v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  float v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  float v41;
  float v42;
  float v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  float v52;
  objc_super v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v53.receiver = self;
  v53.super_class = (Class)MCCertificatePickerCell;
  -[PSTableCell layoutSubviews](&v53, sel_layoutSubviews);
  -[UILabel superview](self->_expiresByLabel, "superview");
  v3 = objc_claimAutoreleasedReturnValue();

  -[UILabel superview](self->_issuerLabel, "superview");
  v4 = objc_claimAutoreleasedReturnValue();

  -[PSTableCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeToFit");
  objc_msgSend(v5, "bounds");
  v7 = 0.0;
  if (v4 | v3)
    v7 = 1.0;
  v8 = v6 + 0.0;
  v9 = v7 + v8;
  if (v4)
  {
    -[UILabel sizeToFit](self->_issuedByLabel, "sizeToFit");
    -[UILabel sizeToFit](self->_issuerLabel, "sizeToFit");
    -[UILabel bounds](self->_issuedByLabel, "bounds");
    if (v3)
    {
      v11 = v10 + v9;
      v9 = v11 + 2.0;
    }
    else
    {
      v9 = v10 + v9;
    }
  }
  if (v3)
  {
    -[UILabel sizeToFit](self->_expiresByLabel, "sizeToFit");
    -[UILabel sizeToFit](self->_expiryDateLabel, "sizeToFit");
    -[UILabel bounds](self->_expiresByLabel, "bounds");
    v9 = v12 + v9;
  }
  -[MCCertificatePickerCell _checkmarkView](self, "_checkmarkView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[MCCertificatePickerCell _checkmarkView](self, "_checkmarkView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", 10.0, v15, v17, v19);

  -[MCCertificatePickerCell bounds](self, "bounds");
  v22 = v21;
  -[MCCertificatePickerCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v32 = round((v22 - v9) * 0.5);
  objc_msgSend(v5, "frame");
  v34 = v33;
  v36 = v35;
  v37 = v32;
  v54.origin.x = v25;
  v54.origin.y = v27;
  v54.size.width = v29;
  v54.size.height = v31;
  v38 = CGRectGetMaxX(v54) + -10.0 + -39.0;
  if (v34 >= v38)
    v39 = v38;
  else
    v39 = v34;
  objc_msgSend(v5, "setFrame:", 39.0, v37, v39, v36);
  -[PSTableCell valueLabel](self, "valueLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFrame:", 39.0, v37, v39, v36);

  if (v4 | v3)
  {
    v41 = v36 + 1.0 + v37;
    objc_msgSend((id)objc_opt_class(), "_attributeLabelSpace");
    v52 = v42;
    if (v4)
    {
      v43 = v42;
      -[UILabel frame](self->_issuerLabel, "frame");
      v51 = v44;
      -[UILabel frame](self->_issuedByLabel, "frame");
      v46 = v45;
      v47 = v41;
      -[UILabel setFrame:](self->_issuedByLabel, "setFrame:", 39.0, v47, *(float *)&__IssuedByWidth);
      v55.origin.x = v25;
      v55.origin.y = v27;
      v55.size.width = v29;
      v55.size.height = v31;
      -[UILabel setFrame:](self->_issuerLabel, "setFrame:", v43 + 39.0, v47, CGRectGetMaxX(v55) - (v43 + 39.0) + -10.0, v51);
      v41 = v46 + 2.0 + v47;
    }
    if (v3)
    {
      -[UILabel frame](self->_expiryDateLabel, "frame");
      v49 = v48;
      -[UILabel frame](self->_expiresByLabel, "frame");
      v50 = v41;
      -[UILabel setFrame:](self->_expiresByLabel, "setFrame:", 39.0, v50, *(float *)&__ExpiresWidth);
      v56.origin.x = v25;
      v56.origin.y = v27;
      v56.size.width = v29;
      v56.size.height = v31;
      -[UILabel setFrame:](self->_expiryDateLabel, "setFrame:", v52 + 39.0, v50, CGRectGetMaxX(v56) - (v52 + 39.0) + -10.0, v49);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDateLabel, 0);
  objc_storeStrong((id *)&self->_expiresByLabel, 0);
  objc_storeStrong((id *)&self->_issuerLabel, 0);
  objc_storeStrong((id *)&self->_issuedByLabel, 0);
}

@end
