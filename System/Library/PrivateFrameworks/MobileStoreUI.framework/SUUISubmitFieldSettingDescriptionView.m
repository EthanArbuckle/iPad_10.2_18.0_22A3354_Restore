@implementation SUUISubmitFieldSettingDescriptionView

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  UILabel *label;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUUISubmitFieldSettingDescriptionView;
  -[SUUIFieldSettingDescriptionView setEnabled:](&v7, sel_setEnabled_);
  label = self->_label;
  if (label)
  {
    if (v3)
      -[SUUISubmitFieldSettingDescriptionView tintColor](self, "tintColor");
    else
      objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](label, "setTextColor:", v6);

  }
}

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

+ (void)requestLayoutForSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a5;
  objc_msgSend(v6, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__43;
  v10[4] = __Block_byref_object_dispose__43;
  v11 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __90__SUUISubmitFieldSettingDescriptionView_requestLayoutForSettingDescription_width_context___block_invoke;
  v9[3] = &unk_2511F4B90;
  v9[4] = v10;
  objc_msgSend(v8, "enumerateChildrenUsingBlock:", v9);
  _Block_object_dispose(v10, 8);

}

void __90__SUUISubmitFieldSettingDescriptionView_requestLayoutForSettingDescription_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;

  v5 = a2;
  v4 = objc_msgSend(v5, "elementType");
  if ((unint64_t)(v4 - 139) < 2 || v4 == 58)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

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
  v9[2] = __84__SUUISubmitFieldSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke;
  v9[3] = &unk_2511F46F8;
  v9[4] = self;
  objc_msgSend(v8, "enumerateChildrenUsingBlock:", v9);
  -[SUUISubmitFieldSettingDescriptionView setNeedsLayout](self, "setNeedsLayout");

}

void __84__SUUISubmitFieldSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = objc_msgSend(v4, "elementType");
  if ((unint64_t)(v3 - 139) < 2 || v3 == 58)
    objc_msgSend(*(id *)(a1 + 32), "_addInputWithElement:", v4);

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUISubmitFieldSettingDescriptionView;
  -[SUUISubmitFieldSettingDescriptionView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[SUUISubmitFieldSettingDescriptionView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  int v15;
  UILabel *label;
  void *v17;
  objc_super v18;
  CGRect v19;

  v18.receiver = self;
  v18.super_class = (Class)SUUISubmitFieldSettingDescriptionView;
  -[SUUISubmitFieldSettingDescriptionView layoutSubviews](&v18, sel_layoutSubviews);
  -[SUUISettingDescriptionView layoutMargins](self, "layoutMargins");
  v4 = v3;
  v6 = v5;
  -[SUUISubmitFieldSettingDescriptionView bounds](self, "bounds");
  v7 = CGRectGetWidth(v19) - v4 - v6;
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v8);
  objc_msgSend(v8, "_scaledValueForValue:", 30.0);
  v10 = v9;
  -[UILabel _firstBaselineOffsetFromTop](self->_label, "_firstBaselineOffsetFromTop");
  v12 = v10 - v11;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v7, 1.0);
  -[UILabel setFrame:](self->_label, "setFrame:", v4, v12, v7, v13);
  -[SUUISubmitFieldSettingDescriptionView _currentControllerValue](self, "_currentControllerValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = objc_msgSend(v14, "BOOLValue");
    label = self->_label;
    if (v15)
      -[SUUISubmitFieldSettingDescriptionView tintColor](self, "tintColor");
    else
      objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](label, "setTextColor:", v17);

  }
}

- (void)_addInputWithElement:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_inputViewElement, a3);
  if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
    -[SUUISubmitFieldSettingDescriptionView _addSubmitInputWithElement:](self, "_addSubmitInputWithElement:", v5);

}

- (void)_addSubmitInputWithElement:(id)a3
{
  objc_class *v4;
  id v5;
  UILabel *v6;
  UILabel *label;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;

  v4 = (objc_class *)MEMORY[0x24BEBD708];
  v5 = a3;
  v6 = (UILabel *)objc_alloc_init(v4);
  label = self->_label;
  self->_label = v6;

  v8 = self->_label;
  objc_msgSend(v5, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setText:](v8, "setText:", v9);
  v10 = self->_label;
  objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v10, "setTextColor:", v11);

  -[SUUISubmitFieldSettingDescriptionView addSubview:](self, "addSubview:", self->_label);
}

- (id)_currentControllerValue
{
  void *v3;
  void *v4;

  -[SUUIFieldSettingDescription controller](self->_settingDescription, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(v3, "valueForSettingDescription:", self->_settingDescription);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingDescription, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_inputViewElement, 0);
}

@end
