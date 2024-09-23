@implementation EKUIVisualEffectView

- (void)setTintColorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_tintColorDelegate, a3);
}

- (EKUIVisualEffectView)initWithFrame:(CGRect)a3
{
  EKUIVisualEffectView *v3;
  TintColorUpdateView *v4;
  uint64_t v5;
  TintColorUpdateView *updateView;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)EKUIVisualEffectView;
  v3 = -[EKUIVisualEffectView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [TintColorUpdateView alloc];
    v5 = -[TintColorUpdateView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    updateView = v3->_updateView;
    v3->_updateView = (TintColorUpdateView *)v5;

    -[TintColorUpdateView setHidden:](v3->_updateView, "setHidden:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TintColorUpdateView setBackgroundColor:](v3->_updateView, "setBackgroundColor:", v7);

    -[TintColorUpdateView setTintColorUpdateDelegate:](v3->_updateView, "setTintColorUpdateDelegate:", v3);
    -[EKUIVisualEffectView contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v3->_updateView);

  }
  return v3;
}

- (void)viewTintColorDidChangeForView:(id)a3 toColor:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  -[EKUIVisualEffectView tintColorDelegate](self, "tintColorDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[EKUIVisualEffectView tintColorDelegate](self, "tintColorDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewTintColorDidChangeForView:toColor:", self, v7);

  }
  -[EKUIVisualEffectView subTintColorUpdatedToColor:](self, "subTintColorUpdatedToColor:", v7);

}

- (EKUITintColorUpdateDelegate)tintColorDelegate
{
  return (EKUITintColorUpdateDelegate *)objc_loadWeakRetained((id *)&self->_tintColorDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tintColorDelegate);
  objc_storeStrong((id *)&self->_updateView, 0);
}

@end
