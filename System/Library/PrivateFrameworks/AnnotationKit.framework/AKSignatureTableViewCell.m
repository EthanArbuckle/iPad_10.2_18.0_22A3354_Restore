@implementation AKSignatureTableViewCell

- (AKSignatureTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AKSignatureTableViewCell *v4;
  AKSignatureTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKSignatureTableViewCell;
  v4 = -[AKSignatureTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[AKSignatureTableViewCell _commonInit](v4, "_commonInit");
  return v5;
}

- (AKSignatureTableViewCell)initWithCoder:(id)a3
{
  AKSignatureTableViewCell *v3;
  AKSignatureTableViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKSignatureTableViewCell;
  v3 = -[AKSignatureTableViewCell initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[AKSignatureTableViewCell _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v3 = objc_alloc(MEMORY[0x24BDF6AE8]);
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], v5, v6, v7);
  -[AKSignatureTableViewCell setSignatureImageView:](self, "setSignatureImageView:", v8);

  -[AKSignatureTableViewCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureTableViewCell signatureImageView](self, "signatureImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v4, v5, v6, v7);
  -[AKSignatureTableViewCell setSignatureLabel:](self, "setSignatureLabel:", v11);

  -[AKSignatureTableViewCell signatureLabel](self, "signatureLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 2 * (objc_msgSend(v12, "effectiveUserInterfaceLayoutDirection") != 1);
  -[AKSignatureTableViewCell signatureLabel](self, "signatureLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextAlignment:", v13);

  v15 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A70], "smallSystemFontSize");
  objc_msgSend(v15, "systemFontOfSize:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureTableViewCell signatureLabel](self, "signatureLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFont:", v16);

  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureTableViewCell signatureLabel](self, "signatureLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTextColor:", v18);

  -[AKSignatureTableViewCell contentView](self, "contentView");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[AKSignatureTableViewCell signatureLabel](self, "signatureLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v20);

}

- (void)setSignature:(id)a3
{
  AKSignature *v5;
  void *v6;
  AKSignature *v7;

  v5 = (AKSignature *)a3;
  if (self->_signature != v5)
  {
    v7 = v5;
    -[AKSignatureTableViewCell signatureImageView](self, "signatureImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", 0);

    objc_storeStrong((id *)&self->_signature, a3);
    -[AKSignatureTableViewCell _setLabelFromSignature](self, "_setLabelFromSignature");
    -[AKSignatureTableViewCell _setImageFromSignature](self, "_setImageFromSignature");
    v5 = v7;
  }

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRectEdge v19;
  CGFloat v20;
  double x;
  double y;
  double width;
  double height;
  void *v25;
  void *v26;
  CGRect v27;
  CGRect slice;
  objc_super v29;
  CGRect v30;
  CGRect v31;

  v29.receiver = self;
  v29.super_class = (Class)AKSignatureTableViewCell;
  -[AKSignatureTableViewCell layoutSubviews](&v29, sel_layoutSubviews);
  -[AKSignatureTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4 + 30.0;
  v7 = v6 + 10.0;
  v9 = v8 + -60.0;
  v11 = v10 + -20.0;

  -[AKSignatureTableViewCell signatureImageView](self, "signatureImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "contentMode");

  if (v13 == 4)
  {
    -[AKSignatureTableViewCell signatureImageView](self, "signatureImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v5, v7, v9, v11);

    v15 = *MEMORY[0x24BDBF090];
    v16 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v17 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v18 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  else
  {
    memset(&slice, 0, sizeof(slice));
    memset(&v27, 0, sizeof(v27));
    v19 = 2
        * (-[AKSignatureTableViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1);
    v30.origin.x = v5;
    v30.origin.y = v7;
    v30.size.width = v9;
    v30.size.height = v11;
    v20 = CGRectGetWidth(v30) * 0.618;
    v31.origin.x = v5;
    v31.origin.y = v7;
    v31.size.width = v9;
    v31.size.height = v11;
    CGRectDivide(v31, &slice, &v27, v20, v19);
    x = slice.origin.x;
    y = slice.origin.y;
    width = slice.size.width;
    height = slice.size.height;
    -[AKSignatureTableViewCell signatureImageView](self, "signatureImageView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:", x, y, width, height);

    v16 = v27.origin.y;
    v15 = v27.origin.x;
    v18 = v27.size.height;
    v17 = v27.size.width;
  }
  -[AKSignatureTableViewCell signatureLabel](self, "signatureLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", v15, v16, v17, v18);

  -[AKSignatureTableViewCell _setImageFromSignature](self, "_setImageFromSignature");
}

- (void)_setImageFromSignature
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[AKSignatureTableViewCell signatureImageView](self, "signatureImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v13 = 0;
  if (v5 > 0.0 && v7 > 0.0)
  {
    -[AKSignatureTableViewCell traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceStyle");

    if (v9 == 2)
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKSignatureTableViewCell signature](self, "signature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AKAnnotationImageHelper imageOfSize:withFillColor:forSignature:](AKAnnotationImageHelper, "imageOfSize:withFillColor:forSignature:", v10, v11, v5, v7);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[AKSignatureTableViewCell signatureImageView](self, "signatureImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", v13);

}

- (void)_setLabelFromSignature
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[AKSignatureTableViewCell signature](self, "signature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "descriptionTag");

  if (v4)
  {
    -[AKSignatureTableViewCell signature](self, "signature");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "descriptionTag");

    if (v6 == -1)
    {
      -[AKSignatureTableViewCell signature](self, "signature");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "customDescription");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[AKSignatureDescription stringValueForSignatureDescriptionTag:](AKSignatureDescription, "stringValueForSignatureDescriptionTag:", v6);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[AKSignatureTableViewCell signatureLabel](self, "signatureLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v9);

  }
  else
  {
    -[AKSignatureTableViewCell signatureLabel](self, "signatureLabel");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", 0);
  }

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[AKSignatureTableViewCell signature](self, "signature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[AKSignatureTableViewCell signature](self, "signature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AKSignature)signature
{
  return self->_signature;
}

- (UIImageView)signatureImageView
{
  return self->_signatureImageView;
}

- (void)setSignatureImageView:(id)a3
{
  objc_storeStrong((id *)&self->_signatureImageView, a3);
}

- (UILabel)signatureLabel
{
  return self->_signatureLabel;
}

- (void)setSignatureLabel:(id)a3
{
  objc_storeStrong((id *)&self->_signatureLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureLabel, 0);
  objc_storeStrong((id *)&self->_signatureImageView, 0);
  objc_storeStrong((id *)&self->_signature, 0);
}

@end
