@implementation SUUICheckboxFieldSettingDescriptionView

+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = *MEMORY[0x24BDBF148];
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  v5 = *MEMORY[0x24BDBF148];
  v6 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];

  objc_storeStrong((id *)&self->_settingDescription, a3);
  v7 = a3;
  objc_msgSend(v7, "viewElement");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __86__SUUICheckboxFieldSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke;
  v9[3] = &unk_2511F46F8;
  v9[4] = self;
  objc_msgSend(v8, "enumerateChildrenUsingBlock:", v9);
  -[SUUICheckboxFieldSettingDescriptionView setNeedsLayout](self, "setNeedsLayout");

}

void __86__SUUICheckboxFieldSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = objc_msgSend(v4, "elementType");
  if (v3 == 18)
  {
    objc_msgSend(*(id *)(a1 + 32), "_addInputWithElement:", v4);
  }
  else if (v3 == 138)
  {
    objc_msgSend(*(id *)(a1 + 32), "_addLabelWithElement:", v4);
  }

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUICheckboxFieldSettingDescriptionView;
  -[SUUICheckboxFieldSettingDescriptionView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[SUUICheckboxFieldSettingDescriptionView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v28.receiver = self;
  v28.super_class = (Class)SUUICheckboxFieldSettingDescriptionView;
  -[SUUICheckboxFieldSettingDescriptionView layoutSubviews](&v28, sel_layoutSubviews);
  -[SUUISettingDescriptionView layoutMargins](self, "layoutMargins");
  v4 = v3;
  v6 = v5;
  -[SUUICheckboxFieldSettingDescriptionView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[UISwitch sizeThatFits:](self->_switch, "sizeThatFits:", 1.0, 1.0);
  v16 = v15;
  v18 = v17;
  v29.origin.x = v8;
  v29.origin.y = v10;
  v29.size.width = v12;
  v29.size.height = v14;
  v19 = CGRectGetWidth(v29) - v6 - v16;
  v30.origin.x = v8;
  v30.origin.y = v10;
  v30.size.width = v12;
  v30.size.height = v14;
  v20 = floor((CGRectGetHeight(v30) - v18) * 0.5);
  -[UISwitch setFrame:](self->_switch, "setFrame:", v19, v20, v16, v18);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31.origin.x = v19;
  v31.origin.y = v20;
  v31.size.width = v16;
  v31.size.height = v18;
  v22 = CGRectGetMinX(v31) - v4 + -16.0;
  objc_msgSend(v21, "_scaledValueForValue:", 30.0);
  v24 = v23;
  -[UILabel _firstBaselineOffsetFromTop](self->_label, "_firstBaselineOffsetFromTop");
  v26 = v24 - v25;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v22, 1.0);
  -[UILabel setFrame:](self->_label, "setFrame:", v4, v26, v22, v27);

}

- (void)_switchValueChanged:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", -[UISwitch isOn](self->_switch, "isOn"));
  -[SUUIFieldSettingDescription setFieldValue:forKey:](self->_settingDescription, "setFieldValue:forKey:", v4, CFSTR("selected"));

}

- (void)_addInputWithElement:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_inputViewElement, a3);
  if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
    -[SUUICheckboxFieldSettingDescriptionView _addSwitchWithElement:](self, "_addSwitchWithElement:", v5);

}

- (void)_addLabelWithElement:(id)a3
{
  objc_class *v4;
  id v5;
  UILabel *v6;
  UILabel *label;
  UILabel *v8;
  void *v9;
  void *v10;
  UILabel *v11;
  void *v12;

  v4 = (objc_class *)MEMORY[0x24BEBD708];
  v5 = a3;
  v6 = (UILabel *)objc_alloc_init(v4);
  label = self->_label;
  self->_label = v6;

  v8 = self->_label;
  objc_msgSend(v5, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v8, "setText:", v10);

  v11 = self->_label;
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v11, "setTextColor:", v12);

  -[SUUICheckboxFieldSettingDescriptionView addSubview:](self, "addSubview:", self->_label);
}

- (void)_addSwitchWithElement:(id)a3
{
  objc_class *v4;
  id v5;
  UISwitch *v6;
  UISwitch *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = (objc_class *)MEMORY[0x24BEBD9B8];
  v5 = a3;
  v6 = (UISwitch *)objc_alloc_init(v4);
  v7 = self->_switch;
  self->_switch = v6;

  v8 = objc_msgSend(v5, "isSelected");
  -[SUUIFieldSettingDescription fieldValueForKey:](self->_settingDescription, "fieldValueForKey:", CFSTR("selected"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v8 = objc_msgSend(v9, "BOOLValue");
  -[UISwitch setOn:](self->_switch, "setOn:", v8);
  -[UISwitch addTarget:action:forControlEvents:](self->_switch, "addTarget:action:forControlEvents:", self, sel__switchValueChanged_, 4096);
  -[SUUICheckboxFieldSettingDescriptionView addSubview:](self, "addSubview:", self->_switch);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switch, 0);
  objc_storeStrong((id *)&self->_settingDescription, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_inputViewElement, 0);
}

@end
