@implementation MUStackView

- (MUStackView)initWithFrame:(CGRect)a3
{
  MUStackView *v3;
  MUStackView *v4;
  objc_class *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MUStackView;
  v3 = -[MUStackView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUStackView _setupStackView](v3, "_setupStackView");
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUStackView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v6);

  }
  return v4;
}

- (void)_setupStackView
{
  id v3;
  UIStackView *v4;
  UIStackView *stackView;
  void *v6;
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
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v4 = (UIStackView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  stackView = self->_stackView;
  self->_stackView = v4;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView set_mapsui_axis:](self->_stackView, "set_mapsui_axis:", 1);
  -[MUStackView addSubview:](self, "addSubview:", self->_stackView);
  v16 = (void *)MEMORY[0x1E0CB3718];
  -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUStackView leadingAnchor](self, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v17;
  -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUStackView trailingAnchor](self, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v8;
  -[UIStackView topAnchor](self->_stackView, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUStackView topAnchor](self, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v11;
  -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUStackView bottomAnchor](self, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v15);

}

- (NSArray)arrangedSubviews
{
  return -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
}

- (void)addArrangedSubview:(id)a3
{
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", a3);
}

- (void)addArrangedSubview:(id)a3 withCustomSpacing:(double)a4
{
  UIStackView *stackView;
  id v7;

  stackView = self->_stackView;
  v7 = a3;
  -[UIStackView addArrangedSubview:](stackView, "addArrangedSubview:", v7);
  -[MUStackView setCustomSpacing:afterView:](self, "setCustomSpacing:afterView:", v7, a4);

}

- (void)removeArrangedSubview:(id)a3
{
  UIStackView *stackView;
  id v4;

  stackView = self->_stackView;
  v4 = a3;
  -[UIStackView removeArrangedSubview:](stackView, "removeArrangedSubview:", v4);
  objc_msgSend(v4, "removeFromSuperview");

}

- (void)setAxis:(int64_t)a3
{
  -[UIStackView set_mapsui_axis:](self->_stackView, "set_mapsui_axis:", a3);
}

- (int64_t)axis
{
  return -[UIStackView _mapsui_axis](self->_stackView, "_mapsui_axis");
}

- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4
{
  -[UIStackView insertArrangedSubview:atIndex:](self->_stackView, "insertArrangedSubview:atIndex:", a3, a4);
}

- (void)setCustomSpacing:(double)a3 afterView:(id)a4
{
  -[UIStackView setCustomSpacing:afterView:](self->_stackView, "setCustomSpacing:afterView:", a4, a3);
}

- (void)setAlignment:(int64_t)a3
{
  -[UIStackView set_mapsui_alignment:](self->_stackView, "set_mapsui_alignment:", a3);
}

- (int64_t)alignment
{
  return -[UIStackView _mapsui_alignment](self->_stackView, "_mapsui_alignment");
}

- (void)setDistribution:(int64_t)a3
{
  -[UIStackView set_mapsui_distribution:](self->_stackView, "set_mapsui_distribution:", a3);
}

- (int64_t)distribution
{
  return -[UIStackView _mapsui_distribution](self->_stackView, "_mapsui_distribution");
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIStackView systemLayoutSizeFittingSize:](self->_stackView, "systemLayoutSizeFittingSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5;
  double v6;
  CGSize result;

  -[UIStackView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_stackView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIStackView intrinsicContentSize](self->_stackView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  -[UIStackView invalidateIntrinsicContentSize](self->_stackView, "invalidateIntrinsicContentSize");
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  -[UIStackView _mapsui_setContentEdgeInsets:](self->_stackView, "_mapsui_setContentEdgeInsets:", a3.top, a3.left, a3.bottom, a3.right);
}

- (UIEdgeInsets)contentEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[UIStackView layoutMargins](self->_stackView, "layoutMargins");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setArrangedSubviews:(id)a3
{
  -[UIStackView _mapsui_setArrangedSubviews:](self->_stackView, "_mapsui_setArrangedSubviews:", a3);
}

- (void)setSpacing:(double)a3
{
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", a3);
}

- (double)spacing
{
  double result;

  -[UIStackView spacing](self->_stackView, "spacing");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
