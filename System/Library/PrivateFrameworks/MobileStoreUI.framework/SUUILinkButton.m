@implementation SUUILinkButton

+ (SUUILinkButton)buttonWithArrowStyle:(int64_t)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___SUUILinkButton;
  objc_msgSendSuper2(&v8, sel_buttonWithType_, 1);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v4[94] = a3;
  objc_msgSend(v4, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfLines:", 1);

  objc_msgSend(v4, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLineBreakMode:", 4);

  objc_msgSend(v4, "_reloadIcons");
  return (SUUILinkButton *)v4;
}

- (SUUILinkButton)initWithArrowStyle:(int64_t)a3
{
  SUUILinkButton *v4;
  SUUILinkButton *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUILinkButton;
  v4 = -[SUUILinkButton init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_arrowStyle = a3;
    -[SUUILinkButton titleLabel](v4, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", 1);

    -[SUUILinkButton titleLabel](v5, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLineBreakMode:", 4);

    -[SUUILinkButton _reloadIcons](v5, "_reloadIcons");
  }
  return v5;
}

- (void)setTitleColor:(id)a3 forState:(unint64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUILinkButton;
  -[SUUILinkButton setTitleColor:forState:](&v5, sel_setTitleColor_forState_, a3, a4);
  -[SUUILinkButton _reloadIcons](self, "_reloadIcons");
}

- (void)tintColorDidChange
{
  objc_super v3;

  -[SUUILinkButton _reloadIcons](self, "_reloadIcons");
  v3.receiver = self;
  v3.super_class = (Class)SUUILinkButton;
  -[SUUILinkButton tintColorDidChange](&v3, sel_tintColorDidChange);
}

- (void)sizeToFit
{
  -[SUUILinkButton sizeThatFits:](self, "sizeThatFits:", *(double *)(MEMORY[0x24BDBF028] + 16), *(double *)(MEMORY[0x24BDBF028] + 24));
  -[SUUILinkButton frame](self, "frame");
  -[SUUILinkButton setFrame:](self, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
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
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SUUILinkButton imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILinkButton imageForState:](self, "imageForState:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v7);

  -[SUUILinkButton titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILinkButton titleForState:](self, "titleForState:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  v10 = width == *MEMORY[0x24BDBF148];
  v11 = height == *(double *)(MEMORY[0x24BDBF148] + 8);
  if (v10 && v11)
    v12 = *(double *)(MEMORY[0x24BDBF028] + 24);
  else
    v12 = height;
  if (v10 && v11)
    v13 = *(double *)(MEMORY[0x24BDBF028] + 16);
  else
    v13 = width;
  objc_msgSend(v6, "sizeThatFits:", v13, v12);
  v15 = v14;
  v17 = v16;
  -[SUUILinkButton _linkImagePaddingLeft](self, "_linkImagePaddingLeft");
  v19 = v13 - (v15 + v18);
  objc_msgSend(v8, "sizeThatFits:", v19, v12);
  v22 = v21;
  if (v20 >= v19)
    v20 = v19;
  v23 = v15 + v20;
  -[SUUILinkButton _linkImagePaddingLeft](self, "_linkImagePaddingLeft");
  v25 = ceil(v24 + v23);
  if (width >= v25)
    width = v25;
  if (v22 >= v17)
    v26 = v22;
  else
    v26 = v17;
  v27 = ceil(v26);
  if (height >= v27)
    height = v27;

  v28 = width;
  v29 = height;
  result.height = v29;
  result.width = v28;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  float v25;
  double v26;
  double v27;
  float v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  float v36;
  double v37;
  float v38;
  double v39;
  double v40;
  double v41;
  objc_super v42;

  objc_msgSend(MEMORY[0x24BEBDB00], "setAnimationsEnabled:", 0);
  v42.receiver = self;
  v42.super_class = (Class)SUUILinkButton;
  -[SUUILinkButton layoutSubviews](&v42, sel_layoutSubviews);
  -[SUUILinkButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[SUUILinkButton imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILinkButton titleLabel](self, "titleLabel");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = *MEMORY[0x24BDBF148];
  v11 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (v7 && v8)
  {
    -[SUUILinkButton _linkImagePaddingLeft](self, "_linkImagePaddingLeft");
    v13 = v4 - v12;
  }
  else
  {
    v13 = v4;
    v14 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v15 = *MEMORY[0x24BDBF148];
    v16 = v4;
    if (!v7)
      goto LABEL_6;
  }
  objc_msgSend(v7, "sizeThatFits:", v13, v6);
  v15 = v17;
  v14 = v18;
  v16 = v13 - v17;
LABEL_6:
  v41 = v4;
  if (v9)
  {
    objc_msgSend(v9, "sizeThatFits:", v16, v6);
    v11 = v20;
    if (v19 >= v16)
      v10 = v16;
    else
      v10 = v19;
  }
  -[SUUILinkButton _linkImagePaddingLeft](self, "_linkImagePaddingLeft", *(_QWORD *)&v6);
  v22 = v15 + v10 + v21;
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "userInterfaceLayoutDirection");

  if (v7)
  {
    objc_msgSend(v7, "frame");
    v25 = (v40 - v14) * 0.5;
    v26 = v11;
    v27 = roundf(v25);
    v28 = (v41 - v22) * 0.5;
    v29 = roundf(v28);
    if (v24)
      v30 = v29;
    else
      v30 = v22 + v29 - v15;
    -[SUUILinkButton titleLabel](self, "titleLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "font");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "lineHeight");
    v34 = v33;

    if (v34 <= 14.0)
      v35 = v27 + 1.0;
    else
      v35 = v27;
    v11 = v26;
    objc_msgSend(v7, "setFrame:", v30, v35, v15, v14);
  }
  if (v9)
  {
    objc_msgSend(v9, "frame");
    v36 = (v40 - v11) * 0.5;
    v37 = roundf(v36);
    v38 = (v41 - v22) * 0.5;
    v39 = roundf(v38);
    if (v24)
      v39 = v22 + v39 - v10;
    objc_msgSend(v9, "setFrame:", v39, v37, v10, v11);
  }
  objc_msgSend(MEMORY[0x24BEBDB00], "setAnimationsEnabled:", 1);

}

- (double)_linkImagePaddingLeft
{
  double result;
  void *v3;
  void *v4;
  double v5;
  double v6;

  result = 4.0;
  switch(self->_arrowStyle)
  {
    case 0:
    case 1:
    case 5:
      -[SUUILinkButton titleLabel](self, "titleLabel", 4.0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "font");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lineHeight");
      v6 = v5;

      result = 3.0;
      if (v6 < 13.0)
        result = 2.0;
      break;
    case 3:
      result = 3.0;
      break;
    case 4:
      result = 7.0;
      break;
    default:
      return result;
  }
  return result;
}

- (void)_reloadIcons
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  switch(self->_arrowStyle)
  {
    case 0:
      v3 = (void *)MEMORY[0x24BEBD640];
      SUUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("ChevronTerms");
      goto LABEL_9;
    case 1:
      v3 = (void *)MEMORY[0x24BEBD640];
      SUUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("ChevronSeeAll");
      goto LABEL_9;
    case 2:
      v3 = (void *)MEMORY[0x24BEBD640];
      SUUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("MoreDisclosureTriangleMask");
      goto LABEL_9;
    case 3:
      v3 = (void *)MEMORY[0x24BEBD640];
      SUUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("SearchFilterDisclosureChevron");
      goto LABEL_9;
    case 4:
      v3 = (void *)MEMORY[0x24BEBD640];
      SUUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("ChevronSwooshTitle");
      goto LABEL_9;
    case 5:
      v3 = (void *)MEMORY[0x24BEBD640];
      SUUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("ChevronSeeAllLeft");
LABEL_9:
      objc_msgSend(v3, "imageNamed:inBundle:", v5, v4);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v10 = 0;
      break;
  }
  -[SUUILinkButton titleColorForState:](self, "titleColorForState:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 || (-[SUUILinkButton tintColor](self, "tintColor"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v10, "_flatImageWithColor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[SUUILinkButton setImage:forState:](self, "setImage:forState:", v7, 0);
  -[SUUILinkButton titleColorForState:](self, "titleColorForState:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v10, "_flatImageWithColor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  -[SUUILinkButton setImage:forState:](self, "setImage:forState:", v9, 1);

}

- (int64_t)arrowStyle
{
  return self->_arrowStyle;
}

@end
