@implementation BCChatButton

- (BCChatButton)initWithStyle:(BCChatButtonStyle)style
{
  BCChatButton *v4;
  BCChatButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BCChatButton;
  v4 = -[BCChatButton initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = style;
    -[BCChatButton setup]((uint64_t)v4);
  }
  return v5;
}

- (uint64_t)setup
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;

  +[BCShared classBundle]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CHAT_BUTTON_DOUBLE_LINE_INVERTED"), &stru_24E0651E8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(a1 + 464) = objc_msgSend(v3, "isEqual:", CFSTR("true"));

  v4 = objc_opt_new();
  v5 = *(void **)(a1 + 504);
  *(_QWORD *)(a1 + 504) = v4;

  v6 = objc_alloc(MEMORY[0x24BDF6AE8]);
  v7 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageNamed:inBundle:", CFSTR("MessagesIcon"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "initWithImage:", v9);
  v11 = *(void **)(a1 + 496);
  *(_QWORD *)(a1 + 496) = v10;

  v12 = objc_opt_new();
  v13 = *(void **)(a1 + 480);
  *(_QWORD *)(a1 + 480) = v12;

  v14 = *MEMORY[0x24BDF7880];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 23.0, *MEMORY[0x24BDF7880]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 480), "setFont:", v15);

  +[BCShared classBundle]();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CHAT_BUTTON_DOUBLE_LINE_LARGE_LABEL"), &stru_24E0651E8, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 480), "setText:", v17);

  objc_msgSend(*(id *)(a1 + 480), "setTextAlignment:", 0);
  objc_msgSend(*(id *)(a1 + 480), "setContentMode:", 7);
  v18 = objc_opt_new();
  v19 = *(void **)(a1 + 488);
  *(_QWORD *)(a1 + 488) = v18;

  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 11.0, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 488), "setFont:", v20);

  +[BCShared classBundle]();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CHAT_BUTTON_DOUBLE_LINE_SMALL_LABEL"), &stru_24E0651E8, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 488), "setText:", v22);

  objc_msgSend(*(id *)(a1 + 488), "setTextAlignment:", 0);
  objc_msgSend((id)a1, "_setContinuousCornerRadius:", 8.0);
  objc_msgSend((id)a1, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setMasksToBounds:", 1);

  objc_msgSend((id)a1, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBorderWidth:", 1.0);

  v25 = *(_QWORD *)(a1 + 480);
  v26 = *(id *)(a1 + 504);
  objc_msgSend(v26, "addSubview:", v25);

  v27 = *(_QWORD *)(a1 + 488);
  v28 = *(id *)(a1 + 504);
  objc_msgSend(v28, "addSubview:", v27);

  v29 = *(_QWORD *)(a1 + 496);
  v30 = *(id *)(a1 + 504);
  objc_msgSend(v30, "addSubview:", v29);

  objc_msgSend((id)a1, "addSubview:", *(_QWORD *)(a1 + 504));
  -[BCChatButton updateAppearanceForState:]((id *)a1, 0);
  +[BCShared classBundle]();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("CHAT_BUTTON_ACCESSIBILITY_LABEL"), &stru_24E0651E8, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "setAccessibilityLabel:", v32);

  objc_msgSend((id)a1, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  return objc_msgSend((id)a1, "sizeToFit");
}

- (BCChatButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  BCChatButton *v7;
  BCChatButton *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[BCChatButton initWithStyle:](self, "initWithStyle:", 1);
  v8 = v7;
  if (v7)
    -[BCChatButton setFrame:](v7, "setFrame:", x, y, width, height);
  return v8;
}

- (BCChatButton)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  BCChatButton *v5;
  objc_super v7;

  v4 = coder;
  v7.receiver = self;
  v7.super_class = (Class)BCChatButton;
  v5 = -[BCChatButton initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_style = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("BCChatButtonStyleIdentifier"));
    -[BCChatButton setup]((uint64_t)v5);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t style;
  id v5;
  objc_super v6;

  style = self->_style;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", style, CFSTR("BCChatButtonStyleIdentifier"));
  v6.receiver = self;
  v6.super_class = (Class)BCChatButton;
  -[BCChatButton encodeWithCoder:](&v6, sel_encodeWithCoder_, v5);

}

- (id)updateAppearanceForState:(id *)result
{
  id *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  double *v7;
  void *v8;
  double *v9;
  void *v10;
  double *v11;
  id v12;
  uint64_t v13;
  void *v14;
  double *v15;
  id v16;
  uint64_t v17;
  void *v18;

  if (result)
  {
    v3 = result;
    if (objc_msgSend(result, "isHighlighted"))
      a2 = 1;
    v4 = objc_msgSend(v3, "isEnabled");
    v5 = 2;
    if (v4)
      v5 = a2;
    v6 = 17 * v5;
    v7 = &dbl_21C668EB8[85 * (_QWORD)v3[59] + 17 * v5];
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v7[8], v7[9], v7[10], v7[11]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3[60], "setTextColor:", v8);

    v9 = &dbl_21C668EB8[85 * (_QWORD)v3[59] + v6];
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v9[8], v9[9], v9[10], v9[11]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3[61], "setTextColor:", v10);

    v11 = &dbl_21C668EB8[85 * (_QWORD)v3[59] + v6];
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", *v11, v11[1], v11[2], v11[3]);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v12, "CGColor");
    objc_msgSend(v3, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v13);

    v15 = &dbl_21C668EB8[85 * (_QWORD)v3[59] + v6];
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v15[12], v15[13], v15[14], v15[15]);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "CGColor");
    objc_msgSend(v3, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBorderColor:", v17);

    return (id *)objc_msgSend(v3[62], "setAlpha:", dbl_21C668EB8[85 * (_QWORD)v3[59] + 16 + v6]);
  }
  return result;
}

