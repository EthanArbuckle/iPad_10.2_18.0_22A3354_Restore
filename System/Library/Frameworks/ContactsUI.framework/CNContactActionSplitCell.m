@implementation CNContactActionSplitCell

- (CNContactActionSplitCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNContactActionSplitCell *v4;
  CNContactActionSplitCell *v5;
  uint64_t v6;
  UIButton *rightLabel;
  void *v8;
  void *v9;
  float v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CNContactActionSplitCell;
  v4 = -[CNLabeledCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CNContactActionSplitCell standardButton](v4, "standardButton");
    v6 = objc_claimAutoreleasedReturnValue();
    rightLabel = v5->_rightLabel;
    v5->_rightLabel = (UIButton *)v6;

    -[CNContactActionSplitCell contentView](v5, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v5->_rightLabel);

    -[CNContactActionSplitCell labelView](v5, "labelView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton contentHuggingPriorityForAxis:](v5->_rightLabel, "contentHuggingPriorityForAxis:", 0);
    *(float *)&v11 = v10 + 1.0;
    objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 0, v11);

  }
  return v5;
}

- (void)setCardGroupItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  -[CNContactCell cardGroupItem](self, "cardGroupItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)CNContactActionSplitCell;
    -[CNContactCell setCardGroupItem:](&v15, sel_setCardGroupItem_, v4);
    -[CNContactActionSplitCell leftLabel](self, "leftLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactActionSplitCell _setupButton:forAction:](self, "_setupButton:forAction:", v6, v8);

    objc_msgSend(v4, "actions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    -[CNContactActionSplitCell rightLabel](self, "rightLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10 < 2)
    {
      objc_msgSend(v11, "setTitle:forState:", 0, 0);

      -[CNContactActionSplitCell rightLabel](self, "rightLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeTarget:action:forControlEvents:", 0, 0, 64);
    }
    else
    {
      objc_msgSend(v4, "actions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactActionSplitCell _setupButton:forAction:](self, "_setupButton:forAction:", v12, v14);

    }
  }

}

- (id)standardButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v2, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfLines:", 2);

  objc_msgSend(v2, "setExclusiveTouch:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  LODWORD(v6) = 1148846080;
  objc_msgSend(v2, "setContentCompressionResistancePriority:forAxis:", 1, v6);
  LODWORD(v7) = 1132003328;
  objc_msgSend(v2, "setContentHuggingPriority:forAxis:", 0, v7);
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
    v8 = 2;
  else
    v8 = 1;
  objc_msgSend(v2, "setContentHorizontalAlignment:", v8);
  return v2;
}

- (double)minCellHeight
{
  return 44.0;
}

- (id)labelView
{
  UIButton *leftLabel;
  UIButton *v4;
  UIButton *v5;

  leftLabel = self->_leftLabel;
  if (!leftLabel)
  {
    -[CNContactActionSplitCell standardButton](self, "standardButton");
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_leftLabel;
    self->_leftLabel = v4;

    leftLabel = self->_leftLabel;
  }
  return leftLabel;
}

- (id)rightMostView
{
  return self->_rightLabel;
}

- (void)setLabelTextAttributes:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNContactActionSplitCell;
  v4 = a3;
  -[CNLabeledCell setLabelTextAttributes:](&v5, sel_setLabelTextAttributes_, v4);
  -[UIButton setAb_textAttributes:](self->_rightLabel, "setAb_textAttributes:", v4, v5.receiver, v5.super_class);

}

- (id)constantConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIButton *rightLabel;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  objc_super v16;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v16.receiver = self;
  v16.super_class = (Class)CNContactActionSplitCell;
  -[CNLabeledCell constantConstraints](&v16, sel_constantConstraints);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_rightLabel, 5, 0, self->_leftLabel, 6, 1.0, 16.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  v7 = (void *)MEMORY[0x1E0CB3718];
  rightLabel = self->_rightLabel;
  -[CNContactActionSplitCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", rightLabel, 5, 0, v9, 9, 1.0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v10);

  objc_msgSend(v5, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 1132068864;
  objc_msgSend(v11, "setPriority:", v12);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_rightLabel, 3, 0, self->_leftLabel, 3, 1.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v13);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_rightLabel, 4, 0, self->_leftLabel, 4, 1.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v14);

  return v5;
}

- (void)_setupButton:(id)a3 forAction:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:forState:", v7, 0);

  if (v6)
  {
    objc_msgSend(v6, "target");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTarget:action:forControlEvents:", v8, objc_msgSend(v6, "selector"), 64);

  }
  else
  {
    objc_msgSend(v11, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);
  }
  v9 = objc_msgSend(v6, "isDestructive");

  if (v9)
    +[CNUIColorRepository contactCardDestructiveActionTitleTextColor](CNUIColorRepository, "contactCardDestructiveActionTitleTextColor");
  else
    -[CNContactActionSplitCell tintColor](self, "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitleColor:forState:", v10, 0);

}

- (UIButton)leftLabel
{
  return self->_leftLabel;
}

- (UIButton)rightLabel
{
  return self->_rightLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightLabel, 0);
  objc_storeStrong((id *)&self->_leftLabel, 0);
}

@end
