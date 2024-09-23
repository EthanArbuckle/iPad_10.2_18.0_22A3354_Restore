@implementation SFStartPageFilledBackgroundCell

- (SFStartPageFilledBackgroundCell)initWithFrame:(CGRect)a3
{
  SFStartPageFilledBackgroundCell *v3;
  uint64_t v4;
  UIVisualEffectView *backgroundEffectView;
  UIVisualEffectView *v6;
  void *v7;
  id v8;
  void *v9;
  SFStartPageFilledBackgroundCell *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFStartPageFilledBackgroundCell;
  v3 = -[SFStartPageFilledBackgroundCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3F58], "sf_startPageCellBackgroundEffectViewWithShadow:shadowRadius:", 1, 8.0);
    v4 = objc_claimAutoreleasedReturnValue();
    backgroundEffectView = v3->_backgroundEffectView;
    v3->_backgroundEffectView = (UIVisualEffectView *)v4;

    -[UIVisualEffectView sf_configureAsStartPageBackground](v3->_backgroundEffectView, "sf_configureAsStartPageBackground");
    v6 = v3->_backgroundEffectView;
    objc_msgSend(MEMORY[0x1E0DC3F58], "sf_startPageBackgroundTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)-[UIVisualEffectView registerForTraitChanges:withTarget:action:](v6, "registerForTraitChanges:withTarget:action:", v7, v3->_backgroundEffectView, sel_sf_configureAsStartPageBackground);

    -[SFStartPageFilledBackgroundCell defaultBackgroundConfiguration](v3, "defaultBackgroundConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageFilledBackgroundCell setBackgroundConfiguration:](v3, "setBackgroundConfiguration:", v9);

    v10 = v3;
  }

  return v3;
}

- (id)defaultBackgroundConfiguration
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFStartPageFilledBackgroundCell;
  -[SFStartPageFilledBackgroundCell defaultBackgroundConfiguration](&v5, sel_defaultBackgroundConfiguration);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCustomView:", self->_backgroundEffectView);
  return v3;
}

- (_UIVisualEffectBackdropView)backdropCaptureView
{
  return (_UIVisualEffectBackdropView *)-[UIVisualEffectView _captureView](self->_backgroundEffectView, "_captureView");
}

- (void)setBackdropCaptureView:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UIVisualEffectView _captureView](self->_backgroundEffectView, "_captureView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
    -[UIVisualEffectView _setCaptureView:](self->_backgroundEffectView, "_setCaptureView:", v6);

}

- (UIVisualEffectView)backgroundEffectView
{
  return self->_backgroundEffectView;
}

- (void)setBackgroundEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundEffectView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
}

@end
