@implementation PKPaletteErasingAttributesViewController

- (void)loadView
{
  void *v3;
  void *v4;
  PKPaletteErasingAttributesView *v5;

  v5 = objc_alloc_init(PKPaletteErasingAttributesView);
  -[PKPaletteErasingAttributesView segmentedControl](v5, "segmentedControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__segmentedControlDidChangeValue_, 4096);

  -[PKPaletteErasingAttributesView thicknessPicker](v5, "thicknessPicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__thicknessValueChanged_, 4096);

  -[PKPaletteErasingAttributesViewController setView:](self, "setView:", v5);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaletteErasingAttributesViewController;
  -[PKPaletteErasingAttributesViewController viewDidLoad](&v4, sel_viewDidLoad);
  if (PKIsVisionDevice())
  {
    -[PKPaletteErasingAttributesViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOverrideUserInterfaceStyle:", 2);

  }
}

- (void)_segmentedControlDidChangeValue:(id)a3
{
  void *v4;
  id v5;

  -[PKPaletteAttributeViewController setDidExperienceUserInteraction:](self, "setDidExperienceUserInteraction:", 1);
  -[PKPaletteErasingAttributesViewController _attributesView](self, "_attributesView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateThicknessPickerToolConfiguration");

  -[PKPaletteErasingAttributesViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "erasingAttributesViewControllerDidChangeErasingType:", self);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setHideWeightPicker:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PKPaletteErasingAttributesViewController _attributesView](self, "_attributesView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHideWeightPicker:", v3);

}

- (double)weight
{
  void *v2;
  double *v3;
  double v4;

  -[PKPaletteErasingAttributesViewController _attributesView](self, "_attributesView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thicknessPicker");
  v3 = (double *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = v3[59];
  else
    v4 = 0.0;

  return v4;
}

- (void)setWeight:(double)a3
{
  double *v4;
  double *v5;
  id v6;

  -[PKPaletteErasingAttributesViewController _attributesView](self, "_attributesView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "thicknessPicker");
  v4 = (double *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v4[59] = a3;
    objc_msgSend(v4, "setNeedsLayout");
  }

}

- (void)setEraserType:(int64_t)a3
{
  id v4;

  -[PKPaletteErasingAttributesViewController _attributesView](self, "_attributesView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEraserType:", a3);

}

- (int64_t)eraserType
{
  void *v2;
  int64_t v3;

  -[PKPaletteErasingAttributesViewController _attributesView](self, "_attributesView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "eraserType");

  return v3;
}

- (CGSize)preferredContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[PKPaletteErasingAttributesViewController _attributesView](self, "_attributesView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;

  v6 = fmax(v5, 300.0);
  if (v6 <= 400.0)
    v7 = v6;
  else
    v7 = 400.0;
  -[PKPaletteErasingAttributesViewController _attributesView](self, "_attributesView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intrinsicContentSize");
  v10 = v9;

  v11 = v7;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)_thicknessValueChanged:(id)a3
{
  id v4;

  -[PKPaletteErasingAttributesViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "erasingAttributesViewControllerDidChangeInkThickness:", self);

}

- (BOOL)hideWeightPicker
{
  return self->_hideWeightPicker;
}

- (PKPaletteErasingAttributesViewControllerDelegate)delegate
{
  return (PKPaletteErasingAttributesViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
