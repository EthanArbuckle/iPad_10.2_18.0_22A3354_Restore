@implementation _UIColorPickerContainerViewController

- (_UIColorPickerContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  _UIColorPickerContainerViewController *v4;
  _UIColorPickerContainerViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIColorPickerContainerViewController;
  v4 = -[_UIColorPickerContainerViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    -[_UIColorPickerContainerViewController _commonInit](v4, "_commonInit");
  return v5;
}

- (_UIColorPickerContainerViewController)initWithCoder:(id)a3
{
  _UIColorPickerContainerViewController *v3;
  _UIColorPickerContainerViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIColorPickerContainerViewController;
  v3 = -[_UIColorPickerContainerViewController initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[_UIColorPickerContainerViewController _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIMenuSystem mainSystem](UIMenuSystem, "mainSystem"));
  objc_msgSend(v3, "_setInitialBuildingResponder:", self);

}

- (void)_setSelectedColor:(id)a3 colorSpace:(id)a4
{
  -[_UIColorPickerViewProviding _setSelectedColor:colorSpace:](self->_contentViewController, "_setSelectedColor:colorSpace:", a3, a4);
}

- (void)_setConfiguration:(id)a3
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_configuration, a3);
  -[_UIColorPickerContainerViewController _updateContentViewConfiguration](self, "_updateContentViewConfiguration");
  if ((objc_msgSend(v6, "_isInPopoverPresentation") & 1) != 0)
    v5 = 1;
  else
    v5 = (uint64_t)objc_msgSend(v6, "_isEmbedded");
  -[UIVisualEffectView setHidden:](self->_visualEffectView, "setHidden:", v5);

}

- (void)dismissEyedropper:(BOOL)a3
{
  -[_UIColorSampler dismissEyedropper](self->_colorSampler, "dismissEyedropper", a3);
}

- (void)_pickerDidFinish
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[_UIColorPickerContainerViewController _delegate](self, "_delegate"));
  objc_msgSend(v2, "_pickerDidFinish");

}

- (void)_pickerDidSelectColor:(id)a3 isVolatile:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  CGColorSpace *ColorSpace;
  id v9;

  v4 = a4;
  v6 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[_UIColorPickerContainerViewController _delegate](self, "_delegate"));
  v7 = objc_retainAutorelease(v6);
  ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v7, "CGColor"));
  objc_msgSend(v9, "_pickerDidSelectColor:colorSpace:isVolatile:", v7, CGColorSpaceGetName(ColorSpace), v4);

}

- (void)_pickerDidShowEyedropperWithSelectionBlock:(id)a3 dismissBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id eyeDropperDismissBlock;
  id v12;
  id eyeDropperSelectionBlock;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_UIColorPickerContainerViewController view](self, "view"));
  objc_msgSend(v8, "setUserInteractionEnabled:", 0);

  -[_UIColorPickerContainerViewController invokeEyedropper](self, "invokeEyedropper");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_UIColorPickerContainerViewController _delegate](self, "_delegate"));
  objc_msgSend(v9, "_pickerDidShowEyedropper");

  v10 = objc_retainBlock(v6);
  eyeDropperDismissBlock = self->_eyeDropperDismissBlock;
  self->_eyeDropperDismissBlock = v10;

  v12 = objc_retainBlock(v7);
  eyeDropperSelectionBlock = self->_eyeDropperSelectionBlock;
  self->_eyeDropperSelectionBlock = v12;

}

- (void)_pickerDidFloatEyeDropper
{
  -[_UIColorPickerContainerViewController floatEyedropper](self, "floatEyedropper");
}

- (void)buildMenuWithBuilder:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "system"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuSystem mainSystem](UIMenuSystem, "mainSystem"));

  if (v3 == v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_10005C988, 0, UIMenuRoot, 0, &__NSArray0__struct));
    objc_msgSend(v6, "replaceMenuForIdentifier:withMenu:", UIMenuRoot, v5);

  }
}

