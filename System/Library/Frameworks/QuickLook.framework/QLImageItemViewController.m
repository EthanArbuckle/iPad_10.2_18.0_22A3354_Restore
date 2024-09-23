@implementation QLImageItemViewController

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  UIImageView *v10;
  UIImageView *imageView;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  id v18;

  v8 = a3;
  v9 = a5;
  v10 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
  imageView = self->_imageView;
  self->_imageView = v10;

  -[UIImageView setUserInteractionEnabled:](self->_imageView, "setUserInteractionEnabled:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setBackgroundColor:](self->_imageView, "setBackgroundColor:", v12);

  -[UIImageView setAccessibilityIdentifier:](self->_imageView, "setAccessibilityIdentifier:", CFSTR("QLImageItemViewControllerImageViewAccessibilityIdentifier"));
  -[UIImageView setPreferredImageDynamicRange:](self->_imageView, "setPreferredImageDynamicRange:", 0);
  if (self->_HDRTransitionInProgress)
    -[QLImageItemViewController animateToPreferredDynamicRange](self, "animateToPreferredDynamicRange");
  else
    -[QLImageItemViewController updatePreferredDynamicRangeForced:](self, "updatePreferredDynamicRangeForced:", 0);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  self->_imageIsAnimated = isKindOfClass & 1;
  if ((isKindOfClass & 1) != 0)
  {
    objc_storeStrong((id *)&self->_animatedImage, a3);
    v18 = v9;
    QLRunInMainThread();

  }
  else
  {
    objc_msgSend(v8, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_imageView, "setImage:", v14);

    -[UIImageView image](self->_imageView, "image");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "size");
    self->_imageSize.width = v16;
    self->_imageSize.height = v17;

    -[QLScrollableContentItemViewController setContentView:](self, "setContentView:", self->_imageView);
    -[QLImageItemViewController setPreferredContentSize:](self, "setPreferredContentSize:", self->_imageSize.width, self->_imageSize.height);
    if (v9)
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __89__QLImageItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1160) = 0x7FEFFFFFFFFFFFFFLL;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1168) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "frameAtTime:", 0.0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (_QWORD *)(*(_QWORD *)(a1 + 32) + 1176);
  objc_msgSend(v6, "size");
  *v2 = v3;
  v2[1] = v4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "setImage:", v6);
  objc_msgSend(*(id *)(a1 + 32), "setContentView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1136));
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", *(double *)(*(_QWORD *)(a1 + 32) + 1176), *(double *)(*(_QWORD *)(a1 + 32) + 1184));
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

- (void)previewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _BOOL4 v7;
  objc_super v8;

  v3 = a3;
  if (self->_imageIsAnimated)
  {
    +[QLImageAnimationTimer sharedTimer](QLImageAnimationTimer, "sharedTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAnimationTimerObserver:", self);

  }
  else if (_os_feature_enabled_impl())
  {
    -[QLItemViewController appearance](self, "appearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[QLImageAnalysisManager shouldStartImageAnalysisForPresentationMode:](QLImageAnalysisManager, "shouldStartImageAnalysisForPresentationMode:", objc_msgSend(v6, "presentationMode"));

    if (v7)
      -[QLImageItemViewController _setupAndStartImageAnalysisIfNeeded](self, "_setupAndStartImageAnalysisIfNeeded");
  }
  v8.receiver = self;
  v8.super_class = (Class)QLImageItemViewController;
  -[QLScrollableContentItemViewController previewDidAppear:](&v8, sel_previewDidAppear_, v3);
}

- (void)previewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLImageItemViewController;
  -[QLItemViewController previewWillDisappear:](&v4, sel_previewWillDisappear_, a3);
  -[QLImageAnalysisManager shouldHideInteraction:animated:](self->_imageAnalysisManager, "shouldHideInteraction:animated:", 1, 0);
}

