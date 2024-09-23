@implementation GKSectionSeparatorView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (GKSectionSeparatorView)initWithFrame:(CGRect)a3
{
  GKSectionSeparatorView *v3;
  GKHairlineView *v4;
  UIView *underlineView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GKSectionSeparatorView;
  v3 = -[GKSectionSeparatorView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(GKHairlineView);
    underlineView = v3->_underlineView;
    v3->_underlineView = &v4->super;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_underlineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKSectionSeparatorView addSubview:](v3, "addSubview:", v3->_underlineView);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_underlineView, 4, 0, v3, 4, 1.0, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSectionSeparatorView addConstraint:](v3, "addConstraint:", v6);

    v7 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_underlineView"), v3->_underlineView, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-(15)-[_underlineView]|"), 0, 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSectionSeparatorView addConstraints:](v3, "addConstraints:", v9);

  }
  return v3;
}

- (UIView)underlineView
{
  return self->_underlineView;
}

- (void)setUnderlineView:(id)a3
{
  objc_storeStrong((id *)&self->_underlineView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlineView, 0);
}

@end
