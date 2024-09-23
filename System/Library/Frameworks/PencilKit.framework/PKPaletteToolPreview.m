@implementation PKPaletteToolPreview

- (PKPaletteToolPreview)initWithFrame:(CGRect)a3
{
  PKPaletteToolPreview *v3;
  PKPaletteToolPreview *v4;
  UILayoutGuide *v5;
  UILayoutGuide *layoutGuide;
  void *v7;
  void *v8;
  uint64_t v9;
  NSLayoutConstraint *layoutGuideTopConstraint;
  void *v11;
  void *v12;
  uint64_t v13;
  NSLayoutConstraint *layoutGuideWidthConstraint;
  void *v15;
  void *v16;
  uint64_t v17;
  NSLayoutConstraint *layoutGuideHeightConstraint;
  void *v19;
  void *v20;
  uint64_t v21;
  NSLayoutConstraint *layoutGuideCenterXConstraint;
  void *v23;
  void *v24;
  objc_super v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)PKPaletteToolPreview;
  v3 = -[PKPaletteToolPreview initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_scalingFactor = 1.0;
    v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    layoutGuide = v4->_layoutGuide;
    v4->_layoutGuide = v5;

    -[PKPaletteToolPreview addLayoutGuide:](v4, "addLayoutGuide:", v4->_layoutGuide);
    -[UILayoutGuide topAnchor](v4->_layoutGuide, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPreview topAnchor](v4, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    layoutGuideTopConstraint = v4->_layoutGuideTopConstraint;
    v4->_layoutGuideTopConstraint = (NSLayoutConstraint *)v9;

    -[UILayoutGuide widthAnchor](v4->_layoutGuide, "widthAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPreview widthAnchor](v4, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    layoutGuideWidthConstraint = v4->_layoutGuideWidthConstraint;
    v4->_layoutGuideWidthConstraint = (NSLayoutConstraint *)v13;

    -[UILayoutGuide heightAnchor](v4->_layoutGuide, "heightAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPreview heightAnchor](v4, "heightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    layoutGuideHeightConstraint = v4->_layoutGuideHeightConstraint;
    v4->_layoutGuideHeightConstraint = (NSLayoutConstraint *)v17;

    -[UILayoutGuide centerXAnchor](v4->_layoutGuide, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPreview centerXAnchor](v4, "centerXAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    layoutGuideCenterXConstraint = v4->_layoutGuideCenterXConstraint;
    v4->_layoutGuideCenterXConstraint = (NSLayoutConstraint *)v21;

    v23 = (void *)MEMORY[0x1E0CB3718];
    v27[0] = v4->_layoutGuideTopConstraint;
    v27[1] = v4->_layoutGuideWidthConstraint;
    v27[2] = v4->_layoutGuideHeightConstraint;
    v27[3] = v4->_layoutGuideCenterXConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateConstraints:", v24);

    v4->_toolViewVisible = 1;
    -[PKPaletteToolPreview _updateLayoutGuideConstraints](v4, "_updateLayoutGuideConstraints");
    -[PKPaletteToolPreview _updateUI](v4, "_updateUI");
  }
  return v4;
}

- (void)_updateUI
{
  unint64_t v3;
  void *v4;
  int64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  int64_t v10;
  void *v11;
  id v12;

  v3 = -[PKPaletteToolPreview edgeLocation](self, "edgeLocation");
  -[PKPaletteToolPreview toolView](self, "toolView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEdgeLocation:", v3);

  v5 = -[PKPaletteToolPreview colorUserInterfaceStyle](self, "colorUserInterfaceStyle");
  -[PKPaletteToolPreview toolView](self, "toolView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColorUserInterfaceStyle:", v5);

  -[PKPaletteToolPreview scalingFactor](self, "scalingFactor");
  v8 = v7;
  -[PKPaletteToolPreview toolView](self, "toolView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScalingFactor:", v8);

  v10 = -[PKPaletteToolPreview colorUserInterfaceStyle](self, "colorUserInterfaceStyle");
  -[PKPaletteToolPreview colorPickerController](self, "colorPickerController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "colorPicker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColorUserInterfaceStyle:", v10);

}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  if (self->_colorUserInterfaceStyle != a3)
  {
    self->_colorUserInterfaceStyle = a3;
    -[PKPaletteToolPreview _updateUI](self, "_updateUI");
  }
}

- (void)setLocaleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PKPaletteToolPreview toolView](self, "toolView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tool");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handwritingTool");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocaleIdentifier:", v4);

}

