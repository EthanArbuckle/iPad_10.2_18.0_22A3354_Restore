@implementation SUUIProductPageCopyrightView

- (void)setColorScheme:(id)a3
{
  SUUIColorScheme *v5;
  SUUIColorScheme **p_colorScheme;
  UILabel *copyrightLabel;
  void *v8;
  void *v9;
  void *v10;
  SUUIColorScheme *v11;

  v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    copyrightLabel = self->_copyrightLabel;
    -[SUUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[SUUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      SUUIColorWithAlpha(v9, 0.3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](copyrightLabel, "setTextColor:", v10);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](copyrightLabel, "setTextColor:", v9);
    }

    v5 = v11;
  }

}

- (NSString)copyrightString
{
  return -[UILabel text](self->_copyrightLabel, "text");
}

- (void)setCopyrightString:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  UILabel *copyrightLabel;
  UILabel *v8;
  UILabel *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  id v17;

  v17 = a3;
  -[UILabel text](self->_copyrightLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v17);

  v6 = v17;
  if ((v5 & 1) == 0)
  {
    copyrightLabel = self->_copyrightLabel;
    if (v17)
    {
      if (!copyrightLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v9 = self->_copyrightLabel;
        self->_copyrightLabel = v8;

        v10 = self->_copyrightLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        -[UILabel setNumberOfLines:](self->_copyrightLabel, "setNumberOfLines:", 0);
        v12 = self->_copyrightLabel;
        -[SUUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[SUUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          SUUIColorWithAlpha(v14, 0.3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v12, "setTextColor:", v15);

        }
        else
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.3);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v12, "setTextColor:", v14);
        }

        -[SUUIProductPageCopyrightView addSubview:](self, "addSubview:", self->_copyrightLabel);
        copyrightLabel = self->_copyrightLabel;
      }
      -[UILabel setText:](copyrightLabel, "setText:", v17);
    }
    else
    {
      -[UILabel removeFromSuperview](copyrightLabel, "removeFromSuperview");
      v16 = self->_copyrightLabel;
      self->_copyrightLabel = 0;

    }
    v6 = v17;
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  UILabel *copyrightLabel;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;

  -[SUUIProductPageCopyrightView bounds](self, "bounds");
  copyrightLabel = self->_copyrightLabel;
  if (copyrightLabel)
  {
    v6 = v3;
    v7 = v4;
    -[UILabel frame](copyrightLabel, "frame");
    v8 = v6 + -30.0;
    -[UILabel sizeThatFits:](self->_copyrightLabel, "sizeThatFits:", v8, v7);
    v10 = (v7 - v9) * 0.5;
    -[UILabel setFrame:](self->_copyrightLabel, "setFrame:", 15.0, roundf(v10), v8, v9);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[UILabel sizeThatFits:](self->_copyrightLabel, "sizeThatFits:", a3.width, a3.height);
  v5 = v4 + 32.0;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_copyrightLabel, 0);
}

@end
