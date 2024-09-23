@implementation SUUIStorePagePinnedBackdropDecorationView

- (SUUIStorePagePinnedBackdropDecorationView)initWithFrame:(CGRect)a3
{
  SUUIStorePagePinnedBackdropDecorationView *v3;
  uint64_t v4;
  _UIBackdropView *backdropView;
  _UIBackdropView *v6;
  uint64_t v7;
  _UIBackdropViewSettings *backdropStyleDefaultSettings;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUUIStorePagePinnedBackdropDecorationView;
  v3 = -[SUUIStorePagePinnedBackdropDecorationView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB78]), "initWithPrivateStyle:", 2010);
    backdropView = v3->_backdropView;
    v3->_backdropView = (_UIBackdropView *)v4;

    -[_UIBackdropView setAutoresizingMask:](v3->_backdropView, "setAutoresizingMask:", 18);
    v6 = v3->_backdropView;
    -[SUUIStorePagePinnedBackdropDecorationView bounds](v3, "bounds");
    -[_UIBackdropView setFrame:](v6, "setFrame:");
    -[SUUIStorePagePinnedBackdropDecorationView addSubview:](v3, "addSubview:", v3->_backdropView);
    objc_msgSend(MEMORY[0x24BEBDB80], "settingsForStyle:", -[_UIBackdropView style](v3->_backdropView, "style"));
    v7 = objc_claimAutoreleasedReturnValue();
    backdropStyleDefaultSettings = v3->_backdropStyleDefaultSettings;
    v3->_backdropStyleDefaultSettings = (_UIBackdropViewSettings *)v7;

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStorePagePinnedBackdropDecorationView setBackgroundColor:](v3, "setBackgroundColor:", v9);

  }
  return v3;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  double v5;
  double v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _UIBackdropViewSettings *v12;
  _UIBackdropViewSettings *backdropStyleDefaultSettings;
  void *v14;
  UIView *backgroundView;
  id v16;
  UIView *v17;
  UIView *v18;
  __CFString *v19;
  double v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  BOOL v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  objc_super v46;

  v4 = a3;
  objc_msgSend(v4, "transitionProgress");
  v6 = v5;
  v7 = objc_msgSend(v4, "hidesBackdropView");
  if (v6 <= 0.00000011920929)
    v8 = 1;
  else
    v8 = v7;
  -[_UIBackdropView inputSettings](self->_backdropView, "inputSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "backdropStyle");
  if ((v8 & 1) == 0)
  {
    v11 = v10;
    if (-[_UIBackdropView style](self->_backdropView, "style") != v10)
    {
      -[_UIBackdropView transitionToPrivateStyle:](self->_backdropView, "transitionToPrivateStyle:", v11);
      objc_msgSend(MEMORY[0x24BEBDB80], "settingsForStyle:", -[_UIBackdropView style](self->_backdropView, "style"));
      v12 = (_UIBackdropViewSettings *)objc_claimAutoreleasedReturnValue();
      backdropStyleDefaultSettings = self->_backdropStyleDefaultSettings;
      self->_backdropStyleDefaultSettings = v12;

    }
  }
  if ((_DWORD)v8 != -[_UIBackdropView isHidden](self->_backdropView, "isHidden"))
  {
    -[_UIBackdropView setHidden:](self->_backdropView, "setHidden:", v8);
    if (!(_DWORD)v8 || (objc_msgSend(v4, "backdropColor"), (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    backgroundView = self->_backgroundView;
    if (!backgroundView)
    {
      v16 = objc_alloc(MEMORY[0x24BEBDB00]);
      -[SUUIStorePagePinnedBackdropDecorationView bounds](self, "bounds");
      v17 = (UIView *)objc_msgSend(v16, "initWithFrame:");
      v18 = self->_backgroundView;
      self->_backgroundView = v17;

      -[UIView setAutoresizingMask:](self->_backgroundView, "setAutoresizingMask:", 18);
      -[SUUIStorePagePinnedBackdropDecorationView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundView, 0);
      backgroundView = self->_backgroundView;
    }
    -[UIView setHidden:](backgroundView, "setHidden:", v8 ^ 1);
    -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v14);

  }
  -[UIView setAlpha:](self->_backgroundView, "setAlpha:", v6);
  -[_UIBackdropView groupName](self->_backdropView, "groupName");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v20 = 1.0 - v6;
  if (1.0 - v6 <= 0.00000011920929)
  {
    objc_msgSend(v4, "backdropGroupName", v20);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    v24 = CFSTR("_SUUIStorePagePinnedBackdropGroupName");
    if (v22)
      v24 = (__CFString *)v22;
    v21 = v24;

  }
  else
  {
    v21 = 0;
  }
  if (v19 != v21 && (-[__CFString isEqualToString:](v19, "isEqualToString:", v21, v20) & 1) == 0)
    -[_UIBackdropView setGroupName:](self->_backdropView, "setGroupName:", v21);
  -[_UIBackdropViewSettings blurRadius](self->_backdropStyleDefaultSettings, "blurRadius");
  v26 = v25;
  v27 = v6 * v25;
  objc_msgSend(v9, "blurRadius");
  v29 = vabdd_f64(v27, v28);
  if (v29 >= 1.0 || (vabdd_f64(v26, v27) <= 1.0 ? (v30 = v29 <= 0.00000011920929) : (v30 = 1), !v30))
    objc_msgSend(v9, "setBlurRadius:", v27);
  -[_UIBackdropViewSettings saturationDeltaFactor](self->_backdropStyleDefaultSettings, "saturationDeltaFactor");
  v32 = v6 * v31;
  objc_msgSend(v9, "saturationDeltaFactor");
  if (vabdd_f64(v32, v33) > 0.00000011920929)
    objc_msgSend(v9, "setSaturationDeltaFactor:", v32);
  -[_UIBackdropViewSettings darkeningTintAlpha](self->_backdropStyleDefaultSettings, "darkeningTintAlpha");
  v35 = v6 * v34;
  objc_msgSend(v9, "darkeningTintAlpha");
  if (vabdd_f64(v35, v36) > 0.00000011920929)
    objc_msgSend(v9, "setDarkeningTintAlpha:", v35);
  -[_UIBackdropViewSettings grayscaleTintAlpha](self->_backdropStyleDefaultSettings, "grayscaleTintAlpha");
  v38 = v6 * v37;
  objc_msgSend(v9, "grayscaleTintAlpha");
  if (vabdd_f64(v38, v39) > 0.00000011920929)
    objc_msgSend(v9, "setGrayscaleTintAlpha:", v38);
  -[_UIBackdropViewSettings colorBurnTintAlpha](self->_backdropStyleDefaultSettings, "colorBurnTintAlpha");
  v41 = v6 * v40;
  objc_msgSend(v9, "colorBurnTintAlpha");
  if (vabdd_f64(v41, v42) > 0.00000011920929)
    objc_msgSend(v9, "setColorBurnTintAlpha:", v41);
  -[_UIBackdropViewSettings colorTintAlpha](self->_backdropStyleDefaultSettings, "colorTintAlpha");
  v44 = v6 * v43;
  objc_msgSend(v9, "colorTintAlpha");
  if (vabdd_f64(v44, v45) > 0.00000011920929)
    objc_msgSend(v9, "setColorTintAlpha:", v44);
  v46.receiver = self;
  v46.super_class = (Class)SUUIStorePagePinnedBackdropDecorationView;
  -[SUUIStorePagePinnedBackdropDecorationView applyLayoutAttributes:](&v46, sel_applyLayoutAttributes_, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropStyleDefaultSettings, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