- (void)showPreviewForTool:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v4 = a4;
  v6 = a3;
  -[PKPaletteToolPreview toolView](self, "toolView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tool");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PKPaletteToolPreview toolView](self, "toolView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tool");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = PKPaletteToolEqualTools(v10, v6);

  }
  else
  {
    v11 = 0;
  }

  if ((v11 & 1) == 0 && v4)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __52__PKPaletteToolPreview_showPreviewForTool_animated___block_invoke;
    v18[3] = &unk_1E7777C20;
    v18[4] = self;
    v19 = v6;
    -[PKPaletteToolPreview _animateToolViewToVisible:completion:](self, "_animateToolViewToVisible:completion:", 0, v18);
    v12 = v19;
LABEL_10:

    goto LABEL_11;
  }
  if (((v11 | v4) & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E0DC3F10];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __52__PKPaletteToolPreview_showPreviewForTool_animated___block_invoke_2;
    v16[3] = &unk_1E7777C20;
    v16[4] = self;
    v17 = v6;
    objc_msgSend(v15, "performWithoutAnimation:", v16);
    v12 = v17;
    goto LABEL_10;
  }
  -[PKPaletteToolPreview _updateToolViewInkingToolAttributesFromTool:](self, "_updateToolViewInkingToolAttributesFromTool:", v6);
  objc_msgSend(v6, "handwritingTool");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaletteToolPreview setLocaleIdentifier:](self, "setLocaleIdentifier:", v14);
LABEL_11:

}

uint64_t __52__PKPaletteToolPreview_showPreviewForTool_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_replaceCurrentToolWithTool:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateToolViewInkingToolAttributesFromTool:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_animateToolViewToVisible:completion:", 1, 0);
}

uint64_t __52__PKPaletteToolPreview_showPreviewForTool_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_replaceCurrentToolWithTool:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateToolViewInkingToolAttributesFromTool:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)flashAlternatePreviewView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  PKPaletteToolPreview *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[PKPaletteToolPreview addSubview:](self, "addSubview:", v4);
    v5 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v4, "centerXAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPreview centerXAnchor](self, "centerXAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v8;
    objc_msgSend(v4, "centerYAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolPreview centerYAnchor](self, "centerYAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activateConstraints:", v12);

    -[PKPaletteToolPreview toolView](self, "toolView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAlpha:", 0.0);

    -[PKPaletteToolPreview layoutIfNeeded](self, "layoutIfNeeded");
    v14 = (void *)MEMORY[0x1E0DC3F10];
    v15 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __50__PKPaletteToolPreview_flashAlternatePreviewView___block_invoke;
    v18[3] = &unk_1E7777C20;
    v19 = v4;
    v20 = self;
    v16[0] = v15;
    v16[1] = 3221225472;
    v16[2] = __50__PKPaletteToolPreview_flashAlternatePreviewView___block_invoke_2;
    v16[3] = &unk_1E7778650;
    v17 = v19;
    objc_msgSend(v14, "animateWithDuration:delay:options:animations:completion:", 0, v18, v16, 0.4, 2.0);

  }
}

void __50__PKPaletteToolPreview_flashAlternatePreviewView___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "toolView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

}

