@implementation HKAxisLabelStyle

+ (HKAxisLabelStyle)labelStyleWithColor:(id)a3 font:(id)a4 horizontalAlignment:(int64_t)a5 verticalAlignment:(int64_t)a6 hyphenationFactor:(id)a7
{
  id v12;
  void *v13;

  v12 = a7;
  objc_msgSend(a1, "labelStyleWithColor:font:horizontalAlignment:verticalAlignment:", a3, a4, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHyphenationFactor:", v12);

  objc_msgSend(v13, "setIsSystemSymbol:", 0);
  return (HKAxisLabelStyle *)v13;
}

+ (HKAxisLabelStyle)labelStyleWithColor:(id)a3 font:(id)a4 horizontalAlignment:(int64_t)a5 verticalAlignment:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;

  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setTextColor:", v10);

  objc_msgSend(v11, "setFont:", v9);
  objc_msgSend(v11, "setHorizontalAlignment:", a5);
  objc_msgSend(v11, "setVerticalAlignment:", a6);
  objc_msgSend(v11, "setIsSystemSymbol:", 0);
  return (HKAxisLabelStyle *)v11;
}

- (void)setVerticalAlignment:(int64_t)a3
{
  self->_verticalAlignment = a3;
}

- (void)setTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHyphenationFactor:(id)a3
{
  objc_storeStrong((id *)&self->_hyphenationFactor, a3);
}

- (void)setHorizontalAlignment:(int64_t)a3
{
  self->_horizontalAlignment = a3;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

+ (HKAxisLabelStyle)labelStyleWithColor:(id)a3 font:(id)a4 horizontalAlignment:(int64_t)a5 verticalAlignment:(int64_t)a6 numberFormatter:(id)a7
{
  id v12;
  void *v13;

  v12 = a7;
  objc_msgSend(a1, "labelStyleWithColor:font:horizontalAlignment:verticalAlignment:", a3, a4, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNumberFormatter:", v12);

  objc_msgSend(v13, "setIsSystemSymbol:", 0);
  return (HKAxisLabelStyle *)v13;
}

+ (HKAxisLabelStyle)labelStyleWithColor:(id)a3 font:(id)a4 horizontalAlignment:(int64_t)a5 verticalAlignment:(int64_t)a6 isSystemSymbol:(BOOL)a7
{
  _BOOL8 v7;
  void *v8;

  v7 = a7;
  objc_msgSend(a1, "labelStyleWithColor:font:horizontalAlignment:verticalAlignment:", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsSystemSymbol:", v7);
  return (HKAxisLabelStyle *)v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[UIColor copy](self->_textColor, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  v7 = -[UIFont copy](self->_font, "copy");
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  *(_QWORD *)(v4 + 32) = self->_horizontalAlignment;
  *(_QWORD *)(v4 + 40) = self->_verticalAlignment;
  objc_storeStrong((id *)(v4 + 48), self->_numberFormatter);
  objc_storeStrong((id *)(v4 + 56), self->_hyphenationFactor);
  *(_BYTE *)(v4 + 8) = self->_isSystemSymbol;
  return (id)v4;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIFont)font
{
  return self->_font;
}

- (int64_t)horizontalAlignment
{
  return self->_horizontalAlignment;
}

- (int64_t)verticalAlignment
{
  return self->_verticalAlignment;
}

- (HKNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_numberFormatter, a3);
}

- (NSNumber)hyphenationFactor
{
  return self->_hyphenationFactor;
}

- (BOOL)isSystemSymbol
{
  return self->_isSystemSymbol;
}

- (void)setIsSystemSymbol:(BOOL)a3
{
  self->_isSystemSymbol = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyphenationFactor, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
}

@end
