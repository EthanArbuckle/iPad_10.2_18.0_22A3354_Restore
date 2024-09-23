@implementation _CPUINowPlayingBackButton

- (_CPUINowPlayingBackButton)initWithFrame:(CGRect)a3
{
  _CPUINowPlayingBackButton *v3;
  _CPUINowPlayingBackButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)_CPUINowPlayingBackButton;
  v3 = -[_CPUINowPlayingBackButton initWithFrame:](&v13, sel_initWithFrame_, 0.0, 0.0, 160.0, 44.0);
  v4 = v3;
  if (v3)
  {
    -[_CPUINowPlayingBackButton setShowsTouchWhenHighlighted:](v3, "setShowsTouchWhenHighlighted:", 0);
    -[_CPUINowPlayingBackButton setAdjustsImageWhenDisabled:](v4, "setAdjustsImageWhenDisabled:", 0);
    -[_CPUINowPlayingBackButton setAdjustsImageWhenHighlighted:](v4, "setAdjustsImageWhenHighlighted:", 0);
    -[_CPUINowPlayingBackButton traitCollection](v4, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CPUIImageNamedWithTraitCollection(CFSTR("BackButtonChevron"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageFlippedForRightToLeftLayoutDirection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithRenderingMode:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[_CPUINowPlayingBackButton setImage:forState:](v4, "setImage:forState:", v8, 0);
    CPUILocalizedStringForKey(CFSTR("BACK"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPUINowPlayingBackButton setAccessibilityUserInputLabels:](v4, "setAccessibilityUserInputLabels:", v10);

    -[_CPUINowPlayingBackButton layer](v4, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMasksToBounds:", 0);

  }
  return v4;
}

- (void)layoutSubviews
{
  int v3;
  void *v4;
  void *v5;
  double v6;
  CPUIFocusRingView *v7;
  CPUIFocusRingView *v8;
  CPUIFocusRingView *focusRing;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  objc_super v51;
  _QWORD v52[6];

  v52[4] = *MEMORY[0x24BDAC8D0];
  v51.receiver = self;
  v51.super_class = (Class)_CPUINowPlayingBackButton;
  -[_CPUINowPlayingBackButton layoutSubviews](&v51, sel_layoutSubviews);
  v3 = -[_CPUINowPlayingBackButton isFocused](self, "isFocused");
  -[_CPUINowPlayingBackButton focusRing](self, "focusRing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {

    if (v5)
    {
      -[_CPUINowPlayingBackButton focusRing](self, "focusRing");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHidden:", 0);
      v6 = 1.0;
    }
    else
    {
      v7 = [CPUIFocusRingView alloc];
      v8 = -[CPUIFocusRingView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      focusRing = self->_focusRing;
      self->_focusRing = v8;

      -[_CPUINowPlayingBackButton focusRing](self, "focusRing");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v6 = 1.0;
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.600000024);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPUINowPlayingBackButton focusRing](self, "focusRing");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setRingColor:", v11);

      -[_CPUINowPlayingBackButton focusRing](self, "focusRing");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCornerRadius:", 14.0);

      -[_CPUINowPlayingBackButton focusRing](self, "focusRing");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPUINowPlayingBackButton addSubview:](self, "addSubview:", v14);

      v43 = (void *)MEMORY[0x24BDD1628];
      -[_CPUINowPlayingBackButton focusRing](self, "focusRing");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "centerXAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPUINowPlayingBackButton imageView](self, "imageView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "centerXAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintEqualToAnchor:", v48);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v47;
      -[_CPUINowPlayingBackButton focusRing](self, "focusRing");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "centerYAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPUINowPlayingBackButton imageView](self, "imageView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "centerYAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "constraintEqualToAnchor:", v42);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v52[1] = v41;
      -[_CPUINowPlayingBackButton focusRing](self, "focusRing");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "heightAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToConstant:", 28.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v52[2] = v15;
      -[_CPUINowPlayingBackButton focusRing](self, "focusRing");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "widthAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPUINowPlayingBackButton focusRing](self, "focusRing");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "heightAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToAnchor:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v52[3] = v20;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "activateConstraints:", v21);

    }
  }
  else
  {
    objc_msgSend(v4, "setHidden:", 1);
    v6 = 0.600000024;
  }

  if (-[_CPUINowPlayingBackButton isHighlighted](self, "isHighlighted"))
  {
    -[_CPUINowPlayingBackButton focusRing](self, "focusRing");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAlpha:", 0.600000024);

    v23 = 1.0;
  }
  else if (-[_CPUINowPlayingBackButton isFocused](self, "isFocused"))
  {
    v23 = v6;
  }
  else
  {
    v23 = 0.600000024;
  }
  v24 = (void *)MEMORY[0x24BDF6950];
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, v23);
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v24, "colorWithCGColor:", objc_msgSend(v25, "CGColor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CPUINowPlayingBackButton imageView](self, "imageView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTintColor:", v26);

  -[_CPUINowPlayingBackButton traitCollection](self, "traitCollection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "layoutDirection");

  -[_CPUINowPlayingBackButton imageView](self, "imageView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "frame");
  v32 = v31;
  v34 = v33;
  v36 = v35;

  if (v29)
    v37 = 132.0;
  else
    v37 = 0.0;
  -[_CPUINowPlayingBackButton imageView](self, "imageView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFrame:", v37, v32, v34, v36);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  objc_super v9;
  _QWORD v10[5];

  v9.receiver = self;
  v9.super_class = (Class)_CPUINowPlayingBackButton;
  v6 = a3;
  -[_CPUINowPlayingBackButton touchesEnded:withEvent:](&v9, sel_touchesEnded_withEvent_, v6, a4);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __CPUITouchesContainsTouchType_block_invoke_0;
  v10[3] = &__block_descriptor_40_e21_B24__0__UITouch_8_B16l;
  v10[4] = 0;
  objc_msgSend(v6, "objectsPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    if (-[_CPUINowPlayingBackButton isFocused](self, "isFocused"))
      -[_CPUINowPlayingBackButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
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
  v13.super_class = (Class)_CPUINowPlayingBackButton;
  -[_CPUINowPlayingBackButton pressesBegan:withEvent:](&v13, sel_pressesBegan_withEvent_, v6, a4);
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

          -[_CPUINowPlayingBackButton setHighlighted:](self, "setHighlighted:", 1);
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
  v13.super_class = (Class)_CPUINowPlayingBackButton;
  -[_CPUINowPlayingBackButton pressesEnded:withEvent:](&v13, sel_pressesEnded_withEvent_, v6, a4);
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

          -[_CPUINowPlayingBackButton setHighlighted:](self, "setHighlighted:", 0);
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
  v13.super_class = (Class)_CPUINowPlayingBackButton;
  -[_CPUINowPlayingBackButton pressesCancelled:withEvent:](&v13, sel_pressesCancelled_withEvent_, v6, a4);
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

          -[_CPUINowPlayingBackButton setHighlighted:](self, "setHighlighted:", 0);
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

- (CPUIFocusRingView)focusRing
{
  return self->_focusRing;
}

- (void)setFocusRing:(id)a3
{
  objc_storeStrong((id *)&self->_focusRing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusRing, 0);
}

@end
