@implementation PKAccessoryView

- (PKAccessoryView)initWithFrame:(CGRect)a3
{
  PKAccessoryView *v3;
  PKDragIndicatorView *v4;
  PKDragIndicatorView *dragIndicatorView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PKAccessoryView;
  v3 = -[PKAccessoryView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(PKDragIndicatorView);
    dragIndicatorView = v3->_dragIndicatorView;
    v3->_dragIndicatorView = v4;

    -[PKDragIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v3->_dragIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKAccessoryView addSubview:](v3, "addSubview:", v3->_dragIndicatorView);
    v6 = (void *)MEMORY[0x1E0CB3718];
    -[PKDragIndicatorView centerXAnchor](v3->_dragIndicatorView, "centerXAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccessoryView centerXAnchor](v3, "centerXAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    -[PKDragIndicatorView centerYAnchor](v3->_dragIndicatorView, "centerYAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccessoryView centerYAnchor](v3, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activateConstraints:", v13);

    -[PKAccessoryView setShowsDragIndicator:](v3, "setShowsDragIndicator:", 1);
  }
  return v3;
}

- (BOOL)showsDragIndicator
{
  void *v2;
  char v3;

  -[PKAccessoryView dragIndicatorView](self, "dragIndicatorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (void)setShowsDragIndicator:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[PKAccessoryView dragIndicatorView](self, "dragIndicatorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (unint64_t)edgeLocation
{
  void *v2;
  unint64_t v3;

  -[PKAccessoryView dragIndicatorView](self, "dragIndicatorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "edgeLocation");

  return v3;
}

- (void)setEdgeLocation:(unint64_t)a3
{
  id v4;

  -[PKAccessoryView dragIndicatorView](self, "dragIndicatorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEdgeLocation:", a3);

}

- (void)setScalingFactor:(double)a3
{
  id v4;

  -[PKAccessoryView dragIndicatorView](self, "dragIndicatorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScalingFactor:", a3);

}

- (double)scalingFactor
{
  void *v2;
  double v3;
  double v4;

  -[PKAccessoryView dragIndicatorView](self, "dragIndicatorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scalingFactor");
  v4 = v3;

  return v4;
}

- (unint64_t)cornerLocation
{
  return self->_cornerLocation;
}

- (void)setCornerLocation:(unint64_t)a3
{
  self->_cornerLocation = a3;
}

- (PKDragIndicatorView)dragIndicatorView
{
  return self->_dragIndicatorView;
}

- (void)setDragIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_dragIndicatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragIndicatorView, 0);
}

@end
