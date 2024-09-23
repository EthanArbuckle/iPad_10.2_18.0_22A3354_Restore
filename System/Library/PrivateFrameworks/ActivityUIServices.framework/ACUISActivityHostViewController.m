@implementation ACUISActivityHostViewController

- (ACUISActivityHostViewController)initWithActivityHostViewController:(id)a3
{
  id v5;
  ACUISActivityHostViewController *v6;
  ACUISActivityHostViewController *v7;
  ACUISActivitySceneDescriptor *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  ACUISActivitySceneDescriptor *activitySceneDescriptor;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ACUISActivityHostViewController;
  v6 = -[ACUISActivityHostViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activityHostViewController, a3);
    -[ActivityHostViewController setDelegate:](v7->_activityHostViewController, "setDelegate:", v7);
    v8 = [ACUISActivitySceneDescriptor alloc];
    objc_msgSend(v5, "activitySceneDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "acActivityDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ACUISActivitySceneDescriptor initWithActivitySceneDescriptor:acActivityDescriptor:](v8, "initWithActivitySceneDescriptor:acActivityDescriptor:", v9, v10);
    activitySceneDescriptor = v7->_activitySceneDescriptor;
    v7->_activitySceneDescriptor = (ACUISActivitySceneDescriptor *)v11;

    if (v5)
      -[ACUISActivitySceneDescriptor setUseFallbackMetrics:](v7->_activitySceneDescriptor, "setUseFallbackMetrics:", 1);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[ACUISActivityHostViewController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ACUISActivityHostViewController;
  -[ACUISActivityHostViewController dealloc](&v3, sel_dealloc);
}

- (NSString)activityIdentifier
{
  void *v2;
  void *v3;

  -[ACUISActivitySceneDescriptor activityDescriptor](self->_activitySceneDescriptor, "activityDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setShouldShareTouchesWithHost:(BOOL)a3
{
  -[ActivityHostViewController setShouldShareTouchesWithHost:](self->_activityHostViewController, "setShouldShareTouchesWithHost:", a3);
}

- (id)cancelTouchesForCurrentEventInHostedContent
{
  return -[ActivityHostViewController cancelTouchesForCurrentEventInHostedContent](self->_activityHostViewController, "cancelTouchesForCurrentEventInHostedContent");
}

- (UIColor)backgroundTintColor
{
  return -[ActivityHostViewController backgroundTintColor](self->_activityHostViewController, "backgroundTintColor");
}

- (UIColor)textColor
{
  return -[ActivityHostViewController textColor](self->_activityHostViewController, "textColor");
}

- (NSArray)hostIgnoredTouchedRects
{
  return -[ActivityHostViewController activityTouchRestrictedRects](self->_activityHostViewController, "activityTouchRestrictedRects");
}

- (BOOL)idleTimerDisabled
{
  return -[ActivityHostViewController idleTimerDisabled](self->_activityHostViewController, "idleTimerDisabled");
}

- (NSArray)audioCategoriesDisablingVolumeHUD
{
  return -[ActivityHostViewController audioCategoriesDisablingVolumeHUD](self->_activityHostViewController, "audioCategoriesDisablingVolumeHUD");
}

- (void)setVisibility:(unint64_t)a3
{
  if (self->_visibility != a3)
    self->_visibility = a3;
}

- (unint64_t)presentationMode
{
  unsigned int v2;

  v2 = -[ActivityHostViewController presentationMode](self->_activityHostViewController, "presentationMode");
  if (v2 == 2)
    return 2;
  else
    return v2 == 1;
}

- (void)setPresentationMode:(unint64_t)a3
{
  -[ActivityHostViewController setPresentationMode:](self->_activityHostViewController, "setPresentationMode:", -[ACUISActivityHostViewController swiftPresentationMode:](self, "swiftPresentationMode:", a3));
}

- (void)invalidate
{
  _TtC18ActivityUIServices26ActivityHostViewController *activityHostViewController;
  _TtC18ActivityUIServices26ActivityHostViewController *v4;

  activityHostViewController = self->_activityHostViewController;
  if (activityHostViewController)
  {
    -[ActivityHostViewController invalidate](activityHostViewController, "invalidate");
    -[ACUISActivityHostViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", self->_activityHostViewController);
    v4 = self->_activityHostViewController;
    self->_activityHostViewController = 0;

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3
{
  -[ActivityHostViewController preferredContentSize](self->_activityHostViewController, "preferredContentSize", a3);
  -[ACUISActivityHostViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewDidLoad
{
  objc_super v3;

  -[ACUISActivityHostViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_activityHostViewController);
  -[ActivityHostViewController preferredContentSize](self->_activityHostViewController, "preferredContentSize");
  -[ACUISActivityHostViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  v3.receiver = self;
  v3.super_class = (Class)ACUISActivityHostViewController;
  -[ACUISActivityHostViewController viewDidLoad](&v3, sel_viewDidLoad);
}

- (void)ensureContent:(double)a3 queue:(id)a4 completion:(id)a5
{
  -[ActivityHostViewController ensureContentWithTimeout:queue:completion:](self->_activityHostViewController, "ensureContentWithTimeout:queue:completion:", a4, a5, a3);
}

- (BLSHBacklightSceneHostEnvironment)backlightHostEnvironment
{
  return -[ActivityHostViewController backlightHostEnvironment](self->_activityHostViewController, "backlightHostEnvironment");
}

- (ACUISActivityHostViewController)activityHostViewControllerWithViewController:(id)a3 requestsLaunchWithAction:(id)a4
{
  id WeakRetained;
  ACUISActivityHostViewController *result;
  id v7;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "activityHostViewController:requestsLaunchWithAction:", self, v7);

  return result;
}

- (void)activityHostViewControllerBackgroundTintColorDidChangeWithViewController:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "activityHostViewControllerBackgroundTintColorDidChange:", self);

}

- (void)activityHostViewControllerTextColorDidChangeWithViewController:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "activityHostViewControllerTextColorDidChange:", self);

}

- (void)activityHostViewControllerHostShouldCancelTouchesWithViewController:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "activityHostViewControllerHostShouldCancelTouches:", self);

}

- (void)activityHostViewControllerSignificantUserInteractionBeganWithViewController:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "activityHostViewControllerSignificantUserInteractionBegan:", self);

}

- (void)activityHostViewControllerSignificantUserInteractionEndedWithViewController:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "activityHostViewControllerSignificantUserInteractionEnded:", self);

}

- (ACUISActivityHostViewController)activityHostViewControllerWithViewController:(id)a3 didSetIdleTimerDisabled:(BOOL)a4
{
  _BOOL8 v4;
  ACUISActivityHostViewController *result;
  id WeakRetained;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "activityHostViewController:didSetIdleTimerDisabled:", self, v4);

  return result;
}

- (void)activityHostViewControllerAudioCategoriesDisablingVolumeHUDDidChangeWithViewController:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "activityHostViewControllerAudioCategoriesDisablingVolumeHUDDidChange:", self);

}

- (unsigned)swiftPresentationMode:(unint64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (ACUISActivitySceneDescriptor)activitySceneDescriptor
{
  return self->_activitySceneDescriptor;
}

- (ACUISActivityHostViewControllerDelegate)delegate
{
  return (ACUISActivityHostViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)visibility
{
  return self->_visibility;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activitySceneDescriptor, 0);
  objc_storeStrong((id *)&self->_activityHostViewController, 0);
}

@end
