@implementation _MKStackingPlaceholderView

- (_MKStackingPlaceholderView)initWithHeight:(double)a3
{
  _MKStackingPlaceholderView *v4;
  _MKStackingPlaceholderView *v5;
  void *v6;
  uint64_t v7;
  NSLayoutConstraint *contentHeightConstraint;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_MKStackingPlaceholderView;
  v4 = -[_MKStackingPlaceholderView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    -[_MKStackingPlaceholderView heightAnchor](v4, "heightAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToConstant:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
    contentHeightConstraint = v5->_contentHeightConstraint;
    v5->_contentHeightConstraint = (NSLayoutConstraint *)v7;

    -[NSLayoutConstraint setActive:](v5->_contentHeightConstraint, "setActive:", 1);
  }
  return v5;
}

- (double)contentHeight
{
  double result;

  -[NSLayoutConstraint constant](self->_contentHeightConstraint, "constant");
  return result;
}

- (void)setContentHeight:(double)a3
{
  -[NSLayoutConstraint setConstant:](self->_contentHeightConstraint, "setConstant:", a3);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentHeightConstraint, 0);
}

@end
