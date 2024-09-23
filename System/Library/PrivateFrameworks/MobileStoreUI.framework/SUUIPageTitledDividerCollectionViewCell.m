@implementation SUUIPageTitledDividerCollectionViewCell

- (SUUIPageTitledDividerCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUIPageTitledDividerCollectionViewCell *v3;
  void *v4;
  UIView *v5;
  UIView *leftLine;
  void *v7;
  UIView *v8;
  UIView *rightLine;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SUUIPageTitledDividerCollectionViewCell;
  v3 = -[SUUIPageTitledDividerCollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    leftLine = v3->_leftLine;
    v3->_leftLine = v5;

    -[UIView setBackgroundColor:](v3->_leftLine, "setBackgroundColor:", v4);
    -[SUUIPageTitledDividerCollectionViewCell contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v3->_leftLine);

    v8 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    rightLine = v3->_rightLine;
    v3->_rightLine = v8;

    -[UIView setBackgroundColor:](v3->_rightLine, "setBackgroundColor:", v4);
    -[SUUIPageTitledDividerCollectionViewCell contentView](v3, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v3->_rightLine);

    *(_OWORD *)&v3->_internalHorizontalMargins.top = xmmword_241EFC300;
    *(_OWORD *)&v3->_internalHorizontalMargins.bottom = xmmword_241EFC300;
    v3->_buttonContentHorizontalPadding = 1.0;

  }
  return v3;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "defaultItemWidthForViewElement:", v7);
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 dividerTitle:(id)a4 context:(id)a5
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v6 = a5;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "_attributedStringForDividerTitle:context:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "size");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v6, "displayScale");

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGSize result;

  v8 = a4;
  v9 = a5;
  v10 = *(double *)(MEMORY[0x24BDBF148] + 8);
  objc_msgSend(v8, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(a1, "_attributedStringForButtonViewElement:context:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "buttonImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v9, "sizeForImageElement:", v13);
      v15 = v14;
      objc_msgSend(a1, "_imageVerticalPaddingForViewElement:", v8);
      v10 = v15 + v16 + v17;
    }
  }
  else
  {
    objc_msgSend(v8, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "style");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_attributedStringForViewElementText:style:context:", v13, v18, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "_titleVerticalPaddingForViewElement:", v8);
  v20 = v19;
  v22 = v21;
  objc_msgSend(v12, "size");
  if (v23 + v20 + v22 >= v10)
    v24 = v23 + v20 + v22;
  else
    v24 = v10;
  objc_msgSend(a1, "_contentEdgeInsetsForViewElement:", v8);
  v27 = v25 + v26 + v24;
  objc_msgSend(v9, "displayScale");
  v29 = 1.0 / v28;
  if (objc_msgSend(v8, "dividerType") == 2)
  {
    +[SUUIPageTitledDividerCollectionViewCell viewElementInsetDividerHeight:](SUUIPageTitledDividerCollectionViewCell, "viewElementInsetDividerHeight:", v8);
    v27 = v27 + v30 + v29 * 2.0;
  }
  if (v27 < v29)
    v27 = v29;

  v31 = a3;
  v32 = v27;
  result.height = v32;
  result.width = v31;
  return result;
}

