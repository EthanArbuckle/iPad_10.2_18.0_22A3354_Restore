@implementation CertUIKeyValueView

+ (double)defaultPreferredValueLabelOriginX
{
  double result;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  result = *(double *)&defaultPreferredValueLabelOriginX_defaultPreferredValueLabelOriginX;
  if (*(double *)&defaultPreferredValueLabelOriginX_defaultPreferredValueLabelOriginX < 0.0)
  {
    v3 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("profile-icon"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "size");
    if (v6 > 0.0)
    {
      objc_msgSend(v5, "size");
      *(double *)&defaultPreferredValueLabelOriginX_defaultPreferredValueLabelOriginX = v7 + 24.0;
    }

    return *(double *)&defaultPreferredValueLabelOriginX_defaultPreferredValueLabelOriginX;
  }
  return result;
}

- (CertUIKeyValueView)initWithFrame:(CGRect)a3
{
  CertUIKeyValueView *v3;
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
  v18.super_class = (Class)CertUIKeyValueView;
  v3 = -[CertUIKeyValueView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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
    objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_keyLabel, "setTextColor:", v11);

    -[UILabel setTextAlignment:](v3->_keyLabel, "setTextAlignment:", 2);
    -[CertUIKeyValueView titleFont](v3, "titleFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_keyLabel, "setFont:", v12);

    -[UILabel setNumberOfLines:](v3->_keyLabel, "setNumberOfLines:", 0);
    -[CertUIKeyValueView addSubview:](v3, "addSubview:", v3->_keyLabel);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v5, v6, v7, v8);
    valueLabel = v3->_valueLabel;
    v3->_valueLabel = (UILabel *)v13;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_valueLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CertUIKeyValueView detailFont](v3, "detailFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_valueLabel, "setFont:", v15);

    -[UILabel setNumberOfLines:](v3->_valueLabel, "setNumberOfLines:", 0);
    -[CertUIKeyValueView addSubview:](v3, "addSubview:", v3->_valueLabel);
    +[CertUIKeyValueView defaultPreferredValueLabelOriginX](CertUIKeyValueView, "defaultPreferredValueLabelOriginX");
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
  double v12;
  CGFloat v13;
  double x;
  double y;
  double width;
  double height;
  void *v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  double MaxY;
  void *v48;
  double v49;
  void *v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  CGFloat v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  CGFloat v76;
  double v77;
  double v78;
  void *v79;
  CGFloat v80;
  void *v81;
  double v82;
  CGFloat v83;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  double v89;
  objc_super v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;

  v90.receiver = self;
  v90.super_class = (Class)CertUIKeyValueView;
  -[CertUIKeyValueView layoutSubviews](&v90, sel_layoutSubviews);
  -[CertUIKeyValueView frame](self, "frame");
  v4 = v3;
  -[CertUIKeyValueView preferredValueLabelOriginX](self, "preferredValueLabelOriginX");
  v6 = v4 - v5;
  -[CertUIKeyValueView frame](self, "frame");
  v8 = v7 - v6 + -10.0;
  -[CertUIKeyValueView keyLabel](self, "keyLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeThatFits:", v8, 3.40282347e38);
  v11 = v10;
  v13 = v12;

  v91.origin.x = v8 - v11;
  v91.origin.y = 0.0;
  v91.size.width = v11;
  v91.size.height = v13;
  v92 = CGRectIntegral(v91);
  x = v92.origin.x;
  y = v92.origin.y;
  width = v92.size.width;
  height = v92.size.height;
  -[CertUIKeyValueView keyLabel](self, "keyLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", x, y, width, height);

  -[CertUIKeyValueView valueLabel](self, "valueLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v6;
  objc_msgSend(v19, "sizeThatFits:", v6, 3.40282347e38);
  v21 = v20;
  v23 = v22;

  -[CertUIKeyValueView preferredValueLabelOriginX](self, "preferredValueLabelOriginX");
  v24 = v93.origin.x;
  v93.origin.y = 0.0;
  v93.size.width = v21;
  v93.size.height = v23;
  v94 = CGRectIntegral(v93);
  v25 = v94.origin.x;
  v26 = v94.origin.y;
  v27 = v94.size.width;
  v28 = v94.size.height;
  -[CertUIKeyValueView valueLabel](self, "valueLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", v25, v26, v27, v28);

  -[CertUIKeyValueView keyLabel](self, "keyLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "_firstLineBaselineFrameOriginY");
  v32 = v31;
  -[CertUIKeyValueView valueLabel](self, "valueLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_firstLineBaselineOffsetFromBoundsTop");
  v35 = v32 - v34;

  v95.origin.x = v24;
  v95.origin.y = v35;
  v95.size.width = v21;
  v95.size.height = v23;
  v96 = CGRectIntegral(v95);
  v36 = v96.origin.x;
  v37 = v96.origin.y;
  v38 = v96.size.width;
  v39 = v96.size.height;
  -[CertUIKeyValueView valueLabel](self, "valueLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFrame:", v36, v37, v38, v39);

  -[CertUIKeyValueView keyLabel](self, "keyLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "text");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "length");

  -[CertUIKeyValueView valueLabel](self, "valueLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "text");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "length");

  v97.origin.x = v24;
  v97.origin.y = v35;
  v97.size.width = v21;
  v97.size.height = v23;
  MaxY = CGRectGetMaxY(v97);
  -[CertUIKeyValueView verifiedLabel](self, "verifiedLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    v49 = v46 ? MaxY + 5.0 : MaxY;
    -[CertUIKeyValueView verifiedLabel](self, "verifiedLabel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "sizeThatFits:", v89, 3.40282347e38);
    v52 = v51;
    v54 = v53;

    -[CertUIKeyValueView preferredValueLabelOriginX](self, "preferredValueLabelOriginX");
    v55 = v98.origin.x;
    v98.origin.y = v49;
    v98.size.width = v52;
    v98.size.height = v54;
    v99 = CGRectIntegral(v98);
    v56 = v99.origin.x;
    v57 = v99.origin.y;
    v58 = v99.size.width;
    v59 = v99.size.height;
    -[CertUIKeyValueView verifiedLabel](self, "verifiedLabel");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setFrame:", v56, v57, v58, v59);

    if (!v46)
    {
      if (v43)
      {
        -[CertUIKeyValueView keyLabel](self, "keyLabel");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "_firstLineBaselineFrameOriginY");
        v63 = v62;
        -[CertUIKeyValueView verifiedLabel](self, "verifiedLabel");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "_firstLineBaselineOffsetFromBoundsTop");
        v66 = v63 - v65;

        v100.origin.x = v55;
        v100.origin.y = v66;
        v100.size.width = v52;
        v100.size.height = v54;
        v101 = CGRectIntegral(v100);
        v67 = v101.origin.x;
        v68 = v101.origin.y;
        v69 = v101.size.width;
        v70 = v101.size.height;
        -[CertUIKeyValueView verifiedLabel](self, "verifiedLabel");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setFrame:", v67, v68, v69, v70);

      }
    }
  }
  -[CertUIKeyValueView verifiedImageView](self, "verifiedImageView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    -[CertUIKeyValueView verifiedImageView](self, "verifiedImageView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "image");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "size");
    v76 = v75;
    v78 = v77;

    -[CertUIKeyValueView verifiedLabel](self, "verifiedLabel");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "frame");
    v80 = CGRectGetMaxX(v102) + 8.0;

    -[CertUIKeyValueView verifiedLabel](self, "verifiedLabel");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "_firstLineBaselineFrameOriginY");
    v83 = v82 - v78;

    v103.origin.x = v80;
    v103.origin.y = v83;
    v103.size.width = v76;
    v103.size.height = v78;
    v104 = CGRectIntegral(v103);
    v84 = v104.origin.x;
    v85 = v104.origin.y;
    v86 = v104.size.width;
    v87 = v104.size.height;
    -[CertUIKeyValueView verifiedImageView](self, "verifiedImageView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setFrame:", v84, v85, v86, v87);

  }
}

