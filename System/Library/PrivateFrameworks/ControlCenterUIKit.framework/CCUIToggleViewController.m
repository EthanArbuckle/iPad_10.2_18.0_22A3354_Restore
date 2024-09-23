@implementation CCUIToggleViewController

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  CCUIToggleModule **p_module;
  id v6;
  id WeakRetained;

  p_module = &self->_module;
  v6 = objc_loadWeakRetained((id *)&self->_module);
  objc_msgSend(v6, "setSelected:", objc_msgSend(v6, "isSelected") ^ 1);

  WeakRetained = objc_loadWeakRetained((id *)p_module);
  -[CCUIButtonModuleViewController setSelected:](self, "setSelected:", objc_msgSend(WeakRetained, "isSelected"));

}

- (void)refreshStateAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  _QWORD aBlock[5];

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__CCUIToggleViewController_refreshStateAnimated___block_invoke;
  aBlock[3] = &unk_1E8E20590;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  if (v3)
  {
    -[CCUIToggleViewController viewIfLoaded](self, "viewIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCUIContentModuleContext performWithoutAnimationWhileHiddenInWindow:actions:](CCUIContentModuleContext, "performWithoutAnimationWhileHiddenInWindow:actions:", v7, v5);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v5);
  }

}

void __49__CCUIToggleViewController_refreshStateAnimated___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id *v4;
  void *v5;
  id v6;

  v2 = *(id **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v2 + 127);
  objc_msgSend(v2, "setSelected:", objc_msgSend(WeakRetained, "isSelected"));

  v4 = *(id **)(a1 + 32);
  v6 = objc_loadWeakRetained(v4 + 127);
  objc_msgSend(v6, "glyphState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGlyphState:", v5);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUIToggleViewController;
  -[CCUIButtonModuleViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[CCUIToggleViewController reconfigureView](self, "reconfigureView");
  -[CCUIToggleViewController refreshStateAnimated:](self, "refreshStateAnimated:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIToggleViewController;
  -[CCUIToggleViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CCUIToggleViewController refreshStateAnimated:](self, "refreshStateAnimated:", 0);
}

- (BOOL)_canShowWhileLocked
{
  uint64_t v2;

  v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

- (void)reconfigureView
{
  CCUIToggleModule **p_module;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  p_module = &self->_module;
  WeakRetained = objc_loadWeakRetained((id *)&self->_module);
  objc_msgSend(WeakRetained, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController setTitle:](self, "setTitle:", v5);

  v6 = objc_loadWeakRetained((id *)p_module);
  objc_msgSend(v6, "valueText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController setValueText:](self, "setValueText:", v7);

  v8 = objc_loadWeakRetained((id *)p_module);
  objc_msgSend(v8, "selectedValueText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController setSelectedValueText:](self, "setSelectedValueText:", v9);

  v10 = objc_loadWeakRetained((id *)p_module);
  objc_msgSend(v10, "iconGlyph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController setGlyphImage:](self, "setGlyphImage:", v11);

  v12 = objc_loadWeakRetained((id *)p_module);
  objc_msgSend(v12, "selectedIconGlyph");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController setSelectedGlyphImage:](self, "setSelectedGlyphImage:", v13);

  v14 = objc_loadWeakRetained((id *)p_module);
  objc_msgSend(v14, "selectedColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController setSelectedGlyphColor:](self, "setSelectedGlyphColor:", v15);

  v16 = objc_loadWeakRetained((id *)p_module);
  objc_msgSend(v16, "glyphPackageDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController setGlyphPackageDescription:](self, "setGlyphPackageDescription:", v17);

  v18 = objc_loadWeakRetained((id *)p_module);
  objc_msgSend(v18, "glyphScale");
  -[CCUIButtonModuleViewController setGlyphScale:](self, "setGlyphScale:");

}

- (double)preferredExpandedContentHeight
{
  return 0.0;
}

- (BOOL)shouldFinishTransitionToExpandedContentModule
{
  return 0;
}

- (void)setContentRenderingMode:(unint64_t)a3
{
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIToggleViewController;
  if (-[CCUIButtonModuleViewController contentRenderingMode](&v6, sel_contentRenderingMode) != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CCUIToggleViewController;
    -[CCUIButtonModuleViewController setContentRenderingMode:](&v5, sel_setContentRenderingMode_, a3);
    -[CCUIToggleViewController refreshStateAnimated:](self, "refreshStateAnimated:", 0);
  }
}

- (CCUIToggleModule)module
{
  return (CCUIToggleModule *)objc_loadWeakRetained((id *)&self->_module);
}

- (void)setModule:(id)a3
{
  objc_storeWeak((id *)&self->_module, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_module);
}

@end
