@implementation MUScrollableSegmentedPickerSegmentView

- (MUScrollableSegmentedPickerSegmentView)initWithFrame:(CGRect)a3
{
  MUScrollableSegmentedPickerSegmentView *v3;
  MUScrollableSegmentedPickerSegmentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUScrollableSegmentedPickerSegmentView;
  v3 = -[MUScrollableSegmentedPickerSegmentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUScrollableSegmentedPickerSegmentView _setupLabel](v3, "_setupLabel");
    -[MUScrollableSegmentedPickerSegmentView _updateSelectionAppearance](v4, "_updateSelectionAppearance");
  }
  return v4;
}

- (void)_setupLabel
{
  id v3;
  UILabel *v4;
  UILabel *label;
  MUEdgeLayout *v6;
  MUEdgeLayout *edgeLayout;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[MUScrollableSegmentedPickerSegmentView setClipsToBounds:](self, "setClipsToBounds:", 1);
  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  label = self->_label;
  self->_label = v4;

  -[MUScrollableSegmentedPickerSegmentView _updateFont](self, "_updateFont");
  -[MUScrollableSegmentedPickerSegmentView addSubview:](self, "addSubview:", self->_label);
  v6 = -[MUEdgeLayout initWithItem:container:]([MUEdgeLayout alloc], "initWithItem:container:", self->_label, self);
  edgeLayout = self->_edgeLayout;
  self->_edgeLayout = v6;

  -[MUEdgeLayout setInsets:](self->_edgeLayout, "setInsets:", 8.0, 16.0, 8.0, 16.0);
  -[MUConstraintLayout activate](self->_edgeLayout, "activate");
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)-[MUScrollableSegmentedPickerSegmentView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v9, sel__updateFont);

}

- (void)setViewModel:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_viewModel) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[MUScrollableSegmentedPickerSegmentView _updateAppearance](self, "_updateAppearance");
  }

}

- (void)_updateAppearance
{
  void *v3;
  id v4;

  -[MUScrollableSegmentedPickerCategory categoryName](self->_viewModel, "categoryName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_label, "setText:", v3);

  -[MUScrollableSegmentedPickerCategory categoryName](self->_viewModel, "categoryName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MUScrollableSegmentedPickerSegmentView setAccessibilityLabel:](self, "setAccessibilityLabel:", v4);

}

- (void)_updateFont
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "_mapsui_preferredFontForTextStyle:maxContentSizeCategory:weight:withSymbolicTraits:", *MEMORY[0x1E0DC4AD0], *MEMORY[0x1E0DC48F8], 0, *MEMORY[0x1E0DC1448]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v3);

}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MUScrollableSegmentedPickerSegmentView;
  -[MUScrollableSegmentedPickerSegmentView setSelected:](&v4, sel_setSelected_, a3);
  -[MUScrollableSegmentedPickerSegmentView _updateSelectionAppearance](self, "_updateSelectionAppearance");
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MUScrollableSegmentedPickerSegmentView;
  -[MUScrollableSegmentedPickerSegmentView setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[MUScrollableSegmentedPickerSegmentView _updateSelectionAppearance](self, "_updateSelectionAppearance");
}

- (void)_updateSelectionAppearance
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;

  if ((-[MUScrollableSegmentedPickerSegmentView isSelected](self, "isSelected") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[MUScrollableSegmentedPickerSegmentView isHighlighted](self, "isHighlighted"))
  {
    objc_msgSend(v5, "colorWithAlphaComponent:", 0.300000012);
    v3 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v3;
  }
  else
  {
    v4 = v5;
  }
  v6 = v4;
  -[UILabel setTextColor:](self->_label, "setTextColor:", v4);

}

- (MUScrollableSegmentedPickerCategory)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_edgeLayout, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
