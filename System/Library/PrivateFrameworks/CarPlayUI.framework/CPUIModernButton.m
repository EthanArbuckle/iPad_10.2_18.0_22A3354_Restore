@implementation CPUIModernButton

- (CPUIModernButton)initWithFrame:(CGRect)a3
{
  CPUIModernButton *v3;
  CPUIModernButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CPUIModernButton;
  v3 = -[CPUIModernButton initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CPUIModernButton titleLabel](v3, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 16.0, *MEMORY[0x24BDF7888]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v6);

    -[CPUIModernButton setShowsTouchWhenHighlighted:](v4, "setShowsTouchWhenHighlighted:", 0);
    -[CPUIModernButton setAdjustsImageWhenDisabled:](v4, "setAdjustsImageWhenDisabled:", 0);
    -[CPUIModernButton setAdjustsImageWhenHighlighted:](v4, "setAdjustsImageWhenHighlighted:", 0);
    -[CPUIModernButton _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:", 7.0);
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIModernButton layer](v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCompositingFilter:", v7);

    -[CPUIModernButton layer](v4, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupBlending:", 1);

  }
  return v4;
}

- (BOOL)_supportsFocus
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[CPUIModernButton window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusSystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  int v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  int v22;
  BOOL v23;
  void *v24;
  _BOOL4 v25;
  double v26;
  double v27;
  void *v28;
  _BOOL4 v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)CPUIModernButton;
  -[CPUIModernButton layoutSubviews](&v35, sel_layoutSubviews);
  if (self->_isTouchDown && self->_shouldStaySelected && (-[CPUIModernButton isSelected](self, "isSelected") & 1) == 0)
  {
    v11 = (void *)MEMORY[0x24BDF6950];
    v12 = -[CPUIModernButton _supportsFocus](self, "_supportsFocus");
    v13 = 0.400000006;
    if (!v12)
      v13 = 0.150000006;
    objc_msgSend(v11, "colorWithWhite:alpha:", 1.0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIModernButton setBackgroundColor:](self, "setBackgroundColor:", v14);

    v9 = (void *)MEMORY[0x24BDF6950];
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if ((-[CPUIModernButton isSelected](self, "isSelected") & 1) == 0
    && !-[CPUIModernButton isHighlighted](self, "isHighlighted"))
  {
    v22 = -[CPUIModernButton isFocused](self, "isFocused");
    v23 = -[CPUIModernButton prefersWhiteInDefaultState](self, "prefersWhiteInDefaultState");
    if (v22)
    {
      if (v23)
        objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      else
        objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.600000024);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[CPUIModernButton showButtonBackgroundShape](self, "showButtonBackgroundShape");
      v26 = 0.400000006;
      if (!v25)
        v26 = 0.150000006;
      v27 = 1.0;
      v28 = (void *)MEMORY[0x24BDF6950];
    }
    else
    {
      if (v23)
        objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      else
        objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.600000024);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[CPUIModernButton showButtonBackgroundShape](self, "showButtonBackgroundShape");
      v28 = (void *)MEMORY[0x24BDF6950];
      if (!v29)
      {
        objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
        v30 = objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      }
      v26 = 0.150000006;
      v27 = 1.0;
    }
    objc_msgSend(v28, "colorWithWhite:alpha:", v27, v26);
    v30 = objc_claimAutoreleasedReturnValue();
LABEL_28:
    v31 = (void *)v30;
    -[CPUIModernButton setBackgroundColor:](self, "setBackgroundColor:", v30);

    v32 = (void *)MEMORY[0x24BDF6950];
    v19 = objc_retainAutorelease(v24);
    objc_msgSend(v32, "colorWithCGColor:", objc_msgSend(v19, "CGColor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIModernButton imageView](self, "imageView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTintColor:", v33);

    v18 = (void *)MEMORY[0x24BDF6950];
    goto LABEL_13;
  }
  -[CPUIModernButton titleForState:](self, "titleForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") == 0;

  v5 = (void *)MEMORY[0x24BDF6950];
  v6 = -[CPUIModernButton isFocused](self, "isFocused");
  v7 = 1.0;
  if ((v6 & v4) == 0)
    v7 = 0.400000006;
  objc_msgSend(v5, "colorWithWhite:alpha:", 1.0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIModernButton setBackgroundColor:](self, "setBackgroundColor:", v8);

  v9 = (void *)MEMORY[0x24BDF6950];
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v15 = objc_retainAutorelease(v10);
  objc_msgSend(v9, "colorWithCGColor:", objc_msgSend(v15, "CGColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIModernButton imageView](self, "imageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTintColor:", v16);

  v18 = (void *)MEMORY[0x24BDF6950];
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
  v20 = objc_retainAutorelease(v19);
  objc_msgSend(v18, "colorWithCGColor:", objc_msgSend(v20, "CGColor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIModernButton setTitleColor:forState:](self, "setTitleColor:forState:", v21, 0);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[CPUIModernButton isSelected](self, "isSelected") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CPUIModernButton;
    -[CPUIModernButton setSelected:](&v5, sel_setSelected_, v3);
    -[CPUIModernButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  objc_super v9;
  _QWORD v10[5];

  v9.receiver = self;
  v9.super_class = (Class)CPUIModernButton;
  v6 = a3;
  -[CPUIModernButton touchesBegan:withEvent:](&v9, sel_touchesBegan_withEvent_, v6, a4);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __CPUITouchesContainsTouchType_block_invoke;
  v10[3] = &__block_descriptor_40_e21_B24__0__UITouch_8_B16l;
  v10[4] = 0;
  objc_msgSend(v6, "objectsPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    self->_isTouchDown = 1;
    -[CPUIModernButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v12;
  _QWORD v13[5];

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPUIModernButton;
  -[CPUIModernButton touchesEnded:withEvent:](&v12, sel_touchesEnded_withEvent_, v6, v7);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __CPUITouchesContainsTouchType_block_invoke;
  v13[3] = &__block_descriptor_40_e21_B24__0__UITouch_8_B16l;
  v13[4] = 0;
  objc_msgSend(v6, "objectsPassingTest:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    self->_isTouchDown = 0;
    if (self->_shouldStaySelected
      && (objc_msgSend(v6, "anyObject"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "locationInView:", self),
          -[CPUIModernButton hitTest:withEvent:](self, "hitTest:withEvent:", v7),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          v11))
    {
      -[CPUIModernButton setSelected:](self, "setSelected:", -[CPUIModernButton isSelected](self, "isSelected") ^ 1);
    }
    else
    {
      -[CPUIModernButton setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  objc_super v9;
  _QWORD v10[5];

  v9.receiver = self;
  v9.super_class = (Class)CPUIModernButton;
  v6 = a3;
  -[CPUIModernButton touchesCancelled:withEvent:](&v9, sel_touchesCancelled_withEvent_, v6, a4);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __CPUITouchesContainsTouchType_block_invoke;
  v10[3] = &__block_descriptor_40_e21_B24__0__UITouch_8_B16l;
  v10[4] = 0;
  objc_msgSend(v6, "objectsPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    self->_isTouchDown = 0;
    -[CPUIModernButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPUIModernButton;
  -[CPUIModernButton pressesBegan:withEvent:](&v13, sel_pressesBegan_withEvent_, v6, a4);
  v7 = v6;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "type") == 4)
        {

          -[CPUIModernButton setHighlighted:](self, "setHighlighted:", 1);
          goto LABEL_11;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }

LABEL_11:
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPUIModernButton;
  -[CPUIModernButton pressesEnded:withEvent:](&v13, sel_pressesEnded_withEvent_, v6, a4);
  v7 = v6;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "type") == 4)
        {

          if (self->_shouldStaySelected)
            -[CPUIModernButton setSelected:](self, "setSelected:", -[CPUIModernButton isSelected](self, "isSelected") ^ 1);
          -[CPUIModernButton setHighlighted:](self, "setHighlighted:", 0);
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }

LABEL_13:
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPUIModernButton;
  -[CPUIModernButton pressesCancelled:withEvent:](&v13, sel_pressesCancelled_withEvent_, v6, a4);
  v7 = v6;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "type") == 4)
        {

          -[CPUIModernButton setHighlighted:](self, "setHighlighted:", 0);
          goto LABEL_11;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }

LABEL_11:
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)CPUIModernButton;
  -[CPUIModernButton description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIModernButton identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@; identifier: %@;"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)showButtonBackgroundShape
{
  return self->_showButtonBackgroundShape;
}

- (void)setShowButtonBackgroundShape:(BOOL)a3
{
  self->_showButtonBackgroundShape = a3;
}

- (BOOL)prefersWhiteInDefaultState
{
  return self->_prefersWhiteInDefaultState;
}

- (void)setPrefersWhiteInDefaultState:(BOOL)a3
{
  self->_prefersWhiteInDefaultState = a3;
}

- (BOOL)shouldStaySelected
{
  return self->_shouldStaySelected;
}

- (void)setShouldStaySelected:(BOOL)a3
{
  self->_shouldStaySelected = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)isTouchDown
{
  return self->_isTouchDown;
}

- (void)setIsTouchDown:(BOOL)a3
{
  self->_isTouchDown = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
