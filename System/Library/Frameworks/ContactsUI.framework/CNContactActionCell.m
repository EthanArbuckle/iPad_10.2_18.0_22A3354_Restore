@implementation CNContactActionCell

- (CNContactAction)action
{
  void *v2;
  void *v3;
  void *v4;

  -[CNContactActionCell actionGroupItem](self, "actionGroupItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContactAction *)v4;
}

- (void)setCardGroupItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  objc_super v26;

  v4 = a3;
  -[CNContactCell cardGroupItem](self, "cardGroupItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v26.receiver = self;
    v26.super_class = (Class)CNContactActionCell;
    -[CNContactCell setCardGroupItem:](&v26, sel_setCardGroupItem_, v4);
    -[CNContactActionCell action](self, "action");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactActionCell label](self, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    -[CNContactActionCell action](self, "action");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "transportType");

    -[CNContactActionCell transportIcon](self, "transportIcon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {

      if (!v12)
      {
        +[CNTransportButton transportButton](CNTransportButton, "transportButton");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactActionCell setTransportIcon:](self, "setTransportIcon:", v13);

        -[CNContactActionCell transportIcon](self, "transportIcon");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[CNContactActionCell contentView](self, "contentView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactActionCell transportIcon](self, "transportIcon");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addSubview:", v16);

        -[CNContactActionCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      }
      -[CNContactActionCell action](self, "action");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "glyphColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactActionCell transportIcon](self, "transportIcon");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setGlyphColor:", v18);

      -[CNContactActionCell action](self, "action");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "transportType");
      -[CNContactActionCell transportIcon](self, "transportIcon");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setTransportType:", v21);

      -[CNContactActionCell action](self, "action");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "showBackgroundPlatter");
      -[CNContactActionCell transportIcon](self, "transportIcon");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setShowBackgroundPlatter:", v24);

    }
    else
    {
      objc_msgSend(v11, "removeFromSuperview");

      -[CNContactActionCell setTransportIcon:](self, "setTransportIcon:", 0);
      -[CNContactActionCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    }
  }

}

- (void)setLabelTextAttributes:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  objc_super v20;
  objc_super v21;
  objc_super v22;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) != 0
    || (-[CNContactActionCell action](self, "action"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "wrapTitle"),
        v5,
        v6))
  {
    -[CNContactActionCell label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfLines:", 0);

    -[CNContactActionCell label](self, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0;
  }
  else
  {
    -[CNContactActionCell label](self, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNumberOfLines:", 1);

    -[CNContactActionCell label](self, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 4;
  }
  objc_msgSend(v8, "setLineBreakMode:", v10);

  -[CNContactActionCell action](self, "action");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "color");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)objc_msgSend(v4, "mutableCopy");
    -[CNContactActionCell action](self, "action");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "color");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0DC1140]);

    v22.receiver = self;
    v22.super_class = (Class)CNContactActionCell;
    -[CNLabeledCell setLabelTextAttributes:](&v22, sel_setLabelTextAttributes_, v14);
  }
  else
  {
    -[CNContactActionCell action](self, "action");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isDestructive");

    if (!v18)
    {
      v20.receiver = self;
      v20.super_class = (Class)CNContactActionCell;
      -[CNLabeledCell setLabelTextAttributes:](&v20, sel_setLabelTextAttributes_, v4);
      goto LABEL_11;
    }
    v14 = (void *)objc_msgSend(v4, "mutableCopy");
    +[CNUIColorRepository contactCardDestructiveActionTitleTextColor](CNUIColorRepository, "contactCardDestructiveActionTitleTextColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0DC1140]);

    v21.receiver = self;
    v21.super_class = (Class)CNContactActionCell;
    -[CNLabeledCell setLabelTextAttributes:](&v21, sel_setLabelTextAttributes_, v14);
  }

LABEL_11:
}

- (UILabel)label
{
  return self->_label;
}

- (id)variableConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v16.receiver = self;
  v16.super_class = (Class)CNContactActionCell;
  -[CNLabeledCell variableConstraints](&v16, sel_variableConstraints);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactActionCell transportIcon](self, "transportIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactActionCell transportIcon](self, "transportIcon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactActionCell labelView](self, "labelView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 10, 0, v9, 10, 1.0, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

    v11 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactActionCell labelView](self, "labelView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactActionCell transportIcon](self, "transportIcon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 6, 0, v13, 5, 1.0, -16.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v14);

  }
  return v5;
}

- (CNTransportButton)transportIcon
{
  return self->_transportIcon;
}

- (void)setTransportIcon:(id)a3
{
  objc_storeStrong((id *)&self->_transportIcon, a3);
}

- (id)labelView
{
  UILabel *label;
  UILabel *v4;
  UILabel *v5;

  label = self->_label;
  if (!label)
  {
    -[CNLabeledCell standardLabelView](self, "standardLabelView");
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_label;
    self->_label = v4;

    label = self->_label;
  }
  return label;
}

- (double)minCellHeight
{
  return 44.0;
}

- (id)rightMostView
{
  void *v3;
  void *v4;
  objc_super v6;

  -[CNContactActionCell transportIcon](self, "transportIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNContactActionCell transportIcon](self, "transportIcon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CNContactActionCell;
    -[CNLabeledCell rightMostView](&v6, sel_rightMostView);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  objc_super v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)CNContactActionCell;
  -[CNLabeledCell tintColorDidChange](&v5, sel_tintColorDidChange);
  v6 = *MEMORY[0x1E0DC1140];
  -[UIView tintColorOverride](self, "tintColorOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("labelTextAttributes"), v4);

}

- (BOOL)shouldPerformDefaultAction
{
  return 1;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportIcon, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

+ (BOOL)shouldIndentWhileEditing
{
  return 0;
}

@end