+ (double)viewElementInsetDividerHeight:(id)a3
{
  void *v3;
  void *v4;
  float v5;
  double v6;

  objc_msgSend(a3, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemHeight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "floatValue");
    v6 = v5;
  }
  else
  {
    v6 = 7.0;
  }

  return v6;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  id v8;
  NSNumber *dividerButtonImageRequestIdentifier;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIView *leftLine;
  void *v15;
  UIView *rightLine;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  SUUIButtonViewElement *v22;
  SUUIButtonViewElement *buttonViewElement;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  UILabel *dividerLabel;
  UILabel *v33;
  UIButton *v34;
  UIButton *dividerButton;
  UIButton *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  UIButton *v43;
  UIButton *v44;
  void *v45;
  void *v46;
  void *v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  UILabel *v52;
  UILabel *v53;
  UILabel *v54;
  UILabel *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  double v73;
  double v74;
  double v75;
  double v76;
  int v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  char v86;
  uint64_t v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  char v94;
  unsigned __int8 v95;
  _QWORD v96[5];
  id v97;
  id v98;
  id v99;
  id v100[2];

  v7 = a3;
  v8 = a5;
  dividerButtonImageRequestIdentifier = self->_dividerButtonImageRequestIdentifier;
  self->_dividerButtonImageRequestIdentifier = 0;

  objc_msgSend(v7, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ikBorderColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithIKColor(v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  leftLine = self->_leftLine;
  if (v13)
  {
    -[UIView setBackgroundColor:](self->_leftLine, "setBackgroundColor:", v13);
    -[UIView setBackgroundColor:](self->_rightLine, "setBackgroundColor:", v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](leftLine, "setBackgroundColor:", v15);

    rightLine = self->_rightLine;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](rightLine, "setBackgroundColor:", v17);

  }
  objc_msgSend((id)objc_opt_class(), "_contentEdgeInsetsForViewElement:", v7);
  self->_contentEdgeInsets.top = v18;
  self->_contentEdgeInsets.left = v19;
  self->_contentEdgeInsets.bottom = v20;
  self->_contentEdgeInsets.right = v21;
  objc_msgSend(v7, "button");
  v22 = (SUUIButtonViewElement *)objc_claimAutoreleasedReturnValue();
  buttonViewElement = self->_buttonViewElement;
  self->_buttonViewElement = v22;

  self->_buttonContentHorizontalPadding = 1.0;
  objc_msgSend((id)objc_opt_class(), "_titleVerticalPaddingForViewElement:", v7);
  self->_titleVerticalPadding.top = v24;
  self->_titleVerticalPadding.left = v25;
  self->_titleVerticalPadding.bottom = v26;
  self->_titleVerticalPadding.right = v27;
  objc_msgSend((id)objc_opt_class(), "_imageVerticalPaddingForViewElement:", v7);
  self->_imageVerticalPadding.top = v28;
  self->_imageVerticalPadding.left = v29;
  self->_imageVerticalPadding.bottom = v30;
  self->_imageVerticalPadding.right = v31;
  if (self->_buttonViewElement)
  {
    v91 = v10;
    dividerLabel = self->_dividerLabel;
    if (dividerLabel)
    {
      -[UILabel removeFromSuperview](dividerLabel, "removeFromSuperview");
      v33 = self->_dividerLabel;
      self->_dividerLabel = 0;

    }
    if (!self->_dividerButton)
    {
      objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
      v34 = (UIButton *)objc_claimAutoreleasedReturnValue();
      dividerButton = self->_dividerButton;
      self->_dividerButton = v34;

      -[UIButton addTarget:action:forControlEvents:](self->_dividerButton, "addTarget:action:forControlEvents:", self, sel__buttonAction_, 64);
      v36 = self->_dividerButton;
      -[SUUIPageTitledDividerCollectionViewCell backgroundColor](self, "backgroundColor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setBackgroundColor:](v36, "setBackgroundColor:", v37);

      LODWORD(v38) = -1102263091;
      -[UIButton setCharge:](self->_dividerButton, "setCharge:", v38);
      -[UIButton setContentHorizontalAlignment:](self->_dividerButton, "setContentHorizontalAlignment:", 1);
      -[SUUIPageTitledDividerCollectionViewCell contentView](self, "contentView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addSubview:", self->_dividerButton);

    }
    -[SUUIButtonViewElement buttonTitleStyle](self->_buttonViewElement, "buttonTitleStyle");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (v40)
    {
      v42 = v40;
    }
    else
    {
      -[SUUIButtonViewElement style](self->_buttonViewElement, "style");
      v42 = (id)objc_claimAutoreleasedReturnValue();
    }
    v93 = v42;

    objc_msgSend((id)objc_opt_class(), "_attributedStringForButtonViewElement:context:", self->_buttonViewElement, v8);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v13;
    if (objc_msgSend(v58, "length"))
    {
      objc_msgSend(v58, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BEBB368], 0, 0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v59 = 0;
    }
    -[SUUIButtonViewElement buttonImage](self->_buttonViewElement, "buttonImage", 648);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v100[0] = 0;
    v92 = v8;
    -[SUUIPageTitledDividerCollectionViewCell _imageForImageViewElement:returningRequestIdentifier:context:](self, "_imageForImageViewElement:returningRequestIdentifier:context:", v60, v100, v8);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v100[0];
    v89 = v100[0];

    objc_storeStrong((id *)&self->_dividerButtonImageRequestIdentifier, v62);
    -[SUUIButtonViewElement buttonImage](self->_buttonViewElement, "buttonImage");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "style");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v64, "ikColor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIViewElementPlainColorWithIKColor(v65, 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v61;
    if (v66)
    {
      objc_msgSend(v61, "_flatImageWithColor:", v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "imageWithRenderingMode:", 2);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v61, "imageWithRenderingMode:", 2);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v69 = (void *)MEMORY[0x24BEBDB00];
    v96[0] = MEMORY[0x24BDAC760];
    v96[1] = 3221225472;
    v96[2] = __79__SUUIPageTitledDividerCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
    v96[3] = &unk_2511F5D20;
    v96[4] = self;
    v97 = v58;
    v98 = v59;
    v99 = v68;
    v70 = v68;
    v71 = v59;
    v72 = v58;
    objc_msgSend(v69, "performWithoutAnimation:", v96);
    v95 = 0;
    v73 = SUUIViewElementPaddingForStyle(v93, (char *)&v95);
    v77 = v95;
    if (v95)
    {
      v78 = v73;
      v79 = v74;
      v80 = v75;
      v81 = v76;
    }
    else
    {
      v78 = *MEMORY[0x24BEBE158];
      v79 = *(double *)(MEMORY[0x24BEBE158] + 8);
      v80 = *(double *)(MEMORY[0x24BEBE158] + 16);
      v81 = *(double *)(MEMORY[0x24BEBE158] + 24);
    }
    v94 = 0;
    v82 = SUUIViewElementPaddingForStyle(v64, &v94);
    if (v94)
    {
      if (v95)
      {
        *(double *)((char *)&self->super.super.super.super.super.isa + v87) = v81 + v83;
        v81 = v85;
      }
      else
      {
        v78 = v82;
        v79 = v83;
        v81 = v85;
        v80 = v84;
      }
    }
    else if (!v77)
    {
      v86 = 1;
      goto LABEL_34;
    }
    v86 = 0;
    self->_internalHorizontalMargins.top = v78;
    self->_internalHorizontalMargins.left = v79;
    self->_internalHorizontalMargins.bottom = v80;
    self->_internalHorizontalMargins.right = v81;
LABEL_34:

    v10 = v91;
    v8 = v92;
    v13 = v90;
    if ((v86 & 1) != 0)
    {
      *(_OWORD *)&self->_internalHorizontalMargins.top = xmmword_241EFC300;
      *(_OWORD *)&self->_internalHorizontalMargins.bottom = xmmword_241EFC300;
    }
    goto LABEL_38;
  }
  v43 = self->_dividerButton;
  if (v43)
  {
    -[UIButton removeFromSuperview](v43, "removeFromSuperview");
    v44 = self->_dividerButton;
    self->_dividerButton = 0;

  }
  v45 = (void *)objc_opt_class();
  objc_msgSend(v7, "text");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "_attributedStringForViewElementText:style:context:", v46, v10, v8);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "elementPadding");
  self->_internalHorizontalMargins.top = v48;
  self->_internalHorizontalMargins.left = v49;
  self->_internalHorizontalMargins.bottom = v50;
  self->_internalHorizontalMargins.right = v51;
  v52 = self->_dividerLabel;
  if (v47)
  {
    if (!v52)
    {
      v53 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
      v54 = self->_dividerLabel;
      self->_dividerLabel = v53;

      v55 = self->_dividerLabel;
      -[SUUIPageTitledDividerCollectionViewCell backgroundColor](self, "backgroundColor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v55, "setBackgroundColor:", v56);

      -[SUUIPageTitledDividerCollectionViewCell contentView](self, "contentView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "addSubview:", self->_dividerLabel);

      v52 = self->_dividerLabel;
    }
    -[UILabel setHidden:](v52, "setHidden:", 0);
    -[UILabel setAttributedText:](self->_dividerLabel, "setAttributedText:", v47);
  }
  else
  {
    -[UILabel setHidden:](v52, "setHidden:", 1);
  }

LABEL_38:
  -[SUUIPageTitledDividerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");

}

uint64_t __79__SUUIPageTitledDividerCollectionViewCell_reloadWithViewElement_width_context___block_invoke(_QWORD *a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1[4] + 728), "setAttributedTitle:forState:", a1[5], 0);
  objc_msgSend(*(id *)(a1[4] + 728), "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setTextColorFollowsTintColor:", a1[6] == 0);

  return objc_msgSend(*(id *)(a1[4] + 728), "setImage:forState:", a1[7], 0);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SUUIPageTitledDividerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  BOOL v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_dividerButtonImageRequestIdentifier
    && (v11 = objc_msgSend(v9, "requestIdentifier"),
        v11 == -[NSNumber unsignedLongLongValue](self->_dividerButtonImageRequestIdentifier, "unsignedLongLongValue")))
  {
    -[SUUIPageTitledDividerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (NSString)dividerTitle
{
  return -[UILabel text](self->_dividerLabel, "text");
}

- (void)setColoringWithColorScheme:(id)a3
{
  UIView *rightLine;
  uint64_t v5;
  UILabel *dividerLabel;
  void *v7;
  UIButton *dividerButton;
  void *v9;
  UIView *leftLine;
  void *v11;
  UIView *v12;
  id v13;

  if (a3)
  {
    objc_msgSend(a3, "primaryTextColor");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_dividerLabel, "setTextColor:", v13);
    -[UIButton setTitleColor:forState:](self->_dividerButton, "setTitleColor:forState:", v13, 0);
    -[UIButton setTintColor:](self->_dividerButton, "setTintColor:", v13);
    -[UIView setBackgroundColor:](self->_leftLine, "setBackgroundColor:", v13);
    rightLine = self->_rightLine;
    v5 = (uint64_t)v13;
  }
  else
  {
    dividerLabel = self->_dividerLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](dividerLabel, "setTextColor:", v7);

    dividerButton = self->_dividerButton;
    -[SUUIPageTitledDividerCollectionViewCell tintColor](self, "tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](dividerButton, "setTitleColor:forState:", v9, 0);

    leftLine = self->_leftLine;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](leftLine, "setBackgroundColor:", v11);

    v12 = self->_rightLine;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v5 = objc_claimAutoreleasedReturnValue();
    rightLine = v12;
    v13 = (id)v5;
  }
  -[UIView setBackgroundColor:](rightLine, "setBackgroundColor:", v5);

}