uint64_t __50__PKPaletteToolPreview_flashAlternatePreviewView___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)_animateToolViewToVisible:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  BOOL v11;

  v4 = a3;
  v6 = a4;
  if (-[PKPaletteToolPreview isToolViewVisible](self, "isToolViewVisible") != v4)
  {
    -[PKPaletteToolPreview layoutIfNeeded](self, "layoutIfNeeded");
    v7 = (void *)MEMORY[0x1E0DC3F10];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__PKPaletteToolPreview__animateToolViewToVisible_completion___block_invoke;
    v10[3] = &unk_1E777A028;
    v10[4] = self;
    v11 = v4;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__PKPaletteToolPreview__animateToolViewToVisible_completion___block_invoke_2;
    v8[3] = &unk_1E7778740;
    v8[4] = self;
    v9 = v6;
    objc_msgSend(v7, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v10, v8, 0.325, 0.0, 0.65, 0.0);

  }
}

uint64_t __61__PKPaletteToolPreview__animateToolViewToVisible_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setToolViewVisible:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateLayoutGuideConstraints");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __61__PKPaletteToolPreview__animateToolViewToVisible_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateLayoutGuideConstraints");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateLayoutGuideConstraints
{
  double v3;
  double Height;
  double v5;
  id v6;
  CGRect v7;

  v3 = 0.0;
  if (!-[PKPaletteToolPreview isToolViewVisible](self, "isToolViewVisible"))
  {
    -[PKPaletteToolPreview bounds](self, "bounds");
    Height = CGRectGetHeight(v7);
    -[PKPaletteToolPreview _toolViewTopSpacing](self, "_toolViewTopSpacing");
    v3 = Height - v5;
  }
  -[PKPaletteToolPreview layoutGuideTopConstraint](self, "layoutGuideTopConstraint");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v3);

}

- (void)_replaceCurrentToolWithTool:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPaletteToolPreview toolView](self, "toolView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  objc_msgSend(v4, "toolIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolVariant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKPaletteToolView toolViewWithIdentifier:variant:configuration:](PKPaletteToolView, "toolViewWithIdentifier:variant:configuration:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPreview setToolView:](self, "setToolView:", v9);

  -[PKPaletteToolPreview toolView](self, "toolView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PKPaletteToolPreview toolView](self, "toolView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSelected:", 1);

  -[PKPaletteToolPreview toolView](self, "toolView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPreview addSubview:](self, "addSubview:", v12);

  -[PKPaletteToolPreview toolView](self, "toolView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPreview layoutGuide](self, "layoutGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, 19.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPreview setToolViewTopAnchor:](self, "setToolViewTopAnchor:", v17);

  -[PKPaletteToolPreview toolView](self, "toolView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "heightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToConstant:", 103.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPreview setToolViewHeightAnchor:](self, "setToolViewHeightAnchor:", v20);

  v21 = (void *)MEMORY[0x1E0CB3718];
  -[PKPaletteToolPreview toolViewTopAnchor](self, "toolViewTopAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPreview toolViewHeightAnchor](self, "toolViewHeightAnchor", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v23;
  -[PKPaletteToolPreview toolView](self, "toolView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolPreview layoutGuide](self, "layoutGuide");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "centerXAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v29);

  -[PKPaletteToolPreview _updateUI](self, "_updateUI");
}

- (void)_updateToolViewInkingToolAttributesFromTool:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[PKPaletteToolPreview toolView](self, "toolView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tool");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isInkingTool"))
    goto LABEL_4;
  v6 = objc_msgSend(v15, "isInkingTool");

  v7 = v15;
  if (v6)
  {
    objc_msgSend(v15, "inkingTool");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaletteToolPreview toolView](self, "toolView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tool");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inkingTool");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "color");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInkColor:", v12);

    -[PKPaletteToolPreview toolView](self, "toolView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tool");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "inkingTool");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "weight");
    objc_msgSend(v14, "setInkWeight:");

LABEL_4:
    v7 = v15;
  }

}

