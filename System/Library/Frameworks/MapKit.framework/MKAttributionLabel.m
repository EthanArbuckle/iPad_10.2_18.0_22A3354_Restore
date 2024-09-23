@implementation MKAttributionLabel

- (void)sizeToFit
{
  double v3;
  double v4;

  -[NSAttributedString boundingRectWithSize:options:context:](self->_strokeText, "boundingRectWithSize:options:context:", 0, 0, 1000.0, 1000.0);
  -[NSAttributedString boundingRectWithSize:options:context:](self->_innerText, "boundingRectWithSize:options:context:", 0, 0, 1000.0, 1000.0);
  -[MKAttributionLabel frame](self, "frame");
  v4 = v3;
  -[MKAttributionLabel frame](self, "frame");
  -[MKAttributionLabel setFrame:](self, "setFrame:", v4);
}

- (void)setMapType:(unint64_t)a3
{
  if (self->_mapType != a3)
  {
    self->_mapType = a3;
    -[MKAttributionLabel _updateTextColor](self, "_updateTextColor");
  }
}

- (void)setDisplayStyle:(int64_t)a3
{
  if (self->_displayStyle != a3)
  {
    self->_displayStyle = a3;
    -[MKAttributionLabel _prepareLabel](self, "_prepareLabel");
  }
}

- (MKAttributionLabel)initWithFrame:(CGRect)a3
{
  MKAttributionLabel *v3;
  MKAttributionLabel *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)MKAttributionLabel;
  v3 = -[MKAttributionLabel initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = v3;
  if (v3)
  {
    -[MKAttributionLabel setOpaque:](v3, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAttributionLabel setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[MKAttributionLabel setAlpha:](v4, "setAlpha:", 0.5);
    v10[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)-[MKAttributionLabel registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v6, sel_traitEnvironment_didChangeTraitCollection_);

    v4->_useDarkText = 1;
    -[MKAttributionLabel _updateTextColor](v4, "_updateTextColor");
    -[MKAttributionLabel _prepareLabel](v4, "_prepareLabel");
  }
  return v4;
}

- (void)_updateTextColor
{
  _BOOL4 v3;
  unint64_t mapType;
  void *v5;

  v3 = 0;
  mapType = self->_mapType;
  if (mapType - 1 >= 4 && mapType != 107)
  {
    -[MKAttributionLabel traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "userInterfaceStyle") != 2;

  }
  if (self->_useDarkText != v3)
  {
    self->_useDarkText = v3;
    -[MKAttributionLabel _prepareLabel](self, "_prepareLabel");
  }
}

- (void)_prepareLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSAttributedString *v7;
  NSAttributedString *strokeText;
  NSAttributedString *v9;
  NSAttributedString *innerText;
  id v11;

  -[MKAttributionLabel _labelTitle](self, "_labelTitle");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v11);
  -[MKAttributionLabel _attributesWithStroke:](self, "_attributesWithStroke:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributes:range:", v4, 0, objc_msgSend(v3, "length"));

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v11);
  -[MKAttributionLabel _attributesWithStroke:](self, "_attributesWithStroke:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributes:range:", v6, 0, objc_msgSend(v3, "length"));

  v7 = (NSAttributedString *)objc_msgSend(v3, "copy");
  strokeText = self->_strokeText;
  self->_strokeText = v7;

  v9 = (NSAttributedString *)objc_msgSend(v5, "copy");
  innerText = self->_innerText;
  self->_innerText = v9;

  -[MKAttributionLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UIView _mapKit_setNeedsDisplay](self, "_mapKit_setNeedsDisplay");

}

- (id)_attributesWithStroke:(BOOL)a3
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v13[0] = *MEMORY[0x1E0CEA098];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 9.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v4;
    v13[1] = *MEMORY[0x1E0CEA130];
    v5 = 1.0;
    if (!self->_useDarkText)
      v5 = 0.0;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", v5, 0.800000012);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v6;
    v13[2] = *MEMORY[0x1E0CEA138];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 5.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v7;
    v13[3] = *MEMORY[0x1E0CEA180];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[3] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11[0] = *MEMORY[0x1E0CEA098];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 9.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    v11[1] = *MEMORY[0x1E0CEA0A0];
    if (self->_useDarkText)
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v6;
    v11[2] = *MEMORY[0x1E0CEA180];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_labelTitle
{
  int64_t displayStyle;
  __CFString *v3;
  __CFString *v4;

  displayStyle = self->_displayStyle;
  if (!displayStyle)
  {
    v3 = CFSTR("Legal");
    goto LABEL_5;
  }
  if (displayStyle == 1)
  {
    v3 = CFSTR("Map Data");
LABEL_5:
    _MKLocalizedStringFromThisBundle(v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v3 = 0;
  v4 = 0;
LABEL_7:
  if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("<unlocalized>")))

  else
    v3 = v4;
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerText, 0);
  objc_storeStrong((id *)&self->_strokeText, 0);
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a4;
  -[MKAttributionLabel traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");
  v8 = objc_msgSend(v5, "userInterfaceStyle");

  if (v7 != v8)
    -[MKAttributionLabel _updateTextColor](self, "_updateTextColor");
}

- (void)drawRect:(CGRect)a3
{
  NSAttributedString *strokeText;
  NSAttributedString *innerText;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKAttributionLabel;
  -[MKAttributionLabel drawRect:](&v6, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  strokeText = self->_strokeText;
  -[MKAttributionLabel bounds](self, "bounds");
  -[NSAttributedString drawInRect:](strokeText, "drawInRect:");
  innerText = self->_innerText;
  -[MKAttributionLabel bounds](self, "bounds");
  -[NSAttributedString drawInRect:](innerText, "drawInRect:");
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

@end
