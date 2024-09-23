@implementation CCUISliderButtonModuleViewController

- (CCUIBaseSliderView)sliderView
{
  -[CCUISliderButtonModuleViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return self->_sliderView;
}

- (void)viewDidLoad
{
  CCUIBaseSliderView *v3;
  CCUIBaseSliderView *sliderView;
  CCUIBaseSliderView *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CCUISliderButtonModuleViewController;
  -[CCUIButtonModuleViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[CCUISliderButtonModuleViewController createSliderView](self, "createSliderView");
  v3 = (CCUIBaseSliderView *)objc_claimAutoreleasedReturnValue();
  -[CCUIBaseSliderView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
  -[CCUIBaseSliderView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  -[CCUIBaseSliderView setGlyphVisible:](v3, "setGlyphVisible:", 0);
  sliderView = self->_sliderView;
  self->_sliderView = v3;
  v5 = v3;

  -[CCUISliderButtonModuleViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController buttonView](self, "buttonView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertSubview:belowSubview:", v5, v7);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CCUISliderButtonModuleViewController;
  v7 = a4;
  -[CCUISliderButtonModuleViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__CCUISliderButtonModuleViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E8E20848;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

void __91__CCUISliderButtonModuleViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUISliderButtonModuleViewController;
  -[CCUIButtonModuleViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[CCUIButtonModuleViewController buttonView](self, "buttonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUISliderButtonModuleViewController sliderView](self, "sliderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CCUIButtonModuleViewController isExpanded](self, "isExpanded"))
  {
    objc_msgSend(v3, "setAlpha:", 0.0);
    objc_msgSend(v4, "setValueVisible:", 1);
    -[CCUISliderButtonModuleViewController preferredExpandedContinuousCornerRadius](self, "preferredExpandedContinuousCornerRadius");
    objc_msgSend(v4, "setContinuousSliderCornerRadius:");
  }
  else
  {
    objc_msgSend(v3, "setAlpha:", 1.0);
    objc_msgSend(v4, "setValueVisible:", 0);
  }

}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CCUISliderButtonModuleViewController;
  -[CCUIButtonModuleViewController willTransitionToExpandedContentMode:](&v6, sel_willTransitionToExpandedContentMode_);
  -[CCUISliderButtonModuleViewController sliderView](self, "sliderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

}

- (void)_applyCompactContinuousCornerRadius
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUISliderButtonModuleViewController;
  -[CCUIButtonModuleViewController _applyCompactContinuousCornerRadius](&v4, sel__applyCompactContinuousCornerRadius);
  -[CCUISliderButtonModuleViewController sliderView](self, "sliderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController compactContinuousCornerRadius](self, "compactContinuousCornerRadius");
  objc_msgSend(v3, "setContinuousSliderCornerRadius:");

}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (id)viewForTouchContinuation
{
  return self->_sliderView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliderView, 0);
}

- (id)createSliderView
{
  CCUIBaseSliderView *v3;
  void *v4;
  CCUIBaseSliderView *v5;

  objc_opt_class();
  NSRequestConcreteImplementation();
  v3 = [CCUIBaseSliderView alloc];
  -[CCUISliderButtonModuleViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[CCUIBaseSliderView initWithFrame:](v3, "initWithFrame:");

  return v5;
}

@end