- (void)_createVerifiedComponentsIfNeeded
{
  void *v3;
  UIImageView *v4;
  UIImageView *verifiedImageView;
  void *v6;
  void *v7;
  id v8;
  UILabel *v9;
  UILabel *verifiedLabel;
  void *v11;
  void *v12;

  -[CertUIKeyValueView verifiedImageView](self, "verifiedImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", 0);
    verifiedImageView = self->_verifiedImageView;
    self->_verifiedImageView = v4;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_verifiedImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CertUIKeyValueView verifiedColor](self, "verifiedColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](self->_verifiedImageView, "setTintColor:", v6);

    -[CertUIKeyValueView addSubview:](self, "addSubview:", self->_verifiedImageView);
  }
  -[CertUIKeyValueView verifiedLabel](self, "verifiedLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc(MEMORY[0x24BDF6B68]);
    v9 = (UILabel *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    verifiedLabel = self->_verifiedLabel;
    self->_verifiedLabel = v9;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_verifiedLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_verifiedLabel, "setTextColor:", v11);

    -[CertUIKeyValueView verifiedFont](self, "verifiedFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_verifiedLabel, "setFont:", v12);

    -[CertUIKeyValueView addSubview:](self, "addSubview:", self->_verifiedLabel);
  }
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
  -[CertUIKeyValueView preferredValueLabelOriginX](self, "preferredValueLabelOriginX", a3.width, a3.height);
  v6 = width - v5;
  v7 = width - (width - v5) + -10.0;
  -[CertUIKeyValueView keyLabel](self, "keyLabel");
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
  -[CertUIKeyValueView valueLabel](self, "valueLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sizeThatFits:", v6, 3.40282347e38);
  v20 = v19;
  v22 = v21;

  -[CertUIKeyValueView preferredValueLabelOriginX](self, "preferredValueLabelOriginX");
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
  -[CertUIKeyValueView valueLabel](self, "valueLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "text");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "length");

  -[CertUIKeyValueView verifiedLabel](self, "verifiedLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    if (v30)
      v27 = v27 + 5.0;
    -[CertUIKeyValueView verifiedLabel](self, "verifiedLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sizeThatFits:", v6, 3.40282347e38);
    v34 = v33;
    v36 = v35;

    -[CertUIKeyValueView preferredValueLabelOriginX](self, "preferredValueLabelOriginX");
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

- (void)setItemDetail:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "detailTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "detail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUIKeyValueView setKey:value:](self, "setKey:value:", v4, v5);

  objc_msgSend(v10, "detailHighlightColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUIKeyValueView setHighlightTextColor:](self, "setHighlightTextColor:", v6);

  if (objc_msgSend(v10, "showCheckmarkView"))
  {
    objc_msgSend(v10, "checkmarkText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "checkmarkHighlightColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertUIKeyValueView setCheckmarkLabelText:checkmarkLabelColor:showCheckmark:](self, "setCheckmarkLabelText:checkmarkLabelColor:showCheckmark:", v7, v8, objc_msgSend(v10, "showCheckmark"));

  }
  else
  {
    -[CertUIKeyValueView verifiedLabel](self, "verifiedLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", 0);

    -[CertUIKeyValueView verifiedImageView](self, "verifiedImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", 0);
  }

  -[CertUIKeyValueView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[CertUIKeyValueView keyLabel](self, "keyLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[CertUIKeyValueView valueLabel](self, "valueLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v6);

  -[CertUIKeyValueView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setHighlightTextColor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[CertUIKeyValueView keyLabel](self, "keyLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v4);

    -[CertUIKeyValueView valueLabel](self, "valueLabel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v4);

  }
}

- (void)setCheckmarkLabelText:(id)a3 checkmarkLabelColor:(id)a4 showCheckmark:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[CertUIKeyValueView _createVerifiedComponentsIfNeeded](self, "_createVerifiedComponentsIfNeeded");
  if (v5)
  {
    v10 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageNamed:inBundle:", CFSTR("VerifiedCheckmark"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  -[CertUIKeyValueView verifiedLabel](self, "verifiedLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v9);

  -[CertUIKeyValueView verifiedLabel](self, "verifiedLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v8);

  objc_msgSend(v12, "imageWithRenderingMode:", 2);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[CertUIKeyValueView verifiedImageView](self, "verifiedImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setImage:", v16);

  -[CertUIKeyValueView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPreferredValueLabelOriginX:(double)a3
{
  if (a3 >= 0.0 && self->_preferredValueLabelOriginX != a3)
  {
    self->_preferredValueLabelOriginX = a3;
    -[CertUIKeyValueView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)titleFont
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF77C0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)detailFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF77C0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)verifiedFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CertUIKeyValueView detailFont](self, "detailFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)verifiedColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.8, 0.278431373, 1.0);
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

- (UIImageView)verifiedImageView
{
  return self->_verifiedImageView;
}

- (void)setVerifiedImageView:(id)a3
{
  objc_storeStrong((id *)&self->_verifiedImageView, a3);
}

- (UILabel)verifiedLabel
{
  return self->_verifiedLabel;
}

- (void)setVerifiedLabel:(id)a3
{
  objc_storeStrong((id *)&self->_verifiedLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifiedLabel, 0);
  objc_storeStrong((id *)&self->_verifiedImageView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_keyLabel, 0);
}

@end
