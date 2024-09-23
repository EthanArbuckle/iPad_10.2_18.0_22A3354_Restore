@implementation PreferencesTwoPartValueCell

- (TwoPartTextLabel)twoPartTextLabel
{
  TwoPartTextLabel *twoPartLabel;
  TwoPartTextLabel *v4;
  TwoPartTextLabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  twoPartLabel = self->_twoPartLabel;
  if (!twoPartLabel)
  {
    v4 = objc_alloc_init(TwoPartTextLabel);
    v5 = self->_twoPartLabel;
    self->_twoPartLabel = v4;

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TwoPartTextLabel setFont:](self->_twoPartLabel, "setFont:", v6);

    -[PreferencesTwoPartValueCell valueColor](self, "valueColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TwoPartTextLabel setTextColor:](self->_twoPartLabel, "setTextColor:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TwoPartTextLabel setBackgroundColor:](self->_twoPartLabel, "setBackgroundColor:", v8);

    -[PreferencesTwoPartValueCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_twoPartLabel);

    twoPartLabel = self->_twoPartLabel;
  }
  return twoPartLabel;
}

- (UILabel)largePart2TextLabel
{
  UILabel *largePart2TextLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;

  largePart2TextLabel = self->_largePart2TextLabel;
  if (!largePart2TextLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v5 = self->_largePart2TextLabel;
    self->_largePart2TextLabel = v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellBlueTextColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_largePart2TextLabel, "setTextColor:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_largePart2TextLabel, "setBackgroundColor:", v7);

    -[PreferencesTwoPartValueCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_largePart2TextLabel);

    largePart2TextLabel = self->_largePart2TextLabel;
  }
  return largePart2TextLabel;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)PreferencesTwoPartValueCell;
  -[PreferencesTwoPartValueCell description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PreferencesTwoPartValueCell twoPartTextLabel](self, "twoPartTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\t%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (UIColor)valueColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "tableCellBlueTextColor");
}

