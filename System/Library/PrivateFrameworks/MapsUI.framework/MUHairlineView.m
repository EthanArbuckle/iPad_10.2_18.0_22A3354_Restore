@implementation MUHairlineView

- (MUHairlineView)init
{
  MUHairlineView *v2;
  MUHairlineView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUHairlineView;
  v2 = -[MKHairlineView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
    -[MUHairlineView customInit](v2, "customInit");
  return v3;
}

- (MUHairlineView)initWithFrame:(CGRect)a3
{
  MUHairlineView *v3;
  MUHairlineView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUHairlineView;
  v3 = -[MKHairlineView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MUHairlineView customInit](v3, "customInit");
  return v4;
}

- (MUHairlineView)initWithCoder:(id)a3
{
  MUHairlineView *v3;
  MUHairlineView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUHairlineView;
  v3 = -[MUHairlineView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[MUHairlineView customInit](v3, "customInit");
  return v4;
}

- (void)customInit
{
  MUHairlineView *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v2 = self;
  -[MUHairlineView window](v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MUHairlineView window](v2, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nativeScale");
    v8 = v7;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nativeScale");
    v8 = v9;
  }

  if (v8 <= 0.0)
    v10 = 1.0;
  else
    v10 = 1.0 / v8;

  v2->_intrinsicThickness = v10;
  LODWORD(v11) = 1148846080;
  -[MUHairlineView setContentHuggingPriority:forAxis:](v2, "setContentHuggingPriority:forAxis:", 1, v11);
  LODWORD(v12) = 1148846080;
  -[MUHairlineView setContentCompressionResistancePriority:forAxis:](v2, "setContentCompressionResistancePriority:forAxis:", 1, v12);
  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)-[MUHairlineView registerForTraitChanges:withAction:](v2, "registerForTraitChanges:withAction:", v14, sel__updateIntrinsicThicknessForDisplayScale);

}

- (void)setVertical:(BOOL)a3
{
  double v3;
  float v5;
  float v6;
  float v7;
  double v8;
  double v9;
  double v10;

  if (self->_vertical != a3)
  {
    self->_vertical = a3;
    if (a3)
      *(float *)&v3 = 1000.0;
    else
      *(float *)&v3 = 250.0;
    if (a3)
      v5 = 250.0;
    else
      v5 = 1000.0;
    if (a3)
      v6 = 1000.0;
    else
      v6 = 750.0;
    if (a3)
      v7 = 750.0;
    else
      v7 = 1000.0;
    -[MUHairlineView setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", 0, v3);
    *(float *)&v8 = v5;
    -[MUHairlineView setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", 1, v8);
    *(float *)&v9 = v6;
    -[MUHairlineView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 0, v9);
    *(float *)&v10 = v7;
    -[MUHairlineView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 1, v10);
  }
}

- (void)didMoveToWindow
{
  MUHairlineView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MUHairlineView;
  -[MKHairlineView didMoveToWindow](&v12, sel_didMoveToWindow);
  v3 = self;
  -[MUHairlineView window](v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MUHairlineView window](v3, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "screen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nativeScale");
    v9 = v8;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "nativeScale");
    v9 = v10;
  }

  v11 = 1.0;
  if (v9 > 0.0)
    v11 = 1.0 / v9;
  if (v11 != v3->_intrinsicThickness)
  {
    v3->_intrinsicThickness = v11;
    -[MUHairlineView invalidateIntrinsicContentSize](v3, "invalidateIntrinsicContentSize");
  }
}

- (CGSize)intrinsicContentSize
{
  double *p_intrinsicThickness;
  double *v3;
  double v4;
  double v5;
  CGSize result;

  p_intrinsicThickness = &self->_intrinsicThickness;
  if (self->_vertical)
    v3 = &self->_intrinsicThickness;
  else
    v3 = (double *)MEMORY[0x1E0DC55F0];
  if (self->_vertical)
    p_intrinsicThickness = (double *)MEMORY[0x1E0DC55F0];
  v4 = *p_intrinsicThickness;
  v5 = *v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  if (self->_vertical)
    result.width = self->_intrinsicThickness;
  else
    result.height = self->_intrinsicThickness;
  return result;
}

- (void)_updateIntrinsicThicknessForDisplayScale
{
  MUHairlineView *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v2 = self;
  -[MUHairlineView window](v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MUHairlineView window](v2, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nativeScale");
    v8 = v7;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nativeScale");
    v8 = v9;
  }

  if (v8 <= 0.0)
    v10 = 1.0;
  else
    v10 = 1.0 / v8;

  v2->_intrinsicThickness = v10;
  -[MUHairlineView invalidateIntrinsicContentSize](v2, "invalidateIntrinsicContentSize");
}

- (void)setLeadingMargin:(double)a3
{
  id v4;

  -[MUHairlineView leadingMarginConstraint](self, "leadingMarginConstraint");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", a3);

}

- (double)leadingMargin
{
  void *v2;
  double v3;
  double v4;

  -[MUHairlineView leadingMarginConstraint](self, "leadingMarginConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constant");
  v4 = v3;

  return v4;
}

- (void)setTrailingMargin:(double)a3
{
  id v4;

  -[MUHairlineView trailingMarginConstraint](self, "trailingMarginConstraint");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", a3);

}

- (double)trailingMargin
{
  void *v2;
  double v3;
  double v4;

  -[MUHairlineView trailingMarginConstraint](self, "trailingMarginConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constant");
  v4 = v3;

  return v4;
}

- (BOOL)vertical
{
  return self->_vertical;
}

- (NSLayoutConstraint)leadingMarginConstraint
{
  return self->_leadingMarginConstraint;
}

- (void)setLeadingMarginConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingMarginConstraint, a3);
}

- (NSLayoutConstraint)trailingMarginConstraint
{
  return self->_trailingMarginConstraint;
}

- (void)setTrailingMarginConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingMarginConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_leadingMarginConstraint, 0);
}

@end
