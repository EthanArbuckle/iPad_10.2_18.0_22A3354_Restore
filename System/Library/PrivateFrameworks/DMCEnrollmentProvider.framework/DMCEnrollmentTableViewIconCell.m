@implementation DMCEnrollmentTableViewIconCell

- (DMCEnrollmentTableViewIconCell)initWithIconNames:(id)a3
{
  return -[DMCEnrollmentTableViewIconCell initWithIconNames:layoutStyle:](self, "initWithIconNames:layoutStyle:", a3, 0);
}

- (DMCEnrollmentTableViewIconCell)initWithIconNames:(id)a3 layoutStyle:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  DMCEnrollmentTableViewIconCell *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        -[DMCEnrollmentTableViewIconCell _systemImageWithName:](self, "_systemImageWithName:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = -[DMCEnrollmentTableViewIconCell initWithIconImages:layoutStyle:](self, "initWithIconImages:layoutStyle:", v7, a4);
  return v14;
}

- (DMCEnrollmentTableViewIconCell)initWithIconImages:(id)a3 layoutStyle:(unint64_t)a4
{
  id v6;
  objc_class *v7;
  void *v8;
  DMCEnrollmentTableViewIconCell *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  UIStackView *stackView;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)DMCEnrollmentTableViewIconCell;
  v9 = -[DMCEnrollmentTableViewIconCell initWithStyle:reuseIdentifier:](&v26, sel_initWithStyle_reuseIdentifier_, 0, v8);

  if (v9)
  {
    -[DMCEnrollmentTableViewIconCell setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentTableViewIconCell setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[DMCEnrollmentTableViewIconCell setSelectionStyle:](v9, "setSelectionStyle:", 0);
    v9->_layoutStyle = a4;
    v11 = (void *)objc_opt_new();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          -[DMCEnrollmentTableViewIconCell _createImageViewWithImage:](v9, "_createImageViewWithImage:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16), (_QWORD)v22);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v14);
    }

    -[DMCEnrollmentTableViewIconCell _createStackViewWithViews:](v9, "_createStackViewWithViews:", v11);
    v18 = objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentTableViewIconCell contentView](v9, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v18);

    -[DMCEnrollmentTableViewIconCell _addConstraintsForStackView:](v9, "_addConstraintsForStackView:", v18);
    stackView = v9->_stackView;
    v9->_stackView = (UIStackView *)v18;

  }
  return v9;
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)DMCEnrollmentTableViewIconCell;
  -[DMCEnrollmentTableViewIconCell layoutSubviews](&v3, sel_layoutSubviews);
  -[DMCEnrollmentTableViewIconCell bounds](self, "bounds");
  -[DMCEnrollmentTableViewIconCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, CGRectGetWidth(v4), 0.0, 0.0);
}

- (void)_updateImageViewsWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  int64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[DMCEnrollmentTableViewIconCell stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrangedSubviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = a3 - v7;
  if (a3 - v7 < 1)
  {
    if (v8 < 0)
    {
      v12 = v7 - a3;
      do
      {
        -[DMCEnrollmentTableViewIconCell stackView](self, "stackView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[DMCEnrollmentTableViewIconCell stackView](self, "stackView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "arrangedSubviews");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeArrangedSubview:", v16);

        --v12;
      }
      while (v12);
    }
  }
  else
  {
    v9 = v8 + 1;
    do
    {
      -[DMCEnrollmentTableViewIconCell stackView](self, "stackView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentTableViewIconCell _createImageViewWithImage:](self, "_createImageViewWithImage:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addArrangedSubview:", v11);

      --v9;
    }
    while (v9 > 1);
  }
}

- (void)setIconNames:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[DMCEnrollmentTableViewIconCell _updateImageViewsWithCount:](self, "_updateImageViewsWithCount:", objc_msgSend(v10, "count"));
  -[DMCEnrollmentTableViewIconCell stackView](self, "stackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentTableViewIconCell _systemImageWithName:](self, "_systemImageWithName:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setImage:", v8);

      ++v6;
    }
    while (objc_msgSend(v10, "count") > v6);
  }
  -[DMCEnrollmentTableViewIconCell setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)setIconImages:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[DMCEnrollmentTableViewIconCell _updateImageViewsWithCount:](self, "_updateImageViewsWithCount:", objc_msgSend(v9, "count"));
  -[DMCEnrollmentTableViewIconCell stackView](self, "stackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setImage:", v7);

      ++v6;
    }
    while (objc_msgSend(v9, "count") > v6);
  }
  -[DMCEnrollmentTableViewIconCell setNeedsDisplay](self, "setNeedsDisplay");

}

- (double)cellHeight
{
  double v2;

  -[DMCEnrollmentTableViewIconCell _iconHeight](self, "_iconHeight");
  return v2 + 0.0 + 10.0;
}

- (double)estimatedCellHeight
{
  double v2;

  -[DMCEnrollmentTableViewIconCell _iconHeight](self, "_iconHeight");
  return v2 + 0.0 + 10.0;
}

- (double)_iconWidth
{
  return 80.0;
}

- (double)_iconHeight
{
  unint64_t v2;
  double result;

  v2 = -[DMCEnrollmentTableViewIconCell layoutStyle](self, "layoutStyle");
  result = 80.0;
  if (v2 == 1)
    return 38.0;
  return result;
}

- (id)_systemImageWithName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDF6AE0];
  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_configurationWithHierarchicalColors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "imageWithConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_createImageViewWithImage:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;

  v4 = (objc_class *)MEMORY[0x24BDF6AE8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithImage:", v5);

  objc_msgSend(v6, "setFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)MEMORY[0x24BDD1628];
  -[DMCEnrollmentTableViewIconCell _iconWidth](self, "_iconWidth");
  objc_msgSend(v7, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 7, 0, v6, 7, 0.0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraint:", v9);

  v10 = (void *)MEMORY[0x24BDD1628];
  -[DMCEnrollmentTableViewIconCell _iconHeight](self, "_iconHeight");
  objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 8, 0, v6, 8, 0.0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraint:", v12);

  objc_msgSend(v6, "setContentMode:", 1);
  return v6;
}

- (id)_createStackViewWithViews:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDF6DD0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithArrangedSubviews:", v4);

  objc_msgSend(v5, "setAxis:", 0);
  objc_msgSend(v5, "setAlignment:", 3);
  objc_msgSend(v5, "setDistribution:", 4);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setSpacing:", 10.0);
  return v5;
}

- (void)_addConstraintsForStackView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DMCEnrollmentTableViewIconCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD1628];
  -[DMCEnrollmentTableViewIconCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 9, 0, v7, 9, 1.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConstraint:", v8);

  v16 = CFSTR("stackView");
  v17[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentTableViewIconCell layoutStyle](self, "layoutStyle");
  v10 = -[DMCEnrollmentTableViewIconCell layoutStyle](self, "layoutStyle");
  v11 = 10.0;
  if (v10 == 1)
    v11 = 0.0;
  v12 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("V:|-%f-[stackView]-%f-|"), 0, *(_QWORD *)&v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintsWithVisualFormat:options:metrics:views:", v13, 0, 0, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[DMCEnrollmentTableViewIconCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addConstraints:", v14);

}

- (unint64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(unint64_t)a3
{
  self->_layoutStyle = a3;
}

- (NSArray)icons
{
  return self->_icons;
}

- (void)setIcons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_icons, 0);
}

@end
