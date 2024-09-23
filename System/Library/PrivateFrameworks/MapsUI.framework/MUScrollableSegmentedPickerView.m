@implementation MUScrollableSegmentedPickerView

- (MUScrollableSegmentedPickerView)initWithFrame:(CGRect)a3
{
  MUScrollableSegmentedPickerView *v3;
  MUScrollableSegmentedPickerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUScrollableSegmentedPickerView;
  v3 = -[MUScrollableSegmentedPickerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MUScrollableSegmentedPickerView _setupContentView](v3, "_setupContentView");
  return v4;
}

- (void)_setupContentView
{
  MUScrollableSegmentedPickerContentView *v3;
  MUScrollableSegmentedPickerContentView *v4;
  MUScrollableSegmentedPickerContentView *contentView;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *widthConstraint;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSLayoutConstraint *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[7];

  v28[6] = *MEMORY[0x1E0C80C00];
  v3 = [MUScrollableSegmentedPickerContentView alloc];
  v4 = -[MUScrollableSegmentedPickerContentView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  contentView = self->_contentView;
  self->_contentView = v4;

  -[MUScrollableSegmentedPickerContentView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUScrollableSegmentedPickerContentView setDelegate:](self->_contentView, "setDelegate:", self);
  -[MUScrollableSegmentedPickerView addSubview:](self, "addSubview:", self->_contentView);
  -[MUScrollableSegmentedPickerContentView widthAnchor](self->_contentView, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToConstant:", 0.0);
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  widthConstraint = self->_widthConstraint;
  self->_widthConstraint = v7;

  LODWORD(v9) = 1111752704;
  -[NSLayoutConstraint setPriority:](self->_widthConstraint, "setPriority:", v9);
  v21 = (void *)MEMORY[0x1E0CB3718];
  -[MUScrollableSegmentedPickerContentView centerXAnchor](self->_contentView, "centerXAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUScrollableSegmentedPickerView centerXAnchor](self, "centerXAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v25;
  -[MUScrollableSegmentedPickerContentView topAnchor](self->_contentView, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUScrollableSegmentedPickerView topAnchor](self, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v22;
  -[MUScrollableSegmentedPickerContentView bottomAnchor](self->_contentView, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUScrollableSegmentedPickerView bottomAnchor](self, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v11;
  -[MUScrollableSegmentedPickerContentView leadingAnchor](self->_contentView, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUScrollableSegmentedPickerView leadingAnchor](self, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintGreaterThanOrEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v14;
  -[MUScrollableSegmentedPickerContentView trailingAnchor](self->_contentView, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUScrollableSegmentedPickerView trailingAnchor](self, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintLessThanOrEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = self->_widthConstraint;
  v28[4] = v17;
  v28[5] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v19);

}

- (void)setViewModels:(id)a3
{
  -[MUScrollableSegmentedPickerContentView setViewModels:](self->_contentView, "setViewModels:", a3);
}

- (NSArray)viewModels
{
  return -[MUScrollableSegmentedPickerContentView viewModels](self->_contentView, "viewModels");
}

- (void)setSelectedIndex:(unint64_t)a3
{
  -[MUScrollableSegmentedPickerContentView setSelectedIndex:](self->_contentView, "setSelectedIndex:", a3);
}

- (unint64_t)selectedIndex
{
  return -[MUScrollableSegmentedPickerContentView selectedIndex](self->_contentView, "selectedIndex");
}

- (void)layoutSubviews
{
  MUScrollableSegmentedPickerContentView *contentView;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUScrollableSegmentedPickerView;
  -[MUScrollableSegmentedPickerView layoutSubviews](&v6, sel_layoutSubviews);
  contentView = self->_contentView;
  -[MUScrollableSegmentedPickerView bounds](self, "bounds");
  -[MUScrollableSegmentedPickerContentView idealWidthForProposedSize:](contentView, "idealWidthForProposedSize:", v4, v5);
  -[NSLayoutConstraint setConstant:](self->_widthConstraint, "setConstant:");
}

- (void)segmentedPickerContentViewDidUpdateSelection:(id)a3
{
  id v4;

  -[MUScrollableSegmentedPickerView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollableSegmentedPickerView:didChangeSelectedIndex:", self, -[MUScrollableSegmentedPickerView selectedIndex](self, "selectedIndex"));

}

- (MUScrollableSegmentedPickerViewDelegate)delegate
{
  return (MUScrollableSegmentedPickerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
