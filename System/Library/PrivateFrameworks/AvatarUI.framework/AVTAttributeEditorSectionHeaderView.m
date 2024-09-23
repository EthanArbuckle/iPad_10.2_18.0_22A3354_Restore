@implementation AVTAttributeEditorSectionHeaderView

+ (id)reuseIdentifier
{
  return CFSTR("AVTAttributeRowHeaderView");
}

- (AVTAttributeEditorSectionHeaderView)initWithFrame:(CGRect)a3
{
  AVTAttributeEditorSectionHeaderView *v3;
  void *v4;
  id v5;
  uint64_t v6;
  UILabel *label;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTAttributeEditorSectionHeaderView;
  v3 = -[AVTAttributeEditorSectionHeaderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAttributeEditorSectionHeaderView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc(MEMORY[0x1E0CEA700]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v6;

    -[UILabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 2);
    -[AVTAttributeEditorSectionHeaderView addSubview:](v3, "addSubview:", v3->_label);
  }
  return v3;
}

- (void)createAccessoryButtonIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[AVTAttributeEditorSectionHeaderView accessoryButton](self, "accessoryButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAttributeEditorSectionHeaderView setAccessoryButton:](self, "setAccessoryButton:", v4);

    -[AVTAttributeEditorSectionHeaderView accessoryButton](self, "accessoryButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShowsMenuAsPrimaryAction:", 1);

    -[AVTAttributeEditorSectionHeaderView accessoryButton](self, "accessoryButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLineBreakMode:", 2);

    -[AVTAttributeEditorSectionHeaderView accessoryButton](self, "accessoryButton");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTAttributeEditorSectionHeaderView addSubview:](self, "addSubview:", v8);

  }
}

- (void)updateMenu
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[6];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[AVTAttributeEditorSectionHeaderView supplementalPicker](self, "supplementalPicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "choices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0CEA2A8];
        objc_msgSend(v10, "localizedName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __49__AVTAttributeEditorSectionHeaderView_updateMenu__block_invoke;
        v16[3] = &unk_1EA51E100;
        v16[4] = self;
        v16[5] = v10;
        objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v12, 0, 0, v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "isSelected"))
          objc_msgSend(v13, "setState:", 1);
        objc_msgSend(v3, "addObject:", v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1EA5207B8, v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAttributeEditorSectionHeaderView accessoryButton](self, "accessoryButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMenu:", v14);

}

void __49__AVTAttributeEditorSectionHeaderView_updateMenu__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "supplementalPicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessoryButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionHeaderView:didSelectItem:forPicker:sender:", v2, v3, v4, v5);

}

- (void)setDisplayString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[AVTAttributeEditorSectionHeaderView label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  +[AVTUIFontRepository attributeTitleFont](AVTUIFontRepository, "attributeTitleFont");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAttributeEditorSectionHeaderView label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

}