- (void)setDividerTitle:(id)a3
{
  id v4;
  UILabel *dividerLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[SUUIPageTitledDividerCollectionViewCell dividerTitle](self, "dividerTitle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v15 && (objc_msgSend(v15, "isEqualToString:", v4) & 1) == 0)
  {
    dividerLabel = self->_dividerLabel;
    if (v15)
    {
      if (!dividerLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v7 = self->_dividerLabel;
        self->_dividerLabel = v6;

        v8 = self->_dividerLabel;
        -[SUUIPageTitledDividerCollectionViewCell backgroundColor](self, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_dividerLabel;
        SUUIFontPreferredFontForTextStyle(1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        v12 = self->_dividerLabel;
        objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        -[SUUIPageTitledDividerCollectionViewCell contentView](self, "contentView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubview:", self->_dividerLabel);

        dividerLabel = self->_dividerLabel;
      }
      -[UILabel setHidden:](dividerLabel, "setHidden:", 0);
      -[UILabel setText:](self->_dividerLabel, "setText:", v15);
    }
    else
    {
      -[UILabel setHidden:](dividerLabel, "setHidden:", 1);
    }
    -[SUUIPageTitledDividerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTopEdgeInset:(double)a3
{
  if (vabdd_f64(self->_contentEdgeInsets.top, a3) > 0.00000011920929)
  {
    self->_contentEdgeInsets.top = a3;
    -[SUUIPageTitledDividerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIPageTitledDividerCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v5);

  v6.receiver = self;
  v6.super_class = (Class)SUUIPageTitledDividerCollectionViewCell;
  -[SUUIPageTitledDividerCollectionViewCell applyLayoutAttributes:](&v6, sel_applyLayoutAttributes_, v4);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double right;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  UIButton *dividerButton;
  void *v13;
  UIButton *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  double buttonContentHorizontalPadding;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  void *dividerLabel;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  double v65;
  double v66;
  objc_super v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  v67.receiver = self;
  v67.super_class = (Class)SUUIPageTitledDividerCollectionViewCell;
  -[SUUIPageTitledDividerCollectionViewCell layoutSubviews](&v67, sel_layoutSubviews);
  -[SUUIPageTitledDividerCollectionViewCell bounds](self, "bounds");
  v66 = v3;
  v4 = v3 + -40.0 - self->_internalHorizontalMargins.left;
  right = self->_internalHorizontalMargins.right;
  -[SUUIPageTitledDividerCollectionViewCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  v8 = v7;

  if (v8 <= 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    v8 = v10;

  }
  v11 = v4 - right;
  dividerButton = self->_dividerButton;
  if (dividerButton)
  {
    -[UIButton imageForState:](dividerButton, "imageForState:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIButton layoutIfNeeded](self->_dividerButton, "layoutIfNeeded");
    v14 = self->_dividerButton;
    if (v13)
    {
      -[UIButton imageView](v14, "imageView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
      v17 = v16;

      -[UIButton titleLabel](self->_dividerButton, "titleLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
      v20 = v19;

      v21 = self->_titleVerticalPadding.top - self->_titleVerticalPadding.bottom;
      v22 = self->_imageVerticalPadding.top - self->_imageVerticalPadding.bottom;
      buttonContentHorizontalPadding = self->_buttonContentHorizontalPadding;
      -[UIButton setTitleEdgeInsets:](self->_dividerButton, "setTitleEdgeInsets:", v21, -v17, -v21, v17);
      -[UIButton setImageEdgeInsets:](self->_dividerButton, "setImageEdgeInsets:", v22, v20 + self->_buttonContentHorizontalPadding, -v22, -(v20 + self->_buttonContentHorizontalPadding));
    }
    else
    {
      v41 = *MEMORY[0x24BEBE158];
      v42 = *(double *)(MEMORY[0x24BEBE158] + 8);
      v44 = *(double *)(MEMORY[0x24BEBE158] + 16);
      v43 = *(double *)(MEMORY[0x24BEBE158] + 24);
      -[UIButton setImageEdgeInsets:](v14, "setImageEdgeInsets:", *MEMORY[0x24BEBE158], v42, v44, v43);
      -[UIButton setTitleEdgeInsets:](self->_dividerButton, "setTitleEdgeInsets:", v41, v42, v44, v43);
      buttonContentHorizontalPadding = 0.0;
    }
    v31 = v66;
    -[UIButton frame](self->_dividerButton, "frame");
    v46 = v45;
    v48 = v47;
    -[UIButton sizeThatFits:](self->_dividerButton, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    v69.size.width = v49;
    v51 = v50;
    v69.origin.x = v46;
    v69.origin.y = v48;
    v69.size.height = v51;
    v52 = buttonContentHorizontalPadding + CGRectGetWidth(v69);
    if (v52 >= v11)
      v53 = v11;
    else
      v53 = v52;
    v54 = v46;
    v55 = v48;
    v56 = v51;
    CGRectGetWidth(*(CGRect *)(&v53 - 2));
    UICeilToViewScale();
    v65 = v8;
    UIRectCenteredXInRectScale();
    v33 = v57;
    v35 = v58;
    v37 = v59;
    v39 = v60;
    dividerLabel = self->_dividerButton;
  }
  else
  {
    -[UILabel frame](self->_dividerLabel, "frame");
    v25 = v24;
    v27 = v26;
    -[UILabel sizeThatFits:](self->_dividerLabel, "sizeThatFits:", v11, 1.79769313e308);
    v68.size.width = v28;
    v30 = v29;
    v68.origin.x = v25;
    v68.origin.y = v27;
    v68.size.height = v30;
    CGRectGetWidth(v68);
    UICeilToViewScale();
    v65 = v8;
    v31 = v66;
    UIRectCenteredXInRectScale();
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;
    dividerLabel = self->_dividerLabel;
  }
  objc_msgSend(dividerLabel, "setFrame:", *(_QWORD *)&v65);
  v61 = 1.0 / v8;
  UIFloorToViewScale();
  v63 = v35 + v62;
  v70.origin.x = v33;
  v70.origin.y = v35;
  v70.size.width = v37;
  v70.size.height = v39;
  v64 = CGRectGetMaxX(v70) + self->_internalHorizontalMargins.right;
  -[UIView setFrame:](self->_leftLine, "setFrame:", self->_contentEdgeInsets.left + self->_contentInset.left, v63, v33 - self->_internalHorizontalMargins.left - self->_contentEdgeInsets.left - self->_contentInset.left, v61);
  -[UIView setFrame:](self->_rightLine, "setFrame:", v64, v63, v31 - v64 - self->_contentEdgeInsets.right - self->_contentInset.right, v61);
}

- (void)setBackgroundColor:(id)a3
{
  UILabel *dividerLabel;
  id v5;
  objc_super v6;

  dividerLabel = self->_dividerLabel;
  v5 = a3;
  -[UILabel setBackgroundColor:](dividerLabel, "setBackgroundColor:", v5);
  -[UIButton setBackgroundColor:](self->_dividerButton, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIPageTitledDividerCollectionViewCell;
  -[SUUIPageTitledDividerCollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void)_buttonAction:(id)a3
{
  SUUIButtonViewElement *buttonViewElement;

  buttonViewElement = self->_buttonViewElement;
  if (buttonViewElement)
    -[SUUIButtonViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](buttonViewElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
}

+ (id)_attributedStringForButtonViewElement:(id)a3 context:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "buttonTitleStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v4, "style");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  SUUIViewElementPlainColorWithStyle(v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementFontWithStyle(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    SUUIFontPreferredFontForTextStyle(1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "buttonText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedStringWithDefaultFont:foregroundColor:style:", v10, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_attributedStringForDividerTitle:(id)a3 context:(id)a4
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v4 = (objc_class *)MEMORY[0x24BDD1458];
  v5 = a3;
  v6 = [v4 alloc];
  v12[0] = *MEMORY[0x24BEBB368];
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v12[1] = *MEMORY[0x24BEBB360];
  SUUIFontPreferredFontForTextStyle(1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithString:attributes:", v5, v9);

  return v10;
}

+ (id)_attributedStringForViewElementText:(id)a3 style:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v7 = a4;
  v8 = a5;
  if (a3)
  {
    v9 = a3;
    SUUIViewElementFontWithStyle(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      SUUIFontPreferredFontForTextStyle(1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "tintColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIViewElementPlainColorWithStyle(v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v14;

    objc_msgSend(v9, "attributedStringWithDefaultFont:foregroundColor:style:", v10, v16, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (UIEdgeInsets)_contentEdgeInsetsForViewElement:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
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
  UIEdgeInsets result;

  objc_msgSend(a3, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForStyle:", *MEMORY[0x24BE518E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "UIEdgeInsetsValue");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v7 = 0.0;
    v11 = 15.0;
    v9 = 0.0;
    v13 = 0.0;
  }

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

+ (UIEdgeInsets)_imageVerticalPaddingForViewElement:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  char v18;
  UIEdgeInsets result;

  v4 = *MEMORY[0x24BEBE158];
  v3 = *(double *)(MEMORY[0x24BEBE158] + 8);
  v6 = *(double *)(MEMORY[0x24BEBE158] + 16);
  v5 = *(double *)(MEMORY[0x24BEBE158] + 24);
  objc_msgSend(a3, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "buttonImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v9, "style");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = SUUIViewElementPaddingForStyle(v10, &v18);
    v13 = v12;

    if (v18)
    {
      v6 = v13;
      v4 = v11;
    }

  }
  v14 = v4;
  v15 = v3;
  v16 = v6;
  v17 = v5;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

+ (UIEdgeInsets)_titleVerticalPaddingForViewElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  char v19;
  UIEdgeInsets result;

  v3 = a3;
  objc_msgSend(v3, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v19 = 0;
  if (!v4)
  {
    objc_msgSend(v3, "style");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
LABEL_5:
    v8 = SUUIViewElementPaddingForStyle(v6, &v19);
    v10 = v9;
    goto LABEL_7;
  }
  objc_msgSend(v4, "buttonTitleStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    goto LABEL_5;
  objc_msgSend(v5, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = SUUIViewElementPaddingForStyle(v11, &v19);
  v10 = v12;

LABEL_7:
  v13 = *(double *)(MEMORY[0x24BEBE158] + 8);
  v14 = *(double *)(MEMORY[0x24BEBE158] + 24);
  if (!v19)
  {
    v10 = *(double *)(MEMORY[0x24BEBE158] + 16);
    v8 = *MEMORY[0x24BEBE158];
  }

  v15 = v8;
  v16 = v13;
  v17 = v10;
  v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (id)_imageForImageViewElement:(id)a3 returningRequestIdentifier:(id *)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "resourceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    SUUIImageWithResourceName(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
  }
  else
  {
    objc_msgSend(v8, "requestIdentifierForViewElement:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12
      || (objc_msgSend(v8, "resourceLoader"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v13, "cachedResourceForRequestIdentifier:", objc_msgSend(v12, "unsignedIntegerValue")),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          !v11))
    {
      objc_msgSend(v8, "loadImageForImageElement:reason:", v7, 1);
      v11 = 0;
    }
  }
  if (a4)
    *a4 = objc_retainAutorelease(v12);

  return v11;
}

- (double)topEdgeInset
{
  return self->_topEdgeInset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightLine, 0);
  objc_storeStrong((id *)&self->_leftLine, 0);
  objc_storeStrong((id *)&self->_dividerLabel, 0);
  objc_storeStrong((id *)&self->_dividerButtonImageRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_dividerButton, 0);
  objc_storeStrong((id *)&self->_buttonViewElement, 0);
}

@end