- (double)calculateButtonLayout
{
  double v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  id v25;
  double v26;
  double v27;
  id v28;
  double v29;
  double v30;
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0.0;
  v2 = *MEMORY[0x24BDF7880];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 11.0, *MEMORY[0x24BDF7880]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 23.0, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(id *)(a1 + 488);
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = *MEMORY[0x24BDF65F8];
  v7 = v43;
  v44[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sizeWithAttributes:", v8);
  v10 = v9;
  v12 = v11;

  v13 = *(id *)(a1 + 480);
  objc_msgSend(v13, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v7;
  v42 = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "sizeWithAttributes:", v15);
  v17 = v16;
  v19 = v18;

  if (*(_BYTE *)(a1 + 464))
  {
    objc_msgSend(*(id *)(a1 + 480), "setFrame:", 41.0, -6.0, v17, v19);
    v20 = &OBJC_IVAR___BCChatButton__smallLabel;
    v21 = *(id *)(a1 + 480);
    objc_msgSend(v21, "frame");
    v23 = v19 + v22;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 488), "setFrame:", 41.0, -1.0, v10, v12);
    v21 = *(id *)(a1 + 488);
    objc_msgSend(v21, "frame");
    v23 = v12 + v24 + -3.0;
    v10 = v17;
    v12 = v19;
    v20 = &OBJC_IVAR___BCChatButton__label;
  }
  objc_msgSend(*(id *)(a1 + *v20), "setFrame:", 41.0, v23, v10, v12);

  v25 = *(id *)(a1 + 480);
  objc_msgSend(v25, "frame");
  v27 = v26;
  v28 = *(id *)(a1 + 480);
  objc_msgSend(v28, "frame");
  v30 = v27 + v29;
  v31 = *(id *)(a1 + 488);
  objc_msgSend(v31, "frame");
  v33 = v32;
  objc_msgSend(*(id *)(a1 + 488), "frame");
  v35 = fmax(v30, v33 + v34);

  objc_msgSend(*(id *)(a1 + 496), "setFrame:", 0.0, 0.0, 32.0, 32.0);
  objc_msgSend((id)a1, "bounds");
  v37 = v36 * 0.5 - v35 * 0.5;
  objc_msgSend((id)a1, "bounds");
  objc_msgSend(*(id *)(a1 + 504), "setFrame:", v37, v38 * 0.5 + -16.0, v35, 32.0);
  v39 = fmax(v35 + 18.0, 156.0);

  return v39;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BCChatButton;
  -[BCChatButton setEnabled:](&v6, sel_setEnabled_);
  if (v3)
    v5 = 0;
  else
    v5 = 2;
  -[BCChatButton updateAppearanceForState:]((id *)&self->super.super.super.super.isa, v5);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)BCChatButton;
  -[BCChatButton setHighlighted:](&v5, sel_setHighlighted_);
  -[BCChatButton updateAppearanceForState:]((id *)&self->super.super.super.super.isa, v3);
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BCChatButton;
  -[BCChatButton setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self)
    -[BCChatButton calculateButtonLayout]((uint64_t)self);
}

- (void)_populateArchivedSubviews:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BCChatButton;
  -[BCChatButton _populateArchivedSubviews:](&v3, sel__populateArchivedSubviews_, a3);
}

- (void)sizeToFit
{
  double v3;
  double v4;

  -[BCChatButton calculateButtonLayout]((uint64_t)self);
  -[BCChatButton frame](self, "frame");
  v4 = v3;
  -[BCChatButton frame](self, "frame");
  -[BCChatButton setFrame:](self, "setFrame:", v4);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BCChatButton;
  -[BCChatButton touchesBegan:withEvent:](&v6, sel_touchesBegan_withEvent_, a3, a4);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__BCChatButton_touchesBegan_withEvent___block_invoke;
  v5[3] = &unk_24E064CC8;
  v5[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v5, 0.2);
}

id *__39__BCChatButton_touchesBegan_withEvent___block_invoke(uint64_t a1)
{
  return -[BCChatButton updateAppearanceForState:](*(id **)(a1 + 32), 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BCChatButton;
  -[BCChatButton touchesEnded:withEvent:](&v6, sel_touchesEnded_withEvent_, a3, a4);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__BCChatButton_touchesEnded_withEvent___block_invoke;
  v5[3] = &unk_24E064CC8;
  v5[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v5, 0.2);
}

id *__39__BCChatButton_touchesEnded_withEvent___block_invoke(uint64_t a1)
{
  return -[BCChatButton updateAppearanceForState:](*(id **)(a1 + 32), 0);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  BCChatButton *v7;
  CGPoint v9;
  CGRect v10;

  y = a3.y;
  x = a3.x;
  -[BCChatButton bounds](self, "bounds", a4);
  v9.x = x;
  v9.y = y;
  if (CGRectContainsPoint(v10, v9))
    v7 = self;
  else
    v7 = 0;
  return v7;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BCChatButton;
  -[BCChatButton layoutSubviews](&v3, sel_layoutSubviews);
  if (self)
    -[BCChatButton calculateButtonLayout]((uint64_t)self);
}

- (id)viewForFirstBaselineLayout
{
  if (self)
    self = (BCChatButton *)self->_smallLabel;
  return self;
}

- (id)viewForLastBaselineLayout
{
  if (self)
    self = (BCChatButton *)self->_label;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centeredView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_smallLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
