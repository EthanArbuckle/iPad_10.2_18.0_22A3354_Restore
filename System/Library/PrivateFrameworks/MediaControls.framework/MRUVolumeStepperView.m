@implementation MRUVolumeStepperView

- (MRUVolumeStepperView)initWithFrame:(CGRect)a3
{
  MRUVolumeStepperView *v3;
  uint64_t v4;
  UIView *increaseMaterialView;
  uint64_t v6;
  UIView *decreaseMaterialView;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  CCUIButtonModuleView *increaseButton;
  void *v16;
  void *v17;
  uint64_t v18;
  CCUIButtonModuleView *decreaseButton;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MRUVolumeStepperView;
  v3 = -[MRUVolumeStepperView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D14790], "controlCenterModuleBackgroundMaterial");
    v4 = objc_claimAutoreleasedReturnValue();
    increaseMaterialView = v3->_increaseMaterialView;
    v3->_increaseMaterialView = (UIView *)v4;

    -[UIView setUserInteractionEnabled:](v3->_increaseMaterialView, "setUserInteractionEnabled:", 1);
    -[UIView setClipsToBounds:](v3->_increaseMaterialView, "setClipsToBounds:", 1);
    -[MRUVolumeStepperView addSubview:](v3, "addSubview:", v3->_increaseMaterialView);
    objc_msgSend(MEMORY[0x1E0D14790], "controlCenterModuleBackgroundMaterial");
    v6 = objc_claimAutoreleasedReturnValue();
    decreaseMaterialView = v3->_decreaseMaterialView;
    v3->_decreaseMaterialView = (UIView *)v6;

    -[UIView setUserInteractionEnabled:](v3->_decreaseMaterialView, "setUserInteractionEnabled:", 1);
    -[UIView setClipsToBounds:](v3->_decreaseMaterialView, "setClipsToBounds:", 1);
    -[MRUVolumeStepperView addSubview:](v3, "addSubview:", v3->_decreaseMaterialView);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 2, 24.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0D14760]);
    v10 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v14 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], v11, v12, v13);
    increaseButton = v3->_increaseButton;
    v3->_increaseButton = (CCUIButtonModuleView *)v14;

    +[MRUAssetsProvider volumeRelativePlus](MRUAssetsProvider, "volumeRelativePlus");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageWithSymbolConfiguration:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIButtonModuleView setGlyphImage:](v3->_increaseButton, "setGlyphImage:", v17);

    -[UIView addSubview:](v3->_increaseMaterialView, "addSubview:", v3->_increaseButton);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D14760]), "initWithFrame:", v10, v11, v12, v13);
    decreaseButton = v3->_decreaseButton;
    v3->_decreaseButton = (CCUIButtonModuleView *)v18;

    +[MRUAssetsProvider volumeRelativeMinus](MRUAssetsProvider, "volumeRelativeMinus");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "imageWithSymbolConfiguration:", v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIButtonModuleView setGlyphImage:](v3->_decreaseButton, "setGlyphImage:", v21);

    -[UIView addSubview:](v3->_decreaseMaterialView, "addSubview:", v3->_decreaseButton);
  }
  return v3;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)MRUVolumeStepperView;
  -[MRUVolumeStepperView layoutSubviews](&v9, sel_layoutSubviews);
  -[MRUVolumeStepperView bounds](self, "bounds");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  v7 = CGRectGetWidth(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  v8 = CGRectGetHeight(v11);
  -[UIView setFrame:](self->_increaseMaterialView, "setFrame:", 0.0, 0.0, v7, v7);
  -[UIView bounds](self->_increaseMaterialView, "bounds");
  -[CCUIButtonModuleView setFrame:](self->_increaseButton, "setFrame:");
  -[UIView setFrame:](self->_decreaseMaterialView, "setFrame:", 0.0, v8 - v7, v7, v7);
  -[UIView bounds](self->_decreaseMaterialView, "bounds");
  -[CCUIButtonModuleView setFrame:](self->_decreaseButton, "setFrame:");
}

- (void)setContinuousButtonCornerRadius:(double)a3
{
  -[UIView _setContinuousCornerRadius:](self->_increaseMaterialView, "_setContinuousCornerRadius:");
  -[UIView _setContinuousCornerRadius:](self->_decreaseMaterialView, "_setContinuousCornerRadius:", a3);
}

- (CCUIButtonModuleView)increaseButton
{
  return self->_increaseButton;
}

- (CCUIButtonModuleView)decreaseButton
{
  return self->_decreaseButton;
}

- (double)continuousButtonCornerRadius
{
  return self->_continuousButtonCornerRadius;
}

- (UIView)increaseMaterialView
{
  return self->_increaseMaterialView;
}

- (void)setIncreaseMaterialView:(id)a3
{
  objc_storeStrong((id *)&self->_increaseMaterialView, a3);
}

- (UIView)decreaseMaterialView
{
  return self->_decreaseMaterialView;
}

- (void)setDecreaseMaterialView:(id)a3
{
  objc_storeStrong((id *)&self->_decreaseMaterialView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decreaseMaterialView, 0);
  objc_storeStrong((id *)&self->_increaseMaterialView, 0);
  objc_storeStrong((id *)&self->_decreaseButton, 0);
  objc_storeStrong((id *)&self->_increaseButton, 0);
}

@end