- (NSString)displayString
{
  void *v2;
  void *v3;

  -[AVTAttributeEditorSectionHeaderView label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTAttributeEditorSectionHeaderView;
  -[AVTAttributeEditorSectionHeaderView traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[AVTAttributeEditorSectionHeaderView accessoryButton](self, "accessoryButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[AVTAttributeEditorSectionHeaderView updateButtonForSelectedSectionItem](self, "updateButtonForSelectedSectionItem");
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  -[AVTAttributeEditorSectionHeaderView label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_scaledValueForValue:", 18.0);
  v6 = v5;

  v7 = fmin(v6, 30.0);
  -[AVTAttributeEditorSectionHeaderView bounds](self, "bounds");
  v8 = CGRectGetMaxY(v20) + 12.0 + v7 * -2.0;
  -[AVTAttributeEditorSectionHeaderView accessoryButton](self, "accessoryButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AVTAttributeEditorSectionHeaderView accessoryButton](self, "accessoryButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "intrinsicContentSize");
    v12 = v11;

    -[AVTAttributeEditorSectionHeaderView bounds](self, "bounds");
    v13 = CGRectGetMaxX(v21) - v12 + -20.0;
    if (-[AVTAttributeEditorSectionHeaderView isRTL](self, "isRTL"))
      v13 = 20.0;
    -[AVTAttributeEditorSectionHeaderView accessoryButton](self, "accessoryButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v13, v7, v12, v8);

    v15 = v12 + 20.0;
  }
  else
  {
    v15 = 0.0;
  }
  -[AVTAttributeEditorSectionHeaderView bounds](self, "bounds");
  v16 = CGRectGetMaxX(v22) + -40.0 - v15;
  if (-[AVTAttributeEditorSectionHeaderView isRTL](self, "isRTL"))
    v17 = v15 + 20.0;
  else
    v17 = 20.0;
  -[AVTAttributeEditorSectionHeaderView label](self, "label");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v17, v7, v16, v8);

  v19.receiver = self;
  v19.super_class = (Class)AVTAttributeEditorSectionHeaderView;
  -[AVTAttributeEditorSectionHeaderView layoutSubviews](&v19, sel_layoutSubviews);
}

- (void)setSupplementalPicker:(id)a3
{
  AVTAvatarAttributeEditorSectionSupplementalPicker *v5;
  void *v6;
  void *v7;
  AVTAvatarAttributeEditorSectionSupplementalPicker *v8;

  v5 = (AVTAvatarAttributeEditorSectionSupplementalPicker *)a3;
  if (self->_supplementalPicker != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_supplementalPicker, a3);
    if (v8)
    {
      -[AVTAttributeEditorSectionHeaderView createAccessoryButtonIfNeeded](self, "createAccessoryButtonIfNeeded");
      -[AVTAttributeEditorSectionHeaderView updateMenu](self, "updateMenu");
      -[AVTAttributeEditorSectionHeaderView updateButtonForSelectedSectionItem](self, "updateButtonForSelectedSectionItem");
LABEL_6:
      v5 = v8;
      goto LABEL_7;
    }
    -[AVTAttributeEditorSectionHeaderView accessoryButton](self, "accessoryButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = 0;
    if (v6)
    {
      -[AVTAttributeEditorSectionHeaderView accessoryButton](self, "accessoryButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperview");

      -[AVTAttributeEditorSectionHeaderView setAccessoryButton:](self, "setAccessoryButton:", 0);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)updateButtonForSelectedSectionItem
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  -[AVTAttributeEditorSectionHeaderView supplementalPicker](self, "supplementalPicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "choices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 <= 1)
  {
    -[AVTAttributeEditorSectionHeaderView accessoryButton](self, "accessoryButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[AVTAttributeEditorSectionHeaderView setAccessoryButton:](self, "setAccessoryButton:", 0);
  }
  +[AVTUIFontRepository attributeTitleButtonFont](AVTUIFontRepository, "attributeTitleButtonFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CB3778]);
  -[AVTAttributeEditorSectionHeaderView supplementalPicker](self, "supplementalPicker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x1E0CEA098];
  v24[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithString:attributes:", v10, v11);

  v13 = objc_alloc_init(MEMORY[0x1E0CEA258]);
  objc_msgSend(v13, "setBounds:", 0.0, 0.0, 4.0, 4.0);
  v14 = objc_alloc_init(MEMORY[0x1E0CEA638]);
  objc_msgSend(v13, "setImage:", v14);

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x1E0CEA258]);
  -[AVTAttributeEditorSectionHeaderView chevronImage](self, "chevronImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setImage:", v17);

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  if (-[AVTAttributeEditorSectionHeaderView isRTL](self, "isRTL"))
  {
    objc_msgSend(v12, "insertAttributedString:atIndex:", v19, 0);
    objc_msgSend(v12, "insertAttributedString:atIndex:", v15, 1);
  }
  else
  {
    objc_msgSend(v12, "appendAttributedString:", v15);
    objc_msgSend(v12, "appendAttributedString:", v19);
  }
  v20 = *MEMORY[0x1E0CEA0A0];
  -[AVTAttributeEditorSectionHeaderView tintColor](self, "tintColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAttribute:value:range:", v20, v21, 0, objc_msgSend(v12, "length"));

  -[AVTAttributeEditorSectionHeaderView accessoryButton](self, "accessoryButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAttributedTitle:forState:", v12, 0);

  -[AVTAttributeEditorSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (id)chevronImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB538], 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("chevron.down"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAttributeEditorSectionHeaderView tintColor](self, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithTintColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (AVTAttributeEditorSectionHeaderViewDelegate)delegate
{
  return (AVTAttributeEditorSectionHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVTAvatarAttributeEditorSectionSupplementalPicker)supplementalPicker
{
  return self->_supplementalPicker;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIButton)accessoryButton
{
  return self->_accessoryButton;
}

- (void)setAccessoryButton:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryButton, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_supplementalPicker, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
