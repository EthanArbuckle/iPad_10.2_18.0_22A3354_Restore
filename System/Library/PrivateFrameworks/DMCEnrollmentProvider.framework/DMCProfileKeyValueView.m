@implementation DMCProfileKeyValueView

+ (double)defaultPreferredValueLabelOriginX
{
  double result;
  void *v3;
  double v4;
  double v5;

  result = *(double *)&defaultPreferredValueLabelOriginX_defaultPreferredValueLabelOriginX;
  if (*(double *)&defaultPreferredValueLabelOriginX_defaultPreferredValueLabelOriginX < 0.0)
  {
    +[DMCIconFactory gearIcon](DMCIconFactory, "gearIcon", *(double *)&defaultPreferredValueLabelOriginX_defaultPreferredValueLabelOriginX);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "size");
    if (v4 > 0.0)
    {
      objc_msgSend(v3, "size");
      *(double *)&defaultPreferredValueLabelOriginX_defaultPreferredValueLabelOriginX = v5 + 24.0;
    }

    return *(double *)&defaultPreferredValueLabelOriginX_defaultPreferredValueLabelOriginX;
  }
  return result;
}

- (DMCProfileKeyValueView)initWithFrame:(CGRect)a3
{
  DMCProfileKeyValueView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UILabel *keyLabel;
  void *v11;
  void *v12;
  uint64_t v13;
  UILabel *valueLabel;
  void *v15;
  double v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)DMCProfileKeyValueView;
  v3 = -[DMCProfileKeyValueView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6B68]);
    v5 = *MEMORY[0x24BDBF090];
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], v6, v7, v8);
    keyLabel = v3->_keyLabel;
    v3->_keyLabel = (UILabel *)v9;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_keyLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "DMCProfileSecondaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_keyLabel, "setTextColor:", v11);

    -[UILabel setTextAlignment:](v3->_keyLabel, "setTextAlignment:", 2);
    -[DMCProfileKeyValueView _captionFontBold:](v3, "_captionFontBold:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_keyLabel, "setFont:", v12);

    -[UILabel setNumberOfLines:](v3->_keyLabel, "setNumberOfLines:", 0);
    -[DMCProfileKeyValueView addSubview:](v3, "addSubview:", v3->_keyLabel);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v5, v6, v7, v8);
    valueLabel = v3->_valueLabel;
    v3->_valueLabel = (UILabel *)v13;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_valueLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DMCProfileKeyValueView _captionFontBold:](v3, "_captionFontBold:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_valueLabel, "setFont:", v15);

    -[UILabel setNumberOfLines:](v3->_valueLabel, "setNumberOfLines:", 0);
    -[DMCProfileKeyValueView addSubview:](v3, "addSubview:", v3->_valueLabel);
    +[DMCProfileKeyValueView defaultPreferredValueLabelOriginX](DMCProfileKeyValueView, "defaultPreferredValueLabelOriginX");
    v3->_preferredValueLabelOriginX = v16;
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
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  double x;
  double y;
  double width;
  double height;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  CGFloat v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  double MaxY;
  double v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  CGFloat v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  objc_super v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;

  v89.receiver = self;
  v89.super_class = (Class)DMCProfileKeyValueView;
  -[DMCProfileKeyValueView layoutSubviews](&v89, sel_layoutSubviews);
  -[DMCProfileKeyValueView frame](self, "frame");
  v4 = v3;
  -[DMCProfileKeyValueView preferredValueLabelOriginX](self, "preferredValueLabelOriginX");
  v6 = v4 - v5;
  -[DMCProfileKeyValueView frame](self, "frame");
  v8 = v7 - v6 + -10.0;
  -[DMCProfileKeyValueView keyLabel](self, "keyLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeThatFits:", v8, 3.40282347e38);
  v11 = v10;
  v13 = v12;

  v14 = (id *)MEMORY[0x24BDF74F8];
  if (objc_msgSend((id)*MEMORY[0x24BDF74F8], "userInterfaceLayoutDirection"))
  {
    -[DMCProfileKeyValueView frame](self, "frame");
    v16 = v15 - v11 + -10.0;
  }
  else
  {
    v16 = v8 - v11;
  }
  v17 = 0;
  v18 = v11;
  v19 = v13;
  v90 = CGRectIntegral(*(CGRect *)&v16);
  x = v90.origin.x;
  y = v90.origin.y;
  width = v90.size.width;
  height = v90.size.height;
  -[DMCProfileKeyValueView keyLabel](self, "keyLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", x, y, width, height);

  -[DMCProfileKeyValueView valueLabel](self, "valueLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sizeThatFits:", v6, 3.40282347e38);
  v27 = v26;
  v29 = v28;

  v87 = v6;
  if (objc_msgSend(*v14, "userInterfaceLayoutDirection"))
  {
    -[DMCProfileKeyValueView frame](self, "frame");
    v31 = v30;
    -[DMCProfileKeyValueView preferredValueLabelOriginX](self, "preferredValueLabelOriginX");
    v33 = v31 - v32 - v27;
  }
  else
  {
    -[DMCProfileKeyValueView preferredValueLabelOriginX](self, "preferredValueLabelOriginX");
    v33 = v34;
  }
  v91.origin.y = 0.0;
  v91.origin.x = v33;
  v91.size.width = v27;
  v91.size.height = v29;
  v92 = CGRectIntegral(v91);
  v35 = v92.origin.x;
  v36 = v92.origin.y;
  v37 = v92.size.width;
  v38 = v92.size.height;
  -[DMCProfileKeyValueView valueLabel](self, "valueLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFrame:", v35, v36, v37, v38);

  -[DMCProfileKeyValueView keyLabel](self, "keyLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "_firstLineBaselineFrameOriginY");
  v42 = v41;
  -[DMCProfileKeyValueView valueLabel](self, "valueLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "_firstLineBaselineOffsetFromBoundsTop");
  v45 = v42 - v44;

  v93.origin.x = v33;
  v93.origin.y = v45;
  v93.size.width = v27;
  v93.size.height = v29;
  v94 = CGRectIntegral(v93);
  v46 = v94.origin.x;
  v47 = v94.origin.y;
  v48 = v94.size.width;
  v49 = v94.size.height;
  -[DMCProfileKeyValueView valueLabel](self, "valueLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setFrame:", v46, v47, v48, v49);

  -[DMCProfileKeyValueView keyLabel](self, "keyLabel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "text");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "length");

  -[DMCProfileKeyValueView valueLabel](self, "valueLabel");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "text");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "length");

  v95.origin.x = v33;
  v95.origin.y = v45;
  v95.size.width = v27;
  v95.size.height = v29;
  MaxY = CGRectGetMaxY(v95);
  if (v56)
    v58 = MaxY + 5.0;
  else
    v58 = MaxY;
  -[DMCProfileKeyValueView verifiedLabel](self, "verifiedLabel", 0x47EFFFFFE0000000, *(_QWORD *)&v87);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    -[DMCProfileKeyValueView verifiedLabel](self, "verifiedLabel");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "sizeThatFits:", v88, v86);
    v62 = v61;
    v64 = v63;

    if (objc_msgSend(*v14, "userInterfaceLayoutDirection"))
    {
      -[DMCProfileKeyValueView frame](self, "frame");
      v66 = v65;
      -[DMCProfileKeyValueView preferredValueLabelOriginX](self, "preferredValueLabelOriginX");
      v68 = v66 - v67 - v62;
    }
    else
    {
      -[DMCProfileKeyValueView preferredValueLabelOriginX](self, "preferredValueLabelOriginX");
      v68 = v69;
    }
    v96.origin.x = v68;
    v96.origin.y = v58;
    v96.size.width = v62;
    v96.size.height = v64;
    v97 = CGRectIntegral(v96);
    v70 = v97.origin.x;
    v71 = v97.origin.y;
    v72 = v97.size.width;
    v73 = v97.size.height;
    -[DMCProfileKeyValueView verifiedLabel](self, "verifiedLabel");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setFrame:", v70, v71, v72, v73);

    if (!v56)
    {
      if (v53)
      {
        -[DMCProfileKeyValueView keyLabel](self, "keyLabel");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "_firstLineBaselineFrameOriginY");
        v77 = v76;
        -[DMCProfileKeyValueView verifiedLabel](self, "verifiedLabel");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "_firstLineBaselineOffsetFromBoundsTop");
        v80 = v77 - v79;

        v98.origin.x = v68;
        v98.origin.y = v80;
        v98.size.width = v62;
        v98.size.height = v64;
        v99 = CGRectIntegral(v98);
        v81 = v99.origin.x;
        v82 = v99.origin.y;
        v83 = v99.size.width;
        v84 = v99.size.height;
        -[DMCProfileKeyValueView verifiedLabel](self, "verifiedLabel");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "setFrame:", v81, v82, v83, v84);

      }
    }
  }
}

