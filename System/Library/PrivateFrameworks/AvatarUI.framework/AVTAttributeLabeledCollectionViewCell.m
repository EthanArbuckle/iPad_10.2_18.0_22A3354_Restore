@implementation AVTAttributeLabeledCollectionViewCell

+ (id)cellIdentifier
{
  return CFSTR("AVTAttributeLabeledCollectionViewCell");
}

- (AVTAttributeLabeledCollectionViewCell)initWithFrame:(CGRect)a3
{
  AVTAttributeLabeledCollectionViewCell *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UILabel *label;
  void *v11;
  double v12;
  uint64_t v13;
  UIVisualEffectView *labelBackgroundView;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AVTAttributeLabeledCollectionViewCell;
  v3 = -[AVTAttributeLabeledCollectionViewCell initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    label = v3->_label;
    v3->_label = (UILabel *)v9;

    +[AVTUIFontRepository attributeViewLabelFont](AVTUIFontRepository, "attributeViewLabelFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_label, "setFont:", v11);

    LODWORD(v12) = 1.0;
    -[UILabel _setHyphenationFactor:](v3->_label, "_setHyphenationFactor:", v12);
    -[UILabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 2);
    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 1);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithFrame:", v5, v6, v7, v8);
    labelBackgroundView = v3->_labelBackgroundView;
    v3->_labelBackgroundView = (UIVisualEffectView *)v13;

    -[AVTAttributeLabeledCollectionViewCell updateLabelBackgroundAppearance](v3, "updateLabelBackgroundAppearance");
    -[UIVisualEffectView layer](v3->_labelBackgroundView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCornerRadius:", 3.0);

    -[UIVisualEffectView setClipsToBounds:](v3->_labelBackgroundView, "setClipsToBounds:", 1);
    -[UIVisualEffectView contentView](v3->_labelBackgroundView, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v3->_label);

    -[AVTAttributeLabeledCollectionViewCell contentView](v3, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v3->_labelBackgroundView);

  }
  return v3;
}

- (void)setShouldHideLabelBackground:(BOOL)a3
{
  if (self->_shouldHideLabelBackground != a3)
  {
    self->_shouldHideLabelBackground = a3;
    -[AVTAttributeLabeledCollectionViewCell updateLabelBackgroundAppearance](self, "updateLabelBackgroundAppearance");
  }
}

- (CGRect)frameForAttributeView
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[AVTAttributeLabeledCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[AVTAttributeLabeledCollectionViewCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  -[AVTAttributeLabeledCollectionViewCell labelVerticalSpace](self, "labelVerticalSpace");
  v10 = v8 - v9;

  v11 = 0.0;
  v12 = 0.0;
  v13 = v5;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[AVTAttributeLabeledCollectionViewCell updateLabelBackgroundAppearance](self, "updateLabelBackgroundAppearance");
  v5.receiver = self;
  v5.super_class = (Class)AVTAttributeLabeledCollectionViewCell;
  -[AVTAttributeLabeledCollectionViewCell traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, v4);

}

- (void)updateLabelBackgroundAppearance
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (-[AVTAttributeLabeledCollectionViewCell shouldHideLabelBackground](self, "shouldHideLabelBackground"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundColor:](self->_labelBackgroundView, "setBackgroundColor:");
  }
  else
  {
    -[AVTAttributeLabeledCollectionViewCell traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceStyle");

    if (v4 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 2);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView setEffect:](self->_labelBackgroundView, "setEffect:");
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 1);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView setEffect:](self->_labelBackgroundView, "setEffect:");
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGray6Color");
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundColor:](self->_labelBackgroundView, "setBackgroundColor:", v5);

  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  objc_super v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  _QWORD v86[2];

  v86[1] = *MEMORY[0x1E0C80C00];
  v80.receiver = self;
  v80.super_class = (Class)AVTAttributeLabeledCollectionViewCell;
  -[AVTAttributeLabeledCollectionViewCell layoutSubviews](&v80, sel_layoutSubviews);
  -[AVTAttributeCollectionViewCell attributeView](self, "attributeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[AVTAttributeCollectionViewCell attributeView](self, "attributeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = (v5 - v7) * 0.5;

  -[AVTAttributeLabeledCollectionViewCell labelVerticalSpace](self, "labelVerticalSpace");
  v10 = ceil(v9 + v8 + -7.0 + -4.0);
  -[AVTAttributeLabeledCollectionViewCell label](self, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAttributeLabeledCollectionViewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  objc_msgSend(v11, "sizeThatFits:", v13, v10);
  v15 = v14;
  v17 = v16;

  -[AVTAttributeLabeledCollectionViewCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v20 = v19;

  v21 = ceil(v15);
  if (v20 >= v21)
    v20 = v21;
  v22 = ceil(v17);
  if (v10 >= v22)
    v23 = v22;
  else
    v23 = v10;
  -[AVTAttributeLabeledCollectionViewCell contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v26 = v25 + -10.0;

  v27 = 10.0;
  if (v20 >= v26)
  {
    -[AVTAttributeLabeledCollectionViewCell contentView](self, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bounds");
    v30 = v29 + -4.0;

    v27 = 0.0;
    if (v20 < v30)
      v27 = 4.0;
  }
  -[AVTAttributeLabeledCollectionViewCell label](self, "label");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "font");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "lineHeight");
  v34 = ceil(v33) + 3.0;

  if (v23 > v34)
  {
    -[AVTAttributeLabeledCollectionViewCell label](self, "label");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "text");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAttributeLabeledCollectionViewCell contentView](self, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bounds");
    v39 = v38 + -10.0 + -1.0;
    v40 = *MEMORY[0x1E0CEA098];
    v85 = *MEMORY[0x1E0CEA098];
    -[AVTAttributeLabeledCollectionViewCell label](self, "label");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "font");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = v42;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, &v85, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "boundingRectWithSize:options:attributes:context:", 1, v43, 0, v39, 1.79769313e308);
    v45 = v44;

    -[AVTAttributeLabeledCollectionViewCell label](self, "label");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "text");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (ceil(v45) <= v10)
    {
      v83 = v40;
      -[AVTAttributeLabeledCollectionViewCell label](self, "label");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "font");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v62;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "boundingRectWithSize:options:attributes:context:", 1, v63, 0, 1.79769313e308, v34);
      v65 = v64;

      -[AVTAttributeLabeledCollectionViewCell contentView](self, "contentView");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "bounds");
      v68 = v67 + -10.0 + -1.0;

      v69 = ceil(v65) * 0.6;
      if (v68 >= v69)
        v20 = v69;
      else
        v20 = v68;
      v27 = 10.0;
    }
    else
    {
      -[AVTAttributeLabeledCollectionViewCell contentView](self, "contentView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "bounds");
      v50 = v49 + -4.0 + -1.0;
      v81 = v40;
      -[AVTAttributeLabeledCollectionViewCell label](self, "label");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "font");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v52;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "boundingRectWithSize:options:attributes:context:", 1, v53, 0, v50, 1.79769313e308);
      v55 = v54;
      v57 = v56;

      v27 = 0.0;
      if (ceil(v57) <= v10)
      {
        -[AVTAttributeLabeledCollectionViewCell contentView](self, "contentView");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "bounds");
        v20 = v59 + -4.0 + -1.0;

        v60 = ceil(v55);
        if (v20 >= v60)
          v20 = v60;
        v27 = 4.0;
      }
    }
  }
  -[AVTAttributeLabeledCollectionViewCell contentView](self, "contentView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "bounds");
  v72 = (v71 - (v27 + v20)) * 0.5;

  -[AVTAttributeCollectionViewCell attributeView](self, "attributeView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "bounds");
  v75 = v74 - v8 + 7.0;

  -[AVTAttributeLabeledCollectionViewCell label](self, "label");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setFrame:", v27 * 0.5, 2.0, v20, v23);

  -[AVTAttributeLabeledCollectionViewCell labelBackgroundView](self, "labelBackgroundView");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setFrame:", v72, v75, v27 + v20, v23 + 4.0);

  -[AVTAttributeLabeledCollectionViewCell contentView](self, "contentView");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAttributeLabeledCollectionViewCell labelBackgroundView](self, "labelBackgroundView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "bringSubviewToFront:", v79);

}

- (void)setLabelString:(id)a3
{
  NSString *v4;
  NSString *labelString;
  NSString *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSString isEqualToString:](self->_labelString, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v8, "copy");
    labelString = self->_labelString;
    self->_labelString = v4;

    v6 = self->_labelString;
    -[AVTAttributeLabeledCollectionViewCell label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    -[AVTAttributeLabeledCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  -[AVTAttributeLabeledCollectionViewCell setLabelString:](self, "setLabelString:", 0);
  -[AVTAttributeLabeledCollectionViewCell label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[AVTAttributeLabeledCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  v4.receiver = self;
  v4.super_class = (Class)AVTAttributeLabeledCollectionViewCell;
  -[AVTAttributeCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
}

- (NSString)labelString
{
  return self->_labelString;
}

- (double)labelVerticalSpace
{
  return self->_labelVerticalSpace;
}

- (void)setLabelVerticalSpace:(double)a3
{
  self->_labelVerticalSpace = a3;
}

- (BOOL)shouldHideLabelBackground
{
  return self->_shouldHideLabelBackground;
}

- (UIVisualEffectView)labelBackgroundView
{
  return self->_labelBackgroundView;
}

- (void)setLabelBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_labelBackgroundView, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_labelBackgroundView, 0);
  objc_storeStrong((id *)&self->_labelString, 0);
}

@end