- (void)layoutText:(id)a3 andValue:(id)a4
{
  id v6;
  int IsLeftToRight;
  double v8;
  CGFloat v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double width;
  double height;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  CGFloat v69;
  CGFloat v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double y;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  void *v86;
  CGFloat v87;
  double x;
  double v89;
  CGFloat v90;
  double v91;
  double rect;
  id v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;

  v93 = a3;
  v6 = a4;
  IsLeftToRight = CalInterfaceIsLeftToRight();
  -[PreferencesTwoPartValueCell directionalLayoutMargins](self, "directionalLayoutMargins");
  v9 = v8;
  -[PreferencesTwoPartValueCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v94.origin.x = v12;
  v94.origin.y = v14;
  v94.size.width = v16;
  v94.size.height = v18;
  v95 = CGRectInset(v94, v9, 0.0);
  x = v95.origin.x;
  width = v95.size.width;
  height = v95.size.height;
  v21 = -[PreferencesTwoPartValueCell indentationLevel](self, "indentationLevel");
  v22 = v9 * (double)v21;
  if (IsLeftToRight)
    v23 = v9 * (double)v21;
  else
    v23 = -0.0;
  v24 = width - v22;
  v25 = (double *)MEMORY[0x1E0C9D820];
  objc_msgSend(v93, "sizeThatFits:", width - v22, height);
  v27 = v26;
  objc_msgSend(v93, "text");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28 && objc_msgSend(v28, "length"))
  {
    objc_msgSend(v93, "superview");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      -[PreferencesTwoPartValueCell contentView](self, "contentView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addSubview:", v93);

    }
  }
  else
  {
    objc_msgSend(v93, "removeFromSuperview");
  }
  v32 = *v25;
  v33 = *v25;
  if (v6)
  {
    objc_msgSend(v6, "sizeThatFits:", v24, height);
    v33 = v34;
    objc_msgSend(v6, "text");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35 && objc_msgSend(v35, "length"))
    {
      objc_msgSend(v6, "superview");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v37)
      {
        -[PreferencesTwoPartValueCell contentView](self, "contentView");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addSubview:", v6);

      }
    }
    else
    {
      objc_msgSend(v6, "removeFromSuperview");
    }

  }
  v39 = objc_msgSend(v93, "numberOfLines");
  v40 = ceil(v24 * (v27 / (v27 + v33 + 6.0)));
  objc_msgSend(v93, "setNumberOfLines:", 1);
  objc_msgSend(v93, "sizeThatFits:", v40, height);
  v42 = v41;
  objc_msgSend(v93, "setNumberOfLines:", 0);
  objc_msgSend(v93, "sizeThatFits:", v40, height);
  v45 = v42 * (double)v39;
  if (v39 <= 0)
    v45 = 3.40282347e38;
  if (v44 < v45)
    v45 = v44;
  v90 = v45;
  if (v44 > v45 || v45 > height)
    v47 = v40;
  else
    v47 = v43;
  objc_msgSend(v93, "setNumberOfLines:", v39);
  v48 = objc_msgSend(v6, "numberOfLines");
  rect = v24;
  v49 = v24 - v47;
  v50 = v24 - v47 + -6.0;
  objc_msgSend(v6, "setNumberOfLines:", 1);
  if (v6)
  {
    objc_msgSend(v6, "sizeThatFits:", v50, height);
    v52 = v51;
    objc_msgSend(v6, "setNumberOfLines:", 0);
    objc_msgSend(v6, "sizeThatFits:", v50, height);
    v32 = v54;
  }
  else
  {
    v52 = v25[1];
    objc_msgSend(0, "setNumberOfLines:", 0);
    v53 = v52;
  }
  v55 = v52 * (double)v48;
  if (v48 <= 0)
    v55 = 3.40282347e38;
  if (v53 < v55)
    v55 = v53;
  v87 = v55;
  v89 = x + v23;
  if (v53 <= v55 && v55 <= height)
    v50 = v32;
  objc_msgSend(v6, "setNumberOfLines:", v48);
  objc_msgSend(v93, "font");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "ascender");
  v59 = v58;
  objc_msgSend(v6, "font");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "ascender");
  v62 = v61;

  if (v59 >= v62)
  {
    objc_msgSend(v93, "font");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "ascender");
    v72 = v71;
    objc_msgSend(v6, "font");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "ascender");
    CalRoundToScreenScale(v72 - v73);
    v70 = v74;
    v69 = 0.0;
  }
  else
  {
    objc_msgSend(v6, "font");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "ascender");
    v65 = v64;
    objc_msgSend(v93, "font");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "ascender");
    CalRoundToScreenScale(v65 - v67);
    v69 = v68;
    v70 = 0.0;
  }

  if (IsLeftToRight)
    v75 = 0.0;
  else
    v75 = v49;
  if (IsLeftToRight)
    v76 = rect - v50;
  else
    v76 = 0.0;
  v96.origin.x = v75;
  v96.origin.y = v69;
  v96.size.width = v47;
  v96.size.height = v90;
  v101.origin.x = v76;
  v101.origin.y = v70;
  v101.size.width = v50;
  v101.size.height = v87;
  v97 = CGRectUnion(v96, v101);
  v77 = CalCeilToScreenScale((height - v97.size.height) * 0.5);
  v98.origin.x = v75;
  v98.origin.y = v69;
  v98.size.width = v47;
  v98.size.height = v90;
  v99 = CGRectOffset(v98, v89, v77);
  v78 = v99.origin.x;
  y = v99.origin.y;
  v80 = v99.size.width;
  v91 = v99.size.height;
  v99.origin.x = v76;
  v99.origin.y = v70;
  v99.size.width = v50;
  v99.size.height = v87;
  v100 = CGRectOffset(v99, v89, v77);
  v81 = v100.origin.x;
  v82 = v100.origin.y;
  v83 = v100.size.width;
  v84 = v100.size.height;
  objc_msgSend(v93, "superview");
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (v85)
    objc_msgSend(v93, "setFrame:", v78, y, v80, v91);
  objc_msgSend(v6, "superview");
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  if (v86)
    objc_msgSend(v6, "setFrame:", v81, v82, v83, v84);

}