- (UILabel)verifiedLabel
{
  UILabel *verifiedLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;

  verifiedLabel = self->_verifiedLabel;
  if (!verifiedLabel)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6B68]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_verifiedLabel;
    self->_verifiedLabel = v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_verifiedLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DMCProfileKeyValueView _captionFontBold:](self, "_captionFontBold:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_verifiedLabel, "setFont:", v7);

    -[DMCProfileKeyValueView addSubview:](self, "addSubview:", self->_verifiedLabel);
    verifiedLabel = self->_verifiedLabel;
  }
  return verifiedLabel;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double MaxY;
  CGFloat x;
  CGFloat y;
  CGFloat v16;
  CGFloat height;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  double v42;
  CGSize result;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  width = a3.width;
  -[DMCProfileKeyValueView preferredValueLabelOriginX](self, "preferredValueLabelOriginX", a3.width, a3.height);
  v6 = width - v5;
  v7 = width - (width - v5) + -10.0;
  -[DMCProfileKeyValueView keyLabel](self, "keyLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", v7, 3.40282347e38);
  v10 = v9;
  v12 = v11;

  v44.origin.x = v7 - v10;
  MaxY = 0.0;
  v44.origin.y = 0.0;
  v44.size.width = v10;
  v44.size.height = v12;
  v45 = CGRectIntegral(v44);
  x = v45.origin.x;
  y = v45.origin.y;
  v16 = v45.size.width;
  height = v45.size.height;
  if (CGRectGetMaxY(v45) > 0.0)
  {
    v46.origin.x = x;
    v46.origin.y = y;
    v46.size.width = v16;
    v46.size.height = height;
    MaxY = CGRectGetMaxY(v46);
  }
  -[DMCProfileKeyValueView valueLabel](self, "valueLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sizeThatFits:", v6, 3.40282347e38);
  v20 = v19;
  v22 = v21;

  -[DMCProfileKeyValueView preferredValueLabelOriginX](self, "preferredValueLabelOriginX");
  v47.origin.y = 0.0;
  v47.size.width = v20;
  v47.size.height = v22;
  v48 = CGRectIntegral(v47);
  v23 = v48.origin.x;
  v24 = v48.origin.y;
  v25 = v48.size.width;
  v26 = v48.size.height;
  if (CGRectGetMaxY(v48) > MaxY)
  {
    v49.origin.x = v23;
    v49.origin.y = v24;
    v49.size.width = v25;
    v49.size.height = v26;
    MaxY = CGRectGetMaxY(v49);
  }
  v50.origin.x = v23;
  v50.origin.y = v24;
  v50.size.width = v25;
  v50.size.height = v26;
  v27 = CGRectGetMaxY(v50);
  -[DMCProfileKeyValueView valueLabel](self, "valueLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "text");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "length");

  -[DMCProfileKeyValueView verifiedLabel](self, "verifiedLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    if (v30)
      v27 = v27 + 5.0;
    -[DMCProfileKeyValueView verifiedLabel](self, "verifiedLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sizeThatFits:", v6, 3.40282347e38);
    v34 = v33;
    v36 = v35;

    -[DMCProfileKeyValueView preferredValueLabelOriginX](self, "preferredValueLabelOriginX");
    v51.origin.y = v27;
    v51.size.width = v34;
    v51.size.height = v36;
    v52 = CGRectIntegral(v51);
    v37 = v52.origin.x;
    v38 = v52.origin.y;
    v39 = v52.size.width;
    v40 = v52.size.height;
    if (CGRectGetMaxY(v52) > MaxY)
    {
      v53.origin.x = v37;
      v53.origin.y = v38;
      v53.size.width = v39;
      v53.size.height = v40;
      MaxY = CGRectGetMaxY(v53);
    }
  }
  v41 = width;
  v42 = MaxY;
  result.height = v42;
  result.width = v41;
  return result;
}

