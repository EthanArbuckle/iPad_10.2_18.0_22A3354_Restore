@implementation SFSizeObservingView

- (SFSizeObservingView)initWithFrame:(CGRect)a3
{
  SFSizeObservingView *v3;
  SFSizeObservingView *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  SFSizeObservingView *v15;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)SFSizeObservingView;
  v3 = -[SFSizeObservingView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFSizeObservingView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFSizeObservingView setHidden:](v4, "setHidden:", 1);
    -[SFSizeObservingView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    v5 = (void *)MEMORY[0x1E0CB3718];
    -[SFSizeObservingView heightAnchor](v4, "heightAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToConstant:", 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1132068864;
    objc_msgSend(v7, "sf_withPriority:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    -[SFSizeObservingView widthAnchor](v4, "widthAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToConstant:", 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = 1132068864;
    objc_msgSend(v11, "sf_withPriority:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activateConstraints:", v14);

    v15 = v4;
  }

  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)setObservedHeightDimension:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *heightConstraint;
  id v10;

  v10 = a3;
  -[SFSizeObservingView observedHeightDimension](self, "observedHeightDimension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = WBSIsEqual();

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_observedHeightDimension, a3);
    -[NSLayoutConstraint setActive:](self->_heightConstraint, "setActive:", 0);
    -[SFSizeObservingView heightAnchor](self, "heightAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v10);
    v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    heightConstraint = self->_heightConstraint;
    self->_heightConstraint = v8;

    -[NSLayoutConstraint setActive:](self->_heightConstraint, "setActive:", 1);
    -[SFSizeObservingView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  void (**sizeChangeCallback)(double, double);
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFSizeObservingView;
  -[SFSizeObservingView layoutSubviews](&v9, sel_layoutSubviews);
  -[SFSizeObservingView bounds](self, "bounds");
  v5 = v3;
  v6 = v4;
  if (self->_lastLayoutSize.width != v3 || self->_lastLayoutSize.height != v4)
  {
    sizeChangeCallback = (void (**)(double, double))self->_sizeChangeCallback;
    if (sizeChangeCallback)
      sizeChangeCallback[2](v3, v4);
    self->_lastLayoutSize.width = v5;
    self->_lastLayoutSize.height = v6;
  }
}

- (NSLayoutDimension)observedHeightDimension
{
  return self->_observedHeightDimension;
}

- (id)sizeChangeCallback
{
  return self->_sizeChangeCallback;
}

- (void)setSizeChangeCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sizeChangeCallback, 0);
  objc_storeStrong((id *)&self->_observedHeightDimension, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

@end
