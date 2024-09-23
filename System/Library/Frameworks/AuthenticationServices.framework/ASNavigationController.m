@implementation ASNavigationController

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  UIVisualEffectView *v8;
  UIVisualEffectView *backdropView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ASNavigationController;
  -[ASNavigationController viewDidLoad](&v15, sel_viewDidLoad);
  -[ASNavigationController _setBuiltinTransitionStyle:](self, "_setBuiltinTransitionStyle:", 1);
  v3 = objc_alloc_init(MEMORY[0x24BEBD640]);
  -[ASNavigationController navigationBar](self, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundImage:forBarMetrics:", v3, 0);

  -[ASNavigationController navigationBar](self, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslucent:", 1);

  v6 = objc_alloc(MEMORY[0x24BEBDB38]);
  +[ASViewServiceInterfaceUtilities paneBackgroundBlurEffect](ASViewServiceInterfaceUtilities, "paneBackgroundBlurEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (UIVisualEffectView *)objc_msgSend(v6, "initWithEffect:", v7);
  backdropView = self->_backdropView;
  self->_backdropView = v8;

  -[ASNavigationController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  -[UIVisualEffectView setFrame:](self->_backdropView, "setFrame:");

  -[ASNavigationController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertSubview:atIndex:", self->_backdropView, 0);

  if ((objc_msgSend(MEMORY[0x24BE0B290], "isPad") & 1) == 0)
  {
    -[UIVisualEffectView _setContinuousCornerRadius:](self->_backdropView, "_setContinuousCornerRadius:", 10.0);
    -[UIVisualEffectView layer](self->_backdropView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMaskedCorners:", 3);

    -[UIVisualEffectView setClipsToBounds:](self->_backdropView, "setClipsToBounds:", 1);
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASNavigationController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v13);

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  double v4;
  double v5;
  id v6;
  objc_super v7;

  v4 = *MEMORY[0x24BDBF148];
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v6 = a3;
  -[ASNavigationController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v5);
  v7.receiver = self;
  v7.super_class = (Class)ASNavigationController;
  -[ASNavigationController preferredContentSizeDidChangeForChildContentContainer:](&v7, sel_preferredContentSizeDidChangeForChildContentContainer_, v6);

}

- (CGSize)_adjustedContentSizeForPopover:(CGSize)a3
{
  double height;
  CGFloat width;
  double v5;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  +[ASViewServiceInterfaceUtilities navigationBarHeight](ASViewServiceInterfaceUtilities, "navigationBarHeight");
  v6 = height + v5;
  v7 = width;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