- (double)desiredValueLabelOriginXForSize:(CGSize)a3
{
  float v3;
  CGFloat v4;
  void *v5;
  double v6;
  double v7;

  v3 = (a3.width + -10.0) * 0.65;
  v4 = a3.width - roundf(v3) + -10.0;
  -[DMCProfileKeyValueView keyLabel](self, "keyLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", v4, 3.40282347e38);
  v7 = v6;

  return v7 + 10.0;
}

- (void)setKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[DMCProfileKeyValueView keyLabel](self, "keyLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[DMCProfileKeyValueView valueLabel](self, "valueLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v6);

  -[DMCProfileKeyValueView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setItemDetail:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCProfileKeyValueView keyLabel](self, "keyLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(v4, "detail");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCProfileKeyValueView valueLabel](self, "valueLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  objc_msgSend(v4, "trustText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[DMCProfileKeyValueView verifiedLabel](self, "verifiedLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttributedText:", v9);

  -[DMCProfileKeyValueView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPreferredValueLabelOriginX:(double)a3
{
  if (a3 >= 0.0 && self->_preferredValueLabelOriginX != a3)
  {
    self->_preferredValueLabelOriginX = a3;
    -[DMCProfileKeyValueView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_captionFontBold:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF77C0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", 2);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v5, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)preferredValueLabelOriginX
{
  return self->_preferredValueLabelOriginX;
}

- (UILabel)keyLabel
{
  return self->_keyLabel;
}

- (void)setKeyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_keyLabel, a3);
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (void)setVerifiedLabel:(id)a3
{
  objc_storeStrong((id *)&self->_verifiedLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifiedLabel, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_keyLabel, 0);
}

@end
