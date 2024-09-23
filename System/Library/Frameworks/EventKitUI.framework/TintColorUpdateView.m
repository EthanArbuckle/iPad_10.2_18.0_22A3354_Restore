@implementation TintColorUpdateView

- (void)setTintColorUpdateDelegate:(id)a3
{
  self->_tintColorUpdateDelegate = (EKUITintColorUpdateDelegate *)a3;
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TintColorUpdateView;
  -[TintColorUpdateView tintColorDidChange](&v6, sel_tintColorDidChange);
  -[TintColorUpdateView tintColorUpdateDelegate](self, "tintColorUpdateDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TintColorUpdateView tintColorUpdateDelegate](self, "tintColorUpdateDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TintColorUpdateView tintColor](self, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewTintColorDidChangeForView:toColor:", self, v5);

  }
}

- (EKUITintColorUpdateDelegate)tintColorUpdateDelegate
{
  return self->_tintColorUpdateDelegate;
}

@end