- (void)updateConstraints
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  -[PKPaletteToolPreview _toolViewTopSpacing](self, "_toolViewTopSpacing");
  v4 = v3;
  -[PKPaletteToolPreview toolViewTopAnchor](self, "toolViewTopAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v4);

  -[PKPaletteToolPreview scalingFactor](self, "scalingFactor");
  v7 = v6 * 103.0;
  -[PKPaletteToolPreview toolViewHeightAnchor](self, "toolViewHeightAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", v7);

  v9.receiver = self;
  v9.super_class = (Class)PKPaletteToolPreview;
  -[PKPaletteToolPreview updateConstraints](&v9, sel_updateConstraints);
}

- (double)_toolViewTopSpacing
{
  double v2;

  -[PKPaletteToolPreview scalingFactor](self, "scalingFactor");
  return v2 * 19.0;
}

- (UIColor)toolColor
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[PKPaletteToolPreview toolView](self, "toolView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tool");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInkingTool");

  if (v5)
  {
    -[PKPaletteToolPreview toolView](self, "toolView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tool");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inkingTool");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ink");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return (UIColor *)v10;
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor;

  scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_scalingFactor = a3;
    -[PKPaletteToolPreview _updateUI](self, "_updateUI");
    -[PKPaletteToolPreview setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    -[PKPaletteToolPreview _updateUI](self, "_updateUI");
  }
}

- (void)toggleColorSelectionPopover
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint8_t v9[16];

  -[PKPaletteToolPreview toolView](self, "toolView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tool");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHandwritingTool");

  if (v5)
  {
    v6 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_INFO, "Can't present color picker popover when the handwriting tool is currently selected.", v9, 2u);
    }

  }
  else
  {
    -[PKPaletteToolPreview delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isPalettePresentingPopover");

    if (v8)
      -[PKPaletteToolPreview dismissPalettePopoverWithCompletion:](self, "dismissPalettePopoverWithCompletion:", 0);
    else
      -[PKPaletteToolPreview _showColorSelectionPopover](self, "_showColorSelectionPopover");
  }
}

