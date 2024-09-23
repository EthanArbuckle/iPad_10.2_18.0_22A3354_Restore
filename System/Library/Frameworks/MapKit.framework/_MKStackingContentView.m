@implementation _MKStackingContentView

- (_MKStackingContentView)initWithViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MKStackingContentView;
  return -[_MKUIViewControllerRootView initWithViewController:](&v4, sel_initWithViewController_, a3);
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)updateConstraints
{
  id *p_topView;
  NSLayoutConstraint *topConstraint;
  NSLayoutConstraint *bottomConstraint;
  NSLayoutConstraint *v6;
  UIView *bottomView;
  void *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *v11;
  UIView *v12;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *middleConstraint;
  NSLayoutConstraint *v17;
  UIView *v18;
  void *v19;
  UIView **p_bottomView;
  void *v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *v23;
  objc_super v24;

  p_topView = (id *)&self->_topView;
  if (!self->_topView && !self->_bottomView)
    goto LABEL_24;
  topConstraint = self->_topConstraint;
  if (!topConstraint)
    goto LABEL_9;
  if (-[NSLayoutConstraint isActive](topConstraint, "isActive"))
  {
    bottomConstraint = self->_bottomConstraint;
    if (bottomConstraint)
    {
      if (-[NSLayoutConstraint isActive](bottomConstraint, "isActive"))
        goto LABEL_24;
    }
  }
  v6 = self->_topConstraint;
  if (!v6 || !-[NSLayoutConstraint isActive](v6, "isActive"))
  {
LABEL_9:
    bottomView = (UIView *)*p_topView;
    if (!*p_topView)
      bottomView = self->_bottomView;
    -[UIView topAnchor](bottomView, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKStackingContentView topAnchor](self, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v11 = self->_topConstraint;
    self->_topConstraint = v10;

    -[NSLayoutConstraint setActive:](self->_topConstraint, "setActive:", 1);
  }
  if (*p_topView)
  {
    v12 = self->_bottomView;
    if (v12)
    {
      if (!self->_middleConstraint)
      {
LABEL_17:
        -[UIView topAnchor](v12, "topAnchor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*p_topView, "bottomAnchor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "constraintEqualToAnchor:", v14);
        v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
        middleConstraint = self->_middleConstraint;
        self->_middleConstraint = v15;

        -[NSLayoutConstraint setActive:](self->_middleConstraint, "setActive:", 1);
        goto LABEL_18;
      }
      if (!-[NSLayoutConstraint isActive](self->_middleConstraint, "isActive"))
      {
        v12 = self->_bottomView;
        goto LABEL_17;
      }
    }
  }
LABEL_18:
  v17 = self->_bottomConstraint;
  if (!v17 || !-[NSLayoutConstraint isActive](v17, "isActive"))
  {
    v18 = self->_bottomView;
    -[_MKStackingContentView bottomAnchor](self, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      p_bottomView = &self->_bottomView;
    else
      p_bottomView = (UIView **)p_topView;
    -[UIView bottomAnchor](*p_bottomView, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v21);
    v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v23 = self->_bottomConstraint;
    self->_bottomConstraint = v22;

    -[NSLayoutConstraint setActive:](self->_bottomConstraint, "setActive:", 1);
  }
LABEL_24:
  v24.receiver = self;
  v24.super_class = (Class)_MKStackingContentView;
  -[_MKStackingContentView updateConstraints](&v24, sel_updateConstraints);
}

- (void)setTopView:(id)a3
{
  UIView *v5;
  UIView **p_topView;
  UIView *topView;
  _MKStackingContentView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v5 = (UIView *)a3;
  p_topView = &self->_topView;
  topView = self->_topView;
  if (topView != v5)
  {
    -[UIView superview](topView, "superview");
    v8 = (_MKStackingContentView *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[UIView removeFromSuperview](*p_topView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_topView, a3);
    if (*p_topView)
    {
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_topView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[_MKStackingContentView addSubview:](self, "addSubview:", *p_topView);
      v9 = (void *)MEMORY[0x1E0CB3718];
      -[UIView leftAnchor](*p_topView, "leftAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKStackingContentView leftAnchor](self, "leftAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v12;
      -[_MKStackingContentView rightAnchor](self, "rightAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView rightAnchor](*p_topView, "rightAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "activateConstraints:", v16);

    }
    -[NSLayoutConstraint setActive:](self->_topConstraint, "setActive:", 0);
    -[NSLayoutConstraint setActive:](self->_middleConstraint, "setActive:", 0);
    if (!self->_bottomView)
      -[NSLayoutConstraint setActive:](self->_bottomConstraint, "setActive:", 0);
    -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");
  }

}

- (void)setBottomView:(id)a3
{
  id v5;
  UIView **p_bottomView;
  _MKStackingContentView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_bottomView = &self->_bottomView;
  -[UIView superview](self->_bottomView, "superview");
  v7 = (_MKStackingContentView *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
    -[UIView removeFromSuperview](*p_bottomView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_bottomView, a3);
  if (*p_bottomView)
  {
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_bottomView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_MKStackingContentView addSubview:](self, "addSubview:", *p_bottomView);
    v8 = (void *)MEMORY[0x1E0CB3718];
    -[UIView leftAnchor](*p_bottomView, "leftAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKStackingContentView leftAnchor](self, "leftAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    -[_MKStackingContentView rightAnchor](self, "rightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](*p_bottomView, "rightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activateConstraints:", v15);

  }
  -[NSLayoutConstraint setActive:](self->_bottomConstraint, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_middleConstraint, "setActive:", 0);
  if (!self->_topView)
    -[NSLayoutConstraint setActive:](self->_topConstraint, "setActive:", 0);
  -[UIView _mapkit_setNeedsUpdateConstraints](self, "_mapkit_setNeedsUpdateConstraints");

}

- (id)vibrancyGroupName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> Vibrancy Group"), objc_opt_class(), self);
}

- (UIView)topView
{
  return self->_topView;
}

- (UIView)bottomView
{
  return self->_bottomView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomView, 0);
  objc_storeStrong((id *)&self->_topView, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_middleConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
}

@end
