@implementation SUUIProductInformationView

- (SUUIProductInformationView)initWithFrame:(CGRect)a3
{
  char *v3;
  SUUIProductInformationView *v4;
  UIView *v10;
  UIView *separatorView;
  UIView *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SUUIProductInformationView;
  v3 = -[SUUIProductInformationView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (SUUIProductInformationView *)v3;
  if (v3)
  {
    __asm { FMOV            V0.2D, #15.0 }
    *(_OWORD *)(v3 + 424) = _Q0;
    *(_OWORD *)(v3 + 440) = _Q0;
    v10 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    separatorView = v4->_separatorView;
    v4->_separatorView = v10;

    v12 = v4->_separatorView;
    -[SUUIColorScheme primaryTextColor](v4->_colorScheme, "primaryTextColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v14);

    }
    -[SUUIProductInformationView addSubview:](v4, "addSubview:", v4->_separatorView);
  }
  return v4;
}

- (BOOL)hidesSeparatorView
{
  return -[UIView isHidden](self->_separatorView, "isHidden");
}

- (void)setHidesSeparatorView:(BOOL)a3
{
  -[UIView setHidden:](self->_separatorView, "setHidden:", a3);
}

- (void)setInformationLines:(id)a3
{
  void *v3;
  NSArray *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  void *j;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  void *k;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  NSMutableArray *keyLabels;
  NSMutableArray *v23;
  NSMutableArray *valueLabels;
  NSMutableArray *v25;
  NSMutableArray *imageValues;
  uint64_t m;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSMutableArray *v47;
  NSMutableArray *v48;
  NSArray *v49;
  NSArray *obj;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[2];
  _QWORD v72[2];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v6 = (NSArray *)a3;
  if (self->_informationLines != v6)
  {
    v49 = v6;
    objc_storeStrong((id *)&self->_informationLines, a3);
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v7 = self->_keyLabels;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    if (v8)
    {
      v3 = (void *)v8;
      v9 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(_QWORD *)v68 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i), "removeFromSuperview");
        }
        v3 = (void *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      }
      while (v3);
    }

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v11 = self->_valueLabels;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    if (v12)
    {
      v3 = (void *)v12;
      v13 = *(_QWORD *)v64;
      do
      {
        for (j = 0; j != v3; j = (char *)j + 1)
        {
          if (*(_QWORD *)v64 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)j), "removeFromSuperview");
        }
        v3 = (void *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
      }
      while (v3);
    }

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v15 = self->_imageValues;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
    if (v16)
    {
      v3 = (void *)v16;
      v17 = *(_QWORD *)v60;
      do
      {
        for (k = 0; k != v3; k = (char *)k + 1)
        {
          if (*(_QWORD *)v60 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)k);
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19 != v20)
            objc_msgSend(v19, "removeFromSuperview");
        }
        v3 = (void *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
      }
      while (v3);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    keyLabels = self->_keyLabels;
    self->_keyLabels = v21;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v23 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    valueLabels = self->_valueLabels;
    self->_valueLabels = v23;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v25 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    imageValues = self->_imageValues;
    self->_imageValues = v25;

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = self->_informationLines;
    v54 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v73, 16);
    if (v54)
    {
      v52 = *MEMORY[0x24BEBB3A8];
      v53 = *(_QWORD *)v56;
      v51 = *MEMORY[0x24BEBB368];
      do
      {
        for (m = 0; m != v54; ++m)
        {
          if (*(_QWORD *)v56 != v53)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * m);
          v29 = objc_alloc_init(MEMORY[0x24BEBD708]);
          objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setFont:", v30);

          objc_msgSend(v29, "setTextAlignment:", 2);
          -[SUUIProductInformationView backgroundColor](self, "backgroundColor");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setBackgroundColor:", v31);

          objc_msgSend(v28, "objectAtIndex:", 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setText:", v32);

          -[SUUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            objc_msgSend(v29, "setTextColor:", v33);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.4);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setTextColor:", v34);

          }
          -[SUUIProductInformationView addSubview:](self, "addSubview:", v29);
          -[NSMutableArray addObject:](self->_keyLabels, "addObject:", v29);
          v35 = objc_alloc_init(MEMORY[0x24BEBB490]);
          objc_msgSend(v35, "setMinimumLineHeight:", 16.0);
          v71[0] = v52;
          v71[1] = v51;
          v72[0] = v35;
          -[SUUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v36;
          if (!v36)
          {
            objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.8);
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v3;
          }
          v72[1] = v37;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v36)

          v39 = objc_alloc_init(MEMORY[0x24BEBD708]);
          objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setFont:", v40);

          objc_msgSend(v39, "setNumberOfLines:", 0);
          -[SUUIProductInformationView backgroundColor](self, "backgroundColor");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setBackgroundColor:", v41);

          v42 = objc_alloc(MEMORY[0x24BDD1458]);
          objc_msgSend(v28, "objectAtIndex:", 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = (void *)objc_msgSend(v42, "initWithString:attributes:", v43, v38);
          objc_msgSend(v39, "setAttributedText:", v44);

          -[SUUIProductInformationView addSubview:](self, "addSubview:", v39);
          -[NSMutableArray addObject:](self->_valueLabels, "addObject:", v39);
          if ((unint64_t)objc_msgSend(v28, "count") >= 3)
          {
            objc_msgSend(v28, "objectAtIndex:", 2);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v45);
              -[SUUIProductInformationView addSubview:](self, "addSubview:", v46);

              if (v46)
              {
                v47 = self->_imageValues;
                goto LABEL_43;
              }
            }
            else
            {

            }
          }
          v48 = self->_imageValues;
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v48;
LABEL_43:
          -[NSMutableArray addObject:](v47, "addObject:", v46);

        }
        v54 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v73, 16);
      }
      while (v54);
    }

    -[SUUIProductInformationView setNeedsLayout](self, "setNeedsLayout");
    v6 = v49;
  }

}

