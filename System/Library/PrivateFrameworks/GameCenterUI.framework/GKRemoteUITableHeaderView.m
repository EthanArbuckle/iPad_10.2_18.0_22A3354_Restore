@implementation GKRemoteUITableHeaderView

- (GKRemoteUITableHeaderView)initWithAttributes:(id)a3
{
  id v6;
  GKRemoteUITableHeaderView *v7;
  GKRemoteUITableHeaderView *v8;
  void *v9;
  GKRemoteUITableHeaderView *v10;
  void *v12;
  void *v13;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GKRemoteUITableHeaderView;
  v7 = -[GKRemoteUITableHeaderView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_attributes, a3);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("GKLayoutStyle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_layoutStyle = objc_msgSend(v9, "integerValue");

    -[GKRemoteUITableHeaderView createLabelWithAttributes:](v8, "createLabelWithAttributes:", v6);
    -[GKRemoteUITableHeaderView createSubLabelWithAttributes:](v8, "createSubLabelWithAttributes:", v6);
    -[GKRemoteUITableHeaderView createButtonWithAttributes:](v8, "createButtonWithAttributes:", v6);
    if (!v8->_label)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("GKRemoteUITableHeaderView.m"), 78, CFSTR("You MUST have a label. That's why you have a header view in the first place."));

    }
    if (v8->_subLabel && v8->_button)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("GKRemoteUITableHeaderView.m"), 79, CFSTR("No specs for having both a button and a sub label. Choose one or the other."));

    }
    -[GKRemoteUITableHeaderView applyConstraints](v8, "applyConstraints");
    v10 = v8;
  }

  return v8;
}

- (GKRemoteUIAuxiliaryViewDelegate)delegate
{
  return (GKRemoteUIAuxiliaryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)createButtonWithAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  GKButton *v8;
  GKButton *button;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D25B28], "textStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("buttonStyle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "styleWithName:fallback:layoutMode:", v6, CFSTR("remoteUITableHeaderButton"), -[GKRemoteUITableHeaderView layoutStyle](self, "layoutStyle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[GKButton buttonWithType:](GKButton, "buttonWithType:", 1);
    v8 = (GKButton *)objc_claimAutoreleasedReturnValue();
    button = self->_button;
    self->_button = v8;

    -[GKButton setTitle:forState:](self->_button, "setTitle:forState:", v4, 0);
    -[GKButton setTranslatesAutoresizingMaskIntoConstraints:](self->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel_buttonTapped_, 64);
    -[GKButton applyTextStyle:](self->_button, "applyTextStyle:", v7);
    -[GKRemoteUITableHeaderView addSubview:](self, "addSubview:", self->_button);

  }
}

