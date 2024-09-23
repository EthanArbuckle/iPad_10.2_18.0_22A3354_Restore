@implementation _NTKCDetailAddButton

- (_NTKCDetailAddButton)initWithFrame:(CGRect)a3
{
  _NTKCDetailAddButton *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)_NTKCDetailAddButton;
  v3 = -[_NTKCDetailAddButton initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      NTKCCustomizationLocalizedString(CFSTR("ACTION_ADD"), (uint64_t)CFSTR("Add"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *MEMORY[0x1E0DC1138];
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 15.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v7);
      objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAttributedTitle:", v8);
      objc_msgSend(v9, "setButtonSize:", 1);
      objc_msgSend(v9, "setContentInsets:", 5.0, 8.0, 5.0, 8.0);
      objc_msgSend(v9, "setCornerStyle:", 4);
      -[_NTKCDetailAddButton setConfiguration:](v3, "setConfiguration:", v9);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 15.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NTKCDetailAddButton titleLabel](v3, "titleLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFont:", v10);

      -[_NTKCDetailAddButton setContentEdgeInsets:](v3, "setContentEdgeInsets:", 5.0, 8.0, 5.0, 8.0);
      -[_NTKCDetailAddButton layer](v3, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBorderWidth:", 1.0);

      -[_NTKCDetailAddButton layer](v3, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCornerRadius:", 4.0);

      NTKCCustomizationLocalizedString(CFSTR("ACTION_ADD"), (uint64_t)CFSTR("Add"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NTKCDetailAddButton setTitle:forState:](v3, "setTitle:forState:", v15, 0);

      BPSBackgroundColor();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NTKCDetailAddButton setTitleColor:forState:](v3, "setTitleColor:forState:", v16, 1);

      BPSBackgroundColor();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NTKCDetailAddButton setTitleColor:forState:](v3, "setTitleColor:forState:", v17, 4);

      BPSBackgroundColor();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NTKCDetailAddButton setTitleColor:forState:](v3, "setTitleColor:forState:", v5, 5);
    }

    -[_NTKCDetailAddButton _updateColor](v3, "_updateColor");
  }
  return v3;
}

- (void)setDisabled:(BOOL)a3 forReason:(id)a4
{
  self->_disabled = a3;
  objc_storeStrong((id *)&self->_disabledReason, a4);
  -[_NTKCDetailAddButton _updateColor](self, "_updateColor");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[_NTKCDetailAddButton isHighlighted](self, "isHighlighted") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_NTKCDetailAddButton;
    -[_NTKCDetailAddButton setHighlighted:](&v5, sel_setHighlighted_, v3);
    -[_NTKCDetailAddButton _updateColor](self, "_updateColor");
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[_NTKCDetailAddButton isSelected](self, "isSelected") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_NTKCDetailAddButton;
    -[_NTKCDetailAddButton setSelected:](&v5, sel_setSelected_, v3);
    -[_NTKCDetailAddButton _updateColor](self, "_updateColor");
  }
}

- (void)_updateColor
{
  int v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if ((-[_NTKCDetailAddButton isHighlighted](self, "isHighlighted") & 1) != 0)
      v3 = 1;
    else
      v3 = -[_NTKCDetailAddButton isSelected](self, "isSelected");
    if (self->_disabled)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v3)
      {
        v6 = v4;
        v5 = v6;
LABEL_14:
        v7 = v6;
LABEL_16:
        -[_NTKCDetailAddButton setTitleColor:forState:](self, "setTitleColor:forState:", v5, 0);
        v10 = objc_retainAutorelease(v5);
        v8 = objc_msgSend(v10, "CGColor");
        -[_NTKCDetailAddButton layer](self, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setBorderColor:", v8);

        -[_NTKCDetailAddButton setBackgroundColor:](self, "setBackgroundColor:", v7);
        goto LABEL_17;
      }
    }
    else
    {
      NTKCActionColor();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        NTKCActionColor();
        v6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
    v7 = 0;
    goto LABEL_16;
  }
  if (self->_disabled)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  else
    BPSBridgeTintColor();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_NTKCDetailAddButton setTintColor:](self, "setTintColor:", v10);
LABEL_17:

}

- (BOOL)disabled
{
  return self->_disabled;
}

- (NSString)disabledReason
{
  return self->_disabledReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledReason, 0);
}

@end
