@implementation MTUIDateLabel

- (id)viewForLastBaselineLayout
{
  MTUIDateLabel *v2;

  v2 = self;
  if (-[MTUIDateLabel _wantsAutolayout](self, "_wantsAutolayout"))
    v2 = (MTUIDateLabel *)v2->_dateLabel;
  return v2;
}

- (id)viewForFirstBaselineLayout
{
  MTUIDateLabel *v2;

  v2 = self;
  if (-[MTUIDateLabel _wantsAutolayout](self, "_wantsAutolayout"))
    v2 = (MTUIDateLabel *)v2->_dateLabel;
  return v2;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
  -[MTUIDateLabel _updateLabel](self, "_updateLabel");
}

- (MTUIDateLabel)initWithFrame:(CGRect)a3
{
  MTUIDateLabel *v3;
  MTUIDateLabel *v4;
  _BOOL4 v5;
  uint64_t v6;
  UILabel *dateLabel;
  uint64_t v8;
  uint64_t v9;
  UIFont *font;
  uint64_t v11;
  UIColor *textColor;
  uint64_t v13;
  UIFont *timeDesignatorFont;
  void *v15;
  double v16;
  double v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MTUIDateLabel;
  v3 = -[MTUIDateLabel initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MTUIDateLabel setOpaque:](v3, "setOpaque:", 0);
    v5 = -[UIView mtui_isRTL](v4, "mtui_isRTL");
    v6 = objc_opt_new();
    dateLabel = v4->_dateLabel;
    v4->_dateLabel = (UILabel *)v6;

    if (v5)
      v8 = 8;
    else
      v8 = 7;
    -[UILabel setContentMode:](v4->_dateLabel, "setContentMode:", v8);
    -[MTUIDateLabel addSubview:](v4, "addSubview:", v4->_dateLabel);
    -[UILabel font](v4->_dateLabel, "font");
    v9 = objc_claimAutoreleasedReturnValue();
    font = v4->_font;
    v4->_font = (UIFont *)v9;

    -[UILabel textColor](v4->_dateLabel, "textColor");
    v11 = objc_claimAutoreleasedReturnValue();
    textColor = v4->_textColor;
    v4->_textColor = (UIColor *)v11;

    -[UILabel font](v4->_dateLabel, "font");
    v13 = objc_claimAutoreleasedReturnValue();
    timeDesignatorFont = v4->_timeDesignatorFont;
    v4->_timeDesignatorFont = (UIFont *)v13;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v4, sel__updateLabel, *MEMORY[0x24BE677B8], 0);
    objc_msgSend(v15, "addObserver:selector:name:object:", v4, sel__updateLabel, *MEMORY[0x24BDF75A0], 0);
    LODWORD(v16) = 1148829696;
    -[MTUIDateLabel setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 1, v16);
    LODWORD(v17) = 1148829696;
    -[MTUIDateLabel setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 0, v17);

  }
  return v4;
}

- (void)setDateLabelText:(id)a3
{
  NSString *v4;
  NSString *dateLabelText;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_dateLabelText, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    dateLabelText = self->_dateLabelText;
    self->_dateLabelText = v4;

    -[MTUIDateLabel _updateLabel](self, "_updateLabel");
  }

}

- (void)setFont:(id)a3
{
  UIFont *v5;

  v5 = (UIFont *)a3;
  if (self->_font != v5)
  {
    objc_storeStrong((id *)&self->_font, a3);
    -[UILabel setFont:](self->_dateLabel, "setFont:", v5);
    -[MTUIDateLabel _updateLabel](self, "_updateLabel");
  }

}

- (void)setTimeDesignatorFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (self->_timeDesignatorFont != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_timeDesignatorFont, a3);
    -[MTUIDateLabel _updateLabel](self, "_updateLabel");
    v5 = v6;
  }

}