- (void)_showColorSelectionPopover
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint8_t v79[16];
  _QWORD v80[2];

  v80[1] = *MEMORY[0x1E0C80C00];
  -[PKPaletteToolPreview delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "palettePopoverPresentingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKPaletteToolPreview _popoverPresentingSourceView](self, "_popoverPresentingSourceView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[PKPaletteColorPickerControllerFactory makeColorPickerController](PKPaletteColorPickerControllerFactory, "makeColorPickerController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteToolPreview setColorPickerController:](self, "setColorPickerController:", v6);

      v7 = -[PKPaletteToolPreview colorUserInterfaceStyle](self, "colorUserInterfaceStyle");
      -[PKPaletteToolPreview colorPickerController](self, "colorPickerController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "colorPicker");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setColorUserInterfaceStyle:", v7);

      -[PKPaletteToolPreview toolView](self, "toolView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "configuration");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v11)
      {
        if (*(_BYTE *)(v11 + 16))
          v13 = *(_BYTE *)(v11 + 17) != 0;
        else
          v13 = 1;
      }
      else
      {
        v13 = 0;
      }
      -[PKPaletteToolPreview colorPickerController](self, "colorPickerController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "colorPicker");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setSupportsAlpha:", v13);

      -[PKPaletteToolPreview toolColor](self, "toolColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteToolPreview colorPickerController](self, "colorPickerController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "colorPicker");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setSelectedColor:", v17);

      -[PKPaletteToolPreview colorPickerController](self, "colorPickerController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setDelegate:", self);

      -[PKPaletteToolPreview colorPickerController](self, "colorPickerController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "viewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setModalPresentationStyle:", 7);

      -[PKPaletteToolPreview colorPickerController](self, "colorPickerController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "viewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "popoverPresentationController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setDelegate:", self);

      -[PKPaletteToolPreview delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "palettePopoverPermittedArrowDirections");
      -[PKPaletteToolPreview colorPickerController](self, "colorPickerController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "viewController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "popoverPresentationController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setPermittedArrowDirections:", v27);

      -[PKPaletteToolPreview colorPickerController](self, "colorPickerController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "viewController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "popoverPresentationController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "_setShouldDisableInteractionDuringTransitions:", 0);

      -[PKPaletteToolPreview _popoverPresentingSourceRect](self, "_popoverPresentingSourceRect");
      v35 = v34;
      v37 = v36;
      v39 = v38;
      v41 = v40;
      -[PKPaletteToolPreview colorPickerController](self, "colorPickerController");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "viewController");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "popoverPresentationController");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setSourceRect:", v35, v37, v39, v41);

      -[PKPaletteToolPreview colorPickerController](self, "colorPickerController");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "viewController");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "popoverPresentationController");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setSourceView:", v5);

      objc_msgSend(v4, "view");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v80[0] = v48;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteToolPreview colorPickerController](self, "colorPickerController");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "viewController");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "popoverPresentationController");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setPassthroughViews:", v49);

      -[PKPaletteToolPreview colorPickerController](self, "colorPickerController");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "viewController");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "popoverPresentationController");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "_setIgnoresKeyboardNotifications:", 1);

      -[PKPaletteToolPreview delegate](self, "delegate");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "palettePopoverLayoutMargins");
      v58 = v57;
      v60 = v59;
      v62 = v61;
      v64 = v63;
      -[PKPaletteToolPreview colorPickerController](self, "colorPickerController");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "viewController");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "popoverPresentationController");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setPopoverLayoutMargins:", v58, v60, v62, v64);

      -[PKPaletteToolPreview colorPickerController](self, "colorPickerController");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "viewController");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteToolPreview traitCollection](self, "traitCollection");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setOverrideUserInterfaceStyle:", objc_msgSend(v70, "userInterfaceStyle"));

      -[PKPaletteToolPreview colorPickerController](self, "colorPickerController");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "viewController");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "parentViewController");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteToolPreview traitCollection](self, "traitCollection");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteToolPreview colorPickerController](self, "colorPickerController");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "viewController");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "setOverrideTraitCollection:forChildViewController:", v74, v76);

      -[PKPaletteToolPreview colorPickerController](self, "colorPickerController");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "viewController");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "presentViewController:animated:completion:", v78, 1, 0);

      +[PKStatisticsManager sharedStatisticsManager]();
      v14 = objc_claimAutoreleasedReturnValue();
      -[PKStatisticsManager recordColorPanelInvoked:]((uint64_t)v14, CFSTR("open"));
    }
    else
    {
      v14 = os_log_create("com.apple.pencilkit", "PKPalette");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v79 = 0;
        _os_log_fault_impl(&dword_1BE213000, v14, OS_LOG_TYPE_FAULT, "sourceView shouldn't be nil when presenting a popover", v79, 2u);
      }
    }

  }
}

- (CGRect)_popoverPresentingSourceRect
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  -[PKPaletteToolPreview bounds](self, "bounds");
  v22 = CGRectInset(v21, -5.0, -5.0);
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  -[PKPaletteToolPreview delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_5:

    goto LABEL_6;
  }
  -[PKPaletteToolPreview delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[PKPaletteToolPreview delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "wantsCustomPalettePopoverPresentationSource"))
    {
      -[PKPaletteToolPreview delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteToolPreview colorPickerController](self, "colorPickerController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "viewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "palettePopoverSourceRectToPresentViewController:", v12);
      x = v13;
      y = v14;
      width = v15;
      height = v16;

    }
    goto LABEL_5;
  }
LABEL_6:
  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)_popoverPresentingSourceView
{
  PKPaletteToolPreview *v2;
  PKPaletteToolPreview *v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  void *v8;

  v2 = self;
  -[PKPaletteToolPreview delegate](v2, "delegate");
  v3 = (PKPaletteToolPreview *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_6:

    return v2;
  }
  -[PKPaletteToolPreview delegate](v2, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[PKPaletteToolPreview delegate](v2, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "wantsCustomPalettePopoverPresentationSource");

    if (v7)
    {
      -[PKPaletteToolPreview delegate](v2, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "palettePopoverSourceView");
      v3 = (PKPaletteToolPreview *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        v3 = v3;

        v2 = v3;
      }
      goto LABEL_6;
    }
  }
  return v2;
}