- (void)setColorScheme:(id)a3
{
  SUUIColorScheme *v5;
  SUUIColorScheme **p_colorScheme;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  UIView *separatorView;
  void *v24;
  void *v25;
  UILabel *titleLabel;
  void *v27;
  void *v28;
  SUUIColorScheme *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v29 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v7 = self->_keyLabels;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v35 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          -[SUUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v12, "setTextColor:", v13);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.4);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setTextColor:", v14);

          }
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v9);
    }

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v15 = self->_valueLabels;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          -[SUUIColorScheme primaryTextColor](*p_colorScheme, "primaryTextColor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v20, "setTextColor:", v21);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.8);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setTextColor:", v22);

          }
        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v17);
    }

    separatorView = self->_separatorView;
    -[SUUIColorScheme primaryTextColor](*p_colorScheme, "primaryTextColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      -[UIView setBackgroundColor:](separatorView, "setBackgroundColor:", v24);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](separatorView, "setBackgroundColor:", v25);

    }
    titleLabel = self->_titleLabel;
    -[SUUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      -[UILabel setTextColor:](titleLabel, "setTextColor:", v27);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](titleLabel, "setTextColor:", v28);

    }
    v5 = v29;
  }

}

- (void)setTitle:(id)a3
{
  id v4;
  UILabel *titleLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[UILabel text](self->_titleLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v16 && (objc_msgSend(v4, "isEqualToString:", v16) & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v16)
    {
      if (!titleLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v7 = self->_titleLabel;
        self->_titleLabel = v6;

        v8 = self->_titleLabel;
        -[SUUIProductInformationView backgroundColor](self, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_titleLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        v12 = self->_titleLabel;
        -[SUUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[UILabel setTextColor:](v12, "setTextColor:", v13);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v12, "setTextColor:", v15);

        }
        -[SUUIProductInformationView addSubview:](self, "addSubview:", self->_titleLabel);
        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:");
      -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
      v14 = self->_titleLabel;
      self->_titleLabel = 0;

    }
    -[SUUIProductInformationView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double top;
  UILabel *titleLabel;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double left;
  double v12;
  double v13;
  double right;
  unint64_t v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  UIView *separatorView;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CGFloat rect;
  double rect_8;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  -[SUUIProductInformationView bounds](self, "bounds");
  v46 = v4;
  v47 = v3;
  top = self->_contentInset.top;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel frame](titleLabel, "frame");
    v8 = v7;
    v10 = v9;
    left = self->_contentInset.left;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", left, top + -4.0);
    v54.origin.x = left;
    v54.origin.y = top + -4.0;
    v54.size.width = v8;
    v54.size.height = v10;
    top = CGRectGetMaxY(v54) + -4.0 + 10.0;
  }
  -[SUUIProductInformationView _keyWidth](self, "_keyWidth");
  v51 = v12;
  v13 = self->_contentInset.left;
  right = self->_contentInset.right;
  if (-[NSMutableArray count](self->_keyLabels, "count"))
  {
    v15 = 0;
    v49 = v47 - v13 - right - v51 + -15.0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_keyLabels, "objectAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "frame");
      v17 = self->_contentInset.left;
      v18 = v51;
      objc_msgSend(v16, "sizeThatFits:", v51, 1.79769313e308);
      v20 = v19;
      objc_msgSend(v16, "setFrame:", v17, top + -3.0, v51, v19);
      -[NSMutableArray objectAtIndex:](self->_valueLabels, "objectAtIndex:", v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "frame");
      v55.origin.x = v17;
      v55.origin.y = top + -3.0;
      v55.size.width = v51;
      v55.size.height = v20;
      rect_8 = CGRectGetMaxX(v55) + 15.0;
      objc_msgSend(v21, "sizeThatFits:", v49, 1.79769313e308);
      v23 = v22;
      v25 = v24;
      -[NSMutableArray objectAtIndex:](self->_imageValues, "objectAtIndex:", v15);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      rect = v17;
      if (v26 == v27)
      {
        v28 = 0;
        v38 = -2.0;
      }
      else
      {
        v28 = v26;
        objc_msgSend(v28, "sizeToFit");
        objc_msgSend(v28, "frame");
        v50 = v29;
        v48 = v30;
        v31 = v51;
        v32 = 15.0;
        v33 = top + -3.0;
        v34 = v20;
        if (v23 > 0.0)
        {
          v32 = 5.0;
          objc_msgSend(v21, "sizeThatFits:", v49 - (v50 + 5.0), 1.79769313e308, v51, v20);
          v31 = v35;
          v34 = v36;
          v17 = rect_8;
          v33 = top + -5.0;
          v25 = v34;
          v23 = v35;
        }
        v37 = v17;
        v38 = -2.0;
        objc_msgSend(v28, "setFrame:", CGRectGetMaxX(*(CGRect *)(&v33 - 1)) + v32, top + -2.0, v50, v48);
        v18 = v51;
      }
      objc_msgSend(v21, "setFrame:", rect_8, top + -5.0, v23, v25);
      v56.origin.x = rect;
      v56.origin.y = top + -3.0;
      v56.size.width = v18;
      v56.size.height = v20;
      v39 = CGRectGetMaxY(v56) + v38;
      v57.origin.x = rect_8;
      v57.origin.y = top + -5.0;
      v57.size.width = v23;
      v57.size.height = v25;
      v40 = CGRectGetMaxY(v57) + v38;
      if (v39 < v40)
        v39 = v40;
      if (v28)
      {
        objc_msgSend(v28, "frame");
        v41 = CGRectGetMaxY(v58) + v38;
        if (v41 >= v39)
          v39 = v41;
      }
      top = v39 + 9.0;

      ++v15;
    }
    while (v15 < -[NSMutableArray count](self->_keyLabels, "count"));
  }
  separatorView = self->_separatorView;
  if (separatorView)
  {
    -[UIView frame](separatorView, "frame");
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "scale");
    v45 = 1.0 / v44;

    -[UIView setFrame:](self->_separatorView, "setFrame:", self->_contentInset.left, v46 - v45, v47 - self->_contentInset.left, v45);
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_keyLabels;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v9++), "setBackgroundColor:", v4);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_valueLabels;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14++), "setBackgroundColor:", v4);
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v4);
  v15.receiver = self;
  v15.super_class = (Class)SUUIProductInformationView;
  -[SUUIProductInformationView setBackgroundColor:](&v15, sel_setBackgroundColor_, v4);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  UIEdgeInsets *p_contentInset;
  double v6;
  UILabel *titleLabel;
  double v8;
  double v9;
  double v10;
  double left;
  double right;
  unint64_t v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGSize result;

  width = a3.width;
  p_contentInset = &self->_contentInset;
  v6 = self->_contentInset.top + self->_contentInset.bottom;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel frame](titleLabel, "frame");
    v6 = v6 + v8 + 10.0 + -4.0 + -4.0;
  }
  -[SUUIProductInformationView _keyWidth](self, "_keyWidth");
  v10 = v9;
  left = p_contentInset->left;
  right = p_contentInset->right;
  v31 = v9;
  if (-[NSMutableArray count](self->_keyLabels, "count"))
  {
    v13 = 0;
    v14 = width - left - right - v10 + -15.0;
    v15 = 0.0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_keyLabels, "objectAtIndex:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "frame");
      v18 = v17 + -3.0 + -2.0;

      -[NSMutableArray objectAtIndex:](self->_valueLabels, "objectAtIndex:", v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sizeThatFits:", v14, 1.79769313e308);
      v21 = v20;
      v23 = v22;

      if (v18 >= v23 + -5.0 + -2.0)
        v24 = v18;
      else
        v24 = v23 + -5.0 + -2.0;
      if (v24 <= 0.0)
      {
        -[NSMutableArray objectAtIndex:](self->_imageValues, "objectAtIndex:", v13);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25 != v26)
        {
          -[NSMutableArray objectAtIndex:](self->_imageValues, "objectAtIndex:", v13);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "frame");
          v24 = v28 + 2.0;

        }
      }
      v6 = v6 + v24;
      if (v21 >= v15)
        v15 = v21;
      ++v13;
    }
    while (v13 < -[NSMutableArray count](self->_keyLabels, "count"));
  }
  else
  {
    v15 = 0.0;
  }
  if ((unint64_t)-[NSMutableArray count](self->_keyLabels, "count") > 1)
    v6 = v6 + (float)((float)(unint64_t)(-[NSMutableArray count](self->_keyLabels, "count") - 1) * 9.0);
  v29 = v31 + 15.0 + v15 + p_contentInset->left + p_contentInset->right;
  v30 = v6;
  result.height = v30;
  result.width = v29;
  return result;
}

- (double)_keyWidth
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  uint64_t i;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_keyLabels;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = *(double *)(MEMORY[0x24BDBF028] + 16);
    v7 = *(double *)(MEMORY[0x24BDBF028] + 24);
    v8 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "sizeThatFits:", v6, v7, (_QWORD)v12);
        if (v8 < v10)
          v8 = v10;
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (NSArray)informationLines
{
  return self->_informationLines;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabels, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_keyLabels, 0);
  objc_storeStrong((id *)&self->_imageValues, 0);
  objc_storeStrong((id *)&self->_informationLines, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
}

@end
