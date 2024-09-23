@implementation PreferencesDoubleTwoPartValueCell

- (UILabel)textLabel2
{
  UILabel *textLabel2;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;

  textLabel2 = self->_textLabel2;
  if (!textLabel2)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v5 = self->_textLabel2;
    self->_textLabel2 = v4;

    _calendarPreferencesTableAdditionsBoldFont();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_textLabel2, "setFont:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_textLabel2, "setBackgroundColor:", v7);

    -[PreferencesDoubleTwoPartValueCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_textLabel2);

    textLabel2 = self->_textLabel2;
  }
  return textLabel2;
}

- (TwoPartTextLabel)twoPartTextLabel2
{
  TwoPartTextLabel *twoPartLabel2;
  TwoPartTextLabel *v4;
  TwoPartTextLabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  twoPartLabel2 = self->_twoPartLabel2;
  if (!twoPartLabel2)
  {
    v4 = objc_alloc_init(TwoPartTextLabel);
    v5 = self->_twoPartLabel2;
    self->_twoPartLabel2 = v4;

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TwoPartTextLabel setFont:](self->_twoPartLabel2, "setFont:", v6);

    -[PreferencesTwoPartValueCell valueColor](self, "valueColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TwoPartTextLabel setTextColor:](self->_twoPartLabel2, "setTextColor:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TwoPartTextLabel setBackgroundColor:](self->_twoPartLabel2, "setBackgroundColor:", v8);

    -[PreferencesDoubleTwoPartValueCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_twoPartLabel2);

    twoPartLabel2 = self->_twoPartLabel2;
  }
  return twoPartLabel2;
}

- (void)_layoutSubviewsCore
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PreferencesDoubleTwoPartValueCell;
  -[PreferencesTwoPartValueCell _layoutSubviewsCore](&v4, sel__layoutSubviewsCore);
  -[PreferencesDoubleTwoPartValueCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PreferencesDoubleTwoPartValueCell layoutText:andValue:](self, "layoutText:andValue:", v3, self->_twoPartLabel2);

}

- (void)checkValueWidths
{
  void *v3;
  double v4;
  double v5;
  double v6;
  TwoPartTextLabel **p_twoPartLabel2;
  char v8;
  double v9;
  double v10;
  double v11;

  -[PreferencesTwoPartValueCell shortener](self, "shortener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (-[TwoPartTextLabel hasTwoParts](self->super._twoPartLabel, "hasTwoParts")
      && (-[TwoPartTextLabel frame](self->super._twoPartLabel, "frame"),
          v5 = v4,
          -[TwoPartTextLabel idealSize](self->super._twoPartLabel, "idealSize"),
          v5 < v6))
    {
      p_twoPartLabel2 = &self->_twoPartLabel2;
      if (!-[TwoPartTextLabel hasTwoParts](self->_twoPartLabel2, "hasTwoParts"))
        goto LABEL_11;
      v8 = 1;
    }
    else
    {
      p_twoPartLabel2 = &self->_twoPartLabel2;
      if (!-[TwoPartTextLabel hasTwoParts](self->_twoPartLabel2, "hasTwoParts"))
        return;
      v8 = 0;
    }
    -[TwoPartTextLabel frame](*p_twoPartLabel2, "frame");
    v10 = v9;
    -[TwoPartTextLabel idealSize](*p_twoPartLabel2, "idealSize");
    if ((v8 & 1) == 0 && v10 >= v11)
      return;
LABEL_11:
    -[PreferencesTwoPartValueCell shorten](self, "shorten");
  }
}

- (void)layoutText:(id)a3 andValue:(id)a4
{
  UILabel *textLabel2;
  TwoPartTextLabel *twoPartLabel2;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  objc_super v46;
  objc_super v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v47.receiver = self;
  v47.super_class = (Class)PreferencesDoubleTwoPartValueCell;
  -[PreferencesTwoPartValueCell layoutText:andValue:](&v47, sel_layoutText_andValue_, a3, a4);
  textLabel2 = self->_textLabel2;
  twoPartLabel2 = self->_twoPartLabel2;
  v46.receiver = self;
  v46.super_class = (Class)PreferencesDoubleTwoPartValueCell;
  -[PreferencesTwoPartValueCell layoutText:andValue:](&v46, sel_layoutText_andValue_, textLabel2, twoPartLabel2);
  -[PreferencesDoubleTwoPartValueCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[PreferencesDoubleTwoPartValueCell textLabel](self, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v48.origin.x = v9;
  v48.origin.y = v11;
  v48.size.width = v13;
  v48.size.height = v15;
  v23 = CGRectGetMinY(v48) + 9.0;
  -[PreferencesDoubleTwoPartValueCell textLabel](self, "textLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v18, v23, v20, v22);

  -[PreferencesTwoPartValueCell twoPartTextLabel](self, "twoPartTextLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v49.origin.x = v9;
  v49.origin.y = v11;
  v49.size.width = v13;
  v49.size.height = v15;
  v32 = CGRectGetMinY(v49) + 9.0;
  -[PreferencesTwoPartValueCell twoPartTextLabel](self, "twoPartTextLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFrame:", v27, v32, v29, v31);

  -[UILabel frame](self->_textLabel2, "frame");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v50.origin.x = v9;
  v50.origin.y = v11;
  v50.size.width = v13;
  v50.size.height = v15;
  -[UILabel setFrame:](self->_textLabel2, "setFrame:", v35, CGRectGetMaxY(v50) + -9.0 - v39, v37, v39);
  -[TwoPartTextLabel frame](self->_twoPartLabel2, "frame");
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v51.origin.x = v9;
  v51.origin.y = v11;
  v51.size.width = v13;
  v51.size.height = v15;
  -[TwoPartTextLabel setFrame:](self->_twoPartLabel2, "setFrame:", v41, CGRectGetMaxY(v51) + -9.0 - v45, v43, v45);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_twoPartLabel2, 0);
  objc_storeStrong((id *)&self->_textLabel2, 0);
}

@end