- (void)loadView
{
  id v3;
  id v4;
  void *v5;
  UIVisualEffectView *v6;
  UIVisualEffectView *visualEffectView;
  void *v8;
  UIScrollView *v9;
  UIScrollView *scrollView;
  UIScrollView *v11;
  UIView *v12;
  void *v13;
  UIView *touchExtensionView;
  id v15;
  void *v16;
  _UIColorPickerViewProviding *contentViewController;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  UIView *v41;
  _QWORD v42[4];

  v3 = objc_alloc_init((Class)UIView);
  -[_UIColorPickerContainerViewController setView:](self, "setView:", v3);

  v4 = objc_alloc((Class)UIVisualEffectView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 9));
  v6 = (UIVisualEffectView *)objc_msgSend(v4, "initWithEffect:", v5);
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v6;

  -[UIVisualEffectView setAutoresizingMask:](self->_visualEffectView, "setAutoresizingMask:", 18);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_UIColorPickerContainerViewController view](self, "view"));
  objc_msgSend(v8, "addSubview:", self->_visualEffectView);

  v9 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
  -[UIScrollView setClipsToBounds:](v9, "setClipsToBounds:", 0);
  -[UIScrollView setShowsVerticalScrollIndicator:](v9, "setShowsVerticalScrollIndicator:", 0);
  -[UIScrollView setShowsHorizontalScrollIndicator:](v9, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView _setTouchInsets:](v9, "_setTouchInsets:", 0.0, 0.0, -1.79769313e308, 0.0);
  scrollView = self->_scrollView;
  self->_scrollView = v9;
  v11 = v9;

  v12 = (UIView *)objc_alloc_init((Class)UIView);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v12, "layer"));
  objc_msgSend(v13, "setHitTestsAsOpaque:", 1);

  -[UIScrollView addSubview:](v11, "addSubview:", v12);
  touchExtensionView = self->_touchExtensionView;
  self->_touchExtensionView = v12;
  v41 = v12;

  v15 = objc_alloc_init(NSClassFromString(CFSTR("_UIColorPickerContentViewController")));
  -[_UIColorPickerContainerViewController addChildViewController:](self, "addChildViewController:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
  -[UIScrollView addSubview:](v11, "addSubview:", v16);

  objc_msgSend(v15, "didMoveToParentViewController:", self);
  contentViewController = self->_contentViewController;
  self->_contentViewController = (_UIColorPickerViewProviding *)v15;
  v34 = v15;

  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[_UIColorPickerContainerViewController view](self, "view"));
  objc_msgSend(v18, "addSubview:", v11);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](v11, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[_UIColorPickerContainerViewController view](self, "view"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "safeAreaLayoutGuide"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v37));
  v42[0] = v36;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](v11, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[_UIColorPickerContainerViewController view](self, "view"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "safeAreaLayoutGuide"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v31));
  v42[1] = v30;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](v11, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[_UIColorPickerContainerViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "safeAreaLayoutGuide"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v20));
  v42[2] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](v11, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[_UIColorPickerContainerViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "keyboardLayoutGuide"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v25));
  v42[3] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;

  if (self->_contentViewController == a3)
  {
    objc_msgSend(a3, "preferredContentSize");
    if (v4 > 0.0)
    {
      v6 = v5;
      if (v5 > 0.0)
      {
        v7 = v4;
        UISizeRoundToViewScale(self->_scrollView);
        -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:");
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[_UIColorPickerViewProviding view](self->_contentViewController, "view"));
        objc_msgSend(v8, "setFrame:", 0.0, 0.0, v7, 10000.0);

        -[UIView setFrame:](self->_touchExtensionView, "setFrame:", 0.0, 0.0, v7, 10000.0);
        -[_UIColorPickerContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v7, v6);
      }
    }
  }
}