- (void)previewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (self->_imageIsAnimated)
  {
    self->_initialTimeStamp = 1.79769313e308;
    +[QLImageAnimationTimer sharedTimer](QLImageAnimationTimer, "sharedTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAnimationTimerObserver:", self);

  }
  else
  {
    -[QLImageAnalysisManager stopImageAnalysis](self->_imageAnalysisManager, "stopImageAnalysis");
  }
  v6.receiver = self;
  v6.super_class = (Class)QLImageItemViewController;
  -[QLScrollableContentItemViewController previewDidDisappear:](&v6, sel_previewDidDisappear_, v3);
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  objc_super v22;

  v4 = a4;
  v6 = a3;
  -[QLItemViewController appearance](self, "appearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)QLImageItemViewController;
  -[QLScrollableContentItemViewController setAppearance:animated:](&v22, sel_setAppearance_animated_, v6, v4);
  if (-[QLScrollableContentItemViewController shouldLayoutContentBasedOnPeripheryInsets](self, "shouldLayoutContentBasedOnPeripheryInsets"))
  {
    objc_msgSend(v6, "peripheryInsets");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
  }
  else
  {
    v9 = *MEMORY[0x24BEBE158];
    v11 = *(double *)(MEMORY[0x24BEBE158] + 8);
    v13 = *(double *)(MEMORY[0x24BEBE158] + 16);
    v15 = *(double *)(MEMORY[0x24BEBE158] + 24);
  }
  -[QLScrollableContentItemViewController scrollView](self, "scrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setContentInset:", v9, v11, v13, v15);

  -[QLImageItemViewController updatePreferredDynamicRangeForced:](self, "updatePreferredDynamicRangeForced:", 0);
  v17 = _os_feature_enabled_impl();
  if (!self->_imageIsAnimated && v17 != 0)
  {
    v19 = objc_msgSend(v7, "presentationMode");
    -[QLItemViewController appearance](self, "appearance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "presentationMode");

    if (v19 != v21)
    {
      if (+[QLImageAnalysisManager shouldStartImageAnalysisForPresentationMode:](QLImageAnalysisManager, "shouldStartImageAnalysisForPresentationMode:", v21)&& (-[QLItemViewController didAppearOnce](self, "didAppearOnce")|| -[QLImageAnalysisManager hasAnalysis](self->_imageAnalysisManager, "hasAnalysis")))
      {
        -[QLImageItemViewController _setupAndStartImageAnalysisIfNeeded](self, "_setupAndStartImageAnalysisIfNeeded");
      }
      else
      {
        -[QLImageItemViewController _updateAnalysisButtonsContainerConstraints](self, "_updateAnalysisButtonsContainerConstraints");
      }
    }
  }

}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIImage)imageForAnalysis
{
  return -[UIImageView image](self->_imageView, "image");
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return 2;
}

- (void)animationTimerFired:(double)a3
{
  double initialTimeStamp;
  long double v5;
  long double v6;
  void *v7;
  void *v8;

  if (self->_imageIsAnimated)
  {
    initialTimeStamp = self->_initialTimeStamp;
    if (initialTimeStamp == 1.79769313e308)
    {
      initialTimeStamp = a3 - self->_currentPlaybackTime;
      self->_initialTimeStamp = initialTimeStamp;
    }
    v5 = a3 - initialTimeStamp;
    -[QLAnimatedImage duration](self->_animatedImage, "duration");
    self->_currentPlaybackTime = fmod(v5, v6);
    -[QLAnimatedImage frameAtTime:](self->_animatedImage, "frameAtTime:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      -[UIImageView setImage:](self->_imageView, "setImage:", v7);
      v7 = v8;
    }

  }
}

- (void)transitionDidStart:(BOOL)a3
{
  self->_HDRTransitionInProgress = 1;
  if (self->_imageView)
    -[QLImageItemViewController animateToPreferredDynamicRange](self, "animateToPreferredDynamicRange", a3);
}

- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLImageItemViewController;
  -[QLItemViewController transitionDidFinish:didComplete:](&v4, sel_transitionDidFinish_didComplete_, a3, a4);
}