- (void)createLabelWithAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  GKLabel *v10;
  GKLabel *v11;
  GKLabel *label;
  void *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("label"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D25B28], "textStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("labelStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "styleWithName:fallback:layoutMode:", v6, CFSTR("remoteUITableHeaderLabel"), -[GKRemoteUITableHeaderView layoutStyle](self, "layoutStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("labelNumberOfLines"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "integerValue");
  v10 = [GKLabel alloc];
  v11 = -[GKLabel initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  label = self->_label;
  self->_label = v11;

  -[GKLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[GKLabel setNumberOfLines:](self->_label, "setNumberOfLines:", 0);
  objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\n"), CFSTR("\n"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLabel setText:](self->_label, "setText:", v13);

  if (v9 >= 1)
    -[GKLabel setNumberOfLines:](self->_label, "setNumberOfLines:", v9);
  -[GKLabel applyTextStyle:](self->_label, "applyTextStyle:", v7);
  -[GKRemoteUITableHeaderView addSubview:](self, "addSubview:", self->_label);

}

- (void)createSubLabelWithAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  GKLabel *v12;
  GKLabel *v13;
  GKLabel *subLabel;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("subLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\n"), CFSTR("\n"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D25B28], "textStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("subLabelStyle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "styleWithName:fallback:layoutMode:", v8, CFSTR("remoteUITableHeaderSubLabel"), -[GKRemoteUITableHeaderView layoutStyle](self, "layoutStyle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("subLabelNumberOfLines"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    v12 = [GKLabel alloc];
    v13 = -[GKLabel initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    subLabel = self->_subLabel;
    self->_subLabel = v13;

    -[GKLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKLabel setNumberOfLines:](self->_subLabel, "setNumberOfLines:", 0);
    objc_msgSend(v6, "_gkAttributedStringByApplyingStyle:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLabel setAttributedText:](self->_subLabel, "setAttributedText:", v15);

    if (v11 >= 1)
      -[GKLabel setNumberOfLines:](self->_subLabel, "setNumberOfLines:", v11);
    -[GKLabel setAdjustsFontSizeToFitWidth:](self->_subLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[GKLabel applyTextStyle:](self->_subLabel, "applyTextStyle:", v9);
    -[GKRemoteUITableHeaderView addSubview:](self, "addSubview:", self->_subLabel);

  }
}

- (double)labelBaselineOffset
{
  int v2;
  double result;

  v2 = -[GKRemoteUITableHeaderView layoutStyle](self, "layoutStyle");
  result = 36.0;
  if (v2 == 1)
    result = 144.0;
  if (v2 == 2)
    return 202.0;
  return result;
}

- (double)leftMargin
{
  int v2;
  double result;

  v2 = -[GKRemoteUITableHeaderView layoutStyle](self, "layoutStyle");
  result = 0.0;
  if (v2 == 1)
    result = 25.0;
  if (v2 == 2)
    return 15.0;
  return result;
}

- (double)rightMargin
{
  int v2;
  double result;

  v2 = -[GKRemoteUITableHeaderView layoutStyle](self, "layoutStyle");
  result = 0.0;
  if (v2 == 1)
    result = 25.0;
  if (v2 == 2)
    return 15.0;
  return result;
}

- (double)bottomMargin
{
  int v3;
  double result;

  v3 = -[GKRemoteUITableHeaderView layoutStyle](self, "layoutStyle");
  switch(v3)
  {
    case 2:
      result = 30.0;
      if (self->_subLabel)
        return result;
      result = 35.0;
      goto LABEL_11;
    case 1:
      if (self->_subLabel)
        return 40.0;
      result = 32.0;
      goto LABEL_11;
    case 0:
      result = 20.0;
      if (!self->_subLabel)
      {
        result = 25.0;
LABEL_11:
        if (self->_button)
          return 0.0;
      }
      break;
  }
  return result;
}

- (double)labelTopOffset
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[GKRemoteUITableHeaderView labelBaselineOffset](self, "labelBaselineOffset");
  v4 = v3;
  -[GKLabel font](self->_label, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ascender");
  v7 = v4 - v6;

  return v7;
}

- (double)labelBaselineToSubLabelTopOffset
{
  int v2;
  double result;

  v2 = -[GKRemoteUITableHeaderView layoutStyle](self, "layoutStyle");
  result = 5.0;
  if ((v2 - 1) < 2)
    return 15.0;
  return result;
}

- (double)labelBaselineToButtonBaselineOffset
{
  return dbl_1AB7F8570[-[GKRemoteUITableHeaderView layoutStyle](self, "layoutStyle") - 1 < 2];
}

- (void)applyConstraints
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
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
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  -[GKRemoteUITableHeaderView replaceableConstraints](self, "replaceableConstraints");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
    -[GKRemoteUITableHeaderView removeConstraints:](self, "removeConstraints:", v3);
  v29 = (void *)v3;
  -[GKRemoteUITableHeaderView label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKRemoteUITableHeaderView subLabel](self, "subLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKRemoteUITableHeaderView button](self, "button");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = CFSTR("left");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[GKRemoteUITableHeaderView leftMargin](self, "leftMargin");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v9;
  v30[1] = CFSTR("right");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[GKRemoteUITableHeaderView rightMargin](self, "rightMargin");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v11;
  v30[2] = CFSTR("labelToSubLabel");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[GKRemoteUITableHeaderView labelBaselineToSubLabelTopOffset](self, "labelBaselineToSubLabelTopOffset");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v13;
  v30[3] = CFSTR("labelToButton");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[GKRemoteUITableHeaderView labelBaselineToButtonBaselineOffset](self, "labelBaselineToButtonBaselineOffset");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _NSDictionaryOfVariableBindings(CFSTR("label, subLabel"), v4, v5, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(left)-[subLabel]-(right)-|"), 0, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v18);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[label]-(labelToSubLabel)-[subLabel]"), 0, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v19);

    v20 = (void *)v6;
  }
  else
  {
    v20 = (void *)v6;
    if (v6)
    {
      _NSDictionaryOfVariableBindings(CFSTR("label, button"), v4, v6, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CB3718];
      -[GKRemoteUITableHeaderView labelBaselineToButtonBaselineOffset](self, "labelBaselineToButtonBaselineOffset");
      objc_msgSend(v21, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 11, 0, v4, 11, 1.0, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v23);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 9, 0, self, 9, 1.0, 0.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v24);

    }
    else
    {
      _NSDictionaryOfVariableBindings(CFSTR("label"), v4, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v25 = (void *)MEMORY[0x1E0CB3718];
  -[GKRemoteUITableHeaderView labelTopOffset](self, "labelTopOffset");
  objc_msgSend(v25, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 3, 0, self, 3, 1.0, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v27);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(left)-[label]-(right)-|"), 0, v16, v17);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v28);

  -[GKRemoteUITableHeaderView setReplaceableConstraints:](self, "setReplaceableConstraints:", v7);
  -[GKRemoteUITableHeaderView addConstraints:](self, "addConstraints:", v7);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[GKRemoteUITableHeaderView sizeThatFits:](self, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGSize result;

  width = a3.width;
  -[GKRemoteUITableHeaderView leftMargin](self, "leftMargin", a3.width, a3.height);
  v6 = v5;
  -[GKRemoteUITableHeaderView rightMargin](self, "rightMargin");
  v35 = width;
  v8 = width - (v6 + v7);
  -[GKRemoteUITableHeaderView label](self, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKRemoteUITableHeaderView subLabel](self, "subLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKRemoteUITableHeaderView button](self, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPreferredMaxLayoutWidth:", v8);
  objc_msgSend(v12, "ascender");
  v14 = v13;
  objc_msgSend(v12, "descender");
  v16 = fabs(v15);
  objc_msgSend(v9, "sizeThatFits:", v8, 1.79769313e308);
  v18 = v17;
  -[GKRemoteUITableHeaderView labelBaselineToSubLabelTopOffset](self, "labelBaselineToSubLabelTopOffset");
  v20 = v19;
  -[GKRemoteUITableHeaderView labelBaselineToButtonBaselineOffset](self, "labelBaselineToButtonBaselineOffset");
  v22 = v21;
  -[GKRemoteUITableHeaderView bottomMargin](self, "bottomMargin");
  v24 = v23;
  -[GKRemoteUITableHeaderView labelBaselineOffset](self, "labelBaselineOffset");
  v26 = v25;
  v27 = v18 - v14 - v16;
  if (v10)
  {
    objc_msgSend(v10, "setPreferredMaxLayoutWidth:", v8);
    objc_msgSend(v10, "intrinsicContentSize");
    v29 = v28;
    v30 = -[GKRemoteUITableHeaderView layoutStyle](self, "layoutStyle");
    v31 = 0.0;
    if (v30 <= 2)
      v31 = dbl_1AB7F8580[v30];
    v32 = v24 + v20 + v27 + v26 + v29 + v31;
  }
  else if (v11)
  {
    v32 = v24 + v22 + v27 + v25;
  }
  else
  {
    v32 = v24 + v27 + v25;
  }

  v33 = v35;
  v34 = v32;
  result.height = v34;
  result.width = v33;
  return result;
}

- (void)buttonTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", CFSTR("url"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKRemoteUITableHeaderView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "auxiliaryView:pressedLink:attributes:", self, v6, self->_attributes);
  }
  else if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "auxiliaryView:pressedButton:attributes:", self, v4, self->_attributes);
  }

}

- (void)objectModelDidChange:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", CFSTR("enabledFunction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[GKButton setEnabled:](self->_button, "setEnabled:", objc_msgSend(v5, "validateWithFunction:", v4));

}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (GKLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (GKLabel)subLabel
{
  return self->_subLabel;
}

- (void)setSubLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subLabel, a3);
}

- (GKButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (NSArray)replaceableConstraints
{
  return self->_replaceableConstraints;
}

- (void)setReplaceableConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_replaceableConstraints, a3);
}

- (int)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int)a3
{
  self->_layoutStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceableConstraints, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_subLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