- (void)viewLayoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIColorPickerContainerViewController;
  -[_UIColorPickerContainerViewController viewLayoutMarginsDidChange](&v3, "viewLayoutMarginsDidChange");
  -[_UIColorPickerContainerViewController _updateContentViewConfiguration](self, "_updateContentViewConfiguration");
}

- (void)_updateContentViewConfiguration
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  id v10;

  v10 = -[_UIColorPickerViewControllerConfiguration copy](self->_configuration, "copy");
  objc_msgSend(v10, "_preferredWidth");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_UIColorPickerContainerViewController view](self, "view"));
  objc_msgSend(v5, "safeAreaInsets");
  v7 = v4 - v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_UIColorPickerContainerViewController view](self, "view"));
  objc_msgSend(v8, "safeAreaInsets");
  objc_msgSend(v10, "set_preferredWidth:", v7 - v9);

  -[_UIColorPickerViewProviding _setConfiguration:](self->_contentViewController, "_setConfiguration:", v10);
}

- (void)invokeEyedropper
{
  _UIColorSampler *colorSampler;
  _UIColorSampler *v4;
  _UIColorSampler *v5;
  _QWORD v6[5];

  colorSampler = self->_colorSampler;
  if (!colorSampler)
  {
    v4 = (_UIColorSampler *)objc_opt_new(_UIColorSampler, a2);
    v5 = self->_colorSampler;
    self->_colorSampler = v4;

    -[_UIColorSampler setFloatEyedropperOnStart:](self->_colorSampler, "setFloatEyedropperOnStart:", 0);
    colorSampler = self->_colorSampler;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003E8A4;
  v6[3] = &unk_10005C968;
  v6[4] = self;
  -[_UIColorSampler showSamplerWithSelectionHandler:](colorSampler, "showSamplerWithSelectionHandler:", v6);
}

- (void)floatEyedropper
{
  -[_UIColorSampler floatEyedropper](self->_colorSampler, "floatEyedropper");
}

- (void)eyedropperDidSelectColor:(id)a3
{
  void *v4;
  void (**eyeDropperSelectionBlock)(id, id);
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_UIColorPickerContainerViewController _delegate](self, "_delegate"));
  objc_msgSend(v4, "_pickerDidSelectColor:colorSpace:isVolatile:", v6, 0, 0);

  eyeDropperSelectionBlock = (void (**)(id, id))self->_eyeDropperSelectionBlock;
  if (eyeDropperSelectionBlock)
    eyeDropperSelectionBlock[2](eyeDropperSelectionBlock, v6);

}

- (void)eyedropperDidDismiss
{
  void *v3;
  void *v4;
  void (**eyeDropperDismissBlock)(void);
  id v6;
  id eyeDropperSelectionBlock;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_UIColorPickerContainerViewController view](self, "view"));
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_UIColorPickerContainerViewController _delegate](self, "_delegate"));
  objc_msgSend(v4, "_pickerDidDismissEyedropper");

  eyeDropperDismissBlock = (void (**)(void))self->_eyeDropperDismissBlock;
  if (eyeDropperDismissBlock)
  {
    eyeDropperDismissBlock[2]();
    v6 = self->_eyeDropperDismissBlock;
  }
  else
  {
    v6 = 0;
  }
  self->_eyeDropperDismissBlock = 0;

  eyeDropperSelectionBlock = self->_eyeDropperSelectionBlock;
  self->_eyeDropperSelectionBlock = 0;

}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_UIColorPickerViewProvidingDelegate)_delegate
{
  return (_UIColorPickerViewProvidingDelegate *)objc_loadWeakRetained((id *)&self->__delegate);
}

- (void)_setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->__delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__delegate);
  objc_storeStrong((id *)&self->_touchExtensionView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_colorSampler, 0);
  objc_storeStrong(&self->_eyeDropperSelectionBlock, 0);
  objc_storeStrong(&self->_eyeDropperDismissBlock, 0);
}

@end