- (void)colorPickerControllerDidChangeSelectedColor:(id)a3 isContinuousColorSelection:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a4;
  objc_msgSend(a3, "colorPicker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedColor");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPaletteToolPreview toolView](self, "toolView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tool");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isInkingTool");

  if (v9)
  {
    -[PKPaletteToolPreview toolView](self, "toolView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tool");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inkingTool");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInkColor:", v14);

  }
  -[PKPaletteToolPreview delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "toolPreviewDidChangeToolColor:isContinuousColorSelection:", self, v4);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a3;
  -[PKPaletteToolPreview colorPickerController](self, "colorPickerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PKPaletteToolPreview colorPickerController](self, "colorPickerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v8);

  }
  else if (v8)
  {
    v8[2]();
  }

}

- (unint64_t)edgeLocation
{
  return self->_edgeLocation;
}

- (unint64_t)cornerLocation
{
  return self->_cornerLocation;
}

- (void)setCornerLocation:(unint64_t)a3
{
  self->_cornerLocation = a3;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (PKPalettePopoverPresenting)delegate
{
  return (PKPalettePopoverPresenting *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)colorUserInterfaceStyle
{
  return self->_colorUserInterfaceStyle;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (PKPaletteToolView)toolView
{
  return self->_toolView;
}

- (void)setToolView:(id)a3
{
  objc_storeStrong((id *)&self->_toolView, a3);
}

- (PKPaletteColorPickerController)colorPickerController
{
  return self->_colorPickerController;
}

- (void)setColorPickerController:(id)a3
{
  objc_storeStrong((id *)&self->_colorPickerController, a3);
}

- (NSLayoutConstraint)toolViewTopAnchor
{
  return self->_toolViewTopAnchor;
}

- (void)setToolViewTopAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_toolViewTopAnchor, a3);
}

- (NSLayoutConstraint)toolViewHeightAnchor
{
  return self->_toolViewHeightAnchor;
}

- (void)setToolViewHeightAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_toolViewHeightAnchor, a3);
}

- (UILayoutGuide)layoutGuide
{
  return self->_layoutGuide;
}

- (void)setLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_layoutGuide, a3);
}

- (NSLayoutConstraint)layoutGuideTopConstraint
{
  return self->_layoutGuideTopConstraint;
}

- (void)setLayoutGuideTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_layoutGuideTopConstraint, a3);
}

- (NSLayoutConstraint)layoutGuideWidthConstraint
{
  return self->_layoutGuideWidthConstraint;
}

- (void)setLayoutGuideWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_layoutGuideWidthConstraint, a3);
}

- (NSLayoutConstraint)layoutGuideHeightConstraint
{
  return self->_layoutGuideHeightConstraint;
}

- (void)setLayoutGuideHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_layoutGuideHeightConstraint, a3);
}

- (NSLayoutConstraint)layoutGuideCenterXConstraint
{
  return self->_layoutGuideCenterXConstraint;
}

- (void)setLayoutGuideCenterXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_layoutGuideCenterXConstraint, a3);
}

- (BOOL)isToolViewVisible
{
  return self->_toolViewVisible;
}

- (void)setToolViewVisible:(BOOL)a3
{
  self->_toolViewVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutGuideCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_layoutGuideHeightConstraint, 0);
  objc_storeStrong((id *)&self->_layoutGuideWidthConstraint, 0);
  objc_storeStrong((id *)&self->_layoutGuideTopConstraint, 0);
  objc_storeStrong((id *)&self->_layoutGuide, 0);
  objc_storeStrong((id *)&self->_toolViewHeightAnchor, 0);
  objc_storeStrong((id *)&self->_toolViewTopAnchor, 0);
  objc_storeStrong((id *)&self->_colorPickerController, 0);
  objc_storeStrong((id *)&self->_toolView, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