- (void)_updateLabel
{
  if (self->_date)
    -[MTUIDateLabel _updateDateString](self, "_updateDateString");
  else
    -[MTUIDateLabel _updateTextString](self, "_updateTextString");
}

- (void)_updateDateString
{
  void *v3;
  NSDate *date;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  if (self->_date)
  {
    objc_msgSend(MEMORY[0x24BE67838], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    date = self->_date;
    -[MTUIDateLabel timeZone](self, "timeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v3, "localizedTimeStringFromDate:forTimeZone:timeDesignator:", date, v5, &v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v21;

  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x24BE67838], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "timeDesignatorAppearsBeforeTime");

  v10 = *MEMORY[0x24BDF6600];
  v24[0] = *MEMORY[0x24BDF6600];
  -[MTUIDateLabel textColor](self, "textColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  v12 = *MEMORY[0x24BDF65F8];
  v24[1] = *MEMORY[0x24BDF65F8];
  -[MTUIDateLabel font](self, "font");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v6, v14);
  else
    v15 = 0;
  if (objc_msgSend(v7, "length"))
  {
    v22[0] = v10;
    -[MTUIDateLabel textColor](self, "textColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    v22[1] = v12;
    -[MTUIDateLabel font](self, "font");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = *MEMORY[0x24BDF66B8];
    v18 = *MEMORY[0x24BDF66C0];
    v23[1] = v17;
    v23[2] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v7, v19);
    if (v9)
      objc_msgSend(v15, "insertAttributedString:atIndex:", v20, 0);
    else
      objc_msgSend(v15, "appendAttributedString:", v20);

  }
  -[UILabel setAttributedText:](self->_dateLabel, "setAttributedText:", v15);
  -[MTUIDateLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (void)_updateTextString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = *MEMORY[0x24BDF6600];
  -[MTUIDateLabel textColor](self, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = *MEMORY[0x24BDF65F8];
  -[MTUIDateLabel font](self, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTUIDateLabel dateLabelText](self, "dateLabelText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = objc_alloc(MEMORY[0x24BDD1688]);
    -[MTUIDateLabel dateLabelText](self, "dateLabelText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithString:attributes:", v8, v5);

  }
  else
  {
    v9 = 0;
  }

  -[UILabel setAttributedText:](self->_dateLabel, "setAttributedText:", v9);
  -[MTUIDateLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIFont)font
{
  return self->_font;
}

- (NSString)dateLabelText
{
  return self->_dateLabelText;
}

- (NSTimeZone)timeZone
{
  NSTimeZone *timeZone;

  timeZone = self->_timeZone;
  if (timeZone)
    return timeZone;
  objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
  return (NSTimeZone *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setDate:(id)a3
{
  NSDate *v4;
  NSDate *date;

  if (self->_date != a3)
  {
    v4 = (NSDate *)objc_msgSend(a3, "copy");
    date = self->_date;
    self->_date = v4;

    -[MTUIDateLabel _updateLabel](self, "_updateLabel");
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTUIDateLabel;
  -[MTUIDateLabel layoutSubviews](&v3, sel_layoutSubviews);
  -[MTUIDateLabel bounds](self, "bounds");
  -[UILabel setFrame:](self->_dateLabel, "setFrame:");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UILabel intrinsicContentSize](self->_dateLabel, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setTimeZone:(id)a3
{
  NSTimeZone *v5;
  NSTimeZone *v6;

  v5 = (NSTimeZone *)a3;
  if (self->_timeZone != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_timeZone, a3);
    -[MTUIDateLabel _updateLabel](self, "_updateLabel");
    v5 = v6;
  }

}

- (BOOL)_hasFontInfoForVerticalBaselineSpacing
{
  return 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UILabel sizeThatFits:](self->_dateLabel, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (NSDate)date
{
  return self->_date;
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (UIFont)timeDesignatorFont
{
  return self->_timeDesignatorFont;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeDesignatorFont, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_dateLabelText, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
}

@end
