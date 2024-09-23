@implementation _HUQuickControlSingleControlHostView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (_HUQuickControlSingleControlHostView)initWithContentView:(id)a3
{
  id v5;
  _HUQuickControlSingleControlHostView *v6;
  _HUQuickControlSingleControlHostView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HUQuickControlSingleControlHostView;
  v6 = -[_HUQuickControlSingleControlHostView init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentView, a3);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v7->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_HUQuickControlSingleControlHostView addSubview:](v7, "addSubview:", v5);
    -[_HUQuickControlSingleControlHostView _setupConstraintSet](v7, "_setupConstraintSet");
  }

  return v7;
}

- (HULayoutAnchorProviding)preferredFrameLayoutGuide
{
  if (self->_preferredFrameLayoutGuide)
    self = (_HUQuickControlSingleControlHostView *)self->_preferredFrameLayoutGuide;
  return (HULayoutAnchorProviding *)self;
}

- (void)setPreferredFrameLayoutGuide:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_HUQuickControlSingleControlHostView preferredFrameLayoutGuide](self, "preferredFrameLayoutGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v8);

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferredFrameLayoutGuide, a3);
    -[_HUQuickControlSingleControlHostView constraintSet](self, "constraintSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

  }
}

- (BOOL)hasSingleControlView
{
  return 1;
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_HUQuickControlSingleControlHostView;
  -[_HUQuickControlSingleControlHostView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[_HUQuickControlSingleControlHostView constraintSet](self, "constraintSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

}

- (void)updateConstraints
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_HUQuickControlSingleControlHostView;
  -[_HUQuickControlSingleControlHostView updateConstraints](&v4, sel_updateConstraints);
  -[_HUQuickControlSingleControlHostView constraintSet](self, "constraintSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateIfNeeded");

}

- (void)_setupConstraintSet
{
  NAUILayoutConstraintSet *v3;
  NAUILayoutConstraintSet *constraintSet;

  v3 = (NAUILayoutConstraintSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51A18]), "initWithOwningView:constraintBuilder:", self, &__block_literal_global_249);
  constraintSet = self->_constraintSet;
  self->_constraintSet = v3;

}

- (UIView)contentView
{
  return self->_contentView;
}

- (NAUILayoutConstraintSet)constraintSet
{
  return self->_constraintSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraintSet, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_preferredFrameLayoutGuide, 0);
}

@end