- (void)_layoutSubviewsCore
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PreferencesTwoPartValueCell;
  -[EKUITableViewCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PreferencesTwoPartValueCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PreferencesTwoPartValueCell layoutText:andValue:](self, "layoutText:andValue:", v3, self->_twoPartLabel);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  UILabel *largePart2TextLabel;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  objc_super v23;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PreferencesTwoPartValueCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (EKUIUsesLargeTextLayout(v6))
  {

  }
  else
  {
    largePart2TextLabel = self->_largePart2TextLabel;

    if (!largePart2TextLabel)
    {
      v23.receiver = self;
      v23.super_class = (Class)PreferencesTwoPartValueCell;
      -[PreferencesTwoPartValueCell sizeThatFits:](&v23, sel_sizeThatFits_, width, height);
      v9 = v18;
      v17 = v19;
      goto LABEL_6;
    }
  }
  -[PreferencesTwoPartValueCell setNeedsLayout](self, "setNeedsLayout");
  -[PreferencesTwoPartValueCell layoutIfNeeded](self, "layoutIfNeeded");
  v22.receiver = self;
  v22.super_class = (Class)PreferencesTwoPartValueCell;
  -[PreferencesTwoPartValueCell sizeThatFits:](&v22, sel_sizeThatFits_, width, height);
  v9 = v8;
  v11 = v10;
  -[UILabel frame](self->_largePart2TextLabel, "frame");
  v13 = v12;
  -[UILabel font](self->_largePart2TextLabel, "font");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_bodyLeading");
  CalRoundToScreenScale((v13 + v15) * 0.5);
  v17 = v11 + v16;