- (id)toolbarButtonsForTraitCollection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)QLImageItemViewController;
  -[QLItemViewController toolbarButtonsForTraitCollection:](&v8, sel_toolbarButtonsForTraitCollection_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (_os_feature_enabled_impl()
    && -[QLImageAnalysisManager isInteractionActive](self->_imageAnalysisManager, "isInteractionActive")
    && -[QLImageAnalysisManager hasResultsForVisualSearch](self->_imageAnalysisManager, "hasResultsForVisualSearch"))
  {
    -[QLImageAnalysisManager imageAnalysisToolbarButton](self->_imageAnalysisManager, "imageAnalysisToolbarButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  return v5;
}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  int v8;
  BOOL v9;
  objc_super v10;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = _os_feature_enabled_impl();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("QLVisualSearchButton")))
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10.receiver = self;
    v10.super_class = (Class)QLImageItemViewController;
    -[QLItemViewController buttonPressedWithIdentifier:completionHandler:](&v10, sel_buttonPressedWithIdentifier_completionHandler_, v6, v7);
  }
  else
  {
    -[QLImageAnalysisManager infoButtonTapped](self->_imageAnalysisManager, "infoButtonTapped");
    if (v7)
      v7[2](v7);
  }

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;

  -[QLItemViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewItemViewController:wantsFullScreen:", self, 0);

}

- (id)draggableView
{
  return self->_imageView;
}

- (BOOL)draggableViewShouldStartDragSession:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  objc_super v12;

  v4 = a3;
  -[QLImageItemViewController imageAnalysisView](self, "imageAnalysisView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  if (-[QLImageAnalysisManager textExistsAtPoint:](self->_imageAnalysisManager, "textExistsAtPoint:", v7, v9)
    || -[QLImageAnalysisManager imageSubjectExistsAtPoint:](self->_imageAnalysisManager, "imageSubjectExistsAtPoint:", v7, v9))
  {
    v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)QLImageItemViewController;
    v10 = -[QLItemViewController draggableViewShouldStartDragSession:](&v12, sel_draggableViewShouldStartDragSession_, v4);
  }

  return v10;
}

- (UIView)imageAnalysisView
{
  return (UIView *)self->_imageView;
}

