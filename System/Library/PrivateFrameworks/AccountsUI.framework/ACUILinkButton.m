@implementation ACUILinkButton

- (ACUILinkButton)initWithText:(id)a3 target:(id)a4 action:(SEL)a5
{
  ACUILinkButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ACUILinkButton *v11;
  ACUILinkButton *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  ACUILinkButton *v21;
  id v22;
  id v23[5];
  objc_super v24;
  SEL v25;
  id v26;
  id location[2];
  ACUILinkButton *v28;

  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = 0;
  objc_storeStrong(&v26, a4);
  v25 = a5;
  v5 = v28;
  v28 = 0;
  v24.receiver = v5;
  v24.super_class = (Class)ACUILinkButton;
  v21 = -[ACUILinkButton init](&v24, sel_init);
  v28 = v21;
  objc_storeStrong((id *)&v28, v21);
  if (v21)
  {
    -[ACUILinkButton setAcui_titleString:](v28, "setAcui_titleString:", location[0]);
    -[ACUILinkButton addTarget:action:forControlEvents:](v28, "addTarget:action:forControlEvents:", v26, v25, 64);
    v12 = v28;
    UIEdgeInsetsMake();
    v23[1] = v6;
    v23[2] = v7;
    v23[3] = v8;
    v23[4] = v9;
    -[ACUILinkButton setContentEdgeInsets:](v12, "setContentEdgeInsets:", *(double *)&v6, *(double *)&v7, *(double *)&v8, *(double *)&v9);
    v14 = objc_alloc(MEMORY[0x1E0CB3498]);
    v13 = location[0];
    v15 = -[ACUILinkButton _normalStringAttributes](v28, "_normalStringAttributes");
    v23[0] = (id)objc_msgSend(v14, "initWithString:attributes:", v13);

    v17 = objc_alloc(MEMORY[0x1E0CB3498]);
    v16 = location[0];
    v18 = -[ACUILinkButton _highlightedStringAttributes](v28, "_highlightedStringAttributes");
    v22 = (id)objc_msgSend(v17, "initWithString:attributes:", v16);

    -[ACUILinkButton setAttributedTitle:forState:](v28, "setAttributedTitle:forState:", v23[0], 0);
    -[ACUILinkButton setAttributedTitle:forState:](v28, "setAttributedTitle:forState:", v22, 1);
    -[ACUILinkButton sizeToFit](v28, "sizeToFit");
    objc_storeStrong(&v22, 0);
    objc_storeStrong(v23, 0);
  }
  v11 = v28;
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v28, 0);
  return v11;
}

- (id)_highlightedStringAttributes
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0CEA098];
  v5 = (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 14.0);
  v7[0] = v5;
  v6[1] = *MEMORY[0x1E0CEA0A0];
  v3 = (id)objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v7[1] = v3;
  v4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);

  return v4;
}

- (id)_normalStringAttributes
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0CEA098];
  v5 = (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 14.0);
  v7[0] = v5;
  v6[1] = *MEMORY[0x1E0CEA0A0];
  v3 = (id)objc_msgSend(MEMORY[0x1E0CEA478], "_systemInteractionTintColor");
  v7[1] = v3;
  v4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);

  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  ACUILinkButton *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)ACUILinkButton;
  -[ACUILinkButton setHighlighted:](&v3, sel_setHighlighted_, a3);
  -[ACUILinkButton setNeedsDisplay](v6, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  id v9[2];
  ACUILinkButton *v10;
  CGRect v11;

  v11 = a3;
  v10 = self;
  v9[1] = (id)a2;
  if ((-[ACUILinkButton isHighlighted](self, "isHighlighted") & 1) != 0)
  {
    v7 = (id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.200000003);
    objc_msgSend(v7, "set");

    v8 = (void *)MEMORY[0x1E0CEA390];
    -[ACUILinkButton bounds](v10, "bounds");
    v9[0] = (id)objc_msgSend(v8, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", 255, v3, v4, v5, v6, 4.0);
    objc_msgSend(v9[0], "fill");
    objc_storeStrong(v9, 0);
  }
}

- (NSString)acui_titleString
{
  return (NSString *)objc_getProperty(self, a2, 752, 1);
}

- (void)setAcui_titleString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 752);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acui_titleString, 0);
}

@end