LABEL_6:
  v20 = v9;
  v21 = v17;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)setStrikeThroughLargeDetailTextLabel:(BOOL)a3
{
  if (self->_strikeThroughLargeDetailTextLabel != a3)
    self->_strikeThroughLargeDetailTextLabel = a3;
  -[PreferencesTwoPartValueCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setStrikeThroughLargePart2TextLabel:(BOOL)a3
{
  if (self->_strikeThroughLargePart2TextLabel != a3)
    self->_strikeThroughLargePart2TextLabel = a3;
  -[PreferencesTwoPartValueCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double MinX;
  void *v52;
  void *v53;
  CGRect rect;
  __objc2_class *v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  *(_QWORD *)&rect.size.height = self;
  v55 = PreferencesTwoPartValueCell;
  -[CGFloat layoutSubviews]((objc_super *)&rect.size.height, sel_layoutSubviews);
  -[PreferencesTwoPartValueCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = EKUIUsesLargeTextLayout(v3);

  if (v4)
  {
    -[PreferencesTwoPartValueCell detailTextLabel](self, "detailTextLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PreferencesTwoPartValueCell largePart2TextLabel](self, "largePart2TextLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (uint64_t *)MEMORY[0x1E0DC11A8];
    if (v6)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v6);
      v11 = *v9;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_strikeThroughLargeDetailTextLabel);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAttribute:value:range:", v11, v12, 0, objc_msgSend(v10, "length"));

      -[PreferencesTwoPartValueCell detailTextLabel](self, "detailTextLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAttributedText:", v10);

    }
    if (v8)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v8);
      v15 = *v9;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_strikeThroughLargePart2TextLabel);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addAttribute:value:range:", v15, v16, 0, objc_msgSend(v14, "length"));

      -[PreferencesTwoPartValueCell largePart2TextLabel](self, "largePart2TextLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAttributedText:", v14);

    }
    if (self->_largePart2TextLabel)
    {
      -[PreferencesTwoPartValueCell textLabel](self, "textLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sizeToFit");

      -[PreferencesTwoPartValueCell detailTextLabel](self, "detailTextLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sizeToFit");

      -[UILabel sizeToFit](self->_largePart2TextLabel, "sizeToFit");
      -[PreferencesTwoPartValueCell textLabel](self, "textLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "frame");
      rect.size.width = v21;
      v23 = v22;
      v25 = v24;
      v27 = v26;

      -[PreferencesTwoPartValueCell detailTextLabel](self, "detailTextLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "frame");
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;

      -[UILabel text](self->_largePart2TextLabel, "text");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "length");

      if (v38)
      {
        -[UILabel font](self->_largePart2TextLabel, "font");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "_bodyLeading");
        CalRoundToScreenScale(v40 * 0.5);
        v42 = v41;

        v43 = v23 - v42;
        -[PreferencesTwoPartValueCell textLabel](self, "textLabel");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setFrame:", rect.size.width, v43, v25, v27);

        v45 = v32 - v42;
        -[PreferencesTwoPartValueCell detailTextLabel](self, "detailTextLabel");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        rect.origin.x = v30;
        objc_msgSend(v46, "setFrame:", v30, v45, v34, v36);

        -[UILabel frame](self->_largePart2TextLabel, "frame");
        v48 = v47;
        v50 = v49;
        if (CalInterfaceIsLeftToRight())
        {
          v56.size.width = v25;
          v56.origin.x = rect.size.width;
          v56.origin.y = v43;
          v56.size.height = v27;
          MinX = CGRectGetMinX(v56);
        }
        else
        {
          v57.size.width = v25;
          v57.origin.x = rect.size.width;
          v57.origin.y = v43;
          v57.size.height = v27;
          MinX = CGRectGetMaxX(v57) - v48;
        }
        v58.origin.x = rect.origin.x;
        v58.origin.y = v45;
        v58.size.width = v34;
        v58.size.height = v36;
        -[UILabel setFrame:](self->_largePart2TextLabel, "setFrame:", MinX, CGRectGetMaxY(v58), v48, v50);
        -[PreferencesTwoPartValueCell contentView](self, "contentView");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "addSubview:", self->_largePart2TextLabel);

      }
    }
    else
    {
      objc_msgSend(0, "removeFromSuperview");
    }

  }
  else
  {
    -[PreferencesTwoPartValueCell textLabel](self, "textLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[PreferencesTwoPartValueCell layoutText:andValue:](self, "layoutText:andValue:", v52, self->_twoPartLabel);

    -[PreferencesTwoPartValueCell checkValueWidths](self, "checkValueWidths");
  }
}

- (void)shorten
{
  EKCellShortener **p_shortener;
  id WeakRetained;
  id v5;

  p_shortener = &self->_shortener;
  WeakRetained = objc_loadWeakRetained((id *)&self->_shortener);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_shortener);
    objc_msgSend(v5, "shortenCell:", self);

    -[PreferencesTwoPartValueCell _layoutSubviewsCore](self, "_layoutSubviewsCore");
  }
}

- (void)checkValueWidths
{
  double v3;
  double v4;
  double v5;

  if (-[TwoPartTextLabel hasTwoParts](self->_twoPartLabel, "hasTwoParts"))
  {
    -[TwoPartTextLabel frame](self->_twoPartLabel, "frame");
    v4 = v3;
    -[TwoPartTextLabel idealSize](self->_twoPartLabel, "idealSize");
    if (v4 < v5)
      -[PreferencesTwoPartValueCell shorten](self, "shorten");
  }
}

- (EKCellShortener)shortener
{
  return (EKCellShortener *)objc_loadWeakRetained((id *)&self->_shortener);
}

- (void)setShortener:(id)a3
{
  objc_storeWeak((id *)&self->_shortener, a3);
}

- (BOOL)strikeThroughLargeDetailTextLabel
{
  return self->_strikeThroughLargeDetailTextLabel;
}

- (BOOL)strikeThroughLargePart2TextLabel
{
  return self->_strikeThroughLargePart2TextLabel;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shortener);
  objc_storeStrong((id *)&self->_largePart2TextLabel, 0);
  objc_storeStrong((id *)&self->_twoPartLabel, 0);
}

@end