- (NSDictionary)clientPreviewOptions
{
  void *v2;
  void *v3;

  -[QLItemViewController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientPreviewOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)imageAnalyzerWantsUpdateInfoButtonWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[QLItemViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewItemViewControllerWantsUpdateOverlay:animated:", self, v3);

}

- (void)imageAnalysisInteractionWillPresentVisualSearchController
{
  NSNumber *v3;
  NSNumber *savedFullScreenState;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isFullScreen);
  v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  savedFullScreenState = self->_savedFullScreenState;
  self->_savedFullScreenState = v3;

  -[QLItemViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewItemViewController:wantsFullScreen:", self, 1);

}

- (void)imageAnalysisInteractionDidDismissVisualSearchController
{
  NSNumber *savedFullScreenState;
  uint64_t v4;
  NSNumber *v5;
  void *v6;
  QLImageItemViewController *v7;
  uint64_t v8;
  id v9;

  savedFullScreenState = self->_savedFullScreenState;
  if (savedFullScreenState)
  {
    v4 = -[NSNumber BOOLValue](savedFullScreenState, "BOOLValue");
    v5 = self->_savedFullScreenState;
    self->_savedFullScreenState = 0;

    -[QLItemViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    v7 = self;
    v8 = v4;
  }
  else
  {
    -[QLItemViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    v7 = self;
    v8 = 0;
  }
  objc_msgSend(v6, "previewItemViewController:wantsFullScreen:", v7, v8);

}

- (void)_setupAndStartImageAnalysisIfNeeded
{
  QLImageAnalysisManager *imageAnalysisManager;
  _BOOL4 v4;
  QLImageAnalysisManager *v5;
  QLImageAnalysisManager *v6;
  QLImageAnalysisManager *v7;
  void *v8;
  QLImageAnalysisManager *v9;
  QLImageAnalysisManager *v10;

  imageAnalysisManager = self->_imageAnalysisManager;
  if (!imageAnalysisManager)
  {
LABEL_8:
    v7 = [QLImageAnalysisManager alloc];
    -[QLImageItemViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[QLImageAnalysisManager initWithDelegate:presentingView:](v7, "initWithDelegate:presentingView:", self, v8);
    v10 = self->_imageAnalysisManager;
    self->_imageAnalysisManager = v9;

    goto LABEL_9;
  }
  v4 = -[QLImageAnalysisManager hasAnalysis](imageAnalysisManager, "hasAnalysis");
  v5 = self->_imageAnalysisManager;
  if (!v4)
  {
    if (v5)
    {
      if (-[QLImageAnalysisManager isAnalysisOngoing](v5, "isAnalysisOngoing"))
        return;
      v6 = self->_imageAnalysisManager;
      if (v6)
        -[QLImageAnalysisManager stopImageAnalysis](v6, "stopImageAnalysis");
    }
    goto LABEL_8;
  }
  -[QLImageAnalysisManager addInteractionIfNeeded](v5, "addInteractionIfNeeded");
  -[QLImageAnalysisManager setupAnalysisButtonsContainer](self->_imageAnalysisManager, "setupAnalysisButtonsContainer");
LABEL_9:
  -[QLImageItemViewController _updateAnalysisButtonsContainerConstraints](self, "_updateAnalysisButtonsContainerConstraints");
}

- (void)_updateAnalysisButtonsContainerConstraints
{
  QLImageAnalysisManager *imageAnalysisManager;
  UIImageView *v4;
  id v5;

  imageAnalysisManager = self->_imageAnalysisManager;
  v4 = self->_imageView;
  -[QLImageItemViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[QLImageAnalysisManager updateBottomRightContainerPositionForImageView:view:](imageAnalysisManager, "updateBottomRightContainerPositionForImageView:view:", v4, v5);

}

- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)QLImageItemViewController;
  -[QLItemViewController previewBecameFullScreen:animated:](&v7, sel_previewBecameFullScreen_animated_);
  self->_isFullScreen = v5;
  -[QLImageAnalysisManager updateForFullScreen:animated:](self->_imageAnalysisManager, "updateForFullScreen:animated:", v5, v4);
  -[QLImageItemViewController _updateAnalysisButtonsContainerConstraints](self, "_updateAnalysisButtonsContainerConstraints");
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)QLImageItemViewController;
  -[QLImageItemViewController viewDidLoad](&v8, sel_viewDidLoad);
  objc_initWeak(&location, self);
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__QLImageItemViewController_viewDidLoad__block_invoke;
  v5[3] = &unk_24C724AD8;
  objc_copyWeak(&v6, &location);
  v4 = (id)-[QLImageItemViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __40__QLImageItemViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateAnalysisButtonsContainerConstraints");

}

- (void)adjustImageInteractionForScrollEvent:(id)a3
{
  -[QLImageAnalysisManager adjustImageInteractionForScrollView:](self->_imageAnalysisManager, "adjustImageInteractionForScrollView:", a3);
  -[QLImageItemViewController _updateAnalysisButtonsContainerConstraints](self, "_updateAnalysisButtonsContainerConstraints");
}

- (BOOL)shouldDetectMachineReadableCode
{
  void *v2;
  char v3;

  -[QLItemViewController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldPreventMachineReadableCodeDetection") ^ 1;

  return v3;
}

- (BOOL)canPerformFirstTimeAppearanceActions:(unint64_t)a3
{
  char v3;
  unsigned __int8 v4;
  BOOL v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)QLImageItemViewController;
  v4 = -[QLItemViewController canPerformFirstTimeAppearanceActions:](&v7, sel_canPerformFirstTimeAppearanceActions_);
  v5 = (v3 & 0x28) != 0;
  if ((v4 & 1) != 0)
    v5 = 1;
  return (v3 & 0x10) != 0 || v5;
}

- (void)performFirstTimeAppearanceActions:(unint64_t)a3
{
  if ((a3 & 8) != 0)
  {
    -[QLImageAnalysisManager setShouldHighlightTextAndDDAfterNextAnalysis:](self->_imageAnalysisManager, "setShouldHighlightTextAndDDAfterNextAnalysis:", 1);
  }
  else if ((a3 & 0x10) != 0)
  {
    -[QLImageAnalysisManager setShouldEnterVisualSearchAfterNextAnalysis:](self->_imageAnalysisManager, "setShouldEnterVisualSearchAfterNextAnalysis:", 1);
  }
  else if ((a3 & 0x20) != 0)
  {
    -[QLImageAnalysisManager setShouldUpliftSubjectAfterNextAnalysis:](self->_imageAnalysisManager, "setShouldUpliftSubjectAfterNextAnalysis:", 1);
  }
}

- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unsigned int v14;
  objc_super v16;

  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)QLImageItemViewController;
  v7 = a3;
  v8 = -[QLItemViewController shouldAcceptTouch:ofGestureRecognizer:](&v16, sel_shouldAcceptTouch_ofGestureRecognizer_, v7, v6);
  -[QLImageItemViewController imageAnalysisView](self, "imageAnalysisView", v16.receiver, v16.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", v9);
  v11 = v10;
  v13 = v12;

  LODWORD(v9) = objc_msgSend(v7, "_isPointerTouch");
  if ((_DWORD)v9)
  {
    if (-[QLImageAnalysisManager isTextSelectionEnabled](self->_imageAnalysisManager, "isTextSelectionEnabled"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 &= !-[QLImageAnalysisManager textExistsAtPoint:](self->_imageAnalysisManager, "textExistsAtPoint:", v11, v13);
    }
  }
  if (-[QLImageAnalysisManager visualSearchExistsAtPoint:](self->_imageAnalysisManager, "visualSearchExistsAtPoint:", v11, v13))
  {
    objc_opt_class();
    v8 &= ~objc_opt_isKindOfClass();
  }
  v14 = v8 & ~-[QLImageAnalysisManager hasActiveTextSelection](self->_imageAnalysisManager, "hasActiveTextSelection");

  return v14;
}

- (void)updatePreferredDynamicRangeForced:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  if (_os_feature_enabled_impl())
  {
    if (!self->_HDRTransitionInProgress || v3)
    {
      -[QLItemViewController appearance](self, "appearance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "presentationMode");

      if (v7 == 2)
        v8 = 2;
      else
        v8 = 1;
      -[UIImageView setPreferredImageDynamicRange:](self->_imageView, "setPreferredImageDynamicRange:", v8);
    }
  }
}

- (void)animateToPreferredDynamicRange
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __59__QLImageItemViewController_animateToPreferredDynamicRange__block_invoke;
  v3[3] = &unk_24C724B00;
  v3[4] = self;
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __59__QLImageItemViewController_animateToPreferredDynamicRange__block_invoke_2;
  v2[3] = &unk_24C724B28;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v3, v2, 2.0);
}

uint64_t __59__QLImageItemViewController_animateToPreferredDynamicRange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "setPreferredImageDynamicRange:", 2);
}

uint64_t __59__QLImageItemViewController_animateToPreferredDynamicRange__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1194) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "updatePreferredDynamicRangeForced:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisButtonContainerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_analysisButtonContainerRightConstraint, 0);
  objc_storeStrong((id *)&self->_analysisButtonContainer, 0);
  objc_storeStrong((id *)&self->_savedFullScreenState, 0);
  objc_storeStrong((id *)&self->_imageAnalysisManager, 0);
  objc_storeStrong((id *)&self->_animatedImage, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
